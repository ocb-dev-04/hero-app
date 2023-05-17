import 'package:app/src/application/view_models/base/shared.view_model.dart';
import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';

class ExpandableDetailsWidget extends StatelessWidget {
  const ExpandableDetailsWidget(
      {super.key, required this.title, required this.children});

  final String title;
  final List<SharedViewModel> children;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: ExpandablePanel(
          header: ListTile(title: Text(title)),
          collapsed: const SizedBox.shrink(),
          expanded: Column(
            children: children
                .map(
                  (e) => ListTile(
                    key: Key(e.id.toString()),
                    title: Text(e.title),
                  ),
                )
                .toList(),
          ),
        ));
  }
}
