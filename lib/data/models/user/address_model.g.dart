// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      city: json['city'] as String?,
      street: json['street'] as String?,
      number: json['number'] as int?,
      zipCode: json['zipcode'] as String?,
      location: json['geolocation'] == null
          ? null
          : LocationModel.fromJson(json['geolocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'number': instance.number,
      'zipcode': instance.zipCode,
      'geolocation': instance.location,
    };
