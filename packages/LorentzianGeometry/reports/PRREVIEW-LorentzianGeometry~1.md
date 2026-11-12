# Review of LorentzianGeometry (pull request #2232 at 68276bc)

**Verdict:** needs changes

## R01 (P1) — Sorry'd data in three definitions; the gate fails

**Location:** `TauCetiRoadmap/LorentzianGeometry/Suggested.lean` lines 370, 397, 407: `iseqv := sorry`; `Quotient.liftOn τ (…) sorry`; `continuous := sorry`.

**Claim:** `TimelikeVectorField.setoid`, `TimeOrientation.IsFutureCausal` and `TimelikeVectorField.neg` have `sorry` in their bodies. Every causal declaration after them is built on them: `TimeOrientation`, `chronologicalFuture`, `causalFuture`, `IsGloballyHyperbolic` and Geroch.

**Witness:** The gate on this head reports `sorry-data (3)` at lines 368, 395 and 405, with overall status FAIL. None of the three obligations is false; each is an omitted proof.

**Repair:** Tested: a scratch copy with these changes elaborates with 0 errors.
(a) State C0.2 (b) transitivity in `section Linear`, after `variable [FiniteDimensional ℝ V]`, and prove `iseqv` from it:

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

(b) Define `TimeOrientation.IsFutureCausal τ v := ∃ T : TimelikeVectorField g, ⟦T⟧ = τ ∧ IsCausal (g x).toBilinForm v ∧ g x v (T.toFun x) < 0`.
(c) Delete `TimelikeVectorField.neg` and `TimeOrientation.neg`. Add `def causalPast (τ : TimeOrientation g) (q : M) : Set M := {p | q ∈ causalFuture τ p}` and use `causalFuture τ p ∩ causalPast τ q` in `IsGloballyHyperbolic`.

## R02 (P1) — The Tau Ceti Minkowski declarations it cites do not exist at the pin

**Location:** README line 296: "`TauCeti.minkowskiNormSq`, `TauCeti.futureCone`, `TauCeti.hyperboloid` (`TauCeti/Geometry/Hyperbolic/Hyperboloid/Basic.lean`)". Also lines 102, 978, 983–984, 991 (C0.1 *Needs:*), 1017–1018 and 1221.

**Claim:** Several statements are written as if supplied by declarations that are absent from the pinned Tau Ceti: the supplier contract, the C0.1 target `minkowskiForm E v v = −TauCeti.minkowskiNormSq v` with its *Needs:* item, the C0.2 cone and hyperboloid identities, and the C2.3 Check.

**Witness:** Tau Ceti 2fd255d has no `Geometry/Hyperbolic` directory. `grep -rn "minkowskiNormSq\|futureCone"` over `TauCeti/` finds nothing. `roadmaps grep` finds the names in no roadmap other than this one.

**Repair:** Delete the bullet at line 296 and the C0.1 *Needs:* item "Tau Ceti Minkowski/hyperboloid comparison interfaces". State the identities directly:
- `minkowskiForm E v v = −v.1² + ‖v.2‖²`;
- `timeCone (minkowskiForm E) (1, 0) = {v | ‖v.2‖ < v.1}`;
- the unit hyperboloid is `{v ∈ timeCone (minkowskiForm E) (1, 0) | minkowskiForm E v v = −1}`;
- C2.3: `I^+(0) = {t > |x|}`.

At line 102, compare instead with RelativisticQuantumFieldTheory Layer 1's `minkowskiSquare`. For `E = EuclideanSpace ℝ (Fin 3)` and `x ↦ (x 0, (x 1, x 2, x 3))`, `minkowskiForm E v v = −minkowskiSquare x`.

## R03 (P2) — Statable headline theorems are absent; Suggested.lean is an API catalogue

**Location:** `Suggested.lean` lines 12–15: "This file is not the roadmap and is not exhaustive… suggest Lean forms for particular milestones, so that contributors and reviewers converge on names and signatures". Also README line 14.

**Claim:**
- Geroch's theorem is the only headline stated.
- Statable at the pins but absent: C⁰-inextendibility of Minkowski space and Galloway–Ling–Sbierski (C6.4), and the Bernal–Sánchez Cauchy temporal function and Avez–Seifert (C6.3).
- The docstring does not name Hawking, Penrose or the focusing lemmas (C7.2–C7.3) as unstatable.
- The rest of the file is interface lemmas.

**Witness:** A scratch copy with the statements below elaborates with 0 errors. They use only the file's definitions plus Tau Ceti's `ContMDiffNondegenerateMetric.leviCivitaConnection` (`…/LeviCivita/Nondegenerate/Existence.lean:102`) and `CovariantDerivative.accelerationWithin` (`…/AlongCurve/Acceleration.lean:77`).

**Repair:** Tested on that copy. Add:

```lean
theorem minkowski_isInextendible_zero (F : Type) [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F]
    (g : ContMDiffNondegenerateMetric (I := 𝓘(ℝ, ℝ × F)) (M := ℝ × F) ∞)
    (hg : ∀ x, (g x).toBilinForm = minkowskiForm F) : g.IsInextendible 0 := by
  sorry
```

Also add:
- a predicate `IsTimelikeGeodesicallyComplete hk`: geodesics of `(g.val.toSmoothMetric hk).leviCivitaConnection` (zero `accelerationWithin` on `Ioo a b`) with timelike initial velocity extend to ℝ;
- Galloway–Ling–Sbierski: `(h : IsGloballyHyperbolic τ) (hc : IsTimelikeGeodesicallyComplete hk) : g.val.IsInextendible 0`;
- the Cauchy temporal function: `∃ t : M → ℝ, ContMDiff I 𝓘(ℝ, ℝ) ∞ t ∧ (∀ x v, τ.IsFutureCausal v → (0 : ℝ) < (mfderiv I 𝓘(ℝ, ℝ) t x v : ℝ)) ∧ ∀ a, IsCauchySurface τ (t ⁻¹' {a})`;
- Avez–Seifert, after `lorentzianLength γ a b := ∫ t in a..b, √(−g(γ′,γ′))` and `timeSeparation` (the supremum over `IsFutureCausalCurve` of `ENNReal.ofReal` of that length);
- in the docstring, as not statable: Hawking and the timelike focusing lemma (no second fundamental form of a hypersurface at the pins), and Penrose and the null focusing lemma (no null expansion of a codimension-two surface).

Replace lines 12–15 with: "`README.md` is the roadmap; this file states its headline theorems against the pinned APIs."

Delete the interface theorems from the file; the README keeps them:
- the C0 basis and cone theorems, `not_nondegenerate_restrict_ker_iff`, the coefficient-ODE block and `isLorentzian_iff_signature`;
- `card_timeOrientation`, `exists_smooth_rep`, `isOpen_chronologicalFuture` and the four `*_conformal` theorems.

Then delete the definitions that no remaining statement uses: `IsOpticalFunctionOn`, `IsNullHypersurface`, `IsStrong`, `sharp`, `inverseApply`, `IsConformal`, `transportTimeOrientation`, `geodesicRHS` and `HasSignature`.

## R04 (P2) — Suppliers are re-founded on this roadmap: supply cycles with RiemannianGeometry, LocalVariationalFieldTheory and RelativisticQuantumFieldTheory

**Location:** README lines 52–53: "Extend their reusable constructions in those shared APIs and preserve their positive-definite public interfaces by specialization". Also lines 77–79 and 1782–1789.

**Claim:** Three roadmaps either supply this one or precede it in the merge order: RiemannianGeometry R1–R3 and R5a, LocalVariationalFieldTheory LVF6, and RelativisticQuantumFieldTheory. The README makes their objects specializations of §F1.5, §F3.1 and §F4.1, or names those roadmaps as consumers of §C1.1, §C2.1 and §C2.3. Each object is then handed back and forth between two owners.

**Witness:**
- §F3.1 needs R5a (line 900) yet makes R5a "specializations" (line 881).
- §F1.5 needs LVF6 (line 660); line 1784 has LVF6 consume `LorentzianMetric`.
- RelativisticQuantumFieldTheory (merge order 215, against 408) defines flat `causalFuture` (its `Suggested.lean` line 77).

**Repair:** Keep the semi-Riemannian objects as this roadmap's own and point the comparisons downward:
- At lines 52–53, 638–639, 880–881 and 921–922, replace each "Riemannian … as specializations" clause with a comparison theorem: for positive-definite `g`, this roadmap's object agrees with RiemannianGeometry R1/R2/R3/R5a's.
- Delete the RiemannianGeometry, LVF6 and RelativisticQuantumFieldTheory bullets from `## Downstream consumers`.
- At line 79, delete "which may consume §C2.3's `J^±`".
- In §C2.3, cite RelativisticQuantumFieldTheory Layer 1 `causalFuture` and prove that on Minkowski space the manifold `J^+` equals it.

## R05 (P3) — Padding in Suggested.lean

**Location:** `Suggested.lean` lines 153–155 (`minkowskiForm_self`), 233–246 (`flat_sharp`, `sharp_flat`, `isStrong_of_finiteDimensional`), 290–298 (`toSmoothMetric_ofSmoothMetric`, `ofSmoothMetric_toSmoothMetric`) and 350–351 (`LorentzianMetric.isLorentzian`).

**Claim:** Each of these closes with one tactic or restates a definition.

**Witness:**
- On a scratch copy, `minkowskiForm_self` closes by `simp [minkowskiForm, sq, sub_eq_add_neg, add_comm]` and both round trips close by `rfl`.
- `flat_sharp` and `sharp_flat` are each one Mathlib lemma.
- `isStrong_of_finiteDimensional` is Tau Ceti's `isInvertible_of_separatingLeft`.
- `isLorentzian` is `g.property x`.

**Repair:** Delete them from `Suggested.lean`; the README keeps the statements.

## R06 (P3) — The C2.3 openness of `I^+(p)` is cited to a result about another curve class

**Location:** README line 1217: "`I^+(p)` is open for continuous `g` (Chruściel–Grant, §1)".

**Claim:** Here `I^+` is defined by piecewise `C¹` timelike curves (line 163). Chruściel–Grant prove openness only for `Ǐ^+`, defined by locally uniformly timelike curves.

**Witness:** chruscielgrant2012 lines 198–204 and 229: Proposition 1.4 is about `Ǐ^+`. Lines 233–234 leave `Ǐ^+ = I^+` open for continuous metrics. sbierski2018 line 345 (Proposition 2.6, p. 9) treats piecewise smooth timelike curves.

**Repair:** Cite "(Sbierski 2018, Proposition 2.6, p. 9)".

## R07 (P3) — The C5.4 locator names this roadmap's section, and the hypothesis is stronger than the source needs

**Location:** README line 1554: "In a strongly causal spacetime the Lorentzian length is upper semicontinuous under this convergence (Beem–Ehrlich–Easley, §C3.3)."

**Claim:** "§C3.3" is this README's null-generator section; Beem–Ehrlich–Easley has no section C3.3. Uniform convergence on a common compact interval needs no causality condition.

**Witness:** README line 1343 is the heading "C3.3 Null generators…". minguzzi2019 Theorem 2.41 (line 1849, pp. 43–44) proves `lim sup l(γ_n) ≤ l(γ)` for h-uniformly convergent continuous causal curves, with no causality hypothesis.

**Repair:** Use "The Lorentzian length is upper semicontinuous under this convergence (Minguzzi 2019, Theorem 2.41, pp. 43–44)."

## R08 (P3) — In C4.3 the cited source proves the agreement only for C² metrics

**Location:** README lines 1442–1445: "For `C^{1,1}` `g`, `J^+(p)` defined with Lipschitz causal curves equals the set defined with piecewise-`C¹` causal curves … (Chruściel, *Elements of causality theory*, §2; …)".

**Claim:** "§2" is the whole causality chapter, and the statement it contains assumes a C² metric.

**Witness:** chrusciel2011 line 1042: Corollary 2.4.11 assumes a C² metric and reaches every point of `J^+(p)` by piecewise broken causal geodesics. Lines 722–726 identify his `J^±` with the usual one.

**Repair:** Cite "(Chruściel, *Elements of causality theory*, Corollary 2.4.11, for C² metrics; …)", plus the exact theorem number of Minguzzi, *Convex neighborhoods for Lipschitz connections and sprays*, that covers `C^{1,1}`.

## R09 (P3) — Locators are missing or chapter-level only

**Location:**
- No locator: §F0.1–§F1.5, §F1.7–§F2.3, §F3.1–§F4.2, §C0.1–§C2.2, §C2.4–§C3.2, §C3.4, §C4.4, §C6.5 and §C7.2.
- "O'Neill, Ch. 14" only: lines 172, 189, 1491, 1514, 1573, 1579, 1593, 1595, 1620, 1623, 1757 and 1760.
- Also "(Minguzzi 2019)" at line 1532 and "O'Neill's and Galloway's treatments" at line 1357.

**Claim:** Every theorem needs an exact locator (theorem and page); a chapter is not one.

**Witness:** These statements appear numbered in cached texts:
- minguzzi2019: Theorem 2.32 (line 1651), Proposition 4.18 (line 4835), Theorem 4.100 (line 5912), Definition 4.117 (line 6151), Theorems 4.119, 4.120, 4.123 and 4.124 (lines 6195–6248);
- galloway2004: Proposition 3.1 (line 183);
- sbierski2018: Theorem 3.1 (line 551).

**Repair:**
- C5.1 lower semicontinuity and reverse triangle inequality: Minguzzi 2019, Theorem 2.32, p. 39.
- C5.2, compact spacetimes are not chronological: Proposition 4.18, p. 113.
- C5.3 smoothing: Theorem 4.100, pp. 140–141.
- C6.3: Geroch, Theorem 4.119, p. 147; splitting, Theorem 4.120, p. 147; Avez–Seifert, Theorem 4.123, p. 148; finiteness and continuity of `τ`, Theorem 4.124, p. 148; the causal form of global hyperbolicity, Definition 4.117, p. 146.
- C3.3: Galloway 2004, Proposition 3.1.
- C6.4, Minkowski: Sbierski 2018, Theorem 3.1, p. 13.
- Give each remaining O'Neill citation and each target without a locator a theorem number and page.

## R10 (P3) — The README names Lean declarations that Suggested.lean does not declare

**Location:** README line 158: "Lean bundles the metric and the time orientation (`TimeOrientedLorentzianMetric`)". Also lines 537, 757, 1133, 1165 and 1489, and line 177: "RiemannianGeometry's vector-valued second fundamental form `II`".

**Claim:** Six names are backticked as this roadmap's own but none is in `Suggested.lean`: `TimeOrientedLorentzianMetric`, `ContMDiffNondegenerateMetric.IsLocallyHolder`, `CovariantDerivative.IsGeodesicOn`, `TimeConeCover`, `IsFutureCausalPiecewiseCurve` and `timeSeparation`. Lean has no bundle. RiemannianGeometry calls the form `B`, not `II`.

**Witness:** `grep` of `Suggested.lean` finds none of the six names. Its causal predicates (lines 436–460) take `(τ : TimeOrientation g)` separately. RiemannianGeometry `README.md` line 163 writes `⟨S_ηX,Y⟩=⟨B(X,Y),η⟩`.

**Repair:**
- Declare `timeSeparation` with the R03 headline.
- Write the other five names in prose.
- At line 158, write "Lean takes `τ : TimeOrientation g` as a separate argument".
- At line 177, replace `II` with `B`.

## R11 (P3) — The README does not follow the house shape

**Location:** Headings `## Build order and hypotheses`, `## Part I: shared foundations` and `### F0 …`, and the `*Hypotheses:*` line that opens every subsection (for example line 372).

**Claim:**
- There is no `## How to read the build` and no `## Layer k:` heading.
- No layer ends with `### Examples` and `### Dependencies`.
- Each subsection opens with a `*Hypotheses:*` field line.
- Definitions have no API bullet lists.
- Several definitions have fewer than three discriminating Checks.

**Witness:** No Checks in §C4.2 or §C6.1; one in §C5.3; two in §F0.1, §F1.3, §C1.1, §C2.4 and §F1.7 (its second is a remark). Compare RiemannianGeometry `README.md` lines 849–1280.

**Repair:**
- Use `## How to read the build` and `## Layer k: <mathematics>` headings, ending each layer with `### Examples` and `### Dependencies`.
- Fold each `*Hypotheses:*` line into its target's sentences.
- Give each definition API bullets and at least three computed Checks. For example, for §C6.1: in ℝ^{1+1}, `edge{t = 0, |x| ≤ 1} = {(0, ±1)}`.

## R12 (P3) — A pull-request reference and process narrative appear in the README

**Location:** README lines 338–342: "The closed Mathlib PR [mathlib4#38194](…) proposed an `IndefiniteMetric` structure…; it did not land, … If Mathlib later adopts an indefinite scalar-product carrier, adopt it."

**Claim:** The README must be timeless and carry no pull-request references. Line 31 ("Audit each supplier used below…"), lines 336–338 ("coordinate … with its authors where practical") and line 38 ("during integration") are also process instructions.

**Witness:** The house style rules out review and pull-request references and process narrative. These sentences are exactly that.

**Repair:**
- Delete lines 338–342 and the coordination clause at lines 337–338.
- Delete "Audit each supplier used below for unnecessary positivity assumptions;" and "Comparison lemmas bridge existing representations during integration;".

## R13 (P3) — Suggested.lean docstrings carry instructions and overclaims

**Location:** `Suggested.lean` lines 32–36 ("In Tau Ceti, generalize the existing carrier and preserve its smooth interface"), lines 201–202 ("Generalize that carrier in place"), lines 121–122 ("with equality iff `v, w` are linearly dependent"), and line 157 (no docstring).

**Claim:**
- Docstrings of declarations that stay give implementation instructions.
- The `mul_le_sq` docstring asserts an equality case that the theorem does not state.
- `isLorentzian_minkowskiForm` has no docstring.

**Witness:** The elaborated type of `IsLorentzian.mul_le_sq` is `b v v * b w w ≤ b v w ^ 2`, with no equality clause (from the `#check @` file).

**Repair:**
- In the module and structure docstrings, state the mathematics of the carrier and delete the "generalize … in place" sentences.
- If `mul_le_sq` and `isLorentzian_minkowskiForm` survive R03, cut line 122 to the inequality and add a docstring to the latter.

## Verified sound

| Target | Instances | Roadmap value | Computed or source value | Result |
| --- | --- | --- | --- | --- |
| Shared foundations | §F3.1 against RiemannianGeometry R5a | R5a is a supplier and also a specialization | R5a → §F3.1 → R5a | R04 |
| Locality and bundles | Native connection carriers | `CovariantDerivative`, `IsCovariantDerivativeOn`, `ContMDiffCovariantDerivative` | `CovariantDerivative/Basic.lean`:366, :92, :412 (graded by `ℕ∞ω`) | sound |
| Signature and generality | `sigNeg`; the zero vector; the RQFT sign | Maximal negative-definite dimension; 0 is spacelike; RQFT is (+−−−) | `Signature.lean`:65, :98; minguzzi2019 line 306; RQFT README line 20; `TauCeti.minkowskiNormSq` absent | R02 |
| Dimension and strength | ℓ² with weights (j+1)⁻²; finite dimension | Weak, not strong; finite dimension gives strong | ‖g♭eⱼ‖ = (j+1)⁻² → 0; `isInvertible_of_separatingLeft` proves strongness (Suggested line 246) | sound |
| Where index one is needed | (p,q) = (1,2); null L in (p,q) | Negative vectors connected; screen signature (p−1,q−1) | {y₁²+y₂² > x²} is connected; L^⊥/ℝL has signature (p−1,q−1) | sound |
| Manifolds and regularity | `1 + max(t,0)²` | `C^{1,1}`, not C² | f′ = 2max(t,0) is Lipschitz; f″ jumps from 0 to 2 | sound |
| Curvature | −dt²+a²dx²; −f²dt²+dx² | K = a″/a; K = −f″/f | R(∂ₓ,∂ₜ)∂ₜ = −(a″/a)∂ₓ; Tau Ceti `curvatureOperator` (`Basic.lean`:89) has the same sign; `ricciTensor` is tr(w ↦ R(w,u)v) | sound |
| Time orientation | Relation g(T,T′) < 0 | Equivalence relation by C0.2 (b) | Reflexive by g(T,T) < 0, symmetric by symmetry of g, transitive by C0.2 (b); Lean has `iseqv := sorry` | R01 |
| Curves | f = ½∫sign sin(1/u) | Lipschitz, timelike a.e., not piecewise C¹ | Velocity (1, ±½); b = −1 + ¼ = −¾ | sound |
| Lengths and time separation | Minkowski: (2,0), (1,1), (0,1) | τ = 2, 0, 0 | √4 = 2; null, so 0; (0,1) ∉ J⁺(0), so 0; same definition as minguzzi2019 line 1637 | sound |
| Hypersurfaces | Unit sphere ε = 1; hyperboloid in ℝ^{1,3} | II = −εkν; k = h, H = 3 | −gν matches RiemannianGeometry line 164; Gauss gives 0 − 1 = −1; constraint −6 + 9 − 3 = 0 | sound; name: R10 |
| Domains of dependence | A = {t = 0, \|x\| ≤ 1} in ℝ^{1+1} | D⁺ is the triangle; H⁺ is two null segments | D⁺ = {0 ≤ t ≤ 1−\|x\|}; H⁺ = {t = 1−\|x\|}; minguzzi2019 Definition 3.1 (line 3578) and Definition 4.117 (b) (line 6154) | sound |
| Extensions | Sbierski's definition; Milne region into Minkowski | Proper isometric embedding into a connected target | sbierski2018 lines 42–44 agree; (t,x) ↦ (t cosh x, t sinh x) pulls back to −dt² + t²dx² | sound |
| Names | Tau Ceti directories; `TimeOrientedLorentzianMetric` | Homes exist; Lean bundles the time orientation | `BilinearForm/` and `NondegenerateMetric/` exist; the bundle is absent from Suggested | R10 |
| Geroch (stated) | (ℝ, −dt²); (S¹, −dθ²); Minkowski | Globally hyperbolic ⇔ Cauchy surface exists | {0} is Cauchy; on S¹ both sides fail (not causal, curve revisits points); {t = 0} | sound |
| Minkowski C⁰-inextendibility | sbierski2018 Theorem 3.1 (line 551) | All d ≥ 1 | The statement elaborates at the pins | R03 |
| Galloway–Ling–Sbierski | Milne region: extendible and incomplete | Complete and globally hyperbolic ⇒ C⁰-inextendible | Milne is consistent; the statement elaborates | R03 |
| Cauchy temporal function | Minkowski with `t` | Level sets are Cauchy; dt(v) > 0 | `t` satisfies both; the statement elaborates | R03 |
| Avez–Seifert | Minkowski minus (1,0); p = 0, q = (2,0) | A maximizer exists when globally hyperbolic | Supremum 2 is not attained, and the space is not globally hyperbolic; the statement elaborates | R03 |
| Hawking | Milne region, reversed orientation, n = 1 | Length ≤ n/\|b\| | H = −1/t₀; the bound t₀ is attained by t ↦ (t, x₀) | sound; not statable (R03) |
| Penrose | Sphere {t = 0, \|x\| = r} in Minkowski | Trapped surface ⇒ null incomplete | θ± = ±2/r, so not trapped; consistent | sound; not statable (R03) |
| Raychaudhuri (C7.2) | Light cone in ℝ^{1,3}; flat Robertson–Walker | θ′ = −θ²/2; Ric(∂ₜ,∂ₜ) = −3a″/a | θ = 2/r, θ′ = −2/r²; 3a″/a − 3a′²/a² = −3a′²/a² − Ric | sound |
| C0.1 and `minkowskiForm_self` | diag(−1,−1,−1); (2,1) | Not Lorentzian; value −3 | det = −1 and negative definite on 2-planes; −4 + 1 = −3; one `simp` closes it | R05 |
| C0.2 reverse inequalities | v = (1,0), w = (2,1) | 3 ≤ 4; √8 ≥ 1 + √3 | (−1)(−3) = 3, (−2)² = 4; 2.83 ≥ 2.73 | sound |
| C2.3 openness | `Ǐ⁺` against piecewise-C¹ `I⁺` | Open, citing Chruściel–Grant §1 | Proposition 1.4 covers `Ǐ⁺` only (lines 229–234); Sbierski Proposition 2.6 (line 345) | R06 |
| C5.4 semicontinuity | γₙ(s) = (s, s/n) | Lengths converge to the limit's | √(1−1/n²)·s → s; minguzzi2019 Theorem 2.41 has no causality hypothesis | R07 |
| C4.3 agreement | Chruściel Corollary 2.4.11 | Holds for C^{1,1} | The source assumes C² (line 1042) | R08 |
| C4.4 conformal affine parameter | Ω = exp(−t²) on the line (s,s) | Finite ĝ-affine length | ∫₀^∞ e^{−2s²} ds = √(π/8) ≈ 0.63 | sound |
| C6.3 anti-de Sitter | p = (0,0), q = (π+ε, 0) | The slice t = π/2 + ε/2 lies in the diamond | ∫₀^∞ sech r dr = π/2, below π/2 + ε/2 on both sides | sound |
| C1.2 Schwarzschild base | F = 1 − 2m/r | K = 2m/r³ | F″ = −4m/r³, so −F″/2 = 2m/r³; the de Sitter control F = 1 − r² gives K = 1 | sound |
| C3.2 double null | u = t − r, u̲ = t + r in ℝ^{1,3} | g⁻¹(du, du̲) = −2; spheres | −1 − 1 = −2; radius (u̲ − u)/2 | sound |
| F4.2 and C7.2 shear | σ = [[0,1],[−1,0]], η = diag(−1,1) | tr σ² = −2 | ησ = [[0,−1],[−1,0]] is symmetric; σ² = −I | sound |
| F1.5 cosmological constant | d = 4, Λ = 3; d = 3, Λ = 1 | Ric = 3g; Ric = 2g | 2Λ/(d−2) gives 3 and 2 | sound |
| C2.1 orientations | Two disjoint copies of Minkowski space | Four time orientations | 2 × 2 = 4; `[ConnectedSpace M]` is in `card_timeOrientation` | sound |

- Gate: `sorry-data=3`, status FAIL; every other check 0. Dependency check output: `depcheck: 206 roadmaps, 1898 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: 0 errors, `sorry` warnings only.
- `#check @` file over all 69 declarations: 0 errors. `[FiniteDimensional ℝ E]` is dropped only by sign-predicate definitions that do not need it; no change. The scratch probe with the R01, R03 and R05 changes elaborates with 0 errors.
- Source locators checked against the text: 22 (minguzzi2019 12, sbierski2018 4, chruscielgrant2012 2, chrusciel2011 2, galloway2004 2).
- Library declarations opened at the pins: Mathlib 24 (connections, `IsInvertible`, `sigPos`/`sigNeg`, Sylvester, immersions, integral curves, ODE uniqueness, Rademacher, Hölder, Arzelà–Ascoli, local inverse, Riemannian distance) and Tau Ceti 42 supplier-contract names. All are present except `minkowskiNormSq`, `futureCone` and `hyperboloid`.
- Cross-roadmap citations resolved: 11.
  - HopfRinow Layer 1 (line 264).
  - RiemannianGeometry R1 (line 861), R2 (1281), R3 (1509) and R5a (2840).
  - PDE §1.7 (line 996).
  - LocalVariationalFieldTheory LVF6 (lines 1103 and 612).
  - DifferentialGeometry Layers 2–3 (lines 1005 and 1253).
  - SmoothBundlesConnections B3–B5 (lines 871–1209).
  - RelativisticQuantumFieldTheory (README line 20, `Suggested.lean` line 77).
- README Checks recomputed: 41, all correct.
- Overlap check: read RiemannianGeometry (main and its five open revisions), HopfRinow, RicciFlow and RelativisticQuantumFieldTheory. Owners of the shared objects:
  - Riemannian curvature, Jacobi, index and immersion objects: RiemannianGeometry R1–R3 and R5a, which this roadmap should compare against, not re-found (R04).
  - Nondegenerate Levi-Civita connection and the Riemannian flow: HopfRinow, already in Tau Ceti; generalizing them here is sound.
  - The flat Minkowski `J±`: RelativisticQuantumFieldTheory Layer 1 (R04).
  - RicciFlow: nothing shared.
- Ownership against open pull requests: `roadmaps grep` over 433 heads for globally hyperbolic, Cauchy surface, time orientation, trapped surface, Raychaudhuri and `LorentzianMetric`. Only RelativisticQuantumFieldTheory's flat `causalFuture` is shared. No other `Suggested.lean` uses the `TauCetiRoadmap.LorentzianGeometry` namespace.

## Not verifiable

- oneill1983, beemehrlicheasley1996, hawkingellis1973: settled as uncertified (paywalled). The chapter locators against them were not checked.
- Minguzzi, *Convex neighborhoods for Lipschitz connections and sprays* (arXiv:1308.6675): not in the manifest and not cached. This review edits no manifest, so it was not fetched.
- Kunzinger–Steinbauer–Stojković (arXiv:1306.4776), Joyce (arXiv:0910.3518), Bruveris (arXiv:1807.11290), Michor–Mumford (arXiv:math/0409303), LeFloch–Mardare (arXiv:0712.0122): not in the manifest, not cached.
- Minguzzi 2008, Geroch 1970, Bernal–Sánchez 2003, 2005, 2006 and 2007, Galloway–Ling–Sbierski 2018: not in the manifest, not cached.
- Kobayashi–Nomizu Vol. I §III.8, Nomizu–Ozeki 1961, Penrose 1965, Hawking 1967: not in the manifest, not cached.

## Source issues

- none
