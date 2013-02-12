echo "Being Mac Setup..."
if [ sw_vers == '*10.6.*' ]
then
  snow_leopard='true'
  echo "  On Snow Leopard...really? :("
els
  echo "  On Lion.."
  snow_leopard='false'
fi

echo 'Set the keyrepeat...'
open /Applications/System\ Preferences.app/
read ioop

echo 'Autohide Dock'
defaults write com.apple.dock autohide -bool true

if ! which "xcodebuild" > /dev/null
then
  echo '  Installing XCode...'
  if $snow_leopard == 'true'
  then
    open /Applications/App\ Store.app/
    read noop
  els
    open http://connect.apple.com/cgi-bin/WebObjects/MemberSite.woa/wa/getSoftware?fileID=26806&wosid=S72vR3gFpPm52OFN1xJpnLHT8QY
    read noop
  fi
fi

chsh -s /bin/zsh

zsh <(curl -s https://raw.github.com/thoughtbot/laptop/master/mac)

echo 'Installing sizeup'
wget http://www.irradiatedsoftware.com/downloads/?file=SizeUp.zip
