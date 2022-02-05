import 'package:flutter/material.dart';
import 'package:laosa_app/src/models/pedido_model.dart';

class PedidoProvider extends ChangeNotifier {
  List<PedidoModel> pedidos = [];
  PedidoModel pedidoSelecionado = PedidoModel();

  getPedido(String? id) {
    if (id == null) {
      pedidoSelecionado = PedidoModel();
      pedidoSelecionado.isEdit.value = true;
    } else {
      //PLace the value from Firebase
    }
  }

  double sumTotal() {
    var sum = 0.0;
    pedidoSelecionado.pedidoItens.value.forEach((element) {
      sum += element.valor;
    });
    return sum;
  }
}
