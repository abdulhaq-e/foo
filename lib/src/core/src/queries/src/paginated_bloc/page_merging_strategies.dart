class PageMergingStrategies {
  static List<Item> mergeByConcatenation<Item>(
    List<Item> currentItems,
    List<Item> newItems,
  ) {
    return [...currentItems, ...newItems];
  }

  static List<Item> mergeByReplacement<Item>(
    List<Item> currentItems,
    List<Item> newItems,
  ) {
    return [...newItems];
  }
}
