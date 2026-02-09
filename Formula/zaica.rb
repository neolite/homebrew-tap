class Zaica < Formula
  desc "Zig-based AI coding agent CLI"
  homepage "https://github.com/neolite/zaica"
  version "0.4-alpha"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neolite/zaica/releases/download/v0.4-alpha/zc-v0.4-alpha-aarch64-macos.tar.gz"
      sha256 "79814c899f0093344d44fde7c9c9c2a8f774cfc47fcbd3209ade0a77727fa871"
    else
      url "https://github.com/neolite/zaica/releases/download/v0.4-alpha/zc-v0.4-alpha-x86_64-macos.tar.gz"
      sha256 "5428371f320ed69798e41c30e4014611376662b348c469fe4787166e23767386"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neolite/zaica/releases/download/v0.4-alpha/zc-v0.4-alpha-aarch64-linux.tar.gz"
      sha256 "bf4096ae65e08ac8e4f667973ec9f694808e3564cb290f5883006d7eaaaaffb8"
    else
      url "https://github.com/neolite/zaica/releases/download/v0.4-alpha/zc-v0.4-alpha-x86_64-linux.tar.gz"
      sha256 "6c5608b2590cc9b6640a7a381702622e31297cff002e7159a081592caea0413c"
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
