class God < Formula
  desc "Cyber swiss army knife for terminal"
  homepage "https://github.com/virzz/virzz"
  url "https://github.com/virzz/virzz/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "622bc4230a66e0c540cbac69947839e43fba587393941cc04f9820c7e252cf1e"
  license "MIT"
  head "https://github.com/virzz/virzz.git", branch: "master"

  depends_on "go"

  def install
    system "go", "run", "./internal/_compile", "-R", "-V", "v0.1.6", "god"
    bin.install "build/god" => "god"
  end

  test do
    assert_match "The Cyber Swiss Army Knife for terminal", shell_output("#{bin}/god")
  end
end
