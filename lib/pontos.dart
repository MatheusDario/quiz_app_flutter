import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pontos {
  List<Icon> _iconsCertoErrado = [
    Icon(
      Icons.check,
      color: Colors.greenAccent,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
  ];

  Icon iconCerto() {
    return _iconsCertoErrado[0];
  }

  Icon iconErrado() {
    return _iconsCertoErrado[1];
  }
}