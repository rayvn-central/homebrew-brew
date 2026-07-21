class Rayvn < Formula
  desc "rayvn - A shared library ecosystem for bash 5.3+."
  homepage "https://github.com/phoggy/rayvn"
  url "https://github.com/phoggy/rayvn/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "c2772841d813b5587070c89fdd1df1c60da42d5a09b32e507991bc33f82e6837"
  license "GPL-3.0-only"

  depends_on "bash"
  depends_on "gawk"
  depends_on "gnu-sed"
  depends_on "gh"
  depends_on "curl"
  depends_on "jq"
  depends_on "asciinema"
  depends_on "expect"
  depends_on "bash-completion@2"

  def install
    bin.install "bin/rayvn"
    bin.install "bin/rayvn.up"
    (share/"rayvn"/"lib").install Dir["lib/*.sh"]
    (share/"rayvn"/"templates").install Dir["templates/*"]
    (share/"rayvn"/"etc").install Dir["etc/*"]
    (share/"rayvn").install "rayvn.pkg"
    bash_completion.install "completions/rayvn.bash" => "rayvn"
  end

  test do
    system "#{bin}/rayvn", "--version"
  end
end