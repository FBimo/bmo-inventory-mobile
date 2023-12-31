// import 'package:flutter/material.dart';
// import 'package:bmo_inventory/widgets/left_drawer.dart';
// import 'package:bmo_inventory/screens/itemlist_form.dart';
//
// class Item {
//   String _name;
//   int _amount;
//   String _description;
//
//   Item(this._name, this._amount, this._description);
// }
//
// class ItemPage extends StatelessWidget {
//   ItemPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Bmo Inventory',
//         ),
//         backgroundColor: Colors.indigo,
//         foregroundColor: Colors.white,
//       ),
//       // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
//       drawer: const LeftDrawer(),
//       body: SingleChildScrollView(
//         // Widget wrapper yang dapat discroll
//         child: Padding(
//           padding: const EdgeInsets.all(10.0), // Set padding dari halaman
//           child: Column(
//             // Widget untuk menampilkan children secara vertikal
//             children: <Widget>[
//               const Padding(
//                 padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
//                 // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
//                 child: Text(
//                   'Item List', // Text yang menandakan toko
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               // Grid layout
//               GridView.count(
//                 // Container pada card kita.
//                 primary: false,
//                 padding: const EdgeInsets.all(20),
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 crossAxisCount: 3,
//                 shrinkWrap: true,
//                 children: itemList.map((Item item) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.indigo, width: 2.0),
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: ItemCard(item),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ItemCard extends StatelessWidget {
//   final Item item;
//
//   const ItemCard(this.item, {super.key}); // Constructor
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       // color: item.color,
//       child: InkWell(
//         child: Container(
//           // Container untuk menyimpan Icon dan Text
//           padding: const EdgeInsets.all(8),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   item._name,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20.0,
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.indigo,
//                       width: 2.0,
//                     ),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Text(
//                       item._amount.toString(),
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(Colors.indigo),
//                       ),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: const Text('Item Description'),
//                               content: SingleChildScrollView(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(item._description),
//                                   ],
//                                 ),
//                               ),
//                               actions: [
//                                 TextButton(
//                                   child: const Text('OK'),
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       child: const Text(
//                         "Detail",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
