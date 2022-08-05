part of 'pages.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: silver,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Kamu Memimpin",
                        textAlign: TextAlign.center,
                        style: interheadline2.copyWith(color: davysGrey),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Skor kamu menjadi yang terbaik. Mari tingkatkan dengan membaca materi yang tersedia",
                        textAlign: TextAlign.center,
                        style: interheadline3.copyWith(color: spanishGray),
                      )
                    ],
                  ),
                ),
              ),
              bigButtonWidget(
                text: "Dimengerti",
                onTap: () {
                  ClickHelper.clickSound();

                  Navigator.pushNamedAndRemoveUntil(
                      context, '/loadingpage', (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
