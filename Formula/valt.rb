class Valt < Formula
  desc "Public key encryption for files and archives, using age and minisign"
  homepage "https://github.com/phoggy/valt"
  url "https://github.com/phoggy/valt/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "ac5a9be5e237adfd07c4f5e96d16417f446e572a3057d6dc2366b86d29e04f2e"
  license "GPL-3.0-only"

  depends_on "bash"
  depends_on "rayvn-central/tap/rayvn"
  depends_on "age"
  depends_on "gawk"
  depends_on "gnu-sed"
  depends_on "rayvn-central/tap/phraze"
  depends_on "rayvn-central/tap/mrld"
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