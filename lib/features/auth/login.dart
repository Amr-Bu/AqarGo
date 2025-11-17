import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/back_groung.dart';
import 'package:manzel/core/component/buttom_component.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/component/text_buttom.dart';
import 'package:manzel/core/component/text_from_filde_component.dart';
import 'package:manzel/core/constant/color.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/auth/components/footer.dart';
import 'package:manzel/features/auth/components/title.dart';
import 'package:manzel/features/auth/controller/auth_cubit.dart';
import 'package:manzel/features/auth/register.dart';
import 'package:manzel/features/home/home.dart';
import 'package:manzel/main_screen/main_screen.dart';

import '../../core/constant/app_localizations.dart';
import 'components/header.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localizer = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Directionality(
        textDirection:  isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          body: BackGround(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight(context) * 0.04),
                  Header(
                    textOnTap: () {
                      navigatTo(context: context, page: MainScreen());
                    },

                  ),
                  SizedBox(height: screenHeight(context) * 0.05),

                  TitleComponent(
                    title1: "${localizer.translate("title1")}",
                    title2: '${localizer.translate("title2")}',
                    disc: '${localizer.translate("title3")}',
                  ),
                  SizedBox(height: screenHeight(context) * 0.05),

                  Form(
                    key: formkey,
                    child: Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFromFildeComponent(
                                keyboardType:TextInputType.emailAddress,
                                hintText: '${localizer.translate("email")}',
                                controller: email,
                                prefixIcon: Icons.email_outlined,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '${localizer.translate("validate")}';
                                  }

                                  String pattern =
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                                  RegExp regex = RegExp(pattern);

                                  if (!regex.hasMatch(value)) {
                                    return '${localizer.translate("email validate")}';
                                  }

                                  return null;
                                },                            ),
                              SizedBox(height: screenHeight(context) * 0.015),
                              TextFromFildeComponent(
                                hintText: '${localizer.translate("password")}',
                                controller: passWord,
                                prefixIcon: Icons.lock_outline,
                                validator: (value){
                                  if (value == null || value.isEmpty) {
                                    return '${localizer.translate("validate")}';
                                  }

                                },
                              ),
                              SizedBox(height: screenHeight(context) * 0.015),
                              Footer(
                                text: "${localizer.translate("question")}",
                                textButton: '${localizer.translate("register")}',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Register(),
                                    ),
                                  );
                                },
                              ),

                              SizedBox(height: screenHeight(context) * 0.05),
                              Center(
                                child: BlocBuilder<AuthCubit, AuthState>(
                                  builder: (context, state) {
                                    var cubit = AuthCubit.get(context);
                                    if(state is LoginLoadState){
                                      return Center(child: CircularProgressIndicator(color: mainColor1,));
                                    }
                                    return Container(
                                      width: screenWidth(context) * 0.8,
                                      child: ButtomComponent(
                                        text: '${localizer.translate("login")}',
                                        onPressed: () {
                                          if (formkey.currentState!.validate()) {
                                            cubit.login(
                                              email.text,
                                              passWord.text,
                                              context,
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
