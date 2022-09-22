import 'package:flutter/material.dart';

class LabeledIcon extends StatefulWidget {
  const LabeledIcon(
      {super.key,
      required this.iconOnSelected,
      this.iconOnDeselected,
      required this.label,
      required this.onTap});

  final Widget iconOnSelected;
  final Widget? iconOnDeselected;
  final Widget label;
  final Function(bool) onTap;

  @override
  State<LabeledIcon> createState() => _LabeledIconState();
}

class _LabeledIconState extends State<LabeledIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          isSelected = !isSelected;
          widget.onTap(isSelected);
        });
      }),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: isSelected
                ? widget.iconOnSelected
                : widget.iconOnDeselected ?? widget.iconOnSelected,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: widget.label,
          )
        ],
      ),
    );
  }
}
