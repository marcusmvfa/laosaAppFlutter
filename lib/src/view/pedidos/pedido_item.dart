import 'package:flutter/material.dart';
import 'package:laosa_app/src/view/pedidos/edit_pedido_item.dart';

class PedidoItem extends StatefulWidget {
  const PedidoItem({Key? key}) : super(key: key);

  @override
  _PedidoItemState createState() => _PedidoItemState();
}

class _PedidoItemState extends State<PedidoItem> {
  String dropdownValue = "Calcinha";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (context) => EditPedidoItem());
      },
      child: Card(
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 36,
                    child: Text("3"),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Calcinha', 'Sutiã', 'Maiô', 'Camisola']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Container(
                    child: Text("Tam: G"),
                  ),
                  Container(
                    child: Text("Extra: 45"),
                  ),
                  Container(
                    child: Icon(Icons.pending, color: Colors.amber),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
