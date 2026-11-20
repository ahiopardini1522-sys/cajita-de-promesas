import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../datos/promesas.dart';
import '../widgets/cajita.dart';
import '../widgets/tarjeta_promesa.dart';

/// Pantalla para elegir un diseño, guardar la imagen o compartirla.
class PantallaImagen extends StatefulWidget {
  const PantallaImagen({
    super.key,
    required this.promesa,
    required this.color,
  });

  final Promesa promesa;
  final Color color;

  @override
  State<PantallaImagen> createState() => _PantallaImagenState();
}

class _PantallaImagenState extends State<PantallaImagen> {
  final _clave = GlobalKey();
  int _estilo = 0;
  bool _trabajando = false;

  /// Convierte la tarjeta en una imagen PNG de 1080 px de ancho.
  Future<Uint8List> _crearPng() async {
    final boundary =
        _clave.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final imagen =
        await boundary.toImage(pixelRatio: 1080 / boundary.size.width);
    final datos = await imagen.toByteData(format: ui.ImageByteFormat.png);
    imagen.dispose();
    return datos!.buffer.asUint8List();
  }

  void _aviso(String texto) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(texto)));
  }

  Future<void> _guardar() async {
    if (_trabajando) return;
    setState(() => _trabajando = true);
    try {
      if (!await Gal.hasAccess(toAlbum: true)) {
        final permitido = await Gal.requestAccess(toAlbum: true);
        if (!permitido) {
          _aviso('Hace falta permiso para guardar en la galería.');
          return;
        }
      }
      final bytes = await _crearPng();
      await Gal.putImageBytes(bytes, album: 'Cajita de Promesas');
      _aviso('¡Imagen guardada en la galería!');
    } catch (_) {
      _aviso('No se pudo guardar la imagen.');
    } finally {
      if (mounted) setState(() => _trabajando = false);
    }
  }

  Future<void> _compartir() async {
    if (_trabajando) return;
    setState(() => _trabajando = true);
    try {
      final bytes = await _crearPng();
      final carpeta = await getTemporaryDirectory();
      final archivo = File(
        '${carpeta.path}/promesa_${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await archivo.writeAsBytes(bytes);
      await Share.shareXFiles(
        [XFile(archivo.path, mimeType: 'image/png')],
        text: widget.promesa.cita,
      );
    } catch (_) {
      _aviso('No se pudo compartir la imagen.');
    } finally {
      if (mounted) setState(() => _trabajando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final estilos = estilosPara(widget.color);
    final estilo = estilos[_estilo];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6EA),
      appBar: AppBar(
        title: const Text(
          'Crear imagen',
          style: TextStyle(fontFamily: 'serif', fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Cajita.rojoOscuro,
        elevation: 0,
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Vista previa
            Expanded(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40000000),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: RepaintBoundary(
                      key: _clave,
                      child: TarjetaPromesa(
                        promesa: widget.promesa,
                        estilo: estilo,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Selector de diseño
            const SizedBox(height: 8),
            Text(
              'Diseño: ${estilo.nombre}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF8A5A44),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < estilos.length; i++)
                  GestureDetector(
                    onTap: () => setState(() => _estilo = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 7),
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: estilos[i].fondo,
                        ),
                        border: Border.all(
                          color: i == _estilo
                              ? Cajita.rojoOscuro
                              : const Color(0x33000000),
                          width: i == _estilo ? 3 : 1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // Botones
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _trabajando ? null : _guardar,
                      icon: const Icon(Icons.download_rounded),
                      label: const Text('Guardar'),
                      style: FilledButton.styleFrom(
                        backgroundColor: Cajita.rojoOscuro,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _trabajando ? null : _compartir,
                      icon: const Icon(Icons.share_rounded),
                      label: const Text('Compartir'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Cajita.rojoOscuro,
                        side: const BorderSide(
                          color: Cajita.rojoOscuro,
                          width: 1.5,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
