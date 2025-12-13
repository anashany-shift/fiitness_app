
plugins {
    // 1. تحديث AGP إلى أحدث إصدار متوافق (8.13.1 هو الأحدث والأكثر استقراراً)
    id("com.android.application") version "8.13.1" apply false

    // 2. إضافة وتحديد إصدار Kotlin Gradle Plugin (ضروري للتوافق مع AGP الجديد)
    id("org.jetbrains.kotlin.android") version "1.9.24" apply false

    // 3. إزالة تحديد الإصدار لـ Flutter Plugin لتجنب تعارض classpath
    id("dev.flutter.flutter-gradle-plugin") apply false
}
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
