part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeViewModel>(
      onInit: (store) async {
        store.dispatch(
            LoadPlayerAction(player: await PlayerHelper.fetchPlayer()));
      },
      onDispose: (store) {},
      converter: (store) => HomeViewModel.create(store),
      builder: (BuildContext context, HomeViewModel viewModel) {
        return Scaffold(
          backgroundColor: white,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              IndexedStack(
                index: viewModel.indexBottomNavbar,
                children: const [
                  GamePage(),
                  ProfilePage(),
                  MateriPage(),
                ],
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                    color: magicMint,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    iconSize: 40,
                    onTap: viewModel.onChangeTapIndex,
                    currentIndex: viewModel.indexBottomNavbar!,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,
                    items: [
                      BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 40,
                          width: 40,
                          child: RiveAnimation.asset(
                            "assets/bottomnavbar.riv",
                            artboard: "Home",
                            controllers: [viewModel.homeIconController!],
                          ),
                        ),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 40,
                          width: 40,
                          child: RiveAnimation.asset(
                            "assets/bottomnavbar.riv",
                            artboard: "Profil",
                            controllers: [viewModel.profilIconController!],
                          ),
                        ),
                        label: "Profil",
                      ),
                      BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 40,
                          width: 40,
                          child: RiveAnimation.asset(
                            "assets/bottomnavbar.riv",
                            artboard: "Materi",
                            controllers: [viewModel.materiIconController!],
                          ),
                        ),
                        label: "Materi",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
