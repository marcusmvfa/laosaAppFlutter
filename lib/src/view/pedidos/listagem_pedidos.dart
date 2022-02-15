import 'package:flutter/material.dart';
import 'package:laosa_app/src/providers/pedido_provider.dart';
import 'package:laosa_app/src/view/pedidos/components/number_pedido_card.dart';
import 'package:laosa_app/src/view/pedidos/pedido.dart';
import 'package:provider/provider.dart';

class ListagemPedidos extends StatelessWidget {
  const ListagemPedidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctrl = Provider.of<PedidoProvider>(context, listen: false);

    return Container(
      // height: 80,
      color: const Color(0xffF5EEE6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Olá Osana,\nO que vai ser hoje?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 16,
            ),
            const NumberPedidoCard(),
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text(
                "Últimos Pedidos",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            FutureBuilder(
                future: ctrl.getPedidos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 100,
                      child: CircularProgressIndicator(
                        color: Colors.deepPurple,
                        strokeWidth: 2,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: ctrl.pedidos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Pedido(ctrl.pedidos[index]);
                        });
                  }
                })
          ],
        ),
      ),
    );
  }
}
