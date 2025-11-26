/*import 'package:flutter/material.dart';
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

    setState(() => _isLoading = false); 
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
*/

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
  Box<Task>? _tasksBox;
  bool _isLoading = true;
  int _selectedTab = 0; // ✅ 0 = الكل، 1 = المكتملة

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    try {
      _tasksBox = await Hive.openBox<Task>('tasksBox');
    } catch (e) {
      debugPrint('❌ Hive load error: $e');
    }
    setState(() => _isLoading = false);
  }

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final task = Task(title: text);
    _tasksBox!.add(task);
    _controller.clear();
  }

  void _goToStatistics() async {
    final box = Hive.box<Task>('tasksBox');
    final tasks = box.values.toList();
    final completed = tasks.where((t) => t.isCompleted).length;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatisticsScreen(
          totalTasks: tasks.length,
          completedTasks: completed,
        ),
      ),
    );

    setState(() {}); // تحديث بعد الرجوع
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

    return Scaffold(
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
            tooltip: 'عن التطبيق',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // ✅ إدخال مهمة جديدة
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
                  suffixIcon: Padding(
  padding: const EdgeInsets.only(right: 6, left: 6), 
  child: IconButton(
    onPressed: _addTask,
    icon: const Icon(
      Icons.add_circle_rounded, 
      color: Color(0xFFFF8CA0), 
      size: 30, 
    ),
    splashRadius: 24, 
  ),
),

                ),
              ),
              const SizedBox(height: 20),

              // ✅ التبويبات
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEEF4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTabButton("الكل", 0, Icons.list_alt),
                    _buildTabButton("المكتملة", 1, Icons.check_circle),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // ✅ قائمة المهام
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box<Task>('tasksBox').listenable(),
                  builder: (context, Box<Task> box, _) {
                    var tasks = box.values.toList();

                    // فلترة حسب التبويب
                    if (_selectedTab == 1) {
                      tasks = tasks.where((t) => t.isCompleted).toList();
                    }

                    if (tasks.isEmpty) {
                      return const Center(
                        child: Text(
                          'لا توجد مهام هنا 📝',
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TaskTile(
                            task: task.title,
                            isCompleted: task.isCompleted,
                            onToggle: () {
                              task.isCompleted = !task.isCompleted;
                              task.save();
                            },
                            onDelete: () => box.deleteAt(index),
                          ),
                        );
                      },
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

  // ✅ زر التبويب مع الأيقونة
  Widget _buildTabButton(String text, int index, IconData icon) {
    final bool isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFB6C1) : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  color: isSelected ? Colors.white : Colors.grey.shade600),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey.shade700,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
