import 'package:app/src/presentation/extensions/locations.dart';
import 'package:app/src/presentation/global_widgets/loader.widget.dart';
import 'package:app/src/presentation/modules/home/widgets/hero_item.widget.dart';
import 'package:app/src/presentation/providers/home_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<HomeProvider>().getCharacters(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('marvelHeroes'.translate(context)),
      ),
      body: LoaderView(
        error: homeProvider.error,
        loading: homeProvider.loading,
        child: GridView.builder(
          itemCount: homeProvider.charactersList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            mainAxisExtent: 300,
          ),
          itemBuilder: (BuildContext context, int index) =>
              HeroItemWidget(character: homeProvider.charactersList[index]),
        ),
      ),
    );
  }
}
