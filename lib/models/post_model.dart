class PostModel {
  String? user_id, category, title, price, bedroom, bathroom, image;
  PostModel(
      {required this.category,
      required this.title,
      required this.user_id,
      required this.price,
      required this.bathroom,
      required this.bedroom,
      required this.image});

  factory PostModel.fromJSON(Map json) {
    return PostModel(
        category: json['category'],
        title: json['title'],
        user_id: json['user_id'],
        price: json['price'],
        bathroom: json['bathroom'],
        bedroom: json['bedroom'],
        image: json['image']);
  }
}
