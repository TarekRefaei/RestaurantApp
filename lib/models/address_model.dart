import 'package:equatable/equatable.dart';

class Address extends Equatable {

  final String addressName;
  final String streetName;


  const Address({required this.addressName, required this.streetName});


  @override
  List<Object?> get props => [addressName,streetName];


  static List<Address> address =[
    const Address(addressName: "HomeAddress", streetName:"StreetName"),
    const Address(addressName: "WorkAddress", streetName:"StreetName"),
  ];
}