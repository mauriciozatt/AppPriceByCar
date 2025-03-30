import 'package:flutter/material.dart';

class CardVeiculosVendaComponent extends StatelessWidget {
  const CardVeiculosVendaComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 140,
        width: 340,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow(
              label: 'Veículos à venda',
              value: '120',
              valueColor: Colors.green,
            ),
            const Divider(thickness: 1, color: Colors.white),
            _buildRow(
              label: 'Veículos vendidos',
              value: '10',
              valueColor: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({
    required String label,
    required String value,
    required Color valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'FontePersonalizada2',
            color: Colors.black,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: valueColor, shape: BoxShape.circle),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'FontePersonalizada2',
            ),
          ),
        ),
      ],
    );
  }
}
