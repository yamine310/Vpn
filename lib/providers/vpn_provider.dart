import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/vpn_server.dart';

class VpnState {
  final bool isConnected;
  final VpnServer? selectedServer;

  const VpnState({
    this.isConnected = false,
    this.selectedServer,
  });

  VpnState copyWith({
    bool? isConnected,
    VpnServer? selectedServer,
  }) {
    return VpnState(
      isConnected: isConnected ?? this.isConnected,
      selectedServer: selectedServer ?? this.selectedServer,
    );
  }
}

final serversProvider = Provider<List<VpnServer>>((ref) {
  return const [
    VpnServer(
      id: '1',
      name: 'United States',
      country: 'USA',
      flag: '🇺🇸',
      ping: 35,
    ),
    VpnServer(
      id: '2',
      name: 'United Kingdom',
      country: 'UK',
      flag: '🇬🇧',
      ping: 48,
    ),
    VpnServer(
      id: '3',
      name: 'Singapore',
      country: 'Singapore',
      flag: '🇸🇬',
      ping: 22,
    ),
    VpnServer(
      id: '4',
      name: 'Germany',
      country: 'Germany',
      flag: '🇩🇪',
      ping: 65,
      isPremium: false,
    ),
    VpnServer(
      id: '5',
      name: 'Japan',
      country: 'Japan',
      flag: '🇯🇵',
      ping: 72,
      isPremium: false,
    ),
  ];
});

class VpnController extends Notifier<VpnState> {
  @override
  VpnState build() {
    final servers = ref.watch(serversProvider);

    return VpnState(
      selectedServer: servers.first,
    );
  }

  void toggleConnection() {
    state = state.copyWith(
      isConnected: !state.isConnected,
    );
  }

  void selectServer(VpnServer server) {
    state = state.copyWith(
      selectedServer: server,
    );
  }
}

final vpnProvider =
NotifierProvider<VpnController, VpnState>(
  VpnController.new,
);