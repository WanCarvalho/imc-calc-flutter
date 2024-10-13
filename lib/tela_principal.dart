import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_padrao.dart';
import 'conteudo_icone.dart';

const alturaContainerInferior = 80.0;
const corCardPadrao = Color(0xFFE9E9E9);
const corContainerInferior = Color(0xFFFF5822);

const corMasculinoInativaCardPadrao = Colors.lightBlueAccent;
const corFemininoInativaCardPadrao = const Color.fromARGB(255, 236, 87, 137);

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Color corMasculinoCardPadrao = corMasculinoInativaCardPadrao;
  Color corFemininoCardPadrao = corFemininoInativaCardPadrao;

  // 1 -> masculino
  // 2 -> feminino
  void atualizarCor(int sexo) {
    if (sexo == 1) { // checa se card masculino foi pressionado
      if (corMasculinoCardPadrao == corMasculinoInativaCardPadrao) {
        corMasculinoCardPadrao = const Color.fromARGB(255, 22, 138, 192);
        corFemininoCardPadrao = corFemininoInativaCardPadrao;
      } else {
        corMasculinoCardPadrao = corMasculinoInativaCardPadrao;
      }
    } else if (sexo == 2) { // checa se card feminino foi pressionado
      if (corFemininoCardPadrao == corFemininoInativaCardPadrao) {
        corFemininoCardPadrao = const Color.fromARGB(255, 209, 43, 98);
        corMasculinoCardPadrao = corMasculinoInativaCardPadrao;
      } else {
        corFemininoCardPadrao = corFemininoInativaCardPadrao;
      }
    }
  }

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        atualizarCor(1);
                      });
                    },
                    child: CardPadrao(
                      cor: corMasculinoCardPadrao,
                      filhoCartao: ConteudoIcone(
                        icone: FontAwesomeIcons.mars,
                        descricao: 'MASCULINO',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        atualizarCor(2);
                      });
                    },
                    child: CardPadrao(
                      cor: corFemininoCardPadrao,
                      filhoCartao: ConteudoIcone(
                        icone: FontAwesomeIcons.venus,
                        descricao: 'FEMININO',
                      ),
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
