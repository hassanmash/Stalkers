import 'package:flutter/material.dart';
import 'package:stalkers/pages/imagepage.dart';
import 'package:stalkers/widgets/bgImage.dart';

class SearchPage extends StatefulWidget {
  final String recordName;
  // const MyRecord(this.recordName);
  const SearchPage({Key? key, required this.recordName}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recordName),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 280.0,
                          height: 60.0,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                      hintText: "Enter the username",
                                      // labelText: "Enter the username",
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ImageDisplay(
                                          userNameDisplay:
                                              usernameController.text)))
                            },
                            icon: const Icon(Icons.search),
                            tooltip: 'Search',
                          ),
                        ),
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
