class Rayvn < Formula
  desc "Libraries and tools to build, test, document and release bash 5.3+ programs"
  homepage "https://github.com/phoggy/rayvn"
  url "https://github.com/phoggy/rayvn/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "2435395d1f3d84e0e213fab900a4844f306e0a4559ddbf9c2ff3dc1512910375"
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