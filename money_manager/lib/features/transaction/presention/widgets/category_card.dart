import 'package:flutter/material.dart';

import '../../../../core/dependency_injection/injection_container.dart';
import '../controller/transaction_controller.dart';

class CategoryCard extends StatefulWidget {
  final String cardName;
  final IconData iconButton;
  const CategoryCard(
      {super.key, required this.cardName, required this.iconButton});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool selecionado = false;
  late final TransactionController controller;

  @override
  void initState() {
    super.initState();
    controller = sl<TransactionController>();
  }

  late int valorSelecionado;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.cardName,
      child: InkWell(
        onTap: () {
          setState(() {
            selecionado = !selecionado;
            valorSelecionado = 1;
            if (selecionado) {
              controller.transaction.category = widget.cardName;
            }
          });
        },
        child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 45,
          width: 45,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: selecionado
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Icon(widget.iconButton),
        ),
      ),
    );
  }
}
