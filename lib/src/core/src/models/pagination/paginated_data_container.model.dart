import 'package:foo/core.dart';

class PaginatedDataContainer<Item>
    extends DataContainer<List<Item>, PaginatedResponseMetadata> {
  const PaginatedDataContainer({required this.data, required this.metadata})
      : super(data: data, metadata: metadata);
  @override
  final List<Item> data;
  @override
  final PaginatedResponseMetadata metadata;
}
