import 'package:material_ui/material_ui.dart';

import '../../../core/widgets/placeholder_screen.dart';
import '../../../l10n/app_localizations.dart';

class IndicatorScreen extends StatelessWidget {
  const IndicatorScreen({super.key, required this.indicatorId});

  final String indicatorId;

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: AppLocalizations.of(context).screenIndicator,
    );
  }
}
