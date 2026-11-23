import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('ro'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'Здоровье'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get navHome;

  /// No description provided for @navPlan.
  ///
  /// In ru, this message translates to:
  /// **'План'**
  String get navPlan;

  /// No description provided for @navLabs.
  ///
  /// In ru, this message translates to:
  /// **'Анализы'**
  String get navLabs;

  /// No description provided for @navMeds.
  ///
  /// In ru, this message translates to:
  /// **'Лекарства'**
  String get navMeds;

  /// No description provided for @navProfile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get navProfile;

  /// No description provided for @screenOnboarding.
  ///
  /// In ru, this message translates to:
  /// **'Приветствие'**
  String get screenOnboarding;

  /// No description provided for @screenLogin.
  ///
  /// In ru, this message translates to:
  /// **'Вход'**
  String get screenLogin;

  /// No description provided for @screenHome.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get screenHome;

  /// No description provided for @screenPlan.
  ///
  /// In ru, this message translates to:
  /// **'План осмотров'**
  String get screenPlan;

  /// No description provided for @screenVisits.
  ///
  /// In ru, this message translates to:
  /// **'Журнал визитов'**
  String get screenVisits;

  /// No description provided for @screenNewVisit.
  ///
  /// In ru, this message translates to:
  /// **'Новый визит'**
  String get screenNewVisit;

  /// No description provided for @screenLabs.
  ///
  /// In ru, this message translates to:
  /// **'Анализы'**
  String get screenLabs;

  /// No description provided for @screenIndicator.
  ///
  /// In ru, this message translates to:
  /// **'Динамика показателя'**
  String get screenIndicator;

  /// No description provided for @screenScan.
  ///
  /// In ru, this message translates to:
  /// **'Сканирование бланка'**
  String get screenScan;

  /// No description provided for @screenReview.
  ///
  /// In ru, this message translates to:
  /// **'Проверка данных'**
  String get screenReview;

  /// No description provided for @screenMeds.
  ///
  /// In ru, this message translates to:
  /// **'Лекарства'**
  String get screenMeds;

  /// No description provided for @screenSummary.
  ///
  /// In ru, this message translates to:
  /// **'Сводка для врача'**
  String get screenSummary;

  /// No description provided for @screenProfile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль и данные'**
  String get screenProfile;

  /// No description provided for @placeholderInProgress.
  ///
  /// In ru, this message translates to:
  /// **'Экран в разработке'**
  String get placeholderInProgress;
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
      <String>['ro', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
