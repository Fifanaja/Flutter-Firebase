import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onboarding_screen/screen/home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Son Chae Young",
      body:
          "สวัสดีค่ะ 🌟 ร่วมสนุกกับเพลงและความน่ารักไปด้วยกันนะคะ! 💖🎶 ติดตามเราได้ที่ TWICE เพื่อไม่พลาดข่าวสารและเพลงใหม่ๆ จากเรานะคะ! 😊✨ ขอบคุณที่รับฟังและร่วมสนุกกับเราค่ะ! 🌈🎤",
      footer: SizedBox(
        width: 45,
        height: 120,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 145, 235, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(160)),
                elevation: 8),
            onPressed: () {},
            child: const Text("ฟังเพลงของเรา💖")),
      ),
      image: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/c/ca/20220121%E2%80%94Chaeyoung_%EC%B1%84%EC%98%81_Campaign_Film%2C_Pearlygates_x_Twice_2022.jpg'),
    ),
    PageViewModel(
      title: "Shin Ryu-jin",
      body:
          "สวัสดีค่ะ! ทุกคนสบายดีหรือเปล่านะ? 🌈💖 อย่าลืมติดตามเราที่ ITZY เพื่อรับความสนุกและความประทับใจทุกวันนะคะ! 😄✨ ขอบคุณทุกคนที่เป็นส่วนหนึ่งของครอบครัวเรานะคะ! 🙏💕 อย่าลืมให้โลกรู้ว่าคุณคือแสงสว่างในวันที่มืดมนนี้นะคะ! 🌟🌙",
      footer: SizedBox(
        width: 45,
        height: 120,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 145, 235, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(160)),
                elevation: 8),
            onPressed: () {},
            child: const Text("ฟังเพลงของเรา🌈")),
      ),
      image: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/a/a6/Shin_Ryu-jin_at_graduation_from_Hanlim_Multi_Art_School_on_February_7%2C_2020_%282%29.jpg'),
    ),
    PageViewModel(
      title: "Song Yugi",
      body:
          "สวัสดีค่ะ! 🌈✨ที่มาพร้อมกับเสียงเพลงที่จะทำให้ใจคุณเต้นรำไปด้วยความสุข! 🎵💃 ติดตามเราที่ (G)I-DLE เพื่อเข้าถึงเพลงและเรื่องราวที่เต็มไปด้วยความพิเศษนะคะ! 😊🌟 ขอบคุณที่รับฟังและเป็นส่วนหนึ่งของครอบครัวเราเสมอนะคะ! 💖🌟 มีความสุขและมีวันที่ดีทุกวันค่ะ! 🚀🌈",
      footer: SizedBox(
        width: 45,
        height: 120,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 145, 235, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(160)),
                elevation: 8),
            onPressed: () {},
            child: const Text("ฟังเพลงของเรา🚀")),
      ),
      image: Image.network(
          'https://i.scdn.co/image/ab6761610000e5eb5d1e7a339dc928b7e54c530c'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 112, 238),
        title: const Text('My Kpop Idol'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Color.fromARGB(255, 243, 170, 245),
        pages: pages,
        showSkipButton: true,
        skip: const Text('skip" ไปที่ความสนุกและความสุขกันเถอะ!'),
        showDoneButton: true,
        done: const Text('사랑해요, 안녕💖💖💖'),
        showNextButton: true,
        next: const Icon(Icons.arrow_right),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
        dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            color: Colors.lightBlue,
            activeColor: Colors.blue,
            activeSize: Size.square(15)),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
