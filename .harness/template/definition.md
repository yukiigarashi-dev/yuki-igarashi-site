# Definition — 作るものを実装可能な単位にする

> **このフェーズの目的**: 曖昧なアイデアを、エージェントが実装できる粒度に変換する。
> discovery.md の Exit criteria が全部通ってからここに来る。
>
> **使い方**: このファイルを `docs/specs/feature-name.md` にコピーして記入する。
> オリジナル（`.harness/templates/definition.md`）は編集しない。

---

## Goal
<!-- 何を実現するか。「〜できるようになる」の形で1文 -->


## Non-goals
<!-- 今回やらないこと。スコープを守るために必ず書く -->

- やらない:
- やらない:

## User flow
<!-- 利用者がどう使うか。手順を箇条書き -->

1.
2.
3.

## Acceptance criteria
<!-- 何を満たせば完了か。テスト可能な形で書く -->

- [ ]
- [ ]
- [ ]

## Technical decisions
<!-- どう作るか。技術選定・アーキテクチャの決定事項 -->

- 言語 / FW:
- DB / ストレージ:
- 外部依存:
- ファイル構成の方針:

## Risks
<!-- 壊れやすい点・難しい部分 -->

- リスク: （対策: ）

## Dependencies
<!-- 依存するもの。外部API・既存コード・環境変数など -->


## Unknowns
<!-- 実装前に決める必要があること -->

- [ ]

---

## Exit criteria — Execution に進む条件

- [ ] Goal が1文で言える
- [ ] Non-goals が2つ以上ある
- [ ] Acceptance criteria が全部テスト可能な形で書かれている
- [ ] Technical decisions が埋まっている
- [ ] Unknowns がゼロ、または実装開始に支障ない判断ができている

---

## AI Prompts

> **使い方**: 記入済みの `docs/specs/feature-name.md` をエージェントに読み込ませてから投げる。

---

### Prompt A｜穴埋めチェック（最初にこれ）

```
このdefinition.mdを読んで、次をやれ。
1. 未記入・TBDの項目を列挙しろ
2. 各項目について「これが決まらないと何が困るか」を1文で言え
3. 今すぐ決めるべき順に並べ替えろ
コードは書くな。
```

---

### Prompt B｜Acceptance criteria の品質チェック

```
このdefinition.mdのAcceptance criteriaを読んで、次をやれ。
各項目について:
- テスト可能か（Yes/No）
- 曖昧な表現が含まれていないか
- 抜けているケースがないか
を指摘しろ。改善したAcceptance criteriaを書き直して返せ。
コードは書くな。
```

---

### Prompt C｜ADR のたたき台生成

```
このdefinition.mdのTechnical decisionsを読んで、
各決定事項のADRたたき台を生成しろ。

フォーマット:
## ADR-XXX: （タイトル）
- Status: Proposed
- Context: （なぜこの決定が必要か）
- Decision: （何を選んだか）
- Consequences: （トレードオフ）

出力先: docs/adr/adr-XXX-（タイトル）.md
コードは書くな。
```

---

### Prompt D｜タスク分割

```
このdefinition.mdを読んで、実装タスクに分割しろ。
タスクの分割基準:
- 1タスク = エージェントが1セッションで完結できる単位
- 依存関係がある場合は順番を明示しろ

各タスクを .harness/templates/task.md のフォーマットで生成しろ。
出力先: tasks/task-XXX.md（連番）
コードは書くな。
```
