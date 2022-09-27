class PostModel {
  String? user_id,
      category,
      title,
      price,
      bedroom,
      bathroom,
      image,
      post_details;
  PostModel(
      {required this.category,
      required this.title,
      required this.user_id,
      required this.price,
      required this.bathroom,
      required this.bedroom,
      required this.image,
      required this.post_details});

  factory PostModel.fromJSON(Map json) {
    return PostModel(
        category: json['category'],
        title: json['title'],
        user_id: json['user_id'],
        price: json['price'],
        bathroom: json['bathroom'],
        bedroom: json['bedroom'],
        image: json['image'],
        post_details: json['post_details']);
  }
}
