# AutomorphicPadicLFunctionsPartII port

Branch: `roadmap/automorphic-padic-l-functions-part-ii`.
Head commit: `1fce8268dec92cdd67c67b6f0960e24b933327ab`.

The clean starting checkout was `198a280`. The commit contains only `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/README.md`, `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/Suggested.lean` and `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/metadata.toml`. The topic is `math.NT`. No push or GitHub write was performed.

## Validation

Exact final build outcome: `Build completed successfully (8976 jobs).`

The module outcome was `⚠ [8976/8976] Built TauCetiRoadmap.AutomorphicPadicLFunctionsPartII.Suggested (4.1s)`. Warning count: **2**, both **declaration uses `sorry`** at the two headline theorems, lines 63 and 86. No other warnings occurred.

Final gate summary:

```text
gate AutomorphicPadicLFunctionsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check output:

```text
depcheck: 52 roadmaps, 589 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The merge-order file was not edited. The full gate before commit had zero content failures and failed only its clean-checkout test; the final gate above was run on the committed clean checkout.

Citation resolution lists no cross-roadmap citations or Lean names found nowhere. Its index covers 363 open roadmap pull requests; its separate main snapshot is `20b02f6`. For suppliers that already exist on main, I additionally checked the actual files in this checkout at `198a280`, rather than relying on a newer revision of an existing roadmap. The resolver reports that it cannot inspect pinned Lake sources; I checked those directly at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and verified both checkout revisions against the manifest.

## Draft pull request body

This roadmap builds integral Eisenstein–Kronecker classes and ordinary p-adic measures interpolating critical Hecke values over totally imaginary fields containing a CM subfield. It connects completed Poincaré geometry to lattice-series continuation and oriented unit-torus evaluation, then proves regularized integrality, generalized Shimura algebraicity and the weak Deligne period relation. Its measure construction retains the class-to-moment sign and conductor-one Artin translation, and includes integral descent on the weighted ray quotient and bounded removal of auxiliary factors.

AI assistance: Codex (GPT-6) performed this port, supplier and ownership checks, signature elaboration and the mathematical self-review recorded below. The accepted package's twelve explicitly conditional supplier extensions remain visible in the exact contracts.

## Suppliers still in open new-roadmap pull requests

- ComplexComparisonPartII — C1.1, C5.1 and C5.4; inspected at head `2d50a88` using the roadmap reader.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory — R07.1.7, R07.1.9 and R07.1.13; inspected at head `34f4657` using the roadmap reader.
- AutomorphicLFunctionsAndLocalFactors — AL.0 finite Fourier levels and AL.1 local factors/global Hecke comparison; inspected at head `5d22a23` using the roadmap reader.
- ComplexMultiplicationAndExplicitReciprocity — §1.3 Serre tensors, CM eigenspaces, ideal degrees and period pairings; inspected at head `0c6c6e2` using the roadmap reader.
- AbelianSchemesAndArithmeticModuliPartII — P0.1–P0.6, P1.1, P2.1–P2.8, P3.2–P3.4 and P4.1–P4.3; inspected at head `fe15b14`.
- PeriodsAndSpecialValues — PS.0–PS.1 realization and determinant-period interfaces; inspected at head `a651410`.

Existing-main suppliers are ThetaSeries, GlobalNumberFields, ClassFieldTheory, SchemeAndStackFoundations, Hyperfunctions, AlgebraicTopology, DifferentialGeometry and PadicMeasuresIwasawaAlgebras. Open revisions of existing roadmaps are not dependencies of this port.

## Lean acceptance test and elaborated signatures

`Suggested.lean` is byte-identical to the accepted package: a single `import Mathlib`, one module docstring, the roadmap namespace, two real-body definitions and two admitted analytic headlines. No statement moved from Lean to README: no API padding, sorry'd data, computing examples or supplier restatements required removal. All other headlines are identified in the docstring together with the missing geometric, period or measure carriers. The two retained headlines name the actual lattice series and do not replace analytic continuation with a divergent total sum.

I made one scratch copy with `#check @name` for each of `hermitianPairing`, `kroneckerTerm`, `kronecker_meromorphic_continuation` and `kronecker_functional_equation`. I elaborated that scratch content once through the permitted targeted module build, then restored the unchanged acceptance file and rebuilt it. The elaborated types retain `d`, the explicit `0 < d`, primal discreteness and `IsZLattice ℝ Λ`, all positive diagonal coefficients, every multi-index and both shifts. The functional equation also retains the actual alternating-dual iff condition, both Gamma-pole exclusions and both possible uncompleted-pole exclusions. The simple definitions have only the parameters their bodies and types use; neither relies on dropped section hypotheses. No binder repair was necessary.

## Supplier verification and duplication sweep

I used the roadmap index, object searches across main and every indexed open head, direct reads of the named suppliers, and object searches in the board packages and pinned libraries. Searches included completed Poincaré sheaves, Eisenstein–Kronecker classes and series, bundle-valued and Borel currents, integral multivariate Amice theory, Hecke motives/CM periods, torus caps, weighted ray measures and unit-index descent. Separate searches of all four retained Lean names found no declaration in another readable roadmap. Open ownership checking was performed; it was not omitted.

The package already assigns generic Poisson summation and real lattice duality to ThetaSeries Layer 1 (1A, 1E, 1F) and Layer 2 (2A, 2C); invariant tensors, universal extensions and Poincaré sheaves to AbelianSchemesAndArithmeticModuliPartII P0–P4; generic CM tensors/eigenspaces/period pairings to ComplexMultiplicationAndExplicitReciprocity §1.3; support duality and derived equivariance to SchemeAndStackFoundations §§2.6–2.7, 2.19–2.20, 2.23; generic current calculus to ComplexComparisonPartII C5.4 and Hyperfunctions HF2.AnalyticPreparation.CurrentResolution; and generic measure theory to PadicMeasuresIwasawaAlgebras. These owners remain imports by named section. The specialized residue class, critical cap evaluation, corrected CM current, theta coinvariant class and arithmetic weighted-ray descent belong here because the searched suppliers construct their carriers and generic maps, not these arithmetic classes. GrossZagierAndArithmeticHeights uses distinct toric/Rankin special-value measures; its shared CM and Amice ingredients do not own this general Hecke interpolation theorem.

There were **no new supplier replacements or duplication deletions**. The accepted package had already made the ownership separations, and all targets are retained. The only roadmap record of those ownership exclusions is Scope and ownership. The source package and other roadmaps were not edited.

Pinned declarations checked directly include:

| Interface | Pinned file and line | Scope retained |
| --- | --- | --- |
| NumberField.IsCMField | `Mathlib/NumberTheory/NumberField/CMField.lean:69` | Total complexity and quadraticity over maximal real subfield |
| IsZLattice | `Mathlib/Algebra/Module/ZLattice/Basic.lean:433` | Span condition with a separate DiscreteTopology parameter |
| Unit logarithmic lattice/equivalence | `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:373`, line 415 | Units modulo torsion, not the whole unit group |
| Translated lattice summability | `Mathlib/Algebra/Module/ZLattice/Summable.lean:236` | Exponent strictly below negative integral lattice rank |
| Covolume and positivity | `Mathlib/Algebra/Module/ZLattice/Covolume.lean:72`, line 98 | Full discrete real lattice and additive Haar measure |
| AbstractMeasure, dirac and map | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:40`, lines 97 and 105 | Native carrier is `C(X,R) →L[R] E`; no mass-one or norm-one axiom |
| Dirac monoid map/convolution | `Mathlib/NumberTheory/Padics/Measure/Monoid.lean:115` | Dirac map on native measure algebra |
| Integral one-variable Amice | `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:157` | Measures on ℤ_p with ℤ_p coefficients; not the required multivariate O_Cp interface |
| Gaussian Fourier transform | `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:352` | Finite-dimensional real inner-product space and Re(b)>0 |
| Mellin and Gamma | `Mathlib/Analysis/MellinTransform.lean:90`; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:319`, line 344 | Gamma integral for Re(s)>0; total Gamma is zero at negative naturals |
| Comodule weights and point action | `TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean:416`, line 568 | Commutative-semiring weight decomposition; no torsion-free-unit-invariants conclusion built in |
| Algebraic Hecke character and unitary part | `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Algebraic.lean:60`; `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Shift.lean:273` | Identity-component algebraicity and normalized real norm shift; no CM period choice supplied |

The native definitions were read at these pins. In particular the relevant defining expressions are `AbstractMeasure := C(X,R) →L[R] E`, `IsZLattice.span_top : span K (L : Set E) = ⊤` with discrete topology an explicit parameter, and `IsAlgebraic χ := χ.infinityType.IsAlgebraicOnIdentityComponent`. None includes the additional arithmetic integrality, CM-period or unit-invariant assertions this roadmap needs.

## Final mathematical and editorial fixes

I read the complete README as a mathematical specification and checked each layer's definitions, identities, examples and proof inputs. The source checks use the certified source extractions, not recollection of the journal pagination. The following changes were made to the accepted README; no theorem was narrowed or discarded.

1. Applied the accepted nonblocking dependency wording note: “is a supplier for this build” becomes “is an input to this build”. The direct dependency check has no moved line. The source package's first scope sentence already describes the independent inert direction without naming it as an input.
2. Corrected the Conventions unit-coordinate pointer from KS-v4 line 1383 (inside another proof) to KS-v4 line 1444 (the r₁,…,r_(d−1) coordinates).
3. Corrected the §4.1 Lemma 3.25 pointer from KS-v4 line 2007 (Definition 3.24) to KS-v4 line 2021 (the subgroup lemma). Kept the definition's separate locator.
4. Corrected the inert-prime boundary pointer from BKO-2021 line 70 (a page heading) to BKO-2021 line 73 (the inert/supersingular discussion).
5. Corrected the exact Poincaré supplier contract: elliptic conormal ranks are 1 and 2, whereas degree-two coefficient sheaf ranks are 3 and 6. AbelianSchemesAndArithmeticModuliPartII P2.2 explicitly distinguishes these.
6. Added the finite Hermitian-form and summand API in §3.3, with computed conjugation, diagonal-positivity, zero-dimensional and zero-metric negative controls. This documents both kept simple definitions separately from the infinite-series targets without padding Lean.
7. Made the existing coefficient-line API in §0.3 and the resulting bounded-measure API in §8.4 explicit prose bullet lists, preserving their hypotheses and conclusions.
8. Included Hyperfunctions in Layer 3's dependency summary and AutomorphicLFunctionsAndLocalFactors AL.0 in Layer 7's summary. Both were already exact subsection inputs; no new supplier was introduced.
9. Removed the References paragraph's reference to an unported `sources.toml`; the two legal-source links, exact theorem/page locators and supplementary source-line identifiers remain in README.

## Unresolved accepted conditions

The review accepts the package **conditionally on twelve supplier gaps**. This port preserves that decision and makes no claim that the following extensions exist at the pins or have been added to the owners. A passing elaboration and gate do not discharge them.

| Gap | Named owner/interface consumed |
| --- | --- |
| unit-type-classification | GlobalNumberFields Layer 10: classification of finite-index-unit-trivial embedding types |
| hecke-padic-avatar | GlobalNumberFields Layers 9–10: arithmetic avatar with ideal/idelic inverse convention |
| ray-tower-tame-unit-kernel | ClassFieldTheory Layers 11–13: fp∞ tower with tame-congruence unit closure |
| equivariant-poincare-limit | SchemeAndStackFoundations §2.23: equivariant completed inverse-limit and Borel comparisons |
| borel-bundle-currents | ComplexComparisonPartII C1.1/C5.4: mixed relative Borel bundle-current resolution |
| current-residue-trace | ComplexComparisonPartII C5.4: unit-torus integration and algebraic residue/trace compatibility |
| torus-cap-projection | AlgebraicTopology Stages 5–6 and 8: exact local-coefficient oriented cap comparison |
| ordinary-cm-pairings | FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1: CM-idempotent paired-isogeny compatibilities |
| integral-multivariate-amice | PadicMeasuresIwasawaAlgebras §§2.1–2.2: equivariant integral multivariate O_Cp Amice |
| bounded-fraction-criterion | PadicMeasuresIwasawaAlgebras §3.1: uniform integral/Kummer bounded-fraction criterion |
| hecke-motive-periods | PeriodsAndSpecialValues PS.0: rank-one Hecke motives and realization/period comparisons |
| critical-cm-deligne-period | PeriodsAndSpecialValues PS.1: criticality and nonzero CM determinant-period expression |

No additional unresolved port defect was found. The integral weighted-ray descent and bounded desmoothing are retained as substantial theorem targets of this roadmap, not inferred from the weaker critical-coordinate integrality or from individual integral character values. No suspicious fetched instruction required action, and no network-supplied code was executed.

## Adversarial mathematics pass

I recomputed the following instances myself. These finite, symbolic and numerical checks test the statements and their conventions; they do not prove the admitted theorems or discharge the accepted supplier gaps. Numerical theta sums use symmetric integer boxes of radius 7; the cubic lattice sum uses radius 120. Each row identifies the mathematical statement, including its API where applicable. The tests below cover all numbered subsections, the four Lean declarations, standing conventions, and the supplier normalizations used in those statements.

| Statement | Instances tried | Computed values on both sides or wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: dimension, characteristic and arithmetic embedding | d=0,1,2; zero ring; F₂; square-zero thickening | 2d=0,2,4; 0=1 would map to 0=1 in ℂ; characteristic 2 gives 2=0 against 2≠0 in ℂ; ε²=0 maps ε to 0 | Excluded inputs cannot satisfy the embedded arithmetic datum; d=0 excluded by hd | None |
| Conventions: indexed degrees and factorials | α=(3,2), β=(0,0) | a=(2,1), product a!=2!·1!=2, total factorial=3!=6 | Product convention discriminates | None |
| Conventions: ideal and idelic exponents; Artin direction | χ((λ))=λ⁻⁴, λ=7; ζ₅ | Ideal value 1/2401, inverse idelic value 2401; arithmetic Frobenius ζ₅↦ζ₅², inverse ζ₅↦ζ₅³ | Inversions necessary | None |
| Conventions: nonzero ideal norms and periods | unit ideal; zero ideal; Ω=2, q=1 | N(O_L)=1, zero norm=0 excluded; Ω∨=2πi/2=πi, denominator ΩΩ∨=2πi≠0 | Denominators have stated nonvanishing inputs | None |
| Supplier IsZLattice and covolume | ℤ[i], 2ℤ+iℤ; nondiscrete full subgroup ℚ[i] | Real ranks 2,2; covolumes 1,2; ℚ[i] spans but 1/n→0 with 1/n≠0 | Separate discreteness is retained | None |
| Supplier AbstractMeasure | δ₀, 2δ₀, zero measure | Values at 1 are 1,2,0; no probability normalization; 2δ₀ has norm 2 over ℝ | Carrier is continuous linear maps, no norm-one field | None |
| Supplier comodule decomposition versus unit invariants | weight −4 and −1 on μ₄; weight 3σ over R/(2) for μ₆ | i⁻⁴=1, i⁻¹=−i; ζ₆³=−1 becomes 1 modulo 2 | Direct weight decomposition does not remove torsion invariants | None |
| Supplier tensor and coefficient ranks | elliptic conormal ranks 1,2; symmetric truncation through degree 2 | 1+1+1=3; 1+2+3=6 | These are coefficient ranks, not conormal ranks | Corrected supplier sentence |
| Supplier ordinary versus connection moments | G_a, n=2; F₂ | Second derivative x²=2; divided-power coefficient 1; 2!=0 in F₂ | Moment isomorphism cannot be asserted integrally | None |
| Supplier current pairing conversion | real N=2, k=1 | (−1)^(k(N−k))=−1; dx∧dy=−dy∧dx | Form-first to test-first sign retained | None |
| Supplier Hyperfunctions homotopy | holomorphic degree p=0,1 | Transport factors +1,−1 for homotopy; +1,+1 for regularization | No sign added to regularization | None |
| Supplier Gaussian, Mellin and Gamma | real dimension 2, b=π, w=0; s=1; s=0 | Fourier Gaussian at zero (π/π)^1=1; Γ(1)=1; total Γ(0)=0 versus Mellin pole | Re(s)>0 and pole exclusions needed | None |
| Supplier finite Fourier sign | C₃, positive character ζ^x | (1/3)Σζ^xζ^(−kx)=(0,1,0); positive kernel gives (0,0,1) | Inverse kernel fixes frequency | None |
| Supplier ideal-isogeny degrees | c=(2) in ℚ(i), identity | Degree=Nc=4; identity degree 1; erroneous extra square gives 16 | Rank includes inseparable contribution | None |
| Supplier finite-flat dual direction | ordinary elliptic curve over F₅; Lie(i)=3 | d[2+i]=0, d[2−i]=4; connected and étale directions differ | Paired isogenies retained over model, then base changed | None |
| Supplier period ambiguity and criticality | L-value 0, period c⁺=2; ambiguity factor 1+i | 0/2=0∈Qbar, not Qbar×; 1+i∈Qbar× need not be in a smaller coefficient field | Nonzero period and possibly zero value separated | None |
| §0.1 critical indices and uniqueness | ℚ(i), μ=(−2,1); μ=(0,1); α=(1,2) over K | a=1,β=1; μ|Σ=0 would require a=−1; lifted entries 1≠2 fail norm pullback | Sign alone does not imply admissibility | None |
| §0.1 pullback and subgroup API | α₀=2 repeated over two embeddings; Γ′⊂Γ | Lifted α=(2,2), restriction keeps exponent −2; a=(1,1) | Same indices under restriction | None |
| §0.2 based CM datum and transport | scalar Lie action 2, γ=i; rank-zero Serre module | Cotangent 1/2, at i inverse −i; rank-zero dimension 0 versus required d≥1 | No automatic global eigensheaf basis | None |
| §0.3 coefficient line and invariant formula | ℚ(i), a=3,β=0 and a=β=0; μ₆ torsion coefficients | Weights i⁻⁴=1 and i⁻¹=−i; (−i−1) invertible after 1/2, hence invariant rank 0; mod 2, −1=1 gives nonzero invariants | Torsion-free hypothesis essential | None |
| §1.1 trace-zero kernel and regularizer | three-point kernel; identity kernel; empty D | (2,−1,−1) has trace 0; off-identity restriction trace −2; identity regularizer 1−1=0; empty trace 0 | Wrong restriction fails | None |
| §1.1 second auxiliary and split/base-change API | kernel sizes 3 and 5 | Extended trace (5−1)(2−1−1)=0; point count 4·3=12 | Extension by zero preserves trace here | None |
| §1.2 support trace and completed-cohomology degree | d=1,2; h=(1,−1) and (1,1) | Coherent top degrees 1,2; trace 0 and 2; lower groups 0; completion on constant R tower gives lim R=R, R¹lim=0 | Higher equivariant groups not inferred to vanish | None |
| §1.2 invariants are derived, not exact | C₂ on ℤ with sign action | H⁰=0, H¹=ℤ/2; taking invariants after an acyclic resolution need not return H¹=0 | Generic shortcut rejected | None |
| §1.3 residue construction, linearity and injection | split norm-three kernel; h=(2,−1,−1), k=(0,1,−1) | Residues h,k; h+k=(2,0,−2); 2h=(4,−2,−2); h≠k; trace of (1,1,1)=3 | Residues discriminate zero/rescaled/reversed maps | None |
| §1.3 naturality | identity base change on same kernel | Pullback of h=(2,−1,−1) is h; residue before/after is (2,−1,−1) | Domain and compatible trace diagram fixed | None |
| §1.4 derivative and coordinate API | z², z₁z₂, g=z₂; derivative order 0 | ∂²z²=2, mixed derivative=1; derivatives of g=(0,1); order-zero value g | Factorial and coordinate order fixed | None |
| §2.1 specialization and moments | d=1, Γ=1, a=b=0; S₃ permuting ℤ³ | Augmentation=scalar value; invariants {(r,r,r)} rank 1 versus underlying rank 3 | Point comparison uses actual representation | None |
| §2.1 rigidification, linearity, torsion hypotheses | h=0; augmentation of 1; p-torsion killed by map with connected dual | Values 0 and 1; connected-dual splitting unavailable integrally | No arbitrary trivialization supplies the construction | None |
| §2.2 oriented cap and local coefficients | d=1, Γ=1; circle with trivial or sign monodromy | Cap r↦r; H¹(circle,ℤ)=ℤ, sign H⁰=0 and H¹=ℤ/2 | Constant coefficients cannot replace local coefficients | None |
| §2.2 determinant shift versus shuffle | line Ru, a=1; transposition in d=2 | u⊗u↦u^[2], shuffle↦2u^[2]; orientation and determinant signs (−1)(−1)=+1 | Shift integral even at p=2 | None |
| §2.2 torsion-normalized cap and complements | Γ=μ₂, free complement 1 | Normalized scalar 1/2; 1/2∉ℤ₂ and belongs to ℤ₂[1/2] | No integral map on all torsion-group cohomology | None |
| §2.3 subgroup law | circle covers of degrees 1,2,3; composite 6 | Integrals r,2r,3r; composite 6r=3·2r; torsion case requires 1/2 | Retain full index before division | None |
| §2.4 refined evaluation and its API | ordinary Gaussian datum at 5, f=(2−i), c=(3); f=O_L | Norms 5,9; differentials 4,0 for map/dual; degree-5 torsion avoids degree-9 kernel; at unit f, x=e∈D | Nonunit conductor allowed, unit conductor excluded from this constructor | None |
| §2.5 refined/unrefined transport | degree-one tensor, cotangent multiplier 2 and dual multiplier 3 | Transport factors 2 and 3; with α=2,β=1 they become 4 and 3; swapping them gives 9 and 2 | Domains distinguished; localization injective by R⊂ℂ | None |
| §2.6 polylogarithm comparison | d=1,2,3; field base k | Coherent degrees 0,1,2; de Rham degrees 1,3,5; same residue (1,−1) has trace 0 | No arbitrary-base logarithm theorem inferred | None |
| §3.1 Borel metric and action | d=1,2; z=1, r=1, scalar γ=2 as metric test | EΓ dimensions 0,1; r′=4,z′=1/2 gives 4·1/4=1; forward z′=2 gives 16 | Inverse action is necessary | None |
| §3.1 degree and orientation | d=2; swap selected coordinates | Real dimension 5; max bidegree (2,3); one log-coordinate orientation changes by −1 | Complementary second degree is 3−q | None |
| §3.2 currents and differential | d=1,(p,q)=(1,0); d=2,(2,0) | Test degrees (0,1),(0,3); differential signs (−1)^1=−1,(−1)^3=−1 | Agrees with test-first Stokes | None |
| §3.2 residue/trace normalization | Λ=2ℤ+iℤ, d=1 | vol(A)=−4i, C=−π/2, vol=πi dx∧dy; Haar Dirac=2 times Lebesgue Dirac gives 2πi, wrong Dirac gives πi | Non-unit covolume discriminates | None |
| §3.2 zero/out-of-range current degrees | d=1, p=2 or q=2 | Required complementary degree −1; specified current space 0 | Out-of-range spaces explicitly zero | None |
| §3.3 hermitianPairing, both linearities and positivity | d=1,h=2,z=1,w=i; d=2,h=(2,3),z=(1,i); d=0 | H(1,i)=−2i, H(i,1)=2i; H(z,z)=5, H(0,0)=0; empty sum 0; unconjugated diagonal gives −1 | Native definition and sign agree | Added explicit API and witnesses |
| §3.3 kroneckerTerm and omission | z+λ=i, ν=1; λ=−z; d=2 vector (1,0) | Numerator −i versus wrong +i; branch gives 0 before log; ν=(0,0) numerator 1 and ν=(0,1) numerator 0 | No 0/0 or coordinatewise omission | None |
| §3.3 positive denominator and junk input | h=2,z+λ=1,s=2; h=0 | exp(2log2)=4; h=0 gives exp(2log0)=1 using total log0=0 | Positive h excludes the false denominator | Added positive-definiteness witness |
| §3.3 translation characters | standard H, a=1,w=i/2; z=1/2 | Im H(1,i/2)=−1/2, exp(−2πi·(−1/2))=−1; a dual w-shift gives exp(2πin)=1 | Translation direction agrees | None |
| §3.3 convergence bound | d=1,ν=0,s=2; d=2,|ν|=2,Re s=4 | Exponents −4<−2; 2−8=−6<−4; at Re s=3 latter equals −4, outside strict bound | Rank is real rank 2d | None |
| §3.4 meromorphic continuation headline | ℤ[i],ν=0,z=w=0; ν=1 | K=4ζL, K(0)=4(−1/2)(1/2)=−1; residue at 1=4·π/4=π; odd ν=1 terms cancel to 0 | Regularity at 0 and at d for ν≠0 consistent | None |
| §3.4 completed versus uncompleted residues | same lattice, d=1 | M residues −1 at 0 and 1 at 1; K residue π at 1; total divergent tsum at 0 is 0 versus continued −1 | Completion and HasSum formulation essential | None |
| §3.4 alternating dual and volume | h=2,ℤ[i]; h=1,2ℤ+iℤ | First dual ½ℤ[i], volumes 2 and 1/2, residue π/2; second alternating dual ℤ+(i/2)ℤ while real dual ½ℤ+iℤ; pairing of 1/2 with i is −1/2 | Real and alternating duals differ as sets | None |
| §3.4 phase and double reflection | z=1/2,w=i/2 | exp(2πi Im H(w,z))=i; reverse=−i; product i(−i)=1; vol·vol*=1 | Functional equation squares to identity | None |
| §3.4 numerical theta identity underlying functional-equation headline | d=1,h=3, lattice columns (1,.3),(.2,1.7),t=.83,ν=0,1,2,3 | At ν=0 LHS=.242766396578926+.000197122856476i; RHS=.242766396582370+.000197122856081i; maximum error over ν≤3 is 1.06e−11 | Consistent with finite-tail truncation | None |
| §3.4 numerical theta identity, non-product lattice | d=2,h=(2,.7),t=1.1,ν=(0,0),(1,0),(0,2),(1,1) | At ν=0 both sides .610622561833298+.048527733599944i; all four errors ≤8.90e−16 | Phase, numerator and volume agree independently | None |
| §3.4 pointwise Gamma exclusions | d=1,ν=0,s=0 | Total Γ(0)=0 while meromorphic M has residue −1; reflected K has pole at 1 | A total pointwise product cannot encode pole | None |
| §3.5 current contraction and degree | d=1,2,3; j=d−1 and j≥d | ι_v(dz∧dbarz)=−v dz; top coefficients −C,−2C,+6C; j≥d yields 0 | Exterior signs discriminate | None |
| §3.5 binomial coefficient and truncation API | (A+v)⁻¹ through v¹; n=0,1 | A⁻¹−vA⁻²; truncation of A⁻¹−vA⁻² at degree 0 is A⁻¹ | Missing (−1)^b fails connection cancellation | None |
| §3.5 square-lattice volume sign | d=1,Λ=ℤ[i],b=0 | C=−π, contraction −C·barℓ dz=+π·barℓ dz | +C would reverse residue | None |
| §3.6 current represents residue class | d=1,Λ=2ℤ+iℤ,h=(1,−1) | Local derivative values +2πi,−2πi; total 0; Fourier zero mode 1−1=0 | Same trace normalization in Layers 1 and 3 | None |
| §4.1 orbit series, admissibility and subgroup API | μ₄,α=4,β=0; Γ′=1,t=1/3; α=1 | Invariant multiplier i⁻⁴=1; each of 4 translated coset sums contributes E, total 4E; i⁻¹=−i≠1 for α=1 | Single-coset subgroup formula requires fixed t | None |
| §4.1 homothety and zero omission | c=2,α=4,β=0,s=0 | E(2t;2Λ)=2⁻⁴E(t;Λ)=E/16; omitted λ=0 contributes 0 | Lattice scaling has inverse α power | None |
| §4.1 convergence half-plane | L=ℚ(i,√2),d=2,α=(6,6),β=0; s=−3,−1 | w=−6, boundary 1+w/2=−2; integer-orbit summands at −3 are 1, at −1 are n⁻⁸ | Incorrect boundary −4 would admit divergent sum | None |
| §4.2 fibre integration and factorials | d=1,α=3,s=0; d=2 logarithmic coordinates | Γ(3)=2!=2; determinant of (log u,log r)↦(log ur,log u/r) is −2, absolute value 2 | Leading d retained | None |
| §4.3 sign, derivative and determinant conversion | d=1,a=0,1,2,3,β=0; a=3,β=1; d=2,a=(1,1),β=0 | Coefficients +1,−1,+2,−6; ε(1,3,1)=+1; ε(2,(1,1),0)=+1 | Sign depends on derivative index as packaged | None |
| §4.3 direct convergent class check | ℤ[i],c=(2),x=1/3,a=2,β=0 | E³≈23.4697519568; oddness E(2/3)=−E(1/3); 2(4E−8(−E))=24E≈563.274047 | Retained positive coefficient; wrong C sign gives negative | None |
| §5.1 ideal structures and period API | ℚ(i), trace dual; Ω=2,q=1; scaling by i | Different=(2i); Tr(1·1/2)=1, Tr(i·(−i/2))=1; Ω∨=πi, scaled q=−i and Ω=2i still give πi | Trace dual and scalar conjugation essential | None |
| §5.1 Serre repetition and zero module | [L:K]=2; rank-zero tensor | Dimension doubles 1→2, periods Ω₀→(Ω₀,Ω₀); rank zero dimension 0 | No generator of nonprincipal ideal is used | None |
| §5.2 normalizer, linearity and scaling | d=1,α=3,β=0,Ω=2; α=2,β=1,Ω=2,Ω∨=πi | N(v)=v/4 in first case; N(v)=v/2 in second; N(0)=0; Ω→2Ω multiplies first by 1/8 | Coordinate factorial, β power and zero value agree | None |
| §5.3 partial L and norm shift | b=O_L; χ=N with w=2 | χ(b)Nb⁻ˢ=1; χᵘ=1; L(χ,s)=ζ_L(s−1), factor denominator 1−Nv^(1−s) | Opposite shift gives wrong exponent −s−1 | None |
| §5.4 critical-coordinate divisibility | d=1,U_f=μ₂,Γ₀=1,α=2,β=0; zero h | Pair λ and −λ give 2λ⁻²; zero residue gives 0/2=0; arbitrary coordinate 1/2∉ℤ₂ | Special-coordinate divisibility is not whole-theta divisibility | None |
| §5.5 distribution and smoothing | three-point split kernel; homothety c=(2),α=4 | Σ_tE(t+1;a)=E(1;c⁻¹a); h_c combination 3E−Σ_tE; c=(2) homothety c⁻¹Λ gives 16E at weight −4 | Correct second lattice is c⁻¹a | None |
| §5.6 partial-value difference | Nc=7,χ(c)=2 | χ(c)Nc−1=13; χ(c)(Nc−χ(c)⁻¹)=2·(13/2)=13 | Atom/scalar difference distinguished | None |
| §5.7 two conductor cases | χ=λ⁻⁴,c=(7),c′=(3) | Raw 80(49−2401)=−188160; multiplication by 1/(2401·81) gives −1280/1323; target (80/81)(49/2401−1)=−1280/1323 | Extra conductor-one factor retained | None |
| §5.7 algebraicity requires algebraic bases | E:y²=x³−x,α=4; basis factors 2 and transcendental t | Normalized 3!L/Ω₀⁴=1/10; scaling gives 1/160 and 1/(10t⁴) | Arbitrary embedded arithmetic R does not force algebraicity | None |
| §5.8 generalized Shimura relation | L=K; non-CM quartic over K | [L:K]=1,2; repeated Ω exponents once,twice; β₀=0 introduces (2πi)^0=1 | No ordinary-prime assumption needed | None |
| §5.9 weak Deligne conclusion | L=0,c⁺≠0; coefficient ambiguity | 0/c⁺=0∈Qbar, 0∉Qbar×; multiplying c⁺ by 1+i preserves Qbar× class | Does not assert E-rationality | None |
| §6.1 ordinary predicate and levels | ℚ(i),p=5,3; non-CM quartic over it | X²+1 mod5 roots 2,3; mod3 no roots; lifted Σ separates by restriction at5 | Inert case rejected, general unramified ordinary scope kept | None |
| §6.1 ideal directions and composition | Lie(i)=3 mod5; paired degree5 maps | d[2+i]=0,d[2−i]=4; norms 5·5=25=degree[5] | q_n uses complementary étale direction | None |
| §6.2 canonical bases and p-adic periods | Ω_p=1, scale u=2 at p=5; scale by p | Period 1→2 is unit; multiplication by p gives nonunit p and ceases to be a basis | Inverse scaling and nonunit-basis model rejected | None |
| §6.3 cap target and coefficient extension | Γ=ℤ acting by 6 on ℤ₅; determinant twist over O_C₂ | H¹=coinvariants ℤ₅/5, invariants 0; O_C₂/2 maps to zero C₂-coinvariants | Injection of coefficients is not injection of coinvariants | None |
| §6.3 invariance on local units | ⟨1+p⟩,p odd; ⟨3⟩,p=2 | At p=3 a level-k unit coset has 3^(n−k) equal submasses; at 2, 3 acts modulo8 with orbits {1,3},{5,7}, 9 swaps 1,9 mod16; fixed mass divisible by all p^r, hence 0 | Does not force ambient δ₀, mass1, to vanish | None |
| §6.3 linearity, augmentation and subgroup API | zero h; d=1,Γ=1; subgroup index2 | θ(0)=0; evaluation=Ω_p e_(0,0); projected θΓ′=2θΓ | No division or invariant representative inferred | None |
| §6.3 dyadic obstruction | y²+xy=x³−x²−2x−1 over ℚ(√−7) | b₂,b₄,b₆,b₈=(−3,−4,−4,−1); c₄=105,Δ=−343,j=−3375; affine F₂-points={(0,1)},#E=2,a₂=1; residue −1≡1 | Whole-theta 2-divisibility false; package avoids it | None |
| §6.3 trace-zero auxiliary datum | c=(3),c′=(5),D=E[15]−e | 24+192+8=224=15²−1; trace 24·8−192+8·0=0 | Compatible with odd local residue | None |
| §6.4 invariant derivative and monomial API | (1+T)²; (1+T₁)²(1+T₂)³; zero indices | Second invariant derivative=4 versus ordinary2; mixed derivative=6; x^0=1 even at x=0 | Canonical derivative is (1+T)∂_T | None |
| §7.1 Eisenstein moment, Amice and mass | (1+T)^2,constant c; critical a=0 | δ₂ moments 1,2,4; cδ₀ mass c and positive moments0; a=0 still Ω_p¹e | Extra determinant Ω_p retained | None |
| §7.1 noncritical mass and dyadic divisibility | Γ=⟨1+√2⟩,p=5; dyadic datum | γδ₀=−δ₀, masses −1 and1; since2 unit,[δ₀]=0; dyadic residue remains1, so μ≠2η | Mass is only a critical functional | None |
| §7.1 linearity, basis independence and subgroup | δ_(1,2) under swap; index2; zero | Moments t·s=2 before/after swap; projection scales by2; zero maps0 | Basis change is pushforward, no new scalar | None |
| §7.2 finite stabilizer and index | γ=577+408√2 at p=5 | γ≡2+3√2; square=2+2√2; cube=1 in F₂₅; required index3 | Pointwise translation first at Γ³, projection retains3 | None |
| §7.2 translation sign and level0 | pairing ζ₃; n=0 | Positive multiplier ζ₃=−1/2+i√3/2, inverse differs; at n=0 kernel size1,m₀=1,q₀=id, θ=θ | Positive pairing and finite-level group retained | None |
| §7.3 partial Fourier transform and inversion API | C₃,ρ=1,δ₀,ζ^x | Transforms (1,0,0),(1/3,1/3,1/3),(0,1,0); inverse positive sum recovers original values | Denominator one direction, no second inverse denominator | None |
| §7.3 refinement and endpoint | ℤ/4→ℤ/2; n=0 | Inflated δ₀=(1,0,1,0) transforms to (1/2,0,1/2,0); order-one transform=identity | Frequency support is kernel annihilator | None |
| §7.4 signed twisted moment | d=1,a=3,β=0,A=2,B=3,v=5,w=7; a=2 | −Av−Bw=−10−21=−31; ε·(Av+Bw)=−31; at a=2 both +31 | All summands retain same sign | None |
| §7.4 refinement/group projection | ρ=1; quartic stabilizer index3 | Original moment I gives projected left3I and right3I; not I=3I | No integral cancellation of level index | None |
| §8.1 local factor and extension | unramified χ; quadratic F₃ unit character | Local=1 with c=b=1; (ζ₃⁻¹−ζ₃⁻²)/3=−i/√3; wrong positive kernel=+i/√3 | Nonzero Gauss sum and sign distinguished | None |
| §8.1 factorization-independence API | c→cλ,b→b(λ)⁻¹,λ≡1 modf | Ideal character ratio contributes λ^(β−α), monomial ratio λ^(α−β); product1 | Same ideal/idelic convention needed | None |
| §8.2 smoothing atoms and convolution API | χ(c)=2,Nc=7; χ=1; c=O_L | Atom moment 7−1/2=13/2, scalar factor13; masses6 and0 for δ′; unit auxiliary δ=δ₁−δ₁=0 | Nonunit or zero atom cannot be inverted | None |
| §8.3 ideal-theoretic quotient and determinant weight | local u=7,χ=λ⁻⁴; α=2,β=1,t=2,s=3 | χ(q_f(7))=1/2401 vs idelic2401; t²s·t⁻¹=6 vs unweighted12 | Correct avatar and derivative a=α−1 | None |
| §8.3 actual signed smoothed interpolation | ℚ(i),p=5,f=(3),χ=λ⁻⁴,c=(7) | ε=−1,δ_c=−2352,product +2352; Euler factors (12−24i)/5 and (632−24i)/625, Local1, tame factor80/81 all nonzero | Omitting ε changes nonzero moment sign | None |
| §8.3 conductor-one translation | same χ,c′=(3); twist ψ(c′)=−1 | Raw factor80, signed raw188160; translation by1/81 gives62720/27=2352·80/81; twisted raw−82 times−1/81 gives82/81 | Translation gives 1−χ(c′), including twists | None |
| §8.3 quotient divisibility versus character moments | ℤ₂×,δ₁−δ₋₁ | Half moments 0,1,0,1,… but indicator(1+4ℤ₂)=1/2; weight t⁻¹ gives δ₁+δ₋₁, quotient pushforward2δ_[1], half mass1 | Divisibility must be proved after weighted quotient | None |
| §8.3 subgroup and zero/identity API | indices2 and3; index1; h=0 | νΓ₀=2η,νΓ₁=6η; 2η/2=6η/6=η; index1 gives η; zero gives0 | Divisibility and subgroup law must hold together | None |
| §8.3 cross-auxiliary family relations | arbitrary scalar moments δ_b,δ_c,δ′_b′,δ′_c′ | δ_bδ_cM=δ_cδ_bM; δ′_b′δ′_c′δ_cM symmetric; translation factorχ(c′) cancels inverse-factor normalization | Commutativity applies to abelian ray group | None |
| §8.4 bounded desmoothing and uniform congruences | C_p, p=2,3, average p⁻¹Σδ_g | Character values1,0; identity-indicator masses1/2,1/3; test function p·1_{e} gives norm≤p⁻¹ but value1 | Characterwise integrality alone insufficient | None |
| §8.4 family relation and bound | χ=λ⁻⁴,c=(7) | M=−Ω_p⁴U; δ_cM=(−2352)(−Ω_p⁴U)=2352Ω_p⁴U | Agrees with constructed family | None |
| §8.5 interpolation, uniqueness and scaling | α=2,β=1; selected basis u=2,p=5 | Period divisor Ω_p²Ω_p∨; Ω→2Ω and Ω_p→2Ω_p scale both normalized sides by1/4 | Requires algebraic differential bases | None |
| §8.5 included critical types and class sign | d=1,(α,β)=(3,0),(2,1),(4,0),(3,1); d=2,α=(1,1),β=0 | Signs +1,+1,−1,−1; d=2 sign+1. For (3,1), weight on i is i^(−3)·(−i)=1 | No single global sign works | None |
| Worked non-CM quartic | L=ℚ(i,√(1+i)); root a | a⁴−2a²+2=0, norm(1−i)=2 not a rational square; [L:K]=2; inadmissible α=(1,2), admissible α=(2,2),β=(1,1) has w=−1 | Lifted theory does not assume CM involution | None |
| Worked full complementary Euler product | two unramified values2,3; ramified zero extension | (1−2)(1−3)=2; either single factor −1 or−2; ramified extension factor1−0=1, no0⁻¹ | Every complementary prime retained | None |

Arithmetic unit groups and ray groups are abelian. The nonabelian S₃ permutation test above belongs to the generic equivariant coefficient interface, where it detects replacing derived equivariance by the underlying rank-three module. Fields, DVRs and O_Cp have their distinct roles: the integral constructions use embedded mixed-characteristic arithmetic models and their completed base changes; zero rings, equal-characteristic fields and nonreduced embedded arithmetic models are excluded by the hypotheses rather than silently specialized to ℤ_p. Generic supplier theories retain their broader bases. Infinite Γ actions use compact quotient tori; no integration over an unquotiented noncompact unit cover is asserted.


Pull request: #1543 (roadmap/automorphic-padic-l-functions-part-ii at 1fce826)
