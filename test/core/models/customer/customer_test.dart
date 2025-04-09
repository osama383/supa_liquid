import 'package:faker/faker.dart' hide Address;
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:supa_liquid/core/models/address/address.dart';
import 'package:supa_liquid/core/models/customer/customer.dart';
import 'package:supa_liquid/core/models/utc.dart';
import 'package:supa_liquid/core/models/value_object/value_object.dart';

void main() {
  test('toMap', () {
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
  });
}
