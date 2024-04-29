import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  FilterBottomSheetState createState() => FilterBottomSheetState();
}

class FilterBottomSheetState extends State<FilterBottomSheet> {
  double _sheetPosition = 0;
  double _maxSheetPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   setState(() {
  //     _sheetPosition = MediaQuery.of(context).size.height / 2;
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter Bottom Sheet",
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _sheetPosition = screenHeight - screenHeight * 0.8;
                });
              },
              icon: const Icon(Icons.file_present))
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.blueGrey,
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "see",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            top: _sheetPosition,
            left: 0,
            right: 0,
            duration: const Duration(milliseconds: 100),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _sheetPosition = 0;
                });
              },
              onVerticalDragUpdate: (details) {
                setState(() {
                  if (_sheetPosition == 0) return;
                  if (_sheetPosition > screenHeight / 2) {
                    return;
                  }

                  _sheetPosition += details.primaryDelta!;
                  if (_sheetPosition > _maxSheetPosition) {
                    _maxSheetPosition = _sheetPosition;
                  }

                  if (_sheetPosition < 0) _sheetPosition = 0;
                });
              },
              onVerticalDragEnd: (details) {
                setState(() {
                  {
                    if (_sheetPosition > screenHeight / 6) {
                      _sheetPosition = screenHeight / 2;
                    } else {
                      _sheetPosition = 0;
                    }
                  }
                });
              },
              child: Container(
                height: screenHeight,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Bottom Sheet Content",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
