import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_padrao.dart';
import 'conteudo_icone.dart';

const alturaContainerInferior = 80.0;
const corCardPadrao = Color(0xFFE9E9E9);
const corContainerInferior = Color(0xFFFF5822);

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
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
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardPadrao(
                    cor: corCardPadrao,
                    filhoCartao: ConteudoIcone(
                      icone: FontAwesomeIcons.mars,
                      descricao: 'MASCULINO',
                    ),
                  ),
                ),
                Expanded(
                  child: CardPadrao(
                    cor: corCardPadrao,
                    filhoCartao: ConteudoIcone(
                      icone: FontAwesomeIcons.venus,
                      descricao: 'FEMININO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: CardPadrao(cor: corCardPadrao)),
          Expanded(
            child: Row(
              children: [
                Expanded(child: CardPadrao(cor: corCardPadrao)),
                Expanded(
                  child: CardPadrao(cor: corCardPadrao),
                ),
              ],
            ),
          ),
          Container(
            color: corContainerInferior,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: alturaContainerInferior,
          ),
        ],
      ),
    );
  }
}