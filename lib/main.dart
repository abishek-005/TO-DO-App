import 'package:flutter/material.dart';

void main() {
  runApp(mainapp());
}

class mainapp extends StatefulWidget {
  const mainapp({super.key});

  @override
  State<mainapp> createState() => _mainappState();
}

class _mainappState extends State<mainapp> {
  List<String> tl = [];
  TextEditingController te = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello"),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(25),
                    child: TextField(
                      controller: te,
                      onSubmitted: (value) {
                        setState(() {
                          tl.add(value);
                          te.clear();
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("ENTER YOUR CONTENT"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  height: 40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.amberAccent,
                  onPressed: () {
                    setState(() {
                      tl.add(te.text);
                      te.clear();
                    });
                  },
                  child: Text("press"),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tl.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(25),
                          child: Text(tl[index]),
                        ),
                      ),
                      MaterialButton(
                        child: Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            tl.removeAt(index);
                          });
                        },
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}