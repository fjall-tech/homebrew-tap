class Fjall < Formula
  desc "Cloud infrastructure CLI for AWS — deploy, manage, and monitor"
  homepage "https://fjall.io"
  url "https://registry.npmjs.org/fjall/-/fjall-2.18.3.tgz"
  sha256 "ae7740d5acc5ff30fd91fd85c8fb11b3b16b1c65086f9cc71125f930aca254c6"
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
