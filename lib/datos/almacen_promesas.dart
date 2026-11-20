import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'promesas.dart';

/// La promesa que salió hoy (posición en la lista y color del papelito).
class PromesaDelDia {
  const PromesaDelDia({required this.indice, required this.indiceColor});

  final int indice;
  final int indiceColor;

  Promesa get promesa => todasLasPromesas[indice];
  Color get color => coloresPapelitos[indiceColor];
}

/// Guarda en el celular qué promesa salió hoy y cuáles ya salieron,
/// para que haya una sola por día y no se repitan hasta salir todas.
class AlmacenPromesas {
  static const _kFecha = 'hoy_fecha';
  static const _kIndice = 'hoy_indice';
  static const _kColor = 'hoy_color';
  static const _kUsadas = 'promesas_usadas';

  static String _claveDeHoy() {
    final d = DateTime.now();
    return '${d.year}-${d.month}-${d.day}';
  }

  /// Devuelve la promesa de hoy si ya se sacó; si no, null.
  Future<PromesaDelDia?> promesaDeHoy() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(_kFecha) != _claveDeHoy()) return null;
    final indice = prefs.getInt(_kIndice);
    final color = prefs.getInt(_kColor);
    if (indice == null ||
        color == null ||
        indice >= todasLasPromesas.length ||
        color >= coloresPapelitos.length) {
      return null;
    }
    return PromesaDelDia(indice: indice, indiceColor: color);
  }

  /// Saca una promesa nueva al azar entre las que todavía no salieron.
  Future<PromesaDelDia> sacarPromesaNueva() async {
    final prefs = await SharedPreferences.getInstance();
    final azar = math.Random();

    final usadas = (prefs.getStringList(_kUsadas) ?? const <String>[])
        .map(int.tryParse)
        .whereType<int>()
        .toSet();

    var disponibles = [
      for (var i = 0; i < todasLasPromesas.length; i++)
        if (!usadas.contains(i)) i,
    ];
    if (disponibles.isEmpty) {
      // Ya salieron todas: se vuelve a llenar la cajita.
      usadas.clear();
      disponibles = List<int>.generate(todasLasPromesas.length, (i) => i);
    }

    final indice = disponibles[azar.nextInt(disponibles.length)];
    final color = azar.nextInt(coloresPapelitos.length);
    usadas.add(indice);

    await prefs.setStringList(
      _kUsadas,
      usadas.map((e) => e.toString()).toList(),
    );
    await prefs.setString(_kFecha, _claveDeHoy());
    await prefs.setInt(_kIndice, indice);
    await prefs.setInt(_kColor, color);

    return PromesaDelDia(indice: indice, indiceColor: color);
  }
}
