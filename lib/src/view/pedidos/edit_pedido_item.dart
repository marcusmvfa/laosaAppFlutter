import 'package:flutter/material.dart';

class EditPedidoItem extends StatefulWidget {
  const EditPedidoItem({Key? key}) : super(key: key);

  @override
  _EditPedidoItemState createState() => _EditPedidoItemState();
}

class _EditPedidoItemState extends State<EditPedidoItem> {
  String tipo = "Calcinha";
  String tam = "M";
  bool renda = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Tipo: "),
                DropdownButton<String>(
                  value: tipo,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      tipo = newValue!;
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
                Text("Qtd.: "),
                Container(
                  width: 36,
                  child: TextField(
                    keyboardType: TextInputType.number,
                  ),
                ),
              ]),
              Row(
                children: [
                  Text("Tam: "),
                  DropdownButton<String>(
                    value: tam,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        tam = newValue!;
                      });
                    },
                    items: <String>['P', 'M', 'G', 'GG', 'XG']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Text("Extra: "),
                  Container(
                    width: 36,
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text("Renda"),
                  Checkbox(
                    value: renda,
                    onChanged: (value) => setState(() {
                      renda = value!;
                    }),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(hintText: "Observações..."),
                maxLines: 3,
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
