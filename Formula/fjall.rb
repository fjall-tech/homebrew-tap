class Fjall < Formula
  desc "Cloud infrastructure CLI for AWS — deploy, manage, and monitor"
  homepage "https://fjall.io"
  url "https://registry.npmjs.org/fjall/-/fjall-25.0.0.tgz"
  sha256 "25408f84650f4bdd113d4ba31f0a9246a90f4bd4dca98725dc84aeb25f2d0d02"
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
