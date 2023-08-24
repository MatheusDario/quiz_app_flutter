import 'perguntas.dart';

class Controller {

  int numQuestao = 0;

  List<Perguntas> _listaPerguntas = [
    Perguntas(q:'O metrô é um dos meios de transporte mais seguros do mundo.',r:  true),
    Perguntas(q: 'A culinária brasileira é uma das melhores do mundo.',r:  true),
    Perguntas(q: 'Vacas podem voar, assim como peixes utilizam os pés para andar.', r: false),
    Perguntas(q: 'A maioria dos peixes podem viver fora da água.', r: false),
    Perguntas(q: 'A lâmpada foi inventada por um brasileiro.', r: false),
    Perguntas(q: 'É possível utilizar a carteira de habilitação de carro para dirigir um avião.', r: false),
    Perguntas(q: 'O Brasil possui 26 estados e 1 Distrito Federal.', r: true),
    Perguntas(q: 'Bitcoin é o nome dado a uma das moedas virtuais mais famosas.', r: true),
    Perguntas(q: '1 minuto equivale a 60 segundos.', r: true),
    Perguntas(q: '1 segundo equivale a 200 milissegundos.', r: false),
    Perguntas(q: 'O Burj Khalifa, em Dubai, é considerado o maior prédio do mundo.', r: true),
    Perguntas(q: 'Ler após uma refeição prejudica a visão humana.', r: false),
    Perguntas(q: 'O cartão de crédito pode ser considerado uma moeda virtual.', r: false),
  ];

  void proximaPergunta() {
    if(numQuestao < _listaPerguntas.length -1) {
      numQuestao++;
    }
    print(numQuestao);
    print(_listaPerguntas.length);
  }


  String obterPerguntas() {
    return _listaPerguntas[numQuestao].questao;
  }

  bool obterResposta() {
    return _listaPerguntas[numQuestao].resposta;
  }


}