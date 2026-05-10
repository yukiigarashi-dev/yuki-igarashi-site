# Discovery — 何を作るかを決める

> **このフェーズの目的**: 曖昧なアイデアを「解くべき問題」に絞る。コードを書かない。
>
> **使い方**: このファイルを `docs/discovery-XXX.md` にコピーして記入する。
> オリジナル（`.harness/templates/discovery.md`）は編集しない。

---

## Idea
Build a minimal personal portfolio and blog site for Yuki Igarashi.
Use it as a professional online presence to summarize career background, selected work, and future writing.

## Problem
LinkedIn等に散在する実績・文章を自分でコントロールできる場所に集約できていない。プラットフォームに依存せず、自分の言葉で自分を定義する場がない。

## Target user
Primary: Recruiters, professional connections, clients, and peers.
Secondary: Anyone interested in BPR, ITGC, governance, or selected blog content.

## Constraints
Free or near-free operation using GitHub + Cloudflare Pages.
Static site only, minimal maintenance, no CMS, English-first, lightweight and scalable.

## Options

- A: Astro + Markdown/MDX + Cloudflare Pages
- B: Next.js + Cloudflare/Vercel
- C: WordPress / CMS-based site

## Problem hypotheses（2026-05-10 分析）
> Problemが複数の関心事を混在させているため、以下3パターンを仮説として提示。1つに絞ること。

- **A: 機会損失問題** — 採用担当・クライアントが検索したとき信頼できる一次情報源がなく、判断を保留される。"見つかっても判断されない" が本質。
- **B: コンテンツ分散問題** ✅ **採用** — 実績・文章がLinkedIn等に散在し自分でコントロールできない。"持ち物が自分のものではない" が本質。
- **C: 専門性可視化問題** — BPR・ITGC・ガバナンスという説明が難しい領域での専門家として、文章で差別化できる場がない。"言葉で差別化できていない" が本質。

## Open questions

### 今決めるべき
- [x] サイトの第一目的 → **B: コンテンツ集約（2026-05-10 決定）**
- [x] Initial Work page → プレースホルダー "Selected work will be added here." で初期リリース（2026-05-10 決定）

### 後回しでいい
- [ ] Final visual identity の細部（タイポグラフィ・スペーシング・アクセント）— 白基調・ミニマルは制約として確定済み、実装中に反復できる

## Next decision
**Definition に進む。** 今決めるべき Open questions はすべて解決済み。

---

## Exit criteria — Definition に進む条件

- [ ] 解くべき問題が1文で言える
- [ ] 誰が使うか言える
- [ ] やらないことが1つ以上言える
- [ ] 候補案が2つ以上ある
- [ ] 次に決めることが明確

---

## AI Prompts

> **使い方**: このファイルをエージェントに読み込ませてから、該当プロンプトをそのまま投げる。
>
> ```zsh
> # Claude Code
> claude --file docs/discovery-XXX.md
>
> # Gemini CLI
> gemini --context docs/discovery-XXX.md
> ```

---

### Prompt A｜論点整理（最初にこれ）

```
このdiscovery.mdを読んで、次をやれ。
1. Problemが曖昧なら「本当の問題は何か」を3パターン仮説として出せ
2. Open questionsを「今決めるべき」「後回しでいい」に分けろ
3. Next decisionを1つに絞って更新しろ
コードは書くな。
```

---

### Prompt B｜案の比較

```
このdiscovery.mdのOptionsを読んで、次をやれ。
各案について:
- メリット（具体的に）
- デメリット（具体的に）
- どんな優先度・制約のときに選ぶか
を表形式で比較しろ。
推奨案を1つ出し、理由を2文で言え。
コードは書くな。
```

---

### Prompt C｜Exit criteria の確認

```
このdiscovery.mdのExit criteriaを1つずつ確認しろ。
満たしていない項目は何が足りないかを具体的に指摘しろ。
全部満たしていたら「Definitionに進んでいい」と言え。
コードは書くな。
```

---

### Prompt D｜definition.md の下書き生成

```
このdiscovery.mdを読んで、definition.mdの下書きを生成しろ。
埋められる項目だけ埋め、不明な項目は「TBD: （理由）」と書け。
出力先: docs/specs/（機能名）.md
コードは書くな。
```
