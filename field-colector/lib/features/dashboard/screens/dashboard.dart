import 'package:field_colector/domain/ports/locator_provider.dart';
import 'package:field_colector/features/dashboard/widgets/map_right_slidebar_layer.dart';
import 'package:field_colector/features/map/screens/map_screen.dart';
import 'package:flutter/material.dart';

/// Pantalla principal: mapa a pantalla completa + panel lateral derecho.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.locator});

  final LocatorProvider locator;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _sidebarController;
  late final Animation<Offset> _sidebarSlide;

  /// `true` mientras el panel está visible o se está cerrando con animación.
  bool _sidebarOpen = false;

  @override
  void initState() {
    super.initState();
    _sidebarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _sidebarSlide = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _sidebarController,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _sidebarController.dispose();
    super.dispose();
  }

  void _openSidebar() {
    setState(() => _sidebarOpen = true);
    _sidebarController.forward(from: 0);
  }

  void _closeSidebar() {
    _sidebarController.reverse().then((_) {
      if (mounted) setState(() => _sidebarOpen = false);
    });
  }

  void _toggleSidebar() {
    if (_sidebarOpen) {
      _closeSidebar();
    } else {
      _openSidebar();
    }
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top + 8;
    final theme = Theme.of(context);
    final iconSelected = _sidebarOpen || _sidebarController.value > 0.001;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          MapScreen(
            locator: widget.locator,
            embedded: true,
          ),
          ListenableBuilder(
            listenable: _sidebarController,
            builder: (context, _) {
              if (!_sidebarOpen && _sidebarController.value == 0) {
                return const SizedBox.shrink();
              }
              return MapRightSlidebarLayer(
                slideAnimation: _sidebarSlide,
                onBackdropTap: _closeSidebar,
              );
            },
          ),
          Positioned(
            top: top,
            right: 8,
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: iconSelected
                    ? theme.colorScheme.primaryContainer
                    : theme.colorScheme.surfaceContainerHigh,
              ),
              tooltip: 'Menú',
              onPressed: _toggleSidebar,
              icon: Icon(
                Icons.settings,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
