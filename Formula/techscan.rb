class Techscan < Formula
  desc "techscan is a Rust CLI tool for analyzing and visualizing technology stacks in a directory"
  homepage "https://github.com/kimulaco/techscan"
  license "MIT"

  version "1.0.2"

  darwin_arm64_sha256 = "bc435a3901f57e212cff1da1c57b713468010e8ff643436fecdd7833d91c67fc"
  darwin_x64_sha256 = "12f0569f2adf83676c92a217ab57123b3d20d14cd6cb2c48910e06c7940e40bc"
  linux_x64_sha256 = "212faf9293a820e1c519e1841ff2e8b91ae566722d1766f9f228f433d43d8a54"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kimulaco/techscan/releases/download/v#{version}/techscan-darwin-arm64.tar.gz"
      sha256 darwin_arm64_sha256
    else
      url "https://github.com/kimulaco/techscan/releases/download/v#{version}/techscan-darwin-x64.tar.gz"
      sha256 darwin_x64_sha256
    end
  end

  on_linux do
    url "https://github.com/kimulaco/techscan/releases/download/v#{version}/techscan-linux-x64.tar.gz"
    sha256 linux_x64_sha256
  end

  def install
    bin.install "techscan"
  end

  test do
    assert_match "techscan", shell_output("#{bin}/techscan --version")
  end
end
