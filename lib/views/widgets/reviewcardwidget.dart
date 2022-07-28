part of 'widgets.dart';

Widget reviewCardWidget({
  String? noSoal,
  String? pertanyaan,
  String? jawaban,
  String? gambar,
  String? penjelasan,
  bool? isCorrect = true,
  bool? isJawabanImage = false,
}) =>
    Container(
      decoration: BoxDecoration(
        color: (isCorrect! == true) ? magicMint : melon,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            reviewMiniButtonWidget(onTap: () {}, noSoal: noSoal ?? '1'),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  pertanyaan ??
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pharetra non odio quis auctor.",
                  style: interheadline6.copyWith(color: davysGrey),
                ),
              ),
            )
          ],
        ),
        children: [
          Container(
            decoration: BoxDecoration(
              color: (isCorrect == true) ? lightMint : palePink,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: silver,
                        child: Icon(
                          (isCorrect == true)
                              ? Icons.check_rounded
                              : Icons.close_rounded,
                          color: davysGrey,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          (jawaban == "")
                              ? "Tadi Kamu tidak menjawab"
                              : (isJawabanImage == true)
                                  ? "Tadi kamu menjawab :"
                                  : "Tadi kamu menjawab : $jawaban",
                          style: interheadline4.copyWith(color: davysGrey),
                        ),
                      ),
                    ],
                  ),
                  (isJawabanImage == true)
                      ? Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(jawaban ??
                                    'https://sdnsusukan07.sch.id/asset/images/noimage.jpg'),
                                fit: BoxFit.fill),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  (gambar != "")
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            width: 180,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(gambar ??
                                      'https://sdnsusukan07.sch.id/asset/images/noimage.jpg'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Text(
                    penjelasan ??
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pharetra non odio quis auctor. Duis aliquam ex lacus, et finibus nibh bibendum sodales.",
                    textAlign: TextAlign.justify,
                    style: interheadline4.copyWith(color: spanishGray),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
