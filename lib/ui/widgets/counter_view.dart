import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

typedef VoidCallback = void Function();

class CounterView extends StatefulWidget {
  final int initNumber;
  final Function(int) counterCallback;
  final Function increaseCallback;
  final Function decreaseCallback;
  final int minNumber;
  final Color iconColor;
  final double iconSize;

  CounterView({
    this.initNumber = 0,
    required this.counterCallback,
    increaseCallback,
    decreaseCallback,
    this.minNumber = 0,
    this.iconColor = Colors.grey,
    this.iconSize = 12.0,
  })  : increaseCallback = increaseCallback ?? (() {}),
        decreaseCallback = decreaseCallback ?? (() {});

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late int _currentCount;
  late Function _counterCallback;
  late Function _increaseCallback;
  late Function _decreaseCallback;
  late int _minNumber;

  @override
  void initState() {
    super.initState();
    _currentCount = widget.initNumber;
    _counterCallback = widget.counterCallback;
    _increaseCallback = widget.increaseCallback;
    _decreaseCallback = widget.decreaseCallback;
    _minNumber = widget.minNumber;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.zero,
      width: size.width,
      decoration: BoxDecoration(),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _createButton(Icons.remove, () => _decrement()),
          Material(
              child: Text(
            _currentCount.toString(),
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: themeColor,
                  fontWeight: FontWeight.w500,
                ),
          )),
          _createButton(Icons.add, () => _increment()),
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      _currentCount++;
      _counterCallback(_currentCount);
      _increaseCallback();
    });
  }

  void _decrement() {
    setState(() {
      if (_currentCount > _minNumber) {
        _currentCount--;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  Widget _createButton(IconData icon, VoidCallback onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(minWidth: 32.0, minHeight: 32.0),
      onPressed: onPressed,
      elevation: 2.0,
      shape: CircleBorder(side: BorderSide(color: Colors.grey.shade400)),
      child: Icon(
        icon,
        color: widget.iconColor,
        size: widget.iconSize,
      ),
    );
  }
}
