// To parse this JSON data, do
//
//     final movie = movieFromMap(jsonString);

import 'dart:convert';

Movie movieFromMap(String str) => Movie.fromMap(json.decode(str));

String movieToMap(Movie data) => json.encode(data.toMap());

class Movie {
  Movie({
    this.count,
    this.start,
    this.total,
    this.subjects,
    this.title,
  });

  int count;
  int start;
  int total;
  List<Subject> subjects;
  String title;

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
    count: json["count"],
    start: json["start"],
    total: json["total"],
    subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromMap(x))),
    title: json["title"],
  );

  Map<String, dynamic> toMap() => {
    "count": count,
    "start": start,
    "total": total,
    "subjects": List<dynamic>.from(subjects.map((x) => x.toMap())),
    "title": title,
  };
}
int counter = 1;
class Subject {
  Subject({
    this.rating,
    this.genres,
    this.title,
    this.casts,
    this.durations,
    this.collectCount,
    this.mainlandPubdate,
    this.hasVideo,
    this.originalTitle,
    this.subtype,
    this.directors,
    this.pubdates,
    this.year,
    this.images,
    this.alt,
    this.id,
    this.rank,
  });

  Rating rating;
  List<String> genres;
  String title;
  List<Cast> casts;
  List<String> durations;
  int collectCount;
  String mainlandPubdate;
  bool hasVideo;
  String originalTitle;
  Subtype subtype;
  List<Cast> directors;
  List<String> pubdates;
  String year;
  Images images;
  String alt;
  String id;

  int rank;


  factory Subject.fromMap(Map<String, dynamic> json) => Subject(
    rating: Rating.fromMap(json["rating"]),
    genres: List<String>.from(json["genres"].map((x) => x)),
    title: json["title"],
    casts: List<Cast>.from(json["casts"].map((x) => Cast.fromMap(x))),
    durations: List<String>.from(json["durations"].map((x) => x)),
    collectCount: json["collect_count"],
    mainlandPubdate: json["mainland_pubdate"],
    hasVideo: json["has_video"],
    originalTitle: json["original_title"],
    subtype: subtypeValues.map[json["subtype"]],
    directors: List<Cast>.from(json["directors"].map((x) => Cast.fromMap(x))),
    pubdates: List<String>.from(json["pubdates"].map((x) => x)),
    year: json["year"],
    images: Images.fromMap(json["images"]),
    alt: json["alt"],
    id: json["id"],
    rank:counter++,
  );

  Map<String, dynamic> toMap() => {
    "rating": rating.toMap(),
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "title": title,
    "casts": List<dynamic>.from(casts.map((x) => x.toMap())),
    "durations": List<dynamic>.from(durations.map((x) => x)),
    "collect_count": collectCount,
    "mainland_pubdate": mainlandPubdate,
    "has_video": hasVideo,
    "original_title": originalTitle,
    "subtype": subtypeValues.reverse[subtype],
    "directors": List<dynamic>.from(directors.map((x) => x.toMap())),
    "pubdates": List<dynamic>.from(pubdates.map((x) => x)),
    "year": year,
    "images": images.toMap(),
    "alt": alt,
    "id": id,
  };
}

class Cast {
  Cast({
    this.avatars,
    this.nameEn,
    this.name,
    this.alt,
    this.id,
  });

  Images avatars;
  String nameEn;
  String name;
  String alt;
  String id;

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
    avatars: json["avatars"] == null ? null : Images.fromMap(json["avatars"]),
    nameEn: json["name_en"],
    name: json["name"],
    alt: json["alt"] == null ? null : json["alt"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toMap() => {
    "avatars": avatars == null ? null : avatars.toMap(),
    "name_en": nameEn,
    "name": name,
    "alt": alt == null ? null : alt,
    "id": id == null ? null : id,
  };
}

class Images {
  Images({
    this.small,
    this.large,
    this.medium,
  });

  String small;
  String large;
  String medium;

  factory Images.fromMap(Map<String, dynamic> json) => Images(
    small: json["small"],
    large: json["large"],
    medium: json["medium"],
  );

  Map<String, dynamic> toMap() => {
    "small": small,
    "large": large,
    "medium": medium,
  };
}

class Rating {
  Rating({
    this.max,
    this.average,
    this.details,
    this.stars,
    this.min,
  });

  int max;
  double average;
  Map<String, double> details;
  String stars;
  int min;

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
    max: json["max"],
    average: json["average"].toDouble(),
    details: Map.from(json["details"]).map((k, v) => MapEntry<String, double>(k, v)),
    stars: json["stars"],
    min: json["min"],
  );

  Map<String, dynamic> toMap() => {
    "max": max,
    "average": average,
    "details": Map.from(details).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "stars": stars,
    "min": min,
  };
}

enum Subtype { MOVIE }

final subtypeValues = EnumValues({
  "movie": Subtype.MOVIE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
