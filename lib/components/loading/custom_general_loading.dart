import 'package:flutter/material.dart';

import '../colors/custom_color.dart';

class CustomGeneralLoading extends StatelessWidget {
  final String message;
  final bool solid;
  final bool expanded;

  const CustomGeneralLoading({
    super.key,
    this.message = '',
    this.solid = true,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: contentWidget(
        context: context,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CuadradoAnimado(
                  color: CustomColor.secundary,
                ),
                CuadradoAnimado(
                  color: CustomColor.primary,
                  rotar: false,
                ),
              ],
            ),
            SizedBox(
              height: 28.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget contentWidget({
    required Widget child,
    required BuildContext context,
  }) {
    if (expanded) {
      final ancho = MediaQuery.of(context).size.width;
      return Container(
          color: solid
              ? Colors.white
              : Color.fromARGB(31, 255, 255, 255).withOpacity(0.80),
          width: ancho,
          child: Center(child: child));
    } else {
      final alto = MediaQuery.of(context).size.height;
      final ancho = MediaQuery.of(context).size.width;
      return Container(
        color: solid
            ? Colors.white
            : Color.fromARGB(31, 255, 255, 255).withOpacity(0.80),
        height: alto,
        width: ancho,
        child: child,
      );
    }
  }
}

class CuadradoAnimado extends StatefulWidget {
  final Color color;
  final bool rotar;

  const CuadradoAnimado({Key? key, required this.color, this.rotar = true})
      : super(key: key);

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> agrandar;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    if (widget.rotar) {
      rotacion = Tween(begin: -0.2, end: 2.0).animate(controller);
    } else {
      rotacion = Tween(begin: 2.0, end: 0.0).animate(controller);
    }
    agrandar = Tween(begin: 0.8, end: 1.2).animate(controller);

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      } else if (controller.status == AnimationStatus.dismissed) {
        // controller.forward();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(); // Play

    return AnimatedBuilder(
      animation: rotacion,
      child: _Rectangulo(widget.color),
      builder: (BuildContext context, Widget? childRectangulo) {
        return Transform.rotate(
          angle: rotacion.value,
          child: Transform.scale(
            scale: agrandar.value,
            child: childRectangulo,
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  final Color color;

  const _Rectangulo(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
    );
  }
}
