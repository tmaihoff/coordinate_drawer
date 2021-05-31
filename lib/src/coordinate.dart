import 'dart:math';

import 'package:flutter/material.dart';

class Coordinate {
  final double lat;
  final double lon;

  Coordinate({
    required this.lat,
    required this.lon,
  });
}

class CoordinateList {
  CoordinateList(
    this.coordinates,
    this.constraint,
  ) {
    final maxLon = coordinates.map((e) => e.lon).reduce(max);
    final minLon = coordinates.map((e) => e.lon).reduce(min);
    final maxLat = coordinates.map((e) => e.lat).reduce(max);
    final minLat = coordinates.map((e) => e.lat).reduce(min);
    final lonExtend = maxLon - minLon;
    final latExtend = maxLat - minLat;
    final maxExtend = List.of([lonExtend, latExtend]).reduce(max);

    pixelPerDegree = constraint.shortestSide / maxExtend;

    final centerX = minLon + (maxLon - minLon) / 2;

    coordinates = coordinates
        // center it for symmetric drawing
        .map((e) => Coordinate(lat: e.lat, lon: e.lon - centerX))
        .toList();
    offsets = coordinates.map((e) => coordinateToOffset(e)).toList();

    minX = offsets.map((e) => e.dx).reduce(min);
    maxX = offsets.map((e) => e.dx).reduce(max);
    minY = offsets.map((e) => e.dy).reduce(min);
    maxY = offsets.map((e) => e.dy).reduce(max);
    points = offsets.map((e) => Offset(e.dx - minX, e.dy - minY)).toList();
  }

  List<Coordinate> coordinates;
  final Size constraint;

  late List<Offset> offsets;

  late double minX;
  late double maxX;
  late double minY;
  late double maxY;
  late List<Offset> points;
  late double pixelPerDegree;

  List<Offset> get asOffsetList =>
      coordinates.map((e) => coordinateToOffset(e)).toList();

  int get length => coordinates.length;

  Offset coordinateToOffset(Coordinate coordinate) {
    double x = coordinate.lon * cos(coordinate.lat * pi / 180) * pixelPerDegree;
    double y = -coordinate.lat * pixelPerDegree;
    return Offset(x, y);
  }

  double get height {
    return (maxY - minY).abs();
  }

  double get width {
    return (maxX - minX).abs();
  }

  Size get size => Size(width, height);

  Rect get enclosingRect =>
      Rect.fromCircle(center: Offset.zero, radius: enclosingRadius);

  double get enclosingRadius =>
      sqrt(size.height * size.height + size.width * size.width) / 2;

  Offset get topLeft => size.topLeft(Offset.zero);
  Offset get topRight => size.topRight(Offset.zero);
  Offset get bottomLeft => size.bottomLeft(Offset.zero);
  Offset get bottomRight => size.bottomRight(Offset.zero);

  Offset get center => size.center(Offset.zero);
}
