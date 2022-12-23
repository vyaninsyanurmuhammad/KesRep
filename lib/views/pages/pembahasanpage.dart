part of 'pages.dart';

class PembahasanPage extends StatelessWidget {
  const PembahasanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PembahasanViewModel>(
      converter: (store) => PembahasanViewModel.create(store),
      onInit: (store) {
        Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        store.state.pembahasanState?.quizzes = arguments['quizzes'];
        store.state.pembahasanState?.quizzesAnswered =
            arguments['quizzesAnswered'];
      },
      builder: (BuildContext context, PembahasanViewModel viewModel) {
        return Scaffold(
          backgroundColor: white,
          body: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    pembahasanAppbarWidget(
                        context: context, title: "Pembahasan"),
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: 300,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: List.generate(
                            viewModel.quizzes!.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: reviewCardWidget(
                                  noSoal: (index + 1).toString(),
                                  pertanyaan:
                                      viewModel.quizzes?[index].pertanyaan,
                                  penjelasan: viewModel
                                      .quizzes?[index].penjelasan?.deskripsi,
                                  gambar: viewModel
                                      .quizzes?[index].penjelasan?.gambar,
                                  jawaban: viewModel
                                      .jawaban!(viewModel.quizzes![index].id!),
                                  isJawabanImage: viewModel.isImageJawaban!(
                                    viewModel.jawaban!(
                                        viewModel.quizzes![index].id!),
                                  ),
                                  isCorrect: viewModel.isCorrect!(
                                      viewModel.quizzes![index].id!),
                                  onImageOpen: () {
                                    viewModel.openImage!(viewModel
                                        .quizzes![index].penjelasan!.gambar!);
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (viewModel.isImageOpen == true)
                  ? imageQuizViewerWidget(
                      image: viewModel.imageOpen,
                      onClose: () {
                        store.dispatch(
                            IsImagePembahasanOpenAction(isOpen: false));
                      })
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
