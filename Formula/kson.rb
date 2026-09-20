class Kson < Formula
  desc "JSON toolkit with jq-compatible queries"
  homepage "https://github.com/fajarnuha/kson"
  url "https://github.com/fajarnuha/kson/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "5bacdbb7d616b4058e96eaf698d0344dd9d057a87ae1a07a9cdabf1f70a6937d"
  license "Apache-2.0"

  depends_on :macos

  resource "binary" do
    on_arm do
      url "https://github.com/fajarnuha/kson/releases/download/v0.3.3/kson-macos-arm64.tar.gz"
      sha256 "c2521dbf5fa391adbf380252784eec2efe8729f1b749bf90aed3b94ee613c1d3"
    end

    on_intel do
      url "https://github.com/fajarnuha/kson/releases/download/v0.3.3/kson-macos-x64.tar.gz"
      sha256 "3fb662f6f108abb541de661daf6df51c626f7413093119198db308e6df19021c"
    end
  end

  def install
    resource("binary").stage do
      bin.install "kson"
      pkgshare.install "LICENSE"
    end
  end

  test do
    assert_equal "kson #{version}", shell_output("#{bin}/kson --version").strip
    (testpath/"input.json").write('{"answer":42}')
    assert_equal "42", shell_output("#{bin}/kson -r .answer #{testpath}/input.json").strip
  end
end
