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
    required this.eventDescription,
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
  String eventDescription;

  String get getAll {
    return "$name,$address,${(() {
      switch (category) {
        case Category.shrine:
          return '神社';
        case Category.temple:
          return '寺';
        case Category.ruins:
          return '遺跡';
        case Category.tomb:
          return '古墳';
        }
    })()},$year";
  }
}
