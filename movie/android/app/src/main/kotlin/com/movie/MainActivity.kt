package com.movie

import android.os.Bundle
import com.movie.util.Util

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  companion object {
    const val CHANNEL = "com.movie"
    const val SCREEN_SIZE = "screenSize"
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    /* Get size. */

    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      if (call.method == SCREEN_SIZE) {

        /* Get size of screen. */
        val screenSize =  Util.getScreenSize(this)
        val stringSize = Util.objectToString(screenSize)
        result.success(stringSize)

      } else {
        result.notImplemented()
      }
    }
  }
}
