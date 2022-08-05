part of 'pages.dart';

class MateriDetailPage extends StatelessWidget {
  const MateriDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1.2,
                        child: WebViewPlus(
                          initialUrl: 'about:blank',
                          gestureNavigationEnabled: true,
                          backgroundColor: white,
                          onWebViewCreated: (controller) {
                            controller.loadUrl("assets/materi/dua.html");
                          },
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 50),
            child: GestureDetector(
              onTap: () {
                ClickHelper.clickSound();

                Navigator.pop(context);
              },
              child: Container(
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: white,
                  child: Icon(
                    Icons.close,
                    color: davysGrey,
                    size: 25,
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.1),
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                          2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
