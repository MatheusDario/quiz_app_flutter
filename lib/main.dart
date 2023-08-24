import 'package:flutter/material.dart';
import 'package:quiz_app/controller.dart';
import 'package:quiz_app/pontos.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Controller perguntasController = Controller();
Pontos pontosCertoErrado = Pontos();

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> marcadorPontos = [];

  void conferirResposta(bool respostaSelecionadaUsuario) {
    setState(() {
      if(perguntasController.confereFimExecucao()) {
        Alert(context: context, title: "Fim do Quiz", desc: "Você respondeu a todas as perguntas").show();
        perguntasController.numQuestao = 0;
        marcadorPontos = [];
      }

    bool respostaCorreta = perguntasController.obterResposta();
    if (respostaSelecionadaUsuario == respostaCorreta) {
      marcadorPontos.add(pontosCertoErrado.iconCerto());
    } else {
      marcadorPontos.add(pontosCertoErrado.iconErrado());
    }
      perguntasController.proximaPergunta();
    print(perguntasController.confereFimExecucao());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  perguntasController.obterPerguntas(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade700, // Background color
              ),
              onPressed: () {
                conferirResposta(true);
              },
              child: Text(
                'Verdadeiro',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade800, // Background color
              ),
              onPressed: () {
                conferirResposta(false);
              },
              child: Text(
                'Falso',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Row(children: marcadorPontos)
      ],
    );
  }
}
