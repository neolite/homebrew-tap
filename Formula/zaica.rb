class Zaica < Formula
  desc "Zig-based AI coding agent CLI"
  homepage "https://github.com/neolite/zaica"
  version "0.4-alpha"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neolite/zaica/releases/download/v0.4-alpha/zc-v0.4-alpha-aarch64-macos.tar.gz"
      sha256 "c2950ce258b5f2e0605675422c29f0ff5098b7dfd9d7d9f863c07a71b6e32c20"
    else
      url "https://github.com/neolite/zaica/releases/download/v0.4-alpha/zc-v0.4-alpha-x86_64-macos.tar.gz"
      sha256 "7637c3ac01d9907c4ccc7576766570ef406a390b385a8a7a1a18e4121d19b449"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neolite/zaica/releases/download/v0.4-alpha/zc-v0.4-alpha-aarch64-linux.tar.gz"
      sha256 "df5f16ced8860e09ef2c72e513974e77b4659ad45d1be29dbdd45ee85c0022f3"
    else
      url "https://github.com/neolite/zaica/releases/download/v0.4-alpha/zc-v0.4-alpha-x86_64-linux.tar.gz"
      sha256 "e6a18d6d0744e4ab26e31813c750ca0a05eb817bfb8213d15fda3a1c61da6844"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "zc-aarch64-macos" => "zc"
      else
        bin.install "zc-x86_64-macos" => "zc"
      end
    else
      if Hardware::CPU.arm?
        bin.install "zc-aarch64-linux" => "zc"
      else
        bin.install "zc-x86_64-linux" => "zc"
      end
    end
  end

  test do
    assert_match "zaica", shell_output("#{bin}/zc --help 2>&1", 1)
  end
end
