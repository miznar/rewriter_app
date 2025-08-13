// import 'package:flutter/material.dart';
//
// import '../../../../core/themes/app_theme.dart';
//
// class RewrittenTextCard extends StatelessWidget {
//   const RewrittenTextCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text("Rewritten Text",
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 Row(
//                   children: const [
//                     Text("Professional", style: TextStyle(color: Colors.blue)),
//                     SizedBox(width: 4),
//                     Icon(Icons.circle, size: 8, color: Colors.blue),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.auto_fix_high, size: 36, color: Colors.grey),
//                 const SizedBox(height: 8),
//                 Text(
//                   "Ready to Transform",
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   "Add your text and select a tone to see the magic happen",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.grey.shade600),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }