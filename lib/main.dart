import 'package:flutter/material.dart';

void main() {
  runApp(const XrealCompanionApp());
}

class XrealCompanionApp extends StatelessWidget {
  const XrealCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFF9B8CFF);

    return MaterialApp(
      title: 'XREAL Companion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101116),
        colorScheme: ColorScheme.fromSeed(
          seedColor: accentColor,
          brightness: Brightness.dark,
          surface: const Color(0xFF191A22),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.8,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Color(0xFFB8B8C4),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showPairingMessage(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Glasses pairing will be available in a future update.'),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'XREAL',
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 2),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your glasses,\nconnected.',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Set up your XREAL One to bring your phone experience '
                    'to the big screen.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.07),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withOpacity(0.14),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: colorScheme.primary,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'No glasses connected',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Connect your glasses to get started.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: () => _showPairingMessage(context),
                            icon: const Icon(Icons.bluetooth),
                            label: const Text('Pair glasses'),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
