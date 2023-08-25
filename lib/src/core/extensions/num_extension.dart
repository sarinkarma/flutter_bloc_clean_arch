import 'package:flutter/material.dart';

extension NumExtensionX on num {
  Duration get microseconds => Duration(microseconds: toInt());

  Duration get milliseconds => Duration(milliseconds: toInt());

  Duration get seconds => Duration(seconds: toInt());

  Duration get minutes => Duration(minutes: toInt());

  Duration get hours => Duration(hours: toInt());

  Duration get days => Duration(days: toInt());

  Duration get month => Duration(days: 30 * toInt());

  Duration get year => Duration(days: 365 * toInt());

  Future get delayedMicroSeconds async => Future.delayed(toInt().microseconds);

  Future get delayedMilliSeconds async => Future.delayed(toInt().milliseconds);

  Future get delayedSeconds async => Future.delayed(toInt().seconds);

  Future get delayedMinutes async => Future.delayed(toInt().minutes);

  Future get delayedHours async => Future.delayed(toInt().hours);

  Radius get circular => Radius.circular(toDouble());

  BorderRadiusGeometry get rounded => BorderRadius.circular(toDouble());

  EdgeInsets get all => EdgeInsets.all(toDouble());

  EdgeInsets get bottomOnly => EdgeInsets.only(bottom: toDouble());

  EdgeInsets get topOnly => EdgeInsets.only(top: toDouble());

  EdgeInsets get leftOnly => EdgeInsets.only(left: toDouble());

  EdgeInsets get rightOnly => EdgeInsets.only(right: toDouble());

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());
}
