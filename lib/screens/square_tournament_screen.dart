import 'package:flutter/material.dart';

class SquareTournamentView extends StatefulWidget {
  SquareTournamentView({
    super.key,
    required this.nombres,
    required this.apellidos,
    required this.totalJugadores,
  });

  final List nombres;
  final List apellidos;
  final int totalJugadores;

  @override
  State<SquareTournamentView> createState() => _SquareTournamentViewState();
}

class _SquareTournamentViewState extends State<SquareTournamentView> {
  bool resultadoUno = false;

  bool resultadoDos = false;

  String primerResultado = '';

  String segundoResultado = '';

  double scoreUno = 0;

  double scoreDos = 0;

  double scoreTres = 0;

  double scoreCuatro = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ronda 1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Jugador 1 vs Jugador 4:'),
              FilledButton(
                onPressed: () {
                  setState(() {
                    scoreCuatro = 0;
                    scoreUno = 0;
                    scoreUno += 1;
                    resultadoUno = true;
                    primerResultado = '1 - 0';
                  });
                },
                child: const Text('1-0'),
              ),
              FilledButton(
                onPressed: () {
                  setState(() {
                    scoreUno = 0;
                    scoreUno += 0.5;
                    scoreCuatro = 0;
                    scoreCuatro += 0.5;
                    resultadoUno = true;
                    primerResultado = '1/2 - 1/2';
                  });
                },
                child: const Text('1/2-1/2'),
              ),
              FilledButton(
                onPressed: () {
                  setState(() {
                    scoreCuatro = 0;
                    scoreUno = 0;
                    scoreCuatro += 1;
                    resultadoUno = true;
                    primerResultado = '0 - 1';
                  });
                },
                child: const Text('0-1'),
              ),
            ],
          ),
          Text(
            primerResultado,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Jugador 2 vs Jugador 3:'),
              FilledButton(
                onPressed: () {
                  setState(() {
                    scoreDos = 0;
                    scoreTres = 0;
                    scoreDos += 1;
                    resultadoDos = true;
                    segundoResultado = '1 - 0';
                  });
                },
                child: const Text('1-0'),
              ),
              FilledButton(
                onPressed: () {
                  setState(() {
                    scoreDos = 0;
                    scoreTres = 0;
                    scoreDos += 0.5;
                    scoreTres += 0.5;
                    resultadoDos = true;
                    segundoResultado = '1/2 - 1/2';
                  });
                },
                child: const Text('1/2-1/2'),
              ),
              FilledButton(
                onPressed: () {
                  setState(() {
                    scoreDos = 0;
                    scoreTres = 0;
                    scoreTres += 1;
                    resultadoDos = true;
                    segundoResultado = '0 - 1';
                  });
                },
                child: const Text('0-1'),
              ),
            ],
          ),
          Text(
            segundoResultado,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          (resultadoUno)
              ? (resultadoDos)
                  ? FilledButton(
                      onPressed: () {},
                      child: Text('Siguiente ronda'),
                    )
                  : const SizedBox()
              : const SizedBox(),
        ],
      ),
    );
  }
}
