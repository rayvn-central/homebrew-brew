# Installs the prebuilt binaries from https://github.com/sts10/phraze releases (by Sam Schlinkert).
# Updated by .github/workflows/update-phraze.yml: don't edit the version or checksums by hand.
class Phraze < Formula
  desc "Generate random passphrases"
  homepage "https://github.com/sts10/phraze"
  license "MPL-2.0"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/sts10/phraze/releases/download/v0.3.28/phraze-aarch64-apple-darwin.tar.xz"
      sha256 "2e3649c51a9f4590f13cf62b07fd187ef8a79122ac0838fd08cc21fc56bba542"
    end
    on_intel do
      url "https://github.com/sts10/phraze/releases/download/v0.3.28/phraze-x86_64-apple-darwin.tar.xz"
      sha256 "ede4536e4c1ae957a209ac93a3f9acb3a232507e01a28b332bf420a3d4373896"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/sts10/phraze/releases/download/v0.3.28/phraze-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "986a42a9bb97670a4280c7cfcc1ed95a5ded4f90cbaf9b7c7863f03576d0ee86"
    end
    on_intel do
      url "https://github.com/sts10/phraze/releases/download/v0.3.28/phraze-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0f8af4935d5d0e4721c0cc795d337464bc056e6bd2e11bd864fc26ce8668ff35"
    end
  end

  def install
    bin.install "phraze"
  end

  test do
    assert_equal "phraze #{version}", shell_output("#{bin}/phraze --version").strip
    assert_match "70.51 bits of entropy", shell_output("#{bin}/phraze --verbose --list l --words 5 2>&1")
  end
end
