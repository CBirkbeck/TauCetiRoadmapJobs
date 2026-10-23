# PORT-ArithmeticKTheory

Branch: `roadmap/arithmetic-k-theory`.
Head commit: `4573db5f1c9d273cb7be14b196377ac9aab3b367`.
Base: `a07e202`, with an empty initial `git status --short`.

The commit contains only `TauCetiRoadmap/ArithmeticKTheory/README.md`, `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean` and `TauCetiRoadmap/ArithmeticKTheory/metadata.toml`. The package, its source manifest and review records were read without modification. This report is the separately requested package report. No push, pull-request write or issue write was performed.

## Validation

Command: `lake build TauCetiRoadmap.ArithmeticKTheory.Suggested`.

```text
Build completed successfully (8976 jobs).
```

Exactly **3 warnings**, all `declaration uses 'sorry'`, at the three headline theorems; zero other warnings and zero errors. `Suggested.lean` has one real definition and three admitted theorems, one `import Mathlib`, no Tau Ceti import, no examples, no admitted data and no `set_option`.

Final push-gate summary:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The precommit run had only `dirty=1` for the new uncommitted folder; its other counters were zero. The final gate above was run on the committed, clean branch.

Dependency check with the supplied merge order and `--movable`:

```text
depcheck: 15 roadmaps, 118 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The merge order was not edited. Citation resolution against main and the indexed open heads reports no unresolved cross-roadmap citation and no unresolved own Lean identifier. Its warning that pinned packages were not searched by that service was addressed by reading and grepping this worktree's actual pinned packages. `git diff --check` passes. All 80 Checks lists have at least three bullets.

I appended `#check @name` for every final declaration to a scratch copy and elaborated it against the same Lake environment. Exit status 0, exactly the same three admission warnings. I compared all four elaborated types with README §§1.1 and 7.2. All Dedekind, fraction-field, algebra, class-group torsion, prime, oddness, class-number nondivisibility and positive-index binders remain. No signature lost a section binder; no binder repair was necessary. The removed declarations were also compared with the supplied eight-signature inventory before moving their mathematics to the README.

## Draft pull request body

This roadmap develops arithmetic Quillen K-theory of number fields and rings of S-integers, from denominator localization and the rank filtration to finite generation, integral odd and even group structure, wild kernels, Bott descent and regular-prime applications. It assembles the general K-theory and arithmetic suppliers on their shared carriers, retains real and dyadic corrections, and gives Gaussian and golden tame-kernel presentations with independent upper and lower bounds. The hermitian layer derives integral finiteness for symmetric, quadratic and genuine Grothendieck–Witt and L-theory.

The Lean acceptance test states arbitrary-S denominator localization and the divided-Bernoulli consequence of cyclotomic class-number regularity. Its module comment identifies the higher K- and hermitian headlines whose carriers are absent at the pins. The README retains the full theorem statements, APIs, Checks, proof inputs and exact finite arithmetic witnesses.

AI assistance: Codex. The port, mathematical checks and edits were performed by one agent; this is the author's verification record, not an independent review.

## Dependencies that remain open roadmaps

- StableHomotopyKTheory
- GeneralAlgebraicKTheory
- IntegralIwasawaTheory
- CyclotomicClassGroupsAndStickelberger
- SchemeKTheoryOperations
- KTheoryLowDegrees
- K2SymbolsBrauer
- ArithmeticGaloisDuality
- SelmerIwasawaCohomology
- GeometryOfNumbersAndQuadraticArithmetic
- HermitianKTheoryOfPoincareCategories
- KTheoryFiniteLocalFields
- ArithmeticLocallySymmetricSpaces
- AdelicAlgebraicGroups

Main/completed suppliers include EtaleCohomologyFoundations, GeneralizedCohomology, ClassicalArithmeticCompletion, ClassFieldTheory, Chebotarev and NumberFieldArithmetic. IntegralLattices is not a Minkowski supplier; the real-lattice work uses pinned Mathlib directly.

## Lean material moved to the README

Four of the package's eight top-level declarations moved to README §§6.6 and 6.14: `divisibleSubgroup`, `inter_mul_eventually_eq_divisibleSubgroup`, `OrderCertificate` (including all its finite-data, spanning, lower-surjection and equal-cardinality fields), and `OrderCertificate.isPresentation`. Their complete mathematical definitions, generality, functorial laws, soundness theorem and counterexamples remain. These generic supporting constructions state neither an arithmetic K-group headline nor the unavailable wild-kernel theorem, so they are not retained as acceptance-test padding. No weakened arithmetic replacement was added.

The denominator definition and both localization theorems remain. The native cyclotomic class-number hypothesis in `regularPrime_dividedBernoulli_num` remains. The module comment additionally names the unavailable totally real order-ratio and integer even-order headlines. No unavailable higher carrier was encoded by a free proposition, an arbitrary group or admitted data.

## Supplier and ownership decisions

The object-based sweep covered every roadmap on main, all indexed open roadmap heads using the roadmap service, the board packages, and all fourteen sibling folders specified in the brief. The supplied heads were searched as files, and relevant supplier sections were read at their indexed heads. No additional unlisted pull request was discovered through a network search. No final declaration reuses another roadmap's fully qualified declaration name.

The retained supplier replacements are:

- KTheoryLowDegrees §§5.1–5.5, 8.1 and 11.1–11.3 for low-degree arithmetic, including `dedekindTransferCoordinates`. Section 1.3 retains its arithmetic S-enlargement adapter and negative-rank Check.
- SchemeKTheoryOperations §§3.6–3.7 and `dvrBoundary_flat_ramification` for the general ramification square. Section 2.3 assembles the arithmetic direct sums and finite-support/tower laws.
- KTheoryFiniteLocalFields §3.0a, `motivicCycles` and `motivicToK`, for the shared field-cycle, norm-residue and motivic-to-K foundations. Section 5.2 owns the explicitly mixed-characteristic arithmetic-base extension.
- GeneralizedCohomology G5.4 for ko, ku, KO, KU and Bott classes. Section 5.4 constructs the algebraic-to-real comparison on those spectra.
- CyclotomicClassGroupsAndStickelberger §§0.1–0.4, 3.1, 3.3, 4.5, 5.1 and 5.4 for projectors, reflection, congruences, regularity, the finite criterion and the tower theorem. Section 7.3 is the localized-Picard adapter, not a second class-action development.
- IntegralIwasawaTheory §§6.0, 10.4–10.5 and 12.3 for rationality and the actual odd/dyadic special-value Euler-characteristic exports. Their Euler quotient remains |H²|/|H¹|.
- ArithmeticLocallySymmetricSpaces ALS.2.2–ALS.2.4 and AdelicAlgebraicGroups §3.6 for the bordification and arithmetic reduction inputs, retaining their neat-level and triangulation hypotheses. The projective-lattice boundary/orientation comparison remains here.
- KTheoryLowDegrees and K2SymbolsBrauer for K₀(ℤ), K₁(ℤ), K₂(ℤ), K₂(ℚ) and the general tame-kernel sequence. Section 8.2 uses these as applications of the higher localization statements. The golden field's ring, class and unit arithmetic is supplied by the pinned Sqrt5 modules.
- Pinned Mathlib `IsZLattice`, `ZLattice.covolume`, `ZLattice.covolume_div_covolume_eq_relIndex'` and `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` replace the inaccurate IntegralLattices Minkowski attribution.

The inherited duplicate constructions remain excluded and are recorded only in Scope and ownership. No additional mathematical endpoint was deleted. Computational verifier/constructor wording was converted to mathematical finite presentations and relation/index theorems; all eleven prime steps, 173 exact relation witnesses and 23 signed minors remain as explicit finite mathematical data. No executable certifier, enumeration algorithm or implementation is requested.

AnabelianGeometryAndNonabelianChabauty §7.0's arithmetic-higher-K input plans the same Steinberg finiteness and integer-ring finiteness; ColemanIntegration L3.Fc.1 includes the regulator version of Borel's rank theorem. They are later than ArithmeticKTheory in the merge order. Accordingly the underlying arithmetic rank/finite-generation theory is owned here and no supplier edge to either later roadmap was introduced. ColemanIntegration's full regulator map and lattice theorem remain outside this roadmap; the rank theorem here also treats orders and central-simple algebras without requiring that regulator family. GeometryOfNumbersAndQuadraticArithmetic's closing arithmetic discussion describes a separate specification and does not export these arithmetic theorems. ReductiveGroupsPartII's affine Bruhat–Tits building and SmoothRepresentationsOfLocalGroups' smooth Steinberg representation are different objects from the proper-subspace spherical building and integral arithmetic Steinberg homology needed here.

## Mathematical and editorial fixes from the final reread

1. The package's two supplier gaps were verified to be absent from their cited sections. README §3.5 now owns the number-ring symmetric Witt-signature map with finite kernel and rank-r₁ image, and the connective homotopy-orbit spectral sequence. The latter is stated for every finite group, then applied to the supplied C₂ duality action. These are targets on supplied carriers, not requests to change another roadmap. The spectral-sequence construction uses StableHomotopyKTheory §§7.21–7.24; connectivity, rather than convergence alone, gives finite total-degree filtrations.
2. The number-ring signature target is separated from the general Dedekind L-table proof; its arithmetic hypothesis is used for arithmetic finite generation, not imposed on the general tables. Its Checks compute signatures 1, −1 and 0, and the golden determinant −2.
3. Corrected the claim that a bordification's boundary is the building: the required comparison is its equivariant homotopy type. Specified the duality dimension d=r₁m(m+1)/2+r₂m²−m and the actual cohomology/homology duality, including the orientation module and negative-homology convention.
4. Replaced IntegralLattices' nonexistent real-Minkowski contract by the pinned native APIs. The lattice-point theorem's compactness, symmetry, convexity, discreteness, finite dimension and nontrivial ambient-space hypotheses apply to the positive-dimensional stretched ellipsoids in §8.6. The inequality is non-strict because the bodies are compact. Complex measure is still 2 dx dy; the congruence index and covolume are not redefined.
5. Added prose API bullet lists, kept all existing API detail, made subsection proof dependencies explicit, added the three dyadic-formula Checks and gave the new signature/orbit targets their own Checks. Every Checks list has at least three bullets.
6. Removed review-history and unsatisfied-supplier-gap wording, made the special-value order statements unconditionally follow their supplier theorems, and pinned arXiv links to the cited versions. The sextic arithmetic description remains a positive mathematical target; it is not asserted to follow merely from its polynomial or a numerical class-group output.
7. Made the positive-multiple condition in the generic eventual-intersection theorem explicit. In the ambient-root example with div A=C₂ and T=div A, m=0 gives T∩0A=0 although m₀ divides 0. Added this negative control to §6.6.
8. Retained the accepted safeguards: fixed modulus versus eventual stabilization; ambient div versus an internally divisible group; positive, ordinary and raw wild kernels; exceptional versus special versus very special fields; the independent twist-field Picard-image proof; the real hidden subgroup; and the abelian hypothesis in the diagonal extension. No restriction to good primes, imaginary fields or inverted two was introduced globally.

## Pin and source evidence

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, verified against the dependency checkouts and manifest.

The following source IDs identify repository-relative pinned files. The line locators below are from the inspected pins.

| Source ID | File | Evidence |
| --- | --- | --- |
| MathlibSInteger | `Mathlib/RingTheory/DedekindDomain/SInteger.lean` | MathlibSInteger line 65 defines the ring by valuations outside S; line 124 supplies the unit equivalence. It does not assert the denominator-localization criterion. |
| MathlibDedekind | `Mathlib/RingTheory/DedekindDomain/Basic.lean` | MathlibDedekind line 149 extends `IsDomain`; the zero ring is excluded. |
| MathlibPicard | `Mathlib/RingTheory/PicardGroup.lean` | MathlibPicard line 876 supplies `ClassGroup.equivPic`. |
| MathlibRelations | `Mathlib/Algebra/Module/Presentation/Basic.lean` | MathlibRelations line 266 gives quotient-surjectivity equivalence, line 272 gives span, and line 280 defines an actual presentation by bijectivity. |
| MathlibRealLattice | `Mathlib/Algebra/Module/ZLattice/Basic.lean` | MathlibRealLattice line 433 supplies `IsZLattice`. |
| MathlibCovolume | `Mathlib/Algebra/Module/ZLattice/Covolume.lean` | MathlibCovolume line 72 defines covolume; line 170 gives the index ratio with full-lattice/discreteness hypotheses. |
| MathlibMinkowski | `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean` | MathlibMinkowski line 91 gives the compact-body weak-inequality theorem with the hypotheses stated above. |
| MathlibIndex | `Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean` | MathlibIndex line 98 gives `AddSubgroup.index_eq_natAbs_det`. |
| TauSIntegerSpectrum | `TauCeti/RingTheory/DedekindDomain/SInteger/Spectrum.lean` | TauSIntegerSpectrum line 180 gives the height-one correspondence; line 225 gives valuation compatibility. |
| TauSIntegerClass | `TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean` | TauSIntegerClass line 86 gives surjectivity, line 94 finiteness, line 129 the kernel and line 136 the class quotient equivalence. |
| TauSIntegerUnit | `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean` | TauSIntegerUnit line 123 gives monotonicity, line 130 the valuation kernel and line 207 finite generation for finite S. |
| TauNorm | `TauCeti/RingTheory/ClassGroup/RelNorm.lean` | TauNorm line 143 defines the norm and line 166 gives the degree composite. |
| TauExactK0 | `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean` | TauExactK0 line 163 defines presented exact K₀; line 339 is its additive universal property, not a higher Quillen spectrum. |
| TauGoldenBasic | `TauCeti/NumberTheory/NumberField/WorkedExamples/Sqrt5/Basic.lean` | TauGoldenBasic line 42 gives degree two under the integral-generator and generation hypotheses. |
| TauGoldenInvariants | `TauCeti/NumberTheory/NumberField/WorkedExamples/Sqrt5/Invariants.lean` | TauGoldenInvariants line 76 gives index one, line 96 discriminant five, line 135 class number one, and lines 140, 153 and 163 give the dyadic prime/e/f data. |
| TauGoldenUnits | `TauCeti/NumberTheory/NumberField/WorkedExamples/Sqrt5/Units.lean` | TauGoldenUnits line 50 gives the inverse identity, line 57 generation modulo torsion and line 81 torsion order two. |
| TauGoldenReal | `TauCeti/NumberTheory/NumberField/WorkedExamples/Sqrt5/RealPlace.lean` | TauGoldenReal line 39 fixes the positive embedding and line 68 the unit rank. |

The two initial citation leads were resolved: `OrderCertificate.card_match` was a real field of the package structure and moved with that structure to prose; `VanishingCycles.etaleTateTwists` is explicitly the target of EtaleCohomologyFoundations F.0.3 on main, not an implemented pinned declaration. No Tau Ceti import is needed by the four final signatures. Object searches of both pinned source trees distinguish existing exact K₀ and native presentations from the missing higher Quillen and GW/L carriers named in the module comment.

Primary-text proof steps were read directly where they affect the retained route: hermitian line 1881 (general L-table), line 2044 (the odd quadratic extension), line 2224 (number-ring Witt finiteness), line 2230 (strict Lagrangian argument) and line 2250 (genuine/GW finiteness); putman-studenmund line 109 (boundary homotopy type) and line 165 (orientation module); hutchinson line 718 (finite complex), line 733 (real H³ and Bockstein), line 775 (duality direction), line 809 (twist-field correction), line 829 (div image) and line 858 (final quotient); caputo line 588 (fixed-modulus obstruction); cgz line 901 (its more restrictive odd-prime specialization); kbook line 32029 (real K-table), line 32095 (totally real ratio) and line 32459 (regular Bott module). The legal source versions and access decisions in `packages/ArithmeticKTheory/sources.toml` were preserved; original-source access waivers were not represented as fresh independent collation of unavailable originals.

## Untrusted text handling

Review prose was treated as claims to verify. In particular RT-ArithmeticKTheory~2a line 86 says, “Declare the remaining C₂ input in both README and plan gaps”. This is an instruction about an outside-scope plan file, so it was not followed as an instruction. The mathematical input was independently checked and made a target in the authorized README. No package design file, merge-order file, credential, network configuration or other roadmap was edited.

## Unresolved

No unresolved port, elaboration, dependency-order or content-gate defect remains. The intended library theorems remain roadmap targets, not completed formalizations. The sextic class-group/local-field proof is an explicit target. No higher-degree equality of raw completion and symbol wild kernels is promised; the sourced results are the inclusion in all positive even degrees and equality in degree two. The established symbol/div theorem retains its special-field correction. The supplier roadmaps above require their normal earlier position in the merge order; the worker supplies the final dependency and validation paragraphs for the draft pull request.

## Adversarial mathematics pass

There are 186 statement rows and 309 separately computed arithmetic rows below (495 rows in total).

C_m means the cyclic group of order m, with C₁ the zero group of cardinality one. The first table records each mathematical target, definition, convention and independent identity on discriminating small models. Source-backed values of unimplemented K-groups are mathematical tests of the statements, not claims to have implemented their proofs. Conditional sextic rows are explicitly conditional on the arithmetic hypotheses that the roadmap asks to prove. The second table contains individually recomputed exact arithmetic: all 173 relations, all 23 signed minors, every residue-image list and generation test, and additional Bernoulli, norm, parity and geometric tests. Every row records numerical or group values; elaboration is separate evidence.

| Statement | Instances tried | Left value | Right value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Convention: finite primes and S-unit rank | ℚ, ℚ(i), golden field, S=∅ or one prime | 0,0,1; ℚ with one prime:1 | r₁+r₂+∣S∣−1 = 0,0,1,1 | Equal | Finite S explicit |
| Convention: ordinary versus periodic degrees | ℤ at n=0,1; KO at −8 | ℤ,C₂; ℤ | K₀=ℤ,K₁=C₂,KO₋₈=ℤ | Distinct carriers | None |
| Convention: pullback, transfer, exact upper prime set | Gaussian extension, degree2 | res₁(−1)=−1, tr₁res₁(−1)=1 | (−1)²=1 | Equal | Exact upper set retained |
| Convention: residue norm q | Golden dyadic prime | #𝔽₄=4 | 2²=4, not 2 | Equal | None |
| Convention: right-linear localization boundary | ℤ_(5), entries (5,2),(2,5),(2,3) | 2,3,1 | 2,2⁻¹=3,1 | Equal | None |
| Convention: negative twist and order | ℚ weights 0,1,2,−2 | infinite,2,24,24 | infinite,2,24,24 | Equal | No w₀ assigned |
| Convention: ambient roots and total divisions | A=ℤ,ℚ,C₄; m=1,4,0 | div=0,ℚ,0; m=0 outside intersection | 0,ℚ,0; positive m only | Equal | None |
| Convention: ℤ/d and free complements | C₁ and C₂; ℤ⊕C₂ | orders 1,2; free rank1 | 1,2; abstract free complement | Equal | None |
| Convention: odd-modulus projectors | Z/3 identity and negative involutions | (1+1)/2=1,(1−1)/2=0 | positive projection 1, negative 0 | Equal | 2 invertible |
| §1.1 denominator membership and product | ℤ,S={2}, elements −1,2,3,0; product4 | true,true,false,false; true | units of ℤ[1/2]: same list | Equal | None |
| §1.1 denominator monotonicity | S=∅⊂{2}, elements −1 and2 | −1 persists,2 added | {±1}⊂{±2^n:n≥0} | Equal | None |
| §1.1 localization iff, both directions | M=2^ℕ,M={1},M containing0 | true,false,false | prime-meeting/unit conjunction:true,false,false | Equal | None |
| §1.1 torsion class denominator theorem | ℤ[√−5], P=(2,1+√−5) | P²=(2); P has order2 | 2 has support exactly P and is inverted | Equal | Nonprincipal witness retained |
| §1.1 arbitrary S and field edge | R=field, S=∅=Spec¹; R=ℤ,all primes | all nonzero units; fraction field ℚ | localization at nonzero elements | Equal | None |
| §1.2 inclusion, identity and tower | ℤ→ℤ[1/2]→ℤ[1/6], element1/2 | 1/2↦1/2↦1/2 | composite inclusion value1/2 | Equal | None |
| §1.2 primes disappear under enlargement | S=∅→{2}→{2,3} | 2 removed; then3 removed | complements exclude exactly2,3 | Equal | None |
| §1.2 integral closure and projective rank | ℚ⊂ℚ(i),S={2}, exact T | basis(1,i), rank2 | [E:F]=2 | Equal | None |
| §1.2 finite-extension negative control | Add only one upper prime over5 | an element with pole there is not integral over ℤ | finite integral closure excludes that pole | Excluded | Exact T retained |
| §1.3 supplied K₀ extension coordinates | Gaussian free extension, virtual rank−1 | (−1,1)↦(−1,1) | (n,ext c) | Equal | General formula cited |
| §1.3 supplied transfer and Steinitz factor | degree2,c_B=c,virtual rank−1 | (−2,c⁻¹) | (dn,Norm(1)c^n)=(−2,c⁻¹) | Equal | General formula cited |
| §1.3 transfer composite | degree2,Steinitz c, class(1,a) | (2,a²c) | [B]·(1,a)=(2,a²c) | Equal | No replacement by degree alone |
| §1.3 K₁ norm and unit rank | ℤ,ℤ[1/2],ℤ[i] | C₂,C₂×ℤ,C₄; trres(−1)=1 | unit ranks0,1,0; (−1)²=1 | Equal | None |
| §2.1 ordinary support indexing | field,DVR,ℤ[1/2] | 0 terms,1 term,all primes except2 | height-one complements:0,1,primes≠2 | Equal | None |
| §2.1 relative support and finite sums | ℤ→ℤ[1/6], valuations of6 | coordinates at2,3 equal1,1 | T∖S={2,3}, finite support | Equal | Infinite tuples excluded |
| §2.1 finite-coefficient localization | identity localization,m=3 | support0 and identity remaining map | 0→K/3→K/3 | Equal | None |
| §2.1 boundary pairing | ℤ_(5),m=16,uniformizer5,unit2 | β([5]·[2])=2; reverse gives3 | residue2 and its inverse3 | Equal | Mixed pairing retained at unsafe moduli |
| §2.1 coefficient transition/Bockstein | C₄,p=2,r=1 | coefficient reduction1 mod4↦1 mod2; torsion transition×2 | reduction versus multiplier2 | Equal | None |
| §2.2 residue K₀ inverse class | c of order3 | [O/v] has class c⁻¹=c² | [O]−[v] has class c² | Equal | None |
| §2.2 S-unit exactness | ℚ,S={2},x=−8 | valuation3; kernel±1 | units±2^n and valuation n | Equal | None |
| §2.3 ramified restriction coordinate | (e,f)=(2,1),(1,2) | K₀ restriction2,1; transfer1,2 | e=2,1 and f=1,2 | Equal | None |
| §2.3 residue-unit restriction | 𝔽₅ unit2,e=2 | 2²=4 | weighted additive restriction corresponds to4 | Equal | None |
| §2.3 residue norm and split transfer | 𝔽₂₅/𝔽₅; two split branches | unit norm exponent6; ranks1+1=2 | (25−1)/(5−1)=6; degree2 | Equal | None |
| §2.3 finite support, identity and tower | one base prime,two upper; e=2 then3 | 2 coordinates; identity1; tower6 | finite fibre;1;2·3=6 | Equal | None |
| §2.4 even injectivity and odd surjectivity | residue𝔽₂,n=4 and3 | K₄(𝔽₂)=0,K₂(𝔽₂)=0 | preceding/next residue terms zero | Equal | Degree2 uses tame-kernel input |
| §3.1 rank filtration and stratum | ℤ[√−5],m=0,1 | one zero object;two rank1 projective classes | Q₀ contractible;#Pic=2 | Equal | All projective classes retained |
| §3.1 rank monotonicity and exhaustion | zero→rank1; rank1→rank0 | allowed; no such downward arrow | rank increases; each finite projective has finite rank | Equal | None |
| §3.1 layer-poset order and exclusion | 𝔽₂ dimension0,1,2 | 0,2,11 layers | 0; endpoints(0,0),(V,V);12 pairs minus(0,V) | Equal | None |
| §3.1 layer transport, cover and no crossing | V=𝔽₂²,swap basis; (L,V),(0,L) | image line swaps; the two exclusive pairs incomparable | both coordinates forward; covering conditions hold | Equal | None |
| §3.2 building and Solomon–Tits | 𝔽₂²;rank1 | three vertices,H̃₀=ℤ²;H̃₋₁(empty)=ℤ | St₂ rank2;St₁=ℤ | Equal | None |
| §3.2 apartment action and transport | 𝔽₂²,swap coordinate lines | [L₁]−[L₂]↦−([L₁]−[L₂]) | orientation reversed, coefficient−1 | Equal | Action retained |
| §3.2 projective arithmetic duality | ℚ,m=2,3;real quadratic,m=1 | d=1,3,1 | 3−2=1;6−3=3;2−1=1 | Equal | Explicit dimension and duality formula added |
| §3.2 orientation character | g=diag(−1,1),m=2;diag(−1,1,1),m=3 | −1,+1 | sign(det)^(m−1)=−1,+1 | Equal | None |
| §3.2 Steinberg homology finiteness | m=1,real quadratic,torsion-free units≃ℤ | H₀=H₁=ℤ,H₂=0 | circle homology ℤ,ℤ,0 | Equal | Boundary homotopy type clarified |
| §3.2 layer suspension comparison | m=1;𝔽₂² | H̃₀(two points)=ℤ;H̃₁(susp three points)=ℤ² | St₁;St₂ | Equal | Augmented convention explicit |
| §3.2 relative shift and negative homology | (m,i)=(1,0),(1,1),(2,2) | 0,⊕Picℤ,⊕Pic(St₂)_Aut | H_−1=0,H₀(trivial St₁),H₀(St₂) | Equal | Integer subtraction retained |
| §3.2 rank spectral sequence and finite diagonals | i=0,1,2 | p ranges{0},{0,1},{0,1,2} | 0≤p≤i; finitely many terms | Equal | None |
| §3.2 stability bounds | m=i andm=i+1;H₀ stage0 | surjection at equality; isomorphism one stage later;H₀=ℤ | relative groups below rank vanish | Equal | No GL stability substituted |
| §3.2 finite generation and nonzero π₁ | R=ℤ,degree0 | π₁BQ=K₀(ℤ)=ℤ | connected simple H-space allows ℤ | Equal | No simply-connected assumption |
| §3.3 finite-S kernel/cokernel | ℤ→ℤ[1/2],n=4,3 | kernel0,cokernelC₃; degree3 iso | finite residue K₃(𝔽₂)=C₃,K₂=0 | Equal | None |
| §3.3 actual rational equivalence | S=∅;ℤ→ℤ[1/2],n=5 | identity on ℚ; multiplying by2 differs at1 | actual inclusion sends1↦1, not2 | Equal | Forward map fixed |
| §3.3 rational equivalence naturality | identity extension; Gaussian degree2 transfer square | identity1; transfer multiplicity2 on free rational coordinates | composition agrees, factor2 both routes | Equal | Ramification allowed |
| §3.4 rational rank of orders and central-simple algebras | ℚ,ℚ(i),M₂(ℚ),ℚ×ℚ(i),n=5 | 1,1,1,2 | r₁+r₂;Morita1;sum2 | Equal | None |
| §3.4 higher rank parity and numerical ρ | ℚ,n=0,1,2,3,5;ℚ(i),n=3,5 | ρ=0,1,0,0,1;1,1 | actual K₀ rank1,K₁ rank0 excluded;higher0,0,1;1,1 | Ranges agree | None |
| §3.4 free-plus-torsion and even finiteness | K₂(ℤ),K₅(ℤ),K₂(ℚ) | C₂,ℤ,infinite torsion | finite even ring group;rank1 odd;infinite field residue terms | Equal | Ring/field distinction retained |
| §3.5 quadratic-to-symmetric Witt injection | ℤ,zero form; characteristic2 negative control | 2q=0⇒q=0;over char2 associated symplectic form has Witt class0 | injective char0;zero map may occur char2 | Equal | Characteristic restriction retained |
| §3.5 symmetric L-table | ℤ,n mod4=0,1,2,3 | ℤ,C₂,0,0 | W^s=ℤ,dyadicW=C₂,0,Pic/2=0 | Equal | None |
| §3.5 quadratic L-table and odd extension | ℤ,n mod4=0,1,2,3 | ℤ,0,C₂,0 | W^q=ℤ,0,ArfC₂,total-cokernel extension0 | Equal | No splitting asserted generally |
| §3.5 sign shift | ℤ,ε=−1,n=0,2 | symmetric0,ℤ;quadraticC₂,ℤ | positive degrees2,4 | Equal | None |
| §3.5 number-ring signature map and laws | ⟨1⟩,⟨−1⟩;golden ⟨1⟩,⟨ε⟩ | 1,−1,sum0; vectors(1,1),(1,−1),det−2 | additivity;rank2,finite-index image | Equal | Target owned here; no supplier gap |
| §3.5 homotopy-orbit spectral sequence | G=1,C₂;E=0,Hℤ trivial,Hℤ sign | 0;ℤ,C₂,0;C₂,0,C₂ | bar alternating0/2 versus2/0 | Equal | Target owned here, generalized to finite G |
| §3.5 orbit connectivity and finite generation | ΣHℤ trivial action,degree0,1,2 | 0,ℤ,C₂ | shift of trivial-action group homology | Equal | No negative q rows |
| §3.5 genuine and classical comparison ranges | m=0,1 | (≤−2,≥−1),(≤0,≥1) | cover all integers without gaps | Equal | Classical low degrees kept separate |
| §4.1 fixed twist and primary decomposition | 𝔽₃ weight2;ℚ weight2 | C₈;C₂₄=C₈⊕C₃ | orders8;8·3=24 | Equal | None |
| §4.1 negative twist, roots, zero weight | ℚ weights−2,1,0 | 24,2,infinite | dual fixed subgroup24;μ={±1};trivial-action ℚ/ℤ | Equal | No ordinary tensor-power substitute |
| §4.1 restriction/corestriction and order divisibility | ℚ→ℚ(i),weight1 | inclusionC₂→C₄;norm(−1)=1 | corres=×2 onC₂=0;2 divides4 | Equal | None |
| §4.2 exponent and odd-primary formula | ℚ,ℓ=3,weights1,2,6,0 | orders1,3,9,infinite | r=2,a=1;valuation exponents0,1,2;weight0 unbounded | Equal | Zero weight excluded from finite formula |
| §4.3 exceptional predicate and descent | ℚ,ℚ(i),ℚ(√−2),ℝ | mod8 images{1,3,5,7},{1,5},{1,3},{±1} | noncyclic tower,true only ℚ among these | Equal | Real-place criterion only for number fields |
| §4.3 four dyadic branches | weight2 onℚ,ℚ(i),ℚ(√−2);weight1 | 8,8,8;2,4,2 | 2^(2+1),2^(2+1),2^(3+1−1);odd branches | Equal | Three extra formula Checks added |
| §4.4 rational primary prime product | weights2,4,6,10 | 24,240,504,264 | 8·3,16·3·5,8·9·7,8·3·11 | Equal | None |
| §5.1 Soulé odd localization | ℤ→ℚ,n=3; n=1 negative control | C₄₈≃C₄₈;±1 fails to hit2 | iso at3;not surjective at1 | Equal | None |
| §5.1 even exact boundary | ℤ→ℤ[1/2],i=1,2 | residue targets0,C₃ | 2^1−1=1,2²−1=3 | Equal | All coefficient primes retained |
| §5.2 supplied Milnor norm residue and sign adapter | 𝔽₅ weight1,m=2; ℤ_(5) symbols | 2 is nonsquare; ∂{2,5}=2,β=3 | Kummer nonzero;β₂=−∂₂ | Equal | Supplied foundations cited |
| §5.2 Suslin torsion and coefficient comparison | separably closed char0,i=1; i=2,m=5,a=2 | roots identity; action2²=4 | μ₅ twist2 action4,not2 | Equal | Equivariance fixes map |
| §5.2 arithmetic motivic-base extension | ℤ[1/5] weight1; ℤ[1/2] mod2 | H¹=±5^n,H²=0;four classes1,−1,2,−2 | units,Pic0;Kummer square classes4 | Equal | Mixed-characteristic extension retained |
| §5.2 motive localization and Bockstein | ℤ[1/5]→ℚ,unit3;𝔽₅,m=2 | valuation₃(3)=1; nonzero μ₂ maps to−1 | boundary1;C₄[2]={1,−1} | Equal | None |
| §5.2 étale comparison range | ℚ(√−7),2; ℚ real,degree3 | iso for imaginary;kernelC₂ for real | cd2 comparison versus real correction | Equal | No exceptionality restriction on imaginary case |
| §5.2 e-invariant, naturality and primary edge | ℚ,i=2;ℚ(i),i=2;ℚ,i=1 | C₄₈→C₂₄ kernelC₂;C₂₄ iso;μ identity | kernel2;kernel1;identity | Equal | None |
| §5.2 Bockstein degree and edge Chern map | ℚ,i=2,2-primary | C₁₆→C₈ has kernelC₂;degree4→3 | β lowers degree1;δ∘e uses same kernel | Equal | Factorial convention not substituted |
| §5.3 imaginary odd integral table | ℚ(i),n=3 | ℤ⊕C₂₄ | free rankr₂=1,torsionw₂=24 | Equal | None |
| §5.4 real comparison and Bott normalization | KO degrees0…7 | ℤ,C₂,C₂,0,ℤ,0,0,0 | stated real periodic table | Equal | Supplied KO used |
| §5.4 complexification and coefficient extensions | KO→KU at0,4;KO₂ mod2 | multipliers1,2;coefficient C₄ | 1,2;order4 with nonsplit extension | Equal | None |
| §5.4 diagonal abelian extension | w=8,r=2;w=24,r=1 | C₁₆⊕C₂;C₄₈ | C_(2w)⊕C₂^(r−1) | Equal | Abelian hypothesis retained |
| §5.4 nonabelian negative control | D₈ with lift a and kernel⟨s,a²s⟩ | a²=diagonal but(as)²=1 | quotient splits,unlike abelian diagonal extension | Excluded | No general-group assertion |
| §5.4 real odd table and actual e-map | ℚ,n=3,5,7,9 | C₄₈,ℤ,C₂₄₀,ℤ⊕C₂ | kernel/cokernel(2,1),(1,2),(1,1),(1,1) | Equal | Uses n modulo8 |
| §5.5 detected summand and wreath functor | q=7,ℓ=3,r=2; block ranks1+1 | GL order2016,wreath18,index112;block rank2 | 3∤112;monomial direct sum rank2 | Equal | Full primary root hypothesis retained |
| §5.5 stable transfer versus scalar generalized action | ordinary H₀ of finite cover of index112 | inclusion after transfer multiplies1 by112 | 112 is a unit in ℤ_(3) | Equal | No scalar claim on all stable homotopy |
| §5.5 coefficient lifting controls order | q=7,i=1,ℓ=3,N=3 | Bockstein lift has order3 | order dividing3 and surjective image of order3 | Equal | Integral lift alone insufficient |
| §5.5 dyadic norm instead of division | C₈,action3 | 1+3=4,image{0,4} | invariants{0,4},order2 | Equal | None |
| §6.1 even cohomological comparison | ℚ,ℓ=3,i=1;ℚ(i),ℓ=2 | zero;zero primary group | H²=0 by one-place/class0 calculations | Equal | Real dyadic case excluded |
| §6.1 Kummer–Brauer rank and primary direct sum | ζℓ inF,s=1,t=0;C₉ versusC₃ | ℓ-rank0;both quotients modulo3 have order3 | t+s−1=0;orders9≠3 | Equal | Full order not inferred from rank |
| §6.2 Selmer signature definition and bounds | ℚ,S=∅;ℚ(i);√7 dyadic | j=0,0,1 | codimensions0,0,1;u−t=1 for√7 | Equal | No unit-only definition |
| §6.2 signature-defect enlargement and eventual zero | √7 add7;√34 class5+√34 | j1→0;norm−9,sign(+,-),j0 | diagonal image enlarged by independent vector | Equal | Fixed-parameter numerical identity distinguished |
| §6.3 hidden ρ and its bounds | ℚ,√2,√7 | ρ=0,0,1;√7 K₄=C₂,H²=0 | j≤ρ≤r₁−1;hidden kernel order2 | Equal | None |
| §6.3 real dyadic rows0,2,4,6 | ℚ,degrees8,2,4,6 | 0,C₂,0,0 | H²5=0,H²2=C₂,extension0,H̃²4=0 | Equal | Degrees0,1 excluded |
| §6.3 real dyadic odd residues | ℚ,degrees9,3,5,7 | C₂,C₁₆,0,C₁₆ on2-primary | w₂=8,w₄=16;real diagonal factor2 at3 | Equal | None |
| §6.4 ordinary and modified mod2 cohomology | ℚ,S={2},r₁=s=1,r₂=t=j=0 | H¹ dim2,H² dim1,H̃¹ dim1,H̃² dim0 | a=2,b=1,c=1,d=0 | Equal | None |
| §6.4 coefficient order table | Same rational parameters,residues0…7 | orders2,4,4,4,2,2,1,2 | exponents1,2,2,2,1,1,0,1 | Equal | Orders not vector-space dimensions |
| §6.4 even two-rank values | (r,s,t,j)=(1,1,0,0),(2,1,0,1),n2,4,6,8 | (1,0,0,0),(2,1,1,0) | four displayed branches | Equal | None |
| §6.4 numerical enlargement and junk inputs | s1→2 fixed parameters;n0,s0→1;√7 actual enlargement | all even branches+1;0→0;degree4 stays1 | fixed-s law needs s≥1;actual j1→0 | Equal | None |
| §6.5 totally real finite order ratio | ℚ,i=2,4 | 2·2/48=1/12;2·1/240=1/120 | H²/H¹=2/24,2/240 | Equal | Real factor retained |
| §6.6 div definition, functoriality, direct sum | ℤ,C₄,ℚ,ℚ/ℤ,ℚ⊕C₄ | 0,0,all,all,ℚ⊕0 | intersection of multiplication images has those values | Equal | Moved from Lean |
| §6.6 ambient-root subgroup not internally divisible | 2x=0,2^ny_n=x | div A=⟨x⟩=C₂;2div A=0 | x maps to1/2≠0 inℚ/ℤ | Distinct notions | None |
| §6.6 fixed coefficient intersection formula | A=C₄,T={0,2},m=2 | T∩2A={0,2},order2 | kernel on T/2T equalsT,not div A=0 | Equal | Annihilator not stabilization modulus |
| §6.6 eventual finite-intersection theorem | Same A,T; m=4k positive | T∩mA={0} | div A=0 | Equal | Moved from Lean |
| §6.6 Caputo sextic arithmetic description | Conditional arithmetic data as stated | localμ₉ order9,globalμ₃ order3,tame3-part order3 | ker(C₉→C₃)=C₃ | Conditional values agree | Class arithmetic remains explicit target |
| §6.6 arithmetic obstruction and stabilization | Caputo four arithmetic hypotheses,m=3 | fixed coefficient kernel order3;div order1 | class quotientC₃;eventual kernel0 | Conditional values agree | No assumed class-group certificate |
| §6.7 raw completion kernel | ℚ,i=1,g={−1,−1};Gaussian ring | g real sign−1 and dyadic−1;Gaussian tame0 | g excluded;rawGaussian0 | Equal | None |
| §6.7 positive even K and pullback to ring | ℚ,i=1,2;imaginary field | g excluded at1;full group at2;full atall i ifr₁=0 | residue classi≡1 mod4 only | Equal | None |
| §6.7 local quotient and finite-support symbols | ℚ₂,i=1 | D₁ orderw₁=2 | H² twist2 order2,notw₂=8 | Equal | Full local group distinguished |
| §6.7 symbol kernel and universal factorization | zero homomorphism intoK⁺; degree2ℚ | all coordinates0,unique zero lift;wild0 | kernel inclusion sends0↦0;Moore value0 | Equal | No arbitrary Prop field |
| §6.8 higher Moore and prime-primary ring order | ℚ,i=1,ℓ=2 | K⁺₂(ℤ)=0;local order2,global order2 | 1·2=1·2 | Equal | Real sign factor retained |
| §6.8 added-prime correction | ℚ,ℓ=3,i=2,addprime2 | K₄(ℤ){3}=0;K₄(ℤ[1/2]){3}=C₃ | residue order2²−1=3 | Equal | Extra S not ignored |
| §6.9 strict cohomological kernel and limit | real place,twists2,3 | integralH²=C₂,0 | C₂ trivial-action cohomology;sign-action H²0 | Equal | Finite-level real groups not copied |
| §6.9 symbol/H² comparison and hidden kernel | √7,i=2 | WK has hiddenC₂ whilecohomological target0 | kernel order2^ρ=2 | Equal | Exact correction retained |
| §6.10 special predicate and local alternatives | ℚ,ℚ(i),√−14,√−17 | false,false,true,true | proper dyadic image test;√−17 completionℚ₂(i) | Equal | Both alternatives retained |
| §6.10 very special predicate | √−17,√−14,real field | true,false,false | imaginary and all dyadic completions nonexceptional only first | Equal | None |
| §6.10 homology obstruction ρ₁ | G=C₂×cyclic2-group; proper dyadic subgroups versusone equalG | zero map toC₂;equal-G coordinate givesidentity | cokernel order2 versus1 | Equal | Large modulus hypothesis retained |
| §6.10 faithful finite twisted norms | C₄ action3;C₈ action3; oddmodulus9 action8 | N=0,targetC₂;N=4,targetC₂;N=0,target0 | failure onlydyadic inversion;odd normonto0 | Equal | Not multiplicative finite-field norm |
| §6.11 Hilbert norm criterion | ℝ,m=2,a=−1,b=−1 or1 | −1 is not norm fromℂ,1 is norm | symbol−1 or1 respectively | Equal | Source and target extension fixed |
| §6.11 cyclotomic H² descent | E=F,μm alreadydefined | corestrictionidentity,coinvariantsunchanged | originalH² andKummersequence | Equal | No arbitrary invariant/coinvariant identification |
| §6.11 Picard coinvariant defect | C₂ action−1 onC₄ | coinvariantsC₂,H₁=C₂ | ker(−2)/image0=C₂ | Equal | H₁ term retained |
| §6.11 positive H² descent and real defect | ℝ,twistodd,mod4 | finiteH²=C₂,continuousH²=0,H³=C₂ | BocksteinfiniteH²→H³ isiso | Equal | Positive versus ordinary maps distinct |
| §6.11 twist-field Picard image and div | very-special field,eveni; oddi special | full-fieldmiddlehomologyC₂ versus twist-field0;oddimageexact | finiteSha¹ orders2/1 versus2/2 | Equal | Twist field required |
| §6.11 compatible class/cyclotomic prime prescription | ℚ(i),norm3mod4;H∩L=F;L⊆H | no such prime image;unrestricted compatiblepairs;forcedσ | actualcyclotomicimageexcludes3;fibre-productconditions | Equal | No unrestricted prescription |
| §6.12 symbol/div exact quotient | √−14,oddi;ℚ,i=1;anyF,eveni | C₂;0;0 | order2 onlyspecial andoddi | Equal | None |
| §6.12 cohomological exact obstruction | very-special eveni andspecial oddi | finalquotient0 andC₂ | HutchinsonfiniteSha² calculation | Equal | Independent image route retained |
| §6.12 real motivic H² and hidden C⊆div | √7,i=2 | H² comparison0≃0,hiddenC₂ inambientdivK₄ | C₂ has ambientroots but2C₂=0internally | Equal | Real correction assigned toK→H² |
| §6.12 raw inclusion anddegree2 equality | ℚ,i=1; higherdegree localdivisibletorsion | bothkernels0;torsioncanmapnontrivially intoℚ/ℤ | degree2equality0;nohigher-equalityinference | Equal | No conditional tautological substitute |
| §6.13 Keune injection andtwisted relation | p=5,χ(g)=2,componentaction3 | 2·3=1,source survives;wrongtwist3·3=4killsit | χ⁻¹ componentdiagonallyinvariant | Equal | None |
| §6.13 ramified prime andchoice independence | F=ℚ(μ₃),p=3,n=1;principalizinggeneratorα→uα | G=1; cocyclechangesbycoboundary | Kummerinjection;unchangedclass | Equal | No unramifiedness assumption |
| §6.13 invariant vanishing viaNakayama | finiteC₃ withtrivialP=C₃;zeromodule | coinvariantsC₃ and0 | zero coinvariantsforceszeromodule,notarbitraryequivalence | Equal | IndependentK₂-order premise |
| §6.14 matched finite-presentation soundness | P=C₂,A=C₂,B=C₂;P=C₄,A=C₂,B=C₄ | 2→2→2isos;surjection2→4impossible | matchingorders2=2;4≤2false | Equal | Moved generic structure/theorem fromLean |
| §6.14 empty presentation | P=0,B=0 | order1 andspanningforcesA=0 | 1≤#A≤1 | Equal | No uncheckedgenerators |
| §6.14 cohomological matched presentation | K₂ℤ,L={2};K₄ of the √7 integer ring,L={2} | h₂=2;2^ρ·∣H²∣=2·1=2 | upperorders2 and2 | Equal | Fullorders,notranks |
| §6.15 Bott slot convention | j=0,−1,1,ε=+1 | (0,0),(2,0),(2,2) | totaldegrees0,−2,2;sign+1 | Equal | Integer subtraction retained |
| §6.15 dualization involution andperiod shift | j=−1→1,positive; lineL | (2,0)→(2,2);L↦L⁻¹↦L | cohomindexsame,twist+2;ψ²=id | Equal | Different frombaseconjugation |
| §6.15 Bott hyperdescent andeven edge | cd≤2,j=0,1 | H²(1)→K₀β→H⁰(0);H²(2)→K₂β→H⁰(1) | totaldegrees0,2andoppositesigns | Equal | None |
| §6.15 odd edge and projectors | q=3,j=1,2; q=2negativecontrol | H¹(1)sign−1,H¹(2)sign+1;2⁻¹mod3=2 | (−1)^j;noinverse2mod2 | Equal | Oddmodulusexplicit |
| §6.15 all-integer table | k=0,degree−2 and0 | positiveH²(0),H⁰(0);negativeH⁰(−1),H²(1) | j=−1,0 slotsmatch | Equal | None |
| §6.16 ordinary/Bott comparison at0and1 | ℤ,ℤ[1/p],q=p^r | K₀coeffCqboth;K₁ℤcoeff0,localizedCq | Pic0;valuationp=1givesCq | Equal | Degree1exceptionretained |
| §6.16 cyclotomic degree-one splitting | π=1−ζq | discretevaluation(π)=1 | chosenuniformizergeneratesextraCq | Equal | Choiceexplicit |
| §7.1 Bernoulli andprimed conventions | indices0,1,2,4 | B=1,−1/2,1/6,−1/30;B′₁=1/2 | positiveb₀=−1,b₁=1/6,b₂=1/30 | Equal | None |
| §7.1 divided denominator refinement | p=5,k=5 | B₁₀/k=1/66,denominatorprime-to5 | 5cancelsinnumeratorandk | Equal | No divisionbyanonunitcongruence |
| §7.1 rational w-denominator identity | k=1,2,3,5 | denominators24,240,504,264 | w₂,w₄,w₆,w₁₀=same | Equal | None |
| §7.2 supplied regularity criterion andtower | p=3,emptyinterval; p=37,k=16 | classh₃=1;B₃₂num=−37·208360028141 | regular3;irregular37 | Equal | Supplierownedcriterion/towerretainedonlybycitation |
| §7.2 all-index divided numerator theorem | p=5,k=1,3,5; p=3,k=1 | fractions1/12,1/252,1/66;1/6 | numerators1 allprime-to p | Equal | OnlynontrivialarithmeticcorollaryretainedinLean |
| §7.3 localized Picard adapter | ℓ=3;uniqueprimeaboveℓ | A/ℓ=0=P;principalprimeclass0 | classquotientunchanged | Equal | Transportssuppliedprojectors |
| §7.3 Herbrand–Ribet direct character | ℓ=37,k=16 | 1−32≡5mod36;inversecomponent31differs | directupper-rightcharχ^(1−2k)=χ⁵ | Equal | None |
| §7.4 cyclotomic even regular-prime theorem | ℓ=3,oneplace,Pic/3=0;ℓ=37 | H²rank0;nonzeroPic37part | 0+1−1=0;irregularnegativecontrol | Equal | No field-evenvanishing |
| §7.4 integer regular-primary torsion | ℓ=3,i=2,3 | oddK₃tors3partC₃,K₅tors3part0 | 2divides2,not3;w₂3part3,w₃3part1 | Equal | None |
| §7.4 canonical Bott shift andfreebasis | ℓ=3,5 | period4basisdegrees0,1,3;period8degrees0,1,5,7 | generatorcounts3,4 | Equal | No associative mod3 product assumed |
| §7.4 root choice andcharacter basis | primitive rootζ→ζ²atℓ5 | b rescalesby2⁴=16≡1;characterxjchoiceschangebasis | operationunchanged,basisnoncanonical | Equal | None |
| §7.5 stable rank filtrationandPIDconnectivity | ℤ,m=2,4;zeroring | bounds1,4;zeroringfree2≃free1 | general m−1gives1,3butrank4needs4;zeroringexcluded | Equal | DistinctfromQ-rankfiltration |
| §7.5 low-spectrumhomologyanddifferentials | ℤ,degrees0…4 | ℤ,0,0,C₂,0 | degree4homology0butdegree3nonzero | Equal | η differential retained |
| §7.5 Bökstedt comparison andK₄vanishing | 2-primarydegree3,4 | JK₃=C₁₆,JK₄=0;K₄ℤ=0 | η image0;no totaldegree4survivor | Equal | Unconditional target |
| §7.5 special-value K-order ratio | ℚ,k=1,2 | 2·2/48=1/12;2·1/240=1/120 | ∣ζ(−1)∣=1/12,∣ζ(−3)∣=1/120 | Equal | AlltotallyrealFscopepreserved |
| §7.5 Euler quotient andrationality | ℚ,k1,2-primary | v₂H²=1,v₂H¹=3,difference−2 | v₂(1/12)=−2 | Equal | Supplier theorem used withoutnewgap |
| §7.5 integer even orders | degrees2,6,22 | 2,1,691 | 2c₁=2,c₂=1,c₆=691 | Equal | Index2a+2insecondrow |
| §7.5 Vandiver finite deduction | p3and37,trivial/χcomponents;evenχcomponent | p3allclasscomponents0;plusvanishingforcesK4a ppart0 | χ^(−i) evenfori even | Equal | No cyclethroughK₃/Bloch |
| §7.5 conditional integer table | globalVandiver,degree2,3,4,5,6,7 | C₂,C₄₈,0,ℤ,0,C₂₄₀ | c₁=c₂=1,w₂=24,w₄=240 | Equal | K₄separatelyunconditional |
| §8.1 invariant records and arithmetic presentation | goldenfield degree/signature/units/w₂ | 2,(2,0),rank1,w₂120;fake degree3fails | 2+0=2,2−1=1,degree2≠3 | Equal | Invariant equalities retained |
| §8.1 independence and finite bounds | integer,Gaussian,golden | upper/lower orders2/2,1/1,4/4 | matchedorders2,1,4 | Equal | No proof-provenance Prop field |
| §8.2 supplied low-degree examples | ℤ,n=0,1,2,3 | ℤ,C₂,C₂,C₄₈ | degree0/1/2 suppliers;degree3 realtable | Equal | No duplicate construction |
| §8.2 one-prime exact extension | p2,p3,n=2,4 | K₂:C₂,C₂²;K₄:C₃,C₈ | orders2(p−1),p²−1 | Equal | No high-degree splitting fromorder |
| §8.2 rational infinite direct sum | residue primes2,3,5 | orders1,2,4 | 𝔽p×sizesp−1 | Equal | Fullsupportproductexcluded |
| §8.3 Tate image filtration andexhaustion | ℚ,step0;symbol{−1,3} | step0generatedg;3-residue−1≠1 | g tame;symbolnotin2-onlystep | Equal | Imagesnotsymbolpresentations |
| §8.3 principal-step alpha, U₁ andtriangle | v5,u2;Gaussianπ1+i | t{2,5}=2,β{2,5}=3;i=1+(1+i)i | alpha reduction2;i∈U₁,quotienttrivial | Equal | Tateinverseconventionretained |
| §8.4 Tate criterionandnormstrictness | q5,a6,b1; a26,b1; a=b | Ndiff5<25;25=25;0 | onev-factor;strictboundrejectssecond;identitythird | Equal | No divisionbyzero |
| §8.4 finite descent | startstepm,endm₀=0;singleextrastep | zero residueallowsone-stepdrop;finite m drops | ordinaryunitsymbolgenerationat0 | Equal | No infinite-limit argument |
| §8.5 Gaussian Euclidean criterion | q5,C={±1,±i,±1±i} | 8elements,reduction4nonzeroresidues;1+1/√2<√5 | fullresiduegroup4;strictinequality | Equal | Norm2stepseparate |
| §8.5 Gaussian residual symbol | z={i,i} | 3z=0,4z=0,gcd(3,4)=1 | z=0,K₂ℤ[i]order1 | Equal | Fieldgroupstillinfinite |
| §8.6 congruence latticeandgeneralindex | ℚ,q5,s2,3,residue2 | index5,25;(2,1)yes,(1,1)no | q^(s−1)=5,25 | Equal | Generallengthbeforegoldenspecialization |
| §8.6 archimedeanmeasureandMinkowski bound | ℚi;s=2golden;ℚ B_t | covol2;5q;volinterval2t | √∣−4∣=2;5q;2^1t/dℚ=2t | Equal | Complexmeasurefactor2retained |
| §8.6 stretch andoldunitsstrictbound | goldendyadicq4,t4,tuple(2,2);diag2,1/2 | normcoordinates4,zero residues;stretchdet1 | strict t<4fails;normproductinvariant | Equal | None |
| §8.6 golden arithmetic formulas | ε=[0,1],ε²=[1,1],conjugateε=[1,−1] | ε²=ε+1;norm−1,1;productεconjε=−1 | listedmultiplication/conjugationformula | Equal | Pinnedfielddataused |
| §8.7 smallfraction comparison | ℚ,v5,2/1and1/3 | residue2,crossdiff5;bound12<25 | samequotientclass;zerodiffhandledseparately | Equal | None |
| §8.7 residue-section normalizationandchoice | unitresidue1; fractionx/yanditsreciprocal | γ1=1,residuesa,a⁻¹ | reduction∘γ=id;reversalnotinvisible | Equal | Multiplicativityseparate |
| §8.7 three-coordinateproductbound | generaldegree n andgoldenn2 | 2^n t₃t<q²;goldenfactor4 | 2^n d² q^(7/6)<q²⇔q>2^(6n/5)d^(12/5) | Equal | Denominatornonzero |
| §8.7 cutoff and inverseprime generators | goldend=1.4235...,q>33,q′≥4 | 16d²=32.4228...;√5<4;∣σπ′∣≤sqrt(√5/q′)<1 | allcutoffstrictbounds;inversegeneratornormbound | Equal | No integral-generator substitution |
| §8.8 relation lattice and matched index | firstprimeq4,minors6,−3 | gcd=3,indices3≤index≤3 | index=q−1=3 | Equal | Everyrelationandminorindividuallylistedbelow |
| §8.9 ordinary-unit upper bound | g,h,genericbilinearity | 2g=2h=0,upperorder4 | C₂² surjects tamekernel | Equal | No zeta used |
| §8.9 independent real signs andgolden isomorphism | εsigns(+,-);g,h | g=(−1,−1),h=(1,−1);matrixdet1mod2 | quotientC₂²,lowerorder4 | Equal | Bothboundsindependent |
| §8.9 downstream special-value check | goldentameorder4,w₂120 | 4/120=1/30 | ζF(−1)=1/30 | Equal | Notaninputtogeneration |
| §8.10 degree-three arithmetic groups | ℤandℤi | C₄₈andℤ⊕C₂₄ | realnonsplitfactor2versusimaginaryrank1 | Equal | No downstreamBlochinput |
| Supplier correction: real lattices and Minkowski | ℚ latticeℤ,q5 congruence index5 | covolumes1,5;ratio5 | ZLattice covolume ratio equalsindex5 | Equal | IntegralLattices attribution replaced by pinned Mathlib |
| §6.6 zero multiplier negative control | A with div A=C₂,T=div A,m=0 | T∩0A=0,cardinality1 | div A=C₂,cardinality2 | Unequal;excluded | Positive m made explicit |

### Individually recomputed finite arithmetic

| Statement | Instances tried | Left value | Right value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §8.8 π=(2,0), relation 1 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-10,6) | (-10,6) | Equal | None |
| §8.8 π=(2,0), relation 2 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,-6) | (-4,-6) | Equal | None |
| §8.8 π=(2,0), relation 3 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-6,-10) | (-6,-10) | Equal | None |
| §8.8 π=(2,0), relation 4 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-2,2) | (-2,2) | Equal | None |
| §8.8 π=(2,0), minor (1,3) | Columns in stated order | 6 | 6 | Equal | None |
| §8.8 π=(2,0), minor (4,2) | Columns in stated order | -3 | -3 | Equal | None |
| §8.8 π=(2,0), relation-lattice index bounds | Surjective residue group | 3 ≤ index ≤ gcd(6, -3)=3 | index=3 | Equal | None |
| §8.8 π=(2,0), reduction and generation | All old generators | [(1, 0), (0, 1)] | [(1, 0), (0, 1)] | Equal | None |
| §8.8 π=(2,0), residue surjectivity | Multiplicative span | 3 | 3 | Equal | None |
| §8.8 π=(-1,2), relation 1 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-32,-16) | (-32,-16) | Equal | None |
| §8.8 π=(-1,2), relation 2 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,-12) | (-4,-12) | Equal | None |
| §8.8 π=(-1,2), relation 3 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-8,6) | (-8,6) | Equal | None |
| §8.8 π=(-1,2), minor (1,2,3) | Columns in stated order | 4 | 4 | Equal | None |
| §8.8 π=(-1,2), relation-lattice index bounds | Surjective residue group | 4 ≤ index ≤ gcd(4,)=4 | index=4 | Equal | None |
| §8.8 π=(-1,2), reduction and generation | All old generators | [4, 3, 2] | [4, 3, 2] | Equal | None |
| §8.8 π=(-1,2), residue surjectivity | Multiplicative span | 4 | 4 | Equal | None |
| §8.8 π=(3,0), relation 1 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-30,15) | (-30,15) | Equal | None |
| §8.8 π=(3,0), relation 2 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-12,-6) | (-12,-6) | Equal | None |
| §8.8 π=(3,0), relation 3 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-15,-15) | (-15,-15) | Equal | None |
| §8.8 π=(3,0), relation 4 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (0,-6) | (0,-6) | Equal | None |
| §8.8 π=(3,0), minor (2,1,3,4) | Columns in stated order | 8 | 8 | Equal | None |
| §8.8 π=(3,0), relation-lattice index bounds | Surjective residue group | 8 ≤ index ≤ gcd(8,)=8 | index=8 | Equal | None |
| §8.8 π=(3,0), reduction and generation | All old generators | [(2, 0), (0, 1), (2, 0), (2, 2)] | [(2, 0), (0, 1), (2, 0), (2, 2)] | Equal | None |
| §8.8 π=(3,0), residue surjectivity | Multiplicative span | 8 | 8 | Equal | None |
| §8.8 π=(3,1), relation 1 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-6,-24) | (-6,-24) | Equal | None |
| §8.8 π=(3,1), relation 2 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-10,-18) | (-10,-18) | Equal | None |
| §8.8 π=(3,1), relation 3 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,6) | (-4,6) | Equal | None |
| §8.8 π=(3,1), relation 4 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-12,18) | (-12,18) | Equal | None |
| §8.8 π=(3,1), relation 5 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-7,5) | (-7,5) | Equal | None |
| §8.8 π=(3,1), relation 6 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-15,6) | (-15,6) | Equal | None |
| §8.8 π=(3,1), relation 7 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-27,-9) | (-27,-9) | Equal | None |
| §8.8 π=(3,1), relation 8 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-3,21) | (-3,21) | Equal | None |
| §8.8 π=(3,1), relation 9 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-2,14) | (-2,14) | Equal | None |
| §8.8 π=(3,1), relation 10 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-20,-25) | (-20,-25) | Equal | None |
| §8.8 π=(3,1), relation 11 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-9,-3) | (-9,-3) | Equal | None |
| §8.8 π=(3,1), relation 12 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-9,8) | (-9,8) | Equal | None |
| §8.8 π=(3,1), relation 13 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-6,-13) | (-6,-13) | Equal | None |
| §8.8 π=(3,1), relation 14 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-5,2) | (-5,2) | Equal | None |
| §8.8 π=(3,1), relation 15 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,28) | (-4,28) | Equal | None |
| §8.8 π=(3,1), minor (5,7,2,10,6) | Columns in stated order | 60 | 60 | Equal | None |
| §8.8 π=(3,1), minor (12,8,11,9,13) | Columns in stated order | -30 | -30 | Equal | None |
| §8.8 π=(3,1), minor (3,1,4,15,14) | Columns in stated order | -10 | -10 | Equal | None |
| §8.8 π=(3,1), relation-lattice index bounds | Surjective residue group | 10 ≤ index ≤ gcd(60, -30, -10)=10 | index=10 | Equal | None |
| §8.8 π=(3,1), reduction and generation | All old generators | [10, 8, 2, 4, 3] | [10, 8, 2, 4, 3] | Equal | None |
| §8.8 π=(3,1), residue surjectivity | Multiplicative span | 10 | 10 | Equal | None |
| §8.8 π=(4,-1), relation 1 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-11,0) | (-11,0) | Equal | None |
| §8.8 π=(4,-1), relation 2 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-15,12) | (-15,12) | Equal | None |
| §8.8 π=(4,-1), relation 3 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-5,-7) | (-5,-7) | Equal | None |
| §8.8 π=(4,-1), relation 4 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-22,22) | (-22,22) | Equal | None |
| §8.8 π=(4,-1), relation 5 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-16,-18) | (-16,-18) | Equal | None |
| §8.8 π=(4,-1), relation 6 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,-10) | (-4,-10) | Equal | None |
| §8.8 π=(4,-1), relation 7 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-2,-5) | (-2,-5) | Equal | None |
| §8.8 π=(4,-1), relation 8 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-10,8) | (-10,8) | Equal | None |
| §8.8 π=(4,-1), relation 9 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-9,-6) | (-9,-6) | Equal | None |
| §8.8 π=(4,-1), relation 10 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-10,8) | (-10,8) | Equal | None |
| §8.8 π=(4,-1), relation 11 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-8,-20) | (-8,-20) | Equal | None |
| §8.8 π=(4,-1), relation 12 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-15,-21) | (-15,-21) | Equal | None |
| §8.8 π=(4,-1), minor (4,7,1,12,5,9) | Columns in stated order | 70 | 70 | Equal | None |
| §8.8 π=(4,-1), minor (11,3,10,2,6,8) | Columns in stated order | -20 | -20 | Equal | None |
| §8.8 π=(4,-1), relation-lattice index bounds | Surjective residue group | 10 ≤ index ≤ gcd(70, -20)=10 | index=10 | Equal | None |
| §8.8 π=(4,-1), reduction and generation | All old generators | [10, 4, 2, 7, 3, 7] | [10, 4, 2, 7, 3, 7] | Equal | None |
| §8.8 π=(4,-1), residue surjectivity | Multiplicative span | 10 | 10 | Equal | None |
| §8.8 π=(4,1), relation 1 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-24,-6) | (-24,-6) | Equal | None |
| §8.8 π=(4,1), relation 2 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-3,4) | (-3,4) | Equal | None |
| §8.8 π=(4,1), relation 3 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-17,10) | (-17,10) | Equal | None |
| §8.8 π=(4,1), relation 4 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-9,-7) | (-9,-7) | Equal | None |
| §8.8 π=(4,1), relation 5 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-20,14) | (-20,14) | Equal | None |
| §8.8 π=(4,1), relation 6 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-13,-8) | (-13,-8) | Equal | None |
| §8.8 π=(4,1), relation 7 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-13,-8) | (-13,-8) | Equal | None |
| §8.8 π=(4,1), relation 8 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-16,15) | (-16,15) | Equal | None |
| §8.8 π=(4,1), relation 9 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-16,-4) | (-16,-4) | Equal | None |
| §8.8 π=(4,1), relation 10 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-17,10) | (-17,10) | Equal | None |
| §8.8 π=(4,1), relation 11 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-5,13) | (-5,13) | Equal | None |
| §8.8 π=(4,1), relation 12 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-11,2) | (-11,2) | Equal | None |
| §8.8 π=(4,1), relation 13 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-9,12) | (-9,12) | Equal | None |
| §8.8 π=(4,1), relation 14 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-6,8) | (-6,8) | Equal | None |
| §8.8 π=(4,1), minor (9,10,3,1,11,14,8) | Columns in stated order | -54 | -54 | Equal | None |
| §8.8 π=(4,1), minor (12,5,13,2,7,6,4) | Columns in stated order | -36 | -36 | Equal | None |
| §8.8 π=(4,1), relation-lattice index bounds | Surjective residue group | 18 ≤ index ≤ gcd(-54, -36)=18 | index=18 | Equal | None |
| §8.8 π=(4,1), reduction and generation | All old generators | [18, 15, 2, 10, 3, 18, 8] | [18, 15, 2, 10, 3, 18, 8] | Equal | None |
| §8.8 π=(4,1), residue surjectivity | Multiplicative span | 18 | 18 | Equal | None |
| §8.8 π=(5,-1), relation 1 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-32,14) | (-32,14) | Equal | None |
| §8.8 π=(5,-1), relation 2 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-12,10) | (-12,10) | Equal | None |
| §8.8 π=(5,-1), relation 3 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-21,8) | (-21,8) | Equal | None |
| §8.8 π=(5,-1), relation 4 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-24,20) | (-24,20) | Equal | None |
| §8.8 π=(5,-1), relation 5 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-1,-15) | (-1,-15) | Equal | None |
| §8.8 π=(5,-1), relation 6 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-13,-5) | (-13,-5) | Equal | None |
| §8.8 π=(5,-1), relation 7 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-18,15) | (-18,15) | Equal | None |
| §8.8 π=(5,-1), relation 8 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,16) | (-4,16) | Equal | None |
| §8.8 π=(5,-1), relation 9 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-16,7) | (-16,7) | Equal | None |
| §8.8 π=(5,-1), relation 10 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-6,24) | (-6,24) | Equal | None |
| §8.8 π=(5,-1), relation 11 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-14,-1) | (-14,-1) | Equal | None |
| §8.8 π=(5,-1), relation 12 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-12,10) | (-12,10) | Equal | None |
| §8.8 π=(5,-1), relation 13 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-19,19) | (-19,19) | Equal | None |
| §8.8 π=(5,-1), relation 14 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-5,20) | (-5,20) | Equal | None |
| §8.8 π=(5,-1), relation 15 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-19,19) | (-19,19) | Equal | None |
| §8.8 π=(5,-1), relation 16 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,16) | (-4,16) | Equal | None |
| §8.8 π=(5,-1), minor (15,11,10,7,16,5,13,4) | Columns in stated order | 216 | 216 | Equal | None |
| §8.8 π=(5,-1), minor (3,6,2,14,12,9,1,8) | Columns in stated order | -18 | -18 | Equal | None |
| §8.8 π=(5,-1), relation-lattice index bounds | Surjective residue group | 18 ≤ index ≤ gcd(216, -18)=18 | index=18 | Equal | None |
| §8.8 π=(5,-1), reduction and generation | All old generators | [18, 5, 2, 9, 3, 8, 18, 9] | [18, 5, 2, 9, 3, 8, 18, 9] | Equal | None |
| §8.8 π=(5,-1), residue surjectivity | Multiplicative span | 18 | 18 | Equal | None |
| §8.8 π=(5,1), relation 1 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-11,21) | (-11,21) | Equal | None |
| §8.8 π=(5,1), relation 2 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-20,25) | (-20,25) | Equal | None |
| §8.8 π=(5,1), relation 3 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-14,3) | (-14,3) | Equal | None |
| §8.8 π=(5,1), relation 4 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-26,18) | (-26,18) | Equal | None |
| §8.8 π=(5,1), relation 5 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,5) | (-4,5) | Equal | None |
| §8.8 π=(5,1), relation 6 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,5) | (-4,5) | Equal | None |
| §8.8 π=(5,1), relation 7 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-1,-6) | (-1,-6) | Equal | None |
| §8.8 π=(5,1), relation 8 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-6,-7) | (-6,-7) | Equal | None |
| §8.8 π=(5,1), relation 9 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-1,-6) | (-1,-6) | Equal | None |
| §8.8 π=(5,1), relation 10 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-18,-21) | (-18,-21) | Equal | None |
| §8.8 π=(5,1), relation 11 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-13,9) | (-13,9) | Equal | None |
| §8.8 π=(5,1), relation 12 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-16,20) | (-16,20) | Equal | None |
| §8.8 π=(5,1), relation 13 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-6,-7) | (-6,-7) | Equal | None |
| §8.8 π=(5,1), relation 14 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-16,-9) | (-16,-9) | Equal | None |
| §8.8 π=(5,1), relation 15 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-7,16) | (-7,16) | Equal | None |
| §8.8 π=(5,1), relation 16 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-2,-12) | (-2,-12) | Equal | None |
| §8.8 π=(5,1), relation 17 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-1,-6) | (-1,-6) | Equal | None |
| §8.8 π=(5,1), relation 18 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-3,11) | (-3,11) | Equal | None |
| §8.8 π=(5,1), relation 19 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-16,-9) | (-16,-9) | Equal | None |
| §8.8 π=(5,1), relation 20 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-15,-3) | (-15,-3) | Equal | None |
| §8.8 π=(5,1), relation 21 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-14,3) | (-14,3) | Equal | None |
| §8.8 π=(5,1), relation 22 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-1,23) | (-1,23) | Equal | None |
| §8.8 π=(5,1), relation 23 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-20,-4) | (-20,-4) | Equal | None |
| §8.8 π=(5,1), relation 24 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-8,10) | (-8,10) | Equal | None |
| §8.8 π=(5,1), relation 25 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-24,1) | (-24,1) | Equal | None |
| §8.8 π=(5,1), relation 26 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-13,9) | (-13,9) | Equal | None |
| §8.8 π=(5,1), relation 27 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-11,-8) | (-11,-8) | Equal | None |
| §8.8 π=(5,1), minor (23,22,8,16,25,26,14,4,2) | Columns in stated order | -168 | -168 | Equal | None |
| §8.8 π=(5,1), minor (12,11,5,7,18,17,21,15,20) | Columns in stated order | -224 | -224 | Equal | None |
| §8.8 π=(5,1), minor (24,9,6,19,10,1,13,3,27) | Columns in stated order | 420 | 420 | Equal | None |
| §8.8 π=(5,1), relation-lattice index bounds | Surjective residue group | 28 ≤ index ≤ gcd(-168, -224, 420)=28 | index=28 | Equal | None |
| §8.8 π=(5,1), reduction and generation | All old generators | [28, 24, 2, 18, 3, 27, 9, 28, 10] | [28, 24, 2, 18, 3, 27, 9, 28, 10] | Equal | None |
| §8.8 π=(5,1), residue surjectivity | Multiplicative span | 28 | 28 | Equal | None |
| §8.8 π=(6,-1), relation 1 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-10,-8) | (-10,-8) | Equal | None |
| §8.8 π=(6,-1), relation 2 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-9,-13) | (-9,-13) | Equal | None |
| §8.8 π=(6,-1), relation 3 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-14,-17) | (-14,-17) | Equal | None |
| §8.8 π=(6,-1), relation 4 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-5,-4) | (-5,-4) | Equal | None |
| §8.8 π=(6,-1), relation 5 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-8,11) | (-8,11) | Equal | None |
| §8.8 π=(6,-1), relation 6 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-2,10) | (-2,10) | Equal | None |
| §8.8 π=(6,-1), relation 7 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-6,1) | (-6,1) | Equal | None |
| §8.8 π=(6,-1), relation 8 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-11,-3) | (-11,-3) | Equal | None |
| §8.8 π=(6,-1), relation 9 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-8,-18) | (-8,-18) | Equal | None |
| §8.8 π=(6,-1), relation 10 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-10,-8) | (-10,-8) | Equal | None |
| §8.8 π=(6,-1), relation 11 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-3,15) | (-3,15) | Equal | None |
| §8.8 π=(6,-1), relation 12 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-31,10) | (-31,10) | Equal | None |
| §8.8 π=(6,-1), relation 13 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-3,15) | (-3,15) | Equal | None |
| §8.8 π=(6,-1), relation 14 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,20) | (-4,20) | Equal | None |
| §8.8 π=(6,-1), relation 15 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-10,21) | (-10,21) | Equal | None |
| §8.8 π=(6,-1), relation 16 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-9,16) | (-9,16) | Equal | None |
| §8.8 π=(6,-1), relation 17 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-30,5) | (-30,5) | Equal | None |
| §8.8 π=(6,-1), relation 18 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-15,17) | (-15,17) | Equal | None |
| §8.8 π=(6,-1), relation 19 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-5,25) | (-5,25) | Equal | None |
| §8.8 π=(6,-1), relation 20 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-19,8) | (-19,8) | Equal | None |
| §8.8 π=(6,-1), minor (19,6,9,10,4,12,20,1,13,17) | Columns in stated order | 56 | 56 | Equal | None |
| §8.8 π=(6,-1), minor (16,5,3,15,7,14,18,2,11,8) | Columns in stated order | 28 | 28 | Equal | None |
| §8.8 π=(6,-1), relation-lattice index bounds | Surjective residue group | 28 ≤ index ≤ gcd(56, 28)=28 | index=28 | Equal | None |
| §8.8 π=(6,-1), reduction and generation | All old generators | [28, 6, 2, 11, 3, 9, 27, 10, 28, 11] | [28, 6, 2, 11, 3, 9, 27, 10, 28, 11] | Equal | None |
| §8.8 π=(6,-1), residue surjectivity | Multiplicative span | 28 | 28 | Equal | None |
| §8.8 π=(5,2), relation 1 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-26,2) | (-26,2) | Equal | None |
| §8.8 π=(5,2), relation 2 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-3,5) | (-3,5) | Equal | None |
| §8.8 π=(5,2), relation 3 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-1,12) | (-1,12) | Equal | None |
| §8.8 π=(5,2), relation 4 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-19,-20) | (-19,-20) | Equal | None |
| §8.8 π=(5,2), relation 5 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-3,5) | (-3,5) | Equal | None |
| §8.8 π=(5,2), relation 6 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-12,-11) | (-12,-11) | Equal | None |
| §8.8 π=(5,2), relation 7 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-3,5) | (-3,5) | Equal | None |
| §8.8 π=(5,2), relation 8 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-16,6) | (-16,6) | Equal | None |
| §8.8 π=(5,2), relation 9 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-7,-9) | (-7,-9) | Equal | None |
| §8.8 π=(5,2), relation 10 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-18,-1) | (-18,-1) | Equal | None |
| §8.8 π=(5,2), relation 11 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-2,24) | (-2,24) | Equal | None |
| §8.8 π=(5,2), relation 12 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-5,-2) | (-5,-2) | Equal | None |
| §8.8 π=(5,2), relation 13 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-9,-16) | (-9,-16) | Equal | None |
| §8.8 π=(5,2), relation 14 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-24,-22) | (-24,-22) | Equal | None |
| §8.8 π=(5,2), relation 15 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-6,10) | (-6,10) | Equal | None |
| §8.8 π=(5,2), relation 16 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-21,4) | (-21,4) | Equal | None |
| §8.8 π=(5,2), relation 17 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,17) | (-4,17) | Equal | None |
| §8.8 π=(5,2), relation 18 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-17,-13) | (-17,-13) | Equal | None |
| §8.8 π=(5,2), relation 19 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,-14) | (-4,-14) | Equal | None |
| §8.8 π=(5,2), relation 20 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-2,24) | (-2,24) | Equal | None |
| §8.8 π=(5,2), relation 21 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-17,18) | (-17,18) | Equal | None |
| §8.8 π=(5,2), relation 22 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,17) | (-4,17) | Equal | None |
| §8.8 π=(5,2), minor (15,9,14,17,19,22,4,13,5,1,10) | Columns in stated order | 90 | 90 | Equal | None |
| §8.8 π=(5,2), minor (20,2,21,8,7,16,6,12,11,3,18) | Columns in stated order | 60 | 60 | Equal | None |
| §8.8 π=(5,2), relation-lattice index bounds | Surjective residue group | 30 ≤ index ≤ gcd(90, 60)=30 | index=30 | Equal | None |
| §8.8 π=(5,2), reduction and generation | All old generators | [30, 13, 2, 25, 3, 16, 22, 17, 23, 18, 24] | [30, 13, 2, 25, 3, 16, 22, 17, 23, 18, 24] | Equal | None |
| §8.8 π=(5,2), residue surjectivity | Multiplicative span | 30 | 30 | Equal | None |
| §8.8 π=(7,-2), relation 1 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-23,-20) | (-23,-20) | Equal | None |
| §8.8 π=(7,-2), relation 2 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-14,-27) | (-14,-27) | Equal | None |
| §8.8 π=(7,-2), relation 3 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-13,17) | (-13,17) | Equal | None |
| §8.8 π=(7,-2), relation 4 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-21,6) | (-21,6) | Equal | None |
| §8.8 π=(7,-2), relation 5 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-8,20) | (-8,20) | Equal | None |
| §8.8 π=(7,-2), relation 6 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-7,2) | (-7,2) | Equal | None |
| §8.8 π=(7,-2), relation 7 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,10) | (-4,10) | Equal | None |
| §8.8 π=(7,-2), relation 8 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-5,-3) | (-5,-3) | Equal | None |
| §8.8 π=(7,-2), relation 9 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-7,2) | (-7,2) | Equal | None |
| §8.8 π=(7,-2), relation 10 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-2,5) | (-2,5) | Equal | None |
| §8.8 π=(7,-2), relation 11 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-13,17) | (-13,17) | Equal | None |
| §8.8 π=(7,-2), relation 12 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-6,15) | (-6,15) | Equal | None |
| §8.8 π=(7,-2), relation 13 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-1,18) | (-1,18) | Equal | None |
| §8.8 π=(7,-2), relation 14 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-21,6) | (-21,6) | Equal | None |
| §8.8 π=(7,-2), relation 15 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-15,-9) | (-15,-9) | Equal | None |
| §8.8 π=(7,-2), relation 16 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-10,25) | (-10,25) | Equal | None |
| §8.8 π=(7,-2), relation 17 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-13,-14) | (-13,-14) | Equal | None |
| §8.8 π=(7,-2), relation 18 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-4,-21) | (-4,-21) | Equal | None |
| §8.8 π=(7,-2), relation 19 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-30,13) | (-30,13) | Equal | None |
| §8.8 π=(7,-2), relation 20 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-23,11) | (-23,11) | Equal | None |
| §8.8 π=(7,-2), relation 21 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-17,27) | (-17,27) | Equal | None |
| §8.8 π=(7,-2), relation 22 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-21,6) | (-21,6) | Equal | None |
| §8.8 π=(7,-2), relation 23 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-10,25) | (-10,25) | Equal | None |
| §8.8 π=(7,-2), relation 24 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-18,14) | (-18,14) | Equal | None |
| §8.8 π=(7,-2), relation 25 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-12,-1) | (-12,-1) | Equal | None |
| §8.8 π=(7,-2), relation 26 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-11,12) | (-11,12) | Equal | None |
| §8.8 π=(7,-2), relation 27 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-11,12) | (-11,12) | Equal | None |
| §8.8 π=(7,-2), relation 28 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-7,-29) | (-7,-29) | Equal | None |
| §8.8 π=(7,-2), relation 29 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-1,18) | (-1,18) | Equal | None |
| §8.8 π=(7,-2), relation 30 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-31,0) | (-31,0) | Equal | None |
| §8.8 π=(7,-2), relation 31 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-11,12) | (-11,12) | Equal | None |
| §8.8 π=(7,-2), relation 32 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-8,20) | (-8,20) | Equal | None |
| §8.8 π=(7,-2), relation 33 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-3,23) | (-3,23) | Equal | None |
| §8.8 π=(7,-2), relation 34 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-31,0) | (-31,0) | Equal | None |
| §8.8 π=(7,-2), relation 35 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-26,3) | (-26,3) | Equal | None |
| §8.8 π=(7,-2), relation 36 | Exact arithmetic in ℚ[ε], ε²=ε+1 | (-17,27) | (-17,27) | Equal | None |
| §8.8 π=(7,-2), minor (20,30,9,29,28,11,33,24,12,15,32,25) | Columns in stated order | -180 | -180 | Equal | None |
| §8.8 π=(7,-2), minor (31,1,23,4,34,36,13,22,10,3,6,2) | Columns in stated order | -240 | -240 | Equal | None |
| §8.8 π=(7,-2), minor (5,35,19,21,16,7,18,8,27,26,17,14) | Columns in stated order | -90 | -90 | Equal | None |
| §8.8 π=(7,-2), relation-lattice index bounds | Surjective residue group | 30 ≤ index ≤ gcd(-180, -240, -90)=30 | index=30 | Equal | None |
| §8.8 π=(7,-2), reduction and generation | All old generators | [30, 19, 2, 6, 3, 22, 16, 23, 17, 24, 18, 12] | [30, 19, 2, 6, 3, 22, 16, 23, 17, 24, 18, 12] | Equal | None |
| §8.8 π=(7,-2), residue surjectivity | Multiplicative span | 30 | 30 | Equal | None |
| §7.1 positive Bernoulli convention, k=0 | Recurrence with B₀=1 | -1 | -1 | Equal | None |
| §7.1 positive Bernoulli convention, k=1 | Recurrence with B₀=1 | 1/6 | 1/6 | Equal | None |
| §7.1 positive Bernoulli convention, k=2 | Recurrence with B₀=1 | 1/30 | 1/30 | Equal | None |
| §7.1 positive Bernoulli convention, k=3 | Recurrence with B₀=1 | 1/42 | 1/42 | Equal | None |
| §7.1 positive Bernoulli convention, k=5 | Recurrence with B₀=1 | 5/66 | 5/66 | Equal | None |
| §7.1 positive Bernoulli convention, k=6 | Recurrence with B₀=1 | 691/2730 | 691/2730 | Equal | None |
| §7.1 positive Bernoulli convention, k=16 | Recurrence with B₀=1 | 7709321041217/510 | 7709321041217/510 | Equal | None |
| §§4.4/7.1 rational weight 2 | Bernoulli denominator | 24 | 24 | Equal | None |
| §§4.4/7.1 rational weight 4 | Bernoulli denominator | 240 | 240 | Equal | None |
| §§4.4/7.1 rational weight 6 | Bernoulli denominator | 504 | 504 | Equal | None |
| §§4.4/7.1 rational weight 10 | Bernoulli denominator | 264 | 264 | Equal | None |
| §§4.4/7.1 rational weight 12 | Bernoulli denominator | 65520 | 65520 | Equal | None |
| §7.2 divided Bernoulli p=3, k=1 | Reduced fraction | 1/6; numerator mod p=1 | nonzero residue | Equal | None |
| §7.2 divided Bernoulli p=5, k=1 | Reduced fraction | 1/6; numerator mod p=1 | nonzero residue | Equal | None |
| §7.2 divided Bernoulli p=5, k=3 | Reduced fraction | 1/126; numerator mod p=1 | nonzero residue | Equal | None |
| §7.2 divided Bernoulli p=5, k=5 | Reduced fraction | 1/66; numerator mod p=1 | nonzero residue | Equal | None |
| §7.2 divided Bernoulli p=37, k=16 | Reduced fraction | -7709321041217/8160; numerator mod p=0 | 0; irregular negative control | Equal | None |
| §6.10 cyclic norm criterion, m=4 | 2 faithful unit actions | [(3, 0, 2, 1)] | [(3, 0, 2, 1)] | Unique excluded inversion action | None |
| §6.10 cyclic norm criterion, m=8 | 4 faithful unit actions | [(7, 0, 2, 1)] | [(7, 0, 2, 1)] | Unique excluded inversion action | None |
| §6.10 cyclic norm criterion, m=16 | 8 faithful unit actions | [(15, 0, 2, 1)] | [(15, 0, 2, 1)] | Unique excluded inversion action | None |
| §6.10 cyclic norm criterion, m=32 | 16 faithful unit actions | [(31, 0, 2, 1)] | [(31, 0, 2, 1)] | Unique excluded inversion action | None |
| §6.10 cyclic norm criterion, m=64 | 32 faithful unit actions | [(63, 0, 2, 1)] | [(63, 0, 2, 1)] | Unique excluded inversion action | None |
| §6.10 cyclic norm criterion, m=128 | 64 faithful unit actions | [(127, 0, 2, 1)] | [(127, 0, 2, 1)] | Unique excluded inversion action | None |
| §6.10 cyclic norm criterion, m=256 | 128 faithful unit actions | [(255, 0, 2, 1)] | [(255, 0, 2, 1)] | Unique excluded inversion action | None |
| §§5.5/6.10 norm witness m=4, a=3 | Sum of cyclic action powers | 0 | 0 | Equal | None |
| §§5.5/6.10 norm witness m=8, a=3 | Sum of cyclic action powers | 4 | 4 | Equal | None |
| §§5.5/6.10 norm witness m=8, a=5 | Sum of cyclic action powers | 6 | 6 | Equal | None |
| §§5.5/6.10 norm witness m=16, a=7 | Sum of cyclic action powers | 8 | 8 | Equal | None |
| §6.6 eventual intersection in C_4 | T has order 2 and exponent 2 | [[0, 2], [0]] | [[0, 2], [0]] | Equal | None |
| §6.6 eventual intersection in C_8 | T has order 2 and exponent 2 | [[0, 4], [0, 4], [0]] | [[0, 4], [0, 4], [0]] | Equal | None |
| §6.6 eventual intersection in C_32 | T has order 2 and exponent 2 | [[0, 16], [0, 16], [0, 16], [0, 16], [0]] | [[0, 16], [0, 16], [0, 16], [0, 16], [0]] | Equal | None |
| §6.15 slot j=-3, ε=-1 | Integer-degree and sign identities | (0,-3); total=-6; sign=-1 | total=-6; sign=-1 | Equal | None |
| §6.15 slot j=-3, ε=1 | Integer-degree and sign identities | (2,-2); total=-6; sign=1 | total=-6; sign=1 | Equal | None |
| §6.15 slot j=-2, ε=-1 | Integer-degree and sign identities | (2,-1); total=-4; sign=-1 | total=-4; sign=-1 | Equal | None |
| §6.15 slot j=-2, ε=1 | Integer-degree and sign identities | (0,-2); total=-4; sign=1 | total=-4; sign=1 | Equal | None |
| §6.15 slot j=-1, ε=-1 | Integer-degree and sign identities | (0,-1); total=-2; sign=-1 | total=-2; sign=-1 | Equal | None |
| §6.15 slot j=-1, ε=1 | Integer-degree and sign identities | (2,0); total=-2; sign=1 | total=-2; sign=1 | Equal | None |
| §6.15 slot j=0, ε=-1 | Integer-degree and sign identities | (2,1); total=0; sign=-1 | total=0; sign=-1 | Equal | None |
| §6.15 slot j=0, ε=1 | Integer-degree and sign identities | (0,0); total=0; sign=1 | total=0; sign=1 | Equal | None |
| §6.15 slot j=1, ε=-1 | Integer-degree and sign identities | (0,1); total=2; sign=-1 | total=2; sign=-1 | Equal | None |
| §6.15 slot j=1, ε=1 | Integer-degree and sign identities | (2,2); total=2; sign=1 | total=2; sign=1 | Equal | None |
| §6.15 slot j=2, ε=-1 | Integer-degree and sign identities | (2,3); total=4; sign=-1 | total=4; sign=-1 | Equal | None |
| §6.15 slot j=2, ε=1 | Integer-degree and sign identities | (0,2); total=4; sign=1 | total=4; sign=1 | Equal | None |
| §6.15 slot j=3, ε=-1 | Integer-degree and sign identities | (0,3); total=6; sign=-1 | total=6; sign=-1 | Equal | None |
| §6.15 slot j=3, ε=1 | Integer-degree and sign identities | (2,4); total=6; sign=1 | total=6; sign=1 | Equal | None |
| §7.4 regular Bott basis, ℓ=3 | Generator degrees and first period | [0, 3, 1]; dimensions [1, 1, 0, 1] | 3 generators, period 4 | Equal | None |
| §7.4 regular Bott basis, ℓ=5 | Generator degrees and first period | [0, 7, 1, 5]; dimensions [1, 1, 0, 0, 0, 1, 0, 1] | 4 generators, period 8 | Equal | None |
| §7.4 regular Bott basis, ℓ=7 | Generator degrees and first period | [0, 11, 1, 5, 9]; dimensions [1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1] | 5 generators, period 12 | Equal | None |
| §8.7 cutoff 16d² | d=2√5/π | 32.4227787655 | < 33.0000000000 | Strict bound | None |
| §8.7 cutoff (20d)^(2/3) | d=2√5/π | 9.3238815407 | < 10.0000000000 | Strict bound | None |
| §8.7 cutoff d³ | d=2√5/π | 2.8846649349 | < 3.3750000000 | Strict bound | None |
| §8.7 cutoff 2^(12/5)d^(12/5) | d=2√5/π | 12.3182294656 | < 32.4227787655 | Strict bound | None |
| §8.6 norm and conjugation (0, 1) | Integral-basis multiplication | (-1,0) | (-1,0) | Equal | None |
| §8.6 norm and conjugation (1, 1) | Integral-basis multiplication | (1,0) | (1,0) | Equal | None |
| §8.6 norm and conjugation (2, 0) | Integral-basis multiplication | (4,0) | (4,0) | Equal | None |
| §8.6 norm and conjugation (-1, 2) | Integral-basis multiplication | (-5,0) | (-5,0) | Equal | None |
| §8.6 norm and conjugation (3, 0) | Integral-basis multiplication | (9,0) | (9,0) | Equal | None |
| §8.6 norm and conjugation (3, 1) | Integral-basis multiplication | (11,0) | (11,0) | Equal | None |
| §8.6 norm and conjugation (4, -1) | Integral-basis multiplication | (11,0) | (11,0) | Equal | None |
| §8.6 norm and conjugation (4, 1) | Integral-basis multiplication | (19,0) | (19,0) | Equal | None |
| §8.6 norm and conjugation (5, -1) | Integral-basis multiplication | (19,0) | (19,0) | Equal | None |
| §8.6 norm and conjugation (5, 1) | Integral-basis multiplication | (29,0) | (29,0) | Equal | None |
| §8.6 norm and conjugation (6, -1) | Integral-basis multiplication | (29,0) | (29,0) | Equal | None |
| §8.6 norm and conjugation (5, 2) | Integral-basis multiplication | (31,0) | (31,0) | Equal | None |
| §8.6 norm and conjugation (7, -2) | Integral-basis multiplication | (31,0) | (31,0) | Equal | None |
| §8.8 prime completeness p=2 | Roots of X²−X−1 | []; prime norm 4 | one inert prime | Equal | None |
| §8.8 prime completeness p=3 | Roots of X²−X−1 | []; prime norm 9 | one inert prime | Equal | None |
| §8.8 prime completeness p=5 | Roots of X²−X−1 | [3]; prime norm 5 | one ramified prime | Equal | None |
| §8.8 prime completeness p=7 | Roots of X²−X−1 | []; prime norm 49 | one inert prime | Equal | None |
| §8.8 prime completeness p=11 | Roots of X²−X−1 | [4, 8]; prime norm 11 | two split primes | Equal | None |
| §8.8 prime completeness p=13 | Roots of X²−X−1 | []; prime norm 169 | one inert prime | Equal | None |
| §8.8 prime completeness p=17 | Roots of X²−X−1 | []; prime norm 289 | one inert prime | Equal | None |
| §8.8 prime completeness p=19 | Roots of X²−X−1 | [5, 15]; prime norm 19 | two split primes | Equal | None |
| §8.8 prime completeness p=23 | Roots of X²−X−1 | []; prime norm 529 | one inert prime | Equal | None |
| §8.8 prime completeness p=29 | Roots of X²−X−1 | [6, 24]; prime norm 29 | two split primes | Equal | None |
| §8.8 prime completeness p=31 | Roots of X²−X−1 | [13, 19]; prime norm 31 | two split primes | Equal | None |
| §5.5 wreath q=7, ℓ=3, a=1, r=2 | Finite group orders | GL=2016, wreath=18, index=112 | prime-to-ℓ index | Equal | None |
| §5.5 wreath q=19, ℓ=3, a=1, r=1 | Finite group orders | GL=18, wreath=3, index=6 | index divisible by ℓ; excluded nonmaximal or dyadic action | Equal | None |
| §5.5 wreath q=19, ℓ=3, a=2, r=1 | Finite group orders | GL=18, wreath=9, index=2 | prime-to-ℓ index | Equal | None |
| §5.5 wreath q=3, ℓ=2, a=1, r=2 | Finite group orders | GL=48, wreath=8, index=6 | index divisible by ℓ; excluded nonmaximal or dyadic action | Equal | None |


Pull request: #1418 (roadmap/arithmetic-k-theory at 4573db5)
