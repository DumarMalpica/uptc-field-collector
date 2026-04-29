import 'package:field_colector/domain/ports/locator_provider.dart';
import 'package:field_colector/features/dashboard/widgets/map_right_slidebar_layer.dart';
import 'package:field_colector/features/expeditions/screens/expedition_list_screen.dart';
import 'package:field_colector/features/map/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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

  /// Sección activa seleccionada.
  SidebarSection _activeSection = SidebarSection.home;

  @override
  void initState() {
    super.initState();
    _sidebarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _sidebarSlide = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(
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

  void _selectSection(SidebarSection section) {
    setState(() => _activeSection = section);
    if (!_sidebarOpen) _openSidebar();
  }

  Widget _buildSectionContent() {
    switch (_activeSection) {
      case SidebarSection.expeditions:
        return const ExpeditionListScreen();
      case SidebarSection.home:
      case SidebarSection.profile:
      case SidebarSection.settings:
        return Center(
          child: Text(
            _activeSection.label,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top + 8;
    final bottom = MediaQuery.paddingOf(context).bottom + 8;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          MapScreen(locator: widget.locator, embedded: true),
          ListenableBuilder(
            listenable: _sidebarController,
            builder: (context, _) {
              if (!_sidebarOpen && _sidebarController.value == 0) {
                return const SizedBox.shrink();
              }
              return MapRightSlidebarLayer(
                slideAnimation: _sidebarSlide,
                onBackdropTap: _closeSidebar,
                child: _buildSectionContent(),
              );
            },
          ),

          // ── Right-edge icon rail (always visible) ──
          Positioned(
            top: top,
            bottom: bottom,
            right: 8,
            child: Column(
              children: [
                // ── Config (top) ──
                SidebarIcon(
                  icon: Icons.settings,
                  isActive: _activeSection == SidebarSection.settings,
                  onTap: () => _selectSection(SidebarSection.settings),
                ),

                // ── Active section label (fills middle space) ──
                Expanded(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: colors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          _activeSection.label.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 3,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ── Bottom icons (home → expeditions → user) ──
                SidebarIcon(
                  icon: Icons.home_outlined,
                  isActive: _activeSection == SidebarSection.home,
                  onTap: () => _selectSection(SidebarSection.home),
                ),
                const SizedBox(height: 4),
                SidebarIcon(
                  icon: PhosphorIconsRegular.mountains,
                  isActive: _activeSection == SidebarSection.expeditions,
                  onTap: () => _selectSection(SidebarSection.expeditions),
                ),
                const SizedBox(height: 4),
                SidebarIcon(
                  icon: Icons.person_outline,
                  isActive: _activeSection == SidebarSection.profile,
                  onTap: () => _selectSection(SidebarSection.profile),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
