class Modell {
  int id, specialForm, price;
  List<dynamic> img;
  String title,
      trainerImg,
      date,
      interest,
      address,
      trainerName,
      trainerInfo,
      occasionDetail,
      latitude,
      longitude;
  bool isLiked, isSold, isPrivateEvent, hiddenCashPayment;

  //questionnaire	null
  //questExplanation	null
  List<dynamic> reserveTypes;

  Modell(
      {this.id,
      this.specialForm,
      this.title,
      this.img,
      this.trainerImg,
      this.price,
      this.date,
      this.interest,
      this.address,
      this.trainerName,
      this.trainerInfo,
      this.occasionDetail,
      this.latitude,
      this.longitude,
      this.isLiked,
      this.isSold,
      this.hiddenCashPayment,
      this.isPrivateEvent,
      this.reserveTypes});

  factory Modell.fromJson(Map<String, dynamic> json) {
    return Modell(
        id: json['id'] as int,
        specialForm: json['specialForm'] as int,
        title: json['title'] as String,
        img: json['img'] as List<dynamic>,
        trainerImg: json['trainerImg'] as String,
        price: json['price'] as int,
        date: json['date'] as String,
        interest: json['interest'] as String,
        address: json['address'] as String,
        trainerName: json['trainerName'] as String,
        trainerInfo: json['trainerInfo'] as String,
        occasionDetail: json['occasionDetail'] as String,
        latitude: json['latitude'] as String,
        longitude: json['longitude'] as String,
        isLiked: json['isLiked'] as bool,
        isSold: json['isSold'] as bool,
        hiddenCashPayment: json['hiddenCashPayment'] as bool,
        isPrivateEvent: json['isPrivateEvent'] as bool,
        reserveTypes: json['reservTypes']);
  }
}
