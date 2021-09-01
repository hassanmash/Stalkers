import 'package:flutter/material.dart';
import 'package:stalkers/widgets/bgImage.dart';

class SearchPage extends StatelessWidget {
  final String recordName;
  // const MyRecord(this.recordName);
  const SearchPage({Key? key, required this.recordName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recordName),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            BgImage(),
            Align(
              alignment: Alignment(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 300.0,
                          height: 60.0,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Enter the username",
                                      // labelText: "Enter the username",
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
