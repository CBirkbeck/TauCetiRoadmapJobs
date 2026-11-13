# Review of BochnerSpaces (pull request #2249 at 6c36ac4)

**Verdict:** needs changes

## R01 (P3) — The README cites an open Mathlib pull request and makes a claim about its contents

**Location:** `TauCetiRoadmap/BochnerSpaces/README.md:166–169`: "follow the explicit, non-global-instance design of the [Mathlib cylinder σ-algebra proposal][ml-cylinder-pr]. Its weak-dual carrier does not identify the cylindrical and norm-Borel structures"; link definition at `:1245`.

**Claim:** A README is timeless and cites libraries at the pins. This paragraph points at a pull request and describes code that is not in pinned Mathlib.

**Witness:** `README.md:1245`: `[ml-cylinder-pr]: https://github.com/leanprover-community/mathlib4/pull/45494`. Pinned Mathlib (`1b1ccf4b`) has no cylinder σ-algebra on a weak dual (`grep -ril cylinder Mathlib` lists only `Probability/` and `Algebra/Homology/` files).

**Repair:** Delete line 1245 and replace lines 166–169 with: "Evaluation-generated σ-algebras are explicit structures, never global instances. §1.1 proves their comparison with the norm-Borel σ-algebra under its separability hypotheses."

## R02 (P3) — §2.2 plans closed-convex barycentre statements that pinned Mathlib proves

**Location:** `README.md:354–357`: "Prove that the integral lies in every closed convex set containing `f` almost everywhere … Give normalized-average versions on sets of finite positive measure."

**Claim:** Both statements are at the pin, for any complete real normed target with no separability hypothesis. They must be cited under From Mathlib, not planned.

**Witness:** `Convex.integral_mem` (`Mathlib/Analysis/Convex/Integral.lean:56`, probability measure) and `Convex.set_average_mem` (`:94`, hypotheses `μ t ≠ 0`, `μ t ≠ ∞`) at Mathlib `1b1ccf4b`.

**Repair:** Replace the two sentences with: "Mathlib's `Convex.integral_mem` and `Convex.set_average_mem` place the integral, and the normalized average over a set of finite positive measure, in every closed convex set containing `f` almost everywhere. Deduce membership in the closed convex hull of the values on any measurable full-measure set." Add both names, and `ConvexOn.map_integral_le` (`:196`, the continuous case of Jensen), to the From Mathlib list; the lower-semicontinuous Jensen inequality stays a target.

## R03 (P3) — §7.1 plans the partition formula for variation that pinned Mathlib proves

**Location:** `README.md:806–807`: "Identify variation on a measurable set with the supremum over its finite measurable partitions."

**Claim:** Mathlib's `VectorMeasure.variation` is built from finite partitions and both inequalities of this identification are pinned lemmas.

**Witness:** `VectorMeasure.le_variation` (`Mathlib/MeasureTheory/VectorMeasure/Variation/Basic.lean:65`) and `VectorMeasure.exists_lt_sum_of_lt_variation` (`:89`) at Mathlib `1b1ccf4b`.

**Repair:** Replace the sentence with: "Variation on a measurable set is the supremum of `∑ ‖m(Aᵢ)‖` over finite disjoint measurable families inside it, by Mathlib's `VectorMeasure.le_variation` and `VectorMeasure.exists_lt_sum_of_lt_variation`." Add the two names to the vector-measure bullet of From Mathlib.

## Previous findings

- R01 — repaired: `Suggested.lean:106–111` "zero_mem' := let ⟨g, hg, h⟩ := aefinStronglyMeasurable_zero …"; `dunfordIntegral` is gone.
- R02 — repaired: no `set_option` in `Suggested.lean` (gate `set_option=0`).
- R03 — repaired: `Suggested.lean:126` `exists_minkowskiContraction`, `:149` `exists_lpOneTensorEquiv`, `:200` `pettisIntegrable_of_forall_not_antilipschitz`; each named in README §4.1, §4.4, §6.4.
- R04 — repaired: `README.md:774–776` "a.e. equality from equality of their set integrals over a generating π-system containing the whole space", with the two-point Check at `:785–787`.
- R05 — repaired: none of the 15 declarations remains (31 declarations, 24 theorems).
- R06 — repaired: `Suggested.lean:175–178` states `exists_pettisVectorMeasure` existentially; no `Classical.choose`.
- R07 — repaired: `Suggested.lean:5–6` "import Mathlib / import TauCeti.Analysis.Normed.Module.TensorProduct.Completion".
- R08 — repaired: `Suggested.lean:9` "# Bochner spaces: target signatures"; section comments `## Layer k: …`; all 31 names occur in the README.
- R09 — repaired: `README.md:45` "Work over `𝕜=ℝ` or `ℂ`" (gate `latex=0 tex=0`).
- R10 — partly repaired: `scalarRNDeriv` and the revision hashes are gone; `README.md:167` still reads "the [Mathlib cylinder σ-algebra proposal][ml-cylinder-pr]" (R01 above).
- R11 — repaired: `Coverage.md` is deleted (gate `stray-files=0`); the README no longer mentions it.
- R12 — repaired as asked: `README.md:801` "## Layer 7: The Radon–Nikodým property and representable operators", `:992` "### 8.1 The integral pairing and its isometry"; the arrangement against the source's contents is under "For the human reviewers".
- R13 — repaired: `README.md:1` "# Roadmap: bochner spaces", `:91` "## Exact supplier contracts", `:171` "## How to read the build", `:1202` "## Downstream consumers", `:1209` "## References".
- R14 — repaired: `**Checks.**` lists at §1.4, §3.1, §3.3, §6.1, §6.2, §7.1, §7.2, §7.3, §7.5, §8.1, each with at least three bullets.
- R15 — repaired: e.g. `README.md:338` "(HvNVW, Theorem 1.2.4, pp. 15–16.)"; 49 locator parentheses (none could be read against the text, see Not verifiable).
- R16 — repaired: `README.md:100–108` cites `SimpleFunc.integral_eq_sum`, `integral_add`, `tendsto_integral_of_dominated_convergence`, `integrable_map_measure`, `integral_prod`; `:921` "Use native scalar `condExpL2`". Two further restatements: R02, R03.
- R17 — repaired: `README.md:129–134` cites `TauCeti.CompletedProjectiveTensor`, `liftIsometry`, `TauCeti.ProjectiveTensor.tmulL`; the UnboundedOperators and PDE rows are gone.
- R18 — repaired: the description now reads "Its BanachSpaceTheory suppliers are B1–B3, B4.0's independent finite-measure reflexive density theorem, and B5's scalar duality and measure representation", which the head confirms.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 `stronglyMeasurable_iff_scalar_tests` | nonseparable `X`, `f = id`; `S = ∅` | `id`: no separable closed `E ⊇ range`, right side false, `id` not strongly measurable; `S = ∅`: both sides true | iff holds both ways | none |
| §1.2 `aefinStronglyMeasurable_iff_scalar_tests` | singleton with `μ = ∞`, `f = x ≠ 0` | `x'(x) ≠ 0` for some `x'`; constant `x'(x)` not finitely supported; left false, right false | agree; a norming sequence gives a common σ-finite support | none |
| §1.3 Approximation and transport | uncountable counting measure, `f = 0`, `φ(0) = 1` | `φ∘f = 1`, not `AEFinStronglyMeasurable`; with `φ(0)=0` or σ-finite `μ` the support stays σ-finite | stated alternative hypotheses needed | none |
| §1.5 Completion and preimages | Lebesgue `[0,1]`, `f = 𝟙_N`, `N` null non-Borel | range `{0,1}` separable; `f = 0` a.e.; `f⁻¹{1} = N` null-measurable, `μ = 0 = μ(∅)` | completion statement holds | none |
| §1.6 Injective operators | `L∞(0,1) → L²(0,1)`, `f(t) = 𝟙_(0,t)` | `‖f(t)−f(s)‖₂ = √|t−s|`; `‖f(t)−f(s)‖_∞ = 1` for `s ≠ t` | separability of the domain needed, as stated | none |
| §2.1 `integral_mem_graph` | `dom T = {0}`; `T = d/dx` on `C¹ ⊂ C[0,1]`, `f(s) = sin(s·)` on `[0,1]` | `{0}`: `f = g = 0` a.e., `(0,0) ∈ graph`; second: `∫f = (1−cos x)/x`, `∫g = ∫ s cos(sx) ds = d/dx ∫f` | holds | none |
| §2.2 Convexity and integration | probability on `{1,2}`, `C = [0,1]`, `f = (0,1)`; `φ = |·|` | `∫f = 1/2 ∈ C`; `φ(∫f)=1/2 ≤ 1/2` | true; closed-convex part is `Convex.integral_mem` | R02 |
| §2.3 `ae_mem_of_set_averages` | `μ = 0`; singleton with `μ = ∞`, `C = {1}` | `μ=0`: conclusion trivial; infinite singleton: `f = 0`, no admissible `A`, `0 ∉ C` | `SigmaFinite` needed and present | none |
| §3.1 `linftySigma`, `isClosed_linftySigma` | singleton `μ=∞`; uncountable counting measure | singleton: carrier `{0}`, native `L∞ ≅ 𝕜`; counting: `‖1‖_∞ = 1`, `1 ∉ L∞_σ`; limits keep the union of countably many σ-finite supports | closed; a "wrong model" (all of `L∞`) excluded by both Checks | none |
| §3.2 μ-simple approximation | `L∞(0,1)`, `f(t) = t`; `ℓ∞`-valued `t ↦ 𝟙_(0,t)` excluded (not measurable) | `f`: `⌊nt⌋/n` within `1/n` uniformly; countably-valued density on `L∞_σ` uses a countable ε-net of the essential range | consistent with "no finite-range density" claim | none |
| §3.3 Separability | counting on `{1,2}`; purely infinite singleton | `d({1},{2}) = 2 = |A△B|`; infinite singleton: quotient is one class, `Lᵖ = 0` for `p<∞` | Checks correct; nonzero qualification needed | none |
| §4.1 `exists_minkowskiContraction` | `p=1,q=2`, counting on `{1,2}`, `F=𝟙_{s=t}` | `‖F‖_{L¹(L²)} = 2`, `‖F‖_{L²(L¹)} = √2` | `√2 ≤ 2`; reverse direction false | none |
| §4.2 `exists_fubiniEquiv` | `F = 𝟙_{A×B}x`, finite `A, B` | `‖F‖ᵖ = μ(A)ν(B)‖x‖ᵖ` on both sides; sections `𝟙_A(s)𝟙_B x` | isometry and section formula agree | none |
| §4.4 `exists_lpOneTensorEquiv` | counting on `{1,2}` | `‖e₁⊗x+e₂⊗y‖_π = ‖x‖+‖y‖ = ‖(x,y)‖_{L¹(μ;X)}` | holds; pure tensors span a dense set, so `e` is determined | none |
| §5.1 Convolution and Young | `d=1`, `k = 𝟙_[0,1]`, `f ≡ x`, `p=∞` | `k*f ≡ x`, `‖k*f‖_∞ = ‖x‖ = ‖k‖₁‖f‖_∞` | bound sharp at the endpoint | none |
| §6.1 `WeaklyIntegrable`, τ(X,Y)-integral | `f = s^(−1/3)` on `(0,1)`; `c₀` example | `∫ = 3/2 = ‖T_f‖`; `c₀`: `⟨x', D f⟩ = Σ x'ₙ`, so `Df = (1,1,…) ∉ c₀` | Checks correct | none |
| §6.2–6.3 `PettisIntegrable`, `exists_pettisVectorMeasure` | `ℓ²`, `Σ 𝟙_(Aₙ)(2ⁿ/n)eₙ`, `μ(Aₙ)=2⁻ⁿ` | `∫‖f‖ = Σ 1/n = ∞`; `x_A` has coefficients `≤ 1/n`, in `ℓ²`; tails `(Σ_{n>N} n⁻²)^{1/2} → 0` | Pettis, not Bochner; norm-additive | none |
| §6.4 three criteria | `X=c₀` (identity is 1-antilipschitz); `p=1` excluded | `c₀` example weakly integrable, not Pettis, so `hX` needed; weak-`Lᵖ` proof bound `‖φ𝟙_{Bₙ∖Bₘ}‖_q‖T_f‖ → 0` needs `q<∞` | hypotheses exact | none |
| §6.5 π-system uniqueness | `S={1,2}`, `P={{1}}`, `f=𝟙_{2}x`, `g=0` | `∫_{1}f = 0 = ∫_{1}g`, `∫_S f = x ≠ 0` | excluded by "containing the whole space" | none |
| §7.1 variation | `m(A)=Σ_{j∈A} j⁻¹eⱼ` in `ℓ²` | `|m|(ℕ) = Σ 1/j = ∞`; `‖m(ℕ)‖² = Σ j⁻² < ∞` | Check correct; partition formula is pinned | R03 |
| §7.2 `HasRNPWith`, `HasRNP`, universality | `μ=0`; counting on `ℕ`; singleton `μ=∞`, `X=ℝ` | `μ=0`: `|m| ≪ 0` gives `m=0`; `ℕ`: density `m{n}`, `Σ‖m{n}‖ = |m|(ℕ) < ∞`; singleton: `m = δ`, only integrable `f` is `0` | relative ≠ intrinsic; arbitrary-measure universality false, not claimed | none |
| §7.3 `representableOperatorMap` and its two theorems | probability, `g ≡ x`; counting on `ℕ`; singleton `μ=∞` | `‖f ↦ (∫f)x‖ = ‖x‖`; `ℕ`: `sup‖xₙ‖`; singleton: `L¹ = 0`, map zero, `‖g‖ ≠ 0` | isometry needs σ-finiteness, present | none |
| §7.4 Stability, separable determination | `X = ℓ∞ ⊇ c₀`; trivial sub-σ-algebra on a probability space | `c₀` fails RNP, so `ℓ∞` fails; trivial σ-algebra: density `= ∫f`, a constant | consistent with §9.8 | none |
| §7.5 `hasRNP_strongDual_of_separable`, interval universality | `X = c₀` (dual `ℓ¹` separable); `X = ℓ¹` (dual `ℓ∞` not separable) | `ℓ¹` has RNP; hypothesis fails for `ℓ¹`, and `ℓ∞` lacks RNP; dyadic cells `2ⁿ` of measure `2⁻ⁿ` | "dual itself separable" is the right hypothesis | none |
| §8.1 `bochnerDualMap` and four norm theorems | one point, `𝕜=ℂ`, `f=1`, `g=i`; singleton `μ=∞`, `(p,q)=(1,∞)` | `(Jg)(f) = i` (bilinear; conjugation would give `−i`); singleton: `L¹=0`, `J=0`, `‖g‖_∞ ≠ 0`, `L∞_σ = 0` | orientation fixed; σ-finite or `L∞_σ` hypotheses needed, present | none |
| §8.2 two surjectivity theorems | `X=ℝ`; uncountable counting measure, `p=1` | scalar case is scalar duality; counting, `p=1`: summation functional has density `1 ∉ L∞_σ`; for `1<p<∞`, `Φ(h) = O(t^{p−1}) → 0` off a σ-finite support | `p=1` rightly excluded for arbitrary measures | none |
| §9.4 Product measures | Lebesgue × counting on `[0,1]`, diagonal `D` | `∫(∫𝟙_D d#)dλ = 1`, `∫(∫𝟙_D dλ)d# = 0` | unequal, as stated | none |
| §9.5 Weak, Pettis, Bochner | two copies of `(0,1)`, `f` and `−f` (`c₀` example) | total Dunford integral `0 ∈ c₀`; on the first copy `(1,1,…) ∉ c₀` | setwise definition needed | none |

- Source locators checked against the text: 0 of 49 (HvNVW and Ryan are paywalled, Diestel–Uhl has no legal copy found, the errata host timed out three times).
- Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): 24, among them `ContinuousLinearMap.lpPairing` (`MeasureTheory/Function/Holder.lean:149`), `lpPairing_eq_integral` (`:152`), `VectorMeasure.variation` (`VectorMeasure/Variation/Defs.lean:51`), `Measure.variation_withDensityᵥ` (`VectorMeasure/WithDensityVec.lean:366`), `MemLp.aefinStronglyMeasurable` (`StronglyMeasurable/Lp.lean:58`), `Measure.sigmaFiniteSetWRT` (`Decomposition/Exhaustion.lean:67`), `TauCeti.aestronglyMeasurable_iff_forall_inner` (`Pettis.lean:70`), `Lp.toDual` (`Lp/Duality.lean:431`), `dualOneEquiv` (`L1Space/Dual.lean:102`), `lp.dualEquiv` (`Normed/Lp/Dual.lean:175`), `convolutionLp` (`Lp/Convolution.lean:87`), `eLpNorm_prod_eq_eLpNorm_eLpNorm` (`Lp/Iterated.lean:144`), `MemLp.integrable_apply` (`Function/Holder.lean:34`), `tmulL` (`ProjectiveSeminorm.lean:394`). No Hille, Pettis-integral, Orlicz–Pettis or RNP declaration exists at either pin.
- Cross-roadmap citations resolved: BanachSpaceTheory B1, B2, B3, B4.0 and B5 on main (`## B1` at line 54, `### B4.0` at 359 with the reflexive density statement at 380–392, `## B5` at 800).
- Gate at this head: every check passes (`build=0`, `depcheck=0`, `outside-folder=0`). Dependency check: `depcheck: 223 roadmaps, 1971 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 24 `sorry` warnings and nothing else. One-tactic probe (`first | rfl | simp | infer_instance`) on a scratch copy: 0 of 24 theorems close. The 31 elaborated signatures were compared with the README statements; no binder is lost and the generality agrees.
- Headlines (Pettis measurability, Hille, Minkowski/Fubini/tensor identifications, Pettis criteria, duality ⇔ RNP) are all stated; none is declared not statable.
- Pull-request text: title and description agree with the head (new roadmap, suppliers named).
- Overlap check: read BanachSpaceTheory (main and its open revision), StochasticCalculus, UnboundedOperators, SobolevMapsBetweenManifolds, VonNeumannAlgebras, PDE §6.1; shared: reflexive bounded-variation densities (owner BanachSpaceTheory B4.0, cited), scalar `Lᵖ` duality (owner B5, cited); nothing else shared.
- Source independence: 0 passages compared with 0 of 3 sources (none readable); largest share HvNVW, 47 of 49 locators; contents of HvNVW not compared (table of contents not readable).

## Not verifiable

- All 15 sampled targets (§1.1, §1.3, §1.5, §1.6, §2.1, §2.2, §3.1, §3.2, §3.3, §5.1, §6.1, §7.4, §7.5, §9.4, §9.5) cite HvNVW (doi 10.1007/978-3-319-48520-1), which is paywalled; no theorem number or page could be checked.
- The errata (`fa.ewi.tudelft.nl/~neerven/ABS/errata-vol1.pdf`), cited at §1.3, §5.1 and §8.3: the host timed out on three attempts.
- Ryan, Example 2.19, pp. 29–30 (§4.4): paywalled (doi 10.1007/978-1-4471-3903-4).
- Diestel–Uhl, Chapter I, §4, Corollary 4, p. 22 (§6.3): no legal copy found.
- Ownership against board packages not yet in a pull request was checked only through the board index (three packages, none related).

## Source issues

- none

## For the human reviewers

- **Not tested.** HvNVW carries 47 of 49 locators; its text and table of contents could not be read, so wording and arrangement were not compared. By the README's own locators, Layers 1–6 cite items 1.1.1–1.2.45 in increasing order.
- **Scope.** The description says the roadmap is "based on Chapter 1 of Volume I" and that "definitions, unnamed results and examples from the main text are included"; whether that coverage design is acceptable is yours to decide.
- **Licence.** The errata cited at `README.md:1214` and `:1257` are an author-hosted PDF dated June 18, 2026; the host could not be reached, so its status was not classified.
