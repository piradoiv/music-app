# Music App - Xojo-based Cross-Platform Music Player

Music App is a cross-platform desktop application built with Xojo. It consists of a desktop music player and, in the future, a web-based music library management system.

**Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the information here.**

## Working Effectively

### Critical Prerequisites
- **MANDATORY**: Xojo IDE 2025r1.1 or later must be installed to build this application
- This repository CANNOT be built without the Xojo IDE - there are no alternative build tools

### Repository Structure
The repository contains two main Xojo projects:
- **Desktop Application**: `/src/Music.xojo_project` - Cross-platform GUI music player
- **Web Application**: `/server/MusicLibrary.xojo_project` - Web-based music library management, not used at the moment

### Installation and Setup
1. **Install Xojo IDE** (REQUIRED - cannot be automated):
   - Download Xojo 2025r1.1+ from https://www.xojo.com/download/
   - **NEVER CANCEL**: Download takes 15-30 minutes depending on connection
   - **NEVER CANCEL**: Installation takes 10-15 minutes
   - Requires license for building for macOS and Windows

2. **Repository Setup**:
   ```bash
   git clone https://github.com/piradoiv/music-app.git
   cd music-app
   ```

### Testing and Validation

#### Manual Validation Requirements
After building, ALWAYS test these core scenarios:

**Desktop Application:**
1. Launch application and verify UI loads correctly
2. Test music file import functionality (supports common formats via ID3 tag reading)
3. Verify playback controls (play, pause, skip forward/backward)
4. Test volume controls (up, down, mute)
5. Verify library browsing and organization by artist/album/genre
6. Test album artwork display (from ID3 tags or folder images)
7. Verify playlist management and file path handling

### Development Guidelines

#### File Organization
- **GUI Components**: `/src/GUI/` - Desktop interface elements
- **Model Classes**: `/src/Model/` - Data structures and business logic  

#### Key Files to Monitor
- `Music.xojo_project` - Main desktop project file
- `Build Automation.xojo_code` - Build configuration for each project
- `/src/Model/MusicApp.xojo_code` - Core desktop application logic and ID3 tag processing
- `/src/Model/MusicLibrary.xojo_code` - Shared music library functionality
- Always check these files after making changes to model classes

#### Code Structure
- **MusicLibrary Module**: Shared between desktop and web applications
- **GUI Classes**: Desktop-specific interface elements (at `/src/GUI/`)
- **MusicApp Class**: Core desktop application logic including ID3 tag reading and file management
- **Database**: Uses SQLiteDatabase for web application data persistence

### Limitations and Constraints

#### Build Environment Limitations
- **CANNOT build in CI/CD environments** - Xojo IDE required
- **CANNOT install Xojo via package managers** (apt, brew, etc.)

#### Development Constraints
- Debugging requires Xojo IDE
- No unit testing frameworks are used, XojoUnit will be used in the future
- Limited to Xojo's built-in development tools
- Version control best practices: commit `.xojo_project` files, ignore `.xojo_uistate`

#### When Xojo is Not Available
If working in an environment without Xojo:
- Focus on documentation and planning
- Review project structure and file organization
- Analyze code through text editors (`.xojo_code` files are readable)
- Plan features and architectural changes
- **Document clearly**: "Cannot build or test - requires Xojo IDE"

### Common Tasks

#### Troubleshooting Common Issues

**Build Failures:**
- Ensure Xojo IDE version is 2025r1.1 or later
- Check that all .xojo_code files are properly formatted
- Verify build automation settings in Build Automation.xojo_code

**Desktop App Issues:**
- Music file import problems: Check ID3 tag reading in MusicApp.xojo_code
- UI rendering issues: Verify color groups and asset paths in /src/GUI/
- Playback problems: Check audio codec support on target platform
- Missing album art: Verify image extraction from ID3 tags or folder scanning

**Cross-Platform Issues:**
- File path handling: Use FolderItem.NativePath vs ShellPath appropriately
- UI differences: Test on each target platform extensively
- Performance variations: Profile on actual target hardware

## Project Metadata

- **Language**: Xojo (BASIC-like syntax)
- **UI Framework**: Xojo's native controls
- **Database**: Built-in Xojo database classes
- **Platforms**: macOS, Windows, Linux
- **Architecture**: Desktop native application
- **Build Tool**: Xojo IDE (commercial, required)
- **Primary Development Platform**: macOS

## CRITICAL REMINDERS

- **NEVER attempt to build without Xojo IDE** - it will fail
- **NEVER CANCEL long-running Xojo operations** - downloads, installs, and builds take significant time
- **ALWAYS set appropriate timeouts** (30+ minutes for builds, 60+ minutes for installation)
- **ALWAYS manually test** after making changes - automated testing is extremely limited
- **ALWAYS validate on target platforms** if building cross-platform releases
- **Document limitations clearly** when working in environments without Xojo

## Common Repository Information

The following are outputs from frequently accessed commands and files. Reference them instead of running bash commands to save time.

### Repository Root Structure
```
.
├── .git/
├── .gitignore
├── LICENSE
├── README.md
├── assets/          # UI icons (play, pause, volume controls)
├── icon/            # Application icons
│   └── macos/
│       └── AppIcon.icns
├── server/          # Web application project, not used at the moment
│   ├── App.xojo_code
│   ├── MusicLibrary/
│   │   ├── Entities/     # Song, Album, Artist, Genre classes
│   │   └── Repositories/ # Data access layer
│   └── MusicLibrary.xojo_project
└── src/             # Desktop application project
    ├── Assets/          # Embedded UI resources
    ├── GUI/             # Windows, controls, menus
    ├── Model/           # Business logic and data handling
    └── Music.xojo_project
```

### Key Project Files
- **Total Code Files**: 25 .xojo_code files
- **Main Projects**: 2 .xojo_project files (desktop + web)
- **Platforms Supported**: macOS (primary), Windows, Linux
- **License**: MIT license (see LICENSE file)

### .gitignore Contents
```
*.xojo_uistate
**/Builds - Music
**/.DS_Store
```

### From README.md
- App is under active development
- Inspired by iTunes, BeatBox, and elementaryOS Music app
- Personal music library focus (vs streaming services)
- Built with Xojo 2025r1.1
- No public releases yet - must build from source
- Screenshots available for macOS, Ubuntu Linux, and Windows

### Xojo coding guidelines

This documentation came from [https://documentation.xojo.com/topics/code_management/coding_guidelines.html](https://documentation.xojo.com/topics/code_management/coding_guidelines.html#topics-code-management-coding-guidelines-coding)

Every developer and team should have coding guidelines to help ensure that code is readable by everyone on the team (or even yourself several months from now). There is no such thing as coding guidelines that everyone will agree with, but the guidelines described here are meant to be a starting point and match the coding guidelines generally used for the Xojo example projects and sample code that you see here in the documentation.

The most important thing is consistency, regardless of what guidelines you choose to use. Inconsistent code is more difficult to understand.

#### Definitions

| Term | Definition |
camel case | The first word in the name is lower cased. Subsequent words are started with an upper case letter: customerName |
title case | All words in the name are started with an upper case letter: CustomerName |

#### Naming

Having a consistent way to name the things in your project is an important first step in coding standards. Ideally coding standards will help others write correct code more easily and grasp existing code more readily.

#### Constants

- Start with lower case "k", followed by title case: `kMaxUsers`.

#### Local variables

- Use camel case: `Var customerName As String`
- Minimize use of abbreviations; spell things out. Use `customerName`, not `custNm`.
- Use of single-letter variables names are acceptable for looping variables, such as used by For loops.

#### Arrays

- Should be plural: `Customers() As String`

#### Properties

- Use title case: `CustomerName`
- A Private property that is the companion for a Computed Property should start with "m" and then be title case: `mCustomerName`.

#### Methods

- Use title case: `SaveCustomer`
- Method parameters should be camel case: `SaveCustomer(customerName As String)`

#### Controls

- Use title case, with a suffix indicating the type of control: `OKButton`.

Below are some common suffixes:

| Control | Suffix | Example |
| AndroidMobileTable, iOSMobileTable | Table | CustomerTable |
| DesktopButton, WebButton, MobileButton, DesktopBevelButton | Button | SaveButton |
| DesktopListBox, WebListBox | List | CustomerList |
| DesktopSegmentedButton, WebSegmentedButton, MobileSegmentedButton | Selector | TaskSelector |
| DesktopCheckBox, WebCheckBox | Check | TaxableCheck |
| DesktopPopupMenu, WebPopupMenu, MobilePopupMenu | Popup | StatePopup |
| DesktopRadioGroup, WebRadioGroup | Radio | SourceRadio |
| DesktopTextField, WebTextField, MobileTextField | Field | NameField |
| DesktopTextArea, WebTextArea, MobileTextArea | Area | DescriptionArea |
| DesktopCanvas, WebCanvas, MobileCanvas | Canvas | GraphCanvas |
| DesktopLabel, WebLabel, MobileLabel | Label | NameLabel |
| DesktopPagePanel, WebPagePanel | Panel | MainPanel |
| DesktopTabPanel, WebTabPanel | Tab | MainTab |
| DesktopProgressWheel, DesktopProgressBar, WebProgressWheel, WebProgressBar, MobileProgressBar, MobileProgressWheel | Progress | DownloadProgress |
| DesktopHTMLViewer, WebHTMLViewer, MobileHTMLViewer | Viewer | DocViewer |
| DesktopImageViewer, WebImageViewer, MobileImageViewer | Image | ProfileImage |
| DesktopGroupBox | Group | BusinessGroup |

#### Classes (Types)

- Use title case.
- Subclasses of built-in classes should use original class name as suffix: `CustomerListBox`.

#### Windows

- Use title case with "Window" as the suffix: `CustomerWindow`.

#### Interfaces

- Use title case with "Interface" suffix.

#### Formatting

- Keywords should be in title case:
```
For Each c As Customer In Customers
```

- Data types should be in title case:
```
Var count As Integer
```

- Put spaces between all lists of arguments or parameters:
```
SaveCustomer(name, location, value)
```

- Do not put spaces before or after parenthesis.
- Methods called without parameters should not include empty parenthesis. Use:
```
MyMethod
```

instead of:

```
MyMethod()
```

- Methods with parameters should always include parenthesis. Use:
```
MyMethod(42)
```

instead of:
```
MyMethod 42
```

- Leave blank lines between code lines as appropriate to maintain readability.

#### SQL

- SQL commands are written in uppercase:
```
SELECT * FROM Team WHERE City = "Boston"
```

#### Coding

- Var local variables near where they will be used with one declaration per line.
- Methods not used outside the class/module should be Private.
- Prefer dot notation over equivalent global methods when possible: `Var length As Integer = customerName.Length`
- Never use `Me` when you mean `Self`.
- Limit globals.
- Prefer shared methods/properties on classes over global methods/properties on modules.
- Classes, methods, properties, etc., within a Module or Class should be Private or Protected where possible.

