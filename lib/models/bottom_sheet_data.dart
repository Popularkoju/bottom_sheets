import 'package:flutter/material.dart';

class BottomSheetDataModel {
    
  String title;
  String body;
  IconData iconData;

  BottomSheetDataModel(
      {required this.title, required this.body, required this.iconData});

}

List<BottomSheetDataModel> bottomSheetData = <BottomSheetDataModel>[

  BottomSheetDataModel(title: 'Title 1', body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book" 1', iconData: Icons.abc),
  BottomSheetDataModel(title: 'Title 2', body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book" 2', iconData: Icons.abc),
  BottomSheetDataModel(title: 'Title 3', body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book" 3', iconData: Icons.abc),
  BottomSheetDataModel(title: 'Title 4', body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book" 4', iconData: Icons.abc),
  BottomSheetDataModel(title: 'Title 5', body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book" 5', iconData: Icons.abc),
  BottomSheetDataModel(title: 'Title 6', body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book" 6', iconData: Icons.abc),
  BottomSheetDataModel(title: 'Title 7', body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book" 7', iconData: Icons.abc),
  BottomSheetDataModel(title: 'Title 8', body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book" 8', iconData: Icons.abc),
  BottomSheetDataModel(title: 'Title 9', body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book" 9', iconData: Icons.abc),

];