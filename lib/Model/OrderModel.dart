class OrderModel {
  final String total;
  final String image;
  final String currency;
  final double latitude;
  final double longitude;
  final List<MyItemModel> items;

  OrderModel({
    required this.total,
    required this.image,
    required this.currency,
    required this.latitude,
    required this.longitude,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<MyItemModel> items = [];
    if (json['items'] != null) {
      items = List<MyItemModel>.from(
          json['items'].map((item) => MyItemModel.fromJson(item)));
    }
    return OrderModel(
      total: json['total']??"",
      image:json['image']??"",
      currency:json['currency']??"",
      latitude: double.parse(json['address']['lat']),
      longitude: double.parse(json['address']['lng']),
      items: items,
    );
  }
}


class MyItemModel {
  final int id;
  final String name;
  final double price;

  MyItemModel({
    required this.id,
    required this.name,
    required this.price,
  });
  factory MyItemModel.fromJson(Map<String, dynamic> json) {
    return MyItemModel(
      id: json['id']??"",
      name: json['name']??"",
      price: double.parse(json['price']),
    );
  }
}