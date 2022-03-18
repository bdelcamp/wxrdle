import 'package:flutter/material.dart';
import 'package:wxrdle/globals/colors.dart';

class SelectorRange extends StatefulWidget {
  final int selected;
  final int length;
  final int start;
  final Function(int) onSelect;
  const SelectorRange({ Key? key, required this.selected, required this.length, required this.start, required this.onSelect }) : super(key: key);

  @override
  State<SelectorRange> createState() => _SelectorRangeState();
}

class _SelectorRangeState extends State<SelectorRange> {
  late int _currSelect;

  @override
  void initState() {
    super.initState();
    _currSelect = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(widget.length, (index) {
        int _currLength = (index + widget.start);
        return Expanded(
          child: InkWell(
            onTap: (() {
              widget.onSelect(_currLength);
              setState(() {
                _currSelect = _currLength;
              });
            }),
            child: Container(
              height: 25,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: (_currLength == _currSelect ? correctGuess : Colors.white),
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
              ),
              child: Center(
                child: Text(
                  _currLength.toString(),
                  style: TextStyle(
                    color: (_currLength == _currSelect ? correctGuess : Colors.white),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}