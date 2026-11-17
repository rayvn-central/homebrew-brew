class Wardn < Formula
  desc "Encrypted Bitwarden vault backup and restore using Age encryption"
  homepage "https://github.com/phoggy/wardn"
  url "https://github.com/phoggy/wardn/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "61b79eab5e73aab716cdf74f8744e1aeeb6625e5e45e671909c336b94c7b5c19"
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