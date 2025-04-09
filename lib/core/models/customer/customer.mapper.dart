// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'customer.dart';

class CustomerMapper extends ClassMapperBase<Customer> {
  CustomerMapper._();

  static CustomerMapper? _instance;
  static CustomerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CustomerMapper._());
      AddressMapper.ensureInitialized();
      UtcMapper.ensureInitialized();
      ProductMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Customer';

  static String _$id(Customer v) => v.id;
  static const Field<Customer, String> _f$id = Field('id', _$id);
  static VString _$name(Customer v) => v.name;
  static const Field<Customer, VString> _f$name = Field('name', _$name);
  static Address _$address(Customer v) => v.address;
  static const Field<Customer, Address> _f$address =
      Field('address', _$address);
  static Utc _$createdDate(Customer v) => v.createdDate;
  static const Field<Customer, Utc> _f$createdDate =
      Field('createdDate', _$createdDate, key: r'created_date');
  static String _$locationNotes(Customer v) => v.locationNotes;
  static const Field<Customer, String> _f$locationNotes =
      Field('locationNotes', _$locationNotes, key: r'location_notes');
  static Set<Product> _$products(Customer v) => v.products;
  static const Field<Customer, Set<Product>> _f$products =
      Field('products', _$products);

  @override
  final MappableFields<Customer> fields = const {
    #id: _f$id,
    #name: _f$name,
    #address: _f$address,
    #createdDate: _f$createdDate,
    #locationNotes: _f$locationNotes,
    #products: _f$products,
  };

  static Customer _instantiate(DecodingData data) {
    return Customer(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        address: data.dec(_f$address),
        createdDate: data.dec(_f$createdDate),
        locationNotes: data.dec(_f$locationNotes),
        products: data.dec(_f$products));
  }

  @override
  final Function instantiate = _instantiate;

  static Customer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Customer>(map);
  }

  static Customer fromJson(String json) {
    return ensureInitialized().decodeJson<Customer>(json);
  }
}

mixin CustomerMappable {
  String toJson() {
    return CustomerMapper.ensureInitialized()
        .encodeJson<Customer>(this as Customer);
  }

  Map<String, dynamic> toMap() {
    return CustomerMapper.ensureInitialized()
        .encodeMap<Customer>(this as Customer);
  }

  CustomerCopyWith<Customer, Customer, Customer> get copyWith =>
      _CustomerCopyWithImpl<Customer, Customer>(
          this as Customer, $identity, $identity);
  @override
  String toString() {
    return CustomerMapper.ensureInitialized().stringifyValue(this as Customer);
  }

  @override
  bool operator ==(Object other) {
    return CustomerMapper.ensureInitialized()
        .equalsValue(this as Customer, other);
  }

  @override
  int get hashCode {
    return CustomerMapper.ensureInitialized().hashValue(this as Customer);
  }
}

extension CustomerValueCopy<$R, $Out> on ObjectCopyWith<$R, Customer, $Out> {
  CustomerCopyWith<$R, Customer, $Out> get $asCustomer =>
      $base.as((v, t, t2) => _CustomerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CustomerCopyWith<$R, $In extends Customer, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AddressCopyWith<$R, Address, Address> get address;
  UtcCopyWith<$R, Utc, Utc> get createdDate;
  $R call(
      {String? id,
      VString? name,
      Address? address,
      Utc? createdDate,
      String? locationNotes,
      Set<Product>? products});
  CustomerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CustomerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Customer, $Out>
    implements CustomerCopyWith<$R, Customer, $Out> {
  _CustomerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Customer> $mapper =
      CustomerMapper.ensureInitialized();
  @override
  AddressCopyWith<$R, Address, Address> get address =>
      $value.address.copyWith.$chain((v) => call(address: v));
  @override
  UtcCopyWith<$R, Utc, Utc> get createdDate =>
      $value.createdDate.copyWith.$chain((v) => call(createdDate: v));
  @override
  $R call(
          {String? id,
          VString? name,
          Address? address,
          Utc? createdDate,
          String? locationNotes,
          Set<Product>? products}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (address != null) #address: address,
        if (createdDate != null) #createdDate: createdDate,
        if (locationNotes != null) #locationNotes: locationNotes,
        if (products != null) #products: products
      }));
  @override
  Customer $make(CopyWithData data) => Customer(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      address: data.get(#address, or: $value.address),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      locationNotes: data.get(#locationNotes, or: $value.locationNotes),
      products: data.get(#products, or: $value.products));

  @override
  CustomerCopyWith<$R2, Customer, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CustomerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
