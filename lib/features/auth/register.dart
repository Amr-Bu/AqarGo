import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/component/back_groung.dart';
import 'package:manzel/core/component/buttom_component.dart';
import 'package:manzel/core/component/text_from_filde_component.dart';
import 'package:manzel/core/constant/screen_size.dart';
import 'package:manzel/features/auth/components/footer.dart';
import 'package:manzel/features/auth/components/header.dart';
import 'package:manzel/features/auth/components/title.dart';
import 'package:manzel/features/auth/controller/auth_cubit.dart';
import 'package:manzel/features/auth/login.dart';

import '../../core/constant/app_localizations.dart';

class Register extends StatelessWidget {
  Register({super.key});
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
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
                  iconOnTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: screenHeight(context) * 0.05),

                TitleComponent(
                  title1: "${localizer.translate("title register")}",
                  title2: ' ${localizer.translate("title register1")}',
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
                              hintText: '${localizer.translate("first name")}',
                              controller: firstName,
                              prefixIcon: Icons.person_outlined,
                                validator: (value){
                                  if (value == null || value.isEmpty) {
                                    return '${localizer.translate("validate")}';
                                  }
                                }
                            ),
                            SizedBox(height: screenHeight(context) * 0.015),
                            TextFromFildeComponent(
                              hintText: '${localizer.translate("last name")}',
                              controller: lastName,
                              prefixIcon: Icons.person_outlined,
                                validator: (value){
                                  if (value == null || value.isEmpty) {
                                    return '${localizer.translate("validate")}';
                                  }

                                }
                            ),
                            SizedBox(height: screenHeight(context) * 0.015),
                            TextFromFildeComponent(
                              hintText: '${localizer.translate("phone")}',
                              controller: phone,
                              prefixIcon: Icons.phone_android,
                              keyboardType: TextInputType.phone,
                                validator: (value){
                                  if (value == null || value.isEmpty) {
                                    return '${localizer.translate("validate")}';
                                  }

                                }
                            ),
                            SizedBox(height: screenHeight(context) * 0.015),
                            TextFromFildeComponent(
                              hintText: '${localizer.translate("email")}',
                              controller: email,
                              prefixIcon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                // التحقق إذا كان المدخل فارغًا
                                if (value == null || value.isEmpty) {
                                  return '${localizer.translate("validate")}';
                                }

                                // التعبير المنتظم للتحقق من شكل الرابط
                                String pattern =
                                    r'[a-zA-Z0-9.-]+@gmail.com$';
                                RegExp regex = RegExp(pattern);

                                if (!regex.hasMatch(value)) {
                                  return '${localizer.translate("email validate")}';
                                }

                                return null; // يعني أن التحقق ناجح
                              },
                            ),
                            SizedBox(height: screenHeight(context) * 0.015),
                            TextFromFildeComponent(
                              hintText: '${localizer.translate("password")}',
                              controller: password,
                              prefixIcon: Icons.lock_outline,
                                validator: (value){
                                  if (value == null || value.isEmpty) {
                                    return '${localizer.translate("validate")}';
                                  }

                                }
                            ),
                            SizedBox(height: screenHeight(context) * 0.015),
                            TextFromFildeComponent(
                              hintText: '${localizer.translate("password confirm")}',
                              controller: passwordConfirm,
                              prefixIcon: Icons.lock_outline,
                                validator: (value){
                                  if (value == null || value.isEmpty) {
                                    return '${localizer.translate("validate")}';
                                  }

                                }
                            ),
                            SizedBox(height: screenHeight(context) * 0.015),
                            Footer(
                              text: "${localizer.translate("qustion1")}",
                              textButton: '${localizer.translate("login")}',
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(height: screenHeight(context) * 0.05),
                            Center(
                              child: BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                                  var cubit = AuthCubit.get(context);
                                  return SizedBox(
                                    width: screenWidth(context) * 0.8,
                                    child: ButtomComponent(
                                      text: '${localizer.translate("register")}',
                                      onPressed: () {
                                        print(passwordConfirm.text);
                                        print(password.text);
                                        cubit.register(firstName.text, lastName.text, phone.text, email.text, password.text, password.text, context);
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
