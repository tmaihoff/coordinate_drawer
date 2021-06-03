import 'dart:math';

import 'package:flutter/material.dart';

class CoordinatesToPoints {
  CoordinatesToPoints({
    required List<List<Coordinate>> coordinateLists,
    required Size availableSize,
  })  : _coordinateLists = coordinateLists,
        _availableSize = availableSize {
    _processCoordinates();

    _coordinatesToPoints();

    _adjustScale();

    _makePointLists();
  }

  List<List<Coordinate>> _coordinateLists;
  List<Coordinate> get _flatCoordinateList =>
      _coordinateLists.expand((e) => e).toList();
  final Size _availableSize;

  double get minX => _pointsBounds.minX;
  double get maxX => _pointsBounds.maxX;
  double get minY => _pointsBounds.minY;
  double get maxY => _pointsBounds.maxY;
  late Bounds _pointsBounds;
  late double _pixelPerDegree;

  /// The list of pointLists containing the calculated points to be drawn.
  late List<List<Offset>> pointLists;

  /// Performs various calculations on the given coordinate lists.
  /// 1. The coordinate bounds are calculated via the [Bounds] class.
  /// 2. the [_pixelPerDegree] ratio is calculated taking into account the
  /// available drawing size and the max coordinate extend.
  /// 3. The coordinates are normalized to lon = 0 to be centered around X;
  void _processCoordinates() {
    //* 1
    final coordinateBounds = Bounds(
      xValues: _flatCoordinateList.map((c) => c.lon).toList(),
      yValues: _flatCoordinateList.map((c) => c.lat).toList(),
    );

    //* 2
    _pixelPerDegree =
        _availableSize.shortestSide / coordinateBounds.maxXYExtend;

    //* 3
    _coordinateLists = _coordinateLists
        .map((coordinateList) => coordinateList
            // center every coordinate for symmetric drawing
            .map((e) =>
                Coordinate(lat: e.lat, lon: e.lon - coordinateBounds.centerX))
            .toList())
        .toList();
  }

  /// Converts all coordinates to points and saves them into a [Bounds] object.
  void _coordinatesToPoints() {
    final allPoints = _coordinateLists
        .expand((e) => e)
        .map((c) => _coordinateToPoint(c))
        .toList();

    _pointsBounds = Bounds(
      xValues: allPoints.map((e) => e.dx).toList(),
      yValues: allPoints.map((e) => e.dy).toList(),
    );
  }

  /// Adjustment necessary to mitigate the cos-latitude effect when
  /// converting from coordinates to points.
  /// Has to be done in two iterations.
  void _adjustScale() {
    final heightFactor = _availableSize.height / _pointsBounds.yExtend;
    final widthFactor = _availableSize.width / _pointsBounds.xExtend;
    final scaleAdjustmentFactor = [heightFactor, widthFactor].reduce(min);

    _pixelPerDegree *= scaleAdjustmentFactor;

    _coordinatesToPoints();
  }

  /// Converts the coordinate lists to point lists - not flat.
  /// Makes the lists that are used by the Painter.
  /// Also moves the to-be-drawn-points to the center of the available size.
  void _makePointLists() {
    pointLists = _coordinateLists
        .map((coordinates) => coordinates
            .map((c) => _coordinateToPoint(c))
            // Position inside drawing scope (Remove offset from lat 0 / lon 0)
            .map((point) => Offset(point.dx - minX, point.dy - minY))
            .toList())
        .toList();
  }

  Offset _coordinateToPoint(Coordinate coordinate) {
    final x = coordinate.lon * cos(coordinate.lat * pi / 180) * _pixelPerDegree;
    final y = -coordinate.lat * _pixelPerDegree;
    return Offset(x, y);
  }

  double get height => (maxY - minY).abs();
  double get width => (maxX - minX).abs();

  Size get size => Size(width, height);

  Offset get topLeft => size.topLeft(Offset.zero);
  Offset get topRight => size.topRight(Offset.zero);
  Offset get bottomLeft => size.bottomLeft(Offset.zero);
  Offset get bottomRight => size.bottomRight(Offset.zero);
  Offset get center => size.center(Offset.zero);
}

class Bounds {
  final List<double> xValues;
  final List<double> yValues;

  const Bounds({
    required this.xValues,
    required this.yValues,
  });

  double get minX => xValues.reduce(min);
  double get maxX => xValues.reduce(max);
  double get maxY => yValues.reduce(max);
  double get minY => yValues.reduce(min);
  double get centerX => minX + (maxX - minX) / 2;
  double get centerY => minY + (maxY - minY) / 2;
  double get xExtend => maxX - minX;
  double get yExtend => maxY - minY;
  double get maxXYExtend => [xExtend, yExtend].reduce(max);
  double get minXYExtend => [xExtend, yExtend].reduce(min);
  double get diagonalExtend => sqrt(xExtend * xExtend + yExtend * yExtend);
}

class Coordinate {
  final double lat;
  final double lon;

  const Coordinate({
    required this.lat,
    required this.lon,
  });
}
