# BallanceInstaller

Installer for the (modern repacked) Ballance game. Successor of the [BallanceSetupTools](https://github.com/Xenapte/BallanceSetupTools) project.

## Usage

Just run the installer and follow it normally.

Due to related copyright issues we can't provide the actual game files in this repository directly.

## Building

This installer uses the [NSIS (Nullsoft Scriptable Install System)](https://nsis.sourceforge.io/) as the packager. To build the package you must first have NSIS installed.

Then, place your Ballance and [BMLPlus](https://github.com/doyaGu/BallanceModLoaderPlus) files as the `Ballance` and `BMLPlus` directories respectively, and extract the icon from `Ballance/Bin/Player.exe` to `Resources/Ballance.ico`.

After all these are done, compile the script `Ballance.nsi` with `makensis.exe` and you are good to go.
