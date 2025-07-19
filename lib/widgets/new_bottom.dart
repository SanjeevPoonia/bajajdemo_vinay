
import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class CircleNavBar extends StatefulWidget {
  /// Construct a new appbar with internal style.
  ///
  /// ```dart
  /// CircleNavBar(
  ///   activeIcons: const [
  ///     Icon(Icons.person, color: Colors.deepPurple),
  ///     Icon(Icons.home, color: Colors.deepPurple),
  ///     Icon(Icons.favorite, color: Colors.deepPurple),
  ///   ],
  ///   inactiveIcons: const [
  ///     Text("My"),
  ///     Text("Home"),
  ///     Text("Like"),
  ///   ],
  ///   color: Colors.white,
  ///   height: 60,
  ///   circleWidth: 60,
  ///   activeIndex: 1,
  ///   onTab: (v) {
  ///     // TODO
  ///   },
  ///   padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
  ///   cornerRadius: const BorderRadius.only(
  ///     topLeft: Radius.circular(8),
  ///     topRight: Radius.circular(8),
  ///     bottomRight: Radius.circular(24),
  ///     bottomLeft: Radius.circular(24),
  ///   ),
  ///   shadowColor: Colors.deepPurple,
  ///   elevation: 10,
  ///   // gradient: LinearGradient(colors: [0xFF73d1d3, 0xFFBADCC3, 0xFFDBA380].map(Color.new).toList()),
  /// );
  /// ```
  ///
  /// ![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/value-05.png)
  const CircleNavBar({
    Key? key,
    required this.activeIndex,
    this.onTab,
    this.tabCurve = Curves.linearToEaseOut,
    this.iconCurve = Curves.bounceOut,
    this.tabDurationMillSec = 1000,
    this.iconDurationMillSec = 500,
    required this.activeIcons,
    required this.inactiveIcons,
    required this.height,
    required this.circleWidth,
    required this.color,
    this.padding = EdgeInsets.zero,
    this.cornerRadius = BorderRadius.zero,
    this.shadowColor = Colors.white,
    this.elevation = 0,
    this.gradient,
  })  : assert(circleWidth <= height, "circleWidth <= height"),
        assert(activeIcons.length == inactiveIcons.length, "activeIcons.length and inactiveIcons.length must be equal!"),
        assert(activeIcons.length > activeIndex, "activeIcons.length > activeIndex"),
        super(key: key);

  /// Bottom bar height (without bottom padding)
  ///
  /// ![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/value-05.png)
  final double height;

  /// Circle icon diameter
  ///
  /// ![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/value-05.png)
  final double circleWidth;

  /// Bottom bar Color
  ///
  /// If you set gradient, color will be ignored
  ///
  /// ![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/value-05.png)
  final Color color;

  /// Bottom bar activeIcon List
  ///
  /// The active icon must be smaller than the diameter of the circle
  ///
  /// activeIcons.length and inactiveIcons.length must be equal
  final List<Widget> activeIcons;

  /// Bottom bar inactiveIcon List
  ///
  /// The active icon must be smaller than the bottom bar height
  ///
  /// activeIcons.length and inactiveIcons.length must be equal
  final List<Widget> inactiveIcons;

  /// bottom bar padding
  ///
  /// It is the distance from the Scaffold
  ///
  /// ![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/value-05.png)
  final EdgeInsets padding;

  /// cornerRadius
  ///
  /// You can specify different values ​​for each corner
  ///
  /// ![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/value-05.png)
  final BorderRadius cornerRadius;

  /// shadowColor
  ///
  /// ![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/value-05.png)
  final Color shadowColor;

  /// elevation
  final double elevation;

  /// gradient
  ///
  /// If you set gradient, color will be ignored
  ///
  /// ![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/value-05.png)
  final Gradient? gradient;

  /// active index
  final int activeIndex;

  /// When the circle icon moves left and right
  ///
  /// ![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/animation.gif)
  final Curve tabCurve;

  /// When the active icon moves up from the bottom
  ///
  /// /// ![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/animation.gif)
  final Curve iconCurve;

  /// When the circle icon moves left and right
  final int tabDurationMillSec;

  /// When the active icon moves up from the bottom
  final int iconDurationMillSec;

  /// If you tap bottom navigation menu, this function will bo called
  /// You have you udpate widget state
  final Function(int v)? onTab;

  @override
  State<StatefulWidget> createState() => _CircleNavBarState();
}

class _CircleNavBarState extends State<CircleNavBar> with TickerProviderStateMixin {
  late AnimationController tabAc;

  late AnimationController activeIconAc;

  List<String> activeHeaders=['Dashboard','Huddle','ILR','Tickets','Profile'];

  @override
  void initState() {
    super.initState();
    tabAc = AnimationController(vsync: this, duration: Duration(milliseconds: widget.tabDurationMillSec))
      ..addListener(() => setState(() {}))
      ..value = getPosition(widget.activeIndex);
    activeIconAc = AnimationController(vsync: this, duration: Duration(milliseconds: widget.iconDurationMillSec))
      ..addListener(() => setState(() {}))
      ..value = 1;
  }

  @override
  void didUpdateWidget(covariant CircleNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animation();
  }

  void _animation() {
    final nextPosition = getPosition(widget.activeIndex);
    tabAc.stop();
    tabAc.animateTo(nextPosition, curve: widget.tabCurve);
    activeIconAc.reset();
    activeIconAc.animateTo(1, curve: widget.iconCurve);
  }

  double getPosition(int i) {
    int itemCnt = widget.activeIcons.length;
    return i / itemCnt + (1 / itemCnt) / 2;
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: widget.padding,
      width: double.infinity,
      height: widget.height,
      child: Column(
        children: [
          CustomPaint(
            child: SizedBox(
              height: widget.height,
              width: double.infinity,
              child: Stack(
                children: [
                  Row(
                    children: widget.inactiveIcons.map((e) {
                      int currentIndex = widget.inactiveIcons.indexOf(e);
                      return Expanded(
                          child: GestureDetector(
                            onTap: () => widget.onTab?.call(currentIndex),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: widget.activeIndex == currentIndex ? Container(
                                margin: EdgeInsets.only(top: 43),
                                child:  Text(activeHeaders[currentIndex],style: TextStyle(
                                    fontSize: 10,
                                    color: AppTheme.themeColor,
                                    fontWeight: FontWeight.w500
                                ),),

                              ) : e,
                            ),
                          ));
                    }).toList(),
                  ),
                  Positioned(
                      left: tabAc.value * deviceWidth - widget.circleWidth / 2 - tabAc.value * (widget.padding.left + widget.padding.right),
                      child: Transform.scale(
                        scale: activeIconAc.value,
                        child: Container(
                          padding: EdgeInsets.all(17),
                          width: widget.circleWidth,
                          height: widget.circleWidth,
                          transform: Matrix4.translationValues(0, -(widget.circleWidth * 0.5) + _CircleBottomPainter.getMiniRadius(widget.circleWidth) - widget.circleWidth * 0.5 * (1 - activeIconAc.value), 0),
                          // color: Colors.amber,
                          child: widget.activeIcons[widget.activeIndex],
                        ),
                      )),
                ],
              ),
            ),
            painter: _CircleBottomPainter(
              iconWidth: widget.circleWidth,
              color: widget.color,
              xOffsetPercent: tabAc.value,
              boxRadius: widget.cornerRadius,
              shadowColor: widget.shadowColor,
              elevation: widget.elevation,
              gradient: widget.gradient,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleBottomPainter extends CustomPainter {
  _CircleBottomPainter({
    required this.iconWidth,
    required this.color,
    required this.xOffsetPercent,
    required this.boxRadius,
    required this.shadowColor,
    required this.elevation,
    this.gradient,
  });

  final Color color;
  final double iconWidth;
  final double xOffsetPercent;
  final BorderRadius boxRadius;
  final Color shadowColor;
  final double elevation;
  final Gradient? gradient;

  static double getR(double circleWidth) {
    return circleWidth / 2 * 1.2;
  }

  static double getMiniRadius(double circleWidth) {
    return getR(circleWidth) * 0.3;
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    Paint paint = Paint();
    final w = size.width;
    final h = size.height;
    final r = getR(iconWidth);
    final miniRadius = getMiniRadius(iconWidth);
    final x = xOffsetPercent * w;
    final firstX = x - r;
    final secontX = x + r;

    // TopLeft Radius
    path.moveTo(0, 0 + boxRadius.topLeft.y);
    path.quadraticBezierTo(0, 0, boxRadius.topLeft.x, 0);
    path.lineTo(firstX - miniRadius, 0);
    path.quadraticBezierTo(firstX, 0, firstX, miniRadius);

    path.arcToPoint(
      Offset(secontX, miniRadius),
      radius: Radius.circular(r),
      clockwise: false,
    );

    path.quadraticBezierTo(secontX, 0, secontX + miniRadius, 0);

    // TopRight Radius
    path.lineTo(w - boxRadius.topRight.x, 0);
    path.quadraticBezierTo(w, 0, w, boxRadius.topRight.y);

    // BottomRight Radius
    path.lineTo(w, h - boxRadius.bottomRight.y);
    path.quadraticBezierTo(w, h, w - boxRadius.bottomRight.x, h);

    // BottomLeft Radius
    path.lineTo(boxRadius.bottomLeft.x, h);
    path.quadraticBezierTo(0, h, 0, h - boxRadius.bottomLeft.y);

    path.close();

    paint.color = color;

    if (gradient != null) {
      Rect shaderRect = Rect.fromCircle(center: Offset(w / 2, h / 2), radius: 180.0);
      paint.shader = gradient!.createShader(shaderRect);
    }

    // canvas.drawShadow(path, shadowColor, elevation, false);
    // Path oval = Path()..addOval(Rect.fromCircle(center: Offset(x, miniRadius), radius: iconWidth / 2));

    // canvas.drawShadow(oval, shadowColor, elevation, false);
    canvas.drawPath(
        path,
        Paint()
          ..color = shadowColor
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(elevation)));

    canvas.drawCircle(
        Offset(x, miniRadius),
        iconWidth / 2,
        Paint()
          ..color = shadowColor
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(elevation)));
    Paint paintBorder = Paint()
      ..color = Colors.white
      ..strokeWidth = 0
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);

    canvas.drawCircle(Offset(x, miniRadius), iconWidth / 2, paint);
    canvas.drawCircle(Offset(x, miniRadius), iconWidth / 2, paintBorder);
  }

  @override
  bool shouldRepaint(_CircleBottomPainter oldDelegate) => oldDelegate != this;
}
