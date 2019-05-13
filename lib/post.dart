class Post {
  final String number;
  final String description;
  final int unitPacks;
  final int packPrice;
  final int valueIncludedVat;

  Post(
      {this.number,
      this.description,
      this.unitPacks,
      this.packPrice,
      this.valueIncludedVat});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      number: json['number'] as String,
      description: json['description'] as String,
      unitPacks: json['unitPacks'] as int,
      packPrice: json['packPrice'] as int,
      valueIncludedVat: json['valueIncludedVat'] as int,
    );
  }
}
