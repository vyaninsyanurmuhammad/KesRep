part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProfilViewModel>(
      converter: (store) => ProfilViewModel.create(store),
      builder: (BuildContext context, ProfilViewModel viewModel) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              normalAppbarWidget(),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    viewModel.namaShorted!(),
                                    overflow: TextOverflow.ellipsis,
                                    style: interheadline3.copyWith(
                                        color: davysGrey),
                                  ),
                                  Text(
                                    viewModel.emailShorted!(),
                                    overflow: TextOverflow.ellipsis,
                                    style: interheadline4.copyWith(
                                        color: spanishGray),
                                  ),
                                ],
                              ),
                              (viewModel.photoUrl == null)
                                  ? CircleAvatar(
                                      radius: 50,
                                      child: Text(
                                        "No Image",
                                        style: interheadline3.copyWith(
                                            color: davysGrey),
                                      ),
                                      backgroundColor: silver,
                                    )
                                  : CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          NetworkImage(viewModel.photoUrl!),
                                      backgroundColor: silver,
                                    )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 115),
                          child: bigButtonWidget(
                            text: "Keluar",
                            onTap: () {
                              viewModel.logout!(context);
                            },
                            primaryColor: salmon,
                            secondaryColor: orangeRedCrayola,
                          ),
                        ),
                      ],
                    ),
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
