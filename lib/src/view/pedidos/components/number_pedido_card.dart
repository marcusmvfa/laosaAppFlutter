import 'package:flutter/material.dart';
import 'package:laosa_app/src/providers/pedido_provider.dart';
import 'package:laosa_app/src/view/clientes/clientes_view.dart';
import 'package:provider/provider.dart';

class NumberPedidoCard extends StatelessWidget {
  const NumberPedidoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<PedidoProvider>(context, listen: false);
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.8,
        children: [
          // Expanded(
          //   child:
          Card(
            color: Color(0xffFF7E67),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Em Andamento",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Wrap(
                    spacing: 10.0,
                    children: [
                      Icon(
                        Icons.pending_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        ctrl.pedidos.length.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            // ),
          ),
          // Expanded(
          //   child:
          Card(
            color: Color(0xff17B978),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Pedidos Prontos",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Wrap(spacing: 10.0, children: const [
                    Icon(
                      Icons.check_circle_outline_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "0",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ]),
                ],
              ),
            ),
            // ),
          ),
          InkWell(
            onTap: (() => Navigator.pushNamed(context, ClientesView.route)),
            child: Card(
              color: const Color(0xff3F72AF),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "Total de Clientes",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(spacing: 10.0, children: const [
                      Icon(
                        Icons.people_alt_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ]),
                  ],
                ),
              ),
              // ),
            ),
          ),
          // Expanded(
          //   child:
          Card(
            color: Color(0xffA6B1E1),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Total de Pedidos",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Wrap(spacing: 10.0, children: const [
                    Icon(
                      Icons.task_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "50",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ]),
                ],
              ),
            ),
            // ),
          ),
        ]);
  }
}
