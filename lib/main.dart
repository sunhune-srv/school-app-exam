import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return Scaffold(
      appBar: AppBar(
        title: Text("我的自傳"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
                             type: BottomNavigationBarType.fixed,
                             backgroundColor: Colors.blue,
                             selectedItemColor: Colors.white,
                             selectedFontSize: 18,
                             unselectedFontSize: 14,
                             iconSize: 30,
                             currentIndex: currentIndex,
                             items: [
                               BottomNavigationBarItem(icon: currentIndex==0? Image.asset('assets/a1.png', width: 40, height: 40,):Image.asset('assets/a11.png', width: 30, height: 30,), label:"自我介紹",),
                               BottomNavigationBarItem(icon: currentIndex==1? Image.asset('assets/a2.png', width: 40, height: 40,):Image.asset('assets/a21.png', width: 30, height: 30,), label:"學習歷程",),
                               BottomNavigationBarItem(icon: currentIndex==2? Image.asset('assets/a3.jpg', width: 40, height: 40,):Image.asset('assets/a31.jpg', width: 30, height: 30,), label:"學習計畫",),
                               BottomNavigationBarItem(icon: currentIndex==3? Image.asset('assets/a4.png', width: 40, height: 40,):Image.asset('assets/a41.png', width: 30, height: 30,), label:"專業方向",),
                             ],
                             onTap: (index) {
                               setState(() {
                                 previousIndex=currentIndex;
                                 currentIndex=index;
                                 if (index==0) {
                                    if (previousIndex==currentIndex) player.resume();
                                    player.stop();
                                    player.play(AssetSource("1.mp3"));
                                 }
                                 if (index==1) {
                                   if (previousIndex==currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("2.mp3"));
                                 }
                                 if (index==2) {
                                   if (previousIndex==currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("3.mp3"));
                                 }
                                 if (index==3) {
                                   if (previousIndex==currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("4.mp3"));
                                 }
                               });
                             },
                           ),
    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1 = "我出生且長期生活於南部，我的家庭成員有爸爸、媽媽、弟弟、我，我們家庭是屬於比較開明的教育方式，他們主要要求不危害影響到他人、不傷害自己、不違法，所以我從小就可以選擇自己喜歡的專業 目標父母基本上都會認可且給予一些建議。\n\n"
              "我在國中其實就發覺我對於資訊這個方面有興趣，一開始我是因為感覺能讓電腦依照自己的想法自動完成特定的事情很酷，而且這樣很多重複的小事情就不用自己去完成交給程序即可，所以在升高中時我是選擇讀資訊科，然而到了高中階段我也更肯定了我當初的選擇，實習課程確實與我想得差不多，且資訊科也有需要做一些硬體電路方面的，所以我就更感興趣了，因為這樣就可以完成更多的事情，而且專案的成品是看的到實體的，而不是只能在螢幕中看到。";




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //標題
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Text("Who am I", style: TextStyle(fontSize: 32,
                                                     fontWeight: FontWeight.bold),
                   ),
          ),
          //自傳部分
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3,),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6,6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20,)),
          ),
          SizedBox(height: 15),
          /*
          Container(
            color: Colors.redAccent,
            child: Image.asset('assets/a1.png'),
            width: 200,
            height: 200,
          ),

          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/a2.png'), fit: BoxFit.cover),
                ),
              ),
              //SizedBox(width: 10,),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/a3.jpg'), fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          */
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              YearSection(
                title: '大一時期',
                courses: [
                  '1. 計算機概論',
                  '2. 微積分',
                  '3. 數位邏輯設計',
                  '4. 計算機程式設計',
                  '5. 中文閱讀與表達',
                  '6. 實用英文',
                  '7. 藝術美感探索',
                  '8. 游泳課',
                ],
              ),
              SizedBox(height: 24),
              YearSection(
                title: '大二時期',
                courses: [
                  '1. 網際網路暨應用',
                  '2. 組合語言程式設計',
                  '3. 微積分',
                  '4. 互動式網頁程式設計',
                  '5. 計算機結構',
                  '6. 資料採集視覺化',
                  '7. 網際網路暨應用',
                  '8. 組合語言程式設計',
                  '9. 計算機結構',
                  '10. 實用英文',
                  '11. 中文閱讀與表達',
                  '12. 資料採集視覺化',
                  '13. 游泳課',
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class YearSection extends StatelessWidget {
  final String title;
  final List<String> courses;

  const YearSection({
    super.key,
    required this.title,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return Text(
              courses[index],
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
      ],
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("大三時期", style: TextStyle(fontSize: 24,)),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 140,
                //width: 200,
                child: ListView(
                  children: [
                    Text("1. 學好英文", style: TextStyle(fontSize: 20,)),
                    Text("2. 網路安全", style: TextStyle(fontSize: 20,)),
                    Text("3. 專題實作", style: TextStyle(fontSize: 20,)),
                    Text("4. 人際關係", style: TextStyle(fontSize: 20,)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("專業方向", style: TextStyle(fontSize: 24,)),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 400,
                //width: 200,
                child: ListView(
                  children: [
                    Text("1. 應用開發", style: TextStyle(fontSize: 20,)),
                    Text("2. Management Information System Engineer(MIS)", style: TextStyle(fontSize: 20,)),
                    Text("3. 網路、資訊安全", style: TextStyle(fontSize: 20,)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
