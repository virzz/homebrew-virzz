class Enyo < Formula
  desc "Cyber swiss army knife for terminal"
  homepage "https://github.com/virzz/virzz"
  url "https://github.com/virzz/virzz.git",
      tag:      "v0.1.10",
      revision: "48882e703a9ab20268b613d15973a0ca67937b71"
  license "MIT"
  head "https://github.com/virzz/virzz.git", branch: "master"

  bottle do
    root_url "http://virzz-img.ctfhub.com/tools/virzz"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "f756d7315bca80cab395aa7f85138837c80047bee52844a78a3a827ed0e63a20"
    sha256 cellar: :any_skip_relocation, monterey:      "cfaa96060f790d1c25c63ead7ea9af6e9b9e75b319781cef7ccfb059b6f514e5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ec392eccc32370ade0f82d573c90194c84a1ec2b821c3b1edb994b6116c72b12"
  end

  depends_on "go" => :build

  def install
    system "go", "run", "./internal/_compile", "-R", "-V", version.to_s, "-G", Utils.git_head.to_s, "enyo"
    bin.install "build/enyo" => "enyo"
  end

  test do
    assert_match "The Cyber Swiss Army Knife for terminal", shell_output("#{bin}/enyo")
  end
end
