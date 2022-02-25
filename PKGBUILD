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
sha256sums=('ee0473d10c667a84e1710c47ee1b6d5e356bce9f7c2a2445faf19f1f12bfb328'
            'd4efc559a6a48dab211954c189ef415dd2f44314f71b4c0c2a59d7dda2ca333f')

package() {
  install -D "${srcdir}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 _"${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions" 
}
