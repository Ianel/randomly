class Photo {
  String imageUrl;

  Photo({required this.imageUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      imageUrl: json["urls"]["small"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "imageUrl": imageUrl,
    };
  }
}
