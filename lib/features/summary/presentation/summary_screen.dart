import 'package:material_ui/material_ui.dart';

import '../../../core/widgets/placeholder_screen.dart';
import '../../../l10n/app_localizations.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(title: AppLocalizations.of(context).screenSummary);
  }
}
