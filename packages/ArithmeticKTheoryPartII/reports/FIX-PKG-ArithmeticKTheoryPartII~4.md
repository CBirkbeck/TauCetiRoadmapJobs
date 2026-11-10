# ArithmeticKTheoryPartII repair report

## REV-PKG-ArithmeticKTheoryPartII~3/F01 (P2) — not actionable in this package: human adjudication required for a re-raised non-actionable finding

The existing contract is retained pending human adjudication. This finding explicitly re-raises F02, marked non-actionable in packages/ArithmeticKTheoryPartII/reports/FIX-PKG-ArithmeticKTheoryPartII~3.md. The binding repair rule reserves that case for a human. The mathematical specialization proposed by the reviewer is supported by the evidence below; this disposition does not dispute it. No supplier or merge-order edit was made.

## REV-PKG-ArithmeticKTheoryPartII~3/F02 (P3) — applied

In packages/ArithmeticKTheoryPartII/README.md §3.5, “FGV §1.2, p. 2” → “FGV §1.1.1, p. 2”. FGV line 65 opens §1.1.1; FGV line 85 gives k=6,p=691; §1.2 starts at FGV line 124 on p. 3. The whole-package search found one occurrence of the incorrect locator. The mathematics and Lean declarations are unchanged.

## REV-PKG-ArithmeticKTheoryPartII~3/F03 (P3) — applied

In packages/ArithmeticKTheoryPartII/sources.toml, the FGV locator’s printed range 7–62 → 1–62. The same coverage repair expands Sections 1.1–1.2 → 1.1–1.4, covering Conventions’ §1.4 citation. Other affected consumers are README §§3.5, 8.4 and 8.5. FGV lines 32, 65–85, 271–282 and 2852–2868 witness the cited endpoints and introduction sections.

## Mathematical evidence for the human decision

The supplied review is evidence to test, not authority to reverse the previous disposition. The following checks support its substantive F01 argument.

| Input | Evidence read at the supplied snapshot | Consequence |
| --- | --- | --- |
| Generic cofinal plus theorem | TauCetiRoadmap/StableHomotopyKTheory/README.md §4.18 states the comparison for symmetric monoidal groupoids with faithful translations and a cofinal sequence, including perfectness of the stable commutator. | It can be specialized without asking its owner to classify alternating integral forms. The content is present in prose; the proposed aliases kSpace_cofinal_plus and stableAutomorphism_commutatorPerfect do not occur in that README snapshot. |
| Integral classification | TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md §A5.4(1) gives positive elementary divisors and determinant equal to their product squared. | In the unimodular case the product is 1, so every elementary divisor is 1 and the form is Hᵍ. This is an algebraic assertion on free integral modules, without a positivity or Hodge-structure hypothesis. |
| Cofinality and faithful translations | For any isometries f,g, equality f⊥id_H=g⊥id_H restricts to f=g. Every object is Hᵍ, with Hᵍ⊥Hʳ=Hᵍ⁺ʳ. | Translations are faithful, the powers of H are cofinal, the object monoid is ℕ by half-rank and its group completion is ℤ. Aut(Hᵍ)=Sp₂ᵍ(ℤ). |
| Symmetric boundary | TauCetiRoadmap/StableHomotopyKTheory/README.md §4.27 explicitly uses symmetric unimodular forms, J=⟨1⟩⊥⟨−1⟩ and the signature pair in ℤ². | That section is not the alternating instance of §4.18. The reviewer is correct to distinguish them. |
| Existing main specialization | TauCetiRoadmap/ComplexKahlerGeometry/README.md §7.7 also states the unimodular alternating integral basis theorem, explicitly identifying it as the unimodular case of AbelianSchemesAndArithmeticModuli A5.4. | There is no need for this package to create a second integral basis theorem. This is an additional existing ownership witness for the maintainer. |
| Functors | Forgetting sends H to a rank-two free module. Hyperbolic formation sends a rank-r projective integral module to a form of half-rank r. Both preserve sums and the symmetry isomorphisms. | The arithmetic specialization has the required functors; their component maps are g↦2g and r↦r. No change of the unscaled hyperbolic normalization is required. |

The existing gap:classical-symplectic-plus is already recorded, identically, under “Exact supplier contracts” and in the plan’s top-level gaps list, with supplier StableHomotopyKTheory and section §4.27. There are still 17 gap entries and 17 matching README contracts. Leaving that entry in place records the pending human decision; it is not a finding that the requested extension is mathematically necessary. Its consumers remain Scope and ownership, the GeometryOfNumbersAndQuadraticArithmetic contract, §1.1, §4.3, §8.4 and the corresponding layer dependencies. No additional contract was invented.

## Required checks

- The required elaboration of packages/ArithmeticKTheoryPartII/Suggested.lean, run from the supplied content checkout, exited 0. Its complete diagnostics were the two intended warnings, at 52:8 and 95:8: ``warning: declaration uses `sorry` ``. No TauCeti import is present, so no targeted module build was needed.
- A single scratch file containing the unchanged acceptance file and `#check @name` for all four declarations elaborated separately, after the first elaboration finished: exit 0, the same two warnings, and the four types summarized below. No section hypothesis was lost and no binder repair was needed.
- The required dependency command exited 0 with exactly:

```text
depcheck: 236 roadmaps, 2149 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order file was edited.

- Citation resolution against main 4ec889e and the indexed 438 open heads returned no cross-roadmap citation or Lean name found nowhere. Its caveat that pinned Lake packages were not checked by that resolver was retained: pinned source inspection and actual Lean elaboration supplied the library checks.
- JSON and TOML parsing passed. All 17 plan gaps retain matching README text. A whole-package search found no remaining “FGV §1.2, p. 2” or “printed pp. 7–62” in the author’s roadmap and manifest. Historical reports are unchanged.
- No gate failure was supplied in the brief. No declaration was added, deleted or renamed. Suggested.lean, metadata.toml and design/plan.json are unchanged. The only roadmap edits are one README locator and the FGV manifest locator. No commit was made.
- The final allowed-file audit, machine-path audit and git diff --check passed. All four Lean declaration names still occur in the README. The computed adversarial table contains 141 data rows.

## Elaborated signatures and pinned interfaces

| Declaration | Elaborated hypotheses and carrier | README agreement |
| --- | --- | --- |
| exists_split_prime_with_signs | Explicit p,n, primality, p≠2, n>0; arbitrary-universe K with Field, NumberField, cyclotomic and CM instances; signs at every real embedding of the maximal real subfield. The witness is nonzero, away from p, principal prime, and splits into distinct nonzero conjugate primes. | §2.3 has these hypotheses and conclusions. |
| conjugateFractionalIdeal | Explicit K with Field, NumberField and CM instances; fractional ideals over its ring of integers in K on both sides. | §2.4 specifies semilinear transport on precisely this carrier. |
| IsSkewCMLine | Explicit K with all three instances, embedding set Φ, fractional ideal B and scalar δ. Its body includes both nonzero conditions, skewness, inverse-different equality and the exact sign/type equivalence. | §2.4 retains all five conditions. |
| exists_cm_lines_with_ideal_product | Explicit prime-power and field data; Φ contains exactly one embedding in each conjugate pair; L≠0. Two actual skew lines and a nonzero scalar witness the ideal-product equation. | §2.4 states the same product modulo a principal ideal, not equality of the two lines. |

Pins read from the supplied lake-manifest.json: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. The supplied content checkout is 4ec889e8f0480e2cdb21a524eb76e48215c9ad94. Relevant native definitions were opened directly:

| Native object | Pinned file and evidence | Boundary retained |
| --- | --- | --- |
| CM field | Mathlib/NumberTheory/NumberField/CMField.lean:69 | Totally complex and quadratic over the maximal real subfield; not a statement about the Hilbert class field. |
| Fractional-ideal conjugation | Mathlib/RingTheory/FractionalIdeal/Operations.lean, ringEquivOfRingEquiv and ringEquivOfRingEquiv_spanSingleton | Native semilinear transport is used in a small real-bodied specialization; its generic algebraic laws need no new acceptance theorem. |
| Trace dual | Mathlib/RingTheory/DedekindDomain/Different.lean:230 | The definition has an explicit zero branch. The acceptance definition applies it to the nonzero unit ideal. |
| Principal fractional ideal | Mathlib/RingTheory/FractionalIdeal/Operations.lean, spanSingleton | A monoid-with-zero homomorphism, including input 0; δ≠0 and a≠0 exclude its zero value where required. |
| Representation | Mathlib/RepresentationTheory/Basic.lean:48 | A monoid homomorphism to linear endomorphisms, with no continuity condition. |
| Absolute bar differential | Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:125 | The first coefficient action uses the inverse. It does not supply the completed relative complex. |
| Finite-rank symplectic group | Mathlib/LinearAlgebra/SymplecticGroup.lean:102 | Matrices preserving J; this is not the stable symplectic K-spectrum. |
| Positive compatible structure | TauCeti/Geometry/Symplectic/ExistsCompatible.lean, SymplecticForm.exists_compatible | Finite-dimensional real carrier; positivity is ω(v,Jv)>0. It does not construct a KSp comparison or a contractible space of choices. |

The supplied near-match file was read for all four declarations. The field-theoretic CM instances do not realize signed split primes, and the native ideal operations do not realize pairs of perfect skew lines of arbitrary prescribed type and ideal-class product. No candidate proves either retained headline in one tactic. No replacement or padding declaration was added.

## Sources, ownership and scope of the repair

FGV was read in the certified author-copy extraction. The repaired Check lies at FGV lines 65–85, not §1.2. Its finite-coefficient conclusion also uses the named supplier contracts: a nonzero finite p-group A has A/pA≠0, which injects into the coefficient K-group. Thus the new locator does not assert that the introduction alone proves the finite-coefficient comparison. FGV lines 1451–1483 supply the four-class factor 2 and transfer argument. The page-range audit included FGV lines 24–85, 271–282 and 2811–2868. The changed manifest key is the existing FGV key; publication and preprint versions were not duplicated.

The Borel extraction was also available, including borel1974 lines 1246–1253 for the real symplectic degrees. Charney remains the settled uncertified Corollary 4.5 and was not requested again. There are no new works or missing-text requests.

Before writing, the main roadmaps TauCetiRoadmap/ComplexTori/README.md and TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md were read for prose shape. The existing layers and all definition/API/Check blocks are preserved. Read-only roadmap-service searches by cofinal sequence, unimodular alternating form and symplectic plus space covered main and the indexed open heads; board-package searches covered the same objects. StableHomotopyKTheory §4.18 and AbelianSchemesAndArithmeticModuli §A5.4 were read in full at those heads for F01. All named supplier roadmaps were reopened by the service; the existing EH and CH design identifiers were also located in their board designs. No new foundational construction is claimed here, and the repair introduces no new supplier edge. The overlap record reports no shared edit, dropped cited id or citation defined only by an open revision. No open pull request write was performed.

## Computed adversarial mathematics record

These are independently recomputed mathematical controls, not proofs of the general targets. “Retain” means that this instance agrees; it does not declare acceptance of the roadmap. The changed Check and the mathematical content of F01 are included explicitly. No untouched target has been rewritten. Zero rings and inseparable positive-characteristic extensions cannot instantiate the number-field headlines; n=0 and p=2 are excluded explicitly. The table separates operations whose signs, source or component coordinates could plausibly be confused.

| Statement | Instances tried | Values computed on each side or competing models | Result | Change |
| --- | --- | --- | --- | --- |
| F02 section/page locator | FGV introduction headings | §1.1.1 starts at line 65 on p.2; nonzero example at line 85; §1.2 starts at line 124 on p.3 | Correct locator is §1.1.1 | Repair F02 |
| F03 page coverage | Cited introduction and Appendix endpoints | 1,2,6,7,62 all lie in [1,62]; 1,2,6 do not lie in [7,62] | Old interval incomplete | Repair F03 |
| F03 section coverage | Conventions’ notation | §1.4 at line 271 is outside [1.1,1.2] and inside [1.1,1.4] | Same coverage defect | Repair F03 |
| Odd prime-power convention | p=3,n=1; n=0; p=2 | q=3 has 2⁻¹=2; n=0 gives q=1; modulo 2 the value 2 is 0 | Last two inputs excluded | Retain |
| Arithmetic Frobenius twist | q=5, Frobenius at 2, twist 3 | 2³=3; inverse convention gives 2⁻³=2 | Directions differ | Retain |
| Negative twist | q=5, exponent −1 | 2⁻¹=3=2³ mod5 | Dual power matches | Retain |
| Unreduced suspension unit | Point, degree zero | π₀Σ∞₊point=ℤ; reduced suspension gives 0 | Unit must survive | Retain |
| Hyperbolic convention | Rank-one integral module, mod5 | c_BH(1)=2; (1/2)c_BH(1)=3·2=1 | Unscaled H is not a section | Retain |
| Adams projectors | ψ=+1,−1 mod5 | (p₊,p₋)=(1,0),(0,1) | Both signs determined | Retain |
| Bott supplier adapter | Complex-oriented CP¹, u=c₁O(1) | ch₁(β_Top)=−u, integral −1; ch₁(−β_Top)=u, integral 1 | Arithmetic Bott is −β_Top | Retain |
| Bott powers | Exponents 0,1,2,3 | 1,−β_Top,β_Top²,−β_Top³ | Conversion is (−1)^m | Retain |
| Tangent/dual character | Line of Chern root u, m=1,2 | ch₁(L∨)=−u; ch₂(L∨)=u²/2; multiplying by (−1)^m gives u,u²/2 | Separate dual sign | Retain |
| Ordinary versus completed coefficients | Discrete K(ℤ_p,1) | H₁ with ordinary ℤ_p coefficients is ℤ_p⊗ℤℤ_p; completed comparison maps a⊗b to ab | Completion is additional data | Retain |
| §0.1 Bott normalization | q=5, β,2β,−β,0 | Bockstein–Hurewicz values 1,2,4,0 | Only β has value 1 | Retain |
| §0.1 character law | q=5, a=2; trivial character | 2β maps to 2bott; trivial character gives 0 in positive degree | Zero model excluded | Retain |
| §0.1 polynomial range | q=3,5,9 | q>4 is false,true,true | q=3 has no ring assertion | Retain |
| §0.2 Picard components | F₅ | Pic(F₅)=0; unit automorphism group has order 4 | Components lose loops | Retain |
| §0.2 tensor map | Two rank-one integral lines | Tensor rank 1·1=1; sum rank 1+1=2 | Tensor is K-product | Retain |
| §0.2 fractional-ideal arrows | 2ℤ→3ℤ | (3/2)2ℤ=3ℤ; 3/2∉ℤ× | Fraction-field units required | Retain |
| §0.2 tensor unit | ℤ as a line | Image rank 1, not additive rank 0 | Unit law excludes zero map | Retain |
| §0.3 Picard–Bott map | L=O_q; k=1,2 | [L]−1=0; exponents 1,3 give degrees 2,6 | Reduced ideal term and exponent agree | Retain |
| §0.3 inversion of p | Cyclotomic p-prime | Class of (1−ζ_q) is 0; quotienting Pic by this class changes it by 0 | Picard localization agrees | Retain |
| §0.4 full-cover distinction | q=9, twist 3 | Cubes of units are {1,8}, kernel {1,4,7}; trivializing field has degree 2 instead of 6 | Full-cover gap retained | Retain |
| §0.4 coinvariants | C₂ acts by −1 on F₅ | Coinvariants F₅/(−2)F₅=0; untwisted coinvariants F₅ | Action cannot be erased | Retain |
| §0.5 conjugation homology | C₂ sign F₃ | c−1=−2=1, so H₀=0; positive homology is 0 by invertible order | Absolute/relative edge allowed | Retain |
| §0.5 regular-prime square | q=3,k=1 | Pic(O₃)=0; K₂(ℤ;F₃)=0, hence both bottom groups 0 | Zero case agrees | Retain |
| F01 alternating classification | H; H⊥H | Elementary divisors (1),(1,1); determinant 1; half-ranks 1,2 | A5.4 specializes | Human decision pending |
| F01 faithful translations | diag(f,id_H)=diag(g,id_H) | Restricting the first block gives f=g | Hypothesis of §4.18 holds | Human decision pending |
| F01 component group | 0,H,H⊥H,virtual −H | Half-ranks 0,1,2,−1; group completion of ℕ is ℤ | Not ℤ² | Human decision pending |
| F01 stable groups | H,H⊥H | Automorphism groups Sp₂(ℤ),Sp₄(ℤ); stabilization f↦diag(f,I₂) | Correct cofinal telescope | Human decision pending |
| F01 symmetric negative control | J=diag(1,−1), v=(1,0) | J(v,v)=1; H(v,v)=0 | J is outside alternating groupoid | Human decision pending |
| §1.1 forgetful/Hodge components | 0,H,H⊥H | Betti ranks 0,2,4; Hodge ranks 0,1,2 | Different component maps | Retain |
| §1.1 Hermitian convention | Gaussian b=(i/2)x bar(y) | −Tr b(1,i)=−1; h(1,1)=1; h(1,i)=−i | Im h=ω | Retain |
| §1.1 native compatible sign | Gaussian J_H=i | ω(1,J_H1)=−1; ω(1,−J_H1)=1 | Native positive structure is −J_H | Retain |
| §1.1 polar path | diag(2,1/2) | P=diag(2,1/2),U=I; determinant 2^(1−t)2^(t−1)=1; endpoints P,I | Symplectic path has correct direction | Retain |
| §1.2 finite periods | q=3,5,25,27 | 2p^(n−1)(p−1)=4,8,40,36 | Matches self-map degrees | Retain |
| §1.2 tower iteration | 25→5 | 40=5·8; 8 is not divisible by 40 | Common iteration needed | Retain |
| §2.1 norm-one arrows | Gaussian integers | Units ±1,±i all have u bar(u)=1; 2 has norm 4 | Arbitrary nonzero scalars excluded | Retain |
| §2.1 specified cyclic subgroup | Odd q | μ_(2q) has 2q elements, μ_q has q; −1 is missing from μ_q | Full automorphism group is larger | Retain |
| §2.1 coefficient tensor | Two skew involutions | (−bar)⊗(−bar)=+bar | Skew groupoid not closed under same coefficient | Retain |
| §2.1 positive versus negative line | Gaussian δ=i/2, real multiplier ±1 | Imaginary coordinates ±1/2 | Negative multiplier reverses type | Retain |
| §2.2 CM dimension | E=ℚ(i) | Integral rank 2; abelian dimension 2/2=1 | Not dimension 2 | Retain |
| §2.2 polarized arrows | Multiplication by 2 on Gaussian lattice | Determinant 4; pairing pulled back to 4ω≠ω | Isogeny is not an isometry | Retain |
| §2.3 signed split prime | q=3, t=±7 | (3+ζ₃)(3+bar ζ₃)=9−3+1=7; ±7 generate same prime ideal and opposite real signs | Both signs realized | Retain |
| §2.3 inert negative control | q=3, prime 2 | X²+X+1 has values 1,1 over F₂, hence no root | Cannot supply split factorization | Retain |
| §2.3 excluded witnesses | t=0,±1; prime p | Zero is not the nonzero witness; unit ideal contains p; ramified p factor equals its conjugate | Signature excludes all three | Retain |
| §2.4 conjugation definition | Gaussian ideals 0,1,(1/2) | Images 0,1,(1/2) | Native total operation retained | Retain |
| §2.4 conjugation involution | P=(2+i) | bar(P)=(2−i); double conjugation P; norms 5,5 | Identity transport fails first comparison | Retain |
| §2.4 product/principal laws | Gaussian conjugate primes | (2+i)(2−i)=5; conjugate of principal (2+i) is (2−i) | Product and principal law agree | Retain |
| §2.4 skew-line perfection | Gaussian B=O, δ=i/2 | (δ)B bar(B)=(i/2)=inverse different | Positive example | Retain |
| §2.4 skew-line negative control | B=O, δ=i or 0 | (i)=O has index 4 in (i/2)O; (0)≠inverse different | Equality excludes imperfect/zero form | Retain |
| §2.4 exact type | δ=±i/2 | Identity/conjugate imaginary values (1/2,−1/2) and (−1/2,1/2) | The type is determined, not independent | Retain |
| §2.4 representative change | B↦2B, δ=i/2↦i/8 | (i/8)(2)(2)=(i/2) | Perfection and type preserved | Retain |
| §2.4 ideal-product realization | Class group C₃, L=1 | Classes x,x⁻¹ have product 1, ratio x² | Product does not assert equal lines | Retain |
| §2.4 opposite tensor changes | Initial classes 1,l/bar(l) | Multiplying by x,x⁻¹ gives l/bar(l); by x,x gives x²l/bar(l) | Inverse tensor necessary | Retain |
| §2.4 CM-type condition | q=5 | Conjugate pairs {1,4},{2,3}; four types, each of size 2; empty/full sets fail pair condition | hΦ is nonvacuous | Retain |
| §3.1 CM Bott degree | k=1,2,3 | Exponents 1,3,5; degrees 2,6,10; exponent k would give 2,4,6 | Degree formula fixed | Retain |
| §3.1 coefficient naturality | 25→5, scalar 7 | 7 mod5=2; 2·7 mod25=14 mod5=4=2·2 | Reductions commute with characters | Retain |
| §3.2 odd type sums | q=5,i=1, all types | Sums 3,4,1,2 | Hodge image spans F₅ | Retain |
| §3.2 pair-switch unit | q=5, {1,2}→{4,2} | Sums 3→1; difference −2=3, inverse 2 | Switching generates a unit | Retain |
| §3.2 even exponent control | q=5,i=2 or 4 | All sums 0 for i=2; all sums 2 for i=4; switching difference always 0 | Oddness belongs to surjectivity argument | Retain |
| §3.2 supplier coordinate | q=5,i=1, Φ={1,2} | 3bott=−3β_Top=2β_Top; Chern value 2·(−1)=3 | Sign adapter agrees | Retain |
| §3.3 Betti unit removal | q=5, odd exponents 1,3 | Sum of units 1+2+3+4=10=0; sum of cubes 100=0 mod5 | Transferred unit term vanishes | Retain |
| §3.3 trivial ideal | L=O₅, Φ={1,2},k=1 | Betti 0; Hodge 3 | Forgetful and Hodge maps differ | Retain |
| §3.4 degree-zero splitting | Symplectic plane, q=5 | p₊c_B=2, a unit with inverse 3; p₋π₀ku=0 | Splitting has correct rank factor | Retain |
| §3.4 positive congruence slots | p=3, degrees 1,2,3,4 | Groups 0,ℤ₃,ℤ/3,0 in these small slots | Degree-zero exception not erased | Retain |
| §3.5 four-class Hodge cancellation | Four classes of common scalar h | h+h−h−h=0 | Image lies in Hodge kernel | Retain |
| §3.5 four-class Betti factor | Reduced class x and conjugate transfer −x | x−(−x)=2x | Factor 2 cannot be omitted | Retain |
| §3.5 realizable mod5 kernel | Cyclotomic discriminant 125 | Minkowski bound (4/π)²(24/256)√125=1.699207906388<2; positive ideal norm ≤bound is 1 | Pic=0, Betti value 2·0=0 | Retain |
| §3.5 nonzero 691 kernel | p=691,k=6 | Degree 22; m=11; B₁₂=−691/2730; ζ(−11)=691/32760; gcd of 691 with each denominator is 1 | Nonzero arithmetic instance supported | Locator repair F02 |
| §3.5 coefficient nonvanishing | Nonzero finite p-group A | For A=ℤ/pʳ, A/pA=ℤ/p; every nonzero finite p-group has such a nonzero quotient | Finite-coefficient kernel can be nonzero | Retain |
| §3.5 multiplication in actual instance | Nonzero x killed by 691 | 2x≠0; 346·2x=692x=x | Zero transfer fails | Retain |
| §3.6 negative-degree factors | i=−2,−4 | Conjugation on KU is −1,+1; negative factors ℤ/q,0 | Negative slots differ | Retain |
| §4.1 Γ grading | T={*,a,b}, grades (1,2) | Fold gives 3; send b to * gives 1 | Fiber-sum convention fixed | Retain |
| §4.1 selected factor | T={*} | e=1−1=0; every selected factor 0; unique isomorphism 0→0 | Nerve contractible | Retain |
| §4.1 identity restriction | f=id_T | f* on ℤ^T is id; every grade unchanged | Γ identity law agrees | Retain |
| §4.2 Čech definition | r=0,1,2 | Number of embeddings r+1=1,2,3 | Not r or 2r | Retain |
| §4.2 faces and degeneracies | r=1, repeat degree-zero embedding | Faces recover one embedding each; repeated isomorphism is identity | Dimension vector unchanged | Retain |
| §4.2 zero selected factor | T={*}, ambient genus g>0 | Selected genus 0; ambient genus g | Embedding only selected factor misses ambient data | Retain |
| §4.3 Betti components | g=0,1 | BSp₀=point; Sp₂(ℤ)=SL₂(ℤ); genus completion sends 0,1 to 0,1 in ℤ | Isotropy and grading retained | Retain |
| §4.3 Hodge signs | Degree-two lift with c_H=bott | Tangent character pairing +1; dual-Hodge pairing −1 | Same adapter as §1.1 | Retain |
| §4.4 left conjugation action | Structure maps, σ then τ | σ⁻¹τ⁻¹=(τσ)⁻¹ | Inverse produces the left action | Retain |
| §4.4 discrete versus analytic model | Elliptic j=0,1728 | Two distinct discrete isomorphism components; one analytic genus component | Models not identified | Retain |
| §4.4 completion grading | Genera 0,1,2 | Three distinct grades remain 0,1,2 | Componentwise comparison required | Retain |
| §4.4 p=3 control | g=1 | H₁(SL₂ℤ;F₃)=F₃ from ℤ/12; M(F₃,2) is simply connected | Moore smash precedes comparison | Retain |
| §4.4 conjugation/Betti | Plane and its conjugate | Both underlying integral modules have rank 2 | c_B conjugation invariance agrees | Retain |
| §4.5 finite-genus stabilization | q=5,g=4 | φ(5)=4; CM genus 2; rational factor genus 2 | Bound sufficient | Retain |
| §4.5 zero stabilizer | CM genus 2, rational genus 0 | Result genus 2+0=2; added Betti rank 0 | Unit allowed | Retain |
| §5.1 identity reciprocity | σ=1, identical lifts | Each factor w_τ⁻¹w_τ=1; product 1 | Identity transports trivially | Retain |
| §5.1 conjugation signatures | Gaussian type, σ=c | Translating multiplier −1 changes i/2 to −i/2 | Positivity cannot be required of translator | Retain |
| §5.1 paired lifts | C₃ minus kernel, generator a | cac⁻¹=a⁻¹; aca⁻¹=a²c≠c | Pairing lifts is not centralizing them | Retain |
| §5.1 stable Bott linearity | k=2 | Bott exponent remains 3; degree remains 6 | Transport does not change exponent | Retain |
| §5.2 section equation | V=Λ², π(m,t)=m,s(m)=(m,0) | πs(m)=m; sπ(0,1)=(0,0)≠(0,1) | Correct composite is πs | Retain |
| §5.2 kernel morphisms | Projection M⊕T→M | Induced T→0 is zero; map over M is identity on quotient | Kernel identity not required | Retain |
| §5.2 cocycle law | C₂ sign F₅, α(c,m)=m | α(c²,m)=0=−m+m | Action associative | Retain |
| §5.2 split coordinates | Same module, (m,t)=(2,3) | s(m)+t=(2,3); inverse returns (2,3) | Coordinates mutually inverse | Retain |
| §5.3 relative degree zero | Any pair H≤G | C₀ quotient Λ/Λ=0; if H=G every chain quotient 0 | H₀ and H₁ boundary controls agree | Retain |
| §5.3 cyclic trivial presentation | G=ℤ,H=1,M=ℤ | [r+s]m↦(r+s)m=rm+sm; [0]m↦0 | H₁ relative is ℤ | Retain |
| §5.3 cyclic sign presentation | C₂ sign F₅ | [c²]m=0=[c](−m)+[c]m | Relative H₁=F₅, absolute H₁=0 | Retain |
| §5.3 native inverse action | C₃ acts by 2 on F₇ | FGV boundary 2−1=1; native 4−1=3; native on g⁻¹ gives 1 | Inversion required | Retain |
| §5.3 degree-one chain isomorphism | S₃ permutation F₅³, all 18 basis inputs | d_native T−T d_FGV=0, T²−id=0 and d²=0 on each | Nonabelian comparison agrees | Retain |
| §5.3 degree-two chain isomorphism | Same, all 108 basis inputs | All three differences 0 on each input | Product reversal correct | Retain |
| §5.3 degree-three chain isomorphism | Same, all 648 basis inputs | All three differences 0 on each input | Signs +,−,+,− agree | Retain |
| §5.3 nonabelian cocycle | Transposition s, 3-cycle r; a(g,m)=(1−sgn g)m/2 | a(sr,1)=1=1+0; a(s²,1)=0=−1+1 | Noncommuting inputs obey relation | Retain |
| §5.4 universal action | C₂ sign F₅ | c(m,t)=(−m,t+m); c²(m,t)=(m,t) | Correct extension action | Retain |
| §5.4 section distinction | Same universal object | Section (m,2m) is equivariant: −2m=m+2m mod5; differs from (m,0) for m=1 | Section data matter | Retain |
| §5.4 Hom/Ext vanishing control | Λ=ℤ/9,M=ℤ/3 sign C₂ | c−1=−2 invertible; H₀=H₁=0 although M not Λ-projective | No projectivity restriction inserted | Retain |
| §5.4 initiality obstruction | Nonzero kernel T | Identity acts on T as id; endomorphism from a global section acts on T as 0 | Global splitting contradicts initiality | Retain |
| §6.1 conjugation eigenspaces | q=5,T⊕M | c(t,m)=(t,−m); (1+c)/2=(t,0); (1−c)/2=(0,m) | Section is negative eigenspace | Retain |
| §6.1 arithmetic action boundary | σ fixes H_q | Reciprocity p-class difference 0 modq; Hodge difference 0 | Detected generator difference 0 | Retain |
| §6.2 relative universal cocycle | σ=c; k=2,χ(σ)=2 mod5 | α(c,m)=0=[c]m; general quotient weight 2³=3, not 2²=4 | Relative relation and twist agree | Retain |
| §6.3 kernel inclusion | q=5 | (1/2)H=3H; c_B3H(x)=6x=x | Factor normalization correct | Retain |
| §6.3 zero kernel | q=3,k=1 | Arithmetic kernel 0; extension F₃(1)→F₃(1) identity | Initial zero-kernel case | Retain |
| §7.1 completed relative kernel | Γ=C₂,H=1, sign ℤ_p | H₁ relative ℤ_p; modpⁿ gives ℤ/pⁿ, not 0 | Relative completion retained | Retain |
| §7.1 trivial group | Γ=H=1,M=ℤ_p | Relative kernel 0; initial object M | No free extra summand | Retain |
| §7.1 continuous trivial coefficients | Γ=ℤ_p,H=1 | Completed H₁=ℤ_p; finite quotients yield ℤ/pⁿ | Tower values agree | Retain |
| §7.1 finite-free reduction | Split Λ_p²→Λ_p | Reduction kernel Λ_p/pⁿ; Tor₁(Λ_p,Λ_p/pⁿ)=0 | Reduction exact | Retain |
| §7.2 p-adic universal sequence | p=3,k=1 | 0→0→ℤ₃(1)→ℤ₃(1)→0 | Hodge map is identity in this coordinate | Retain |
| §7.3 local pair | q=3 | G_q=D_q=⟨c⟩=C₂; both relative H₁ groups 0 | Local comparison agrees | Retain |
| §7.3 c-fixed primes | Odd torsor of size 3 | Involution orbits sizes 1 or 2; at least one orbit has size 1 | Existence not uniqueness | Retain |
| §7.4 local section | p=3,k=1 | Kernel 0, local section id_ℤ₃(1) | Local sheaf interpretation agrees | Retain |
| §7.5 all-integer twist | q=5,k=0 and 2 | Twists −1,3 congruent mod4; degrees −2,6 differ by 8 | Finite compatible period | Retain |
| §7.6 odd-degree trivial action | k=1,p=3,5 | K₃(ℤ) primary groups ℤ/3,0; rational unit Betti factor 2 is a unit in both | Includes zero case | Retain |
| §7.6 restriction comparison | p=3,k=1,ℓ=2 | 2²−1=3; local and global groups ℤ/3; wrong exponent gives 2−1=1 and 0 group | Twist 2 required | Retain |
| §7.6 auxiliary-prime boundary | p=3,ℓ=19; p=5,ℓ=2 | 19²−1=360 has v₃=2, gives ℤ/9 rather than global ℤ/3; 2²−1=3 is a 5-unit | Generator hypothesis necessary | Retain |
| §7.7 Vandiver torsor | C₃ minus, plus, zero groups | c-fixed counts 1,3,1; total prime counts 3,3,1 | Fixed-prime uniqueness differs from regularity | Retain |
| §8.1 indecomposable definition | Point | I=0,D=0,Q=0 including degree zero | Unit excluded | Retain |
| §8.1 product denominator | S¹×S¹ | Q₁=ℤ_p²; product a b maps to 0 in Q₂ | Positive-factor condition correct | Retain |
| §8.1 Bockstein denominator | RP∞, p=2, degrees 1,3,5,7 | Q_i=ℤ/2,ℤ/2,0,ℤ/2; quotient by integral products alone retains degree 5 | Enlarged denominator necessary | Retain |
| §8.2 product/Tor law | Two K(ℤ/p,1) factors, degree 3 | Mixed Tor=ℤ/p before quotient; representative β₁(xy) maps to 0 | Product quotient removes Tor | Retain |
| §8.3 Hurewicz range | p=3,E=ΣHℤ | Range 1≤i≤3; degree-one map ℤ₃→ℤ₃ sends 1 to 1; first omitted degree 4 | Endpoint not asserted | Retain |
| §8.3 torsion factor | p=3,E=ΣH(ℤ/3) | Degree-one map ℤ/3→ℤ/3 sends 1 to 1 | Torsion case retained | Retain |
| §8.3 excluded finite type | E=ΣH(ℤ_p discrete) | π₁=ℤ_p, not finitely generated over ℤ; ordinary tensor differs from completed coefficient | Hypothesis excludes input | Retain |
| §8.4 stability | i=0,2 | Strict bound gives minimal genera 6,10; H₀ stabilization is id_ℤ | Conservative bound agrees | Retain |
| §8.4 Hurewicz degree zero | BSp∞, i=0 | H₀=ℤ_p, Q₀=0 | Isomorphism starts at i=1 | Retain |
| §8.4 application range | (p,m)=(3,1),(5,3),(5,4) | 2≤3,6≤7,8>7 | Last case excluded | Retain |
| §8.4 tangent Hodge pairing | Odd m, c_H-image bott^m; even m=2 | Normalized/raw pairings 1,−1 in odd case; negative ku factor and both pairings 0 in even case | Sign and parity agree | Retain |
| §8.5 rational generators | Degrees 0,2,4; χ=2 over ℚ₅ | Bases 1,x₂,x₂²; eigenvalues 1,1/2,1/4; homology weights 1,2,4 | Cohomology has inverse character | Retain |
| §8.6 Bernoulli divisibility control | Partition (11),p=691 | B₁₂=−691/2730; v₆₉₁(11!)=0; 22≤1379 | Integral safe-range pairing available | Retain |
| §8.6 prime inequality | Part 3,p=3 | ch₃(L)=c₁³/6; v₃(6)=1 | Equality case excluded | Retain |
| §8.6 empty partition | d=0 | Empty characteristic product integrates to 1; no divisible Bernoulli factor exists | Antecedent false | Retain |

The S₃ rows were recomputed by finite enumeration of the native inverse-action differential, the displayed left-coefficient differential, reversal/inversion, and their squares. No generated code or source extraction was added to the package. All other arithmetic values in the changed 691 Check were recomputed, including primality of 691, the two denominator gcds, the degree and twist, and 346·2≡1. Every altered sentence is a locator or coverage correction to those same statements.

## Maintainer disposition

F02 and F03 are repaired and validated. F01 remains for the human decision required by the repeated-non-actionable rule; the proposed local specialization has positive mathematical evidence above. No downstream Lean name or section identifier changed. The pending contract’s ownership, and its deletion or replacement, are the only unresolved finding from this review.
