import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:app/src/presentation/extensions/locations.dart';
import 'package:app/src/presentation/global_widgets/image_widget.widget.dart';
import 'package:app/src/presentation/modules/heroes/widgets/expandable.widget.dart';
import 'package:app/src/presentation/providers/hero_provider.dart';
import 'package:app/src/utils/themes.dart';

class HeroesDetailsView extends StatefulWidget {
  const HeroesDetailsView({super.key});

  @override
  State<HeroesDetailsView> createState() => _HeroesDetailsViewState();
}

class _HeroesDetailsViewState extends State<HeroesDetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<HeroProvider>().loadRelatedData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heroProvider = context.watch<HeroProvider>();
    final character = heroProvider.selectedCharacter;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(heroProvider.selectedCharacter!.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: CustomAppTheme.minBorderRadius,
                  child: ImageWidget(
                    path:
                        '${character!.thumbnail.path}.${character.thumbnail.extension}',
                    height: 400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ExpandableDetailsWidget(
                title: 'comics'.translate(context),
                children: heroProvider.comics,
              ),
              ExpandableDetailsWidget(
                title: 'events'.translate(context),
                children: heroProvider.events,
              ),
              ExpandableDetailsWidget(
                title: 'stories'.translate(context),
                children: heroProvider.stories,
              ),
              ExpandableDetailsWidget(
                title: 'series'.translate(context),
                children: heroProvider.series,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
