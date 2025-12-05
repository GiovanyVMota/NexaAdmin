class ClientModel {
  int? id;
  String nome;
  String email;
  String telefone;

  ClientModel({
    this.id,
    required this.nome,
    required this.email,
    required this.telefone,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
    };
  }
}
