# Review of SobolevPolynomialApproximation (pull request #1612 at 2516bbd)

**Verdict:** needs changes

🤖 Independent AI review of `TauCetiRoadmap/SobolevPolynomialApproximation/` at head `2516bbd7`. No file of the pull request was changed. No blocking (P1/P2) finding survived; the verdict is "needs changes" only because the push gate fails on this head (two style rules, R01 and R02). All five findings are P3.

## R01 (P3) — Gate `readme-ids-missing`: eight Tau Ceti names read as this roadmap's own

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:88–98` ("`Wkp.hasWeakFDerivOn_iteratedGradient`, … `Wkp.dense_contDiffOn_representatives`") and `Suggested.lean:62` ("`def Wkp.toOrderL`").

**Claim:** the gate reports `readme-ids-missing=8` for `Wkp.dense_contDiffOn_representatives`, `Wkp.exists_hasWeakLineDerivOn_value`, `Wkp.exists_value_eq_iff_forall_exists_hasWeakLineDerivOn`, `Wkp.hasWeakFDerivOn_iteratedGradient`, `Wkp.inner_iteratedGradient_one_apply_ae_eq`, `Wkp.iteratedGradient_ae_eq_of_contDiffOn`, `Wkp.norm_sq_eq_norm_lowerOrder_sq_add_norm_iteratedGradient_sq_succ`, `Wkp.tendsto_mollified_iteratedGradient`. They are Tau Ceti declarations, but because `Suggested.lean` declares its own `Wkp.toOrderL` inside `TauCetiRoadmap.SobolevPolynomialApproximation`, the gate treats `Wkp` as one of this roadmap's namespaces and every unmentioned `Wkp.*` name as a missing declaration.

**Witness:** gate output `readme-ids-missing (8)` at this head; the eight names are exactly the backticked `Wkp.*` identifiers of the README that `Suggested.lean` never mentions (`Wkp.lowerOrderL`, `Wkp.value`, `Wkp.iteratedGradient`, `Wkp.ext` are mentioned and pass).

**Repair:** rename the roadmap's definition to `toOrderL` (it already lives in the roadmap's namespace; `Wkp.` adds nothing) and replace the three README occurrences of `Wkp.toOrderL` (lines 171, 210, 537) by `toOrderL`; then no namespace of the roadmap is called `Wkp` and the eight supplier names pass. Writing the supplier names as `TauCeti.Wkp.…` also passes, but the rename is the smaller change.

## R02 (P3) — Gate `tex`: a code span broken across a line

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:203–204` ("a continuous linear inclusion `W^{k,p}(Ω) →L[ℝ]` / `W^{k,q}(Ω)`").

**Claim:** the code span starting with `` `W^{k,p}(Ω) →L[ℝ] `` continues on the next line, so the line-based scanner sees `^{` outside a code span on both lines and reports `tex (2)`.

**Witness:** gate output `tex (2)` naming lines 203 and 204; every other `^{` and `_{` in the README is inside a one-line code span and passes.

**Repair:** keep the span on one line: `a continuous linear inclusion `W^{k,p}(Ω) →L[ℝ] W^{k,q}(Ω)`` and reflow the paragraph.

## R03 (P3) — The Tau Ceti supplier contract names a revision that does not exist, and fourteen of its declarations are absent at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:83–117` ("All on Tau Ceti `main`, checked at revision `a318838`" … "Lane A owns the Tau Ceti declarations above").

**Claim:** (a) no commit `a318838` exists in the Tau Ceti repository, so the claim "checked at revision `a318838`" cannot be verified or reproduced. (b) Fourteen cited declarations do not exist at the Tau Ceti pin of this repository (`a91d3aa`): `Wkp.exists_hasWeakLineDerivOn_value`, `Wkp.exists_value_eq_iff_forall_exists_hasWeakLineDerivOn`, `Wkp.inner_iteratedGradient_one_apply_ae_eq`, `HasWeakLineDerivOn.comm`, `Wkp.dense_contDiffOn_representatives` (the pin has only `W1p.dense_contDiffOn_representatives`, `Sobolev/W1p/MeyersSerrin.lean:216`), `W1p.norm_le_norm_value_add_norm_gradient`, `W1p.compL`, `W1p.value_compL_ae`, `W1p.gradient_compL_ae`, `W1p.exists_value_ae_eq_const_of_gradient_eq_zero`, `Set.IsLipschitzDomainWith`, `W1p.isCompactOperator_valueL_of_isLipschitzDomainWith`, `ContinuousLinearMap.exists_pos_mul_norm_le_of_compact_estimate`, `W1p.exists_eLpNorm_value_sub_setAverage_le_of_isCompactOperator`. All fourteen exist on Tau Ceti `main` today (head `333c9e49`), with the hypotheses the README states (see Verified sound), so the mathematics rests on existing library material; what is wrong is the locator and the reproducibility of the contract. (c) "Lane A owns the Tau Ceti declarations above" overreaches for two of them: PDE Lane A on main (README lines 223–264) names weak derivatives, Meyers–Serrin, embeddings, Poincaré–Wirtinger, trace, extension, Rellich and the Lipschitz predicate, but not the first-order change of variables `W1p.compL` nor Peetre's compact-error estimate; the latter is also not in `Sobolev/Poincare/Wirtinger/Compactness.lean` but in `TauCeti/Analysis/Normed/Operator/Compact/Estimate.lean` on main (Compactness.lean imports it at line 10 and uses it at line 107). (d) Lines 84–85 ("`Suggested.lean` builds against the Tau Ceti revision in this repository's `lake-manifest.json`, so it states only what that revision supports") are process narrative about the state of a pin, which a reader a year from now cannot interpret.

**Witness:** GitHub API: `repos/TauCetiProject/TauCeti/commits/a318838` returns "No commit found for SHA: a318838"; `grep -rn exists_hasWeakLineDerivOn_value` in the pinned `TauCeti/` tree returns nothing; on main, `Analysis/Sobolev/Wkp/LineDeriv.lean:156` declares it.

**Repair:** replace `a318838` by the full SHA of the Tau Ceti main commit at which the names were actually checked (the files fetched for this review are at `333c9e4914`), and for each declaration absent at the pin add the owning PDE Lane A item (A.1 weak derivatives for the line-derivative bridge and symmetry, A.2 for Meyers–Serrin in every order, A.5 for the constant-on-connected lemma and the Wirtinger-by-compactness estimate, A.6 for the Lipschitz predicate and Rellich), so that the contract resolves on main whatever the pin. For `W1p.compL` and Peetre's estimate say that Tau Ceti main provides them and no roadmap on main plans them; give Peetre's estimate its file `Normed/Operator/Compact/Estimate.lean`. Delete the sentence at lines 84–85.

## R04 (P3) — The functional forms of Bramble–Hilbert are statable but neither stated nor named in the docstring

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/Suggested.lean:4–21` (module docstring) and `README.md:572–589` (§4.2).

**Claim:** §4.2's sublinear form is statable at the pins with the file's own objects: `∃ C, ∀ ℓ : Wkp volume Ω p (m+1) → ℝ, (∀ u, ℓ u ≤ M * ‖u‖) → (∀ u q, q ∈ polynomialsDegLE n m → (value (u') =ᵐ value u − q → ℓ u' = ℓ u)) → ∀ u, ℓ u ≤ M * C * seminorm (m+1) (m+1) le_rfl u`, and the bilinear form likewise. The summary lists "the Bramble–Hilbert lemma and its functional forms" among the headlines. This is P3 rather than P2 because both forms are two-line corollaries of `exists_bramble_hilbert` together with `norm_le_sqrt_two_mul`, so the acceptance test already covers their depth.

**Witness:** `Suggested.lean` states `exists_bramble_hilbert` (line 120) and the norm comparison (line 72); the docstring's list of unstated headlines (lines 15–20) does not mention §4.2.

**Repair:** either state the sublinear form after `exists_bramble_hilbert` (the bilinear one follows the same pattern), or add one line to the docstring saying that the functional forms of §4.2 are corollaries of `exists_bramble_hilbert` and are not restated.

## R05 (P3) — Lean form: section comments and the opening sentence of the docstring

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/Suggested.lean:7–10, 33, 56, 86, 116, 132`.

**Claim:** the file states targets of Layers 1, 2, 4 and 5 but its section comments are `/-! ### Polynomials (§1.2, §1.6) -/` and similar rather than `/-! ## Layer k: <title> -/` in README order; and the docstring opens with "The statements here suggest Lean forms for particular items … discharging all of them finishes neither a layer nor the roadmap", which describes an API catalogue, whereas the file is the roadmap's acceptance test (its headline theorems against the pins).

**Witness:** lines 33, 56, 86, 116, 132 are `### …` comments; no `## Layer` comment exists.

**Repair:** use `/-! ## Layer 1: seminorms, derivatives and the polynomial kernel -/`, `/-! ## Layer 2: change of variables -/`, `/-! ## Layer 4: Bramble–Hilbert and Deny–Lions -/`, `/-! ## Layer 5: higher-order embedding and point evaluation -/`, and reword the docstring's second paragraph to say the file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti and which headlines are not statable (the list at lines 12–20 already does the latter).

## Verified sound

**Repair of the previous review (ef3d525 → 2516bbd), finding by finding.** R01 (injectivity on `∅`): repaired, §1.6 "For nonempty `Ω` it is injective" with the `Ω = ∅` Check. R02 (zero denominators): repaired, §2.3 states `0 < ρ'`, `0 < ρ`, and `volume Ω = |det B| · volume Ω'` with the ratio only for `0 < volume Ω' < ∞`, with both Checks. R03 (declarations absent at the pin): partly repaired; the names are now real declarations of Tau Ceti main and the Lipschitz-domain predicate is Tau Ceti's own, but the cited revision does not exist and the names are still absent at the pin (R03 above, P3). R04 (admitted `averagedTaylorL`): repaired, deleted; §3.3 constructs `Q^m` on `L¹(B)` with an explicit kernel `Ψ_m`. R05 (admitted `toOrderL`): repaired, real body by `Nat.leRec`, identity at equal orders. R06 (`ofExponentLE`): repaired, deleted; §1.4 keeps the construction. R07 (`ofPolynomialL`): repaired, deleted; `exists_bramble_hilbert` quantifies over `q ∈ polynomialsDegLE n m` and a Sobolev element whose value is `u − q`. R08 (quotient on unbounded domains): repaired, §1.8 "For bounded `Ω`" with the `Ω = ℝ` Check. R09 (Taylor remainder regularity): repaired, §3.2 asks `C^{m+1}` on a neighbourhood of the segment, with the step-function Check. R10 (missing statable headlines): repaired, `exists_norm_comp_le`, `exists_affine_scaling`, `exists_continuous_representative`, `dense_contDiff_restrict` are stated; the docstring names Rellich, Deny–Lions, the averaged polynomial and the representation formula as not statable, with the missing carrier. R11 (`p = ∞` density): repaired, §5.1 fixes a finite `r > n/k` and uses §1.4. R12 (`L¹` generality): repaired, §3.3. R13 (`injective_evalₗ` padding): repaired, deleted, `MvPolynomial.funext` cited in the API. R14 (no Checks, no Needs, no shape): repaired, five layers, every target with `*Needs:*` and three or more Checks, Examples and Dependencies per layer, Summary, Scope, Conventions, Supplier contracts, Downstream consumers, References. R15 (locators): repaired for Layers 3–5 (Brenner–Scott Definitions 4.1.1/4.1.3, Propositions 4.1.9/4.1.12/4.1.17, 4.2.8, Lemmas 4.3.1/4.3.4/4.3.6/4.3.8, Exercise 4.x.20; Bramble–Hilbert Theorems 1 and 2; Deny–Lions III §2), all opened and confirmed below; Ciarlet Theorem 3.1.3 remains unread (Not verifiable). R16 (Lean/README correspondence): repaired; all fifteen declarations of `Suggested.lean` (`E`, `evalₗ`, `polynomialsDegLE`, `finrank_polynomialsDegLE`, `exists_pderiv_eq`, `Wkp.toOrderL`, `seminorm`, `norm_le_sqrt_two_mul`, `sqrt_le_sqrt_two_mul_norm`, `seminorm_top_eq_zero_iff`, `exists_norm_comp_le`, `exists_affine_scaling`, `exists_bramble_hilbert`, `exists_continuous_representative`, `dense_contDiff_restrict`) appear in the README, every declaration has a docstring.

**Gate, build, binders.** Gate at this head: `set_option=0 blob=0 latex=0 tex=2 prnum=0 sorry-data=0 sorry-examples=0 residue=0 imports=0 … readme-ids-missing=8 … depcheck=0 stray-files=0 dirty=0 outside-folder=0 build=0 FAIL`: the two failures are R01 and R02. `git diff --stat origin/main...HEAD` outside the folder: nothing. Imports: `import Mathlib` and `import TauCeti.Analysis.Sobolev.Wkp.Basic`, which exists at the pin (`TauCeti/Analysis/Sobolev/Wkp/Basic.lean`, olean present). A scratch copy of `Suggested.lean` with `#check @name` for all fifteen declarations and one-tactic probes was elaborated with `lake env lean` from the worktree: the roadmap's declarations produce exactly ten `declaration uses 'sorry'` warnings and nothing else; every elaborated type carries its `Fact (1 ≤ p)` instance and, where the README asks for them, `Bornology.IsBounded`, `0 < ρ`, the star-convexity hypothesis, the chunkiness bound `diam Ω ≤ γ * ρ`, `IsPreconnected`, `p ≠ ⊤`, `1 ≤ k`; no section variable was lost (the binders `{n} {Ω} {p} [Fact (1 ≤ p)]` are exactly those the types mention). Nothing in the worktree was changed.

**One-tactic padding probes** (same scratch copy): `simp` makes no progress on `finrank_polynomialsDegLE`, `norm_le_sqrt_two_mul`, `sqrt_le_sqrt_two_mul_norm`, `seminorm_top_eq_zero_iff`, `dense_contDiff_restrict`; `rfl` does not close `Wkp.toOrderL le_rfl = id` (`Nat.leRec` is not definitionally the identity, so the README's API bullet is a real lemma). No declaration restates a definition, mirrors a Check or computes a value. `finrank_polynomialsDegLE` and the two norm comparisons are API statements rather than headlines, but their proofs are not one-liners (a monomial basis; induction on the order through the pinned recursive norm identity), so they are not reported as padding.

**Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 205 roadmaps, 1659 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is listed in the merge order (line 374). The only roadmap cited as supplier is PDE (on main); SobolevDifferentialForms is named only as the owner of a deferred topic and its open head does not mention this roadmap.

**Ownership and duplication.** `roadmaps grep` over main and the 440 open heads for `Bramble`, `Deny.Lions`, `averaged Taylor`, `chunkiness`, `polynomialsDegLE`, `toOrderL`: hits only in this pull request. `Peetre` occurs in ComplexKähler, PseudodifferentialOperators, NoncommutativeIntegration and PDE #1614 in unrelated senses. No open head or board package (index: AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LawrenceVenkateshMethod, LogicAndDefinability) builds a polynomial-approximation package. PDE Lane A on main owns the first-order and Lipschitz-domain layer the roadmap consumes and plans nothing above first order, so this roadmap is the owner of Layers 1–5.

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aa`; paths library-relative).

| Declaration | File:line | What it says and its limits |
| --- | --- | --- |
| `MvPolynomial.restrictTotalDegree`, `mem_restrictTotalDegree` | Mathlib/RingTheory/MvPolynomial/Basic.lean:164,174 | `p.totalDegree ≤ m`; contains `0`. |
| `MvPolynomial.funext` | Mathlib/Algebra/MvPolynomial/Funext.lean:82 | needs `IsDomain R`, `Infinite R`; `ℝ` qualifies. |
| `IsHomogeneous.sum_X_mul_pderiv` | Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:73 | `∑ X i * pderiv i φ = n • φ`, `Fintype σ`. |
| `sum_homogeneousComponent` | Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:558 | sum over `range (totalDegree + 1)`. |
| `taylor_integral_remainder` | Mathlib/Analysis/Calculus/Taylor.lean:534 | `ContDiffOn ℝ (n+1) f (uIcc x₀ x)`, `CompleteSpace F`. |
| `HasFTaylorSeriesUpToOn.comp`, `taylorComp` | Mathlib/Analysis/Calculus/ContDiff/FaaDiBruno.lean:1050,898 | classical composition with `MapsTo`. |
| `Lp.antitone` | Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:159 | `IsFiniteMeasure μ`, `p ≤ q → Lp E q μ ≤ Lp E p μ`. |
| `starConvex_empty`, `Convex.starConvex` | Mathlib/Analysis/Convex/Star.lean:98, Mathlib/Analysis/Convex/Basic.lean:57 | empty set is star-convex about every point; convex ⇒ star-convex about its points. |
| `Metric.diam_eq_zero_of_unbounded` | Mathlib/Topology/MetricSpace/Bounded.lean:501 | the Conventions' remark. |
| `Wkp`, `lowerOrderL`, `iteratedGradient`, `value`, `mk`, `ext` | TauCeti/Analysis/Sobolev/Wkp/Basic.lean:175,221,236,328,385 | `lowerOrderL 0 = W1p.valueL`; `ext` from equal values. |
| `hasWeakFDerivOn_iteratedGradient` | Wkp/Basic.lean:364 | for `Wkp … (k+2)`. |
| `norm_sq_eq_norm_lowerOrder_sq_add_norm_iteratedGradient_sq_succ` | Wkp/Basic.lean:421 | order ≥ 2, every `p`; the `p = 2` order-1 identity at 433. |
| `W1p` norm | TauCeti/Analysis/Sobolev/W1p/Basic.lean:86–89 | `Lp` of the jet in `WithLp 2 (ℝ × E)` (Euclidean), so `‖(sin, cos)‖_{W^{1,∞}} = 1` as the §1.3 Check says. |
| `W1p.norm_value_le`, `norm_gradient_le` | W1p/Basic.lean:447,451 | components bounded by the graph norm. |
| `W1p.ofExponentLE` | W1p/Basic.lean:641 | `[IsFiniteMeasure (mu.restrict Omega)]`, `p ≤ q`, `W1p q → W1p p`, by `Lp.antitone` in both components. |
| `Wkp.restrictL`, `value_restrictL_ae` | TauCeti/Analysis/Sobolev/Wkp/Restriction.lean:141,163 | as cited. |
| `Wkp.iteratedGradient_ae_eq_of_contDiffOn` | Wkp/Classical.lean:106 | `ContDiffOn ℝ (k+1) f Omega` and a.e. equality of values. |
| `Wkp.tendsto_mollified_iteratedGradient` | Wkp/Approximation.lean:62 | `p ≠ ∞`, `U ≤ Omega`, bump radii → 0. |
| `W1p.dense_contDiffOn_representatives` | W1p/MeyersSerrin.lean:216 | first order only at the pin. |
| `enorm_sub_setAverage_le_of_starConvex` | TauCeti/Analysis/Sobolev/Poincare/Potential.lean:216 | `C¹`, star-convex about the evaluation point, `Ω ⊆ closedBall x D`; the README correctly calls it a related estimate. |
| `W1p0.isCompactOperator_valueL`, `W1p.isCompactOperator_valueL_restrictL` | RellichKondrachov.lean:141, W1p/LocalCompactness.lean:111 | zero-boundary and relatively compact versions; not the Lipschitz-domain one. |
| `iteratedGradientChain` | TauCeti/Analysis/Calculus/IteratedGradient.lean:105 | index 0 is `gradient`, successor is `fderiv` of the previous field. |

**Tau Ceti main (head `333c9e49`, fetched through the GitHub API as data), for the fourteen names of R03:** `Wkp.exists_hasWeakLineDerivOn_value` (LineDeriv.lean:156: for every `k`, `w : Wkp … (k+1)`, `v`, a `d : Wkp … k` with `HasWeakLineDerivOn` of the values), `exists_value_eq_iff_forall_exists_hasWeakLineDerivOn` (287), `inner_iteratedGradient_one_apply_ae_eq` (355, stated for `Wkp … 2`), `HasWeakLineDerivOn.comm` (WeakDeriv/Symmetry.lean:42), `Wkp.dense_contDiffOn_representatives` (Wkp/MeyersSerrin.lean:291: `p ≠ ⊤`, every `k`, arbitrary open `Ω`), `W1p.norm_le_norm_value_add_norm_gradient` (W1p/Basic.lean:503), `W1p.compL` (W1p/ChangeOfVariables.lean:274: `DifferentiableOn`, `InjOn`, `MapsTo`, `‖DΦ‖ ≤ L`, `0 < c ≤ |det DΦ|`, `p ≠ ⊤`, with `value_compL_ae` 302 and `gradient_compL_ae` 316, `DΦ(x)* (∇u)(Φ x)`), `W1p.exists_value_ae_eq_const_of_gradient_eq_zero` (Poincare/Wirtinger/W1p.lean:436, `IsPreconnected`), `Set.IsLipschitzDomainWith` (LipschitzDomain/Basic.lean:482, on `Set (WithLp 2 (ℝ × E))`), `W1p.isCompactOperator_valueL_of_isLipschitzDomainWith` (LipschitzDomain/RellichKondrachov.lean:53: `p ≠ ∞`, Lipschitz, bounded, `volume`), `W1p.exists_eLpNorm_value_sub_setAverage_le_of_isCompactOperator` (Poincare/Wirtinger/Compactness.lean:82: compact value map, preconnected, finite measure, `S ⊆ Ω` of positive measure). Each matches the hypotheses the README attributes to it.

**Headline inventory.** Headlines in the README: averaged Taylor polynomial (§3.3), representation formula (§3.5), Bramble–Hilbert with explicit constants (§4.1) and its functional forms (§4.2), Deny–Lions (§4.4), affine scaling (§2.2), higher-order change of variables (§2.1), the embedding `W^{k,p} ⊆ C⁰` with continuity up to the boundary (§5.1–5.3), Rellich in `W^{k,p}` (§4.3), the kernel of the top seminorm (§1.7), density up to the boundary (§5.2). Stated: §1.7, §2.1, §2.2, §4.1, §5.1, §5.2. Named as not statable with the missing carrier: §3.3/§3.5 (the contraction and kernel constructions), §4.3/§4.4 (`Set.IsLipschitzDomainWith`, absent at the pin, confirmed). §4.2: R04. §5.3 (uniform continuity of components) is a corollary of §5.1 and §5.2 and is not separately a headline.

**Adversarial pass.** `μᵣ := ∫ yʳ φ(y) dy` for an even normalised cutoff on `(−1,1)`, so `μ₀ = 1`, `μ₁ = 0`, `μ₂ > 0`. One-dimensional rows identify `E` with `ℝ`. Rows cover the sampled targets, every headline and every target a finding touches.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §1.1 contraction, degree | `u = x²`, `h = 3`; `h ↦ 2h` | gradient `2x`, `⟨3⟩` gives `6x`, `⟨6⟩` gives `12x`; Hessian `2`, `⟨3⟩²` gives `18`, `⟨6⟩²` gives `72 = 4·18` | homogeneity of degree `i` confirmed; degree-one scaling excluded |
| §1.2 dimension and total degree | `(n,m) = (0,2),(1,2),(2,2)`; `m = 0` with `0, 1, X` | `choose(2,0), choose(3,1), choose(4,2) = 1, 3, 6`; `0, 1` in, `X` out | pass; `restrictTotalDegree` contains `0` (pinned) |
| §1.3 `toOrderL` at equal orders | `j = k = 1`, `u = x` on `(0,1)` | identity keeps `u`, `|u|_{1,2} = 1`; the zero map gives `0` | `Nat.leRec` body is the identity at `le_rfl` (not by `rfl`, R05 of r1 settled) |
| §1.3 seminorms vs classical | `u = x²`, `(0,1)`, `p = 2`, `k = 2` | `√(∫x⁴) = 1/√5`, `√(∫4x²) = 2/√3`, `√(∫4) = 2` | pass |
| §1.3 norm comparison, both bounds | `u = x`, `p = 2`: `S = √(1/3+1) = 2/√3`; `u = sin`, `(0,2π)`, `p = ∞`: `S = √2`, graph norm `ess sup √(sin²+cos²) = 1` | `S/√2 = 1 ≤ 1 ≤ 2`; equality at the lower bound | pinned `W1p` norm is the `Lp` norm of the Euclidean jet, so both Checks hold; at order ≥ 2 the pinned square identity gives `‖u‖ = S` only after the order-1 factor, hence `√2` both ways |
| §1.4 change of exponent | `u = 1`, `(0,2)`, `p = 2 → q = 1`; `q = p`; `Ω = ℝ`, `1/(1+|x|)` | `2 ≤ 2^{1/2}·√2 = 2`; identity keeps `1`; `∫1/(1+|x|)² = 2 < ∞`, `∫1/(1+|x|) = ∞` | pass; finite measure load-bearing |
| §1.5 bundled derivative | `u = x²`, `v = 3` on `(0,1)`, `p = ∞`; `u = xy`, `v = e₁`, `w = e₂` | `∂_v u = 6x`, `D¹(∂_v u) = 6 = (D²u)⟨3⟩ = 2·3`; `‖6x‖_∞ = 6 = 3·‖2x‖_∞`; `∂_v∂_w u = 1 = ∂_w∂_v u` | pass; outermost-slot convention matches main's `⟪D²u v, w⟫ = ∂_v ∂_w u` |
| §1.6 classes | `k = m = 0`, `p = 2`: `Ω = (0,1)` vs `∅`; `Ω = ℝ`, `q = 1` | norms `0, 1` vs both `0`; `∫_ℝ 1 = ∞` | nonempty for injectivity, bounded for the map: both stated |
| §1.6 polynomial Poincaré | `P = (y, x)`; `P = (−y, x)`; `n = 1, m = 0, P = 3`; `d = 0` step | `Q = xy`, `∂_y∂_x`: `1 = 1`; `−1 ≠ 1` not closed; `Q = 3x`, denominator `1`; `pderiv_j Q¹ = P⁰_j + ∑ X_i ∂_i P⁰_j = P⁰_j + 0` | pass; Euler weight `d` never divides by zero |
| §1.7 kernel iff, both directions | `(0,1)`, `m = 1`: `u = x`, `u = x²`; `(0,1) ∪ (2,3)`, `m = 0`, `u = 0/1`; `Ω = ℝ`, `p = 2`, `m = 0` | `|x|_2 = 0`, witness `x`; `|x²|_2 = 2`, no affine witness; gradient `0`, no constant (`0 ≠ 1`); `|u|_1 = 0 ⇒ u = c`, `c ∈ L²(ℝ) ⇒ c = 0 ∈ polynomials` | pass; no boundedness needed in the Lean statement, correctly absent |
| §1.8 quotient | `(0,1)`, `p = 2`, `m = 0`, `u = x`; `u = 1` | `inf_c √(∫(x−c)² + 1) = √(1/12 + 1) = √(13/12)`, top `1`; `0, 0` | pass, same value in §4.4 |
| §2.1 composition | `Φ = 2x`, `u = x²`; `Φ = id`, `L = 1`; `L = 0` | `(4x²)'' = 8 = 2·2² + 2x·0`; `C ≥ 1`; `L = 0` forces `Ω'` empty for `n ≥ 1` (locally constant injective map), statement vacuous | pass; `|det DΦ| ≥ L^{−n}` from `det DΦ · det DΨ = 1`, `|det DΨ| ≤ L^n` |
| §2.2 affine scaling, both directions, both exponents | `F = 2x`, `(0,1) → (0,2)`, `u = x`: `p = 2`, `j = 0, 1`; `p = ∞`, `j = 1`; `B = id` | `2^{−1/2}√(8/3) = 2/√3 = ‖2x‖_{L²(0,1)}`; `2·2^{−1/2}·√2 = 2 = ‖2‖_{L²(0,1)}`; `2 ≤ 2·2⁰·1`; identity gives equality | pass; Lean's `-1 / p.toReal = 0` at `p = ∞` as the docstring says |
| §2.3 geometry | `B = id`, `(0,1)`, centre `1/2`, radius `1/2` then `0`; `Ω = Ω' = ∅`; `q = x²`, `F = 2x + 1` | `1 ≤ 1/(2·1/2) = 1`; radius `0` excluded; `0 = 1·0`; `(2x+1)² = 4x²+4x+1`, degree `2` | pass (R02 of r1 settled) |
| §3.1 star-shape conventions | `Ω = ∅`; `(−1,1)`, `x = 1/2`, radius `1` vs `1/2`; `(−R,R)`, `ρ = R` | `starConvex_empty` holds, ball inclusion fails; closed hull `[−1,1] ⊄ Ω`, `[−1/2,1/2] ⊆ Ω`; `γ = 2R/R = 2` | pass; inline hypothesis ⇒ Brenner–Scott's for every smaller ball |
| §3.2 Taylor polynomial and remainder | `u = x²`, `y = 1`, `x = 3`, `m = 2`; `u = t²`, `y = 0`, `x = 1`, `m = 1`; step function, `m = 0` | `1 + 2·2 + (2/2)·4 = 9 = u(3)` (`13` without `1/2!`); `1 = ∫₀¹ 2(1−t) dt = 1`; remainder `1`, a.e. derivative integral `0` | pass; `C^{m+1}` on the segment load-bearing (R09 settled) |
| §3.3 kernel `Ψ_m` | `m = 1`: `Ψ₁ = (1+n)φ − ⟪x−y, ∇φ⟫`; `n = 1`: `Q¹1`, `Q¹x`, `Q¹x²`, `Q²x²` | `φ − ∑_i ∂_i[(x−y)_i φ] = φ + nφ − ⟪x−y,∇φ⟫`; `Q¹1 = (1+n) − n = 1`; `Q¹x = 2μ₁ + x − 2μ₂·0 = x` (using `∫yφ' = −1`, `∫y²φ' = −2μ₁`); `Q¹x² = 2μ₂ + 2xμ₁ − 3μ₂ = −μ₂`; `Q²x² = x²` | pass; sign `(−1)^j` is the integration-by-parts sign; `L¹(B)` domain as in Prop 4.1.12 |
| §3.4 derivative form and identity | `m = 0`: `Q⁰1 = μ₀`, `Q⁰x = μ₁`; `m = 1`, `u = x²`; `m = 2`, `u = x²`, `j = 0, 1` | `1`, `0`; `μ₂ + ∫2y(x−y)φ = μ₂ + 2xμ₁ − 2μ₂ = −μ₂`, equal to §3.3; `∇Q²u = 2x = Q¹[2y]`, `Hess = 2 = Q⁰[2] = 2μ₀` | pass; index shift from Prop 4.1.17 (`|α| = j+1 ≤ m`, `W^{|α|,1}(B)`) exact |
| §3.5 representation | `n = 1`, `m = 0`, `u = x`, `x = 1/2`; `u = x²`, `m = 2`; `n = 0` | `u − Q⁰u = 1/2 = ∫φ(y)(1/2 − y)dy = 1/2 − μ₁`; `0 = 0` with `D³u = 0`; `0 = 0` | pass; source proof divides by `n`, so `n = 0` separate as the README says; kernel bound `m(1/α!)|x−z|^m · C(1+γ)^n|x−z|^{−n}` gives the stated exponent `m+1−n` |
| §4.1 Bramble–Hilbert | `(−1,1)`, `m = 0`, `p = ∞`, `u = x`, `j = 0`; `m = 1`, `u = x²`, `j = 1`; `u = x`, `m = 1`; Riesz `n = 1`, `m = 0`, `f = 1`; graph constant `n = 1`, `m = 0`, `p = 2`, `C = 1` | `1 ≤ 2C`; `2 ≤ 4C`, top `2 = 2`; error `0`, `Q = 0` fails at `j = 0`; `g = ∫_0^1 1 = 1 = ‖f‖_p`; `‖x‖_{W^{1,2}} = √(8/3) ≤ √2·√5·√2 = √20` | pass; route uses no density, so `p = ∞` is covered (see Source issues) |
| §4.2 functional forms | `ℓ u = |∫u'|`, `u = x`, `q = 3`; `b(u,v) = (∫u')(∫v')`, `u = x`, `v = 2x`; `ℓ = 0` | `1 = 1`, top seminorm `1`; `b = 2`, seminorm product `1·2 = 2`, a constant in either slot gives `0`; `0 ≤ 0` | pass; both forms follow from `b u v = b(u − Q u)(v − Q v)` |
| §4.3 Rellich in `W^{k,p}` | `(0,π)`, `p = 2`, `u_N = sin(Nx)/N`; `k = 0` | `∫ sin²(Nx)/N² = π/(2N²) → 0`; `∫cos²(Nx) = π/2` not small; `lowerOrderL 0 = W1p.valueL` (pinned, Wkp/Basic.lean:175) | compactness of `lowerOrderL` and non-compactness of the identity consistent |
| §4.4 Deny–Lions | `(0,1)`, `m = 0`, `p = 2`, `u = x`; constants; two unit intervals `u = 0/1` | `√(13/12)` vs `1`; `0, 0`; distance to constants `inf_c √(c² + (1−c)²) = 1/√2`, seminorm `0` | pass; Peetre's argument needs `ker` finite-dimensional, supplied by §1.7 + §1.6 |
| §5.1 embedding | `(−1,1)`, `k = n = p = 1`, `u = x`; scaling `x ↦ tx`; `u = |x|`, `p = ∞`; evaluation `u = x`, `x = 1/2`, `p = 2`; `n = k = 0`, `p = 1` (Lean) | `sup = 1`, `2^{−1}·1 + 2⁰·2 = 5/2`; each term `diam^{j−n/p}|u|_{j,p}` is scale-invariant; `ess sup|v' − sign| ≥ 1` for smooth `v`, `√(x²+ε²)` within `ε`; `1/2` vs `2/√3`; hypothesis `p = 1 ∧ 0 ≤ 0` holds, `Ω` a point, `|f| ≤ C|u|_0` with `C = 1` | pass; Hölder exponent `(k−n)p' + n > 0 ⇔ kp > n`; `p = 1` needs `k ≥ n`; Lean's `n < k·p` with `0·∞ = 0` excludes `k = 0` |
| §5.2 density up to the boundary | `(−1,1)`, `x₀ = 0`, `t = 2`, `u = x`; `t ↓ 1`; `p = ∞` | pullback `x/2`, `‖x/2‖²_{W^{1,2}} = 1/6 + 1/2 = 2/3`; `|1 − 1/t|√(2/3 + 2) = |1−1/t|√(8/3) → 0`; `|x|` is no `W^{1,∞}` limit of smooth functions | pass; dilate contains `closure Ω` by the star hypothesis |
| §5.3 boundary continuity | `u = x²`, `k = 2`, `p = 2`, `j = 0`; `j = 1`, `v = 3`; `j = k`, `n ≥ 1` | value `1` at `x = 1`; `6x → 6`; `(k−j)p = 0 > n` fails | pass |
| Lean `exists_bramble_hilbert` degenerate | `Ω = ∅`; `n = 0`; `γ < 0` | `w = 0`, `q = 0`; `q = u(pt)`, `w = 0`, all seminorms `0`; hypothesis `diam ≤ γρ < 0` never holds | statement true or vacuous in each case, no hidden junk |
| Lean `exists_continuous_representative` at `p = ∞` | `n = 2`, `k = 1`, `p = ∞` | `n/p.toReal = 2/0 = 0`, bound `C(|u|_{0,∞} + diam·|u|_{1,∞})` | matches §5.1 with `n/p = 0`; docstring says so |

**Source verification** (all through the sources cache; locators as `<id> line N`). Brenner–Scott is `brenner-scott` (cache c8cce1c3, 2008 third edition), Bramble–Hilbert `bramble-hilbert` (c102e159, SIAM J. Numer. Anal. 7), Deny–Lions `deny-lions` (e352cd87, Numdam).

| Target | Text opened | Verified |
| --- | --- | --- |
| Conventions, §3.1 | brenner-scott line 4556, Def. 4.2.2, p. 96; line 4744, Def. 4.2.16, chunkiness | closed-hull convention and `γ = d/ρ_max`; README's inline hypothesis implies it for smaller balls |
| §3.2 | Mathlib `taylor_integral_remainder`; brenner-scott line 4545, (4.2.1), p. 96 | `C^{m+1}` on the whole interval |
| §3.3 | brenner-scott lines 4421, 4435, 4484, 4503–4516, Defs 4.1.1/4.1.3, Props 4.1.9/4.1.12, pp. 93–95 | degree `< m` (= README's `≤ m`), `L¹(B)` domain, bounded polynomial coefficients; Def. 4.1.3 asks `B ⊂⊂ Ω`, which the README's compactly supported cutoff in the open ball replaces |
| §3.4 | brenner-scott line 4523, Prop. 4.1.17, p. 95; Remark 4.1.11 line 4500 | `|α| ≤ m−1`, `u ∈ W^{|α|,1}(B)`; the integration-by-parts route |
| §3.5 | brenner-scott line 4627, Prop. 4.2.8, pp. 97–99, proof lines 4641–4743 | kernel support `C_x`, bound (4.2.10), division by `n` |
| §4.1 | brenner-scott line 4849, Lemma 4.3.6, pp. 101–102 (`p ≥ 1`, `m ≥ 1`, `p = 1, ∞` separately); line 4935, Lemma 4.3.8, pp. 102–104 (`p ≥ 1`, `k = 0..m`, `d^{m−k}`) | hypotheses and exponents match after the index shift |
| §4.2, §4.4 | bramble-hilbert line 104, Thm 1, p. 114; line 127, Thm 2, pp. 114–115; line 55 strong cone, line 72 diameter-weighted norm; deny-lions lines 2164–2179, III §2, Def. 2.1 and Thm 2.1, p. 366 | linear case, strong-cone domain, quotient by polynomials of degree `≤ m−1` complete |
| §5.1 | brenner-scott line 4778, Lemma 4.3.1, p. 100 (`1 < p < ∞`, `m > n/p`; `p = 1`, `m ≥ n`); line 4831, Lemma 4.3.4, p. 101 (continuity by density, `p < ∞`) | README's `p = ∞` route by finite `r` is the correct supplement |
| §5.2 | brenner-scott line 6173, Exercise 4.x.20, p. 127 | segment-condition continuity; cited as "compare" only |
| §1.1–1.8, §2.1–2.3, §4.3 | pinned declarations and the computations above; §2.3 cites Ciarlet (unread) | mathematics checked directly |

## Not verifiable

- **Ciarlet**, *The Finite Element Method for Elliptic Problems*, SIAM 2002, Theorem 3.1.3 (cited at §2.3): the sources service found no legal copy (DOI landing page returns HTTP 403); recorded in `needs-references.toml`. The §2.3 bounds were checked directly (table) and are correct as stated with radii.
- **Dupont–Scott** 1980 and **Evans** Chapter 5 are cited "as a work" without a claim-level locator; nothing in the roadmap depends on a statement from them, so nothing was verified.
- **Tau Ceti revision `a318838`** (README line 83) does not exist; the fourteen declarations were verified instead on Tau Ceti main at `333c9e49` (R03).
- Ownership against open pull requests was checked through the roadmap service's index and the sibling checkouts the brief lists; the board's packages were checked through its index only.

## Source issues

- **Gap** in brenner-scott at Lemma 4.3.8, printed p. 102 (lines 4941–4944): the proof reduces to `u ∈ C^m(Ω) ∩ W^m_p(Ω)` by density although the lemma allows `p = ∞`, where smooth functions are not dense in the Sobolev norm; it should apply Proposition 4.2.8 a.e. to every `u ∈ W^{m,1}(Ω)` directly; affects the proof.
- **Error** in brenner-scott at Lemma 4.3.14, equation (4.3.15), printed p. 104 (lines 5012–5024): the source says the full `W^1_p` norm of `u − ū` is bounded by a constant in `n, γ` times the gradient seminorm; on `(−R,R)` with `u = x` the ratio of squared norms is `1 + R²/3`, so the constant must depend on the diameter; affects a stated result.
