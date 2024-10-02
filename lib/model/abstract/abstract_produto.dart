abstract class Produto {
  String nome = '';
  double peso = 0, preco = 0;
  DateTime dataVencimento = DateTime.now();
  int quantidade = 0;

  Produto(
    this.quantidade,
    this.nome,
    this.peso,
    this.preco,
    this.dataVencimento,
  );
}
