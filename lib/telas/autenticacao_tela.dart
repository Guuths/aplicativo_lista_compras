
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lista_compras/comum/minhas_cores.dart';
import 'package:flutter_lista_compras/telas/lista_compras.dart';

class AutencicacaoTela extends StatefulWidget {
  const AutencicacaoTela({super.key});

  @override
  State<AutencicacaoTela> createState() => _AutencicacaoTelaState();
}

class _AutencicacaoTelaState extends State<AutencicacaoTela> {
  bool queroEntrar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
              MinhasCores.azulTopoGradiente,
              MinhasCores.azulBaixoGradiente,
            ],
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/carrinho.png", height: 128),
                      const Text(
                        "ListSell",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(decoration: const InputDecoration(label: Text("Email:")
                      ),
                      ),
                      TextFormField(decoration: const InputDecoration(label: Text("Senha:")
                      ),
                      obscureText: true,
                      ),
                      Visibility(visible: !queroEntrar, child: Column(
                        children: [
                           TextFormField(decoration: const InputDecoration(label: Text("Confirme a senha:")
                      ),  
                            obscureText: true,
                          ),
                          TextFormField(decoration: const InputDecoration(label: Text("Nome:")
                      ),
                      ),
                        ],
                        ),
                        ),
                  
                      const SizedBox(height: 11),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {return PaginaListaCompras();}),);
                      }, child: Text((queroEntrar)? "ENTRAR": "CADASTRAR"),
                      ),
                      const Divider(),
                        TextButton(onPressed: (){
                          setState(() {
                            queroEntrar = !queroEntrar;
                          });
                        }, child: Text((queroEntrar)? "CADASTRAR" : "Ja tem uma conta? Entre")),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]
        ),
    );
  }
}