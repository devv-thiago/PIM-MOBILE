import 'package:urban_green/model/abstract/abstract_produto.dart';

class ProdutoAcabado extends Produto {
  String receita = '', lote = '';
  DateTime dataPlantio = DateTime.now(), dataColheita = DateTime.now();

  ProdutoAcabado(
    super.quantidade,
    super.nome,
    super.peso,
    super.preco,
  );
}
