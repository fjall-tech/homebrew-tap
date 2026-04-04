class Fjall < Formula
  desc "Cloud infrastructure CLI for AWS — deploy, manage, and monitor"
  homepage "https://fjall.dev"
  url "https://registry.npmjs.org/@fjall/cli/-/cli-0.89.5.tgz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
