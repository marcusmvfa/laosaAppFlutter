import 'package:flutter/material.dart';
import 'package:laosa_app/src/models/pedido_item_model.dart';
import 'package:laosa_app/src/providers/pedido_provider.dart';
import 'package:laosa_app/src/view/pedidos/edit_pedido_item.dart';
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
              valueListenable: ctrl.pedido.isEdit,
              builder: (context, bool isEditing, child) {
                return IconButton(
                    onPressed: () => ctrl.pedido.isEdit.value = !ctrl.pedido.isEdit.value,
                    icon: isEditing ? Icon(Icons.save) : Icon(Icons.mode_edit_outline_outlined));
              })
        ],
        backgroundColor: Colors.transparent,
        title: const Text("Dados do Pedido"),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.purple),
        onPressed: () {
          if (ctrl.pedido.isEdit.value == false) {
            ctrl.pedido.isEdit.value = !ctrl.pedido.isEdit.value;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("Cliente: Eliane"), Text("Entrega 02/02/2022")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [Text("Total: R\$ 150.00")],
            ),
            ValueListenableBuilder(
                valueListenable: ctrl.pedido.pedidoItens,
                builder: (context, model, chi) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: ctrl.pedido.pedidoItens.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PedidoItem(ctrl.pedido.pedidoItens.value[index]);
                      });
                }),
          ],
        ),
      ),
    );
  }
}
