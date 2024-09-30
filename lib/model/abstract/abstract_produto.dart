abstract class Produto {
  String nome = '';
  double peso = 0, preco = 0;
  DateTime dataVencimento = DateTime.now();

  Produto(
    this.nome,
    this.peso,
    this.preco,
    this.dataVencimento,
  );
}
