import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'coordinates_to_points.dart';

class CoordinateDrawer extends StatelessWidget {
  /// List of coordinate lists which should be painted.
  /// Provide separate lists if the drawn line should be broken up.
  /// Useful e.g. for a list of island coordinates.
  /// Here you would provide a list of coordinates for each island.
  /// Providing one flat map with the coordinates of all islands would result
  /// in lines being drawn between the islands.
  final List<List<Coordinate>> coordinateLists;

  /// Specifies if a point should be drawn for each coordinate.
  /// Defaults to false.
  final bool drawPoints;

  /// Specifies if lines should be drawn between each consecutive coordinate of
  /// the separate coordinate lists.
  /// Defaults to true.
  final bool drawLines;

  /// Whether a line should be drawn between the last and the first coordinate
  /// of one coordinate list.
  /// Should be true e.g. for drawing the border of a country.
  /// Should be false e.g. for drawing a one-way route.
  /// Defaults to false.
  final bool closeShapes;

  /// The color of the drawn lines.
  /// Overridden by [customLinePaint], if specified.
  final Color? lineColor;

  /// The line width of the drawn lines.
  /// Overridden by [customLinePaint], if specified.
  final double? lineWidth;

  /// The color of the drawn points.
  /// Overridden by [customPointPaint], if specified.
  final Color? pointColor;

  /// The size of the drawn points.
  /// Overridden by [customPointPaint], if specified.
  final double? pointSize;

  /// [Paint] to be used for drawing the lines.
  /// Overrides [lineColor] and [lineWidth].
  final Paint? customLinePaint;

  /// [Paint] to be used for drawing the points.
  /// Overrides [pointColor] and [pointSize].
  final Paint? customPointPaint;

  /// Overrides and directly sets the [pixelPerDegree] value.
  /// If it is not specified the value is dynamically calculated depending on
  ///  the given coordinates and the available space.
  final double? pixelPerDegree;

  const CoordinateDrawer({
    Key? key,
    required this.coordinateLists,
    this.drawPoints = false,
    this.drawLines = true,
    this.closeShapes = false,
    this.lineColor,
    this.lineWidth,
    this.pointColor,
    this.pointSize,
    this.customLinePaint,
    this.customPointPaint,
    this.pixelPerDegree,
  }) : super(key: key);

  Paint getLinePaint(BuildContext context) {
    return customLinePaint ?? Paint()
      ..color = lineColor ?? Theme.of(context).primaryColor
      ..strokeWidth = lineWidth ?? 15
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
  }

  Paint getPointPaint(BuildContext context) {
    return customPointPaint ?? Paint()
      ..color = pointColor ?? Theme.of(context).primaryColorDark
      ..strokeWidth = pointSize ?? 3
      ..strokeCap = StrokeCap.round;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: RepaintBoundary(
            child: CustomPaint(
              painter: _Painter(
                drawLines: drawLines,
                drawPoints: drawPoints,
                closeShapes: closeShapes,
                coordinates: CoordinatesToPoints(
                  coordinateLists: coordinateLists,
                  availableSize: constraints.biggest,
                  customPixelPerDegree: pixelPerDegree,
                ),
                linePaint: getLinePaint(context),
                pointPaint: getPointPaint(context),
              ),
              child: SizedBox(
                width: constraints.biggest.width,
                height: constraints.biggest.height,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Painter extends CustomPainter {
  final CoordinatesToPoints coordinates;
  final bool drawLines;
  final bool drawPoints;
  final bool closeShapes;
  final Paint linePaint;
  final Paint pointPaint;

  _Painter({
    required this.coordinates,
    required this.drawLines,
    required this.drawPoints,
    required this.closeShapes,
    required this.linePaint,
    required this.pointPaint,
  });

  static const drawDebug = false;

  @override
  void paint(Canvas canvas, Size size) {
    //* DEBUG
    if (kDebugMode && drawDebug) {
      canvas.drawPoints(
          PointMode.points,
          [
            Offset(size.width, size.height),
          ],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 5);
    }

    //* CENTER CANVAS
    canvas.translate((size.width - coordinates.size.width) / 2,
        (size.height - coordinates.size.height) / 2);

    //* DRAW LINES
    if (drawLines) {
      for (final pointList in coordinates.pointLists) {
        for (int i = 0; i < pointList.length; i++) {
          //! Using canvas.path results in horrible lag when zooming. -> Use drawLine()
          if (i != 0) {
            canvas.drawLine(pointList[i - 1], pointList[i], linePaint);
            if (i == pointList.length - 1 && closeShapes) {
              canvas.drawLine(pointList.last, pointList.first, linePaint);
            }
          }
        }
      }
    }

    //* DRAW POINTS
    if (drawPoints) {
      canvas.drawPoints(
        PointMode.points,
        coordinates.pointLists.expand((point) => point).toList(),
        pointPaint,
      );
    }

    //* DEBUG
    if (kDebugMode && drawDebug) {
      canvas.drawRect(
          Rect.fromPoints(coordinates.topLeft, coordinates.bottomRight),
          Paint()..style = PaintingStyle.stroke);

      canvas.drawPoints(
          PointMode.points,
          [
            const Offset(0, 0),
            coordinates.center,
            Offset(coordinates.size.width, coordinates.size.height),
          ],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 5);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
