import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/veiculo.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui'; // Para o efeito de vidro

class DetalhesVeiculoScreen extends StatefulWidget {
  final Veiculo veiculo;

  const DetalhesVeiculoScreen({super.key, required this.veiculo});

  @override
  State<DetalhesVeiculoScreen> createState() => _DetalhesVeiculoScreenState();
}

class _DetalhesVeiculoScreenState extends State<DetalhesVeiculoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _entradaController = TextEditingController();
  final _prazoController = TextEditingController();
  final formatadorMoeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  double? _valorFinanciado;
  double? _valorParcela;
  bool _showResult = false;

  void _simularFinanciamento() {
    if (_formKey.currentState!.validate()) {
      final double entrada = double.tryParse(_entradaController.text) ?? 0.0;
      final int prazo = int.tryParse(_prazoController.text) ?? 1;
      final double precoVeiculo = widget.veiculo.preco;
      const double jurosMensal = 0.02;

      if (entrada >= precoVeiculo) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Entrada deve ser menor que o valor do veículo.'),
            backgroundColor: Colors.redAccent,
          ),
        );
        return;
      }

      setState(() {
        _valorFinanciado = precoVeiculo - entrada;
        _valorParcela = (_valorFinanciado! / prazo) * (1 + jurosMensal);
        _showResult = true;
      });
    }
  }

  Widget _buildSpecificDetails() {
    final veiculo = widget.veiculo;
    // Usando is para checar o tipo e exibir os detalhes corretos
    if (veiculo is Carro) {
      return Text('Tipo: ${veiculo.tipo}  •  Portas: ${veiculo.numeroPortas}');
    } else if (veiculo is Moto) {
      return Text('Categoria: ${veiculo.categoria}  •  ${veiculo.cilindradas}cc');
    } else if (veiculo is Caminhao) {
      return Text('Tipo: ${veiculo.tipoCarga}  •  Carga: ${veiculo.capacidadeCargaKg / 1000} ton');
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            stretch: true,
            backgroundColor: Theme.of(context).colorScheme.background,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(widget.veiculo.nome, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
              background: Hero(
                tag: 'veiculo_imagem_${widget.veiculo.id}',
                child: Image.network(
                  widget.veiculo.imagemUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Seção de Detalhes ---
                  Text(
                    formatadorMoeda.format(widget.veiculo.preco),
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyMedium!,
                    child: _buildSpecificDetails(),
                  ),
                  const SizedBox(height: 16),
                  Text(widget.veiculo.descricao, style: Theme.of(context).textTheme.bodyMedium),
                  
                  Divider(height: 60, thickness: 1, color: Colors.grey.withOpacity(0.2)),

                  // --- Seção da Calculadora ---
                  Text('Simulador', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _entradaController,
                          decoration: const InputDecoration(labelText: 'Valor de Entrada (R\$)'),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                          validator: (v) => (v == null || v.isEmpty) ? 'Informe a entrada' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _prazoController,
                          decoration: const InputDecoration(labelText: 'Prazo (meses)'),
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Informe o prazo';
                            if (int.tryParse(v) == 0) return 'Prazo não pode ser zero';
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _simularFinanciamento,
                          child: const Text('Simular Financiamento'),
                        ),
                      ],
                    ),
                  ),

                  // --- Seção de Resultado com Animação ---
                  AnimatedOpacity(
                    opacity: _showResult ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: _showResult ? _buildResultCard() : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildResultCard() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Resultado', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 16),
                Text(
                  'Valor Financiado: ${formatadorMoeda.format(_valorFinanciado)}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
                ),
                const SizedBox(height: 8),
                Text(
                  '${_prazoController.text} parcelas de',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  formatadorMoeda.format(_valorParcela),
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _entradaController.dispose();
    _prazoController.dispose();
    super.dispose();
  }
}