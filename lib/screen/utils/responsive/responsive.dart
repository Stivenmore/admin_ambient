import 'package:flutter/material.dart';
import 'dart:math' as math;
// Class responsiva de UI
class Responsive {
  late double _width, _height, _diagonal, _shortestSide;
  late bool _isTablet, _isMobile, _isWeb;

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;
  double get shortestSide => _shortestSide;
  bool get isTablet => _isTablet;
  bool get isMobile => _isMobile;
  bool get isWeb => _isWeb;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;

    // c2+ a2+b2 => c = srt(a2+b2)
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));

    _isTablet = size.width >= 550 && size.width <= 850;
    _isWeb = size.width > 850;
    _isMobile = !_isTablet && !_isWeb;
    _shortestSide = size.shortestSide;
  }
  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;
  double dp(double percent) => _diagonal * percent / 100;
  double st(double percent) => _shortestSide * percent / 100;
}