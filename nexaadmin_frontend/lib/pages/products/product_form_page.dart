import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../services/product_service.dart';

class ProductFormPage extends StatefulWidget {
  final ProductModel? product;

  ProductFormPage({this.product});

  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nome;
  late TextEditingController preco;
  late TextEditingController estoque;
  late TextEditingController categoria;

  @override
  void initState() {
    super.initState();
    nome = TextEditingController(text: widget.product?.nome ?? "");
    preco = TextEditingController(text: widget.product?.preco.toString() ?? "");
    estoque =
        TextEditingController(text: widget.product?.estoque.toString() ?? "");
    categoria =
        TextEditingController(text: widget.product?.categoria ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0D0D),
      appBar: AppBar(
        title: Text(
          widget.product == null ? "Novo Produto" : "Editar Produto",
          style: TextStyle(color: Colors.white),
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
              SizedBox(height: 15),
              _campo("Preço", preco, number: true),
              SizedBox(height: 15),
              _campo("Estoque", estoque, number: true),
              SizedBox(height: 15),
              _campo("Categoria", categoria),
              SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent),
                child: Text("Salvar", style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (!formKey.currentState!.validate()) return;

                  final model = ProductModel(
                    id: widget.product?.id,
                    nome: nome.text,
                    preco: double.parse(preco.text),
                    estoque: int.parse(estoque.text),
                    categoria: categoria.text,
                  );

                  if (widget.product == null) {
                    await ProductService.createProduct(model);
                  } else {
                    await ProductService.updateProduct(model.id!, model);
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

  Widget _campo(String label, TextEditingController c, {bool number = false}) {
    return TextFormField(
      controller: c,
      keyboardType: number ? TextInputType.number : TextInputType.text,
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