enum EventFilterType {
  priority_5(label: 'Do not attend', opacity: 0.4, baseColor: 255),
  priority_4(label: 'Low Priority', opacity: 0.8, baseColor: 255),
  priority_3(label: 'Middle Priority', opacity: 1, baseColor: 255),
  priority_2(label: 'High Priority', opacity: 0.9, baseColor: 0),
  priority_1(label: 'Fixed schedule', opacity: 0.8, baseColor: 0);

  const EventFilterType({
    required this.label,
    required this.opacity,
    required this.baseColor,
  });
  final String label;
  final double opacity;
  final int baseColor;

  @override
  String toString() => label;
}
