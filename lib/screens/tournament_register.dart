import 'package:flutter/material.dart';
import 'package:tournament_manager/screens/square_tournament_screen.dart';

class TournamentRegisterView extends StatefulWidget {
  const TournamentRegisterView({
    super.key,
    required this.jugadoresRegistrados,
  });

  final int jugadoresRegistrados;

  @override
  State<TournamentRegisterView> createState() => _TournamentRegisterViewState();
}

class _TournamentRegisterViewState extends State<TournamentRegisterView> {
  List<TextEditingController> nombres = [TextEditingController()];

  List<TextEditingController> apellidos = [TextEditingController()];

  List listaNombres = List.filled(100, '');

  List listaApellidos = List.filled(100, '');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('${widget.jugadoresRegistrados}'),
            SizedBox(
              height: size.height * 0.5,
              child: ListView.builder(
                itemCount: widget.jugadoresRegistrados,
                itemBuilder: (BuildContext context, int index) {
                  nombres.add(
                    TextEditingController(),
                  );
                  apellidos.add(
                    TextEditingController(),
                  );
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: size.width * 0.45,
                        child: TextField(
                          controller: nombres.elementAt(index),
                          onChanged: (value) {
                            setState(() {
                              listaNombres[index] = value;
                            });
                          },
                          onSubmitted: (value) {
                            setState(() {
                              //listaNombres[index] = value;
                            });
                          },
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Nombre(s)',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.45,
                        child: TextField(
                          controller: apellidos.elementAt(index),
                          onChanged: (value) {
                            setState(() {
                              listaApellidos[index] = value;
                            });
                          },
                          onSubmitted: (value) {
                            setState(() {
                              //listaApellidos[index] = value;
                            });
                          },
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Apellido',
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: widget.jugadoresRegistrados,
                itemBuilder: (BuildContext context, int index) => Text(
                    'Jugador ${index + 1}: ${listaNombres.elementAt(index)} ${listaApellidos.elementAt(index)}'),
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SquareTournamentView(
                    nombres: listaNombres,
                    apellidos: listaApellidos,
                    totalJugadores: widget.jugadoresRegistrados,
                  ),
                ),
              ),
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
