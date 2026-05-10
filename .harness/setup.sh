#!/bin/zsh
# setup.sh
# 新しいプロジェクトにai-harnessをsubmoduleとして追加するスクリプト
#
# 使い方:
#   cd your-project
#   zsh <(curl -s https://raw.githubusercontent.com/yourname/ai-harness/main/setup.sh)
#
# または ai-harness をローカルに clone 済みの場合:
#   zsh /path/to/ai-harness/setup.sh

set -e

HARNESS_REPO="https://github.com/yourname/ai-harness"
HARNESS_DIR=".harness"

echo "==> ai-harness setup"

# すでに submodule が存在するか確認
if [ -d "$HARNESS_DIR" ]; then
  echo "  [skip] $HARNESS_DIR already exists"
else
  echo "  [add] git submodule add $HARNESS_REPO $HARNESS_DIR"
  git submodule add "$HARNESS_REPO" "$HARNESS_DIR"
fi

# CLAUDE.md・AGENTS.md・GEMINI.md をプロジェクトルートにコピー（存在しない場合のみ）
for file in CLAUDE.md AGENTS.md GEMINI.md; do
  if [ -f "$file" ]; then
    echo "  [skip] $file already exists"
  else
    echo "  [copy] $file"
    cp "$HARNESS_DIR/$file" "$file"
  fi
done

echo ""
echo "  !! CLAUDE.md をコピーしました。"
echo "  !! 末尾の「プロジェクト固有の設定」を書き換えてください。"
echo "  !! AGENTS.md と GEMINI.md は CLAUDE.md へのポインタです。編集不要。"

# 必要なディレクトリを作成
for dir in docs/specs docs/adr tasks/active tasks/done; do
  if [ -d "$dir" ]; then
    echo "  [skip] $dir already exists"
  else
    echo "  [mkdir] $dir"
    mkdir -p "$dir"
    touch "$dir/.gitkeep"
  fi
done

echo ""
echo "==> 完了"
echo ""
echo "次のステップ:"
echo "  1. CLAUDE.md の末尾にプロジェクト固有の設定を追記する"
echo "  2. .harness/templates/discovery.md を docs/discovery-XXX.md にコピーして記入する"
echo "  3. エージェントに docs/discovery-XXX.md を読み込ませて Prompt A を投げる"
echo ""
echo "ハーネスの更新方法:"
echo "  git submodule update --remote .harness"
