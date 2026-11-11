<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13017#issuecomment-6789806779 -->
Review (codex) of ea91ee6

Verdict: accepted
Conditional on the announced gaps: `framed-ring-components`, `crystalline-inertial-types`, `principal-series-types`, `minimal-stratum-types`, `projective-products`, `completed-tensor-reduced-equidimensional`, `geometric-component-splitting`, `pd-crystalline-lift`, `algebraic-capture`, `crystalline-lift-prescribed-determinant`, `crystalline-closure-components`, `local-benign-crystalline-points`, `berthelot-points-components`

No findings. Acceptance is conditional on the thirteen declared supplier contracts listed below. No mathematical package input was edited, and no source-manifest entry was added or changed.

## Verified sound

### Previous finding and changed passage

The previous review has one finding, F01 (P3). It is **repaired**. In `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:50`, the replacement is “EP Lemma 2.9, p. 344; Proposition 3.1 and Corollary 3.2, p. 351”. EP line 317 gives printed page 344, containing Lemma 2.9 at EP lines 333–345. EP line 610 gives printed page 351, containing Proposition 3.1 at EP line 616 and Corollary 3.2 at EP lines 618–621. These are separate correct page locators.

I independently checked the repaired sentence's mathematics: tensor stability retains W≠0, projectivity, continuous finite-dimensional representations and the split connected reductive generic fibre. For H=1, M=O and W=0 the testing kernel is O, whereas for W=L the original kernel is unchanged and is zero. Thus moving the locator did not hide a missing nonzero hypothesis.

The pattern sweep checked the other grouped EP references against the page markers: Lemma 2.8 is on 344, Proposition 2.11 on 345, Proposition 2.23 on 350, Proposition 3.7 on 353, Proposition 3.11 on 354, Definition 3.17 on 355, Proposition 3.19 and Lemmas 3.20–3.21 on 356, Lemmas 3.22–3.24 on 357, Propositions 3.25–3.26 on 358, Theorem 5.1 on 363–364, Theorem 5.3 and its proof on 365, and Theorem 6.12 on 369–370. The README's enclosing ranges contain these statements. The unrepaired historical design copy is outside the four package inputs being reviewed and is not a package finding.

I read all 21 numbered targets, their API bullets, Checks, proof routes and Needs lines. All fifteen seeded targets and all seven headline endpoints received fresh source and mathematical checks. For untouched additional controls I used the previous review only where its adversarial table supplies computed values, including the source-dimension and admissible-depth controls; its general assurances were not treated as evidence. The present tables record the computations used for this verdict.

### Sources and seeded sample

The manifest contains twelve distinct works, all with readable legal cached texts and version information. No author-flagged unverified locator remains. Published page numbers were distinguished from extraction/PDF page numbers. The following table verifies the hypotheses and mathematical content, as well as the numbers and pages.

| Seeded target | Source locations opened | Result |
| --- | --- | --- |
| 1.2 Potentially diagonalizable lift input | EG Theorem 1.2.2, p. 3, EG lines 193–200; Definition 6.4.2 and Theorem 6.4.4(1), pp. 168–169, EG lines 6946–6965; BIP lines 2329–2335 | The lift is crystalline, regular and potentially diagonalizable after coefficient extension. The local existence theorem has no p∤2d restriction. The restriction remains on the parent patching application. |
| 2.1 Patched deformation components | BIP Lemma 6.3, p. 47, BIP lines 2339–2360; HP Appendix A.1–A.5, pp. 48–50, HP lines 2680–2759; CEGGPS Corollary A.2, p. 83, CEGGPS lines 3304–3324 | The auxiliary ring is reduced, O-flat and equidimensional; geometric splitting precedes component-pair indexing. The determinant is fixed only on p-power torsion. The three additional supplier contracts are explicit. |
| 2.2 Roots of torsion-free characters | BIP Lemma 6.4, p. 47, BIP lines 2364–2378 | Triviality on torsion, finite coefficient extension and continuity are present. The result also allows p dividing d; the Teichmüller and principal-unit parts are separated. |
| 2.3 Algebraic central character | BIP Lemma 6.6, p. 48, BIP lines 2396–2412; CEGGPS geometric reciprocity at CEGGPS lines 533–535 | The exponent is d(d−1)/2. The compact action is δ⁻¹, its Banach dual action is δ, and algebraicity on units requires crystalline ψ. Nonzero fixed-centre projectivity is supplied by the parent. |
| 3.1 Capture and scalar actions | EP Definition 2.1 and Lemmas 2.2–2.10, pp. 342–345, EP lines 266–354; Proposition 3.1 and Corollary 3.2, p. 351, EP lines 612–621 | Capture is precisely the common-kernel condition. Torsion-free duality, nonzero tensor factors, projectivity and the extra faithfulness needed to conclude that a scalar itself is zero are distinguished. The repaired page assignment is correct. |
| 3.2 Patched testing modules | BIP p. 48, BIP lines 2413–2418; CEGGPS §1.8, p. 14, CEGGPS lines 518–525; EP Proposition 2.11 proof, p. 345, EP lines 369–377 | The Schikhof double dual, stable lattice and rational lattice independence agree. Finite-index continuous induction is imported separately. Reduced faithful arithmetic quotients are not inferred from compact projectivity alone. |
| 3.4 Fixed-centre algebraic density | DPS Theorem 7.4, p. 41, DPS lines 1912–1928; Corollaries 7.5–7.8, pp. 42–43, DPS lines 1930–1997 | The group is connected reductive and split over L; H is compact open; Π is an admissible unitary finite regular summand; T has the prescribed central character and is nonzero. Only density is claimed, avoiding the false injectivity assertion in DPS Corollary 7.7. |
| 3.5 Algebraic detection of projectives | BIP Lemma 6.7, p. 49, BIP lines 2432–2446 | The nonzero fixed-centre projective hypothesis, product decomposition, arbitrary rational highest weights and dualization all appear. Determinant powers alone would not suffice. |
| 4.1 Detection of local components | BIP Theorem 6.8 proof, p. 49, BIP lines 2448–2461; parent §5.3 scheme-support theorem | The package selects a supported component through a characteristic-zero fixed-determinant point. It does not assert that the entire algebraic-test support lies in a single component. |
| 4.2 Faithfulness of the local deformation action | BIP Theorem 6.8 and Remark 6.9, pp. 49–50, BIP lines 2447–2461 and 2484–2494 | Faithfulness concerns the unrestricted local framed ring acting on the actual patched module. Reducedness and contraction of selected minimal primes are used. It does not claim full auxiliary patched support. |
| 5.2 Density of crystalline points | BIPD Theorem 3.3, p. 8, BIPD lines 329–354; Theorem 4.2 proof, p. 10, BIPD lines 428–440; Lemma 5.1 and Corollary 5.2, p. 11, BIPD lines 442–465 | Every prime and residual representation are covered by the local route. Prescribed-determinant lifts, crystalline closure as a union of components, and point/component comparison are declared inputs. Reducedness is retained when passing from pointwise vanishing to zero. |
| 5.3 Density of principal-series points | BIP Theorem 6.1, p. 46, BIP lines 2294–2312; proof, p. 50, BIP lines 2480–2483; EP Theorem 5.1 proof and Theorem 5.3, pp. 363–365, EP lines 1126–1164 and 1191–1209 | Weight is fixed and regular; smooth characters vary. The p∤2d hypothesis, principal-series type recognition and reduced arithmetic quotients are retained. Density is in Spec R, not asserted in its rigid generic fibre. |
| 6.1 Density of benign points | NAK Lemma 4.2, pp. 120–122, NAK lines 1356–1418; BIPD Theorem 4.2 proof, p. 10, BIPD lines 428–440; EP Definition 6.8 and Proposition 6.9, p. 368, EP lines 1320–1336 | Every admissible neighbourhood on a regular crystalline locus has a benign point via the declared local contract. Combining this with §5.2 gives the all-prime assertion. The patched version is separately restricted. |
| 6.3 Density for every prescribed inertial type | BIP Remark 6.2, p. 46, BIP lines 2313–2314; CEGGPS Theorem 3.7, p. 41, CEGGPS lines 1651–1663; EP Corollary 3.2, p. 351, EP lines 618–621 | σ(τ) is nonzero, finite-dimensional and smooth, with N=0 recognition. Regular algebraic weights vary. No assertion of density with both weight and type fixed is made. |
| 6.5 Density with a minimal-stratum inducing extension | EP Lemma 3.16, p. 355, EP lines 774–782; Proposition 3.19, p. 356, EP lines 824–843; Propositions 3.25–3.26, p. 358, EP lines 899–928; Theorem 5.3, p. 365, EP lines 1191–1209; BIP Remark 6.2, p. 46 | The degree-d extension must contain a minimal element. The deep family retains n>2m, torsion-free subgroup and its character restriction. Since p∤d, the tame part of occurrence recognition applies. Full and deep point sets are distinguished. |

Additional passages opened include the weight/LLC/duality conventions in CEGGPS lines 478–535, ST Lemma 2.1, Corollary 2.2 and Theorem 2.3 (ST lines 349–383, 443–447), IYE Definition 5.8 and Proposition 5.10 (IYE lines 1012–1040), DEJ Lemma 7.1.9 (DEJ lines 2553–2562), and CON Theorem 2.3.1 (CON lines 1053–1071). IYE's trivial-residual setting is expressly disclosed in the README rather than silently generalized; the stronger statement is the declared parent contract supported by BIPD's use of the argument. The scan extraction for DEJ is noisy, but the point/completion assertion is identifiable and is independently restated with that locator in BIPD lines 442–451.

### Computed adversarial pass

These are separating tests of the statements and interfaces, not claims to prove the density theorems by finite calculations. The numbered rows cover all 21 targets, including the full seeded sample and seven headlines. “Keep” means that the existing hypotheses and Checks already distinguish the erroneous alternative.

| Statement | Instances tried | Computed values on the two sides or competing models | Result / change |
| --- | --- | --- | --- |
| Conventions and 1.1 weights | d=2, k=(2,0), then k=(1,0) | a=(1,0) then (0,0); dual highest weights (0,−1) then (0,0). Omitting the dual gives (1,0) in the first case. | Keep. The parent weight formula h_i=−λ_(d+1−i)+d−i returns (2,0) from λ=(0,−1). |
| 1.1 point predicates | d=1; rank-two Steinberg datum; coefficient embedding | Rank one has N=0 and induction degree 1, so the three fixed-weight sets agree. Steinberg has N≠0, so both potentially crystalline predicates are false. An injective field extension leaves the kernel ideal equal. | Keep. Both membership and exclusion are tested. |
| 1.2 lift | d=1; p=d=3 | A crystalline character is a direct sum with one summand. At p=d=3, 2d=6 is divisible by p: the lift contract applies and the patching hypothesis fails. | Keep. No all-prime endpoint is replaced by this patching range. |
| 2.1 tensor components | A=O; A=O[[u,v]]/(uv); A=O[[x]]/(x²−ϖ) | The first tensor is R. The node has two components. The quadratic DVR has one before adjoining a²=ϖ and two minimal primes (x−a),(x+a) afterward; 2a≠0 even at p=2. Dimensions (1+r)+(1+s)−1=1+r+s agree. | Keep. Ordinary integrality cannot replace geometric integrality. |
| 2.2 roots | d=1; d=p on ℤ_p; order-two torsion | η=ψ for d=1. With b^p=1+p, η(γ)^p=ψ(γ)=1+p. For t²=1, η(t)²=1 while ψ(t)=−1 would require −1. | Keep. Coefficient extension handles p-divisibility; torsion-triviality is necessary. |
| 2.3 central character and normalization | d=1; d=2,F=ℚ₅,ψ=1,u=2 | Exponents d(d−1)/2 are 0 and 1. δ(2)=2, compact multiplier=1/2, dual multiplier=2. Arithmetic reciprocity gives 1/2. For diag(ϖ,1), the d=2 LLC twist is (q⁻¹)^(−1/2)=q^(1/2), not q^(−1/2). | Keep. Sign, contragredient and normalization checks agree. |
| 3.1 capture and the repaired tensor sentence | H=1,M=O; M=O/ϖ; empty family; W=0 and W=L | Identity test on O has kernel 0. Every map O/ϖ→L is zero, so common kernel=O/ϖ. Empty and zero-tensor families have common kernel M. Tensor with L leaves the kernel unchanged. | Keep. Nonzero and torsion-free qualifications exclude the wrong models. |
| 3.1 scalar action | H=C₃ with nontrivial character in characteristic zero; R=ℤ/4,M=ℤ/2 | Hom from the nontrivial character to the trivial one is 0. Scalar 2≠0 in R acts by 0 on M. | Keep. Zero action implies zero scalar only with faithfulness. |
| 3.2 induction and duality | H=K; C₃⊂S₃; 1+5ℤ₅⊂ℤ₅×; O/ϖ | Hom dimensions are r=r, 2=2 and 4=4, respectively. The last inducing character u↦u is nonsmooth. The O-double dual of O/ϖ is 0, not O/ϖ. | Keep. Finite-index continuous induction and qualified duality are the correct interfaces. |
| 3.2 faithful quotient | H=1, B=O[[x]], M=B/(x²), Θ=O | M is O-free of rank 2; its double-dual test is M; Ann_B(M)=(x²). In the faithful quotient x≠0 and x²=0. | Keep. Finiteness/projectivity do not supply reducedness. |
| 3.3 capture growth | d=1,2; anisotropic subgroups of ℤ_p² | Squared-dimension totals have exponents n and 2n+2n=4n, matching nd². For pⁿℤ_p⊕p²ⁿℤ_p, index=p³ⁿ, second-coordinate coinvariants=p²ⁿ, whereas isotropic dimension-ratio prediction=p^(3n/2). | Keep. Distinct classes and the uniform-power-compatible filtration matter. |
| 3.3 source dimension/depth controls | E=F, m=1,n=4; unramified quadratic E/ℚ₅; e=2 at even n | Rank one: J/H index=1 and dim η=1. Rank two: hereditary unit index=625, E-unit index=25, J/H index=25, dim η=5, so dim V=625/(25·5)=5. At even n and e=2, gcd(e,n)=2 and I(n)=∅; odd admissible depths have gap 2. | Keep. Source formula/count errors do not invalidate cumulative capture over the full family. No exact erroneous source count is a package claim. |
| 3.4 fixed-centre evaluation | H=1,Π=L,T=L²; T=0; Π=0; PGL₂(𝔽₂) | Evaluation has source dimension 4, target dimension 1, image dimension 1 and kernel dimension 3. T=0 has image 0. Π=0 gives target/image 0. PGL₂(𝔽₂) has 6 elements and 6 independent indicator functions. | Keep. Density, not arbitrary injectivity; nonzero T; a nonabelian compact-quotient control. |
| 3.5 highest weights | GL₁ and GL₂, central exponents ±1 | GL₁ realizes θ itself. GL₂ weights (1,0),(0,−1) have central exponents 1,−1; det^m has exponent 2m, so misses both odd examples. | Keep. Rational highest weights exclude the determinant-only shortcut. |
| 4.1 component detection | Spec L[x,y]/(xy), points (1,0),(0,0); two auxiliary components | (1,0) is on V(y) only; (0,0) on both axes. Selecting (χ,𝔭₁) for each χ covers all local components but only 1/2 of patched pairs. Distinct p-power roots reduce to 1 but differ in characteristic zero. | Keep. Selecting a component through a generic point is sufficient. |
| 4.2 local faithfulness | Reduced R versus O[[x]]/(x²); zero module | Intersection of minimal primes in reduced R is 0; in the square-zero example it is (x)≠0. Ann_ℤ(0)=ℤ, while Ann_ℤ(ℤ/2)=2ℤ. | Keep. Actual supported M∞ and reduced local R are essential. |
| 5.1 testing density | O[ε]/ε²; O[[x]]/(ϖx); zero quotient; R=O | Every generic point kills ε although ε≠0. In the second ring x≠0 becomes 0 after inverting p. Zero quotient has empty spectrum. The generic point (0) of O has closure Spec O, including (ϖ). | Keep. Reducedness and O-flatness have independent roles; the zero-ring case is harmless. |
| 5.2 crystalline density | p=2,d=1,F=ℚ₂; regular and repeated rank-two weights | μ₂={±1}; xⁿ takes −1 to (−1)ⁿ, giving both component characters. Negating/reversing (2,0) gives (0,−2), still distinct; (1,1) gives (−1,−1), still repeated. | Keep. Both dyadic components and regularity are retained. |
| 5.3 fixed-weight principal-series density | Rank one, finite-order characters of ℤ_p | There are pⁿ characters of ℤ/pⁿ with fixed algebraic factor. Fixing trivial type and weight zero instead forces inertia value 1. The rigid logarithm vanishes at torsion points but is not a bounded formal-series function. | Keep. Varying conductors and scheme rather than rigid density are discriminated. |
| 5.4 unramified induced density | Unramified quadratic E/F, ψ≠ψᶜ versus ψ=χ∘Norm | The first induction is irreducible of dimension 2, with endomorphism dimension 1; the second is χ⊕χη, with endomorphism dimension 2. Degree-one induction has dimension 1. | Keep. The inducing field does not itself imply irreducibility. |
| 6.1 benign density | d=1; eigenvalues 1,p at f=1; empty crystalline space | Rank one has 0 pair exclusions, hence benign=crystalline. Ratio p is forbidden in rank two. The closure of the empty benign locus in the empty space is empty. At p=2 rank one the two parity characters meet both components. | Keep. No existence is asserted in an empty component. |
| 6.2 prescribed-type ideals | W=0; W≠0 with all algebraic weights; torsion order pᵃ | W=0 gives J=R and V(J)=∅. Full capturing nonzero family gives J=Ann_R M∞=0. Exponents modulo pᵃ give exactly pᵃ torsion restrictions; a=0 gives one. | Keep. A zero test is not an inertial type. |
| 6.3 prescribed-type density | Fixed τ and variable weights versus fixed τ and fixed weight | For rank one and μ of order pᵃ, fixed type/weight determines one torsion character; variable exponents yield all pᵃ. For p=2,a=1 the counts are 1 versus 2 (the latter is a character control, not an extension of the patched theorem to p=2). | Keep. Regular weights must vary. |
| 6.4 minimal-stratum predicate | Totally ramified uniformizer; e=6,f=2 over ℚ₅; shallow rank-one point over ℚ₃(ζ₃) | Valuation 1 is coprime to e and residue degree is 1. In 𝔽₂₅×, sixth powers form a group of order 24/6=4=|𝔽₅×|, so no residue generator of degree 2 exists. A depth-1 character is trivial on U²; m≥1 forces deep n≥3, where θ is nontrivial on Uⁿ but the shallow character is trivial. | Keep. Minimal-element existence and full/deep membership are genuinely distinct. |
| 6.5 prescribed inducing extension | E=ℚ₅(√5),d=2; E=ℚ₃(3^(1/3)),d=3; degree-12 example | First: (e,f)=(2,1), 5∤4, minimal uniformizer and tame induction apply. Second: 3 divides 6, outside density range. Third: 5∤24 but the residue calculation above rules out minimal elements. | Keep. Both degree/prime and minimal-element conditions are necessary. |

Two further source controls are numerical: for an unramified residual character over ℚ₅ with uniformizer value 2, the uncorrected algebraic-on-units lift has residual value 1≠2; the unramified factor corrects it to 2. For EP equation (15), d=1, q=5, n₀=2, n=4 gives 125−25=100 conductor-4 characters, whereas the printed shifted expression gives 25−5=20.

The standing hypotheses exclude d=0, q=1, equal-characteristic coefficient DVRs, inseparable extensions of p-adic fields and noncompact replacements for compact H. These are outside the quantified domain, not overlooked examples. Zero modules, empty families, nonreduced thickenings, the unit annihilator, identity induction, ramified coefficient extensions, p=2 and p=3 have been tested where applicable. No computed denominator vanishes. The dual and geometric-Artin conventions were also recomputed in the cited parent and character suppliers: PadicHodgeTheory uses cyclotomic weight +1, which becomes −1 here, while its arithmetic unit value 1/2 becomes 2 on geometric inversion.

### Pinned libraries, headline coverage and Lean acceptance

The manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. I opened every library identifier cited by the package at those pins; the roadmap resolver's disclaimer that it did not check pinned Lake packages was not used to waive this manual check.

| Pinned file and line | Declaration / content actually inspected |
| --- | --- |
| `Mathlib/RingTheory/Ideal/Maps.lean:869` | `Module.annihilator` is `RingHom.ker (Module.toAddMonoidEnd R M)`; membership at 871 means every scalar product is zero. `Module.comap_annihilator` at 895 retains algebra and scalar-tower binders. `Module.annihilator_eq_bot` at 901 uses a ring and additive group. |
| `Mathlib/Algebra/Module/Submodule/Ker.lean:59` | `LinearMap.ker` is comap of bottom; `LinearMap.mem_ker` at 63 is exactly f(y)=0. |
| `Mathlib/Algebra/Group/Action/Faithful.lean:47` | `FaithfulSMul` says that equality of actions on every vector forces equality of scalars; it includes no topological or arithmetic faithfulness result. |
| `Mathlib/Algebra/Module/Submodule/Lattice.lean:238` | `Submodule.mem_iInf` gives the universal membership condition for the intersection of testing kernels. |
| `Mathlib/RingTheory/Spectrum/Prime/Basic.lean:137` | `PrimeSpectrum.zeroLocus`; `vanishingIdeal` at 157 is the intersection of the primes; `zeroLocus_eq_univ_iff` at 302 gives containment in the nilradical, not equality with zero. |
| `Mathlib/RingTheory/Spectrum/Prime/Topology.lean:159` | `PrimeSpectrum.zeroLocus_vanishingIdeal_eq_closure` supplies the closure comparison. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | `TauCeti.completedGroupAlgebra` is the inverse-limit carrier, represented by its compatible-family subalgebra. It is not the arithmetic patched module. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:322` | `TauCeti.IsCompactModule.completedGroupAlgebraModule`; binders at 83–85 and 195–197 include the compact-module witness, compact coefficients/group and continuous commuting action. This supplies an action, not projectivity or a fixed-central-character decomposition. |
| `Mathlib/RingTheory/DividedPowers/Basic.lean:78` | The Berthelot-related search result is `DividedPowers`, with a function on an ideal and divided-power laws. It supplies neither a rigid generic-fibre functor nor a crystalline-representation predicate. |

Object searches in both pinned libraries covered universal framed local deformation rings, arithmetic-point Galois representations, patched modules, crystalline and potentially semistable representation predicates, Weil–Deligne objects, benign refinements, Schikhof capture and rigid generic fibres. Hits for semistable elliptic reduction and divided powers are different objects. The native spectra, kernels, annihilators and completed group algebras are correctly imported; they do not make the arithmetic endpoints statable with a few simple definitions.

| Headline in README summary | Target | Acceptance-file coverage |
| --- | --- | --- |
| Local deformation action is faithful | 4.2 | Named explicitly; missing universal framed ring, attached representations and actual patched module. |
| Regular crystalline points dense at every prime, scheme and rigid | 5.2 | Named explicitly; missing that ring, crystalline predicate and Berthelot generic fibre. |
| Fixed-regular-weight potentially crystabelline density | 5.3 | Named explicitly; missing deformation/point carriers and potentially crystalline abelian-inertia conditions. |
| Fixed-weight unramified-induced supercuspidal density | 5.4 | Named explicitly; additionally needs WD and induced irreducibility. |
| Benign crystalline density at every prime | 6.1 | Named explicitly; additionally needs the benign Frobenius/refinement predicate. |
| Density for each inertial type, weights varying | 6.3 | Named explicitly; missing the arithmetic carrier and type/LLC interfaces. |
| Fixed-weight minimal-stratum density for prescribed inducing field | 6.5 | Named explicitly; additionally needs hereditary orders, simple characters and occurrence. |

`packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/Suggested.lean` has one `import Mathlib`, one module docstring and an empty namespace. It contains **zero declarations and zero sorried theorems**. The exhaustive one-tactic padding probe therefore has zero targets; the exhaustive `#check @name` binder audit also has zero targets. No signature was changed or needs a stand-in. Every backticked item in the README is imported vocabulary or mathematical notation; no undeclared owned Lean identifier is promised.

The required `lake env lean` invocation, from the pinned content checkout against the package file, completed with **exit 0, no output and no warnings**. No TauCeti import required a build and no Lean process remains running. There is no prohibited import, `set_option`, sorry'd data, arbitrary Prop field or boundary-case padding.

### Supplier resolution, ownership and order

The following sections were resolved anew using the roadmap service at main or the indexed open head. Locations refer to each supplier's `TauCetiRoadmap/<Name>/README.md`. The pull-request identifiers here identify the evidence; none is introduced into roadmap prose.

| Supplier and revision | Sections and file lines opened | Resolution |
| --- | --- | --- |
| CompletedCohomologyAndLocalGlobalCompatibility, #1270 | 5.1 at 1852; 5.2 at 1907; 5.2a at 1941; 5.3 at 1966 | Owns actual patching, fixed-centre projectivity, arithmetic typed quotients, benign/trianguline geometry and union-of-components support. General capture and all-prime local geometry are explicitly contracted gaps. |
| LocalGaloisDeformationRings, #923 | F.0.1 at 98; 1.1 at 1275; 1.19 at 1549; 3.1 at 2240; 3.4 at 2291; 3.9 at 2387 | Supplies completed-product dimension, universal framed rings, characters and Hodge/type quotients. Full unrestricted component structure is a declared gap. |
| DeformationAndDerivedPatchingAlgebra, #1034 | 1.12 at 281; 4.4 at 943; 4.6 at 990; 4.7 at 1005 | Supplies complete local tensor, generic Jacobson points, component/dimension and reduced-flat point detection. Extra reducedness and splitting inputs are separately declared. |
| CompletedCohomologyPartII, #1035 | F.1 at 183; F.2 at 201; F.4 at 241; 3.2 at 786 | Supplies compact/lattice dual topologies, balanced tensors and qualified torsion-free biduality. The package keeps these hypotheses. |
| PadicLocalLanglandsForGL2Qp, #1312 | 0.1 at 205, analytic-vector contract at 168; 3.6a at 1122 | General compact analytic density is imported; the existing GL₂/ℚ_p benign density is expressly distinguished from arbitrary F,d. |
| SmoothRepresentationsOfLocalGroups, #1688 | SR.2.1 at 1916; SR.3.1 at 2571; SR.3.2 at 2710; SR.5.2 at 3840, simple-type paragraph at 3886 | Supplies induction, Bernstein theory and type background. The precise finite-coefficient EP families and crystalline type recognition are declared extensions of this owner. |
| EndoscopicTransferAndUnitaryTraceComparison, #999 | 10.21 at 4013; 10.26 at 4125; 10.30 at 4208 | Supercuspidal and full WD correspondence, including N and geometric reciprocity, resolve. CEGGPS normalization is an explicit twist. |
| ModularityAndLanglandsExtensions, #1180 | 2.1 at 776 | Owns potential diagonalizability and component criteria. Universal crystalline lift existence and prescribed determinants are the two declared contracts. |
| ArithmeticGaloisRepresentations, #856 | 1.3 at 995, including finite-transversal continuous induction | Both adjunctions, duality and continuous nonsmooth coefficients resolve; the package's compact-source formula uses the same finite coordinates. |
| PadicHodgeTheory, #1062 | 3.3 at 682; 3.4 at 705; 3.5 at 732; 3.6 at 754, character interpolation at 762–764 | Crystalline/semistable/WD input and crystalline character interpolation resolve, including the residual unramified factor. Weight and reciprocity signs are transported. |
| ClassFieldTheory, main | Former-number map at 255–267; C.6 at 531; Layer 7 at 1204; Layer 9 at 1576 | Former §2.6 explicitly maps to C.6. Arithmetic/geometric inversion, torsion-free local abelianization and Weil vocabulary resolve. |
| ReductiveGroups, main | Layer 6 at 1949, characteristic-zero complete reducibility at 1977–1991; 10B at 4143 | Rational highest-weight representations, absolute simplicity over splitting fields and coefficient transport resolve. |
| PadicMeasuresIwasawaAlgebras, main | 1.7 at 909 | Uses the same pinned completed group algebra. The compact projective-product decomposition is an explicit extra contract. |
| AdicSpacesPartIII, main | R2.9 at 7714; Berthelot functor at 7743 | Supplies the appropriate formal-scheme generic fibre. The point/completion/component interface is declared separately. |

The README and plan have the same thirteen gap slugs, each with a named supplier and explicit hypotheses: `framed-ring-components`, `crystalline-inertial-types`, `principal-series-types`, `minimal-stratum-types`, `projective-products`, `completed-tensor-reduced-equidimensional`, `geometric-component-splitting`, `pd-crystalline-lift`, `algebraic-capture`, `crystalline-lift-prescribed-determinant`, `crystalline-closure-components`, `local-benign-crystalline-points`, `berthelot-points-components`. Their requested interfaces are coherent mathematical contracts, not unowned prerequisites. No supplier is `none`. In particular the completed-tensor gap distinguishes its extra reducedness request from already supplied dimension/flatness, and the local benign contract is stronger than the parent's restricted patched statement. No redundant full gap interface was found in the inspected owners.

The board package index was read before ownership conclusions. Searches by object used the roadmap service over main and indexed open heads, as well as both pins and board material. The overlap file reports no other head changing this roadmap, no dropped cited id and no id defined only by an unacknowledged open revision. Its five closest candidates were checked:

- #1270 and #1312 are the parent and special-rank supplier resolved above.
- #1745, `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:7` and `:1044`, owns the BHHMS quaternionic module and faithful flatness under its generic global datum. That is a different module and theorem from unrestricted local BIP faithfulness.
- #1829, `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md:7`, `:11` and `:1001`, owns local models and refinement accumulation. It imports the parent trianguline carrier and does not own the present density theorem on the whole local framed ring.
- #2135, `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md:15` and `:23`, owns polarized global automorphy lifting, not the local component argument here.

Additional character-root and faithfulness leads were opened: #858, `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:4238`, concerns finite-order characters of number fields and Brauer obstructions; #1071, `TauCetiRoadmap/GL2ModularityLifting/README.md:1858`, concerns a dyadic quadratic-twist patched module. Neither duplicates the continuous torsion-trivial local root theorem or the CEGGPS module theorem here. This Part II retains ownership of its continuous testing extension, fixed-centre detection application, smooth-family capture and arithmetic component/density consequences. It adds no fully qualified Lean name that could collide with another roadmap.

Every Needs line was read manually. The requested mechanical dependency command completed with exactly:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No forbidden supplier is cited. The source proof routes use earlier targets, named supplier sections or declared gaps; no later consumer is an input.

### Shape and principles

The package continues the parent at its support theorem instead of planning it again. Its six layers have mathematical names and explicit target/layer dependencies, with Examples and Dependencies at each layer end. The order from component geometry and central characters through capture to component detection and density is forced by the displayed uses; there is no source-chapter plan. The all-prime crystalline and benign targets retain the general local route, while the separate patching results retain their actual hypotheses.

The four definition/interface blocks have API and discriminating Checks: §1.1 has five, §3.2 eight, §6.2 four and §6.4 five; the algebraic-representation interface in §3.5 has three. Every numbered target has a locator and Needs line. I compared the format with ClassFieldTheory, PadicMeasuresIwasawaAlgebras and ReductiveGroups on main. The summary, ownership, conventions, exact contracts, build explanation, downstream consumers and references are present. The Checks agree with their surrounding statements, including the nonreduced, nonfaithful, nonsmooth and shallow-depth negative controls.

No copied source passage, executable algorithm, process handoff, pull-request number in the roadmap, machine path in the package prose, prohibited Lean command or sorry'd data was found. Metadata agrees with the subject. The review requires no repair.

## Not verifiable

- The implementations of the thirteen declared supplier contracts are future work. Their exact text, owner, plan/README slug agreement and current section boundaries were checked; this acceptance is conditional on those contracts, not a claim that they are already implemented.
- The empty acceptance file cannot test a proof of a deep arithmetic theorem. Its successful elaboration checks its permitted form and import. Source comparison, dependency resolution and the computed adversarial controls supply the substantive evidence.
- No required source was inaccessible. No new missing-reference request was needed. DEJ's noisy extraction was cross-checked using BIPD's explicit restatement and locator rather than guessing an illegible formula.

## Source issues

These source issues are already avoided by the package's statements or hypotheses; they are not new package findings. The controls above also reproduce the earlier review's numerical counterexamples.

- **Error** in BIP at Lemma 6.5 proof, printed pp. 47–48: the source says the algebraic-on-units character also matches the residual character; it should include an unramified Teichmüller factor matching the uniformizer value; affects the proof.
- **Gap** in BIP at Theorem 6.8 proof, printed p. 49: the source says one supported component contains the whole algebraic-test support; it should choose a supported component through a characteristic-zero fixed-determinant point; affects the proof.
- **Misprint** in BIP at Theorem 6.8 proof, printed p. 49: the source says EP Theorem 6.12 is the scheme-support result; it should cite EP Theorem 6.3, using Theorem 6.12 for the rigid argument; affects nothing.
- **Error** in EP at Lemmas 2.6 and 2.9 and Corollary 3.2, printed pp. 343–344, 351: the source says tensor capture allows every finite-dimensional factor; it should require a nonzero factor, since zero tensor tests capture only zero; affects a stated result.
- **Misprint** in EP at equation (15), printed p. 352: the source says conductor n−i+1 uses quotient depths n−i+1 and n−i; it should use depths n−i+2 and n−i+1 under the defined conductor convention; affects a stated result.
- **Error** in EP at equation (21), printed p. 355: the source says the Heisenberg dimension squared equals the hereditary-unit index without the E-unit factor; it should use the J/H index, equal to one in rank one; affects a stated result.
- **Error** in EP at Proposition 3.25, printed p. 358: the source says exact-depth class counts have q_E^n growth at every depth; it should restrict to admissible minimal depths and use their bounded gaps for cumulative capture; affects a stated result.
- **Error** in DPS at Corollary 7.7, printed p. 42: the source says evaluation is injective for every finite-dimensional tensor factor; it should claim density for nonzero factors without general injectivity; affects a stated result.
- **Error** in BIPD at Lemma 5.1 proof, printed p. 11: the source says a function vanishing on dense points is zero for arbitrary R; it should pass to reduced spaces or conclude nilpotence, which suffices for topological density; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ea91ee646399cb37185dcdc8e9cadbc0f61e2d48", "job": "REV-PKG-CompletedCohomologyAndLocalGlobalCompatibilityPartII~4", "model": "gpt-6-astra", "worker": "chris-6"} -->
