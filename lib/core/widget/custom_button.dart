import 'package:flutter/material.dart';

/// A customizable button widget for next-generation UI.
///
/// The `NextGenButton` widget allows you to create a button with customizable
/// properties such as color, border, radius, and icons. It also includes an
/// optional loading state.
class NextGenButton extends StatefulWidget {
  /// Creates a `NextGenButton`.
  ///
  /// The [onTap], [titleText], [height], and [width] parameters are required.
  /// The [color], [borderColor], [border], [radius], [elevation], [rightIcon],
  /// [leftIcon], and [isLoading] parameters are optional and have default values.
  const NextGenButton({
    super.key,
    required this.onTap,
    required this.titleText,
    this.color = Colors.white,
    this.borderColor = Colors.transparent,
    this.border = 0,
    this.radius = 0,
    this.elevation = 0,
    required this.height,
    required this.width,
    this.rightIcon = const SizedBox.shrink(),
    this.isLoading = false,
    this.leftIcon = const SizedBox.shrink(),
    this.isEnable = false,
  });

  final bool isEnable;

  /// The callback function that is triggered when the button is tapped.
  ///
  /// If [isLoading] is true, the button will be disabled and the [onTap] callback
  /// will not be triggered.
  final VoidCallback onTap;

  /// The widget that will be displayed as the title text of the button.
  ///
  /// This could be a [Text] widget or any other widget that represents the button's title.
  final Widget titleText;

  /// The widget to be displayed on the right side of the title text.
  ///
  /// This could be an icon, an image, or any other widget. By default, it is an
  /// empty widget ([SizedBox.shrink]).
  final Widget rightIcon;

  /// The widget to be displayed on the left side of the title text.
  ///
  /// This could be an icon, an image, or any other widget. By default, it is an
  /// empty widget ([SizedBox.shrink]).
  final Widget leftIcon;

  /// The background color of the button.
  ///
  /// Defaults to [Colors.white].
  final Color color;

  /// The color of the button's border.
  ///
  /// Defaults to [Colors.white].
  final Color borderColor;

  /// The width of the button's border.
  ///
  /// Defaults to 0 (no border).
  final double border;

  /// The radius of the button's corners.
  ///
  /// Defaults to 0 (sharp corners).
  final double radius;

  /// The height of the button.
  final double height;

  /// The elevation of the button.
  ///
  /// Controls the shadow depth of the button. Defaults to 0 (no shadow).
  final double elevation;

  /// The width of the button.
  final double width;

  /// Indicates whether the button is in a loading state.
  ///
  /// If true, a [CircularProgressIndicator] will be displayed, and the button
  /// will be disabled.
  final bool isLoading;

  @override
  State<NextGenButton> createState() => _NextGenButtonState();
}

class _NextGenButtonState extends State<NextGenButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: widget.elevation,
      color: widget.isEnable ? widget.color : Colors.grey,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: widget.borderColor, width: widget.border),
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: InkWell(
        onTap: widget.isLoading
            ? null
            : widget.isEnable
                ? widget.onTap
                : null,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.isLoading)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircularProgressIndicator(
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
              widget.leftIcon,
              if (widget.leftIcon != const SizedBox.shrink())
                const SizedBox(width: 8),
              widget.titleText,
              if (widget.rightIcon != const SizedBox.shrink())
                const SizedBox(width: 8),
              widget.rightIcon,
            ],
          ),
        ),
      ),
    );
  }
}
