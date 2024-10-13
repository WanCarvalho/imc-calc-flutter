import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_padrao.dart';
import 'conteudo_icone.dart';
import 'constantes.dart';
import 'botao_arredondado.dart';

enum Sexo {
  masculino,
  feminino,
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Sexo? sexoSelecionado;
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
            child: Row(
              children: [
                Expanded(
                  child: CardPadrao(
                    aoPressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.masculino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.masculino
                        ? corMasculinoAtivaCardPadrao
                        : corMasculinoInativaCardPadrao,
                    filhoCartao: ConteudoIcone(
                      icone: FontAwesomeIcons.mars,
                      descricao: 'MASCULINO',
                    ),
                  ),
                ),
                Expanded(
                  child: CardPadrao(
                    aoPressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.feminino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.feminino
                        ? corFemininoAtivaCardPadrao
                        : corFemininoInativaCardPadrao,
                    filhoCartao: ConteudoIcone(
                      icone: FontAwesomeIcons.venus,
                      descricao: 'FEMININO',
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                Expanded(
                  child: CardPadrao(
                    cor: corCardPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'IDADE',
                          style: descricaoTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              idade.toString(),
                              style: numeroTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BotaoArredondado(icone: FontAwesomeIcons.minus, aoPressionar: (){
                              setState(() {
                                idade--;
                              });
                            }),
                            const SizedBox(width: 10.0,),
                            BotaoArredondado(icone: FontAwesomeIcons.plus, aoPressionar: (){
                              setState(() {
                                idade++;
                              });
                            })
                          ],
                        ),
                      ],
                    ),
                  ),
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