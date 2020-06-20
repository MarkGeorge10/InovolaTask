import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'Constants/constants.dart';
import 'Models/ReserveTypeModel.dart';
import 'Models/modell.dart';
import 'Networks.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Network nn = new Network();

  Future<Modell> futureAlbum;
  ReserveTypeModel reserveType = new ReserveTypeModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = nn.certainService(api + details);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Modell>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> imgData = (snapshot.data.img);

          return Column(
            children: <Widget>[
              Expanded(
                child: buildSlider(imgData),
                flex: 1,
              ),
              Expanded(
                child: buildBody(snapshot.data),
                flex: 2,
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    ));
  }

  Widget buildSlider(List<dynamic> sliderImgs) {
    return Swiper(
      itemCount: sliderImgs.length,
      physics: NeverScrollableScrollPhysics(),
      //autoplayDelay: 5,
      //index: 5,

      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          sliderImgs[index],
          fit: BoxFit.fill,
        );
      },
      pagination: new SwiperPagination(
          alignment: Alignment.bottomLeft, margin: EdgeInsets.only(top: 5)),
      //control: new SwiperControl(),

      autoplay: true,
      duration: 500,
    );
  }

  Widget buildBody(Modell data) {
    List<ReserveTypeModel> reservesdata =
        reserveType.getReserveTypeModel(data.reserveTypes);

    print(data.trainerImg);

    //DateTime dt = DateTime.parse(data.date);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "#" + data.interest,
                style: TextStyle(color: Colors.grey[600]),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  data.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.date_range,
                    //color: Colors.grey[400],
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Text(data.date.substring(0, 10)))
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.brightness_1,
                    //color: Colors.grey[400],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: Text(
                      data.title,
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(data.trainerImg),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: Text(data.trainerName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  )
                ],
              ),
              Text(data.trainerInfo),
              Divider(
                color: Colors.grey,
              ),
              Text("عن الدورة", style: TextStyle(fontWeight: FontWeight.w600)),
              Container(
                  margin: EdgeInsets.all(8), child: Text(data.occasionDetail)),
              Divider(
                color: Colors.grey,
              ),
              reservationTypesUI(reservesdata),
              reservationButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget reservationTypesUI(List<ReserveTypeModel> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "تكلفة الدورة",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 12,
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.only(right: 10.0),
                      child: Text(
                        data[index].name,
                      ),
                    ),
                    Text("SAR " + "${data[index].price}")
                  ],
                );
              }),
        ),
      ],
    );
  }

  Widget reservationButton() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "قم بالحجز الان",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
        ),
        color: Colors.deepPurpleAccent,
        minWidth: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 16,
      ),
    );
  }
}
