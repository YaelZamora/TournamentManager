import 'package:flutter/material.dart';
import 'package:tournament_manager/screens/tournament_register.dart';

class SelectTypeView extends StatefulWidget {
  const SelectTypeView({super.key});

  @override
  State<SelectTypeView> createState() => _SelectTypeViewState();
}

class _SelectTypeViewState extends State<SelectTypeView> {
  bool seleccionado = false;
  int cantidadElegida = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tournament Manager'),
      ),
      body: SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  seleccionado = !seleccionado;
                });
              },
              child: const Text('Round Robin'),
            ),
            FilledButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Disponible próximamente'),
                  action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Suizo'),
            ),
            (seleccionado) ? seleccionDeJugadores() : const SizedBox(),
            Text(
              'Jugadores registrados: $cantidadElegida',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => TournamentRegisterView(
                    jugadoresRegistrados: cantidadElegida,
                  ),
                ),
              ),
              child: const Text('Pasar al registro de usuarios'),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<int> seleccionDeJugadores() {
    return PopupMenuButton(
      initialValue: cantidadElegida,
      onSelected: (value) {
        setState(() {
          cantidadElegida = value;
        });
      },
      itemBuilder: (BuildContext context) => const [
        PopupMenuItem(
          value: 3,
          child: Text('3'),
        ),
        PopupMenuItem(
          value: 4,
          child: Text('4'),
        ),
        PopupMenuItem(
          value: 5,
          child: Text('5'),
        ),
        PopupMenuItem(
          value: 6,
          child: Text('6'),
        ),
      ],
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Seleccionar número de jugadores',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
