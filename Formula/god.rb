class God < Formula
  desc "Cyber swiss army knife for terminal"
  homepage "https://github.com/virzz/virzz"
  url "https://github.com/virzz/virzz/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "622bc4230a66e0c540cbac69947839e43fba587393941cc04f9820c7e252cf1e"
  license "MIT"
  head "https://github.com/virzz/virzz.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/virzz/virzz"
    sha256 cellar: :any_skip_relocation, monterey:     "7c28d5da4f78ba5a785cc06016115d4246cf0922dcc0f03a44c5b454526f41e4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e2e6cd08358a20b2ebbf94d273a31ab2d049ff857826d1712f92cec13525281d"
  end

  depends_on "go"

  def install
    system "go", "run", "./internal/_compile", "-R", "-V", "v0.1.6", "god"
    bin.install "build/god" => "god"
  end

  test do
    assert_match "The Cyber Swiss Army Knife for terminal", shell_output("#{bin}/god")
  end
end
