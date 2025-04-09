import 'package:dart_mappable/dart_mappable.dart';
import 'package:faker/faker.dart' hide Address;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:supa_liquid/core/models/assets/assets.dart';
import 'package:supa_liquid/core/models/company/company.dart';
import 'package:supa_liquid/core/models/utc.dart';
import 'package:supa_liquid/core/models/value_object/mappers.dart';
import 'package:supa_liquid/core/models/volume/volume.dart';
import 'package:supa_liquid/injection.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:timezone/browser.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/models/address/address.dart';
import 'core/models/customer/customer.dart';
import 'core/models/value_object/value_object.dart';
import 'core/routes/routes.dart';
import 'features/auth/data/auth.dart';
// import 'core/routes/routes.dart';
// import 'features/auth/data/auth.dart';
// import 'firebase_options.dart';

void main() async {
  usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  MapperContainer.globals.use(const VStringMapper());
  MapperContainer.globals.use(const VolumeMapper());
  MapperContainer.globals.use(const EmailMapper());
  MapperContainer.globals.use(const LatLngMapper());
  MapperContainer.globals.use(const OptionUtcMapper());

  await Supabase.initialize(
    url: 'https://xqjfjbljpsnhnzeaviqo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhxamZqYmxqcHNuaG56ZWF2aXFvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI5MjM0NDksImV4cCI6MjA1ODQ5OTQ0OX0.k10X8UHlToPBkRFynWEHkUN6DrdXBL52kBYqUzeUjCs',
  );

  configureDependencies();
  //ensure URL changes in the address bar when using push / pushNamed
  // more info here: https://docs.google.com/document/d/1VCuB85D5kYxPR3qYOjVmw8boAGKb7k62heFyfFHTOvw/edit
  // GoRouter.optionURLReflectsImperativeAPIs = true;
  sl<Auth>().currentUserStream.listen((event) {
    goRouter.refresh();
  });
  sl<Auth>().currentCompanyStream.listen((event) {
    goRouter.refresh();
  });
  // await sl<Auth>().started();
  await initializeTimeZone();
  _funky();
  runApp(const Supaliquid());
}

_funky() async {
  final List<Map<String, dynamic>> result = await Supabase.instance.client.rpc(
    'fn_my_company',
  );
  final companies = result.map((e) => CompanyMapper.fromMap(e));
  print(companies);
  final fakeCustomer = Customer(
    id: faker.guid.guid(),
    name: VString(faker.person.name()),
    address: Address(
      VString(faker.address.streetAddress()),
      LatLng(faker.geo.latitude(), faker.geo.longitude()),
    ),
    createdDate: Utc(faker.date.dateTime()),
    locationNotes: faker.randomGenerator.string(10),
    products: {},
  );

  print(fakeCustomer.toMap());
}
