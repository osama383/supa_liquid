import 'package:flutter/material.dart';
import 'package:supa_liquid/core/util/extensions/extensions.dart';

import '../../../../core/models/product/product.dart';

class DueDateWidget extends StatelessWidget {
  final Product product;
  const DueDateWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final labels = context.localizationLabels;
    return ListTile(
      title: Text(labels.dueDate),
      subtitle: Text(
        product.dueDateOption.fold(
          () => labels.notAvailableSymbol,
          (date) => date.toNumericMonthDayYear,
        ),
      ),
    );
  }
}
