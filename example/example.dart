import 'package:fetchx/fetchx.dart';

void main() async {
  //Get Request
  get();

  //Put Request
  put();

  //Post Request
  post();

  //Patch Request
  patch();

  //Delete Request
  delete();

  //Making Requests and return the model Type - Single Model
  getModel();

  //Making Requests and return the model Type - List of Model
  getListModel();
}

void get() async {
  const String baseUrl = "https://jsonplaceholder.ir/users/1";
  final Response response = await baseUrl.get();
  print(response.json);
}

void put() async {
  const String baseUrl = "https://jsonplaceholder.ir/posts/6";
  final Response response =
      await baseUrl.put({"title": "foo", "body": "bar", "userId": 4});
  print(response.json);
}

void post() async {
  const String baseUrl = "https://jsonplaceholder.ir/posts";
  final Response response =
      await baseUrl.post({"title": "foo", "body": "bar", "userId": 4});

  print(response.json);
}

void patch() async {
  const String baseUrl = "https://jsonplaceholder.ir/posts/6";
  final Response response = await baseUrl.patch({"title": "test 6"});
  print(response.json);
}

void delete() async {
  const String baseUrl = "https://jsonplaceholder.ir/posts/6";
  final Response response = await baseUrl.delete();
  print(response.json);
}

void getModel() async {
  const String baseUrl = "https://jsonplaceholder.ir/users/1";
  final User user = await baseUrl.get().to<User>(() => User());
  print(user.address!.alley);
}

void getListModel() async {
  const String baseUrl = "https://jsonplaceholder.ir/users";
  final List<User> users = await baseUrl.get().toList<User>(() => User());
  for (var element in users) {
    print(element.username);
  }
}

class User extends BaseModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final String? company;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  @override
  User fromJson(dynamic json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address().fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: json['company'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address!.toJson(),
      'phone': phone,
      'website': website,
      'company': company
    };
  }
}

class Address extends BaseModel {
  final String? country;
  final String? city;
  final String? street;
  final String? alley;
  final int? number;
  final Map? geo;

  Address(
      {this.country,
      this.city,
      this.street,
      this.alley,
      this.number,
      this.geo});

  @override
  Address fromJson(json) {
    return Address(
      country: json['country'],
      city: json['city'],
      street: json['street'],
      alley: json['alley'],
      number: json['number'],
      geo: json['geo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
