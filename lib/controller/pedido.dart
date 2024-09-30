import 'package:urban_green/model/produto_acabado.dart';

class PedidoVendaController {
  List<ProdutoAcabado> itensPedido = [];

  String adicionarItem(ProdutoAcabado produto) {
    itensPedido.add(produto);
    return '';
  }

  String removerItem(ProdutoAcabado produto) {
    itensPedido.removeWhere((prod) => produto.nome == prod.nome);
    return '';
  }

  double calcularTotal() {
    double soma = 0;
    for (var produto in itensPedido) {
      soma += produto.preco;
    }
    return soma;
  }
}
