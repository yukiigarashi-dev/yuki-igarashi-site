# Task-004 — Cloudflare Pages + GitHub 連携を設定する

## Task
Cloudflare Pages と GitHub リポジトリを連携し、`main` ブランチへの push で自動デプロイされる状態にする。

## Context
Task-003 の全ページ実装完了後に着手する。このタスクは GUI 操作が含まれるためエージェントが直接実行できない手順がある。手順書に従って人が設定する。

## Read first

- [ ] `docs/specs/site.md`
- [ ] `tasks/active/task-003.md`（完了済みであること確認）

## Constraints

- してはいけない: `wrangler.toml` 等で不要なサーバーサイド設定を追加する
- 守ること: 静的サイト配信のみ。Pages Functions は使わない

## Acceptance criteria

- [ ] Cloudflare Pages プロジェクトが作成されている
- [ ] GitHub リポジトリと連携され、`main` push で自動デプロイが走る
- [ ] `yuki-igarashi.pages.dev` でサイトが閲覧できる
- [ ] ビルドコマンドが `npm run build`、出力ディレクトリが `dist` に設定されている
- [ ] デプロイログにエラーがない

## Verification

```zsh
# GitHub に push してデプロイが走ることを確認
git push origin main
# Cloudflare Pages のデプロイログを確認
# https://yuki-igarashi.pages.dev にアクセスしてサイトが表示されることを確認
```

## Deliverables

- 作成するファイル: なし（GUI 設定のみ）
- 変更するファイル: なし

## Out of scope

- カスタムドメインの設定
- 環境変数の設定（現時点で不要）

---

## Cloudflare Pages 設定手順（人が実施）

1. [Cloudflare Dashboard](https://dash.cloudflare.com/) にログイン
2. Workers & Pages → Create → Pages → Connect to Git
3. GitHub リポジトリを選択
4. ビルド設定:
   - Framework preset: Astro
   - Build command: `npm run build`
   - Build output directory: `dist`
5. Save and Deploy

---

## Status

- 状態: `not_started`
- 最終更新: 2026-05-10
- 進捗メモ:

## Decision log

| 日付 | 判断内容 | 理由 |
|---|---|---|
| | | |
