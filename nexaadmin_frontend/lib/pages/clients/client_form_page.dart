import 'package:flutter/material.dart';
import '../../services/client_service.dart';

class ClientFormPage extends StatefulWidget {
  final Map? client;

  const ClientFormPage({super.key, this.client});

  @override
  State<ClientFormPage> createState() => _ClientFormPageState();
}

class _ClientFormPageState extends State<ClientFormPage> {
  final _formKey = GlobalKey<FormState>();
  final ClientService service = ClientService();

  late TextEditingController nome;
  late TextEditingController email;
  late TextEditingController telefone;
  late TextEditingController cidade;

  @override
  void initState() {
    super.initState();

    nome = TextEditingController(text: widget.client?["nome"] ?? "");
    email = TextEditingController(text: widget.client?["email"] ?? "");
    telefone = TextEditingController(text: widget.client?["telefone"] ?? "");
    cidade = TextEditingController(text: widget.client?["cidade"] ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.client == null ? "Novo Cliente" : "Editar Cliente"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(controller: nome, decoration: const InputDecoration(labelText: "Nome")),
              TextFormField(controller: email, decoration: const InputDecoration(labelText: "Email")),
              TextFormField(controller: telefone, decoration: const InputDecoration(labelText: "Telefone")),
              TextFormField(controller: cidade, decoration: const InputDecoration(labelText: "Cidade")),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  final data = {
                    "nome": nome.text,
                    "email": email.text,
                    "telefone": telefone.text,
                    "cidade": cidade.text,
                  };

                  if (widget.client == null) {
                    await service.createClient(data);
                  } else {
                    await service.updateClient(widget.client!["id"], data);
                  }

                  Navigator.pop(context);
                },
                child: const Text("Salvar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
