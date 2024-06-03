import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../_global/provider/firebase_collection.dart';
import '../model/report_model.dart';

part 'report_repository.g.dart';

@riverpod
CollectionReference<ReportModel> reportRepository(ReportRepositoryRef ref) {
  return ref.read(firebaseCollectionProvider).reportCollectionRef.withConverter(
        fromFirestore: (s, _) => ReportModel.fromJson(
          {
            ...s.data()!,
            "id": s.id,
          },
        ),
        toFirestore: (value, _) {
          return value.toJson();
        },
      );
}
