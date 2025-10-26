import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/task_model.dart';
import '../widgets/task_tile.dart';
import 'about_screen.dart';
import 'statistics_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  Box? _tasksBox;
  List<Task> _tasks = [];
  bool _isLoading = true; // ✅ لعرض لودر مؤقتًا

  @override
  void initState() {
    super.initState();
    _openBoxAndLoadTasks();
  }

  Future<void> _openBoxAndLoadTasks() async {
    try {
      if (!Hive.isBoxOpen('tasksBox')) {
        _tasksBox = await Hive.openBox('tasksBox');
      } else {
        _tasksBox = Hive.box('tasksBox');
      }

      _loadTasks();
    } catch (e) {
      debugPrint('❌ Hive load error: $e');
    }

    setState(() => _isLoading = false); // ✅ نوقف اللودر بعد ما تجهز البيانات
  }

  void _loadTasks() {
    final stored = _tasksBox?.get('tasks', defaultValue: <Map>[]) ?? [];
    _tasks = List<Map>.from(stored)
        .map((taskMap) => Task.fromMap(taskMap))
        .toList();
  }

  void _saveTasks() {
    final taskMaps = _tasks.map((task) => task.toMap()).toList();
    _tasksBox?.put('tasks', taskMaps);
  }

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _tasks.add(Task(title: text));
      _controller.clear();
    });
    _saveTasks();
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _saveTasks();
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
    _saveTasks();
  }

  void _goToStatistics() {
    final completed = _tasks.where((t) => t.isCompleted).length;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatisticsScreen(
          totalTasks: _tasks.length,
          completedTasks: completed,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFFFFB6C1)),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            'مهامي اليومية',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFFFB6C1),
          leading: IconButton(
            icon: const Icon(Icons.bar_chart, color: Colors.white),
            tooltip: 'إحصائيات المهام',
            onPressed: _goToStatistics,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutScreen()),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: '...أضف مهمة جديدة',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: IconButton(
                    onPressed: _addTask,
                    icon: const Icon(
                      Icons.add_circle,
                      color: Color(0xFFFFB6C1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _tasks.isEmpty
                    ? const Center(
                        child: Text(
                          'لا توجد مهام بعد 📝',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _tasks.length,
                        itemBuilder: (context, index) {
                          final task = _tasks[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TaskTile(
                              task: task.title,
                              isCompleted: task.isCompleted,
                              onToggle: () => _toggleTask(index),
                              onDelete: () => _removeTask(index),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
