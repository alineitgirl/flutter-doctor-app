import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/widgets/app_shell.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/onboarding_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/labs/presentation/indicator_screen.dart';
import '../features/labs/presentation/labs_screen.dart';
import '../features/meds/presentation/meds_screen.dart';
import '../features/plan/presentation/plan_screen.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../features/scan/presentation/review_screen.dart';
import '../features/scan/presentation/scan_screen.dart';
import '../features/summary/presentation/summary_screen.dart';
import '../features/visits/presentation/new_visit_screen.dart';
import '../features/visits/presentation/visits_screen.dart';
import 'routes.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home,
    // TODO(auth): redirect на AppRoutes.login для неавторизованных,
    // когда появится фича auth (refreshListenable на состояние сессии Supabase).
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.plan,
                builder: (context, state) => const PlanScreen(),
                routes: [
                  GoRoute(
                    path: 'visits',
                    builder: (context, state) => const VisitsScreen(),
                    routes: [
                      GoRoute(
                        path: 'new',
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (context, state) => const NewVisitScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.labs,
                builder: (context, state) => const LabsScreen(),
                routes: [
                  GoRoute(
                    path: 'indicator/:indicatorId',
                    builder: (context, state) => IndicatorScreen(
                      indicatorId: state.pathParameters['indicatorId']!,
                    ),
                  ),
                  GoRoute(
                    path: 'scan',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const ScanScreen(),
                    routes: [
                      GoRoute(
                        path: 'review',
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (context, state) => const ReviewScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.meds,
                builder: (context, state) => const MedsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    path: 'summary',
                    builder: (context, state) => const SummaryScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
