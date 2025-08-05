import 'package:flutter/material.dart';
import '../models/veiculo.dart';
import '../widgets/veiculo_card.dart';
import 'detalhes_veiculo_screen.dart';

class ListaVeiculosScreen extends StatelessWidget {
  const ListaVeiculosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Veiculo> veiculos = [
      Carro(
        id: 'civic_g10',
        nome: 'Honda Civic G10',
        preco: 135000.00,
        descricao: 'Um ícone de design e performance. O sedan que redefine a categoria com tecnologia e sofisticação.',
        imagemUrl: 'images/civic.png',
        tipo: 'Sedan',
        numeroPortas: 4,
      ),
      Carro(
        id: 'corolla_cross_2024',
        nome: 'Toyota Corolla Cross',
        preco: 165000.00,
        descricao: 'O SUV compacto perfeito para a cidade e aventuras. Economia, praticidade e confiabilidade Toyota.',
        imagemUrl: 'images/corolla.png',
        tipo: 'SUV Compacto',
        numeroPortas: 4,
      ),
      Carro(
        id: 'polo_gts_2024',
        nome: 'Volkswagen Polo GTS',
        preco: 95000.00,
        descricao: 'Esportividade alemã em formato compacto. Motor TSI turbo para máxima diversão ao dirigir.',
        imagemUrl: 'images/polo.png',
        tipo: 'Hatchback',
        numeroPortas: 4,
      ),
      Carro(
        id: 'bmw_320i_2024',
        nome: 'BMW 320i Sport',
        preco: 285000.00,
        descricao: 'O prazer de dirigir em sua forma mais pura. Luxo, performance e tecnologia alemã de ponta.',
        imagemUrl: 'images/bmw.png',
        tipo: 'Sedan de Luxo',
        numeroPortas: 4,
      ),
      Carro(
        id: 'onix_plus_2024',
        nome: 'Chevrolet Onix Plus',
        preco: 85000.00,
        descricao: 'O sedan mais vendido do Brasil. Espaço, economia e tecnologia que cabem no seu bolso.',
        imagemUrl: 'images/onix.png',
        tipo: 'Sedan Compacto',
        numeroPortas: 4,
      ),
      Carro(
        id: 'mustang_gt_2024',
        nome: 'Ford Mustang GT',
        preco: 450000.00,
        descricao: 'Lenda americana com V8 5.0L. Potência bruta e design icônico que faz corações acelerarem.',
        imagemUrl: 'images/mustang.png',
        tipo: 'Cupê Esportivo',
        numeroPortas: 2,
      ),
      Moto(
        id: 'mt07_2024',
        nome: 'Yamaha MT-07',
        preco: 47990.00,
        descricao: 'A Master of Torque que domina as ruas com seu motor crossplane e agilidade impressionante.',
        imagemUrl: 'images/motoca.png',
        categoria: 'Naked',
        cilindradas: 689,
      ),
      Carro(
        id: 'compass_s_2024',
        nome: 'Jeep Compass S',
        preco: 240000.00,
        descricao: 'O SUV que combina aventura e luxo. Pronto para qualquer terreno com o máximo de conforto.',
        imagemUrl: 'images/compass.png',
        tipo: 'SUV',
        numeroPortas: 4,
      ),
      Carro(
        id: 'kicks_2024',
        nome: 'Nissan Kicks',
        preco: 115000.00,
        descricao: 'O crossover urbano ideal. Design moderno, tecnologia avançada e eficiência para o dia a dia.',
        imagemUrl: 'images/kicks.png',
        tipo: 'Crossover',
        numeroPortas: 4,
      ),
      Carro(
        id: 'hilux_srx_2024',
        nome: 'Toyota Hilux SRX',
        preco: 275000.00,
        descricao: 'A picape mais confiável do planeta. Robustez lendária para trabalho e aventura sem limites.',
        imagemUrl: 'images/hilux.png',
        tipo: 'Picape',
        numeroPortas: 4,
      ),
      Caminhao(
        id: 'scania_770s',
        nome: 'Scania 770 S',
        preco: 950000.00,
        descricao: 'O V8 mais potente do mercado. Força bruta, eficiência e conforto para o rei da estrada.',
        imagemUrl: 'images/scania.png',
        tipoCarga: 'Cavalo Mecânico',
        capacidadeCargaKg: 74000,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Financie Seu Sonho'),
      ),
      body: ListView.builder(
        itemCount: veiculos.length,
        itemBuilder: (context, index) {
          final veiculo = veiculos[index];
          return VeiculoCard(
            veiculo: veiculo,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesVeiculoScreen(veiculo: veiculo),
                ),
              );
            },
          );
        },
      ),
    );
  }
}