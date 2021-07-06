import 'package:camera/camera.dart';
import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/screens/home_screen.dart';
import 'package:egypt_gate/screens/king_screen.dart';
import 'package:egypt_gate/screens/offline_screen.dart';
import 'package:flutter/material.dart';
import 'package:egypt_gate/screens/splash_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final camera = cameras.first;

  runApp(MyApp(camera));
}

class MyApp extends StatelessWidget {

  final CameraDescription camera;

  MyApp(this.camera);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egypt Gate',
      theme: customThemeData(),
      home: SplashScreen(camera),
      // home: HomeScreen(camera, true),
      // home: KingScreen(
      //   kingName: "Akhenaten",
      //   dynasty: "18th Dynasty of Egypt",
      //   reignPeriod: "1351 - 1334 BC",
      //   history: "As a pharaoh, akhenaten is noted for abandoning egypt's traditional polytheism and introducing atenism, or worship centered around aten. The views of egyptologists differ as to whether atenism should be considered as a form of absolute monotheism, or whether it was monolatry, syncretism, or henotheism. This culture shift away from traditional religion was not widely accepted. After his death, akhenaten's monuments were dismantled and hidden, his statues were destroyed, and his name excluded from lists of rulers compiled by later pharaohs. Traditional religious practice was gradually restored, notably under his close successor tutankhamun, who changed his name from tutankhaten early in his reign. When some dozen years later, rulers without clear rights of succession from the eighteenth dynasty founded a new dynasty, they discredited akhenaten and his immediate successors and referred to akhenaten as \"the enemy\" or \"that criminal\" in archival records. Akhenaten was all but lost to history until the late 19th century discovery of amarna, or akhetaten, the new capital city he built for the worship of aten. Furthermore, in 1907, a mummy that could be akhenaten's was unearthed from the tomb kv55 in the valley of the kings by edward r. Ayrton. Genetic testing has determined that the man buried in kv55 was tutankhamun's father, but its identification as akhenaten has since been questioned.",
      // ),
      // home: OfflineScreen(),
    );
  }
}