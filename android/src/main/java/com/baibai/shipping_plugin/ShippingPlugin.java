package com.baibai.shipping_plugin;

import android.app.Activity;
import android.app.Dialog;

import java.lang.reflect.Method;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * ShippingPlugin
 */
public class ShippingPlugin implements MethodCallHandler {
    /**
     * Plugin registration.
     */

    Activity context;
    MethodChannel methodChannel;

    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "shipping_plugin");
        channel.setMethodCallHandler(new ShippingPlugin(registrar.activity(), channel));
    }

    public ShippingPlugin(Activity activity, MethodChannel methodChannel) {
        this.context = activity;
        this.methodChannel = methodChannel;
        this.methodChannel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if (call.method.equalsIgnoreCase("showAlertDialog")) {
            Dialog dialog = new Dialog(context);
            dialog.setTitle("Hi, My Name is Flutter");
            dialog.show();
        } else {
            result.notImplemented();
        }
    }
}
