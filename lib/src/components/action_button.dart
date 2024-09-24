import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/src/product/bloc/product_bloc.dart';

import '../product/bloc/bloc.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({super.key, required this.size,});
  final Size size;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // setState(() {
        //   context.read<ProductBloc>().add(GetDetailProductEvent());
        // });
      },
      child: Container(
        width: widget.size.width,
        height: 48.0,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(12.0)),
        child: const Center(
          child: Text(
            'Add To Cart',
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}


// class ActionButton extends StatelessWidget {
//   const ActionButton({
//     super.key,
//     required this.size,
//   });
//
//   final Size size;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         width: size.width,
//         height: 48.0,
//         decoration: BoxDecoration(
//             color: Colors.green, borderRadius: BorderRadius.circular(12.0)),
//         child: const Center(
//           child: Text(
//             'Add To Cart',
//             style: TextStyle(
//                 fontSize: 12.0,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white),
//           ),
//         ),
//       ),
//     );
//     // return Container(
//     //   width: size.width,
//     //   height: 48.0,
//     //   decoration:
//     //   BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12.0)),
//     //   child: const Center(
//     //     child: Text(
//     //       'Add To Cart',
//     //       style: TextStyle(
//     //           fontSize: 12.0,
//     //           fontWeight: FontWeight.w500,
//     //           color: Colors.white),
//     //     ),
//     //   ),
//     // );
//   }
// }
