# HackerFab Stepper

Desktop control software for the HackerFab photolithography stepper: pattern selection, stage alignment, timed UV exposure, and optional live camera preview.

The application and its launchers live in [`stepper/`](stepper/). See the [full application guide](stepper/README.md) for GRBL setup, camera support, and configuration details.

## Quick Start

Clone the repository, then enter the application directory:

```bash
git clone https://github.com/audicakes/Hackerfab-Stepper.git
cd Hackerfab-Stepper/stepper
```

No separate Python installation is required. The launchers install `uv`, a compatible Python version, and the locked project dependencies on first run.

### Windows

Double-click `run.bat`.

To validate the Windows dependency setup without opening the GUI, run this in PowerShell from the `stepper` directory:

```powershell
.\run.ps1 -SetupOnly
```

### Linux and macOS

```bash
./run.sh
```

If necessary, make it executable first:

```bash
chmod +x run.sh
./run.sh
```

## Before First Use

- Connect the USB camera and GRBL stage controller.
- Review [`stepper/default.toml`](stepper/default.toml), especially the camera index and stage settings.
- The default stage port is `"auto"`, which scans for a compatible connected controller. Set an explicit path such as `/dev/ttyACM0` or `COM3` only when needed.

The setup dialog opens with `default.toml` already selected. Leave it selected and click **Launch** for the normal first run; use **Browse** only for a custom TOML configuration. It also lets you select a detected stage port or run without hardware. An SKR Pico is detected as an RP2040 controller; if another serial device is shown instead, select it explicitly rather than choosing **No stage**.

If the application UI is still too small on a high-resolution display, launch it with `HACKERFAB_UI_SCALE=1.6 ./run.sh` on Linux/macOS, or set the `HACKERFAB_UI_SCALE` environment variable before running `run.bat` on Windows.
