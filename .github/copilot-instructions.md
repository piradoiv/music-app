# Music App - Xojo-based Cross-Platform Music Player

Music App is a cross-platform desktop and web music application built with Xojo. It consists of a desktop music player and a web-based music library management system.

**Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the information here.**

## Working Effectively

### Critical Prerequisites
- **MANDATORY**: Xojo IDE 2025r1.1 or later must be installed to build this application
- Xojo is a commercial IDE - download from https://www.xojo.com/download/
- **NEVER CANCEL**: Xojo downloads and installation can take 30+ minutes. Set timeout to 60+ minutes
- This repository CANNOT be built without the Xojo IDE - there are no alternative build tools

### Repository Structure
The repository contains two main Xojo projects:
- **Desktop Application**: `/src/Music.xojo_project` - Cross-platform GUI music player
- **Web Application**: `/server/MusicLibrary.xojo_project` - Web-based music library management

### Installation and Setup
1. **Install Xojo IDE** (REQUIRED - cannot be automated):
   - Download Xojo 2025r1.1+ from https://www.xojo.com/download/
   - **NEVER CANCEL**: Download takes 15-30 minutes depending on connection
   - **NEVER CANCEL**: Installation takes 10-15 minutes
   - Requires license for building (free version has limitations)

2. **Repository Setup**:
   ```bash
   git clone https://github.com/piradoiv/music-app.git
   cd music-app
   ```

### Building the Applications

#### Desktop Application
1. Open Xojo IDE
2. Open `/src/Music.xojo_project`
3. **NEVER CANCEL**: Build process takes 5-15 minutes. Set timeout to 30+ minutes
4. Select "Project > Build" or use build automation
5. Cross-platform builds available for:
   - macOS (recommended - primary development platform)
   - Windows
   - Linux

#### Web Application  
1. Open Xojo IDE
2. Open `/server/MusicLibrary.xojo_project`
3. **NEVER CANCEL**: Build process takes 3-10 minutes. Set timeout to 20+ minutes
4. Select "Project > Build" or use build automation
5. Can also run in debug mode on port 8080

### Running the Applications

#### Desktop Application
- **Production**: Run the built executable from the Builds folder
- **Development**: Use "Project > Run" in Xojo IDE for debugging
- **NEVER CANCEL**: Initial startup can take 30-60 seconds

#### Web Application  
- **Development**: Use "Project > Run" in Xojo IDE
- **Default URL**: http://localhost:8080 (configurable in project settings)
- **Production**: Deploy built executable to web server
- **NEVER CANCEL**: Server startup takes 10-30 seconds

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

**Web Application:**
1. Access web interface at http://localhost:8080
2. Test music upload functionality through UploadMusicWebDialog
3. Verify library management features using repository pattern
4. Test artist/album/genre organization (stored in SQLite database)
5. Verify search and filtering capabilities
6. Test CRUD operations for all entity types (Song, Album, Artist, Genre)
7. Verify database connectivity and data persistence

**Integration Testing:**
1. Test data synchronization between desktop and web components
2. Verify shared music library functionality
3. Test cross-platform compatibility if building for multiple targets

### Development Guidelines

#### File Organization
- **GUI Components**: `/src/GUI/` - Desktop interface elements
- **Model Classes**: `/src/Model/` - Data structures and business logic  
- **Assets**: `/assets/` - UI icons and resources
- **Web Components**: `/server/` - Web application files
- **Icons**: `/icon/macos/` - Application icons

#### Key Files to Monitor
- `Music.xojo_project` - Main desktop project file
- `MusicLibrary.xojo_project` - Web application project file  
- `Build Automation.xojo_code` - Build configuration for each project
- `/src/Model/MusicApp.xojo_code` - Core desktop application logic and ID3 tag processing
- `/src/Model/MusicLibrary.xojo_code` - Shared music library functionality
- `/server/App.xojo_code` - Web application entry point and database configuration
- `/server/MusicLibrary/Repositories/*.xojo_code` - Database access layer
- Always check these files after making changes to model classes

#### Code Structure
- **MusicLibrary Module**: Shared between desktop and web applications
- **Entity Classes**: Album, Artist, Genre, Song (in web app at `/server/MusicLibrary/Entities/`)
- **Repository Classes**: Data access layer using SQLite (in web app at `/server/MusicLibrary/Repositories/`)
- **GUI Classes**: Desktop-specific interface elements (at `/src/GUI/`)
- **MusicApp Class**: Core desktop application logic including ID3 tag reading and file management
- **Database**: Uses SQLiteDatabase for web application data persistence

### Limitations and Constraints

#### Build Environment Limitations
- **CANNOT build in CI/CD environments** - Xojo IDE required
- **CANNOT use alternative build tools** - Xojo is the only option
- **CANNOT automate builds** without Xojo IDE license and installation
- **CANNOT install Xojo via package managers** (apt, brew, etc.)

#### Development Constraints
- Debugging requires Xojo IDE
- No traditional unit testing frameworks available
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

#### Adding New Features
1. Open appropriate project in Xojo IDE
2. Use Xojo's visual designers for GUI changes
3. Implement business logic in model classes
4. Test thoroughly in Xojo's debugger
5. **ALWAYS test manually** - automated testing is limited

#### Debugging Issues
1. Use Xojo IDE's integrated debugger
2. Add breakpoints in `.xojo_code` files
3. Use Xojo's console for runtime debugging
4. Check Xojo documentation for platform-specific issues

#### Performance Optimization
1. Profile using Xojo's built-in tools
2. Focus on algorithm optimization in model classes
3. Optimize database queries in repository classes
4. Test on target platforms - performance varies by OS

#### Troubleshooting Common Issues

**Build Failures:**
- Ensure Xojo IDE version is 2025r1.1 or later
- Check that all .xojo_code files are properly formatted
- Verify build automation settings in Build Automation.xojo_code
- Clear Xojo's build cache if encountering strange errors

**Desktop App Issues:**
- Music file import problems: Check ID3 tag reading in MusicApp.xojo_code
- UI rendering issues: Verify color groups and asset paths in /src/GUI/
- Playback problems: Check audio codec support on target platform
- Missing album art: Verify image extraction from ID3 tags or folder scanning

**Web App Issues:**
- Database connection failures: Check SQLiteDatabase initialization in App.xojo_code
- Upload functionality: Debug UploadMusicWebDialog.xojo_code
- Repository errors: Verify SQL queries in Repository classes
- Port conflicts: Change default port 8080 in project settings

**Cross-Platform Issues:**
- File path handling: Use FolderItem.NativePath vs ShellPath appropriately
- UI differences: Test on each target platform extensively
- Performance variations: Profile on actual target hardware

## Project Metadata

- **Language**: Xojo (BASIC-like syntax)
- **UI Framework**: Xojo's native controls
- **Database**: Built-in Xojo database classes
- **Platforms**: macOS, Windows, Linux
- **Architecture**: Desktop + Web hybrid application
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
├── server/          # Web application project
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
- **Default Web Port**: 8080 (configurable)
- **License**: Custom license (see LICENSE file)

### Assets Available
Located in `/assets/`:
- pause-fill.png
- play-fill.png  
- skip-backward-circle.png
- skip-forward-circle.png
- volume-down-fill.png
- volume-mute-fill.png
- volume-off-fill.png
- volume-up-fill.png

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