# Review of ArithmeticStatisticsPartIV (pull request #1172 at 058901c)

**Verdict:** accepted

Incremental re-review of the 62 changed lines since `87e4cd8`, and of the title and description as they stand. No finding; the gate passes.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 114, 120, 134, 140 read `(F : Type*) [Field F] [Finite F]` with `Nat.card F` throughout; `README.md` line 786 cites `Finite.one_lt_card` (Mathlib).
- R02 — repaired: `Suggested.lean` lines 179–203 define `fkGoodPlaneOf` with proved fields and state `Set.BijOn (fkGoodPlaneOf k) Set.univ (fkGoodPlanes k)`; `README.md` lines 886–887 name the map and the bijection.
- R03 — repaired: the description reads "AI assistance: GPT-6 (Codex) and Claude, for the port from the accepted explorer package and for its red-team and review repairs."

## Verified sound

| Statement | Instances | Values each side | Result | Change |
|---|---|---|---|---|
| `matrix_rank_count` with `[Finite F]`, `Nat.card F` | `F=𝔽₂`: `m=n=r=1`; `m=n=2, r=1`; `m=n=2, r=2` | `(2−1)(2−1)/(2−1)=1`; `3·3/1=9`; `(3·3/3)(2·2/2)=6=|GL₂(𝔽₂)|`; total `1+9+6=16=2⁴` | holds | none |
| `matrixKernelLaw` with `Nat.card F`, through `koymansPaganoRankIdentity` | `m=1` over `ZMod 2` | `P(1,1,0)=P(1,1,1)=1/2`; `(1/2)/(2·1)+(1/2)/(2·3)=1/3`; right side `1/(2²−1)=1/3` | holds | none |
| `symmetricKernelLaw` with `Nat.card F` | `F=𝔽₂`, `r=1`; `r=2` | denominator `2^(1·2/2)=2`: masses `1/2, 1/2`; denominator `2³=8`: kernel dimensions 0, 1, 2 have `4/8, 3/8, 1/8`, sum 1 | holds | none |
| `macwilliams_symmetric_rank_count` with `Nat.card F` | `F=𝔽₂`, `s=2`, `k=0,1,2` | `1`; `2²−1=3`; `(4/3)·(3·1)=4`; direct count of the 8 symmetric matrices: 1, 3, 4 | holds | none |
| `fkGoodPlaneOf` (definition determines its object) | `k=0`; `k=1`, `F=0`, `F=𝔽₂`; `k=2`, `F=span(1,0)`; wrong model `y∈F` | `{0}`; `{0,(0,1)}`, `{0,(1,1)}`; `{x=(a,0), y=(0,b)}`, dimension 2, `L=Σx_j y'_j=0`; wrong model sends `F=0` to `0`, finrank `0≠1` | each image good; wrong model excluded by the maps-to part | none |
| `fk_good_subspace_bijection` as `Set.BijOn` | `k=0,1,2`; both directions | `k=0`: `{⊥}→{⊥}`; `k=1`: 2 subspaces onto the 2 good lines, `span(1,0)` has `L=1`; `k=2`: `1+3+1=5` both sides. Injective: `F` is the `x`-projection. Surjective: `dim F+dim G≤k` forces `U=F⊕F^⊥` | holds | none |
| README Checks of §3.10 against the new bullets (lines 899–902) | `k=1` images; `k=1, Γ={1}` | `F=𝔽₂↦span(1,1)`, `F=0↦span(0,1)`; constraint `u₁+u₂=0` keeps `span(1,1)`, `u₁=0` keeps `span(0,1)`: one each, `N(0,2)=1` | consistent | none |

Rows for untouched statements stand as in the previous review, of `87e4cd8`.

- Gate, run at `058901c`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes no file outside the folder against its merge base.
- Elaboration: `lake env lean` on `Suggested.lean` gives 16 `declaration uses 'sorry'` warnings (lines 58, 62, 67, 86, 95, 105, 120, 129, 140, 149, 155, 162, 202, 206, 221, 246) and nothing else; the three fields of `fkGoodPlaneOf` are proved.
- Library declarations opened at the pin: 1. `Finite.one_lt_card : [Finite α] [Nontrivial α] → 1 < Nat.card α` (`Mathlib/SetTheory/Cardinal/NatCard.lean` line 78, in `namespace Finite`, confirmed with `#check`). Loogle and LeanSearch give no library counterpart of `fkGoodPlaneOf` or of the bijection.
- Signatures: the six changed declarations compared with the README (`#check` types): `[Field F] [Finite F]` kept on both definitions and both theorems, no binder lost; `fkGoodPlaneOf : (k : ℕ) → Submodule (ZMod 2) (Fin k → ZMod 2) → Submodule (ZMod 2) (FKSpace k)` is the map of README line 886. One-tactic probe on `fk_good_subspace_bijection` (`simp` with the three definitions unfolded): does not close, dimension, injectivity and surjectivity remain; not padding.
- Sources and cross-roadmap citations: the change adds no source locator to the README and no cross-roadmap citation; the new docstring's "Fouvry–Klüners, Lemma 26" is the README's locator `[22], §5.7, Lemma 26` (line 895), not reopened. The seeded sample meets the change in §3.9 (line 786) and §3.10 (lines 886–900), checked above. The resolver's seven "Lean names found nowhere" are this file's own declarations in `FieldStatistics` and `Distributions`. No other roadmap, open or on main, cites `fkGoodPlaneOf`, `matrixKernelLaw` or `symmetricKernelLaw` by name.
- Title and description against the head: new roadmap of three files; every prime including 2 and every `u ≥ 0` (README lines 290, 316, 399); aggregate enlargement inequality (lines 465–467); characteristic-free recurrence (line 784); gate claims (no `statement-hygiene` hit, `sorry` the only warning, no upward edge) hold at this head; the AI-assistance sentence agrees with the folder's history. Nothing contradicted, nothing left unstated.
- Remark, generated block `depends-on`: it lists AnalyticNumberTheoryPartI and PartII, which the README's "Analytic boundary" paragraph says are not inputs; both are merged, so nothing waits on them.
- Overlap check: read ArithmeticStatisticsPartV, ArithmeticStatisticsPartVII, ArithmeticStatisticsPartI, ArithmeticStatisticsPartVIII, InductionRestrictionPartII, ClassicalArithmeticCompletion, ProbabilisticAndMetricNumberTheory, AnalyticNumberTheoryPartII (searched at their heads for the FK good planes, the map `F ↦ F⊕F^⊥` and the finite-field kernel laws); nothing shared.
- Source independence: changed passages only; 3 passages compared (README lines 886–887, the Check of line 900, the docstring of `fkGoodPlaneOf`) with 0 source texts, since the sources cache holds none for this roadmap: they are a formula in this roadmap's own coordinates and a Check of its own; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- The three items of the earlier reviews (MacWilliams 1969 Theorem 2; Cohen–Lenstra LNM 1068 Prop 4.1(ii) and Cor 3.7(i); Cauchy 1843 formula (18)) are untouched by this change and were not reopened.
- Fouvry–Klüners Lemma 26 was not read again for the new docstring: no text of it is in the sources cache; the locator is the README's, unchanged since the full review.

## Source issues

- none

## For the human reviewers

- none
