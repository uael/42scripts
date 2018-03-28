
#!/bin/sh

#fix_brew.sh - mcartier


#you can keep ur brew if u need ur formulas
if [ "$1" = "--keep" ];
  then
    echo "actual brew not removed";
  else
    echo "Installing a healthy homebrew";
    rm -rf ~/.brew;
    git clone https://github.com/Homebrew/brew.git --depth=1 ~/.brew;
fi

#fixing Caches and Locks
rm -rf ~/Library/Caches ~/.brew/Library/Locks;
mkdir -p "/tmp/$USER/Homebrew/Caches" "/tmp/$USER/Homebrew/Temp" "/tmp/$USER/Homebrew/Locks" > ~/.zprofile;
ln -s /tmp/$USER/Homebrew/Locks ~/.brew/Library/Locks;
echo "export HOMEBREW_CACHE=/tmp/\$USER/Homebrew/Caches" >> ~/.zprofile
echo "export HOMEBREW_TEMP=/tmp/\$USER/Homebrew/Temp" >> ~/.zprofile
echo "export TMP_DIR=\"/Volumes/Storage/goinfre/$USER\"" >> ~/.zprofile;
echo "export PATH=~/.brew/bin:\$PATH" >> ~/.zprofile;

#updating
echo "updating brew";
~/.brew/bin/brew update;
source ~/.zprofile;
echo "done. You may need to reboot your shell instance.";

