class Picky < Formula
  desc "Interactive file selector with token counting for LLM context management"
  homepage "https://github.com/eliooooooot/picky"
  url "https://github.com/eliooooooot/picky/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d5c3e20b895899dc85fe641ad63b10614ac98ba2aebf5117e4178799ca083b0c"
  license "MIT"
  head "https://github.com/eliooooooot/picky.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/picky"
  end

  test do
    # Test that the binary executes
    assert_match "picky", shell_output("#{bin}/picky --help 2>&1", 1)
  end
end