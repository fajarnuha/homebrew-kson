class Kson < Formula
  desc "JSON toolkit with jq-compatible queries"
  homepage "https://github.com/fajarnuha/kson"
  version "0.3.2"
  license "Apache-2.0"

  depends_on :macos

  on_arm do
    url "https://github.com/fajarnuha/kson/releases/download/v0.3.2/kson-macos-arm64.tar.gz"
    sha256 "21d40f143f214bfbe766a0a1810a172b9fbf78b95254eed42445f4e735e5d548"
  end

  on_intel do
    url "https://github.com/fajarnuha/kson/releases/download/v0.3.2/kson-macos-x64.tar.gz"
    sha256 "5742504a821c3600f607d4d68b8680e04dd8d6afe4328c7d6d768cd33a36ffbd"
  end

  def install
    bin.install "kson"
    pkgshare.install "LICENSE"
  end

  test do
    assert_equal "kson #{version}", shell_output("#{bin}/kson --version").strip
    (testpath/"input.json").write('{"answer":42}')
    assert_equal "42", shell_output("#{bin}/kson -r .answer #{testpath}/input.json").strip
  end
end
