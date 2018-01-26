# dotfiles
macOS and Debian Dev Setup scripts

## new mac
If you are a new mac or a newly installed system, and want to install all the application and development environment and vim configuration
```bash
git clone https://github.com/yh1306/dotfiles.git && cd dotfiles/setup && chmod a+x install.sh && ./install.sh
```
# step by setp
If you only want part of it, choose what you want and execute the corresponding script

## Homebrew
Install Homebrew and SSH key pairs
```bash
git clone https://github.com/yh1306/dotfiles.git && cd dotfiles/setup && chmod a+x brew.sh && ./brew.sh
```

## Applications
Install Applications
- **Chrome**
- **IINA**
- **Shadowsocksx-ng**
- **iTerm2**
```bash
bash utilities.sh
```

## vimrc
```bash
bash vimrc.sh
```

## bash_profile
```bash
bash bash_profile.sh && source ~/.bash_profile
```

## web development
```bash
bash web.sh
```
