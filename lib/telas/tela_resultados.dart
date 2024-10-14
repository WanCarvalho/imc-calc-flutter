import 'package:flutter/material.dart';
import 'package:questao_3/components/card_padrao.dart';
import 'package:questao_3/constantes.dart';
import '../components/botao_inferior.dart';

class TelaResultados extends StatelessWidget {
  TelaResultados(
      {required this.resultadoIMC,
      required this.resultadoTexto,
      required this.interpretacao});

  final String resultadoIMC;
  final String resultadoTexto;
  final String interpretacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CALCULADORA IMC',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Resultado',
                style: tituloTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardPadrao(
              cor: corCardPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultadoTexto.toUpperCase(),
                    style: resultadoTextStyle,
                  ),
                  Text(
                    resultadoIMC,
                    style: imcTextStyle,
                  ),
                  Text(
                    interpretacao,
                    textAlign: TextAlign.center,
                    style: corpoTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BotaoInferior(
              aoPressionar: () {
                Navigator.pop(context);
              },
              tituloBotao: 'RECALCULAR'),
        ],
      ),
    );
  }
}
