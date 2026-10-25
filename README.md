# Little Fingers (Apple silicon)

Little Fingers is a tiny macOS menu bar utility that locks your keyboard, trackpad, Touch Bar and mouse when you press **Shift+Control+Option+Command+L**, and unlocks them when you press the same keys again. It's handy when a small child wants to be near your Mac during a FaceTime call or while a video plays, so you don't end up with stray keystrokes, clicks or closed windows.

## About this fork

This is a rebuild of **[Shaun Inman](https://shauninman.com)'s** original [Little Fingers](https://github.com/shauninman/Little-Fingers) so it runs natively on Apple silicon. The original Intel-only build now shows macOS's "Support Ending for Intel-based Apps" warning, and it will stop opening in a future macOS release.

**All of the design and the original code are Shaun Inman's.** This fork only makes the changes needed to keep the app building and running on current Macs.

- Original repository: <https://github.com/shauninman/Little-Fingers>
- Shaun Inman: <https://shauninman.com>

## What changed

- Ported from Swift 3 to Swift 5 so current Xcode can build it
- Universal binary (arm64 + x86_64)
- Launch at login rewritten with `SMAppService` (the old `LSSharedFileList` API no longer works)
- The Accessibility permission request now uses the system prompt and opens Privacy & Security directly (the old AppleScript approach no longer works)
- The app waits for Accessibility permission instead of quitting at launch
- Minimum macOS raised to 13 Ventura
- Ad-hoc signed, with no developer team required

## Install (prebuilt download)

1. Download `Little-Fingers-1.1-universal.zip` from [Releases](../../releases), unzip it, and move **Little Fingers.app** to `/Applications`.
2. The app is ad-hoc signed and not notarized, so macOS will block the first launch. To allow it, do one of the following:
   - Try to open the app, then go to **System Settings → Privacy & Security** and click **Open Anyway**, or
   - Run:
     ```sh
     xattr -dr com.apple.quarantine "/Applications/Little Fingers.app"
     ```
3. Grant **Accessibility** permission when prompted. If an old Little Fingers entry is already in that list, select it and remove it with **–** first, then add or enable the new one.

## Build from source

You need the full **Xcode** app (the Command Line Tools alone aren't enough).

```sh
./build.sh
```

This builds a universal `Little Fingers.app` next to the script and prints its architectures (`x86_64 arm64`).

Every rebuild changes the app's local ad-hoc signature, so macOS treats it as a new app. **Re-grant Accessibility permission after each rebuild.** Remove the old entry with **–** and add the new one.

## License

The original repository doesn't include a license, so copyright remains with Shaun Inman. This fork is shared only so the app keeps working on current Macs. If the original author wants anything changed or removed, please open an issue and it will be done.
