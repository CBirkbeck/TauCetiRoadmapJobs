# Review of HigherHidaAndColemanTheory (package, round 2)

**Verdict:** needs changes

Seven findings: two P1, four P2 and one P3. The package is repairable. No package source file was edited. All four source texts were readable; the mathematical findings below are not requests for unavailable references.

## R01 (P2) — Support shrinking lacks the cross-containment hypotheses

**Location:** `packages/HigherHidaAndColemanTheory/README.md:452`: “Shrinking admissible support pairs induces ordinary equivalences.” The same paragraph invokes the strict/compact bridge using only its coefficient factorization.

**Claim:** Compact dynamics and shrinking supports suffice for ordinary invariance; the stated factorization suffices for the bridge. “Admissible” is not defined here by the hypotheses needed for either assertion.

**Witness:** BP-Hida line 1576, Proposition 2.10.4, pp. 30–31, requires cross-containments between the two pairs. BP-Hida line 1637, preceding Theorem 2.11.4, pp. 31–32, additionally specifies three nested pairs and strict inequalities.

Explicit test: take Xbar=Cbar=Spec(𝔽₂) ⊔ Spec(𝔽₂), both projections and the coefficient map identity, F=O. Take D−=D′−=∅, D+=∅ and D′+={a}. Both pairs are compact dynamical, and D+⊆int(D′+). Their ordinary complexes have H⁰ of dimensions 2 and 1. Restriction cannot be an equivalence. The missing condition p1*D+⊇p2*D′+ reads ∅⊇{a}, which fails.

**Repair:** State the support-change hypotheses explicitly: D±⊆int(D′±), p1*D+⊇p2*D′+, p2*D−⊇p1*D′−, together with the coefficient-map domain. For the bridge, give the three pairs, D″±⊆int(D′±)⊆D′±⊆int(D±), the strict inequalities on C″, the two cross-containments of BP-Hida line 1651, locally principal D± and D″±, coherent F″, and the factorization and divisor maps of lines 1678–1686. Keep the conclusion at that generality. Add the two-point counterexample as a negative Check. The repaired support condition rejects it; equal pairs on the same example give the identity on 𝔽₂².

## R02 (P1) — The allowed-tube definition changes both depth and closure

**Location:** `packages/HigherHidaAndColemanTheory/README.md:768`: “−1 denotes the one-sided unbounded tube”; lines 778–785 also use undecorated B for the purported closed standard supports. The notation is reused at line 964 and in source issue E5.

**Claim:** The displayed plain B(r,s) inclusions and the proposed standard pairs are Definition 5.4.10 of BP-Coleman.

**Witness:** BP-Coleman line 1904, Definition 3.3.10, p. 40, uses −∞ for unbounded depth. Definition 5.4.10, pp. 111–112, uses finite depth −1 and partially closed tubes. PDF inspection confirms the overlines lost by extraction.

At p=3, depth −1 permits a root coordinate of absolute value at most 3 (or strictly less for the open-root factor). The point z=1/9 has absolute value 9 and is excluded, but belongs to the unbounded tube. At p=2 the corresponding values are 2 and 4. Closures matter independently: the quasi-compact unit disc is open in the adic line; its closure adds the outward rank-two specialization of its Gauss point (BP-Coleman lines 1890–1901). The plain disc omits that point while its closure contains it. Thus the closed-support Check does not hold with the definition as written.

**Repair:** Define the four tube variants of Definition 3.3.10, explicitly recording which root factors are closed. Retain −1 as a finite depth, reserving −∞ for the unbounded variant. With bars meaning those partial closures, the positive inequalities are B(m,bar(n+s))⊆Z∩U⊆B(0,bar(Cn)) and B(m+s,bar(n))⊆U⊆B(Cm,−1). The negative inequalities are B(bar(m+s),n)⊆Z∩U⊆B(bar(Cm),0) and B(bar(m),n+s)⊆U⊆B(−1,Cn), with m,n,s nonnegative integers. The standard closed Z's use both barred indices: B(bar(0),bar(s)) and B(bar(s),bar(0)). Propagate the distinction to §6.2 and E5. Add both the p=2/3 finite-radius test and the rank-two specialization test. They distinguish the corrected definition from both wrong models; do not replace the source's −1 by −∞.

## R03 (P1) — Klingen BGG equivariance has the opposite slope shift

**Location:** `packages/HigherHidaAndColemanTheory/README.md:1396`: “U on the middle term intertwined with p^(−k−1)U on the last.” Its claimed consequences have thresholds k−2 and k+1; §§9.7–9.8 use them.

**Claim:** That equivariance, together with §9.6(1), yields the stated classicality ranges.

**Witness:** Pilloni-Singular lines 4043–4045 give lower bounds −3 and 0. The diagram at line 4133, Proposition 13.3.3.1, printed p. 90, prints the same negative exponent; the following corollary prints the positive thresholds. The PDF was inspected.

The package's own rescaling convention sends slope s to s−k−1. Therefore the displayed third-term lower bounds are −k−4 and −k−1, not k−2 and k+1. For k=0 they are (−4,−1), versus the required (−2,1); for k=3 they are (−7,−4), versus (1,4). The contracting-coordinate model also fixes the direction: for U(f)(z)=f(pz) and the BGG differential D^(k+1), D^(k+1)U=p^(k+1)UD^(k+1). For p=3,k=0,f=z, the two sides with the printed factor are 3 and 1/3.

**Repair:** Correct the equivariance to p^(k+1)U on the last term (equivalently put p^(−k−1) on the source operator). Explain this with the coefficient and trace normalization of Pilloni-Singular §13.2.3, p. 87, and the contracting flag coordinate of lines 3972–3974. Record the source diagram's sign slip. Add the explicit differential test and the shifted lower bounds; the corrected test gives 3=3 and bounds k−2,k+1. Keep the strict endpoints in §§9.6–9.8. Do not weaken the desired classicality theorem to accommodate the erroneous diagram.

## R04 (P2) — A spectral-point fibre is not a generalized eigenblock

**Location:** `packages/HigherHidaAndColemanTheory/README.md:1394`: “whose fibre at (κ,α⁻¹) has H^i equal to H^i_cusp(†,κ,2)[U=α].”

**Claim:** Pulling the coherent complex back to a point of weight space times G_m directly gives the eigenspace cohomology, without distinguishing weight specialization, spectral localization and residue-field tensor.

**Witness:** `TauCetiRoadmap/PadicFamilies/README.md:1687`, §2a.17, at pull request #1019, distinguishes localization after weight specialization from the residue fibre. Its Jordan-block Check at line 1707 gives dimensions 2 and 1. Pilloni-Singular line 4172 has the ambiguous fibre formula.

Let F=ℚ₃, R=F[X,X⁻¹], y=X−1, and M=R/(y²) in degree zero, with spectral coordinate X acting as U⁻¹. The generalized U=1 block is M, of dimension 2; the residue fibre M/yM has dimension 1. If “fibre” is derived over the ambient R, even M=R/(y) gives F in degrees −1 and 0, while the original eigenblock has only H⁰=F. If ordinary eigenspaces and underived termwise pullback were intended instead, use [R/(y) → R/(y²)] in degrees 0,1, mapping 1 to y. Its H⁰ is 0, but its termwise residue fibre is [F →⁰ F], with H⁰=F. None of these interpretations validates the unqualified formula.

**Repair:** State specialization as derived tensor of a finite slope complex over the weight affinoid with k(κ), followed by localization at the spectral maximal ideal, retaining the full generalized α-primary component. Define the eigenblock notation. Treat residue fibres separately using the relevant Tor sequence, as §6.4 already does. Cite PadicFamilies §2a.17 for the distinction, alongside its complex slope infrastructure §§2a.15–2a.16. The corrected operations retain dimension 2 for the Jordan block, have no extra spectral-coordinate Tor for F[0], and retain H⁰=0 in the two-term test. Record the interpretive gap in the source.

## R05 (P2) — Individual Hecke endomorphisms do not supply the algebra action

**Location:** `packages/HigherHidaAndColemanTheory/README.md:709`: “the commuting prime-to-p spherical Hecke algebra in End_(D(Λ))(M_w^ε)”; its Needs line 713 cites AutomorphicBundlesPartII §3.13. The same input is used in §7.1, line 1110.

**Claim:** The cited operators give the commuting Hecke algebra action needed for the finite image and its relative spectrum, for all genera and the supported tower levels.

**Witness:** `TauCetiRoadmap/AutomorphicBundlesPartII/README.md:738`, pull request #1823, explicitly supplies individual endomorphisms only. Its §5.13, line 1106, supplies convolution only for Hilbert–Siegel GSp₄ at hyperspecial p-level, excluding arbitrary p-level integral relations.

AutomorphicBundles §12.11, at pull request #1069, line 4928, concerns H⁰ sections. The present §3.2 proves the positive torus composition law, not the away-p spherical convolution law on the supported ordinary complexes. The partial-support gap supplies the action of a correspondence, not the geometric Hecke relations. IntegralHeckeAndGaloisDeterminants §2.1 assumes an algebra action when taking its image. As a separating test, put C=𝔽₂² in degree 1 and let two individual operators be E₁₂,E₂₁. Both are derived endomorphisms and have identical zero H⁰ action, but their products are diag(1,0) and diag(0,1). Thus degree-zero compatibility and existence of operators do not imply commutativity in higher degrees. Generic-fibre agreement also cannot detect a nonzero endomorphism of a p-torsion complex.

**Repair:** Add an explicit higher supported Hecke-action target before these uses: at each stated genus, finite coefficient and tower level, prove the away-S double-coset convolution relations, compatibility with partial-support changes, boundary variants, ordinary localization and tower transition maps; then transport the action to M_w and the Coleman family cohomology. Give the correspondence-composition/base-change and integral detection inputs. Cite the supplier's §5.13 for its actual hyperspecial GSp₄ case without extending its scope silently. This is an application/extension target, not a second construction of generic correspondences or the abstract Hecke ring. The repaired contract must exclude the E₁₂,E₂₁ assignment by the explicit commuting spherical relation. Retest on an H¹-only complex and modulo p, not merely H⁰ or after inverting p.

## R06 (P2) — The repaired solid-operation import exceeds its supplier

**Location:** `packages/HigherHidaAndColemanTheory/README.md:347`: “its fully faithful discrete quasi-coherent derived subcategory”; the same paragraph transports q! through an unspecified compactification.

**Claim:** AutomorphicBundlesPartII §3.0a supplies this unrestricted quasi-coherent comparison, and its upper-shriek comparison applies to the selected compactification without further verification.

**Witness:** `TauCetiRoadmap/AutomorphicBundlesPartII/README.md:455`, pull request #1823, supplies the discrete functor on bounded coherent complexes and a proper bounded-perfect comparison under finite-Tor and pseudo-coherence hypotheses. It does not state the unrestricted assertion imported here.

The distinction is substantive: for A=𝔽₂[t], the discrete quasi-coherent module A[t⁻¹] is not finite over A. Any finite set of generators has pole orders bounded by some N, and cannot generate t^(−N−1). It therefore lies outside the supplier's bounded coherent input, while the README's phrase includes it; it also occurs in this section's open-localization Check. Moreover, smoothness of q on X alone does not assert finite Tor dimension for every compactification of q.

**Repair:** Describe the consumed discrete comparison exactly in its supplied bounded coherent/perfect regime. Retain solid open restriction/pushforward as operations without asserting a new comparison theorem on all quasi-coherent complexes. For q!A, give a route that verifies the comparison hypotheses: work locally through an étale map to affine d-space, use the open immersion into projective d-space and its smooth proper structural morphism, and make étale-local compatibility an explicit part of this Artinian purity target before gluing. Verify finite-Tor and pseudo-coherence at each comparison. Alternatively declare the precise missing extension as a supplier contract if the larger assertion is needed. On q:𝔸²_(𝔽₂)→Spec 𝔽₂ this route uses smooth proper ℙ² and gives the rank-one Ω²[2]; the noncoherent localization is no longer incorrectly an input to the bounded coherent comparison. The ownership repair of F01 remains valid; its residual import must be narrowed.

## R07 (P3) — Pinned-library line locators are stale

**Location:** `packages/HigherHidaAndColemanTheory/README.md:49`: the Mathlib declaration locators, including “Basic.lean:399” for `zpow_sub₀` and “line 42” for the condensed-module abelian instance.

**Claim:** Those lines locate the named declarations at the supplied pin.

**Witness:** `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:399` is `inv_pow_sub_of_lt`; `zpow_sub₀` starts at line 402. `Mathlib/Condensed/Module.lean:43` is the abelian instance; line 42 is blank.

**Repair:** Update the contract to `Module.End` at `Mathlib/Algebra/Module/LinearMap/End.lean:33`, `zpow_sub₀` at line 402 of its cited file, `CondensedMod` at `Mathlib/Condensed/Module.lean:41` and its instance at line 43. Keep `DerivedCategory:87` and `CondensedMod.IsSolid:83`, which match. Opening the corrected coordinates gives the named declarations and the hypotheses quoted in the contract. This is a locator repair, not a missing-library-result finding.

## Verified sound

### Previous findings, checked individually

| Previous finding | Repaired passage in the present README | Assessment |
|---|---|---|
| F01, duplicate solid operations | Line 17: “AutomorphicBundlesPartII §3.0a owns the solid six operations on schemes”; line 347: “Prove two statements specific to this coefficient setting.” | Ownership repaired. The boundedness and comparison scope left in the replacement passage is partly repaired overall: see R06. No second owner of the six operations remains. |
| F02, redundant supplier gaps | Line 109 specifies “the two partial-support objects K+−(F) … and K−+(F)”; lines 95–107 import group-ring models and PEL vanishing. | Repaired. The two redundant slugs are absent from both README and plan; the correspondence gap is narrowed to the residual two-support construction. |
| F03, stale supplier identifiers | Line 107: “§5.2: Toroidal-to-minimal relative vanishing”; line 212: “§2.7: Compact character spaces”. | Repaired in the reviewed citations: the current section headings were resolved at main/heads, including all renamed AutomorphicBundles and ShimuraCompactifications references. |
| F04, topological versus solid interior | Line 365: “interiors, taken in the underlying topological space of Cbar”; line 452: “the topological ones of §2.2”. | Repaired. The Frobenius/irreducibility Check is correct. R01 concerns additional support-change hypotheses, not this repaired distinction. |
| F05, undeclared own backticked name | Line 806: “For K_(p,m,b), changing m with b fixed”. | Repaired. No own backticked declaration remains; the remaining declaration names are imported Mathlib names. |

The repaired patterns were searched throughout the package. No removed gap token, old B/IC/C supplier label, or claim that compactness is defined in a solid locale remains in the README. None of these findings was marked “not actionable” by the repair report.

### Principles, shape and acceptance file

The scope extends PadicFamilies as Part II and identifies where its parent stops. It retains all-genus Siegel theory, p=2 cofinal levels, singular chambers, nonordinary finite slopes and locally quasi-split abelian-type Coleman data. The split-unitary example is an application, not a replacement for that generality. The text has no computational algorithm, copied source passage, route-specific prime restriction, or upward supplier dependency. The nine layers are named by their mathematics; their major order is forced by the stated dependencies, not justified by a source's chapter sequence.

Read all 66 numbered target sections, their Needs lines, API bullets and Checks, with renewed attention to every edited passage. There are 22 explicit definition/API blocks, each with at least three Check bullets, and nine Examples/Dependencies layer endings. These counts are structural evidence, not proof of the mathematics; R01–R06 identify the substantive failures. House shape was compared with the main-branch AdicSpacesPartIII, PadicMeasuresIwasawaAlgebras and ResolutionOfSingularitiesCharacteristicZero roadmaps. The package has no process links, machine paths, forbidden Lean options, sorry'd data, or own-name API catalogue.

`Suggested.lean` has one `import Mathlib`, one module docstring and the correct empty namespace. Elaboration with the requested `lake env lean` command, from the pinned content checkout and with the absolute input path, exited 0 with no output and no warnings. There are **zero named declarations and zero sorried theorems**. Accordingly the exhaustive one-tactic probe set and the own-declaration `#check @name` set are empty; no probe was represented as a successful proof. No Tau Ceti module build was needed. Elaboration does not certify any README theorem.

The ten explicit headlines at README line 275 are all named in the module docstring, with missing geometric carriers:

| Headline | README | Missing carrier at the pins |
|---|---|---|
| Derived arithmetic Hida control | 4.6 | Supported ordinary Igusa complex and its universal Iwasawa realization |
| Integral Iwasawa Serre duality | 4.8 | Same complexes, geometric transposition and coefficient duality |
| Integral amplitude, genera 1 and 2 | 4.9 | Geometric universal ordinary complex |
| Rational amplitude, every genus | 8.4 | That complex and analytic comparison family |
| Regular/singular geometric classicality | 5.10 | Shimura supported finite-slope cohomology and Bruhat filtration |
| Cohomological eigenvariety | 7.1 | Weight-space family cohomology and coherent Hecke support |
| Interior dimension/deformation | 7.5 | Interior image sheaf and its eigenvariety |
| Sharp interior slope bounds | 7.6 | Supported interior coherent cohomology |
| Sharp Siegel bounds | 8.5 | Integral supported overconvergent geometric model |
| Two-term Klingen control | 9.8 | Klingen threefold, height-one tower and its partial ordinary complex |

Searches by objects in both pins found the algebraic/condensed/derived ingredients, not these moduli, tower and supported-family carriers. No headline can be supplied by a few simple native definitions; an arbitrary-complex substitute would lose the geometric conclusion. The empty acceptance file is therefore appropriate, and has neither padding nor an omitted statable headline.

### Pinned declarations and duplication

Opened the following at the supplied pins, including their surrounding hypotheses:

| Declaration | File and line | Content and limitation |
|---|---|---|
| `Module.End` | `Mathlib/Algebra/Module/LinearMap/End.lean:33` | Linear maps M→M over a semiring, additive commutative monoid and module. Supplies scalar rescaling; no geometric Hecke action. |
| `zpow_sub₀` | `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402` | Nonzero base, integer exponents in a group with zero. At base 3, exponents 2 and 1 give 3=9/3. Base 0 is excluded. |
| `HasDerivedCategory`, `DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74`, line 87 | Abelian category, chosen localization and its morphism universe. The carrier is localization of cochain complexes, not scheme-level solid six operations. |
| `CondensedMod`, abelian instance | `Mathlib/Condensed/Module.lean:41`, line 43 | Sheaves of modules on CompHaus with coherent topology; not relative analytic modules on a scheme. |
| `CondensedMod.IsSolid` | `Mathlib/Condensed/Solid.lean:83` | Inverts the solidification maps. Lines 74–81 explicitly limit the direct definition to finite-type integer algebras and require polynomial restriction for general rings. |
| `HeckeCosetModule.mul`, `single_mul_single` | `TauCeti/NumberTheory/HeckeRing/Multiplication.lean:97`, line 138 | Abstract double-coset convolution with Hecke-triple hypotheses. It does not construct an action on supported coherent cohomology; it does not fill R05. |

Object searches covered Igusa towers, supported ordinary complexes, solid six operations, coefficient induction, algebraic versus locally analytic BGG, compact slope complexes, annihilator support, derived finite Hecke images and Klingen interpolation. Existing generic owners remain imported; none of the zero Lean declarations collides with another roadmap's namespace.

### Supplier direction, contracts and open-work ownership

The required dependency check returned:

```text
depcheck: 236 roadmaps, 2152 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver found no missing section/name. Its service did not check the local pinned libraries; those were opened separately above. Each supplier was read on main or at the indexed open head, not inferred from an earlier review. The following inventory records the resolved contract sections; R05 and R06 distinguish a section's existence from the generality it supplies.

| Supplier | Sections resolved and ownership boundary |
|---|---|
| AdicSpacesPartIII; AdicSpacesPartIV, main | R3.1, R3.4, R3.6, R3.8; F1.10. Finite coherent coefficients/trace and dagger duality, with Banach extensions explicitly requested as gaps. |
| AutomorphicBundles, #1069 | 1.4, 1.5, 1.9; 3.3; 5.2, 5.3, 5.4, 5.10; 6.1; 9.1; 11.10, 11.16, 11.17; 12.1, 12.11. De Rham/bundle data and H⁰ action, not all-degree convolution. |
| AutomorphicBundlesPartII, #1823 | 2.2, 2.4, 2.5; 3.0a, 3.0b, 3.1–3.3, 3.6, 3.9–3.13; 5.1, 5.2. Group-ring models, operations, correspondences and PEL relative vanishing. R05/R06 concern the stronger imports. |
| AutomorphicFormsOnReductiveGroups | 6.7. Siegel chambers, not the new general supported cohomology. |
| CompletedCohomologyPartII | 3.11–3.12. Admissibility and continuous diagonal realization; the package must prove its Igusa input admissible. |
| DeformationAndDerivedPatchingAlgebra | 7.1, 7.3, 7.5, 7.6, 7.8, 7.10. Tor, minimal/complete perfect models, duality and finite derived Hom. |
| HodgeTateAndCanonicalSubgroups, #1084 | 5.1. Hilbert tower; the polarized Siegel and height-one Klingen extensions are declared, not attributed to the existing theorem. |
| IntegralHeckeAndGaloisDeterminants | 2.1, 2.3. Finite derived Hom/action image and Fitting parts; an action is input. |
| LocallyAnalyticDistributions, #854 | 3.3, 4.16, 4.17. Character spaces, compact homotopy actions, perfect slope blocks, base change, relative slope order. |
| OverconvergentAutomorphicForms, #1422 | 0.4, 8.6, 8.7. Analytic coefficient induction/descent. The higher cohomology and locally analytic BGG application remain here. |
| PELModuli, #966 | M2.8, M2.9, M5.1, M5.2, M5.5, M5.6. Actual moduli inputs, including split unitary data; GU(1,1) coefficients are not used as U(n,1) moduli. |
| PadicFamilies, #1019 | Layers 0, 0a; 0a.24, 0a.25; 2a.8–2a.14, 2a.15, 2a.16. Generic single-module eigenvarieties and compact-complex support; cohomological all-degree gluing remains here. Also opened 2a.17 for R04. |
| PadicMeasuresIwasawaAlgebras, main | 1.1, 1.7. Finite coordinates and continuous measures/completed group algebra. |
| PerfectoidShimuraVarieties, #1085 | 3.13, 4.5; 6.3–6.9, 6.12–6.15, including 6.13a. Geometric towers, tubes and actual torsor reductions; general abelian-type affinoid basis strengthening is a gap. |
| PhiGammaModulesAndIwasawaCohomology, #1310 | 2.7. Compact character space and inversion; no reference to obsolete 4.0. |
| ResolutionOfSingularitiesCharacteristicZero, main | 6.3, line 913. Ideal-sum blow-up separates Cartier divisors even outside characteristic zero; this package applies it. |
| SchemeAndStackFoundations, main | 2.20, line 4452 onward. Discrete relative dualizing complexes and smooth top exterior power. It does not itself provide the solid transport. |
| ShimuraCompactifications, #1053 | 0.14; 4.10; 6.16, 6.17; 7.19, 7.20, 7.21, 7.29. Fans, normalized models, Klingen geometry and canonical line. |
| ShimuraData, #1038 | 3.8–3.13, especially 3.10/3.13; 5.5–5.11. Left Kostant conventions, opposition and genus-two coordinates. |
| SolidAnalyticRings, #1458 | 7.2–7.4, lines 715, 745, 787. Relative completion/tensor, discrete Huber-pair structures and common-presentation comparisons, not the requested localization kernel. |
| LieHighestWeight, main | Layer 3. Enveloping algebra/Verma input, not locally analytic BGG exactness. |
| SmoothRepresentationsOfLocalGroups, #1688 | SR.0.2, SR.1.4, SR.4.5. Smooth category, positive Klingen algebra and spherical Satake parameters; the isolated spherical refinement computation remains here. |

All nine remaining gap slugs occur in both the README contracts and `packages/HigherHidaAndColemanTheory/design/plan.json`, with named suppliers: solid-localization-kernel; discrete-adic-solid-comparison; siegel-ordinary-igusa; klingen-height-one-igusa; abelian-affinoid-basis; projective-banach-cohomology; banach-support-duality; coherent-correspondences; abelian-subcanonical-vanishing. Comparing the supplier statements found no duplicate of these remaining requests. The clauses of each request specify one coherent extension and its necessary comparisons. Their absence today is not a finding. In particular PEL vanishing is imported while only its abelian-type/Banach extension remains a gap. A possible later acceptance would be conditional on these contracts; this verdict is not acceptance.

Read the board package index before making absence claims. Its three other under-review branch entries do not supply these objects. The board's `packages/PadicFamiliesPartII/README.md:7` expressly imports HigherHidaAndColemanTheory and starts beyond its general theory; it does not independently own the targets here. It is not on content main or an indexed open roadmap pull request. Its downstream use does not create a reverse supply edge.

The supplied overlap report has no conflicting head, dropped cited id or revision-only cited id. Searches through the open-head tool and inspection of the nearest scopes found these boundaries: AutomorphicBundlesPartII #1823 owns generic operations; OverconvergentAutomorphicForms #1422 owns coefficient sheaves; PerfectoidShimuraVarieties #1085 owns geometry; AlgebraicModularFormsAndSerreWeightsPartII #1822, README lines 17 and 1324, owns integral full-frame function spaces and the marked Klingen coefficient operator, not this partial-support cohomology; GSp4NonregularModularityLifting #1817, README lines 7–13, consumes higher coherent theory for a lifting application. No mutual ownership or cycle was found. The GSp₄ consumer's own old PadicFamiliesPartII labels are not citations made by this package. Ownership against open work was checked through the indexed heads supplied by the roadmap service, not by discovering additional pull requests.

### Seeded source sample

All 15 requested targets were compared with the cached texts at the following locators. Each manifest entry identifies the exact author/preprint version; journal pagination was not silently substituted. There is no author-flagged unverified locator. Where extraction erased notation, the cached PDF was inspected. These checks certify the cited text and hypotheses, subject to the findings; they are not proofs of the source theorems.

| Target | Source locator and line | Hypotheses/conclusion checked | Outcome |
|---|---|---|---|
| 2.8 | BP-Hida, Propositions 2.10.3–2.10.4, pp. 30–31, lines 1553, 1576; Theorem 2.11.4, pp. 32–33, line 1664 | Coherent coefficients and extension near the proper core; cross-containments and the three-pair bridge setting | Finite-rank clause supported; missing hypotheses R01. |
| 3.6 | BP-Hida, Theorem 4.5.2/Remark 4.5.3, pp. 51–52, lines 2664–2674 | Compatible w, sufficiently twisted coefficient, r+q indexing, nebentypus and model-dependent integral abutment | Supported. No singular degeneration asserted. |
| 4.7 | BP-Hida, §5.4, p. 57, lines 2954–2955 | Image in derived End of M_w finite over Λ | Source supports it; package's action input has R05. |
| 5.2 | BP-Coleman, Definition 5.4.10/Example 5.4.11, pp. 111–112, lines 5210–5251; Definition 3.3.10, p. 40, line 1906 | Finite-depth −1, four tube variants, open/closed support and finite quasi-Stein covers | R02. Both printed pages inspected. |
| 5.6 | BP-Coleman, Theorem 5.6.1, pp. 115–116, line 5377 | Cuspidal boundary coefficient, finite slopes, [0,ℓ±(w)]; relative subcanonical vanishing in proof | Supported with declared supplier extension. |
| 5.7 | BP-Coleman, Theorems 5.7.1–5.7.3, pp. 117–119, lines 5458, 5491, 5551 | κ-dual and inverse χ, opposite sign, degree d−i, perfect generalized finite eigenblocks; canonical [ℓ±,d] | Supported. No unrestricted topological cohomology duality inferred. |
| 6.4 | BP-Coleman, Theorem 6.5.2/Remark 6.5.3, p. 160, lines 7362–7384 | Shrunk chart, adapted h′≥h, Tor in degree −p, total p+q | Supported; derived specialization retained. |
| 6.6 | BP-Coleman, Theorem 6.5.5, pp. 160–161, lines 7385–7414; Theorem 6.2.16/Corollary 6.2.18, pp. 151–152 | u=w0M w, conjugated dot action, ±ν_v twists, opposite column signs, locally constant BGG factor | Supported. |
| 8.3 | BP-Hida, Propositions 6.2.12–6.2.14/Theorem 6.2.15, pp. 63–64, lines 3246, 3260, 3266, 3285; Remark 5.4.3, p. 57, line 2951 | Analytic character radius, integral extension, pole bound independent of reduction, projected slope lattice, explicit inverse arithmetic map | Supported with the stated inversion convention; reduction-index typo recorded below. |
| 8.4 | BP-Hida, Corollary 6.2.17/Remark 6.2.18, p. 64, lines 3302–3306 | All genus after inverting p, canonical [ℓ,d], cuspidal [0,ℓ] | Supported; no integral genus≥3 theorem claimed. |
| 9.2 | BP-Coleman, §5.14.2, p. 141, lines 6536–6547; BP-GL2, Theorem 1.2, p. 3, lines 80–84 | Naive U slope bounds 1,k; standard factor p⁻¹; degree-one ω^(2−k)(−D), k≥3 | Supported; extra minus in source's pairing calculation is a misprint. |
| 9.3 | BP-Coleman, §5.14.3, p. 141, lines 6548–6567; BP-Hida, Proposition 5.6.3, p. 58, lines 2983–3008 | Two four-entry bound tables, strict standard U₂ threshold, genus 1/2 amplitude | Supported. |
| 9.4 | Pilloni-Singular, §§9.1–9.4, pp. 54–57, lines 2483–2568; Theorem 11.3.1, p. 71, lines 3293–3299 | Height-one Igusa transitions, one-variable diagonal sheaf, perfect [0,1] complex and derived fibre | Supported; finite étaleness of all tower transitions is not assumed. |
| 9.6 | Pilloni-Singular, Proposition 12.8.2.1, p. 79, line 3655; §13.2, pp. 85–87; Proposition 13.3.1.1, p. 88, line 4043; BGG propositions/corollaries, p. 90, lines 4119–4155; §13.4/Proposition 13.4.1, p. 91, lines 4170–4181 | Projective Banach models, compactness, bounds −3/0, radius colimit, one-variable spectral support and Euler characteristic | Construction and Euler statement supported; R03 and R04 affect the diagram and fibre assertion. |
| 9.9 | BP-Coleman, §1.1, pp. 2–4, lines 47–150; Theorems 5.7.3, 6.7.3, 6.9.7, pp. 119, 166–167, 171–172, lines 5551, 7660, 7872 | General finite-slope amplitudes and interior dimension; split U(n,1) is a specialization | Supported. The explicit A_n weight table is the package's computation, recomputed below, not a theorem table attributed to the paper. |

### Computed adversarial table

The table covers every sampled target, all ten headlines, every finding and the repaired conventions. “Pass” means the specified test agrees, not a claim that a handful of examples proves a general theorem. Arithmetic uses v_p(p)=1; finite-dimensional blocks are test models for the asserted formal operations, not replacements for geometric headlines.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Conventions: rescaling | p=3, a=2,−1,0; successive 2,−1 | Eigenvalues 1/9,3,1; (1/9)·3=1/3=3⁻¹. Resulting slopes are −2,1,0. | Pass | None |
| 1.1, 9.1: C₂ weights/inversion | ν=(0,−2), four representatives | κ=(5,3),(5,1),(2,−2),(0,−2); ν_w(κ_w(ν))=(0,−2) in all four cases. | Pass | None |
| 1.1: dual coefficient | κ=(5,3),(5,1), 2ρ_nc=(−3,−3) | κ∨=(0,−2),(2,−2); second application returns (5,3),(5,1). | Pass | None |
| 2.1, F01: smooth purity | Point; affine line; affine plane over 𝔽₂ and ℤ/9 | Ω⁰[0]=A[0]; Ω¹[1] degree −1; Ω²[2] rank 1 degree −2, versus rank 2 for Ω¹[2]. | Values pass; import scope fails | R06 |
| 2.1: bounded coherent import | A=𝔽₂[t], A[t⁻¹] | Finite generators with poles ≤N cannot generate pole N+1; module has infinite A-generator requirement, not a coherent input. | Supplier excludes it | R06 |
| 2.2, F04: strict/compact | Frobenius on ℙ¹ over 𝔽₂ or 𝔽₃ | Pullback ideal (t^p)=(t)^p gives s=1/p; int(V(t^p))=∅, so V(t)⊄∅. | Strict holds, compact fails | None |
| 2.2: empty/identity boundaries | Both boundaries empty; identity with Cartier (t) | ∅⊆∅ twice; for s=a/b<1, (t)^a⊄(t)^b. | Pass | None |
| 2.3: ordinary localization | T=1,0,3 on ℤ/9 | Ordinary modules ℤ/9,0,0; T²=0 in third case. On ℚ₃, T=3 has slope 1 and nonzero finite-slope block. | Pass | None |
| 2.6, F02: equivariant flatness | Trivial C₂-torsor over 𝔽₂ | Functions 𝔽₂² form a rank-one regular 𝔽₂[C₂]-module; 1+σ is nilpotent with square 0, and no division by 2 exists. | Pass | None |
| 2.8: finite rank and support change | Identity on two 𝔽₂ points; remove one clopen point | Finite ranks 2 and 1; map is projection, not isomorphism. Cross inclusion is ∅⊇{a}, false. | Fails unrestricted shrink | R01 |
| 3.1: degree divisor convention | g=1, n=1,2; n=0 | Multiplicative/étale degree pairs (1,0),(2,0) sum to n; at n=0 both degrees are 0 and labels coincide. | Pass; n=0 excluded | None |
| 3.2: normalized trace | p=3, GL₂ k=2; GSp₄ t₂ | Naive constant 3, correct factor 1/3 gives 1; wrong factor 1/9 gives 1/3. Genus-two trace factor is 3³=27. | Pass | None |
| 3.6: integral Cousin columns | GL₂ k=2 and k=1; mod 9 | At k=2 normalized exponents are (0,1): eigenvalues (1,3), ordinary ranks (1,0). At k=1 exponents (0,0): both columns survive. | Pass; singular columns retained | R05 for full away-p equivariance |
| 4.6, 6.4: derived specialization | A=F⟨t⟩, C=[A →ᵗ A] in degrees 0,1, x:t=0 | H⁰(C)=0, H¹(C)=F; C⊗ᴸ_A F=[F →⁰ F], H⁰=H¹=F; Tor₁^A(F,F)=F occupies (p,q)=(−1,1), total 0. | Pass | None |
| 4.6, 8.3: character inversion | p=3,u=4,k=1 and 0 | Correct [u] images 1/4 and 1; direct character would give 4 and 1. At p=2,u=3,k=1 the pair is 1/3 versus 3. | Pass | None |
| 4.7: finite image retains nilpotents | Λ², U=1+N, N=E₁₂ | N²=0, N≠0; image Λ[N] has Λ-rank 2, reduction Λ has rank 1. Both have the same underlying prime support. | Finiteness model passes | R05 action prerequisite |
| 4.7, 7.1: commutativity prerequisite | C=𝔽₂² in degree 1; A=E₁₂,B=E₂₁ | AB=diag(1,0), BA=diag(0,1); H⁰(A)=H⁰(B)=0. | Fails inference from individual maps/H⁰ | R05 |
| 4.8: integral pairing | d=3, canonical test summand in degree 1 | RHom(F[−2],F[−3])=F[−1]; paired degrees 1+2=3. Omitting [−3] gives degree −2, not 1. | Pass | None |
| 4.9: integral small-genus ranges | g=1; g=2, ℓ=1 | g=1 identity/long concentrations 0/1; g=2 canonical [1,3], cuspidal [0,1], opposite cuspidal [0,2], whose dual shifted by −3 has [1,3]. | Pass | None |
| 5.2: finite versus unbounded tube | Positive root z=p⁻², p=2,3 | Absolute values 4,9 exceed depth −1 radii 2,3; finite tube membership false, unbounded membership true. | Fails identification | R02 |
| 5.2: closure | Outward rank-two specialization of unit-disc Gauss point | Membership in quasi-compact disc 0, membership in its closure 1. Plain tube cannot supply the stated closed constraint. | Fails notation/Check | R02 |
| 5.6: cuspidal range | d=3, ℓ=0,1,3; zero coefficient | Allowed degree sets {0},{0,1},{0,1,2,3}; zero coefficient gives H^i=0 for all i. | Pass | None |
| 5.7: opposite ranges and duality | d=3, ℓ+=1, ℓ−=2; d=0 point | Negative canonical [2,3] dualizes to positive cuspidal [0,1]; point pairing 1·1=1. For d=2, Ω² rank 1 versus Ω¹ rank 2. | Pass | None |
| 5.10: regular/singular classicality | GL₂ k=2 and k=1 | Compatible lengths {0} versus {0,1}; the singular permitted range is [0,1], not concentration in 0. At the strict k−1=1 endpoint, 1<1 is false. | Pass | None |
| 6.1a: descent projectivity | F[x,y] over F[x²,xy,y²]; C₂ invariants | Generic rank 2, special fibre basis 1,x,y has dimension 3; augmentation invariants over ℤ₂ have image 2ℤ₂, over ℚ₂ image ℚ₂. | Pass; regularity/inverting order needed | None |
| 6.5: analytic BGG local model | SL₂ diagonal(p,p⁻¹), p=3 | 1,z,z² eigenvalues 1,9,81, slopes 0,2,4; scalar twist by 3⁻¹ gives slopes −1,1,3. | Pass | None |
| 6.6: BGG columns/twist | v=1 and rank-one Levi reflection, ν_alg=0 | ν₁=0; reflected dot weight =−2 in coroot coordinates. Columns +0,+1 versus −0,−1; total degree p+q follows the displayed convention. | Pass | None |
| 6.7: BGGsafe bound | C₂,w=1,t₂, κ=(3,3),(4,2),(7,5) | a_an(t₂)=−3, ν_v(t₂)=−3, (w⁻¹2ρ_nc)(t₂)=3; twisted thresholds 0 and 3 in each case. Slopes <3 excluded; slope 3 not excluded. | Pass | None |
| 7.1: actual support | C=[F →¹ F]; C=F in degree 1 | Annihilator support empty for acyclic C, nonempty for H¹-only C. Degreewise Fredholm product for the first with U=1 is (1−X)² despite zero cohomology. | Pass | R05 concerns its action input |
| 7.3–7.4: interior image/base change | Multiplication t on F⟨t⟩ | (t)/t(t)≅F, dimension 1; specialized map is 0:F→F with image dimension 0. | Pass; only surjection to specialized image claimed | None |
| 7.5: equidimensional interior support | A=F⟨t⟩, nonzero torsion-free M=A; zero M | Faithful algebra A has support dimension 1=dim A; zero M has empty support. M=A/(t) would have support dimension 0 and is excluded by torsion-freeness. | Pass | None |
| 7.6: sharp interior slopes | One-dimensional rational block preserving O-lattice, eigenvalue p or p⁻¹ | p·O⊆O, slope 1≥0; p⁻¹·O⊄O, slope −1<0. Transposition reverses the signed inequality. | Pass | None |
| 8.1–8.2: formal support/lattice | A=𝔽₂[t], ideal (t); vertical twist p^m | Completion H⁰=𝔽₂[[t]], ordinary local cohomology H¹=𝔽₂[t,t⁻¹]/𝔽₂[t]; p^mℤ_p⊗ℚ_p=ℚ_p, but integral lattice depends on m. | Pass | R01 affects bridge inputs |
| 8.4: rational amplitude | g=3,d=6, ℓ=0,2,6 | Canonical [0,6],[2,6],[6,6]; cuspidal [0,0],[0,2],[0,6]. All are after p-inversion; no integral bound inferred. | Pass | None |
| 8.5, 9.3: sharp Siegel bound | κ=(5,3;−8), t₂ and t₁ | t₂ bounds (3,4,4,8); t₁ bounds (6,6,11,11). Standard t₂ subtracts 3: (0,1,1,5); slope 0<1 passes, slope 1<1 fails. | Pass | None |
| 9.2: modular normalization/degree one | p=3,k=2; BP-GL2 k=3 | Naive bounds (1,2), standard bounds (0,1); degree-one coefficient exponent 2−3=−1 with −D. Printed extra-minus pairing would be −2, not 2. | README passes | Source misprint only |
| 9.4: height-one tower and two-term complex | μ_(p^m) over p-rank 1 and 2 points | Primitive choices rank 1: p^(m−1)(p−1); rank 2: p^(2m)−p^(2m−2). Lifting an existing primitive vector has p versus p² choices, so transition degree jumps and is not finite étale globally. | Pass | None |
| 9.5: isolated refinement | p=3, Satake (1,1,9,9) | αδ=βγ=9; products (1,9,9,81); eigenvalues (1/3,3,3,27). Isolated projector at 1/3 has values (1,0,0,0), with squared factor killing a size-two 3-Jordan block. | Pass | None |
| 9.6(1),(3): compact finite block/Euler sign | C=[A →ᵗ A], U=1 | At t≠0, (dim H⁰,dim H¹)=(0,0); at t=0, (1,1). H¹−H⁰=0 at both, although individual dimensions jump. | Pass | None |
| 9.6(2): spectral fibre | F[X,X⁻¹]/(X−1)²; simple eigenline | Generalized block dimension 2 versus residue fibre 1; derived ambient fibre of simple line has H^(−1)=H⁰=F versus eigenline H^(−1)=0,H⁰=F. | Fails | R04 |
| 9.6(4): BGG sign | p=3,k=0,f=z; k=3 slope bounds | D(Uz)=3, printed p⁻¹U(Dz)=1/3; corrected pU(Dz)=3. At k=3, printed lower bounds (−7,−4), corrected (1,4). | Fails | R03 |
| 9.7–9.8: extension/control endpoints | r=2,k=0,3; p=2 torsion claim | Extension bounds 1,4; all-degree combined bounds min(1,−2)=−2, min(4,1)=1. Ordinary slope 0 enters latter at k=3. Torsion weight condition k>3 first allows 4. | Endpoint calculations pass | R03 must be fixed upstream |
| 9.8: integral trace divisibility | k=0,p=2 | Coefficient/trace products 2⁴,2³,2³; division by 2³ yields 2,1,1, all integral. I=(2) gives I⁻³=2⁻³O, not O. | Pass | None |
| 9.9: left-coset unitary weights | n=1,ν=(2,0); n=2,ν=(4,2,0) | n=1 κ=(−3,1),(0,−2). n=2 κ=(−3,−5,2),(0,−5,−1),(0,−2,−4), with lengths 0,1,2. Canonical ranges [0,2],[1,2],[2,2], cuspidal [0,0],[0,1],[0,2]. | Pass | None |
| 9.9: half-integral ρ cancellation | n=3,ν=(6,4,2,0) | ρ=(3/2,1/2,−1/2,−3/2); κ=(−3,−5,−7,3),(0,−5,−7,0),(0,−2,−7,−3),(0,−2,−4,−6), all integral. | Pass | None |
| Library locator check | Open cited versus actual lines | Basic.lean:399 names inv_pow_sub_of_lt, :402 names zpow_sub₀; Module.lean:42 blank, :43 instance. | Fails coordinates | R07 |

The other target checks were evaluated using the same native models and their explicit restrictions: finite versus infinite coefficient modules; ramified finite-flat coefficient extensions versus Tor-independent geometric base change; nilpotent/automorphic actions; empty supports; finite-group invariants with and without division; degree shifts; rank-one and nonabelian Weyl actions; strict versus equality slope endpoints; and nonreduced spectral algebras. Equal-characteristic and zero-ring inputs do not satisfy the Coleman coefficient hypotheses, and genus zero/level n=0 are explicitly outside the Siegel degree construction. No generality was inferred from these excluded inputs. No declaration-variable retention issue can arise in the empty Lean file.

## Not verifiable

- No cited text in this package was inaccessible: all four manifest entries were readable in the legal cache, and no reference request was necessary. The report's locators certify those editions only; distinct journal pagination was not checked or claimed.
- The nine declared supplier extensions are future contracts, not established theorems at the pins. Their scope, ownership and declaration were checked; their eventual proofs cannot be certified by this package review.
- The pinned Lean build checks the empty acceptance file. It cannot check the geometric README assertions whose carriers are absent. This limitation is accounted for by the source and computed adversarial checks, not reported as successful Lean verification of the mathematics.

## Source issues

- **Misprint** in BP-Hida at Introduction §1.1, printed page 2: the source says M_μ is the unipotent radical; it should be the Levi subgroup, as in §3.1; affects nothing.
- **Misprint** in BP-Hida at Proposition 4.3.17, printed page 49: the source says the normalized finite-character coefficient has a malformed weight expression; it should be −w⁻¹w0M(κ+ρ)−ρ, with χ separate; affects a stated result.
- **Gap** in BP-Hida at Remark 5.4.3 and Theorem 6.2.15, printed pages 57 and 64: the source says inverse-character arithmetic specialization and an unlabelled family base change describe the same complex; it should specify the family coefficient map, retaining inversion with the regular-action convention; affects a stated result.
- **Misprint** in BP-Hida at Proposition 6.2.13, printed page 63: the source says the mod-p^r object is obtained using A/p^n; it should use A/p^r, as its proof does; affects a stated result.
- **Gap** in BP-Coleman at Definition 5.11.14 and Corollary 6.8.4, printed pages 134 and 168: the source says its coefficient strongly-small condition follows from BGG with inconsistent shifts and a doubled noncompact-root term; it should derive exclusion termwise from the two twisted analytic bounds; affects a stated result.
- **Misprint** in BP-Coleman at proof of Theorem 6.4.3, printed page 157: the source says compactness uses an unresolved numbered reference; it should identify the root-coordinate contraction input alongside Lemma 6.3.10 and the supported-cover argument; affects nothing.
- **Misprint** in BP-Coleman at Definition 6.4.7, printed page 158: the source says the first negative geometric inclusion uses coefficient radius n; it should use the freely chosen geometric depth l, retaining the independent radius-n coefficient constraint; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.10.2(1), printed page 173: the source says the interior range theorem uses strongly-small slopes; it should state the small-slope conclusion established in its proof; affects a stated result.
- **Misprint** in BP-Coleman at Proposition 2.7.3, printed page 32: the source says an already derived supported complex receives an extra shift and later uses Ω¹; it should omit that extra shift and use Ω^d for top-degree duality; affects a stated result.
- **Misprint** in BP-Coleman at §5.14.2, printed page 141: the source says the negative of the pairing with (−k;−k) equals k; it should omit the prefixed minus, since the pairing itself equals k; affects nothing.
- **Misprint** in Pilloni-Singular at §5.1.5 before Proposition 5.1.5.2, printed page 22: the source says the Satake labels satisfy αβ=γδ; it should be αδ=βγ, consistent with the spherical labels and Weyl-orbit eigenvalues; affects nothing.
- **Misprint** in Pilloni-Singular at Proposition 13.3.3.1, printed page 90: the source says the target BGG operator is p^(−k−1)U; it should be p^(k+1)U in the contracting convention, yielding the following corollary's thresholds; affects a stated result.
- **Gap** in Pilloni-Singular at §13.4, printed page 91: the source says a spectral-point pullback has eigenspace cohomology without distinguishing pullback from spectral localization; it should specialize over weight first, then take the primary spectral component, retaining Tor and nilpotents; affects a stated result.
