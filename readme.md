# Paper-Tool

**Paper-Tool** is a simple and efficient Bash script that helps you download, install, and update [PaperMC](https://papermc.io/) Minecraft server software. With just a few commands, you can manage different Minecraft and Paper builds effortlessly. Whether you're setting up a new server or keeping your existing server updated, **Paper-Tool** makes it easy to handle the installation and update process.

---

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Commands](#commands)
  - [Examples](#examples)

---

## Features

- **List Available Versions**: View all available Minecraft versions and Paper builds.
- **Install Minecraft and Paper**: Installs a specific Minecraft version and optionally a specific Paper build.
- **Update Server**: Update to the latest Paper build for the installed Minecraft version with single command.
- **Server Information**: Display the current installed Minecraft version and Paper build.
- **Server Start**: Start easily your server with one command.

---

## Installation
### From [HomeBrew](https://brew.sh/)
1. **Tap my formula**:
   ```bash
   $ brew tap satanicantichrist/satanicantichrist
   ```
2. **Install Paper-Tool**:
   ```bash
   $ brew install satanicantichrist/papertool
   ```


### From source
1. **Clone the repository**:

   ```bash
   $ git clone https://github.com/satanicantichrist/Paper-Tool.git
   ```

2. **Navigate to the script directory**:
   ```bash
   $ cd Paper-Tool
   ```

3. **Make the script executable**:
   ```bash
   $ chmod +x papertool
   ```

4. **Run the script**:
   ```bash
   $ ./papertool
   ```

## Usage

### Commands

- **`papertool ls mc`**
  Lists all available Minecraft versions. This command allows you to see all the versions of Minecraft that can be used for your PaperMC server.

- **`papertool ls paper <minecraft_version>`**
  Lists all available Paper builds for a specified Minecraft version. For example, `ls paper 1.16.5` will show all Paper builds for Minecraft 1.16.5.

- **`papertool update`**
  Automatically updates to the newest PaperMC build for the currently installed Minecraft version.

- **`papertool install <minecraft_version> <paper_build_id>`**
  Installs a specified Minecraft version and optionally a specific Paper build. If the Paper build ID is provided, it will install that build.

- **`papertool info`**
  Displays information about the currently installed Minecraft version and Paper build ID. This command is helpful to verify your setup.

- **`papertool run <"accept-eula">`**
  Starts server without gui, if you use argument `accept-eula`, it will automatically accept eula and start the server.

---

### Examples

All examples are written with brew installation in mind, to use script downloaded from source use `./papertool` while being in scripts directory
#### Example 1: List available Minecraft versions

```bash
$ papertool ls mc
```
output:
```
1.17.1
1.18.2
1.19.4
1.20.1
```
#### Example 2: List available Paper builds for Minecraft 1.18.2
```bash
$ papertool ls paper 1.18.2
```
output:
```
385
386
387
388
```
#### Example 3: Update to the latest Paper build
```bash
$ papertool update
```
This command will update your current PaperMC server to the latest stable build for the installed Minecraft version.
#### Example 4: Install Minecraft 1.19.4 and a specific Paper build
```bash
$ papertool install 1.19.4 540
```
This installs Minecraft 1.19.4 and Paper build 540.
#### Example 5: Check the current installed version and build
```bash
$ papertool info
```
output:
```
Installed Minecraft version: 1.21.3
Installed Paper build: 81
```
This starts your server.
#### Example 6: Start server
```bash
$ papertool run accept-eula
```
This starts your server, and automatically accepts eula, so you don´t have to edit the file after the first start.
