class ProductModel {
  int? id;
  String nome;
  double preco;
  int estoque;
  String categoria;

  ProductModel({
    this.id,
    required this.nome,
    required this.preco,
    required this.estoque,
    required this.categoria,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      nome: json['nome'],
      preco: double.tryParse(json['preco'].toString()) ?? 0.0,
      estoque: json['estoque'],
      categoria: json['categoria'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'preco': preco,
      'estoque': estoque,
      'categoria': categoria,
    };
  }
}
