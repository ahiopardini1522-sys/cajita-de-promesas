import 'package:flutter/material.dart';

import '../datos/promesas.dart';

/// Un diseño de fondo y colores para la imagen.
class EstiloTarjeta {
  const EstiloTarjeta({
    required this.nombre,
    required this.fondo,
    required this.texto,
    required this.acento,
  });

  final String nombre;
  final List<Color> fondo;
  final Color texto;
  final Color acento;
}

/// Los estilos disponibles. El primero usa el color del papelito que salió.
List<EstiloTarjeta> estilosPara(Color colorPapel) => [
      EstiloTarjeta(
        nombre: 'Papelito',
        fondo: [Color.lerp(colorPapel, Colors.white, 0.6)!, colorPapel],
        texto: const Color(0xFF3B2A20),
        acento: Color.lerp(colorPapel, Colors.black, 0.5)!,
      ),
      const EstiloTarjeta(
        nombre: 'Noche',
        fondo: [Color(0xFF1B2440), Color(0xFF3A2E5C)],
        texto: Color(0xFFFFF6E5),
        acento: Color(0xFFE8C26A),
      ),
      const EstiloTarjeta(
        nombre: 'Amanecer',
        fondo: [Color(0xFFFFD3A5), Color(0xFFFD8A8A)],
        texto: Color(0xFF3B1E2B),
        acento: Color(0xFF7E1A2A),
      ),
      const EstiloTarjeta(
        nombre: 'Pergamino',
        fondo: [Color(0xFFFFF8EC), Color(0xFFF1DDBB)],
        texto: Color(0xFF3B2A20),
        acento: Color(0xFF9A6B2F),
      ),
      const EstiloTarjeta(
        nombre: 'Cielo',
        fondo: [Color(0xFFD4ECFB), Color(0xFF7FAEE6)],
        texto: Color(0xFF0F2540),
        acento: Color(0xFF173A6B),
      ),
    ];

/// La tarjeta que se convierte en imagen (formato 4:5, ideal para estados).
class TarjetaPromesa extends StatelessWidget {
  const TarjetaPromesa({
    super.key,
    required this.promesa,
    required this.estilo,
  });

  final Promesa promesa;
  final EstiloTarjeta estilo;

  @override
  Widget build(BuildContext context) {
    final largo = promesa.texto.length;
    final tamano = largo > 180
        ? 19.0
        : largo > 110
            ? 22.0
            : 26.0;

    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: estilo.fondo,
          ),
        ),
        child: Stack(
          children: [
            // Marco fino
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: estilo.acento.withAlpha(110),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(34, 30, 34, 26),
              child: Column(
                children: [
                  Text(
                    '✦',
                    style: TextStyle(fontSize: 22, color: estilo.acento),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, medidas) => Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SizedBox(
                            width: medidas.maxWidth,
                            child: Text(
                              '“${promesa.texto}”',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'serif',
                                fontSize: tamano,
                                height: 1.4,
                                fontStyle: FontStyle.italic,
                                color: estilo.texto,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    promesa.cita,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: estilo.acento,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'CAJITA DE PROMESAS',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 2.5,
                      color: estilo.texto.withAlpha(150),
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
