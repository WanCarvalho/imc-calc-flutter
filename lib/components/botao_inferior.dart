import 'package:flutter/material.dart';
import '../constantes.dart';

class BotaoInferior extends StatelessWidget {
  BotaoInferior({required this.aoPressionar, required this.tituloBotao});

  final VoidCallback aoPressionar;
  final String tituloBotao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        color: corContainerInferior,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: alturaContainerInferior,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            tituloBotao,
            style: botaoGrandeTextStyle,
          ),
        ),
      ),
    );
  }
}