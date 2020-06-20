class ReserveTypeModel {
  int id, count;
  String name;
  int price;

  ReserveTypeModel({this.id, this.name, this.count, this.price});

  getReserveTypeModel(List<dynamic> json) {
    List<ReserveTypeModel> reservesList = new List<ReserveTypeModel>();
    for (int i = 0; i < json.length; i++) {
      reservesList.add(ReserveTypeModel(
          id: json[i]['id'] as int,
          name: json[i]['name'],
          count: json[i]['count'] as int,
          price: json[i]['price'] as int));
    }

    return reservesList;
  }
}
