import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supa_liquid/core/models/product/product.dart';
import 'package:supa_liquid/core/models/product/service_status.dart';
import 'package:supa_liquid/core/repository.dart';
import 'package:supa_liquid/core/util/extensions/extensions.dart';
import 'package:supa_liquid/core/widgets/modal_builder/modal_builder.dart';
import 'package:supa_liquid/features/customers/view/widgets/grease_details.dart';
import 'package:supa_liquid/features/customers/view/widgets/oil_details.dart';

import '../../../../core/models/customer/customer.dart';
import '../../../../injection.dart';
import '../../controller/customer_details/customer_details_bloc.dart';
part 'customer_general_tab.dart';

class CustomerDetailModal extends LongModal<CustomerDetailsBloc> {
  final CustomerDetailsBloc _bloc;
  CustomerDetailModal(Customer customer)
    : _bloc = CustomerDetailsBloc(customer);
  @override
  CustomerDetailsBloc get bloc => _bloc;

  @override
  Widget content(BuildContext context) {
    final labels = context.localizationLabels;
    return BlocBuilder<CustomerDetailsBloc, CustomerDetailsState>(
      builder: (context, state) {
        return DefaultTabController(
          length:
              1 +
              state.customer.products
                  .where((e) => e.status == ServiceStatus.active)
                  .length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                padding: const EdgeInsets.only(left: 8),
                tabs: [
                  Tab(text: labels.general),
                  ...state.customer.products.where((e) => e.isActive).map((e) {
                    return Tab(text: labels.products(e.type));
                  }),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const _CustomerGeneralTab(),
                    ...state.customer.products
                        .where((e) => e.status == ServiceStatus.active)
                        .map((e) {
                          return switch (e) {
                            Uco() => UcoDetails(e),
                            Grease() => GreaseDetails(e),
                          };
                        }),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Stream<bool> get isBusyStream => Stream.value(false);

  @override
  void popWithValue(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget title(BuildContext context) {
    return BlocBuilder<CustomerDetailsBloc, CustomerDetailsState>(
      builder: (context, state) {
        return Text(state.customer.name.getOrCrash);
      },
    );
  }
}
