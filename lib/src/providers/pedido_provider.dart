import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laosa_app/src/models/pedido_item_model.dart';
import 'package:laosa_app/src/models/pedido_model.dart';

class PedidoProvider extends ChangeNotifier {
  List<PedidoModel> pedidos = [];
  PedidoModel pedidoSelecionado = PedidoModel();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  Future<void> getPedidos() async {
    CollectionReference pedidosFirebase = FirebaseFirestore.instance.collection('pedidos');
    pedidosFirebase.get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        pedidos.add(PedidoModel.fromJson(element.data() as Map<String, dynamic>));
      });
    });
  }

  Future<void> getPedidoItens() async {
    CollectionReference pedidosFirebase = FirebaseFirestore.instance.collection('pedidoItens');
    pedidosFirebase.where('idPedido', isEqualTo: pedidoSelecionado.id).get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        pedidoSelecionado.pedidoItens.value
            .add(PedidoItemModel.fromJson(element.data() as Map<String, dynamic>));
      });
    });
  }

  void savePedido(context) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    CollectionReference pedidosFirebase = FirebaseFirestore.instance.collection('pedidos');
    if (pedidoSelecionado.isEdit.value && pedidoSelecionado.id.isEmpty) {
      var pedidoGerado = pedidosFirebase.doc();
      pedidoSelecionado.id = pedidoGerado.id;
      batch.set(pedidoGerado, pedidoSelecionado.toMap());
      savePedidoItem(batch);
      pedidoSelecionado = PedidoModel();
    } else if (pedidoSelecionado.isEdit.value && pedidoSelecionado.id.isNotEmpty) {
      var pedidoGerado = pedidosFirebase.doc();
      pedidoSelecionado.id = pedidoGerado.id;
      batch.set(pedidoGerado, pedidoSelecionado.toMap());
      savePedidoItem(batch);
      pedidoSelecionado = PedidoModel();
      // Navigator.of(context).pop();
    } else {
      pedidoSelecionado.isEdit.value = true;
    }
    await batch.commit();
  }

  Future savePedidoFirestore() async {
    CollectionReference pedidosFirebase = FirebaseFirestore.instance.collection('pedidos');
    if (pedidoSelecionado.id.isEmpty) {
      pedidosFirebase.add(pedidoSelecionado.toMap()).then((value) {
        pedidosFirebase.doc(value.id).update({'id': value.id});
      }).onError((error, stackTrace) {
        var e = error;
        print(e);
      });
    } else {
      pedidosFirebase
          .doc(pedidoSelecionado.id)
          .update(pedidoSelecionado.toMap())
          .onError((error, stackTrace) {
        var e = error;
        print(e);
      });
    }
  }

  Future savePedidoItem(WriteBatch batch) async {
    CollectionReference pedidoItemFirebase = FirebaseFirestore.instance.collection('pedidoItens');

    for (var i in pedidoSelecionado.pedidoItens.value) {
      var gerado = pedidoItemFirebase.doc();
      i.idPedido = pedidoSelecionado.id;
      i.id = gerado.id;
      batch.set(gerado, i.toMap());
    }
  }
}
