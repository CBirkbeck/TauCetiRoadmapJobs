# Review of GroebnerGeometry (pull request #2587 at ab404d0)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. I recomputed every Check and worked example and tested each of the eleven headline theorems of `Suggested.lean` on degenerate cases; for the lifted-relation presentation, the flat weight degeneration and the special fibre of the weight Rees family I also checked a complete proof route, and all hold as stated. There are five small corrections, none blocking: §4.10 names its base ring's Noetherian hypothesis only after the one claim that needs it; Convention 1 puts normal forms over a field while §1.2 states them over a ring; Hashimoto's Theorem 17 covers only `n ≥ 4`; a pointer in §6.2 reads as the wrong §2.6; and the list of downstream consumers is incomplete. There is one format note. One point is left to the human reviewers: Miller–Sturmfels, the most-cited source, could not be read, so the wording was not compared with it.

## C01 — §4.10 asserts the large-degree comparison on `ℙᴺ_A` before saying that `A` is Noetherian, and for a general ring `A` it fails

The first sentence of §4.10 (lines 894–897) builds the sheafification API "on `ℙᴺ_A`", ending with "the comparison of `(S/I)_m` with `Γ(X, O_X(m))` for all sufficiently large `m`"; `A` is introduced as "a Noetherian ring" only three lines later (line 899), for the saturated presentations. Read with `A` arbitrary, the charts, exactness, `S(−d)~ = O(−d)` and `(S/I)~ = i_* O_X` are true, but the comparison is not. Take `A = k[a₁, a₂, …]`, `S = A[x₀, x₁]` and `I = ∑_i a_i (x₀, x₁)^i`. In degree `m`, `I_m = (a₁, …, a_m) S_m`, so `a_(m+1) x₀^m` is nonzero in `(S/I)_m`; but `x₀ · a_(m+1) x₀^m` and `x₁^(m+1) · a_(m+1) x₀^m` lie in `I`, so it vanishes on both charts and maps to `0` in `Γ(X, O_X(m))`, for every `m`.

Writing "on `ℙᴺ_A` for a Noetherian ring `A`" in the first sentence settles it (main had "on projective space", with `κ` in context). Whichever base is chosen, note that DeformationAndDerivedPatchingAlgebraPartII on main (its lines 115–120 and 1552–1554) describes this API as "over a field" and treats the polynomial ring over an arbitrary `A` as an instance of its own general-ring statements; that description is in that roadmap.

## C02 — Convention 1 says normal forms are over a field, but §1.2 and the overview state them over any commutative ring

Convention 1 (lines 79–80) puts "Normal forms, reduced bases, Buchberger completion and SAGBI theory" over a field `k`. §1.2 (lines 177–178) states the normal-form theory for a Gröbner basis whose nonzero members have unit leading coefficients, and the overview (lines 12–14) says the same. The pinned statements agree with §1.2: in `TauCeti/RingTheory/MvPolynomial/Groebner/NormalForm.lean` the normal form takes the hypothesis `∀ g ∈ G, g ≠ 0 → IsUnit (m.leadingCoeff g)` over a commutative ring (lines 202–207). A reworded sentence would do: "Reduced bases, Buchberger completion and SAGBI theory are over a field `k`; normal forms need only unit leading coefficients."

## C03 — Hashimoto's Theorem 17 covers `n ≥ 4` only, while §5.5 and the Lean docstring cite it for every `n`

Hashimoto's symplectic section fixes `4 ≤ 2t ≤ n` and the group of `E = k^(2t−2)` (Hashimoto line 225–226), and Theorem 17 (line 372) is stated in that setting; `SL₂ = Sp₂` is `t = 2`, hence `n ≥ 4`. The statement `equalizer_sl2Coaction_eq_adjoin_minors` is still true for `n ≤ 3`: the coaction preserves the degree in each row, so the invariants of `n` rows are the invariants of `4` rows of degree `0` in the rows `n, …, 3`, and in `k[p_ij]` that part is spanned by the monomials in the `p_ij` with `i, j < n` (for `n = 0, 1` the constants, for `n = 2` `k[det]`).

Adding "for `n ≥ 4`" to the locator in §5.5 (line 1066) and in the docstring, with a clause on this reduction, makes the citation cover what is stated.

## C04 — §6.2 points to "§2.6's computation of `H⁰(ℙ¹, O(d))`", which reads as this roadmap's §2.6

Line 1180. In this README §2.6 is Proj and Hilbert functions of semigroup rings and computes no sheaf cohomology; the computation meant is SchemeAndStackFoundations §2.6 ("Quasi-coherent cohomology", its line 4357, with `H⁰(ℙ¹_k, O(1))` at line 4420), as the *Needs:* line of §6.2 says. Writing "SchemeAndStackFoundations §2.6's computation" removes the ambiguity.

## C05 — The list of downstream consumers omits DeformationAndDerivedPatchingAlgebraPartII and gives Layer 2's counts to a roadmap that does not use them

DeformationAndDerivedPatchingAlgebraPartII on main takes the graded sheafification, the graded syzygy theorem and the Hilbert and `K₀` comparisons from G4 (its lines 115–118) and is absent from the list at lines 1292–1306. The bullet at lines 1298–1300 says that CanonicalModelsAndGonality and AlgebraicModuliForArithmeticGeometry consume "Layer 2's semigroup counts"; every citation in CanonicalModelsAndGonality is of G4 (its lines 153, 429, 436, 792, 817, 913, 932, 940), and only AlgebraicModuliForArithmeticGeometry cites G2 (its line 772).

A bullet "DeformationAndDerivedPatchingAlgebraPartII consumes the graded sheafification, syzygies and `K₀` comparison of §§4.9–4.11", and the semigroup counts attached to AlgebraicModuliForArithmeticGeometry alone, would make the list right.

## N01 — In §1.1, "contraction to the variables `e τ`" uses the direction of `e` from §1.7, not §1.1's `e : σ → τ`

Line 156: with §1.1's `e : σ → τ` the variables are `e σ` (the image of `e`). The pinned `MonomialOrder.IsGroebnerBasis.comap_rename` (`TauCeti/RingTheory/MvPolynomial/Groebner/Elimination.lean:68`), cited in §1.7, has `e : τ → σ`.

## Earlier findings

The previous review read this same head and raised no finding, so there is none to account for. Its four small corrections and its format note are unchanged in the text and are restated above after I re-verified each (C02–C05, N01); C01 is new, and turns that review's question about the base ring of §4.10 into a computed statement.

## Deferred findings

- D01 — stands

## Questions for the author

- `flagMinorFamily_isSAGBIBasis`, `exists_leadingExponents_equiv_gtPattern` and `span_leadingTerm_ker_pluckerMap` are stated over every field, and they are true there, since straightening holds over `ℤ` and leading exponents of standard monomials do not depend on the field. Do Miller–Sturmfels, Theorems 14.6 and 14.11, state them at that generality? Kogan–Miller's Theorem 5 is over `ℂ` (line 310–313), and I could not read Miller–Sturmfels.

## Verified sound

| Statement | Instances tried | Statement side | Other side (computed, source or library) | Result |
|---|---|---|---|---|
| §1.1 remainders (sampled) | `B = {x² + y}`, `f = y²`, lex `x > y`; `G = {x, x + y}` | `r = y²`, quotient forced to `0`; `y ∈ (G)`, leading term `y ∉ (x)` | degree bound read with `⊥` at `0` (Convention 2); `comap_rename` Elimination.lean:68 | holds |
| §1.2 normal forms (sampled) | `I = (x² − y)`, both lex orders | standard `yᵇ, x yᵇ`, `NF(x³) = x y`; for `y > x`: `xᵃ`, `NF(x³) = x³` | NormalForm.lean:202–207, unit leading coefficients over a ring | holds |
| §1.3 homogeneous ideals (sampled) | `I = (x² − y²)`, degree 2, lex | standard monomials `xy, y²`: dimension 2 | `(R/(x²))₂` has dimension 2; Homogeneous.lean:94, :148, :284 | holds |
| §1.4 Check | `{xy − 1, y² − 1}` | S-polynomial `y(xy−1) − x(y²−1) = x − y` | `xy − 1 = y(x − y) + (y² − 1)`; reduced basis `{x − y, y² − 1}` | holds |
| §1.5 comparison (sampled) | `s = {xy−1, y²−1}`, `G = {x−y, y²−1}` | `NF(xy − 1) = NF(y² − 1) = 0` | both spans have the reduced basis `{x−y, y²−1}` | holds |
| §1.7 Check | `(tx, (1−t)y)`, lex `t > x > y` | S-polynomial of `tx`, `ty − y` is `xy` | other pairs reduce to `0`; `(x)∩(y) = (xy)`, product `(x)(x) = (x²) ≠ (x)` | holds |
| §1.9 Checks | `x² − y` at `w = (1,1), (1,3), (1,2)`; `I = (x − y², y)` | `x²`, `−y`, `x² − y`; generators give `(y)` | `x = (x − y²) + y·y ∈ I`, so `in_w(I) = (x, y)` | holds |
| §1.10 coefficients (sampled) | `ℚ → ℚ(i)`, `I = (x² + 1, y − x)` lex `y > x` | reduced basis `{y − x, x² + 1}` over both fields | Map.lean:62, :94, :109, :123, :148 (injective `φ`, field case) | holds |
| §2.3 saturation (sampled) | `⟨2,3⟩`, `2ℕ`, `⊥` in `ℤ` | `⟨2,3⟩`: `sat ⊓ L_S = ℕ ≠ S`; `2ℕ`: equal, `k[t²]` normal | `t = t³/t²` root of `Y² − t²`; `nsmulSaturation` is `{x | ∃ n > 0, n•x ∈ S}` (NSMulSaturation.lean:45) | holds |
| §2.5 faces, stabilizers (sampled) | `ℤ³` example; Whitney umbrella | `L_S/gp F = ℤ ⊕ (ℤ/2)²`, index `4`; umbrella `ℤ ⊕ ℤ/2` | Sturmfels Prop. 1.3(a), line 99–101, orbits and faces over `ℂ` | holds |
| §2.6, §2.7 Checks | `(1,0),(1,1),(1,2)`; `(1,0),(1,2)`; scroll | `2n + 1`, series `(1+T)/(1−T)²`; length `1` in `2ℤ`; area `3/2` | Sturmfels Thm 1.4, line 104–108, affinely generated lattice; line 111–112 gives `3` | holds |
| §3.4 SAGBI criterion (sampled) | `c = (x, 1)`; `c = ∅`; `c = (x, x)` | kernel `(Y₂ − 1)`, `Q = 0`; no relation; `Y₁ − Y₂ ↦ 0` | Criterion.lean:276 has the same binomials and strict bound; BCL Thm 2.2, line 156–160 | holds |
| `ker_aeval_eq_span_sub_of_lifts` (§3.5) | `ι = ∅`; `u_j = v_j`; infinite `ι` | `⊥ = ⊥`; `F_j = −Q_j ∈ ker` | top block of a kernel element lies in `ker ψ₁`, replaced by `Q_j` it drops in `m.toSyn`; not in the pin | holds |
| §3.6 nonmonic families (sampled) | `b = (2x, x² + x)`; regression `b = (x, x+y, 2x+y)` | `φ_b(Y₁) = 2x = φ_c(D_ℓ Y₁)`; relations give `−(x+y)`, `−x` | normalized: `−y/2`, `y/2`, only constants below `x`: no bounded subduction | holds |
| §4.1 Rees algebras (sampled) | `f = x² − y`, `w = (1,1)`, `j = 2, 3` | `f t² ↦ x² − t y`, `f t³ ↦ t(x² − t y)` | `t^(j−D) f^h`; `coeffSubalgebra` Basic.lean:76, fibre at `1` UnitFiber.lean:107 | holds |
| `weightDegeneration_flat_and_fibres` (§4.4, sampled) | `I = (x² − y)`; `I = (x − y², y)`; `I = ⊥, ⊤`; `w = 0` | `(x² − ty)`, basis `yᵇ, x yᵇ`; `J = (x, y)`; `J = I[t]` for `w = 0` | `J = {g : g_d(1) ∈ I ∀ d}`, so `p(t) g ∈ J ⇒ g ∈ J`; Bossinger line 165–170 | holds |
| `weightReesFamily_specialFibre` (§4.5, sampled) | `w = 0`; `A = k`; `A = k[x² − y]` | `B = A[t]`, kernel `tB`; `B = k[t]`; image `k[x²]` | `B = {g : g_d(1) ∈ A ∀ d}`: `t g' ∈ B ⇒ g' ∈ B` | holds |
| §4.3, §4.7, §4.8 Checks | `(tx − y², y)`; `k[s, u]` degrees `1, 2` | `= (tx, y)`, `x ∉`; `dim B_m = ⌊m/2⌋ + 1`, `B^(2) = k[s², u]` | `O_B(1)` generated by `s` on both charts: trivial; `O_B(2)` has `s², u` | holds |
| §4.10 comparison (C01) | `A = k[a₁, a₂, …]`, `I = ∑ a_i (x₀,x₁)^i` | `a_(m+1) x₀^m ≠ 0` in `(S/I)_m` | `0` on `D₊(x₀)` and `D₊(x₁)` for every `m` | needs Noetherian `A` |
| §4.11 `K₀(ℙᴺ)` (sampled) | `ℙ¹` point; conic and `xz` in `ℙ²` | `[O] − [O(−1)]`, polynomial `1`; numerator `1 − T²` both | Weibel II.8.6 line 3428–3430 (free on `[O(−i)]`), II.8.2 line 3285–3288 | holds |
| `isIntegrallyClosed_addMonoidAlgebra_of_saturated` | `S = 2ℕ, ⟨2,3⟩, ⊥` | `2ℕ`, `⊥`: hypothesis holds, rings `k[t²]`, `k` normal | `⟨2,3⟩`: hypothesis fails; converse is Saturation.lean:140 | holds |
| `flagMinor_leadingTerm` (§5.1) | rows `(0,1)`, `(1,0)`; `d = 0`; zero ring | `z₀₀z₁₁`; `d = 0`: `1 = monomial 0 1` | rows `(1,0)`: `−z₀₀z₁₁`, so `StrictMono` needed; minor is DeterminantalIdeal.lean:29 | holds |
| `flagMinorFamily_isSAGBIBasis` (§5.3) | `n = 0, 2` | `n = 0`: `∅` basis of `k`; `n = 2`: `z₀₀, z₁₀, det`, free exponents | Kogan–Miller Thm 5, line 310–313, over `ℂ`, any diagonal order | holds |
| `exists_leadingExponents_equiv_gtPattern` | `n = 0, 1, 2`; `det`; row set `{1}` | `det`: all informative cells `1`; `{1}`: `P(0,1), P(0,2), P(1,2) = 0, 1, 0` | `GTPattern` (GelfandTsetlin/Basic.lean:89): zero off `i < j ≤ n`, `P i j ≤ P i (j+1)`, `P (i+1)(j+1) ≤ P i j` | holds |
| `span_leadingTerm_ker_pluckerMap` (§5.2) | `n=4, d=2`; `d = 1`; `d > n`; `d = 0` | `P₀₃P₁₂` leads; `d = 1`, `d > n`: `⊥ = ⊥` | `d = 0`: kernel `(P − 1)`, leading term `P ≠ ⊥`, so `0 < d` needed; Borovik–Hibi line 107–110 | holds |
| `equalizer_sl2Coaction_eq_adjoin_minors` (§5.5, C03) | `n = 0, 1, 2`; `𝔽₂`, `n = 1` | constants; constants; `k[det]` | `a² + ab + b²` fixed by `SL₂(𝔽₂)` only; Hashimoto line 225–226: `4 ≤ 2t ≤ n` | holds; locator narrower |
| `exists_finite_isSAGBIBasis_permInvariants_iff` (§5.6) | `A₃`; `⟨(0 1)⟩ ≤ S₃`; `n = 0, 1` | `A₃`: closure of `∅` is `⊥ ≠ A₃`; others both sides true | `(e₁e₂ − Δ)/2 = x²z + xy² + yz² + (3/2)xyz`, exponent `(2,0,1)`; Reichstein line 161–164, any order | holds |
| `exists_hilbertPolynomial_pluckerMap_two` (§6.6) | `n = 2, 3, 4, 5` | `P = 1`; `C(m+2, 2)`; leading `2/4!`, `5/6!` | `catalan 0..3 = 1, 1, 2, 5`; Speyer–Sturmfels line 431–432; `HF(2) = 21 − 1 = 20` | holds |
| §6.1 cusp (sampled) | `(3,0), (0,3), (2,1)` | `x²y = (6,3) = z³`; `(z²/x)³ = (3,6) = xy²` | `L_S` = sum divisible by `3`; face `(3,0)`: `L_S/gp F ≅ ℤ` by `b` | holds |
| §6.2, §6.3 Checks | scroll; umbrella | `ad = b²`, `ae = bc`, `be = cd`; `v² = u²w` | `O(1) ⊕ O(2)`: `2 + 3 = 5 = 6 − 1`; `(2H − E)² = 3`; `gp F = 0 × 2ℤ` | holds |
| §6.5 Checks | splits `12|34`, `13|24` | `P₁₃P₂₄ − P₁₄P₂₃ − t²P₁₂P₃₄`; `P₁₂P₃₄ + P₁₄P₂₃` | order `1,3,2,4`: only `ε₂₃ = −1`; Speyer–Sturmfels (10), line 410–415 | holds |
| §6.7 flag minors (sampled) | `af − be + cd`; `u v` coefficient | diagonals `z₀₀z₁₀z₂₁` twice, `z₀₀z₁₁z₂₀` smaller | `3·3 − 1 = 8`; ClassicalGroups Layer 6 Check: rows `2,1,3,2`, 8 patterns | holds |
| Convention 1 (C02) | NormalForm.lean:202–207 | "over a field `k`" | unit leading coefficients over a commutative ring | inconsistent |
| §6.2 pointer (C04) | SchemeAndStackFoundations lines 4357, 4420 | "§2.6's computation" | this §2.6 is Proj and Hilbert functions | ambiguous |
| Downstream list (C05) | consumers on main | 7 bullets | DeformationAndDerivedPatchingAlgebraPartII lines 115–118 absent; CanonicalModelsAndGonality cites G4 only | incomplete |
| §1.1 notation (N01) | Elimination.lean:68 | `e τ` with `e : σ → τ` | pinned `e : τ → σ` | notation slip |

- Source locators checked against the text, 24: Sturmfels Lemma 1.1, Prop. 1.3, Thms 1.4, 2.11; Bruns–Conca–Lembo monic remark (line 109–114), Thm 2.2, Prop. 2.4, completion (line 199–210); Bossinger §2.2 and line 70; Eisenbud's lectures Thms 1.1, 1.3, 1.5; Stacks 0BXF (line 1971); Weibel II.8.2, II.8.6; Kogan–Miller Thm 5; Reichstein Thm 1.7 and line 144; Thiéry–Thomassé Thm 1.2; Hashimoto Thm 17 and its setting; Speyer–Sturmfels proof of Thm 3.4, (10), Cor. 4.4; Borovik–Hibi §1.
- Library declarations opened at the pins, 22: Tau Ceti `GTPattern` (GelfandTsetlin/Basic.lean:89), `powSaturation` (NSMulSaturation.lean:45), `nsmulSaturation_inf_closure_eq` (Saturation.lean:140), `IsSAGBIBasis`, `leadingExponents`, `IsSAGBIBasis.mem_span` (SAGBI/Basic.lean:79, :169, :384), the criterion (SAGBI/Criterion.lean:276), `comap_rename` (Elimination.lean:68), NormalForm.lean:202–207, Homogeneous.lean:94, :148, :284, Map.lean:62, :94, :109, :123, :148, Cone.lean:121, :162, `coeffSubalgebra` (CoeffSubalgebra/Basic.lean:76), UnitFiber.lean:107; Mathlib `Matrix.mvPolynomialMinor` and `determinantalIdeal` (DeterminantalIdeal.lean:29, :84), `IsDedekindDomain.flat_iff_torsion_eq_bot` (Flat/TorsionFree.lean:138), `Polynomial.hilbertPoly` (HilbertPoly.lean:117, :173, :221). No pinned declaration proves a `Suggested.lean` headline; the SAGBI directory has no kernel statement.
- Cross-roadmap citations resolved on main, 13: SchemeAndStackFoundations §0.3 (line 792), §2.6 (4357), §5.4 (8122), §5.7 (8375), `relativeProj_veronese` (825), *K0.toG0_bijective* (8403); StableReduction Layer 2 (relative Proj, its line 439) and Layer 4 (529); ClassicalGroups §6.1 (1094), §6.3 (1170) and the 8 patterns (1368); SchurWeyl Conventions (77); AnalyticToricGeometry (Completed) Layer 0 (186). Fourteen roadmaps on main mention this one.
- Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`; no change outside the folder; every automatic check passed and none was set aside.
- Elaboration: `Suggested.lean` elaborates with 11 `sorry` warnings and nothing else. The 26 declarations carry all binders in their own signatures (no `variable` block), and each type agrees with its README statement. One probe per theorem with `rfl`, `simp`, `infer_instance` and `aesop` closes none of the 11.
- Headlines: the overview's four groups are covered by the pin (Buchberger, reduced bases, standard monomials, normality ⇒ saturation, the monic criterion) or stated (11 theorems); the two not statable (normalized volume, `K₀` of coherent sheaves) are named in the module docstring, and the pins have neither carrier.
- Pull request text: 49 sections, 35 Check blocks and 52 Checks, the seven Tau Ceti imports, and the lists of removed, kept and added declarations agree with the head; the description says that it revises a roadmap on main and that the old G4 anchor is gone.
- Ownership: searched main and the open heads for SAGBI bases, Göbel's criterion, weight-initial ideals and the declaration names of `Suggested.lean`; no second owner. The sentence "Other roadmaps cite Layer `k` of this roadmap as `Gk`" (lines 66–67) keeps the `G2` citations of other roadmaps valid.

Overlap check: read TensorProductCombinatorics and ClassicalGroups (closest by vocabulary, open and on main; the results list is empty); TensorProductCombinatorics reuses Layer 2's exponent monoid and owns its own fibre counts (its lines 617–620), ClassicalGroups owns Gelfand–Tsetlin patterns and branching, consumed here; nothing shared. DeformationAndDerivedPatchingAlgebraPartII's general-ring sheafification is the subject of C01.

Source independence: 24 passages compared with 12 sources, none shared beyond theorem names and forced formulas; largest share MillerSturmfels, 9 of 49 locator lines (text not readable); contents compared with the chapter list of MillerSturmfels on its author's page: independent (only §§5.1–5.3 fall in its Chapter 14 and §2.3 in Chapter 7; the order leading terms, straightening, flag SAGBI basis is forced by the *Needs:* lines of §§5.2–5.3).

Research link: Layer 3 states the SAGBI criterion and lifted-relation presentation of Bruns–Conca–Lembo (2025); Layer 5 the flag-minor degeneration of Kogan–Miller (2003) and Göbel's conjecture as proved by Reichstein (2003) and Thiéry–Thomassé (2006); Layer 6 the tree degenerations of Speyer–Sturmfels (2003). Rests on the sources read.

## Not verifiable

- Miller–Sturmfels, *Combinatorial Commutative Algebra* (uncertified): Definition 7.24, Proposition 7.25, §14.3, Theorems 14.6, 14.11, 14.23, Corollaries 14.9, 14.24, Lemma 14.13 and Proposition 14.22 were not read; only the chapter list on the author's page was.
- Eisenbud, *Commutative Algebra*, §15.8 and Theorem 15.17 (uncertified): not read; Bossinger §2.2 cites it for the same statement.
- Cox–Little–O'Shea (uncertified): the chapter and section locators of §§1.1, 1.4 and 1.7 were not read.
- The Mathlib proposals and the Zulip thread under References are design references; not opened.

## Source issues

- **Misprint** in Reichstein at Theorem 1.7, p. 4: the source says the group is `H ⊂ S_n` but writes the invariant ring with exponent `G`; it should be `k[x₁, …, xₙ]^H`; affects nothing.
- **Misprint** in BrunsConcaLembo at §2, p. 4 (before Theorem 2.2): the source says `F^e` is the image of `Y^e` under `ψ`; it should be under `φ`, since `ψ` sends `Y_u` to the initial monomial; affects nothing.

## For the human reviewers

- Not tested: MillerSturmfels has the largest share of the README's locators (9 of 49 locator lines) and its text could not be read legally; the wording was not compared with it, and the arrangement only with the chapter list on its author's page.
