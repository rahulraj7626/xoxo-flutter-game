import 'package:flutter/material.dart';
import 'package:simple_game/utils/xoxo_utils.dart';

class XoxoHome extends StatefulWidget {
  const XoxoHome({Key? key}) : super(key: key);

  @override
  State<XoxoHome> createState() => _XoxoHomeState();
}

class _XoxoHomeState extends State<XoxoHome> {
  var tiles = List.filled(9, 0);
  bool isMe = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        height: height,
        width: width,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  for (var i = 0; i < 9; i++)
                    Container(
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (tiles[i] == 0) {
                              if (isMe) {
                                tiles[i] = 1;
                                isMe = !isMe;
                              } else {
                                tiles[i] = 2;
                                isMe = !isMe;
                              }
                            }
                          });
                        },
                        child: Center(
                            child: Text(
                          tiles[i] == 0
                              ? ''
                              : tiles[i] == 1
                                  ? 'X'
                                  : 'O',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        )),
                      ),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                XoxoUtils().checkResult(isMe, tiles),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                size: 50,
                color: Colors.red[500],
              ),
              onPressed: () {
                setState(() {
                  tiles = List.filled(9, 0);
                });
              },
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
