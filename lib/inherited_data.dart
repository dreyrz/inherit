import 'dart:developer';

import 'package:flutter/material.dart';

class Inherit<T> extends StatefulWidget {
  final T data;
  final Widget child;

  const Inherit({
    required this.data,
    required this.child,
    super.key,
  });

  static InheritState<J>? maybeOf<J>(BuildContext context) {
    final v = (context.dependOnInheritedWidgetOfExactType<InheritedData<J>>());
    return v?.state as InheritState<J>;
  }

  static InheritState<K> of<K>(BuildContext context) {
    final state = maybeOf<K>(context);
    assert(state != null, 'No InheritState found in context');
    return state!;
  }

  @override
  State<Inherit<T>> createState() => InheritState<T>();
}

class InheritState<I> extends State<Inherit<I>> {
  I? data;
  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  void update(I? value) {
    setState(() {
      data = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedData<I>(
      data: data,
      state: this,
      child: widget.child,
    );
  }
}

class InheritedData<M> extends InheritedWidget {
  final M? data;
  final InheritState<M> state;
  const InheritedData({
    required super.child,
    required this.data,
    required this.state,
    super.key,
  });

  // static InheritedData? maybeOf(BuildContext context) {
  //   return context.dependOnInheritedWidgetOfExactType<InheritedData>();
  // }

  // static InheritedData of(BuildContext context) {
  //   final value = maybeOf(context);
  //   assert(value != null, 'No InheritedData found in context');
  //   return value!;
  // }

  @override
  bool updateShouldNotify(InheritedData<M> oldWidget) {
    log("Should update? ${data != oldWidget.data}");

    return data != oldWidget.data;
  }
}
