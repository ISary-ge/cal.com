#!/bin/bash
THIS=`readlink -f "${BASH_SOURCE[0]}"`
DIR=`dirname "${THIS}"`
cd $DIR

source ./def.sh

if [ "$ENVNAME" = "dev" ]; then
    API_POD="$APPNAME-api-dev-0"
    WEB_POD="$APPNAME-web-dev-0"
    API_CONT="$APPNAME-api-dev"
    WEB_CONT="$APPNAME-web-dev"
    NAMESPACE="$NAMESPACE-$ENVNAME"
    CMD="-- /bin/bash /install/prepare-scripts/init-dev-env.sh"

    echo "Ожидание готовности пода $API_POD $WEB_CONT" &&
        # kubectl -n $NAMESPACE wait --for=condition=ready --timeout=120s pods $API_POD
        kubectl -n $NAMESPACE wait --for=condition=ready --timeout=120s pods $WEB_POD
    echo 'Запуск скрипта инициализации' &&
        # kubectl -n $NAMESPACE exec -it $API_POD -c $API_CONT $CMD
        kubectl -n $NAMESPACE exec -it $WEB_POD -c $WEB_CONT $CMD
    cat << EOF
    ================================================
    Проект $APPNAME задеплоен в $ENVNAME окружение
    ================================================
EOF
fi