class Enyo < Formula
  desc "Cyber swiss army knife for terminal"
  homepage "https://github.com/virzz/virzz"
  url "https://github.com/virzz/virzz.git",
      tag:      "v0.1.9",
      revision: "c64de5bf7e7d235f5499271544b08ab48bcfa40b"
  license "MIT"
  head "https://github.com/virzz/virzz.git", branch: "master"

  bottle do
    root_url "http://virzz-img.ctfhub.com/tools/virzz"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "aaee781cc2d678beae6f4970656ecc59f5b7d162c6f56a73e4fa28ba0fddbbee"
    sha256 cellar: :any_skip_relocation, monterey:     "ac515321876a8de871680bf3b1face34789d1d50ce54dd382dd6a992c48d3103"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5ecfc64a3fdd05b5e3a30f20a6126151f21c6140cf04823a01f429bf0c4aee97"
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
