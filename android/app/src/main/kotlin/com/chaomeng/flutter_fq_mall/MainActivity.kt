package com.chaomeng.flutter_fq_mall

import android.os.Bundle
import com.gyf.immersionbar.ImmersionBar
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onResume() {
        super.onResume()
        window.decorView.postDelayed(Runnable {
            ImmersionBar.with(this)
                    .statusBarDarkFont(true)
                    .navigationBarColor("#ffffff").init();
        },200)
    }
}
