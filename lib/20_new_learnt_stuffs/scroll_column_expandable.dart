import 'package:flutter/material.dart';

class ScrollColumnExpandable extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection textDirection;
  final TextBaseline textBaseline;
  final EdgeInsetsGeometry padding;

  const ScrollColumnExpandable({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.verticalDirection = VerticalDirection.down,
    this.padding = EdgeInsets.zero,
    this.textDirection = TextDirection.ltr,
    this.textBaseline = TextBaseline.alphabetic,
  });

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[const SizedBox(width: double.infinity)];

    if (this.children != null) children.addAll(this.children);
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: Padding(
            padding: padding,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraint.maxHeight - padding.vertical,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: crossAxisAlignment,
                  mainAxisAlignment: mainAxisAlignment,
                  mainAxisSize: MainAxisSize.max,
                  verticalDirection: verticalDirection,
                  children: children,
                  textBaseline: textBaseline,
                  textDirection: textDirection,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/**
 * OTHER ALTERNATIVE IS CUSSTOM SCROLL VIEW BUT CustomScrollView doesn't respect keyboard overflow
 */
