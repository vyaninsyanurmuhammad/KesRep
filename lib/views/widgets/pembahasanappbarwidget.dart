part of 'widgets.dart';

Widget pembahasanAppbarWidget({required BuildContext context, String? title}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    color: white,
    child: Padding(
      padding: const EdgeInsets.only(top: 25)
          .add(const EdgeInsets.symmetric(horizontal: 30))
          .add(const EdgeInsets.symmetric(vertical: 10)),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                title ?? "Lorem Ipsum",
                style: interheadline3.copyWith(color: davysGrey),
              ),
            ),
          ),
          SizedBox(
              height: 45,
              width: 45,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: davysGrey,
                  ),
                ),
              )),
        ],
      ),
    ),
  );
}
