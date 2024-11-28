import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/theme_provider.dart';

// AppBar appBar(BuildContext context) {
//   return AppBar(
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     leading: Padding(
//       padding: const EdgeInsets.only(left: 10),
//       child: GestureDetector(
//         onTap: () => context.read<ThemeProvider>().changeTheme(),
//         child: const Icon(Icons.dark_mode_outlined, size: 30),
//       ),
//     ),
//     actions: [
//       Padding(
//           padding: const EdgeInsets.only(right: 10),
//           child: Center(
//             child: Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: Colors.grey),
//                 child: const Icon(Icons.person)),
//           )),
//     ],
//   );
// }
