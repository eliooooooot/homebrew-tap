class Picky < Formula
  desc "Interactive file selector with token counting for LLM context management"
  homepage "https://github.com/eliooooooot/picky"
  url "https://github.com/eliooooooot/picky/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6fbf0e55b9c62f070dc9cefffffa64e4fea1adf5cb2caf87fd77f30be1377950"
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