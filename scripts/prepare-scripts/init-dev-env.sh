set -e

DIR=/workspace

[ ! -d calendar ] && git clone git@github.com:ISary-ge/cal.com.git calendar --branch mcn-deploy || true
cd calendar  && npx turbo prune --scope=@calcom/web && yarn add && yarn turbo run build --filter=@calcom/web