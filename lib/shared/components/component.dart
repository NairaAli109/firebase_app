import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

import '../styles/colors.dart';
import '../styles/size.dart';

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void navigateBack(context) => Navigator.pop(context);

Widget myDivider() => const Divider(
      thickness: 2,
    );

Widget textButton({
  required String text,
  required VoidCallback function,
  double size=20,
  Color textColor =lightGreen,
}) =>
    InkWell(
      onTap: function,
      child: Text(
        text,
        style:  TextStyle(
            letterSpacing: 1,
            color: textColor,
            fontSize: size,
            fontWeight: FontWeight.w500),
      ),
    );

Widget textFormField({
  required TextEditingController controller,
  required String text,
  required String? Function(String?) validator,
  required TextInputType type,
  required IconData preIcon,
  IconData? suffIcon,
  bool isPass = false,
  Function? suffixPressed,
  Function(String)? onSubmit,
  onChange,
  onTap,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validator,
      obscureText: isPass,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
          prefixIcon: Icon(preIcon),
          prefixIconColor: Colors.grey[400],
          suffixIcon: suffIcon != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(suffIcon),
                )
              : null,
          suffixIconColor: Colors.grey[400],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    );

Widget defaultButton({
  double width = 180,
  Color background = lightGreen,
  bool isUpperCase = true,
  required VoidCallback function, // Change the parameter type to VoidCallback
  required String text,
  double raduis = 12.5,
}) =>
    Center(
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raduis),
          color: background,
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );


Widget iconButton({
  required BuildContext context,
  required ButtonType icon,
  required VoidCallback function,
})=> Container(
  width: width(context, 7),
  height: height(context, 12),
  color: Colors.transparent,
  child: FlutterSocialButton(
    onTap: (){
      function;
    },
    mini: true,
    buttonType: icon,
  ),
);