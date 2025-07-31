import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_drawer.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eu Amo Séries')),
      drawer: CustomDrawer(),
      body: child,
    );
  }
}
