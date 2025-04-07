import 'package:flutter/material.dart';
import 'package:supa_liquid/core/util/extensions/extensions.dart';

import '../../../../../core/models/product/product.dart';

class ServiceEmailsWidget extends StatelessWidget {
  final Product product;
  const ServiceEmailsWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final labels = context.localizationLabels;
    return ListTile(
      title: Text(labels.serviceNotification),
      subtitle: Text(
        product.serviceNotificationEmails.isEmpty
            ? labels.hyphen
            : product.serviceNotificationEmails
                .map((e) => e.getOrCrash)
                .join(', '),
      ),
      onTap: () {
        // shortFormModal(
        //   title: 'Manage emails',
        //   inputs: [
        //     Input.collection(
        //       EmailAddress('input@gmail.com'),
        //       labelText: 'collection',
        //     ),
        //   ],
        //   submitHook: (inputs) async {},
        // ).show();
      },
    );
  }
}
