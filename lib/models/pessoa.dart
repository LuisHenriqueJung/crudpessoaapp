// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PessoaFields {
  List<String> values = ['nome', 'endereco', 'idade', 'email'];
}

class Pessoa {
  int? id;
  String nome;
  String endereco;
  int idade;
  String email;
  Pessoa({
    this.id,
    required this.nome,
    required this.endereco,
    required this.idade,
    required this.email,
  });

  Pessoa copyWith({
    int? id,
    String? nome,
    String? endereco,
    int? idade,
    String? email,
  }) {
    return Pessoa(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      endereco: endereco ?? this.endereco,
      idade: idade ?? this.idade,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'endereco': endereco,
      'idade': idade,
      'email': email,
    };
  }

  factory Pessoa.fromMap(Map<String, dynamic> map) {
    return Pessoa(
      id: map['id'] as int,
      nome: map['nome'] as String,
      endereco: map['endereco'] as String,
      idade: map['idade'] as int,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pessoa.fromJson(String source) =>
      Pessoa.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pessoa(id: $id, nome: $nome, endereco: $endereco, idade: $idade, email: $email)';
  }

  @override
  bool operator ==(covariant Pessoa other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.endereco == endereco &&
        other.idade == idade &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        endereco.hashCode ^
        idade.hashCode ^
        email.hashCode;
  }
}
