import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../datos/promesas.dart';
import '../widgets/cajita.dart';
import '../widgets/papelito.dart';

class PantallaCajita extends StatefulWidget {
  const PantallaCajita({super.key});

  @override
  State<PantallaCajita> createState() => _PantallaCajitaState();
}

class _PantallaCajitaState extends State<PantallaCajita>
    with TickerProviderStateMixin {
  late final AnimationController _anim;
  late final AnimationController _respirar;
  late final Animation<double> _tapa;
  late final Animation<double> _salida;
  late final Animation<double> _desenrollar;
  late final Animation<double> _botones;

  final _azar = math.Random();
  Promesa _promesa = promesasDeMuestra.first;
  Color _color = coloresPapelitos.first;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    );
    _respirar = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _tapa = CurvedAnimation(
      parent: _anim,
      curve: const Interval(0.0, 0.22, curve: Curves.easeOutBack),
    );
    _salida = CurvedAnimation(
      parent: _anim,
      curve: const Interval(0.18, 0.55, curve: Curves.easeInOutCubic),
    );
    _desenrollar = CurvedAnimation(
      parent: _anim,
      curve: const Interval(0.55, 0.95, curve: Curves.easeInOut),
    );
    _botones = CurvedAnimation(
      parent: _anim,
      curve: const Interval(0.9, 1.0),
    );
  }

  @override
  void dispose() {
    _anim.dispose();
    _respirar.dispose();
    super.dispose();
  }

  void _sacarPromesa() {
    if (!_anim.isDismissed) return;
    HapticFeedback.mediumImpact();
    setState(() {
      _promesa = promesasDeMuestra[_azar.nextInt(promesasDeMuestra.length)];
      _color = coloresPapelitos[_azar.nextInt(coloresPapelitos.length)];
    });
    _anim.forward();
  }

  void _volverALaCajita() {
    HapticFeedback.lightImpact();
    _anim.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final relleno = MediaQuery.of(context).padding;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF6EA), Color(0xFFF3D3B8)],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, medidas) {
            final alto = medidas.maxHeight;
            const margenInferior = 70.0;
            final inicioPapel = alto - margenInferior - Cajita.altoCuerpo - 10;
            final destinoPapel = relleno.top + 110;

            return AnimatedBuilder(
              animation: Listenable.merge([_anim, _respirar]),
              builder: (context, _) {
                final tSalida = _salida.value;
                final papelVisible = _anim.value > 0.18;
                final respiro = _anim.isDismissed
                    ? 1.0 + 0.025 * Curves.easeInOut.transform(_respirar.value)
                    : 1.0;

                return Stack(
                  children: [
                    // Título
                    Positioned(
                      top: relleno.top + 24,
                      left: 24,
                      right: 24,
                      child: const _Titulo(),
                    ),

                    // Cajita
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: margenInferior,
                      child: Center(
                        child: GestureDetector(
                          onTap: _sacarPromesa,
                          child: Transform.scale(
                            scale: respiro,
                            alignment: Alignment.bottomCenter,
                            child: Cajita(apertura: _tapa.value),
                          ),
                        ),
                      ),
                    ),

                    // Indicación
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 26,
                      child: Opacity(
                        opacity: (1 - _anim.value * 4).clamp(0.0, 1.0),
                        child: const Text(
                          'Tocá la cajita para sacar tu promesa',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF8A5A44),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    // Velo oscuro detrás del papelito
                    if (tSalida > 0)
                      Positioned.fill(
                        child: IgnorePointer(
                          child: ColoredBox(
                            color: Color.fromRGBO(0, 0, 0, 0.35 * tSalida),
                          ),
                        ),
                      ),

                    // Papelito que sale y se desenrolla
                    if (papelVisible)
                      Positioned(
                        top: lerpDouble(inicioPapel, destinoPapel, tSalida)!,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Transform.rotate(
                            angle: (1 - tSalida) * math.pi / 2,
                            alignment: Alignment.topCenter,
                            child: Transform.scale(
                              scale: lerpDouble(0.22, 1.0, tSalida)!,
                              alignment: Alignment.topCenter,
                              child: PapelitoDesenrollable(
                                promesa: _promesa,
                                color: _color,
                                progreso: _desenrollar.value,
                              ),
                            ),
                          ),
                        ),
                      ),

                    // Botón para volver
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 40,
                      child: IgnorePointer(
                        ignoring: _anim.value < 1,
                        child: Opacity(
                          opacity: _botones.value,
                          child: Center(
                            child: FilledButton.icon(
                              onPressed: _volverALaCajita,
                              icon: const Icon(Icons.inventory_2_outlined),
                              label: const Text('Volver a la cajita'),
                              style: FilledButton.styleFrom(
                                backgroundColor: Cajita.rojoOscuro,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Cajita de Promesas',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'serif',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Cajita.rojoOscuro,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Una promesa de Dios para tu día',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Color(0xFF8A5A44)),
        ),
      ],
    );
  }
}
