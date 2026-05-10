# Task-003 — 全ページとブログ機能を実装する

## Task
Home / About / Work / Blog の各ページと、英語・日本語ブログのルーティング・記事表示を実装する。

## Context
Task-002 の Base layout 完了後に着手する。サイトの全コンテンツページを一括で実装する。ブログは Markdown ファイルを `content/blog/en/` と `content/blog/ja/` に置くだけで記事が追加できる構成にする。

## Read first

- [ ] `docs/specs/site.md`
- [ ] `tasks/active/task-002.md`（完了済みであること確認）

## Constraints

- してはいけない: CMS・検索機能を追加する
- してはいけない: 画像を外部CDNから読み込む（repo管理のみ）
- 守ること: コンテンツは `content/blog/en/` と `content/blog/ja/` に Markdown で管理する
- 守ること: `/ja/blog` 以外は英語

## Acceptance criteria

- [ ] `/` に "Yuki Igarashi" / "BPR & ITGC Senior Associate" / Summary テキストが表示される
- [ ] `/about` にキャリアサマリー・専門領域・タイムライン・学歴が表示される
- [ ] `/work` に "Selected work will be added here." が表示される
- [ ] `/blog` に英語記事一覧が表示される（記事なし時は "No posts yet."）
- [ ] `/ja/blog` に日本語記事一覧が表示される（記事なし時は "まだ記事はありません。"）
- [ ] `content/blog/en/` に Markdown を置くと `/blog/[slug]` で表示される
- [ ] `content/blog/ja/` に Markdown を置くと `/ja/blog/[slug]` で表示される
- [ ] `npm run build` がエラーなく通る

## Verification

```zsh
npm run build
npm run dev
# 以下を目視確認:
# http://localhost:4321/
# http://localhost:4321/about
# http://localhost:4321/work
# http://localhost:4321/blog
# http://localhost:4321/ja/blog
```

## Deliverables

- 作成するファイル:
  - `src/pages/index.astro`
  - `src/pages/about.astro`
  - `src/pages/work.astro`
  - `src/pages/blog/index.astro`
  - `src/pages/blog/[slug].astro`
  - `src/pages/ja/blog/index.astro`
  - `src/pages/ja/blog/[slug].astro`
  - `content/blog/en/`（ディレクトリ）
  - `content/blog/ja/`（ディレクトリ）
- 変更するファイル: なし

## Out of scope

- Work ページへの実績コンテンツ追加（プレースホルダーのみ）
- RSS / OG画像 / タグ / ダークモード
- Cloudflare Pages の設定（Task-004 で行う）

---

## Status

- 状態: `done`
- 最終更新: 2026-05-10
- 進捗メモ: 全 Acceptance criteria Pass。`npm run build` 成功、5ページ生成。

## Decision log

| 日付 | 判断内容 | 理由 |
|---|---|---|
| 2026-05-10 | Astro 5 Content Layer API（`src/content.config.ts` + `glob` loader）を採用 | ルートの `content/blog/en/` と `content/blog/ja/` を直接指定できる。レガシー `src/content/` 方式より spec に忠実 |
| 2026-05-10 | 空コレクション時の WARN は無視 | ビルドは Complete。記事ゼロ = `[slug].astro` のルートがゼロ件は正常動作 |
| 2026-05-10 | `content/blog/en|ja/.gitkeep` を追加 | 空ディレクトリを git で追跡するため |
