class God < Formula
  desc "Cyber swiss army knife for terminal"
  homepage "https://github.com/virzz/virzz"
  url "https://github.com/virzz/virzz.git",
      tag:      "v0.1.7",
      revision: "f3d6c0f01d04b19825174446fc5b97b65f0aa9f7"
  license "MIT"
  head "https://github.com/virzz/virzz.git", branch: "master"

  bottle do
    root_url "http://virzz-img.ctfhub.com/tools/virzz"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "8cce02474a11d7d505085d7ce8a4f44e747080a4d7087592743ae5eeb28b77ad"
    sha256 cellar: :any_skip_relocation, monterey:      "d9b3efa5e55a27cbbfc5bfd82494b5b1c987730b8fc4d2be81e7414717f9eb35"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "824eb0e3fa0561cc3fdf4bae78bced94b179e6a278472e253a7488692e25030e"
  end

  depends_on "go" => :build

  def install
    system "go", "run", "./internal/_compile", "-R", "-V", version.to_s, "-G", Utils.git_head.to_s, "god"
    bin.install "build/god" => "god"
  end

  test do
    assert_match "The Cyber Swiss Army Knife for terminal", shell_output("#{bin}/god")
  end
end
