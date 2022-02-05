import 'package:flutter/material.dart';

class HeaderPedido extends StatelessWidget {
  const HeaderPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Chip(
                label: Text(
                  "Cliente: Elianes",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.deepPurple,
              ),
              Card(
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "Entrega",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range, color: Colors.white),
                          Text("02/02/2023",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: const [Text("Total: R\$ 150.00")],
          // ),
        ),
      ),
    );
  }
}
