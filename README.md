# BallanceInstaller

Installer for the (modern repacked) Ballance game. Successor of the [BallanceSetupTools](https://github.com/Xenapte/BallanceSetupTools) project.

## Usage

**Just run the installer and follow it like you normally would.**

Due to related copyright issues we can't provide actual game files in this repository directly; you need to find our releases on your own.

## Building

This installer uses the [NSIS (Nullsoft Scriptable Install System)](https://nsis.sourceforge.io/) as the packager. To build the package you must first have NSIS installed.

### Preparing your game files

- Place your Ballance files in a way that if you ignore their parent directories and just merge them together, you would get a full installation.
  * Ballance and [BMLPlus](https://github.com/doyaGu/BallanceModLoaderPlus) files as the `Ballance` and `BMLPlus` directories respectively.
  * Extra BMLPlus maps and mods should be placed in `BMLPlus_Extra`.
- Place and extract the installer icon (same as the game icon) from `Ballance/Bin/Player.exe` to `Resources/Ballance.ico`.

This is what your repository would look like if you did the above correctly:

```text
BallanceInstaller
├─ Ballance.nsi
├─ Ballance
│  ├─ 3D Entities
│  ├─ Bin
│  ├─ BuildingBlocks
│  └─ ...
├─ BMLPlus
│  ├─ BuildingBlocks
│  └─ ModLoader
│     ├─ Config
│     ├─ Maps
│     └─ ...
├─ BMLPlus_Extra
│  └─ ModLoader
│     ├─ Maps
│     └─ Mods
└─ Resources
   └─ Ballance.ico
```

### Compiling

After you have prepared all required files in the above structure, compile the script `Ballance.nsi` with `makensis.exe` and you are good to go.
