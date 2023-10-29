#!/bin/bash
projectname="android_app_kotlin"

# Gradle initalization (using .kts configs)
gradle init --type basic --dsl kotlin --project-name $projectname --no-incubating

# Copy template configs from templates and change variables
cp gradle_templates/build.gradle.kts ./build.gradle.kts

cp gradle_templates/settings.gradle.kts ./settings.gradle.kts
# Change rootProject.name to projectname 
sed -i 's/rootProject.name \=.*/rootProject.name \= "$projectname"/' ./settings.gradle.kts
