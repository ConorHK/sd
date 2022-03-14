# Maintainer: Conor Knowles pkg@conorknowles.com
pkgname=sd
pkgver=20220224.231442.978fee59
pkgrel=1
pkgdesc="script directory"
arch=("any")
url="https://github.com/ConorHK/sd"
license=("MIT")
depends=("pacman>=4.1.2" "git" "bash")
provides=("sd")
conflicts=("sd")
source=("sd" "_sd")
sha256sums=('727f01a176fb133e0095b7a1f5f80e73c9f1144b1c0c44d7be7e195b1e503e20'
            'd4efc559a6a48dab211954c189ef415dd2f44314f71b4c0c2a59d7dda2ca333f')

package() {
  install -D "${srcdir}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 _"${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions" 
}
