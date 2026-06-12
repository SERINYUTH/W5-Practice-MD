import 'package:flutter/material.dart';

enum ButtonStatus {
  selected(
    text: 'Selected',
    textColor: Colors.white,
    backgroundColor: Color.fromRGBO(33, 150, 243, 1),
  ),
  notSelected(
    text: 'Not Selected',
    textColor: Colors.black,
    backgroundColor: Color.fromRGBO(227, 242, 253, 1),
  );

  final String text;
  final Color textColor;
  final Color backgroundColor;

  const ButtonStatus({
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  });
}

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool selected = false;
  ButtonStatus get status =>
      selected ? ButtonStatus.selected : ButtonStatus.notSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () => {
          setState(() {
            if (selected != false) {
              selected = false;
            } else {
              selected = true;
            }
          }),
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: status.backgroundColor,
          foregroundColor: status.textColor,
        ),
        child: Center(child: Text(status.text)),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [Button(), Button(), Button(), Button()],
        ),
      ),
    ),
  ),
);
