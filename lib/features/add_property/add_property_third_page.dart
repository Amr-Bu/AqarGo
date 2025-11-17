import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/buttom_component.dart';
import 'package:manzel/core/component/circle_icon.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/features/add_property/controller/add_property_cubit.dart';

import '../../core/constant/app_localizations.dart';

class AddPropertyThirdPage extends StatelessWidget {
  const AddPropertyThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    var cubit=AddPropertyCubit.get(context);
    return SingleChildScrollView(
      child: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            BlocBuilder<AddPropertyCubit, AddPropertyState>(
              builder: (context, state) {
                var cubit = AddPropertyCubit.get(context);

                return CircleIcon(
                  icon: Icons.arrow_back_ios_new,
                  iconOnTap: () {
                    cubit.BoardController.previousPage(duration: Duration(milliseconds: 750), curve:Curves.fastLinearToSlowEaseIn);
                  },
                );
              },
            ),
            SizedBox(height: screenHeight(context) * 0.01),
            BlocBuilder<AddPropertyCubit,AddPropertyState>(
                builder:(context,state){

              return Column(
                children: [
                  Row(
                    children: [
                      Text("${localizer.translate("choose office")}:",style: Theme.of(context).textTheme.titleSmall,),
                      Spacer(),
                      Text('${cubit.chooseOffices.length}/3',style: Theme.of(context).textTheme.titleSmall,),
                    ],
                  ),
                  Text('${localizer.translate("must choose")}',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),),
                  SizedBox(height: screenHeight(context)*0.01,),
                  Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children:List.generate(cubit.officesmodel!.length, (index){
                        return InkWell(
                          onTap: (){
                            cubit.changeChooseOffices(index: cubit.officesmodel![index].id!);
                          },
                          child: Container(
                            decoration:BoxDecoration(
                                border: Border.all(color:cubit.chooseOffices.contains(cubit.officesmodel![index].id)? mainColor1:cardColor),
                                borderRadius: BorderRadius.circular(10),
                                color: cardColor
                            ),
                            width:screenWidth(context)*0.3,
                            height:screenHeight(context)*0.2,
                            padding:EdgeInsets.all(3),
                            child: Column(
                              children: [
                                Container(

                                    height:screenHeight(context)*0.13,

                                    decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.network(ApiConstance.urlImage(cubit.officesmodel![index].image),fit: BoxFit.cover,)),
                                SizedBox(height: 5,),
                                Expanded(child: Text("${cubit.officesmodel![index].officeName}",style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,))
                              ],
                            ),
                          ),
                        );
                      })
                  ),
                  SizedBox(height: screenHeight(context) * 0.05),
                  BlocBuilder<AddPropertyCubit, AddPropertyState>(
                    builder: (context, state) {
                     // var cubit=AddPropertyCubit.get(context);
                      return SizedBox(
                        width: double.infinity,
                        child: ButtomComponent(
                          color:cubit.chooseOffices.isNotEmpty?mainColor1:Colors.grey ,
                          text: '${localizer.translate("send")}',
                          onPressed: () {
                            cubit.addRequestForAddProperty();
                          },
                          icon: Icons.add,
                        ),
                      );
                    },
                  ),

                ],
              );

            }),
          ],
        ),
      ),
    );
  }
}
