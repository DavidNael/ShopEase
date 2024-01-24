class UserModel {
  String id;
  String userName;
  String email;
  String phoneNumber;
  String password;
  String address;
  String photoUrl;
  List<String> cart;
  List<String> favorites;
  List<String> productsHistory;
  List<String> ordersHistory;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.address,
    required this.photoUrl,
    required this.cart,
    required this.favorites,
    required this.productsHistory,
    required this.ordersHistory,
  });

  factory UserModel.newUser({
    String id = '',
    required String userName,
    required String email,
    required String phoneNumber,
    required String password,
    String address = '',
    String photoUrl = '',
    List<String> cart = const [],
    List<String> favorites = const [],
    List<String> productsHistory = const [],
    List<String> ordersHistory = const [],
  }) {
    return UserModel(
      id: id,
      userName: userName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      address: address,
      photoUrl: photoUrl,
      cart: cart,
      favorites: favorites,
      productsHistory: productsHistory,
      ordersHistory: ordersHistory,
    );
  }
  factory UserModel.loginRequest({
    String id = '',
    String userName = '',
    required String email,
    String phoneNumber = '',
    required String password,
    String address = '',
    String photoUrl = '',
    List<String> cart = const [],
    List<String> favorites = const [],
    List<String> productsHistory = const [],
    List<String> ordersHistory = const [],
  }) {
    return UserModel(
      id: id,
      userName: userName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      address: address,
      photoUrl: photoUrl,
      cart: cart,
      favorites: favorites,
      productsHistory: productsHistory,
      ordersHistory: ordersHistory,
    );
  }
  factory UserModel.debugUser({
    String id = 'debug',
    String userName = 'Test User',
    String email = "1",
    String phoneNumber = '1234567890',
    String password = "1",
    String address = 'This is a debug user.',
    String photoUrl = '',
    List<String> cart = const [],
    List<String> favorites = const [],
    List<String> productsHistory = const [],
    List<String> ordersHistory = const [],
  }) {
    return UserModel(
      id: id,
      userName: userName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      address: address,
      photoUrl: photoUrl,
      cart: cart,
      favorites: favorites,
      productsHistory: productsHistory,
      ordersHistory: ordersHistory,
    );
  }

  UserModel copyWith({
    String? id,
    String? userName,
    String? email,
    String? phoneNumber,
    String? password,
    String? address,
    String? photoUrl,
    List<String>? cart,
    List<String>? favorites,
    List<String>? productsHistory,
    List<String>? ordersHistory,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      address: address ?? this.address,
      photoUrl: photoUrl ?? this.photoUrl,
      cart: cart ?? this.cart,
      favorites: favorites ?? this.favorites,
      productsHistory: productsHistory ?? this.productsHistory,
      ordersHistory: ordersHistory ?? this.ordersHistory,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'address': address,
      'photoUrl': photoUrl,
      'cart': cart,
      'favorites': favorites,
      'productsHistory': productsHistory,
      'ordersHistory': ordersHistory,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      address: json['address'],
      photoUrl: json['photoUrl'],
      cart: List<String>.from(json['cart']),
      favorites: List<String>.from(json['favorites']),
      productsHistory: List<String>.from(json['productsHistory']),
      ordersHistory: List<String>.from(json['ordersHistory']),
    );
  }
}
