import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'edit_property_state.dart';

class EditPropertyCubit extends Cubit<EditPropertyState> {
  EditPropertyCubit() : super(EditPropertyInitial());

  static EditPropertyCubit get(context) => BlocProvider.of(context);
  var BoardController=PageController();
  int currentPageIndex = 0;

  void setCurrentPage(int index) {
    currentPageIndex = index;
    emit(EditPropertyPageChanged());
  }
  final TextEditingController locationDescController = TextEditingController();

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
        emit(EditPropertyImagesUpdated());
      }
    }
  }


  void removeImage(int index) {
    images[index] = null;
    emit(EditPropertyImagesUpdated());
  }

  List<String> propertyTypes = ['residential','agricultural','commercial'];
  String propertyType = 'residential';
  List<String> residentialCategories = ['apartment','villa','house'];
  List<String> agriculturalCategories = ['land','farm','hangar'];
  List<String> commercialCategories = ['store','mall','office'];
  List<String> propertyCategories = ['apartment','villa','house'];
  String propertyCategory='apartment';
  void choosePropertyType({required String type}) {
    propertyType = type;
    if (type == 'residential') {
      propertyCategories = residentialCategories;
      propertyCategory='apartment';

    } else if (type == 'agricultural') {
      propertyCategories = agriculturalCategories;
      propertyCategory='land';

    } else if (type == 'commercial') {
      propertyCategories = commercialCategories;
      propertyCategory='store';

    }
    emit(EditPropertyPropertyTypeUpdated());
  }
  void choosePropertyCategory({required String category}) {
    propertyCategory = category;

    emit(EditPropertyPropertyTypeUpdated());
  }

  List<String> contractTypes = ['sell','rent'];
  String contractType = 'sell';
  void chooseContractType({required String type}) {
    contractType = type;
    emit(EditPropertyContractTypeUpdated());
  }
  List<String> governorates = [
    'اختر المحافظة',
    'دمشق',
    'ريف دمشق',
    'حلب',
    'حمص',
    'حماة',
    'اللاذقية',
    'طرطوس',
    'إدلب',
    'درعا',
    'السويداء',
    'القنيطرة',
    'دير الزور',
    'الحسكة',
    'الرقة',
  ];

  Map<String, List<String>> areasMap = {
    'دمشق': ['المزة', 'البرامكة', 'المالكي', 'ركن الدين'],
    'ريف دمشق': ['دوما', 'جرمانا', 'يبرود', 'النبك'],
    'حلب': ['السليمانية', 'الأنصاري', 'الحمدانية', 'صلاح الدين'],
    'حمص': ['الإنشاءات', 'بابا عمرو', 'دير بعلبة', 'كرم الزيتون'],
    'حماة': ['القصور', 'الحميدية', 'النهضة', 'الشرقية'],
    'اللاذقية': ['الرمل الجنوبي', 'الدعتور', 'مشروع الزراعة', 'الشيخ ضاهر'],
    'طرطوس': ['الكرناك', 'الحميدية', 'بانياس', 'صافيتا'],
    'إدلب': ['جسر الشغور', 'سرمين', 'معرة النعمان', 'أريحا'],
    'درعا': ['نوى', 'بصرى', 'طفس', 'الصنمين'],
    'السويداء': ['شهبا', 'صلخد', 'قنوات', 'عتيل'],
    'القنيطرة': ['خان أرنبة', 'جباتا الخشب', 'الحميدية', 'طرنجة'],
    'دير الزور': ['الميادين', 'البوكمال', 'العشارة', 'القورية'],
    'الحسكة': ['القامشلي', 'المالكية', 'رأس العين', 'تل تمر'],
    'الرقة': ['الطبقة', 'السبخة', 'الكرامة', 'معدان'],
  };
  String selectedGovernorate = 'اختر المحافظة';
  String selectedArea = '';

  void selectGovernorate(String gov) {
    if (gov == 'اختر المحافظة') {
      selectedGovernorate = 'اختر المحافظة';
      selectedArea = '';
    } else {
      selectedGovernorate = gov;
      selectedArea = areasMap[gov]!.first;
    }
    emit(EditPropertyLocationUpdated());
  }


  void selectArea(String area) {
    selectedArea = area;
    emit(EditPropertyLocationUpdated());
  }
}
