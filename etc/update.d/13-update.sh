(
  FACTORIO_LOGIN=`pass show web/com.factorio | sed -n 2p`
  FACTORIO_PASSWORD=`pass show web/com.factorio | sed -n 1p`
  export FACTORIO_LOGIN
  export FACTORIO_PASSWORD
  pacaur -Syuu
)
