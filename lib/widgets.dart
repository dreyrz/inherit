import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inherit_widget/inherited_data.dart';

import 'person.dart';

class WidgetD extends StatelessWidget {
  const WidgetD({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Inherit.of<int>(context);
    log("widget D");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${state.data}'),
            ElevatedButton(
              onPressed: () {
                var x = state.data;
                x = (x ?? 0) + 1;

                state.update(x);
              },
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
