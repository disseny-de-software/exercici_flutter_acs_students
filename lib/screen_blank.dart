import 'package:flutter/material.dart';
import 'the_drawer.dart';

class ScreenBlank extends StatefulWidget {

  const ScreenBlank({super.key});

  @override
  State<ScreenBlank> createState() => _ScreenBlankState();
}

class _ScreenBlankState extends State<ScreenBlank> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TheDrawer(context).drawer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("ACS"),
      ),
    );
  }
}