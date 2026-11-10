class Wardn < Formula
  desc "Encrypted Bitwarden vault backup and restore using Age encryption"
  homepage "https://github.com/phoggy/wardn"
  url "https://github.com/phoggy/wardn/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "acaa7058910fccda3055fbd1591db8148006b0d75c6fbdb7b5d5f6b3ca97b9f6"
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