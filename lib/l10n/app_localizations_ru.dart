// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Здоровье';

  @override
  String get navHome => 'Главная';

  @override
  String get navPlan => 'План';

  @override
  String get navLabs => 'Анализы';

  @override
  String get navMeds => 'Лекарства';

  @override
  String get navProfile => 'Профиль';

  @override
  String get screenOnboarding => 'Приветствие';

  @override
  String get screenLogin => 'Вход';

  @override
  String get screenHome => 'Главная';

  @override
  String get screenPlan => 'План осмотров';

  @override
  String get screenVisits => 'Журнал визитов';

  @override
  String get screenNewVisit => 'Новый визит';

  @override
  String get screenLabs => 'Анализы';

  @override
  String get screenIndicator => 'Динамика показателя';

  @override
  String get screenScan => 'Сканирование бланка';

  @override
  String get screenReview => 'Проверка данных';

  @override
  String get screenMeds => 'Лекарства';

  @override
  String get screenSummary => 'Сводка для врача';

  @override
  String get screenProfile => 'Профиль и данные';

  @override
  String get placeholderInProgress => 'Экран в разработке';
}
