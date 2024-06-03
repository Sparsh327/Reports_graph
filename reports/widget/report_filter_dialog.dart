// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/context_utils.dart';
import '../../_global/enum/sort_enum.dart';
import '../../_global/widget/select_chip.dart';
import '../model/report_filter_model.dart';
import '../model/report_model.dart';
import '../provider/report_provider.dart';

void showReportFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      final double widthPercent;
      if (context.isMobile) {
        widthPercent = 0.8;
      } else if (context.isTab) {
        widthPercent = 0.6;
      } else {
        widthPercent = 0.4;
      }

      return Dialog(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.sizeValue.width * widthPercent,
          ),
          child: const _FilterOptions(),
        ),
      );
    },
  );
}

class _FilterOptions extends HookConsumerWidget {
  ///
  const _FilterOptions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.read(reportFilterProvider);
    final types = useState(filter.types ?? []);
    final sort = useState(filter.sort);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Filter & Sort",
                style: context.textTheme.titleLarge,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: const Icon(Icons.close),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Filters",
            style: context.textTheme.titleMedium,
          ),
          Wrap(
            children: [
              for (final i in ReportType.values)
                SelectChip(
                  onTap: () {
                    if (types.value.contains(i)) {
                      types.value = [...types.value]..remove(i);
                    } else {
                      types.value = [...types.value, i];
                    }
                  },
                  title: i.inString,
                  isSelected: types.value.contains(i),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Sort",
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          for (final i in SortType.values)
            ListTile(
              onTap: () {
                sort.value = i;
              },
              title: Text(i.inString),
              leading: Radio<SortType>(
                value: i,
                groupValue: sort.value,
                onChanged: (value) {
                  if (value != null) {
                    sort.value = value;
                  }
                },
              ),
            ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  ref.read(reportFilterProvider.notifier).clear();
                  context.pop();
                },
                child: const Text("Clear"),
              ),
              ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 36),
                      ),
                    ),
                onPressed: () {
                  ref.read(reportFilterProvider.notifier).set(
                        ReportFilterModel(
                          types: types.value,
                          sort: sort.value,
                        ),
                      );
                  context.pop();
                },
                child: const Text("Apply"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
