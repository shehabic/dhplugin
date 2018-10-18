package com.deliveryhero.pandora.dhplugin;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * DhpluginPlugin
 */
public class DhpluginPlugin implements MethodCallHandler {

    public interface Listener {
        public void onDataRequested(String method, Result result);
    }

    private static Listener listener;

    public static void addListener(Listener listener) {
        DhpluginPlugin.listener = listener;
    }

    public static void removeListener() {
        listener = null;
    }

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "dhplugin");
        channel.setMethodCallHandler(new DhpluginPlugin());
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if (listener != null) {
            listener.onDataRequested(call.method, result);
        } else {
            result.notImplemented();
        }
    }
}
