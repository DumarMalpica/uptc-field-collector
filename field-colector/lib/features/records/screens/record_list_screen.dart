import 'package:field_colector/core/services/user_cache_service.dart';
import 'package:field_colector/domain/outing_member_display.dart';
import 'package:field_colector/domain/ports/bird_record_local_port.dart';
import 'package:field_colector/domain/ports/rock_record_local_port.dart';
import 'package:field_colector/domain/ports/social_record_local_port.dart';
import 'package:field_colector/domain/ports/soil_record_local_port.dart';
import 'package:field_colector/domain/ports/vegetation_record_local_port.dart';
import 'package:field_colector/domain/ports/water_record_local_port.dart';
import 'package:field_colector/features/records/models/record_list_item.dart';
import 'package:field_colector/features/records/screens/record_detail_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:field_colector/features/records/widgets/sync_badge.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/// Lista todos los registros locales de una expedición (todos los módulos).
class RecordListScreen extends StatefulWidget {
  const RecordListScreen({
    super.key,
    required this.outingId,
    required this.onBack,
    this.onNavigateToLocation,
  });

  final String outingId;
  final VoidCallback onBack;
  final ValueChanged<LatLng>? onNavigateToLocation;

  @override
  State<RecordListScreen> createState() => _RecordListScreenState();
}

class _RecordListScreenState extends State<RecordListScreen> {
  List<RecordListItem> _entries = [];
  Map<String, String> _userNames = {};
  bool _loading = true;
  String? _error;
  RecordListItem? _selected;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadRecords());
  }

  Future<void> _loadRecords() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final bird = context.read<BirdRecordLocalPort>();
      final rock = context.read<RockRecordLocalPort>();
      final soil = context.read<SoilRecordLocalPort>();
      final vegetation = context.read<VegetationRecordLocalPort>();
      final water = context.read<WaterRecordLocalPort>();
      final social = context.read<SocialRecordLocalPort>();

      final birds = await bird.getRecordsByOuting(widget.outingId);
      final rocks = await rock.getRecordsByOuting(widget.outingId);
      final soils = await soil.getRecordsByOuting(widget.outingId);
      final veg = await vegetation.getRecordsByOuting(widget.outingId);
      final waters = await water.getRecordsByOuting(widget.outingId);
      final socials = await social.getRecordsByOuting(widget.outingId);

      final entries = <RecordListItem>[
        for (final r in birds) RecordListItem.bird(r),
        for (final r in rocks) RecordListItem.rock(r),
        for (final r in soils) RecordListItem.soil(r),
        for (final r in veg) RecordListItem.vegetation(r),
        for (final r in waters) RecordListItem.water(r),
        for (final r in socials) RecordListItem.social(r),
      ];
      entries.sort(
        (a, b) => b.record.recordedAt.compareTo(a.record.recordedAt),
      );

      final userIds = entries.map((e) => e.record.userId).toSet();
      final users =
          await context.read<UserCacheService>().resolveUsers(userIds);
      final names = <String, String>{
        for (final e in users.entries) e.key: e.value.fullName,
      };

      if (!mounted) return;
      setState(() {
        _entries = entries;
        _userNames = names;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  String _observerLabel(String userId) {
    final name = _userNames[userId];
    if (name != null && name.isNotEmpty) return name;
    return kUnknownMemberLabel;
  }

  @override
  Widget build(BuildContext context) {
    if (_selected != null) {
      return RecordDetailScreen(
        item: _selected!,
        onBack: () => setState(() => _selected = null),
        onNavigateToLocation: widget.onNavigateToLocation,
      );
    }

    final dateFormat = DateFormat('dd MMM yyyy HH:mm', 'es');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: widget.onBack,
              ),
              const SizedBox(width: 4),
              const Expanded(
                child: Text(
                  'Registros',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (!_loading)
                Text(
                  '${_entries.length}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          _error!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: AppColors.textSecondary),
                        ),
                      ),
                    )
                  : _entries.isEmpty
                      ? const Center(
                          child: Text(
                            'Sin registros en esta expedición',
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.all(16),
                          itemCount: _entries.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, i) {
                            final entry = _entries[i];
                            final r = entry.record;
                            final location = [
                              if (r.municipality.isNotEmpty) r.municipality,
                              if (r.department.isNotEmpty) r.department,
                            ].join(', ');

                            return Card(
                              elevation: 0,
                              color: AppColors.surface,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: AppColors.primary
                                      .withValues(alpha: 0.15),
                                ),
                              ),
                              child: ListTile(
                                onTap: () =>
                                    setState(() => _selected = entry),
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.primary
                                      .withValues(alpha: 0.12),
                                  child: Icon(
                                    entry.typeIcon,
                                    size: 20,
                                    color: AppColors.primary,
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary
                                            .withValues(alpha: 0.12),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        entry.typeLabel,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        dateFormat.format(r.recordedAt),
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (location.isNotEmpty)
                                      Text(
                                        location,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    Text(
                                      'Por ${_observerLabel(r.userId)}',
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SyncBadge(status: r.syncStatus),
                                    const SizedBox(width: 4),
                                    Icon(
                                      Icons.chevron_right,
                                      size: 20,
                                      color: AppColors.textSecondary,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
        ),
      ],
    );
  }
}
