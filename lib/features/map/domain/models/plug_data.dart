class PlugData {
  const PlugData({
    required this.title,
    required this.subtitle,
    required this.connectorType,
    required this.svgAsset,
    this.isDisabled = false,
  });

  final String title;
  final String subtitle;
  final String connectorType;
  final String svgAsset;
  final bool   isDisabled;
}
