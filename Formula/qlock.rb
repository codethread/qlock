# typed: false
# frozen_string_literal: true

class Qlock < Formula
  desc "Ticketed local command queues for agents and shells"
  homepage "https://github.com/codethread/qlock"
  url "https://github.com/codethread/qlock/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "bbc1c8373bfa8e3e6b23b2200fc21831176ebb618d4d383b93aefc8277f6adde"
  license "MIT"

  depends_on "oven-sh/bun/bun" => :build
  depends_on "git"

  conflicts_with "codethread/hive/hive", because: "both install a qlock executable"

  def fetch
    ENV["BUN_INSTALL_CACHE_DIR"] = buildpath/".bun-cache"
    system "bun", "install", "--frozen-lockfile", "--ignore-scripts"
  end

  def install
    system "bun", "run", "build"
    bin.install "dist/qlock"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/qlock --version").strip
    status = JSON.parse(shell_output("#{bin}/qlock status --json --lock #{testpath}/queue.lock"))
    assert_equal true, status.fetch("ok")
    assert_empty status.fetch("tickets")
    assert_equal "success", shell_output("#{bin}/qlock exec -w 0 --lock #{testpath}/queue.lock -- printf success")
    assert_match "command-queues", shell_output("#{bin}/qlock skills list")
    assert_match "# Merge queues", shell_output("#{bin}/qlock skills file command-queues references/merge-queues.md")
    system "git", "init", "-b", "main"
    merge = JSON.parse(shell_output("#{bin}/qlock status --json --merge-target main"))
    assert_equal true, merge.fetch("ok")
    assert_empty merge.fetch("tickets")
    refute_path_exists testpath/".beads"
    refute_path_exists testpath/"honeycomb.toml"
  end
end
