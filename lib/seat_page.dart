import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({super.key});

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  List<List<bool>> seats = List.generate(
    20,
    (_) => List.generate(4, (_) => false),
  );

  void toggleSeat(int row, int col) {
    setState(() {
      seats[row][col] = !seats[row][col];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("좌석 선택"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  ["A", "B", "C", "D"].map((label) {
                    return Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(label, style: TextStyle(fontSize: 18)),
                    );
                  }).toList(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, row) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "${row + 1}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(width: 10),
                        ...List.generate(4, (col) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: GestureDetector(
                              onTap: () => toggleSeat(row, col),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:
                                      seats[row][col]
                                          ? Colors.purple
                                          : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              ),
              child: Text(
                "예매 하기",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
