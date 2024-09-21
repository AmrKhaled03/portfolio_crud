class PropertiesModel {
  int? id;
  String? title;
  String? subTitle;
  String? description;
  PropertiesModel(
      {required this.id, this.title, this.subTitle, this.description});
  void updatedProp(String title,
      {required String subTitle, required String description}) {
    this.title = title;
    this.subTitle = subTitle;
    this.description = description;
  }
}
