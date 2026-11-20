const _dias = [
  'lunes',
  'martes',
  'miércoles',
  'jueves',
  'viernes',
  'sábado',
  'domingo',
];

const _meses = [
  'enero',
  'febrero',
  'marzo',
  'abril',
  'mayo',
  'junio',
  'julio',
  'agosto',
  'septiembre',
  'octubre',
  'noviembre',
  'diciembre',
];

/// Ej.: "Jueves 19 de noviembre"
String fechaEnEspanol(DateTime d) {
  final dia = _dias[d.weekday - 1];
  return '${dia[0].toUpperCase()}${dia.substring(1)} ${d.day} de '
      '${_meses[d.month - 1]}';
}
