class Valt < Formula
  desc "Public key file encryption using rage/age"
  homepage "https://github.com/phoggy/valt"
  url "https://github.com/phoggy/valt/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "e70ba0749e4966da1f89aee6a057cee913f26de8ea12125bd6a01601fdb545a3"
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

    # Install puppeteer + its bundled Chromium directly into ~/.config/valt/node-js/.
    node_js_dir = Pathname.new(Dir.home)/".config"/"valt"/"node-js"
    node_js_dir.mkpath
    (node_js_dir/"package.json").write((buildpath/"etc/package.json").read)
    (node_js_dir/"package-lock.json").write((buildpath/"etc/package-lock.json").read)
    Dir.chdir(node_js_dir) do
      system "npm", "ci", "--production"
    end
  end

  test do
    system "#{bin}/valt", "--version"
  end
end