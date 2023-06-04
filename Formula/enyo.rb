class Enyo < Formula
  desc "Cyber swiss army knife for terminal"
  homepage "https://github.com/virzz/virzz"
  url "https://github.com/virzz/virzz.git",
      tag:      "v0.1.10",
      revision: "48882e703a9ab20268b613d15973a0ca67937b71"
  license "MIT"
  head "https://github.com/virzz/virzz.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "run", "./internal/_compile", "-R", "-V", version.to_s, "-G", Utils.git_head.to_s, "enyo"
    bin.install "build/enyo" => "enyo"
  end

  test do
    assert_match "The Cyber Swiss Army Knife for terminal", shell_output("#{bin}/enyo")
  end
end
