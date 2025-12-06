class ProductModel {
  int? id;
  String nome;
  String descricao;
  double preco;
  String dataAtualizado;

  ProductModel({
    this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.dataAtualizado,
  });

  // Converte JSON (vindo da API) para Objeto Dart
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      nome: json['nome'] ?? '',
      descricao: json['descricao'] ?? '',
      // Garante que o preço seja lido como número, mesmo se vier como string
      preco: double.tryParse(json['preco'].toString()) ?? 0.0,
      dataAtualizado: json['data_atualizado'] ?? '',
    );
  }

  // Converte Objeto Dart para JSON (para enviar para a API)
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao,
      'preco': preco,
      'data_atualizado': dataAtualizado,
    };
  }
}