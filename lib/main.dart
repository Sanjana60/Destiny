import 'package:destiny/story.dart';
import 'package:destiny/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Destiny());
}

class Destiny extends StatelessWidget {
  const Destiny({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: DestinyPage(),
    );
  }
}

Story_Brain story_brain = Story_Brain();

class DestinyPage extends StatefulWidget {
  const DestinyPage({Key? key}) : super(key: key);

  @override
  State<DestinyPage> createState() => _DestinyPageState();
}

class _DestinyPageState extends State<DestinyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        )),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    story_brain.getStory(),
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: () {
                        // story_brain.nextStory(1);
                        setState(() {
                          story_brain.nextStory(1);
                        });
                      },
                      child: Text(
                        story_brain.getChoice1(),
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      )),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Visibility(
                    visible: story_brain.buttonShouldBeVisible(),
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        onPressed: () {
                          // story_brain.nextStory(2);

                          setState(() {
                            story_brain.nextStory(2);
                          });
                        },
                        child: Text(
                          story_brain.getChoice2(),
                          style: TextStyle(color: Colors.green, fontSize: 12.0),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
