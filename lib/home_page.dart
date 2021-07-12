import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;
  HomePage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Instagram Clon",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: EdgeInsets.all(
          8.0,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Instagram에 오신걸 환영합니다",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                    8.0,
                  )),
                  Text(
                    "사진과 동영상을 보려면 팔로우 하세요",
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      16.0,
                    ),
                  ),
                  SizedBox(
                    width: 260.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4.0,
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(
                                  1.0,
                                )),
                            SizedBox(
                              width: 80.0,
                              height: 80.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user.photoURL),
                            )),
                            Padding(
                                padding: EdgeInsets.all(
                              8.0,
                            )),
                            Text(
                              user.email,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(user.displayName),
                            Padding(
                                padding: EdgeInsets.all(
                              8.0,
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.network(
                                      'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MDhfMTE1%2FMDAxNjE3ODA4MTI0MTky.7BOu2x3BCnqBrbxgX947dVEnw8McE15kb0cGSuGMlwwg.J5RvB4VURuH_Y8RX6dHq2oFGVuniEVIdnk_Afcv9Kjcg.JPEG.6294ten%2FKakaoTalk_20210408_000304523_06.jpg&type=sc960_832',
                                      fit: BoxFit.cover),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(
                                      1.0,
                                    )),
                                SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.network(
                                      'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MDhfMTE1%2FMDAxNjE3ODA4MTI0MTky.7BOu2x3BCnqBrbxgX947dVEnw8McE15kb0cGSuGMlwwg.J5RvB4VURuH_Y8RX6dHq2oFGVuniEVIdnk_Afcv9Kjcg.JPEG.6294ten%2FKakaoTalk_20210408_000304523_06.jpg&type=sc960_832',
                                      fit: BoxFit.cover),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(
                                      1.0,
                                    )),
                                SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.network(
                                      'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MDhfMTE1%2FMDAxNjE3ODA4MTI0MTky.7BOu2x3BCnqBrbxgX947dVEnw8McE15kb0cGSuGMlwwg.J5RvB4VURuH_Y8RX6dHq2oFGVuniEVIdnk_Afcv9Kjcg.JPEG.6294ten%2FKakaoTalk_20210408_000304523_06.jpg&type=sc960_832',
                                      fit: BoxFit.cover),
                                ),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.all(
                                  1.0,
                                )),
                            Text('페이스북 친구'),
                            Padding(
                                padding: EdgeInsets.all(
                                  4.0,
                                )),
                            RaisedButton(
                              onPressed: () {},
                              child: Text("팔로우"),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                            ),
                            Padding(
                                padding: EdgeInsets.all(
                                  4.0,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
