#!/bin/bash
projectname="android_app_kotlin"

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
