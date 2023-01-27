part of 'widgets.dart';

// Future imageQuizViewerWidget({
//   required BuildContext context,
//   required image,
// }) =>
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         elevation: 0,
//         insetAnimationCurve: Curves.elasticInOut,
//         insetAnimationDuration: const Duration(milliseconds: 500),
//         child: SizedBox(
//           width: 180,
//           height: 120,
//           child: ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: PhotoView(
//                 errorBuilder: (context, exception, stackTrace) {
//                   return SizedBox(
//                     width: 180,
//                     height: 120,
//                     child: Center(
//                       child: Text(
//                         "Image Error",
//                         style: interheadline3.copyWith(color: davysGrey),
//                       ),
//                     ),
//                   );
//                 },
//                 imageProvider: AssetImage(
//                   image ?? 'assets/materi/risiko.png',
//                 ),
//               )),
//         ),
//       ),
//     );

Widget imageQuizViewerWidget(
        {String? image, required void Function() onClose}) =>
    Container(
      color: white.withOpacity(0.7),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // ClipRRect(
          //   child: PhotoView(
          //     backgroundDecoration: BoxDecoration(color: white.withOpacity(0.7)),
          //     minScale: PhotoViewComputedScale.contained * 1,

          //     errorBuilder: (context, exception, stackTrace) {
          //       return SizedBox(
          //         width: 180,
          //         height: 120,
          //         child: Center(
          //           child: Text(
          //             "Image Error",
          //             style: interheadline3.copyWith(color: davysGrey),
          //           ),
          //         ),
          //       );
          //     },
          //     imageProvider: AssetImage(
          //       image ?? 'assets/materi/risiko.png',
          //     ),
          //   ),
          // ),

          Center(
            child: PhotoView(
              backgroundDecoration:
                  const BoxDecoration(color: Colors.transparent),
              minScale: PhotoViewComputedScale.contained * 1,
              errorBuilder: (context, exception, stackTrace) {
                return SizedBox(
                  width: 180,
                  height: 120,
                  child: Center(
                    child: Text(
                      "Image Error",
                      style: interheadline3.copyWith(color: davysGrey),
                    ),
                  ),
                );
              },
              imageProvider: AssetImage(
                image ?? 'assets/materi/risiko.png',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 85),
            child: bigButtonWidget(
                text: "Close", width: 100, onTap: onClose, isDisable: false),
          )
        ],
      ),
    );
