class Rayvn < Formula
  desc "rayvn - A shared library ecosystem for bash 5.3+."
  homepage "https://github.com/phoggy/rayvn"
  url "https://github.com/phoggy/rayvn/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "b49bb7750c8d77b58da89d3c3eecb516e9c17449323e9a08c0646bb004e021ab"
  license "GPL-3.0-only"

  depends_on "bash"
  depends_on "gawk"
  depends_on "gnu-sed"
  depends_on "gh"
  depends_on "curl"
  depends_on "jq"
  depends_on "asciinema"
  depends_on "bundler"
  depends_on "jekyll"
  depends_on "expect"

  def install
    bin.install "bin/rayvn"
    bin.install "bin/rayvn.up"
    (share/"rayvn"/"lib").install Dir["lib/*.sh"]
    (share/"rayvn"/"templates").install Dir["templates/*"]
    (share/"rayvn"/"etc").install Dir["etc/*"]
    (share/"rayvn").install "rayvn.pkg"
  end

  test do
    system "#{bin}/rayvn", "--version"
  end
end