# Review of CoboundaryExpansion (pull request #1752 at b517ede)
**Verdict:** accepted

:robot: Independent AI review of `TauCetiRoadmap/CoboundaryExpansion/` at `b517edef6aa02604b5aa43741dbfe6c43e5500dd`: an incremental re-review of the 51 lines changed since `f325947` (README 2.4, 2.5, 3.2; the module docstring and three deletions in `Suggested.lean`). The pull request files were not changed. The one blocking finding of the previous review is repaired and its new negative-control Checks recompute exactly; the gate passes; no P1 or P2 finding remains. Two P3 notes, both leftovers of the repair, are the author's to take or leave. Acceptance means ready for a human's final approval; this review approves nothing.

## R01 (P3) — README 1.3 still names a deleted Lean declaration

**Location:** `TauCetiRoadmap/CoboundaryExpansion/README.md:215`–216: "Prove `hammingDist ⇑σ ⇑τ = movedNorm α (σ⁻¹ * τ)` (`hammingDist_eq_movedNorm`)".

**Claim:** A backticked name of this roadmap's own is a claim that `Suggested.lean` declares it.

**Witness:** `hammingDist_eq_movedNorm` was deleted from `Suggested.lean` at this head (the diff removes it at the old lines 72–76); `grep hammingDist_eq_movedNorm Suggested.lean` finds nothing. The gate's identifier rule did not catch it because the stem `hammingDist` is a Mathlib name, not one of the file's own.

**Repair:** Drop the parenthetical name and keep the statement as prose: "Prove that `hammingDist ⇑σ ⇑τ` equals `movedNorm α (σ⁻¹ * τ)`." (The two other deleted names, `Cochain.gaugeDist_eq_zero_iff` and `h1Sym_le_h1_fin_two`, no longer occur in the README; checked by grep.)

## R02 (P3) — "Suggested, non-exhaustive signatures" in the module docstring and the README

**Location:** `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:6`–11: "suggested target signatures … **This file is not the roadmap and is not exhaustive.** … The statements here suggest Lean forms for particular milestones"; `README.md:26`–27: "gives suggested, non-exhaustive signatures".

**Claim:** The file is a non-exhaustive collection of suggested milestone signatures.

**Witness:** The house form for the acceptance file is one module docstring "<title>: target signatures" saying that the roadmap is `README.md`, that this file states the roadmap's headline theorems against the pinned APIs, and which headlines are not statable. At this head the file does exactly that (seven headlines, all statable, all stated, nothing else sorried), so the "suggested, non-exhaustive" wording undersells its contract; the previous review's R03 asked for it to go and the other parts of R03 were done.

**Repair:** Retitle the docstring "Coboundary expansion with group coefficients: target signatures"; replace lines 8–11 by: the roadmap is `README.md`; this file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`; every headline is statable at the pins. In the README write "[Suggested.lean](Suggested.lean) states the headline theorems against the pinned libraries, with `sorry`". Not a blocker.

## Previous findings

- R01 — repaired: 2.4 now reads "For every group norm `ℓ`, `cost (β • α) = …`, hence `gaugeDist (β • α) = gaugeDist α`. For conjugation-invariant `ℓ`, `defect (β • α) = defect α`"; 2.5 "For conjugation-invariant `ℓ` and a vertex `v₀`, the minimum over gauges with `β v₀ = 1` equals `gaugeDist`"; 3.2 scoped likewise. The two negative-control Checks state the witness instance with the values this review recomputed (table below).
- R02 — repaired: `hammingDist_eq_movedNorm`, `Cochain.gaugeDist_eq_zero_iff` and `h1Sym_le_h1_fin_two` are deleted from `Suggested.lean` (26 declarations, 9 sorried theorems remain). The repair left the first name in README 1.3: new R01 above.
- R03 — partly repaired: the `h1Err_complete` docstring now says "`k/3` … in the counting convention of the README. In Chapman–Lubotzky's normalized convention (Proposition 3.2 and Remark 3.3 of their paper II) the value is `k/(k-2)`"; the module docstring lists `card_div_three_le_h1`, `Cochain.defect_replicate` and `Cochain.gaugeDist_replicate`. The "suggested, non-exhaustive" wording remains: new R02 above.

## Verified sound

**Gate and scope.** The worker's gate at this head passes every check (`set_option=0 … sorry-data=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 … build=0 OK`); my own re-run of the prescribed gate command at this head also ends `OK`. `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/CoboundaryExpansion/` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; the worktree is clean at `b517ede`.

**Elaboration.** A scratch copy of `Suggested.lean` with `#check @name` for all 26 declarations elaborated under `lake env lean` with exactly 9 `declaration uses sorry` warnings (the 9 sorried theorems: `card_mul_gaugeDist_le`, `card_div_three_le_h1`, `Cochain.defect_replicate`, `Cochain.gaugeDist_replicate`, `h1_complete_movedNorm_fin_two`, `h1_complete_movedNorm_fin_three`, `h1Norm_complete_movedNorm_fin_three`, `h1Sym_complete`, `h1Err_complete`) and no other diagnostic. Elaborated types compared with the README: `card_div_three_le_h1 : (ℓ : GroupNorm G), IsConjInvariant ℓ → (∃ α, 0 < Cochain.gaugeDist ℓ α) → ↑(Fintype.card V) / 3 ≤ h1 (complete V) ℓ` (4.2 with its two hypotheses); `h1Err_complete : 4 ≤ Fintype.card V → h1Err (complete V) = ↑(Fintype.card V) / 3` (9.4); `Cochain.replicate : Cochain (complete V) G → (q : ℕ) → Cochain (complete (Lex (V × Fin q))) G` (5.1). The two binders the worker's signature scan flags as dropped (`[Fintype V]` on `Cochain` and on `Cochain.IsCoboundary`) are the same two as at `f325947` and are benign: neither type contains a finite sum or infimum, and `defect`, `cost`, `gaugeDist`, `h1`, `h1Norm`, `h1Sym`, `h1Err` and every headline carry `[Fintype V]`. No `set_option`, no `lemma`, no `True` placeholder, no sorried data; the header is `module` / `public import Mathlib` and nothing else is imported. The diff adds no Lean statement, so no new one-tactic probe was due; the previous review's probes closed none of the nine that remain, and none of the nine restates a definition, mirrors a Check or computes a value.

**Dependency check** (the prescribed command at this head, `--movable`):

```text
depcheck: 205 roadmaps, 1660 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line; `CoboundaryExpansion` is line 374 of the merge-order candidate. The only cross-roadmap citation is Regularity Layer 5, on main: `TauCetiRoadmap/Regularity/Suggested.lean:305` `structure HypergraphComplex (r : ℕ) (V : Type*) [DecidableEq V]`, unchanged since the previous review. No declared gap; none needed. The five Lean names `roadmaps resolve` lists as found nowhere (`Cochain.defect_replicate`, `Cochain.gaugeDist`, `Cochain.gaugeDist_replicate`, `TwoComplex.toHypergraphComplex`, `TwoComplex.ofHypergraphComplex`) are this roadmap's own: the first three are declared in `Suggested.lean` (lines 132, 195, 201), the last two are the README 2.1 conversion targets named in the `TwoComplex` docstring, as at `f325947`.

**Ownership** is unchanged from the previous review (this roadmap owns the conjugation-invariant norms, group-valued 1-cochains, gauge distance, Cheeger constants, replication and the complete-complex values; `TwoComplex V` is the `r = 3` specialization of Regularity's `HypergraphComplex`); the diff introduces no new object. Ownership against the open pull requests whose files the brief gives was checked at `f325947` by `roadmaps grep` and not repeated.

**Pinned declarations opened for the changed passages:** `Finset.inf'` at `Mathlib/Data/Finset/Lattice/Fold.lean:528` (2.5's `*Needs:*`); `GroupNorm` at `Mathlib/Analysis/Normed/Group/Seminorm.lean:110` (the norm of 2.4/2.5/3.2, with no conjugation-invariance field, as the supplier contract says). Pins: Mathlib `f6090c70`, Tau Ceti `358314d4`, equal to `lake-manifest.json`.

**Sources for the changed passages.** The `h1Err_complete` docstring's citation: chapman-lubotzky-ii lines 335–337 (Proposition 3.2: complete complex on `d + 1 ≥ 3` vertices, `h₁(X, Sym) ≥ (d+1)/(d−1)`), lines 364–366 (Remark 3.3: the same bound for `hB1` and for `𝔽₂`). `(d+1)/(d−1) = k/(k−2)` with `k = d + 1`, and `k/(k−2) · (k−2)/3 = k/3` is the counting value (README Conventions, factor `3/(k−2)`): the docstring is right. The seeded sample's only target inside the changed passages is 2.5, which cites no source; the remaining sampled targets (1.1, 1.2, 2.1, 4.3, 4.4, 6.1, 6.3, 7.2, 8.1, 8.3, 9.1–9.4) are untouched and were verified at `f325947` against kozlov, chapman-lubotzky-i/ii, beasley and meshulam-wallach (locator table in that review); those cache texts are unchanged.

**Adversarial values.** Permutations of `{0, 1, 2}` in one-line notation, `e = (0 1 2)`, `t = (1 0 2)`, `s = (0 2 1)`, `c = (1 2 0)`, `r = (2 1 0)`, products right to left (`t·s = c`, `t·s·t = r` checked). The weighted word norm is the Dijkstra distance from `e` in the Cayley graph with generators `t` (weight 1) and `s` (weight 2), on both sides. All computations by a plain-Python checker written for this review (216 gauges and 216 cochains enumerated in full; no root fixing where the norm is not conjugation invariant).

| Statement / location | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Weighted word norm of 1.1, as used in the 2.4 Check | all six elements; the three `GroupNorm` axioms; conjugation | `ℓ = 0, 1, 2, 3, 3, 4` on `e, t, s, c, c⁻¹, r` as printed; `ℓ(ab) ≤ ℓ(a) + ℓ(b)` on all 36 pairs, `ℓ(a⁻¹) = ℓ(a)`, `ℓ = 0` only at `e`; `ℓ(c t c⁻¹) = ℓ(s) = 2 ≠ 1` | Keep: a group norm, not conjugation invariant |
| 2.4 defect invariance, scoped | `complete (Fin 3)`, `α 0 2 = s⁻¹ = s`, identity elsewhere; constant gauge `c`; word and moved norms | holonomy `s`; `c⁻¹ s c = t`; word norm: `defect α = 2`, `defect (β • α) = 1`; moved norm: `2` and `2` | Keep: the Check's `1 ≠ 2` and "both `2`" are exact; the hypothesis separates |
| 2.4 cost identity, every norm | identity edge, `β = (e, t)`, `γ = (e, s)`; word norm | `cost (β • α) γ = ℓ(t s) = ℓ(c) = 3 = cost α (β * γ)` | Keep (review of `f325947`, re-run) |
| 2.5 root-fixed minimum, scoped | the same cochain; all `6³ = 216` gauges; gauges with `β 0 = e` | word norm: min over all `1` (constant gauge `c`), root-fixed min `2`; moved norm: `2` and `2` | Keep: the Check's `216`, `1`, `2`, `2`, `2` are exact |
| 2.5 `gaugeDist = 0 ↔ IsCoboundary` | `K₃` one odd edge over `{e, t}`; tree with one `t` | `D = 2`, not a coboundary; `D = 0`, coboundary | Keep (review of `f325947`) |
| 3.2 relabelling invariance, scoped | `h1 (complete (Fin 3))` under the three orders `0<1<2`, `2<1<0`, `1<0<2`, all 216 cochains, all 216 gauges | word norm: `1, 1, 1`; moved norm: `1, 1, 1` | Keep. Note: for `complete V` the hypothesis is not needed for the truth of the `h1` statement (transporting cochains along the bijection is a bijection of the ratio sets), only for the route through 2.3, where it is needed for a fixed cochain; a P3-grade remark, not a finding |
| 3.2 scaling | seed under `ℓ` and `ℓ/3` | `8/6 = (8/3)/2 = 4/3` | Keep (review of `f325947`) |
| `h1Err_complete` docstring | `k = 4, 5, 6` | normalized `k/(k−2) = 2, 5/3, 3/2`; counting `k/3 = 4/3, 5/3, 2`; factor `3/(k−2) = 3/2, 1, 3/4` | Keep: `k/(k−2) · (k−2)/3 = k/3` |
| Seed, 6.1 | all six assignments on `K₄` | `N = 8`, `D = 6` over 216 root-fixed and 1296 gauges; star costs `(6,6,6,6)` | Keep (review of `f325947`) |
| Witnesses, 6.3 | printed `k = 5, 6, 7, 8` cochains | `(N, D) = (10, 6), (36, 18), (28, 12), (72, 27)` = `k/3`; all star costs equal `D` | Keep (review of `f325947`) |
| `h1 (K₄, Sym(3)) = 4/3`, 3.1/6.1 | all `6³` gauge-fixed and all `6⁶` cochains | min ratio `4/3` both ways | Keep (review of `f325947`) |
| Subgroups at `k = 4`, 6.4 | `{e,t}`, `A₃`, trivial, `Sym(2)`, `Sym(1)` | `2`, `3/2` (at `(9, 6)`), empty, `2`, empty | Keep (review of `f325947`) |
| Replication, 5.1–5.3 | seed, `q = 2`, `6⁷` root-fixed gauges on `K₈`; triangle types; `q = 0, 1` | `N = 64 = 2³·8`, `D = 24 = 2²·6`; two- and one-cluster holonomies `1`; `0 = 0` | Keep (review of `f325947`) |
| Star identity and bound, 4.1–4.2 | seed; binary `k = 5`; `K₃`; `k = 0, 1, 2`; trivial group at `k = 4` | `24 = 3·8`, `30 = 3·10`, `6 = 3·2`; `0 ≤ 0`; hypothesis `∃ α, 0 < D` needed (`4/3 ≤ 0` false) | Keep (review of `f325947`) |
| Action order, 2.2 | `β = (e, s)`, `γ = (e, t)` | `β • (γ • α) = t s = c = (γ * β) • α`; `(β * γ) • α = s t = c⁻¹` | Keep (review of `f325947`) |
| `h1Norm` factor, 3.3 | `k = 2, 3, 4, 5` | `1/0` excluded (Lean `0`), `3, 3/2, 1` | Keep (review of `f325947`) |
| `h1Sym`, 3.4/8.2 | `K₄` degrees 1, 2, 3; `K₆` degrees 2, 3 | `0`, `2`, `4/3`; `2`, `2` | Keep (review of `f325947`) |
| Edge-set bridge and cut minimality, 7.1–7.2 | one edge of `K₄`; `S = ∅`; star of `K₄` | `N = 4`, cost `4`/`2·#E`; `D = 0 ≠ 6` | Keep (review of `f325947`) |
| Staircases, 7.3 | `(c,t) = (1,1), (1,2), (1,3), (1,4), (2,1), (2,2), (4,1)` | `#E = 1, 3, 6, 10, 4, 12, 16`; cut-minimal; odd triangles `1, 5, 14, 30, 8, 40, 64 = n·#E/3` | Keep (review of `f325947`) |
| Kozlov, 7.4 | `h1 (K_n, 𝔽₂)`, `n = 3..7` | `1, 2, 5/3, 2, 7/3`; `n = 4` excluded | Keep (review of `f325947`) |
| `Sym(3)` headline, 8.1 | `k = 4..8`, `k = 8, 12` by replication | `4/3, 5/3, 2, 7/3, 8/3`; `8/3, 4`; normalized `k/(k−2)` | Keep (review of `f325947`) |
| Parity retraction, 1.4 | `e, c ↦ e`; `t, s ↦ t`; 4-cycle | `0 ≤ 0`, `0 ≤ 3`, `2 ≤ 2`, `2 ≤ 4` | Keep (review of `f325947`) |
| `distErr`, `costErr`, cross-degree minima, 9.1–9.3 | `(id₂, id₃), (t, id₃), (t, s), (id₃, id₄), (id₃, id₅)`; five seed gauges; gauge degrees 1–4; doubled seed | `1/3, 2/3, 1, 1/4, 2/5`; `3·costErr = cost`; `14/3, 10/3, 2, 3`; `44/3`, `8` | Keep (review of `f325947`) |
| `h1Err` admissibility and lower bound, 9.2–9.4 | degree-3 identity cochain; own-degree star gauge; `(q,t) = (1,1), (1,2), (2,1)` | `0/0` excluded; `Σ costErr(star) = 3N/n`; `11, 27, 22 ≥ 9, 15, 9` | Keep (review of `f325947`) |

**Headline inventory.** The README's end theorems: the star bound (4.2), the two replication laws (5.1, 5.2), Kozlov's binary value (7.4), the `Sym(3)` value in the counting, normalized and all-degree conventions (8.1–8.3), the cross-degree value (9.4): seven, all statable at the pins, all stated in `Suggested.lean` at the README's generality with the hypotheses the routes need, and all listed in the module docstring at this head. No padding remains.

## Not verifiable

- **Linial–Meshulam (2006)**, cited by bibliographic data only for the definition of the `𝔽₂` constant; no legal text in the cache (paywalled). Nothing in the roadmap depends on its text.
- **Published-edition pagination** of Chapman–Lubotzky I and II, Kozlov and Meshulam–Wallach: read in the arXiv versions the README cites; no published page numbers are asserted.
- **The provenance repository**: cited as a source, not as the specification; not built. Every numeric claim of the changed passages was recomputed here.

## Source issues

- none
