part of 'widgets.dart';

Widget normalAppbarWidget({String? title}) {
  return Container(
    color: white,
    child: Padding(
      padding: const EdgeInsets.only(top: 30)
          .add(const EdgeInsets.symmetric(horizontal: 30))
          .add(const EdgeInsets.symmetric(vertical: 15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? "Profile",
            style: interheadline3.copyWith(color: davysGrey),
          ),
        ],
      ),
    ),
  );
}
