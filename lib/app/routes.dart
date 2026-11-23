/// Пути маршрутов. Номера соответствуют артбордам на холсте с макетами.
abstract final class AppRoutes {
  static const onboarding = '/onboarding'; // 01
  static const login = '/login'; // 02
  static const home = '/home'; // 03
  static const plan = '/plan'; // 04
  static const visits = '/plan/visits'; // 05
  static const newVisit = '/plan/visits/new'; // 10
  static const labs = '/labs'; // 06
  static const scan = '/labs/scan'; // 08
  static const scanReview = '/labs/scan/review'; // 09
  static String indicator(String id) => '/labs/indicator/$id'; // 07
  static const meds = '/meds'; // 11
  static const profile = '/profile'; // 13
  static const summary = '/profile/summary'; // 12
}
