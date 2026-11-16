# Review of StableMatching (pull request #2346 at 9784d8d)

**Verdict:** needs changes

## R01 (P3) — the LeanPool proof is not by induction on the number of men

**Location:** `TauCetiRoadmap/StableMatching/README.md:324–325`: "`LeanPool/ClassicalGraphColouring/Galvin/GaleShapley.lean` proves, by induction on the number of men, that stable matchings exist on finite markets".

**Claim:** The file's induction is on the number of acceptable pairs. The men `M` are fixed throughout.

**Witness:** `GaleShapley.lean:67` gives `∀ n E, {p : M × W | E p.1 p.2}.ncard = n → ∃ μ, IsStable E rm rw μ`, and line 70 is `induction n using Nat.strong_induction_on`. Line 78 deletes the one pair `(b, w)` from `E` and leaves `M` unchanged.

**Repair:** Replace the sentence with: "`LeanPool/ClassicalGraphColouring/Galvin/GaleShapley.lean` proves, by strong induction on the number of acceptable pairs, that stable matchings exist on finite markets whose acceptable pairs form one relation for both sides, as a step of Galvin's list-colouring theorem: the content of 1.2 without deferred acceptance."

## R02 (P3) — the description repeats the induction claim

**Location:** the description, **Provenance**: "its `ClassicalGraphColouring/Galvin/GaleShapley.lean` proves the existence of stable matchings (1.2), by induction on the number of men, as a step of Galvin's theorem."

**Claim:** The head's file proves this by induction on the number of acceptable pairs, as in R01.

**Witness:** `GaleShapley.lean:67–70` at `f8b9b72`. On Roth 2008, Example 1, the recursion keeps 3 men while the number of acceptable pairs falls 9 → 8 → 7 → 6 → 5.

**Repair:** Replace "by induction on the number of men" with "by strong induction on the number of acceptable pairs".

## Previous findings

- none: the review of `d789104` raised no finding.

## Verified sound

| Statement | Instances | Values computed (roadmap side / other side) | Result |
|---|---|---|---|
| Provenance: "by induction on the number of men" (`README.md:324`) | Roth 2008, Example 1 (`README.md:141–142`), run through `GaleShapley.lean`'s recursion | Men: 3, 3, 3, 3, 3. Acceptable pairs: 9 → 8 → 7 → 6 → 5, deleting `(m₃,w₁)`, `(m₁,w₂)`, `(m₂,w₁)`, `(m₂,w₂)` | false (R01) |
| same, the repair | same | The induction variable is `ncard` of `E`, which falls by one at each step. The base case returns `(m₁,w₁), (m₂,w₃), (m₃,w₂)`, as `README.md:142` states | holds |
| "the content of 1.2" (`README.md:326`), with the encoding `E m w :↔ rankM m (some w) < rankM m none ∧ rankW w (some m) < rankW w none` | 0.1's one-man, one-woman Check (`:86–88`) | `E` is empty, so the LeanPool `μ` is empty. The roadmap's only stable matching is empty | holds |
| same | the 2 × 2 market of 0.1 | No two men share a favourite, so the LeanPool `μ` is `(m₁,w₁), (m₂,w₂)`. This is stable for `Market.IsStable` (`Suggested.lean:70`) and is the DA outcome (`:143–144`) | holds |
| same, the general reduction | a blocking pair `(m, w)` of an individually rational `μ` | It gives `rankM m (some w) < rankM m (μ m) ≤ rankM m none`, and the same for `w`. So `E m w` and `¬ μ m w`, which contradicts LeanPool's stability clause (`GaleShapley.lean:34–35`) | holds |
| "nothing on 1.1, 1.3 or Layers 2–3" (`README.md:326`) | the 5 declarations of the file | `IsTop`, `IsStable`, `exists_isTop`, `isStable_of_removal` and `exists_isStable` include no algorithm, optimality, lattice, single-agent or incentive statement | holds |
| "a step of Galvin's list-colouring theorem" (`:325`) | `Galvin/Orientation.lean`, `Galvin/Galvin.lean` | `Orientation.lean:212` calls `exists_isStable`. `Galvin.lean:11` imports `Orientation`, and line 49 states `Galvin.galvin` | holds |
| licence, versions, "earlier than our pin" (`:319–320`) | lean-pool at `f8b9b72` against this repository's pins | Apache-2.0 (`GaleShapley.lean:3`, project card `classical-graph-colouring.yaml`). Toolchain `v4.35.0`, Mathlib `inputRev` `v4.35.0`. Pin `v4.36.0-rc2` | holds |
| 1.2 `exists_isStable` (`Suggested.lean:135`), cited by the new text | no men | `⊥ : M ≃. W`; each woman ranks `none` ≤ itself, and there is no pair to block | holds |

The rows for the untouched statements stand as in the previous review, of `d789104`. The diff changes no Lean statement.

- Gate rerun at this head: every check 0, `OK`. Dependency check: `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 10 `sorry` warnings and nothing else. The file is unchanged since `efeb540`, so the signatures and the one-tactic probe stand.
- External code was read at commit `f8b9b72`: `GaleShapley.lean` (102 lines), `Galvin.lean:1–49`, `Orientation.lean:8–10, 212`, `Kernel.lean` (headers), the lean-pool `README.md` (lines 17 and 30), `lean-toolchain`, `lake-manifest.json` and `LICENSE`. In the tree of 35,911 paths, `Galvin/GaleShapley.lean` is the only stable-matching file found by name.
- Pinned libraries: `grep` for stable matching, stable marriage, Gale–Shapley and deferred acceptance finds nothing in Mathlib or Tau Ceti. This agrees with the section title "outside Tau Ceti".
- Cross-roadmap: `roadmaps grep` for Galvin, Dinitz, list chromatic index, stable matching and Gale–Shapley finds only `EndoscopicTransferAndUnitaryTraceComparison/README.md:3306`, which is an unrelated endoscopic notion. The section matches the provenance form of `DerivedDeRhamCohomology/README.md` on main.
- The description was checked sentence by sentence against this head. Only the Provenance sentence is wrong (R02). It does state the new section, and the rest is unchanged and still holds.

Overlap check: the three closest-roadmap lists are empty, so no scope was read. The searches above find no second owner. Mathlib owns `PEquiv`, and this roadmap owns markets, stability and deferred acceptance. LeanPool is not a supplier.

Source independence: changed passages only. 3 passages (`README.md:317–322`, `:324–326`, `:350–352`) were compared with 1 source, lean-pool `README.md` lines 17 and 30 and `GaleShapley.lean:11–19`. The longest shared run is 5 words, "permissively licensed (Apache-2.0 or MIT)", which is a fact. Largest share: `Roth2008`, 20 of 34 citations; the diff adds one, the LeanPool file. No layer was added, removed or reordered, so the arrangement stands as compared at `efeb540`: independent.

## Not verifiable

- Gale–Shapley 1962, Dubins–Freedman 1981, McVitie–Wilson 1970, Sotomayor 1996, Knuth 1976 and the published pagination of Roth 2008 cannot be read legally, as at `efeb540`. No changed passage cites them.

## Source issues

- none

## For the human reviewers

- Scope: the main source is a survey (Roth 2008), and the headline results date from 1962–1982 (Amer. Math. Monthly, BIT, Math. Oper. Res.). `metadata.toml` gives `math.CO`, and `README.md:304` names no downstream consumer.
- Licence: `Roth2008` was read from the NBER working-paper PDF (licence class `institutional`; its first page carries the author's © 2007 notice) and from the revised copy on the author's Stanford page. `Roth1982` was read from the author's university page.
- Licence: lean-pool `Galvin/GaleShapley.lean` at `f8b9b72` is Apache-2.0, and its project card says `provenance: AI`. It declares `Galvin.IsStable` and `Galvin.exists_isStable`, the same short names as `Suggested.lean:70, 135`. The binders and statements differ (`E : M → W → Prop`, ranks `M → W → ℕ`).
- Licence: the Archive of Formal Proofs entry (`README.md:312, 334`) and the other GitHub Lean developments of Gale–Shapley were not opened, so `Suggested.lean` was not compared with them.
