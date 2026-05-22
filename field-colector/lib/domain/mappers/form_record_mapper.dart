abstract class FormRecordMapper<T> {
  T fromFormValues(
    Map<String, dynamic> values, {
    required String recordId,
    required String outingId,
    required String userId,
  });
}
