class Category {
  late String name;
  late String image;

  Category();

  Category.init(this.name, this.image);

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['body'] = image;
    return data;
  }
}
