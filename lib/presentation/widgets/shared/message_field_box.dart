import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final colors = Theme.of(context).colorScheme;
    final InputDecoration decoration = InputDecoration(
      hintText: 'Mensaje',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.secondary, width: 4),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.primary, width: 4),
        borderRadius: BorderRadius.circular(25),
      ),
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          //print('buttom: $textValue');
          textController.clear();
          onValue(textValue);
        },
        icon: Icon(
          Icons.send_rounded,
          color: colors.secondary,
        ),
      ),
    );
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: decoration,
      onFieldSubmitted: (value) {
        //print('Submit value $value');
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
