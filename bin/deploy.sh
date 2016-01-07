
function fail {
  msg="$*"
  echo
  echo $msg
  echo
  exit -1
}

function try {
  cmd="$*"
  $cmd || fail "$cmd failed"
}

if [ "${1}" = "staging" ]; then
  try git push staging master:master
  try heroku run rake db:migrate --app cdclub-staging
  try heroku restart --app cdclub-staging
elif [ "${1}" = "production" ]; then
  try git push production master:master
  try heroku run rake db:migrate --app cdclub
  try heroku restart --app cdclub
else
  fail 'usage: deploy.sh [staging|production]'
fi

