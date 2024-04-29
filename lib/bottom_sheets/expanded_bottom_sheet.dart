import 'package:custom_bottom_sheet/models/bottom_sheet_data.dart';
import 'package:flutter/material.dart';

class ExpandedBottomSheet extends StatefulWidget {
  final double height;
  const ExpandedBottomSheet({super.key, this.height = 300});

  @override
  ExpandedBottomSheetState createState() => ExpandedBottomSheetState();
}

class ExpandedBottomSheetState extends State<ExpandedBottomSheet> {
  late double _sheetPosition;
  double _maxSheetPosition = 0;
  double screenHeight = 0;
  bool isScrollable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    screenHeight = MediaQuery.of(context).size.height;
    _sheetPosition = bottomSheetHeight;

    super.didChangeDependencies();
  }

  onVerticalDragUpdate(details) {
    setState(() {
      _sheetPosition += details.primaryDelta!;
      if (_sheetPosition < 0) _sheetPosition = 0;
      if (_sheetPosition > _maxSheetPosition) {
        _maxSheetPosition = _sheetPosition;
      }
    });
  }

  onVerticalDragEnd(details) {
    setState(() {
      if (_sheetPosition > bottomSheetHeight) {
        closeBottomSheet();
      } else {
        showFullBottomSheet();
      }
    });
  }

  closeBottomSheet() {
    _sheetPosition = screenHeight;
  }

  showFullBottomSheet() {
    _sheetPosition = 0;
    isScrollable = true;
  }

  double get bottomSheetHeight {
    return screenHeight - widget.height;
  }

  bool get isBottomSheetOpen {
    return _sheetPosition <= bottomSheetHeight;
  }

  void openBottomSheet() {
    _sheetPosition = bottomSheetHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // onVerticalDragUpdate: onVerticalDragUpdate,
        // onVerticalDragEnd: onVerticalDragEnd,
        child: Stack(
          children: [
            Container(
              color: Colors.blueGrey,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    if (isBottomSheetOpen) {
                      closeBottomSheet();
                    } else {
                      openBottomSheet();
                      isScrollable = false;
                    }
                    setState(() {});
                  },
                  child: Text(
                    !isBottomSheetOpen ? "open sheet" : "close",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              top: _sheetPosition + MediaQuery.of(context).padding.top,
              left: 0,
              right: 0,
              duration: const Duration(milliseconds: 100),
              curve: Curves.ease,
              child: GestureDetector(
                onVerticalDragUpdate: onVerticalDragUpdate,
                onVerticalDragEnd: onVerticalDragEnd,
                child: Container(
                  height: screenHeight,
                  color: Colors.white,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        color: isScrollable ? Colors.teal : Colors.transparent,
                        // height: isScrollable?50:0,
                        child: isScrollable
                            ? Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          openBottomSheet();
                                          isScrollable = false;
                                        });
                                      },
                                      icon: const Icon(
                                          Icons.arrow_drop_down_sharp))
                                ],
                              )
                            : const SizedBox.shrink(),
                      ),
                      BottomSheetContains(isScrollable: isScrollable),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetContains extends StatelessWidget {
  final bool isScrollable;
  const BottomSheetContains({super.key, required this.isScrollable});

  @override
  Widget build(BuildContext context) {
    List<BottomSheetDataModel> data = bottomSheetData;
    return Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            physics:
                !isScrollable ? const NeverScrollableScrollPhysics() : null,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].title),
                subtitle: Text(data[index].body),
                leading: Icon(data[index].iconData),
              );
            }));
  }
}
