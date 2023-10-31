#!/bin/bash
projectname="android_app_kotlin"
label="Android App in Kotlin"

# See gradle_templates/app_templates/app-properties.kts for meaning of properties
applicationId="com.example.android_app_kotlin"
jdkVersion=17
compileSdkVersion=34
targetSdk=34
minSdk=21
version=1
versionName="1.0"
kotlinComposeVersion="1.5.3"

## Result project structure ##
# root/                      # Project
#   |---gradle.properties
#   |---build.gradle.kts
#   |---settings.gradle.kts
#   \---app/                 # Module
#        |---build.gradle.kts
#        |---build/
#        |---libs/
#        \---src/
#              \---main/     # Source set
#                   |---AndroidManifest.xml
#                   |---kotlin/
#                   |       |---com/example/myapp
#                   |
#                   |---res/
#                        |---drawable/
#                        |---values/
#                        \---...
#     
# Mainly inspired by: 
# https://developer.okta.com/blog/2018/08/10/basic-android-without-an-ide
# and https://developer.android.com/build
##

## Script splits app module configuration file into two seperate files:
## app-properties.kts for fast access to important properties and
## build.gradle.kts for dependency implementation and more static properties
##
## Script uses sed to change values of properties in ./settings.gradle.kts and app/app-properties.kts.
## Sed commands need to be updated after changes upon app-properties.kts

# Gradle initalization (using .kts configs)
gradle init --type basic --dsl kotlin --project-name $projectname --no-incubating

# Copy template configs from templates and change variables
cp gradle_templates/build.gradle.kts ./build.gradle.kts

cp gradle_templates/settings.gradle.kts ./settings.gradle.kts
# Change rootProject.name to projectname 
sed -i "s/rootProject.name \=.*/rootProject.name \= \"$projectname\"/" ./settings.gradle.kts

# Copy gradle.properties (to declare usage of AndroidX)
cp gradle_templates/gradle.properties ./gradle.properties


# App (module) directory initalization
mkdir -p app/build/ app/libs/
mkdir -p app/src/main/kotlin/
mkdir -p app/src/main/res/drawable app/src/main/res/values

# Copy app templates to app/ directory
cp gradle_templates/app_templates/build.gradle.kts app/
cp gradle_templates/app_templates/app-properties.kts app/
# Change properties of app-properties.kts
sed -i "s/namespace \= .*/namespace \= \"$applicationId\"/" ./app/app-properties.kts
sed -i "s/compileSdk \= .*/compileSdk \= $compileSdkVersion/" ./app/app-properties.kts
sed -i "s/applicationId \= .*/applicationId \= \"$applicationId\"/" ./app/app-properties.kts
sed -i "s/targetSdk \= .*/targetSdk \= $targetSdk/" ./app/app-properties.kts
sed -i "s/minSdk \= .*/minSdk \= $minSdk/" ./app/app-properties.kts
sed -i "s/versionCode \= .*/versionCode \= $version/" ./app/app-properties.kts
sed -i "s/versionName \= .*/versionName \= \"$versionName\"/" ./app/app-properties.kts
sed -i "s/kotlinCompilerExtensionVersion \= .*/kotlinCompilerExtensionVersion \= \"$kotlinComposeVersion\"/" ./app/app-properties.kts
sed -i "s/jvmToolchain(.*)/jvmToolchain($jdkVersion)/" ./app/app-properties.kts

# Copy Android manifest and set application label
cp gradle_templates/app_templates/AndroidManifest.xml ./app/src/main/
sed -i "s/android:label\=.*/android:label\=\"$label\"/" ./app/src/main/AndroidManifest.xml
