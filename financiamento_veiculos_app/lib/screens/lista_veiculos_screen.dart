import 'package:flutter/material.dart';
import '../models/veiculo.dart';
import '../widgets/veiculo_card.dart';
import 'detalhes_veiculo_screen.dart';

class ListaVeiculosScreen extends StatelessWidget {
  const ListaVeiculosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Nossa lista de veículos, agora como objetos de dados
    final List<Veiculo> veiculos = [
      Carro(
        id: 'civic_g10',
        nome: 'Honda Civic G10',
        preco: 135000.00,
        descricao: 'Um ícone de design e performance. O sedan que redefine a categoria com tecnologia e sofisticação.',
        imagemUrl: 'https://cdn.motor1.com/images/mgl/pP33p/s1/honda-civic-si-2020.jpg',
        tipo: 'Sedan',
        numeroPortas: 4,
      ),
      Moto(
        id: 'mt07_2024',
        nome: 'Yamaha MT-07',
        preco: 47990.00,
        descricao: 'A Master of Torque que domina as ruas com seu motor crossplane e agilidade impressionante.',
        imagemUrl: 'https://www.yamaha-motor.com.br/file/v656042457855909249/products/mt-07-abs-2025-racing-blue-3-4-frente.jpg',
        categoria: 'Naked',
        cilindradas: 689,
      ),
      Carro(
        id: 'compass_s_2024',
        nome: 'Jeep Compass S',
        preco: 240000.00,
        descricao: 'O SUV que combina aventura e luxo. Pronto para qualquer terreno com o máximo de conforto.',
        imagemUrl: 'assets/images/jeep_compass_2025.jpg', // Caminho relativo
        tipo: 'SUV',
        numeroPortas: 4,
      ),
      Caminhao(
        id: 'scania_770s',
        nome: 'Scania 770 S',
        preco: 950000.00,
        descricao: 'O V8 mais potente do mercado. Força bruta, eficiência e conforto para o rei da estrada.',
        imagemUrl: 'assets/images/scania_770s.jpg', // Caminho relativo
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