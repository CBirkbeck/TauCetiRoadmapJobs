# Review of GroebnerGeometry (pull request #2587 at ab404d0)

**Verdict:** accepted

**Summary.** Accepted. There are no findings, and the previous round's four findings are repaired. Every headline theorem in `Suggested.lean` is true as stated: I tested each on degenerate cases, and for the flat weight degeneration, the special fibre of the Rees family and the presentation by lifted relations I also checked a proof route. There are four small corrections, none blocking: the list of downstream consumers is incomplete; Convention 1 says normal forms need a field, which §1.2 contradicts; Hashimoto's Theorem 17 covers only `n ≥ 4`; and a pointer in §6.2 names the wrong §2.6. There is also one format note. One question goes to the human reviewers: Miller–Sturmfels, the most-cited source, could not be read, so the wording was not checked against it.

## C01 — The list of downstream consumers leaves out DeformationAndDerivedPatchingAlgebraPartII and assigns Layer 2 to a roadmap that does not use it

DeformationAndDerivedPatchingAlgebraPartII on main takes its graded-module sheafification, graded syzygy and Hilbert/`K₀` comparisons from G4 (its lines 114–118), and its lines 1552–1553 say that G4 owns the polynomial-ring chart and exactness statements. It is missing from the list at lines 1292–1306. Also, the bullet at lines 1298–1300 says that CanonicalModelsAndGonality consumes Layer 2's semigroup counts. CanonicalModelsAndGonality cites only G4. Only AlgebraicModuliForArithmeticGeometry cites G2's counts (its lines 136–137 and 772).

A bullet "DeformationAndDerivedPatchingAlgebraPartII consumes the graded sheafification, syzygies and `K₀` comparison of §§4.9–4.11" would fix the omission. Attaching "Layer 2's semigroup counts" to AlgebraicModuliForArithmeticGeometry alone would fix the misattribution.

## C02 — Convention 1 says normal forms are over a field, but §1.2 and the overview state them over any commutative ring

Convention 1 (lines 79–80) puts "Normal forms, reduced bases, Buchberger completion and SAGBI theory" over a field. §1.2 (lines 177–178) states the normal-form theory for Gröbner bases with unit leading coefficients, and the overview (lines 12–14) says that normal forms work over any commutative ring. The pinned Tau Ceti statements agree with §1.2: `TauCeti/RingTheory/MvPolynomial/Groebner/NormalForm.lean` declares them over a `CommRing`, with the unit-leading-coefficient hypothesis at line 207. The fix is a reworded sentence: "Reduced bases, Buchberger completion and SAGBI theory are over a field `k`; normal forms need only unit leading coefficients."

## C03 — Hashimoto's Theorem 17 covers `n ≥ 4` only, but §5.5 and the Lean docstring cite it for every `n`

Hashimoto's symplectic section assumes `4 ≤ 2t ≤ n` (Hashimoto line 225–226), and Theorem 17 (line 372) is stated in that setting. For `SL₂ = Sp₂`, `t = 2`, so the theorem covers `n ≥ 4`. The statement `equalizer_sl2Coaction_eq_adjoin_minors` is still true for `n ≤ 3`, by the following argument. The coaction preserves each row's degree, so the invariants of `k[M_n]` are the invariants of `k[M_4]` of degree `0` in rows `n, …, 3`. In `k[p_ij : i < j]`, that part is spanned by the monomials in the `p_ij` with `i, j < n`.

Adding "for `n ≥ 4`" to the locator in §5.5 (line 1066) and in the docstring, with one sentence on this reduction, would make the citation cover what is stated.

## C04 — §6.2 points to "§2.6's computation of `H⁰(ℙ¹, O(d))`", which reads as this roadmap's §2.6

Line 1180 says "using §2.6's computation of `H⁰(ℙ¹, O(d))`". In this README, §2.6 is about Proj and the Hilbert functions of semigroup rings, and it computes no sheaf cohomology. The computation is SchemeAndStackFoundations §2.6 ("Quasi-coherent cohomology", its line 4357), as the *Needs:* line of §6.2 and the supplier contract say. Writing "SchemeAndStackFoundations §2.6's computation" removes the ambiguity.

## N01 — In §1.1, "contraction to the variables `e τ`" uses the direction of `e` from §1.7, not §1.1's `e : σ → τ`

Line 156: in §1.1's notation the variables are `e σ` (or "the image of `e`"). Tau Ceti's `MonomialOrder.IsGroebnerBasis.comap_rename` (Elimination.lean:68), cited in §1.7, has `e : τ → σ`.

## Earlier findings

- R01 — repaired: the third bullet of §2.5 now describes the torsion subgroup `T`, the factor `Spec k[T] ≅ ∏ μ_(m_i)` and "`T` need not be cyclic" (lines 485–488). The `ℤ³` Check (lines 498–503) gives `μ₂ × μ₂`.
- R02 — repaired: both headlines are stated, `equalizer_sl2Coaction_eq_adjoin_minors` (line 249, with `sl2Coaction`) and `exists_hilbertPolynomial_pluckerMap_two` (line 279). The module docstring now names only the normalized volume and the `K₀` equality as not statable.
- R03 — repaired: §1.4 now has "a sequence that cannot be extended … ends at a Gröbner basis of `Ideal.span G`" (lines 226–228), and §3.7 has "started from a finite family generating `A`" (line 683).
- R04 — repaired: locators now stand at §2.5 (Sturmfels Prop. 1.3(a), for the first two bullets), §2.7 (Thm 1.4), §3.7 (BCL p. 5), §§4.3–4.4 (Eisenbud §15.8, Thm 15.17; Bossinger §2.2), §§4.9–4.11 (Eisenbud's lectures, Thms 1.1, 1.3, 1.5; Stacks 0BXF; Weibel II.8.2, II.8.6), §5.5 (Hashimoto Thm 17; see C03) and §6.4 (Speyer–Sturmfels, Cor. 4.4; Sturmfels Thm 2.11). Cox–Little–O'Shea is cited by chapter and section, and Kogan–Miller and Thiéry–Thomassé by theorem. Two items still have no locator, the stabilizer bullet of §2.5 and the two actions of §5.7; both are direct computations.
- C01 — partly repaired: McKaySkewGroup, TensorProductCombinatorics and ReductiveGroups are added. DeformationAndDerivedPatchingAlgebraPartII is still missing (C01 above). LieHighestWeight (its line 1343) only contrasts its noncommutative Rees carrier with G4 and is not a consumer, so nothing was owed there.
- C02 — partly repaired: the overview is corrected (lines 12–15), but Convention 1 now contradicts it (C02 above).
- C03 — repaired: the Check of §6.7 names the Weyl module and gives the simple module's dimension `7` in characteristic `3` (lines 1275–1278).
- C04 — repaired: §3.5 states the Lean generality (lines 652–655).
- C05 — not repaired: deferred (D01).
- C06 — repaired: the description now says G1, G2, G4 and G5.
- C07 — repaired: line 194 says "leading monomial … is `y`".
- N01 — repaired: *Chow.K0.toG0_bijective* is in italics (line 930).

## Deferred findings

- D01 — stands

## Questions for the author

- Main had the graded-sheafification API "on projective space" over `κ`. §4.10 now states it on `ℙᴺ_A` with `A` arbitrary (line 894). DeformationAndDerivedPatchingAlgebraPartII (on main, lines 1552–1553) gives G4 the field case and treats the polynomial ring over an arbitrary `A` as an instance of its own general-ring statements. Is the arbitrary-`A` form intended here, and should that roadmap's sentence be updated? The flat-family argument needs at least `A = κ[t]`. I could not tell which form the author intends.
- `flagMinorFamily_isSAGBIBasis`, `exists_leadingExponents_equiv_gtPattern` and `span_leadingTerm_ker_pluckerMap` are stated over every field. These statements are true in every characteristic, because the straightening of §5.2 holds over `ℤ`. Do Miller–Sturmfels Theorems 14.6 and 14.11 prove them at that generality? Kogan–Miller's Theorem 5 is over `ℂ`. I could not read Miller–Sturmfels.

## Verified sound

| Statement | Instances tried | Statement side | Other side (computation, source or library) | Result |
|---|---|---|---|---|
| §1.3 homogeneous ideals (sampled) | `I = (x² − y²)`, standard grading, lex `x > y` | `(R/I)₂` has standard monomials `xy, y²`: dimension 2 | `(R/(x²))₂` dimension 2; Homogeneous.lean:94, :148, :284 at the pin | holds |
| §1.5 comparison by normal forms (sampled) | `s = {xy−1, y²−1}`, `G = {x−y, y²−1}` | `NF(xy−1)`: `y²−1` then `0`; `NF(y²−1) = 0` | same reduced basis `{x−y, y²−1}`; Reduced.lean:172, :230 | holds |
| §2.1 binomial presentation (sampled) | `a = (2, 3)` in `ℕ` | toric ideal `(X₀³ − X₁²)` | both exponents map to `6`; `toricIdeal_eq_span` Basic.lean:151; finite form needs `[Finite ι]` (:250) | holds |
| §2.5 faces, orbits, stabilizers (sampled) | `ℤ³` example; Whitney umbrella | `L_S/gp F = ℤ ⊕ (ℤ/2)²`, index `4`; umbrella `ℤ ⊕ ℤ/2` | Sturmfels Prop 1.3(a), line 99–101, over `ℂ`: first two bullets only | holds |
| §2.6 Hilbert series (sampled) | generators `(1,0),(1,1),(1,2)` | Hilbert function `2n+1` | `∑(2n+1)Tⁿ = (1+T)/(1−T)²`; HilbertFunction.lean:150, :177 | holds |
| §2.7 degree as volume (sampled) | `(1,0),(1,2)`; cubic scroll | length `1` in `2ℤ`: degree `1` (ambient gives `2`); area `3/2`, degree `3` | Sturmfels Thm 1.4, line 104–108, lattice affinely generated; line 111–112 gives `Vol = 3` | holds |
| §3.2 monic normalization (sampled) | `b = (x, x+y, 2x+y)`, lex `x > y` | `c = (x, x+y, x+y/2)`; relations give `−y/2`, `y/2` | only constants lie below `(1,0)`, so no bounded subduction; BCL line 109–114 | holds |
| §3.5 `ker_aeval_eq_span_sub_of_lifts` (sampled) | `c = (x, 1)`; `ι = ∅`; a binomial with `u_j = v_j` | kernel `(Y₂ − 1)`; `ι = ∅`: `⊥`; `F_j = −Q_j ∈ ker` | top `A`-block lies in `ker ψ₁`, so the induction lowers the exponent; BCL Thm 2.2, line 156–160; countable families, line 109 | holds |
| §3.6 nonmonic families (sampled) | `b = (2x, x² + x)`, lex | `ℓ = (2, 1)`, `c = (x, x² + x)` | `φ_b(Y₁) = 2x = φ_c(D_ℓ Y₁)`; `ψ_b(Y₁) = 2x = ψ₁(2Y₁)` | holds |
| §4.4 `weightDegeneration_flat_and_fibres` (sampled) | `I = (x² − y)`, `w = (1,1)`; `I = (x − y², y)`; `f = 0` | `k[t][x,y]/(x² − ty)` free, basis `yᵇ, xyᵇ`; second ideal gives `J = (x, y)` | `J = θ⁻¹(I[t,t⁻¹]) ∩ k[t][x]`, `θ(xᵢ) = t^(wᵢ)xᵢ`: torsion-free over a PID; Bossinger line 165–171 | holds |
| §4.6 standard-graded route (sampled) | `xz − t y²` in `ℙ²_(k[t])` | fibre at `t = 0`: `(xz)`, Hilbert function `2m + 1` | fibre at `t = 1`: conic, `2m + 1`; SchemeAndStackFoundations §0.3 at its line 792 | holds |
| §4.9 syzygies and series (sampled) | conic `S/(q)` | `0 → S(−2) → S`, numerator `1 − T²` | Eisenbud Thms 1.1 (line 119), 1.3 (line 193); numerator in proof, lines 216–236 | holds |
| §5.3 flag minors (sampled) | `n = 2` | `z₀₀^(a+c) z₁₀^b z₁₁^c` distinct | pattern `a+b+c ≥ a+c ≥ c ≥ 0`, bijective; KM Thm 5, line 310–313, over `ℂ` | holds |
| §5.6 permutation invariants (sampled) | `A₃`, lex `x>y>z`; `⟨(0 1)⟩ ≤ S₃` | `(e₁e₂ − Δ)/2 = x²z + xy² + yz² + (3/2)xyz`, exponent `(2,0,1)` | outside the monoid where `y`-exponent ≥ `z`-exponent; Reichstein Thm 1.7, lines 161–164, any order and field (line 144) | holds |
| §6.1 cusp (sampled) | `(3,0),(0,3),(2,1)` | `x²y = (6,3) = z³`; `(z²/x)³ = (3,6) = xy²` | `L_S` of index `3`; face `(3,0)`: `L_S/gp F ≅ ℤ` by `b` | holds |
| `isIntegrallyClosed_addMonoidAlgebra_of_saturated` | `S = 2ℕ, ⟨2,3⟩, ⊥` in `ℤ` | `2ℕ`: hypothesis holds, `k[t²]` normal; `⊥`: `k` | `⟨2,3⟩`: `sat ⊓ L_S = ℕ ≠ S`, hypothesis fails | holds |
| `weightReesFamily_specialFibre` | `w = 0`; `A = k` | `w = 0`: `B = A[t]`, kernel `tB`, image `A` | `B = θ⁻¹(A[t,t⁻¹]) ∩ k[t][x]` is `t`-saturated, so kernel is `tB` | holds |
| `flagMinor_leadingTerm` | rows `(0,1)`, `(1,0)`; `d = 0` | `(0,1)`: `z₀₀z₁₁`, coefficient `1`; `d = 0`: `1` | `(1,0)`: `−z₀₀z₁₁`, so `StrictMono` is needed | holds |
| `flagMinorFamily_isSAGBIBasis` | `n = 0, 2`; any field | `n = 0`: `∅` is a SAGBI basis of `k` | standard monomials span over `ℤ` with distinct leading monomials, so it holds in every characteristic | holds |
| `exists_leadingExponents_equiv_gtPattern` | `n = 1, 2`; interlacing | `n = 1`: `a ↦ P(0,1) = a` | diagonals have row ≥ column, so cells `c ≥ j` vanish; `∑_(r≤j) x(r,c+1) ≤ ∑_(r<j) x(r,c)` | holds |
| `span_leadingTerm_ker_pluckerMap` | `n=4, d=2`; `d = 1`; `d ≥ n` | `P₀₃P₁₂` leads for `degRevLex` (DegRevLex.lean:203); pair incomparable | `d = 1`, `d ≥ n`: kernel `⊥`, no incomparable pairs; Borovik–Hibi line 107–110 | holds |
| `equalizer_sl2Coaction_eq_adjoin_minors` | `n = 0, 1, 2`; `𝔽₂`, `n = 1` | `n ≤ 1`: `k`; `n = 2`: `k[det]` | `a²+ab+b²` fixed by `SL₂(𝔽₂)`, not by the coaction; Hashimoto needs `n ≥ 4` (C03) | holds |
| `exists_finite_isSAGBIBasis_permInvariants_iff` | `A₃`; `⟨(0 1)⟩ ≤ S₃`; `n = 0` | `A₃`: closure of no transpositions is `⊥ ≠ A₃` | `A₃` has no finite basis; `⟨(0 1)⟩`: both sides true; `n = 0`: both true | holds |
| `exists_hilbertPolynomial_pluckerMap_two` | `n = 2, 3, 4, 5` | `P = 1`; `C(m+2,2)`; leading coefficients `2/4!`, `5/6!` | `catalan 0,1,2,3 = 1,1,2,5` over `(2n−4)!`; Speyer–Sturmfels line 431–432 | holds |
| Pinned Buchberger and reduced bases | Buchberger.lean:295; Reduced.lean:230 | `0` is a remainder of each S-polynomial, unit leading coefficients | §1.4 Check: `x − y` nonzero, then `{x − y, y² − 1}` | holds |
| §1.9 Checks | `x² − y`, `w = (1,1),(1,3),(1,2)`; `I = (x − y², y)` | `x²`, `−y`, `x² − y` | `in_w(I) = (x, y) ≠ (y)` | holds |
| §6.5 Checks | splits `12|34`, `13|24` | homogenization adds `t²P₁₂P₃₄`; `13|24` initial form `P₁₂P₃₄ + P₁₄P₂₃` | order `1,3,2,4` gives only `ε₂₃ = −1`; SS (10), line 410–415 assumes order `1, …, n` | holds |
| §6.7 Checks | `af − be + cd` | diagonals `z₀₀z₁₀z₂₁` twice; `z₀₀z₁₁z₂₀` smaller | `uv` coefficient `9 − 1 = 8`; `L(2,1,0)` has dimension `7` in characteristic `3` | holds |
| §4.8 Check | `ℙ(1,2)` | `O_B(1)` generated by `s` on both charts: trivial | `O_B(2)` has sections `s², u`: it is `O(1)` | holds |
| §1.7 Check | `(tx, (1−t)y)`, lex `t > x > y` | S-polynomial `xy` | reduced basis `{tx, ty − y, xy}`; `(x) ∩ (y) = (xy)` | holds |
| Convention 1 (C02) | NormalForm.lean:132, :207 | normal forms over a `CommRing`, unit leading coefficients | Convention 1 says "over a field" | inconsistent |
| §5.5 locator (C03) | Hashimoto line 225–226 | `4 ≤ 2t ≤ n`, `t = 2` gives `n ≥ 4` | `n ≤ 3` follows from the row-degree-0 part of `n = 4` | locator narrower |
| Downstream list (C01) | DDPA Part II lines 118, 1553 | cites G4 sheafification, syzygy, `K₀` | absent from lines 1292–1306 | out of date |
| §6.2 pointer (C04) | SAS §2.6, line 4357 | this §2.6 is Proj and Hilbert functions | `H⁰(ℙ¹, O(d))` is SAS §2.6 | ambiguous |
| §1.1 notation (N01) | Elimination.lean:68 | `e : τ → σ` in §1.7 | §1.1 has `e : σ → τ` | notation slip |

- **Source locators checked against the text (about 25):** Sturmfels Lemma 1.1, Prop. 1.3, Thms 1.4 and 2.11; Bruns–Conca–Lembo p. 3 monic remark, Thm 2.2, Prop. 2.4 and the p. 5 completion; Bossinger §2.2 and its standing field (line 70); Eisenbud's lectures, Thms 1.1, 1.3, 1.5; Kogan–Miller Thm 5; Reichstein Thm 1.7; Thiéry–Thomassé Thm 1.2; Hashimoto Thm 17 with its §5 setting; Speyer–Sturmfels proofs of Thm 3.4 and Cor. 4.4, identity (10); Weibel II.8.2, II.8.6; Stacks 0BXF; Borovik–Hibi §1.
- **Miller–Sturmfels:** its table of contents was read from the author's page; §14.3 is "Minors form sagbi bases", consistent with §4.5's locator.
- **Library declarations opened at the pins:**
  - Tau Ceti: `TauCeti.GTPattern` (GelfandTsetlin/Basic.lean:89); `toricIdeal`, `toricIdeal_eq_span`, `exists_finset_toricIdeal_eq_span` (ToricIdeal/Basic.lean:124, :151, :250); `leadingExponents` (SAGBI/Basic.lean:169); `nsmulSaturation` via `powSaturation` (NSMulSaturation.lean:45); `degRevLex` (DegRevLex.lean:203, :224); `GeneralLinear.genericMatrix` (HopfAlgebra.lean:464); `SpecialLinear.coordinateMap` (SpecialLinear/Basic.lean:127); Buchberger.lean:295; Reduced.lean:172, :230; NormalForm.lean:132; Homogeneous.lean:94, :148, :284; Cone.lean:121; Elimination.lean:68.
  - Mathlib: `FixedPoints.subalgebra` exists, but there is no permutation action on `MvPolynomial` at the pin, so `permInvariants` is needed.
  - No pinned declaration proves a `Suggested.lean` headline.
- **Cross-roadmap citations resolved on main:**
  - SchemeAndStackFoundations §§0.3, 2.6, 5.4, 5.7, `relativeProj_veronese` and *Chow.K0.toG0_bijective*; StableReduction Layers 2 and 4; ClassicalGroups §§6.1, 6.3 and the Layer 6 Examples (8 patterns); SchurWeyl Conventions; AnalyticToricGeometry (Completed) Layer 0.
  - Downstream sections: SchubertGeometry Layer 6, DeformationAndDerivedPatchingAlgebra Layer 1, ResolutionOfSingularitiesCharacteristicZero §1.10, McKaySkewGroup §7.2, TensorProductCombinatorics §1.5, ReductiveGroups §10D.
  - 14 roadmaps on main mention this one.
- **Automatic checks:** every check passed, and none was set aside. Dependency check output: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`. All suppliers are on main, and none is on the never-cite list.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings only. I elaborated `#check @` for all 26 declarations together and compared each type with its README statement: no binder is lost, and nothing changed. 55 one-tactic probes (`simp`, `rfl`, `infer_instance`, `decide`, `aesop` on each of the 11 theorems) close none.
- **Ownership against open pull requests:** I searched the open heads and main for SAGBI, Göbel, the first fundamental theorem, Gröbner and weight degenerations, the Catalan degree and flag minors. There is no second owner. SchurWeyl §9.3's first fundamental theorem concerns invariant tensors over infinite fields, a different object. The overlap tool lists "§G2" as dropped while MixedHodgeModulesAndIrregularHodgeTheory (open) cites it; that is covered by the README's sentence that Layer `k` is cited as `Gk` (line 66–67). The same open roadmap declares a gap on this roadmap (Hochster's Cohen–Macaulay theorem), which is for the intake.

Overlap check: read TensorProductCombinatorics and ClassicalGroups, the closest roadmaps by vocabulary both open and on main; no roadmap is on the results list. TensorProductCombinatorics consumes Layer 2's exponent monoid and saturation comparisons and owns its own fibre counts (its lines 617–620). ClassicalGroups owns Gelfand–Tsetlin patterns and branching (Layer 6), which this roadmap consumes. DeformationAndDerivedPatchingAlgebraPartII states sheafification over every `ℕ`-graded ring and leaves the polynomial case to this roadmap, which is the earlier one. Nothing is owned by both.

Source independence: 15 passages compared with 12 sources, plus a six-word n-gram scan of the README and `Suggested.lean` against all 12 cached texts. The shared runs are titles and the forced wording of Göbel's statement; none is copied. Largest share: MillerSturmfels, 9 of 48 body locators (text not readable). Contents compared with the MillerSturmfels table of contents (author's page): independent. Only §§5.1–5.4 track §§14.1–14.4, and the dependency lines (diagonal leading terms, then straightening, then the flag SAGBI basis and patterns) force that order. Layers 1, 3, 4 and 6 and §§5.5–5.7 have no counterpart.

Research link: Layer 3's lifted-relation presentation is Bruns–Conca–Lembo's SAGBI criterion (2025, Thm 2.2) for defining ideals of algebras of minors. Layer 5 states Kogan–Miller's flag toric degeneration (2003, Thm 5) and Göbel's conjecture (Reichstein 2003, Thm 1.7; Thiéry–Thomassé 2006, Thm 1.2). Layer 6 states Speyer–Sturmfels' tree degenerations (2003). This rests on the sources read.

## Not verifiable

- Miller–Sturmfels, *Combinatorial Commutative Algebra* (uncertified, paywalled): Definition 7.24, Proposition 7.25, Theorems 14.6, 14.11, 14.23, Corollaries 14.9, 14.24, Lemma 14.13, Proposition 14.22 and §14.3 were not read; only the author's table of contents was.
- Eisenbud, *Commutative Algebra*, §15.8 and Theorem 15.17 (uncertified): not read. Bossinger §2.2 cites it for the same statement.
- Cox–Little–O'Shea (uncertified): the chapter and section locators of §§1.1, 1.4, 1.7 were not read.
- The Mathlib pull requests and the Zulip thread are design references for library predicates; I did not open them.

## Source issues

- **Misprint** in Reichstein at Theorem 1.7, p. 4: the source says the group is `H ⊂ S_n` but writes the invariant ring as `k[x₁, …, xₙ]^G`; it should be `k[x₁, …, xₙ]^H`; affects nothing.
- **Misprint** in Bruns–Conca–Lembo at §2, p. 4 (before Theorem 2.2): the source says `F^e = ψ(Y^e) = ∏ f_u^(e_u)`; it should be `φ(Y^e)`, since `ψ` sends `Y_u` to the initial monomial; affects nothing.

## For the human reviewers

- Not tested: Miller–Sturmfels has the largest share of the README's locators (9 of 48), and its text could not be read legally. The wording check was not done against it. The arrangement was compared using the author's public table of contents.
