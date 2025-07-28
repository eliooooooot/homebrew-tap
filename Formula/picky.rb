class Picky < Formula
  desc "Interactive file selector with token counting for LLM context management"
  homepage "https://github.com/eliooooooot/picky"
  url "https://github.com/eliooooooot/picky/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "27be05027311439cd373db8c08173eeba0d185d56bc114ffaf8223a9079364dd"
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