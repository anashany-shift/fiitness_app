// File: android/app/build.gradle.kts

plugins {
 id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
 // يجب أن يكون هكذا (بدون version) لكي يستخدم الإصدار المحدد في الملف الأب (1.9.24)
 id("org.jetbrains.kotlin.android")
 id("dev.flutter.flutter-gradle-plugin")
}
android {
    namespace = "com.example.fitness_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.fitness_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
         getByName("release") {
        // نفس اللي أنت كاتبه لكن بصيغة Kotlin DSL
        signingConfig = signingConfigs.getByName("debug")

        isMinifyEnabled = false
        isShrinkResources = false

        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
    }
    }
}

flutter {
    source = "../.."
}
