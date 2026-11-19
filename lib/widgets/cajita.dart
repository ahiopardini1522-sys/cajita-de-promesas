import 'package:flutter/material.dart';

import '../datos/promesas.dart';
import 'papelito.dart';

/// La cajita de regalo con papelitos adentro.
/// [apertura] va de 0 (cerrada) a 1 (tapa levantada).
class Cajita extends StatelessWidget {
  const Cajita({super.key, required this.apertura});

  final double apertura;

  static const double ancho = 240;
  static const double altoCuerpo = 170;
  static const double altoTapa = 54;

  static const Color rojo = Color(0xFFB83242);
  static const Color rojoOscuro = Color(0xFF7E1A2A);
  static const Color dorado = Color(0xFFE8C26A);
  static const Color crema = Color(0xFFFFF8EC);

  @override
  Widget build(BuildContext context) {
    final t = apertura;
    const anchoTapa = ancho + 16;
    const anchoTotal = ancho + 120;
    const margen = (anchoTotal - ancho) / 2;

    return SizedBox(
      width: anchoTotal,
      height: altoCuerpo + altoTapa + 130,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Papelitos enrollados adentro (se ven al abrir la tapa)
          Positioned(
            left: margen + 20,
            right: margen + 20,
            bottom: altoCuerpo - 38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (var i = 0; i < 7; i++)
                  Transform.rotate(
                    angle: (i - 3) * 0.06,
                    child: PapelitoEnrollado(
                      color: coloresPapelitos[i % coloresPapelitos.length],
                      alto: 58.0 + (i % 3) * 6,
                    ),
                  ),
              ],
            ),
          ),
          // Cuerpo
          Positioned(left: margen, bottom: 0, child: _cuerpo()),
          // Tapa
          Positioned(
            left: (anchoTotal - anchoTapa) / 2 + 40 * t,
            bottom: altoCuerpo - 8 + 90 * t,
            child: Transform.rotate(
              angle: 0.35 * t,
              child: _tapa(anchoTapa),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cuerpo() {
    return Container(
      width: ancho,
      height: altoCuerpo,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(6),
          bottom: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [rojo, rojoOscuro],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 20,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            child: Container(width: 26, color: dorado),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: crema,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: dorado, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite, color: rojo, size: 18),
                SizedBox(height: 2),
                Text(
                  'Promesas',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: rojoOscuro,
                  ),
                ),
                Text(
                  'de Dios',
                  style: TextStyle(
                    fontSize: 13,
                    letterSpacing: 1.5,
                    color: rojoOscuro,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tapa(double anchoTapa) {
    return SizedBox(
      width: anchoTapa,
      height: altoTapa + 34,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: anchoTapa,
            height: altoTapa,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFD04A58), rojo],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Center(child: Container(width: 26, color: dorado)),
          ),
          const Positioned(top: 0, child: _Mono()),
        ],
      ),
    );
  }
}

/// Moño dorado arriba de la tapa.
class _Mono extends StatelessWidget {
  const _Mono();

  @override
  Widget build(BuildContext context) {
    Widget lazo(double angulo) => Transform.rotate(
          angle: angulo,
          child: Container(
            width: 40,
            height: 26,
            decoration: BoxDecoration(
              color: Cajita.dorado,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFC9A14A), width: 3),
            ),
          ),
        );

    return SizedBox(
      width: 96,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(left: 4, child: lazo(-0.35)),
          Positioned(right: 4, child: lazo(0.35)),
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: const Color(0xFFD9AE52),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      ),
    );
  }
}
