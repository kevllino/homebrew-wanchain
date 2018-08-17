# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Wanchain < Formula
  desc "wanchain block chain main code"
  homepage "https://github.com/kevllino/go-wanchain"
  url "https://github.com/wanchain/go-wanchain/archive/v1.0.4.tar.gz"
  version "1.0.4"
  sha256 "d86806163114698335c33db25a4c09bdf2c8ee00f7cd0d79e1cff0c004c0f814"

  devel do
    url 'https://github.com/kevllino/go-wanchain.git', :branch => 'master'
  end

  # Require El Capitan at least
  depends_on :macos => :el_capitan

  depends_on :xcode => :build

  depends_on 'go' => :build

  def install
    ENV["GOROOT"] = "#{HOMEBREW_PREFIX}/opt/go@1.10/libexec"
    system "go", "env" # Debug env
    system "make", "all"
    bin.install 'build/bin/gwan'
  end

  test do
    system "#{HOMEBREW_PREFIX}/bin/gwan", "--version"
  end
end

