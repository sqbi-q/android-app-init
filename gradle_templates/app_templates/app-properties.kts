android {
    // The app's namespace. Used primarily to access app resources.
    namespace = "com.example.android_app_kotlin"

    /**
     * compileSdk specifies the Android API level Gradle should use to
     * compile your app. This means your app can use the API features included in
     * this API level and lower.
     */
    compileSdk = 34

    defaultConfig {

        // Uniquely identifies the package for publishing.
        applicationId = "com.example.android_app_kotlin"

        // Specifies the API level used to test the app.
        targetSdk = 34

        // Defines the minimum API level required to run the app.
        // Should be >= 21 due to androidx libraries
        minSdk = 21


        // Defines the version number of your app.
        versionCode = 1

        // Defines a user-friendly version name for your app.
        versionName = "1.0"
    }

    // See for version: https://developer.android.com/jetpack/androidx/releases/compose-kotlin
    composeOptions {
        kotlinCompilerExtensionVersion = "1.5.3"
    }
}

/**
 * Locate (and possibly download) a JDK used to build your kotlin
 * source code. This also acts as a default for sourceCompatibility,
 * targetCompatibility and jvmTarget. Note that this does not affect which JDK
 * is used to run the Gradle build itself, and does not need to take into
 * account the JDK version required by Gradle plugins (such as the
 * Android Gradle Plugin)
 */
kotlin {
    jvmToolchain(17)
}