enum FlavorType {
  dev(label: 'dev'),
  stg(label: 'stg'),
  prod(label: 'prod');

  const FlavorType({required this.label});
  final String label;

  bool get isDev => this == FlavorType.dev;
}

extension FlavorTypesExt<FlavorType extends Enum> on List<FlavorType> {
  // 文字列からFlavorのインスタンスを作成
  FlavorType from(String value) => firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => throw AssertionError('$value is not Flavor'),
      );
}
