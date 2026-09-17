import 'package:flutter/material.dart';

void main() {
  runApp(const CricketApp());
}

class CricketApp extends StatelessWidget {
  const CricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cricket App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff0756a5),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'sans',
      ),
      home: const CricketHomePage(),
    );
  }
}

class CricketHomePage extends StatefulWidget {
  const CricketHomePage({super.key});

  @override
  State<CricketHomePage> createState() => _CricketHomePageState();
}

class _CricketHomePageState extends State<CricketHomePage> {
  int _runs = 0;
  int _wickets = 0;
  int _balls = 0;

  void _addRuns(int value) {
    setState(() {
      _runs += value;
      _balls++;
    });
  }

  void _addWicket() {
    setState(() {
      _wickets++;
      _balls++;
    });
  }

  void _resetScore() {
    setState(() {
      _runs = 0;
      _wickets = 0;
      _balls = 0;
    });
  }

  String get _overs => '${_balls ~/ 6}.${_balls % 6}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cricket App',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff1565c0),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: const Color(0xffeaf3fb),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight - 52),
                  child: Column(
                    children: [
                      const Text(
                        'MATCH SCORE',
                        style: TextStyle(
                          color: Color(0xff1565c0),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ScoreCard(
                              icon: Icons.sports_cricket,
                              label: 'Runs',
                              value: _runs.toString(),
                              color: const Color(0xff1565c0),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: ScoreCard(
                              icon: Icons.sports_baseball,
                              label: 'Balls',
                              value: _balls.toString(),
                              color: const Color(0xff1565c0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xffd5e3ef)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '$_runs / $_wickets',
                              style: TextStyle(
                                color: const Color(0xff1565c0),
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Score',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _ScoreDetail(label: 'Wickets', value: '$_wickets'),
                                Container(
                                  height: 30,
                                  width: 1,
                                  color: Colors.grey.shade300,
                                  margin: const EdgeInsets.symmetric(horizontal: 28),
                                ),
                                _ScoreDetail(label: 'Overs', value: _overs),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'ADD SCORE',
                          style: TextStyle(
                            color: Color(0xff1565c0),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.7,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2.15,
                        children: [
                          for (final value in [0, 1, 2, 3, 4, 6])
                            ScoreButton(label: '$value', onPressed: () => _addRuns(value)),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: _addWicket,
                              icon: const Icon(Icons.close_rounded),
                              label: const Text('Wicket'),
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xff1565c0),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _resetScore,
                              icon: const Icon(Icons.refresh_rounded),
                              label: const Text('Reset'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xff1565c0),
                                side: const BorderSide(color: Color(0xff1565c0)),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatelessWidget {
  const ScoreCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffd5e3ef)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 10),
          Text(label, style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

class ScoreButton extends StatelessWidget {
  const ScoreButton({required this.label, required this.onPressed, super.key});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff07549f),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
    );
  }
}

class _ScoreDetail extends StatelessWidget {
  const _ScoreDetail({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      ],
    );
  }
}