import 'package:flutter/material.dart';
import 'package:flutter_lista_compras/telas/telasobre.dart';

class PaginaListaCompras extends StatefulWidget {
  const PaginaListaCompras({super.key});
  
  @override
  PaginaListaComprasState createState() => PaginaListaComprasState();
}

class PaginaListaComprasState extends State<PaginaListaCompras> {
  List<ItemLista> itens = [];
  List<ItemLista> itensFiltrados = [];

  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Pesquisar por itens',
            hintStyle: TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
            border: InputBorder.none,
          ),
          onChanged: _filtrarItens,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 93, 201, 252),
      body: _construirListaItens(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _adicionarItem(context);
            },
            tooltip: 'Adicionar Item',
            child: const Icon(Icons.add),
          ),
         const SizedBox(width: 16), // Espaçamento entre os botões
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: 'Sair',
            child: const Icon(Icons.exit_to_app),
          ),
          const SizedBox(width: 16), // Espaçamento entre os botões
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {return PaginaSobre();}),);
            },
            tooltip: 'Sobre',
            child: const Icon(Icons.accessibility_rounded),
          ),
        ],
      ),
    );
  }

  Widget _construirListaItens() {
    final itensExibidos = itensFiltrados.isNotEmpty ? itensFiltrados : itens;

    return ListView.builder(
      itemCount: itensExibidos.length,
      itemBuilder: (context, index) {
        final item = itensExibidos[index];
        return Card(
          color: Colors.grey[200],
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(
              item.nome,
              style: TextStyle(
                decoration: item.comprado ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _editarItem(context, item, index);
                  },
                ),
                IconButton(
                  icon:const Icon(Icons.delete),
                  onPressed: () {
                    _removerItem(item);
                  },
                ),
                Checkbox(
                  value: item.comprado,
                  onChanged: (value) {
                    setState(() {
                      item.comprado = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _filtrarItens(String query) {
    setState(() {
      itensFiltrados = itens.where((item) => item.nome.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  Future _adicionarItem(BuildContext context) async {
    final novoItem = await showDialog<String>(
      context: context,
      builder: (context) {
        String novoItemNome = '';
        return AlertDialog(
          title: const Text('Adicione um item a sua lista'),
          content: TextField(
            onChanged: (value) {
              novoItemNome = value;
            },
            decoration: const InputDecoration(hintText: 'Digite o nome do item'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Adicionar'),
              onPressed: () {
                Navigator.of(context).pop(novoItemNome);
              },
            ),
          ],
        );
      },
    );

    if (novoItem != null && novoItem.isNotEmpty) {
      setState(() {
        itens.add(ItemLista(nome: novoItem));
        itensFiltrados = itens; 
      });
    }
  }

  Future _editarItem(BuildContext context, ItemLista item, int index) async {
    controller.text = item.nome;
    final novoItemNome = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Item'),
          content: TextField(
            controller: controller,
            onChanged: (value) {
              item.nome = value;
            },
            decoration: InputDecoration(),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Salvar'),
              onPressed: () {
                Navigator.of(context).pop(item.nome);
              },
            ),
          ],
        );
      },
    );

    if (novoItemNome != null && novoItemNome.isNotEmpty) {
      setState(() {
        itens[index].nome = novoItemNome;
        itensFiltrados = itens;
      });
    }
  }

  void _removerItem(ItemLista item) {
    setState(() {
      itens.remove(item);
      itensFiltrados.remove(item);
    });
  }
}

class ItemLista {
  String nome;
  bool comprado;

  ItemLista({required this.nome, this.comprado = false});
}
