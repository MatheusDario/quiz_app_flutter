import 'package:flutter/material.dart';
import 'package:quiz_app/controller.dart';

Controller perguntasController = Controller();

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
  List<Icon> iconsCertoErrado = [
    Icon(
      Icons.check,
      color: Colors.greenAccent,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
  ];



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
                setState(() {
                  bool respostaCorreta = perguntasController.obterResposta();
                  if (respostaCorreta == true) {
                    print('Usuario acertou');
                  } else {
                    print('Usuario errou');
                  }
                  perguntasController.proximaPergunta();
                });
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
                setState(() {
                  bool respostaCorreta = perguntasController.obterResposta();
                  if (respostaCorreta == false) {
                    print('Usuario acertou');
                  } else {
                    print('Usuario errou');
                  }
                  perguntasController.proximaPergunta();
                });
              },
              child: Text(
                'Falso',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Row(children: iconsCertoErrado)
      ],
    );
  }
}
