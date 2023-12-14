export TAG=1.007
export APPNAME=calendar
export NAMESPACE=calendar

function dev()
{
	export ENVNAME=dev
	export CLUSTER_IP=$(kubectl cluster-info | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | head -1)
	export TLD="loc"
	export DOMAIN="mcn.loc"
	CI_URL="$APPNAME-$ENVNAME.$DOMAIN"
}

function stage()
{
	export ENVNAME=stage
	export CLUSTER_IP=$(kubectl cluster-info | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | head -1)
	export TLD="loc"
	export DOMAIN="mcn.loc"
	CI_URL="$APPNAME-$ENVNAME.$DOMAIN"
}

function preprod()
{
	export ENVNAME=stage
	export CLUSTER_IP=$IP_TO_ETCHOST
	export TLD="ru"
	export DOMAIN="mcn.ru"
	CI_URL="$APPNAME-$ENVNAME.$DOMAIN"
}

function prod()
{
	export ENVNAME=prod
	export DOMAIN="mcn.ru"
	export TLD="ru"
	CI_URL="$APPNAME.$DOMAIN"
}

function euprod()
{
	export ENVNAME=euprod
	export DOMAIN="kompaas.tech"
	export TLD="tech"
	CI_URL="$APPNAME.$DOMAIN"
}