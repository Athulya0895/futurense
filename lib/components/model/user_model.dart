// class User {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? street1;
//   String? street2;
//   String? city;
//   String? state;
//   String? country;
//   String? zipCode;
//   String? phone1;
//   String? phone2;
//   String? profilepic;
//   String? refferalcode;
//   int? rewarpoint;
//   User({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.city,
//     this.country,
//     this.phone1,
//     this.phone2,
//     this.state,
//     this.street1,
//     this.street2,
//     this.zipCode,
//     this.profilepic,
//     this.refferalcode,
//     this.rewarpoint,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//         id: json['id'],
//         firstName: json['first_name'],
//         lastName: json['last_name'],
//         email: json['email'],
//         street1: json['street_1'],
//         street2: json['street_2'],
//         city: json['city'],
//         state: json['state'],
//         country: json['country'],
//         zipCode: json['zip_code'],
//         phone1: json['phone_1'],
//         phone2: json['phone_2'],
//         refferalcode: json['referral_code'],
//         rewarpoint: json['reward_points']
//         // profilepic: json[''],
//         );
//   }

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       'id': id,
//       'first_name': firstName,
//       'last_name': lastName,
//       'email': email,
//       'street_1': street1,
//       'street_2': street2,
//       'city': city,
//       'state': state,
//       'country': country,
//       'zip_code': zipCode,
//       'phone_1': phone1,
//       'phone_2': phone2,
//       'referral_code': refferalcode,
//       'reward_points': rewarpoint,
//     };
//   }
// }
