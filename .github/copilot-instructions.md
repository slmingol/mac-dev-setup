# macOS Dev Setup - Copilot Agent Onboarding

## Repository Overview

**Purpose**: Automated macOS development environment setup using Homebrew  
**Type**: Shell scripts (Bash)  
**Size**: ~7KB main script, 100+ commits  
**Runtime**: Bash 4+ on macOS  
**Package Manager**: Homebrew (brew)

### Purpose
Automates the installation and configuration of a complete development environment on fresh or existing macOS installations, including:
- CLI tools and utilities
- Development languages (Python, Go, Node.js)
- Container tools (Podman, Docker alternatives)
- DevOps tools (Terraform, Ansible, Kubernetes)
- Desktop applications via Homebrew Casks

## Key Files

```
/
├── .git/                      # Git repository (100+ commits)
├── .vscode/                   # VS Code settings
│   └── settings.json         # Copilot configuration
├── .github/                   # GitHub configuration
│   └── copilot-instructions.md
├── mac-dev-setup.sh          # Main installation script (7KB)
├── os_detect.sh              # OS detection utility (1.5KB)
├── krr.txt                   # Kubernetes Right-Sizing tool notes
├── README.md                 # Documentation
├── LICENSE                   # MIT License
└── out/                      # Output directory (gitignored)
```

## Quick Start

### Initial Setup (Fresh macOS)
```bash
./mac-dev-setup.sh --install
```

This will:
1. Install Homebrew (if not present)
2. Configure keyboard repeat rates
3. Install 100+ Homebrew packages
4. Install 30+ desktop applications (casks)
5. Set up development tools and environments
6. Configure bash as default shell
7. Enable passwordless sudo (optional)

**Duration**: 30-60 minutes depending on internet speed and system

### Periodic Maintenance
```bash
./mac-dev-setup.sh --upgrade
```

Updates all installed packages and applications.

## Script Architecture

### Main Script (mac-dev-setup.sh)

**Structure:**
```bash
#!/bin/bash
set -e

# Helper functions
brew_pkg()      # Install/upgrade brew package
brew_cask()     # Install cask application
brew_tap()      # Add tap and install package

# Mode selection
--install       # Initial setup
--upgrade       # Update existing installation

# Package arrays
BREW_PKGS=(...)   # CLI tools
BREW_CASKS=(...)  # Desktop apps
BREW_TAPS=(...)   # Custom brew taps
```

**Key Features:**
- Idempotent: Safe to run multiple times
- Skips already-installed packages
- Updates existing packages in upgrade mode
- Error handling with `set -e`

### Package Categories

**CLI Tools (100+):**
- **Core**: bash, coreutils, gnu-* tools
- **DevOps**: ansible, terraform, kubectl, k9s, helm
- **Containers**: podman, skopeo, lima, multipass
- **Networking**: mtr, nmap, ipcalc, iperf3
- **Monitoring**: btop, htop, glances, ctop
- **Git**: git, gh, hub, git-extras
- **Cloud**: awscli, aws-shell, openshift-cli
- **Languages**: python3, go, nvm
- **Utilities**: jq, yq, ripgrep, bat, eza, tldr

**Casks (Desktop Apps):**
- **Development**: visual-studio-code, macvim, postman
- **Browsers**: firefox, google-chrome (optional)
- **Communication**: discord, slack (optional)
- **Utilities**: rectangle, clipy, itsycal, keycastr
- **Virtualization**: vagrant, virtualbox (optional)
- **Media**: vlc, calibre, sonic-visualiser

**Custom Taps:**
- drone/drone (CI/CD)
- robusta-dev/krr (Kubernetes right-sizing)
- teamookla/speedtest (Internet speed test)

## Common Tasks

### Adding New Packages
1. Edit `mac-dev-setup.sh`
2. Add package name to appropriate array:
   ```bash
   BREW_PKGS=(
     ...
     new-package-name
     ...
   )
   ```
3. Test installation:
   ```bash
   ./mac-dev-setup.sh --install
   ```

### Adding New Casks
```bash
BREW_CASKS=(
  ...
  new-cask-name
  ...
)
```

### Adding New Taps
Format: `tap-name,package-name`
```bash
BREW_TAPS=(
  ...
  username/tap-name,package-name
  ...
)
```

### Disabling Packages
Comment out with `#`:
```bash
BREW_PKGS=(
  package1
  #package2    # Temporarily disabled
  package3
)
```

### Testing Script Changes
```bash
# Dry run (check syntax)
bash -n mac-dev-setup.sh

# Test in upgrade mode (safer)
./mac-dev-setup.sh --upgrade

# Full test (VM recommended)
./mac-dev-setup.sh --install
```

## Development Workflow

### Making Changes
```bash
# Edit script
vim mac-dev-setup.sh

# Test locally
./mac-dev-setup.sh --upgrade

# Commit changes
git add mac-dev-setup.sh
git commit -m "Add: new package xyz"
git push origin main
```

### Best Practices
1. **Test before committing**: Run upgrade mode to verify
2. **Comment disabled packages**: Use `#` with reason
3. **Group related packages**: Keep categories organized
4. **Update README**: Reflect major changes in documentation
5. **Version control**: Commit frequently with clear messages

## Configuration Options

### GitHub API Token (Optional)
Avoid Homebrew API rate limits:
```bash
# Create ~/.config/brew_gh_token
echo "ghp_yourpersonalaccesstoken" > ~/.config/brew_gh_token
chmod 600 ~/.config/brew_gh_token
```

### Keyboard Repeat Rate
Script sets aggressive key repeat (power users):
```bash
defaults write -g InitialKeyRepeat -int 10  # 150ms
defaults write -g KeyRepeat -int 1          # 15ms
```

To adjust, edit these values in the script:
- `InitialKeyRepeat`: Delay before repeat (lower = faster)
- `KeyRepeat`: Rate of repeat (lower = faster)

## Troubleshooting

### Homebrew Installation Fails
```bash
# Manual Homebrew installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add to PATH (Apple Silicon)
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bash_profile
source ~/.bash_profile
```

### Package Install Fails
```bash
# Check package name
brew search package-name

# Try manual install
brew install package-name

# Check for conflicts
brew doctor
```

### Cask Install Fails
```bash
# Some casks require Rosetta 2 (Apple Silicon)
softwareupdate --install-rosetta

# Check cask info
brew info --cask cask-name

# Force reinstall
brew reinstall --cask cask-name
```

### Script Errors
```bash
# Run with bash -x for debugging
bash -x ./mac-dev-setup.sh --upgrade

# Check specific line
sed -n '100p' mac-dev-setup.sh
```

## Integration with Podman

**Note**: This script installs Podman (Docker alternative) by default.

**Podman Setup:**
```bash
# Initialize Podman machine
podman machine init
podman machine start

# Test Podman
podman run hello-world

# Use docker-compose syntax
alias docker=podman
alias docker-compose='podman compose'
```

## Maintenance Schedule

**Weekly**: Run upgrade mode
```bash
./mac-dev-setup.sh --upgrade
```

**Monthly**: Review new packages
- Check Homebrew formulae: https://formulae.brew.sh
- Review casks: https://formulae.brew.sh/cask
- Update script with useful additions

**Quarterly**: Clean up
```bash
brew cleanup --prune=all
brew doctor
```

## Git Operations

```bash
# Check status
git status

# Add changes
git add mac-dev-setup.sh
git add README.md

# Commit with message
git commit -m "Add: new DevOps tools"

# Push to GitHub
git push origin main

# View history
git log --oneline --graph
```

## Validation Steps

Before pushing changes:
1. **Syntax check**: `bash -n mac-dev-setup.sh`
2. **Test run**: `./mac-dev-setup.sh --upgrade`
3. **Verify packages**: `brew list | grep new-package`
4. **Update README**: If adding major features
5. **Commit message**: Use descriptive commit messages

## Quick Reference

**Install**: `./mac-dev-setup.sh --install`  
**Upgrade**: `./mac-dev-setup.sh --upgrade`  
**Add Package**: Edit `BREW_PKGS` array  
**Add Cask**: Edit `BREW_CASKS` array  
**Add Tap**: Edit `BREW_TAPS` array (format: `tap,package`)  
**Disable**: Comment with `#`

## Platform Compatibility

**Supported**:
- macOS Big Sur (11.x)
- macOS Monterey (12.x)
- macOS Ventura (13.x)
- macOS Sonoma (14.x)
- macOS Sequoia (15.x)

**Architectures**:
- Intel (x86_64)
- Apple Silicon (arm64)

## Related Files

- **os_detect.sh**: OS detection utility (referenced but not actively used)
- **krr.txt**: Kubernetes Right-Sizing tool documentation
- **LICENSE**: MIT License

## Trust These Instructions

This script has been refined over 100+ commits and is production-tested. It's designed to be idempotent and safe to run multiple times. The upgrade mode is non-destructive and suitable for daily/weekly maintenance.

## Contributing

When adding new packages:
1. Test installation on clean system (VM recommended)
2. Verify compatibility with both Intel and Apple Silicon
3. Document any special requirements
4. Update README with package list
5. Submit with descriptive commit message

## Common Packages Explained

**Essential Dev Tools**:
- `gh`: GitHub CLI
- `git-crypt`: Encrypted git repositories
- `git-extras`: Additional git commands
- `jq`/`yq`: JSON/YAML processors
- `ripgrep`: Fast text search (rg)
- `bat`: cat with syntax highlighting
- `eza`: modern ls replacement

**Kubernetes Tools**:
- `kubectl`: Kubernetes CLI
- `k9s`: Terminal UI for Kubernetes
- `helm`: Package manager for Kubernetes
- `stern`: Multi-pod log tailing
- `kubectx`: Switch between contexts

**Container Tools**:
- `podman`: Docker-compatible container engine
- `skopeo`: Container image operations
- `lima`: Linux VMs on macOS
- `multipass`: Ubuntu VMs
