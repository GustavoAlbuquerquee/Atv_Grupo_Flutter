import 'package:flutter/material.dart';
import 'screens/lista_veiculos_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const FinanciamentoApp());
}

class FinanciamentoApp extends StatelessWidget {
  const FinanciamentoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulador de Financiamento',
      // Aplicando nosso tema personalizado!
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false, // Remove o banner de debug
      home: const ListaVeiculosScreen(),
    );
  }
}