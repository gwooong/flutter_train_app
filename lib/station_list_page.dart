import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final List<String> stations = [
    "수서",
    "동탄",
    "평택지제",
    "천안아산",
    "오송",
    "대전",
    "김천구미",
    "동대구",
    "경주",
    "울산",
    "부산",
  ];

  StationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("기차역 선택"), centerTitle: true),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pop(context, stations[index]);
            },
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Text(
                stations[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
