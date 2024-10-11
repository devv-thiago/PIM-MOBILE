import 'package:urban_green/model/cliente.dart';
import 'package:urban_green/model/endereco.dart';
import 'package:urban_green/model/pedido.dart';
import 'package:urban_green/model/produto_acabado.dart';

List<PedidoVenda> pedidosMock = [
  PedidoVenda(1, 10,
      cliente: Cliente(
          enderecoEntrega: Endereco(
              rua: "Avenida São Camilo", complemento: "", numero: 120)),
      situacao: "Em processamento",
      itensPedido: [ProdutoAcabado(10, "Alface", 20, 10)]),
  PedidoVenda(2, 5,
      cliente: Cliente(
          enderecoEntrega: Endereco(
              rua: "Rua das Flores", complemento: "Apto 201", numero: 45)),
      situacao: "Concluído",
      itensPedido: [ProdutoAcabado(20, "Tomate", 30, 15)]),
  PedidoVenda(3, 24,
      cliente: Cliente(
          enderecoEntrega:
              Endereco(rua: "Avenida Brasil", complemento: "", numero: 500)),
      situacao: "Cancelado",
      itensPedido: [
        ProdutoAcabado(30, "Cenoura", 25, 12),
        ProdutoAcabado(30, "Cenoura", 20, 12)
      ]),
  PedidoVenda(4, 7,
      cliente: Cliente(
          enderecoEntrega: Endereco(
              rua: "Rua João XXIII", complemento: "Casa", numero: 330)),
      situacao: "Em transporte",
      itensPedido: [ProdutoAcabado(40, "Batata", 50, 25)]),
  PedidoVenda(5, 3,
      cliente: Cliente(
          enderecoEntrega: Endereco(
              rua: "Avenida Paulista", complemento: "Loja 5", numero: 1000)),
      situacao: "Aguardando pagamento",
      itensPedido: [ProdutoAcabado(50, "Cebola", 15, 8)]),
];
