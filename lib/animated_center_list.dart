import 'package:flutter/material.dart';

typedef AnimatedItemBuilder = Widget Function(BuildContext context, int index, bool isCentered);

class AnimatedCenterList extends StatefulWidget {
  final AnimatedItemBuilder itemBuilder;
  final int itemCount;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final double? itemExtent;

  const AnimatedCenterList({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.padding,
    this.shrinkWrap = false,
    this.itemExtent,
  }) : super(key: key);

  @override
  _AnimatedCenterListState createState() => _AnimatedCenterListState();
}

class _AnimatedCenterListState extends State<AnimatedCenterList> {
  final List<GlobalKey> _itemKeys = [];
  int _centerIndex = -1;

  @override
  void initState() {
    super.initState();
    _itemKeys.addAll(List.generate(widget.itemCount, (index) => GlobalKey()));
  }

  void _onScroll(ScrollNotification notification) {
    var newCenterIndex = _calculateCenterIndex();
    if (newCenterIndex != null && newCenterIndex != _centerIndex) {
      setState(() {
        _centerIndex = newCenterIndex;
      });
    }
  }

  int? _calculateCenterIndex() {
    final double screenCenterY = MediaQuery.of(context).size.height / 2;
    double? closestDistance;
    int? newCenterIndex;

    for (int i = 0; i < widget.itemCount; i++) {
      final keyContext = _itemKeys[i].currentContext;
      if (keyContext != null) {
        final RenderBox box = keyContext.findRenderObject() as RenderBox;
        final Offset offset = box.localToGlobal(Offset.zero);
        final double itemCenterY = offset.dy + box.size.height / 2;

        final double distanceToCenter = (screenCenterY - itemCenterY).abs();
        if (closestDistance == null || distanceToCenter < closestDistance) {
          closestDistance = distanceToCenter;
          newCenterIndex = i;
        }
      }
    }

    return newCenterIndex;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        _onScroll(notification);
        return true;
      },
      child: ListView.builder(
        scrollDirection: widget.scrollDirection,
        reverse: widget.reverse,
        controller: widget.controller,
        primary: widget.primary,
        physics: widget.physics,
        padding: widget.padding,
        shrinkWrap: widget.shrinkWrap,
        itemExtent: widget.itemExtent,
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          bool isCenterItem = index == _centerIndex;
          return Container(
            key: _itemKeys[index],
            child: widget.itemBuilder(context, index, isCenterItem),
          );
        },
      ),
    );
  }
}
