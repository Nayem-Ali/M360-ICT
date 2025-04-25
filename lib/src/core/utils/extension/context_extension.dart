import 'package:flutter/material.dart';

extension Context on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Size get size => MediaQuery.of(this).size;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get bodyExtraSmall =>
      bodySmall?.copyWith(fontSize: 10, height: 1.6, letterSpacing: .5);

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge?.copyWith(
    color: Theme.of(this).colorScheme.shadow.withValues(alpha: 90),
  );

  TextStyle? get dividerTextSmall =>
      bodySmall?.copyWith(letterSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 12.0);

  TextStyle? get dividerTextLarge => bodySmall?.copyWith(
    letterSpacing: 1.5,
    fontWeight: FontWeight.w700,
    fontSize: 13.0,
    height: 1.23,
  );
}
