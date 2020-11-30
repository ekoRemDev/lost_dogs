class Dog {
  String breed;
  String gender;
  String color;
  String location;
  String imageUrl;
  String description;

  Dog({
    this.breed,
    this.gender,
    this.color,
    this.location,
    this.imageUrl,
    this.description,
  });

  factory Dog.fromJson(Map<String, dynamic> parsedJson) {
    return Dog(
        breed: parsedJson['breed'],
        gender: parsedJson['gender'],
        color: parsedJson['color'],
        location: parsedJson['location'],
        imageUrl: parsedJson['imageUrl'],
        description: parsedJson['description'],
    );
  }
}
