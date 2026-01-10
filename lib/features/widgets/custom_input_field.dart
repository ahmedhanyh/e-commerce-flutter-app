import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    // required this.controller,
    this.isPassword = false,
  });

  final String label;
  final String hintText;
  // final TextEditingController controller;
  final bool isPassword;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  var hide;

  void initState() {
    super.initState();
    hide = widget.isPassword ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 4,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        TextFormField(
          // controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
              borderRadius: BorderRadius.circular(18),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black54,
            ),
            suffixIcon: (widget.isPassword
                ? GestureDetector(
              onTap: () {
                setState(() {
                  hide = !hide;
                });
              },
              child: (hide
                  // ? SvgPicture.asset("assets/icons/eye_crossed.svg", colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),)  // to try in the future
                  ? Icon(Icons.remove_red_eye_outlined)
                  : Icon(Icons.remove_red_eye)),
            )
                : SizedBox.shrink()),
          ),
          obscureText: hide,
        ),
      ],
    );
  }
}