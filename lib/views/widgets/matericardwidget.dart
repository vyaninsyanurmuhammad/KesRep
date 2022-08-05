part of 'widgets.dart';

Widget materiCardWidget(
        {Color? background,
        String? judul,
        String? deskripsi,
        required VoidCallback onTap}) =>
    GestureDetector(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: background ?? lightCyan,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: silver,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      judul ?? "Lorem ipsum dolor sit",
                      style: interheadline4.copyWith(color: davysGrey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        width: 175,
                        height: 90,
                        child: Text(
                          deskripsi ??
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc feugiat congue tortor, quis aliquet erat luctus ac. Integer gravida rhoncus ipsum at fermentum. Nam....",
                          style: interheadline7.copyWith(color: spanishGray),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
