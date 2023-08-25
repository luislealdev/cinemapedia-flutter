import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<String> getLoadingMessage() {
      final messages = <String>[
        "Cargando películas...",
        "Comprando palomitas...",
        "Cargando populares...",
        "Llamado a la novia...",
        "Ya casi...",
        "Esto está tardando más de lo normal..."
      ];

      return Stream.periodic(const Duration(milliseconds: 2000), (step) {
        return messages[step];
      }).take(messages.length);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Espere por favor"),
          const SizedBox(height: 20),
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          StreamBuilder(
              stream: getLoadingMessage(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) return const Text("Cargando...");

                return Text(snapshot.data!);
              }))
        ],
      ),
    );
  }
}
