# Discovery — 何を作るかを決める

> **このフェーズの目的**: 曖昧なアイデアを「解くべき問題」に絞る。コードを書かない。
>
> **使い方**: このファイルを `docs/discovery-XXX.md` にコピーして記入する。
> オリジナル（`.harness/templates/discovery.md`）は編集しない。

---

## Idea
<!-- やりたいことを1〜3文で。うまく書けなくていい -->


## Problem
<!-- 何が不満か、何を改善したいか -->


## Target user
<!-- 誰が使うか -->


## Constraints
<!-- 時間・技術・運用の制約 -->


## Options
<!-- 候補案を2〜3個。片方が明らかに優れていても書く -->

- A:
- B:
- C:

## Open questions
<!-- まだ決まっていないこと -->

- [ ]
- [ ]

## Next decision
<!-- 次に決めるべきこと1つだけ -->


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
