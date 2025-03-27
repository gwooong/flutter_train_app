import 'package:flutter/material.dart';
import 'package:flutter_train_app/station_list_page.dart';
import 'seat_page.dart'; // SeatPage import 추가

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String departureStation = "선택";
  String arrivalStation = "선택";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("기차 예매"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역 & 도착역 감싸는 박스
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 출발역 (클릭 시 이동)
                  GestureDetector(
                    onTap: () async {
                      // 출발역 선택 후 선택한 역을 받아오기
                      final selectedStation = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StationListPage(),
                        ),
                      );

                      // 선택된 역이 null이 아닌 경우에만 갱신
                      if (selectedStation != null) {
                        setState(() {
                          departureStation = selectedStation;
                        });
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "출발역",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          departureStation,
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 세로선
                  Container(width: 2, height: 50, color: Colors.grey[400]),
                  // 도착역 (클릭 시 이동)
                  GestureDetector(
                    onTap: () async {
                      // 도착역 선택 후 선택한 역을 받아오기
                      final selectedStation = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StationListPage(),
                        ),
                      );

                      // 선택된 역이 null이 아닌 경우에만 갱신
                      if (selectedStation != null) {
                        setState(() {
                          arrivalStation = selectedStation;
                        });
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "도착역",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          arrivalStation,
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // 좌석 선택 버튼
            ElevatedButton(
              onPressed: () {
                // 좌석 선택 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SeatPage(), // SeatPage로 이동
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "좌석 선택",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
