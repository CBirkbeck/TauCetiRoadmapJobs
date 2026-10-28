# Repair report

## F01 (P2) — applied

Empty acceptance file → `arf_trace_classifies`, the finite-field absolute-trace classification on native quadratic forms and submodules. Its six symplectic-basis conditions imply nonsingularity; independent half-dimensions include zero. README §0.4 names the theorem, states its hypotheses and adds both-direction Checks. The docstring reserves the scalar-extension law for the missing characteristic-two base-change API. No definitions or auxiliary theorems were added.

## F02 (P3) — applied

Summary endpoint “explicit Witt arithmetic over ℚ₂” → input to Layer 5. The acceptance docstring no longer calls the Dedekind completion pullback this package's headline; it explicitly identifies it as consumed. ArithmeticKTheory §3.5 supplies that pullback with its maps; §4.1 remains the arithmetic computation already used by §§4.3 and 5.3.

## F03 (P3) — applied

§5.1's unused ArithmeticKTheory §§1.1–1.3 dependency → deleted. §5.2 explicitly consumes `IsCyclotomicExtension.Rat.Three.Units.mem`; §5.5 explicitly consumes `IsCyclotomicExtension.Rat.three_pid` and `ClassGroup.equivPic`. The existing Mathlib contracts give the six units, two unit square classes and trivial Picard group. The other use of ArithmeticKTheory §§1.1–1.3, in §3.2's localized-Picard discussion, is retained.

## F04 (P3) — applied

One-prime example with zero parity quotient → the domain R=ℤ[t]_(2)[(1+√17)/2], with two dyadic primes and residue field 𝔽₂(t) at each. The new Check proves the Dedekind and residue assertions and computes the quotient ℤ/2 with nonzero class (1,0). Thus it tests a nonzero obstruction outside finite and perfect residue fields.

## F05 (P3) — applied

ASCII field, integer, cyclic-group and completion symbols → Unicode throughout README §§0.3–0.4, 2.1–2.2, 3.1, 4.3 and 5.1–5.4. The polar and associated-map identifiers in §0.4 now have code formatting and their actual names. Also normalized K₀ and the completion subscript in §§2.2 and 3.1. No mathematical statements changed under this finding.

## Mathematical evidence and ownership

For F01, CDHHLMNNS-III-v4 line 2095, proof of Corollary 2.3.10, p.45, gives the finite-characteristic-two quadratic Witt classification. The explicit coordinate is derived in §0.4: for ax²+xy+by², isotropy is equivalent to solving an Artin–Schreier equation with parameter ab; over a finite characteristic-two field that is equivalent to absolute trace zero. Orthogonal addition adds these coordinates; two trace-one planes have zero Witt class. Consequently equality of the coordinates is equivalent to metabolicity of q⊥q′. Its polar is perfect by the six basis conditions, so a vanishing half-dimensional subspace is exactly a quadratic Lagrangian. In characteristic two q=−q, which explains the sum rather than a difference. For q′=q the diagonal has dimension dim V and vanishing value q(x)+q(x)=0, establishing basis independence without another declaration.

The new theorem generalizes HermitianKTheoryOfPoincareCategories §7.9 and its native-carrier `arfInvariantF2_eq_sum` and `arfInvariantF2_classifies`, read at its open head. It uses this package's namespace and does not import an unmerged module. Indexed searches across main and the open heads, and searches of the board packages, also locate the finite-𝔽₂ primitive in TangentialBordism and its topological consumers. Those are special-field constructions; this package owns the absolute-trace extension to every finite characteristic-two field. No declaration with the new fully qualified name was found elsewhere.

For F04, the discriminant is 1+16=17, a unit in A=ℤ[t]_(2). It is nonsquare in ℚ(t), so adjoining a root gives a domain. The resulting finite étale algebra over the DVR A is normal, Noetherian and one-dimensional, hence Dedekind. Its reduction is 𝔽₂(t)[x]/(x(x+1))≃𝔽₂(t)×𝔽₂(t), with derivative one at both roots. These are exactly its two maximal ideals. The t-adic valuation of t in 𝔽₂(t) is one, whereas a square has even valuation. The rank-parity argument of §3.3 therefore applies without a perfection hypothesis and gives a quotient of order two. CDHHLMNNS-III-v4 lines 2099–2109 supply the parity argument; the example is the explicit arithmetic verification here.

The ownership and citation search used main 86e155c and the index of 362 open roadmap heads. The cited new-roadmap suppliers are absent from main and were read through `roadmaps show`; existing roadmap citations were checked against main. Two main-branch shape examples read before editing were GlobalQuadraticForms and QuadraticFormInvariants. Cross-roadmap contracts were re-resolved as follows:

| Supplier | Sections verified | Consumed content |
| --- | --- | --- |
| GeometryOfNumbersAndQuadraticArithmetic | §§6.2–6.5, 6.8a–6.9, 6.10a–6.11 | Exact forms and Witt quotient; norm symmetrization, residue line, L-localization, fundamental fibre sequence and filtered colimits; valuation overrings; integer invariants and tables. |
| HermitianKTheoryOfPoincareCategories | §§1.6, 3.4, 4.5–4.6, 6.6, 7.9; Suggested.lean | Periodicity; quadratic carriers and surgery; controls; field groups; 𝔽₂ Arf classification. |
| ArithmeticKTheory | §§1.1–1.3, 2.2, 3.5 | Localizations and Picard finiteness; inverse-ideal divisor normalization; Witt injection, tables, extension and completion comparison. |
| KTheoryFiniteLocalFields | §1.7 | Perfect-characteristic-two symmetric comparison and rank normalization. |
| QuadraticFormInvariants | Layers 4, 6, 9 | Native field Witt theory, local invariants and transfer; its characteristic-two exclusion leaves the general finite-field Arf extension here. |
| GlobalQuadraticForms | §4.4 and §§8.1–8.3 | Hilbert product formula, number-field classification, hyperbolicity and Witt injectivity, with rank zero adjoined. |
| Completed/IntegralLattices; IntegralLattices | Layers 1–5; signature theory | Integral lattices, positive E₈ Gram model and half-norm convention. |
| SchemeAndStackFoundations | §§0.14–0.15, 0.21 | Henselian lifting, Popescu and regular completion inputs. |
| GeneralAlgebraicKTheory | §§11.3–11.4, 11.15 | Dense K₀-image criterion and nonconnective localization. |
| StableHomotopyKTheory | §§5.5, 5.7–5.9 | Stable detection, cones, fibres and finite biproducts. |

The three existing supplier gaps remain unchanged and their `needs` strings still occur exactly in the README contracts: derived-localization-completion-square (GeometryOfNumbersAndQuadraticArithmetic §6.8a), poincare-change-of-rings-criterion (same supplier and section), and quadratic-extension-witt-exactness (QuadraticFormInvariants Layer 9). Main's DerivedModuleAlgebra §1.5 supplies the commutative ordinary/derived-completion clause, but does not by itself supply the associative-ring pullback contract. No ownership moved, no new gap was necessary, and no later roadmap became a supplier.

## Pinned APIs and sources

The checked Mathlib pin is 6b7abb3c7686292736be2955bd3eb9ebf63b456a and the Tau Ceti pin is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, agreeing with lake-manifest.json. Relevant native definitions were read at those pins:

| Declaration | File and line | What it actually supplies |
| --- | --- | --- |
| QuadraticForm; QuadraticMap.polarBilin | Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:160,317 | Quadratic maps and their full polar; no projectivity, finite dimension or nonsingularity assumption is bundled. |
| QuadraticMap.prod | Mathlib/LinearAlgebra/QuadraticForm/Prod.lean:55 | The form on V×W is q(x)+q′(y). |
| Algebra.trace | Mathlib/RingTheory/Trace/Defs.lean:70 | Trace of multiplication; finite fields ensure the finite-dimensional extension here. |
| QuadraticForm.baseChange | Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127; binder at line 38 | Native tensor scalar extension requires invertibility of two, so cannot express the characteristic-two extension law. |
| IsCyclotomicExtension.Rat.Three.Units.mem | Mathlib/NumberTheory/NumberField/Cyclotomic/Three.lean:50 | Six-unit list under the number-field and conductor-three cyclotomic hypotheses. |
| IsCyclotomicExtension.Rat.three_pid | Mathlib/NumberTheory/NumberField/Cyclotomic/PID.lean:34 | The conductor-three cyclotomic ring of integers is a PID. |
| ClassGroup.equivPic | Mathlib/RingTheory/PicardGroup.lean:876 | Class-group/Picard-group equivalence for a commutative domain. |
| TauCeti.WittRing | TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean:218 | Field Witt carrier with two invertible; it cannot supply the missing integral or characteristic-two Witt carriers. |

An object search of the pinned quadratic-form libraries found no finite-field Arf classification. The retained theorem is a classification result, not a definitional expansion or a one-tactic library consequence. The new Mathlib uses, orthogonal sum and trace, are now in the exact supplier contracts.

No new source was needed. All seven cited works retain their existing manifest keys. The four legally cached texts were read at the relevant locators; the other three remain settled as uncertified, and were not requested again:

| Source | Locators verified or retained |
| --- | --- |
| CDHHLMNNS-III-v4 | Lines 1840–1869 (residue), 1896–1965 (symmetric tables), 1976–2029 (fracture and rigidity), 2044–2109 (quadratic table, Arf and parity), 2110–2207 (integer and Eisenstein examples), 2226–2247 (strict Lagrangians and characteristic two). |
| CDHHLMNNS-II-v5 | Lines 5253–5274, Proposition 4.5.5, pp.108–110; the contract retains all five conditions, with the Ore pair over the target ring. |
| Wall-1970 | Lines 104, 132–164, Lemma 1 and Theorem 2, printed pp.427–429; lifting and quadratic error correction. |
| CMM | Lines 1659–1674, Remark 5.6, p.39; the completion-to-henselian argument used by the roadmap. |
| Wall-1973 | Uncertified; Corollary 1, Lemma 1, Proposition 4, Lemma 5. Its precise use is also described in CDHHLMNNS-III-v4 lines 2019–2021. |
| Scharlau-1985 | Uncertified; Chapter 6 §6, Theorem 6.11. The supplied global residue cokernel uses this locator. |
| Lam-2005 | Uncertified; VII Theorem 3.5 and VI Theorem 2.29. The specific ℚ₂ arithmetic was independently recomputed below. |

The existing corrections to the source's Eisenstein quadratic arrow and table, annihilator generator and inertness argument remain necessary. In particular CDHHLMNNS-III-v4 line 2163 cannot determine the quadratic residue map: the trace computation gives zero. No source text was copied into the package.

## Adversarial mathematics pass

The following table records values recomputed for the statements, conventions, APIs and examples. Exact finite-field arithmetic enumerated all 16 binary-form pairings over 𝔽₂ and all 256 over 𝔽₄, testing a Lagrangian by independent isotropic orthogonal generators, not by assuming the Arf criterion. Rational computations used the normalized ℚ₂ Hilbert formula and hyperbolicity of q⊥−q′ to compare Witt classes. Boundary arguments are mathematical instantiations; these computations are not proposed algorithms or Lean acceptance padding.

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Convention: perfect polar | Zero module; ℤ with pairing 2xy; characteristic-two square line | Adjoints 0→0 invertible; cokernel ℤ/2 for 2xy; polar of x² over 𝔽₂ is 0 on dimension 1 | Includes zero, excludes singular lines | None |
| Convention: sign shift | ℤ, negative-sign degrees 2 and 0 | Positive degrees 0 and −2 give ℤ and 0 | Correct subtraction under Σ² | None |
| Convention: difference map | Identity maps, pairs (1,1),(2,1) | Differences 0,1; sums would be 2,3 | Correct boundary direction | None |
| Convention: residue coordinate | ⟨5⟩ over ℤ_(5), π=5 and π′=10 | Coefficients 1 and 2⁻¹=3; 3 is nonsquare modulo 5 | Unit change retained | None |
| Convention: diagonal versus polar | b=xy over ℚ | Polar of x² is 2xy; polar of x²/2 is xy | Two comparisons differ by ⟨2⟩ | None |
| Convention: signed determinant | ⟨1,1⟩; polar [[2,1],[1,2ζ]] | Signed determinants −1 and 1−4ζ, versus plain 1 and 4ζ−1 | Signs agree in §§4–5 | None |
| Convention: Hilbert normalization | (−1,−1), (2,5), (−1,2) | −1,−1,+1 from the formula | Supplier and coordinates agree | None |
| §0.1 polarisation and invertible-two inverse | 𝔽₂ Arf-one plane; q=x² over ℚ | Quadratic invariant 1 maps to metabolic alternating class 0; half-diagonal of polar 2xy returns x² | Comparison is not always injective | None |
| §0.1 finite projectives | I=(2,1+√−5) over ℤ[√−5] | I²=2R; multiplication divided by 2 identifies I with its dual, although I has no basis | Free modules would lose a valid form | None |
| §0.2 symmetric injection | ℤ⟨1⟩; R=K; zero form | Signatures 1→1; identity; rank 0→0 | Kernel test and degenerate descent agree | None |
| §0.2 characteristic-two polarisation | R=𝔽₂[t], q=xy | Alternating polar class 0; symmetric unit rank parity 1 | Zero map does not kill all symmetric forms | None |
| §0.3 unit and odd valuation residue | ℤ_(2), coefficients 3 and 2 | Residues 0 and ⟨1⟩ | Correct unit/odd-valuation distinction | Typography |
| §0.3 square invariance | Coefficients 1 and 4 at two | Both residues 0, valuation parities 0 and 0 | Divisibility alone fails | None |
| §0.3 unit square class | ⟨6⟩ at three | Residue ⟨2⟩, with 2 nonsquare in 𝔽₃ | Retains more than parity | Typography |
| §0.3 ramified base change | ℤ→ℤ[i], coefficient 2 | 2=−i(1+i)², so residue after extension is 0; residue-field identity would give 1 | Linking comparison required | Typography |
| §0.3 additivity and finite support | ⟨2⟩⊥⟨2⟩; ⟨6⟩ over ℚ | Residue at two is 1+1=0; possible support of ⟨6⟩ is {2,3} | Metabolic relation and finite-support target agree | None |
| §0.4 trace definition | xy and x²+xy+y² over 𝔽₂ | Coordinates 0 and 1; anisotropic plane values at nonzero vectors 1,1,1 | Separates equal polars | Expanded Check |
| §0.4 basis independence | All symplectic bases of xy | 𝔽₂: 6 bases, raw set {0}; 𝔽₄: 60 bases, raw set {0,1}, trace set {0} | Trace, not raw sum, is invariant | Headline added |
| §0.4 orthogonal additivity | Two 𝔽₂ trace-one planes | 1+1=0; sum has a dimension-2 vanishing subspace | Correct metabolic relation | None |
| §0.4 trace-zero iff metabolic | Binary planes over 𝔽₂ and 𝔽₄ | Trace 0 exactly when a nonzero isotropic vector spans a vanishing line | Both implications tested | Expanded Check |
| §0.4 surjectivity and normalization | 𝔽₄ planes with last coefficient 1 and ζ | Tr(1)=0, Tr(ζ)=1; q(ζ,1)=0 for the former | Both Witt coordinates occur | None |
| arf_trace_classifies | Every binary coefficient pair over 𝔽₂ and 𝔽₄ | 16 and 256 comparisons; trace equality versus existence of dimension-2 quadratic Lagrangian: 0 mismatches | Both directions agree | Added theorem |
| arf_trace_classifies, unequal dimensions | Zero versus xy; zero versus 𝔽₂ Arf-one plane; zero versus zero | 0=0 and vanishing line exists; 0≠1 and no line exists; 0=0 and 2·0=0 | Includes n=0, m=1 and n=m=0 | Expanded Check |
| arf_trace_classifies, same form | q against itself with two bases | Diagonal value q(x)+q(x)=0; 2 dim diagonal=dim(V×V) | Basis-independence specialization is nonvacuous | README explanation |
| §0.4 extension-degree law | 𝔽₂→𝔽₄ and 𝔽₂→𝔽₈ | Tr(1)=0 and 1, matching degrees 2 and 3 modulo two | Even extension kills, odd preserves | Unstatable carrier distinguished |
| §1.1 characteristic-two global table | 𝔽₂[t], 𝔽₂(t), 𝔽₂[t,t⁻¹] | Pic/2=0 in all three; residue of ⟨t⟩ at t has parity 1 before inverting t, absent afterward | Even Ws and odd 0 | None |
| §1.2 DVR table | ℤ_(2), ℤ_(3), 𝔽₂[[t]] | Symmetric degree one ℤ/2,0,0; residues of ⟨2⟩,⟨3⟩,⟨t⟩ each generate the respective residue Witt group | Degree shift distinguishes the cases | None |
| §1.2 global residue cokernel | ℤ and 𝔽₃[t] | Pic/2=0; d=1 and 0; tables (ℤ,ℤ/2,0,0) and (Ws,0,0,0) | Global and local rows agree | None |
| §2.1 completion product | ℤ, ℤ[i], ℤ[ζ₃] | One factor each; residue degrees 1,1,2; ramification exponents 1,2,1 | Multiplicity is not factor count | Typography |
| §2.1 cofinal quotient powers | ℤ[i], (2)=(1+i)² | Exponents 2m cofinal in all prime powers; same limit | Correct ramified completion | None |
| §2.1 empty product | ℤ[1/2], ℚ, ℤ_(3) | (2)=R; every R/(2^m)=0; C=0 | No spurious non-dyadic completion | Typography |
| §2.1 projection maps and extensionality | Two factors; empty product | x↦(0,0) and x↦(0,1) differ only at second projection; empty product has one map | Every projection required | None |
| §2.2 arithmetic fracture | (R,ℓ)=(ℤ,1),(ℤ/4,2),(ℤ,2) | Completion/localization pairs (0,ℤ),(ℤ/4,0),(ℤ₂,ℤ[1/2]); last overlap ℚ₂ | Degenerate and ordinary squares agree | Typography |
| §2.2 K₀ controls | Even-Euler subcategory of Dᵇ(k) | Image 2ℤ; class of k[0] is 1, outside image | Density does not remove control | None |
| Gap: derived completion square | (ℤ,1),(ℤ/4,2),(ℤ,2) | Derived and ordinary completions 0,ℤ/4,ℤ₂; localized cofibres give the same three squares | Bounded torsion suffices | None |
| Gap: Poincaré change of rings | Central powers of ℓ; identity map; m=±∞ | Central Ore commutators 0; identity cofibres agree; endpoint Tate condition is empty | Matches all five supplied conditions | None |
| §2.3 anti-structure/refinement convention | α=id,u=1; q=xy | T²=1; full polar [[0,1],[1,0]], determinant −1 | Nonsingular even at two | None |
| §2.3 lifting and prescribed isometries | ℤ₂ hyperbolic plane; J=0; square-zero J | Residue determinant 1; identity lifts itself; error J maps to J²=0 | No division by two | None |
| §2.3 negative lifting controls | Arf-one versus hyperbolic; symmetric lines 1 and 3 | Residue Arf 1 versus 0; 3≡3 modulo 8 is nonsquare despite equal residue lines | Hypotheses exclude false identifications | None |
| §2.4 complete rigidity | ℤ₂→𝔽₂; 𝔽₂[ε]/ε²→𝔽₂ | Quadratic residues (ℤ/2,0,ℤ/2,0) on both sides | Nilpotents allowed | None |
| §2.4 zero and symmetric controls | J=0; J=R; Ws(ℤ₂)→Ws(𝔽₂) | Identity; separated completion forces R=0; symmetric orders 16 versus 2 | Symmetric analogue fails | None |
| §2.5 henselian rigidity | (ℤ₂,(2)), (𝔽₂[ε]/ε²,(ε)), J=0 | Same quadratic residues as above; identity for J=0; (2)^m≠0 for every m | No nilpotence requirement | None |
| §3.1 two-image quotient | D=ℤ/4, images (2D,0),(D,0),(0,D) | Quotient orders 2,1,1; intersection quotient in first case would have order 4 | Sum is essential | Typography |
| §3.1 surjection and zero representatives | D=ℤ/4, images (2D,0) | Representatives 0,2 map to 0; 1,3 to the other coset | Quotient surjectivity and kernel agree | None |
| §3.1 factorization API | Map D→ℤ/2 reducing modulo two | Kills 2D and 0; factors uniquely; identity D→D does not kill 2D | Universal-property test | None |
| §3.1 iterated cokernel | Same D, σ_R=σ_C=0 with global image 2D | Both constructions give (ℤ/4)/(2D)=ℤ/2 | Cokernel-of-cokernels agrees | None |
| §3.1 functoriality | Identity commuting square; zero target | Induced quotient map identity on ℤ/2; map to zero is 0 | No arbitrary unrelated group map asserted | None |
| §3.2 number-field table and finiteness | ℤ, ℤ[1/2], ℤ[ζ₃] | d=1,0,1; degree-two orders 2,1,2; A orders 1,1,4 | Finite two-primary, with no chosen splitting | None |
| §3.3 parity quotient | d=0,1,2,3 | Quotient orders 1,1,2,4; for d=2, cosets of (0,0) and (1,0) distinct | Exponent only used when d≥1 | None |
| §3.3 imperfect/infinite witness | R=ℤ[t]_(2)[(1+√17)/2] | Discriminant 17; reduction roots 0,1, derivative 1; d=2; quotient order 2 | Detects A(R)≠0 in the intended generality | Replaced ineffective Check |
| §3.4 nondyadic localization | S empty; {(3)} in ℤ; infinite S | Identity and residue 0; unchanged completion ℤ₂ and residue 𝔽₃; every sum element has finite support | Correct domain and direct sum | None |
| §3.4 excluded dyadic prime | S={(2)} in ℤ | Proposed exactness would force π₂Lq(ℤ)=0, but its value is ℤ/2 | Negative control succeeds | None |
| §4.1 additive coordinates | All (a,b,e)∈ℤ/8×ℤ/2×ℤ/2 | 32 representatives, 0 equal unordered pairs; 8u=0,4u≠0,2v=2c=0 | Unique coordinate map | None |
| §4.1 tensor products | c·u,c·v,c²; all 32 coordinates | c,4u,0; c(au+bv+ec)=ac+4bu in 32/32 cases | Correct multiplication formula | None |
| §4.1 principal ideal | Products by c | Exactly {0,c,4u,c+4u}, order 4 | Restriction kernel size fixed | None |
| §4.1 annihilator | Same 32 coordinates | Exactly a∈{0,2,4,6}, b=0, e∈{0,1}; order 8 | Generated by 2u,c | None |
| §4.1 alternative binary classes | c versus ⟨1,−5⟩; ⟨1,−3⟩ versus 2u+c | Difference forms hyperbolic in both comparisons; c·⟨1,−3⟩=0 but c·v=4u≠0 | Source's wrong generator excluded | None |
| §4.2 E₈ refinement | All 256 binary vectors; a root; adjacent roots | 136 zeros and 120 ones; q(root)=1; q(eᵢ+eⱼ)=1; Gram determinant 1 | Arf 0, not merely polar metabolicity | None |
| §4.2 signature comparison | E₈ and bilinear line | Signatures 8 and 1; quadratic invariant of E₈ 1; polarisation multiplier 8 | Normalizations agree with supplier | None |
| §4.3 integral kernel and residue section | u,c,v and ⟨−1,2⟩ | Residues 0,0,1,1; kernel has 16 classes; section order 2 | Integral subgroup correct | Typography |
| §4.3 quadratic polar image | [[2,1],[1,2]] | Diagonal ⟨2,3/2⟩ equals c+4u, distinct from c; order 2 | Independent of u | Typography |
| §4.3 two images and integer example | ⟨u⟩ plus ⟨c+4u⟩ | Spans all 16 kernel classes; A(ℤ)=0; E₈ reduction Arf 0 | Integer table and example agree | None |
| §5.1 completion identification | t²+t+1 at 0,1 modulo 2 | Values 1,1; residue degree 2, ramification 1, one prime | Correct inert unramified factor | Needs corrected |
| §5.1 split control | ℚ(√−7), t²+t+2 | Values 0,0; roots 0,1; discriminant −7 odd | Unramified does not imply inert | Typography |
| §5.2 unit square classes | Norm a²−ab+b²=1 | Six pairs (±1,0),(0,±1),(1,1),(−1,−1); squares subgroup has 3 elements; quotient size 2 | Pinned units theorem is the input | Needs corrected |
| §5.2 symmetric Witt group | 0,u,2u,3u; 4u over K and E | Parity/determinant pairs (0,1),(1,1),(0,−1),(1,−1); 4u=0,2u≠0 | Generator order 4 globally and locally | Typography |
| §5.3 field restriction and transfer | a=−3, λ(1)=0,λ(s)=1 | Kernel order 4, transfer image ann(c) order 8; λ(s)=1≠0 | Distinguishes kernel and cokernel | None |
| Gap: quadratic-extension exactness | Same extension | Image of multiplication by c is {0,c,4u,c+4u}; kernel is the 8-element ann(c) | Exactness applied with specified functional | None |
| §5.3 integral restriction | Residue map 𝔽₂→𝔽₄ | Symmetric unit 1→1, so right residue map is an isomorphism; integral kernel order 4, cokernel order 8 | Field comparison transfers to integral groups | None |
| §5.4 quadratic base change | Arf-one 𝔽₂ plane extended to 𝔽₄ | Tr(1)=0; value at (ζ,1) is 0 | Quadratic arrow is zero | Typography |
| §5.4 new local image | q=x²+xy+ζy² | Tr(ζ)=1; signed determinant 1−4ζ=3−2√−3; norm 21≡5 modulo 8 | Nonzero local quadratic class | Typography |
| §5.4 intersection | t versus 0 and 2u | Norms of signed determinant 21 versus 1,1; ⟨u⟩ has order 4, ⟨t⟩ order 2 | Intersection 0 | None |
| §5.5 transfer and worked matrix | λ on basis (1,s) in both coordinates | Matrix determinant 21; diagonal ⟨1,−1,4,−21/4⟩; class ⟨1,−21⟩=c since −7 is a square | Correct additional image | None |
| §5.5 Picard input | Eisenstein PID | Class group 0 and Pic 0; Pic/2=0 | Pinned PID and comparison are the inputs | Needs corrected |
| §5.5 final quotient and L-tables | Eisenstein ring | ann(c)/⟨c⟩=ℤ/4; Wq=0; symmetric (ℤ/4,ℤ/2,0,0), quadratic (0,0,ℤ/2,ℤ/4) | Matches every worked example | None |

Noncommutative anti-structures retain Wall's hypotheses in §2.3; commutative finite-field arithmetic is not evidence for dropping them. Conversely no finiteness or perfection was introduced into §3.3. No added or changed statement was refuted by the computed witnesses.

## Check outcomes

- Final acceptance elaboration: `lake env lean` on packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean, from the content checkout, exit 0. Its only output was the expected warning that `arf_trace_classifies` uses `sorry`. There is exactly one `import Mathlib`; no Tau Ceti import or missing-object build was needed.
- Mechanical signature audit: one scratch Lean file contained the acceptance declarations and `#check @TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmeticPartII.arf_trace_classifies`. Elaboration exited 0. The printed type retains Field, Fintype, CharP 2, Algebra (ZMod 2) k, both module structures and finite-dimensional instances, both independent dimensions, both bases, and all six symplectic conditions. Its trace equality and existential submodule conclusion match README §0.4. No binder was lost; no signature correction was necessary after this audit.
- Arithmetic audit exited 0. It found zero classification mismatches over both tested finite fields, zero equal pairs among the 32 ℚ₂ representatives, and zero failures of multiplication by c; E₈ and transfer determinants were 1 and 21.
- Dependency command was the requested `gate --depcheck` with this README, name GeometryOfNumbersAndQuadraticArithmeticPartII, merge-order/ORDER.txt and `--movable`. Exit 0; exact output:

```text
depcheck: 51 roadmaps, 587 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

- Citation resolver exited 0: no cross-roadmap citation found nowhere, and no Lean name found nowhere, against main 86e155c and the 362 indexed heads. The resolver reported that external pinned Lake declarations were not checked on its host; the native definitions and the declarations used in the repairs were independently inspected at the worker pins, as recorded above.
- Whole-file mathematical-token scan found none of the reported ASCII forms outside code spans. All three supplier gap contracts match their design `needs` strings. The acceptance file has one theorem, no definitions, no examples, no sorry'd data and no option override. README names its sole new theorem; no prior Lean declaration was renamed or deleted.
- No separate gate failures were listed in the brief. Metadata, source manifest and design plan were not changed. No source is newly missing or requested.

The only new public acceptance name is TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmeticPartII.arf_trace_classifies. Existing consumers keep their names and dependency direction. No other roadmap, merge-order file, tooling or pull-request text was edited; no commit was made.
