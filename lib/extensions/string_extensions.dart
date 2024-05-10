extension StringExtension on String {
  String replaceParams(String paramPath, List<String> paramPathValue) {
    final List<String> splitParam0 = [];
    String result = '';

    /// Remove first splash from query path param
    final splitParam = paramPath.split('/');
    for (var i in splitParam) {
      if (i.isNotEmpty) {
        splitParam0.add(i);
      }
    }

    for (int i = 0; i < splitParam0.length; i++) {
      if (result.isEmpty) {
        result = replaceAll(splitParam0[i], paramPathValue[i]);
      } else {
        result = result.replaceAll(splitParam0[i], paramPathValue[i]);
      }
    }
    return result;
  }

  String replaceParam(String paramPath, String pathParam) {
    /// Remove first splash from query path param
    final splitParam = paramPath.split('/');
    splitParam.removeAt(0);
    return replaceAll(splitParam.first, pathParam);
  }
}
