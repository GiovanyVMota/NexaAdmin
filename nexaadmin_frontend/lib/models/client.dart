class ClientModel {
  int? id;
  String nome;
  String sobrenome;
  String email;
  int idade;
  String foto;

  ClientModel({
    this.id,
    required this.nome,
    required this.sobrenome,
    required this.email,
    required this.idade,
    required this.foto,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      nome: json['nome'] ?? '',
      sobrenome: json['sobrenome'] ?? '',
      email: json['email'] ?? '',
      // Garante que a idade seja um número inteiro
      idade: int.tryParse(json['idade'].toString()) ?? 0,
      foto: json['foto'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'sobrenome': sobrenome,
      'email': email,
      'idade': idade,
      'foto': foto,
    };
  }
}