import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(children: [
        RichText(
          text: const TextSpan(children: [
            TextSpan(text: "Você tem certeza que deseja excluir este item? "),
            TextSpan(
              text: "Essa ação não poderá ser desfeita!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ]),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(primary: Colors.red),
          child: Row(
            children: const [
              Text(
                "Deletar",
                style: TextStyle(color: Colors.white),
              ),
              Icon(Icons.delete)
            ],
          ),
        )
      ]),
    );
  }
}
