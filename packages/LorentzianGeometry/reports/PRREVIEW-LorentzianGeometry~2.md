# Review of LorentzianGeometry (pull request #2232 at e8f6039)

**Verdict:** needs changes

## R01 (P1) — Sorry'd data in three definitions; the gate fails

**Location:** `TauCetiRoadmap/LorentzianGeometry/Suggested.lean` lines 415, 442, 452: `iseqv := sorry`; `Quotient.liftOn τ (…) sorry`; `continuous := sorry`.

**Claim:** Unrepaired (previous R01). `TimelikeVectorField.setoid`, `TimeOrientation.IsFutureCausal` and `TimelikeVectorField.neg` have `sorry` in their bodies. `TimeOrientation`, the causal relations, `IsGloballyHyperbolic` and Geroch's theorem are built on them.

**Witness:** The gate at e8f6039 reports `sorry-data (3)` at lines 413, 440 and 450, status FAIL. Elaboration gives `sorry` warnings at the defs on lines 413, 440, 450 and 457.

**Repair:** Tested: a scratch copy with these changes elaborates with 0 errors at this head.
(a) After `variable [FiniteDimensional ℝ V]` (line 104), add the statement below and use it in `iseqv`:

```lean
theorem IsLorentzian.neg_of_neg_of_neg {b : LinearMap.BilinForm ℝ V} (hb : IsLorentzian b)
    {u v w : V} (hu : IsTimelike b u) (hv : IsTimelike b v) (hw : IsTimelike b w)
    (huv : b u v < 0) (hvw : b v w < 0) : b u w < 0 := by
  sorry

  iseqv :=
    { refl := fun T x ↦ T.isTimelike x
      symm := fun h x ↦ ((g.isLorentzian x).1.eq _ _).trans_lt (h x)
      trans := fun {T T' T''} h h' x ↦
        (g.isLorentzian x).neg_of_neg_of_neg (T.isTimelike x) (T'.isTimelike x)
          (T''.isTimelike x) (h x) (h' x) }
```

(b) Set the body of `TimeOrientation.IsFutureCausal` to `∃ T : TimelikeVectorField g, ⟦T⟧ = τ ∧ IsCausal (g x).toBilinForm v ∧ g x v (T.toFun x) < 0`.
(c) Delete `TimelikeVectorField.neg` and `TimeOrientation.neg`. Add `def causalPast (τ : TimeOrientation g) (q : M) : Set M := {p | q ∈ causalFuture τ p}` after `causalFuture`, and write `causalFuture τ p ∩ causalPast τ q` in `IsGloballyHyperbolic`.

## R02 (P1) — The Tau Ceti Minkowski declarations it cites do not exist at the pin

**Location:** README lines 307–309: "`TauCeti.minkowskiNormSq`, `TauCeti.futureCone`, `TauCeti.hyperboloid` (`TauCeti/Geometry/Hyperbolic/Hyperboloid/Basic.lean`)". Also lines 107–108, 998, 1003–1004, 1011, 1037–1038 and 1289, and `Suggested.lean` line 150.

**Claim:** Unrepaired (previous R02). The following are written as if supplied by declarations that the pinned Tau Ceti does not have: the supplier contract, the §C0.1 identity and its *Needs* item, the §C0.2 cone and hyperboloid bullet, and the §C2.3 Check.

**Witness:** Tau Ceti 2fd255d has no `Geometry/Hyperbolic`. `grep -rli "hyperboloid\|minkowski"` finds only lattice and Clifford files. On main, the future unit hyperboloid belongs to RiemannianGeometry R4.7 (`README.md` lines 2361–2363).

**Repair:**
- Delete the bullet at lines 307–309 and the §C0.1 *Needs* item "Tau Ceti Minkowski/hyperboloid comparison interfaces".
- Line 998: "`minkowskiForm E v v = −v.1² + ‖v.2‖²`".
- Lines 1003–1004: delete "and `TauCeti.minkowskiNormSq = 3`".
- Lines 1037–1038: "for `minkowskiForm E`, `timeCone (1, 0) = {v | ‖v.2‖ < v.1}`, and RiemannianGeometry R4.7's future unit hyperboloid is `{v ∈ timeCone (1, 0) | minkowskiForm v v = −1}`".
- Line 1289: "`I^+(0) = {t > |x|}`".
- Lines 107–108: "RelativisticQuantumFieldTheory's `minkowskiSquare` is the negative of the quadratic form of `minkowskiForm`".
- `Suggested.lean` line 150: "Its quadratic form is `-t² + ‖x‖²`."

## R03 (P1) — The Galloway–Ling–Sbierski proof needs continuous-metric results that no section owns

**Location:** README lines 1719–1720: "The proof uses §C6.3 for the given spacetime and only §C2.3 for the continuous extension." *Needs* at line 1727.

**Claim:**
- Galloway–Ling–Sbierski prove their theorem by finding a maximizing causal curve inside a globally hyperbolic neighbourhood in the continuous extension.
- That step needs limit curves, length semicontinuity and Avez–Seifert for continuous metrics.
- §C5.4 and §C6.3 state these only for smooth spacetimes (Hypotheses at lines 1615 and 1683), so no section owns them.

**Witness:** gallowaylingsbierski2018 line 319 (Theorem 2.4, p. 8) gives maximizers for globally hyperbolic C⁰ spacetimes, built on Lemma 2.2 (line 250) and Proposition 2.3 (line 271). Line 427 applies it in the extension.

**Repair:** Replace the sentence with: "For continuous Lorentzian metrics prove:
- causal curves in a small cylindrical neighbourhood have bounded auxiliary length;
- the limit-curve lemma for strongly causal spacetimes (Galloway–Ling–Sbierski, Lemma 2.2, p. 6, from Chruściel–Grant, Theorem 1.6);
- upper semicontinuity of length under uniform convergence (Proposition 2.3, p. 6);
- a maximizing causal curve joins causally related points of a globally hyperbolic spacetime (Theorem 2.4, p. 8).

The proof applies the last result in a neighbourhood of a boundary point of the extension." Add "§C2.2; the continuous-metric statements above" to *Needs*.

## R04 (P1) — §C6.7 uses Filippov solutions, which nothing defines

**Location:** README lines 1856–1857: "to a `C^{1,1}` curve with null velocity everywhere that solves the geodesic equation in Filippov's sense". Line 1890: "Filippov solutions of differential inclusions as specified here".

**Claim:** The locally Lipschitz conclusion of §C6.7 depends on a notion that no section, supplier or pinned declaration defines. The *Needs* line points to a specification that §C6.7 does not contain.

**Witness:**
- `grep -n Filippov README.md` matches lines 1857, 1859, 1890 and 2051: the statement, the `C¹` remark, the *Needs* line and the reference. None defines the term.
- Neither pinned Mathlib nor Tau Ceti contains "Filippov" or "differential inclusion".

**Repair:** Insert before the generator statement: "For a locally bounded measurable Christoffel field `Γ` in a chart, a `C^{1,1}` curve `x` solves the geodesic equation in Filippov's sense if, for almost every `s`, `x″(s)` lies in `⋂_{δ>0} ⋂_{|N|=0} closure conv {−Γ_y(x′(s), x′(s)) : y ∈ B_δ(x(s)) \ N}`. Prove that this does not depend on the chart and, for continuous `Γ`, is equivalent to `x″ = −Γ_x(x′, x′)`." In *Needs*, replace the Filippov item with "§F1.4 for the chart Christoffel field".

## R05 (P2) — Statable headline theorems are absent; Suggested.lean is still an API catalogue

**Location:** `Suggested.lean` lines 12–15: "This file is not the roadmap and is not exhaustive. … The statements here suggest Lean forms for particular milestones, so that contributors and reviewers converge on names and signatures". This round adds lines 165–204, 499–504 and 693–702.

**Claim:** Unrepaired (previous R03).
- Geroch's theorem is still the only headline stated.
- These are statable at the pins but absent: Galloway–Ling–Sbierski, Minkowski C⁰-inextendibility, the Cauchy temporal function and Avez–Seifert.
- The docstring does not name Hawking, Penrose or §C6.7 as unstatable, nor the carrier each lacks.

**Witness:** A scratch copy elaborates with 0 errors. It adds the two statements below, using `CovariantDerivative.accelerationWithin` (Tau Ceti `AlongCurve/Acceleration.lean`:77) and `ContMDiffNondegenerateMetric.leviCivitaConnection` (`…/Nondegenerate/Existence.lean`:102).

**Repair:** Tested on that copy.
- Add `public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.AlongCurve.Acceleration`.
- In `namespace LorentzianMetric`, add:

```lean
def IsTimelikeGeodesicallyComplete (hk : ∞ ≤ k) : Prop :=
  ∀ (γ : ℝ → M) (a b : ℝ), a < 0 → 0 < b → ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ (Ioo a b) →
    IsTimelike (g (γ 0)).toBilinForm (mfderiv 𝓘(ℝ, ℝ) I γ 0 1) →
    (∀ t ∈ Ioo a b, CovariantDerivative.accelerationWithin
      (g.val.toSmoothMetric hk).leviCivitaConnection γ (Ioo a b) t = 0) →
    ∃ γ' : ℝ → M, EqOn γ' γ (Ioo a b) ∧ ContMDiff 𝓘(ℝ, ℝ) I 2 γ' ∧
      ∀ t, CovariantDerivative.accelerationWithin
        (g.val.toSmoothMetric hk).leviCivitaConnection γ' univ t = 0

theorem isInextendible_zero_of_isGloballyHyperbolic [I.Boundaryless] [T2Space M]
    [SecondCountableTopology M] [ConnectedSpace M] (hk : ∞ ≤ k) (τ : TimeOrientation g)
    (h : IsGloballyHyperbolic τ) (hc : IsTimelikeGeodesicallyComplete (g := g) hk) :
    g.val.IsInextendible 0 := by
  sorry
```

- After `end Manifold`, add:

```lean
theorem minkowski_isInextendible_zero (F : Type) [NormedAddCommGroup F]
    [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
    (g : ContMDiffNondegenerateMetric (I := 𝓘(ℝ, ℝ × F)) (M := ℝ × F) ∞)
    (hg : ∀ x, (g x).toBilinForm = minkowskiForm F) : g.IsInextendible 0 := by
  sorry
```

- Add the Cauchy-temporal-function and Avez–Seifert statements from the previous review's R03, with `timeSeparation`.
- Replace lines 12–15 with: "`README.md` is the roadmap; this file states its headline theorems against the pinned APIs. Not statable at the pins:
  - Hawking's theorem and the timelike focusing lemma (no second fundamental form of a hypersurface);
  - Penrose's theorem and the null focusing lemma (no null expansion of a codimension-two surface);
  - the generator theorems of §C6.7 (no Levi-Civita connection of a `C¹` metric)."
- Delete the interface theorems the headlines do not use; the README keeps them:
  - the §C0 basis and cone theorems, `not_nondegenerate_restrict_ker_iff`, the coefficient-ODE block and `isLorentzian_iff_signature`;
  - `card_timeOrientation`, `exists_smooth_rep`, `isOpen_chronologicalFuture` and the four `*_conformal` theorems;
  - `IsFutureTimelikeLipschitzCurve`, `acousticalShear`, `acousticalForm` and `isLorentzian_acousticalForm`.
- Then delete the definitions no remaining statement uses: `IsOpticalFunctionOn`, `IsNullHypersurface`, `IsStrong`, `sharp`, `inverseApply`, `IsConformal`, `transportTimeOrientation`, `geodesicRHS` and `HasSignature`.

## R06 (P2) — Suppliers are named as consumers: two-way hand-offs with RiemannianGeometry, LocalVariationalFieldTheory and RelativisticQuantumFieldTheory

**Location:** README lines 54–56: "RiemannianGeometry R1–R3 and R5a supply curvature, Jacobi, index and immersion interfaces. Extend their reusable constructions in those shared APIs and preserve their positive-definite public interfaces by specialization." Also line 84 and lines 1994–2001.

**Claim:** Unrepaired (previous R04). Each of these three roadmaps comes before this one: RiemannianGeometry and LocalVariationalFieldTheory are on main, and RelativisticQuantumFieldTheory is at position 215 of the merge order against this roadmap's 408. Line 84 and lines 1994–2001 nevertheless name them as consumers of §C2.1, §C2.3 and Part I.

**Witness:**
- §F1.5 needs LVF6's divergence (line 674), while line 1996 has LVF6 take `LorentzianMetric`.
- §F3.1 needs R5a (line 920), while lines 1998–2001 have RiemannianGeometry use Part I.
- RelativisticQuantumFieldTheory `Suggested.lean` line 79 already defines a flat `causalFuture`.

**Repair:**
- Replace the last sentence of lines 54–56 with: "For positive-definite `g`, prove that this roadmap's curvature, Jacobi, index and immersion objects agree with those of RiemannianGeometry R1–R3 and R5a."
- Delete "which may consume §C2.3's `J^±`" at line 84.
- Delete the RelativisticQuantumFieldTheory, LVF6 and RiemannianGeometry bullets at lines 1994–2001.
- Add to §C2.3: "On Minkowski space, `J^+(p)` equals RelativisticQuantumFieldTheory §1.1's `causalFuture {p}` after the signature conversion of the Conventions."

## R07 (P2) — The causal criterion of §C1.3 lacks `c > 0`

**Location:** README lines 1151–1152: "The vector `∂_t + Y`, `Y ∈ T_xΣ`, is causal iff `|Y − v|_h ≤ c` and null iff `|Y − v|_h = c`".

**Claim:** Line 1135 lets `c` be any real function ("speed `c` and velocity `v` arbitrary pointwise"), and both equivalences fail where `c < 0`. `isCausal_acousticalForm_iff` in `Suggested.lean` assumes `0 < c`.

**Witness:** `c = −1`, `Y = v`: `g(∂_t + v, ∂_t + v) = −1 < 0` is causal, but `0 ≤ −1` is false. For `|Y − v| = 1` the vector is null, but `1 ≠ c`.

**Repair:** "At a point with `c > 0`, the vector `∂_t + Y`, `Y ∈ T_xΣ`, is causal iff `|Y − v|_h ≤ c` and null iff `|Y − v|_h = c`."

## R08 (P3) — Padding in Suggested.lean

**Location:** `Suggested.lean` lines 157–159, 182–191, 200–202, 278–291, 335–343, 395–396, 680–691 and 693–702.

**Claim:** Unrepaired (previous R05), with new cases. Each declaration restates a definition, closes in one tactic, or covers the one-point-curve boundary case.

**Witness:**
- `acousticalForm_apply_flow` closes by `simp`; `futureDomainOfDependenceIn_subset` is `fun _ hp ↦ hp.1`.
- The scratch copy proves the slab theorem from the definitions via the one-point curve on `{0}`, and `isCausal_acousticalForm_iff` by `simp only` and `nlinarith`.

**Repair:** Delete these from `Suggested.lean`; the README keeps each statement:
- `minkowskiForm_self`, `acousticalForm_apply`, `acousticalForm_apply_flow` and `isCausal_acousticalForm_iff`;
- `flat_sharp`, `sharp_flat`, `isStrong_of_finiteDimensional`, `toSmoothMetric_ofSmoothMetric`, `ofSmoothMetric_toSmoothMetric` and `LorentzianMetric.isLorentzian`;
- `futureDomainOfDependenceIn_subset`, written inline at line 709 as `(fun _ hp ↦ hp.1)`;
- `inter_subset_futureDomainOfDependenceIn`, `futureDomainOfDependenceIn_inter_level` and `IsTimeFunctionOn`.

## R09 (P3) — The §C2.3 openness of `I^+(p)` is cited to a section about another curve class

**Location:** README line 1285: "`I^+(p)` is open for continuous `g` (Chruściel–Grant, §1)".

**Claim:** Unrepaired (previous R06). "§1" is not a locator, and the openness proved there is for `Ǐ^+` (locally uniformly timelike curves), not for the piecewise-`C¹` `I^+` defined here.

**Witness:** chruscielgrant2012 line 229 (Proposition 1.4, p. 6) concerns `Ǐ^+`. sbierski2018 line 345 (Proposition 2.6, p. 8) proves openness for continuous metrics with piecewise smooth timelike curves (Definition 2.1, line 269).

**Repair:** Cite "(Sbierski 2018, Proposition 2.6, p. 8)". The previous review gave p. 9; the proposition is on p. 8.

## R10 (P3) — §C5.4 cites this README's own section number and assumes strong causality

**Location:** README lines 1623–1624: "In a strongly causal spacetime the Lorentzian length is upper semicontinuous under this convergence (Beem–Ehrlich–Easley, §C3.3)."

**Claim:** Unrepaired (previous R07). "§C3.3" is this README's null-generator section, and upper semicontinuity needs no causality condition.

**Witness:** README line 1411 is the heading "C3.3 Null generators and boundary persistence". minguzzi2019 line 1849 (Theorem 2.41, p. 43) proves `lim sup l(γ_n) ≤ l(γ)` for h-uniformly convergent causal curves, with no causality hypothesis.

**Repair:** "The Lorentzian length is upper semicontinuous under this convergence (Minguzzi 2019, Theorem 2.41, p. 43)."

## R11 (P3) — §C4.3 cites a `C²` result for `C^{1,1}` metrics

**Location:** README lines 1510–1513: "For `C^{1,1}` `g`, `J^+(p)` defined with Lipschitz causal curves equals the set defined with piecewise-`C¹` causal curves … (Chruściel, *Elements of causality theory*, §2; Minguzzi, *Convex neighborhoods…*)".

**Claim:** Unrepaired (previous R08). Chruściel's statement assumes a `C²` metric, and the Minguzzi citation has no theorem number.

**Witness:**
- chrusciel2011 line 1042 (Corollary 2.4.11, p. 28) assumes a `C²` metric.
- minguzzi2015convex Theorem 7 (line 743, p. 18) treats causal curves of `C^{1,1}` metrics; Theorem 6 (line 673, p. 16) joins them by causal geodesics.

**Repair:** "(Minguzzi, *Convex neighborhoods for Lipschitz connections and sprays*, Theorems 6 and 7, pp. 16–18; for `C²` metrics, Chruściel, *Elements of causality theory*, Corollary 2.4.11, p. 28)".

## R12 (P3) — Locators are missing or give only a chapter or author

**Location:**
- No locator in §F0.1–§F1.5, §F1.7–§F2.3, §F3.1–§F4.2, §C0.1–§C2.2, §C2.4–§C3.2, §C3.4, §C4.4, §C6.5–§C6.6 or §C7.2.
- "O'Neill, Ch. 14" alone at lines 180, 197, 1561, 1584, 1643, 1649, 1663, 1665, 1690, 1693, 1964 and 1967.
- Author names only at lines 1272, 1425, 1602, 1623, 1718–1719, 1848 and 1857.

**Claim:** Unrepaired (previous R09). The new §C1.3, §C6.6 and §C6.7 add targets with no locator or with author names only.

**Witness:** These statements are numbered in cached texts:
- minguzzi2019: Theorem 2.32 (line 1651), Theorem 4.100 (line 5912), Theorems 4.119–4.124 (lines 6195–6248);
- chruscielgrant2012: Lemma 1.22 (line 642);
- gallowaylingsbierski2018: Theorem 1 (line 27);
- sbierski2018: Theorem 3.1 (line 551).

**Repair:**
- §C5.1: Minguzzi 2019, Theorem 2.32, p. 39. §C5.2: Proposition 4.18, p. 113. §C5.3: Theorem 4.100, p. 140.
- §C6.3: Definition 4.117, p. 146; Theorem 4.119, p. 147 (Geroch); Theorem 4.120, p. 147 (splitting); Theorem 4.123, p. 148 (Avez–Seifert); Theorem 4.124, p. 148 (`τ` finite and continuous).
- §C6.4: Galloway–Ling–Sbierski, Theorem 1, p. 1; Sbierski 2018, Theorem 3.1, p. 13.
- §C6.7: Chruściel–Grant, Corollary 1.17 (p. 16), Lemma 1.22 (p. 17) and Corollary 1.26 (p. 19). For its third Check: Theorem 1.20 (i), p. 17, and Proposition 1.10 (vi), p. 9.
- §C3.3: Galloway 2004, Proposition 3.1, p. 5.
- §C4.1: Minguzzi, *Convex neighborhoods…*, Theorem 6, p. 16. §C4.2, push-up: Corollary 1, p. 20.
- Give every remaining O'Neill and Hawking–Ellis citation a theorem number and page. Do the same for the Grant–Kunzinger–Sämann–Steinbauer, Lange–Lytchak–Sämann and Graf–Ling citations.

## R13 (P3) — The README and Suggested.lean name different declarations

**Location:** README line 166: "Lean bundles the metric and the time orientation (`TimeOrientedLorentzianMetric`)". Also lines 185, 218–222, 551, 777, 797, 1195, 1227, 1559 and 1859.

**Claim:** Unrepaired (previous R10), and now wrong in both directions.
- `Suggested.lean` declares none of these README names of the roadmap's own: `TimeOrientedLorentzianMetric`, `IsLocallyHolder`, `CovariantDerivative.IsGeodesicOn`, `cov.expDomain`, `cov.exp`, `TimeConeCover`, `IsFutureCausalPiecewiseCurve` and `timeSeparation`.
- 48 of the 87 named Lean declarations appear nowhere in the README.

**Witness:**
- `grep -c` in `Suggested.lean` gives 0 for each README name listed.
- The README never mentions `isGloballyHyperbolic_iff_exists_isCauchySurface`, `IsCausalSpacetime`, `futureDomainOfDependenceIn_self` or `IsTimeFunctionOn`.
- RiemannianGeometry `README.md` line 162 calls the second fundamental form `B`, not `II`.

**Repair:**
- Declare `timeSeparation` with the Avez–Seifert headline of R05, and write the other seven names in prose.
- At line 166, write "Lean takes `τ : TimeOrientation g` as a separate argument".
- At line 185, replace `II` with `B`.
- At lines 218–222, use the names `Suggested.lean` declares.
- After the deletions of R05 and R08, name each remaining Lean declaration in its README section, for example "(`isGloballyHyperbolic_iff_exists_isCauchySurface`)" in §C6.3.

## R14 (P3) — The README does not follow the house shape

**Location:** The headings `## Build order and hypotheses` (line 355), `## Part I: shared foundations` (line 380) and `### F0 …`. The `*Hypotheses:*` line that opens each subsection, now also at lines 1135, 1757 and 1845.

**Claim:** Unrepaired (previous R11).
- There is no `## How to read the build` and no `## Layer k:` heading.
- No layer ends with `### Examples` and `### Dependencies`.
- Definitions have no API bullet lists.
- Most subsections have fewer than three Checks.

**Witness:** Checks per subsection:
- none: §C4.2 and §C6.1;
- one: §C5.3 and §C6.4;
- two: §F0.1, §F0.2, §F1.1, §F1.3, §F1.6, §F1.7, §F2.3, §F2.4, §F3.1, §F4.1, §F4.2, §C1.1, §C2.4, §C3.3, §C3.4, §C4.1, §C4.3, §C4.4, §C5.2, §C5.4, §C6.5 and §C7.3.

**Repair:**
- Use `## How to read the build` and `## Layer k: <mathematics>` headings (for example `## Layer 9: Cauchy theory and global hyperbolicity` for §C6).
- End each layer with `### Examples` and `### Dependencies`.
- Fold each `*Hypotheses:*` line into its target's sentences.
- Give each definition API bullets and at least three computed Checks; for §C6.1, for example, `edge{t = 0, |x| ≤ 1} = {(0, ±1)}` in ℝ^{1+1}.

## R15 (P3) — Process narrative in the README

**Location:** README lines 351–353: "it did not land, and §F0/§C0 use Mathlib's `LinearMap.BilinForm` predicates directly. If Mathlib later adopts an indefinite scalar-product carrier, adopt it." Also lines 34, 41 and 348–349.

**Claim:** Unrepaired (previous R12). Status reports and instructions to contributors make the README time-bound. The Mathlib pull request itself may stay as prior art.

**Witness:** Line 34: "Audit each supplier used below for unnecessary positivity assumptions;". Line 41: "Comparison lemmas bridge existing representations during integration;". Lines 348–349: "coordinate notation and the signature conversion with its authors where practical".

**Repair:**
- Replace lines 351–353 with "; §F0/§C0 use Mathlib's `LinearMap.BilinForm` predicates directly."
- Delete the clause "coordinate notation … where practical".
- Delete the sentence that begins "Audit each supplier", and the clause "Comparison lemmas bridge existing representations during integration;".

## R16 (P3) — Docstrings in Suggested.lean give instructions and overclaim; four declarations have none

**Location:** `Suggested.lean` lines 37–39: "In Tau Ceti, generalize the existing carrier and preserve its smooth interface". Line 247: "Generalize that carrier in place". Lines 125–126: "with equality iff `v, w` are linearly dependent".

**Claim:** Unrepaired (previous R13).
- Docstrings give implementation instructions.
- The docstring of `mul_le_sq` asserts an equality case that its statement lacks.
- `minkowskiForm_self`, `isLorentzian_minkowskiForm`, `acousticalForm_apply` and `futureDomainOfDependenceIn_subset` have no docstring.

**Witness:** The elaborated type of `IsLorentzian.mul_le_sq` is `b v v * b w w ≤ b v w ^ 2`, with no equality clause. Lines 157, 161, 182 and 680 have no `/-- … -/` above them.

**Repair:**
- In lines 35–39 and 246–249, state the mathematics of the carrier and delete the "generalize … in place" sentences.
- Cut line 126 to the inequality.
- Give every declaration that remains a docstring. For line 161: "/-- **§C0.1.** `minkowskiForm E` is Lorentzian when `E` is finite-dimensional. -/".

## R17 (P3) — A §C6.7 Check uses a metric that is not Lorentzian on all of ℝ^{1+1}

**Location:** README lines 1884–1885: "On `ℝ^{1+1}` with `−dt² + (1 + t|t|^α) dx²`, `0 < α < 1` (§F1.3), the metric is `C¹` and not `C^{1,1}`".

**Claim:** For `t ≤ −1` the coefficient `1 + t|t|^α` is not positive, so the form is degenerate or negative definite there. §F1.3 states the same example on `(−1/2, 1/2) × ℝ`.

**Witness:** For `α = ½` and `t = −2`, `1 + (−2)·2^{1/2} ≈ −1.83`, so the form is `−dt² − 1.83 dx²`, which is negative definite. At `t = −1` it is degenerate.

**Repair:** "On `(−1/2, 1/2) × ℝ` with `−dt² + (1 + t|t|^α) dx²`, `0 < α < 1` (§F1.3), the metric is `C¹` and not `C^{1,1}`; …".

## R18 (P3) — §C6.6 gives "time function" a second, weaker meaning

**Location:** README lines 1801–1802: "call `t : M → ℝ` a time function on `D` if `t ∘ γ` is strictly increasing on `J` for every future causal curve in `D`". Also `Suggested.lean` lines 693–695 (`IsTimeFunctionOn`).

**Claim:** §C5.3 (line 1598) and the literature define a time function as continuous and strictly increasing along future causal curves. §C6.6 drops continuity but keeps the name.

**Witness:** On Minkowski space, `t + H(t)` (`H` the Heaviside function) increases strictly along future causal curves and jumps at `t = 0`: a time function on `D = M` under §C6.6, not under §C5.3.

**Repair:**
- README: "call `t : M → ℝ` a time function on `D` if `t` is continuous on `D` and `t ∘ γ` is strictly increasing on `J` for every future causal curve in `D`".
- Lean, if the definition survives R08: `ContinuousOn t D ∧ ∀ γ J, 𝔤.IsFutureCausalCurveIn γ J → StrictMonoOn (t ∘ γ) J`.
- The slab statement and its proof use only the monotonicity clause.

## R19 (P3) — A §C2.3 Check points to the wrong section for push-up

**Location:** README line 1293: "Push-up `J^+ ∘ I^+ ⊆ I^+` is not asserted here; it is §C4.3 for smooth metrics."

**Claim:** Push-up is proved in §C4.2 for `C^{1,1}` metrics and in §C6.7 for locally Lipschitz metrics. §C4.3 is about agreement of causal-curve classes.

**Witness:** Line 1499 (§C4.2): "Prove on a time-oriented `C^{1,1}` Lorentzian manifold: push-up". Line 1847 (§C6.7): "Extend to locally Lipschitz metrics …: push-up". Line 1506 is the heading "C4.3 Agreement of causal-curve classes".

**Repair:** "Push-up `J^+ ∘ I^+ ⊆ I^+` is not asserted here; it is §C4.2 for `C^{1,1}` metrics and §C6.7 for locally Lipschitz metrics."

## R20 (P3) — §C1.3 cites RiemannianGeometry R1 for a metric that Tau Ceti already has

**Location:** README lines 1167–1168: "use Mathlib's `Circle` for each periodic factor, with the unit round metric of RiemannianGeometry R1". *Needs* at line 1173: "RiemannianGeometry R1 for the round circle".

**Claim:** R1 states no metric on the circle, and the pinned Tau Ceti already has one.

**Witness:** `TauCeti.roundMetricCircle` is at `TauCeti/Geometry/Manifold/Riemannian/Circle.lean` line 40 at pin 2fd255d. RiemannianGeometry `README.md` lines 863–1282 (R1) mention no circle metric.

**Repair:**
- Write "…with Tau Ceti's `TauCeti.roundMetricCircle`" at lines 1167–1168.
- In *Needs*, replace the R1 item with "Tau Ceti `TauCeti.roundMetricCircle`".
- Add the declaration to `### From Tau Ceti`.

## R21 (P3) — The description omits the subset, horizon and acoustical sections

**Location:** Pull-request description: "Part II specializes to Lorentzian cones, time orientation, causal and null geometry, global hyperbolicity, inextendibility and singularity theorems."

**Claim:** The head's summary (README lines 10–13) adds three topics that the description does not mention:
- domains of dependence inside arbitrary subsets of manifolds with boundary or corners (§C6.6);
- achronal boundaries and Cauchy horizons of `C¹` metrics (§C6.7);
- acoustical metrics (§C1.3), with a hyperbolic-PDE consumer.

**Witness:** The README has the headings `#### C1.3 Acoustical metrics on product spacetimes`, `#### C6.6 Causal curves and domains of dependence in subsets` and `#### C6.7 Achronal boundaries and Cauchy horizons of C¹ metrics`.

**Repair:** Append to that sentence: "It also defines domains of dependence inside arbitrary subsets of manifolds with boundary or corners for continuous metrics (§C6.6), treats achronal boundaries and Cauchy horizons of locally Lipschitz and `C¹` metrics (§C6.7), and takes acoustical metrics on `ℝ × Σ` as the model (§C1.3)."

## Verified sound

| Target | Instances | Roadmap value | Computed or source value | Result |
| --- | --- | --- | --- | --- |
| Shared foundations | Tau Ceti curvature modules at the pin | Existing scalar, Einstein and sectional APIs are positive-definite | `Scalar.lean`:55, `Einstein.lean`:67, `Sectional.lean`:63 assume `[RiemannianBundle …]` | sound; wording R15 |
| Locality and bundles | Mathlib connection carriers | `CovariantDerivative`, `IsCovariantDerivativeOn`, `ContMDiffCovariantDerivative` graded by `ℕ∞ω` | `CovariantDerivative/Basic.lean`:366, :92, :412 | sound |
| Signature and generality | `sigNeg`; zero vector; RQFT and LVF signs | index is `sigNeg`; 0 is spacelike; both use (+−−−) | `Signature.lean`:98; minguzzi2019 line 306 (p. 7); RQFT README line 20; LVF README line 612 | sound except R02 |
| Dimension and strength | weighted ℓ², `Σ u_j v_j/(j+1)²` | weak, not strong | ‖g♭e_j‖ = (j+1)⁻² → 0, so g♭ is not bounded below | sound |
| Where index one is needed | (p,q) = (1,2); null L in (p,q) | negative vectors connected; screen signature (p−1,q−1) | {y₁²+y₂² > x²} is connected; L^⊥/ℝL has (p−1,q−1) | sound |
| Manifolds and regularity | `1 + max(t,0)²`; §C6.6 boundary clause | `C^{1,1}`, not C²; corners allowed in §C6.6 | f′ = 2max(t,0) is Lipschitz; f″ jumps 0 → 2; line 1757 agrees | sound |
| Curvature | −dt² + a²dx², a = cosh t | K = a″/a = 1 | R(∂x,∂t)∂t = −(a″/a)∂x; K = (−a″a)/(−a²) = 1 | sound |
| Time orientation | relation g(T,T′) < 0 | an equivalence by §C0.2 (b) | reflexive, symmetric and transitive; Lean `iseqv := sorry`; repaired copy has 0 errors | R01 |
| Curves | f = ½∫sign sin(1/u) | Lipschitz, timelike a.e., not piecewise C¹ | velocity (1, ±½); g = −1 + ¼ = −¾ | sound |
| Lengths and time separation | Minkowski (2,0), (1,1), (0,1) | τ = 2, 0, 0 | √4 = 2; null gives 0; (0,1) ∉ J⁺(0); same sup as minguzzi2019 line 1637 (p. 39) | sound |
| Hypersurfaces | unit hyperboloid in ℝ^{1,3} | k = h, H = 3 | ∇_Xν = X gives k = h and H = 3; the RiemannianGeometry name is `B` | R13 |
| Domains of dependence | D = {t ≥ 0}, S = {t = 0, x ≥ 0} in ℝ^{1+1} | D⁺_D(S) = {0 ≤ t ≤ x} | J⁻(t,x) ∩ {t=0} = [x−t, x+t] ⊆ [0,∞) iff x ≥ t; minguzzi2019 Def 3.1 (line 3578, p. 84) | sound |
| Extensions | Sbierski; GLS | proper smooth isometric embedding, same dimension, connected target | sbierski2018 lines 42–44 (p. 2); gallowaylingsbierski2018 lines 348–351 (p. 8) | sound |
| Names | Tau Ceti homes; listed names | homes exist; `LinearMap.BilinForm.IsLorentzian` etc. | `BilinearForm/` and `NondegenerateMetric/` exist; Lean declares `TauCetiRoadmap.LorentzianGeometry.IsLorentzian` | R13 |
| Geroch (stated) | (ℝ, −dt²); (S¹, −dθ²) | GH ⇔ Cauchy surface | {0} is Cauchy and GH; on S¹ not causal and a loop meets {θ = 0} repeatedly: both sides false | sound |
| GLS C⁰-inextendibility | Milne region; proof route | complete and GH ⇒ C⁰-inextendible; only §C2.3 in the extension | Milne is extendible and incomplete, consistent; Theorem 2.4 (p. 8) used in extension (line 427) | R03; statable, R05 |
| Minkowski C⁰-inextendibility | sbierski2018 Theorem 3.1 | all d ≥ 1 | line 551 (p. 13) "for every d ≥ 1"; statement elaborates | R05 |
| Cauchy temporal function | Minkowski, `t` | level sets Cauchy, dt(v) > 0 on future causal v | `t` satisfies both | R05 (absent) |
| Avez–Seifert | Minkowski minus (1,0); p = 0, q = (2,0) | a maximizer exists when GH | sup 2 not attained; the space is not GH: consistent | R05 (absent) |
| Hawking | Milne region, reversed orientation, n = 1 | length ≤ n/\|b\| | H = −1/t₀; bound t₀ attained by t ↦ (t, x₀) | sound; not statable |
| Penrose | {t = 0, \|x\| = r} in ℝ^{1,3} | trapped ⇒ null incomplete | θ± = ±2/r: untrapped, consistent | sound; not statable |
| §C6.6 determination (stated) | U = ℝ^{1+1}, S = {t=0, x≥0}, D′ = {0 ≤ t ≤ x} | D⁺_{D′}(S) = D′ | past of p ∈ D′ meets {t=0} in [x−t, x+t] ⊆ [0,∞); both cases of the sketch hold | sound |
| §C1.3 causal criterion | c = −1, Y = v | causal iff \|Y−v\| ≤ c | g = −1 < 0, causal; \|Y−v\| = 0 > −1 | R07 |
| §C1.3 Lorentzian form | c = 2, v = 0; c = 0 | Lorentzian iff c ≠ 0; radical span B at c = 0 | shear diag(2, id) invertible; at c = 0, g((a,X),·) = 0 iff X = av | sound |
| §C1.3 Check 1 | (t,x) ↦ (ct, x−vt) | isometry; x¹ = (v¹+c)t is null | pullback −c²dt² + \|dx−vdt\|²; g⁻¹(ξ,ξ) = −c⁻²c² + 1 = 0 for ξ = dx¹ − (v¹+c)dt | sound |
| §C1.3 Check 2 | round circle | supplied by R1 | R1 has no circle metric; `TauCeti.roundMetricCircle` at `Riemannian/Circle.lean`:40 | R20 |
| §C6.6 slab | one-point curve at p with t(p) = t₀ | D⁺_D(S) ∩ {t=t₀} = S ∩ D | proved from the definitions in about 20 lines in the scratch copy | R08 |
| §C6.6 time function | t + H(t) on Minkowski space | a "time function on D" | strictly increasing and discontinuous: §C6.6 yes, §C5.3 no | R18 |
| §C6.6 acoustical Check | constant c, v; D = {t ≥ 0}, S = {t=0, x¹ ≥ 0} | D⁺_D(S) = {x¹ ≥ (v¹+c)t} | past at t = 0 is x − tv + B(ct), inside {x¹ ≥ 0} iff x¹ ≥ (v¹+c)t | sound |
| §C6.7 Check 1 | t ↦ (t, x₀ + t(v + ce₁)) | null generator of x¹ = (v¹+c)t | \|Y−v\| = c, so null; it lies in the hyperplane when x₀¹ = 0 | sound |
| §C6.7 Check 2 | α = ½, t = −2 | Lorentzian on ℝ^{1+1} | 1 − 2·2^{½} ≈ −1.83: negative definite | R17 |
| §C6.7 slice identity | S closed in {t = t₀} | ∂D⁺_U(S) ∩ {t>t₀} = H⁺_U(S) ∩ {t>t₀} | I⁻(D⁺) ∩ {t>t₀} ⊆ D⁺, by concatenating with a timelike segment above t₀ | sound |
| §C6.7 push-up | Chruściel–Grant | push-up and I⁺ = int J⁺ for Lipschitz g | Corollary 1.17 (p. 16), Lemma 1.22 (p. 17), Corollary 1.26 (p. 19) | sound; locator R12 |
| §C2.3 openness | Ǐ⁺ against piecewise-C¹ I⁺ | open, citing §1 | Proposition 1.4 (p. 6) treats Ǐ⁺; sbierski2018 Proposition 2.6 (p. 8) treats piecewise smooth curves | R09 |
| §C5.4 semicontinuity | γ_n(s) = (s, s/n) | requires strong causality | √(1−1/n²)·s → s; minguzzi2019 Theorem 2.41 (p. 43) has no causality hypothesis | R10 |
| §C4.3 agreement | Chruściel Corollary 2.4.11 | holds for C^{1,1} | chrusciel2011 line 1042 (p. 28) assumes C²; minguzzi2015convex Theorem 7 (p. 18) covers C^{1,1} | R11 |
| §C0.2 reverse inequalities | v = (1,0), w = (2,1) | 3 ≤ 4; √8 ≥ 1 + √3 | (−1)(−3) = 3, (−2)² = 4; 2.83 ≥ 2.73 | sound |
| §F2.4 Gauss lemma | minguzzi2015convex | "Minguzzi, Theorem 5" | line 561 (Theorem 5, p. 14): C^{1,1}, dD²_p = 2g(P,·) | sound |

- Gate (the worker's run at e8f6039): FAIL on `sorry-data=3` (lines 413, 440, 450); every other check 0. Dependency check: `depcheck: 206 roadmaps, 1898 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: 0 errors and 30 `sorry` warnings. `#check @` of the new §C1.3 and §C6.6 declarations matches their README statements. The 31 declarations flagged for dropped binders are definitions that do not need `[FiniteDimensional ℝ E]`; no change.
- Scratch copy with the R01 repair, the GLS and Minkowski statements, and proofs of the slab theorem and `isCausal_acousticalForm_iff`: 0 errors and 29 `sorry` warnings.
- Source locators checked against the text: 35 (minguzzi2019 12; chruscielgrant2012 7; gallowaylingsbierski2018 6; sbierski2018 4; minguzzi2015convex 4; galloway2004 1; chrusciel2011 1).
- Library declarations opened at the pins:
  - Mathlib: `sigPos`/`sigNeg` (`Signature.lean`:65, :98) and the Sylvester lemmas (`Real.lean`:78, `Signature.lean`:251); the connection carriers (`CovariantDerivative/Basic.lean`:92, :108, :366, :412); no Filippov API.
  - Tau Ceti: `leviCivitaConnection` (`Existence.lean`:102), `accelerationWithin` (`Acceleration.lean`:77), `curvatureTensor` (`Tensor.lean`:152), `ricciTensor` (`Ricci.lean`:65), `roundMetricCircle` (`Circle.lean`:40).
  - Absent at the pin: `minkowskiNormSq`, `futureCone` and `hyperboloid`.
- Cross-roadmap citations resolved on main: HopfRinow Layer 1 (line 264); RiemannianGeometry R1 (863), R2 (1283), R3 (1511), R4.7 (2361) and R5a (2840); PDE §1.7 (996); DifferentialGeometry Layers 2–3 (1005, 1253); SmoothBundlesConnections B3–B5 (871–1209); LVF Layer 6 (1033). At its open head: RelativisticQuantumFieldTheory §1.1 and `Suggested.lean` lines 69 and 79.
- README Checks recomputed in the sampled and new sections: 26, all correct except the second Check of §C6.7 (R17).
- Overlap check: read RiemannianGeometry (on main; its open revisions #2222–#2226 change R4.1, R5c, R7.9, Layer 6 and minimal surfaces, none of them an id cited here), HopfRinow, RicciFlow, RelativisticQuantumFieldTheory and LocalVariationalFieldTheory.
  - Semi-Riemannian generalizations of curvature, Jacobi and immersion objects: this roadmap, but RiemannianGeometry R1–R3 and R5a supply them and are listed as consumers (R06).
  - The hyperboloid and O⁺(n,1): RiemannianGeometry R4.7 (R02).
  - The flat Minkowski `J^±`: RelativisticQuantumFieldTheory §1.1 (R06).
  - Hilbert stress-energy and divergence: LVF Layer 6.
  - RicciFlow: nothing shared.
  - `roadmaps grep` over every open head for globally hyperbolic, Cauchy surface, time orientation, domain of dependence, acoustical metric, Raychaudhuri and trapped surface finds only this roadmap. No other `Suggested.lean` uses its namespace.

## Not verifiable

- oneill1983, hawkingellis1973, beemehrlicheasley1996, wald1984 and christodoulou2007 are settled as uncertified (paywalled), so their chapter and proposition locators were not checked.
- Grant–Kunzinger–Sämann–Steinbauer 2020, Lange–Lytchak–Sämann 2021, Graf–Ling 2018, Filippov 1988 and Sämann 2016 are not in the manifest, and this review edits no manifest.
- Geroch 1970, Bernal–Sánchez 2003–2007, Minguzzi 2008, Nomizu–Ozeki 1961, Kobayashi–Nomizu Vol. I, Penrose 1965, Hawking 1967, Joyce, Bruveris, Michor–Mumford and LeFloch–Mardare are not in the manifest and not cached.

## Source issues

- none
