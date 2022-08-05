part of 'widgets.dart';

Widget authInputWidget({
  String? label,
  IconData? icon,
  TextEditingController? controller,
  String? Function(String?)? validator,
  FocusNode? focusNode,
  TextInputAction? textInputAction,
}) =>
    SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        style: interheadline6.copyWith(color: davysGrey),
        obscureText: label == 'Password' ? true : false,
        validator: validator,
        focusNode: focusNode,
        cursorColor: cyanProcess,
        textInputAction: textInputAction ?? TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon ?? Icons.email_outlined,
            color: spanishGray,
          ),
          prefixIconColor: cyanProcess,
          errorStyle: TextStyle(fontSize: 10, color: red),
          label: Text(
            label ?? 'Lorem ipsum',
            style: interheadline6.copyWith(color: spanishGray),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(color: cyanProcess, width: 2),
          ),
        ),
      ),
    );
