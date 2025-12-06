import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../services/product_service.dart';

class ProductFormPage extends StatefulWidget {
  final ProductModel? product;

  const ProductFormPage({super.key, this.product});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nome;
  late TextEditingController descricao;
  late TextEditingController preco;

  @override
  void initState() {
    super.initState();
    nome = TextEditingController(text: widget.product?.nome ?? "");
    descricao = TextEditingController(text: widget.product?.descricao ?? "");
    preco = TextEditingController(text: widget.product?.preco.toString() ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: Text(
          widget.product == null ? "Novo Produto" : "Editar Produto",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _campo("Nome", nome),
              const SizedBox(height: 15),
              _campo("Descrição", descricao),
              const SizedBox(height: 15),
              _campo("Preço", preco, number: true),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text("Salvar", style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (!formKey.currentState!.validate()) return;

                  try {
                    // Gera data atual
                    String dataAtual = DateTime.now().toIso8601String();

                    final model = ProductModel(
                      id: widget.product?.id,
                      nome: nome.text,
                      descricao: descricao.text,
                      preco: double.tryParse(preco.text) ?? 0.0,
                      dataAtualizado: dataAtual,
                    );

                    if (widget.product == null) {
                      await ProductService.createProduct(model);
                    } else {
                      await ProductService.updateProduct(model.id!, model);
                    }

                    if (mounted) Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Erro ao salvar: $e"), backgroundColor: Colors.red),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _campo(String label, TextEditingController c, {bool number = false}) {
    return TextFormField(
      controller: c,
      keyboardType: number ? TextInputType.number : TextInputType.text,
      style: const TextStyle(color: Colors.white),
      validator: (value) => value == null || value.isEmpty ? "Campo obrigatório" : null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purpleAccent)),
      ),
    );
  }
}