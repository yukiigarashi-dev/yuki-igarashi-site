# Task-001 — Astro プロジェクトを初期化する

## Task
Astro + TypeScript + Tailwind CSS の構成でプロジェクトを初期化し、`npm run build` が通る状態にする。

## Context
現在リポジトリには src/ が存在しない。全実装の土台となるため最初に完結させる必要がある。

## Read first

- [ ] `docs/specs/site.md`
- [ ] `.harness/env.md`

## Constraints

- してはいけない: `package-lock.json` を不要に変更する（依存追加時以外は触るな）
- してはいけない: `astro.config.*` `tsconfig.json` を勝手に変更する
- 守ること: 依存は必要最小限。重いUIライブラリを追加するな

## Acceptance criteria

- [ ] `npm install` が成功する
- [ ] `npm run dev` でローカルサーバーが起動する
- [ ] `npm run build` がエラーなく完了する
- [ ] Astro / TypeScript / Tailwind CSS が依存に含まれている
- [ ] `src/` ディレクトリが存在する

## Verification

```zsh
npm install
npm run build
```

## Deliverables

- 作成するファイル: `package.json`, `astro.config.*`, `tsconfig.json`, `tailwind.config.*`, `src/` 配下の初期ファイル群
- 変更するファイル: なし

## Out of scope

- ページコンポーネントの実装（Task-003 で行う）
- レイアウト・ヘッダー・フッターの実装（Task-002 で行う）
- Cloudflare Pages の設定（Task-004 で行う）

---

## Status

- 状態: `done`
- 最終更新: 2026-05-10
- 進捗メモ: 全 Acceptance criteria Pass。`npm run build` 成功。

## Decision log

| 日付 | 判断内容 | 理由 |
|---|---|---|
| 2026-05-10 | `tailwind.config.*` は作成しなかった | Tailwind CSS v4 は CSS ファイルへの `@import "tailwindcss"` が正式な設定方法であり、config ファイルは不要 |
| 2026-05-10 | Tailwind CSS v4 + `@tailwindcss/vite` を採用 | v4 が現行の安定版。Astro 5 との組み合わせで Vite plugin 経由が推奨構成 |
