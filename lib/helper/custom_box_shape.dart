import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class BoxShapeCustom extends BoxBorder{
  @override
  // TODO: implement bottom
  BorderSide get bottom => throw UnimplementedError();

  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  // TODO: implement isUniform
  bool get isUniform => throw UnimplementedError();

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection, BoxShape shape = BoxShape.rectangle, BorderRadius borderRadius}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }

  @override
  // TODO: implement top
  BorderSide get top => throw UnimplementedError();
      
}