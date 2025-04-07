import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supa_liquid/core/scaffold/nav/nav.dart';
import 'package:supa_liquid/core/scaffold/view/base_scaffold.dart';
import 'package:supa_liquid/features/public/bloc/public_bloc.dart';

import '../../../injection.dart';

class PublicPage extends StatelessWidget {
  const PublicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Public')),
      body: BlocProvider(
        create: (context) => PublicBloc(sl())..add(PublicEventStarted()),
        child: Builder(
          builder: (context) {
            return BlocBuilder<PublicBloc, PublicState>(
              builder: (context, state) {
                return Column(
                  children: [
                    ...state.companies.map((company) {
                      return ListTile(
                        title: Text(company.name),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<PublicBloc>().add(
                              PublicEventCreateCompany(),
                            );
                          },
                          icon: Icon(Icons.add),
                        ),
                      );
                    }),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
