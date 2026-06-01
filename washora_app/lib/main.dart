import 'package:flutter/material.dart';

void main() {
  runApp(const WashoraApp());
}

class WashoraApp extends StatelessWidget {
  const WashoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedBlue = Color(0xFF0B76D1);

    return MaterialApp(
      title: 'Washora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedBlue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F9FF),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xFFE4EDF7)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFD6E4F2)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFD6E4F2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: seedBlue, width: 1.6),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: seedBlue,
            foregroundColor: Colors.white,
            elevation: 0,
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: seedBlue,
            minimumSize: const Size.fromHeight(52),
            side: const BorderSide(color: Color(0xFF9DCAF0)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

class ReceiptData {
  const ReceiptData({
    required this.customerId,
    required this.orderId,
    required this.name,
    required this.phone,
    required this.service,
    required this.clothesCount,
  });

  final String customerId;
  final String orderId;
  final String name;
  final String phone;
  final String service;
  final int clothesCount;
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _WashoraLogo(size: 88),
                  const SizedBox(height: 28),
                  Text(
                    'Welcome to Washora',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF123C69),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Manage laundry orders, receipts, and pickups from one clean workspace.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF61758A),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email or phone',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (_) => const DashboardScreen(),
                        ),
                      );
                    },
                    child: const Text('Login'),
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

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      const _DashboardStat('Orders', '24', Icons.receipt_long_outlined),
      const _DashboardStat('Picked Up', '11', Icons.local_shipping_outlined),
      const _DashboardStat('Ready', '8', Icons.check_circle_outline),
      const _DashboardStat('Revenue', '₹12,480', Icons.payments_outlined),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: _WashoraLogo(size: 40),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            Text(
              'Today at a glance',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: const Color(0xFF123C69),
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Track active orders and create new receipts for walk-in customers.',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: const Color(0xFF61758A)),
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 640 ? 4 : 2;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: stats.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: columns == 4 ? 1.35 : 1.18,
                  ),
                  itemBuilder: (context, index) =>
                      _StatCard(stat: stats[index]),
                );
              },
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const ScanOrderScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.document_scanner_outlined),
              label: const Text('Scan New Paper'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const PreviewCustomerScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.edit_note_outlined),
              label: const Text('Create Receipt Manually'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScanOrderScreen extends StatelessWidget {
  const ScanOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Order')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 132,
                          height: 132,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF5FF),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFB8DDF8),
                              width: 1.4,
                            ),
                          ),
                          child: const Icon(
                            Icons.document_scanner_outlined,
                            size: 64,
                            color: Color(0xFF0B76D1),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'OCR preview placeholder',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: const Color(0xFF123C69),
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Paper scanning and text extraction will appear here when OCR is connected.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: const Color(0xFF61758A),
                                height: 1.4,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('OCR integration is not connected yet.'),
                    ),
                  );
                },
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Scan'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const PreviewCustomerScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.edit_note_outlined),
                label: const Text('Manual Entry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreviewCustomerScreen extends StatefulWidget {
  const PreviewCustomerScreen({super.key});

  @override
  State<PreviewCustomerScreen> createState() => _PreviewCustomerScreenState();
}

class _PreviewCustomerScreenState extends State<PreviewCustomerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Aarav Sharma');
  final _phoneController = TextEditingController(text: '+91 98765 43210');
  final _clothesController = TextEditingController(text: '12');
  String _serviceType = 'Wash & Fold';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _clothesController.dispose();
    super.dispose();
  }

  void _createReceipt() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final now = DateTime.now();
    final receipt = ReceiptData(
      customerId: 'CUS-${now.millisecondsSinceEpoch.toString().substring(8)}',
      orderId: 'ORD-${now.microsecondsSinceEpoch.toString().substring(9)}',
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      service: _serviceType,
      clothesCount: int.parse(_clothesController.text.trim()),
    );

    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => ReceiptScreen(receipt: receipt)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Customer')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(
                'Customer details',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: const Color(0xFF123C69),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Review OCR data or enter customer information manually.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF61758A),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Customer Name',
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter customer name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _serviceType,
                decoration: const InputDecoration(
                  labelText: 'Service Type',
                  prefixIcon: Icon(Icons.local_laundry_service_outlined),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Wash & Fold',
                    child: Text('Wash & Fold'),
                  ),
                  DropdownMenuItem(
                    value: 'Dry Cleaning',
                    child: Text('Dry Cleaning'),
                  ),
                  DropdownMenuItem(value: 'Ironing', child: Text('Ironing')),
                  DropdownMenuItem(
                    value: 'Premium Laundry',
                    child: Text('Premium Laundry'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _serviceType = value);
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _clothesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number of Clothes',
                  prefixIcon: Icon(Icons.inventory_2_outlined),
                ),
                validator: (value) {
                  final count = int.tryParse(value?.trim() ?? '');
                  if (count == null || count <= 0) {
                    return 'Enter a valid clothes count';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 28),
              ElevatedButton.icon(
                onPressed: _createReceipt,
                icon: const Icon(Icons.receipt_long_outlined),
                label: const Text('Create Receipt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key, required this.receipt});

  final ReceiptData receipt;

  @override
  Widget build(BuildContext context) {
    final details = [
      _ReceiptLine('Customer ID', receipt.customerId),
      _ReceiptLine('Order ID', receipt.orderId),
      _ReceiptLine('Name', receipt.name),
      _ReceiptLine('Phone', receipt.phone),
      _ReceiptLine('Service', receipt.service),
      _ReceiptLine('Clothes Count', receipt.clothesCount.toString()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Receipt')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _WashoraLogo(size: 56),
                    const SizedBox(height: 16),
                    Text(
                      'Receipt Created',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: const Color(0xFF123C69),
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Share this receipt with the customer at pickup.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF61758A),
                      ),
                    ),
                    const SizedBox(height: 24),
                    for (final detail in details) _ReceiptRow(line: detail),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(
                    builder: (_) => const DashboardScreen(),
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.dashboard_outlined),
              label: const Text('Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}

class _WashoraLogo extends StatelessWidget {
  const _WashoraLogo({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0B76D1), Color(0xFF24B3F2)],
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0B76D1).withValues(alpha: 0.18),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Icon(
          Icons.water_drop_outlined,
          color: Colors.white,
          size: size * 0.52,
        ),
      ),
    );
  }
}

class _DashboardStat {
  const _DashboardStat(this.label, this.value, this.icon);

  final String label;
  final String value;
  final IconData icon;
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.stat});

  final _DashboardStat stat;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF5FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(stat.icon, color: const Color(0xFF0B76D1)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stat.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: const Color(0xFF123C69),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  stat.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF61758A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ReceiptLine {
  const _ReceiptLine(this.label, this.value);

  final String label;
  final String value;
}

class _ReceiptRow extends StatelessWidget {
  const _ReceiptRow({required this.line});

  final _ReceiptLine line;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE4EDF7))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              line.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF61758A),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              line.value,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF123C69),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
