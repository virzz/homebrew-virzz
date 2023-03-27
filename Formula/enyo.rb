class Enyo < Formula
  desc "Cyber swiss army knife for terminal"
  homepage "https://github.com/virzz/virzz"
  url "https://github.com/virzz/virzz.git",
      tag:      "v0.1.8",
      revision: "372ec633730c75a0f51c9fb6fb914505032b6ad6"
  license "MIT"
  head "https://github.com/virzz/virzz.git", branch: "master"

  bottle do
    root_url "http://virzz-img.ctfhub.com/tools/virzz"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "bf0587f61326c193925a8759d4296314a463d8c699d0dd04d55e60c16279d35f"
    sha256 cellar: :any_skip_relocation, monterey:      "2382803df9d058c3b865870b7305dd4e80a98336dd1a30bd9636d0a60dcc34f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a49e4ccf8bb658019f8ccf80a85cfa306541f4ae4544f6aa7823c5979cc9c155"
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
