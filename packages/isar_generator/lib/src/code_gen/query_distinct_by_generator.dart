import 'package:dartx/dartx.dart';

import '../helper.dart';
import '../isar_type.dart';
import '../object_info.dart';

String generateDistinctBy(ObjectInfo oi) {
  var code = '''
  extension ${oi.dartName}QueryWhereDistinct on QueryBuilder<${oi.dartName}, ${oi.dartName}, QDistinct> {''';
  for (var property in oi.properties) {
    if (property.isarType == IsarType.string) {
      code += '''
        QueryBuilder<${oi.dartName}, ${oi.dartName}, QDistinct>distinctBy${property.dartName.capitalize()}({bool caseSensitive = true}) {
            return addDistinctByInternal('${property.isarName.esc}', caseSensitive: caseSensitive);
        }''';
    } else if (property.isarType.index < IsarType.string.index) {
      code += '''
        QueryBuilder<${oi.dartName}, ${oi.dartName}, QDistinct>distinctBy${property.dartName.capitalize()}() {
            return addDistinctByInternal('${property.isarName.esc}');
        }''';
    }
  }
  return '$code}';
}
