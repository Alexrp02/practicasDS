import 'package:flutter/material.dart';
import 'package:p2/main.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 120.0,
      centerTitle: true,
      leading: const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: VolverButton(),
      ),
      title: Container(
          constraints: const BoxConstraints(maxHeight: 60.0),
          child: const Image(image: AssetImage("assets/logo.png"))),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: CancelarButton(),
        ),
      ],
    );
  }
}

class VolverButton extends StatefulWidget {
  const VolverButton({
    super.key,
  });

  @override
  State<VolverButton> createState() => _VolverButtonState();
}

class _VolverButtonState extends State<VolverButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        Navigator.pop(context);
        setState(() => _isPressed = false);
      },
      onTapCancel: () => setState(() => _isPressed = false),
      borderRadius: BorderRadius.circular(16.0),
      splashColor: Colors.blue.withOpacity(0.7),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(16.0),
          color: _isPressed ? Colors.blue.withOpacity(0.5) : Colors.white,
        ),
        child: Center(
            child: Text("Volver",
                style: TextStyle(
                    fontSize: 24.0,
                    color: _isPressed ? Colors.white : Colors.black))),
      ),
    );
  }
}

class CancelarButton extends StatefulWidget {
  const CancelarButton({
    super.key,
  });

  @override
  State<CancelarButton> createState() => _CancelarButtonState();
}

class _CancelarButtonState extends State<CancelarButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
      },
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () => Navigator.popUntil(context, ModalRoute.withName('/')),
      borderRadius: BorderRadius.circular(16.0),
      splashColor: Colors.blue.withOpacity(0.7),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(16.0),
          color: _isPressed ? Colors.blue.withOpacity(0.5) : Colors.red,
        ),
        child: const Center(
            child: Text("Cancelar",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}
