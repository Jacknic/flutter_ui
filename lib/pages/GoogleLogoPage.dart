import 'dart:math';

import 'package:flutter/material.dart';

class GoogleLogoPage extends StatefulWidget {
  static const PAGE_NAME = "Google Logo";

  @override
  _GoogleLogoPageState createState() => _GoogleLogoPageState();
}

class _GoogleLogoPageState extends State<GoogleLogoPage> {
  double _percent = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: 200,
                width: 200,
                child: GoogleLogo(
                  percent: _percent,
                  strokeWidth: 30.0,
                ),
              ),
            ),
          ),
          Slider(
            onChanged: (double value) {
              setState(() {
                _percent = value;
              });
            },
            divisions: 100,
            label: (_percent * 100).round().toString(),
            value: _percent,
          )
        ],
      ),
    );
  }
}

class GoogleLogo extends StatelessWidget {
  final double percent;
  final double strokeWidth;

  const GoogleLogo({
    this.percent = 1.0,
    this.strokeWidth = 20.0,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _GoogleLogoPainter(strokeWidth: strokeWidth, percent: percent),
        size: Size.square(100),
      );
}

class _GoogleLogoPainter extends CustomPainter {
  static const List<Color> _colors = [
    Color(0xFFEA4335),
    Color(0xFFFBBC05),
    Color(0xFF34A853),
    Color(0xFF4285F4),
  ];
  final double percent;
  final double strokeWidth;
  final Paint _paint = Paint();

  _GoogleLogoPainter({this.strokeWidth = 10, this.percent = 1.0}) {
    _paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeMiterLimit = 30
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var centerPoint = size.center(Offset.zero);
    var path = Path();
    path.moveTo(centerPoint.dx, centerPoint.dy);
    var radius = min(size.width, size.height) / 2 - strokeWidth / 2;
    path.relativeLineTo(radius, 0);
    var rect = Rect.fromCircle(center: centerPoint, radius: radius);
    path.arcTo(rect, 0, (7 / 4) * pi, false);
    var computeMetrics = path.computeMetrics();
    var pathMetric = computeMetrics.first;
    var sliceLength = pathMetric.length * percent;
    for (var i = 0; i < _colors.length; i += 1) {
      _paint.color = _colors[3 - i];
      var newPath = pathMetric.extractPath(sliceLength / 4 * i, sliceLength);
      canvas.drawPath(newPath, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
