import 'package:flutter/material.dart';
import 'package:flutter_lista_compras/telas/autenticacao_tela.dart';

class PaginaSobre extends StatelessWidget {
  const PaginaSobre({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 70, 184, 236),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Aplicativo desenvolvido para atuar como lista de compras. Auxiliando na hora para o indivíduo não esquecer nenhum item.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 53, 53, 53),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: 'Retornar à página anterior',
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 16), // espaço dos botões
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AutencicacaoTela()),
              );
            },
            tooltip: 'Sair',
            child: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: const BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Desenvolvido por Gustavo Henrique P. C. Victal',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 51, 51, 51),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
