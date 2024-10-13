import 'package:flutter/material.dart';

const descricaoTextStyle = TextStyle(fontSize: 20.0, color: Colors.black);

class ConteudoIcone extends StatelessWidget {
  ConteudoIcone({
    this.descricao,
    this.icone,
  });

  final IconData? icone;
  final String? descricao;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icone,
          size: 85.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          descricao ?? '',
          style: descricaoTextStyle,
        ),
      ],
    );
  }
}