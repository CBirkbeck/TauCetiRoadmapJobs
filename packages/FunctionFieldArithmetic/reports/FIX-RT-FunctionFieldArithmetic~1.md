# FunctionFieldArithmetic repair report

The first eighteen finding sections address review a; the following four address review b. Overlapping source-manifest and constant-coefficient concerns are settled once mathematically, with both finding records retained. All mathematics, verdicts and edits were performed without delegated agents.

## F01 (P3) — applied

Executable basis construction, place enumeration and ray-group computation → mathematical reduced bases, finite ray quotients and divisor/count identities. Deleted §§1.3, 5.8–5.9 and their cost/termination obligations. Updated §5.6 and layer dependencies; its counts must describe the specified curve. Their existence and counting mathematics remains in §§1.1–1.2, 4.5 and 5.1.

## F02 (P1) — applied

Obsolete SF/T-number contracts → SchemeAndStackFoundations §§1.1, 2.11, 2.16, 3.3, 3.6–3.7 and 5.11. Checked picardComponent and abelMaps_highDegree on main, including JacobianChallenge Layer D and Brauer–Severi descent. Affine effectivity comes from ModularCurves Layer 0E. Repaired scope, supplier contracts, proof sketches and dependencies throughout Layers 0, 4 and 7.

## F03 (P3) — applied

Unspecified characteristic-three constants → explicit k=𝔽₃. Added the 𝔽₉ value to §3.3. Direct enumeration gives 3 affine points plus infinity over 𝔽₃, and 15 plus infinity over 𝔽₉. The conductor is 3 and genus 1 in both cases; the worked example already specified 𝔽₃ and remains consistent.

## F04 (P1) — applied differently

Removed the §6.3→§6.4→§6.3 cycle by placing flat cusp-module base change after uniform support. Restricted §4.5 prerequisites. Reversed the erroneous return-supply descriptions: DeligneWeightsAndPurity §3.7 already owns finiteCover_degreeChebotarev; AL's Representation prerequisites already owns complex GLₙ function spaces. §5.10 retains its distinct explicit error bound; §§6.2/6.7 compare with and consume the earlier complex spaces.

## F05 (P2) — applied

Euler product classified as unavailable → zeta_eulerProduct on native integer power series, using coefficientwise HasProd and invOfUnit. The pinned inverse definition is Mathlib/RingTheory/PowerSeries/Inverse.lean:82; the topology is Mathlib/RingTheory/PowerSeries/PiTopology.lean:80. Positive place degree makes every factor's constant coefficient one. The signature elaborates under default options.

## F06 (P3) — applied differently

Added the requested discriminators as README Checks: characteristic-two carry t²+t³, nonzero class of 1 in Q₁(𝔽ₚ), zero coboundaries at every length, degree-two weighting and genus-zero polynomial data. No Lean mirrors were added: the binding acceptance-test rule excludes boundary/API padding. The two nontrivial proved polynomial examples remain; routine Witt/count examples were deleted.

## F07 (P3) — applied

Deleted the trailing name catalogue. Replaced the introductory catalogue/process framing with the prescribed target-signature docstring and missing-carrier explanations. Added native finite-length Artin–Schreier–Witt character classification so the retained Witt definitions serve a headline. Removed redundant degree-surjectivity and rational-field/count boundary declarations. README-only target names and APIs no longer claim undeclared Lean counterparts through backticks.

## F08 (P1) — applied

Implicit Witt Hilbert 90 → explicit preceding exact-sequence target, with trace source/target, Witt addition, truncation compatibility and all three Checks. Source: kw line 276, Proposition 3.1, p. 6. Its finite-length proof starts from pinned Algebra.trace_surjective in Mathlib/RingTheory/Trace/Basic.lean:518. Classification now names this target among its prerequisites.

## F09 (P1) — applied

Local decompositions used as global reduction → function-field reduction target in §6.4, before cusp support: relative-root inequalities, finite Siegel covering, compactness modulo the adelic centre, finite volume, and anisotropic/nonsplit cases. Morris I §§4.1–4.7 supplies the statements (morris1 lines 421–497). Arbitrary levels allow a finite adelic translate set. §§6.4 and 7.2 consume this target.

## F10 (P1) — applied

Unassigned spectral/continuation assumptions → named unitary targets for cuspidal rational continuation, residual discrete decomposition and continuation from discrete inducing data, for all rational parabolics and finite levels. Specified unitary central characters, character lattice, intertwining domains, denominators and pole loci. References: morris1 lines 1612, 2525; morris2 lines 1300, 2008. Cuspidal continuation precedes residues and their discrete-data extension.

## F11 (P3) — applied

Both “Proposition 4.4, pp. 16–17” locators → “Proposition 4.4 and proof, pp. 15–16”. The proposition begins at kw line 739, the page-16 marker is line 744, and its proof ends at line 755. Updated §§4.3 and 4.5; no mathematical formula changed.

## F12 (P3) — applied

Absent source manifest → 28 distinct works with complete metadata and exact locators, legal provenance where fetched, version notes and certification status. Included proof-only SGA 3 and Borel–Tits. Retained the roquette waiver without requesting it. Corrected the SGA 4½ DOI to the cited chapter, rather than its erratum. Source check: zero problems; no unresolved requests.

## F13 (P3) — applied

“Different series at the same s” → matched normalized and unnormalized inductions give identical sections and series. In split rank one both values at m(π,1) are q^(−s−1/2). Only retaining s+n/2 while changing the induction convention shifts the parameter. Updated §7.2's Check; the displayed unnormalized convention remains consistent with fyz lines 372–375.

## F14 (P2) — applied

Blanket odd-characteristic restriction → independent §7.4 local setting in every characteristic and residue characteristic. Import the inert characteristic-not-two case, including dyadic fields, from GeometryOfNumbersAndQuadraticArithmetic §3.2; add split and inert equal-characteristic-two cases using trace-surjective primitive charts and saturation. Added 𝔽₂ Checks 1+T, 1−T and rank-zero 1. Evidence: li_zhang lines 688–711.

## F15 (P1) — applied

Universal unramified existence and geometric alternation → exact Picard-kernel obstruction, arithmetic reciprocity evaluation and the elliptic negative control. Marked FYZ Remark 2.1's conclusion erroneous (fyz lines 383–393). Preserved every cover through finite-ramification inducing characters, congruence-level sections, ramified local Fourier factors and a coefficient formula with level data. Spherical formulas explicitly assume a chosen everywhere-unramified character.

## F16 (P1) — applied

Descent of an underlying open cover → conductor divisibility and reconstruction with the smaller modulus's ramification bound. Extension across disappearing support points detects unramifiedness only, not positive multiplicity. Added y^p−y=t on the identical opens for 2[∞] and [∞]: conductor 2 means only the larger ray group admits its character. Evidence: kw lines 1180–1199; §4.10 definitions.

## F17 (P3) — applied

Impossible character nontrivial on Z(K) → admissible degree-parity character on the GL₁ quotient ℤ/2. Values are (a,−a); a nonzero constant is impossible over ℚ, while (2,2) works over ℤ/4. This tests ring torsion within §6.2's actual central-character domain and satisfies the specified level and Ξ conditions.

## F18 (P1) — applied

Trace-only attribution → PadicMeasuresIwasawaAlgebras §5.1 determinant lines with quasi-isomorphism, acyclic, shift and base-change compatibility. Added §5.7's characteristic-series bridge, its independence and cohomological product laws, with three discriminators. EtaleCohomologyFoundations F.10.3 retains its actual trace/finite-projective comparison role. The distinction is visible in stacks lines 1138–1154 and the ℤ/4 two-term complex.

The following findings are from review b.

## F01 (P3) — applied differently

Deleted the routine Teichmüller example along with the other boundary/API examples, rather than retaining its deprecated simp lemma. The operator and quotient remain, now supporting the native character-classification headline. Final elaboration has only the eight expected sorry warnings and no deprecation or overlapping-instance warning.

## F02 (P3) — applied

Removed “now”, “Current/current Tau Ceti” and the supplier commit hash. The named implementations and supplier contracts remain, with timeless wording in Scope and ownership, Exact supplier contracts and §4.1. Their pinned existence was checked directly; no library fact was removed merely to remove a time word.

## F03 (P3) — applied differently

Title → “function field arithmetic — algebraic curves, Part II”. This identifies the package while preserving the binding Part II convention for an extension of existing AlgebraicCurves work. The Summary still says exactly where AlgebraicCurves stops; FunctionFieldArithmeticPartII remains a distinct later consumer. Folder and namespace are unchanged.

## F04 (P3) — applied differently

Duplicate zeta_coeff_zero/zeta_constantCoeff names → one prose API fact: the zeta constant coefficient is one. No named one-tactic theorem was added. The zero-divisor fact uses pinned Divisor.degree_eq_zero_iff (TauCeti/FieldTheory/FunctionField/Divisor/Basic.lean:160); both duplicate names and the routine Lean count proof leave the acceptance test. This also settles the constant-coefficient gate hit.

## Gate failures and validation

- Missing sources.toml: added the schema tauceti-roadmap-sources/v1 manifest with 28 works: 22 certified legal copies, five uncertified paywalled works, and the waived roquette entry. No source text or machine path is embedded. `sources check` exits 0: `packages/FunctionFieldArithmetic/sources.toml: 0 problem(s)`.
- artinSchreierWitt_add and artinSchreierWitt_truncate: replaced names by prose additivity and truncation facts in §3.1.
- aswQuotient_map and aswQuotient_restrict: replaced names by prose field/localization maps and length projections in §3.1.
- placeCount_eq_mobius and pointCount_constantExtension: retained their equations as unnamed prose API facts in §5.1.
- pointCount_from_enumeration: deleted the executable §5.8 deliverable; its degree-weighted identity is §5.1's definition and Checks.
- zeta_constantCoeff: retained the single mathematical constant-coefficient fact in prose, with no padding declaration.
- Removing the old Lean name catalogue exposed additional local-name references. Converted README-only labels to prose throughout all layers, including local Lubin–Tate, ray-cover, density, automorphic and Fourier APIs. The text scanner reports readme-ids-missing=0.

The targeted prerequisite build `lake build TauCeti.FieldTheory.FunctionField.RiemannRoch.ClassNumber` completed successfully (2906 jobs). The required direct elaboration exits 0, with exactly eight declaration-uses-sorry warnings and no other diagnostics. The separate signature-check elaboration also exits 0, printing all fifteen named declaration types and the same eight expected warnings.

Dependency check, with the prescribed merge order and movable flag:

```text
depcheck: 14 roadmaps, 113 edges, 0 problem(s)
```

Exit 0; no UPWARD, CYCLE or moved line. No merge-order or tooling file was edited. The direct worktree gate assumes a TauCetiRoadmap tree and cannot inspect the board's packages layout; the existing gate's read-only scan_folder routine was therefore also run on these package texts, with the pinned Tau Ceti source path. Every text count is zero. This is distinct from the worker's subsequent submission check.

## Ownership and source verification

Supplier citations were resolved against main or the indexed new-roadmap heads, then the affected contracts were read directly. The ownership search used roadmaps grep by object, main, board packages and all thirteen provided sibling heads. It found no earlier supplier for cyclic Witt trace exactness, function-field reduction in the general coefficient branch, the finite-ring characteristic-series bridge, or general unitary Eisenstein continuation. They are explicit local targets; generic determinant lines, ordinary Picard objects, complex GLₙ functions and asymptotic degree-Chebotarev remain with their earlier owners. No supplier gap or design plan was needed; no design/plan.json exists in this package.

QWittVectors owns big/q-Witt constructions and consumes the pinned classical p-typical operators; the trace exactness here concerns finite cyclic field extensions. AdelicAlgebraicGroups' reduction chapter is over number fields. AutomorphicSpectralTheory's cited function-field branch is everywhere-unramified GLₙ. GeometryOfNumbersAndQuadraticArithmetic §3.2 allows dyadic residue fields but assumes characteristic of the base field different from two. LocallyAnalyticDistributions' characteristic series are Fredholm series of compact operators; the bridge here is the scalar determinant-line action on a perfect derived complex, over finite rings as well. The open CohomologicalPointCounting trace work is not an earlier supplier in the permitted order.

The citation resolver found no unresolved roadmap citation or Lean identifier. Its external-library search was unavailable in the board layout; native claims were checked in the supplied pinned source directories instead. Mathlib is 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| Evidence | Locator read | Consequence |
|---|---|---|
| kw | lines 276–296, 362; 722–755; 1180–1200 | Hilbert 90 is separate; finite-character classification; corrected uniqueness pages; conductor detects multiplicity. |
| morris1 | lines 421–497, 529–599, 1612–1625, 2525–2549 | Global reduction, bounded-root compactness and finite volume; cusp support; cuspidal rationality. |
| morris2 | lines 1300–1312, 1980–2027 | Spectral/residual decomposition and rational continuation from discrete data are separate obligations. |
| fyz | lines 344–399, 481–509, 615–678 | Induction conventions; actual false universal-existence argument; density and Fourier specializations. |
| li_zhang | lines 688–716 | Overlattice formula and the residue-characteristic-two trace argument; rank-one signs. |
| sga3 | lines 240–255 | Characteristic unipotent filtration and vector-group quotients. |
| stacks | lines 1138–1154 | Finite flat coefficient theorem requires a perfect-complex determinant; traces alone do not give it. |
| SchemeAndStackFoundations | §§1.1, 2.11, 2.16, 3.3, 3.6–3.7, 5.11 | Correct section numbers, ordinary Picard/Brauer and Abel-map scope. |
| ModularCurves | Layer 0E | Effective descent of affine schemes. |
| PadicMeasuresIwasawaAlgebras | §5.1 | Perfect-complex determinant functor and its natural identifications. |
| EtaleCohomologyFoundations | §§F.2.5, F.3, F.10.2–F.10.3 | Compact supports, perfectness, Frobenius and traces; no substituted determinant-line ownership. |
| DeligneWeightsAndPurity | §§1.6, 1.9, 3.7 | Curve estimate, extension and earlier degree-Chebotarev ownership. |
| AutomorphicLFunctionsAndLocalFactors | Representation prerequisites; AL.3 | Earlier complex GLₙ carriers, additive analysis and Fourier reconstruction. |
| SmoothRepresentationsOfLocalGroups | §§SR.2.1–SR.2.3, SR.4.1, SR.4.4 | Smooth/parabolic induction, its level-coset models, Whittaker functionals and unramified unitary data are imported. |
| Mathlib | RingTheory/Trace/Basic.lean:518; PowerSeries/Inverse.lean:82; PowerSeries/PiTopology.lean:80 | Separable trace surjectivity and native Euler-product statement. |
| Tau Ceti | FieldTheory/FunctionField/Divisor/Basic.lean:160; RiemannRoch/ClassNumber.lean:81; RiemannRoch/Genus.lean:189 | Effective degree-zero criterion, finite divisor counts and native genus convention. |

No mathematical claim is certified merely by a successful sorry build. The following computed pass records each retained construction and target separately, including their API consequences and all added statements. Symbolic values in a row are actual evaluations in the indicated case, not source quotations. Zero rings, q=1 and characteristic-p coefficient averaging are excluded exactly where the field and invertibility hypotheses exclude them; total-function junk values are recorded where admitted.

## Adversarial mathematics pass

| Statement | Instances tried | Values on the two sides / exclusions | Result and change |
|---|---|---|---|
| Exact constants and genus convention | 𝔽₉(t)/𝔽₃; exact genus 2 with constant degree 2 | dim L(0)=2; native nonexact genus=3 versus exact genus=2; exact constants exclude using q=3 for the geometric curve. | Pass; generality retained. |
| Place degree and absolute value | q=2, degree-two place, uniformizer | degree=2, ord=1, norm=2⁻²=1/4; ignoring residue degree gives 1/2. | Pass; no mathematical change. |
| Divisor / idele degree comparison | degree-two uniformizer idele; principal t | deg=2 versus Yu degree=−2; principal degrees=1−1=0 on both sides. | Pass; no mathematical change. |
| Arithmetic / geometric Frobenius | constant extension degree 3, place degree 2 | arithmetic exponent=2 mod 3; geometric exponent=−2=1 mod 3. | Pass; sign unchanged. |
| Constant-field reciprocity | quadratic constant extension, degrees 1 and 2 | images φ and φ²=1; geometric images φ⁻¹=φ and 1. | Pass; no mathematical change. |
| Zeta variable and coefficient convention | q=2, place degree 2 | q^(−2s)=T²; first Euler contribution is coefficient 2, not coefficient 1. | Pass; no mathematical change. |
| Coefficient invertibility | p=2, R=ℚ or 𝔽₂ | 1/2 exists in ℚ; 2·0=0≠1 in 𝔽₂, so averaging is excluded there. | Pass; no mathematical change. |
| exists_divisor_degree_eq_one | 𝔽₂(t), D=∞; real pointless conic | degree ∞=1; real divisor degrees are 2ℤ, so degree 1 is impossible without finite constants. | Pass; no mathematical change. |
| Degree surjectivity consequence | D=∞ and integer −2,0,1 | degrees of −2D,0,D are −2,0,1. | Pass; duplicate Lean theorem removed. |
| divisorClass_picardPoints | ℙ¹ over 𝔽₂; pointless real conic | Cl⁰=J(k)=0, class number=1; over ℝ the map 2ℤ→ℤ has cokernel ℤ/2. | Pass; supplier locators corrected. |
| Degree-one Picard torsor | ℙ¹ over 𝔽₂ | class of ∞ trivializes Pic¹; J(k)=0, so this component has one point, while X(k) has 3. | Pass; no mathematical change. |
| chartIdeals | k(t), D=2∞ | finite ideal=k[t]; infinite ideal=t⁻²O∞; inverse intersection=span(1,t,t²), dimension 3. | Pass; no mathematical change. |
| riemannRochSpace_eq_inf_chartIdeals | D=2∞ and D=−∞ | intersection dimensions=3 and 0; L(2∞), L(−∞) have dimensions 3 and 0. | Pass; no mathematical change. |
| chartIdeals_add | D=∞, E=∞ | infinite ideals t⁻¹O∞·t⁻¹O∞=t⁻²O∞; finite ideals both k[t]. | Pass; no mathematical change. |
| chartIdeals_add_poles | x=t, D=0, r=2 | pole shift gives t⁻²O∞; zero shift gives t²k[t]; signs differ as required. | Pass; no mathematical change. |
| chartIdeals_principal | f=t on k(t) | finite valuations give (t); infinity valuation −1 gives tO∞; both ideals are generated by t. | Pass; no mathematical change. |
| exists_reducedBasis | rank 0 and rank 1 | empty basis/invariant sum=0; pair (k[t],t⁻²O∞) has invariant −2. The inverse chart pair for L(2∞) has invariant 2. | Pass; no mathematical change. |
| riemannRoch_reducedBasis | rational field D=0, r=−1,0,2 | basis sizes max(0,r+1)=0,1,3, matching L(r∞). | Pass; no mathematical change. |
| reducedBasis_unique | rank-one pair with infinite lattice t²O∞ | t^dO∞=t²O∞ implies valuations −d=−2 and d=2; d=3 gives a different lattice. | Pass; no mathematical change. |
| reducedBasis_shift | rational invariant 2, shift −3 | new invariant −1=2−3; dimension max(0,−1+1)=0. | Pass; no mathematical change. |
| reducedBasis_dim | elliptic invariants (0,−2), shift r=2 | dimension=3+1=4; basis 1,x,x²,y has four members. | Pass; no mathematical change. |
| reducedBasis_sum | elliptic x-map rank 2, D=0 | sum 0−2=−2; degree 0+(1−1)−2=−2. | Pass; no mathematical change. |
| reducedBasis_principal | D=0, f=t in k(t) | D−div t=∞−[0] still has invariant 0; L is span(t), with divisor bound div(t)+D−div(t)=0. | Pass; no mathematical change. |
| divisorLattice | 𝔽₂(t), D=∞ and D=−∞ | infinite coordinates are tO∞ and t⁻¹O∞; intersections with K have dimensions 2 and 0. | Pass; no mathematical change. |
| divisorLattice_isCompactOpen | D=0, one modified place | O_v and π_v⁻¹O_v are compact open; one-place index at degree 2 is 4, finite. | Pass; no mathematical change. |
| divisorLattice_inter_diagonal | D=0 and −∞ on ℙ¹ | intersection dimensions 1 and 0, equal to ℓ(0)=1 and ℓ(−∞)=0. | Pass; no mathematical change. |
| divisorLattice_quotient | W=−2∞, D=−∞ and −2∞ | cokernel dimensions ℓ(W−D)=ℓ(−∞)=0 and ℓ(0)=1. | Pass; no mathematical change. |
| divisorLattice_mono | D=0≤∞ | O∞⊂tO∞; dimension of local quotient=1. | Pass; no mathematical change. |
| divisorLattice_add | D=0, f=t on ℙ¹ | t·lattice(0) has order bound 1 at 0 and −1 at ∞; lattice(−div t) has the same bounds since −div t=∞−[0]. | Pass; no mathematical change. |
| divisorLattice_index | q=2, degree-two place v | index of lattice(v) over lattice(0)=2²=4, versus wrong unweighted value 2. | Pass; no mathematical change. |
| selfDual_local_volume | n_v=−2 and 2, q_v=2 | vol O_v=2 and 1/2; vol O_v·vol O_v-perp=1 in each case. | Pass; no mathematical change. |
| selfDual_global_volumes | ℙ¹ q=2, ω=dt, D=0 and ∞ | integral volume 2; lattice volumes 2 and 4; quotient volume 2·(1/2)=1. | Pass; no mathematical change. |
| selfDual_change_differential | ω→tω on ℙ¹, q=2 | local scaling at 0 is 2⁻¹/², at ∞ is 2¹/²; product=1. | Pass; no mathematical change. |
| selfDual_annihilator_local | n_v=2, O_v | annihilator π⁻²O_v; its volume is 4·(1/2)=2, reciprocal to 1/2. | Pass; no mathematical change. |
| selfDual_integralVolume_ratio | g=0 and g=1, q=2 | ratios 2 and 1 equal q^(1−g). | Pass; no mathematical change. |
| fourier_indicator_divisorLattice | ℙ¹ q=2, D=0, W=−2∞ | transform=2·indicator lattice(−2∞); second transform coefficient 2·(1/2)=1. | Pass; no mathematical change. |
| testFunctions_span_translates | local residue field 𝔽₂, coset 1+πO | indicator has value 0 at 0 and 1 at 1; unshifted O/πO lattice indicators cannot isolate this coset. | Pass; no mathematical change. |
| Residue-character source corrections | 𝔽₄=𝔽₂[u]/(u²+u+1) | trace values at 0,1,u,u+1 are 0,0,1,1; induced character values are 1,1,−1,−1, nontrivial but not injective. | Pass; no mathematical change. |
| artinSchreierWitt | p=2, Teichmüller [t] in 𝔽₂(t) | first two coordinates t²+t and t²+t³; second is nonzero. For 0 and 1 the result is 0. | Pass; carry Check added; characteristic binder explicit. |
| aswQuotient | n=0; n=1 over 𝔽₂ | Q₀=0; ℘ is zero on 𝔽₂, so Q₁=𝔽₂ and class 1≠0. | Pass; positive-length negative control added. |
| Witt additivity | p=2, [t]+[t] at length 2 | [t]+[t]=(0,t²); ℘ of it has second coordinate t⁴+t²; ℘[t]+℘[t] has the same second coordinate. | Pass; no mathematical change. |
| Witt truncation | p=2, n=2→1, [t] | truncation of (t²+t,t²+t³) is t²+t, the length-one operator. | Pass; no mathematical change. |
| Witt quotient localization | y²−y=t⁻¹, place ∞ | right side lies in the maximal ideal at ∞ and has local class 0; global simple-pole class is nonzero, so localization is not injective. | Pass; no mathematical change. |
| Witt length projections | class [t] in Q₂(𝔽₂(t)) | order 4 at length 2; projection has order 2 in Q₁; projection to Q₀ has order 1. | Pass; no mathematical change. |
| Witt trace construction | length 1, degree-p Artin–Schreier extension, p=2,3 | Tr(1)=0; Tr(−y^(p−1)) polynomial coefficients are (1,0) and (1,0,0), so trace=1. | Pass; target added. |
| Witt additive Hilbert 90 exactness | n=0 and identity extension | all groups zero at n=0; for L=F, quotient=0 and trace=id, so kernel trace=image(1−σ)=0. | Pass; prerequisite added. |
| Witt trace truncation | degree-two 𝔽₄/𝔽₂, n=2→1 | truncated trace of [u] has first coordinate u+u²=1; trace of its first coordinate is also 1. | Pass; no mathematical change. |
| artinSchreierWitt_galois | F=𝔽₂, n=0,1,2 | quotient groups have orders 1,2,4; continuous characters of Gal(𝔽̄₂/𝔽₂)=ℤ̂ into ℤ/2ⁿ have respectively 1,2,4 elements. | Pass; native character-classification headline added. |
| aswField_degree | F=𝔽₂(t), class [t] at n=1,2 | orders and extension degrees are 2 and 4; zero class gives 1=1. | Pass; no mathematical change. |
| aswField_eq_iff | p=3, class t⁻¹ and 2t⁻¹ | both nonzero classes span the same order-3 subgroup; y→2y identifies the two fields, while the characters differ by 2. | Pass; no mathematical change. |
| Infinite Witt character duality | F=𝔽ₚ | Q∞=W(𝔽ₚ)=ℤₚ; continuous Hom(ℤ̂,ℤₚ)=ℤₚ, both determined by the image of 1. | Pass; no mathematical change. |
| aswReduced_exists_unique | [T⁻ᵖ], p=2 and 3 | reduced form [T⁻¹] in each case; unreduced pole indices 2 and 3 are removed. | Pass; no mathematical change. |
| aswReduced_class | x=β+p[T⁻ᵐ] | constant coefficient c=1 and pole coefficient p; reassembly returns β+p[T⁻ᵐ]. | Pass; no mathematical change. |
| aswReduced_unramified | p=3, x=β and 3β at length 2 | orders 9 and 3; extensions are constant of degrees 9 and 3, with wild conductor 0. | Pass; no mathematical change. |
| aswReduced_primitive | p=3, x=β+3[T⁻⁴] and 3β+[T⁻⁴] | first case n_c=1,n₀=0: first layer unramified degree 3; second n_c=n₀=0: first layer totally ramified degree 3. | Pass; no mathematical change. |
| aswReduced_changeUniformizer | T′=aT, a∈kˣ, pole T⁻¹ | T⁻¹=a(T′)⁻¹; coefficient changes by a but pole break remains 1 and conductor remains 2. | Pass; no mathematical change. |
| Reduced trace generator | k=𝔽_{p^p}, x=[1+T] | constant trace of 1 is p; coefficient c=p/Tr(β)∈pℤₚ, not necessarily a unit. | Pass; no mathematical change. |
| artinSchreier_onePole_comparison | k=𝔽₃, m=2; extend to 𝔽₉ | different 6; 2g−2=−6+6=0; conductor 3; point counts 4 and 16. | Pass; constants in the Check repaired. |
| One-pole excluded pole order | p=3, m=3 | [t⁻³]=[t⁻¹]; reduced genus (3−1)(1−1)/2=0, versus unreduced value 2. | Pass; no mathematical change. |
| LubinTate.formalGroup and commutativity | equal characteristic O=𝔽₂[[π]], f=πX+X² | additive formal law X+Y gives f(X+Y)=f(X)+f(Y); constant term 0, linear term π. | Pass; no mathematical change. |
| LubinTate.iso_of_series | same Lubin–Tate series f on both sides | strict isomorphism X has linear coefficient 1 and f∘X=X∘f; scaling by a≠1 fails strict normalization. | Pass; no mathematical change. |
| LubinTate.smul | a=0,1,π | endomorphisms 0,X,f; [π]∘[1]=f=[π·1]. | Pass; no mathematical change. |
| LubinTate.smul_apply_linear | f=πX+X² | linear coefficient of [π] is π, while [1] has coefficient 1. | Pass; no mathematical change. |
| lubinTate_torsion | Q=2, m=1,2 | torsion has 2 and 4 elements; primitive torsion field degrees (Q−1)Q^(m−1)=1,2. | Pass; no mathematical change. |
| LubinTate.torsion_equiv | m=1, Q=3 | rank-one O/π module has 3 elements, including 0; its generator set has 2 elements. | Pass; no mathematical change. |
| LubinTate.field_degree | Q=3, m=1,2 | degrees 2 and 6, versus incorrect Q^m values 3 and 9. | Pass; no mathematical change. |
| LubinTate.field_galois | Q=2,m=2 | (O/π²)ˣ has two elements; Galois group order=2 and is abelian. | Pass; no mathematical change. |
| LubinTate.norm_uniformizer | Q=2,m=1 | primitive torsion is −π and extension is degree 1; valuation of its norm=1. | Pass; no mathematical change. |
| LubinTate.relative | ord(x)=1 or 2, Q=2,m=2 | total degrees 2 and 4; residue degrees 1 and 2; norm valuation subgroups ℤ and 2ℤ respectively. | Pass; no mathematical change. |
| localKroneckerWeber | K=𝔽₂((T)), unramified quadratic and conductor-two AS extension | unramified degree 2 lives in K^ur; ramified degree 2 lives in Lubin–Tate compositum; both must be included. | Pass; no mathematical change. |
| localAbelianExistence_all | norm subgroup index 1 and index p | whole Kˣ gives K of degree 1; simple-pole AS norm subgroup gives cyclic degree p. | Pass; no mathematical change. |
| injective_artinMap_all | uniformizer modulo unramified quadratic norm subgroup | valuation 1 maps to the nontrivial involution; square uniformizer maps to identity. | Pass; no mathematical change. |
| lubinTate_artin | unit u and uniformizer π | arithmetic Art(u) acts by [u⁻¹]; Art(π) acts by arithmetic residue Frobenius, opposite to Yoshida geometric normalization. | Pass; no mathematical change. |
| conductor_existence_all | trivial character; yᵖ−y=T⁻¹ | conductors 0 and 2; tame conductor 1 cannot replace the second. | Pass; no mathematical change. |
| schmidWitt | p=3, x=T⁻¹, y=1−aT | dlog(1−aT)=−a dT+…; residue and symbol both −a. | Pass; no mathematical change. |
| schmidWitt_perfect | length 1, element Tᵖ | pairings all 0 although valuation coordinate in K̂ˣ is p≠0; quotient by pth powers is required. | Pass; no mathematical change. |
| schmidWitt_characterization | x=β, b=T and 1−aT | values Tr(β) and 0; pole class [cT⁻¹] paired with T gives 0. | Pass; no mathematical change. |
| schmidWitt_formula | p=3, x=T⁻¹, y=1−T | residue −1=2 mod 3; arithmetic symbol is 2, detecting the inverse sign. | Pass; no mathematical change. |
| schmidWitt_normGroup | B=0 and B generated by T⁻¹ at length 1 | annihilator indices 1 and p; corresponding extension degrees 1 and p. | Pass; no mathematical change. |
| Completed lift ring | Σ_{j≥0}pʲ[T⁻(pj+1)] modulo p² | only j=0,1 survive; pole orders 1,p+1 have no global lower bound as precision increases. | Pass; no mathematical change. |
| aswConductor_eq | p=3,m=2, length 1 and 2 | conductors 1+2=3 and 1+3·2=7; length-two coefficient 3 instead gives 3. | Pass; no mathematical change. |
| aswConductor_lengthOne | integral class and reduced T⁻², p=3 | conductors 0 and 3; Swan breaks 0 and 2 do not conflate tame/unramified conventions. | Pass; no mathematical change. |
| aswConductor_compositum | characters with conductors 0,3,7 | maximum conductor=7; repeated zero character contributes 0. | Pass; no mathematical change. |
| aswUpperRamification | x=β+p[T⁻ᵐ], m>p, r=1 | inertia=pℤₚ; corrected exponent max(1,unclamped)=1, while unclamped≤0 would give ℤₚ. | Pass; no mathematical change. |
| rayIdeleClassGroup | ℙ¹, m=0,[0]+[∞],2[0] | degree-zero group orders 1,q−1,q; at q=2 these are 1,1,2. | Pass; no mathematical change. |
| rayIdeleClassGroup_degree_exact | ℙ¹, m=2[0], q=2 | kernel order 2; degree-one class maps to 1; quotient degree group ℤ is infinite. | Pass; no mathematical change. |
| RayCharacterData | ℙ¹, m=0,r=2 | finite quotient ℤ/2; trivial and parity characters both have conductor 0 but degree-one values +1,−1. | Pass; no mathematical change. |
| rayCharacterData_conductor | ℙ¹ wild AS cover at ∞ | U² killed, U¹ not killed; least exponent 2 rather than input modulus 3 or tame exponent 1. | Pass; no mathematical change. |
| rayCharacterData_sound | parity character into μ₂ | image {+1,−1} has 2 elements; trivial character image has 1. | Pass; no mathematical change. |
| rayCharacterData_conductor_minimal | local AS simple pole | exponent c=2: kernel includes U², excludes 1−T∈U¹ by symbol −1. | Pass; no mathematical change. |
| rayCharacterData_unramified | constant extension character | all local units map to 1; degree-one value −1 is allowed, exponent remains 0. | Pass; no mathematical change. |
| rayCharacterData_constantValue | same constant quadratic character | degree-one value −1 gives degree-two value (+1); local unit values alone are all 1. | Pass; no mathematical change. |
| schmidWitt_localCoordinates | uniformizer t⁻¹ at infinity | normalized order=1 in both completion and Laurent coordinate; degree stays 1. | Pass; no mathematical change. |
| localCoordinates_truncation | N=0,1,2 over 𝔽₂ | quotient sizes 1,2,4; (1+cT)(1+dT) mod T²=1+(c+d)T. | Pass; no mathematical change. |
| schmidWitt_changeParameter | T′=aT, x=T⁻¹,y=1−T | x=a(T′)⁻¹, y=1−a⁻¹T′; residue −a·a⁻¹=−1 remains unchanged. | Pass; no mathematical change. |
| rigidifiedPicardFunctor | ℙ¹,m=2∞; nilpotent test ε²=0 | units 1+bε modulo constants have parameter b; forgetting nilpotents would give 0 parameters. | Pass; no mathematical change. |
| generalizedPicard / generalizedJacobian | ℙ¹ with m=0,[0]+[∞],2∞ | degree-zero groups 0,𝔾_m,𝔾_a; dimensions 0,1,1. | Pass; no mathematical change. |
| generalizedPicard_representable | ℙ¹,m=2∞ | degree-d component is an affine line for every d; reduced-support replacement would give a point. | Pass; no mathematical change. |
| generalizedJacobian_linearPart | nonzero modulus of degree N on ℙ¹ | dimension g+N−1=N−1; N=1 gives 0, N=2 gives 1. | Pass; no mathematical change. |
| generalizedPicard_tensor | m=2∞, rigidifications 1+aT and 1+bT | product mod T²=1+(a+b)T; group is additive, not multiplication of a,b. | Pass; no mathematical change. |
| generalizedPicard_baseChange | 𝔽₃→𝔽₉, m=2∞ | 𝔾_a rational point counts 3→9, geometric dimension remains 1. | Pass; no mathematical change. |
| generalizedPicard_torsor | ℙ¹, m=2∞, choose [0] | translation by d[0] identifies Pic_m^d with 𝔾_a; class [0]−[0] maps to 0. | Pass; no mathematical change. |
| HasRayModulus | u=t, modulus 2∞ or ∞ | at 2∞ the residue relation forces sum=0; for ∞, f=(t−1)/t≡1 mod T but u([1]−[0])=1≠0. | Pass; no mathematical change. |
| HasRayModulus.mono | u=t, 2∞≤3∞ | relations at 3∞ are a subset of those at 2∞; sums remain 0, while modulus ∞ fails with value 1. | Pass; no mathematical change. |
| HasRayModulus.comp | u=t into 𝔾_a, then multiply by 2 | vanishing relation sum 0 maps to 2·0=0; over 𝔽₃ the counterexample value 1 maps to 2. | Pass; no mathematical change. |
| HasRayModulus.baseChange | u=t, 𝔽₂→𝔽₄ | modulus 2∞ relation remains 0; failed ∞ relation still gives 1≠0. | Pass; no mathematical change. |
| rayAbel | ℙ¹, [c]−[1] at 0+∞; [c]−[0] at 2∞ | coordinates c and c; inverse convention would give c⁻¹ or −c instead. | Pass; no mathematical change. |
| rayAbel_affineBundle | ℙ¹,N=2,n=1,2 | relative dimensions n−N−g+1=0,1; fibres point and affine line. | Pass; no mathematical change. |
| rayAbel_baseChange | ℙ¹,2∞, c∈𝔽₃⊂𝔽₉ | map c↦c in either field; rational fibres of affine-line case have 3 or 9 points. | Pass; no mathematical change. |
| rayAbel_forgetModulus | 2∞→∞ on ℙ¹ | 𝔾_a→0; all coordinates c map to 0, so wild data is lost. | Pass; no mathematical change. |
| rayAbel_rosenlicht | u=t with modulus 2∞ | factor map 𝔾_a→𝔾_a is identity: value at class [1]−[0] is 1. | Pass; no mathematical change. |
| rayAbel_rosenlicht_unique | same u=t and constant u=0 | factor maps id and zero; evaluating at all c forces coefficients 1 and 0 respectively. | Pass; no mathematical change. |
| rayPicard_comparison | ℙ¹,m=2∞,q=3 | degree-zero ray group and Pic_m⁰(𝔽₃) both have 3 elements; ordinary Pic⁰ has 1. | Pass; no mathematical change. |
| rayPicard_localUnits | mod T², classes 1+cT | multiplication c,d→c+d; q choices after quotient by kˣ. | Pass; no mathematical change. |
| rayLangCover | J=𝔾_a or 𝔾_m | Lang equations z^q−z=t and z^(q−1)=t; fibres have q and q−1 geometric points. | Pass; no mathematical change. |
| rayLangCover_isTorsor | 𝔾_a, q=3 | translations by 0,1,2 preserve z³−z=t; derivative −1≠0 gives étaleness. | Pass; no mathematical change. |
| rayLangCover_equation | 𝔾_m,q=5,t=2 | equation z⁴=2; Frobenius z↦z⁵=2z, not z/2. | Pass; no mathematical change. |
| rayLangCover_frobenius | rational fibre over 2, q=5 | Frobenius translation is 2 for 𝔾_a, multiplication 2 for 𝔾_m. | Pass; no mathematical change. |
| rayLangCover_trivialKernel | ordinary ℙ¹ Jacobian 0 | kernel has 1 element and cover is identity; q=2 multiplicative q−1 cover is also identity. | Pass; no mathematical change. |
| ideleClasses_away_dense | ℙ¹ minus 0,∞; rational unit divisor | class [c]−[1] gives c in 𝔽_qˣ; for q=5 the value 2 generates all four multiplicative classes. | Pass; no mathematical change. |
| rayLangCover_artin | 𝔾_m,q=5,t=2 | local uniformizer gives arithmetic Frobenius multiplier 2; inverse convention gives 3. | Pass; no mathematical change. |
| rayLangCover_geometricallyConnected | nontrivial 𝔾_a Lang cover vs constant quadratic cover | geometric monodromy orders q versus 1; constant cover has 2 geometric components. | Pass; no mathematical change. |
| rayLangCover_forgetModulus | wild simple-pole cover, 2∞→∞ | conductor 2 exceeds 1, so the character does not descend, although both opens equal 𝔸¹. | Pass; multiplicity criterion corrected. |
| finiteRayLangCover | B=ℤ/4, θ=2deg | image order 2; number of connected components [B:image]=2, each a quadratic constant cover. | Pass; no mathematical change. |
| finiteRayLangCover_map | ℤ/4→ℤ/2 applied to θ=2deg | composite character is 0; resulting ℤ/2-torsor is the two-component trivial torsor. | Pass; no mathematical change. |
| finiteRayLangCover_generic | constant quadratic character | generic extension has degree 2; restriction to the normal open has the same generic Frobenius parity. | Pass; no mathematical change. |
| finiteRayLangCover_forgetModulus | constant character, m=2∞→0 | local conductors all 0, so both constructions yield the same constant quadratic cover. | Pass; no mathematical change. |
| finiteRayLangCover_choiceIndependent | degree splitting a→a+b at degree d=2 | geometric character term changes by −2θ(b), constant term by +2θ(b); total change=0. | Pass; no mathematical change. |
| finiteRayLangCover_classifies | B=0 and B=ℤ/2 on ℙ¹,m=0 | one trivial torsor for B=0; for B=ℤ/2, degree characters 0 and parity give disconnected trivial and connected constant covers. | Pass; no mathematical change. |
| finiteRayLangCover_normGroup | constant extension degree r=2 | norm subgroup degrees 2ℤ; quotient index 2 equals extension degree, versus incorrect degree-zero subgroup of infinite index. | Pass; no mathematical change. |
| finiteRayLangCover_connected | θ=0 and θ=parity into ℤ/2 | images have orders 1 and 2; component counts 2 and 1. | Pass; no mathematical change. |
| finiteRayLangCover_geometricallyConnected | constant parity vs simple-pole AS character | geometric images 0 versus full ℤ/p; geometric component counts 2 versus 1. | Pass; no mathematical change. |
| rayLangCover_conductor | z^(q−1)=t at q=2,3; yᵖ−y=t | least moduli 0, [0]+[∞], 2[∞]; tame Swan zero still permits conductor one. | Pass; no mathematical change. |
| rayLangCover_modulusFactor | AS yᵖ−y=t, m=2∞,m′=∞ | opens both 𝔸¹; cover extends to both opens, but conductor divisibility is 2≤1 false. | Pass; false equivalence replaced. |
| effectiveDivisorCount | ℙ¹/𝔽₂, degrees 0,1,2 | A₀=1,A₁=3,A₂=7; class counts in each degree are 1,1,1. | Pass; no mathematical change. |
| zeta | ℙ¹/𝔽₂ | coefficients 1,3,7; (1−T)(1−2T)=1−3T+2T², product coefficients 1,0,0. | Pass; no mathematical change. |
| placeCount | ℙ¹/𝔽₂, degrees 0,1,2 | counts 0,3,1; one degree-two place gives two extension points. | Pass; no mathematical change. |
| pointCount | same field, r=0,1,2 | total definition gives N₀=0 since divisors(0)=∅; N₁=3; N₂=3+2·1=5. | Pass; r≥1 retained in arithmetic statements. |
| Constant coefficient and effective degree zero | effective D, degree D=0 | positive weighted coefficients force all D_v=0; one empty divisor gives A₀=1, zeta constant=1. | Pass; duplicate/API Lean declarations removed. |
| zeta_eulerProduct | ℙ¹/𝔽₂ through degree 2 | three degree-one factors contribute 6 to A₂; one degree-two factor contributes 1; total 7=A₂. | Pass; headline added. |
| zeta_logDeriv | ℙ¹/𝔽₂, r=1,2 | 1·3=3·1; 2·7=3·3+5·1=14. | Pass; no mathematical change. |
| Rational-field count | q=2,r=1,2 | 3=2+1 and 5=4+1. | Pass; README-only Check, not a sorried headline. |
| pointCount_eq | one degree-two place, r=1,2 | constant extension rational contributions 0 and 2, matching d times its indicator d∣r. | Pass; no mathematical change. |
| Constant-extension point-count API | elliptic over 𝔽₅, extension degree 2 | N₁ over 𝔽₂₅=27=N₂ over 𝔽₅; N₁ over 𝔽₅=9 differs. | Pass; no mathematical change. |
| Möbius inversion API | ℙ¹/𝔽₂,r=2 | 2·B₂=2; N₂−N₁=5−3=2. | Pass; no mathematical change. |
| effectiveDivisorCount_eq | elliptic q=5,h=9,n=1,2 | 9 classes each contribute (5−1)/4=1 or (25−1)/4=6; totals 9 and 54. | Pass; no mathematical change. |
| effectiveDivisorCount_of_large | q=2,g=0,n=0; q=5,g=1,n=1,2 | 1·1=1·(2−1); 4·9=9·4=36; 4·54=9·24=216. | Pass; no mathematical change. |
| Large-degree boundary | g=1,n=0; g=0,n=0 | 2g≤n+1 is 2≤1 false in first case, 0≤1 true in second; natural exponent is 1 in second, no truncated negative exponent. | Pass; no mathematical change. |
| zeta_rationality | g=0,q=2; elliptic q=5,N₁=9 | P=1 has degree 0, leading 1, h=1; P=1+3T+5T² has degree 2, leading 5, P(1)=9. | Pass; no mathematical change. |
| Zeta functional equation | ℙ¹, q=2 | Z(1/(2T))=2T²/((1−T)(1−2T))=2T²Z(T). | Pass; no mathematical change. |
| Numerator reciprocal symmetry | elliptic q=5,g=1 | a₂=5·a₀=5; middle coefficient a₁=3 is unchanged; leading coefficient is 5, not 1. | Pass; no mathematical change. |
| zeta_eq_schemeZeta | ℙ¹/𝔽₂ | closed-point counts degrees 1,2 are 3,1 in both descriptions; numerator 1 on both sides. | Pass; no mathematical change. |
| Jacobian and root comparison | q=5 elliptic, a₁=3 | char polynomial X²+3X+5 reverses to 1+3T+5T²; discriminant −11<0, roots have modulus √5; h=9. | Pass; no mathematical change. |
| lPolynomial_constantExtension | q=5 elliptic, r=2 | (1+5T²)²−9T²=1+T²+25T⁴=L_extension(T²). | Pass; no mathematical change. |
| zeta_constantExtension | ℙ¹,q=2,r=2 | Z(T)Z(−T)=1/((1−T²)(1−4T²))=Z_extension(T²). | Pass; no mathematical change. |
| IsLPolynomialData | g=0; q=5,g=1,N₁=9 or 8 | P=1 passes at g=0; a₁=9−5−1=3 passes; wrong count 8 gives required a₁=2≠3. | Pass; no mathematical change. |
| IsLPolynomialData.unique | q=0,1,5 with g=1 and N₁=9 | forced (a₀,a₁,a₂) are (1,8,0),(1,7,1),(1,3,5); q=0,1 permit uniqueness though no finite-field interpretation. | Pass; no mathematical change. |
| lPolynomial_isLPolynomialData | elliptic over 𝔽₅ and 𝔽₂₅ | a₁=9−6=3 and 27−26=1; symmetry gives leading coefficients 5 and 25. | Pass; no mathematical change. |
| Two proved polynomial examples | P=1+3T+5T², N₁=9,8 | Newton r=1 gives 3=3 and contradiction 3=2; both elaborated proofs remain. | Pass; no mathematical change. |
| Perfect-complex characteristic series | rank-one a=2 over ℤ, in degrees 0,1 | series 1−2T and (1−2T)⁻¹; shift changes product exponent +1→−1. | Pass; bridge added. |
| Characteristic-series representative/lift independence | contractible [A→¹A] with identity map | termwise quotient (1−T)/(1−T)=1; its zero derived representative has determinant 1. | Pass; bridge added. |
| Characteristic-series base change | ℤ→𝔽₂, line with u=2 | 1−2T maps to 1, equal to series of the zero endomorphism on 𝔽₂. | Pass; bridge added. |
| Characteristic-series cohomology formula | [ℤ/4→²ℤ/4], identity | termwise quotient=1; both H⁰,H¹=ℤ/2 nonprojective, so no cohomology determinant is claimed. | Pass; bridge added. |
| localEulerFactorFinite | rank-one unramified Frobenius a and zero invariant space | factors 1−aT and 1; constant coefficients 1 and 1. | Pass; no mathematical change. |
| localEulerFactorFinite_field | rank one over 𝔽₅, a=2 | native inertia-invariant factor and finite-field extension both give 1−2T. | Pass; no mathematical change. |
| localEulerFactorFinite_unramified | trivial inertia on rank 2, diagonal Frobenius 1,2 | factor (1−T)(1−2T)=1−3T+2T². | Pass; no mathematical change. |
| localEulerFactorFinite_liftIndependent | two Frobenius lifts differing by inertia | on invariant rank-one space inertia acts by 1; both eigenvalues a·1=a, hence same 1−aT. | Pass; no mathematical change. |
| localEulerFactorFinite_constantCoeff | zero or rank-one invariant stalk | factors 1 and 1−aT each give 1 at T=0, permitting inversion. | Pass; no mathematical change. |
| lFunction_cohomological | constant rank-one 𝔽₃ sheaf on ℙ¹/𝔽₂ | H⁰ eigenvalue 1, H² eigenvalue 2; L=1/((1−T)(1−2T)) in 𝔽₃[[T]]. | Pass; no mathematical change. |
| lFunction_cohomological_projective | same sheaf | H¹=0 contributes determinant 1; H⁰,H² inverse factors reproduce the Euler product. | Pass; no mathematical change. |
| Finite-coefficient determinant discriminator | identity on ℓ-dimensional 𝔽ℓ-space | every power trace=ℓ=0; determinant=(1−T)^ℓ=1−T^ℓ≠1. | Pass; no mathematical change. |
| frobeniusPlaceCount | identity extension of 𝔽₂(t), degrees 1,2 | place counts 3 and 1; weighted counts 3 and 2 differ from point counts 3 and 5. | Pass; no mathematical change. |
| frobeniusPlaceCount_constant_congruence | constant quadratic extension, degree odd/even | identity Frobenius count=0 in odd degrees; all degree-two places have identity Frobenius. | Pass; no mathematical change. |
| degree_sensitive_chebotarev | identity 𝔽₂(t), r=2 | absolute error ∣2−5∣=3; bound 2·2+2=6, so 3≤6. | Pass; no mathematical change. |
| Earlier asymptotic comparison | constant quadratic extension, r even | N=1; main weight ∣C∣/∣N∣=1, while 1/∣G∣=1/2 is wrong; explicit error divided by q^r tends to 0. | Pass; supply direction corrected. |
| adelicPoints | 𝔾_a and 𝔾_m | point groups 𝔸 and 𝔸ˣ; Gm requires tracking both x and x⁻¹, unlike the additive subspace topology. | Pass; no mathematical change. |
| adelicPoints_restrictedProduct | 𝔾_m, standard integral model | local integral subgroup O_vˣ on both sides; a uniformizer at one place has valuation vector with one entry 1. | Pass; no mathematical change. |
| adelicPoints_diagonal_discrete | 𝔾_a over 𝔽₂(t) | constant diagonal elements intersect the integral adeles in 𝔽₂, two elements; shrinking at one place isolates 0. | Pass; no mathematical change. |
| adelicPoints_finite_stabilizer | GL₁, maximal integral level | stabilizer kˣ has q−1 elements; q=2 gives 1, q=3 gives 2. | Pass; no mathematical change. |
| adelicPoints_map | 𝔾_m squaring | uniformizer idele valuation 1 maps to valuation 2 at the same place; composition with identity leaves 2. | Pass; no mathematical change. |
| adelicPoints_locallyCompact | 𝔾_a, integral adeles | compact open ∏O_v has local finite quotients of sizes q_v; one-place q_v=2 quotient has 2 elements. | Pass; no mathematical change. |
| adelicPoints_prod | 𝔾_a×𝔾_m | at (0,1), additive identity and multiplicative identity map to (0,1); projection kernels have one coordinate fixed. | Pass; no mathematical change. |
| adelicPoints_Gm | 𝔽_q(t) | idele quotient has degree image ℤ, not a compact group; degree-one idele maps to 1. | Pass; no mathematical change. |
| adelicPoints_Ga | same field | 𝔸/K compact, quotient self-dual volume 1; degree map of ideles has no additive analogue. | Pass; no mathematical change. |
| automorphicFunctions | GL₁ on ℙ¹, degree-r Ξ, r=1,2 | quotient sizes 1,2; function modules R and R². | Pass; no mathematical change. |
| eval | two-point GL₁ quotient | evaluation of (a,b)+(c,d) at first point is a+c, sum of evaluations a and c. | Pass; no mathematical change. |
| levelChange | pullback of function (1,−1) | refining level repeats these values on fibres; nonzero value 1 persists, proving injectivity in this case. | Pass; no mathematical change. |
| heckeAction | GL₁, degree-two quotient, uniformizer | translation swaps coordinates; square acts as identity, matching addition 1+1=0 mod 2. | Pass; no mathematical change. |
| Automorphic baseChange | finite quotient with 2 points, ℚ→ℂ | ℚ²⊗ℂ=ℂ²; coordinate basis stays (1,0),(0,1). | Pass; no mathematical change. |
| gl1 | ℙ¹, Ξ degree 2 | Pic/2ℤ=ℤ/2, so two points and functions R², not functions on infinite ℤ. | Pass; no mathematical change. |
| Admissible central character | parity on ℤ/2, ℚ or ℤ/4 | (a,−a); constants force 2a=0; over ℚ a=0, over ℤ/4 a=2 works. | Pass; impossible rational-centre example replaced. |
| Complex GLₙ supplier comparison | GL₁, ℙ¹, Ξ degree 1 | both carriers are ℂ on one point, constant-term collection empty and Hecke translation=id. | Pass; earlier spaces imported, no return edge. |
| constantTerm | GL₂ constant function 1; zero function | normalized quotient integral values 1 and 0; no division by the total number of unequal double cosets. | Pass; no mathematical change. |
| constantTerm_linear | constants f=2,g=3 over ℚ | CT(f+g)=5=2+3=CT(f)+CT(g). | Pass; no mathematical change. |
| constantTerm_complex | constant 1 | finite weighted sum weights total 1; ordinary volume-one integral also 1. | Pass; no mathematical change. |
| constantTerm_refine | one coset split into two equal-mass pieces | 1=1/2+1/2; integral of a constant a remains a. | Pass; no mathematical change. |
| Nonabelian unipotent weights | Heisenberg p=2,3, Γ=J order p | stabilizer orders p and 1 give weights 1/p² and 1/p: 1/4,1/2 or 1/9,1/3. | Pass; no mathematical change. |
| cuspFunctions | torus versus constant GL₂ function | torus has zero proper constant terms, so R survives; GL₂ constant 1 has Borel CT=1≠0. | Pass; no mathematical change. |
| mem_cuspFunctions_iff | GL₂ zero and constant functions | all maximal CT of 0 equal 0; constant 1 fails Borel condition with value 1. | Pass; no mathematical change. |
| cuspFunctions_hecke | GL₁ on one-point quotient | all functions cuspidal and uniformizer operator is identity; zero remains zero. | Pass; no mathematical change. |
| Function-field reduction covering | GL₁ and split GL₂ | GL₁ modulo full centre gives one point; root height of diag(π^a,1) is −a, not +a. | Pass; missing target supplied locally. |
| Reduction root compactness criterion | GL₂, c₁=−2,c₂=1 | allowed integral a satisfy −1≤a≤2, four values; removing upper root bound permits infinitely many a. | Pass; bounds stated. |
| Reduction anisotropic case | anisotropic semisimple group; torus | number of proper rational parabolics=0; no root inequalities; torus quotient modulo centre has exactly one point. | Pass; empty-root case retained. |
| Reduction finite volume | GL₁ modulo full centre | quotient point has finite normalized volume 1; without central/degree restriction the ℤ quotient has infinite counting volume. | Pass; finite-volume target stated. |
| cuspFunctions_compactSupport | GL₁ maximal level and degree-one Ξ | finite support set size h; for ℙ¹ h=1; without Ξ the independent indicators run over all integers. | Pass; no mathematical change. |
| Cusp-module flat base change | GL₁, h=1, ℤ[1/p]→ℚ | rank-one module tensor ℚ=ℚ; for equation ℓx=0, reduction mod ℓ changes kernel 0 to 𝔽ℓ and is excluded. | Pass; moved after finite support. |
| cuspFunctions_integralModel | GL₁ on ℙ¹, R=ℤ[1/p], C=ℂ | R⊗ℂ=ℂ, one-dimensional on both sides. | Pass; no mathematical change. |
| heckeEigenvalue_algebraic | GL₁ quotient ℤ/2, uniformizer swap | characteristic polynomial X²−1; eigenvalues +1,−1 are algebraic. No transcendental central character is introduced. | Pass; no mathematical change. |
| heckeAction_unramified_cusp | GL₂ h at q_v=2 | raw Satake 2X₁+X₂; constant-function eigenvalue 3=2+1. | Pass; no mathematical change. |
| normalizedConstantTerm | GL₂, constant 1, m=diag(π,1),q=2 | δ(m)=1/2; normalized CT(m)=√2, whereas raw CT(m)=1. | Pass; no mathematical change. |
| normalizedConstantTerm_hecke | same h and normalized constant term | √2(√2+1/√2)=3; applying normalized Satake to raw constant gives 2√2≠3. | Pass; no mathematical change. |
| normalizedConstantTerm_one | g=1 | δ(1)=1; normalized and raw constant terms both equal 1 on f=1. | Pass; no mathematical change. |
| normalizedConstantTerm_rightTranslate | f=1,l=1,m=diag(π,1),q=2 | left side 1; right side δ(m)^1/2·CTnorm(m)=(1/√2)√2=1. | Pass; no mathematical change. |
| normalizedConstantTerm_transitive | GL₃, Q=B⊂P=(2,1), m=diag(π,1,1),q=2 | δ_B=1/4=δ_P·δ_{B∩M}=(1/2)(1/2); square-root normalizations multiply to 2. | Pass; no mathematical change. |
| satake_gl1_reciprocity | degree-two place, χ=λ^deg | eigenvalue λ²; arithmetic reciprocity image φ²; geometric parameter gives inverse λ⁻². | Pass; no mathematical change. |
| cuspForm_exists_degreeZero_ne_zero | n=1; n=2,g=2 | shift 0 for n=1; for n=2 Yu determinant degree 2 plus scalar correction −2 gives 0; old sign gives 4. | Pass; no mathematical change. |
| Unitary global versus local hypotheses | q=3 global; q_v=2 local density | global p≠2 excludes q=2 Eisenstein application; §7.4 still gives split density 1+T over 𝔽₂. | Pass; settings separated mathematically. |
| Unramified extension criterion | even n; elliptic odd n counterexample | η^even=1 kills kernel; for odd n the kernel divisor P−O evaluates to −1≠1. | Pass; false existence replaced. |
| Arithmetic obstruction evaluation | elliptic E/𝔽₃, D=P−O | O fibre has two rational points, η(O)=+1; P fibre x²+2x+2 has no 𝔽₃ root, η(P)=−1; η(D)=−1. | Pass; arithmetic rather than geometric pairing. |
| Elliptic cover isogeny identity | A=x²+2x+2, clear denominator x⁴ | both cubic numerators have coefficients (0,2,2,2,1,1,2,1) modulo 3; kernel points O,P give degree 2. | Pass; witness verified directly. |
| Elliptic pullback divisor | div x=2P−2O; div y=P+Q+R−3O | div(y/x)=Q+R−P−O=ν*(P−O), while η(P−O)=−1. | Pass; nontrivial kernel obstruction. |
| Constant-cover inducing character | degree d=1 inert and d=2 split | χ of pullback has parity (−1)^1=−1 and (−1)^(1+1)=+1, agreeing with η. | Pass; exact-constant degree retained. |
| Finite-ramification character existence | split cover and obstructed elliptic cover | split (χ₀,χ₀⁻¹) restricts to 1; elliptic odd n requires S nonempty, while its required restricted value at D remains −1. | Pass; closed-image/open-kernel construction stated. |
| Inducing-character choice API | two extensions χ,χ′; even n | ratio restricts to η^n/η^n=1; even n permits χ=1 and conductor exponents all 0. | Pass; characters remain choices. |
| Unitary Levi discrete decomposition | torus on ℙ¹, degree-one central quotient | L² of one point=ℂ, discrete multiplicity 1 and no continuous term; determinant character on GL₂ has CT=1, hence is not cuspidal. | Pass; residual input assigned. |
| Cuspidal Eisenstein continuation | torus P=G; split rank-one Borel | identity intertwiner, D=1 on torus; Borel Weyl constant term has two terms with exponents s and −s, not one. | Pass; general parabolics and parameter domains stated. |
| Discrete-data continuation | unitary determinant character on GL₂ | unipotent integral of character=1, so cusp-only input fails; residual discrete input has dimension one modulo its central character. | Pass; continuation input added. |
| Intertwining composition and pole domain | identity Weyl element and a regular z | M(1,z)=id; product id·id=id, denominator 1; when D(z)=0 no pointwise equality is asserted. | Pass; sources/targets and pole exclusions stated. |
| I_n | n=0 and split n=1, χ=1 | I₀ is the one-dimensional trivial datum; at m(π,1) rank-one section value q^(−s−1/2). | Pass; finite ramification allowed. |
| sphericalSection | χ unramified; χ_v nontrivial on a unit | Φ(1)=1 for spherical datum; in ramified case K-invariance forces Φ(1)=χ_v(u)Φ(1), so no nonzero spherical normalization exists. | Pass; unramified hypothesis explicit. |
| Congruence-level sections | support PkU, χ trivial on P∩kUk⁻¹ | two representatives differing by that intersection give multiplier 1 and the same value 1 at k; nontrivial multiplier forbids the section. | Pass; actual ramified sections constructed. |
| siegelEisenstein | n=0; scalar multiple 2Φ | one coset gives E=1 at n=0; linearity gives E(2Φ)=2E(Φ). | Pass; no mathematical change. |
| leviDetCharacter_discrete | unitary trivial character, n=1,2 | n=1 torus is cuspidal; n=2 constant unipotent integral is 1, so discrete datum is residual. | Pass; dependencies explicit. |
| siegelEisenstein_converges | n=1, unitary χ | positive half-plane Re s>1/2; at n=0 single term 1 converges everywhere, so bound is sufficient rather than necessary. | Pass; no mathematical change. |
| siegelEisenstein_rational | n=0; torus continuation | constant rational function 1, denominator 1; period substitution q^(−(s+2πi/log q))=q^(−s). | Pass; no mathematical change. |
| section_one | spherical section and rescaling 2Φ | values 1 and 2 at identity; only first meets the normalization. | Pass; no mathematical change. |
| section_parabolic | split rank 1, α=(π,1), b=0,χ=1 | norm q⁻¹ gives multiplier q^(−s−1/2), agreeing with normalized induction δ^1/2 q^(−s). | Pass; no mathematical change. |
| section_unipotent | spherical Φ and general zero section | values Φ(n(b))=1 and 0 respectively, matching Φ(1). | Pass; general and spherical values distinguished. |
| siegelEisenstein_leftInvariant | γ₀∈H(F), n=0 or reindexed cosets | n=0 gives 1=1; coset map γ↦γγ₀ is bijective, so every summand appears once. | Pass; no mathematical change. |
| section_degree | split rank 1, α=(π,1), base degree 1 | Yu degree −1; q^(−1·(s+1/2)) matches norm multiplier q^(−s−1/2). | Pass; no mathematical change. |
| Induction normalization Check | split n=1,q=4,s=0 | normalized δ^1/2=1/2; unnormalized q⁻¹/²=1/2. | Pass; claimed difference removed. |
| Hermitian residue duality | rank 1, rational T=1, b rational | global sum of residues is 0, so character is 1 on N(F); adelic nonrational indices need not give a quotient character. | Pass; no mathematical change. |
| fourierCoefficient | n=1,T=0 | character equals 1; coefficient is the full constant term with s and −s exponents, not a single Whittaker factor. | Pass; no mathematical change. |
| localWhittaker | zero section; section scaled by 2 | integrals 0 and twice the original integral, at every convergence parameter. | Pass; no mathematical change. |
| fourierExpansion | n=0; rank-one constant term | rank-zero Hermitian index set has one element 0, E=E₀=1; singular rank-one index contributes both constant exponents. | Pass; no mathematical change. |
| fourierCoefficient_rationalLevi | rational α=1 and α∈F′ˣ | α=1 gives E_T=E_T; product norm of any rational determinant=1, χ on it=1. | Pass; no mathematical change. |
| whittaker_levi | split n=1, α=(π,1),χ=1 | after Weyl conjugation the section multiplier is q^(s+1/2), and the Jacobian is q⁻¹; their product q^(s−1/2) equals norm^(−s+1/2); T changes to ᵗᾱTα. | Pass; no mathematical change. |
| fourierCoefficient_factor | g_X=0,1,n=1 | measure prefactors q and 1; T=0 excluded from nonsingular factorization. | Pass; no mathematical change. |
| Ramified local Fourier factor | Φ_v=0,2Φ_v; unramified q_v=3 split unit line at s=0 | values 0,2𝓦_v and 1−1/3=2/3 in the spherical specialization. | Pass; local section dependence retained. |
| Ramified-factor level refinement | same Φ_v at U′⊂U | integrand unchanged, so 𝓦_v(U′,Φ_v)=𝓦_v(U,Φ_v); zero section gives 0=0. | Pass; common rational denominator applies to level space. |
| hermitianDensity | rank-zero; target rank smaller than source | one representation and exponent 0 give density 1; m<n branch gives 0. | Pass; no mathematical change. |
| Split cross-dual lattice | L=(O,πO) | L∨=(π⁻¹O,O), quotient component lengths 1,1; half-length total/2=1, not 2. | Pass; no mathematical change. |
| densityPolynomial | a=0,1,2, q=2, split/inert | 1; 1−T; split (1−T)(1−2T), inert (1−T)(1+2T). | Pass; no mathematical change. |
| densityType | rank-one Gram π and self-dual lattice | torsion type 1 and 0; split full type 2 halves to 1. | Pass; no mathematical change. |
| densityHalfLength | split L′=(O,O) over L=(O,πO) | total length 1, half-length 1/2; exponent 2·half-length=1. | Pass; no mathematical change. |
| Self-dual density denominator | n=1,j=0,q=2,η=±1 | denominators 1−1/2=1/2 and 1+1/2=3/2, both nonzero; q=1 is excluded by local-field residue size≥2. | Pass; no mathematical change. |
| hermitianDensity_split interpolation | rank-one Gram π,q=2,j=0 | split polynomial 1+T at T=1 gives 2; density=(1/2)·2=1; inert 1−T at T=1 gives 0 and density 0. | Pass; all characteristics retained. |
| Cho–Yamauchi overlattice formula | split rank one L=(O,πO) | L term 1−T; two self-dual overlattices each contribute T; total 1+T. | Pass; no mathematical change. |
| den_selfDual | L=L∨ | one overlattice term T⁰m(0;T)=1. | Pass; no mathematical change. |
| den_depends_on_torsion | self-dual lattices rank 0 and 1 | torsion modules both 0, polynomials both 1 despite different ranks. | Pass; no mathematical change. |
| den_functionalEquation | rank-one valuation 1, split/inert | split T(1+1/T)=1+T; inert −T(1−1/T)=1−T. | Pass; no mathematical change. |
| Equal-characteristic-two density extension | trace 𝔽₄→𝔽₂ and rank zero | trace values 0,0,1,1 prove surjectivity; empty-dimensional representation has one point and density 1. | Pass; no division by two. |
| whittaker_eq_density | self-dual rank one, q=3,s=0, split/inert | Den=1; W=1−η/3=2/3 or 4/3. | Pass; odd-characteristic global application and unramified χ_v explicit. |
| Whittaker interpolation parameter | s=j=1,rank n=1 | source rank n+2j=3; polynomial argument q⁻²; q⁻¹ would describe wrong source rank 2. | Pass; no mathematical change. |
| Global density product | one nonsplit place degree 2, rank-one valuation 1 | local polynomial 1−T becomes 1−T²; replacing T² by T gives a different coefficient at degree 1. | Pass; no mathematical change. |
| fyz_globalCoefficient | n=1,g_X=0,deg E=0,self-dual | χ(det E)·q·L₁(s)⁻¹; g_X=1 instead gives χ(det E)·L₁(s)⁻¹. | Pass; chosen unramified character required. |
| Canonical dual and original-field degree | constant quadratic cover, line of exact-constant degree 1 | base-field degree=2; norm q²; using degree 1 would produce q instead of q². | Pass; no mathematical change. |
| General coefficient formula with level data | S=∅; α=1; one bad section doubled | empty S recovers spherical product; α=1 character/norm=1; section doubling multiplies both sides by 2. | Pass; all covers retained with level data. |
| Enlargement of bad set | move one good spherical place into S | factor L_v⁻¹Den_v is replaced by W_v equal to it; ratio of new and old total products=1. | Pass; choice of S immaterial. |
| Ramified change of frame | χ_v(u)≠1 for a unit frame change | character multiplier χ_v(u) is canceled by the contragredient local section/factor change; unframed χ(det E) alone changes. | Pass; framed adelic data retained. |
| Worked example 1 | ℙ¹/𝔽₂,dt,m=0,1 | N₁=3,N₂=5; A₁=3,A₂=7; integral volume 2; dim L(0)=1,dim L(∞)=2. | Pass; no mathematical change. |
| Worked example 2 | y²=x³+x+1 over 𝔽₅ | fibres 2,0,2,2,2 plus O give 9; discriminant −496≡4; h=1+3+5=9. | Pass; no mathematical change. |
| Worked example 3 | same curve over 𝔽₂₅ | 13 fibres of size 2 and 12 of size 0 give 26+1=27; L=1+T+25T², h=27. | Pass; no mathematical change. |
| Worked example 4 | y³−y=t⁻² over 𝔽₃ | 1 ramified point plus 3 over infinity gives 4; different 6 gives genus 1; L=1+3T²; orders of y,z at O are −2,−3. | Pass; no mathematical change. |


## Elaborated signatures and final outcomes

A scratch file containing the final module and one `#check @name` for every named declaration was elaborated from the content checkout. All fifteen resulting signatures were compared with the README. The one binder repair is explicit characteristic p on artinSchreierWitt and aswQuotient; their final signatures each retain exactly one CharP instance. The final file itself was independently elaborated with the prescribed command from the content checkout. Both elaborations exit 0, with eight sorry warnings and no other diagnostic.

| Declaration | Retained binders and statement comparison |
|---|---|
| exists_divisor_degree_eq_one | k,F fields and algebra; Finite k; explicit IsFunctionField and exact constants; conclusion degree 1. |
| artinSchreierWitt | p prime, F field, explicit CharP F p; actual additive Frobenius-minus-identity map. |
| aswQuotient | Same field/prime/characteristic binders and natural n; quotient by range plus truncation kernel. |
| artinSchreierWitt_galois | Same binders and n; underlying additive equivalence with continuous absolute-Galois characters into ℤ/pⁿ. |
| effectiveDivisorCount | k,F fields and algebra, natural n; no finiteness/exactness silently assumed in this total counting definition. |
| zeta | Same field/algebra binders; actual integer series of effective divisor counts. |
| placeCount | Same field/algebra binders and natural degree; no hidden finite-instance requirement. |
| pointCount | Same field/algebra binders and natural r; divisor-weighted count, including total-function value 0 at r=0. |
| zeta_eulerProduct | Finite k, explicit function-field and exact-constant hypotheses; HasProd with the scoped coefficient topology. |
| zeta_logDeriv | Same arithmetic hypotheses; explicit r>0; integer coefficient recurrence. |
| effectiveDivisorCount_of_large | Same arithmetic hypotheses; explicit 2g≤n+1, exactly n>2g−2 in this natural indexing. |
| zeta_rationality | Same arithmetic hypotheses; polynomial equality, degree, leading/linear/constant coefficients, reciprocity and class number. |
| IsLPolynomialData | Natural q,g, integer count function and integer polynomial; concrete conjunction, no hidden arithmetic hypotheses. |
| IsLPolynomialData.unique | Two instances of the concrete predicate with the same q,g,N; equality of the two polynomials. |
| lPolynomial_isLPolynomialData | Finite exact constants, explicit function-field hypothesis, polynomial and its actual zeta numerator equation. |

Final validation: targeted prerequisite build successful; direct Lean elaboration exit 0; all-signature elaboration exit 0; source check exit 0 with zero problems; dependency check exit 0 with zero problems; existing text gate scan reports every count zero, including readme-ids-missing=0; git diff --check exits 0. No running build or elaboration was left behind.

## Maintainer consequences

No external roadmap, order file, metadata or design plan was edited. There are no newly requested supplier gaps. Earlier roadmaps supply their own statements; this package no longer claims they consume its Layer 5 or Layer 6.

The false README label exists_unramified_inducingCharacter is replaced by the obstruction criterion and finite-ramification theory. Its spherical applications require a chosen unramified character. Consumers using arbitrary covers must retain the ramified sections and level data. The generic determinant-line supplier is PadicMeasuresIwasawaAlgebras §5.1.

The duplicate Lean degree-surjectivity theorem, effectiveDivisorCount_zero and pointCount_ratFunc leave Suggested.lean; their mathematical content is retained as README consequences and Checks. The added Lean headline names are zeta_eulerProduct and artinSchreierWitt_galois. README-only API labels do not promise compiled declarations. No claim of final acceptance is made: the fresh independent review follows this repair.
