# Review of FunctionFieldArithmetic (pull request #1474 at c5d655e)

**Verdict:** accepted

No findings. Both previous findings are repaired. This is an AI-assisted incremental re-review of 110 changed lines since f7a17ee, covering the changed passages, their affected contracts and consumers, the gate and Lean elaboration. Acceptance means ready for a human's final approval; it is not approval or merge.

## Previous findings

- R01 — repaired: README lines 82–85, 110–115, 243–276, 314–325, 487–505, 1842, 1911 and 2043–2071 now cite actual supplier sections and prose targets. The four nonexistent declaration names are absent.
- R02 — repaired: Suggested.lean lines 128–134 states the infinite-length group equivalence. README lines 863–869 specifies its pairing and reduction compatibility; lines 902–911 give characteristic-two, characteristic-three and algebraically closed controls.

## Verified sound

**Scope and execution.** The head is c5d655e23168b6d924eb314b518ab5bbe48da66c. The revision changes only README.md and Suggested.lean in TauCetiRoadmap/FunctionFieldArithmetic; the full pull request's outside-folder diff is empty. The worktree was clean before and after review. No pull-request file or source manifest was changed. The repository's Writing a roadmap checklist and CONTRIBUTING were read, together with main-branch AlgebraicCurves and ClassFieldTheory scope and interface conventions.

The supplied worker gate passes every rule, including build. The independent gate rerun returned:

~~~text
gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
~~~

The separate targeted build, lake build TauCetiRoadmap.FunctionFieldArithmetic.Suggested, succeeded. Independent lake env lean elaboration of the actual Suggested.lean also succeeded, with exactly 12 warnings, all for sorry. The dependency check returned:

~~~text
depcheck: 204 roadmaps, 1496 edges, 0 problem(s)
~~~

There is no UPWARD, CYCLE or moved line. All Needs lines were scanned; the edited ones retain earlier suppliers. No new ownership move or declared supplier gap is involved.

**Signatures and headline coverage.** A scratch copy, verified identical to the head before the appended commands, was elaborated with #check @name for all 19 declarations. Its types agree with the supplied signature extraction and the README: no lost binder or changed hypothesis was found. The new theorem explicitly quantifies p, Fact p.Prime, F, Field F and CharP F p; it needs neither a perfect nor a finite field. It asserts the underlying additive group equivalence of the actual Witt quotient with continuous characters. Pairing, topology on the quotient and reduction compatibility remain the full README targets, as for the retained finite theorem.

The scratch one-tactic probe tried simp, rfl and infer_instance on each of the 12 admissions; all 12 failed to close. Object searches found no single pinned lemma supplying the new complete character-classification statement. The unchanged statements retain the prior review's library audit; no padding is identified.

| README headline | Suggested.lean coverage at this head |
| --- | --- |
| §0.2 degree-one divisors | exists_divisor_degree_eq_one, line 47 |
| §1.2 simultaneous reduced bases | riemannRoch_reducedBasis, line 58 |
| §3.1 Witt additive Hilbert 90 | witt_additiveHilbert90, line 100 |
| §3.1 finite character classification | artinSchreierWitt_galois, line 118 |
| §3.1 infinite character classification | artinSchreierWitt_infiniteCharacters, line 128; now present |
| §4.2 equal-characteristic abelian existence | localAbelianExistence_laurentSeries, line 142 |
| §§5.1–5.3 Euler product, logarithmic derivative, large-degree counts, rationality, functional equation and class number | Theorems at lines 182, 192, 201 and 211 |
| §5.6 recovery from g point counts | IsLPolynomialData.unique and lPolynomial_isLPolynomialData, lines 242 and 248 |
| §2 adelic Fourier duality and volumes | Docstring: missing completed divisor lattices and differential-normalized measures |
| §§3.2, 4.1–4.4 reduced representatives, torsion tower, local reciprocity and conductors | Docstring: missing reduced representatives, evaluated formal-module actions, tower and reciprocity constructions |
| §§4.7, 4.10 generalized Picard universality and ray-cover classification | Docstring: missing Picard schemes, Abel maps and Lang covers |
| §§5.7–5.8 cohomological L-functions and quantitative Chebotarev | Docstring: missing cohomological Frobenius and finite-cover conjugacy carriers |
| §§6.4–6.7 Harder finiteness and Yu nonvanishing | Docstring: missing reductive automorphic, cuspidal and Whittaker carriers |
| §§7.1–7.6 inducing characters, Eisenstein continuation, density and Fourier identities | Docstring: missing Picard pullback, induced-section, L² and Hermitian-density carriers |

The carrier assessment for untouched headlines is carried from [R1][prior]; the added infinite-length statement was checked afresh.

**Pinned APIs opened in this round.** Mathlib is at 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti is at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Paths below are relative to the respective library repositories.

| File and line | Declaration and boundary verified |
| --- | --- |
| Mathlib/RingTheory/WittVector/Frobenius.lean:218 | WittVector.frobenius is a ring homomorphism; the roadmap subtracts additive homomorphisms using Witt addition, not coordinate subtraction |
| Mathlib/RingTheory/WittVector/Compare.lean:199 | WittVector.equiv identifies Witt vectors over ZMod p with p-adic integers; this is not general-field character classification |
| Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42 | Field.absoluteGaloisGroup is the algebraic-closure automorphism group; line 45 identifies the inherited Krull topology |
| Mathlib/NumberTheory/Padics/PadicIntegers.lean:62 | PadicInt.subring is the norm-at-most-one subring; PadicInt at line 71 and its metric at line 197 give the intended p-adic topology |
| Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57 | ContinuousMonoidHom includes a monoid homomorphism and a continuous map; the type tags give additive characters with pointwise addition |
| TauCeti/FieldTheory/FunctionField/Place/ArtinSchreier.lean:109 | exists_reduced_artinSchreier_representative is length-one pole reduction with perfect residue field, not the new arbitrary-field infinite Witt quotient equivalence |

The algebraic closure in the absolute Galois carrier causes no perfectness restriction: automorphisms extend uniquely across the purely inseparable part, while the Artin–Schreier coordinate equations are separable. The source explicitly treats arbitrary characteristic-p fields.

**Resolved affected supplier contracts and ownership.** The citation resolver was rerun against main fa41b37 and the indexed open heads: no unresolved roadmap citation. Its library-name scan was unavailable on that service host; the pinned API checks above were performed locally instead. Direct section reads discharge R01:

| Citation at this head | Supplier location opened | Verified contract |
| --- | --- | --- |
| README 82, 178, 243–253, 447–505 | TauCetiRoadmap/ArithmeticGaloisDuality/README.md:2074, especially 2076–2094 | §R02.3.2 defines J_F, C_F and positive valuation degree; its API explicitly states degree surjectivity and the chosen splitting. Finite exact constants remain |
| README 110–113, 273–276, 2043–2071 | TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:3550 | §5.13 states the connected finite étale Galois-cover theorem, arithmetic Frobenius congruence and coefficient #B/#H_geom |
| README 110–113, 314–318, 2046–2047 | TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1263, 1272–1295 | §3.7 imports that count and derives its Haar-null density-zero consequence; no invented local declaration is claimed |
| README 1842–1855 | TauCetiRoadmap/WeilConjectures/README.md:604; TauCetiRoadmap/DeligneWeightsAndPurity/README.md:990, 1026 | §1.16 supplies the integral curve numerator; §§1.6 and 1.9 identify the reversed Jacobian polynomial and base-extension counts |
| README 323–325, 1907–1911 | TauCetiRoadmap/WeilConjectures/README.md:1077 | §5.20 states known-degree recurrence and Newton identities, including the zeroth moment; the g-count improvement here uses reciprocal symmetry |

Object searches used roadmaps grep over main and indexed open heads, plus board packages and the pinned libraries. No competing fully qualified declaration was found. Main TauCetiRoadmap/ClassFieldTheory/README.md:239 excludes Artin–Schreier–Witt theory. The related TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:378 §0.4 is descent for finite locally free coefficient sheaves and finite-projective Frobenius modules over perfect rings; it is not this additive-character quotient over arbitrary fields. Other search hits concern sheaf comparisons or examples of Witt extensions. FunctionFieldArithmetic remains the owner of its existing §3.1 classification; adding its missing headline does not re-plan a supplier.

**Source verification and the seeded sample.** There are no README locators flagged unverified. The sample was restricted to changed passages and affected interfaces, as required for an incremental review. Of its 15 named targets, §§0.3, 3.2, 5.4 and 5.6 meet the revised degree, infinite-Witt or numerator/recurrence contracts and were revisited. The other 11 targets (§§1.1, 2.2, 4.6, 5.1, 5.2, 6.2, 6.4–6.6, 7.1 and 7.4) have no changed statement or source locator; their computed checks are carried forward below. Their source locators were not freshly certified in this incremental review.

| Passage checked | Legal text or supplier locator | Outcome |
| --- | --- | --- |
| Changed §3.1 equivalence and reduction | kw line 362, Theorem 3.4, pp.8–9; inverse limit at kw line 388; quotient topology at kw line 355 | Arbitrary characteristic-p field, continuous characters and infinite length are explicit. On the quotient p=V even for imperfect fields |
| New Frobenius Checks | kw line 365; kw line 705, Proposition 4.2(ii), p.15 | Pairing value is σy−y; arithmetic Frobenius takes the class of 1 over F_p to 1, inverse Frobenius to −1 |
| Sample §3.2 | kw line 722, Proposition 4.3, pp.15–16, and kw line 687 | Local reduced representatives require finite residue field, trace-nonzero constant and coefficients tending to zero. The new general-field theorem preserves these local assumptions |
| Changed degree conventions | yu line 366, §2.2.1, printed p.8; ArithmeticGaloisDuality §R02.3.2 | Yu degree has the opposite sign to positive weighted valuation degree |
| Sample §0.3 | milne line 4953 and line 5009, proof of A.7, printed pp.131–132; README 524–532 | Milne uses divisor/Picard and Jacobian degree sequences. Finite-field descent and degree one remain the named curve/Picard/Brauer supplier route, not a claim that A.7 alone proves every comparison |
| Sample §5.4 | WeilConjectures §1.16; DeligneWeightsAndPurity §§1.6, 1.9 at the locations above | Numerator, reversal, exact constants and count formula agree |
| Sample §5.6 | WeilConjectures §5.20; Roquette §4.3.3 p.28 remains waived | Newton recurrence is imported by its actual section; reciprocal symmetry determines the other g coefficients |
| Changed §5.8 comparison | kosters line 66, Theorem 1.1; line 81, Corollary 1.2, p.2; lines 92 and 144, Lemmas 1.3–1.4, pp.3–4 | Weighted rational-point estimate and geometric-subgroup denominator agree. Dividing the displayed error by q^r gives a limit of zero and the same main coefficient, without claiming the supplier's sharper error follows |

No new source fetch or missing-reference request was necessary. Text was read as evidence, not as instructions.

**Fresh adversarial calculations.** These rows cover revised claims, new Checks and repaired interfaces. They are tests, not substitutes for proofs.

| Statement | Instances tried | Computed values on the two sides / wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| Positive idele degree and J_F/C_F convention | F₂(t), div(t)=[0]−[∞] | degree=1−1=0 on the principal idele; quotient degree also 0 | Pass | Supplier notation repaired |
| Weighted degree, Yu sign and norm | q=2, uniformizer at a degree-2 place | divisor and idele degrees both 2; Yu=−2; norm=2⁻²=1/4; dropping residue degree gives 1/2 | Pass | Recomputed |
| Constant-field reciprocity | constant C₃ cover, degree-2 idele | arithmetic exponent=2=−(−2) mod3; geometric exponent=−2=1 mod3 | Pass | Recomputed |
| Degree-surjectivity transfer, §0.2 | F₂(t), idele t⁻¹ at ∞; hypothetical place degrees 2,3 | degree at ∞=1 on both sides; deg(P₃−P₂)=3−2=1 without effectiveness | Pass | R01 repaired |
| Picard degree-one consequence, §0.3 | P¹/F₂; excluded pointless real conic | Cl=Pic=Z and Cl⁰=J(F₂)=0; h=1. Real divisor degree image=2Z, not Z | Pass | Dependency preserved |
| Scheme/Jacobian numerator, §5.4 | E:y²=x³+x+1 over F₅ | N₁=9,N₂=27; X²+3X+5 reverses to L=1+3T+5T²; L(1)=9 | Pass | R01 repaired |
| Recurrence and g-count recovery, §5.6 | same E, S₀=2,S₁=−3,S₂=−1 | S₂+3S₁+5S₀=−1−9+10=0; a₁=N₁−6=3; a₂=5a₀=5 | Pass | R01 repaired |
| Empty-root-list recovery | P¹/F₂, g=0 | all S_r=0; numerator=1, degree=0; N_r=2^r+1 | Pass | Boundary retained |
| Infinite-character headline, §3.1 | F₂, class 1 | ℘=0; quotient=W(F₂)=Z₂; Hom_cont(Zhat,Z₂)=Z₂; Fr evaluation is 1 on both sides | Pass | R02 repaired |
| Infinite image and zero Check | F₂, classes 1,0; n=1,2,3 | reductions of 1 have orders 2,4,8; infinite image Z₂. Zero gives 0,0,0 and image size 1 | Pass | New Check |
| Inverse-Frobenius sign Check | F₃, class 1; n=1,2 | arithmetic values 1,1; inverse values −1 mod3=2, −1 mod9=8; negative pairing swaps them | Pass | New Check |
| Algebraically closed Check | algebraic closures of F₂,F₃, finite and infinite length | recursive separable equations x^p−x=c are solvable; quotient=0 and character group=0, both cardinality 1; zero-image quotient retains 1 | Pass | New Check |
| Truncation versus reduction | F₂, class 5; n=1,2,3 | both sides evaluate at Fr to 1 mod2,1 mod4,5 mod8; orders 2,4,8; truncation 5→1→1 | Pass | Compatibility confirmed |
| Imperfect-field generality | F₂(t), [t]; extension with s²=t | [t]−[s]=℘[s], so quotient images agree; length1,2 orders=2,4, matching cyclic character image orders | Pass | No perfectness restriction |
| Enlarged finite constants | F₄, class 1 | Fr evaluation=Tr_W(F₄)/Z₂(1)=2; lengths1,2,3 give 0,2,2 of orders1,2,4; infinite class is nonzero | Pass | Length-one negative control |
| Reduced local representative, §3.2 | p=3,K=F₃((T)),[T⁻²] | at length1 T⁻⁶−T⁻²=℘(T⁻²); reduced index2, coefficient1; zero model loses a nonzero class | Pass | Interface preserved |
| Chebotarev progression, §5.8 | constant C₂ cover of P¹/F₂ | degree1 nonidentity count3, identity count0; compatible coefficient1/1=1, not1/2 | Pass | R01 repaired |
| Explicit bound and limit, §5.8 | trivial cover P¹/F₂; r=1,2,3,4 | rπ=3,2,6,12; main=3,5,9,17; errors0,3,3,5; bounds r·2^(r/2)+r exceed them; normalized bound tends to0 | Pass | No sharper-error claim |
| Nonabelian/geometric denominator | geometric S₃, class of 3-cycles | size2/order6=1/3; inverse class still size2; constant C₃ instead gives coefficient1 | Pass | Generality retained |
| DWP density-zero role | finite quotient, empty Haar-null fibre | Haar mass0,count0,proportion0; full compatible constant coset has mass/proportion1 and is excluded | Pass | Correct supplier |

Frobenius residues, rational-curve counts and elliptic counts over F₅ and F₂₅ were independently computed in scratch. The remaining fresh rows are exact symbolic computations. There are 20 fresh rows.

**Carried-forward adversarial evidence.** These 178 rows preserve computed values for untouched formulas from [R1][prior], each marked with that citation. The five previous rows recording R01 or R02 are replaced above. Carry-forward does not mean all 178 computations or their source reads were repeated.

[prior]: packages/FunctionFieldArithmetic/reports/PRREVIEW-FunctionFieldArithmetic~1.md

| Statement | Instances tried | Computed values on the two sides / wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 weighted degree and principal degree | 𝔽₂(t), div(t)=[0]−[∞] | 1−1=0; idele supported at a degree-2 place has degree 2 | Pass, [R1][prior] | None |
| 0.1 absolute value and Yu sign | q=2, uniformizer at degree 2 | local norm=2⁻²=1/4; Yu degree=−2; 2^(−2)=1/4 | Pass, [R1][prior] | None |
| 0.1 central determinant degree | scalar degree 1, GL₂ | determinant degree=2=2·1; GL₀ has degree 0 | Pass, [R1][prior] | None |
| 0.1 arithmetic/geometric Frobenius | constant C₃ extension, place degree 1 | arithmetic class=1; geometric class=−1=2 mod 3 | Pass, [R1][prior] | None |
| 0.1 constant extension splitting | degree d=2 place, extensions r=2 and r=3 | gcd=2,1; new place degrees=1,2; residue degrees over original field=2,6 | Pass, [R1][prior] | None |
| 0.2 degree-one divisor headline | 𝔽₂(t); hypothetical available degrees 2,3 | deg[∞]=1; deg(P₃−P₂)=3−2=1; this need not be effective | Pass, [R1][prior] | None |
| 0.2 finite-constant hypothesis | pointless real conic | divisor degrees=2ℤ; 1 absent, while Picard-scheme degree-1 component has one real point | Pass, [R1][prior] | None |
| 0.3 divisor/line-bundle/Picard comparison | ℙ¹/𝔽₂ and ℙ¹/𝔽₃ | Cl=Pic=ℤ by degree; Cl⁰=J(k)=0, each of cardinality 1 | Pass, [R1][prior] | None |
| 0.3 Brauer obstruction boundary | real conic | Pic(X)=2ℤ; Pic_X/ℝ(ℝ)=ℤ; cokernel=ℤ/2, so finite-field conclusion cannot be generalized unchanged | Pass, [R1][prior] | None |
| 1.1 two-chart inverse ideals | k(t), D=2∞ | k[t]∩t²k[1/t]_(1/t)=span(1,t,t²), dimension 3; unreversed infinite ideal gives dimension 0 | Pass, [R1][prior] | None |
| 1.1 zero and negative divisor | D=−∞ | intersection={0}, dimension 0; multiplicative valuation at 0 is 0≤exp(−1), so 0 is retained | Pass, [R1][prior] | None |
| 1.1 divisor-addition/ideal multiplication | D=∞, E=2∞ | infinite ideals t⁻¹·t⁻²=t⁻³, matching D+E=3∞ | Pass, [R1][prior] | None |
| 1.1 pole/zero shifts and principal ideals | D=0, x=t, r=−1,0,2 | pole ideals t,1,t⁻²; zero ideals t⁻¹,1,t²; div(t) is generated by t on each chart | Pass, [R1][prior] | None |
| 1.2 reduced-basis headline | k(t), D=2∞, rank 1 | d=(2), v=1; shifts r=−3,−2,0 give dimensions 0,1,3=max(0,3+r) | Pass, [R1][prior] | None |
| 1.2 uniqueness of sorted invariants | elliptic x-map, D=0, rank 2 | d=(0,−2); shifted dimensions at r=0,1,2 are 1,2,4; rival (−1,−1) gives 0 at r=0 | Pass, [R1][prior] | None |
| 1.2 invariant sum | genus 1, D=0, rank 2 | sum d=−2=0+1·(1−1)−2 | Pass, [R1][prior] | None |
| 1.2 inseparable parameter | F=𝔽₂(t), x=t², D=0 | rank=2, basis 1,t, d=(0,−1); shifted dimensions 1,3,5=2r+1 for r=0,1,2 | Pass, [R1][prior] | None |
| 1.2 nonexact constants | F=𝔽₄(t) over 𝔽₂, x=t, D=0 | rank=2, d=(0,0); dim L(0)=2; sum=0=2(1−0)−2 | Pass, [R1][prior] | None |
| 2.1 divisor lattices and diagonal | ℙ¹/𝔽₂, D=0,∞,−∞ | diagonal intersections have cardinalities 2,4,1; dimensions 1,2,0 | Pass, [R1][prior] | None |
| 2.1 inclusions and finite indices | D=0, E one degree-2 place, q=2 | index A(E)/A(D)=4=2^(deg(E−D)); reversed inclusion fails | Pass, [R1][prior] | None |
| 2.1 sum/intersection | local exponents −1,2 | πO∩π⁻²O=πO; sum=π⁻²O, matching min=−1/max=2 | Pass, [R1][prior] | None |
| 2.1 quotient/RR index | ℙ¹, D=−2∞ | dim L(D)=0; adelic cokernel dimension=1; Euler difference=−1=deg D+1−g | Pass, [R1][prior] | None |
| 2.2 local self-dual volume | q_v=4, differential orders −2,0,2 | vol O=4,1,1/4=4^(−n_v/2); dual-lattice volume products=1 | Pass, [R1][prior] | None |
| 2.2 global volume and covolume | ℙ¹/𝔽₂, ω=dt | ord∞ω=−2; vol A(0)=2; integral-measure quotient volume=1/2, self-dual quotient volume=1 | Pass, [R1][prior] | None |
| 2.2 divisor scaling | same curve, D=2∞ | vol A(D)=8=2^(2+1); ratio to A(0)=4=2² | Pass, [R1][prior] | None |
| 2.2 change differential | dt→t dt on ℙ¹ | orders gain +1 at 0 and −1 at ∞; local multipliers 2⁻¹/² and 2¹/² multiply to 1 | Pass, [R1][prior] | None |
| 2.3 Fourier indicator | ℙ¹/𝔽₂, D=0, ω=dt | transform value at 0 is 2; support A(−2∞); second scalar 1/2, product 1 | Pass, [R1][prior] | None |
| 2.3 translated indicator | finite F₃ quotient, translate by 1, frequency 1 | positive transform phase=e^(2πi/3), while inverse convention gives e^(−2πi/3) | Pass, [R1][prior] | None |
| 2.3 Schwartz spanning | F₃ local residue quotient | all centered-lattice functions take equal values at residues 1,2; translated point indicator takes 1,0 | Pass, [R1][prior] | None |
| 3.1 Witt operator real body | p=2, a=[t] at length 2 | Frob(a)−a=(t²+t,t²+t³); coordinatewise subtraction would give second coordinate 0 | Pass, [R1][prior] | None |
| 3.1 truncation and Q₀ | p=2, lengths 0,1,2 | Q₀=0; truncate ℘[t]=t²+t=℘₁(t); length-zero quotient has one element | Pass, [R1][prior] | None |
| 3.1 finite Q_n over constants | F=𝔽₂, n=1,2 | Frob=id; quotient groups have orders 2,4, matching Hom_cont(ℤ̂,ℤ/2ⁿ) | Pass, [R1][prior] | None |
| 3.1 Hilbert 90 identity extension | L=F, n=0,1,2 | 1−σ=0, trace=id; kernel=all, image=0, trace range=all on both sides | Pass, [R1][prior] | None |
| 3.1 Hilbert 90 wild trace | y³−y=t, degree 3 | Tr(1)=3=0; Tr(−y²)=−(3y²+2)=1 in characteristic 3 | Pass, [R1][prior] | None |
| 3.1 Witt trace versus coordinates | p=2, y²+y=t, length 2 | [y]+[y+1]=(1,y(y+1))=(1,t); coordinate sum would be (1,0) | Pass, [R1][prior] | None |
| 3.1 field degree/order | F=𝔽₂(t), class [t] in Q₂ | 2[t]=(0,t²) has nonzero AS class t; 4[t]=0; field degree=4, not 2 | Pass, [R1][prior] | None |
| 3.1 cyclic-subgroup classification | order-4 class a, classes a and 3a | characters differ by factor 3, cyclic subgroup has the same 4 elements; generated field degree=4 in both cases | Pass, [R1][prior] | None |
| 3.1 localization kernel | p=3, class t⁻², completion at ∞ | with s=1/t, solution −Σ_{j≥0}s^(2·3^j) gives y³−y=s²; local class=0 while global pole class≠0 | Pass, [R1][prior] | None |
| 3.1 infinite dual topology | F=𝔽₂; Q∞=ℤ₂ | continuous ℤ₂-linear dual=ℤ₂; finite-level quotients have sizes 2ⁿ; not the torsion group ℚ₂/ℤ₂ | Pass, [R1][prior] | None |
| 3.2 reduced representatives | p=3, coefficient c₂=1, others 0 | class [T⁻²] has one allowed prime-to-3 pole; T⁻⁶ reduces to T⁻² at length 1 | Pass, [R1][prior] | None |
| 3.2 Witt constants and nonlinearity | p=2, [1+T]−[1] at length 2 | coordinates (T,T), not (T,0); its pole-free positive part has zero local ASW class | Pass, [R1][prior] | None |
| 3.2 exact constant coefficient choice | k=𝔽₄, β=[u], Tr(u)=1 | β projects to a generator of Q₁; [1] has trace 0 and is not a generator | Pass, [R1][prior] | None |
| 3.2 finite truncation/ramification | β+p[T⁻m], n=1,2 | n₀=0,n_c=1; degrees p,p²; residue degrees p,p and ramification indices 1,p | Pass, [R1][prior] | None |
| 3.3 one-pole comparison | p=3,m=2 | different exponent=(3−1)(2+1)=6; 2g−2=−6+6=0; g=1 | Pass, [R1][prior] | None |
| 3.3 localization at other places | same curve, ∞ | pole class nonzero at 0; positive-power local series gives class 0 at ∞; three rational points above ∞ | Pass, [R1][prior] | None |
| 3.3 point-count check | y³−y=t⁻² over 𝔽₃ and 𝔽₉ | counts 4 and 16; L=1+3T² gives 3+1=4 and 9+1−(−6)=16 | Pass, [R1][prior] | None |
| 4.1 formal module/action | O=𝔽₂[[π]], f=πX+X² | formal addition X+Y: f(X+Y)=f(X)+f(Y); [0]=0,[1]=X,[π]=f | Pass, [R1][prior] | None |
| 4.1 tangent and strict coordinate laws | same f, identity coordinate | linear coefficients 0,1,π; identity derivative 1; scalar 2 in characteristic 3 is not strict | Pass, [R1][prior] | None |
| 4.1 torsion module/cardinality | Q=3, m=1,2 | torsion sizes 3,9; primitive sizes 2,6=(Q−1)Q^(m−1) | Pass, [R1][prior] | None |
| 4.1 torsion field/Galois degree | Q=2, m=1,2 | field degrees 1,2; unit groups modulo π,π² have orders 1,2 | Pass, [R1][prior] | None |
| 4.1 norm of uniformizer | Q=2,m=1, f=πX+X² | nonzero torsion root=π; field is K; its norm is π, valuation 1 | Pass, [R1][prior] | None |
| 4.1 relative construction | unramified degree d=2,Q=2,m=2 | residue degree 2, ramification degree 2, total degree 4; norm valuation image=2ℤ | Pass, [R1][prior] | None |
| 4.1 lower/upper ramification | Q=2,m=2, nontrivial principal unit | torsion displacement valuation=2; lower break=1, upper break=1, conductor=2 | Pass, [R1][prior] | None |
| 4.2 local existence headline | H=K×; H=ord⁻¹(2ℤ) | unique fields K and unramified quadratic; indices/degrees 1 and 2 | Pass, [R1][prior] | None |
| 4.2 wild existence | K=𝔽₂((T)), y²−y=T⁻¹ | extension degree/index=2; U² killed, U¹ not killed; conductor=2 | Pass, [R1][prior] | None |
| 4.2 Kronecker–Weber and Artin image | unramified quadratic and ramified quadratic | first requires constant tower, second requires torsion tower; degree projection of K× is ℤ, completion is ℤ̂ | Pass, [R1][prior] | None |
| 4.2 inverse unit convention | Q=5, unit residue 2, first torsion level | arithmetic Artin acts by [2⁻¹]=[3]; geometric convention acts by [2] | Pass, [R1][prior] | None |
| 4.2 ramification/unit comparison | tame nontrivial character at q=3 | U⁰ image has order 2, U¹ image order 1; conductor 1 and Swan 0 | Pass, [R1][prior] | None |
| 4.3 Schmid–Witt constant symbol | k=𝔽₃, a=1, b=T² | trace-residue value=2; valuation formula ord(b)Tr(a)=2·1=2 mod 3 | Pass, [R1][prior] | None |
| 4.3 bilinearity and trivial factors | a=0 or b=1; constants a=1,b=T,T² | values 0,0 and 1,2; [1,T·T)=1+1=2 | Pass, [R1][prior] | None |
| 4.3 finite/nonfinite dual carrier | n=1 versus infinite length | T^p has exponent class 0 modulo (K×)^p; at length 2 its valuation class is p≠0 mod p² | Pass, [R1][prior] | None |
| 4.4 finite conductor formula | p=3,m=2; n=1,2; v(c)=0,1 | conductors 3,7 for unit coefficient; n=2,v(c)=1 gives 3; constant-only gives 0 | Pass, [R1][prior] | None |
| 4.4 primitive normalization | x=2[T⁻¹], x₀=[T⁻¹] | n₀=1; normalized G¹ bound 1−1=0; evaluation on x has image 2ℤ₂, not ℤ₂ | Pass, [R1][prior] | None |
| 4.4 missing-clamp negative control | p=2, x=β+2[T⁻³], r=1 | correct bound=1+max(0,ceil(log₂(1/3)))=1; unclamped bound=0; inertia 2ℤ₂≠ℤ₂ | Pass, [R1][prior] | None |
| 4.4 compositum conductors | conductors exponents 2 and 3 | ideal lcm=π³; exponent max(2,3)=3, not 5 | Pass, [R1][prior] | None |
| 4.5 ray quotient and degree splitting | ℙ¹/𝔽₃, m=0,[0]+[∞],2∞ | degree-zero groups of sizes 1,2,3; quotient adds a discrete ℤ degree direction | Pass, [R1][prior] | None |
| 4.5 quotient versus selected conductor | wild quotient B=ℤ/2, select trivial character | quotient conductor exponent 2; selected conductor 0 | Pass, [R1][prior] | None |
| 4.5 completion/truncation coordinates | T-adic O, N=0,1,2 | quotients 0,k,k[T]/T²; sizes 1,q,q²; the N=0 unit group has one element | Pass, [R1][prior] | None |
| 4.5 coordinate-change compatibility | T′=T+T² modulo T³ | T=T′−T′² mod T′³; composing gives T mod T³, so the truncation comparison is not identity on coefficients | Pass, [R1][prior] | None |
| 4.6 rigidified Picard dimension | g=0, modulus lengths N=0,1,2 | dimensions 0,0,1; using g+N−1 at N=0 would give −1 | Pass, [R1][prior] | None |
| 4.6 reduced/nonreduced unit sequence | ℙ¹, m=0+∞ versus 2∞ | kernels G_m versus G_a; over 𝔽₃ point counts 2 versus 3 | Pass, [R1][prior] | None |
| 4.6 non-split modulus | single degree-2 point over 𝔽₃ | Res 𝔽₉×/𝔽₃× has order 8/2=4; one-dimensional torus, not additive group of order 3 | Pass, [R1][prior] | None |
| 4.6 rigidification and base-change automorphisms | m rational point; dual-number base | scalar 1+ε preserves the identity frame only if ε=0; normalized units on 2∞ are 1+bT and multiply by adding b | Pass, [R1][prior] | None |
| 4.6 torsor/Brauer distinction | real conic, degree-2 m | Pic_m¹(ℝ)=empty; Pic_X¹(ℝ) has one point; hence scheme torsor does not imply rational section | Pass, [R1][prior] | None |
| 4.7 Abel map and high-degree fibre | ℙ¹, m=2∞, n=1,2 | vector-torsor fibre ranks 0,1=n−2−0+1; n=1 Abel map A¹→G_a is t↦t | Pass, [R1][prior] | None |
| 4.7 ordinary modulus boundary | m=0, ℙ¹, n=0,1 | ordinary Abel fibres are P⁰,P¹, dimensions 0,1; positive-modulus affine formula is not used | Pass, [R1][prior] | None |
| 4.7 Rosenlicht modulus | t: G_m→G_m; t:A¹→G_a | least moduli 0+∞ and 2∞ respectively; modulus ∞ alone gives J=0 and cannot factor the nonconstant additive map | Pass, [R1][prior] | None |
| 4.7 nontrivial genus threshold | g=1,N=1,n=2 | rank=n−N−g+1=1; n=1 lies below sufficient bound 2g+N−1=2 | Pass, [R1][prior] | None |
| 4.8 ray/rigidification coordinate | k=𝔽₅, local unit u=2 | idele gives (O,u⁻¹)=(O,3); unit-sequence boundary gives (O,2); 2·3=1 | Pass, [R1][prior] | None |
| 4.8 principal relation and tensor | principal f=2, tensor unit frames u=2,v=3 | constant principal idele is zero in ray quotient; tensor frame u⁻¹v⁻¹=1=(uv)⁻¹ | Pass, [R1][prior] | None |
| 4.8 degree and empty modulus | ℙ¹,m=0, divisor d∞, d=−1,0,2 | line bundles O(−1),O,O(2), degrees −1,0,2 on both sides | Pass, [R1][prior] | None |
| 4.9 multiplicative Lang cover | G_m/𝔽₃, Frob−id | Lang map z↦z²; equation z²=t has two geometric sheets and connected function field; inverse sign would invert deck class | Pass, [R1][prior] | None |
| 4.9 additive Lang cover | G_a/𝔽₃ | Lang map y↦y³−y; y³−y=t has degree 3 and derivative −1=2, hence étale on A¹ | Pass, [R1][prior] | None |
| 4.9 degree-d Frobenius | G_a/𝔽₃, v degree 2 | two iterations give y⁹−y=t+t³=Tr_𝔽₉/𝔽₃(t); subtracting 2a gives [v]−2a | Pass, [R1][prior] | None |
| 4.10 B-torsor classification | B=0; B=ℤ/4, θ=0 | degrees 1 and 4; connected components 1 and 4; zero character need not mean identity cover for fixed nontrivial B | Pass, [R1][prior] | None |
| 4.10 connectedness | B=ℤ/4, θ=2deg | image size 2; components=4/2=2; each component is a constant quadratic cover | Pass, [R1][prior] | None |
| 4.10 geometric connectedness/constants | B=ℤ/3, θ=deg mod3 on ℙ¹ | connected components 1; geometric components 3; constant degree 3=[B:0] | Pass, [R1][prior] | None |
| 4.10 norm subgroup | constant quadratic cover | norm degrees=2ℤ; cover degree=2=index; kernel of degree itself would have infinite index | Pass, [R1][prior] | None |
| 4.10 pushout and splitting independence | replace a by a+b, θ(b)=1 mod3, d=2 | geometric contribution changes −2=1; constant contribution +2; total change 0 mod3 | Pass, [R1][prior] | None |
| 4.10 least conductor tame boundary | z^(q−1)=t, q=2,3 | q=2 degree1/conductor0; q=3 degree2/conductor 0+∞, exponent1 at each point | Pass, [R1][prior] | None |
| 4.10 wild least modulus | y²−y=t on A¹ | same open for ∞ and 2∞; Swan1, conductor2; character factors through 2∞ only | Pass, [R1][prior] | None |
| 4.10 conductor as character maximum | B=(ℤ/2)², local character depths 1,3 | joint kernel first contains U³; maximum=3; trivial character depth0 does not determine quotient conductor | Pass, [R1][prior] | None |
| 5.1 effective divisors/zeta definition | ℙ¹/𝔽₂, n=0,1,2,3 | A_n=1,3,7,15; generating series coefficients equal these integers | Pass, [R1][prior] | None |
| 5.1 placeCount and pointCount | ℙ¹/𝔽₂, r=0,1,2 | place counts B₁=3,B₂=1; N₀=0 by empty divisors, N₁=3,N₂=3+2=5 | Pass, [R1][prior] | None |
| 5.1 Euler product headline | same curve, coefficient T² | three degree-1 places contribute binomial(4,2)=6; one degree-2 place adds1; total7=A₂ | Pass, [R1][prior] | None |
| 5.1 logarithmic derivative headline | same curve, r=1,2,3,4 | rA_r=3,14,45,124; convolutions give 3,9+5,21+15+9,45+35+27+17 | Pass, [R1][prior] | None |
| 5.1 Möbius inversion/base extension | q=2, r=2 | B₂=(N₂−N₁)/2=(5−3)/2=1; base-extension rational points N₂=5 | Pass, [R1][prior] | None |
| 5.2 large-degree count headline | ℙ¹/𝔽₂,n=0,2; E/𝔽₅,g1,h9,n1 | (q−1)A_n=1,7,36; RHS=2¹−1,2³−1,9(5−1), respectively | Pass, [R1][prior] | None |
| 5.2 sharp bound | genus1,n=0 | hypothesis 2≤1 fails; A₀=1, whereas unguarded RHS=h(5⁰−1)=0 | Pass, [R1][prior] | None |
| 5.3 rationality and degree headline | ℙ¹/𝔽₂ | Z=(1−T)⁻¹(1−2T)⁻¹; numerator1, degree0=2g, leading coefficient1=2⁰ | Pass, [R1][prior] | None |
| 5.3 genus-one numerator/reciprocity | E:y²=x³+x+1 over 𝔽₅ | N₁=9; L=1+3T+5T²; a₂=5a₀=5, a₁=9−6=3, L(1)=9=h | Pass, [R1][prior] | None |
| 5.3 functional equation | same L | 5T²L(1/(5T))=5T²+3T+1=L(T) | Pass, [R1][prior] | None |
| 5.4 scheme/Jacobian reversal | same E | charpoly X²+3X+5 reverses to 1+3T+5T²; constants 5 versus1 distinguish the two | Pass, [R1][prior] | None |
| 5.4 root bound and counts | same E | discriminant −11, both root norms √5; S₂=9−10=−1, N₂=26−(−1)=27 | Pass, [R1][prior] | None |
| 5.5 constant extension | same E, r=2 | L₂=1+T+25T²; L(T)L(−T)=1+T²+25T⁴=L₂(T²) | Pass, [R1][prior] | None |
| 5.5 rational curve extension | q=2,r=2 | Z₂(T²)=1/((1−T²)(1−4T²)); Z(T)Z(−T) has the same denominator | Pass, [R1][prior] | None |
| 5.6 data predicate and uniqueness headline | g=0, q=0,1,2 | P.coeff0=1, natDegree≤0 force P=1 in all three cases | Pass, [R1][prior] | None |
| 5.6 data for junk q values | g=1,N₁=9,q=0,1,5 | unique P=1+8T, 1+7T+T², 1+3T+5T²; leading degree may drop at q=0 | Pass, [R1][prior] | None |
| 5.6 Newton recovery with g2 | q=2, N₁=3,N₂=13 | a₁=0; 2a₂=13−4−1=8 so a₂=4; symmetry a₃=0,a₄=4; P=1+4T²+4T⁴ | Pass, [R1][prior] | None |
| 5.6 actual L-polynomial data headline | E/𝔽₅, g1,N₁9 | r=1 identity 1·3=(9−5−1)·1=3; symmetry fixes a₂=5 | Pass, [R1][prior] | None |
| 5.7 characteristic-series definition | rank-one module, u=2 in ℤ/5 | series1−2T; one shift gives inverse, coefficient T is2 rather than−2 | Pass, [R1][prior] | None |
| 5.7 representative and base-change API | [A→¹A], u=id; A→A/2 | series(1−T)/(1−T)=1 before/after reduction; acyclic replacement contributes1 | Pass, [R1][prior] | None |
| 5.7 perfect versus projective cohomology | [ℤ/4→²ℤ/4], u=id | termwise determinant ratio1; H⁰=H¹=ℤ/2, nonprojective over ℤ/4 | Pass, [R1][prior] | None |
| 5.7 finite-ring local Euler factor | Λ=𝔽₃×𝔽₃, inertia(−1,1) | invariants0×𝔽₃; determinant(1,1−T); inverse(1,(1−T)⁻¹), not1 | Pass, [R1][prior] | None |
| 5.7 lift independence/unit constant | unramified line Frobenius a=2 in 𝔽₃; zero stalk | P=1−2T and P=1; constant term1 in each; multiplying Frobenius lift by inertia acts identically on invariants | Pass, [R1][prior] | None |
| 5.7 cohomological identity headline | constant 𝔽₃ sheaf on ℙ¹/𝔽₂ | H⁰,H² factors1−T,1−2T; inverse product agrees with Euler zeta, H¹ dimension0 | Pass, [R1][prior] | None |
| 5.7 traces do not determine determinant | id on 𝔽₂² versus zero-dimensional module | all power traces0 in both; determinants1−T² and1 differ | Pass, [R1][prior] | None |
| 5.8 finite counts/conjugacy/additivity | constant C₂ cover of ℙ¹/𝔽₂ | degree1 counts identity0, nonidentity3; disjoint union count3=0+3; empty count0 | Pass, [R1][prior] | None |
| 5.8 progression and explicit bound | trivial cover ℙ¹/𝔽₂, r1,2 | rπ=3,2; main terms3,5; errors0,3; bounds√2+1 and6, respectively | Pass, [R1][prior] | None |
| 5.8 geometric/nonabelian coefficient | G=S₃, N=G, class of 3-cycles | class size2, coefficient2/6=1/3; each inverse remains in class. Constant C₃ with N=1 instead has coefficient1 | Pass, [R1][prior] | None |
| 6.1 affine adelic points | G=G_a,G_m,α₂ over 𝔽₂(t) | G_a(A)=A; G_m(A)=A× with integral units; α₂(K)=α₂(A)={0}, so smoothness is not silently assumed | Pass, [R1][prior] | None |
| 6.1 discrete diagonal/finite stabilizers | G_a, standard integral compact | K∩∏O_v=𝔽_q has q elements; G_m gives 𝔽_q× with q−1 elements | Pass, [R1][prior] | None |
| 6.1 model independence | enlarge S by one place | one local integral restriction replaced by the full completion; restricted-product union unchanged | Pass, [R1][prior] | None |
| 6.2 function modules/central quotient | G=GL₁, ℙ¹, Ξ degree subgroup3ℤ | double quotient=ℤ/3; all/cpt/cusp modules R³ since no proper parabolic | Pass, [R1][prior] | None |
| 6.2 omission of central quotient control | same with Ξ=0 | double quotient=ℤ; finite-support functions R^(ℤ) differ from all functions R^ℤ | Pass, [R1][prior] | None |
| 6.2 scalar extension and Hecke | 3-point quotient R=ℤ[1/2]→ℚ | finite-support scalar extension gives ℚ³; translation permutes the three coordinate functions | Pass, [R1][prior] | None |
| 6.3 probability constant term | constant function1, any allowed unipotent quotient | integral1=1; zero function gives0, so constant nonzero function is not cuspidal for a proper parabolic | Pass, [R1][prior] | None |
| 6.3 stabilizer weights | Heisenberg group, p=2 | orbit weights1/4,1/4,1/2 sum1; unweighted equal averaging1/3 gives different values on an orbit indicator | Pass, [R1][prior] | None |
| 6.3 coefficient hypothesis | p=2,R=𝔽₂ versus R=ℤ[1/2] | 1/2 undefined in the first; 2·(1/2)=1 in the second, as required | Pass, [R1][prior] | None |
| 6.3 transitivity/equivariance | finite product additive quotient of order4 | iterated average of point indicator=(1/2)(1/2)=1/4=single average; right translation permutes terms | Pass, [R1][prior] | None |
| 6.4 reduction root sign | GL₂, g=diag(π^a,1), a=−1,0,1 | log_q\|α(g)\|=1,0,−1=−a; sign reversal changes the escaping chamber | Pass, [R1][prior] | None |
| 6.4 anisotropic and torus cases | G=1; anisotropic torus modulo compact centre quotient | no proper-parabolic conditions; finite quotient gives finite-support functions automatically; G=1 module R | Pass, [R1][prior] | None |
| 6.4 uniform support and finite generation | GL₁ ℙ¹ modulo degree3, Noetherian R | common support has3 points; module R³ finitely generated; removing Ξ makes quotient ℤ and loses this conclusion | Pass, [R1][prior] | None |
| 6.4 flat base change | finite kernel matrix [2]:R→R | R=ℤ[1/3], kernel0; flat ℚ gives0; nonflat 𝔽₂ gives full 𝔽₂, showing flatness matters | Pass, [R1][prior] | None |
| 6.5 algebraic eigenvalues/number field model | cyclic 3-point Hecke translation | matrix characteristic polynomial X³−1; eigenvalues1,ζ₃,ζ₃² lie in ℚ(ζ₃), not necessarily ℚ | Pass, [R1][prior] | None |
| 6.6 raw versus normalized Satake | GL₂,q_v=4, first Hecke operator | raw4X₁+X₂; normalized2(X₁+X₂); normalized constant term has characters2,1/2 and eigenvalue2(2+1/2)=5=q+1 | Pass, [R1][prior] | None |
| 6.6 nested constant terms | GL₃ upper Borel through Levi(2,1) | unipotent dimensions1+2=3; modulus exponents add, so successive square-root factors multiply to the Borel factor | Pass, [R1][prior] | None |
| 6.7 Yu nonvanishing headline | n=1 character; zero-vector control | character at identity1≠0; zero vector takes value0 in every degree and is explicitly excluded | Pass, [R1][prior] | None |
| 6.7 differential/degree cancellation | g=0,n=2, ω=dt | diagonal Yu degree n(n−1)(g−1)=−2; scalar degree1 contributes2; total0 | Pass, [R1][prior] | None |
| 7.1 unramified inducing-character obstruction | E/𝔽₃:y²=x³+2x²+2x, degree2 self-isogeny | E(𝔽₃)={O,(0,0)}; fibre polynomial x²+2x+2 has no root; kernel class maps to η=−1, so odd n is obstructed | Pass, [R1][prior] | None |
| 7.1 even n and constant cover | same η,n=2; constant quadratic extension | η²=1 on pullback kernel; constant-cover kernel0; character (−1)^degree upstairs restricts correctly | Pass, [R1][prior] | None |
| 7.1 arbitrary finite ramification | local quadratic character conductor2 | a sufficiently small unit subgroup U² is killed, U¹ need not be; open-level extension allows this character | Pass, [R1][prior] | None |
| 7.2 induced section normalization | split H₁=GL₂,q_v=4,s=0 | δ_P^(1/2)=\|π\|^(1/2)=1/2; unnormalized exponent s+1/2 and normalized exponent s both give1/2 | Pass, [R1][prior] | None |
| 7.2 spherical and arbitrary flat sections | identity/unipotent and scalar multiple2Φ | normalized values1,1; scaled values2,2, so spherical normalization excludes rescaling | Pass, [R1][prior] | None |
| 7.2 full fixed-centre parameter | split GL₂, whole-group parabolic | central degrees2ℤ; solutions z²=1 are ±1; identity component alone loses one component | Pass, [R1][prior] | None |
| 7.2 cuspidal continuation headline | P=H_n; proper split rank1 Borel | whole-group series one term f, denominator1; Borel constant term two Weyl terms | Pass, [R1][prior] | None |
| 7.2 Levi discrete decomposition headline | unitary determinant character on GL₂ | unipotent restriction1, constant term1; square-integrable modulo centre but not cuspidal, hence residual branch necessary | Pass, [R1][prior] | None |
| 7.2 discrete-data continuation headline | whole-group residual datum | E=f, intertwiner=id, denominator1; no pole or residue is invented by induction from P=G | Pass, [R1][prior] | None |
| 7.2 Siegel convergence/rationality | n=1,q=3,s=1; n=0 | 1>1/2 lies in the asserted region; n0 gives one-term constant series1; period changes q⁻s by exp(−2πi)=1 | Pass, [R1][prior] | None |
| 7.2 nonunitary split twist | χ₀=absolute value, g fixed | twist multiplies all summands by the same \|det g\|; relative convergence ratio unchanged1 | Pass, [R1][prior] | None |
| 7.3 Hermitian trace pairing | 𝔽₄/𝔽₂, basis1,u with u²+u+1=0 | Tr(x·bar(y)) Gram=[[0,1],[1,0]], determinant1; diagonal rank1 pairing matrix[1] | Pass, [R1][prior] | None |
| 7.3 split trace pairing | matrix units E₁₂,E₂₁ | Tr(E₁₂E₂₁)=1; Tr(E₁₂E₁₂)=0; no factor2 | Pass, [R1][prior] | None |
| 7.3 Fourier sign/dual | finite 𝔽₃ additive quotient, frequency1 | sum_b ψ(b)ψ(−b)/3=1; opposite extracted frequency gives(1+ζ₃+ζ₃²)/3=0 | Pass, [R1][prior] | None |
| 7.3 rational versus adelic Levi | n1,T=1; α_v=π at one place only | local new index π² at that place,1 elsewhere is not rational; rational α=t has global norm1 and rational new index t² | Pass, [R1][prior] | None |
| 7.3 local Levi covariance | split rank1,q_v=3, α=(π,1), χ=1,s=0 | factor \|detα\|^(1/2)=3⁻¹/²; omitting Jacobian would give3¹/² | Pass, [R1][prior] | None |
| 7.3 factorization volume | g=0,1; n=1,2 | prefactors q,q⁴ and1,1; product-integral quotient volumes q⁻¹,q⁻⁴ and1,1 | Pass, [R1][prior] | None |
| 7.3 singular-index control | T=0, split rank1 | constant coefficient has s and−s terms; nonsingular product theorem is not applied | Pass, [R1][prior] | None |
| 7.3 ramified local rational factors | Φ_v=0,Φ_v,2Φ_v | factors0,W,2W; unramified split unit line at q3,s0 has W=2/3 | Pass, [R1][prior] | None |
| 7.4 representation density | split q3, rank1,N2, Gram1 andπ | counts6,12 modulo9; divide by9 to get2/3,4/3; inert unit line count12/9=4/3 | Pass, [R1][prior] | None |
| 7.4 rank and empty embedding | n=0; m=0<n=1 | representation counts1 and0; densities1 and0 | Pass, [R1][prior] | None |
| 7.4 cross-dual and half-length | split L=(O,πO), L′=(O,O) | L∨=(π⁻¹O,O); L′/L total length1, half-length1/2, exponent2ℓ′=1 | Pass, [R1][prior] | None |
| 7.4 weight polynomial | a=0,1,2; inert q2 | m=1,1−T,(1−T)(1+2T); split a2 uses(1−T)(1−2T) | Pass, [R1][prior] | None |
| 7.4 self-dual density and interpolation | n=1,j=0,q3 | split denominator1−1/3=2/3; inert1+1/3=4/3; normalized self-dual value1 | Pass, [R1][prior] | None |
| 7.4 nonzero denominator | q2,i=1,j=0, η=±1 | factors1/2 and3/2; neither0. q1 would give a zero factor and is excluded | Pass, [R1][prior] | None |
| 7.4 rank-one polynomial | Gramπ, split/inert | overlattice sums1+T and1−T; at T=1 yield2 and0, matching representation obstruction in inert case | Pass, [R1][prior] | None |
| 7.4 polynomial functional equation | inert length2 | P=1−T+T²; T²P(1/T)=T²−T+1; constant/leading coefficients1,1 | Pass, [R1][prior] | None |
| 7.4 equal-characteristic-two reciprocity | Q=π⁻¹O_𝔽₄²/O_𝔽₄² | three isotropic lines; (1−T)(1+2T)+3T²=1+T+T²=T²P(1/T) | Pass, [R1][prior] | None |
| 7.4 negative-integrality control | rank1 Gramπ⁻¹ | L not contained in L∨; quotient L∨/L unavailable; polynomial theorem correctly excludes it | Pass, [R1][prior] | None |
| 7.5 local Whittaker/density headline | unit line, split/inert q3,s0 | Den=1, W=L₁⁻¹=1∓1/3, hence2/3 and4/3 | Pass, [R1][prior] | None |
| 7.5 oscillator dimension/interpolation | n1,j1, q3 | source rank n+2j=3; argument T=q⁻²=1/9, not −1/3 from an erroneous one-rank increment | Pass, [R1][prior] | None |
| 7.5 Whittaker vanishing | inert rank1 Gramπ,s0 | Den(1)=1−1=0, so W=0; self-dual line instead has W=4/3 | Pass, [R1][prior] | None |
| 7.6 FYZ coefficient headline | g0,n1, Serre-self-dual E of total degree−2 | exponent −(−2)(s−1/2)−(−2)/2=2s; coefficient χ(detE)q^(2s)L₁⁻¹, Den=1 | Pass, [R1][prior] | None |
| 7.6 genus-one and rank-zero cases | g1,degree E0; n0 | exponent0, normalized polynomial1; coefficient χ(detE)L_n⁻¹. n0 gives1 | Pass, [R1][prior] | None |
| 7.6 local-to-global density degree | one degree-d place, local length r | local q_v^(−2s) powers give degree2dr in q⁻s, matching the global torsion degree | Pass, [R1][prior] | None |
| 7.6 nonintegral Fourier index | one local nonintegral entry, spherical section | local integral vanishes0 by translation character; global coefficient product0 | Pass, [R1][prior] | None |
| 7.6 ramified section dependence | replace one local section by2Φ | one factor doubles and global integral doubles; a section-independent density replacement would not | Pass, [R1][prior] | None |
| Worked elliptic example | E/𝔽₅, rational x-parameter | pole orders x=−2,y=−3; L(4∞)=span(1,x,x²,y), dimension4=4+1−1 | Pass, [R1][prior] | None |
| Worked wild reduced basis | y³−y=t⁻², x=t⁻¹ | pole orders x=−3,y=−2; d=(0,−1,−2), shifted r1 dimension3, r2 dimension6, agreeing 3r for r≥1 | Pass, [R1][prior] | None |

## Not verifiable

These access limitations remain settled, as in [R1][prior]. None was reopened or added to a missing-reference request; no source manifest was edited.

- **hess:** Proposition 9 and Remark 10, manuscript p.7 (§1.1), and Theorem 7/Corollary 11 (§1.2). Author-manuscript access remains uncertified; the supplied cache has no readable legal text.
- **rosen:** Chapter 5, pp.45–46, Theorems 5.9–5.10. Publisher/preview access remains uncertified.
- **goss:** §1.1, Example 1.1.1 and Proposition 1.1.2, p.1. Publisher-preview access remains uncertified.
- **stichtenoth:** §5.1, Lemma 5.1.1, Definition 5.1.2 and Proposition 5.1.3, pp.185–186. Publisher-preview access remains uncertified.
- **sga4half:** Fonctions L modulo ℓⁿ et modulo p, Théorème 2.2. The proof remains uncertified; R1 read its statement in Stacks Tag 03UZ.
- **roquette:** §4.3.3, pp.25–28, and §8.1 remain waived. Revised degree and recurrence contracts were verified in named suppliers without requesting this text again.

Unchanged portions retain the prior review's evidence and limitations. This round does not certify later published numbering of an unread edition of Kosters–Wan; it checks the cited 2016 text's Theorem 3.4 and pages 8–9.

## Source issues

These source slips were re-encountered this round; the other source issues in [R1][prior] were not re-audited.

- **Misprint** in kw at Theorem 3.2(i) proof, p.7, kw line 299: the source says the translated vector has a plus-one sign after choosing 1=α−σα; it should be σα=α−1 with consistent subtraction; affects the proof.
- **Misprint** in kw at Theorem 3.4 proof, p.9, kw line 378: the source says the character-surjectivity argument establishes φ₁ before dualizing to φ₂; it should be φ₂ first, followed by its dual φ₁; affects the proof.
- **Misprint** in kosters at Corollary 1.2, p.2, kosters line 81: the source says the weighted sum ranges over all places; it should be over rational places, as in Theorem 1.1 and its proof; affects a stated result.

The README's pairing and rational-point reading of the Chebotarev estimate do not reproduce these slips.
