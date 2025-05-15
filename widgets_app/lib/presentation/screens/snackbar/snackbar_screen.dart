import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar-screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackback = SnackBar(
      content: const Text('Hola desde el snackbar!'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          // Acción a realizar al presionar el botón
        },
      ),
      duration: const Duration(milliseconds: 2000),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackback,
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hola'),
          content: const Text('Este es un dialogo de ejemplo'),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Cerrar')
            ),
            FilledButton(onPressed: () {}, child: const Text('Aceptar')),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogs'),
      ),
      body: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: const [
                    Text('lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                    Text('Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                  ]
                );
              },
              child: const Text('Licencias usadas')
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar dialogo')
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}