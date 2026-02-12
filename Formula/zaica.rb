class Zaica < Formula
  desc "Zig-based AI coding agent CLI"
  homepage "https://github.com/neolite/zaica"
  version "0.6-alpha"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neolite/zaica/releases/download/v0.6-alpha/zc-v0.6-alpha-aarch64-macos.tar.gz"
      sha256 "a797988cd68f42b1f4268e41fe024a378bfa1dc935e5a36c0219c7d47794cf12"
    else
      url "https://github.com/neolite/zaica/releases/download/v0.6-alpha/zc-v0.6-alpha-x86_64-macos.tar.gz"
      sha256 "f90595da10b78df37a96925903cd4be0647772d1279161ba3d20ae78bae92929"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neolite/zaica/releases/download/v0.6-alpha/zc-v0.6-alpha-aarch64-linux.tar.gz"
      sha256 "d9c96e8998a0633f6b348c2362a3109873bccdfa375f41943aab3d128d41e307"
    else
      url "https://github.com/neolite/zaica/releases/download/v0.6-alpha/zc-v0.6-alpha-x86_64-linux.tar.gz"
      sha256 "b1054c05f632674be381c36d0f85a8a1050b61fe541bce1a26528f9aad50915f"
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
