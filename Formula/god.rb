class God < Formula
  desc "Cyber swiss army knife for terminal"
  homepage "https://github.com/virzz/virzz"
  url "https://github.com/virzz/virzz.git",
      tag:      "v0.1.7",
      revision: "f3d6c0f01d04b19825174446fc5b97b65f0aa9f7"
  license "MIT"
  head "https://github.com/virzz/virzz.git", branch: "master"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "run", "./internal/_compile", "-R", "-V", version.to_s, "-G", Utils.git_head.to_s, "god"
    bin.install "build/god" => "god"
  end

  test do
    assert_match "The Cyber Swiss Army Knife for terminal", shell_output("#{bin}/god")
  end
end
