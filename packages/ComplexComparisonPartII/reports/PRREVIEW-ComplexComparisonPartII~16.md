# Review of ComplexComparisonPartII (pull request #848 at 6723806)

**Verdict:** needs changes

This is an incremental re-review of the 51 lines that changed since `2f169dc`, the head the previous review read. Only `README.md` changed; `Suggested.lean` is byte-identical.

- **The change.** The repair for R03 of the previous review: the route of `holomorphicPoincare` and its three citation sites now name the pinned Poincaré homotopy operator and its two lemmas instead of the existential Poincaré lemma, and the two `ℂ`/`ℂ²` Checks compute the operator's value. All of it is correct against the pin (details under *Verified sound*).
- **Carried.** R01 and R02 of the previous review are description-only findings. Nothing in the description or at the other authors' heads has changed in a way that closes them, so both are written again below with the heads as they are today.
- **Checks.** The gate passes on this head, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly four `sorry` warnings.
- **Repair report.** No repair report marks either carried finding `not actionable in this package`, so neither carries a `Re-raised:` line.

## R01 (P2) — DifferentialGeometry Layers 8–9 are cited, and the open revision of DifferentialGeometry drops them

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:546–547` ("The de Rham theorem and Poincaré duality are DifferentialGeometry Layers 8–9."). The same layers are cited at :740–741 (Layer 8 `deRhamEquiv`, Layer 9 `finiteDimensional_deRhamCohomology`), :3741 and :3753 (C5.4, "DifferentialGeometry Layer 8's `deRhamEquiv`"), and :4366 (C5 dependencies, "Layers 0–2, 5, 8, 9 and 12").

**Claim:** DifferentialGeometry Layers 8 and 9 supply the de Rham theorem `deRhamEquiv` and Poincaré duality.

**Witness:** At the current head of #886 (`e8165fc3`), `DifferentialGeometry/README.md` has layer headings 0, 1, 2, 3, 4, 5, 5.6 and 12 only (its :392–:1363), and its :33–36 and :40–42 say that de Rham cohomology, the de Rham theorem and Poincaré duality are DeRhamCohomologyAndDuality's and "none of them is a target here".

**Context:**

- The citations are correct against main (`7e2fae4`): `DifferentialGeometry/README.md:852` (8.5, `deRhamEquiv`) and :874 (`finiteDimensional_deRhamCohomology`).
- DeRhamCohomologyAndDuality is not on main; it is the open roadmap of #1768 and sits at `ORDER.txt:394`, after this roadmap (`ORDER.txt:39`). A *Needs:* edge to it would point upward, so it is not a repair.
- The overlap report for this head flags exactly this id (DifferentialGeometry Layer 8, README lines 547, 3741, 3753).
- The pull-request description still names neither DifferentialGeometry nor the revision; its merge-order paragraph is unchanged since the previous review.

**Repair:** A description edit, not a README edit. Add one sentence to the merge-order paragraph of the description saying that the README consumes `deRhamEquiv` and `finiteDimensional_deRhamCohomology` from DifferentialGeometry Layers 8–9 as they stand on main, that #886 removes those layers, and that before both merge either #886 keeps the ids or adds an old → new map, or DeRhamCohomologyAndDuality moves ahead of this roadmap in the merge order. The in-folder alternative, stating the smooth de Rham comparison in C5.1 from `TauCeti.poincareHomotopy`, fine resolutions and `nonempty_sheafSingularComparison`, is the larger change.

This finding is carried from the previous review's R01, with the head of #886 updated.

## R02 (P2) — The holomorphic exponential sequence and `Pic_hol ≅ H¹(O^×)` still have two owners

**Location:** `README.md:146`: "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bijection … the holomorphic exponential sequence with its cocycle `δu`". The same claim is made in the scope section and in C5.4, and K3Surfaces §1.1 and GeometricQuantization §3.3 are listed as its consumers.

**Claim:** C5.4 is the only owner, on every complex manifold, of the exponential sequence, the bijection onto `H¹(M,O_M^×)`, and the identification of the connecting map with the integral first Chern class.

**Witness:** At the current head of #1234 (`617869f6`), `ComplexKahlerGeometry/README.md:690–692` says K4.P owns, on every complex manifold, the holomorphic exponential sequence, `Pic_hol(M)≃H¹(M,𝒪×)` and the `c₁` identification; :692–695 names ComplexComparisonPartII C5.4, K3Surfaces 1.1 and GeometricQuantization §3.3 as its consumers; :769–770 repeats the ownership.

**Context:**

- ComplexKahlerGeometry on main (`7e2fae4`) has no K4.P and does not mention the exponential sequence or `Pic_hol`, so K4.P exists only at a revision pull request, which is never a dependency.
- Both consumers still cite this roadmap: K3Surfaces (#1285) at its :13, :116 and :146, GeometricQuantization (#1186) at its :20, :212 and :714.
- The description records no settlement.
- The normalisation agrees on both sides: #1234's :696–698 fixes `c₁(O(−1))·[ℂP¹]=−1`, as this README does.

**Repair:** Record one owner. The smallest repair is a description sentence: C5.4 owns the holomorphic exponential sequence, the frame-torsor bijection and the connecting-map identification on every complex manifold, and #1234 must drop K4.P's ownership sentences (its :690–695 and :769–770) before both merge, or be rebased on this roadmap. The alternative is to cite ComplexKahlerGeometry K4.P for the three items and name #1234 in the merge-order paragraph, keeping in C5.4 only the identification of `analyticPicardGroup` with `Pic_hol`, the explicit `δu` cocycle and the `O(±1)`, elliptic-curve and Enriques Checks, with :146 and the scope and consumer lines rewritten to match.

This finding is carried from the previous review's R02, with the head of #1234 updated.

## Previous findings

- **R01 — not repaired:** README :547 still reads "The de Rham theorem and Poincaré duality are DifferentialGeometry Layers 8–9."; #886's head (now `e8165fc3`) still has no Layer 8 or 9; the description still names neither.
- **R02 — not repaired:** README :146 still reads "C5.4 is the single owner, on every complex manifold, of … the holomorphic exponential sequence"; #1234 (now `617869f6`, :690) still claims K4.P ownership; no settlement is recorded.
- **R03 — repaired:** README :565–571, :2779–2790 and :4369–4371 cite `TauCeti.poincareHomotopy`, `TauCeti.poincareHomotopy_apply`, `StarConvex.contDiffOn_poincareHomotopy` and `StarConvex.extDeriv_poincareHomotopy`; the type step is derived from the formula; the existential lemma appears only as what does not suffice (:2785).

## Verified sound

**Gate.** My run on this head printed the following and exited 0:

```text
gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate on the same head also records `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty. No `design/plan.json` is readable, so no gaps are declared, and none should be.

**Dependency check.** The check with `--movable` printed, in full:

```text
depcheck: 237 roadmaps, 2432 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Lean (pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).**

- `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at lines 116, 127, 154 and 172, and nothing else. The file is unchanged since the previous review, so the one-tactic probe and padding verdict of that review stand (nothing is padding).
- A scratch file with `#check @` of the four declarations and of the six pinned Poincaré names elaborated without error. The four declarations' types agree with the worker's signature file and with the README statements; no binder is lost.
- **The pinned names the change cites**, read at `TauCeti/Analysis/Calculus/DifferentialForm/Poincare.lean`:
  - `TauCeti.poincareHomotopy` (:91): `(x₀ : E) (ω : E → E [⋀^Fin (n+1)]→L[ℝ] F) (x : E) : E [⋀^Fin n]→L[ℝ] F`, with `E`, `F` real normed spaces and no completeness. README :566–567 ("for a `(k+1)`-form on a real normed space with values in a real normed space … is the `k`-form") agrees.
  - `TauCeti.poincareHomotopy_apply` (:95): `∫ t in 0..1, t ^ n • (ω (lineMap x₀ x t)).curryLeft (x − x₀)`. README :568's `x ↦ ∫₀¹ tᵏ ω(x₀ + t(x − x₀))(x − x₀, ·) dt` is this formula, since `lineMap x₀ x t = x₀ + t(x − x₀)` and `curryLeft` fills the first slot.
  - `StarConvex.contDiffOn_poincareHomotopy` (:226): `StarConvex ℝ x₀ s → IsOpen s → ContDiffOn ℝ r ω s → ContDiffOn ℝ r (poincareHomotopy x₀ ω) s`, `r : ℕ∞`, declared before the file's `variable [CompleteSpace F]` (:238), so no completeness. README :568–569 agrees, and the route's "it is smooth on `B`" (:2780) uses it with `r = ∞`.
  - `StarConvex.extDeriv_poincareHomotopy` (:383): `[CompleteSpace F]`, `StarConvex ℝ x₀ s`, `IsOpen s`, `ContDiffOn ℝ 1 ω s`, `∀ y ∈ s, extDeriv ω y = 0`, `x ∈ s ⊢ extDeriv (poincareHomotopy x₀ ω) x = ω x`. README :570–571 ("with complete coefficients, the operator is a primitive on `s` of a closed `C¹` form") agrees, and the route's parenthesis at :2781–2782 ("the coefficients `ℂ` are complete; `E` need not be") matches the binders: `CompleteSpace` is on `F = ℂ` only.
  - `StarConvex.exists_contDiffOn_forall_extDeriv_eq` (:393) concludes only `∃ α`, `C^r`, `α x₀ = 0`, `∀ x ∈ s, extDeriv α x = ω x`, which is exactly what README :2784–2787 now says it does and does not give.
- **The route's type step** (:2782–2788). With `α` transported to the chart, each `α(y)` is `ℂ`-multilinear; `(α(y)).curryLeft v` is `ℂ`-multilinear in the remaining `k` arguments; for fixed vectors `v₁,…,v_k` and an index `j`, `β ↦ β(v₁,…,i·v_j,…,v_k) − i·β(v₁,…,v_k)` is a continuous `ℝ`-linear functional on `E [⋀^Fin k]→L[ℝ] ℂ`, the integrand is continuous on `[0,1]` hence integrable, and the Bochner integral commutes with continuous linear maps, so the functional vanishes on `η(y)`. This is the argument the README states, and it needs no finite dimension, Hausdorffness or second countability, as :2772–2773 says.

**Adversarial pass (computed).** Rows for untouched statements are carried from the previous review (r15), each cited; the rows for the changed passages are new.

| Statement | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- |
| Check :2750–2754, `dz̄` under the homotopy (new) | `ℂ`, `k=0`, centre 0 | `t⁰·(dz̄)(tz)(z) = z̄`, so `η(z) = ∫₀¹ z̄ dt = z̄`; `∂̄z̄ = dz̄ ≠ 0`; type of `dz̄` is `(0,1)` so `hα` fails | the Check's value is right; the hypothesis `(k+1,0)` is needed |
| Check :2755–2759, `dz₁∧dz₂` under the homotopy (new) | `ℂ²`, `k=1`, centre 0 | `(dz₁∧dz₂)(z,v) = z₁v₂ − z₂v₁`; `∫₀¹ t(z₁v₂ − z₂v₁) dt = (z₁v₂ − z₂v₁)/2`; `d` of `(z₁dz₂ − z₂dz₁)/2` is `dz₁∧dz₂` | the Check's value is right, type `(1,0)` |
| same, the second primitive (new) | add `d|z₁|² = z̄₁dz₁ + z₁dz̄₁` | at 0: `(0·dz₂ − 0·dz₁)/2 + 0 = 0`, so it vanishes at the centre; `(0,1)`-part `z₁dz̄₁ ≠ 0`; `d(d|z₁|²) = 0` so still a primitive | "implied neither by `dη = α` nor by vanishing at the centre" holds |
| `holomorphicPoincare` route (new citations) | binders of the three lemmas against the route's data | ball `B` open and star-convex about `c`; `α` smooth, so `ContDiffOn ℝ 1`; `dα = 0` on `B`; `F = ℂ` complete; `E` has no completeness binder | every hypothesis of the cited lemmas is supplied |
| `holomorphicPoincare` (Lean) | `M=ℂ`, `k=0`, `α=dz`, centre 0 | `η=z`: type `(0,0)`, `∂̄z=0`, `dη=dz` | holds (r15) |
| same | `E=0`; `E=ℓ²`, `α=dℓ` | `α=0`, `η=0`; `η=ℓ−ℓ(x₀)` | holds without `FiniteDimensional` (r15) |
| same, `hα_hol` | `dα=∂α+∂̄α`, types `(k+2,0)`, `(k+1,1)` | `dα=0` forces `∂̄α=0` | implied, harmless (r15) |
| `montelTheorem` | `Ω=∅`; `ℂ²`, `z₁ⁿ`; `ℓ²`, `⟨·,e_n⟩` | vacuous; sup ≤ 1, limit 0; sup `r` on `B(0,r)` for every `n`, no limit | `FiniteDimensional` needed and present (r15) |
| `schwartzFiniteness` | `ℂ`, `g=id`, `h=−id`; `ℓ²`, `g=id`, `h=−diag(1/n)`; `g=diag(1/n)`, `h=0`; `g=id`, `h=−id` on `ℓ²` | range 0, codim 1; closed range, codim 1; dense non-closed range; range 0, codim ∞ | both hypotheses used (r15) |
| `nonempty_sheafSingularComparison` | `∅`; point; `S¹`; Warsaw circle | 0/0; `A,0,…`; `ℤ/ℤ`; Čech `ℤ` against singular 0 | hypothesis needed and present (r15) |
| `HolomorphicDeRham` section clause | `U⊆ℂ`, `p=1` | `∂̄(f dz) = (∂f/∂z̄) dz̄∧dz` | equals `O·dz` (r15) |
| The 15 seeded-sample targets and the remaining rows of r15's table (Riemann surface of `C`, `functionFieldToMeromorphic`, `IsDifferentialOperator`, `holomorphicConnectionDictionary`, `artinDeRhamBetti`, `realComplexCurrentComparison`, `analyticSetLocalFiniteMass`, `AnalyticLogDifferentials`, `complexAlgebraicTopology`, `artinComparison`, `artinComparisonCompactSupport`, `relativeArtinComparison`, `artinSmoothTrace`, `adicArtinComparison`, `sncPolydiscChart`, `multiplicativePeriodInterface`, exponential sequence, C1.3 conventions, `analyticTwistCohomology`, `StronglyOneComplete`, `chernFubiniStudyIntersection`, `lelongPoincareSection`, `strongProperSupportExistence`, C3.2 Checks) | as in r15 | as in r15; the diff touches none of these passages | pass, carried (r15) |

**Seeded sample.** None of the 51 changed lines falls in a sampled target; the sample rows and locator checks of the previous review (SGA 1 XII, SGA 4 XI/XVI/XVII/XVIII, EGA IV₄ §16, Deligne LNM 163, Deligne 1968, Demailly, Freitag, Bhatt–Scholze, Milne) are carried. The one locator the changed passage keeps, Deligne 1970 I.2.19 and I.2.23 (ii) with 2.23.2–2.23.3 (:2765–2766), was verified in r15 at `deligne-lnm163` lines 442, 490, 523 and 552.

**Cross-roadmap citations the change touches.** The change cites no roadmap section; its citations are the pinned Tau Ceti names above. The two carried findings' citations were re-resolved on today's main (`7e2fae4`: `DifferentialGeometry/README.md:852`, :874; ComplexKahlerGeometry has no K4.P) and at the current open heads (#886 `e8165fc3`, #1234 `617869f6`, #1285, #1186) as recorded in R01 and R02.

**Ownership.** The overlap report for this head lists one dropped id (R01), no other pull request changing this roadmap, and no id defined only by an open revision. Of the closest roadmaps in vocabulary, #1234 is R02; the ComplexKahlerGeometry heads #1398, #1807, #1808 and #1854 make no exponential-sequence or holomorphic-Poincaré claim (r15). No roadmap on main or at an open head states a holomorphic Poincaré lemma, so C5.1 remains its owner.

**Policy.** The changed lines contain no LaTeX, `lemma`, pull-request number, round label, process word or machine path, and the gate scanners agree. The pinned names are cited with their module and in prose; no passage is copied.

## Not verifiable

Unchanged from the previous review; none of these texts is cited by a changed line.

- K. Kato, *Logarithmic structures of Fontaine–Illusie* (1989), §§1.7–1.9 (analytic log-differentials target): no legal copy found.
- A. Dimca, *Sheaves in Topology* (2004), §§2.1–2.5, 3.2, 4.1 (C6.1): paywalled.
- H. Hironaka, *Triangulations of algebraic sets* (1975) (C6.0): no open host.
- Bochnak–Coste–Roy, *Real Algebraic Geometry*, Theorem 9.2.1 (C6.0): paywalled.
- Kleiman, published numbering "9.6.16": the arXiv locator (Theorem 6.16) was verified in an earlier round; the AMS chapter is paywalled.

## Source issues

- none
