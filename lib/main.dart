// import 'package:flutter/material.dart';
// import 'package:implicit_animation/logn_page.dart';

// void main() {
//   runApp(const NameBar());
// }

// class NameBar extends StatelessWidget {
//   const NameBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Implicit Animation',
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   double turns = 0.0;
//   bool _isExpanded = false;

//   double conatainerHeight = 0.0;
//   double contanierWidth = 0.0;

//   void _rotate() async {
//     final double targetWidth = MediaQuery.sizeOf(context).width * 0.85;
//     const double targetHeight = 350.0;

//     setState(() {
//       turns += 0.5;
//       _isExpanded = !_isExpanded;
//     });

//     if (_isExpanded) {
//       setState(() {
//         contanierWidth = targetWidth;
//         conatainerHeight = 50.0;
//       });

//       await Future.delayed(const Duration(milliseconds: 250));

//       if (_isExpanded) {
//         setState(() {
//           conatainerHeight = targetHeight;
//         });
//       }
//     } else {
//       setState(() {
//         conatainerHeight = 50.0;
//       });

//       await Future.delayed(const Duration(milliseconds: 250));

//       if (!_isExpanded) {
//         setState(() {
//           conatainerHeight = 0.0;
//           contanierWidth = 0.0;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1E1E2C),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: _rotate,
//                 child: AnimatedRotation(
//                   turns: turns,
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                   child: Container(
//                     height: 55,
//                     width: 55,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color.fromARGB(255, 133, 130, 130),
//                     ),
//                     child: const Icon(Icons.forward, color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 600),
//                 curve: Curves.fastOutSlowIn,
//                 width: contanierWidth,
//                 height: conatainerHeight,
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(18),
//                   boxShadow: [
//                     if (contanierWidth > 0)
//                       BoxShadow(
//                         color: Colors.black.withValues(alpha: 0.2),
//                         blurRadius: 15,
//                         spreadRadius: 2,
//                       ),
//                   ],
//                 ),
//                 child: AnimatedOpacity(
//                   opacity: conatainerHeight >= 280 ? 1.0 : 0.0,
//                   duration: const Duration(milliseconds: 2000),
//                   child: const SingleChildScrollView(
//                     physics: NeverScrollableScrollPhysics(),
//                     child: Login(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
