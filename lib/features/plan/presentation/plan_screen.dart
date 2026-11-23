import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/routes.dart';
import '../../../core/widgets/placeholder_screen.dart';
import '../../../l10n/app_localizations.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: AppLocalizations.of(context).screenPlan,
      actions: [
        TextButton(
          onPressed: () => context.go(AppRoutes.visits),
          child: Text(AppLocalizations.of(context).screenVisits),
        ),
      ],
    );
  }
}
