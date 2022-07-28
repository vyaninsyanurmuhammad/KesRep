part of 'pages.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> listColor = [
      palePink,
      lemonMeringue,
      lightMint,
      lightCyan,
    ];

    return Column(
      children: [
        normalAppbarWidget(title: "Materi"),
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              children: List.generate(
                5,
                (index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: materiCardWidget(
                    background: listColor[index % listColor.length],
                    onTap: () {
                      Navigator.pushNamed(context, "/materidetailpage");
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
