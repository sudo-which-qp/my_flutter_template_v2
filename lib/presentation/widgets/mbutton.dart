import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bible_emi_app/utils/colors/m_colors.dart';

class MButton extends StatefulWidget {
  final String? title;
  final String? secondTitle;
  final double? radius;
  final double? width;
  final double? height;
  final Color? btnColor;
  final Color? textColor;
  final double? textSize;
  final Color? borderColor;
  final IconData? btnIcon;
  final bool isLoading;
  final bool isTwoText;
  final bool hasIcon;
  final Widget? btnSVGIcon;
  final bool isTextBold;
  final VoidCallback? onPressed;

  const MButton({
    super.key,
    required this.title,
    this.secondTitle,
    this.radius,
    this.width,
    this.height,
    this.btnColor,
    this.textColor,
    this.textSize,
    this.borderColor,
    this.btnIcon,
    this.btnSVGIcon,
    this.isLoading = false,
    this.isTwoText = false,
    this.hasIcon = false,
    this.isTextBold = false,
    required this.onPressed,
  }) : assert(
  title != null,
  onPressed != null,
  );

  @override
  _MButtonState createState() => _MButtonState();
}

class _MButtonState extends State<MButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 327.w,
      height: widget.height ?? 55.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: widget.btnColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 8),
            side: BorderSide(
              color: widget.borderColor ?? AppColors.transparent,
            ),
          ),
        ),
        onPressed: widget.onPressed,
        child: widget.isLoading == false
            ? widget.isTwoText == true
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.title}',
              style: TextStyle(
                fontSize: widget.textSize ?? 16.sp,
                fontWeight: widget.isTextBold == true
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: widget.textColor ?? AppColors.defaultWhite,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '${widget.secondTitle}',
              style: TextStyle(
                fontSize: widget.textSize ?? 16.sp,
                fontWeight: widget.isTextBold == true
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: widget.textColor ?? AppColors.defaultWhite,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )
            : widget.hasIcon == true
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.title}',
              style: TextStyle(
                fontSize: widget.textSize ?? 16.sp,
                fontWeight: widget.isTextBold == true
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: widget.textColor ?? AppColors.defaultWhite,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              widget.btnIcon!,
              color: AppColors.defaultWhite,
            ),
          ],
        )
            : Text(
          '${widget.title}',
          style: TextStyle(
            fontSize: widget.textSize ?? 13.sp,
            fontWeight: widget.isTextBold == true
                ? FontWeight.bold
                : FontWeight.normal,
            color: widget.textColor ?? AppColors.defaultWhite,
          ),
          textAlign: TextAlign.center,
        )
            : SizedBox(
          width: 20.w,
          height: 20.w,
          child: CircularProgressIndicator(
            color: AppColors.defaultWhite,
          ),
        ),
      ),
    );
  }
}