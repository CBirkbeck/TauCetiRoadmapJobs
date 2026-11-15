# FIX-PKG-GaussianIsoperimetryAndClusters~2

Repair of the six findings of `REV-PKG-GaussianIsoperimetryAndClusters`. Files changed: `packages/GaussianIsoperimetryAndClusters/README.md`, `packages/GaussianIsoperimetryAndClusters/Suggested.lean` (one docstring). `sources.toml`, `metadata.toml` and `design/plan.json` are unchanged; no supplier gap was needed.

## F01 (P2) — applied

Verified: no layer, supplier or pin says that a bounded open convex set is a Lipschitz domain (`TauCeti/Analysis/Sobolev/LipschitzDomain/Basic.lean` has no convex lemma; GeometricMeasureTheory G6 covers Lipschitz and `C¹` domains only). Old: "intersection with any ball is a bounded convex Lipschitz domain and locality transfers its boundary measure". New §2.3 route for open convex `C`: `∅`, `E` and `n = 0` are trivial. Locally finite perimeter comes from `Convex.perimeter_lt_top` (Convex.lean:507), `TauCeti.perimeter_congr_ae` and `TauCeti.perimeter_mono` (Perimeter.lean:87). `∂^M C = ∂C` comes from a supporting functional (`geometric_hahn_banach_open_point`, Separation.lean:124; density ≤ 1/2) and a cone (`Convex.openSegment_interior_closure_subset_interior`, Topology.lean:142; density > 0), and the reverse inclusion is `TauCeti.essentialBoundary_subset_frontier`. Then §2.2 applies. G6 is kept only for the bounded-Lipschitz-domain clause, which now has its own sentence. These were added: the four library names in the *Needs:* line and the supplier contracts, the Layer 2 Dependencies, the Scope list, and two Checks (the quadrant, corner density `1/4`, `P_γ = 0.398942`; the closed segment as a negative control showing that openness is needed, `0.136176` against `0`). No other place in the roadmap used the convex-Lipschitz claim (grep: one occurrence).

## F02 (P2) — applied

Verified: the §4.5 clause shared the 10-word run of MilmanNeeman2022 lines 572–574. The clause is replaced by a route written from the mathematics. It works with the projection `y_m` to the copy of `E^{(k−1)}` on `J`, uses the cylinder inclusion and the sum argument to get `Ψ^{(k)}(y_m) → v_J`, then shows `x_{m,l} − x_{m,i} → ∞`. It bounds interface areas by `φ(c/√2)` and by `φ(c/√2)(1 − Φ((d − c/2)/√1.5))`, and compares the interfaces inside `J` with cylinders. The *Needs:* line gains §2.3 (hyperplane area). The first Check now gives the limits `A^m_12 → 0.398942` and `A^m_13, A^m_23 → 0`. My own wording, not the review's example. A 7-word n-gram scan of all added README text against MilmanNeeman2022, CianchiFuscoMaggiPratelli2011, Bobkov1997, Ledoux1999 and Maggi2012 found 0 shared runs.

## F03 (P3) — applied differently

Verified: §8.2 is proved for every Borel `A` from §8.1, so the "converse" has an unused hypothesis. Summary: "Bobkov's functional inequality and its converse" → "Bobkov's functional inequality". §8.3: the sentence is replaced by the approximation target with its own route. The difference from the suggested repair is that the target is stated for **nonempty** closed `A`. The suggestion said "closed `A`", but `Metric.infDist x ∅ = 0` (`Metric.infDist_empty`, HausdorffDistance.lean:478) makes `f_r ≡ 1` and `∫ f_r dγ = 1 ≠ γ(∅) = 0`. That instance is now a Check, together with the half-space equality `0.341345 = 0.341345`. `Metric.infDist` and `Metric.lipschitz_infDist_pt` were added to the Mathlib contracts, and the Layer 8 Dependencies were updated.

## F04 (P3) — applied

The CianchiFuscoMaggiPratelli2011 reference now names the cvgmt preprint as the version read and says that every section, lemma, equation and line locator refers to it. The Conventions (normalization paragraph) say once that the formulas of Cianchi–Fusco–Maggi–Pratelli are cited from the cvgmt preprint and that whatever the README says they print refers to that version. This scopes the four "as printed" or "print it" phrases in §6.3–§6.5. `sources.toml` already carries `version_note = "cvgmt preprint read; …"`.

## F05 (P3) — applied

"How to read the build": "then the existence-and-symmetrisation argument of Cianchi–Fusco–Maggi–Pratelli" → "then the structure of the minimizers that §3.5 provides: half-line sections, convexity of the density-one representative, and separation by a hyperplane". These are §7.1, §7.2 and §7.3. The attributions stay at the locators of §§7.1–7.3.

## F06 (P3) — applied

`Suggested.lean`, docstring of `isoperimetricProfile_two_eq`: "(MilmanNeeman2022, Theorems 1.1 for `q = 2`)" → "(MilmanNeeman2022, Theorem 1.1 for `q = 2`)". MilmanNeeman2022 line 98–99 is Theorem 1.1. A grep found no other plural-locator slip in the file. README §7.4 keeps "Theorems 1.1–1.2", because there it covers both statements.

## Checks

- **Elaboration**: `lake env lean packages/GaussianIsoperimetryAndClusters/Suggested.lean` from the content checkout gave 19 warnings, all "declaration uses `sorry`" (lines 100, 112, 129, 144, 190, 255, 269, 304, 316, 328, 338, 351, 360, 372, 381, 391, 400, 420, 428), and no error. No `TauCeti.*` module needed building.
- **Signatures**: I ran `#check @name` on all 36 declarations in one scratch copy of the file. After normalization the elaborated types are identical, item for item, to the earlier signature listing (0 differences); only a docstring changed. The three definitions flagged for dropped section binders (`gaussianWeight`: `FiniteDimensional`, `MeasurableSpace`, `BorelSpace`; `gaussianSymmetral`, `closedGaussianSymmetral`: `BorelSpace`) do not need them, and every theorem carries its binders. Nothing changed.
- **Dependency check** (output): `depcheck: 246 roadmaps, 2241 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citations** (`roadmaps resolve` on the README): no cross-roadmap citations and no Lean names found nowhere. The resolver could not check names outside TauCetiRoadmap on this host, so I checked every new library name at the pins by file and line: `Convex.perimeter_lt_top` (TauCeti/Analysis/BoundedVariation/Convex.lean:507), `TauCeti.perimeter_mono` (Perimeter.lean:87), `geometric_hahn_banach_open_point` (Mathlib/Analysis/LocallyConvex/Separation.lean:124), `Convex.openSegment_interior_closure_subset_interior` (Mathlib/Analysis/Convex/Topology.lean:142), `Metric.infDist` (Mathlib/Topology/MetricSpace/HausdorffDistance.lean:464), `Metric.infDist_empty` (478), `Metric.lipschitz_infDist_pt` (551), `norm_fderiv_le_of_lipschitz` (Mathlib/Analysis/Calculus/FDeriv/Basic.lean:949).
- **README–Lean agreement**: no Lean name was added or removed. Every new backticked name is a library declaration listed in the supplier contracts.
- **Ownership**: the equality "essential boundary of an open convex set equals its frontier" is a step of a route here, not a separate target. `roadmaps grep` for convex sets with essential or reduced boundaries finds no match on main or at any open head, so nothing is owned elsewhere. The finiteness of perimeter for bounded convex sets is Tau Ceti's and is cited.
- **Gate failures**: none were listed for this round.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.3 open convex `C`: `P_μ(C; Ω) = μ^{n−1}(∂C ∩ Ω)` | `C = ∅`, `C = E`, `n = 0`; half-plane `{x_1 < 1}`; `ball(0,1) ⊂ ℝ²`; strip `{\|x_1\| < 1}`; quadrant; closed segment (not open) | both sides `0`; `φ(1) = 0.241971`; `e^{−1/2} = 0.606531`; `2φ(1) = 0.483941` (agrees with §2.2); `2 × 0.199471 = 0.398942 > I(1/4) = 0.317777`; segment: `P_γ = 0` against frontier measure `0.136176` | holds for open convex sets; openness needed, Check added |
| §2.3 route `∂^M C = ∂C` | corner of the quadrant; boundary point of a half-plane; point of the unit circle | closed-ball densities `1/4`, `1/2`, `1/2`, each in `(0, 1/2]` as the two bounds require | sound |
| §2.3 local finiteness | `C = {x_1 < 0}`, `B = ball(0, R)` | `P(C; B) = 2R`, finite; `P(C) = ∞` in `ℝ²`, so locality is needed | sound |
| §4.5 boundary route | `q = 3`, `J = {1,2}`, `v = (1/2,1/2,0)`; `q = 2`, `J = {1}`, `v = (1,0)`; piece bound at `c = 0`, `d = 1`, `q = 3` | `y_m → 0`, `A^m_12 → φ(0) = 0.398942`, others `→ 0`; `k = 1`: `A_12 = φ(c_m/√2) → 0 = I(1)`; on `{z_1 = z_2}`, `z_1 − z_3 = √1.5 s`, so the piece has area `φ(0)(1 − Φ(0.816497)) = 0.082624` by direct computation and by the formula; mean check at `c = 1`: `z_1 − z_3 = 1/2 = c/2` at `w = 0` | sound |
| §4.5 divergence step | `x_m + Ω^m_l ⊇ {z_l > z_j + C ∀ j ≠ l}` | nonempty: `z = t(e_l − 𝟙/q)` with `t > C` gives `z_l − z_j = t` | sound |
| §8.3 approximation, nonempty closed `A` | `A = {x_1 ≤ 0}`, `r = 1`; `A = {0} ⊂ ℝ`, `r = 0.1`; `A = ∅` | `∫‖∇f_1‖ dγ = Φ(1) − 1/2 = 0.341345 =` quotient; `(2Φ(0.1) − 1)/0.1 = 0.796557 = ` quotient (equality), limit `2φ(0) = 0.797885`, §8.2 reads `≥ I(0) = 0`; `∅`: `f_r ≡ 1`, `∫ f_r = 1 ≠ 0` | nonempty needed, added with Check |
| §8.3 second route to §8.2 | `A = {x_1 ≤ 0}` | `I(1/2) = 0.398942`, and `lim (Φ(r) − 1/2)/r = φ(0) = 0.398942` | sound |
| F05 sentence against Layer 7 | §7.1, §7.2, §7.3 headings and routes | half-line sections, convex density-one set, separating functional | agrees |
| F06 locator | MilmanNeeman2022 line 98–102 | Theorem 1.1 is the profile equality, Theorem 1.2 the uniqueness | agrees |

## For the maintainer

- No name of this roadmap changed; no other roadmap is affected.
- The review's "For the human reviewers" items (the Part II scope, the preprint licence, the Maggi2012 extract) were not acted on, as the brief directs.
- Ownership against open pull requests was checked through `roadmaps grep` over their heads.
