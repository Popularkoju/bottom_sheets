//model for the list of widget in home screen for its title and navigation page

import 'package:custom_bottom_sheet/bottom_sheets/expanded_bottom_sheet.dart';
import 'package:custom_bottom_sheet/bottom_sheets/expanded_bottom_sheet_animation.dart';
import 'package:custom_bottom_sheet/bottom_sheets/filter_bottom_sheet/filter_bottomsheet.dart';
import 'package:flutter/material.dart';

class WidgetList {
  final String title;
  final Widget routeWidget;
  WidgetList({required this.title, required this.routeWidget});
}

List<WidgetList> widgetList = [
  WidgetList(
      title: "Filter bottom sheet", routeWidget: const FilterBottomSheet()),
  WidgetList(
      title: "Expanded bottom sheet",
      routeWidget: const ExpandedBottomSheet(
        height: 200,
      )),
  WidgetList(
      title: "Expanded bottom sheet using animation",
      routeWidget: const ExpandedBottomSheetAnimation(
        height: 200,
      ))
];
