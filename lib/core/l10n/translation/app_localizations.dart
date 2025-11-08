import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'translation/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Elevate Super Fitness'**
  String get appName;

  /// No description provided for @connectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout. Please try again later.'**
  String get connectionTimeout;

  /// No description provided for @sendTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timed out. Please try again.'**
  String get sendTimeout;

  /// No description provided for @receiveTimeout.
  ///
  /// In en, this message translates to:
  /// **'Server took too long to respond.'**
  String get receiveTimeout;

  /// No description provided for @badCertificate.
  ///
  /// In en, this message translates to:
  /// **'Bad certificate. Please check your device date/time.'**
  String get badCertificate;

  /// No description provided for @badResponse.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error response from server'**
  String get badResponse;

  /// No description provided for @noResponse.
  ///
  /// In en, this message translates to:
  /// **'No response received from server.'**
  String get noResponse;

  /// No description provided for @failedToParseResponse.
  ///
  /// In en, this message translates to:
  /// **'Failed to parse error response.'**
  String get failedToParseResponse;

  /// No description provided for @dioErrorCancel.
  ///
  /// In en, this message translates to:
  /// **'Request was cancelled. Please retry.'**
  String get dioErrorCancel;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your internet connection.'**
  String get connectionError;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred:'**
  String get unknownError;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @locationServicesAreDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled.'**
  String get locationServicesAreDisabled;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied.'**
  String get locationPermissionDenied;

  /// No description provided for @locationPermissionPermanentlyDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission permanently denied.'**
  String get locationPermissionPermanentlyDenied;

  /// No description provided for @emailIsRequired.
  ///
  /// In en, this message translates to:
  /// **'email is required'**
  String get emailIsRequired;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'enter valid email'**
  String get enterValidEmail;

  /// No description provided for @passwordIsRequired.
  ///
  /// In en, this message translates to:
  /// **'password is required'**
  String get passwordIsRequired;

  /// No description provided for @passwordNotMatched.
  ///
  /// In en, this message translates to:
  /// **'password Not Matched'**
  String get passwordNotMatched;

  /// No description provided for @thisFieldIsRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get thisFieldIsRequired;

  /// No description provided for @enterValidUsername.
  ///
  /// In en, this message translates to:
  /// **'Enter valid username'**
  String get enterValidUsername;

  /// No description provided for @enterNumbersOnly.
  ///
  /// In en, this message translates to:
  /// **'Enter numbers only'**
  String get enterNumbersOnly;

  /// No description provided for @enterValueMustEqual11Digit.
  ///
  /// In en, this message translates to:
  /// **'Enter value must equal 11 digit'**
  String get enterValueMustEqual11Digit;

  /// No description provided for @enterValidEgyptianPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter valid Egyptian Phone number'**
  String get enterValidEgyptianPhoneNumber;

  /// No description provided for @pleaseEnterAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter the address'**
  String get pleaseEnterAddress;

  /// No description provided for @pleaseEnterValidAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter Valid Address'**
  String get pleaseEnterValidAddress;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @onBoarding1Title.
  ///
  /// In en, this message translates to:
  /// **'The Price Of Excellence\n Is Discipline'**
  String get onBoarding1Title;

  /// No description provided for @onBoarding2Title.
  ///
  /// In en, this message translates to:
  /// **'Fitness Has Never Been So\n Much Fun'**
  String get onBoarding2Title;

  /// No description provided for @onBoarding3Title.
  ///
  /// In en, this message translates to:
  /// **'NO MORE EXCUSES\n Do It Now'**
  String get onBoarding3Title;

  /// No description provided for @onBoardingDesc.
  ///
  /// In en, this message translates to:
  /// **'Lorem Ipsum Dolor Sit Amet Consectetur. Eu Urna\n Ut Gravida Quis Id Pretium Purus. Mauris Massa '**
  String get onBoardingDesc;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @doIt.
  ///
  /// In en, this message translates to:
  /// **'Do IT'**
  String get doIt;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @smartCoach.
  ///
  /// In en, this message translates to:
  /// **'Smart Coach'**
  String get smartCoach;

  /// No description provided for @workouts.
  ///
  /// In en, this message translates to:
  /// **'Workouts'**
  String get workouts;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @heyThere.
  ///
  /// In en, this message translates to:
  /// **'Hey There'**
  String get heyThere;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'WELCOME BACK'**
  String get welcomeBack;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password ?'**
  String get forgotPassword;

  /// No description provided for @doNotHaveAccountYet.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account Yet ?'**
  String get doNotHaveAccountYet;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get createAnAccount;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already Have An Account?'**
  String get alreadyHaveAccount;

  /// No description provided for @tellUsAboutYourself.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself'**
  String get tellUsAboutYourself;

  /// No description provided for @weNeedToKnowYourGender.
  ///
  /// In en, this message translates to:
  /// **'We Need To Know Your Gender'**
  String get weNeedToKnowYourGender;

  /// No description provided for @howOldAreYou.
  ///
  /// In en, this message translates to:
  /// **'How old are you ?'**
  String get howOldAreYou;

  /// No description provided for @thisHelpsUsCreateYourPersonalizedPlan.
  ///
  /// In en, this message translates to:
  /// **'This Helps Us Create Your Personalized Plan'**
  String get thisHelpsUsCreateYourPersonalizedPlan;

  /// No description provided for @whatIsYourWeight.
  ///
  /// In en, this message translates to:
  /// **'What is your weight ?'**
  String get whatIsYourWeight;

  /// No description provided for @whatIsYourHeight.
  ///
  /// In en, this message translates to:
  /// **'What is your height ?'**
  String get whatIsYourHeight;

  /// No description provided for @whatIsYourGoal.
  ///
  /// In en, this message translates to:
  /// **'What is your goal ?'**
  String get whatIsYourGoal;

  /// No description provided for @yourRegularPhysicalActivityLevel.
  ///
  /// In en, this message translates to:
  /// **'your regular physical activity level'**
  String get yourRegularPhysicalActivityLevel;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'Kg'**
  String get kg;

  /// No description provided for @cm.
  ///
  /// In en, this message translates to:
  /// **'CM'**
  String get cm;

  /// No description provided for @rookie.
  ///
  /// In en, this message translates to:
  /// **'Rookie'**
  String get rookie;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// No description provided for @intermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get intermediate;

  /// No description provided for @advance.
  ///
  /// In en, this message translates to:
  /// **'Advance'**
  String get advance;

  /// No description provided for @trueBeast.
  ///
  /// In en, this message translates to:
  /// **'True Beast'**
  String get trueBeast;

  /// No description provided for @gainWeight.
  ///
  /// In en, this message translates to:
  /// **'Gain weight'**
  String get gainWeight;

  /// No description provided for @loseWeight.
  ///
  /// In en, this message translates to:
  /// **'Lose weight'**
  String get loseWeight;

  /// No description provided for @getFitter.
  ///
  /// In en, this message translates to:
  /// **'Get fitter'**
  String get getFitter;

  /// No description provided for @gainMoreFlexible.
  ///
  /// In en, this message translates to:
  /// **'Gain more flexible'**
  String get gainMoreFlexible;

  /// No description provided for @learnTheBasic.
  ///
  /// In en, this message translates to:
  /// **'Learn the basic'**
  String get learnTheBasic;

  /// No description provided for @accountCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get accountCreatedSuccessfully;

  /// No description provided for @loremIpsumDolorSitAmetConsecteturTempusVolutpatUtNisiMorbi.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet consectetur. Tempus volutpat ut nisi morbi. '**
  String get loremIpsumDolorSitAmetConsecteturTempusVolutpatUtNisiMorbi;

  /// No description provided for @min30.
  ///
  /// In en, this message translates to:
  /// **'30 MIN'**
  String get min30;

  /// No description provided for @cal130.
  ///
  /// In en, this message translates to:
  /// **'130 Cal'**
  String get cal130;

  /// No description provided for @numberOfExerciseGroups.
  ///
  /// In en, this message translates to:
  /// **'3 groups * 15 times'**
  String get numberOfExerciseGroups;

  /// No description provided for @loremIpsumDolorSitAmetconsecteturTempus.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit\n amet consectetur. Tempus '**
  String get loremIpsumDolorSitAmetconsecteturTempus;

  /// No description provided for @noExerciseAvailable.
  ///
  /// In en, this message translates to:
  /// **'No Exercises Available'**
  String get noExerciseAvailable;

  /// No description provided for @exercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get exercise;

  /// No description provided for @chestExercise.
  ///
  /// In en, this message translates to:
  /// **'Chest Exercise'**
  String get chestExercise;

  /// No description provided for @videoNotAvailableForThisExercise.
  ///
  /// In en, this message translates to:
  /// **'Video not available for this exercise.'**
  String get videoNotAvailableForThisExercise;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @recommendationToDay.
  ///
  /// In en, this message translates to:
  /// **'Recommendation to day'**
  String get recommendationToDay;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @upcomingWorkouts.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Workouts'**
  String get upcomingWorkouts;

  /// No description provided for @recommendationForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommendation For You'**
  String get recommendationForYou;

  /// No description provided for @popularTraining.
  ///
  /// In en, this message translates to:
  /// **'Popular Training'**
  String get popularTraining;

  /// No description provided for @letsStartYourDay.
  ///
  /// In en, this message translates to:
  /// **'Let’s start your day'**
  String get letsStartYourDay;

  /// No description provided for @hi.
  ///
  /// In en, this message translates to:
  /// **'Hi'**
  String get hi;

  /// No description provided for @gym.
  ///
  /// In en, this message translates to:
  /// **'Gym'**
  String get gym;

  /// No description provided for @fitness.
  ///
  /// In en, this message translates to:
  /// **'Fitness'**
  String get fitness;

  /// No description provided for @yoga.
  ///
  /// In en, this message translates to:
  /// **'Yoga'**
  String get yoga;

  /// No description provided for @aerobics.
  ///
  /// In en, this message translates to:
  /// **'Aerobics'**
  String get aerobics;

  /// No description provided for @trainer.
  ///
  /// In en, this message translates to:
  /// **'Trainer'**
  String get trainer;

  /// No description provided for @makeSureIts8CharactersOrMore.
  ///
  /// In en, this message translates to:
  /// **'make sure its 8 characters or more'**
  String get makeSureIts8CharactersOrMore;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create new password'**
  String get createNewPassword;

  /// No description provided for @oldPassword.
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get oldPassword;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @foodRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Food Recommendation'**
  String get foodRecommendation;

  /// No description provided for @ingredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get ingredients;

  /// No description provided for @recommendation.
  ///
  /// In en, this message translates to:
  /// **'Recommendation'**
  String get recommendation;

  /// No description provided for @showMore.
  ///
  /// In en, this message translates to:
  /// **'Show More'**
  String get showMore;

  /// No description provided for @energy.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get energy;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @carbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get carbs;

  /// No description provided for @fat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get fat;

  /// No description provided for @noMealsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No Meals Available'**
  String get noMealsAvailable;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget password'**
  String get forgetPassword;

  /// No description provided for @enterYouEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYouEmail;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'email address '**
  String get emailAddress;

  /// No description provided for @emailVerification.
  ///
  /// In en, this message translates to:
  /// **'Email verification '**
  String get emailVerification;

  /// No description provided for @pleaseenteryourcodethatsendtoyour.
  ///
  /// In en, this message translates to:
  /// **'Please enter your code that send to your'**
  String get pleaseenteryourcodethatsendtoyour;

  /// No description provided for @emailIsCorrect.
  ///
  /// In en, this message translates to:
  /// **'email is correct'**
  String get emailIsCorrect;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'success'**
  String get success;

  /// No description provided for @passwordResetSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'password Reset Successfully'**
  String get passwordResetSuccessfully;

  /// No description provided for @invalidCode.
  ///
  /// In en, this message translates to:
  /// **'invalidCode'**
  String get invalidCode;

  /// No description provided for @pleaseenteryouremailassociatedto.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email associated to'**
  String get pleaseenteryouremailassociatedto;

  /// No description provided for @yourAccount.
  ///
  /// In en, this message translates to:
  /// **'your account'**
  String get yourAccount;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'resetPassword'**
  String get resetPassword;

  /// No description provided for @passwordMustNotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Password must not be empty and must contain \n 6 characters with upper case letter and one \n number at least '**
  String get passwordMustNotEmpty;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'newPassword'**
  String get newPassword;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'enterYourPassword'**
  String get enterYourPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'confirmPassword'**
  String get confirmPassword;

  /// No description provided for @codeVerifiedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Code verified successfully'**
  String get codeVerifiedSuccessfully;

  /// No description provided for @codeIsSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Code is sent successfully'**
  String get codeIsSentSuccessfully;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend Code?'**
  String get resend;

  /// No description provided for @didnotReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'didn\'t receive verification code?'**
  String get didnotReceiveCode;

  /// No description provided for @otpCode.
  ///
  /// In en, this message translates to:
  /// **'OTP CODE'**
  String get otpCode;

  /// No description provided for @enterYourOTPCheckYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter Your OTP Check Your Email'**
  String get enterYourOTPCheckYourEmail;

  /// No description provided for @numberMustBeSixNumber.
  ///
  /// In en, this message translates to:
  /// **'Number must be 6 number'**
  String get numberMustBeSixNumber;

  /// No description provided for @sentOtp.
  ///
  /// In en, this message translates to:
  /// **'Sent OTP'**
  String get sentOtp;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
