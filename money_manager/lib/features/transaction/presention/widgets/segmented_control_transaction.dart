import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

import '../controller/transaction_controller.dart';

class SegmentedControlTransaction extends StatefulWidget {
  final int currentSelection;
  final TransactionController controller;
  const SegmentedControlTransaction(
      {super.key, required this.currentSelection, required this.controller});

  @override
  State<SegmentedControlTransaction> createState() =>
      _SegmentedControlTransactionState();
}

class _SegmentedControlTransactionState
    extends State<SegmentedControlTransaction> {
  int _currentSelection = 0;

  @override
  void initState() {
    super.initState();
    _currentSelection = widget.currentSelection;
    widget.controller.updatedListTransaction(_currentSelection);
  }

  final Map<int, Widget> _children = {
    0: const SizedBox(
      width: 80,
      child: Center(child: Text('Ano')),
    ),
    1: const SizedBox(
      width: 80,
      child: Center(child: Text('Mês')),
    ),
    2: const SizedBox(
      width: 80,
      child: Center(child: Text('Dia')),
    ),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialSegmentedControl(
      children: _children,
      selectionIndex: _currentSelection,
      borderColor: Colors.grey,
      selectedColor: Theme.of(context).colorScheme.primary,
      unselectedColor: Colors.white,
      borderRadius: 32.0,
      disabledChildren: const [
        3,
      ],
      onSegmentChosen: (index) {
        setState(() {
          _currentSelection = index;
          widget.controller.updatedListTransaction(_currentSelection);
        });
      },
    );
  }
}
