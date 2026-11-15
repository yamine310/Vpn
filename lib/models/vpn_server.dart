class VpnServer {
  final String id;
  final String name;
  final String country;
  final String flag;
  final int ping;
  final bool isPremium;

  const VpnServer({
    required this.id,
    required this.name,
    required this.country,
    required this.flag,
    required this.ping,
    this.isPremium = false,
  });
}