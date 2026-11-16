class Rayvn < Formula
  desc "Libraries and tools to build, test, document and release bash 5.3+ programs"
  homepage "https://github.com/phoggy/rayvn"
  url "https://github.com/phoggy/rayvn/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "2ba3a7806258df49fbb7483169c8d303bd397b8a3a89656cdff8a5612ee1cc00"
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