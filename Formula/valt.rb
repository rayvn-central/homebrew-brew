class Valt < Formula
  desc "Public key encryption for files and archives, using age and minisign"
  homepage "https://github.com/phoggy/valt"
  url "https://github.com/phoggy/valt/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "ac210d6bde56f0f816db75c3f3e78a2835dd8c91fe6a0af62b660f7f7633cdee"
  license "GPL-3.0-only"

  depends_on "bash"
  depends_on "rayvn-central/brew/rayvn"
  depends_on "age"
  depends_on "gawk"
  depends_on "gnu-sed"
  depends_on "sts10/phraze/phraze"
  depends_on "phoggy/mrld/mrld"
  depends_on "jq"
  depends_on "minisign"
  depends_on "qrtool"
  depends_on "typst"
  depends_on "exiftool"
  depends_on "qpdf"

  def install
    bin.install "bin/valt"
    (share/"valt"/"lib").install Dir["lib/*.sh"]
    (share/"valt"/"etc").install Dir["etc/*"]
    (share/"valt").install "rayvn.pkg"
    bash_completion.install "completions/valt.bash" => "valt"
    zsh_completion.install "completions/valt.zsh" => "_valt"
  end

  test do
    system "#{bin}/valt", "--version"
  end
end