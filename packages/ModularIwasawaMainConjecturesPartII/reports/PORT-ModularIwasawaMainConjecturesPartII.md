# Port report: ModularIwasawaMainConjecturesPartII

Branch: `roadmap/modular-iwasawa-main-conjectures-part-ii`.
Head commit: fadd5ba255c1f3d2aecc98c65f888423cc461b01.
Base: `45f58db`; the initial working tree was empty.

Only `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/{README.md,Suggested.lean,metadata.toml}` is committed. The source package and its manifest were left unchanged. No push or GitHub write was made. AI assistance: Codex; all mathematics, edits and verdicts were performed by the primary agent, without helpers.

## Validation

Build command: `lake build TauCetiRoadmap.ModularIwasawaMainConjecturesPartII.Suggested`.

Exact outcome: `Build completed successfully (18239 jobs).`
Warning count: **0**. The first build had two module-system warnings; adding the same `module` header used by the main-branch models eliminated both. There are no admitted declarations, so there are no sorry warnings either.

Gate summary:

```text
gate ModularIwasawaMainConjecturesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate before commit reported only the three staged files as dirty; every content check was zero. Its clean-tree result above was obtained after commit.

Dependency check, using the prescribed order, movable placement and content arguments:

```text
depcheck: 225 roadmaps, 2004 edges, 0 problem(s)
```

No UPWARD or CYCLE line. No tool or order file was edited.

The acceptance file has zero named declarations. I mechanically enumerated every declaration keyword and compared the result with its namespace and docstring: the list is empty. Consequently the exhaustive `#check @name` binder audit has zero entries; there is no signature whose hypotheses can disappear, and no scratch declaration was invented to fill that empty list. The module was elaborated by the requested build. Its docstring now distinguishes native ray class fields from the genuinely missing arithmetic cohomology, unit limits, zeta maps, determinants and Katz/Coleman objects, and covers the functional equation and control endpoints too. No headline can be stated by a few simple definitions on the pinned carriers; arbitrary representations or modules would replace the actual arithmetic objects.

## Draft pull request body

This roadmap develops the imaginary quadratic elliptic-unit theory needed to prove Kato's rational main conjecture for every CM newform of weight at least two at every prime, including 2 and 3. It builds the ray-tower comparisons, character-wise and equivariant main conjectures with tame Euler factors, and the normalized CM comparison and descent to Beilinson–Kato elements. Its split-prime branch develops Coleman maps, Katz comparisons and one-variable control with the local and Tor corrections retained.

AI assistance: Codex, including source comparison, mathematical checks, ownership resolution and Lean validation.

## Supplier status and ownership

The still-open new-roadmap suppliers are ArithmeticGaloisDuality, IntegralIwasawaTheory, ColemanPowerSeries, EulerSystemsAndKolyvaginSystems, ComplexMultiplicationAndExplicitReciprocity, AutomorphicGaloisRepresentations, AutomorphicGaloisRepresentationsPartII, PadicHodgeRegulators, AutomorphicPadicLFunctionsPartII, PadicFamilies, KatoEulerSystems, NoncommutativeAndEquivariantIwasawa, PeriodsAndSpecialValues, ModularIwasawaMainConjectures, SelmerIwasawaCohomology, NeronModelsAndSemistableAbelianVarieties and AnticyclotomicLocalUnits. NonordinaryCMSpecialValues is an earlier package in the order, not a roadmap found by the open-head service. Its §§2.1–2.6 were read in `packages/NonordinaryCMSpecialValues/README.md`; order positions are 348 and 381 for that supplier and this roadmap. The resolver's sole lead about this name is therefore accounted for. No citation depends on numbering defined only by an open revision.

Main-branch models read: `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`, `TauCetiRoadmap/ModularForms/README.md` and `Completed/ProfiniteProPGroups/README.md`. Metadata matches their one-key topic convention, `math.NT`.

The roadmap service was used for broad object searches across all indexed open heads and main, followed by scope and target reads. Searches covered elliptic units, CM pairs, induction, Kato module structure, Katz functional equations, smoothing and one-variable control. The supplied sibling-head index and the board packages were also searched. The closest scopes read were KatoEulerSystems, AutomorphicCongruences, ModularIwasawaMainConjectures, EulerSystemsAndKolyvaginSystems and CMRankZeroConverse; additional owner reads included NonordinaryCMSpecialValues, NoncommutativeAndEquivariantIwasawa, ColemanPowerSeries and the regulator and Katz suppliers. Generic cohomology, characteristic-ideal algebra, Coleman interpolation and Katz measures retain their existing owners. The remaining ownership here is the arithmetic ray-tower specialization, corrected normalization comparisons, general-field local assembly and its arithmetic control, and equality descent. No second copy, conflicting revision or dropped supplier id was found. The consumer's CZ.4–CZ.6 and named endpoint labels are explicitly mapped in Scope and ownership.

Supplier replacements and duplication removals, recorded in the README only in Scope and ownership:

- KatoEulerSystems §4.4 supplies the CM torsion and unmarked rank-one assertions; §7.8 retains the specified elliptic-unit generator, primitivity and ray-tower vanishing. KatoEulerSystems §7.2 and PadicFamilies §4.0.3 retain their rational upper-bound ownership; §7.9 retains the additional integral condition-(b) lattice range.
- NonordinaryCMSpecialValues §§2.1–2.2 supplies theta existence, uniqueness and canonical pairs. Their prime-independent constructions are consumed; the coprime-degree norm and pointed action comparisons remain here. Its direct-unit and homological conventions are compared explicitly with the inverse-unit and cohomological conventions here; a direct-value identity is not silently imported as an inverse-value identity.
- AutomorphicGaloisRepresentations §3.15 supplies the CM predicate and unnormalized induction. Sections 7.1–7.2 retain the explicit weight dictionary and the unique de Rham-normalized identification.
- AnalyticNumberTheoryPartI §2.3a replaces obsolete attribution of Hecke continuation to AutomorphicLFunctionsAndLocalFactors AL.1. The old ClassFieldTheory §2.6 is valid through its main-branch mapping to Conventions C.6. The ProfiniteProPGroups completed-group-algebra heading is corrected.
- Native ray class fields and Artin equivalences are consumed directly. The regulator's scalar covolume is distinguished from the actual logarithmic embedding and its torsion kernel.
- The unnamed regulator-supplier gap is replaced by the explicit local theta-system target in §3.3. NonordinaryCMSpecialValues §2.5 is imported only at p ≥ 5 inert and p ∤ h_K; the split, ramified and dyadic extension is owned here, with its displayed local formula and good-reduction hypotheses. No supplier is asked for an unstated declaration.

Nothing moved from Lean into the README: the package's file already had zero declarations. It retains that size, with corrected inventory and ownership, a `module` header and the single `import Mathlib`. All 51 numbered sections remain; the modified local-control and normalization targets have explicit APIs and discriminating Checks.

## Pinned-library evidence

Pins verified against the manifest and the checked-out sources: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

| Contract | Source at the pin; exact content and limitation |
|---|---|
| Class groups | `Mathlib/RingTheory/ClassGroup/Basic.lean:89`, `ClassGroup`; ray fields and their limits are different objects. |
| Module length | `Mathlib/RingTheory/Length.lean:31`, `Module.length` is submodule-lattice Krull dimension, valued in extended naturals; it does not assert finite length. |
| Prime localization | `Mathlib/RingTheory/Localization/AtPrime/Basic.lean:50`, `IsLocalization.AtPrime` is localization at the prime complement; it does not make an arbitrary localization a DVR. |
| Ideal height | `Mathlib/RingTheory/Ideal/Height.lean:36`, `Ideal.height`; regularity and dimension remain arithmetic/ring-theoretic inputs. |
| Logarithmic regulator | `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:113`, `NumberField.Units.logEmbedding_eq_zero_iff` says the kernel is torsion. `Units/Regulator.lean:267,290` defines the covolume and proves nonzero, not injectivity of a map. `Units/Basic.lean:145` defines torsion. |
| Totally complex | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:210`, `NumberField.IsTotallyComplex` excludes real places. |
| Cyclotomic character | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:308`; the prime hypothesis is explicit. |
| Completed algebra | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`, `TauCeti.completedGroupAlgebra`, compatible families in quotient group algebras. Projections, topology, map and lift are present; it does not itself identify the arithmetic ray group or supply its dimension. |
| Modulus, ray group, Hecke character | `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98`, `RayClass/Basic.lean:130`, `HeckeCharacter/Basic.lean:70`; the last is a continuous character of the idele class group, not a Galois realization. |
| Ray class field | `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123,209`, `rayClassField`, `rayClassArtinEquiv`; finite-dimensional, number-field and abelian-Galois instances occur at lines 135,139,143. |
| Newform | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`, `HeckeRing.GL2.Newform`: a good eigenform with newness and first coefficient 1. No attached Galois representation is a field. |

An object search of both pinned libraries for elliptic units, Katz measures, Kato zeta maps, CM pairs, Coleman maps and arithmetic Iwasawa cohomology returned no construction of those missing headline carriers. This is why none is replaced by a local free predicate or a bare-variable theorem.

## Source audit and substantive repairs

The package is described as accepted in the brief, but `packages/ModularIwasawaMainConjecturesPartII/review.json` actually records `needs_changes`, and all supplied review verdicts also request changes. The package text predates several repairs described in those reports. I treated the reports as claims, recomputed the counterexamples and repaired the text; I did not assume an acceptance decision that is not present in the supplied data.

Primary legal PDFs were fetched for all ten manifest works, and Schutt09 was read at arXiv v5 for its level theorem. No source manifest was edited. Source line references below refer to the extracted legal texts used in this port; journal/theorem locators in the README are stable independently of extraction. The two GDZ scans were read as page images: Rubin91 pp.36–37 and Coleman79 pp.92,102. Their extracted text contains metadata rather than the mathematical page, so no invented OCR line citation is supplied for those images.

| Source evidence | Comparison and repair |
|---|---|
| BT line 142, Theorem 2.1; JLK line 982, Corollary 5.3 | Retain the tame Euler modules and rational product. Inertia-trivial characters with finite Frobenius −1 give units, not divisors. |
| BT line 196, Theorem 2.6; Kato line 5600, §15.15 onward | Keep all CM weights k≥2 and all primes, with the contained-field case and equality, rather than only the upper bound. |
| BT line 212, Theorem 3.1 | Restore even weight only for central half-weight specialization; do not narrow the main conjecture. |
| Kato line 916, §3.8; Kato line 5134, (15.5.1) | Recompute the differential sign and negative derivative convention; separate squared complex norm from ordinary Beilinson norm. |
| Kato line 5101, §15.4 | Require coprime isogeny degree. Quotient by the entire a-torsion pushes the divisor to zero. |
| Kato line 5090, §15.3 | Preserve the pointed level only for (a,f)=1; insert the quotient-isogeny pullback into the representation action. |
| Kato line 5239, §15.8; line 5316, Proposition 15.9 | Keep tensor bases and cohomological dual explicit; insert auxiliary-level good reduction before using the supplied applied reciprocity theorem. |
| JLK line 359, regulator (6); line 405, Theorem 2.6 | Use scalar ETNC, not integral group-ring ETNC, and invert a determinant once. |
| JLK line 486, Corollary 2.11 | A vector-based lattice formula requires nonzero removed Euler factors. The exceptional case uses the local determinant and leading term. |
| JLK line 691, Theorem 3.9; line 747, Corollary 3.10 | Explicitly keep e_D=(N(a)−η(a))z_B/2, e_B=2e_D and the tensor factor 2^(−m). Integral character-wise targets use the B-normalized system; no dyadic cancellation is made. |
| JLK line 947, equation (17); line 960, Theorem 5.2 | Transport the smoothing factor by χ⁻¹, and define its generated ideal J_χ rather than identify it with an untwisted kernel. Propagate this through determinants, Euler removal and rational assembly. |
| Coleman79 pp.92,102; Yager line 431 and Chapter 3 | Transport Frobenius and differential through θ; add good reduction for CM specialization. Correct the boundary operator and the x⁻¹ integration needed for ordinary linearity. |
| Rubin91 pp.36–37, Theorem 4.1 and Remarks | Keep the full two-variable statement, exact image ideal, and general one-variable control with root, local and Tor terms; the particular 𝔭-ramified line has its own cancellation target. |
| CGLS line 354, Definition 1.2.1; line 375, Theorem 1.2.2; line 394, its proof | Restore the arbitrary class number of the source, keeping finite-class-group descent among the control targets. The theorem requires θ at the barred place to differ from 1 and ω. |
| Kriz line 988, Theorem 27 | Fix the split ordinary type and conductor convention for the functional equation. Correct the λ argument to the first unit-coefficient index after inversion. |
| HuberKings line 678, Proposition 2.3.1 | Keep its odd-prime range separate from JLK's all-prime scalar theorem. |
| Schutt09 line 115, Theorem 1.4 | Use the exact conductor-level theorem, with the unitary/cohomological weight dictionary from the actual AutomorphicGaloisRepresentations §3.15. |
| BKO21 line 757, Theorems 6.1–6.2 | The inert signed main conjecture remains a scope boundary, not a supplier or duplicated target. Add the missing bibliography entry, and Coleman79's entry too. |

Additional final-read fixes: the finite Tate-module invariant is 0 rather than the finite root group; a two-variable transverse norm is distinguished from a cyclotomic norm; the division tower has sixteen components while the conductor-one ray tower has four; a surviving Euler factor at the conjugate of a conductor prime is retained; tame inertia acts through ψ⁻¹ on T(−1); r=1 lies left of the absolute convergence boundary while r=2 lies on it; rational zeta generators are not declared integral without a local integrality target. These changes are witnessed below.

## Computed adversarial pass

These are diagnostic computations for the statements and APIs, not proofs of the deep theorems. All 51 numbered sections are represented, with additional rows separating their formulas, conventions and newly supplied control statements. A denotes the displayed regular power-series ring; lengths refer to its indicated localization. Numerical theta products were recomputed from the convergent product with forty terms, rather than copied from the reports. Characteristic-zero field, imaginary quadratic, finite-lattice and specified abelian-ray-group hypotheses exclude zero rings, inseparable fields, and nonabelian ray towers; no hidden Lean binder admits them.

| Statement | Instances tried | Values computed on both sides | Result / change |
|---|---|---|---|
| Conventions: characteristic zero and coefficient DVR | ℚ₂, ℚ₃; zero ring and characteristic p | 2≠0 in ℚ₂, 3≠0 in ℚ₃; 1=0 in the zero ring | The latter inputs are excluded, not divided by. |
| Conventions: arithmetic versus geometric Frobenius | Gaussian curve at 5 | Arithmetic cohomological eigenvalues (−1±2i)⁻¹ have modulus 1/√5; geometric ones have sum −2 and product 5 | Inverse retained. |
| Conventions: cyclotomic torsion | p=2,3,5 | Torsion orders 2,2,4 | Full cyclotomic group retained. |
| Conventions: infinity type | ψ_E and ψ_E² | Idelic exponents −1 and −2; ideal absolute values √5 and 5 | Ideal versus idelic conventions distinguished. |
| Conventions: twist | χ(g)=i and −1 | χ⁻¹=−i versus i; at −1 both give −1 | Order-four witness added. |
| §0.1 ray group | ℚ(i), f=1, p=2,5 | (μ₄×ℤ₂²)/μ₄=ℤ₂²; (μ₄²×ℤ₅²)/μ₄=C₄×ℤ₅² | Δ orders 1 and 4. |
| §0.1 wild torsion | ℚ(i), f=(3), p=2 | (C₄×C₈)/diagonal C₄=C₈ | No prime-to-p shortcut. |
| §0.1 restriction | Gaussian field at 2 versus 5 | Images 1+4ℤ₂ of index 2, and full ℤ₅× of index 1 | Contained case retained. |
| §0.1 domain and identity map | Δ=1,C₂; f′=f | Domain in first case; (g−1)(g+1)=0 in second; identity restricts to identity | Domain not imposed in general. |
| §0.1 cyclotomic kernel | A=ℤ_p[[S,T]], J=(S−a,T−b) | A/J=ℤ_p has dimension 1; ht J=2 | J defined before use in §1.7. |
| §0.2 normalization | ℤ₂[C₂] | Two generic components ℚ₂×ℚ₂, one integral maximal ideal (2,g−1) | Integral ring not replaced by its product normalization. |
| §0.2 characteristic ideal | A/(p) | Rationalized module 0 and ideal (1), integral ideal (p) | Rational convention retained. |
| §0.2 length criterion and additivity | A/(T²), A/(T)⊕A/(T), zero module | Lengths 2,2,0; ideals (T²),(T²),(1) | Equality of ideals is not module isomorphism. |
| §1.1 H⁰ | ℚ(i), p=2; T=0 | T₂μ₄=0 although #μ₄=4; every H^q(0)=0 | Finite roots no longer identified with lattice invariants. |
| §1.1 transitions and twisting | Trivial coefficients with degree-p corestriction; χ(g)=i | lim(ℤ_p,×p)=0; twisting multiplier −i, not i | Direction and inverse retained. |
| §1.2 p-units | ℚ(i), p=5 | μ₄⊗ℤ₅=0; 5-unit rank 2 from 2±i | Global units cannot replace p-units. |
| §1.2 roots and projections | Full two-variable tower versus cyclotomic line | Transverse norm on a fixed μ_(p^a) raises to p^m, eventually 1; cyclotomic N(ζ₂₅)=ζ₅ | Two directions distinguished. |
| §1.2 class limit | Base Gaussian class group; all-zero tower | Base class group 0; all-zero inverse system has unique element 0 | Base value alone does not compute the limit. |
| §1.3 Kummer norm comparison | ζ₂₅ at p=5 | Norm exponent 1+6+11+16+21=55≡5 mod25; both norm and corestriction give ζ₅ | Compatibility retained. |
| §1.4 Brauer correction | One and two primes above p | Kernels of sum maps have ranks 0 and 1 | Finite-level H² is not blindly identified with class groups. |
| §1.4 pseudo-null corrections | M finite over ℤ_p, ray algebra dimension 3 | dim A/Ann(M)≤1; height-one localizations 0 | Distinct from arbitrary torsion. |
| §1.5 Euler module | A/(S) in dim3 | dim=2 and length at (S)=1 | Cannot discard as pseudo-null. |
| §1.5 finite Frobenius | ℚ(i), p=5, f=(3), inertia-trivial χ=1, ω∘χ_cyc | Frobenius eigenvalues 1,−1; Euler augmentations 0,2 | Second factor is a unit. |
| §1.5 empty tame set | f supported over p | Empty direct sum 0; H²_p=H²_pf | Boundary case retained. |
| §1.6 weak Leopoldt rank | Generic H² torsion; zero module | rank H²=0; zero module has rank 0 | Torsion assertion does not imply rank-one H¹. |
| §1.7 unit rank | Totally complex rank-one coefficients | Euler difference rank H¹−rank H²=1; with rank H²=0, rank H¹=1 | Dyadic real terms absent. |
| §1.7 torsion-freeness | Regular x, ht J=2 versus cyclotomic ht J=1 | (A/x)[J]=0 in the former; norm-root family nonzero in the latter | No false one-variable extension. |
| §2.1 differential convention | c=5, k=1,2,3 near z=0 | Leading coefficients +24/z, −24/z², +48/z³ with powers of 2πi | Sign corrected. |
| §2.1 continued value | k=0, z=1/3 | E(0,τ,z,0)=0 but derivative gives nonzero theta logarithm 0.6619210722 | Negative derivative, not zero value. |
| §2.2 theta divisor | N(a)=1,5 | Degrees 1−1=0 and 5−5=0; a=1 gives theta 1 | Unit-ideal and nontrivial cases separated. |
| §2.2 uniqueness | Primitive cube root u; multiplication by 2,3 | u³=1 but u⁸=u²≠1 | One norm law alone insufficient. |
| §2.2 isogeny law | Quotient by E[a] | Pushed divisor N(a)[0]−N(a)[0]=0 | Coprime degree required. |
| §2.3 rigidity and field degree | Gaussian levels (3),(1+i),(1+i)³ | Unit image sizes 4,1,4; ray degrees 2,1,1 | Injective unit level retained. |
| §2.3 pointed action | π=1+i, f=π³; a=π,5 | Annihilator changes π³→π² for π; stays π³ for 5 | Coprimality added. |
| §2.4 inverse-unit normalization | Two theta conjugates at level 3 | Logs 0.6619210721546793, 5.929752659853951; inverse difference 5.267831587699272 | Inverse and direct units distinguished. |
| §2.4 auxiliary exclusion | p=5, a=(5) versus a=(7) | Nonzero level-5 point meets E[5], inverse value 0; E[5]∩E[7]={0}, permitted value nonzero | a prime to p retained. |
| §2.4 norm and auxiliary relations | N(a)=25,49 | Cross factors 25−σ_a,49−σ_b; identity auxiliary gives zero factor | Asymmetric relation retained. |
| §2.5 squared versus ordinary norm | R=log(2+√3) | Ordinary inverse regulator 4R=5.2678315877; squared norm 8R=10.5356631754 | Factor 2 propagated. |
| §2.5 inverse character | χ(a)=i, N(a)=25 | 25−i⁻¹=25+i versus 25−i | Nonreal witness distinguishes inverse. |
| §2.5 trivial depleted value | ℚ(i), f=(3) | ζ_K(0)=−1/4; derivative of depleted L is −log9/4≠0 | Nontrivial-character hypothesis added to extra-zero Check. |
| §2.6 smoothing ideal | J=(S−a,T−b), N(a)>1 | J at every height-one prime=A, but J≠A; N(a)−η(a)≠0 for root of unity η(a) | Whole ideal versus single factor distinguished. |
| §2.6 finite projection | e_D on quadratic component | r_D(e_D)=8R, r_B(e_D)=4R | Projection keeps the norm convention. |
| §2.7 cotorsion | Nontrivial primitive character, then one extra trivial Euler factor | Primitive order at 0 is 1; added factor gives order at least 2 and derivative 0 | Character chosen away from vanishing added factors. |
| §3.1 CM tensor bases | r=1,2 over K versus ℚ | K-line dimension stays 1; ℚ-tensor dimensions are 2 and 4 | Correct tensor base retained. |
| §3.1 principal action | a=(5), r=1 | ψ(a)⁻¹[5]⁎=(1/5)·5=1 | Quotient-isogeny pullback inserted. |
| §3.1 Frobenius action | ψ(𝔮)=−1+2i | Inverse has modulus 1/√5; geometric eigenvalue has modulus √5 | Cohomological dual fixed. |
| §3.2 auxiliary denominator | r=1, r=2, N(a)>1 | Lower bound N−√N>0 at r=1; at r=2, principal a can give N−ψ=0 | No division by zero. |
| §3.2 finite part | Gaussian squared character with quadratic twist, c=7,41 | ψ((7))=−49, factor 98; ψ((41))=1681, factor 0 | Congruence condition retained. |
| §3.2 convergence | r=1,2,3 | Boundary 1+r/2 is 1.5,2,2.5; evaluation is 1,2,3 | First is left of boundary, second on it, third right. |
| §3.2 differential basis change | ω→uω | Factors u^(−r) and u^r multiply to 1; (r−1)!⁻¹ at r=1,2,3 is 1,1,1/2 | Period form independent of the chosen differential. |
| §3.3 all-prime local theta formula | r=1,2,3; ω→uω | Factorials1,1,1/2; differential factors u^(−r)u^r=1; direct-to-inverse Kummer sign−1 | Local target stated here outside the supplier’s inert p≥5 range. |
| §3.3 theta translation | ξ=1/5,α=8/15,ν=−1/3 | ξ−ν=8/15=α; ξ+ν=−2/15≠α | Translated theta evaluated at ξ, not twice-translated α. |
| §3.3 reciprocity local height | Split versus inert good-reduction prime | Underlying p-heights 1 and 2; relative O_𝔭-height 1 in each | All-prime application retained. |
| §3.3 reduction control | Gaussian level π³, auxiliary level of norm 5 | Full-level unit injection has size 4 but bad-place prime-to-place kernel size 4; adding norm-5 level reduces kernel to 1 | Good reduction checked before reciprocity. |
| §4.1 integral character projection | Cyclic group of order p | Integral trace map exists; coefficient 1/p in projector is nonintegral | No wild-character idempotent. |
| §4.1 Euler twist | χ(𝔮)=i | Twisted inverse Frobenius factor 1−iFrob⁻¹; opposite action gives 1+iFrob⁻¹ | Ideal convention explicit. |
| §4.2 scalar versus equivariant | (1,7,1/7) in ℤ₇[C₃] generic factors | Product 1; valuations (0,1,−1) | Scalar ETNC does not assert component integrality. |
| §4.2 determinant shift | Lattice valuation 1 | Det(C[1]) valuation −1; inverse of shifted determinant +1 | Double inversion removed. |
| §4.2 exceptional local determinant | Quadratic ray character modulo (3), p=13 | 4²≡3 mod13, two Euler factors 0; vector 0, determinant rank 1 | Vector formula restricted; leading term retained. |
| §4.3 regulator comparison | N(a)=25, quadratic η, R as above | 24·(R/3)/2=4R; without /2 gives 8R | e_B=2e_D normalization explicit. |
| §4.3 dyadic lattice tensor | m=1,2 factors | Scaling by 2 changes valuations by 1,2; D tensor is 2^(−m)B tensor | No dyadic unit cancellation. |
| §4.4 Euler-system inequality | DVR H¹/Ae_B=A/(t²), H²=A/(t) | Lengths 2 and 1; 1≤2 | Bound uses named normalized class, not zero data. |
| §4.5 twisted smoothing | χ quadratic modulo (3), a=(2+i),b=(7) | Correct factors 6,48 yield u,u; untwisted factors 4,48 yield 3u/2,u | Denominator corrected. |
| §4.5 trivial and dyadic component | χ=1, J height2, p=2 | J_q=A_q at height1; e_B=2e_D increases vertical length by 1 | Both integral and rational conventions explicit. |
| §4.6 tame Euler removal | Empty set, ramified χ, finite eigenvalue −1 at p=5 | Factors 1,1,1+γ⁻¹ with augmentation 2 | Correct local determinant factors retained. |
| §4.7 class-field sequence | Torsion ranks; inert two-variable local units | Alternating rank difference 0; local rank2 minus global rank1 leaves rank1 | Non-torsion module not assigned torsion ideal. |
| §4.7 component projectors | Δ=1,C₄ at p=5 | One component versus four; 1/4 is integral at 5 | Prime-to-p hypothesis used exactly here. |
| §4.8 Rubin split/nonsplit | p=5 versus3 over ℚ(i) | 5 split, local quotient rank0; 3 inert, local quotient rank1 | Distinct conclusions retained. |
| §4.8 tower distinction | K(E[5])/K versus K(5)/K | Degrees 16 versus16/4=4 | False component Check repaired. |
| §4.8 all-prime classical form | p=2, μ₄ and Δ=1 | Rubin μ condition fails (2 divides4); character-wise two-variable clause still defined | μ restriction removed only from classical clause. |
| §5.1 transported Frobenius | p=5,c³=1,θ(T)=cT | Ng=Φ_θg=g; coefficientwise φ gives 1+cX instead of 1+X/c | Coordinate transport repaired. |
| §5.1 transported derivative | Same coordinate | D_θlogg=1; trace law 5=5; untransported law gives5c≠5c² | Differential transported too. |
| §5.1 interpolation constants | Teichmüller c | Norm c^(φ^(−n−1))=c^(pφ^(−n−1))=c^(φ^(−n)) | Frobenius-index convention retained. |
| §5.1 local Coleman measure | p=5,g=(2+T)/ω(2) | Boundary mass0, first moment−1; integrated moments 0,1; a=2 gives second moment4 | Operator and x⁻¹ integration corrected. |
| §5.1 reduction | y²=x³−25x versus y²=x³−x at5 | c₄=1200,Δ=1000000, valuations2,6 and height∞; Δ=64,a₅=−2 and height1 | Good reduction added only to local construction. |
| §5.1 two-variable exact image | J=(S−a,T−b) | A/J=Ô, dimension1, codimension2; J≠A | Exact image retained. |
| §5.1 one-variable roots | Cyclotomic p=5 system | Nζ₂₅=ζ₅, system nonzero; σ−κ(σ) kills it, no 5^m kills the whole system | Kernel is Iwasawa torsion, not coefficient torsion. |
| §5.1 specialized Tor | C=A/(S−a,T−b), T=b | C⊗B and Tor₁(C,B) both B/(S−a), length1 | Pseudo-nullity cannot simply be specialized. |
| §5.1 control/rank boundary | Y=A/(S), quotient T=0 versus S=0 | First gives B/(S), length1; second gives free B, rank1 | Determinant/rank formulation retained when torsion fails. |
| §5.2 exact Katz image | Jν, ν≠0 | Jν≠Aν but (Jν)**=Aν | Image ideal separated from divisorial hull. |
| §5.2 interpolation arithmetic | Gaussian curve over 𝔽₅ | Point counts1+1+2+2+1+∞=8; trace−2; roots−1±2i | Recomputed directly. |
| §5.2 Euler place | ψ(𝔭)=−1+2i | Product(32−24i)/25; conjugate place(32+24i)/25; 0!=1 | Ordinary place fixed. |
| §5.3 specialization formula | All error modules0; one error B/(S−a) | div X′=div L′; surviving error adds ±1, not0 | Full corrected formula retained. |
| §5.3 support | Ramification at one split prime versus both | Ranks0 and1 | Bigger Galois module is not the target. |
| §5.4 local character exclusions | θ=1,ω versus another character | H⁰ or dual H⁰ has dimension1 in excluded cases,0 under hypotheses | Local and finite-class descent cancellation is explicit work. |
| §5.4 λ consequence | T versus pT | Both λ=1; ideals distinct, μ=0 versus1 | λ equality does not imply ideal equality. |
| §5.5 dual involution | χ̌=χ⁻¹N | χ̌̌=χ; anticyclotomic η becomes η⁻¹ | Direction fixed. |
| §5.5 λ under inversion | P=1,T,T²,T+ϖ | Reduced first unit indices0,1,2,1; ι(T)=−T/(1+T) | False polynomial-times-unit claim replaced. |
| §6.1 length assembly | One tame simple zero | length(h¹/z)=length(h²)+1; omission gives length(h²) | Tame local module retained. |
| §6.2 rational normalization | p=2 then p=3 | Factor2 is invertible after[1/2], and already a unit at3 | B/D normalization does not alter rational endpoint. |
| §6.3 printed-form range | Trivial finite character versus ω∘χ_cyc at p5, tame3 | Euler augmentations0 and2 | Inertia alone is not a nonunit criterion. |
| §7.1 CM level | Gaussian/Eisenstein curves | 4·8=32,3·9=27 | Conductor and primitive level fixed. |
| §7.1 weight transport | k=3,ψ=−3−4i at norm5 | α_unit=ψ/5,α_AGR=ψ/√5,α′_AGR=ψ; magnitudes1,√5,5 | Cohomological supplier dictionary corrected. |
| §7.1 non-CM control | Level11 form | Inert2 in ℚ(√−11) would give0; actual a₂=−2 | Excludes false CM assignment. |
| §7.2 normalized induction | Scalar automorphism c | de Rham action c, fixed identification forces c=1; weights0,2 at k3 | Only normalized comparison owned here. |
| §7.3 comparison map | Identity level and lattice pT | Identity corestriction gives identity; lattice image scales by p on both sides | Source/target and lattice compatibility explicit. |
| §7.4 tower twist | χ_T(g)=i | Semilinear multiplier−i, generic rank1 remains1 | Same inverse convention as §1.1. |
| §7.5 descent | A dim2 with kernel(a) | A/(a) dim1; at generic cyclotomic prime A dim1 and quotient field | Local dimensions and residue-char hypothesis retained. |
| §7.6 contained fields | (ℚ(i),2),(ℚ(√−3),3),(ℚ(√−7),7),(ℚ(i),5) | Containment indices2,2,2,1; ζ₈+ζ₈³=i√2 | Both descent cases retained. |
| §7.7 length identity | M=A/(T),a=p | Left[𝔽_p]−0; right1·[𝔽_p] | Equality, not only inequality. |
| §7.7 failed hypothesis | M=A/(p),a=p | M/aM=M of dim1, not codimension2; localization at(p)≠0 | Negative control retained. |
| §7.8 specified generator | Z=0 versus rank-one H¹ | Generic ranks0 versus1; quotient ranks1 versus0 when generated | Imported rank theorem cannot replace primitivity. |
| §7.8 conductor Euler factor | Split ℓ=𝔩𝔩̄, ψ ramified only at𝔩 | Factor at𝔩 is1, surviving conjugate factor(1−aℓ^(−s))⁻¹ on both sides | Whole rational factor no longer discarded. |
| §7.9 integral lattice | p∤μ(H) atGaussian field | p=2 fails since#μ₄=4; odd eligible p has2 a unit | Integrality is a target before forming the quotient. |
| §8.1 archimedean comparison | Inducing vector(v,0),v≠0 | Sign projections(v,±ιv)/2 both nonzero | Betti comparison not used as Galois equivariance. |
| §8.2 period parity | Even χ and inducingγ≠0 | (γ,0)^+=(γ,ιγ)/2≠0; at k2,(2πi)^0=1 | False pure-sign inducing-vector Check repaired. |
| §8.3 tame annihilator | ψ(g)=i, g finite inertia | χ_T(g)=−i; χ_T(g)⁻¹−1=i−1≠0 | Inverse character corrected; local module vanishes. |
| §8.4 rational zeta comparison | Gaussian form at2 | B/D factor2 becomes a unit; Tate twist changes complex-conjugation sign by−1 | Rational bridge retains parity and periods. |
| §8.5 equality descent | M₁=M₂=A/(y),a=x | Quotient lengths1,1; a-torsion0,0 | Equality1=1 after cancellation. |
| §8.5 primitivity necessity | M=A/(x),a=x | Quotient has dimension1, infinite length | Cannot apply length lemma without generic generation. |
| §8.6 final range | CM levels32 at2 and27 at3 | Contained cases K=ℚ(i),ℚ(ζ₃); p is invertible in both rational coefficient rings | No good-prime, residual or ordinary restriction. |
| §8.6 integral negative control | Ideals(p),(1) | Both become(1) after invertingp, vertical valuations1 and0 integrally | Rational equality makes no vertical claim. |
| §8.7 central weight | k=2 versus3,c=−1 | At2 exponent−1 gives character; at3 required square−1 contradicts h(−1)²=1 | Even k required only for this specialization. |
| §8.7 central component | k=2,p odd | Evaluation quotient O, p≠0, tame characterω⁻¹ | Height-one regular prime retained. |
| Worked examples: tame tower | Gaussian field,p5,f3 | #Δ=32,#inertia=8; four inertia-trivial components, two with Frobenius−1 | Unit and nonunit components distinguished. |
| Worked examples: wild residue obstruction | Gaussian field,p2,f3 | #Δ=8, equals0 in residue characteristic2 but nonzero in characteristic0 | Descent hypothesis is checked at the actual prime. |

## Remaining issues

No failing build, content-gate check, upward edge, cycle, missing Lean signature or unresolved ownership conflict remains. The source-review status discrepancy is recorded above. The B-normalized dyadic integral formulation and the full one-variable and finite-class-group control are substantive mathematical targets, not proofs supplied by this port; the record states exactly the conventions and corrections their implementations must establish. The all-prime rational CM endpoint is unchanged.

No suspicious source instruction was acted on. Sources and review proposals were treated as mathematical data; the source package, sibling checkouts, pinned libraries, tool configuration and merge order were not edited.


Pull request: #2281 (roadmap/modular-iwasawa-main-conjectures-part-ii at fadd5ba)
