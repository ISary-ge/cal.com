set -e

DIR=/workspace
cd $DIR

git clone git@github.com:ISary-ge/cal.com.git calendar --branch mcn-deploy || true
cd calendar  && npx turbo prune --scope=@calcom/web && yarn workspace @calcom/web add
