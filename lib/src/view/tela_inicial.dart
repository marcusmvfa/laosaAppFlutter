import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laosa_app/src/models/pedido_model.dart';
import 'package:laosa_app/src/providers/pedido_provider.dart';
import 'package:laosa_app/src/view/drawer/drawer_widget.dart';
import 'package:laosa_app/src/view/pedidos/dados_pedido.dart';
import 'package:laosa_app/src/view/pedidos/listagem_pedidos.dart';
import 'package:provider/provider.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  static const routeName = '/';

  login() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    var ctrl = Provider.of<PedidoProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xffF5EEE6),
      appBar: AppBar(
        actions: [IconButton(onPressed: () => login(), icon: Icon(Icons.login))],
        elevation: 0,
        backgroundColor: Colors.transparent,
        // title: const Center(
        //   child: Text(
        //     "Pedidos",
        //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.restorablePushNamed(context, DadosPedido.routeName,
              arguments: <String, dynamic>{"isAdd": true, "id": null});
        }),
        child: const Icon(Icons.add),
      ),
      drawer: const DrawerWidget(),
      body: ListagemPedidos(),
    );
  }
}
