# CLAUDE.md

AIエージェント向けのプロジェクト地図。
タスクを受け取る前に必ずこのファイルを読め。
**詳細はここに書かない。このファイルはポインタ集。**

---

## 今どこにいるか確認する

```
何をしているか                      → 読むべきファイル
───────────────────────────────────────────────────────
開発環境・パスを確認したい          → .harness/env.md
アイデア段階・何を作るか迷っている  → docs/discovery-*.md
仕様を固めている                    → docs/specs/*.md
タスクを実装している                → tasks/active/task-XXX.md（担当分）
アーキテクチャを理解したい          → docs/architecture.md
過去の設計判断を知りたい            → docs/adr/
ドキュメントの鮮度・品質を確認      → docs/quality.md
```

---

## リポジトリ構成

```
your-project/
├── CLAUDE.md                    # このファイル（地図）
├── .harness/                    # git submodule: ai-harness（テンプレート・ハーネスルール）
│   ├── env.md                   # 開発環境の定義（OS・シェル・パス等）
│   └── templates/
│       ├── discovery.md
│       ├── definition.md
│       └── task.md
├── docs/
│   ├── architecture.md          # ドメイン構成・レイヤー依存関係の地図 ※要作成
│   ├── quality.md               # 各ドメインの品質状況・既知の負債 ※要作成
│   ├── discovery-*.md           # Discoveryフェーズの記録
│   ├── specs/                   # Definitionフェーズの完成仕様
│   └── adr/                     # Architecture Decision Records
├── tasks/
│   ├── active/                  # 進行中のタスク
│   ├── done/                    # 完了済みタスク（参照用に残す）
│   └── plan-*.md                # 複数タスクにまたがる実行計画
└── src/
```

---

## フェーズとテンプレート

| フェーズ | 目的 | テンプレート |
|---|---|---|
| Discovery | 何を作るか決める | `.harness/templates/discovery.md` |
| Definition | 実装可能な仕様にする | `.harness/templates/definition.md` |
| Execution | 実装する | `.harness/templates/task.md` → `tasks/active/task-XXX.md` |

フェーズの詳細・プロンプト集はそれぞれのテンプレートファイルに書いてある。

---

## 運用フロー（概要）

```
discovery → definition → タスク分割 → 実装 → 完了後 tasks/done/ へ移動
                                              ↓
                                    詰まったら → ハーネス改善プロンプトを使う
                                              ↓
                                    定期的に  → ガベージコレクションを回す
```

詳細手順は `.harness/templates/` の各ファイルを参照。

---

## エージェントへの共通ルール

- Discovery・Definition フェーズではコードを書くな
- 指示なく既存ファイルを削除するな
- 実装前に Read first を全部読め
- Acceptance criteria を満たさないまま完了と言うな
- Verification を実行して結果を示せ
- Out of scope には手を出すな
- 判断が必要なときは作業を止めて確認しろ
- **エージェントが詰まった原因はハーネスの欠陥として記録しろ**（task.mdのPrompt E参照）

---

## 検証コマンド

```zsh
# Install dependencies
npm install

# Start local development
npm run dev

# Build production site
npm run build

# Preview production build
npm run preview

---

```md
## プロジェクト固有の設定
<!-- ここより下はプロジェクトごとに書き換える -->

- 言語 / FW: Astro + TypeScript + Tailwind CSS
- 触ってはいけないファイル: package-lock.json（依存追加時以外は不要変更禁止）, astro.config.*, tsconfig.json
- 依存関係のルール: 必要最小限。重いCMS・不要なUIライブラリ追加禁止。静的サイト前提。
- その他の制約: 英語メイン / 日本語記事は `/ja/blog` のみ。白基調・ミニマルデザイン維持。Cloudflare Pages静的配信前提。
```
