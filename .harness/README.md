# ai-harness

AIエージェント（Claude Code / Codex / Gemini CLI）と開発するときのテンプレートとプロンプト集。

各プロジェクトにgit submoduleとして組み込んで使う。

---

## 構成

```
ai-harness/
├── README.md
├── CLAUDE.md                    # エージェント向け地図テンプレート（プロジェクトにコピーして使う）
├── env.md                       # 開発環境の定義（OS・シェル・パス・ツール）
├── templates/
│   ├── discovery.md             # フェーズ1: 何を作るか決める
│   ├── definition.md            # フェーズ2: 実装可能な仕様にする
│   ├── task.md                  # フェーズ3: 実装タスク1つ（Status・Decision log付き）
│   ├── plan.md                  # フェーズ3: 複数タスクの実行計画
│   └── gc.md                    # 定期メンテ: ドキュメント腐敗・制約違反の検出
└── docs/
    └── harness-adr/             # ハーネス自体の設計変更メモ
        └── adr-001-template.md
```

---

## 各プロジェクトへの組み込み方

### 1. submoduleとして追加

```zsh
cd your-project
git submodule add git@github.com:yukiigarashi-dev/ai-harness.git .harness
```

`.harness/`という名前で置くことで、プロジェクト本体のコードと視覚的に分離できる。

### 2. setup.shで初期化（推奨）

```zsh
zsh .harness/setup.sh
```

CLAUDE.mdのコピー・必要なディレクトリの作成を自動でやる。

### 3. CLAUDE.mdにプロジェクト固有の設定を追記

コピーされたCLAUDE.mdの末尾「プロジェクト固有の設定」を書き換える。

---

## テンプレートの使い分け

| テンプレート | いつ使うか | 置き場所 |
|---|---|---|
| discovery.md | アイデアを整理するとき | `docs/discovery-XXX.md` |
| definition.md | 仕様を固めるとき | `docs/specs/feature-name.md` |
| task.md | 実装タスク1つ | `tasks/active/task-XXX.md` |
| plan.md | タスクが3つ以上になるとき | `tasks/plan-XXX.md` |
| gc.md | 定期メンテ（2週間に1回目安） | コピー不要・直接参照 |

テンプレートはコピーして使う。`.harness/templates/`のオリジナルは編集しない。

---

## ハーネスの更新方法

```zsh
# ハーネス本体を更新
cd ai-harness
git add .
git commit -m "update: （何を変えたか）"
git push

# 各プロジェクト側で最新を取り込む
cd your-project
git submodule update --remote .harness
git add .harness
git commit -m "harness: update to latest"
```

---

## フェーズ早見表

| 状態 | 使うテンプレート | AIへの指示 |
|---|---|---|
| アイデアがぼんやりしている | discovery.md | 論点整理・案の比較 |
| 何を作るかは決まった | definition.md | 仕様補完・タスク分割 |
| タスクが1〜2個 | task.md | 実装・検証 |
| タスクが3個以上 | plan.md + task.md | 進捗管理・実装 |
| 久しぶりにリポジトリを触る | gc.md | ドキュメント鮮度チェック |

**Discoveryが終わる前にtask.mdを切らない。**
