class God < Formula
  desc "Cyber swiss army knife for terminal"
  homepage "https://github.com/virzz/virzz"
  url "https://github.com/virzz/virzz/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "027a796d86a7e70ced8ca25c9b415d7cb94fcb3b515e54a94fdecd092a96f4eb"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/virzz/virzz"
    sha256 cellar: :any_skip_relocation, monterey:     "5a7d43e831f2b2df2f149d53ff0c095b34f1296a6b3f5b74de6f2769c6eb5f3f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "02ca1b8a40234479ca5e03c02d580c03c135aae96c4c3692fc8981bfb3cb3924"
  end

  depends_on "go"

  def install
    system "go", "run", "./cli/_compile", "-R", "god"
    bin.install "build/god" => "god"
    generate_completions_from_executable(bin/"god", "completion", shells: [:bash, :zsh])
  end

  test do
    assert_match "The Cyber Swiss Army Knife for terminal", shell_output("#{bin}/god")
  end
end
