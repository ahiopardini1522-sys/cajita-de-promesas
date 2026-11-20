import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../datos/almacen_promesas.dart';
import '../utilidades/fecha.dart';
import '../widgets/cajita.dart';
import '../widgets/papelito.dart';
import 'pantalla_imagen.dart';

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

  final _almacen = AlmacenPromesas();
  PromesaDelDia? _hoy;
  PromesaDelDia _mostrada = const PromesaDelDia(indice: 0, indiceColor: 0);
  bool _ocupado = false;

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
    _cargarHoy();
  }

  Future<void> _cargarHoy() async {
    final hoy = await _almacen.promesaDeHoy();
    if (!mounted) return;
    setState(() => _hoy = hoy);
  }

  @override
  void dispose() {
    _anim.dispose();
    _respirar.dispose();
    super.dispose();
  }

  Future<void> _tocarCajita() async {
    if (!_anim.isDismissed || _ocupado) return;
    _ocupado = true;
    HapticFeedback.mediumImpact();
    try {
      // Si hoy ya salió una, se vuelve a mostrar la misma.
      final yaSalio = await _almacen.promesaDeHoy();
      final elegida = yaSalio ?? await _almacen.sacarPromesaNueva();
      if (!mounted) return;
      setState(() {
        _hoy = elegida;
        _mostrada = elegida;
      });
      _anim.forward();
    } finally {
      _ocupado = false;
    }
  }

  void _crearImagen() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => PantallaImagen(
          promesa: _mostrada.promesa,
          color: _mostrada.color,
        ),
      ),
    );
  }

  void _verReflexion() {
    final promesa = _mostrada.promesa;
    final color = _mostrada.color;
    final oscuro = Color.lerp(color, Colors.black, 0.5)!;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFFFFBF5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        final medidas = MediaQuery.of(context);
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: medidas.size.height * 0.8),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              24,
              12,
              24,
              28 + medidas.padding.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.menu_book_rounded, color: oscuro),
                    const SizedBox(width: 8),
                    Text(
                      'Reflexión',
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: oscuro,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color.lerp(color, Colors.white, 0.65),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '“${promesa.texto}”',
                        style: const TextStyle(
                          fontFamily: 'serif',
                          fontSize: 17,
                          height: 1.4,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF3B2A20),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        promesa.cita,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: oscuro,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  promesa.explicacion,
                  style: const TextStyle(
                    fontSize: 17,
                    height: 1.55,
                    color: Color(0xFF3B2A20),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
                          onTap: _tocarCajita,
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
                        child: Text(
                          _hoy == null
                              ? 'Tocá la cajita para sacar tu promesa de hoy'
                              : 'Ya sacaste tu promesa de hoy.\n'
                                  'Tocá la cajita para volver a leerla.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
                                promesa: _mostrada.promesa,
                                color: _mostrada.color,
                                progreso: _desenrollar.value,
                                fecha: fechaEnEspanol(DateTime.now()),
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
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 12,
                            runSpacing: 10,
                            children: [
                              FilledButton.icon(
                                onPressed: _verReflexion,
                                icon: const Icon(Icons.menu_book_rounded),
                                label: const Text('Reflexión'),
                                style: FilledButton.styleFrom(
                                  backgroundColor: Cajita.dorado,
                                  foregroundColor: const Color(0xFF3B2A20),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                ),
                              ),
                              FilledButton.icon(
                                onPressed: _crearImagen,
                                icon: const Icon(Icons.image_rounded),
                                label: const Text('Imagen'),
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Cajita.rojoOscuro,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                ),
                              ),
                              FilledButton.icon(
                                onPressed: _volverALaCajita,
                                icon: const Icon(Icons.inventory_2_outlined),
                                label: const Text('Volver'),
                                style: FilledButton.styleFrom(
                                  backgroundColor: Cajita.rojoOscuro,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                ),
                              ),
                            ],
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
