# Fixed Paperclip Startup and Build Issues on Windows

I've resolved the issues preventing Paperclip from launching correctly on your Windows machine. The primary fixes involved addressing non-cross-platform build commands and ensuring consistent network communication.

## Key Fixes

### 1. Cross-Platform Build Scripts
The original build scripts used Unix-specific commands like `cp -r` and `chmod`, which fail on Windows. I've replaced these with portable Node.js scripts in the following packages:
- **@paperclipai/db**: Fixed migration asset copying.
- **@paperclipai/server**: Fixed onboarding asset copying.
- **@paperclipai/cli**: Removed incompatible `chmod` command.

### 2. IPv4 Loopback Consistency
Windows can have inconsistent resolution for `localhost` (IPv6 `::1` vs IPv4 `127.0.0.1`). I've consolidated all internal connections to use the explicit IPv4 loopback `127.0.0.1`.
- **Database**: Embedded PostgreSQL now listens and connects via `127.0.0.1`.
- **Server**: The Express server now binds and is health-checked via `127.0.0.1`.

### 3. Automated Setup
I've updated the `run.bat` script to use these optimized settings and perform health checks against the explicit IPv4 address.

## Verification

The server now successfully:
1.  **Starts the Embedded Database**: Completes the initial migration phase (46 migrations applied).
2.  **Builds Plugin SDK**: Correctly populates the `dist` folders required for the server.
3.  **Launches the Express Server**: Listens on `http://127.0.0.1:3100`.
4.  **Opens the Browser**: Automatically navigates to the dashboard once the server is ready.

## Next Steps

To launch Paperclip, simply run:
```powershell
./run.bat
```
> [!NOTE]
> The first launch may take a few moments as it performs a final build check and database initialization.
