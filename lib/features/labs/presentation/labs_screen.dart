import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/routes.dart';
import '../../../core/widgets/placeholder_screen.dart';
import '../../../l10n/app_localizations.dart';

class LabsScreen extends StatelessWidget {
  const LabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: AppLocalizations.of(context).screenLabs,
      actions: [
        TextButton(
          onPressed: () => context.go(AppRoutes.scan),
          child: Text(AppLocalizations.of(context).screenScan),
        ),
        TextButton(
          onPressed: () => context.go(AppRoutes.indicator('demo')),
          child: Text(AppLocalizations.of(context).screenIndicator),
        ),
      ],
    );
  }
}
