# Task-002 — Base layout / Header / Footer を実装する

## Task
全ページ共通の Base layout コンポーネント、ナビゲーションヘッダー、フッターを実装する。

## Context
Task-001 のプロジェクト初期化完了後に着手する。全ページがこのレイアウトを継承するため、ページ実装（Task-003）の前に完結させる必要がある。

## Read first

- [ ] `docs/specs/site.md`
- [ ] `tasks/active/task-001.md`（完了済みであること確認）

## Constraints

- してはいけない: 重いアニメーションライブラリを追加する
- 守ること: White background / Clean typography / Minimal spacing のデザイン方針
- 守ること: 英語メイン。日本語はフッターのリンクのみ

## Acceptance criteria

- [ ] `src/layouts/BaseLayout.astro` が存在する
- [ ] ナビゲーションに Home / About / Work / Blog の4リンクが表示される
- [ ] フッターに GitHub リンクと Japanese posts（`/ja/blog` へのリンク）が表示される
- [ ] 全ページで共通レイアウトが適用できる構造になっている
- [ ] `npm run build` がエラーなく通る

## Verification

```zsh
npm run build
npm run dev
# ブラウザで http://localhost:4321 を確認しナビゲーション・フッターの表示を目視確認
```

## Deliverables

- 作成するファイル: `src/layouts/BaseLayout.astro`, `src/components/Header.astro`, `src/components/Footer.astro`
- 変更するファイル: なし

## Out of scope

- 各ページのコンテンツ実装（Task-003 で行う）
- Cloudflare Pages の設定（Task-004 で行う）

---

## Status

- 状態: `done`
- 最終更新: 2026-05-10
- 進捗メモ: 全 Acceptance criteria Pass。`npm run build` 成功。

## Decision log

| 日付 | 判断内容 | 理由 |
|---|---|---|
| 2026-05-10 | `src/pages/index.astro` を BaseLayout 使用に変更した | Deliverables 外だが、ビルド検証に必要。コンテンツは Task-003 で上書きする |
| 2026-05-10 | GitHub URL を `https://github.com/yukiigarashi-dev` に設定 | git config の user 名から特定 |
