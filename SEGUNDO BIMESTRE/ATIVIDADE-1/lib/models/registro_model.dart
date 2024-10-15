class Registro {
  int? id;
  String nome;
  double valor;

  Registro({this.id, required this.nome, required this.valor});

  factory Registro.fromJson(Map<String, dynamic> json) {
    return Registro(
      id: json['id'],
      nome: json['nome'],
      valor: json['valor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'valor': valor,
    };
  }
}
