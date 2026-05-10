# Definition — yuki-igarashi-site

> discovery.md の全 Exit criteria 通過済み（2026-05-10）

---

## Goal

LinkedIn等に散在する実績・文章を、自分がコントロールできる静的サイトに集約して公開できるようになる。

## Non-goals

- やらない: CMS導入（Markdown直書きで管理）
- やらない: 検索機能（初期リリーススコープ外）
- やらない: ダークモード（後回し）
- やらない: RSS / OG画像自動生成 / タグ（将来オプション）
- やらない: 動的サーバーサイド処理（静的配信のみ）

## User flow

1. 訪問者が `yuki-igarashi.pages.dev` にアクセスする
2. Home でプロフィールと概要を確認する
3. About / Work / Blog の各ページに遷移して詳細を参照する
4. フッターから GitHub または日本語ブログへ移動する
5. ブログ記事は `/blog/[slug]`（英語）または `/ja/blog/[slug]`（日本語）で読む

## Acceptance criteria

- [ ] `/` に名前・役職・Summary が表示される
- [ ] `/about` にキャリアサマリー・専門領域・タイムライン・学歴が表示される
- [ ] `/work` に "Selected work will be added here." が表示される
- [ ] `/blog` に英語記事一覧が表示される（初期は "No posts yet."）
- [ ] `/ja/blog` に日本語記事一覧が表示される（初期は "まだ記事はありません。"）
- [ ] `/blog/[slug]` で英語 Markdown 記事が表示される
- [ ] `/ja/blog/[slug]` で日本語 Markdown 記事が表示される
- [ ] ナビゲーションに Home / About / Work / Blog が表示される
- [ ] フッターに GitHub リンクと Japanese posts リンクが表示される
- [ ] Cloudflare Pages にデプロイされ、GitHub push で自動更新される
- [ ] `npm run build` がエラーなく完了する

## Technical decisions

- 言語 / FW: Astro + TypeScript + Tailwind CSS
- ホスティング: Cloudflare Pages（GitHub連携・自動デプロイ）
- コンテンツ管理: Markdown / MDX、`content/blog/en/` と `content/blog/ja/` に配置
- 画像管理: リポジトリ内管理（将来 R2 移行オプション）
- DB / ストレージ: なし（静的サイト）
- 外部依存: なし（検索・CMS・外部API不使用）
- ファイル構成:
  ```
  src/
    pages/
      index.astro
      about.astro
      work.astro
      blog/
        index.astro
        [slug].astro
      ja/
        blog/
          index.astro
          [slug].astro
    layouts/
    components/
  content/
    blog/
      en/
      ja/
  ```

## Risks

- リスク: Astro の i18n ルーティング設定ミスで `/ja/blog` が壊れる（対策: 実装前にルーティング設計を先に確認する）
- リスク: Tailwind の設定不備で本番ビルド時にスタイルが消える（対策: `npm run build` を毎ステップ後に実行して確認する）

## Dependencies

- GitHub リポジトリ（作成済み）
- Cloudflare Pages アカウント（接続設定が必要）
- Node.js / npm

## Unknowns

- [x] Cloudflare Pages の GitHub 連携 → 未設定。Step 4 で初期セットアップが必要（実装開始には支障なし）

---

## Exit criteria — Execution に進む条件

- [x] Goal が1文で言える
- [x] Non-goals が2つ以上ある
- [x] Acceptance criteria が全部テスト可能な形で書かれている
- [x] Technical decisions が埋まっている
- [x] Unknowns がゼロ、または実装開始に支障ない判断ができている

---

## 実装順（Step）

1. Astro プロジェクト作成
2. Base layout / Header / Footer
3. Home / About / Work / Blog（各ページ）
4. Cloudflare Pages + GitHub 連携

## 将来追加候補

RSS / OG画像自動生成 / ダークモード / タグ / R2
