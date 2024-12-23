import 'package:flutter/material.dart';

class InputMsg extends StatelessWidget {
  final String onValue;
  const InputMsg({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textControll = TextEditingController();

    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Envia un mensaje',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      contentPadding: const EdgeInsets.only(top: 12, left: 20),
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          // final textValue = onValue;
          textControll.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      cursorColor: Colors.amber,
      focusNode: focusNode,
      controller: textControll,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textControll.clear();
        focusNode.requestFocus();
      },
    );
  }
}
