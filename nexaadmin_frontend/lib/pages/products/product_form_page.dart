import 'package:flutter/material.dart';
import '../../services/product_service.dart';

class ProductFormPage extends StatefulWidget {
  final Map? product;

  const ProductFormPage({super.key, this.product});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  final ProductService service = ProductService();

  late TextEditingController nome;
  late TextEditingController preco;
  late TextEditingController estoque;
  late TextEditingController categoria;

  @override
  void initState() {
    super.initState();

    nome = TextEditingController(text: widget.product?["nome"] ?? "");
    preco = TextEditingController(text: widget.product?["preco"] ?? "");
    estoque = TextEditingController(text: widget.product?["estoque"].toString() ?? "");
    categoria = TextEditingController(text: widget.product?["categoria"] ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? "Novo Produto" : "Editar Produto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(controller: nome, decoration: const InputDecoration(labelText: "Nome")),
              TextFormField(controller: preco, decoration: const InputDecoration(labelText: "Preço")),
              TextFormField(controller: estoque, decoration: const InputDecoration(labelText: "Estoque")),
              TextFormField(controller: categoria, decoration: const InputDecoration(labelText: "Categoria")),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  final data = {
                    "nome": nome.text,
                    "preco": preco.text,
                    "estoque": int.parse(estoque.text),
                    "categoria": categoria.text,
                  };

                  if (widget.product == null) {
                    await service.createProduct(data);
                  } else {
                    await service.updateProduct(widget.product!["id"], data);
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
