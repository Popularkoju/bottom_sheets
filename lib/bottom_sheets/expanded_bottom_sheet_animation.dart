import 'package:flutter/material.dart';

class ExpandedBottomSheetAnimation extends StatefulWidget {
  final double height;
  const ExpandedBottomSheetAnimation({Key? key, this.height = 300})
      : super(key: key);

  @override
  ExpandedBottomSheetAnimationState createState() =>
      ExpandedBottomSheetAnimationState();
}

class ExpandedBottomSheetAnimationState
    extends State<ExpandedBottomSheetAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late bool _isBottomSheetOpen;
  late double _sheetPosition;
  double _maxSheetPosition = 0;
  double screenHeight = 0;
  @override
  void initState() {
    super.initState();
    _isBottomSheetOpen = false;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didChangeDependencies() {
    screenHeight = MediaQuery.of(context).size.height;
    _sheetPosition = bottomSheetHeight;

    super.didChangeDependencies();
  }

  bool get isBottomSheetOpen {
    setState(() {});
    return _isBottomSheetOpen = _sheetPosition <= bottomSheetHeight;
  }

  void toggleBottomSheet() {
    // setState(() {
    //   _isBottomSheetOpen = !_isBottomSheetOpen;
    // });
    if (isBottomSheetOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  onVerticalDragEnd(details) {
    setState(() {
      if (_sheetPosition > bottomSheetHeight) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
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

  double get bottomSheetHeight {
    return screenHeight - widget.height;
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blueGrey,
            child: Center(
              child: TextButton(
                onPressed: toggleBottomSheet,
                child: Text(
                  !_isBottomSheetOpen ? "Close Sheet" : "Open Sheet",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                top: _sheetPosition + _animation.value,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onVerticalDragUpdate: onVerticalDragUpdate,
                  onVerticalDragEnd: onVerticalDragEnd,
                  child: Container(
                    height: screenHeight,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.teal,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: toggleBottomSheet,
                                icon: Icon(
                                  !_isBottomSheetOpen
                                      ? Icons.arrow_drop_down
                                      : Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: widget.height * _animation.value,
                          child: SingleChildScrollView(
                            child: BottomSheetContains(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomSheetContains extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        20,
        (index) => ListTile(
          title: Text('Item $index'),
        ),
      ),
    );
  }
}
