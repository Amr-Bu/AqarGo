import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/buttom_component.dart';
import 'package:manzel/core/component/circle_icon.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/property_details/component/atribute_component.dart';
import 'package:manzel/features/property_details/component/images_page_view_component.dart';
import 'package:manzel/features/property_details/controller/property_details_cubit.dart';
import 'package:manzel/features/property_details/full_screen_image.dart';

import '../../core/constant/app_localizations.dart';

class PropertyDetailPage extends StatelessWidget {
  final List<String> images = [
    'assets/images/test.png',
    'assets/images/test1.jpg',
    'assets/images/test2.jpg',
    'assets/images/test3.jpg',
    'assets/images/testt.png',
    'assets/images/test.png',
  ];
 final int id;
  PropertyDetailPage({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocProvider(
      create: (_) => PropertyDetailsCubit()..getPropertyDetailes(id: id),
      child: Scaffold(
        body: BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(

          builder: (context, state) {
            PropertyDetailsCubit cubit = PropertyDetailsCubit.get(context);
            if(state is GetPropertyDetailsLoading){
              return Center(child: CircularProgressIndicator(color: mainColor1,),);
            }else if(cubit.propertyDetailes!=null){
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection:isArabic ? TextDirection.rtl : TextDirection.ltr,
                    child: Column(
                      children: [
                        ImagesPageViewComponent(id: id,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10,vertical:20 ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${cubit.propertyDetailes?.title}',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: mainColor2),overflow: TextOverflow.ellipsis,maxLines: 2,),
                              SizedBox(height: screenHeight(context)*0.02,),
                              Text('${cubit.propertyDetailes?.descriptionProperty}',
                                style: Theme.of(context).textTheme.bodyMedium,),

                              SizedBox(height: screenHeight(context)*0.05,),
                              AtributeComponent(icon: Icons.location_on, title: '${localizer.translate("location")}', text: '${cubit.propertyDetailes?.region?.state?.stateName}/${cubit.propertyDetailes?.region?.regionName}',),
                              AtributeComponent(icon: Icons.location_on, title: '${localizer.translate("discreption")} ${localizer.translate("location")}', text: '${cubit.propertyDetailes?.descriptionLocation}',),

                              AtributeComponent(icon: Icons.person, title: '${localizer.translate("owner")}', text: '${cubit.propertyDetailes?.office?.officeName}',),

                              AtributeComponent(icon: Icons.add_box_outlined, title: '${localizer.translate("contract type")}', text: '${localizer.translate("${cubit.propertyDetailes?.contractType}")}',),
                              AtributeComponent(icon: Icons.monetization_on_outlined, title: '${localizer.translate("price")}', text: '${cubit.propertyDetailes?.price}\$ ${cubit.propertyDetailes?.contractType == 'rent'?'/${localizer.translate("per month")}':''} ',),
                              AtributeComponent(icon: Icons.map_outlined, title: '${localizer.translate("space")}', text: '${cubit.propertyDetailes?.space} /${localizer.translate("m")}',),
                              SizedBox(height: screenHeight(context)*0.02,),
                              Container(
                                  width: double.infinity,
                                  child: BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
                                    builder: (context, state) {
                                      PropertyDetailsCubit cubite=PropertyDetailsCubit.get(context);
                                      return ButtomComponent(text: '${localizer.translate("contact")}', onPressed: () {
                                        cubite.makePhoneCall('${cubite.propertyDetailes?.office?.phoneNumberOffice??0}');
                                      },icon: Icons.phone,);
                                    },
                                  )),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              );

            }else{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(
                  Icons.error_outline,
                  color: mainColor2,
                ),
                Text(
                  "No data",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: mainColor2),
                ),

                ],),
              );
            }

          },
        ),
      ),
    );
  }
}
