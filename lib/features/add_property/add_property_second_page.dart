import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/buttom_component.dart';
import 'package:manzel/core/component/circle_icon.dart';
import 'package:manzel/core/component/text_from_filde_component.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/add_property/component/add_contract_types_component.dart';
import 'package:manzel/features/add_property/component/add_location_component.dart';
import 'package:manzel/features/add_property/controller/add_property_cubit.dart';

import '../../core/constant/app_localizations.dart';
import '../home/component/section_component.dart';

class AddPropertySecondPage extends StatelessWidget {

  AddPropertySecondPage({super.key});
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    var cubit=AddPropertyCubit.get(context);
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleIcon(
                icon: Icons.arrow_back_ios_new,
                iconOnTap: () {
                  cubit.BoardController.previousPage(duration: Duration(milliseconds: 750), curve:Curves.fastLinearToSlowEaseIn);
                },
              ),
          SizedBox(height: screenHeight(context) * 0.01),
          SectionComponent(title: 'الموقع - المحافظة والمنطقة:'),
          SizedBox(height: screenHeight(context) * 0.01),
          AddLocationComponent(),
          SizedBox(height: screenHeight(context) * 0.05),
          SectionComponent(title: "${localizer.translate("location description")}:"),
          SizedBox(height: screenHeight(context) * 0.01),
          TextFromFildeComponent(
                  validator: (value){
                    if (value == null || value.isEmpty) {
          return 'you must add your property location description';
                    }
                  },

                  hintText: '${localizer.translate("location description")}',
                  //  suffixIcon: Icons.home,
          maxLines: 3,
          controller: cubit.locationDescController,
                    ),
          SizedBox(height: screenHeight(context) * 0.05),
          SectionComponent(title: '${localizer.translate("contract type")}:'),
          SizedBox(height: screenHeight(context) * 0.01),
          AddContractTypesComponent(),
          SizedBox(height: screenHeight(context) * 0.05),
          SectionComponent(title: "${localizer.translate("price")}:"),
          SizedBox(height: screenHeight(context) * 0.01),
          BlocBuilder<AddPropertyCubit, AddPropertyState>(
            builder: (context, state) {
             // var cubit = AddPropertyCubit.get(context);
              return Row(
                children: [
                  Expanded(
                    child: TextFromFildeComponent(
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'you must enter the price';
                        }
                        if(value == '0'){
                          return 'it can not be 0';
                        }

                      },

                      hintText: '${localizer.translate("price")}',
        //  suffixIcon: Icons.monetization_on_outlined,
                      keyboardType: TextInputType.number,
                      controller:cubit.priceController,
                    ),
                  ),
                  SizedBox(width: 5),

                  Text(
                    '/\$',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(width: 5),
                  if (cubit.contractType == 'rent')
                    Text(
                      '${localizer.translate("per month")}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                ],
              );
            },
          ),
          SizedBox(height: screenHeight(context) * 0.05),
          SectionComponent(title: "${localizer.translate("space")}:"),
          SizedBox(height: screenHeight(context) * 0.01),
          Row(
            children: [
              Expanded(
                child: TextFromFildeComponent(
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'you must enter the space';
                    }
                    if(value == '0'){
                      return 'it can not be 0';
                    }
                  },

                  hintText: '${localizer.translate("${localizer.translate("space")}")}',
                  keyboardType: TextInputType.number,
                  controller:cubit.spaceController,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '/${localizer.translate("m")}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          SizedBox(height: screenHeight(context) * 0.05),
          SectionComponent(title: "${localizer.translate("property description")}:"),
          SizedBox(height: screenHeight(context) * 0.01),
          TextFromFildeComponent(
            validator: (value){
              if (value == null || value.isEmpty) {
                return 'you must enter the Property description';
              }
            },
            hintText: '${localizer.translate("discreption")}',
        //  suffixIcon: Icons.home,
            maxLines: 3,
            controller:cubit.descController,
          ),
          SizedBox(height: screenHeight(context) * 0.05),
          BlocBuilder<AddPropertyCubit, AddPropertyState>(
          builder: (context, state) {
            bool canMove = false;
            if(cubit.selectedGovernorate=='اختر المحافظة'||cubit.selectedGovernorate==null||cubit.selectedArea==''||cubit.selectedArea==null){
        canMove=false;
            }else{
        canMove=true;

            }
            return SizedBox(
            width: double.infinity,
            child: ButtomComponent(
              color: canMove?mainColor1:Colors.grey,
              text: '${localizer.translate("next")}',
              onPressed: () {
                if(canMove){
                if (formKey.currentState!.validate()) {
                  cubit.BoardController.nextPage(duration: Duration(milliseconds: 750), curve:Curves.fastLinearToSlowEaseIn);
                }}else{

                }
              },
              icon: Icons.arrow_forward_ios_rounded,
            ),
          );
          },
        ),
        ],
        ),
      ),
    );
  }
}
