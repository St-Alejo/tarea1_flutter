import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  // Controladores para leer lo que escribe el usuario
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();

  // Variable de estado donde guardamos el resultado
  double resultado = 0;

  // Función para sumar
  void sumar() {
    final n1 = double.tryParse(numero1Controller.text);
    final n2 = double.tryParse(numero2Controller.text);

    if (n1 != null && n2 != null) {
      setState(() {
        resultado = n1 + n2;
      });
    }
  }

  // Función para restar
  void restar() {
    final n1 = double.tryParse(numero1Controller.text);
    final n2 = double.tryParse(numero2Controller.text);

    if (n1 != null && n2 != null) {
      setState(() {
        resultado = n1 - n2;
      });
    }
  }
  void multiplicar(){
    final n1 = double.tryParse(numero1Controller.text);
    final n2 = double.tryParse(numero2Controller.text);

    if (n1 != null && n2 != null) {
      setState(() {
        resultado = n1 * n2;
      });
    }
  }
  void dividir() {
    final n1 = double.tryParse(numero1Controller.text);
    final n2 = double.tryParse(numero2Controller.text);

    if (n1 != null && n2 != null){
      setState(() {
        resultado = n1 / n2;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora básica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo número 1
            TextField(
              controller: numero1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Campo número 2
            TextField(
              controller: numero2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            // Botones
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: sumar,
                  child: const Text('Sumar'),
                ),
                ElevatedButton(
                  onPressed: restar,
                  child: const Text('Restar'),
                ),
                ElevatedButton(
                    onPressed: multiplicar,
                    child: const Text("Multiplicar")
                ),
                ElevatedButton(
                    onPressed: dividir,
                    child: const Text("Dividir"))
              ],
            ),
            const SizedBox(height: 30),

            // Resultado en pantalla
            Text(
              'Resultado: $resultado',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
