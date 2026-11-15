import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/vpn_provider.dart';
import '../../core/theme/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vpn = ref.watch(vpnProvider);
    final controller = ref.read(vpnProvider.notifier);

    final connected = vpn.isConnected;
    final server = vpn.selectedServer!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MD VPN',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Your privacy matters',
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: AppTheme.surface,
                  child: Icon(Icons.shield_outlined),
                ),
              ],
            ),

            const Spacer(),

            Center(
              child: Column(
                children: [
                  Text(
                    connected ? 'Protected' : 'Not Connected',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: connected
                          ? AppTheme.success
                          : Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 30),

                  GestureDetector(
                    onTap: controller.toggleConnection,
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.surface,
                        border: Border.all(
                          color: connected
                              ? AppTheme.success
                              : AppTheme.primary,
                          width: 4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: (connected
                                ? AppTheme.success
                                : AppTheme.primary)
                                .withOpacity(0.25),
                            blurRadius: 35,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.power_settings_new,
                        size: 85,
                        color: connected
                            ? AppTheme.success
                            : AppTheme.primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  Text(
                    connected
                        ? 'VPN UI Simulation Active'
                        : 'Tap to connect',
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Text(
                      server.flag,
                      style: const TextStyle(fontSize: 35),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selected Location',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            server.name,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('${server.ping} ms'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}