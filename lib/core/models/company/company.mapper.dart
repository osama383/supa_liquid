// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'company.dart';

class CompanyMapper extends ClassMapperBase<Company> {
  CompanyMapper._();

  static CompanyMapper? _instance;
  static CompanyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CompanyMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Company';

  static String _$id(Company v) => v.id;
  static const Field<Company, String> _f$id = Field('id', _$id);
  static String _$name(Company v) => v.name;
  static const Field<Company, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Company> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static Company _instantiate(DecodingData data) {
    return Company(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Company fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Company>(map);
  }

  static Company fromJson(String json) {
    return ensureInitialized().decodeJson<Company>(json);
  }
}

mixin CompanyMappable {
  String toJson() {
    return CompanyMapper.ensureInitialized()
        .encodeJson<Company>(this as Company);
  }

  Map<String, dynamic> toMap() {
    return CompanyMapper.ensureInitialized()
        .encodeMap<Company>(this as Company);
  }

  CompanyCopyWith<Company, Company, Company> get copyWith =>
      _CompanyCopyWithImpl<Company, Company>(
          this as Company, $identity, $identity);
  @override
  String toString() {
    return CompanyMapper.ensureInitialized().stringifyValue(this as Company);
  }

  @override
  bool operator ==(Object other) {
    return CompanyMapper.ensureInitialized()
        .equalsValue(this as Company, other);
  }

  @override
  int get hashCode {
    return CompanyMapper.ensureInitialized().hashValue(this as Company);
  }
}

extension CompanyValueCopy<$R, $Out> on ObjectCopyWith<$R, Company, $Out> {
  CompanyCopyWith<$R, Company, $Out> get $asCompany =>
      $base.as((v, t, t2) => _CompanyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CompanyCopyWith<$R, $In extends Company, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name});
  CompanyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CompanyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Company, $Out>
    implements CompanyCopyWith<$R, Company, $Out> {
  _CompanyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Company> $mapper =
      CompanyMapper.ensureInitialized();
  @override
  $R call({String? id, String? name}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (name != null) #name: name}));
  @override
  Company $make(CopyWithData data) => Company(
      id: data.get(#id, or: $value.id), name: data.get(#name, or: $value.name));

  @override
  CompanyCopyWith<$R2, Company, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CompanyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
