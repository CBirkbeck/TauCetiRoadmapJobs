# Review of ImaginaryQuadraticClassNumber (pull request #2201 at aabc576)

**Verdict:** needs changes

## R01 (P3) — H3.1 restates the pinned Weierstrass curve of a lattice

**Location:** `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md` line 107: "Prove the nonsingular discriminant and use the native WeierstrassCurve C with a1=a2=a3=0, a4=−g2/4 and a6=−g3/4, and define the projective extension piecewise … then compare it to the normalized modular-function j."

**Claim:** The curve, its discriminant and nonvanishing, its j-invariant, the comparison with the modular j, the point map and its chart holomorphy are targets here.

**Witness:** `TauCeti/Analysis/SpecialFunctions/Elliptic/Uniformization.lean`: `PeriodPair.weierstrassCurve` (149), `weierstrassCurve_Δ` (167), `weierstrassCurve_Δ_ne_zero` (203), `weierstrassCurve_j` (214), `UpperHalfPlane.weierstrassCurve_j_periodPair` (227), `PeriodPair.weierstrassPoint` (260), `exists_analyticAt_toAffine_eq_weierstrassPoint` (438), `weierstrassPoint_surjective` (538).

**Repair:** Add an H3.1 bullet to "Already in the pinned Mathlib and Tau Ceti" with these names. Replace the quoted sentences by: "The curve y²=x³−(g2/4)x−g3/4 of a period lattice, its discriminant g2³−27g3²≠0, its j-invariant and the equality with the modular j for Zτ+Z, and the point map z↦(℘(z),℘′(z)/2) with its periodicity, oddness, holomorphic projective lifts, injectivity near lattice points and surjectivity are the pinned declarations listed in the scope section. What remains here is injectivity modulo the lattice, additivity, and the holomorphic group isomorphism C/Λ→E(C) with its inverse." Keep the converse construction as it is.

## R02 (P3) — H3.1 says the rational descent F₁=ℚ(j) is still required; the pin proves it

**Location:** README line 105: "Prove the arithmetic-coefficient level1 identity F_1=Q(j): the complex analytic sphere comparison already exists, while the rational q-coefficient descent is still required here."

**Claim:** F₁=ℚ(j) and the coefficient subfield of the function field are targets here.

**Witness:** `TauCeti.ModularGroup.coeffSubfield_cuspDatumInfty_bot` (`TauCeti/NumberTheory/ModularForms/LevelOne/FunctionField.lean:259`): `coeffSubfield cuspDatumInfty ⊥ = Subfield.closure {jMeromorphicFunction}`. The carrier is `Subgroup.CompactifiedQuotient.coeffSubfield` (`TauCeti/NumberTheory/ModularForms/QExpansion/FunctionField.lean:209`), a `Subfield` for every group, cusp datum and subfield of ℂ.

**Repair:** Replace the sentence by: "The level-one identity F_1=Q(j) is the pinned `TauCeti.ModularGroup.coeffSubfield_cuspDatumInfty_bot`, and the subfield of meromorphic functions with q-coefficients in a subfield of ℂ is the pinned `Subgroup.CompactifiedQuotient.coeffSubfield`; define F_N as its instance at Γ(N), the cusp ∞ and Q(ζ_N)." Delete "Construct the arithmetic coefficient field inside its meromorphic function field by q-expansions; prove field closure". List both names in the scope section.

## R03 (P3) — H1.2's remaining target h(ℚ(√−5))=2 is pinned

**Location:** README line 47: "What remains here is its comparison with the squarefree model of Q(√−5): −20=2²·(−5), so Mathlib `QuadraticAlgebra.nonempty_algEquiv_iff` gives a Q-isomorphism and Tau Ceti `RingEquiv.classNumber_eq` gives h(Q(√−5))=2."

**Claim:** h(ℚ(√−5))=2 remains to be proved here.

**Witness:** `TauCeti.NumberField.classNumber_eq_two_of_minpoly_eq_X_sq_add_five` (`TauCeti/NumberTheory/Multiquadratic/MinusFive/ClassNumber.lean:201`): `minpoly ℤ θ = X ^ 2 - C (-5)` and `Algebra.adjoin ℚ {θ} = ⊤` give `NumberField.classNumber K = 2`, for every presentation.

**Repair:** Replace the quoted sentence by: "Every field presented by an integral generator with minimal polynomial X²+5 has class number 2 (`TauCeti.NumberField.classNumber_eq_two_of_minpoly_eq_X_sq_add_five`), which agrees with the model of parameter −20 since −20=2²·(−5)." Add the name to the H1.2 scope bullet.

## R04 (P3) — H2.2's export of the formula at w=6, 4, 2 is pinned

**Location:** README line 81: "What remains here is the real form of the formula: … export L(1,χ_D)=2πh(D)/(w_D sqrt|D|) with w=6,4 at D=−3,−4 and w=2 otherwise".

**Claim:** The three unit-order specializations of the class-number formula remain to be proved here.

**Witness:** `TauCeti/NumberTheory/NumberField/Quadratic/DedekindZeta.lean`: `classNumber_eq_LFunction_one_of_discr_eq_neg_three` (262, h=3√3·L(1)/π), `classNumber_eq_LFunction_one_of_discr_eq_neg_four` (275, h=4L(1)/π), `classNumber_eq_LFunction_one_of_discr_ne` (288, h=√|D|·L(1)/π), all in the namespace `TauCeti.NumberField`.

**Repair:** Add the three names to the H2.2 scope bullet. Replace "and export L(1,χ_D)=2πh(D)/(w_D sqrt|D|) with w=6,4 at D=−3,−4 and w=2 otherwise, so that" by "the specializations at w=6, 4 and 2 being the pinned `classNumber_eq_LFunction_one_of_discr_eq_neg_three`, `classNumber_eq_LFunction_one_of_discr_eq_neg_four` and `classNumber_eq_LFunction_one_of_discr_ne`; with the positivity,". The real-valued form and h(D)≥sqrt|D|·L(1,χ_D)/π stay as the target.

## R05 (P3) — H1.3's point τ of a form and its SL₂(ℤ)-naturality are pinned

**Location:** README line 57: "τ=(−b+sqrtΔ)/(2a) in the upper half-plane. Carry orientation and complex-embedding choices explicitly, and prove the naturality of this lattice and of τ under changes of oriented basis".

**Claim:** The point τ of a form and its equivariance under the proper SL₂(ℤ)-action remain to be built here.

**Witness:** `TauCeti.BinaryQuadraticForm.root` (`TauCeti/NumberTheory/BinaryQuadraticForm/Root.lean:65`, the point (−b+i√D)/(2a) of ℍ) and `root_smul` (line 99): `root (γ • f) = γ • root f`, with `γ • f = f ∘ γ⁻¹`.

**Repair:** Add `TauCeti.BinaryQuadraticForm.root`, `root_smul` and `root_injective` to the H1.3 scope bullet. Replace the last sentence of line 57 by: "The point τ is the pinned `TauCeti.BinaryQuadraticForm.root`, equivariant for the SL2(Z)-actions by `root_smul`. What remains is the homothety of the ideal of the form with Z+Z·τ under the chosen embedding, and its compatibility with `root_smul`."

## Verified sound

| # | statement | instances | values computed | result |
|---|---|---|---|---|
| 1 | `quadratic_LFunction_siegel` | q=1, 2; χ₋₃, χ₋₄, χ₋₁₆₃ at ε=0.1 | no nonprincipal χ at q≤2; L(1)=0.6046, 0.7854, 0.2461; c≤0.675, 0.902, 0.410 | consistent |
| 2 | `imaginary_classNumber_lower_bound` | D=−3, −4, −163 at ε=0.1 | h/\|D\|^0.4 = 0.644, 0.574, 0.130 | consistent; c≤0.130 |
| 3 | `imaginary_discr_bounded_of_classNumber_le` | B=0, 1 | B=0 vacuous (h≥1); B=1 forces C≥163 | true |
| 4 | `classNumber_eq_one_iff_discr_mem` | all fundamental D, \|D\|≤2000, by reduced-form count; D=−20, −23 | h=1 exactly at −3, −4, −7, −8, −11, −19, −43, −67, −163; h=2, 3 | matches `heegnerDiscriminants` |
| 5 | `classNumber_eq_one_iff_negative_squarefree_mem` | d=−1, −2, −5, −4 | D=−4, −8 (h=1; 1, 2 ∈ `heegnerNumbers`); D=−20, h=2; −4 excluded by `Squarefree` | consistent |
| 6 | `pic_eq_one_iff_discr_mem` | every order discriminant Δ≡0,1 mod 4, \|Δ\|≤2000; Δ=−44, −32, −36, −75, −63 | primitive reduced count 1 exactly at the 13 listed values; 3, 2, 2, 2, 4 | the 13 values exact |
| 7 | Pinned class-number formula (H2.2, sampled) | D=−3, −4, −7, −8, −20, −23, −163 | w√\|D\|L(1)/(2π) = 1, 1, 1, 1, 2, 3, 1 against form counts 1, 1, 1, 1, 2, 3, 1 | agree |
| 8 | H2.3 bound ‖L(1,χ)‖≤1+log n and class-number form | χ₋₃, χ₋₄, χ₋₂₃; D=−3, −4, −7, −23 | 0.6046≤2.099; 0.7854≤2.386; 1.9652≤4.135; bounds 3.471, 3.038, 2.481, 6.313 against h=1, 1, 1, 3 | true; w/2 kept at −3, −4 |
| 9 | H3.4 numerical bounds | A=e^(−π√31); A=e^(−π√51) | 0.4656 (g0), 2.0733 (g_(1/2,b)), 0.9653 (product); level three 0.9309 | match lines 146, 182 |
| 10 | H3.5 quartic and the Check of line 183 | \|u\|≤5000; X³+2X²+4X+2 | solutions u=−1, 0, 1, 2 with y=0, 0, ±2, ±6; power sums p4=0, p8=−192, so the cubic is X³+96X−16 | matches the pinned iff |
| 11 | Shin locators (lines 140, 216) | Theorem 4.6, (19), (20); Theorem 4.8; Lemma 5.1; Theorem 5.2; Table 1 | shin2010 lines 849–917 (pp. 13–14), 957, 1121 (p. 17), 1159–1196 (p. 18), 1118; τ_K at lines 185–192 | branches and τ_D agree |
| 12 | R01: Weierstrass curve | `weierstrassCurve` fields; `weierstrassCurve_j` | a₄=−g₂/4, a₆=−g₃/4; j=1728g₂³/(g₂³−27g₃²); `weierstrassCurve_j_periodPair` equals `TauCeti.ModularForm.j τ` | pinned |
| 13 | R02: F₁=ℚ(j) | `coeffSubfield_cuspDatumInfty_bot` | coefficient subfield at ⊥ equals `Subfield.closure {jMeromorphicFunction}` | pinned |
| 14 | R03: h(ℚ(√−5)) | reduced forms of discriminant −20 | (1,0,5), (2,2,3): count 2 = pinned value | pinned |
| 15 | R04: w-specializations | D=−3, −4, −7 | 3√3·0.6046/π=1; 4·0.7854/π=1; √7·1.1874/π=1 | pinned |
| 16 | R05: root of a form | (1,0,1), (1,1,1), (2,2,3) | τ=i, (−1+i√3)/2, (−1+i√5)/2, all in ℍ | pinned |

- Pinned declarations: 162 `#check` lines for every library name the README backticks elaborated at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d); the statements read against lines 9–31 agree. Mathlib/Tau Ceti attributions checked by file.
- Source locators checked against the text: 7 (shin2010, row 11).
- Cross-roadmap citations resolved: GlobalNumberFields Layer 11 (Completed, line 571), ClassFieldTheory Layers 10–13 (lines 1638–1924), ModularForms Layer 11 (line 1459), AnalyticNumberTheoryPartI §0.9 and §0.34 (lines 288, 883), EffectiveClassNumbers §§4.8–4.9 (open head, lines 1007, 1023); the 19 listed consumers each cite the sections the list names; EllipticCurveModularityPartII cites H3.6.
- Gate re-run on aabc576: every counter 0, `OK`. Dependency check: `depcheck: 206 roadmaps, 1909 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line.
- Elaboration: six `declaration uses sorry` warnings (lines 34, 44, 54, 68, 78, 90), nothing else. Signatures compared with the README: no lost binder; the seventh "declaration" `number` in the worker's list is a docstring word.
- Padding probe: none of the six theorems closes with `simp`, `rfl` or `infer_instance`. No pinned declaration states any of them (`classNumber_eq_one_iff_of_neg_fifty_one_lt_discr` covers only −51<D).
- Pull request text: the diff is the one deleted consumer line; no file outside the folder changes; EllipticModularityEffectiveComparisons is not among the open roadmap pull requests. Overlaps: none listed.
- Previous review (PRREVIEW-ImaginaryQuadraticClassNumber~4): no findings to re-check.

## Not verifiable

- H. Davenport, *Multiplicative Number Theory*, Chapters 6 and 21: settled as uncertified (davenport1980); not read.
- H. M. Stark (1967, 1969): settled as uncertified (stark1969); not read.
- D. A. Cox, *Primes of the Form x²+ny²*, Theorems 7.7 and 7.24, §12: no manifest entry and no text in the cache; not read.
- That pull request #1810 is closed as a duplicate (the description's statement): GitHub state was not queried; only its absence from the open list was checked.

## Source issues

- none
