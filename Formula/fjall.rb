class Fjall < Formula
  desc "Cloud infrastructure CLI for AWS — deploy, manage, and monitor"
  homepage "https://fjall.io"
  url "https://registry.npmjs.org/fjall/-/fjall-2.21.0.tgz"
  sha256 "93c51ad6d1ae56a70b0b3db1f8de8b81b4d1b4b2a89100a787c3798a964ef097"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  def caveats
    <<~EOS
      To get started, run:
        fjall login
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fjall --version")
    assert_match "deploy", shell_output("#{bin}/fjall --help")
  end
end
