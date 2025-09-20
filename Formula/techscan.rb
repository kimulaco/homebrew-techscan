class Techscan < Formula
  desc "techscan is a Rust CLI tool for analyzing and visualizing technology stacks in a directory"
  homepage "https://github.com/kimulaco/techscan"
  license "MIT"

  version "1.0.1"

  darwin_arm64_sha256 = "adbb5f7468717be54c623333fa809d3a0616e84310c0a0f827a485824e48c243"
  darwin_x64_sha256 = "7a760b3c3bd0b9849df898450515a2bbd888b20c670ebf5cbe289edadb185238"
  linux_x64_sha256 = "0358c7465422357d9dd98017b00068703409ee15966511d5711ebbe049b1a2b1"

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
