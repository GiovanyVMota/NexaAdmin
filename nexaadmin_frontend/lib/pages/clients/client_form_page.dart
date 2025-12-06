import 'package:flutter/material.dart';
import '../../models/client.dart';
import '../../services/client_service.dart';

class ClientFormPage extends StatefulWidget {
  final ClientModel? client;

  const ClientFormPage({super.key, this.client});

  @override
  State<ClientFormPage> createState() => _ClientFormPageState();
}

class _ClientFormPageState extends State<ClientFormPage> {
  final formKey = GlobalKey<FormState>();
  
  // Controladores para os campos do PDF
  late TextEditingController nome;
  late TextEditingController sobrenome;
  late TextEditingController email;
  late TextEditingController idade;
  late TextEditingController foto;

  @override
  void initState() {
    super.initState();
    nome = TextEditingController(text: widget.client?.nome ?? "");
    sobrenome = TextEditingController(text: widget.client?.sobrenome ?? "");
    email = TextEditingController(text: widget.client?.email ?? "");
    idade = TextEditingController(text: widget.client?.idade.toString() ?? "");
    foto = TextEditingController(text: widget.client?.foto ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: Text(
          widget.client == null ? "Novo Cliente" : "Editar Cliente",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _campo("Nome", nome),
                const SizedBox(height: 15),
                _campo("Sobrenome", sobrenome),
                const SizedBox(height: 15),
                _campo("E-mail", email, emailType: true),
                const SizedBox(height: 15),
                _campo("Idade", idade, number: true),
                const SizedBox(height: 15),
                // Foto opcional
                _campo("URL da Foto (Opcional)", foto, isOptional: true),
                const SizedBox(height: 25),
                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text("Salvar", style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;

                    try {
                      final model = ClientModel(
                        id: widget.client?.id,
                        nome: nome.text,
                        sobrenome: sobrenome.text,
                        email: email.text,
                        idade: int.tryParse(idade.text) ?? 0,
                        foto: foto.text, 
                      );

                      if (widget.client == null) {
                        await ClientService.createClient(model);
                      } else {
                        await ClientService.updateClient(model.id!, model);
                      }

                      if (mounted) Navigator.pop(context);
                    } catch (e) {
                      // Mostra erro na tela se falhar (ex: erro no backend)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Erro ao salvar: $e"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _campo(String label, TextEditingController c,
      {bool number = false, bool emailType = false, bool isOptional = false}) {
    return TextFormField(
      controller: c,
      keyboardType: number
          ? TextInputType.number
          : (emailType ? TextInputType.emailAddress : TextInputType.text),
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (isOptional) return null; // Se for opcional, não valida nada
        if (value == null || value.isEmpty) return "Campo obrigatório";
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent)),
      ),
    );
  }
}