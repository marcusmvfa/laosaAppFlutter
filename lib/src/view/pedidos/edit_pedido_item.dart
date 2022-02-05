import 'package:flutter/material.dart';
import 'package:laosa_app/src/models/pedido_item_model.dart';
import 'package:laosa_app/src/providers/pedido_provider.dart';
import 'package:provider/provider.dart';

class EditPedidoItem extends StatefulWidget {
  EditPedidoItem({Key? key, this.pedido}) : super(key: key);
  PedidoItemModel? pedido;
  @override
  _EditPedidoItemState createState() => _EditPedidoItemState();
}

class _EditPedidoItemState extends State<EditPedidoItem> {
  PedidoItemModel pedido = PedidoItemModel();
  TextEditingController extraInferior = TextEditingController();
  TextEditingController extraSuperior = TextEditingController();
  TextEditingController qnt = TextEditingController();
  TextEditingController valor = TextEditingController();
  TextEditingController obs = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    pedido = widget.pedido ?? PedidoItemModel();
    extraInferior.text = pedido.extraInferior.toString();
    extraSuperior.text = pedido.extraSuperior.toString();
    qnt.text = pedido.qnt.toString();
    valor.text = pedido.valor.toString();
    obs.text = pedido.obs.toString();
  }

  @override
  void dispose() {
    extraInferior.dispose();
    extraSuperior.dispose();
    qnt.dispose();
    valor.dispose();
    obs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<PedidoProvider>(context, listen: false);
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(children: [
                  const Text("Tipo: "),
                  ValueListenableBuilder(
                      valueListenable: pedido.tipo,
                      builder: (context, TipoItens tip, child) {
                        return DropdownButton<TipoItens>(
                          value: pedido.tipo.value,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (TipoItens? newValue) {
                            pedido.tipo.value = newValue!;
                          },
                          items:
                              TipoItens.values.map<DropdownMenuItem<TipoItens>>((TipoItens tipo) {
                            return DropdownMenuItem<TipoItens>(
                              value: tipo,
                              child: Text(tipo.name),
                            );
                          }).toList(),
                        );
                      }),
                  const Text("Renda"),
                  ValueListenableBuilder(
                      valueListenable: pedido.renda,
                      builder: (context, bool model, child) {
                        return Checkbox(
                            value: pedido.renda.value,
                            onChanged: (value) => pedido.renda.value = value!);
                      })
                ]),
                Row(
                  children: [
                    const Text("Tam: "),
                    ValueListenableBuilder(
                        valueListenable: pedido.tamInferior,
                        builder: (context, Tamanho tip, child) {
                          return DropdownButton<Tamanho>(
                            value: tip,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (Tamanho? newValue) {
                              pedido.tamInferior.value = newValue!;
                            },
                            items: Tamanho.values.map<DropdownMenuItem<Tamanho>>((Tamanho value) {
                              return DropdownMenuItem<Tamanho>(
                                value: value,
                                child: Text(value.name),
                              );
                            }).toList(),
                          );
                        }),
                    const Text("Extra: "),
                    SizedBox(
                      width: 36,
                      child: TextFormField(
                        controller: extraInferior,
                        onSaved: (String? text) {
                          pedido.extraInferior = int.parse(text!);
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Qtd.: "),
                    SizedBox(
                      width: 36,
                      child: TextFormField(
                        controller: qnt,
                        onSaved: (String? text) {
                          pedido.qnt = int.parse(text!);
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const Text("Valor: "),
                    SizedBox(
                      width: 36,
                      child: TextFormField(
                        controller: valor,
                        onSaved: (String? text) {
                          pedido.valor = double.parse(text!);
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: TextFormField(
                    controller: obs,
                    onSaved: (String? text) {
                      pedido.obs = text!;
                    },
                    decoration: const InputDecoration(hintText: "Observações..."),
                    maxLines: 3,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (pedido.id.isEmpty) {
                        ctrl.pedidoSelecionado.pedidoItens.value =
                            List.from(ctrl.pedidoSelecionado.pedidoItens.value)
                              ..add(
                                pedido,
                              );
                      } else {
                        var item = List.from(ctrl.pedidoSelecionado.pedidoItens.value)
                            .firstWhere((element) => element.id == pedido.id);
                        item = pedido;
                        ctrl.pedidoSelecionado.pedidoItens.notifyListeners();
                      }
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Salvar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
