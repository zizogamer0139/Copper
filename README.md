# 🟠 Copper

**Copper** is a Minecraft mod loader built from the ground up.

Copper is designed to provide its own mod-loading system and API without requiring Fabric, Forge, or another existing mod loader.

## ✨ Features

* 🟠 **Standalone mod loader**
* 🧩 **Copper-native mods**
* ⚙️ Dedicated Copper API
* 🎮 Minecraft integration
* 📦 Mod discovery and loading
* 🛠️ Developer-friendly API
* 🚀 Designed to support future Minecraft versions

## 📚 Copper API

Copper mods use Copper's own APIs rather than Fabric APIs.

Example:

```java
package net.example.mymod;

import net.copper.api.ModInitializer;

public class MyMod implements ModInitializer {

    @Override
    public void onInitialize() {
        System.out.println("My Copper mod initialized!");
    }
}
```

For client-specific initialization:

```java
package net.example.mymod;

import net.copper.api.ClientModInitializer;

public class MyClientMod implements ClientModInitializer {

    @Override
    public void onInitializeClient() {
        System.out.println("My Copper client mod initialized!");
    }
}
```

## 🏗️ Project Structure

```text
Copper/
├── src/
│   └── main/
│       └── java/
│           └── net/
│               └── copper/
├── gradle/
├── build.gradle
├── gradlew
├── gradlew.bat
└── README.md
```

## 🎯 Project Goals

Copper aims to provide:

* A simple mod-loading system
* A dedicated Copper API
* Client and server mod support
* A reliable mod discovery system
* A clean developer experience
* A loader architecture independent of Fabric and Forge

## 🧪 Status

> **Copper is currently in early development.**

The loader and API are actively being developed, so APIs and internal systems may change.

## 🛠️ Building Copper

Clone the repository and enter the project directory:

```bash
git clone https://github.com/zizogamer0139/Copper.git
cd Copper
```

Build the project:

### Windows

```bash
gradlew build
```

### Linux / macOS

```bash
./gradlew build
```

The compiled artifacts will be located in:

```text
build/libs/
```

## 📜 License

Copper uses the license included in the [`LICENSE`](LICENSE) file.

## 🟠 Copper

**Built from scratch. Built for Minecraft. Built with Copper.**
