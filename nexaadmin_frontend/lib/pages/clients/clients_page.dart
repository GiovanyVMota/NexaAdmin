import 'package:flutter/material.dart';
import '../../models/client.dart';
import '../../services/client_service.dart';

class ClientFormPage extends StatefulWidget {
  final ClientModel? client;

  ClientFormPage({this.client});

  @override
  _ClientFormPageState createState() => _ClientFormPageState();
}

class _ClientFormPageState extends State<ClientFormPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nome;
  late TextEditingController email;
  late TextEditingController telefone;

  @override
  void initState() {
    super.initState();
    nome = TextEditingController(text: widget.client?.nome ?? "");
    email = TextEditingController(text: widget.client?.email ?? "");
    telefone = TextEditingController(text: widget.client?.telefone ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0D0D),
      appBar: AppBar(
        title: Text(
          widget.client == null ? "Novo Cliente" : "Editar Cliente",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _campo("Nome", nome),
              SizedBox(height: 15),
              _campo("E-mail", email),
              SizedBox(height: 15),
              _campo("Telefone", telefone),
              SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent),
                child: Text("Salvar"),
                onPressed: () async {
                  if (!formKey.currentState!.validate()) return;

                  final model = ClientModel(
                    id: widget.client?.id,
                    nome: nome.text,
                    email: email.text,
                    telefone: telefone.text,
                  );

                  if (widget.client == null) {
                    await ClientService.createClient(model);
                  } else {
                    await ClientService.updateClient(model.id!, model);
                  }

                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _campo(String label, TextEditingController c) {
    return TextFormField(
      controller: c,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white70),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white30)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
      ),
    );
  }
}
