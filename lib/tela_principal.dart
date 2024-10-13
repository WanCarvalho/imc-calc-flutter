import 'package:flutter/material.dart';

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
                  child: CardPadrao(cor: const Color(0xFFE9E9E9))
                ),
                Expanded(
                  child: CardPadrao(cor: const Color(0xFFE9E9E9))
                ),
              ],
            ),
          ),
          Expanded(
            child: CardPadrao(cor: const Color(0xFFE9E9E9))
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardPadrao(cor: const Color(0xFFE9E9E9))
                ),
                Expanded(
                  child: CardPadrao(cor: const Color(0xFFE9E9E9)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardPadrao extends StatelessWidget {
  CardPadrao({required this.cor});
  
  Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cor,
      ),
    );
  }
}