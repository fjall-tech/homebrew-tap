class Fjall < Formula
  desc "Cloud infrastructure CLI for AWS — deploy, manage, and monitor"
  homepage "https://fjall.io"
  url "https://registry.npmjs.org/fjall/-/fjall-3.0.0.tgz"
  sha256 "95cd159bc36668964871968f4e936098e5c36c857d08c96ee9221e998ffdeccf"
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
