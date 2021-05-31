import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coordinate.dart';

class CoordinateDrawer extends StatelessWidget {
  final List<Coordinate> coordinates;

  CoordinateDrawer({
    Key? key,
    required this.coordinates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: CustomPaint(
            painter: _Painter(
              CoordinateList(
                coordinates,
                constraints.biggest,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Painter extends CustomPainter {
  final CoordinateList coordinateList;

  _Painter(this.coordinateList);

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Paint circlePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Paint pointPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // move canvas for centering
    canvas.translate(-coordinateList.center.dx, -coordinateList.center.dy);

    for (int i = 0; i < coordinateList.length; i++) {
      if (i > 0) {
        canvas.drawLine(
          coordinateList.points[i - 1],
          coordinateList.points[i],
          linePaint,
        );
      }
    }
    canvas.drawPoints(
      PointMode.points,
      coordinateList.points,
      pointPaint,
    );

    canvas.drawCircle(coordinateList.center, 10, circlePaint);

    canvas.drawRect(
        Rect.fromPoints(coordinateList.topRight, coordinateList.bottomLeft),
        linePaint);

    // maybe draw circle
    canvas.drawCircle(
      coordinateList.center,
      coordinateList.enclosingRadius,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// class DrawAirport {
//   final double latAp;
//   final double lonAp;
//   final List<Runway> runways;
//   DrawAirport({
//     this.latAp,
//     this.lonAp,
//     this.runways,
//   });

//   double offsetX;
//   double offsetY;

//   void initCalc(Size size) {
//     for (Runway rwy in runways) {
//       double kScale = 0.14 * size.shortestSide;

//       //Offset from Airport Reference Point -> start point
//       rwy.startX =
//           -(lonAp - rwy.leLonDeg) * cos((latAp) / 2 * pi / 180) * 60 * kScale;
//       rwy.startY = (latAp - rwy.leLatDeg) * 60 * kScale;

//       // Length of the x and y coordinates
//       double _lenX = (rwy.heLonDeg - rwy.leLonDeg) *
//           cos((latAp) / 2 * pi / 180) *
//           60 *
//           kScale;
//       double _lenY = -(rwy.heLatDeg - rwy.leLatDeg) * 60 * kScale;

//       // End points of the lines
//       rwy.endX = rwy.startX + _lenX;
//       rwy.endY = rwy.startY + _lenY;
//     }
//     if (runways.isNotEmpty) {
//       // List of all drawing points
//       List<double> valuesX = runways.map((e) => e.startX).toList() +
//           runways.map((e) => e.endX).toList();
//       List<double> valuesY = runways.map((e) => e.startY).toList() +
//           runways.map((e) => e.endY).toList();

//       // Get dimensions of drawing box
//       double minX = valuesX.reduce(min);
//       double maxX = valuesX.reduce(max);
//       double minY = valuesY.reduce(min);
//       double maxY = valuesY.reduce(max);

//       // Center Drawing
//       //    Offset by half of drawing box (size)
//       //    Offset by half of drawing dimensions
//       offsetX = size.width / 2 - ((maxX - minX) / 2 + minX);
//       offsetY = size.height / 2 - ((maxY - minY) / 2 + minY);
//     }
//   }

//   void drawRunways(Canvas canvas, Paint paint) {
//     for (Runway rwy in runways) {
//       Offset startingPoint = Offset(rwy.startX + offsetX, rwy.startY + offsetY);
//       Offset endPoint = Offset(rwy.endX + offsetX, rwy.endY + offsetY);

//       canvas.drawLine(startingPoint, endPoint, paint);
//     }
//   }
// }
