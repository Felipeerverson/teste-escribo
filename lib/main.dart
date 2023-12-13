import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  int resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soma de Divisíveis por 3 ou 5 Escribo'),
        backgroundColor: Color.fromARGB(255, 150, 175, 6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite um número'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calcularSomatorio();
              },
              child: Text('Calcular Somatório'),
            ),
            SizedBox(height: 32.0),
            Text('Resultado: $resultado'),
          ],
        ),
      ),
    );
  }

  void calcularSomatorio() {
    int numero = int.tryParse(_controller.text) ?? 0;
    setState(() {
      resultado = somatorioDivisiveisPor3ou5(numero);
    });
  }

  int somatorioDivisiveisPor3ou5(int numero) {
    int somatorio = 0;

    for (int i = 0; i < numero; i++) {
      if (i % 3 == 0 || i % 5 == 0) {
        somatorio += i;
      }
    }

    return somatorio;
  }
}
