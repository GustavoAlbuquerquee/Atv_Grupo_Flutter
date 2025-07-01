abstract class Veiculo {
  final String id; // ID único para animações
  final String nome;
  final double preco;
  final String descricao;
  final String imagemUrl;

  Veiculo({
    required this.id,
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.imagemUrl,
  });
}

/// Classe Derivada: Carro
class Carro extends Veiculo {
  final String tipo;
  final int numeroPortas;

  Carro({
    required super.id,
    required super.nome,
    required super.preco,
    required super.descricao,
    required super.imagemUrl,
    required this.tipo,
    required this.numeroPortas,
  });
}

/// Classe Derivada: Moto
class Moto extends Veiculo {
  final String categoria;
  final int cilindradas;

  Moto({
    required super.id,
    required super.nome,
    required super.preco,
    required super.descricao,
    required super.imagemUrl,
    required this.categoria,
    required this.cilindradas,
  });
}

/// Classe Derivada: Caminhao
class Caminhao extends Veiculo {
  final String tipoCarga;
  final double capacidadeCargaKg;

  Caminhao({
    required super.id,
    required super.nome,
    required super.preco,
    required super.descricao,
    required super.imagemUrl,
    required this.tipoCarga,
    required this.capacidadeCargaKg,
  });
}