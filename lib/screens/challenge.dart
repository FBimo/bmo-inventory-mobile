import 'package:flutter/material.dart';
import 'package:bmo_inventory/widgets/left_drawer.dart';
import 'package:bmo_inventory/screens/item_page.dart';

// final List<Item> itemList = [];

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Challenge',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
//       // TODO: Tambahkan drawer yang sudah dibuat di sini
      drawer: const LeftDrawer(),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [Text("Teks atas"), Text('Teks bawah')],
        ),
      )
    );
  }
}
