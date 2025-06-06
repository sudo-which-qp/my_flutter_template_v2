import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template_v2/utils/colors/m_colors.dart';
import 'package:my_flutter_template_v2/utils/text_style/m_text_style.dart';
import 'package:my_flutter_template_v2/utils/tools/sized_box_ex.dart';

class MErrorWidget extends StatelessWidget {
  final FlutterErrorDetails? details;

  const MErrorWidget({super.key, this.details});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Error Widget',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, color: AppColors.red, size: 50),
              Text(
                'An Error Occurred',
                style: MTextStyle.publicSansRegularStyle(
                  fontSize: 16.sp,
                  textColor: AppColors.red,
                ),
              ),
              20.toHeight,
              Text(
                'Error: ${details?.exception}',
                style: MTextStyle.publicSansRegularStyle(
                  fontSize: 14.sp,
                  textColor: AppColors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
