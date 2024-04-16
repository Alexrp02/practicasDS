import 'package:flutter/material.dart';

class IncrementarButton extends StatefulWidget {
  final TextEditingController controller;

  const IncrementarButton({super.key, required this.controller});

  @override
  _IncrementarButtonState createState() => _IncrementarButtonState();
}

class _IncrementarButtonState extends State<IncrementarButton> {
  @override
  void initState() {
    super.initState();
    widget.controller.text = "0";
  }

  void incrementar() {
    final int valor = int.parse(widget.controller.text);
    if (valor < 5) {
      widget.controller.text = (valor + 1).toString();
    }
  }

  void decrementar() {
    final int valor = int.parse(widget.controller.text);
    if (valor > 0) {
      widget.controller.text = (valor - 1).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffffd6b0),
          ),
          child: IconButton(
              onPressed: decrementar,
              icon: const Icon(
                Icons.remove,
              )),
        ),
        const SizedBox(width: 10),
        Container(
          width: 70,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: TextField(
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            controller: widget.controller,
            readOnly: true,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffffd6b0),
          ),
          child: IconButton(
              onPressed: incrementar,
              icon: const Icon(
                Icons.add,
              )),
        ),
      ],
    );
  }
}
