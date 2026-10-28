<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/993#issuecomment-6392435096 -->
Review (claude) of be5ed67

Verdict: needs changes

1. **F01** (P2) Four input lemmas are stated in Suggested.lean as headlines

   **Location.** `packages/CMRankZeroConverse/Suggested.lean` contains four input lemmas:

   - `cm_analyticOrder_double`, lines 55–65;
   - `cubeSumModel` and `cubeSum_fullCM`, lines 144–158;
   - `descendingTwist_twoCosets`, lines 174–188;
   - `descendingTwists_count_sqrt`, lines 192–199.

   README line 15 itself says: "The cube-sum full-CM theorem verifies the geometric input to the advertised cube-sum application; the two-coset theorem is the geometric input to the advertised non-descending proportion."

   **Claim.** The README and the docstring call these four statements headline theorems.

   **Witness.** §4.4 is a step in BT's proof of Theorem 1.1 (BT lines 260–261). §6.3 checks the hypotheses in Remark 3.6(i) (BT lines 277–278). §§6.4–6.5 feed §6.6. The consumer RankZeroOneBSDPartII imports C.0 and C.3–C.6, none of these four.

   **Repair.**

   - In `Suggested.lean`, delete `cm_analyticOrder_double`, `cubeSumModel`, `cubeSum_fullCM`, `descendingTwist_twoCosets`, `descendingTwists_count_sqrt` and the Layer 4 section comment. Keep `descendsToRat`, which the §6.6 headline needs.
   - In the module docstring, list as not statable only the end theorems and what each lacks:
     - §§3.2–3.3: the Bloch–Kato Selmer carrier and the zeta morphism;
     - §§4.2 and 4.5: the classical p∞ Selmer corank.
   - Drop §§1.2–1.4, 2.3, 3.1 and 4.3 from that list: they are not headlines.
   - In the README:
     - Line 15 lists only the five density and proportion headlines.
     - In §§4.4, 6.2, 6.3 and 6.5, drop the word "headline" and the backticks on the deleted names, and keep the targets.
     - At §6.4 line 566, point "used in the headline" to `cmTwists_nondescending_nonvanishing_lowerHalf`.
   - Tested: a scratch copy with exactly these deletions elaborates under `lake env lean`. It has five theorems and four definitions, and its only warnings are five "declaration uses `sorry`".

2. **F02** (P2) The Summary cites a base roadmap, RankZeroOneBSD, that exists nowhere

   **Location.** `packages/CMRankZeroConverse/README.md` line 3: "This is the CM converse Part II of rank-zero and rank-one Birch–Swinnerton-Dyer theory. The base direction, RankZeroOneBSD, stops at analytic-rank-at-most-one forward theorems".

   **Claim.** This roadmap is a Part II of an existing roadmap, RankZeroOneBSD.

   **Witness.** RankZeroOneBSD is absent from every place a roadmap can live:

   - the content repository's `TauCetiRoadmap/` and `Completed/` folders;
   - the index of the 350 open roadmap pull requests;
   - the board's main `packages/`, which hold only `RankZeroOneBSDPartII` (a design);
   - `ORDER.txt`.

   It occurs only as a name in other roadmaps' prose.

   **Repair.**

   - Delete the "Part II" framing and the RankZeroOneBSD sentence.
   - If a pointer to the forward theorems is wanted, name their existing owners, which are earlier in the merge order and not consumed here: HeegnerPointEulerSystems (Kolyvagin descent) and GrossZagierAndArithmeticHeights (the Gross–Zagier formula).
   - After the edit, the README cites no roadmap that the `roadmaps list` index, the content repository's main branch or the board's main branch lacks.

3. **F03** (P2) gap:cm-rational-kato-equality asks for a theorem its supplier already plans

   **Location.** README lines 97–99: "Use §CZ.4 …, §CZ.5 … and §CZ.6 for the all-prime rational Kato equality and its normalization dictionary." The next paragraph asks the same supplier, as gap `cm-rational-kato-equality`, to export the §CZ.6 equality. The same gap is in `design/plan.json`.

   **Claim.** The equality is a missing supplier deliverable.

   **Witness.** `packages/ModularIwasawaMainConjecturesPartII/design/README.md` line 184 (§CZ.6) states this endpoint for every CM newform with k≥2 and every λ|p over Λ[1/p]. Its targets are `cm-kato-main-conjecture` and `cm-kato-normalization-dictionary`. §CZ.5 plans `cm-contained-descent`.

   **Repair.**

   - Delete the gap from README line 99 and from `plan.json`.
   - In the supplier subsection and in the §3.3 *Needs*, cite the planned targets directly:
     - ModularIwasawaMainConjecturesPartII §CZ.6 `cm-kato-main-conjecture` and `cm-kato-normalization-dictionary`;
     - §CZ.5 `cm-contained-descent` and `cm-h2-torsion`;
     - §CZ.4 `rational-equivariant-main-conjecture`.
   - Rerunning the dependency check gives no UPWARD line: that roadmap is at line 215 of the merge order, this one at 281.

4. **F04** (P2) gap:newform-central-analytic-interface cites an object ModularForms Layer 7 does not have

   **Location.** README line 51 and the same `plan.json` gap: the gap ends "…on all of ℂ, with the actual bad-prime factor when p divides the level, compatibly with the theta-series L-function of Layer 7."

   **Claim.** ModularForms Layer 7 has a theta-series L-function to be compatible with.

   **Witness.** `TauCetiRoadmap/ModularForms/README.md` lines 708–763 (Layer 7, on main) cover the L-series, the Euler product, the completed L-function, analytic rank and conductor. "theta" does not occur in the file. Theta newforms belong to gap:theta-induction-arbitrary-cm-curve.

   **Repair.**

   - Delete "compatibly with the theta-series L-function of Layer 7" from both copies.
   - What remains is the coefficient-conjugation value identity and the removed-Euler-factor identity, both of which ModularForms Layer 7 can state.

5. **F05** (P2) gap:pointed-cubic-model-comparison is assigned to a supplier that has no plane-cubic carrier

   **Location.** README line 65 and `plan.json` gap `pointed-cubic-model-comparison` (supplier EllipticCurves, section Layer 1). The gap asks for "an invertible projective linear map sending a smooth plane cubic with a marked rational point onto a Weierstrass cubic … restricts to a pointed isomorphism of smooth projective curves".

   **Claim.** EllipticCurves Layer 1 can state this.

   **Witness.** `TauCetiRoadmap/EllipticCurves/README.md` works only with Weierstrass equations. Its Layer 1 (line 423) covers isogenies, duals, differentials and formal groups, and no section treats plane cubics. `TauCetiRoadmap/AlgebraicCurves/README.md` Layer 10 (lines 918–983) owns smooth plane curves and elliptic function fields.

   **Repair.**

   - Repoint the gap, in both copies, to AlgebraicCurves Layer 10.
   - Phrase it on that roadmap's carriers: the function field of the integral projective plane cubic, and its degree-one place at the marked point.
   - Alternatively, delete the gap and own the comparison here on those carriers, as Scope line 7 already claims for the explicit cube-sum comparison.

6. **F06** (P3) Layer 3 Dependencies still name the pre-repair suppliers

   **Location.** README line 363: "KatoEulerSystems supplies reciprocity and the CM equality contract, while ModularForms supplies the actual analytic functions and coefficient conjugation."

   **Witness.** After the round-1 repairs:

   - The equality comes from ModularIwasawaMainConjecturesPartII §§CZ.4–CZ.6 (line 97).
   - The analytic function and the conjugate form are pinned: `ModularForm.L` and `CuspForm.conj` (lines 35 and 47).
   - ModularForms supplies only gap:newform-central-analytic-interface.

   **Repair.** Rewrite the sentence along these lines: "KatoEulerSystems supplies the zeta morphism and reciprocity, ModularIwasawaMainConjecturesPartII §CZ.6 the CM equality, pinned Mathlib and Tau Ceti the newform L-function and conjugate form, and ModularForms the central conjugation and removed-factor identities."

7. **F07** (P3) §5.2 has two Checks blocks

   **Location.** README lines 459 and 465: two separate `**Checks.**` headings in §5.2.

   **Witness.** Both lines open a Checks block inside the same subsection, which has a single model API.

   **Repair.** Merge them into one list. Put the model checks for `congruentTwist` first, then the Smith-product and residue-count checks.

8. **F08** (P3) gap:cube-sum-full-cm names the wrong supplier sections and overlaps §1.1

   **Location.** README line 109 and the `plan.json` gap `cube-sum-full-cm` (section "1.2 and 4.2").

   **Witness.** In ComplexMultiplicationAndExplicitReciprocity (open-PR head), both relevant targets are in §1.1, not §§1.2 or 4.2:

   - `idealLatticeCurve.endomorphismRing` gives End_ℂ(E_I)=O.
   - `idealLatticeCurve.automorphism_factors` gives |Aut|=6 for O=ℤ[ζ₃] at j=0.

   So the identification over ℂ is already planned there.

   **Repair.**

   - Set the gap's section to 1.1.
   - Narrow the needs to what is missing: descent of that identification from ℂ to an arbitrary characteristic-zero field containing a primitive cube root of unity.

9. **F09** (P3) gap:theta-induction-arbitrary-cm-curve asks for an L-function identity an earlier roadmap states

   **Location.** README line 107: "supply weight-two theta newforms f_ψ and f_ψ̄ with L(f_ψ,s)=L(ψ,s) at every Euler factor and the central comparison M_(f_ψ)(1)⊗L=Ind η̄".

   **Witness.** GL2AutomorphicRepresentationsAndTransfer §R17.4.16 (open-PR head) states L_F(s, AI θ)=L_K(s,θ), with local parameters at every place and cuspidality exactly when θ≠θ^σ. ComplexMultiplicationAndExplicitReciprocity's own supplier list consumes it as "the CM theta-series realization".

   **Repair.**

   - Cite §R17.4.16 `quadraticInduction` for the L-function identity.
   - Narrow the gap to the realization of AI(ψ) as a weight-two newform and the Galois comparison for A/K without descent to ℚ.

Nine findings: five blocking (P2), four P3, no P1. All eleven round-1 findings were applied as written. Four of the repairs introduced new defects: R01, R03, R04 and R05. The rest of the package is sound in what was checked (see Verified sound). Padding in `Suggested.lean` counts as a blocking finding for this review, so R01 is graded P2.

## Verified sound

### Repair check, round-1 findings

| Id | Repaired passage (abridged) | Status |
| --- | --- | --- |
| F01 | `Suggested.lean` states `congruentNumber_densityOne`, `congruentNumber_half_positive`, `congruentNumber_half_discriminants`, `cmTwists_nonvanishing_lowerHalf` and `cmTwists_nondescending_nonvanishing_lowerHalf`. README lines 15, 451, 473, 483, 520 and 606 name them. | Repaired. The repair also added two input lemmas, raised as R01. |
| F02 | Line 35 cites `ModularForm.L` and `CuspForm.differentiable_L`. Line 47 cites `analyticOrderAt_L_ne_top`, `analyticRank`, `analyticRank_eq_zero_iff`, `L_eulerProduct`, `frickeCompletedL_functional_equation` and `CuspForm.conj`. Docstring lines 25–26 say these are available at the pins. | Repaired. The narrowed gap gained a nonexistent object (R04); line 363 is stale (R06). |
| F03 | Lines 95–101: a "From TauCetiRoadmap.ModularIwasawaMainConjecturesPartII" subsection; Scope line 11 names this owner. | Partly repaired. The supplier now plans the endpoint, so the gap is redundant (R03); line 363 is stale (R06). |
| F04 | Line 109: the general j=0 contract. Line 562 cites `discr_odd_prime'`, `absNorm_span_zeta_sub_one`, `map_eq_span_zeta_sub_one_pow` and `ramificationIdx_span_zeta_sub_one`. | Repaired. The sections are wrong (R08). |
| F05 | Line 65 gives the general comparison. Line 43 cites `variableChange_a₄_of_isShortNF`, `variableChange_a₆_of_isShortNF` and `smul_shortCurve`. Line 61 is corrected. | Repaired as asked. The restated gap is outside its supplier's carriers (R05). |
| F06 | Line 57 no longer has "product additivity". Lines 35 and 407 cite `analyticOrderAt_mul` and `analyticOrderNatAt_mul`. | Repaired. |
| F07 | Lines 7 and 622 name RankZeroOneBSDPartII as the consumer of §0.1. | Repaired. |
| F08 | Line 604: "the source states a positive proportion, and the one-half bound is derived here from §§6.1 and 6.5." | Repaired. |
| F09 | Lines 144–145 define `cubeSumModel` through `WeierstrassCurve.shortCurve` and import `ShortWeierstrass`. | Repaired, though R01 deletes the definition. |
| F10 | Line 107 asks only for theta newforms and the comparison. Lines 105 and 389 cite `ellipticCMLFactorization`. | Repaired. A further overlap is noted in R09. |
| F11 | Lines 91 and 353 add ℚ(√−2) at two. | Repaired: (ζ₈+ζ₈³)²=−2. |

### Adversarial table

Values for the unchanged sections §§0.2–0.4, 1.1–1.4, 2.1–2.4, 3.1–3.3, 4.1–4.3 and 4.5 were computed in the round-1 table. That table carries values on every row. I recomputed the following and they agree:

- the central sign at k=2, 4, 6: +1, −1, +1;
- the period powers at those weights: 1, 2πi, (2πi)²;
- the central evaluation at p=3, c=4, h=1: 1/4;
- the §1.2 dimensions: h¹=1, local quotient 2−1=1, kernel 0.

The rows below cover every statement that the repairs changed or added, plus the gaps.

| Statement | Instances tried | Values computed (statement side / test side) | Result | Change |
| --- | --- | --- | --- | --- |
| `ellipticLNonvanishingAtOne` | twist n=1 (y²=x³−x); n=5; F replaced by 2F or 0 | n=1: L(E,1)≈0.6555≠0, predicate true. n=5 (residue 5): root number −1 gives F(1)=−F(1)=0, predicate false. First Dirichlet coefficient is 1; 2F has 2 and 0 has 0, so neither agrees on Re s>3/2 | Determines the actual entire continuation | none |
| Mathlib `WeierstrassCurve.LSeries` (LFunction.lean:79–84) | good, multiplicative and additive local factors | Factors 1−aT+qT², 1∓T, 1. These equal the inertia-invariant factors, so base-change factorizations hold with these factors | Correct carrier | none |
| `cm_analyticOrder_double` | A: y²=x³−x over ℚ(i); the n=5 twist; y²=x³−x over ℚ(√−2) | Analytic ranks 0 and 1 give orders over K of 0 and 2 (2r). Over ℚ(√−2), End_K=ℤ, so hCM is false and the case is excluded | True, but an input lemma | R01 |
| `congruentTwist` | n=1, 2, −1, 0 | Δ=64n⁶: 64, 4096, 64, 0. With a₄=−n instead, n=2 gives Δ=512. j=1728 when n≠0 | Sound | none |
| `congruentNumber_densityOne` | residue masses; X=0 | Each squarefree residue class has mass 1/π², so #S(X)≈3X/π². At X=0 the Lean ratio is 0/0=0, which does not affect the limit | Sound (BT Thm 1.2, lines 50–52) | none |
| `congruentNumber_half_positive` | brute force up to X=10⁶ | 607926 positive squarefree n (6X/π²≈607927). Of these, 303947 lie in residues 1, 2, 3, a ratio of 0.49997. Residues 5, 6, 7 have root number −1 | Sound | none |
| `congruentNumber_half_discriminants` filter | d=1, −4, 8, −8, 12, −3, 5, −7; d=0, 4, 9, −1; brute force for \|d\|≤2·10⁵ | Lean `Int.emod` semantics accept the first eight and reject the last four. There are 121589 fundamental discriminants (6X/π²=121585), and 60771 have squarefree part ≡1, 2, 3 mod 8: ratio 0.49981. Weights 5/4+1/2+5/4=3 out of 6. congruentTwist(4m) has a₄=−16m², and u=2 rescales it to −m² | Sound | none |
| `squareclassHeight` | ℚ: [2], [1/2]; ℚ(i): [1], [i], [2], [3], [5] | ℚ: heights 2 and 2; using positive valuations only would give 1 for [1/2]. ℚ(i): heights 1, 1, 1 ([2]=[i]), 9, 25. Matches BKLOS lines 80–84 and the cutoff H<X at line 96 | Sound | none |
| `cmTwists_nonvanishing_lowerHalf` | K=ℚ(ζ₃), ℚ(i), ℚ(√−2); ε=1 | O/(3) is 𝔽₃[e]/(e²), 𝔽₉, 𝔽₃×𝔽₃ respectively, so h3 holds for ℚ(ζ₃) and ℚ(√−2) and fails for ℚ(i). hCM holds exactly when End_K(A)⊋ℤ. At ε=1 the left side is negative, so the bound is trivially true | Sound (BT Prop 1.3; BKLOS Thm 2.7, lines 196–198) | none |
| `cubeSumModel` / `cubeSum_fullCM` | n=±1, ±3, 0; 3000 random triples | Δ(1)=−314928=−2⁴3⁹; Δ(3)=−25509168. G(forward)=108n²F, F(inverse)=54nG, and both composites equal 18n times the identity: 0 failures. n=0 gives Δ=0. End over ℚ is ℤ, so the base change is needed | True, but an input or Check-level statement | R01 |
| `descendsToRat` | y²=x³−x over ℚ(i); y²=x³+x+(1+i) | The first descends with C=1. For the second, j=6912/(4+54i)≈9.43−127.30i is not in ℚ, so it does not descend | Sound | none |
| `descendingTwist_twoCosets` | j=0; j=1728 over ℚ(√−2) with t=√−2; D=4 | j=0: [u]³=[u] forces [u]=1, one coset. j=1728: twist a₄=(4t)²(−1)=32, and u=2 gives 2 (rational), with √−2 outside ℚ×K×², so the second coset is needed. D=4 gives θ=2∈ℚ and is excluded by D<0 | True, but an input lemma | R01 |
| `descendingTwists_count_sqrt` | ℚ(i): split 5, inert 3, ramified 2 | H([5])=25, H([3])=9, H([2])=1, so H≥c·n_out² and the count is O(√X). The empty case holds with C=1 | True, but an input lemma | R01 |
| `cmTwists_nondescending_nonvanishing_lowerHalf` | total X, numerator X/2, removed √X | X=10⁴ gives 0.49; X=10⁶ gives 0.499; the limit is 1/2 | Sound | none |
| gap cm-rational-kato-equality | compared with §CZ.6 endpoint text | Same quantifiers (every CM newform with k≥2, every λ\|p), same ring Λ[1/p], same identity | Redundant | R03 |
| gap newform-central-analytic-interface | compared with ModularForms Layer 7 | 0 occurrences of "theta"; the layer has 4 topic bullets | Names a nonexistent object | R04 |
| gap pointed-cubic-model-comparison | EllipticCurves headings and AlgebraicCurves Layer 10 | EllipticCurves has 0 plane-cubic sections. AlgebraicCurves has smooth plane curves and elliptic function fields | Wrong supplier | R05 |
| gap cube-sum-full-cm | CM&ER §1.1 | \|Aut\|=6 at j=0 over ℂ; End_ℂ(E_I)=O | Sections wrong, partly planned | R08 |
| gap theta-induction-arbitrary-cm-curve | GL2 transfer §R17.4.16 | L_F(s, AI θ)=L_K(s,θ); cuspidal iff θ≠θ^σ | Partly provided | R09 |
| gap elliptic-quadratic-analytic-identities | EllipticCurveModularity §R29.6 | R29.6 gives the continuation over ℚ and the sign w_E. It gives neither the base change over K nor the congruent-twist root numbers (+1 for residues 1, 2, 3; −1 for 5, 6, 7) | Precise, not provided | none |
| gap central-modular-local-dimensions | KatoEulerSystems §7.9 at head 5fb6ef4 | §7.9 uses the dimensions 2 and 1 and H⁰=H²=0 inside a proof only, and excludes κ⁻¹ from the form κ⁻²χ | Not provided as a target; contract fine | none |
| gaps kato-rational-duality, central-jstar-control, central-finite-conditions-and-descent, isogeny-corank-all-primes, smith-unconditional-positive-corank, cm-three-selmer-unconditional | cited supplier sections | ArithmeticGaloisDuality D7.6–D7.7 exist. SelmerIwasawaCohomology §3.15 retains degree-two j_* corrections and §§3.16, 4.26 exist. ArithmeticStatisticsPartVII line 1286 defers BT Thm 1.2's analytic step, and §5.11 keeps its hypothesis | Precise and not provided | none |

### Library declarations opened at the pins

- **Mathlib 6b7abb3:**
  - `AlgebraicGeometry/EllipticCurve/Weierstrass.lean`: 76, 86, 131, 230, 366, 388;
  - `AlgebraicGeometry/EllipticCurve/LFunction.lean`: 79, 84;
  - `NumberTheory/ModularForms/LFunction.lean`: 134, 190;
  - `Analysis/Analytic/Order.lean`: 523, 528;
  - `Analysis/Analytic/Uniqueness.lean`: 234;
  - `RingTheory/DedekindDomain/Factorization.lean`: 309, 596;
  - `RingTheory/Ideal/Norm/AbsNorm.lean`: 258;
  - `NumberTheory/NumberField/Cyclotomic/Basic.lean`: 56;
  - `NumberTheory/Cyclotomic/Basic.lean`: 652;
  - `NumberTheory/NumberField/Cyclotomic/Ideal.lean`: 83, 106, 124;
  - `NumberTheory/NumberField/Basic.lean`: 101.
- **Tau Ceti a91d3aa:**
  - `FieldTheory/SquareClassGroup/Basic.lean`: 45, 66;
  - `NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean`: 72, 80, 107;
  - `NumberTheory/ModularForms/LFunction/EulerProduct.lean`: 217;
  - `NumberTheory/ModularForms/LFunction/FunctionalEquation.lean`: 324;
  - `NumberTheory/ModularForms/Conjugate.lean`: 298 (coefficient-conjugate form);
  - `AlgebraicGeometry/EllipticCurve/ShortWeierstrass.lean`: 109, 168;
  - `AlgebraicGeometry/EllipticCurve/NormalForms.lean`: 131, 140;
  - `AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean`: 169, 411, 739;
  - `AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean`: 106;
  - `AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Ring.lean`: 174;
  - `NumberTheory/ModularForms/Newforms/Newform.lean`: 104;
  - `Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`: 145.

All 41 cited lines hold the named declaration, and all namespaces are as cited. Neither library has a p∞ or Bloch–Kato Selmer carrier for elliptic curves: Tau Ceti has only the two-descent `selmerGroup₂` and `selmerGroupA`. So the docstring's unstatability claims for the converses are correct.

### Cross-roadmap citations resolved

- **AutomorphicGaloisRepresentations:** §§1.5, 3.15, 4.4–4.8, 6.4, 7.2.
- **SelmerIwasawaCohomology** (#869 head): §§2.4, 2.10–2.12a, 2.19–2.20, 3.0, 3.7, 3.10, 3.13–3.16, 4.9, 4.26, 4.29.
- **ArithmeticGaloisDuality** (#858 head): R02.4.3–R02.4.4, D7.3–D7.7.
- **ArithmeticStatisticsPartI** (#1171 head):
  - §§0.1 and 0.2, including "Piecewise rescaling of a height" and the BT-family Checks at its lines 350 and 390;
  - §0.5 "Squareclass height";
  - §§0.6 and 0.7;
  - §0.15 "Positive squareclass denominator".
- **ArithmeticStatisticsPartVII** (#1178 head): §§5.9 and 5.11, with headings as quoted.
- **ComplexMultiplicationAndExplicitReciprocity** (#1254 head): §§1.1, 1.2 (`rationalCMSelfTwist`), 4.1 and 4.2 (`ellipticCMLFactorization`, `cmInductionComparison`).
- **EllipticCurveModularity** (#1018 head): §R29.6, "Continuation and the functional equation".
- **On main:** EllipticCurves Layers 1, 5 and 7, and ModularForms Layer 7.
- **KatoEulerSystems** (board pull request, head 5fb6ef4): §§2.2, 4.4, 4.6, 5.1 (z(ιγ)=−σ₋₁z(γ)), 5.3, 7.2. Its exclusion of main-conjecture equalities is confirmed.
- **On the board's main branch:**
  - PadicHodgeRegulators §§0.1 and 1.1–1.8;
  - ModularIwasawaMainConjecturesPartII §§CZ.4–CZ.6;
  - RankZeroOneBSDPartII, which imports C.0, C.3, C.4, C.5 and C.6.
- **Resolver leads.** The three "found nowhere" leads (KatoEulerSystems, PadicHodgeRegulators, ModularIwasawaMainConjecturesPartII) are board packages, so all three are false leads.
- **RankZeroOneBSD** is the only roadmap name in the README that resolves nowhere (R02).

### Ownership

I searched by object with `roadmaps grep` over main and the 350 open heads: p-converse, Burungale–Tian, cube sums, even-parity Goldfeld, squareclass and `LSeries` statements in Lean files.

- ArithmeticStatisticsPartVII defers the analytic step of BT Theorem 1.2 to a downstream roadmap (its line 1286). That makes this roadmap the owner of the analytic applications.
- No open roadmap states the converse or the twist proportions.
- No declaration in `Suggested.lean` shares a fully qualified name with another roadmap.
- The local `squareclassHeight` specializes ArithmeticStatisticsPartI §0.5's height and is cited there (README line 506).

### Sources: the seeded sample

All fifteen targets were read at their locators. The source supports each statement as written.

| Target | Locators checked |
| --- | --- |
| 0.2 | BT line 235; Kato lines 4052–4071 (Thm 12.5(1), p. 221) |
| 1.1 | Kato lines 4814–4819 (Prop. 14.11(1), p. 241) |
| 1.2 | BT lines 231–234; Kato lines 4771–4787 ((14.9.3) and (14.9.5), p. 240) and lines 4832–4849 (Prop. 14.12, pp. 241–242) |
| 1.4 | Kato lines 4807–4813 and 4832–4849 |
| 2.3 | BT lines 208–212 (Thm 2.6, p. 5) and 235–244 |
| 2.4 | BT lines 245–247; Kato lines 4721–4731 (§14.8, p. 238) |
| 3.1 | BT lines 245–249; Kato Thm 12.5(1) |
| 3.2 | BT lines 251–252 |
| 3.3 | BT lines 208–228; Kato §15.14, lines 5731–5734 (p. 264) |
| 4.1 | BT lines 253–259 |
| 5.3 | BT lines 12–13, 50–52, 97 |
| 5.4 | BT lines 47–52 |
| 6.2, 6.3 | BT lines 277–278 (Remark 3.6(i), cube sum x³+y³=2n over ℚ(ζ₃)) |
| 6.4 | BT lines 279–282; the locator says the coset bound is this roadmap's argument |

The author flagged no locator as unverified.

### Mechanical checks

- **Dependency check output:** `depcheck: 46 roadmaps, 497 edges, 0 problem(s)`. It printed no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `packages/CMRankZeroConverse/Suggested.lean` exits 0 in 3.7 s. It gives exactly nine warnings, all "declaration uses `sorry`", at lines 55, 77, 89, 100, 127, 151, 174, 192 and 203.
- **Binder audit.** A scratch file with `#check @` for all 14 declarations elaborates. Every elaborated type matches its README statement, including the hypotheses on K, h3, hCM, D<0, θ²=D and both descent hypotheses. No binder is lost and nothing needed changing.
- **One-tactic probe.** I tried `rfl`, `simp`, `infer_instance`, `trivial`, `decide`, `norm_num` and `aesop` on each of the nine theorems: 63 attempts, all failed. R01 therefore rests on headline status, not on one-tactic closure.
- **Shape.**
  - Every definition has an API list and at least three Checks: the five Lean definitions and the five prose definitions.
  - Every layer ends with Examples and Dependencies.
  - There is no LaTeX, process wording or machine path.
  - `Suggested.lean` has no `lemma`, `set_option`, `#eval`, `#print`, `#synth` or sorry'd data.
  - Every Lean name appears in the README, and the resolver reports no backticked name missing.
  - The 13/13 gap slugs, suppliers and needs sentences are identical in the README and `plan.json`.
- **Manifests.** `metadata.toml` and `sources.toml` are unchanged and valid. I fetched no new source and added no entry.

## Not verifiable

- **Kato OCR.** The OCR garbles two places:
  - the sign and period exponent in Theorem 12.5(1) (Kato lines 4066–4068);
  - the evaluation exponent in §14.13 (Kato line 4865).

  I checked the README's conventions against BT line 240 and KatoEulerSystems §7.9 instead.
- **BT published numbering.** The Annals version was not opened. The manifest and the README consistently use arXiv v2.
- **RankZeroOneBSD.** I searched the three places a cited roadmap can exist, not the board's job issues.

## Source issues

- **Misprint** in BT at proof of Theorem 1.1, p. 6: the source says (line 256) the Pontryagin-dual Selmer group tensored with the number field K matches Selmer groups of the untwisted V(f), V(f̄). It should be an identity over the completed coefficients for V(f)(1), V(f̄)(1). Affects the proof.
- **Gap** in BT at proof of Theorem 3.1, display (3.1), p. 6: the source says (lines 232–234) Selmer vanishing for V(k/2) gives rational H² vanishing directly from Kato (14.9.3), whose relevant term is the dual Selmer group. A Poitou–Tate and Euler-characteristic step proving dual vanishing should come first. Affects the proof.
- **Gap** in BT at Theorem 3.5, p. 7: the source says (lines 272–275) BKLOS Theorem 2.7 gives 3∞-Selmer corank zero for half the twists, but that theorem states only Mordell–Weil rank zero (BKLOS lines 196–198). It should cite the even three-Selmer argument of BKLOS §9.2 with §11. Affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "be5ed67", "job": "REV-PKG-CMRankZeroConverse~2", "model": "opus", "worker": "fable-rev82"} -->
