// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'public_bloc.dart';

class PublicStateMapper extends ClassMapperBase<PublicState> {
  PublicStateMapper._();

  static PublicStateMapper? _instance;
  static PublicStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PublicStateMapper._());
      CompanyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PublicState';

  static List<Company> _$companies(PublicState v) => v.companies;
  static const Field<PublicState, List<Company>> _f$companies =
      Field('companies', _$companies);

  @override
  final MappableFields<PublicState> fields = const {
    #companies: _f$companies,
  };

  static PublicState _instantiate(DecodingData data) {
    return PublicState(companies: data.dec(_f$companies));
  }

  @override
  final Function instantiate = _instantiate;

  static PublicState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PublicState>(map);
  }

  static PublicState fromJson(String json) {
    return ensureInitialized().decodeJson<PublicState>(json);
  }
}

mixin PublicStateMappable {
  String toJson() {
    return PublicStateMapper.ensureInitialized()
        .encodeJson<PublicState>(this as PublicState);
  }

  Map<String, dynamic> toMap() {
    return PublicStateMapper.ensureInitialized()
        .encodeMap<PublicState>(this as PublicState);
  }

  PublicStateCopyWith<PublicState, PublicState, PublicState> get copyWith =>
      _PublicStateCopyWithImpl<PublicState, PublicState>(
          this as PublicState, $identity, $identity);
  @override
  String toString() {
    return PublicStateMapper.ensureInitialized()
        .stringifyValue(this as PublicState);
  }

  @override
  bool operator ==(Object other) {
    return PublicStateMapper.ensureInitialized()
        .equalsValue(this as PublicState, other);
  }

  @override
  int get hashCode {
    return PublicStateMapper.ensureInitialized().hashValue(this as PublicState);
  }
}

extension PublicStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PublicState, $Out> {
  PublicStateCopyWith<$R, PublicState, $Out> get $asPublicState =>
      $base.as((v, t, t2) => _PublicStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PublicStateCopyWith<$R, $In extends PublicState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Company, CompanyCopyWith<$R, Company, Company>>
      get companies;
  $R call({List<Company>? companies});
  PublicStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PublicStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PublicState, $Out>
    implements PublicStateCopyWith<$R, PublicState, $Out> {
  _PublicStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PublicState> $mapper =
      PublicStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Company, CompanyCopyWith<$R, Company, Company>>
      get companies => ListCopyWith($value.companies,
          (v, t) => v.copyWith.$chain(t), (v) => call(companies: v));
  @override
  $R call({List<Company>? companies}) =>
      $apply(FieldCopyWithData({if (companies != null) #companies: companies}));
  @override
  PublicState $make(CopyWithData data) =>
      PublicState(companies: data.get(#companies, or: $value.companies));

  @override
  PublicStateCopyWith<$R2, PublicState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PublicStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
