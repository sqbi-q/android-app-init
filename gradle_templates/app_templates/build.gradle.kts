apply(from="./app-properties.kts")

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

dependencies {
    implementation("androidx.compose.material3:material3:1.1.2")
    implementation("androidx.compose.compiler:compiler:1.5.3")
    implementation("androidx.compose.ui:ui:1.5.4")
    implementation("androidx.activity:activity-compose:1.8.0")
    implementation("androidx.compose.runtime:runtime:1.5.4")

    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation(fileTree(mapOf("dir" to "libs", "include" to listOf("*.jar"))))
}

android {
    /**
     * The buildTypes block is where you can configure multiple build types.
     * By default, the build system defines two build types: debug and release. The
     * debug build type is not explicitly shown in the default build configuration,
     * but it includes debugging tools and is signed with the debug key. The release
     * build type applies ProGuard settings and is not signed by default.
     */

     buildTypes {

        /**
         * By default, Android Studio configures the release build type to enable code
         * shrinking, using minifyEnabled, and specifies the default ProGuard rules file.
         */

        getByName("release") {
            isMinifyEnabled = true // Enables code shrinking for the release build type.
            proguardFiles(
                getDefaultProguardFile("proguard-android.txt"),
                "proguard-rules.pro"
            )
        }
    }
    
    buildFeatures {
        compose = true
    }
}
