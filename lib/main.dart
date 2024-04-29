import 'package:custom_bottom_sheet/models/widget_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomButtomSheet(),
    );
  }
}

class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomSheets"),
      ),
      body: Column(
          children: widgetList
              .map((e) => ListTile(
                    title: Text(e.title),
                    onTap: () => Navigator.of(context).push(
                        CupertinoPageRoute(builder: (_) => e.routeWidget)),
                  ))
              .toList()),
    );
  }
}
