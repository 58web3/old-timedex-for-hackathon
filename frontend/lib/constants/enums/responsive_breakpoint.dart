enum ResponsiveBreakpoint {
  xs(label: 'xs', min: 0, max: 576),
  sm(label: 'xm', min: 576, max: 800),
  md(label: 'xm', min: 800, max: 992),
  lg(label: 'xm', min: 992, max: 1200),
  xl(label: 'xl', min: 1200, max: double.infinity);

  const ResponsiveBreakpoint({
    required this.label,
    required this.min,
    required this.max,
  });

  final String label;
  final double min;
  final double max;

  bool get isMobile => this == xs || this == sm;
  bool get isTablet => this == md || this == lg;
  bool get isDesktop => this ==xl;
}

extension ResponsiveBreakpointsExt on List<ResponsiveBreakpoint> {
  // 文字列からFlavorのインスタンスを作成
  ResponsiveBreakpoint from(double width) => firstWhere(
        (point) => point.min <= width && width < point.max,
        orElse: () => throw AssertionError(),
      );
}
