import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/routes.dart';
import '../../../core/widgets/placeholder_screen.dart';
import '../../../l10n/app_localizations.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: AppLocalizations.of(context).screenScan,
      actions: [
        TextButton(
          onPressed: () => context.go(AppRoutes.scanReview),
          child: Text(AppLocalizations.of(context).screenReview),
        ),
      ],
    );
  }
}
