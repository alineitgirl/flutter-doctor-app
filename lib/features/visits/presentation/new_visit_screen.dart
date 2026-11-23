import 'package:material_ui/material_ui.dart';

import '../../../core/widgets/placeholder_screen.dart';
import '../../../l10n/app_localizations.dart';

class NewVisitScreen extends StatelessWidget {
  const NewVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: AppLocalizations.of(context).screenNewVisit,
    );
  }
}
