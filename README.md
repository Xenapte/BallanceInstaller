# BallanceInstaller

Installer for the (modern repacked, with [BMLPlus](https://github.com/doyaGu/BallanceModLoaderPlus)) *Ballance* game. Successor of the [BallanceSetupTools](https://github.com/Xenapte/BallanceSetupTools) project.

## Usage

**Just run the installer and follow it like you normally would.**

Due to related copyright issues we can't provide actual game files in this repository directly; you need to find our releases on your own.

## Building

This installer uses the [NSIS (Nullsoft Scriptable Install System)](https://nsis.sourceforge.io/) as the packager. To build the package you must first have NSIS installed.

### Preparing your game files

#### Directory structure

- Place your Ballance files in a way that if you ignore their parent directories and just merge them together, you would get a full installation.
  * Ballance and [BMLPlus](https://github.com/doyaGu/BallanceModLoaderPlus) files as the `Ballance` and `BMLPlus` directories respectively.
  * Extra BMLPlus maps and mods should be placed in `BMLPlus_Extra`.
- Place and extract the installer icon (same as the game icon) from `Ballance/Bin/Player.exe` to `Resources/Ballance.ico`.
- Place the [32-bit (x86) version](https://aka.ms/vs/17/release/vc_redist.x86.exe) of [Microsoft Visual C++ Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist) in `Redist`, and name it `vc_redist.x86.exe`.

#### Things to note

- As of BMLPlus 0.3 it only supports the custom Ballance Player build, [*Ballanced*](https://github.com/doyaGu/Ballanced). You need to replace your `Ballance/Bin/Player.exe` with that.
- Latest 32-bit MSVC Redist is required as many people don't have it installed, and the game just fails to start without it. The installer checks for that and installs it silently if required.
  * <small>Again, **WTF Microsoft?** Everything compiled with MSVC from circa May 2024 onwards requires this upgrade or they just **fail silently without any extra info**, and it doesn't seem to come with Windows Update? Previously you could even run your compiled apps on a freshly out-of-the-box Windows 7 installation without any issues...</small>

#### Example

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
├─ Redist
│  └─ vc_redist.x86.exe
└─ Resources
   └─ Ballance.ico
```

### Compiling

After you have prepared all required files in the above structure, compile the script `Ballance.nsi` with `makensis.exe` and you are good to go.
