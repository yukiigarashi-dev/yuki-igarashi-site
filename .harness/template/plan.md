# Plan — 複数タスクにまたがる実行計画

> **目的**: definition.mdから分割された複数タスクの依存関係・順序・状態を管理する。
> 1タスクだけなら不要。3タスク以上になったらこれを作る。
>
> **使い方**: このファイルを `tasks/plan-XXX.md` にコピーして記入する。
> definition.md の Prompt D でタスク分割と同時に生成するとよい。
> オリジナル（`.harness/templates/plan.md`）は編集しない。

---

## Goal
<!-- このプランで実現すること。definition.mdのGoalをそのまま引用してよい -->


## Related spec
<!-- 対応するdefinition.mdのパス -->

`docs/specs/`

---

## Task list

<!-- 依存関係がある場合は順番を守る。並列実行できるものは同じ番号でいい -->

| # | タスクファイル | 概要 | 状態 | 依存 |
|---|---|---|---|---|
| 1 | tasks/active/task-001.md | | `not_started` | なし |
| 2 | tasks/active/task-002.md | | `not_started` | #1 |
| 3 | tasks/active/task-003.md | | `not_started` | #1 |

状態の値: `not_started` / `in_progress` / `blocked` / `done`

---

## Decision log
<!-- プラン全体に関わる判断を記録する。個別タスクの判断はtask.mdに書く -->

| 日付 | 判断内容 | 理由 |
|---|---|---|
| | | |

---

## Blockers
<!-- 現在ブロックされている事項。解消したら消す -->


---

## AI Prompts

---

### Prompt A｜プラン開始時の確認

```
このplan.mdを読んで、次をやれ。
1. Task listの依存関係を確認し、今着手できるタスクを特定しろ
2. 各タスクのtask.mdを読んで、Read firstで指定されたファイルを全部読め
3. プラン全体で共有すべき制約・前提があればDecision logに追記しろ
確認が終わったら「task-XXXから開始します」と言え。
```

---

### Prompt B｜進捗更新

```
このplan.mdとtasks/active/を読んで、次をやれ。
1. 各task.mdのStatusを確認し、Task listの状態を最新に更新しろ
2. 完了したタスクをtasks/done/に移動しろ
3. 次に着手できるタスクを特定しろ（依存が解消されたもの）
4. Blockersがあれば記録しろ
更新後のTask listを表示しろ。
```

---

### Prompt C｜プラン完了確認

```
このplan.mdを読んで、次をやれ。
1. 全タスクがdoneになっているか確認しろ
2. Related specのAcceptance criteriaを全部満たしているか確認しろ
3. Decision logに記録されていない重要な判断がないか確認しろ
4. tasks/active/に残ったファイルをtasks/done/に移動しろ
全部完了したら「このプランは完了です」と言え。未完了があれば指摘しろ。
```
