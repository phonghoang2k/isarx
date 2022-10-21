#import "IsarFlutterLibsXPlugin.h"
#if __has_include(<isar_flutter_libsx/isar_flutter_libsx-Swift.h>)
#import <isar_flutter_libsx/isar_flutter_libsx-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "isar_flutter_libsx-Swift.h"
#endif

@implementation IsarFlutterLibsXPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIsarFlutterLibsXPlugin registerWithRegistrar:registrar];
}
@end
