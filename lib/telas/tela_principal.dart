import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:questao_3/telas/tela_resultados.dart';
import '../components/card_padrao.dart';
import '../constantes.dart';
import '../components/botao_arredondado.dart';
import '../components/botao_inferior.dart';
import '../calculadora_imc.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int altura = 180;
  int peso = 60;
  int idade = 18;

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
        children: [
          Expanded(
            child: CardPadrao(
              cor: corCardPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ALTURA',
                    style: descricaoTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        altura.toString(),
                        style: numeroTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: descricaoTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: const Color(0xFFFF5822),
                    inactiveColor: const Color(0xFF8D8E98),
                    value: altura.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double novoValor) {
                      setState(() {
                        altura = novoValor.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardPadrao(
                    cor: corCardPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'PESO',
                          style: descricaoTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              peso.toString(),
                              style: numeroTextStyle,
                            ),
                            const Text(
                              'kg',
                              style: descricaoTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BotaoArredondado(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(() {
                                  peso--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            BotaoArredondado(
                              aoPressionar: () {
                                setState(() {
                                  peso++;
                                });
                              },
                              icone: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BotaoInferior(
            tituloBotao: 'CALCULAR',
            aoPressionar: () {
              CalculadoraIMC calc = CalculadoraIMC(altura: altura, peso: peso);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaResultados(
                    resultadoIMC: calc.calcularIMC(),
                    resultadoTexto: calc.obterResultado(),
                    interpretacao: calc.obterInterpretacao(),
                    resultadoImagem: calc.obterCaminhoImagem(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
