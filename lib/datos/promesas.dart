import 'package:flutter/material.dart';

/// Una promesa: el versículo (Reina-Valera 1960) y su cita.
/// En la etapa 2 se agrega la explicación y la lista completa.
class Promesa {
  const Promesa({required this.texto, required this.cita});

  final String texto;
  final String cita;
}

/// Promesas de muestra para probar la cajita (etapa 1).
const List<Promesa> promesasDeMuestra = [
  Promesa(
    texto: 'No temas, porque yo estoy contigo; no desmayes, porque yo soy tu '
        'Dios que te esfuerzo; siempre te ayudaré, siempre te sustentaré con '
        'la diestra de mi justicia.',
    cita: 'Isaías 41:10',
  ),
  Promesa(
    texto: 'Porque yo sé los pensamientos que tengo acerca de vosotros, dice '
        'Jehová, pensamientos de paz, y no de mal, para daros el fin que '
        'esperáis.',
    cita: 'Jeremías 29:11',
  ),
  Promesa(
    texto: 'Mi Dios, pues, suplirá todo lo que os falta conforme a sus '
        'riquezas en gloria en Cristo Jesús.',
    cita: 'Filipenses 4:19',
  ),
  Promesa(
    texto: 'Venid a mí todos los que estáis trabajados y cargados, y yo os '
        'haré descansar.',
    cita: 'Mateo 11:28',
  ),
  Promesa(
    texto: 'Dios es nuestro amparo y fortaleza, nuestro pronto auxilio en las '
        'tribulaciones.',
    cita: 'Salmos 46:1',
  ),
  Promesa(
    texto: 'Mira que te mando que te esfuerces y seas valiente; no temas ni '
        'desmayes, porque Jehová tu Dios estará contigo en dondequiera que '
        'vayas.',
    cita: 'Josué 1:9',
  ),
  Promesa(
    texto: 'Jehová es mi pastor; nada me faltará.',
    cita: 'Salmos 23:1',
  ),
];

/// Colores de los papelitos, como en las cajitas de verdad.
const List<Color> coloresPapelitos = [
  Color(0xFFF7A8BC), // rosa
  Color(0xFF9FD3F0), // celeste
  Color(0xFFFFD86E), // amarillo
  Color(0xFFAEE0A4), // verde
  Color(0xFFCDB4F0), // lila
  Color(0xFFFFBC8A), // naranja
];
