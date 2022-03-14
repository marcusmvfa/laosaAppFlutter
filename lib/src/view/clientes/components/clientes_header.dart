import 'package:flutter/material.dart';

class ClientesHeader extends StatelessWidget {
  const ClientesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            focusColor: Colors.black,
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
            contentPadding: EdgeInsets.all(8),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            labelText: "Buscar Cliente",
            floatingLabelStyle: TextStyle(color: Colors.purple, height: 0),
          ),
          cursorColor: Colors.purple,
        ),
      ),
    );
  }
}
