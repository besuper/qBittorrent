# qBittorrent Patches

Custom version based on the `v5_1_x` branch of qBittorrent.

## Apply patches
Before applying patches, make sure the `qbittorrent` submodule is initialized.
You can then run the appropriate script depending on your operating system:

### Windows
```bash
patch.bat
```

### Linux
```bash
patch.sh
```

## Build on Windows

### Prerequisites

- [vcpkg](https://github.com/microsoft/vcpkg)  
- [CMake](https://cmake.org/download/)  
- qBittorrent dependencies via vcpkg (see [official instructions](https://github.com/qbittorrent/qBittorrent/blob/v5_1_x/INSTALL))

### Steps

```bash
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat

vcpkg install boost libtorrent qt6
# Note: Qt installation might take several hours

cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=vcpkg\installed\x64-windows
cmake --build build --config Release
```

If everything completes successfully, the final executable will be located under `/build/Release`.

### Deploying with Qt

To make the application portable across different Windows systems, you need to bundle the required Qt platform files.

### Steps

1. Locate `windeployqt.exe`  
   It’s usually under:

   ```
   vcpkg\installed\x64-windows\tools\Qt6\bin
   ```

2. Run the deployment tool with your executable as a parameter:

   ```bash
   "vcpkg\installed\x64-windows\tools\Qt6\bin\windeployqt.exe" qbittorrent.exe
   ```

This will generate the necessary folders and `.dll` files required for the application to run on any Windows machine.
#### The final executable may also require the [Microsoft Visual C++ Redistributable 2015–2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist) to be installed in order to run.