import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/component/circle_icon.dart';
import '../../core/component/section_component.dart';
import '../../core/component/text_buttom.dart';
import '../../core/component/text_from_filde_component.dart';
import '../../core/constant/color.dart';
import '../../core/constant/screen_size.dart';
import 'component/edit_contract_types_component.dart';
import 'component/edit_image_component.dart';
import 'component/edit_location_component.dart';
import 'component/edit_property_category_component.dart';
import 'component/edit_property_types_component.dart';
import 'controller/edit_property_cubit.dart';

class EditPropertyPage extends StatelessWidget {
  const EditPropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditPropertyCubit(),
      child: Scaffold(
        appBar:   AppBar(

          leading:  Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleIcon(
              icon: Icons.arrow_back_ios_new_rounded,
              iconOnTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          title: Text('Edite Property',style: Theme.of(context).textTheme.titleSmall,),
          actions: [
            TextButtonComponent(onPressed: () {  }, text: 'Save',),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<EditPropertyCubit, EditPropertyState>(
            builder: (context, state) {
              var cubit=EditPropertyCubit.get(context);
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight(context) * 0.01),
                      SectionComponent(title: "Property Image:"),
                      SizedBox(height: screenHeight(context) * 0.01),
                      EditImageComponent(),
                      SizedBox(height: screenHeight(context) * 0.05),
                      SectionComponent(title: 'Property Type:'),
                      SizedBox(height: screenHeight(context) * 0.01),
                      EditPropertyTypesComponent(),
                      SizedBox(height: screenHeight(context) * 0.05),
                      SectionComponent(title: 'Property category:'),
                      SizedBox(height: screenHeight(context) * 0.01),
                      EditPropertyCategoryComponent(),
                      SizedBox(height: screenHeight(context) * 0.05),
                      SizedBox(height: screenHeight(context) * 0.01),
                      SectionComponent(title: 'الموقع - المحافظة والمنطقة:'),
                      SizedBox(height: screenHeight(context) * 0.01),
                      EditLocationComponent(),
                      SizedBox(height: screenHeight(context) * 0.05),
                      SectionComponent(title: "location description:"),
                      SizedBox(height: screenHeight(context) * 0.01),
                      TextFromFildeComponent(
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'you must add your property location description';
                          }
                        },

                        hintText: 'location description',
                        //  suffixIcon: Icons.home,
                        maxLines: 3,
                        controller: cubit.locationDescController,
                      ),
                      SizedBox(height: screenHeight(context) * 0.05),
                      SectionComponent(title: 'Contract Type:'),
                      SizedBox(height: screenHeight(context) * 0.01),
                      EditContractTypesComponent(),
                      SizedBox(height: screenHeight(context) * 0.05),
                      SectionComponent(title: "Property price:"),
                      SizedBox(height: screenHeight(context) * 0.01),
                      BlocBuilder<EditPropertyCubit, EditPropertyState>(
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

                                  hintText: 'price',
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
                                  'per month',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: screenHeight(context) * 0.05),
                      SectionComponent(title: "Property Space:"),
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

                              hintText: 'space',
                              keyboardType: TextInputType.number,
                              controller:cubit.spaceController,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '/meter^2',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight(context) * 0.05),
                      SectionComponent(title: "Property description:"),
                      SizedBox(height: screenHeight(context) * 0.01),
                      TextFromFildeComponent(
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'you must enter the Property description';
                          }
                        },
                        hintText: 'description',
                        //  suffixIcon: Icons.home,
                        maxLines: 3,
                        controller:cubit.descController,
                      ),
                      SizedBox(height: screenHeight(context) * 0.05),
                      // SizedBox(
                      //     width: double.infinity,
                      //     child: ButtomComponent(text: "save", onPressed: (){})),

                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),);
  }
}
