import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laosa_app/src/models/pedido_item_model.dart';

class PedidoModel {
  String id = "";
  String idCliente = "";
  DateTime dataInclusao = DateTime.now();
  ValueNotifier<DateTime> dataEntrega = ValueNotifier(DateTime.now().add(const Duration(days: 1)));
  ValueNotifier<double> valorTotal = ValueNotifier(0);
  ValueNotifier<List<PedidoItemModel>> pedidoItens = ValueNotifier([]);
  ValueNotifier<bool> isEdit = ValueNotifier(false);

  PedidoModel() {
    pedidoItens.addListener(() {
      debugPrint("############## Ativou o pedidoItens ##############");
    });
  }

  PedidoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCliente = json['idCliente'];
    dataInclusao = (json['dataInclusao'] as Timestamp).toDate();
    dataEntrega.value = (json['dataEntrega'] as Timestamp).toDate();
    valorTotal.value = json['valorTotal'];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idCliente": idCliente,
      "dataInclusao": dataInclusao,
      "dataEntrega": dataEntrega.value,
      "valorTotal": valorTotal.value,
    };
  }
}
