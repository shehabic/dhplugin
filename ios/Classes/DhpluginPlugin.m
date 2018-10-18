#import "DhpluginPlugin.h"
#import <dhplugin/dhplugin-Swift.h>

@implementation DhpluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDhpluginPlugin registerWithRegistrar:registrar];
}
@end
