import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget get center => Center(child: this);

  Widget get expanded => Expanded(child: this);

  Widget get semantic => Semantics(child: this);

  Widget position({double? top, double? left, double? right, double? bottom}) =>
      Positioned(
          top: top, left: left, right: right, bottom: bottom, child: this);

  Widget inkwell(VoidCallback onTap) => InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: this);

  Widget gesture(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);

  Widget ignore({bool? isIgnore}) =>
      IgnorePointer(ignoring: isIgnore ?? true, child: this);

  Widget flex({int? flex, FlexFit? fit}) =>
      Flexible(flex: flex ?? 1, fit: fit ?? FlexFit.loose, child: this);

  Widget expand({int? flex}) => Expanded(flex: flex ?? 1, child: this);

  Widget padSym({double? v, double? h}) => Padding(
      padding: EdgeInsets.symmetric(vertical: v ?? .0, horizontal: h ?? .0),
      child: this);

  Widget padAll(double pad) =>
      Padding(padding: EdgeInsets.all(pad), child: this);

  Widget pad({double? t, double? b, double? l, double? r}) => Padding(
      padding: EdgeInsets.only(
        top: t ?? .0,
        bottom: b ?? .0,
        left: l ?? .0,
        right: r ?? .0,
      ),
      child: this);

  Widget backSystem() => PopScope(canPop: false, child: this);

  Widget fractionalSb({
    Alignment? alignment,
    double? wf,
    double? hf,
  }) =>
      FractionallySizedBox(
        heightFactor: hf,
        widthFactor: wf,
        alignment: alignment ?? Alignment.center,
        child: this,
      );

  Widget get fit => FittedBox(child: this);

  Widget get limit => LimitedBox(child: this);

  Widget ratio(double aspectRatio) =>
      AspectRatio(aspectRatio: aspectRatio, child: this);

  Widget refresh(RefreshCallback onRefresh) =>
      RefreshIndicator(onRefresh: onRefresh, child: this);

  Widget scaleTr(Animation<double> anim) =>
      ScaleTransition(scale: anim, child: this);

  Widget fadeTr(Animation<double> anim) =>
      FadeTransition(opacity: anim, child: this);

  Widget get alignCenter => Align(alignment: Alignment.center, child: this);
}
