import 'dart:math';

class CalculadoraIMC {
  CalculadoraIMC({required this.altura, required this.peso});

  final int altura;
  final int peso;
  late double _imc;

  String calcularIMC() {
    _imc = peso / pow(altura / 100, 2);

    return _imc.toStringAsFixed(1);
  }

  String obterResultado() {
    if (_imc >= 25 && _imc < 30) {
      return 'Sobrepeso';
    } else if (_imc >= 30 && _imc < 35) {
      return 'Obesidade Grau I';
    } else if (_imc >= 35 && _imc < 40) {
      return 'Obesidade Grau II';
    } else if (_imc >= 40) {
      return 'Obesidade Mórbida';
    } else if (25 > _imc && _imc >= 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  String obterInterpretacao() {
    if (_imc >= 40) {
      return 'Sua saúde pode estar em risco. Considere buscar orientação médica para um plano de emagrecimento.';
    } else if (_imc >= 35 && _imc < 40) {
      return 'É importante fazer mudanças em sua dieta e estilo de vida. Considere consultar um profissional de saúde.';
    } else if (_imc >= 30 && _imc < 35) {
      return 'Você está acima do peso ideal. A prática de exercícios e uma alimentação saudável podem ajudar.';
    } else if (_imc >= 25 && _imc < 30) {
      return 'Você está próximo do limite de sobrepeso. Tente incorporar mais atividades físicas em sua rotina.';
    } else if (_imc < 25 && _imc >= 18.5) {
      return 'Excelente! O seu peso está normal. Continue mantendo hábitos saudáveis.';
    } else {
      return 'Você pode precisar ganhar peso. Tente incluir mais calorias em sua dieta e, se possível, consulte um profissional de saúde.';
    }
  }

  String obterCaminhoImagem() {
    if (_imc >= 40) {
      return 'images/obesidade-morbida.png';
    } else if (_imc >= 35 && _imc < 40) {
      return 'images/obesidade-grau-2.png';
    } else if (_imc >= 30 && _imc < 35) {
      return 'images/obesidade-grau-1.png';
    } else if (_imc >= 25 && _imc < 30) {
      return 'images/sobrepeso.png';
    } else if (_imc < 25 && _imc >= 18.5) {
      return 'images/peso-normal.png';
    } else {
      return 'images/abaixo-peso.png';
    }
  }
}
