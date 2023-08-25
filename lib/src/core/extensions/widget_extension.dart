import 'package:flutter/material.dart';

extension WidgetExtensionX on Widget {
  SliverToBoxAdapter get toSliverBox => SliverToBoxAdapter(
        child: this,
      );

  SliverPadding sliverPadding(EdgeInsets insets) => SliverPadding(
        padding: insets,
        sliver: toSliverBox,
      );

  Padding pad(double pad) => Padding(
        padding: EdgeInsets.all(pad),
        child: this,
      );

  Padding px(double pad) => Padding(
        padding: EdgeInsets.symmetric(horizontal: pad),
        child: this,
      );

  Padding py(double pad) => Padding(
        padding: EdgeInsets.symmetric(vertical: pad),
        child: this,
      );
  Padding pOnly(
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      Padding(
        padding: EdgeInsets.only(
            left: left, top: top, right: right, bottom: bottom),
        child: this,
      );
}
