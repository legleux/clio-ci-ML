set -e
RIPPLE_URL="https://artifactory.ops.ripple.com:443/artifactory"
RIPPLE_CREDS="-urippled:${ARTIFACTORY_DEPLOY_KEY_RIPPLED}"
up_dpkg(){
  TARGET_FILE_PATH=$(realpath $1)
  PKG="$(basename $1)"
  ARTIFACTORY_URL=$RIPPLE_URL
  TEST_REPO="clio-deb-test-mirror"
  REAL_REPO="clio-deb"
  REPO=$TEST_REPO
  COMPONENT="beta"
  ARCHITECTURE="amd64"
  DISTROS="focal" # hirsute impish jammy"
  CREDS=$RIPPLE_CREDS
  for dist in $DISTROS ; do
      if [ -z "$DISTROS_MATRIX" ]; then DISTROS_MATRIX=";";fi
      DISTROS_MATRIX="${DISTROS_MATRIX}deb.distribution=${dist};"
  done
  ART_URI="$ARTIFACTORY_URL/$REPO/pool/$COMPONENT/${PKG}${DISTROS_MATRIX}deb.component=$COMPONENT;deb.architecture=$ARCHITECTURE"
  # echo $ART_URI
  # echo $TARGET_FILE_PATH
  curl \
      $CREDS \
      -XPUT "$ART_URI" \
      -T $TARGET_FILE_PATH
}

up_dpkg $1
