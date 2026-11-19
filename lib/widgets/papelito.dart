import 'package:flutter/material.dart';

import '../datos/promesas.dart';

Color _oscurecer(Color c, double t) => Color.lerp(c, Colors.black, t)!;
Color _aclarar(Color c, double t) => Color.lerp(c, Colors.white, t)!;

/// Papelito enrollado que se ve dentro de la cajita.
class PapelitoEnrollado extends StatelessWidget {
  const PapelitoEnrollado({super.key, required this.color, this.alto = 60});

  final Color color;
  final double alto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: alto,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            _oscurecer(color, 0.18),
            _aclarar(color, 0.35),
            color,
            _oscurecer(color, 0.22),
          ],
          stops: const [0, 0.35, 0.65, 1],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 3,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Center(
        child: Container(height: 4, color: const Color(0xCCFFFFFF)),
      ),
    );
  }
}

/// Papelito que sale de la cajita y se desenrolla como un pergamino.
/// [progreso] va de 0 (enrollado) a 1 (abierto del todo).
class PapelitoDesenrollable extends StatelessWidget {
  const PapelitoDesenrollable({
    super.key,
    required this.promesa,
    required this.color,
    required this.progreso,
  });

  final Promesa promesa;
  final Color color;
  final double progreso;

  static const double ancho = 300;

  @override
  Widget build(BuildContext context) {
    final t = progreso.clamp(0.0, 1.0);
    return SizedBox(
      width: ancho + 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Rodillo(color: color, ancho: ancho + 16),
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: t,
              child: _Hoja(promesa: promesa, color: color),
            ),
          ),
          _Rodillo(color: color, ancho: ancho + 16),
        ],
      ),
    );
  }
}

class _Rodillo extends StatelessWidget {
  const _Rodillo({required this.color, required this.ancho});

  final Color color;
  final double ancho;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [_aclarar(color, 0.3), color, _oscurecer(color, 0.25)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}

class _Hoja extends StatelessWidget {
  const _Hoja({required this.promesa, required this.color});

  final Promesa promesa;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: PapelitoDesenrollable.ancho,
      padding: const EdgeInsets.fromLTRB(26, 22, 26, 22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            _aclarar(color, 0.5),
            _aclarar(color, 0.75),
            _aclarar(color, 0.5),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '✦  PROMESA PARA HOY  ✦',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
              color: _oscurecer(color, 0.55),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '“${promesa.texto}”',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'serif',
              fontSize: 20,
              height: 1.4,
              fontStyle: FontStyle.italic,
              color: Color(0xFF3B2A20),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            promesa.cita,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: _oscurecer(color, 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
