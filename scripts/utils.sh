# reload source
reload() {
  source ~/.zshrc;
}

function fixaudio() {
  sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`
}