# Maintainer: Conor Knowles pkg@conorknowles.com
pkgname=sd
pkgver=20220224.231442.978fee59
pkgrel=1
pkgdesc="script directory"
arch=("any")
url="https://github.com/ConorHK/sd"
license=("unknown")
depends=("pacman>=4.1.2" "git" "bash")
provides=("sd")
conflicts=("sd")
source=("sd" "_sd")
sha256sums=('96f1171a306e21b3461597e25e42f1701db534f22234ce868ded7a62a7b9c568'
            '3188a4352f2cd613fbb86aaf160fbe716c623b2d01839778c646fa3e44d8b828')

package() {
  install -D "${srcdir}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 _"${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions" 
}
