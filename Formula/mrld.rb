class Mrld < Formula
  version "0.1.17"
  on_macos do
    on_arm do
      url "https://github.com/phoggy/mrld/releases/download/v0.1.17/mrld-aarch64-apple-darwin.tar.xz"
      sha256 "fa6123ca5b02711f02c9da64f9d1cb37b2f6c6dc8b9b92dde2ea395f5fd0bd9a"
    end
    on_intel do
      url "https://github.com/phoggy/mrld/releases/download/v0.1.17/mrld-x86_64-apple-darwin.tar.xz"
      sha256 "da2f035f2272815c236c5c6abf55cbf57fbedb084f56a8f3c1f09af1572ae0cd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/phoggy/mrld/releases/download/v0.1.17/mrld-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "343e2ae0b38c1aee510943109b0925edf4857ca344d70d3d38f27ee9f523fdf8"
    end
    on_intel do
      url "https://github.com/phoggy/mrld/releases/download/v0.1.17/mrld-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "76211c14b3ea37ce80859deb6929c6b018b170e00e843818aa779c40510ecdad"
    end
  end

  def install
    on_macos do
      on_arm do
        bin.install "mrld"
      end
    end
    on_macos do
      on_intel do
        bin.install "mrld"
      end
    end
    on_linux do
      on_arm do
        bin.install "mrld"
      end
    end
    on_linux do
      on_intel do
        bin.install "mrld"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
