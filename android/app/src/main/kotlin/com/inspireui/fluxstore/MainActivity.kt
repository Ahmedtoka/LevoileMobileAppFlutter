package com.inspireui.fluxstore

import android.app.NotificationManager
import android.content.Context
import android.provider.Settings
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterFragmentActivity() {
    private val deviceChannel = "com.levoile.stores/device"

    override fun onResume() {
        super.onResume()
        closeAllNotifications();
    }

    private fun closeAllNotifications() {
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.cancelAll()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        // Exposes the stable Android ID (Settings.Secure.ANDROID_ID). It survives
        // app reinstall and clearing data/cache (only a factory reset changes it),
        // so a device can never farm more than one welcome coupon.
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, deviceChannel)
            .setMethodCallHandler { call, result ->
                if (call.method == "getAndroidId") {
                    val id = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)
                    result.success(id)
                } else {
                    result.notImplemented()
                }
            }
    }
}