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
    Key key,
    this.children,
    CrossAxisAlignment crossAxisAlignment,
    MainAxisAlignment mainAxisAlignment,
    VerticalDirection verticalDirection,
    EdgeInsetsGeometry padding,
    this.textDirection,
    this.textBaseline,
  })  : crossAxisAlignment = crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment = mainAxisAlignment ?? MainAxisAlignment.start,
        verticalDirection = verticalDirection ?? VerticalDirection.down,
        padding = padding ?? EdgeInsets.zero,
        super(key: key);

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
