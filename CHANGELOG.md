# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

<details>
<summary>Formatting Rules for Entries</summary>
Each entry should use the following format:

```markdown
- Summarize what was changed in a single line.  
  Issue: [#0](https://github.com/Flinesoft/Prayer/issues/0) | PR: [#0](https://github.com/Flinesoft/Prayer/pull/0) | Author: [Cihat Gündüz](https://github.com/Jeehut)
```

Note that at the end of the summary line, you need to add two whitespaces (`  `) for correct rendering on GitHub.

If needed, pluralize to `Issues`, `PRs` or `Authors` and list multiple separated by `, `.
</details>

## [Unreleased]
### Added
- None.
### Changed
- None.
### Deprecated
- None.
### Removed
- None.
### Fixed
- None.
### Security
- None.

## [1.4.0] - 2021-12-08
### Added
- Added 35 more Quran recitations (from Surah 55 to 89) in all three supported languages.
### Changed
- Changed the default settings to allow splitting recitations to make use of more chapters for new users.
### Fixed
- Fixed an issue where locking the phone during the countdown stopped the prayer audio playback.

## [1.3.1] - 2021-11-08
### Changed
- Improved wording in Turkish translations.
### Fixed
- Fixed an issue with the movement sound played twice while standing.

## [1.3.0] - 2021-10-31
### Added
- Adds a new audio mode where a computer voice reads out loud the full text of the prayer.
- Ensures the new spoken text audio mode continues to play when device is locked or app is in background.
- Shows the currently connected audio device and adds a button to switch the device right within the app.
- Adds detailed descriptions below each settings section to give some additional context.
### Changed
- Position change sound now ignores the systems Mute switch setting. Set audio mode to `muted` instead to pray without any sounds.
- All settings entries now have an icon for faster recognition and to make the settings screen look nicer.
### Fixed
- Adjusted green accent color in dark mode to be brighter for more legible text on buttons.

## [1.2.1] - 2021-10-17
### Fixed
- Fixed an issue where the navigation bar of the prayer view had a black background in light mode. Also fixes the animation when opening it up.

## [1.2.0] - 2021-10-16
### Added
- Added 12 more Quran recitations (from Surah 90 to 102) in all three supported languages.
- Added an option to allow longer (but not too long) Quran recitations while standing.
- Added an option to allow splitting too long Quran recitations into multiple parts.
### Changed
- Improved title for Quran recitation settings to make them easier to understand.
- Prevented the random standing Quran recitation selection to repeat recent recitations.
### Removed
- Removed unnecessary branding & testing specific code.
### Fixed
- Replaced static support forum URL with a dynamically adjustable URL for faster updates.

## [1.1.0] - 2021-05-10
### Added
- Adds full support for newer screen sizes & OS versions.
- Adds full support for newer dark mode interface.
- Adds Arabic transciption to recitation names (e.g. 'The Opening' is now 'Al-Fatiha (The Opening)').
### Changed
- Lengthens time for falling down to Sajdah and standing up from it again.
- Points to new iOS feature for changing app language rather than hacky solution.
### Removed
- Increased minimum required version to iOS/iPadOS 14.
### Fixed
- Fixes a typo in German recitation text.

## [1.0.0] - 2017-03-20
Initial release.
