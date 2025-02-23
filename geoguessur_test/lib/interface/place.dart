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
    this.eventName = '',
    this.eventDescription = '',
    this.eventImageUrl = '',
    this.description = '',
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
  int year;
  String imageUrl;
  String eventName;
  String eventDescription;
  String eventImageUrl;
  String description;

  String get getEra {
    if (year < 250) return '原始';
    if (year < 1185) return '古代';
    if (year < 1603) return '中世';
    if (year < 1868) return '近世';
    if (year < 1945) return '近代';
    return '現代';
  }

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
    })()},${year.toString()},$getEra";
  }
}
