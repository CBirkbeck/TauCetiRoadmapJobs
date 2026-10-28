<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1169#issuecomment-6398441562 -->
Review (codex) of 6d65613

Verdict: accepted
Conditional on the announced gaps: `derived-localization-completion-square`, `poincare-change-of-rings-criterion`, `quadratic-extension-witt-exactness`

No package findings: 0 P1, 0 P2, 0 P3. Acceptance is conditional on the three declared supplier contracts: `derived-localization-completion-square`, `poincare-change-of-rings-criterion`, and `quadratic-extension-witt-exactness`. No mathematical or acceptance-file change is requested.

## Previous findings: repair verification

The five findings of round 2 were checked individually before the new pass. None was marked not actionable by the repair report.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01: missing finite-field Arf headline | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:160`: “The completeness theorem `arf_trace_classifies` states that for any finite field k of characteristic two with its 𝔽₂-algebra structure”. `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean:47` now states it. The six symplectic conditions, independent dimensions, and actual quadratic-Lagrangian conclusion survive elaboration. Computations below test both implications. |
| F02: inconsistent headline inventory | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:3`: “Explicit Witt arithmetic over ℚ₂ supplies the input to Layer 5.” `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean:32`: “The Dedekind quadratic/symmetric completion pullback, field L-computations, generic sign shifts and the integer L-tables are consumed”. The presentation remains an arithmetic input; the pullback remains ArithmeticKTheory's. |
| F03: stale dependencies in Layer 5 | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:535`: “the Mathlib cyclotomic declarations in the exact supplier contracts, fraction fields and completions; §2.1.” Lines 551 and 604 explicitly name `IsCyclotomicExtension.Rat.Three.Units.mem`, `IsCyclotomicExtension.Rat.three_pid`, and `ClassGroup.equivPic`. All exist at the pin and supply the stated inputs. |
| F04: ineffective imperfect-residue Check | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:412`: “Thus the parity quotient is (ℤ/2)²/Δ≃ℤ/2, with nonzero class (1,0), and A(R)≠0.” Discriminant 17 is a unit; reduction has two simple roots; the two residue fields are 𝔽₂(t). This produces a nonzero obstruction outside finite/perfect residues. |
| F05: notation and identifier formatting | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:175`: “Regularity is perfectness of Mathlib `QuadraticMap.polarBilin`, rather than `QuadraticMap.associated` in characteristic two.” The repaired residue, completion, quotient and Eisenstein passages consistently use ℤ, ℚ₂, ℤ₂ and 𝔽₂/𝔽₄. No mathematical change was smuggled into these replacements. |

The repaired patterns were sought throughout both files: no additional statable headline was misclassified as unavailable, no stale Layer-5 units/Picard dependency remains, no other Check purports to demonstrate the imperfect-residue obstruction using a zero target, and the reported ASCII notation does not recur outside code. The round-1 repairs recorded in round 2 also remain present: no removed padding has returned, the transfer kernel/image are distinguished, and the three gap contracts retain their hypotheses.

## Verified sound

Read all 23 numbered subsections, their APIs, Checks, examples and 23 `Needs` lines, the six layer dependency summaries, conventions, ownership contracts, metadata and source manifest. Reviewed the changed mathematical passages anew. For unchanged subsidiary API assertions, used round 2 only where its adversarial row contained computed values; all 15 seeded targets and the headline results were independently reconsidered here. The tables below contain the new computations and explain the inherited comparisons.

The package develops the general library: arbitrary Dedekind domains, arbitrary dyadic residue fields where asserted, ramified primes, and general complete associative rings in the lifting/rigidity statements. Restrictions to number fields and finite fields are explicit. Nondyadic localization is accompanied by the general dyadic theory and a counterexample to extending that particular fibre sequence across two; it is not a bypass of dyadic theory. No computational algorithm is proposed as a mathematical target. No copied source passage, suspicious attempt to redirect the review, route-specific replacement carrier, upward dependency or duplicate acceptance name was found.

### Source verification

All seven works cited by the package have existing manifest keys: four readable cached texts and three settled uncertified books/papers. No source entry was changed or added, and no settled text was requested again. Source lines below refer to the supplied numbered extractions. Page numbers are printed pages; Wall's PDF page 3, for example, is printed p.426. Its anti-structure formulas, omitted by text extraction, were also read from the cached PDF rendering.

| Seeded target | Locator actually read | Support and hypotheses |
| --- | --- | --- |
| 0.1 Integral Witt comparison | CDHHLMNNS-III-v4 line 1896, proof of Proposition 2.3.1, p.41; line 2050, proof of Proposition 2.3.9, p.44 | Symmetric degree zero uses the Dedekind surgery hypotheses; quadratic degree zero uses the general comparison. Full polar/half diagonal are inverse only when two is invertible. The roadmap separates these assertions. |
| 0.3 Second residue | CDHHLMNNS-III-v4 lines 1690–1704, Lemma 2.2.2, p.37; lines 1840–1869, Lemma 2.2.9 and Remark 2.2.10, pp.40–41; lines 1793–1798, Remark 2.2.6, p.39 | Nonzero prime, residue duality line, shift −1, uniformizer coordinate, unit vanishing and ramified comparison are retained. The dual-generator coefficient differs by a square only. |
| 0.4 Finite Arf coordinate | CDHHLMNNS-III-v4 lines 2095–2096, proof of Corollary 2.3.10, p.45; lines 2113–2115 and 2160–2163, Examples 2.3.13–14, p.46 | The source states the finite-characteristic-two Arf isomorphism. The explicit absolute-trace expression and extension-degree law are derived in the roadmap; they are not falsely attributed as displayed formulas in the source. Artin–Schreier image/trace-kernel and basis computations below verify the derivation. The quadratic arrow in Example 2.3.14 needs the stated correction. |
| 1.2 Local and global residue diagrams | CDHHLMNNS-III-v4 lines 1899–1905 and 1919–1932, Proposition 2.3.1/Corollary 2.3.2, pp.41–42; lines 1960–1965, Remark 2.3.5, p.42 | DVR surjectivity does not require completeness or finite residue field. Pic/2 is the global-field result. Scharlau's primary locator remains uncertified; the paper explicitly attributes the function-field extension to it. |
| 2.1 Dyadic completion | CDHHLMNNS-III-v4 lines 2068 and 2087–2094, proof of Proposition 2.3.9(ii) and Corollary 2.3.10, p.45 | The product decomposition is used there. The package gives the general CRT/cofinal-powers proof, retaining ramification exponents, projections, and the empty product. No finite-residue hypothesis enters that proof. |
| 2.2 Arithmetic fracture | CDHHLMNNS-III-v4 lines 1976–1994, Proposition 2.3.6, p.43; CDHHLMNNS-II-v5 lines 5250–5274, Proposition 4.5.5, pp.108–109 | General associative rings and invertible coefficients are allowed. Both K₀-image controls, derived/ordinary completion comparison, and the Tate condition are present. The localized completed coefficient is rational: primes dividing ℓ become invertible upon localization, and the others were units in the completion. |
| 2.3 Quadratic isometry lifting | Wall-1970 lines 76–95, definitions, pp.426–427; line 104, Lemma 1, p.427; lines 132–164, Theorem 2 and proof, pp.428–429; CDHHLMNNS-III-v4 lines 2002–2015 | Right projectives, α-stable ideal, complete separated topology, the specific anti-structure and nonsingular bilinearisation all agree. The source explicitly obtains an automorphism reducing to the identity; lifting a prescribed residue isometry first uses projectivity/Nakayama. |
| 2.4 Complete quadratic rigidity | CDHHLMNNS-III-v4 lines 2000–2022, Proposition 2.3.7, pp.43–44 | The all-degree conclusion uses the degree-one vertical-kernel comparison, not just lifting of forms. Both signs and standard ring duality are retained. Wall-1973 is uncertified, with its precise role readable at lines 2019–2021. |
| 3.3 Dyadic parity obstruction | CDHHLMNNS-III-v4 lines 2099–2109, Remark 2.3.12, pp.45–46 | Rank parity kills the quadratic image and makes the global image diagonal. The argument does not use finite or perfect residues. The new two-prime example verifies the extension in generality. |
| 3.4 Quadratic localization | CDHHLMNNS-III-v4 lines 2206–2216, Remark 2.3.15, p.47; lines 1807–1818, Remark 2.2.8, pp.39–40 | Nondyadic primes, valuation overrings and unchanged two-adic completion match. The example with the prime two confirms why this localization assertion has its stated restriction. |
| 4.1 Dyadic Witt coordinates | CDHHLMNNS-III-v4 lines 2118–2124, Example 2.3.13, p.46; lines 2175–2182, Example 2.3.14, p.47 | Group order and restriction ideal agree. The source's annihilator generator is wrong; the roadmap's replacement and multiplication formula pass all 32 coordinate tests. |
| 4.2 Integral signature | CDHHLMNNS-III-v4 lines 2110–2116, Example 2.3.13, p.46; lines 2525–2556, §3.2 introduction, pp.54–55 | Signature/8, symmetrization by eight, E₈ generator, and its zero Arf reduction are stated there. The 136-zero calculation is reproduced independently. |
| 5.1 Eisenstein dyadic place | CDHHLMNNS-III-v4 lines 2150–2157, Example 2.3.14, p.46 | The result is correct, but the source's discriminant-only inertness argument is incomplete. The roadmap supplies irreducibility modulo two, agreeing with the pinned cyclotomic inertia and ramification formulas. |
| 5.2 Eisenstein symmetric Witt group | CDHHLMNNS-III-v4 lines 2158–2159, Example 2.3.14, p.46 | The stated group is ℤ/4. The roadmap supplies its proof using global classification, the six-unit list, and reciprocity; none of these is inferred from a discriminant test alone. |
| 5.3 Unramified restriction | CDHHLMNNS-III-v4 lines 2168–2182, Example 2.3.14, p.47 | Common uniformizer and symmetric residue comparison are correct. Restriction kernel and transfer image are different groups. The principal-ideal/annihilator input is explicitly the declared gap, with Lam's settled locator; the corrected generator is independently tested. |

Also re-read CDHHLMNNS-III-v4 lines 1936–1959 (characteristic-two divisor argument), 2023–2029 (henselian extension), 2031–2096 (total cokernel and number-field table), 2183–2205 (the corrected Eisenstein table), and 2226–2249 (Lagrangian descent and characteristic-two polarisation). CMM lines 892–894 (Theorem 3.15, p.21) and 1659–1674 (Remark 5.6, p.39) support the smooth-lifting/approximation route at the stated generality. The general-functor consequence is explicitly explained in CDHHLMNNS-III-v4 lines 2024–2029; no finite-coefficient K-theory statement is silently substituted for integral L-theory.

### Adversarial mathematics

Exact rational arithmetic used the pinned normalized ℚ₂ Hilbert formula. Equality of Witt classes was tested by hyperbolicity of q⊥−q′, using its even dimension, signed determinant square class and Hasse invariant; no coordinate equality was assumed in the test. Finite-field tests independently searched for linearly independent isotropic orthogonal generators of the required Lagrangian. These calculations are review witnesses, not proposed implementation algorithms.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Perfect-polar convention | Rank zero; ℤ pairing 2xy; 𝔽₂ square line | Adjoint 0→0 invertible; cokernel of multiplication by 2 is ℤ/2; polar of x² is 0 on dimension 1 | Correct inclusion/exclusion | None |
| Sign shift and difference map | Negative-sign ℤ degrees 2,0; identity pair (1,1),(2,1) | Positive degrees 0,−2 give ℤ,0; differences 0,1, whereas sums give 2,3 | Conventions agree with suppliers | None |
| Bilinear/native quadratic convention | ℚ, b(x,y)=xy | Polar of x²/2 is xy; polar of x² is 2xy; factor is ⟨2⟩, nonsquare over ℚ₂ | Additive inverse and unital ring comparison distinguished | None |
| §0.1 σ and projective generality | Arf-one 𝔽₂ plane; I=(2,1+√−5) | Quadratic coordinate 1 maps to alternating symmetric class 0; I²=2R, so xy/2 gives I≃I∨ on a nonfree projective | General carrier needed | None |
| §0.2 injection and char-two σ | ℤ⟨1⟩; R=K; q=xy over 𝔽₂[t] | Signatures 1→1; identity; polar Witt class 0 while symmetric unit parity is 1 | Both assertions pass | None |
| §0.3 second residue | ℤ_(2): ⟨3⟩,⟨2⟩,⟨4⟩; ℤ_(3): ⟨6⟩ | 0,⟨1⟩,0; ⟨2⟩, with squares in 𝔽₃× equal to {1} | Unit, odd valuation and square invariance agree | None |
| §0.3 coordinate/base-change conventions | ⟨5⟩ with π=5,10; ℤ→ℤ[i], coefficient 2 | Coordinates ⟨1⟩,⟨3⟩ since 2⁻¹=3 mod 5; 2=−i(1+i)² has even valuation, giving residue 0 versus 1 for unweighted extension | Correct transformations | None |
| §0.4 Arf coordinate, binary classification | All coefficient pairs of ax²+xy+by² over 𝔽₂ and 𝔽₄ | 16 and 256 comparisons: trace equality and quadratic Lagrangian existence agree in all 272; true in 10 and 136 cases, respectively | Both implications pass | None |
| §0.4 Artin–Schreier input | 𝔽₂ and 𝔽₄ | Image of z²+z equals trace kernel: {0} and {0,1}, respectively | Correct solvability criterion | None |
| §0.4 basis independence | All symplectic bases of xy over 𝔽₂ and 𝔽₄ | 6 and 60 bases; raw sums {0} and {0,1}; trace sums {0} in both fields | Raw sum would be wrong | None |
| `arf_trace_classifies`, boundary dimensions | Zero vs zero; zero vs xy; zero vs 𝔽₂ Arf-one plane; q vs itself | 0=0 and 2·0=0; 0=0 and vanishing line of dimension 1; 0≠1 and no vanishing line; diagonal q(x)+q(x)=0 and 2 dim V=dim(V×V) | Unequal/zero dimensions and basis-independence specialization pass | None |
| §0.4 extension law and surjectivity | 𝔽₂→𝔽₄, 𝔽₂→𝔽₈; coefficient ζ in 𝔽₄ | Tr(1)=0 and 1, matching degrees 2 and 3 mod 2; Tr(ζ)=ζ+ζ²=1; q(ζ,1)=0 for coefficient 1 | Even/odd extensions and both coordinates distinguished | None |
| §1.1 characteristic-two table | 𝔽₂[t], 𝔽₂(t), 𝔽₂[t,t⁻¹] | Pic/2=0; odd groups 0; residue of ⟨t⟩ is parity 1 before inversion and has no t-coordinate afterward | Consistent with divisor route and prior computed row | None |
| §1.2 DVR/global tables | ℤ_(2), ℤ_(3), 𝔽₂[[t]]; ℤ, 𝔽₃[t] | Local degree-one groups ℤ/2,0,0; global residues (ℤ,ℤ/2,0,0) and (Ws,0,0,0) | Correct degrees and characteristic distinctions | None |
| §2.1 completion decomposition | ℤ, ℤ[i], ℤ[ζ₃] | One factor each, residue degrees 1,1,2 and ramification exponents 1,2,1; Gaussian exponents 2m are cofinal | Factors are not counted by ramification | None |
| §2.1 empty factors and maps | ℤ[1/2], ℚ, ℤ_(3); split two-factor completion | Each R/(2^m)=0 and limit 0; maps x↦(0,0),(0,1) have equal first and unequal second projections | Empty product and all-projection extensionality correct | None |
| §2.2 fracture | (ℤ,1),(ℤ/4,2),(ℤ,2) | (C,R[1/ℓ])=(0,ℤ),(ℤ/4,0),(ℤ₂,ℤ[1/2]); overlaps 0,0,ℚ₂; each square has the claimed degeneration | Completion hypotheses retained | None |
| §2.2 control | Even-Euler subcategory of Dᵇ(k) | K₀ image 2ℤ, quotient ℤ/2, class k[0]=1 outside image | Dense does not mean uncontrolled | None |
| §2.3 anti-structure and lifting | General α,u; ℤ₂ xy; square-zero J | T²φ=α(u)α²(φ)u=φ; polar matrix [[0,1],[1,0]] has determinant −1; correction error J²=0 | Right-module order and quadratic correction agree with Wall | None |
| §2.3 negative controls | Arf-one vs hyperbolic; symmetric lines 1,3 | Residue Arf 1≠0; 3 mod 8 is 3 whereas odd squares are 1, despite equal residue symmetric lines | Wrong symmetric lifting is excluded | None |
| §2.4 complete rigidity | ℤ₂→𝔽₂; 𝔽₂[ε]/ε²→𝔽₂; J=0,J=R | Quadratic residues (ℤ/2,0,ℤ/2,0) on both sides; identity for J=0; separated completeness forces R=0 for J=R; symmetric orders 16≠2 | All-degree quadratic assertion and negative control consistent | None |
| §2.5 henselian rigidity | (ℤ₂,(2)), square-zero pair, J=0 | Same quadratic residues as §2.4; (2)^m≠0 for all m; identity when J=0 | Nilpotence is unnecessary; matches prior computed row | None |
| §3.1 two-image quotient | D=ℤ/4; images (2D,0),(D,0),(0,D) | Quotient orders 2,1,1; first case kills representatives 0,2; an intersection quotient would have order 4 | Sum, zero criterion and factorization agree | None |
| §3.2 number-field table | ℤ, ℤ[1/2], ℤ[ζ₃] | d=1,0,1; degree-two groups ℤ/2,0,ℤ/2; A=0,0,ℤ/4 | Finiteness and non-split-extension formulation consistent | None |
| §3.3 parity | d=0,1,2,3 | Target orders 1,1,2,4; at d=2, (1,0) is outside {(0,0),(1,1)}; at d=1 Eisenstein A still has order 4 | No invalid converse or natural subtraction | None |
| §3.3 new imperfect/infinite example | A=ℤ[t]_(2), R=A[(1+√17)/2] | Discriminant 17; mod-two roots 0,1, derivative 1 at both; d=2, parity quotient order 2; v_t(t)=1 versus even valuation for squares in 𝔽₂(t) | Finite étale domain is Dedekind and both residues are imperfect | None |
| §3.4 localization | S=∅,{(3)},{(2)} in ℤ; infinite S | Identity with residue 0; unchanged C=ℤ₂ and residue 𝔽₃; dyadic variant would force ℤ/2=0 in degree 2; a direct-sum element has finite support | Scope and negative Check correct | None |
| §4.1 additive presentation | All 32 triples (a,b,e) | 496 unequal pairs remain unequal; 8u=0, 4u≠0, 2v=2c=0; c=⟨1,−5⟩, ⟨1,−3⟩=2u+c | Presentation and quotient coefficient conventions pass | None |
| §4.1 multiplication/ideal/annihilator | All 32 triples | c(au+bv+ec)=ac+4bu in 32/32 tests; image {0,c,4u,c+4u}; kernel a even,b=0, eight triples; cv=4u≠0,c²=0 | Corrects source generator | None |
| §4.2 E₈ refinement | All 256 binary vectors; roots and edges | Gram determinant 1; zeros 136=128+8, ones 120; q(eᵢ)=1, q(eᵢ+eⱼ)=1 for an edge, polar 1 mod 2; signature 8 and quadratic invariant 1 | Actual refinement has Arf 0 | None |
| §4.3 integral dyadic comparison | u,c,v; polar [[2,1],[1,2]] | Residues 0,0,1, hence kernel order 16; polar diagonal ⟨2,3/2⟩ equals c+4u; u and c+4u generate all 16; A(ℤ)=0 | Integer example and both images agree | None |
| §5.1 completion and unit inputs | t²+t+1; t²+t+2; norm a²−ab+b² | Values at 0,1 mod 2 are (1,1) and (0,0); e=1,f=2 in Eisenstein case; six norm-one pairs and unit square quotient of order 2 | Inertness distinguished from unramifiedness | None |
| §5.2 symmetric Eisenstein group | 0,u,2u,3u; 4u | (parity,signed determinant)=(0,1),(1,1),(0,−1),(1,−1); −1 nonsquare in E, while Hamilton invariant is killed by degree 2; order u=4 in K and E | Exactly four integral classes | None |
| §5.3 restriction/transfer | a=−3, λ(1)=0,λ(s)=1 | Ideal order 4, annihilator order 8; integral image order 16/4=4; symmetric residue map 1↦1 identifies integral and field kernel/cokernel | Kernel and cokernel not interchanged | None |
| §5.4 quadratic Eisenstein map | 𝔽₂ Arf-one plane; q=x²+xy+ζy² | Old coordinate Tr(1)=0; new coordinate Tr(ζ)=1; signed determinant 3−2s has norm 21≡5 mod 8; determinants of 0,2u have square norm 1 | Old map zero; new order-two image disjoint from ⟨u⟩ | None |
| §5.5 transfer, obstruction and final tables | Displayed four-by-four matrix and Eisenstein PID | Determinant 21; diagonal ⟨1,−1,4,−21/4⟩ has Witt class c; ann(c)/⟨c⟩=ℤ/4; Pic/2=0; Wq=0; tables (ℤ/4,ℤ/2,0,0) and (0,0,ℤ/2,ℤ/4) | Corrected source table verified | None |
| Derived-completion gap | (ℤ,1),(ℤ/4,2),(ℤ,2) | Ordinary and derived completions 0,ℤ/4,ℤ₂; bounded torsion makes the negative homology tower pro-zero | Precise general contract | None |
| Poincaré criterion gap | Central integer powers; identity map; m=±∞ | Ore commutators 0; identical right-multiplication cofibres for identity; endpoint Tate condition empty | All five conditions retained | None |
| Quadratic-extension gap | ℚ₂⊂ℚ₂(√−3) | Multiplication by c has image order 4, kernel order 8; restriction kernel order 4, transfer image order 8 | Exact sequence distinguishes the two groups | None |

The general statements exclude the wrong inputs explicitly: zero rings are treated separately from fields; finite fields cannot be inseparable extensions; full polar perfectness excludes characteristic-two square lines; field scalar extensions used by the native Witt ring have two invertible; local classification includes its topology and valuation; arbitrary residue fields are allowed only where the proof does not use a finite-field coordinate. There is no assertion about arbitrary nonabelian groups: the quotients here are explicitly additive abelian Witt groups. Finite support, integer homotopy degrees, empty products, and the condition d≥1 on the exponent formula avoid the relevant total-function boundary errors.

### Library and ownership audit

The manifest and installed checkouts agree on Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Definitions and hypotheses below were opened at those pins, not inferred from declaration names.

| Pinned file and line | Declaration/object and actual content |
| --- | --- |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:149`, `:160`, `:317` | `QuadraticMap` has scalar-square homogeneity and a bilinear companion; `QuadraticForm` is `QuadraticMap R M R`; `polarBilin` is the full polar. None includes finite projectivity or nonsingularity. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:628`, `:1056`, `:1410`; `IsometryEquiv.lean:46` | `proj` is the product of two coordinates, `Anisotropic` means q(x)=0 implies x=0, `weightedSumSquares` is the diagonal form, and `Equivalent` is existence of an isometry equivalence. These are used, not rebuilt. |
| `Mathlib/LinearAlgebra/QuadraticForm/Prod.lean:55` | `prod` has body `Q₁.comp (LinearMap.fst _ _ _) + Q₂.comp (LinearMap.snd _ _ _)`. Thus the Lean conclusion really uses q⊥q′. |
| `Mathlib/RingTheory/Trace/Defs.lean:70`; `Mathlib/FieldTheory/Finite/Trace.lean:37`, `:49` | `Algebra.trace` is trace of multiplication; `FiniteField.trace_to_zmod_nondegenerate` and `FiniteField.algebraMap_trace_eq_sum_pow` provide finite-field trace nonvanishing and the Frobenius-sum formula. Finite fields here are finite-dimensional and separable over 𝔽₂. |
| `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:38`, `:127` | The quadratic tensor/base-change definition is inside the invertible-two section. Line 158 supplies uniqueness if an extension already exists, not a characteristic-two construction. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:171`, `:364`; `Algebra.lean` | `AdicCompletion` is the subtype of compatible quotient sequences; `of` is the canonical map. The definition alone is not a completeness theorem for arbitrary ideals. The package uses finitely generated ideals. |
| `Mathlib/RingTheory/Ideal/Quotient/Operations.lean:325` | `Ideal.quotientMulEquivQuotientProd` requires coprimeness and returns a ring equivalence. The package separately supplies cofinality and projection compatibility. |
| `Mathlib/RingTheory/ClassGroup/Basic.lean:347`, `:353`; `Mathlib/RingTheory/PicardGroup.lean:876` | `ClassGroup.mk0_surjective`, `ClassGroup.mk_eq_one_iff`, and `ClassGroup.equivPic` supply the divisor-class and Picard comparisons. The last is an equivalence for a commutative domain. |
| `Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:126`; `Cyclotomic/PID.lean:34`; `Cyclotomic/Three.lean:50` | The conductor-prime integral-closure theorem, `three_pid`, and `Three.Units.mem` give the Eisenstein ring, PID and six-unit list under their cyclotomic/number-field hypotheses. |
| `Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean:291`, `:311` | `inertiaDeg_eq_of_not_dvd`, `ramificationIdx_eq_of_not_dvd`: p=2 does not divide conductor 3; order of 2 mod 3 is 2 and e=1. |
| `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Basic.lean:186`; `Witt/Ring.lean:218`, `:288`, `:386` | `regularFormSetoid`, `WittRing`, `wittClass`, `WittRing.dimMod2`. The field Witt quotient requires `[Invertible (2 : K)]`; its unit is the coefficient-one line. It supplies neither integral nor characteristic-two Witt carriers. |
| `TauCeti/LinearAlgebra/QuadraticForm/Witt/BaseChange.lean:211`; `Transfer/Witt.lean:147`, `:186` | `WittRing.baseChange`, `WittRing.scharlauTransfer`, `scharlauTransfer_baseChange_mul`. Transfer assumes a finite-dimensional field extension and a nonzero linear functional. These maps do not assert the missing quadratic-extension exact sequence. |
| `TauCeti/NumberTheory/LocalField/QuadraticForm/PadicTwo.lean:150`; `Classification.lean:46`, `:129` | `hilbertSymbol_padicTwo` has unit decompositions as hypotheses. `RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` retains Field, ValuativeRel, topology, nonarchimedean-local-field and invertible-two assumptions. It compares equal-rank form classes, so the review recomputed invariants after stabilization. |
| `TauCeti/RingTheory/DedekindDomain/AdicValuation/Completion.lean:367`, `:434` | `isAdicComplete_adicCompletionIntegers`, `residueFieldEquivAdicCompletionIntegers`: complete valuation integers and residue equivalence for general Dedekind primes; finite residue cardinality is not required. |

Object searches covered forms/polars, Arf and Lagrangians, Witt transfer/restriction, residue maps, total cokernels, completion/fracture, and the Eisenstein groups. The exact new declaration name `arf_trace_classifies` has no match on main or at any indexed open roadmap head. Native `Transfer/QuadraticExtension.lean` gives trace-form diagonalizations, not the restriction/transfer exact cyclic sequence. Generic trace, quotient and completion infrastructure is imported; the roadmap supplies their arithmetic identifications.

Main-branch GlobalQuadraticForms and QuadraticFormInvariants were also read as shape examples. Existing-roadmap revisions were not used as suppliers in place of main. The tool's citation resolver reported main `e9512ca` and 362 indexed heads, with no missing cross-roadmap citation or name; its warning that external Lake declarations were not checked on its host was addressed by the pinned inspection above. The local content checkout was also read directly for main-roadmap suppliers; the corresponding inspected sections agree. In particular, IntegralLattices was checked on main, rather than using its differing open revision.

| Supplier resolved now | Sections/declarations actually opened and ownership boundary |
| --- | --- |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` at its supplied open head | §§6.2–6.5 give exact forms and Witt quotients; §6.8a, especially the norm symmetrization and stable-localization/fundamental-square paragraphs around lines 3394–3408, gives Poincaré structures, colimits and L-theory; §§6.9.1–6.9.3 around lines 3481–3498 give residue lines, valuation overrings and localization; §6.10a around lines 3582–3604 gives integer tables and invariant maps. Part II extends these through explicit arithmetic and general rigidity. |
| `TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md` and `Suggested.lean` at their supplied head | §1.6 `bordism_invariant_periodicity`; §3.4 strict metabolic quotient; §§4.5–4.6 degree zero and controlled surgery; §6.6 low-dimension surgery; §7.9 field groups and the 𝔽₂ Arf construction. Suggested.lean's `arfInvariantF2_eq_sum` and `arfInvariantF2_classifies` remain 𝔽₂-only. Part II's absolute-trace theorem has genuinely wider finite-field scope. |
| `TauCetiRoadmap/ArithmeticKTheory/README.md` at its supplied head | §§1.1–1.3 localizations/Picard/Steinitz; §2.2 inverse ideal-class convention; §3.5 lines 1215–1239 Witt injection, both Dedekind tables, the exact degree-three extension, global Pic/2 and the completion square with actual maps. The package consumes these; it does not acquire ownership of the tables by restating examples. |
| `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` at its supplied head | §1.7, lines 286–300: perfect-characteristic-two symmetric comparison and rank parity, with the unit preserved under extension. It supplies no quadratic extension-degree law. |
| `TauCetiRoadmap/QuadraticFormInvariants/README.md` on main | Layers 4, 6, 9, beginning at lines 1218, 1480, 2679: field Witt theory, local classification, Scharlau transfer. Its scope at line 58 excludes characteristic two. Its transfer API does not already give the declared exact cyclic sequence. |
| `TauCetiRoadmap/GlobalQuadraticForms/README.md` on main | §4.4 line 443: Hilbert product formula; §§8.1–8.3 lines 873–909: number-field classification, hyperbolicity and global-to-local Witt injection. Rank zero is handled separately. No global-function-field claim is imported from here. |
| `Completed/IntegralLattices/README.md`; `TauCetiRoadmap/IntegralLattices/README.md` on main | Completed Layers 1–5, especially the E₈/positive Cartan and glue discussion at lines 148–150 and 382–395; current milestones 1I/1L, including lines 728–745, give signature divisibility. E₈ modulo-two half-norm is the new arithmetic computation, not a second lattice construction. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md` on main | §§0.14,0.15,0.21, lines 1068,1090,1394 onward: henselian smooth lifting, Noetherian regular-map Popescu approximation and excellence/completion inputs. The roadmap's reduction to finite-type henselizations retains those hypotheses. |
| `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md` at its supplied head | §§11.3–11.4, lines 2614–2653: dense subcategories classified by their K₀ image; §11.15 line 2849 onward: ordinary nonconnective localization. Controls are not erased merely by density. |
| `TauCetiRoadmap/StableHomotopyKTheory/README.md` at its supplied head | §§5.5,5.7–5.9, lines 1893–1957: stable detection, cones/fibres, shifted boundary sign and finite biproducts. The difference-map example agrees. |
| `TauCetiRoadmap/DerivedModuleAlgebra/README.md` on main | §1.5 gives the commutative bounded-torsion ordinary/derived-completion comparison. It does not supply the entire associative-ring localization–completion pullback contract, so the declared general gap is not redundant. |

The finite-𝔽₂ Arf work in TangentialBordism B3.2 and its topological consumers was distinguished from the general finite-field absolute-trace extension here. No additional owner for that extension, the general integral quadratic rigidity, the explicit two-image arithmetic quotient, or the corrected Eisenstein calculations was found in the accessible main/open-head material. No ownership move is necessary.

The board's package index was read first. The four accessible indexed package heads (AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LogicAndDefinabilityInNumberTheory) were searched in both README and Suggested.lean; they introduce no competing object or acceptance name. The inaccessible heads are listed below rather than being treated as nonexistent.

### Supplier gaps and order

All three `design/plan.json` gap `needs` strings occur verbatim under the corresponding README supplier contracts, at lines 55, 57 and 71. Each names an earlier supplier and an exact section. The two completion clauses describe one general square comparison; the five conditions in the Poincaré criterion are precisely the hypotheses of one theorem, not an unspecified bundle of tasks. The quadratic-extension contract fixes the nonzero functional with s(1)=0 and describes both image/kernel identifications. The contracts ask for the missing general results, not a reimplementation of native transfer or commutative completion.

Every `Needs` line was read. Local target dependencies point backward; examples may compare later computed outcomes without being proof dependencies. ArithmeticKTheory is at line 112 of `merge-order/ORDER.txt`, this package at line 113, and GeometryOfNumbersAndQuadraticArithmetic at line 80. The requested dependency command, with this README, its name, `merge-order/ORDER.txt`, and `--movable`, exited 0. Exact output:

```text
depcheck: 52 roadmaps, 589 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted.

### Headline inventory, shape and Lean acceptance

| README headline or deep endpoint | Acceptance-file treatment |
| --- | --- |
| §§0.1–0.3 integral comparison/injection and canonical residue | Named unavailable: integral symmetric/quadratic metabolic Witt carriers are absent. Native field Witt theory is not used as an integral stand-in. |
| §0.4 finite-field Arf completeness | `arf_trace_classifies` states equality of trace coordinates iff q⊥q′ has an actual quadratic Lagrangian, on native forms, bases and submodules. |
| §0.4 scalar-extension law | Named unavailable: the native general quadratic base-change construction needs two invertible. Its uniqueness theorem does not construct dyadic base change. |
| §§1.1–1.2 characteristic-two and DVR L-groups/signs | Named unavailable: periodic Poincaré L-spectra are absent. The characteristic-not-two general table itself is consumed from ArithmeticKTheory. |
| §§2.2–2.5 general fracture, lifting, complete and henselian rigidity | Named unavailable: Poincaré categories, general noncommutative refinements and periodic L-spectra are absent. No weakened commutative substitute is stated. |
| §§3.1–3.4 total-cokernel extension, number-field coordinate table, parity quotient, quadratic localization | Named unavailable: integral Witt carriers and periodic L-spectra are absent. The additive quotient machinery alone is not the arithmetic theorem. |
| §§4.2–4.3 integral dyadic comparison and integer example | Named unavailable as integral Witt comparisons; the E₈ finite count and ℚ₂ coordinates are README arithmetic inputs, not acceptance padding. Integer tables and signature normalization remain supplied. |
| §§5.2–5.5 symmetric Eisenstein group, integral restriction, quadratic image, final L-tables | Named unavailable: integral Witt carriers and periodic L-spectra are absent. The native field restriction computation is an input to the integral endpoint, using the declared general exactness contract. |

The README has the required opening, ownership, conventions, supplier contracts, reading guide, six layers with Examples and Dependencies, consumers, worked examples and references. Its six explicit defining-map sections each have an API and respectively 4,6,7,6,6,9 Checks; §4.1's last nine split into three discriminating Checks for each of v, c and the coordinate map. Each numbered theorem has explicit hypotheses and a locator. The short `metadata.toml` is valid and sets `topic = "math.NT"`.

`Suggested.lean` contains one `import Mathlib`, one module docstring, the required namespace and Layer-0 section comment, one documented theorem, zero data definitions, zero instances and zero examples. It contains no `set_option`, `lemma`, forbidden diagnostic command or sorry'd data.

The requested `lake env lean` command was run on the absolute acceptance-file path from the content checkout. It exited 0; the only warning was that `arf_trace_classifies` uses `sorry`. No Tau Ceti import or object-file build was needed.

A separate scratch copy was elaborated with `#check @arf_trace_classifies`. Its type retains Field, Fintype, CharP 2, the 𝔽₂ algebra, both module and finite-dimensional structures, independent n,m, both bases and all six symplectic equations. The existential conclusion is the actual submodule of V×W, full quadratic vanishing, and twice its dimension equal to the ambient dimension. It matches README §0.4; no binder was lost and no signature change is needed.

On copies of that declaration, `simp`, `rfl`, and `infer_instance` each failed to close it. These expected failures are confined to the probe file; the acceptance file succeeds. An object search at the pin found no single library lemma proving finite-field Arf completeness. The theorem is neither a definition restatement nor a computed Check or boundary theorem, so there is no padding finding.

## Not verifiable

- **Wall-1973:** settled uncertified. Corollary 1, Lemma 1, Proposition 4 and Lemma 5 were not read directly; CDHHLMNNS-III-v4 lines 2019–2021 specify their use. No renewed request was made.
- **Scharlau-1985:** settled uncertified. Chapter 6 §6, Theorem 6.11 was not read directly; CDHHLMNNS-III-v4 lines 1930–1932 explicitly distinguish the number-field and global-field inputs. The package imports this theorem from ArithmeticKTheory.
- **Lam-2005:** settled uncertified. VII Theorem 3.5 and VI Theorem 2.29 were not read directly. The exact-sequence input remains a declared supplier contract; the ℚ₂ arithmetic and application were checked independently above.
- **Fifteen board package heads:** read-only contents requests for the listed README paths at the supplied heads returned HTTP 404; Suggested.lean was also unavailable. Consequently ownership against those inaccessible package files was not verified. This is an access limitation, not a claim that the packages do not exist:

| Package | Supplied head |
| --- | --- |
| ArithmeticLocallySymmetricSpacesPartII | 84a41ac |
| CompletedCohomologyAndLocalGlobalCompatibilityPartII | 777a863 |
| CrystallineCohomologyPartII | 84ea77e |
| EndoscopicTransferAndUnitaryTraceComparisonPartII | 80a66cc |
| HigherHidaAndColemanTheory | da88512 |
| LawrenceVenkateshMethod | 9ee7ac3 |
| OrdinaryAutomorphicFormsAndModularityLiftingPartII | 7e88c38 |
| PELModuliPartII | d4bb48d |
| PadicHodgeTheoryPartII | 6502997 |
| PadicLocalLanglandsForGL2QpPartII | 3e0777d |
| RealSurfacePeriodIndex | 875bca4 |
| SchemeAndStackFoundationsPartII | accb0a0 |
| ShimuraVarietiesPartII | 57dc0a4 |
| VStackSheavesAndLisseCategoriesPartII | 0987ba7 |
| VectorBundlesAndIsocrystalsPartII | b58d862 |

All accessible indexed open roadmap heads were searched through the roadmap service. No fresh missing-source request is needed. The three declared supplier results are prospective contracts, not claims that their full implementations already exist.

## Source issues

- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed pp.46–47, lines 2160–2163 and 2202–2205: the source says quadratic extension on the completed ℤ/2 factor is identity, producing degree-zero ℤ/2 and degree-three ℤ/4⊕ℤ/2; it should be zero by absolute trace, producing degree-zero 0 and degree-three ℤ/4; affects a stated result.
- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p.47, lines 2180–2182: the source says multiplication by ⟨1,3⟩ has annihilator generated by 2⟨1⟩ and ⟨1,−2⟩; it should be generated by 2⟨1⟩ and ⟨1,−3⟩, since the proposed second generator has product 4⟨1⟩≠0; affects the proof.
- **Gap** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p.46, lines 2156–2157: the source says odd discriminant proves two is inert; it should be supplemented by irreducibility of t²+t+1 modulo two, since odd discriminant proves only unramifiedness; affects the proof.
- **Misprint** in CDHHLMNNS-II-v5 at Proposition 4.5.5(iv), printed p.109, line 5262: the source says the image multiplicative set satisfies the Ore condition with the source ring; it should be the target ring B, where that set is localized; affects a stated result.
- **Misprint** in CDHHLMNNS-II-v5 after Proposition 4.5.5, printed p.109, lines 5276–5277: the source says condition iv is equivalent to the right-multiplication kernel/cokernel comparison; it should be condition iii, the cofiber-equivalence condition; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6d65613428bff42b182a4057cdc24473e393b019", "job": "REV-PKG-GeometryOfNumbersAndQuadraticArithmeticPartII~3", "model": "gpt-6-astra", "worker": "chris-21"} -->
