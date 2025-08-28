import 'package:demo_test/screen/api.dart';
// import 'package:demo_test/screen/sample1.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
  DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const ApiScreen(),
    );
  }
}

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         title: const Text("Login"),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           // 🔹 Background Image
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: Image.network(
//               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-mwP7X6TZb0uORZa38zlpmibfPDcbSlvx6A&s", // use direct image link
//               fit: BoxFit.cover,
//             ),
//           ),

//           // 🔹 Semi-transparent overlay (optional, makes text more readable)
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             color: Colors.black.withOpacity(0.5),
//           ),

//           // 🔹 Login Form
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextField(
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.3),
//                       hintText: "Email",
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     obscureText: true,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.2),
//                       hintText: "Password",
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 80,
//                         vertical: 15,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Sample1()),
//                       );
//                     },
//                     child: const Text("Login", style: TextStyle(fontSize: 18)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
