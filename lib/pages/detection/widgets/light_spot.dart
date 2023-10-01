import 'package:flutter/material.dart';

class LightSpot extends StatefulWidget {
  const LightSpot({Key? key}) : super(key: key);

  @override
  LightSpotState createState() => LightSpotState();
}

class LightSpotState extends State<LightSpot> with TickerProviderStateMixin {
  final _radius = 5.0; //基本光点のサイズ
  final _backRadius = 10.0; //後光のサイズ
  late AnimationController _animationController;
  late Animation<double> _animationRadius;

  @override
  void initState() {
    //アニメーションコントローラの設定
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    //アニメーションの設定
    _animationRadius =
        Tween(begin: 0.0, end: _backRadius).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    //繰り返し、反転無し
    _animationController.repeat(reverse: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.all(50),
      child: CustomPaint(
        painter: _CirclePainter(
          _radius,
          _backRadius,
          _animationRadius.value,
        ),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final lightColor = Colors.red; //光点の色
  //後光の設定
  final Map<int, Map<String, double>> lightLayers = {
    0: {
      'maxOpacity': 0.5, //後光の濃さ
    },
    1: {
      'maxOpacity': 0.3,
    },
  };

  final double _basicRadius; //光点の基本サイズ
  final double _maxBackRadius; //後光の最大サイズ
  final double _animationRadius; //後光アニメーションサイズ

  _CirclePainter(this._basicRadius, this._maxBackRadius, this._animationRadius);

  @override
  void paint(Canvas canvas, Size size) {
    var c = const Offset(0, 0); //光点の表示位置x,y
    //光点の実体を配置
    canvas.drawCircle(
      c,
      _basicRadius,
      Paint()
        ..color = lightColor
        ..style = PaintingStyle.fill, //塗り潰しの円
    );

    var size = _basicRadius;

    //後光配列ループ
    for (var i = 0; i < lightLayers.length; i++) {
      var row = lightLayers[i]!;
      //後光の透明度の算出
      var opacity =
          _animationRadius * (row['maxOpacity']! / _maxBackRadius * -1) +
              row['maxOpacity']!;
      //誤差でmax-min外れないように
      opacity = opacity < 0.0 ? 0.0 : opacity;
      opacity = opacity > 1.0 ? 1.0 : opacity;
      //後光サイズ
      size += _animationRadius;
      //後光描画
      canvas.drawCircle(
        c,
        size,
        Paint()
          ..style = PaintingStyle.fill //塗り潰しの円
          ..color = lightColor.withOpacity(opacity),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
