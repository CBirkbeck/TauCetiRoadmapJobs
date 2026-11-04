# Review of HeckeStacksAndLocalShtukas (pull request #1252 at dcd2f5a)

**Verdict:** needs changes

## R01 (P1) — Replace the obsolete BunG geometry contracts

**Location:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:1589`, also lines 202–203, 1090, 1601, 1670, 2054, 2184 and 2474. The attribution is “the parabolic charts of its §§4.1–4.7” and “positive unipotent kernels of §§3.3–3.5”.

**Claim:** BunGAndNewtonStrata supplies these constructions at those sections, including the separately cited §§3.9 and 3.16–3.17.

**Witness:** `TauCetiRoadmap/BunGAndNewtonStrata/README.md:80` assigns bundle geometry, full automorphisms and charts to VStackSheavesAndLisseCategories VS4.0. Its §§3.4–3.5, 3.9, 3.16–3.17 and 4.1–4.6 are absent; §3.3 concerns filtered relative group schemes.

This is an unresolved supplier contract, not just a link typo: the consumed full automorphism v-group is different from the relative algebraic group in §3.3. Both supplier copies were inspected at their open heads; neither roadmap exists on the supplied main checkout. There is no declared gap for the obsolete references.

**Repair:** Cite `VStackSheavesAndLisseCategories` §VS4.0, specifically its bundle, Newton, full-automorphism and filtered-chart constructions. Retain BunG §3.10 for reduction of full automorphism torsors, §3.11 for stratum dimension, §3.18 for components and §4.7 for arithmetic chart images where actually used. Replace the stale ranges throughout the contracts and Needs lines. This introduces no upward edge. Test the corrected contract on `O(1)⊕O`: it supplies upper-triangular automorphisms with off-diagonal `H⁰(O(1))`, of dimension 1, and stratum dimension −1. Replacing that group by the diagonal `Eˣ×Eˣ` loses precisely this direction.

## R02 (P1) — Resolve the nonexistent highest-weight supplier section

**Location:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:207`, repeated at lines 630 and 1008: “LanglandsParameterStacks, LP3.0, ‘Highest-weight modules and good filtrations’”. The perfect-generation attribution at line 32 also cites LP4.1–LP4.3.

**Claim:** Those sections supply the highest-weight inputs for HS1.0 and generation on the parameter stack.

**Witness:** `TauCetiRoadmap/LanglandsParameterStacks/README.md:918` is §4.1, the highest-weight target. There is no LP3.0. Perfect generation is §6.2 at line 1293, and module comparison §6.3 at line 1303, with explicit prime restrictions.

The actual §4.1 works with split reductive groups over fields and imports induced/Weyl modules from ReductiveGroups §10B. It does not by itself supply all the integral assertions of HS1.0. GeometricSatakeAndFusion §§4.24–4.25 explicitly own the additional relative integral base-change and stable-completion statements.

**Repair:** Replace LP3.0 by LP §4.1 and its field-level contract; route the relative integral inputs through GS §§4.24–4.25. Correct the scope's parameter-generation references to LP §§6.2–6.3, retaining their hypotheses. Keep HS1.0's additional tensor-generator and resolution assertions here. Test the distinction at `Ĝ=PGL₂`, `ℓ=2`: the GS integral interface and HS1.0 still apply, whereas LP §6.2 does not assert parameter-stack generation in characteristic 2. Merely renumbering LP3.0 without separating these contracts would not fix the issue.

## R03 (P2) — Import the already-owned constructions instead of rebuilding them

**Location:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:2223`: “Assemble the action on compact lisse objects into exact” monoidal functors; also HS1.1 at line 636 and the ULA-criterion target in HS1.6 at lines 865–879.

**Claim:** HS4.1 owns the coherent finite-set family, HS1.1 constructs the local solid Satake functor, and HS1.6 establishes the ULA/perfect-stratum-invariant criterion.

**Witness:** `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:2551` already specifies the monoidal finite-set family and coCartesian coherence. `TauCetiRoadmap/GeometricSatakeAndFusion/README.md:2243` supplies the local solid functor; `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:1399` supplies the ULA criterion.

The AG2.6 family has the same coefficients, general local field, finite sets, fusion, unit, composition and Weil actions. It is even listed among this README's imports at lines 271–277. The whole roadmap is not a duplicate: general towers, the geometric representation variants, integral resolution targets and explicit comparison diagrams remain meaningful extensions.

**Repair:** Delete HS4.1's re-construction and import AG2.6's family by its section; retain a separate, precisely stated compatibility with HS1.8's condensed enrichment if that is the additional result intended. Import the local functor from GS §4.25 before defining the global pullback, and import the VS5.3 ULA criterion before proving the new geometric-operator preservation result. Update Needs lines and the headline list/docstring accordingly. Do not delete the distinct global solid extension or the geometric operators for representations not restricted from the semidirect product. On `G_m`, weight `n` carries degree `d` to `d+n`; two weights `n,m` give `d+n+m` in both constructions, and empty legs give the identity. These tests exhibit identical objects, not different variants. For the ULA criterion at the trivial group, a finite free module is perfect on both sides, while an infinite direct sum of coefficient fields is not.

## R04 (P3) — Remove undeclared Lean API identifiers from the prose API lists

**Location:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:67`: “The API names below are the intended declarations of the finished library”; examples include `HckI.swap` at line 331 and `GeneralShtukaTower.transition` at line 1348.

**Claim:** Backticked identifiers in this roadmap's API bullets designate prospective Lean declarations, despite an empty acceptance-test module.

**Witness:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/Suggested.lean:33` opens an empty namespace and closes it at line 35. Neither example identifier is declared. The supplied form rule permits own API identifiers only for declarations actually present there.

**Repair:** Express these APIs as prose mathematical assertions, preserving their signatures, hypotheses, locators and Checks; retain exact names only for real imported declarations. Remove the sentence authorizing prospective declaration names. Do not fill Suggested.lean with API padding. For example, state that swapping twice gives the original modification and that a level transition has degree `[K:K′]`. The witnesses still compute `−(−1)=1` and degree 6 for the principal level-one cover of `GL₂(ℤ₂)`; no prospective Lean identifier is needed.

## R05 (P3) — Correct the identity of the GLX preprint

**Location:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:2573`: “the open preprint arXiv:2109.02594v1 numbers its results in three levels”.

**Claim:** That identifier is a preprint version of the cited Gleason–Lim–Xu paper.

**Witness:** `GleasonComponents line 6` identifies arXiv:2109.02594v1 as *Stabilizers of irreducible components of affine Deligne–Lusztig varieties*, by He–Zhou–Zhu. `GLX line 2` identifies the retrieved GLX text as arXiv:2208.07195v3.

**Repair:** Link the actual GLX preprint, state its version, and give its own locators where that is the text used. Keep the version-of-record pages explicitly uncertified unless checked independently. In the recovered GLX version, Theorem 3.11 and Proposition 3.12 occur on page 24, and Proposition 6.6 on pages 45–46; these are two-level numbers. This checks the replacement against the connectedness and induced-torsor claims actually used here.

## Verified sound

The worker's gate passes at the requested head. The direct `lake env lean` elaboration of `TauCetiRoadmap/HeckeStacksAndLocalShtukas/Suggested.lean` also exited successfully, with no warnings. The worktree stayed unchanged; the diff outside the requested folder is empty. There are no sorry'd data, no options, no forbidden imports, no admitted examples and no Lean declarations. Thus the signature-expansion and one-tactic padding probes have **zero declarations** to test; no scratch substitute theorem was used. The mathematical tests below are independent of that empty-file build.

The four seeded targets were inspected: BunGAndNewtonStrata and AutomorphicGaloisRepresentationsPartII against their actual supplier text, and integral tensor generation and solid-dual Demazure generation against the cited FS passages. All ten bibliography works were obtained through the source service in legal editions, plus Hansen's Corollary 4.11 and the misidentified arXiv paper. The GLX version-of-record locators remain uncertified as stated below. The target has 52 HS topic subsections. The table contains 132 diagnostic rows covering those topics, every listed headline, the seeded sample, convention witnesses and each finding. A passing row records the displayed instance, not a formal proof of a general theorem.

**Principles and ownership.** The roadmap preserves arbitrary primes `ℓ≠p`, arbitrary bounds and general local fields in the general-field targets. Explicitly mixed-characteristic, minuscule and torsion comparison theorems are distinguished from these. No algorithmic deliverable or copied source passage was found in the checked text. The broad object searches included the pinned libraries, main roadmaps, board packages and open-roadmap text returned by `roadmaps grep`; supplier definitions were then read with `roadmaps show`. The five central suppliers named in R01–R03 are new folders absent from the supplied main checkout, so their open heads are the appropriate copies. No own Lean declaration can collide with another roadmap's namespace because this file declares none. The concrete duplicate constructions are R03. Geometric Satake owns local kernels; VS owns coefficient theory and bundle charts; AG2.6 owns the lisse family and minuscule tower. The general-field arbitrary-bound tower comparisons and the stronger integral resolution assertions can be owned here on those carriers. Later consumers were not treated as suppliers.

**Dependency check.** The requested movable dependency check returned exactly:

```text
depcheck: 205 roadmaps, 1660 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. Every Needs line and the supplier table were read. This result checks roadmap-name edges; it does not validate the section-level contracts in R01–R02. No supplier gap was declared. The original folder is not being rejected as an irremediable re-plan: the cited defects can be repaired by importing the existing owners and retaining the actual extensions.

**Resolved supplier evidence.** File references below are relative to the respective supplier repository; line numbers omit the wrapper added by `roadmaps show`. The supplier audit inspected 23 roadmap texts. The following gives the principal resolutions and the hypotheses that matter here.

| Supplier file/section | Resolution and limitation |
| --- | --- |
| `TauCetiRoadmap/BunGAndNewtonStrata/README.md:80`, §§2.18, 2.21–2.22, 3.10–3.11, 4.7 | Kottwitz sign, modification comparison and arithmetic refinements exist; bundle charts moved to VS4.0 (R01). |
| `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:1083`, VS4.0; line 1361, VS5.3 | Full bundle and automorphism geometry, filtered charts, integral lisse duality and ULA criteria. Nonbasic connected kernels are retained. |
| `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:2538`, AG2.6 | Local solid kernel conversion, lisse action and its coherent family; same sign `E_(π⁻¹)=O(1)`. Minuscule local towers and their cohomology are imports. |
| `TauCetiRoadmap/GeometricSatakeAndFusion/README.md:2225`, §§4.24–4.25 | All-prime relative integral representation interface and local perfect-complex Satake extension; no claim that every object of the entire enhanced category is in its image. GS0 supplies the local bounds and Demazure geometry. |
| `TauCetiRoadmap/LanglandsParameterStacks/README.md:918`, §§4.1, 6.2–6.3 | Field-level highest weights versus prime-restricted parameter-stack generation: different results (R02). |
| `TauCetiRoadmap/RelativeFarguesFontaine/README.md:2556`, §§7.0–7.7 | Tensor torsors, meromorphic modifications and gluing, including base change, adding legs and changing structure group; Layers 0–4 supply the period-ring geometry. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1631`, SR.0d.1–SR.0d.2; SR.1–SR.3, SR.6 | Enhanced smooth category, derived invariants and compact induction; pro-p level is essential over torsion coefficients. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1436`, E5:abstract; line 1593, E5:presentability | Coherent stable monoidal categories and compact generation; ordinary Mathlib categories do not replace these enhancements. |
| `TauCetiRoadmap/ClassFieldTheory/README.md:1535`, Layer 9 | The local Weil reciprocity equivalence is restricted to finite extensions of ℚ_p. HS2.18 explicitly owns the general-local-field comparison. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md:852`, RG2.0.4, RG2.0 | Completed unramified field/Frobenius and local group topology; no compactness of all of `G(E)` is assumed. ReductiveGroups Layer 9 and §10B supply dual-group and highest-weight inputs. |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3904`, §§8.1–8.6, 9.4–9.7 | Proper supports, traces and duality. DiamondSixOperations S0–S5 and AdicCoefficientsAndComparisons L0 are the separate diamond and adic-coefficient interfaces. |
| `TauCetiRoadmap/PadicHodgeTheory/README.md:665`, §§3.2–3.5, 7.1 | Filtration/sign and period comparisons; the more general perfect-residue-field comparison is separately requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3.3/R07.4.13. |
| `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:3698`, R07.2.20 | Covariant convention uses `φ=p⁻¹F`; multiplicative height one gives slope −1. AInfCohomology AI.2 (line 1547) supplies the separate lattice/modification comparison. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4926`, §12.17 | Independent classical/basic modification comparison. IgusaVarietiesAndTorsionConcentration §§0.11 and 0.27 (lines 364, 611) supplies its specified unramified PEL data and deformation spaces. |
| DiamondsAndVStacks D3–D5; VectorBundlesAndIsocrystals VB−1–VB4; AdicEtaleGeometry A2; AdicSpacesPartII R0 | Stack descent, curve/vector-bundle carriers, and analytic/diamond rigidification inputs were located as distinct upstream objects; they do not provide an arbitrary integral RZ representability theorem. HS3.9 retains that as an explicit hypothesis. |

**Pinned library evidence.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were searched by the objects and their structure fields. These are 16 concrete declarations inspected, with the relevant scope.

| Declaration | Pinned file and line; what it actually supplies |
| --- | --- |
| `CategoryTheory.Adjunction` | `Mathlib/CategoryTheory/Adjunction/Basic.lean:108`: unit, counit and both triangle laws for ordinary categories. |
| `CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean:161`: specified tensor/unit/associator and coherence. |
| `CategoryTheory.Functor.Monoidal` | `Mathlib/CategoryTheory/Monoidal/Functor.lean:389`: lax/oplax comparisons inverse to each other. |
| `CategoryTheory.ExactPairing` | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:77`: evaluation, coevaluation and two triangles; their trace composite is not a triangle. |
| `Condensed` | `Mathlib/Condensed/Basic.lean:44`: sheaves on CompHaus for the coherent topology, with explicit universes. |
| `CondensedMod` | `Mathlib/Condensed/Module.lean:40`: the module-valued specialization; no enhanced category on Bun_G. |
| `WittVector.Isocrystal` | `Mathlib/RingTheory/WittVector/Isocrystal.lean:113`: a module over the Witt fraction field plus semilinear equivalence; finite dimension is not a field of this class. |
| `FGModuleCat.exactPairing` | `Mathlib/Algebra/Category/FGModuleCat/Basic.lean:255`: actual dual pair in the field section, not finite-projective representation theory over an arbitrary integral base. |
| `TauCeti.AffineGroupSchemeCat` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean:55`: affine group objects over a commutative ring; affineness alone imposes neither smoothness nor reductivity. |
| `TauCeti.ReductiveAffineGroupSchemeCat` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive/Basic.lean:89`: field-based full subcategory, with inherited smoothness and geometric connectedness. |
| `TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272`: discrete module topology and open stabilizers; scalar continuity comes from TopRep. |
| `TauCeti.SmoothDiscreteTopRep` | same file, line 618: ordinary smooth discrete category, not its stable enhancement. |
| `TauCeti.IsProP` | `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68`: all open-normal quotients are p-groups; compactness is separate and is explicitly required by this README. |
| `CategoryTheory.Functor.mapExactPairing` | `TauCeti/CategoryTheory/Monoidal/Rigid/Functor.lean:75`: transports an exact pairing along a strong monoidal functor. |
| `CategoryTheory.Functor.mapExactPairing_evaluation` | same file, line 99: evaluation uses tensor comparison and inverse unit comparison. |
| `CategoryTheory.Functor.mapExactPairing_coevaluation` | same file, line 106: coevaluation uses unit and inverse tensor comparisons. |

There is ordinary solid-condensed-module material in Mathlib; the absence claimed here is specifically the enhanced solid/lisse sheaf categories on the relative bundle stack. Neither the ordinary carriers nor Tau Ceti's Fargues–Fontaine orbit-space modules supply the geometric moduli stacks, local shtuka towers or integral reductive representation category required for the headlines.

**Headline acceptance test.** The README/module identify six groups of headlines: HS1.5/HS1.9 adjunction and continuous descent; HS1.0 integral tensor/exterior generation and resolution convergence; HS2.15 nonemptiness, connectedness and density; HS2.18 component-torsor reciprocity; HS3.5/HS3.6/HS3.8 finite generation, compactness, admissibility and duality; HS4.1 coherent finite-set action. All are named in the module docstring with missing carriers. Their full intended statements are not statable at these pins using only a few simple native definitions. No missing statable headline or stand-in was found. R03 requires removing the already-owned family from the list of this roadmap's own headlines.

**Source sample and locator checks.** Locators refer to the source-service extractions; statements here are paraphrases.

| Target/source | Locator inspected | Result |
| --- | --- | --- |
| Integral tensor generator | FS lines 12698–12711, Proposition IX.5.1 proof, printed p.328 | The tensor-generator reduction and finite wild action argument occur here. The arbitrary finite pinned-action group algebra is an extra target, not a claim that the source states that generalization. |
| Integral exterior generation/convergence | FS lines 12435–12454 and 12525–12531, IX.2, pp.321–323 | Highest-weight base change and possibly unbounded bounded-weight exterior resolutions are used. The explicit integral construction remains HS1.0's obligation; R02 fixes its supplier route. |
| Solid-dual Demazure generation | FS lines 12488–12495, IX.2.1 proof, p.322; lines 10222–10225, VII.4.3, p.263 | The proof uses equivariant Demazure generators and the proper dual-to-homology comparison. Colimit generation after duality is not automatic: HS1.1 explicitly states it as its own target. No averaging by a nonunit or assertion that duality preserves arbitrary colimits is accepted as a proof. |
| BunGAndNewtonStrata | Its §2.18, §3.11 and scope/VS4.0 contract | Signs and nonbasic stratum dimension agree. The chart/automorphism locators fail as reported in R01. |
| AutomorphicGaloisRepresentationsPartII | AG2.6, bundle/action and local-Shimura paragraphs | Source/target, kernel shift, coefficient range, finite-set structure and pro-p compactness agree. The overlap is R03. |
| Arbitrary-bound admissibility | HK lines 1968–1990, Propositions 7.3.3–7.3.4, pp.43–44; RV lines 447–449, Proposition 3.1, p.11 | The `λ=μ⁻¹` conversion and distinction between acceptable A(G,λ) and integral-Kottwitz B(G,λ) are necessary and present. |
| Connectedness and dimensions | GL lines 304–329 and 389–466, Theorem 2.13, Proposition 2.15, Theorem 3.2, Lemma 3.3, pp.8–12 | Relative dimension, basic/nonnegative hypotheses in the auxiliary open-locus result and corrected unipotent torsor are distinguished. The erroneous averaging identity at line 312 is not repeated by the roadmap. |
| Connected complement | Hansen lines 1892–1899, Corollary 4.11, printed p.796 | Smooth partially proper, equidimensional with dualizing degree δ, and `2 dim.trg Z+2≤δ`. For integer pure dimension d, δ=2d and dim Z≤d−1 recover the stated test. Legal institutional copy obtained after the initial publisher-host lookup failed. |
| Components, BB points, adjoint comparison | GLX lines 891–893, 973–985, 1008–1025, 1882–1895, 1920–1950; preprint §§3.9–3.12, 3.6, Propositions 6.4/6.6 | Supports the component, finite-extension point and induced-torsor comparisons in the recovered preprint. The printed pagination is not certified; R05 corrects the wrong preprint identity. |
| Compactness and completion order | FS lines 12552–12560, IX.3.1, p.324; lines 12624–12650, IX.3.2, pp.326–327 | Completion on each qc open precedes its support colimit. Pro-p compactness is correct; the roadmap already repairs the source's overly broad compactness assertion. |
| Integral finite generation | DHKM lines 27–40 and 71–72, Theorems 1.1–1.2 p.1 and Corollary 1.4 p.2 | Noetherian coefficients are retained; general noetherian Z[1/p]-algebras receive noetherianity, not the stronger centre-finiteness claim without its Z_l-algebra hypothesis. |
| Compact stalks and nonbasic duality | HHS lines 234 and 2277–2297, Theorems 1.3.1, 7.1.4 pp.6,60–61, and coefficient footnote p.2; HI lines 956–959, Proposition 4.1 p.24 | Torsion scope for the HHS application and the nonbasic character/shift are retained. |
| Constant-term normalization | HI lines 998–1021, Propositions 4.4–4.5 p.25; lines 1057–1066, Lemma 4.7 p.26; FS IX.7.2 | The character, dimension shift and geometric-Frobenius exponent are separate data. HI 4.7 concerns the twisted parameter embedding, not a general stacky six-functor theorem. HS4.6 explicitly makes the additional chart comparison a target. |
| Profinite components | Stacks line 2117, Tag 0906 | The profinite-component assertion is for spectral spaces. HS2.16 keeps its additional quotient/topology hypotheses. |

**Computed adversarial table.** Shifts use cohomological indexing: `Λ[a]` has its nonzero cohomology in degree `−a`. `O` in lattice examples denotes the de Rham valuation ring with uniformizer ξ. “Matches” means that the stated test agrees; “excluded” identifies a necessary stated hypothesis. The source mistakes are recorded separately, rather than attributed to the roadmap.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions: slope and Kottwitz sign | G_m, b=π and b=π⁻¹, in mixed and equal characteristic | (ν,κ,deg)=(1,1,−1) and (−1,−1,1); deg=−κ in both cases. | Matches; no mathematical change. |
| Conventions: modification direction and inverse | O(−D)→O; GL₂ μ=(1,0) | κ_source−κ_target=1; inverse type −1. For GL₂, −w₀μ=(0,−1), not (−1,0). | Matches; no mathematical change. |
| Conventions: σ-conjugation and its composition | Frames y,z, including noncommuting permutation matrices | z(ybσ(y)⁻¹)σ(z)⁻¹=(zy)bσ(zy)⁻¹; reversed yz generally differs. | Matches; no mathematical change. |
| Conventions: admissible local datum | GL₂, b=[[0,1],[p⁻¹,0]], p=2 and 3 | v(det b)=−1; μ=(1,0) has −μ♯=−1; Newton slopes both −1/2. | Matches; no mathematical change. |
| Conventions: coefficient and half-twist domain | p=2, ℓ=3; p=3, ℓ=2; Λ=0 | r²=q remains a specified coefficient choice; Λ=0 sends every kernel/complex to 0. ℓ=p and q=1 are outside the local-field/coefficient hypotheses. | Matches; no mathematical change. |
| HS0.1: Hecke groupoid and source/target | G=1, I=∅ or singleton | Hck^∅=point; Hck^{1}=Div¹, both projections give the unique bundle. | Matches; no mathematical change. |
| HS0.1: unit and swap | G_m, degrees (d−n,d), n=1 | Swap gives (d,d−1), second swap (d−1,d); unit has n=0 and both bundle projections degree d. | Matches; no mathematical change. |
| HS0.1: arrows and automorphisms | G_m, arbitrary pair of degrees over one geometric leg | Isomorphism classes are Z²; each stabilizer is diagonal Eˣ, not the trivial group or Eˣ×Eˣ. | Matches; no mathematical change. |
| HS0.1: repetition and essential image | Two equal legs; empty set→one leg | Surjective repetition preserves every meromorphic α; empty→one has image type 0 only, excluding ξ of type 1. | Matches; no mathematical change. |
| HS0.1: completion and base change | Rank-one α=ξ; change uniformizer ξ′=uξ | Local double coset remains valuation 1; unit gives valuation 0; inversion gives −1 before and after completion. | Matches; no mathematical change. |
| HS0.2: bounded relative position | GL₂, total length 2 | Allowed dominant types include (2,0),(1,1), both determinant valuation 2; (1,0) has valuation 1 and is excluded. | Matches; no mathematical change. |
| HS0.2: monotonicity and closure | GL₂, bounds (1,1)≤(2,0) | The central lattice ξO² lies in the smaller point and the larger closure; the cyclic quotient of length 2 is only in the larger cell. | Matches; no mathematical change. |
| HS0.2: exhaustion versus quasi-compactness | G_m, union of all one-leg types | Each point has one integer bound; all components form Z, not a quasi-compact bounded piece. | Matches; no mathematical change. |
| HS0.2: collision transport for a nonsplit torus | Quadratic restriction of scalars, weights (1,0) | Identical lifts sum to (2,0); conjugate lifts sum to (1,1). Torus dominance is equality, so these bounds differ. | Matches; no mathematical change. |
| HS0.2: torus collision and inverse bounds | Weights 1 and −1 at the same leg | Total type=0; separate chain types=(1,−1). Inversion gives (−1,1), again total 0. | Matches; no mathematical change. |
| HS0.3: smooth cell and bounded proper fibre | GL₂, μ=(1,0) or (2,0) | Dimensions are 1 and 2. Minuscule fibre is P¹; dimension of the latter bound is 2, not the dimension-1 flag variety. | Matches; no mathematical change. |
| HS0.3: unbounded properness control | G_m, all components | Each bounded fibre is a finite union of points; unbounded fibre has infinitely many open components Z and is not qc. | Matches; no mathematical change. |
| HS0.4: chain versus composition | GL₂, O²/ξO² versus O/ξ² | Intermediate length-one lattices form P¹ in the first case and one point in the cyclic case; composition is not injective. | Matches; no mathematical change. |
| HS0.4: torus associativity | Source relative to target for types 1,2,−1 | Total type=(1+2)+(−1)=1+(2−1)=2; degree of first lattice is d−2 in either association. | Matches; no mathematical change. |
| HS0.4: disjoint factorization | Two disjoint legs, types 1 and −1 | Independent relative valuations are (1,−1); fusion has valuation 0 and loses the separate labels. | Matches; no mathematical change. |
| HS0.5: genuine Frobenius collision | Torus legs related by one nonzero Frobenius translate, types a=1,c=−1 | Backward modification has total type a+c=0; the retained Frobenius step still has type c=−1, not 0. | Matches; no mathematical change. |
| HS0.5: collision fibre | GL₂, two minuscule steps, equal versus nonzero-translated untilts | Equal-leg fusion has P¹ above the central lattice; the twisted construction retains a separate step instead of identifying its data with the fused point. | Matches; no mathematical change. |
| HS0.6: basic twisting | b=1; torus b=π; basic GL₂ slope 1/2 | Identity twist is identity; torus line O(−1) twists to O; slope-1/2 centralizer is Dˣ, not GL₂(E). | Matches; no mathematical change. |
| HS0.6: exclude nonbasic inner-form shortcut | GL₂, O(1)⊕O | J_b(E)=Eˣ×Eˣ, but full Aut has an additional BC(O(1)) of dimension 1; the basic-only equivalence is not asserted here. | Matches; no mathematical change. |
| HS1.0: integral tensor generator | Ĝ=G_m, Q=1, U=χ₁⊕χ₋₁ | U^⊗0 has weight 0; U has weights ±1; U^⊗2 has weights 2,0,0,−2. Using χ₁ alone never produces weight −1. | Matches; no mathematical change. |
| HS1.0: coefficient-projective retract | Trivial group; idempotent e on Λ^n | The generated module is eΛ^n; complementary projector gives (1−e)Λ^n and their sum Λ^n. No freeness of eΛ^n is inferred. | Matches; no mathematical change. |
| HS1.0: modular finite group resolutions | Ĝ=1, Q=C₂, Λ=F₂ | The periodic resolution has alternating g−1 and 1+g, equal in characteristic 2; on the trivial module both maps are 0, leaving an unbounded tail. | Matches; no mathematical change. |
| HS1.0: algebraic versus Weil-quotient domain | Q=A₅, trivial pinned action | A₅ has derived subgroup A₅; finite Weil quotients have solvable p-group/cyclic/cyclic filtration. Algebraic target applies; the required Weil surjection does not exist. | Matches; no mathematical change. |
| HS1.0: empty exterior product | I=∅, finite projective module M | Empty product category retains M as a retract of Λ^n; its image is M, not merely the single free rank-one module. | Matches; no mathematical change. |
| HS1.0: prime restrictions in supplier generation | Ĝ=PGL₂, ℓ=2≠p | Torsion fundamental-group order=2; GS integral interface applies, while LP6.2 prime condition reads 2∤2, false. | R02: separate the contracts; retain all-prime HS1.0. |
| HS1.1: solid Satake normalization | Smooth minuscule GL₂ cell, d=1 | S=Λ[1](1/2); D(S)=S; S′=Λ[−1](−1/2). Using S for S′ reverses the shift. | Matches; no mathematical change. |
| HS1.1: solid-dual Demazure generation | Torus components 0 and 1 | Point generators have dual Λ on their own components; cross-component Hom=0. A generator restricted to component 0 cannot generate the weight-1 kernel. | Matches; no mathematical change. |
| HS1.1: duality is not arbitrary-colimit preservation | Infinite sum of coefficient-field vector spaces at a point | Dual of ⊕_N Λ is ∏_N Λ; ⊕_N Λ is strictly smaller (constant sequence 1 lies only in the product). | Generation must be proved for the dual kernels; the README states that additional target. |
| HS1.1: local kernel ownership | Weight 1 for G_m; minuscule GL₂ | Both local constructions give the same point kernel and Λ[−1](−1/2), respectively. | R03: import GS4.25, then pull back globally. |
| HS1.2: solid transform and unit | G_m, degree d, weight n; V=0 | Target support is d+n; weight 0 gives d; zero representation gives zero complex. | Matches; no mathematical change. |
| HS1.2: empty legs and coefficient modules | I=∅, representation M=Λ² | Transform is M⊗A=A⊕A; only M=Λ is the identity functor. | Matches; no mathematical change. |
| HS1.2: nontrivial coefficient representation | G=1, Q=C₂, sign representation, char Λ≠2 | Underlying module rank 1; nontrivial Weil element acts by −1, versus +1 on the unit. | Matches; no mathematical change. |
| HS1.3: reversed operator composition | f(x,y)=(x+y,y), g(x,y)=(x,y+x) | g(f(1,0))=(1,1), f(g(1,0))=(2,1); the order cannot be discarded before the symmetry identification. | Matches; no mathematical change. |
| HS1.3: fused Satake convolution | GL₂, two minuscule steps over central lattice | RΓ(P¹,Λ)[2](1)=Λ[2](1)⊕Λ, cohomology degrees −2 and 0; a point kernel has only one summand. | Matches; no mathematical change. |
| HS1.4: geometric lisse preservation | G_m, W=χ₁, finite free A on degree d | The fibre translates A to degree d+1 with the same finite rank; W=0 gives 0. The new geometric statement does not require choosing a Q-extension of W. | Matches; no mathematical change. |
| HS1.5: two adjoints | Torus χ_n and χ_−n | Translations by n then −n, and by −n then n, both return degree d; both triangle composites on a basis vector are that vector. | Matches; no mathematical change. |
| HS1.5: compactness via adjoints | Trivial group, finite-dimensional V of rank 2 | T_V(A)=A²; left/right adjoint uses V∨ of rank 2. Both preserve finite perfect complexes; replacing V by an infinite sum leaves the finite-projective domain. | Matches; no mathematical change. |
| HS1.6: ULA criterion and its owner | G=1, A=F_ℓ^r versus ⊕_N F_ℓ | Derived invariants are A itself; finite r is perfect, infinite direct sum is not. The internal-Hom dualizability test gives the same result. | R03: import VS5.3 criterion; keep new geometric preservation. |
| HS1.7: swap plus dual in BZ exchange | Torus weight n | Swap changes n to −n; representation dual changes −n back to n. The combined operator again translates by n, not −n. | Matches; no mathematical change. |
| HS1.7: homology pairing exchange | Torus sheaves supported at degrees d,e | Left pairing is supported when e=d+n; right pairing translates e by −n and is supported when e−n=d: identical condition. | Matches; no mathematical change. |
| HS1.8: condensed parameter dependence | G=1, M=Λ, parameter space of two points | Hom(M,M)(S)=Λ×Λ; at a point it is Λ. A constant value Λ for every S loses one coordinate. | Matches; no mathematical change. |
| HS1.8: continuous rather than finite inertia | Kummer rank-two Z_ℓ representation | Inertia t acts by [[1,t],[0,1]]; t=ℓ^m is nonzero for every m. The kernel contains no open subgroup of the tame Z_ℓ factor. | Matches; no mathematical change. |
| HS1.8: compact-induction endomorphisms | Open pro-p K, coefficients with ℓ≠p | Ext above degree 0 vanishes by exact invariants; degree 0 has basis K-double cosets. For K=1 in a finite p-group, rank is the group order. | Matches; no mathematical change. |
| HS1.9: descended Weil action | G=1, unramified rank-one character with Frobenius a | Descended Frobenius is a; choosing a≠1 distinguishes it from the trivial action although underlying rank is 1. | Matches; no mathematical change. |
| HS1.9: essential-image restriction | A perfect constant Λ-module versus arbitrary solid object | The first has finite-projective fibre Λ and is a local system; the second is not assigned that fibre merely by fully faithful pullback. For ⊕_NΛ the fibre has infinite rank. | Matches; no mathematical change. |
| HS1.10: derived coefficient change | Z_ℓ→F_ℓ and A=Z_ℓ/ℓ | A⊗^L F_ℓ has F_ℓ in degrees 0 and −1; ordinary tensor has only degree 0. Derived wording preserves the Tor summand. | Matches; no mathematical change. |
| HS1.10: unit and zero base changes | Λ→Λ identity and Λ→0 | Identity sends S′ to S′; zero change gives 0, as does the operator after base change. | Matches; no mathematical change. |
| HS2.1: framed shtuka empty legs | G_m, b=1 or p | For b=1 the level objects are Eˣ/K; for b=p, slopes differ and the moduli are empty. | Matches; no mathematical change. |
| HS2.1: one-leg bound and framing | G_m, μ=1 | b=p⁻¹ yields κ=−1 and a nonempty modification O→O(1); b=p has κ=1 and yields none. | Matches; no mathematical change. |
| HS2.2: two-bundle orientation | G_m, source parameter b=π, target b′=1, type 1 | Source is O(−1), target O, type=1; reversing b,b′ requires type −1. Keeping type +1 after reversal gives empty locus. | Matches; no mathematical change. |
| HS2.2: full automorphisms with no legs | GL₂, b=b′ corresponding to O(1)⊕O | The isomorphism space contains upper-right H⁰(O(1)); replacing it by J_b(E) sets that dimension-1 group to 0. | Matches mathematics; R01 repairs its supplier. |
| HS2.3: slope zero versus integral triviality | Unramified quadratic norm-one torus, μ=0 | Coinvariants X_*(T)_Γ=Z/2; a nonzero torsion class has rational Newton 0 but κ=1. Slope zero holds, trivial-bundle condition fails. | Matches; no mathematical change. |
| HS2.3: model/level data | GL₂ Iwahori versus hyperspecial level | Index of Iwahori in GL₂(O_E) is q+1, equal to 3 for q=2; forgetting the integral level would incorrectly give index 1. | Matches; no mathematical change. |
| HS2.4: one-leg modification adapter | G_m, μ=1, b=p⁻¹ | Framed shtuka and modification models both have target O(1), κ=−1; the opposite-source convention uses μ⁻¹=−1. | Matches; no mathematical change. |
| HS2.5: period fibre at finite and infinite level | G_m, K=O_Eˣ | Finite-level fibre Eˣ/O_Eˣ=Z is discrete; infinite-level fibre Eˣ contains the nondiscrete open subgroup O_Eˣ. | Matches; no mathematical change. |
| HS2.5: admissible image exclusion | G_m, μ=1, b=1 | Kottwitz mismatch 0≠−1 makes both the tower and admissible image empty; no surjectivity onto the whole period space follows. | Matches; no mathematical change. |
| HS2.6: transition degree | GL₂(Z₂)→principal level one; G_m over Z₃, level two | GL₂(F₂) has (4−1)(4−2)=6 elements; (Z/9)ˣ has 6 elements. Degrees equal indices, not p-powers in general. | Matches; no mathematical change. |
| HS2.6: normality for deck group | Finite quotient S₃, subgroup generated by (12) | Index is 3, but conjugating by (123) gives subgroup generated by (23). The cover degree is 3 without a quotient group S₃/H. | Matches; no mathematical change. |
| HS2.6: inverse in source action | Two noncommuting source changes g,h | h·(g·τ)=τg⁻¹h⁻¹=τ(hg)⁻¹; omitting the inverses changes the claimed left action. | Matches; no mathematical change. |
| HS2.7: multileg collision comparison | Two GL₂ minuscule legs at one divisor | Chain fibre over ξO²=P¹ while fused lattice is one point; the map cannot be an isomorphism on that collision. | Matches; no mathematical change. |
| HS2.7: properness qualifiers | No legs, G_m, K=O_Eˣ | Space is Z; each singleton is proper over the base, their union is not qc. Local partial properness is compatible with this example. | Matches; no mathematical change. |
| HS2.8: basic duality | G_m, b=π⁻¹, μ=1 | Inverted datum has b⁻¹=π, μ⁻¹=−1; twice inverting returns (π⁻¹,1). For nonbasic GL₂ the lower-rank centralizer is not an inner form of GL₂. | Matches; no mathematical change. |
| HS2.9: equal-characteristic tower | E=F₂((π)), G_m, μ=1 | b=π⁻¹ gives κ=−1 and the Lubin–Tate component index Z; b=π gives κ=1 and the corresponding admissible locus is empty. | Matches; no mathematical change. |
| HS2.9: no-leg general tower | G_m, b=1, K=O_Eˣ, both characteristics | The formula gives Eˣ/K=Z in each case; b≠1 gives ∅. No use of p as the equal-characteristic uniformizer is made. | Matches; no mathematical change. |
| HS2.9: level limit and commuting actions | Rank-one trivialized period torsor | Limit of Eˣ/K is Eˣ; source acts by precomposition inverse and target by multiplication, so j(τg⁻¹)=(jτ)g⁻¹. | Matches; no mathematical change. |
| HS2.10: minuscule rigid dimension | GL_n, μ=(1,0,…,0), n=1,2 | Dimensions <2ρ,μ> are 0 and 1; Lubin–Tate fibres have the corresponding rigid dimensions. | Matches; no mathematical change. |
| HS2.10: exclude non-minuscule flag replacement | GL₂, μ=(2,0) | Schubert dimension=2; flag variety dimension=1. The minuscule rigidification theorem cannot identify these. | Matches; no mathematical change. |
| HS2.11: crystalline and HT sign | Q_p(1) | D_cris Frobenius=p⁻¹σ, isocrystal slope −1, bundle degree +1, HT convention +1. Using pσ reverses the invariant. | Matches; no mathematical change. |
| HS2.11: bound versus exact Hodge type | GL₂, bound (2,0), boundary type (1,1) | Both have total weight 2; actual elementary divisors at boundary are 1,1, not 2,0. The bounded assertion does not force equality. | Matches; no mathematical change. |
| HS2.12: non-classical BB failure | Equal-characteristic lattices with matrices M_a=[[1,a/ξ],[0,ξ⁻²]] | M_a⁻¹M_b=[[1,(b−a)/ξ],[0,1]]. For a=0,b=1 it is nonintegral, although the associated filtration is the same. | Matches; no mathematical change. |
| HS2.12: weak versus integral admissibility | Quadratic norm-one torus, λ=0, torsion κ=1 | Rational κ=0 and Newton=0 satisfy weak acceptability; integral equality requires 1=0 in Z/2, false. No admissible trivialization results. | Matches; no mathematical change. |
| HS2.13: adjoint-isomorphism comparison | Map of tori T→1, matching datum | Both admissible period loci are the base; infinite-level torsor is induced by T(E)→1. With mismatched κ source is empty, so matching admissibility is essential. | Matches; no mathematical change. |
| HS2.13: basicness under adjoint isomorphism | Torus T and 1 | Both adjoint groups are 1; every Newton point is central, so both basicness predicates are true. Finite kernel is not required. | Matches; no mathematical change. |
| HS2.14: torus components | G_m Lubin–Tate tower at infinite level | Geometric components form an Eˣ-torsor, not just Z; quotienting by O_Eˣ gives Z. | Matches; no mathematical change. |
| HS2.14: determinant and level | GL_n, K=1+p^m M_n(Z_p) | det(K)=1+p^m Z_p; taking all Z_pˣ would replace the actual finite-level component quotient by a smaller one. | Matches; no mathematical change. |
| HS2.14: products | Two torus towers with component groups Eˣ | Product components are Eˣ×Eˣ; projecting to one determinant loses a full factor. | Matches; no mathematical change. |
| HS2.15: nonemptiness iff B(G,μ⁻¹) | G_m, μ=1, v(b)=−1 or +1 | For v(b)=−1, κ=−1 and the point locus is nonempty; for +1 the Kottwitz equality fails and the locus is empty. Both directions distinguish the sign. | Matches; no mathematical change. |
| HS2.15: dimension and connected complement | Smooth connected curve d=1, closed points dim 0 | Hansen inequality is 2·0+2≤2·1, equality; removing the points preserves π₀. Taking Z=X yields 4≤2, false, so the empty complement is excluded. | Matches; no mathematical change. |
| HS2.15: relative HN dimension | L=GL₂, M=T, ν=(1,0) | <2ρ_L−2ρ_M,ν>=1; average ν=(1/2,1/2) gives 0. The roadmap uses the former, not the source error. | Matches; no mathematical change. |
| HS2.15: density and lower-dimensional locus | Minuscule GL₂ cell P¹ and finite closed set | Cell dimension=1, closed set dimension=0; no nonempty open has dimension 0. Complement remains dense and connected. | Matches; no mathematical change. |
| HS2.16: compact-group component transitivity | K=Z_p acting on itself | π₀(K)=Z_p, quotient has one point, K acts transitively. Orbit maps have closed image because K is compact. | Matches; no mathematical change. |
| HS2.16: noncompact countercontrol | Discrete Z acting by translation on Z_p | Each orbit is dense; quotient is indiscrete and connected, but 0 and a p-adic integer outside Z are different orbits. | Excluded by compactness/topological hypotheses; no change. |
| HS2.17: compactifiable local structure | No-leg G_m tower | Each point of Z has dimension 0, is separated and compactifiable; the whole infinite discrete union is not qc. No global properness is inferred. | Matches; no mathematical change. |
| HS2.18: reciprocity on Frobenius | Arithmetic Frobenius of degree 1 | Geometric reciprocity gives π⁻¹, valuation −1; its inverse-pullback component action shifts degree by +1. Reversing either convention reverses that shift. | Matches; no mathematical change. |
| HS2.18: inertia normalization | E=Q₇, Teichmüller unit u of order 3 | For χ(u)=ζ₃, inverse convention gives ζ₃²≠ζ₃. This separates reciprocity from its inverse even when valuation is 0. | Matches; no mathematical change. |
| HS2.18: no profinite replacement of Weil action | Frobenius translating component Z by 1 | Orbit of 0 is all Z, infinite; a continuous profinite action on a discrete set has finite orbits. Weil degree Z is necessary. | Matches; no mathematical change. |
| HS3.1: twisted coefficients and collisions | One GL₂ minuscule leg versus two fused legs | One leg has solid shift −1; two-leg central fibre retains cohomology in degrees −2 and 0 after the stated torsion conversion. | Matches; no mathematical change. |
| HS3.1: partial Frobenius coherence | Two leg actions, with shear matrices as wrong model | The shears send (1,0) to (1,1) and (2,1) in opposite orders; a coherent product Weil action requires equality and excludes this pair. | Matches; no mathematical change. |
| HS3.2: Huber completion order | Disjoint union of points indexed by N | Support colimit gives ⊕_N Z_ℓ. Completing that sum instead admits Σ ℓ^nδ_n, of infinite support, which is absent from the stated complex. | Matches; no mathematical change. |
| HS3.2: localization order | Tower Z/ℓ^m at a point | lim_m Z/ℓ^m=Z_ℓ and then invert ℓ gives Q_ℓ; inverting ℓ at each finite level gives 0 and limit 0. | Matches; no mathematical change. |
| HS3.2: tower transitions | Finite degree N cover of discrete points | Pullback δ_x is the sum of N lifts; direct sum over levels uses these maps, not trace collapsing them to δ_x. | Matches; no mathematical change. |
| HS3.3: compact-support dimension shift | One-dimensional smooth minuscule piece | RΓ_c=Λ[−2](−1); applying [2](1) gives Λ. Normalized Satake gives Λ[−1](−1/2), with cohomology in degree 1. | Matches; no mathematical change. |
| HS3.4: Hecke realization at weight zero | G_m, b=1 versus b≠1 | Restriction at b=1 is c-Ind_K^{Eˣ}Λ; at a different degree it is 0. Both match the no-leg/zero-modification tower. | Matches; no mathematical change. |
| HS3.4: collision realization | GL₂ central lattice after two minuscule modifications | Both Hecke convolution and tower Satake coefficient have two fibre-cohomology summands; replacing them by the constant point coefficient leaves only one. | Matches; no mathematical change. |
| HS3.5: finite generation versus coefficient rank | G_m, K=O_Eˣ, coefficient Z_ℓ | c-Ind_K^{Eˣ}Z_ℓ has infinitely many coefficient basis vectors indexed by Z but one generator as a smooth Eˣ-representation. | Matches; no mathematical change. |
| HS3.6: pro-p compactness negative control | E=Q₃, G_m, K=Z₃ˣ, Λ=F₂, zero bound | K has C₂ quotient; H^n(C₂,F₂)=F₂ for every n≥0. Derived Hom is unbounded, so the compactness conclusion fails without the level restriction. | Matches; no mathematical change. |
| HS3.6: positive pro-p control | Replace K by 1+3Z₃, Λ=F₂ | Finite quotients have odd order; invariants are exact, higher H^n=0. Compact induction has the compact-projective behavior used by the theorem. | Matches; no mathematical change. |
| HS3.7: pull/trace index identity | Two-sheeted cover, Λ=F₂ | tr(pull δ)=2δ=0; pull(tr δ_first)=δ_first+δ_second. No normalized trace by 1/2 exists. | Matches; no mathematical change. |
| HS3.7: allowable normalization and transitivity | Pro-3 cover of degree 3 over F₂; nested indices 3,3 | 3=1 in F₂ is invertible; normalized trace is defined. Composite index is 9=3·3, matching composite traces. | Matches; no mathematical change. |
| HS3.8: adjoint formula and admissibility | Trivial group/weight, admissible finite-dimensional ρ | C=Λ, RHom(C,ρ)=ρ, adjoint Hecke operator is identity. Nonzero degree shifts do not appear in this zero-dimensional case. | Matches; no mathematical change. |
| HS3.8: perfect invariants require pro-p level | ρ=F₂, E=Q₃, K=Z₃ˣ | RΓ(K,ρ) has nonzero classes in all degrees from C₂; at pro-3 K the invariant complex is F₂[0]. | Matches; no mathematical change. |
| HS3.8: nonbasic dualizing factor | GL₂, O(1)⊕O, d_b=1 | The stratum dualizing shift is −2d_b=−2 with inverse modulus character; for a basic class d_b=0. Omitting it identifies unequal shifts. | Matches; no mathematical change. |
| HS3.9: covariant Dieudonné normalization | Height-one étale and multiplicative groups | After φ=p⁻¹F, slopes are 0 and −1, respectively; multiplicative target is O(1). The supplier and HS convention agree. | Matches; no mathematical change. |
| HS3.9: GL_n numerical comparison | n=2,d=1, minuscule datum | κ(b)=−d=−1 and dimension d(n−d)=1; d=0 gives κ=0 and dimension 0. Neither forces integral representability by itself. | Matches; no mathematical change. |
| HS3.9: nonreduced deformation control | Square-zero thickening k[ε]/ε², tangent rank d(n−d)=1 | A one-dimensional deformation direction has parameter aε; forgetting to the reduced fibre sends every aε to 0. The independent deformation functor must retain that direction. | Matches; no mathematical change. |
| HS3.10: stratum correspondence sign | G_m, source κ=1, weight n=1 | Target κ=κ_source−n=0; associated degrees go −1→0. The opposite sign would incorrectly give κ_target=2. | Matches; no mathematical change. |
| HS3.10: identity and off-diagonal strata | Weight zero, b=b′ and b≠b′ | Diagonal operator is identity; off-diagonal is 0 because bundle classes differ. | Matches; no mathematical change. |
| HS3.10: chart-weighted versus unweighted nonbasic correspondence | GL₂, O(1)⊕O | Positive kernel has dimension 1, hence the chart dualizing correction contains a shift of magnitude 2; the basic case has kernel 0 and shift 0. | Matches; no mathematical change. |
| HS4.1: coherent finite-set family | G_m, weights n,m and empty legs | Both this family and AG2.6 send degree d to d+n+m and have empty-leg unit id. Coalescence uses the same diagonal Weil action. | R03: import AG2.6; state only an additional enrichment comparison if needed. |
| HS4.2: trace versus triangles | Free module rank 0,1,2; characteristic 2 | Symmetrized cup-cap scalar is rank: 0,1,2; rank-2 scalar becomes 0 in F₂. Both triangle composites remain id on F₂², which is not zero. | Matches; no mathematical change. |
| HS4.2: creation equivariance | Torus two-leg character and γ₁,γ₂ | Scalar is χ(rec_HS(γ₁γ₂⁻¹)); on diagonal γ₁=γ₂ it is 1. Independent factors with unequal characters need not fix creation. | Matches; no mathematical change. |
| HS4.2: exact-pairing transport | Identity strong monoidal functor, one-dimensional pairing | Unit and tensor comparisons are identity, so transported ev/coevaluation are the originals and both triangles evaluate to 1. | Matches; no mathematical change. |
| HS4.3: change of group | G_m→G_m, x↦x² | Weight n restricts to 2n; a degree-one line pushes to degree 2. Both modification and dual representation sides multiply by 2. | Matches; no mathematical change. |
| HS4.3: no finite-kernel assumption | Torus T→1 | Adjoint map is 1→1, an isomorphism; kernel is all T. The unit representation and zero-type target remain valid. | Matches; no mathematical change. |
| HS4.4: product Künneth | Two tori, weights n,m, ranks 2,3 | Support=(d+n,e+m); tensor rank=2·3=6. Interchanging factors gives (e+m,d+n) with the same rank. | Matches; no mathematical change. |
| HS4.5: Weil restriction normalization | Extension residue degree f, ramification e=2,f=1 | Coefficient square root stays r^1=r, while index [W_E:W_F]=ef=2 and one-leg induced rank doubles. | Matches; no mathematical change. |
| HS4.5: induction must precede two-leg tensor | Index-2 subgroup, two trivial rank-one representations | Ind(V)⊗Ind(W) has rank 4; Ind(V⊗W) has rank 2. The specified per-leg induction gives 4. | Matches; no mathematical change. |
| HS4.6: nested Levi degree | GL₃, λ=(2,1,0), Levi GL₂×G_m then torus | First degree=2+1−0=3; second=2−1=1; sum=4=2·2−2·0. Negative shifts and inverse twists add/multiply accordingly. | Matches; no mathematical change. |
| HS4.6: switched Grassmannian sign | GL₂ upper Borel, λ=(1,0); P=G control | Degree is 1, hence shift −1 and inverse central twist; P=G gives degree 0 and twist 1. Opposite parabolic reverses the degree. | Matches; no mathematical change. |
| HS4.6: sufficiently unstable hypothesis | Rank-two slopes separated by h, modification bound m | A root map has slope difference h; bounded modification changes it by at most the fixed bound. h>bound preserves the filtration; h=0 provides no such conclusion. | Matches; no mathematical change. |
| HS4.7: tensor closure for fixed wild subgroup | P acts trivially on two factors | Actions are id⊗id=id on exterior product; restriction to diagonal is again id. Unit tensor power has action 1. | Matches; no mathematical change. |
| HS4.7: extensions and p-versus-ℓ | Finite p-group quotient with ℓ≠p | Averaging denominator is p^a, a unit in Λ; H¹ vanishes. For C_ℓ over F_ℓ, unipotent [[1,1],[0,1]] is a nontrivial extension, so that excluded case would fail. | Matches; no mathematical change. |
| R01 supplier repair | Nonbasic GL₂ full automorphism chart | Expected connected-kernel dimension=1; VS4.0 gives 1. Diagonal rational centralizer alone gives 0. | Replace stale Bun sections by the actual earlier owner. |
| R02 supplier repair | Highest-weight field theory versus integral perfect base change | Existing LP highest-weight section number=4.1, not 3.0; parameter generation=6.2, not 4.1–4.3. | Correct references and hypotheses; PGL₂ at ℓ=2 remains allowed in HS1.0. |
| R03 duplicate-family repair | Empty set and torus two-weight fusion | Existing AG2.6 outputs id and translation by n+m; HS4.1 outputs id and translation by n+m. | Delete duplicate construction, retain genuinely new comparison. |
| R04 API naming repair | Swap and GL₂ principal level-one transition | Swap twice has type −(−1)=1; index at p=2 is 6. Both assertions survive unchanged as prose. | Remove undeclared own API identifiers; keep empty Lean test. |
| R05 bibliographic repair | Authors, identifier and theorem labels | 2109.02594 has He–Zhou–Zhu; 2208.07195v3 has Gleason–Lim–Xu, Theorem 3.11/Proposition 3.12 on p.24. | Correct preprint identity; do not certify the printed page numbers. |

**Shape.** The five layers occur in build order with examples and dependencies. Geometric definitions have explicit maps, API lists and discriminating examples: the tests distinguish chain from fused objects, full from constant automorphism groups, weak from integral admissibility, torsion from completed coefficients, and trace from normalized trace. R04 concerns the prose/Lean naming contract, not the number of declarations that the acceptance test should contain. No change to the PR files was made.

## Not verifiable

- The GLX version-of-record pagination and printed theorem text at pp.812, 820, 824, 826, 828–829 and 845, 848–851 were not certified. The README explicitly marks this edition as cited by locator alone. The source service resolved the DOI to the legal arXiv:2208.07195v3 text; that preprint was read, but its page numbers are not a verification of the printed edition. This settled uncertified edition was not added to the missing-reference requests.
- No other cited work remains inaccessible. Hansen's initial publisher-host lookup failure was resolved by the rights-authorized institutional copy, obtained through the source service; the scratch missing-reference request was cleared. The full generality of the new integral tensor-resolution and solid-dual-generation assertions is a proof obligation of the roadmap: the source contains their proof route, not an independently stated theorem with all of this roadmap's quantifiers. The diagnostic instances above do not replace those proofs.

## Source issues

- **Error** in GL at §2.3, after Theorem 2.13, printed p.8 (GL line 312): the source says pairing with `2ρ_L−2ρ_M` is unchanged by averaging the Newton point to L; it should be retained before averaging, or use an L-Weyl-invariant functional; affects a stated result. For `L=GL₂`, `M=T`, `ν=(1,0)`, the displayed sides are 1 and 0.
- **Error** in FS at Proposition IX.3.2, printed p.326 (FS lines 12640–12643): the source says compactness and perfect derived Hom hold at every compact open level; it should be restricted to pro-p levels for the stated general coefficients; affects a stated result. For `E=ℚ₃`, `G=G_m`, zero bound, `K=ℤ₃ˣ`, `Λ=𝔽₂`, the C₂ quotient gives nonzero higher cohomology in every degree. HS3.6 already includes this correction.
- **Misprint** in FS at Proposition VII.7.10, printed p.276 (FS line 10699): the source says the exterior product of compact lisse objects belongs to the étale category; it should be in the lisse category used by the assertion; affects a stated result. The input and surrounding functors are lisse, including integral coefficients.
