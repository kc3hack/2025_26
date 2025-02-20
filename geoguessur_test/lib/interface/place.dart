enum Category {
  shrine, // 神社
  temple, // 寺
  ruins, // 遺跡
  tomb, // 古墳
}

class Place {
  Place({
    required this.id,
    required this.name,
    required this.address,
    required this.category,
    required this.popularity,
    required this.year,
    this.imageUrl = 'assets/images/default.jpg',
  });
  /*
    place
    id: num
    name:str
    adress:srt
    category:str
    year:date
    popularity:
    url: str 
  */

  //途中
  int id;
  String name;
  String address;
  Category category;
  int popularity;
  String year;
  String imageUrl;
}
