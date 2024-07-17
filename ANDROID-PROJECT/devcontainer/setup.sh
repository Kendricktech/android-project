#!/bin/bash

# Install OpenJDK 11
sudo apt-get update && sudo apt-get install -y openjdk-11-jdk

# Set up Android SDK
mkdir -p $HOME/android-sdk
cd $HOME/android-sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -O cmdline-tools.zip
unzip cmdline-tools.zip -d cmdline-tools
rm cmdline-tools.zip

# Install Android SDK components
yes | ./cmdline-tools/bin/sdkmanager --licenses
./cmdline-tools/bin/sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3"

# Export environment variables
echo 'export ANDROID_HOME=$HOME/android-sdk' >> $HOME/.bashrc
echo 'export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH' >> $HOME/.bashrc
echo 'export PATH=$ANDROID_HOME/platform-tools:$PATH' >> $HOME/.bashrc
