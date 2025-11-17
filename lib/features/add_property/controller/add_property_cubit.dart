import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manzel/core/component/showToast.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/core/network/remote/dioHelper.dart';
import 'package:manzel/core/network/remote/header_constance.dart';
import 'package:manzel/features/add_property/model/office_model.dart';
import 'package:manzel/features/add_property/model/region_model.dart';
import 'package:manzel/features/add_property/model/state_model.dart';
import 'package:meta/meta.dart';

part 'add_property_state.dart';

class AddPropertyCubit extends Cubit<AddPropertyState> {
  AddPropertyCubit() : super(AddPropertyInitial());

  static AddPropertyCubit get(context) => BlocProvider.of(context);
  var BoardController=PageController();
  int currentPageIndex = 0;

  void setCurrentPage(int index) {
    currentPageIndex = index;
    emit(AddPropertyPageChanged());
  }
  final TextEditingController locationDescController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController spaceController = TextEditingController();

   List<XFile?> images = List.filled(4, null);

  final ImagePicker picker = ImagePicker();
  Future<void> pickImage(int tappedIndex) async {
    if (!images.contains(null)) return;

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final int insertIndex = images.indexOf(null);
      if (insertIndex != -1) {
        images[insertIndex] = image;
        emit(AddPropertyImagesUpdated());
      }
    }
  }


  void removeImage(int index) {
    images[index] = null;
    emit(AddPropertyImagesUpdated());
  }

  List<String> propertyCategories = ['residental','commercial','industrial','agricultural'];
  //['house','villa','apartment','company','shopping_center','mall','store','restaurant','coffe','hotel','exhibition','sport_club']
  String propertyCategory = 'residental';
  List<String> residentialTypes = ['house','villa','apartment'];
  List<String> agriculturalCategories = ['land','farm','hangar'];
  List<String> commercialTypes = ['company','shopping_center','mall','store','restaurant','coffe','hotel','exhibition','sport_club'];
  List<String> propertyTypes = ['house','villa','apartment'];
String propertyType='house';
  void choosePropertyCategory({required String category}) {
    propertyCategory = category;
    if (category == 'residental') {
      propertyTypes = residentialTypes;
      propertyType='apartment';

    } else if (category == 'agricultural') {
      propertyTypes = [];
      propertyType='';

    } else if (category == 'industrial') {
      propertyTypes = [];
      propertyType='';

    } else if (category == 'commercial') {
      propertyTypes = commercialTypes;
      propertyType='company';

    }
    emit(AddPropertyPropertyTypeUpdated());
  }
  void choosePropertyType({required String type}) {
    propertyType = type;

    emit(AddPropertyPropertyTypeUpdated());
  }

  List<String> contractTypes = ['sale','rent'];
  String contractType = 'sale';
  void chooseContractType({required String type}) {
    contractType = type;
    emit(AddPropertyContractTypeUpdated());
  }

  List<StateModel>? states;
  void getState() {
    emit(GetStateLoading());
    DioHelper.getData(
      url: ApiConstance.getStateForAdd,
      token: HeaderConstance.token,
    ).then((value) {
      if (value.statusCode == 200) {
        states = (value.data as List)
            .map((e) => StateModel.fromJson(e))
            .toList();
        emit(GetStateSuccess());
      }else{
        emit(GetRegionError());
      }
    }).catchError((error) {
      emit(GetStateError());
      print("e1:${error.toString()}");
    });
  }

  Map<String,List<RegionModel>>? reagions;
  void getRegion() {
    emit(GetRegionLoading());
    DioHelper.getData(
      url: ApiConstance.getRegionForAdd,
      token: HeaderConstance.token,
    ).then((value) {
      if (value.statusCode == 200) {
        reagions = {};
        List<RegionModel> regionModels = (value.data as List)
            .map((e) => RegionModel.fromJson(e))
            .toList();

        for (var region in regionModels) {
          if (region.stateId != null) {
            reagions!.putIfAbsent("${region.stateId!}", () => []);
            reagions!["${region.stateId!}"]!.add(region);
          }
        }
       emit(GetRegionSuccess());
      }else{
        emit(GetRegionError());
      }
    }).catchError((error) {
      emit(GetRegionError());
      print("e2:${error.toString()}");
    });
  }

  String? selectedGovernorate ;
  String? selectedArea ;

  void selectGovernorate(String? gov) {
    if (gov == null) {
      selectedGovernorate = null;
      selectedArea = null;
    } else {
      selectedGovernorate = gov;
      selectedArea = "${reagions![gov!]!.first.id}";
    }
    emit(AddPropertyLocationUpdated());
  }


   void selectArea(String? area) {
    selectedArea = area;
    emit(AddPropertyLocationUpdated());
  }
  List<int> chooseOffices=[];
  List<OfficeModel>? officesmodel;
  void getAllOffice (){
    print(HeaderConstance.token);

    emit(GetOfficeLoading());
    DioHelper.getData(
      url: ApiConstance.getOfficeForAdd,
      token: HeaderConstance.token,
    ).then((value) {
      if (value.statusCode == 200) {
        officesmodel=(value.data["offices"] as List)
            .map((e) => OfficeModel.fromJson(e))
            .toList();
        emit(GetOfficeSuccess());
      }else{
        emit(GetOfficeError());
      }
    }).catchError((error) {
      emit(GetOfficeError());
      print("e3:${error.toString()}");
    });
  }
  void changeChooseOffices({required int index}){
    if (chooseOffices.contains(index)) {
      chooseOffices.remove(index);
      emit(AddPropertyChangeChooseOffices());
    }else{
    if(chooseOffices.length==3){}else {
        chooseOffices.add(index);
        emit(AddPropertyChangeChooseOffices());
    }}
  }

  void addRequestForAddProperty() async {
    emit(AddPropertyLoading());

    try {
      emit(AddPropertyLoading());
      List<MultipartFile> imageFiles = [];
      for (var img in images) {
        if (img != null) {
          imageFiles.add(await MultipartFile.fromFile(img.path, filename: img.name));
        }
      }
      List<String> office_ids = chooseOffices.map((id) => id.toString()).toList();
      print(office_ids);

      // تجهيز الـ FormData
      FormData data = FormData.fromMap({
        'region_id': selectedArea ?? '',
        'price': priceController.text,
        'title': titleController.text,
        'space': spaceController.text,
        'description_property': descController.text,
        'description_location': locationDescController.text,
        'contract_type': contractType,
        'property_category': propertyCategory,
        'property_type': propertyType,
        'office_ids[]': office_ids,
        'images[]': imageFiles,
      });
     print(data.fields);
      final response = await DioHelper.postData(
        url: ApiConstance.addProperty,
        data: data,
        token: HeaderConstance.token,
      );

      if (response.statusCode == 201) {
        emit(AddPropertySuccess());
        showToast(msg: "add success", state: ToastState.SUCCESS);
        print("✅ تمت إضافة العقار بنجاح: ${response.data}");
      } else {
        emit(AddPropertyError());
        showToast(msg: "add Error", state: ToastState.ERORR);

        print("❌ فشل الإضافة: ${response.statusCode} - ${response.statusMessage}");
      }
    } catch (e) {
      if(e is DioException){
        emit(AddPropertyError());
        showToast(msg: "add Error", state: ToastState.ERORR);
        print("❌ حدث خطأ: ${e.response?.data}");
      }
      emit(AddPropertyError());
      showToast(msg: "add Error", state: ToastState.ERORR);
      print("❌ حدث خطأ: ${e.toString()}");
    }
  }

}
