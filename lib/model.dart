class Artist {
  late String name;
  String? link;
  String? about;

  Artist(this.name, this.link, this.about);

  Artist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['description'];
    about = json['about'];
  }
}
