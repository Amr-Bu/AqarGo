import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      "title1":"Let's ",
      "title2":"Sign in",
      "title3":"discover the best and cheapest properties with us",
      "email":"Email",
      "password":"Password",
      "valdite":"Please enter some text",
      "email validate":"Please enter a valid Email (e.g., example@example.com)",
      "question":"Don't Have Account?",
      "register":"Register",
      "login":"Login",
      "title register":"Create Your",
      "title register1":"Account",
      "first name":"First Name",
      "last name":"Last Name",
      "phone":"Phone",
      "password confirm":"Password Confirm",
      "qustion1":"Have Account ?",
      "add_property":"   Add\nProperty",
      "location":"Location",
      "owner":"Owner",
      "contract type":"Contract Type",
      "price":"Price",
      "space":"Space",
      "sale":"Sale",
      "rent":"Rent",
      "per month":"per month",
      "m":"m²",
      "residentail":"Residentail",
      "agricultural":"Agricultural",
      "commercial":"Commercial",
      "industrial":"Industrial",
      "no data":"No Data",
      "states":"States",
      "offices":"Offices",
      "see more":"See More",
    "followers":"Followers",
      "unfollow":"UnFollow",
      "follow":"Follow",
      "name":"Name",
      "discreption":"Discreption",
      "contact":"Contact",

      "property images":"Property Images",
      "property title":"Property Title",
      "title":"Title",
      "property category":"Property Category",
      "property type":"Property Type",
      "next":"Next",
      "location description":"Location Description",
      "property description":"Property Description",
      "choose office":"Chosse Your Offices",
      "must choose":"you must choose the offices you want to publish your property ,you can choose  up to 3",
      "send":"Send",

      "search":"Search",
      "search by":"Search By",
      "region":"Region",
      "now":"Now",
      "you can search":"You can Search",
      "must search":"You  can search for properties by many things\n             such as (type,price,region)",
      "found":"Found",
      "my favorite":"My Favorite",

      "ceck":"Check Your Conection",
      "empty":"empty",
      "your favorite page is":"Your favorite page is",
      "profile":"Profile",
      "my follow":"My Follow",
      "my property":"My Property",
      "no property":"No Property",
      "no follows":"No Follows",
      "edit profile":"Edit Profile",
      "up load":"up load",
      "save change":"Save Change",
      "setting":"Setting",
      "language":"Language",
      "logout":"LogOut",

    },
    'ar': {
      "title1":"قم الآن",
      "title2":" بتسجيل الدخول",
      "title3":"واعثر  على أرخص  وانسب العقارات ",
      "email":"البريد الإلكتروني",
      "password":"كلمة مرور",
      "valdite":"الرجاء ملئ الحقل",
      "email validate":"الرجاء إدخال بريد إلكتروني مثل (e.g., example@example.com)",
      "question":"لا تمتلك حساب ؟",
      "register":"إنشاء حساب",
      "login":"تسجيل دخول",
      "title register":" قم بإنشاء",
      "title register1":"حسابك",
      "first name":"الاسم الأول",
      "last name":"الاسم الثاني",
      "phone":"الهاتف",
      "password confirm":"تأكيد كلمة المرور",
      "qustion1":"تمتلك حساب ؟",
      "add_property":"إضافة\n عقار",
      "location":"الموقع",
      "owner":"المالك",
      "contract type":"نوع العقد",
      "price":"السعر",
      "space":"المساحة",
      "sale":"بيع",
      "rent":"إيجار",
      "per month":"شهرياً",
      "m":"م²",
      "residentail":"سكني",
      "agricultural":"زراعي",
      "commercial":"تجاري",
      "industrial":"صناعي",
      "no data":"لا يوجد بيانات",
      "states":"المحافظات",
      "offices":"المكاتب",
      "see more":"المزيد..",
      "followers":"المتابعين",
      "unfollow":"إلغاء المتابعة",
      "follow":"متابعة",
      "name":"الاسم",
      "discreption":"وصف",
      "contact":"اتصال",
      "property images":"صور العقار",
      "property title":"ملخص عن العقار",
      "title":"عنوان",
      "property category":"تصنيف العقار",
      "property type":"نوع العقار",
      "next":"التالي",
      "location description":"وصف المكان",
      "property description":"وصف كامل للعقار",
      "choose office":"اختر المكاتب",
      "must choose":"اختر المكاتب  المناسبة لك لنشر عقارك من خلالها يمكنك  اختيار 3 مكاتب كحد اقصى",
      "send":"إرسال",

      "search":"البحث",
      "search by":"البحث من خلال ",
      "region":"المنطقة",
      "now":"الآن",
      "you can search":"يمكنك البحث",
      "must search":"يمكنك البحث من خلال  العديد من الاشياء  \n   مثل (السعر و المنطقة نوع العقار)",
      "found":"وُجد ",
      "my favorite":"المفضلة",
      "check":"تأكد من اتصالك بالإنترنت",
      "empty":"فارغة",
      "your favorite page is":"صفحة المضلة لديك",

      "profile":"الملف  الشخصي",
      "my follow":"متابعاتي",
      "my property":"عقاراتي",
      "no property":"لا يوجد عقارات",
      "no follows":"لا  يوجد متابعات",
      "edit profile":"تعديل الملف الشخصي",
      "up load":"رفع الصورة",
      "save change":"حفظ التغييرات",
      "setting":"الإعدادات",
      "language":"اللغة",
      "logout":"تسجيل الخروج",

    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
