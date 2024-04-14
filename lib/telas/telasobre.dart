import 'package:flutter/material.dart';
import 'package:flutter_lista_compras/telas/autenticacao_tela.dart';

class PaginaSobre extends StatelessWidget {
  const PaginaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
        backgroundColor: Color.fromARGB(255, 236, 236, 236),
      ),
      backgroundColor: const Color.fromARGB(255, 70, 184, 236),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Retornar à lista'),
            ),
            const SizedBox(height: 20),
           const Text(
              'Aplicativo desenvolvido para atuar como lista de compras. Auxiliando na hora para o individuo não esquecer nenhum item.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {return AutencicacaoTela();}),);
        },
        tooltip: 'Sair',
        child: const Icon(Icons.exit_to_app),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

