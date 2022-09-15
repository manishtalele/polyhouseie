import 'package:flutter/material.dart';
import 'package:polyhouseie/api/tempfetch.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  List tempData = [];
  dynamic apiCall;

  @override
  void initState() {
    apiCall = fetchHomePage(name: "test");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiCall,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            tempData = snapshot.data as List;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: tempData[0].length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${tempData[0][index]["image"]}"),
                    ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ));
        });
  }
}
