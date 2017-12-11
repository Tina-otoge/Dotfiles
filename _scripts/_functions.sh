CURDIR=$(dirname $(readlink -f "${BASH_SOURCE[0]}" 2>/dev/null||echo $0))

function press_any_key() {
	read -n 1 -s -r -p "Press any key to continue"
	echo
}

function confirm() {
	read -r -p "${1:-"Proceed with installation?"} [y/N] " response
	echo
	case "$response" in
		[yY][eE][sS]|[yY])
			return 0
			;;
		*)
			return 1
			;;
	esac
}

function install_rpmfusion_free() {
	sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
}
function install_rpmfusion_nonfree() {
	sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}

function ghclone() {
	git clone "https://github.com/$1" "$CURDIR/_repos/${2:-$1}"
}
