import 'package:app/src/presentation/extensions/locations.dart';
import 'package:app/src/presentation/global_widgets/image_widget.widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:app/src/application/view_models/character.view_model.dart';
import 'package:app/src/presentation/extensions/context_actions.dart';
import 'package:app/src/presentation/providers/hero_provider.dart';
import 'package:app/src/presentation/routes/routes_names.dart';
import 'package:app/src/utils/themes.dart';

class HeroItemWidget extends StatelessWidget {
  const HeroItemWidget({super.key, required this.character});
  final CharacterViewModel character;

  void _goToHeroeDetailsView(BuildContext context, CharacterViewModel hero) {
    context.read<HeroProvider>().setSelectedCharacter(hero);
    context.navigateTo(RoutesNames.heroDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.id,
      child: SizedBox(
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageWidget(
              path:
                  '${character.thumbnail.path}.${character.thumbnail.extension}',
            ),
            Text(
              character.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: CustomAppTheme.bigText,
            ),
            MaterialButton(
              color: CustomAppTheme.actionColor,
              child: Text(
                'aboutHero'.translate(context),
                style: CustomAppTheme.lowerText,
              ),
              onPressed: () => _goToHeroeDetailsView(context, character),
            )
          ],
        ),
      ),
    );
  }
}
