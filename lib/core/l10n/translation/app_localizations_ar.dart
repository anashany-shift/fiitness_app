// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'إيليفيت سوبر فيتنس';

  @override
  String get connectionTimeout => 'انتهت مهلة الاتصال. حاول مرة أخرى لاحقًا.';

  @override
  String get sendTimeout => 'انتهت مهلة الإرسال. يرجى المحاولة مجددًا.';

  @override
  String get receiveTimeout => 'الخادم استغرق وقتًا طويلاً للرد.';

  @override
  String get badCertificate =>
      'شهادة غير صالحة. يرجى التحقق من تاريخ ووقت جهازك.';

  @override
  String get badResponse => 'استجابة غير متوقعة من الخادم.';

  @override
  String get noResponse => 'لم يتم استلام أي رد من الخادم.';

  @override
  String get failedToParseResponse => 'فشل في تحليل استجابة الخطأ.';

  @override
  String get dioErrorCancel => 'تم إلغاء الطلب. حاول مرة أخرى.';

  @override
  String get connectionError => 'خطأ في الاتصال. تحقق من اتصال الإنترنت.';

  @override
  String get unknownError => 'حدث خطأ غير متوقع:';

  @override
  String get unknown => 'غير معروف';

  @override
  String get locationServicesAreDisabled => 'خدمات الموقع معطلة.';

  @override
  String get locationPermissionDenied => 'تم رفض إذن الوصول إلى الموقع.';

  @override
  String get locationPermissionPermanentlyDenied =>
      'تم رفض إذن الموقع بشكل دائم.';

  @override
  String get emailIsRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get enterValidEmail => 'أدخل بريدًا إلكترونيًا صالحًا';

  @override
  String get passwordIsRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordNotMatched => 'كلمة المرور غير متطابقة';

  @override
  String get thisFieldIsRequired => 'هذا الحقل مطلوب';

  @override
  String get enterValidUsername => 'أدخل اسم مستخدم صالح';

  @override
  String get enterNumbersOnly => 'أدخل أرقامًا فقط';

  @override
  String get enterValueMustEqual11Digit => 'يجب أن يتكون الرقم من 11 رقمًا';

  @override
  String get enterValidEgyptianPhoneNumber => 'أدخل رقم هاتف مصري صالح';

  @override
  String get pleaseEnterAddress => 'يرجى إدخال العنوان';

  @override
  String get pleaseEnterValidAddress => 'يرجى إدخال عنوان صالح';

  @override
  String get ok => 'موافق';

  @override
  String get no => 'لا';

  @override
  String get yes => 'نعم';

  @override
  String get loading => 'جارٍ التحميل...';

  @override
  String get onBoarding1Title => 'ثمن التميز هو الانضباط';

  @override
  String get onBoarding2Title => 'اللياقة لم تكن يومًا بهذه المتعة';

  @override
  String get onBoarding3Title => 'لا مزيد من الأعذار، افعلها الآن';

  @override
  String get onBoardingDesc =>
      'نص تجريبي لوريم إيبسوم لتوضيح شكل النص في التصميم النهائي للتطبيق.';

  @override
  String get skip => 'تخطي';

  @override
  String get next => 'التالي';

  @override
  String get back => 'رجوع';

  @override
  String get doIt => 'ابدأ الآن';

  @override
  String get explore => 'استكشف';

  @override
  String get smartCoach => 'المدرب الذكي';

  @override
  String get workouts => 'التمارين';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get heyThere => 'مرحبًا بك';

  @override
  String get welcomeBack => 'مرحبًا بعودتك';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get doNotHaveAccountYet => 'ليس لديك حساب بعد؟';

  @override
  String get register => 'إنشاء حساب';

  @override
  String get or => 'أو';

  @override
  String get createAnAccount => 'إنشاء حساب جديد';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get lastName => 'الاسم الأخير';

  @override
  String get alreadyHaveAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get tellUsAboutYourself => 'أخبرنا عن نفسك';

  @override
  String get weNeedToKnowYourGender => 'نحتاج إلى معرفة نوع جنسك';

  @override
  String get howOldAreYou => 'كم عمرك؟';

  @override
  String get thisHelpsUsCreateYourPersonalizedPlan =>
      'هذا يساعدنا في إنشاء خطة مخصصة لك';

  @override
  String get whatIsYourWeight => 'ما هو وزنك؟';

  @override
  String get whatIsYourHeight => 'ما هو طولك؟';

  @override
  String get whatIsYourGoal => 'ما هو هدفك؟';

  @override
  String get yourRegularPhysicalActivityLevel => 'مستوى نشاطك البدني المعتاد';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get year => 'سنة';

  @override
  String get kg => 'كجم';

  @override
  String get cm => 'سم';

  @override
  String get rookie => 'مبتدئ جدًا';

  @override
  String get beginner => 'مبتدئ';

  @override
  String get intermediate => 'متوسط';

  @override
  String get advance => 'متقدم';

  @override
  String get trueBeast => 'محترف قوي';

  @override
  String get gainWeight => 'زيادة الوزن';

  @override
  String get loseWeight => 'إنقاص الوزن';

  @override
  String get getFitter => 'تحسين اللياقة';

  @override
  String get gainMoreFlexible => 'زيادة المرونة';

  @override
  String get learnTheBasic => 'تعلم الأساسيات';

  @override
  String get accountCreatedSuccessfully => 'تم إنشاء الحساب بنجاح';

  @override
  String get loremIpsumDolorSitAmetConsecteturTempusVolutpatUtNisiMorbi =>
      'نص تجريبي يستخدم لعرض شكل النص داخل التطبيق.';

  @override
  String get min30 => '30 دقيقة';

  @override
  String get cal130 => '130 سعرة حرارية';

  @override
  String get numberOfExerciseGroups => '3 مجموعات * 15 مرة';

  @override
  String get loremIpsumDolorSitAmetconsecteturTempus =>
      'نص تجريبي يستخدم لعرض شكل النص.';

  @override
  String get noExerciseAvailable => 'لا توجد تمارين متاحة';

  @override
  String get exercise => 'تمرين';

  @override
  String get chestExercise => 'تمارين الصدر';

  @override
  String get videoNotAvailableForThisExercise =>
      'الفيديو غير متاح لهذا التمرين.';

  @override
  String get category => 'الفئة';

  @override
  String get recommendationToDay => 'توصية اليوم';

  @override
  String get seeAll => 'عرض الكل';

  @override
  String get upcomingWorkouts => 'التمارين القادمة';

  @override
  String get recommendationForYou => 'توصيات لك';

  @override
  String get popularTraining => 'التمارين الشائعة';

  @override
  String get letsStartYourDay => 'لنبدأ يومك بنشاط';

  @override
  String get hi => 'مرحبًا';

  @override
  String get gym => 'صالة رياضية';

  @override
  String get fitness => 'لياقة بدنية';

  @override
  String get yoga => 'يوغا';

  @override
  String get aerobics => 'تمارين هوائية';

  @override
  String get trainer => 'مدرب';

  @override
  String get makeSureIts8CharactersOrMore =>
      'تأكد أن كلمة المرور تتكون من 8 أحرف أو أكثر';

  @override
  String get createNewPassword => 'إنشاء كلمة مرور جديدة';

  @override
  String get oldPassword => 'كلمة المرور القديمة';

  @override
  String get done => 'تم';

  @override
  String get foodRecommendation => 'توصيات الطعام';

  @override
  String get ingredients => 'المكونات';

  @override
  String get recommendation => 'توصية';

  @override
  String get showMore => 'عرض المزيد';

  @override
  String get energy => 'الطاقة';

  @override
  String get protein => 'البروتين';

  @override
  String get carbs => 'الكربوهيدرات';

  @override
  String get fat => 'الدهون';

  @override
  String get noMealsAvailable => 'لا توجد وجبات متاحة';

  @override
  String get forgetPassword => 'نسيت كلمة المرور';

  @override
  String get enterYouEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get confirm => 'تأكيد';

  @override
  String get emailAddress => 'عنوان البريد الإلكتروني';

  @override
  String get emailVerification => 'تأكيد البريد الإلكتروني';

  @override
  String get pleaseenteryourcodethatsendtoyour =>
      'يرجى إدخال الرمز المرسل إلى بريدك الإلكتروني';

  @override
  String get emailIsCorrect => 'البريد الإلكتروني صحيح';

  @override
  String get error => 'خطأ';

  @override
  String get success => 'تم بنجاح';

  @override
  String get passwordResetSuccessfully => 'تمت إعادة تعيين كلمة المرور بنجاح';

  @override
  String get invalidCode => 'رمز غير صالح';

  @override
  String get pleaseenteryouremailassociatedto =>
      'يرجى إدخال البريد الإلكتروني المرتبط بـ';

  @override
  String get yourAccount => 'حسابك';

  @override
  String get resetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get passwordMustNotEmpty =>
      'يجب ألا تكون كلمة المرور فارغة ويجب أن تحتوي على 6 أحرف على الأقل وحرف كبير ورقم واحد.';

  @override
  String get newPassword => 'كلمة مرور جديدة';

  @override
  String get enterYourPassword => 'أدخل كلمة المرور الخاصة بك';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get codeVerifiedSuccessfully => 'تم التحقق من الرمز بنجاح';

  @override
  String get codeIsSentSuccessfully => 'تم إرسال الرمز بنجاح';

  @override
  String get resend => 'إعادة إرسال الرمز؟';

  @override
  String get didnotReceiveCode => 'لم تستلم رمز التحقق؟';

  @override
  String get otpCode => 'رمز التحقق (OTP)';

  @override
  String get enterYourOTPCheckYourEmail =>
      'أدخل رمز التحقق من بريدك الإلكتروني';

  @override
  String get numberMustBeSixNumber => 'يجب أن يتكون الرمز من 6 أرقام';

  @override
  String get sentOtp => 'تم إرسال رمز التحقق';
}
