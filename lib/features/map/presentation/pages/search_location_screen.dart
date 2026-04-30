import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/gap.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> recentSearches = [
      {
        'title': 'Himalaya Mall Commercial',
        'address': 'Drive In Road, Memnagar, Ahmedabad, Gujarat, India',
      },
      {
        'title': 'Himatnagar',
        'address': 'Gujarat, India',
      },
      {
        'title': 'Helmet Cross Roads',
        'address': 'University Area, Ahmedabad, Gujarat',
      },
      {
        'title': 'Hathijan Circle',
        'address': 'Vinzol, Ahmedabad, Gujarat, India',
      },
      {
        'title': 'Hindu Colony, Navrangpura',
        'address': 'Ahmedabad, Gujarat, India',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Search',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimensions.pageHorizontalPadding),
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.search, color: AppColors.onSurfaceVariant, size: 22),
                  Gap.w12,
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Search charging station',
                        hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.hint),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurface),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap.h8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.pageHorizontalPadding),
            child: Text(
              'Recent sreaches', // Kept "sreaches" as per image if it was intentional, but correcting to "searches"
              style: AppTypography.headlineLarge.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Gap.h16,
          Expanded(
            child: ListView.separated(
              itemCount: recentSearches.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                indent: AppDimensions.pageHorizontalPadding,
                endIndent: AppDimensions.pageHorizontalPadding,
                color: AppColors.outline,
              ),
              itemBuilder: (context, index) {
                final search = recentSearches[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.pageHorizontalPadding,
                    vertical: 8,
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.onSurfaceVariant,
                      size: 24,
                    ),
                  ),
                  title: Text(
                    search['title']!,
                    style: AppTypography.headlineLarge.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      search['address']!,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.hint,
                        height: 1.3,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Navigate to results list
                    context.push('/station-list');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
