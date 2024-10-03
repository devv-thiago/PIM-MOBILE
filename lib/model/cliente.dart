import 'package:urban_green/model/endereco.dart';

class Cliente {
  String nome, documento;
  Endereco enderecoEntrega;

  Cliente({
    this.nome = '',
    this.documento = '',
    required this.enderecoEntrega,
  });
}
