# Copper

<p align="center">
  <img src="download__4_-removebg-preview (1).png" alt="Copper Logo" width="180">
</p>

<h1 align="center">Copper</h1>

<p align="center">
  <strong>A Minecraft mod loader built from scratch.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Minecraft-26.2-orange" alt="Minecraft 26.2">
  <img src="https://img.shields.io/badge/Java-25-blue" alt="Java 25">
  <img src="https://img.shields.io/badge/Status-Early%20Development-yellow" alt="Early Development">
</p>

---

## 🟠 What is Copper?

**Copper** is an independent Minecraft mod loader being developed from the ground up.

Copper is designed to have its **own mod-loading system, API, and tooling** instead of being built on top of Fabric or Forge.

The goal is to create a simple, powerful, and extensible platform for Minecraft mods.

## ✨ Features

* 🟠 Standalone mod-loader architecture
* 🧩 Copper-native mods
* 📦 Dedicated Copper API
* 💻 Client and server support
* 🔌 Mod discovery and loading
* ⚙️ Developer-focused tooling
* 🚀 Designed with future Minecraft versions in mind

## 📚 Copper API

Copper provides its own initialization interfaces.

### Common initialization

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

### Client initialization

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

## 🏗️ Architecture

Copper is intended to be independent from existing Minecraft mod loaders.

```text
                    Minecraft
                       │
                       ▼
                  ┌─────────┐
                  │ Copper  │
                  │ Loader  │
                  └────┬────┘
                       │
             ┌─────────┼─────────┐
             ▼         ▼         ▼
          Copper    Copper     Copper
           Mods      API       Tools
```

## 🛠️ Development

Copper is currently under active development.

The project is being built incrementally, starting with the core loader and API before expanding into additional loader features.

### Building

Clone the repository:

```bash
git clone https://github.com/zizogamer0139/Copper.git
cd Copper
```

Build Copper:

```bash
gradlew build
```

On Linux or macOS:

```bash
./gradlew build
```

Build artifacts will be generated in:

```text
build/libs/
```

## 📁 Project Structure

```text
Copper/
├── gradle/
├── src/
│   └── main/
│       ├── java/
│       │   └── net/
│       │       └── copper/
│       └── resources/
├── build.gradle
├── gradlew
├── gradlew.bat
├── settings.gradle
├── LICENSE
└── README.md
```

## 🎯 Roadmap

* [x] Create Copper project
* [x] Establish `net.copper` package
* [x] Create Copper API
* [x] Create client/server initializer APIs
* [ ] Copper mod discovery
* [ ] Copper mod metadata
* [ ] Copper mod loading
* [ ] Client mod support
* [ ] Server mod support
* [ ] Copper Mods menu
* [ ] Copper configuration system
* [ ] Copper installer
* [ ] Multi-version support

## 🧪 Current Status

> **Copper is experimental software and is currently in early development.**

The API, loader architecture, and project structure may change as development continues.

## 📜 License

See the [`LICENSE`](LICENSE) file for the terms governing use and distribution of Copper.

## 🟠 Copper

**Built from scratch. Built for Minecraft. Built with Copper.**
