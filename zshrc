# Aliases

lazynvm() {
  unset -f nvm node npm npx yarn rails
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
}

nvm() {
  lazynvm
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}

npx() {
  lazynvm
  npx $@
}

yarn() {
  lazynvm
  yarn $@
}

rails() {
  lazynvm
  rails $@
}

function acl() {
  # Usage:
  # acl aws-boost
  code=$(ykman oath accounts code $1)
  token=$(echo $code | awk -F"$ykprofile  " '{print $2}')
  echo $token
  eval `aws-mfa-login --profile $1 --token=$token`
}

function mfa () {
  # Usage:
  # mfa aws-boost
  ykprofile=$1
  key=$(ykman oath accounts code $ykprofile)
  echo $key | awk -F "$ykprofile  " '{print $2}' | pbcopy
  key=""
}
