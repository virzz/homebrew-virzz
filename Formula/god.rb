class God < Formula
  desc "Cyber swiss army knife for terminal"
  homepage "https://github.com/virzz/virzz"
  url "https://github.com/virzz/virzz/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "027a796d86a7e70ced8ca25c9b415d7cb94fcb3b515e54a94fdecd092a96f4eb"
  license "MIT"

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
