package com.movie.util

import android.content.Context
import com.google.gson.Gson
import com.movie.model.Size

object Util {
    /**
     * Convert dp to pixel.
     */
    fun dpTopixel(context: Context, dp: Float): Int {
        val density = context.resources.displayMetrics.density
        return (dp * density).toInt()
    }

    /**
     * Convert pixel to dp
     */
    fun pixelTodp(context: Context, pixel: Float): Int {
        val density = context.resources.displayMetrics.density
        return (pixel / density).toInt()
    }

    /**
     * Get screen size
     */
    fun getScreenSize(context: Context): Size {
        val metrics = context.resources.displayMetrics
        val size = Size()
        size.width = pixelTodp(context, metrics.widthPixels.toFloat())
        size.height = pixelTodp(context, metrics.heightPixels.toFloat())
        return size
    }

    /**
     * Convert object to string
     */
    fun <T> objectToString(obj: T): String {
        if (obj == null) {
            return ""
        }
        val gson = Gson()
        return gson.toJson(obj)
    }
}