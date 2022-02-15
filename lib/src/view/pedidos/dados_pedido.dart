import 'package:flutter/material.dart';
import 'package:laosa_app/src/models/pedido_item_model.dart';
import 'package:laosa_app/src/models/pedido_model.dart';
import 'package:laosa_app/src/providers/pedido_provider.dart';
import 'package:laosa_app/src/view/pedidos/edit_pedido_item.dart';
import 'package:laosa_app/src/view/pedidos/header_pedido.dart';
import 'package:laosa_app/src/view/pedidos/pedido_item.dart';
import 'package:provider/provider.dart';

class DadosPedido extends StatelessWidget {
  const DadosPedido({Key? key}) : super(key: key);

  static const routeName = "/dadosPedido";

  @override
  Widget build(BuildContext context) {
    var ctrl = Provider.of<PedidoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          ValueListenableBuilder(
              valueListenable: ctrl.pedidoSelecionado.isEdit,
              builder: (context, bool isEditing, child) {
                return IconButton(
                  onPressed: () {
                    ctrl.savePedido(context);
                  },
                  icon: isEditing
                      ? const Icon(Icons.save)
                      : const Icon(Icons.mode_edit_outline_outlined),
                );
              })
        ],
        backgroundColor: Colors.transparent,
        title: const Text("Dados do Pedido"),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.purple),
        onPressed: () {
          if (ctrl.pedidoSelecionado.isEdit.value == false) {
            ctrl.pedidoSelecionado.isEdit.value = !ctrl.pedidoSelecionado.isEdit.value;
          }
          showDialog(
            context: context,
            builder: (context) => EditPedidoItem(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderPedido(),
            FutureBuilder(
                future: ctrl.getPedidoItens(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      strokeWidth: 2,
                    );
                  } else {
                    return ValueListenableBuilder(
                        valueListenable: ctrl.pedidoSelecionado.pedidoItens,
                        builder: (context, model, chi) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: ctrl.pedidoSelecionado.pedidoItens.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                return PedidoItem(ctrl.pedidoSelecionado.pedidoItens.value[index]);
                              });
                        });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
