require "language/node"

class Pgday < Formula
  desc "Official CLI for pgday.app sales gamification APIs"
  homepage "https://www.pgday.app/developers"
  url "https://github.com/kkuckein/homebrew-pgday/releases/download/v0.1.0/pgday-cli-0.1.0.tgz"
  sha256 "52f5cc0881d0d9ba7522dbfce25579596278e8182db1ca3f5ac5a192c9513370"
  license :cannot_represent

  depends_on "node@24"

  def install
    libexec.install "bin", "src", "package.json", "README.md"
    rewrite_shebang Language::Node::Shebang.detected_node_shebang(self), libexec/"bin/pgday.mjs"
    bin.install_symlink libexec/"bin/pgday.mjs" => "pgday"
  end

  test do
    ENV.delete "PGDAY_API_KEY"
    assert_equal version.to_s, shell_output("#{bin}/pgday --version").strip
    assert_equal version.to_s, JSON.parse((libexec/"package.json").read).fetch("version")
    assert_match "--sandbox", shell_output("#{bin}/pgday --help")
    assert_match "PGDAY_API_KEY", shell_output("#{bin}/pgday events list 2>&1", 2)
  end
end
