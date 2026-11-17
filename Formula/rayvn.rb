class Rayvn < Formula
  desc "Libraries and tools to build, test, document and release bash 5.3+ programs"
  homepage "https://github.com/phoggy/rayvn"
  url "https://github.com/phoggy/rayvn/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "688fdd562d791a76e990276bf1d62c4ac3019971b816413962eab874f4747ab4"
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
    bin.install "bin/rayvn-bash" # the interpreter of rayvn scripts' #!/usr/bin/env rayvn-bash shebang
    bin.install "bin/rayvn-tmp"
    (share/"rayvn"/"lib").install Dir["lib/*.sh"]
    (share/"rayvn"/"templates").install Dir["templates/*"]
    (share/"rayvn"/"etc").install Dir["etc/*"]
    (share/"rayvn").install "rayvn.pkg"
    bash_completion.install "completions/rayvn.bash" => "rayvn"
    zsh_completion.install "completions/rayvn.zsh" => "_rayvn"
  end

  test do
    system "#{bin}/rayvn", "--version"
  end
end