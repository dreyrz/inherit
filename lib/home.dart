import 'dart:developer';

import 'package:flutter/material.dart';

import 'inherited_data.dart';
import 'person.dart';
import 'widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementAge(BuildContext c) {
    final state = Inherit.of<int>(c);
    int x = state.data ?? 0;
    x++;
    log("Value $x");
    state.update(x);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("home build");
    final state = Inherit.of<int>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              state.data.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const WidgetD(),
                  ),
                );
              },
              child: const Text("Navigate"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementAge(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
