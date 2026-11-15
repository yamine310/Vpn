import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/vpn_provider.dart';

class ServersScreen extends ConsumerWidget {
  const ServersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servers = ref.watch(serversProvider);
    final vpn = ref.watch(vpnProvider);
    final controller = ref.read(vpnProvider.notifier);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'VPN Locations',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Choose your preferred server',
            style: TextStyle(color: Colors.white54),
          ),

          const SizedBox(height: 20),

          ...servers.map((server) {
            final selected =
                vpn.selectedServer?.id == server.id;

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Text(
                  server.flag,
                  style: const TextStyle(fontSize: 30),
                ),
                title: Text(server.name),
                subtitle: Text(
                  '${server.ping} ms • ${server.isPremium ? "Premium" : "Free"}',
                ),
                trailing: selected
                    ? const Icon(
                  Icons.check_circle,
                  color: Colors.greenAccent,
                )
                    : server.isPremium
                    ? const Icon(Icons.lock_outline)
                    : const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  if (server.isPremium) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Premium access is not available yet.',
                        ),
                      ),
                    );
                    return;
                  }

                  if (vpn.isConnected) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Disconnect before changing server.',
                        ),
                      ),
                    );
                    return;
                  }

                  controller.selectServer(server);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}