class Wardn < Formula
  desc "Encrypted Bitwarden vault backup and restore using Age encryption"
  homepage "https://github.com/phoggy/wardn"
  url "https://github.com/phoggy/wardn/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "003bc377235938fa5b8a88ae49710ac3dbed34bccacfbb46376a41382c57281c"
  license "GPL-3.0-only"

  depends_on "bash"
  depends_on "rayvn-central/brew/rayvn"
  depends_on "rayvn-central/brew/valt"
  depends_on "jq"
  depends_on "age"
  depends_on "gawk"
  depends_on "gnu-sed"
  depends_on "minisign"
  depends_on "pdfcpu"
  depends_on "bitwarden-cli"

  def install
    bin.install "bin/wardn"
    (share/"wardn"/"lib").install Dir["lib/*.sh"]
    (share/"wardn"/"etc").install Dir["etc/*"]
    (share/"wardn").install "rayvn.pkg"
  end

  test do
    system "#{bin}/wardn", "--version"
  end
end