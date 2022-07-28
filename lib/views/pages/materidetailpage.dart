part of 'pages.dart';

class MateriDetailPage extends StatelessWidget {
  const MateriDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                // floating: true,
                // pinned: true,
                // snap: true,
                stretch: true,
                expandedHeight: MediaQuery.of(context).size.height / 2,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                    fit: BoxFit.cover,
                    loadingBuilder: (context, widget, loadingProgress) =>
                        (loadingProgress == null)
                            ? widget
                            : LinearProgressIndicator(
                                color: white,
                              ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Text(
                            "Lorem ipsum dolor sit.",
                            style: interheadline2.copyWith(color: davysGrey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc feugiat congue tortor, quis aliquet erat luctus ac. Integer gravida rhoncus ipsum at fermentum. Nam interdum, est at pulvinar pretium, erat justo feugiat ex, auctor egestas nisl eros et nulla. Duis maximus ultrices massa, vel sodales ex interdum a. Nunc vitae nisl id ligula posuere feugiat ut sit amet nulla. Curabitur aliquam dolor et elit commodo, nec placerat velit eleifend. Etiam tincidunt tincidunt neque, et auctor velit tincidunt in. Suspendisse lacus dolor, condimentum eleifend lectus quis, bibendum fermentum est. Duis laoreet fringilla ex posuere fermentum. Nulla tempor ullamcorper lacus eget scelerisque. Ut placerat blandit massa ut semper. Sed tortor tortor, gravida vel sagittis rutrum, rhoncus ac turpis. Suspendisse libero lectus, blandit a orci a, auctor vestibulum est. Suspendisse vulputate rhoncus varius. In tincidunt eleifend risus ultrices posuere. Etiam maximus massa sed risus elementum, eu consequat massa hendrerit. Cras vitae egestas lacus. Vivamus pellentesque ultricies fermentum. In pellentesque mollis purus sit amet sodales. Quisque mattis semper dolor, quis condimentum diam accumsan quis. Proin tristique massa lectus, suscipit dapibus erat molestie eu.\n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc feugiat congue tortor, quis aliquet erat luctus ac. Integer gravida rhoncus ipsum at fermentum. Nam interdum, est at pulvinar pretium, erat justo feugiat ex, auctor egestas nisl eros et nulla. Duis maximus ultrices massa, vel sodales ex interdum a. Nunc vitae nisl id ligula posuere feugiat ut sit amet nulla. Curabitur aliquam dolor et elit commodo, nec placerat velit eleifend. Etiam tincidunt tincidunt neque, et auctor velit tincidunt in. Suspendisse lacus dolor, condimentum eleifend lectus quis, bibendum fermentum est. Duis laoreet fringilla ex posuere fermentum. Nulla tempor ullamcorper lacus eget scelerisque. Ut placerat blandit massa ut semper. Sed tortor tortor, gravida vel sagittis rutrum, rhoncus ac turpis. Suspendisse libero lectus, blandit a orci a, auctor vestibulum est. Suspendisse vulputate rhoncus varius. In tincidunt eleifend risus ultrices posuere. Etiam maximus massa sed risus elementum, eu consequat massa hendrerit. Cras vitae egestas lacus. Vivamus pellentesque ultricies fermentum. In pellentesque mollis purus sit amet sodales. Quisque mattis semper dolor, quis condimentum diam accumsan quis. Proin tristique massa lectus, suscipit dapibus erat molestie eu.",
                            style: interheadline4.copyWith(color: davysGrey),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 50),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: white,
                child: Icon(
                  Icons.close,
                  color: davysGrey,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
