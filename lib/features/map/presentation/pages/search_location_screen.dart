import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/gap.dart';
import '../../../station_list/domain/station.dart';
import '../../../station_list/domain/station_search_response.dart';
import '../../../station_list/presentation/providers/station_search_notifier.dart';
import '../../../station_list/presentation/widgets/station_card.dart';
import '../../../../features/filters/presentation/widgets/filter_bottom_sheet.dart';

class SearchLocationScreen extends ConsumerStatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  ConsumerState<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends ConsumerState<SearchLocationScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearch(String query) {
    if (query.isNotEmpty) {
      ref.read(stationSearchProvider.notifier).search(query);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(stationSearchProvider);

    final List<Map<String, String>> recentSearches = [
      {'title': 'Himalaya Mall Commercial', 'address': 'Drive In Road, Memnagar, Ahmedabad'},
      {'title': 'Himatnagar', 'address': 'Gujarat, India'},
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Search',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                _SearchField(
                  controller: _searchController,
                  onSubmitted: _onSearch,
                ),
                const _FilterSortBar(),
                Gap.h16,
              ],
            ),
          ),
          Expanded(
            child: _buildBody(searchState, recentSearches),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(AsyncValue<StationSearchResponse?> state, List<Map<String, String>> recentSearches) {
    return state.when(
      data: (response) {
        if (response == null) {
          return _RecentSearchesSection(
            searches: recentSearches,
            onSearch: _onSearch,
          );
        }
        if (response.stations.isEmpty) {
          return const Center(child: Text('No stations found'));
        }
        return _SearchResultsSection(stations: response.stations);
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.pageHorizontalPadding,
        vertical: 12,
      ),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              Icons.search_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
            Gap.w12,
            Expanded(
              child: TextField(
                controller: controller,
                autofocus: true,
                onSubmitted: onSubmitted,
                decoration: InputDecoration(
                  hintText: 'Search charging station...',
                  hintStyle: AppTypography.bodyLarge.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: AppTypography.bodyLarge.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterSortBar extends StatefulWidget {
  const _FilterSortBar();

  @override
  State<_FilterSortBar> createState() => _FilterSortBarState();
}

class _FilterSortBarState extends State<_FilterSortBar> {
  int _selectedIndex = 0; // 0 for Nearby, 1 for Fastest, etc.

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sortOptions = [
      {'label': 'Nearby', 'icon': Icons.location_on_rounded},
      {'label': 'Fastest', 'icon': Icons.bolt_rounded},
      {'label': 'Top Rated', 'icon': Icons.star_rounded},
      {'label': 'Available', 'icon': Icons.check_circle_rounded},
    ];

    return SizedBox(
      height: 44,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.pageHorizontalPadding),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: sortOptions.length + 1,
        separatorBuilder: (_, index) => Gap.w8,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _FilterButton(
              onTap: () => FilterBottomSheet.show(context),
            );
          }
          final optionIndex = index - 1;
          final option = sortOptions[optionIndex];
          return _SortChip(
            label: option['label'],
            icon: option['icon'],
            isSelected: _selectedIndex == optionIndex,
            onTap: () {
              setState(() {
                _selectedIndex = optionIndex;
              });
            },
          );
        },
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.tune_rounded,
                size: 18,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Gap.w8,
              Text(
                'Filters',
                style: AppTypography.bodyMedium.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SortChip extends StatelessWidget {
  const _SortChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppColors.primary 
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isSelected 
                ? AppColors.primary 
                : colorScheme.outline.withValues(alpha: 0.5),
            width: 1.2,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ] : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : colorScheme.onSurfaceVariant,
            ),
            Gap.w4,
            Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                color: isSelected ? Colors.white : colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentSearchesSection extends StatelessWidget {
  const _RecentSearchesSection({
    required this.searches,
    required this.onSearch,
  });

  final List<Map<String, String>> searches;
  final ValueChanged<String> onSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.pageHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent searches',
                style: AppTypography.titleLarge.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Clear all',
                  style: AppTypography.bodyMedium.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap.h8,
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: searches.length,
            separatorBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.pageHorizontalPadding),
              child: Divider(
                height: 1,
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
              ),
            ),
            itemBuilder: (context, index) {
              final search = searches[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.pageHorizontalPadding,
                  vertical: 4,
                ),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.history_rounded,
                    size: 20,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                title: Text(
                  search['title']!,
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  search['address']!,
                  style: AppTypography.bodySmall.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                trailing: Icon(
                  Icons.north_west_rounded,
                  size: 18,
                  color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                ),
                onTap: () => onSearch(search['title']!),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SearchResultsSection extends StatelessWidget {
  const _SearchResultsSection({required this.stations});

  final List<Station> stations;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.pageHorizontalPadding,
        0,
        AppDimensions.pageHorizontalPadding,
        AppDimensions.pageHorizontalPadding,
      ),
      itemCount: stations.length,
      separatorBuilder: (_, index) => Gap.h16,
      itemBuilder: (context, index) {
        return StationCard(
          station: stations[index],
          onTap: () {
            // Handle station selection
          },
        );
      },
    );
  }
}
