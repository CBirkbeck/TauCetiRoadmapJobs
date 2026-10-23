# PORT-HeegnerPointEulerSystems

Branch: `roadmap/heegner-point-euler-systems`. Head: `f62ba61002c60c6a859bcbeeed2a53771a8eb9dc`. Base: `a07e202`.

Commit message: `HeegnerPointEulerSystems: roadmap (README, Suggested.lean, metadata)`.
Only `TauCetiRoadmap/HeegnerPointEulerSystems/README.md`, `TauCetiRoadmap/HeegnerPointEulerSystems/Suggested.lean` and `TauCetiRoadmap/HeegnerPointEulerSystems/metadata.toml` differ from the base. The worktree is clean. No push, pull request, issue or comment was made. This report is the separately requested package report and is not part of the roadmap commit.

## Validation

The requested module build exited 0. Exact final output:

```text
✔ [8976/8976] Built TauCetiRoadmap.HeegnerPointEulerSystems.Suggested (21s)
Build completed successfully (8976 jobs).
```

Warning count: **0**, including **0** sorry warnings and **0** other warnings. The final acceptance file contains no declarations; this build certifies its imports and module, not mathematical proofs or elaboration of the README targets.

The requested full gate, with `--base origin/main`, exited 0 against the committed clean worktree. Exact summary:

```text
gate HeegnerPointEulerSystems: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The content scanners passed before the commit. The gate's clean-worktree requirement made its final successful invocation necessarily follow the commit; its preceding sole failure was `dirty=1` for the new roadmap folder.

The requested dependency check, with `--movable`, exited 0. Its entire output was:

```text
depcheck: 20 roadmaps, 162 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The gate's dependency graph sees the 20 readable open-roadmap suppliers; it does not establish the five unavailable supplier specifications listed below. No tooling, merge-order file, pin, root README or generated index was edited.

Structural inventory: 127 numbered target sections, 112 individual definition/API bullets, 45 Checks blocks with at least three bullets each, ten layers with ten Examples and ten Dependencies subsections, and no unresolved internal Markdown anchors. Metadata is `topic = "math.NT"`, matching the repository's one-key form.

## Draft pull request body

Builds the integral Heegner-point conductor family, its exact trace and reduction laws, and the corrected Kummer classes needed for arithmetic descent. The roadmap develops rank and Tate–Shafarevich bounds through exceptional, dyadic, CM and real-multiplication cases, then constructs the anticyclotomic Heegner family for nonvanishing, main-conjecture comparisons and refined determinant formulas. It keeps periods, local errors and lattice normalizations explicit so that rational comparisons cannot silently supply integral conclusions.

The README gives the construction targets, APIs, discriminating Checks, source locators and supplier contracts. The acceptance module records why the arithmetic headline theorems require carriers beyond the pinned APIs; it introduces no stand-in arithmetic objects. General residual evaluation and selection statements, and classical higher-Heegner nonvanishing, are consumed from their existing roadmap owners.

AI-assisted port and author self-audit by Codex (GPT-6). The retained supplier obligations and unavailable specifications are documented in the package report; this is not an independent mathematical review.

## Dependencies still in open roadmap pull requests

The following are new roadmap folders at their indexed open heads. They are cited by roadmap and section, never by pull-request number. When a roadmap exists on main, the main copy was used rather than an open revision.

- EffectiveClassNumbers
- ComplexMultiplicationAndExplicitReciprocity
- ModularCurvesPartII
- HilbertModularVarietiesAndShimuraCurves
- ShimuraVarieties
- EllipticCurveModularity
- HeightsRationalPointsAndObstructions
- NeronModelsAndSemistableAbelianVarieties
- SelmerIwasawaCohomology
- ArithmeticStatisticsPartVI
- ArithmeticGaloisDuality
- EulerSystemsAndKolyvaginSystems
- FiniteFlatGroupsAndIntegralPadicHodgeTheory
- FaltingsFinitenessAndIsogenyTheorems
- ArithmeticGaloisRepresentations
- SerreWeightAndLevelOptimisation
- GL2AutomorphicRepresentationsAndTransfer
- GeometryOfNumbersAndQuadraticArithmetic
- PadicHodgeTheory
- EulerSystemsCyclotomicMainConjecture

Main/completed suppliers: GlobalNumberFields, ImaginaryQuadraticClassNumber, ClassFieldTheory, EllipticCurves, PadicMeasuresIwasawaAlgebras, Chebotarev.

The authorized merge-order names GrossZagierAndArithmeticHeights, ModularIwasawaMainConjectures, KatoEulerSystems, PadicHodgeRegulators and AutomorphicCongruences have no readable roadmap specification on main, in the supplied sibling heads, in their board package README locations, or in the indexed open-roadmap catalogue. Each was also checked with the named-roadmap tool. Their open-pull-request status and claimed section contents could not be certified. The accepted package's ownership decisions and explicit mathematical contracts are retained; none is reported as implemented.

The citation resolver has no missing own Lean names and four unresolved roadmap leads: GrossZagierAndArithmeticHeights, ModularIwasawaMainConjectures, KatoEulerSystems and PadicHodgeRegulators. AutomorphicCongruences is the additional unavailable contract owner even though the resolver did not emit it. The resolver's claim that pinned Lake packages are unavailable is a tool-environment limitation: the pinned checkout files were independently inspected directly, as recorded below.

## Acceptance file and signature audit

Nothing moved from Lean into the README during this port. The supplied acceptance file already has zero theorems, definitions, instances, examples and admitted data. Its only change is the module-docstring inventory: it no longer claims that the imported classical higher-point theorem of former §8.23 belongs to this roadmap. All allowed statements in the supplied file were therefore preserved.

The headline inventory was reconsidered against the actual pins. Native continuous cohomology, the generic Tate–Shafarevich localization kernel, Tate modules, point groups and completed coefficient algebras do not specify the CM family, Heegner Kummer system, arithmetic Selmer structures, integral regulator or determinant comparison. A few simple native definitions cannot construct these arithmetic inputs. The docstring names the missing carriers for each headline group; no free function or abstract Prop replaces one.

Mechanical binder audit: the declaration inventory is empty, so the list of `#check @name` probes and of elaborated own signatures to compare with README statements is empty. No binder was silently dropped and no signature change was required. No dummy declaration or scratch Lean build was introduced to make this count nonzero. The only import is `import Mathlib`; no Tau Ceti module is imported without use.

## Supplier replacements and ownership sweep

The sweep searched mathematical objects, not only proposed Lean names, across every indexed open-roadmap head and main via the roadmap grep tool, directly across main and board packages, and in both files of all 18 supplied sibling roadmap folders. Broad searches were followed by narrower searches for Kummer evaluation and ramification, local finite–singular pairings, higher-Heegner nonvanishing, integral endomorphism/image bounds, toric μ-invariants, elliptic-unit inputs, norm towers and determinant/profile constructions. Every cited readable supplier section was compared with the appropriate main or new-roadmap head. No declaration in the acceptance module has another roadmap's fully qualified name, because it has no declarations.

Five overlapping numbered targets were deleted rather than left as stubs; their ownership is recorded only in Scope and ownership in the README:

| Former target | Existing owner consumed |
| --- | --- |
| §5.6, residual Kummer-field evaluation pairing | EulerSystemsAndKolyvaginSystems §1.6 |
| §6.14, residual local pairing | EulerSystemsAndKolyvaginSystems §1.16 |
| §6.16, simultaneous residual detection | EulerSystemsAndKolyvaginSystems §1.16(a) |
| §6.17, residual ramification selection | EulerSystemsAndKolyvaginSystems §1.16(b) |
| §8.23, classical higher-Heegner nonvanishing | ArithmeticStatisticsPartVI, “Anticyclotomic character nonvanishing”, target `anticyclotomic_character_nonvanishing` |

This changes 132 numbered package targets to 127. The residual Heegner reciprocity, triangular basis and actual Λ-adic non-torsion targets remain, using the supplied general results. Section 8.21 remains because it treats general totally real F and prescribed tame character χ₀; the imported classical result has F=ℚ and trivial tame character. Section 4.1 retains the actual eigenvalue-ideal identification with EulerSystemsAndKolyvaginSystems §1.4. Section 8.15 retains the arithmetic specialization of its §5.12 profile. These differences are stated in Scope and ownership.

The accepted earlier ownership decisions are preserved: ImaginaryQuadraticClassNumber H1.4 supplies the conductor-unit exact sequence; EffectiveClassNumbers §2.8 supplies the classical conductor-one trace; GrossZagierAndArithmeticHeights owns CM moduli/canonical descent and rational Hodge classes. No later roadmap supplies an input, and no notion needed to move to this roadmap from a later owner.

The elliptic-unit hit in ModularSymbolsPadicLFunctions is the CM adjoint-Selmer vanishing target: it concerns infinite-image character quotients of opposite nonzero Hodge–Tate weights and its particular main-conjecture argument. It does not supply the independent integral residual-character/Katz anticyclotomic contract used here. The PadicFamilies hit is a cyclotomic Euler-system bound. Neither replaces the accepted elliptic-unit obligation. Generic dynamics, open-image, image-algebra, Selmer propagation and regulator constructions retain their supplier owners; this roadmap owns their verification and application to its fixed Heegner family.

## Upstream mathematical read: corrections

All statements below describe changes actually made, not instructions from the package review. Source locators refer to numbered text companions of the legal editions in `packages/HeegnerPointEulerSystems/sources.toml`.

| Location | Defect and correction | Computed negative control / source |
| --- | --- | --- |
| Conventions and §4.1 | Defined the conductor-one depth as ∞, while keeping I₁=0 and the direction I_n⊂p^m for coefficient reduction. | Empty ideal sum is 0; (25)⊂(5) gives reduction modulo 5, and the reverse direction fails. bcgs line 63; bcgs line 451. |
| Conventions | Distinguished finite coefficient DVRs from the completed maximal unramified integer ring; required nonzero characteristic-zero arithmetic carriers and positive squarefree conductors. | The residue field of ℤ_p^ur is infinite but its residue module has length 1; 12 is not squarefree; the zero ring has 1=0. |
| Conventions and §§8.11, 8.21 | Expanded (Heeg), (spl), (tor), CV(H1), CV(H2); restored Q≠P in CV(H2), so ramification at the moving prime does not force maximal level there. | (tor) fails for nonzero rational p-torsion; Eichler level P has exponent 1. bcgs line 42; bcgs line 65; bcgs line 476; cornut-vatsal line 1252; cornut-vatsal line 1978; cornut-vatsal line 2068. |
| §1.4 | Defined the orbifold correction B_X and required positive logarithmic canonical degree before normalizing the Hodge class. | Stabilizer order 2 contributes 1/2; deg(2x−D)=0 for deg D=2. cornut-vatsal line 1045–1064; its general owner remains GrossZagierAndArithmeticHeights §3.2. |
| Conventions, §§1.5, 1.6, 7.6 | Attached degree only to a finite curve parametrization or finite isogeny, rather than every Jacobian quotient; named the polarization λ_A:A→A∨ separately. | A dimension-two J mapping to an elliptic quotient has kernel dimension one; a finite polarization has finite degree. |
| §1.5 | Made the zero-map control a postcomposition of the actual quotient. | Composing any quotient with 0:A→A sends every CM point to 0 without claiming that a zero morphism is a nonzero quotient. |
| §2.4 | Defined both predecessor maps and their source conductors, and related lower/upper Hecke operators by the central P action. | O₂ maps to O₁ or P O₁; at q=5, 6−1=5 neighbors remain. cornut-vatsal line 2242 and following appendix lattice formulas. |
| §2.5 | Defined the oriented CM types and goodness, the predecessor pair and their behavior under reversal; added APIs and Checks. | (1,2),(2,1),(2,2) give I,II,III; the first two are good at nonmaximal level. cornut-vatsal line 269; cornut-vatsal line 2242. |
| §2.6 | Distinguished the ℓ-power endomorphism on the special fibre from arithmetic Frobenius of its quadratic residue field. | On 𝔽₉, i³=−i but i⁹=i. gross line 174–199. |
| §§2.7, 3.3, 3.4, 6.11 and contracts | Replaced obsolete Néron R11 locators and overly broad finite-flat references by the actual graph, torsion-specialization, crystalline and dyadic sections. | A geometric C₅ component with inversion has one rational point; a component C₄₉ has length 2 at 7. NeronModelsAndSemistableAbelianVarieties §§1.2, 1.10, 2.1–2.2, 2.6, 4.3–4.6, 5.0a–5.0c; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.21–R07.4.25 and R07.5.6a. |
| §5.2 | Specified the actual global change-of-group and localization square, rather than treating a local coefficient automorphism as a global operation; corrected the blanket claim about G_K-linearity. | Modulo 5, finite evaluation v is fixed, transverse evaluation changes to −v, and σ changes to −σ; their tensor is fixed. howard line 343; howard line 919; nekovar line 1468. |
| §§6.2–6.4 | Wrote Gross's exact residual-image, p odd, discriminant and nonzero-bottom assumptions, separately from Howard's hypotheses. | A zero Kummer line has dimension 0, not 1; a nonzero F₅ line has 5 elements. gross line 8; gross line 59. |
| §6.6 | Required H.0–H.5 for the triple and its Tate dual, the sufficiently deep auxiliary prime containment, and the source's p≥5 range. | Scaling a primitive bottom by p raises its index by one without raising the fixed finite module length. zanarella line 639–645. |
| §§6.18–6.19 and Conventions | Expanded the GL₂-type residual context and specified Zhang's (O,𝔭)-optimal quotient and p-unit Hecke-normalized degree-zero point map. | Modulo 5, [5] sends a nonzero class to 0, [2] preserves nonzeroness, and 3 has inverse 2. zhang line 708–744; zhang line 1374; zhang line 1488–1554. |
| §7.3 and Faltings contract | Replaced the unsupported inference End_K(A)=O_L from no-CM by the coefficient-linear no-CM/self-twist irreducibility criterion, followed by rational double-centralizer and almost-all integral commutant comparisons. | Scalar matrices cannot contain any nonzero multiple of E₁₂; full M₂(O) has matrix error 0. nekovar line 1638–1781. |
| §7.4 | Defined the CM stabilizer, u₀, its valuation M₀ and the exact auxiliary Frobenius depth; distinguished complex conjugation ρ from a residual representation. | u₀=2 and Nℓ+1=8 give degree 4; ramification indices 1,2 give M₀=1,2. nekovar line 1034; nekovar line 1172–1194; nekovar line 1281–1298. |
| §7.5 | Defined Φ_ℓ by its finite/singular evaluation normalization and anticommutation, and replaced ambiguous class division κ_n/ℓ by conductor index κ_(n/ℓ). | At n=15 and ℓ=3 the predecessor conductor is 5; scalar division by 3 does not change conductor 15. nekovar line 1430–1475. |
| §8.14 | Required a topological generator and a non-torsion unit for the nontrivial crystalline near-one family. | At p=5, (−1)⁴=1 while 6⁴=1296≠1 and v₅(6⁴−1)=1. bcgs line 495–502. |
| §8.25 | Kept the distinct continuous-character construction, with four explicit API laws rather than conflating continuity with inert-prime crystallinity. | At p=3 the generator values 4,64,262144 have depths 1,2,3. cs line 742. |
| §8.30 | Corrected the determinant Check to use the diagonal tensor y⊗y instead of two unrelated factors. | y=5 gives coefficient 25, not 5; γι(γ)=1. cs line 695–707. |
| §8.40 | Aligned the finite Sha quotient with W_(α⁻¹), dual to the system on T_α, and retained the conjugation length comparison. | α(γ)=4 gives inverse value 1/4 and paired product 1; using α twice gives 16. bcgs line 835–840. |
| Every layer | Replaced generic examples boilerplate by numerical worked examples that agree with its targets and Checks. | Initial group-ring content is 0 at 5 but augmentation depth is 2; a length-pair (3−1,3−1) has total 4; the full ledger follows below. |
| Citations and prose | Replaced nonresolving shorthand/fragment citations by named supplier sections, clarified gap labels, and retained source locators and exact hypotheses. | Resolver reports no missing own Lean names; the five unavailable external specifications remain disclosed. |

## Pin-level library evidence

Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both the manifest and the dependency checkout revisions were compared. The native definitions were read, not inferred from name matches. Representative numerical/boundary computations also appear in the ledgers.

| Declaration | Pinned repository-relative source and line | Scope retained |
| --- | --- | --- |
| Subring.comap | Mathlib/Algebra/Ring/Subring/Basic.lean:173 | Preimage under a ring homomorphism; not the finite full-order theorem. |
| ClassGroup.equivPic | Mathlib/RingTheory/PicardGroup.lean:876 | CommRing and IsDomain, with the actual class-group/Picard carriers. |
| CommRing.Pic.mapRingHom | Mathlib/RingTheory/PicardGroup.lean:579 | Functorial Picard map; not conductor-prime-to invertibility. |
| PadicInt | Mathlib/NumberTheory/Padics/PadicIntegers.lean:62 | Closed norm-at-most-one subring of the p-adic field, with prime instance for the field. |
| WeierstrassCurve.Affine.Point | Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:477 | Nonsingular affine points plus infinity, not all affine solutions. |
| Module.length | Mathlib/RingTheory/Length.lean:30 | Module length, not finite cardinality without further hypotheses. |
| Nat.primeFactorsList | Mathlib/Data/Nat/Factors.lean:38 | Use positive conductor and squarefreeness where required; n=0 is excluded. |
| PadicInt.ideal_eq_span_pow_p | Mathlib/NumberTheory/Padics/PadicIntegers.lean:545 | Requires nonzero ideal; I₁=0 is treated separately. |
| PadicInt.mem_span_pow_iff_le_valuation | Mathlib/NumberTheory/Padics/PadicIntegers.lean:472 | Requires x≠0; zero gets extended depth ∞ separately. |
| DihedralGroup.sr_mul_r, sr_mul_sr, inv_r, inv_sr | Mathlib/GroupTheory/SpecificGroups/Dihedral.lean:97,101,105,109 | Abstract relations do not construct the arithmetic ring-class action. |
| hensels_lemma | Mathlib/NumberTheory/Padics/Hensel.lean:459 | Simple approximate root condition; ordinary residue root has nonzero derivative. |
| PadicInt.isUnit_iff | Mathlib/NumberTheory/Padics/PadicIntegers.lean:385 | Norm 1 unit criterion, not a license to invert Φ. |
| MonoidAlgebra.single | Mathlib/Algebra/MonoidAlgebra/Defs.lean:222 | Finite group-ring basis; no completion or arithmetic interpolation. |
| Submodule.span | Mathlib/LinearAlgebra/Span/Defs.lean:46 | Smallest containing submodule; no saturation assertion. |
| LinearMap | Mathlib/Algebra/Module/LinearMap/Defs.lean:84 | Native bundled semilinear maps with the relevant scalar data. |
| MonoidHom | Mathlib/Algebra/Group/Hom/Defs.lean:366 | Multiplicative homomorphisms; continuity is additional data. |
| TensorProduct.tmul | Mathlib/LinearAlgebra/TensorProduct/Defs.lean:97 | Native algebraic bilinear tensor, not the Selmer determinant comparison. |
| Module.finrank | Mathlib/LinearAlgebra/Dimension/Finrank.lean:61 | Natural finite-rank conversion; no implied integral freeness. |
| ENat | Mathlib/Data/ENat/Defs.lean:17 | WithTop ℕ; distinguishes zero-system or empty-stratum depth ∞. |
| Pi.compactSpace | Mathlib/Topology/Compactness/Compact.lean:1177 | Product compactness without projection surjectivity assumptions. |
| IsCompact.inter_iInter_nonempty | Mathlib/Topology/Compactness/Compact.lean:293 | Requires closed constraints and finite intersection nonemptiness, including the empty finite family. |
| ContinuousCohomology.tateShafarevich | Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71 | Intersection of localization kernels for supplied TopRep and field family; no elliptic Kummer identification. |
| TauCeti.TateModule | TauCeti/Algebra/Module/Torsion/TateModule.lean:115 | Native compatible torsion sequences, not a CM point or Kolyvagin system. |
| WeierstrassCurve.nonempty_linearEquiv_tateModule | TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Basic.lean:73 | Elliptic curve, separably closed field, prime ℓ nonzero in the field; noncanonical rank-two equivalence. |
| WeierstrassCurve.free_tateModule | TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Basic.lean:80 | Same hypotheses. |
| WeierstrassCurve.finrank_tateModule | TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Basic.lean:94 | Same hypotheses; rank equals 2. |
| WeierstrassCurve.Affine.fg_point_of_numberField | TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean:121 | Elliptic curve over a number field; not a general abelian Mordell–Weil theorem. |

Searches for Heegner/Kolyvagin/ring-class-family objects in both pinned libraries did not find the arithmetic constructions listed as missing in the acceptance docstring. Mathlib's occurrence of “Heegner number” in the Chudnovsky π discussion (`Mathlib/Analysis/Real/Pi/Chudnovsky.lean:29`) does not construct a Heegner-point Euler system. Existing generic arithmetic carriers remain suppliers rather than duplicate constructions.

## Sources and trust boundary

All 19 legal PDF artifacts named in `packages/HeegnerPointEulerSystems/sources.toml` were present and their SHA-256 hashes matched the manifest; their numbered text companions supplied the source checks. The audit read the relevant definitions, theorem hypotheses and proof-local steps, including Howard's group change and correction, the Cornut–Vatsal lattice formulas, Zhang's integral normalization and Nekovář's image/detection calculations. It did not execute source content or downloaded code. Source text and inherited review assertions were treated as claims to verify. No suspicious instruction passage requiring a security action was encountered. The stale warning/declaration inventory in `packages/HeegnerPointEulerSystems/review.json` is not used as the final build outcome.

## Unresolved mathematical and citation inputs

The accepted package explicitly retains these twelve supplier proof obligations. The computed scope witnesses below distinguish them from weaker theorems; those witnesses do not prove the general contracts.

| Contract | Earlier owner |
| --- | --- |
| gap:integral-family-logarithm | GrossZagierAndArithmeticHeights |
| gap:surjective-three-integral-comparison | SelmerIwasawaCohomology |
| gap:jsw-propagated-specialization | SelmerIwasawaCohomology |
| gap:classical-uniform-square-index | EulerSystemsAndKolyvaginSystems |
| gap:self-dual-rigidity-three | EulerSystemsAndKolyvaginSystems |
| gap:elliptic-adelic-open-image | ArithmeticGaloisRepresentations |
| gap:abelian-scalar-image | ArithmeticGaloisRepresentations |
| gap:zhang-level-raising | SerreWeightAndLevelOptimisation |
| gap:gl2-integral-rank-zero | ModularIwasawaMainConjectures |
| gap:cm-local-dynamics | GeometryOfNumbersAndQuadraticArithmetic |
| gap:primitive-toric-mu | AutomorphicCongruences |
| gap:eisenstein-elliptic-unit-inputs | EulerSystemsCyclotomicMainConjecture |

The five unreadable supplier specifications above remain unresolved citation limitations. There are no unresolved build, format, dependency-direction or repository-scope failures. The numerical self-audit is not a proof of the deep theorems or an assertion that the twelve general supplier obligations are complete.

## Adversarial mathematics pass

This is the author's computed self-audit. The following tables have one row for every retained numbered statement and every individual API bullet, plus separate convention, supplier-boundary and worked-example rows. Conditional numerical ledgers are identified as such: the selected scalar data do not claim simultaneous realization by one elliptic curve. Boundary models test signs, domains, indices, support, local factors and hypotheses; they do not replace the arithmetic theorems. Degenerate models include zero/rank-zero data, the trivial group, cyclic groups and S₃, empty constraints/strata, exceptional CM units, p=2 and 3, ramified coefficients, characteristic-p/inseparable and nonreduced objects outside the field hypotheses, the identity map, and the junk conductor n=0.

### Numbered targets

| Statement | Instances tried and computed values | Result and change |
| --- | --- | --- |
| 0.1 local order | Regular √2 matrix over ℚ₅: a,b∈ℤ₅; conjugate [[0,10],[1/5,0]]: a∈ℤ₅,b∈5ℤ₅; over ℚ₂ the i-conjugate forces b∈2ℤ₂ | Optimality distinguishes maximal and conductor-5/2 orders; retained controls. |
| 0.2 global order | Basis (1,3i) has index 3, trace matrix diag(2,−18), determinant −36=3²(−4); omitting the 3-adic condition gives index 1 | Localization and global discriminant agree; retained. |
| 0.3 toral orbit/Picard map | Identity idele gives [O]=1; a multiplies the ideal to aI with [aI]=[I]; x²+5y²=2 has zero integral solutions, so the norm-2 ideal in ℚ(√−5) is nonprincipal | The quotient has a nonidentity class; retained. |
| 0.4 successive kernel | At ℓ=7 and ordinary units, inert/split/ramified kernel sizes are 8,6,7; repeated step is 7; ℚ(i),c=1,ℓ=3 gives 4/2=2 | Imported H1.4 formula gives the unit-corrected degrees. |
| 0.5 ring-class inclusions/restriction | For ℚ(√−5), [K[1]:K]=2; identity restriction has kernel size 1; ℚ(i),conductor 3 has degree 2 over conductor 1 | A conductor-one point need not be K-rational; retained. |
| 0.6 conjugation | In S₃, (12)(123)(12)=(132); in C₃, inversion sends 1 to 2; in C₂, inversion fixes 1 | Tests nonabelian and cyclic models; generalized-dihedral law retained. |
| 0.7 relative tower | [F_P:ℚ_p]=1,2 give ranks 1,2; residue sizes 3,9 give eventual degrees 3,9; initial ℚ(i),p=3 degree is 2 | Initial unit index is separate from eventual growth. |
| 0.8 norms and Artin | Identity norm is identity; Norm_ℚ(i)/ℚ(1+i)=2; C₃ arithmetic/geometric conversion is s↔s² and fixes 27−s−s² | All squares use the correct map direction; inversion is explicit. |
| 0.9 trace dual/different | For conductor-3 split order, (1/3,−1/3) has trace pairing (a−b)/3∈ℤ₃; (1/3,1/3) paired with (1,1) gives 2/3; different norm is −9, discriminant ideal (9); ℤ₂[i] gives norm(2i)=4 | Trace dual and signed norm distinguished; retained. |
| 1.4 integral Hodge divisor | deg D=2 gives deg(2x−D)=0, while deg(x−D)=−1; clearing 6 gives 3(2x−D); elliptic-point weight at e=2 is 1/2 | Defined orbifold correction and positive denominator; no division by zero. |
| 1.5 fixed quotient point | At d=1 the divisor is x−∞; zero quotient maps every divisor to 0; negation orbit of 1 traces to 1−1=0; J dimension 2 to elliptic A has kernel dimension 1 | Finite degree is attached only to finite parametrizations/isogenies, not arbitrary J→A. |
| 1.6 normalization transport | (I,c)=(7,2) scaled by 5 gives (35,10), ratio 7/2 both times; j=2,a=3 changes ratio by 2/3; torsion orders 6 and 2 change the full index by 1/3 additionally | Parametrization and isogeny laws kept separate. |
| 2.1 Hecke neighbors | At q=3 the first-step (horizontal,increasing) counts are (0,4),(1,3),(2,2); all total 4; positive conductor gives 1+3=4 | Conductor-increasing terminology and predecessor domains made explicit. |
| 2.2 inert trace | ℚ(i),ℓ=3 has unit index 2 and extension degree 2; weighted trace has 2·2=4 terms, the local Hecke degree | Unit factor retained, including the exceptional discriminant. |
| 2.3 first split/ramified step | With a=4 and trivial lower Artin actions the split coefficient is 4−2=2, ramified 4−1=3; inverse Artin pairs give s+s⁻¹ unchanged | Distinct first-step horizontal terms retained. |
| 2.4 repeated step and predecessors | L=O₂ has prᵘ L=O₁ and prˡ L=P O₁; both conductor 1; at q=5, six Hecke terms minus one predecessor give five terms; n=0 has no predecessor | Added map domains, lattice formulas, Hecke central action and three Checks. |
| 2.5 nonmaximal level | Endpoint conductors (1,2),(2,1),(2,2) give types I,II,III; δ=1 predecessor coefficient 4 gives −4; δ≥2 type I/II trace gives 0 | Defined the types and predecessor maps; type III is excluded from the zero law. |
| 2.6 pointwise reduction | In 𝔽₉ with i²=−1, i³=−i, i⁹=i, and Fr₃²(i)=i; on 𝔽₃ coordinates both maps give the same value | Replaced residue-field Frobenius by the ℓ-power endomorphism; added three witnesses. |
| 2.7 quaternionic specialization | Inert q=3 has residue size 9; q∤n means (q) is a principal invertible conductor-prime-to ideal, so its class is 1; graph vertex labels are 0 and 1 | Repaired the Néron/curve supplier locators and retained both vertices. |
| 3.1 actual Kummer classes | In the additive quotient ℤ/7, 7 maps to 0 and 1 maps to 1; a negation orbit trace is 0 at every coefficient depth | Illustrative quotient model distinguishes divisibility and nonzero points. |
| 3.2 good local condition | For a trivial ℤ/7 coefficient, unramified cocycles Hom(Ẑ,ℤ/7) have 7 elements; zero coefficients give 1 element | Unramified image is not zero cohomology; retained. |
| 3.3 component obstruction | A component group ℤ/49 contributes length 2 at 7; component group 0 contributes 0; nonsplit geometric ℤ/5 has only 1 Frobenius-fixed point | Rational versus geometric components remain separate. |
| 3.4 coefficient-prime condition | 7ℤ₇⊂ℤ₇ has index 7 and equal ℚ₇-spans; the finite discrepancy length is 1, not 0 | Repaired the finite-flat/crystalline supplier sections; retained integral errors. |
| 3.5 Kummer/Sha lattice comparison | ℤ₇/49ℤ₇ has order 49 and length 2; tensoring that quotient with ℚ₇ gives 0 | Integral saturation cannot be inferred from rational comparison. |
| 3.6 archimedean correction | On swapped ℤ₂², (1+τ)(1,0)=(1,1); half is not integral; over ℂ the degree-one local Galois cohomology is 0 | The dyadic correction is retained. |
| 4.1 Heegner coefficient ideal | At p=5, (10,20)=(5), (25,150)=(25), sum=(5); empty sum=(0); a=0 contributes valuation ∞, not 0; M(1)=∞ whereas I₁=0 | This specializes the generic supplier ideal to actual Hecke eigenvalues. |
| 4.2 derivative invariance | For C₃, D=s+2s² and (s−1)D=2−s−s²=3−(1+s+s²); modulo 3 the two expressions equal −Norm; n=1 gives D=1 and full trace | Sign and reduction level are substantive; retained. |
| 4.3 torsion invariants | The standard GL₂(𝔽₃) module has only the zero fixed vector, while the trivial rank-two module has 9 fixed vectors; multiplication by 3 reduces positive exponent to exponent 1 | No irreducibility assertion is extended to arbitrary towers. |
| 4.4 unique descent | Shear χ(x,y)=(x+y,y) has χ⁻¹(0,1)=(−1,1) and χ(−1,1)=(0,1); forward value (1,1) maps to (2,1); zero map has two preimages of 0 | Inverse, rather than forward, transport is retained. |
| 4.5 cocycle and divisibility iff | In ℤ with modulus 7, 14∈7ℤ maps to 0 and 1∉7ℤ maps to 1; both directions hold. For the identity extension the division correction is zero | Invariance and torsion vanishing are required before the cocycle's rational division term. |
| 4.6 bottom trace | Orbit {1,−1} has trace 0, hence Kummer image 0; raw 1 maps to 1 mod 7; derivative at empty support is 1 | Bottom class is the trace image; retained. |
| 4.7 generator/tensor change | Modulo 7 the inverse of u=3 is 5; scalar factor 5 times tensor factor 3 is 15≡1; raw factors 1 and 5 differ | Intrinsic tensor is invariant, raw scalar class is not. |
| 4.8 coefficient reduction | 10 mod 49 maps to 3 mod 7; the class 3 mod 7 has lifts 3,10,17,24,31,38,45 mod 49 | Only downward reduction is canonical. |
| 4.9 parity | With ε=−1,w=1 and ν=0,1,2, both ε(−1)^ν and w(−1)^(ν+1) give −1,+1,−1; mod 2 all become 1 | Odd-prime eigenspaces are not projected integrally at 2. |
| 5.1 transverse condition | For ℓ=5, 1+⋯+5=15 has v₃=1 and v₂=0, though ℓ+1=6 has both primes as divisors | The division by 2 in the odd-prime proof is not dyadically integral. |
| 5.2 correction map | For shear χ and A=diag(1,−1), χA(0,1)=(−1,−1) while Aχ(0,1)=(1,−1); negation sends 3 to −3 | A local non-equivariant operation does not act on global cocycles. |
| 5.3 corrected system | Empty product gives id and κ′₁=κ₁; χ⁻¹(0,1)=(−1,1); negation correction of 3 is −3; zero stays 0 | Global change of group and inverse convention retained. |
| 5.4 big image | Central scalar −1 gives u−1=−2, a unit at 3; its valuation is 1 at 2; the trivial 𝔽₃² module has invariant dimension 2 | Image and central scalar hypotheses are not interchangeable. |
| 5.5 cartesian/self-dual conditions | In a hyperbolic 𝔽₅⁴ space, finite plane dimension is 2 and its orthogonal complement also has dimension 2; swapped ℤ₂² has nonintegral half-projection | The arithmetic local-condition checks remain required. |
| 5.7 Heegner detection | For S of dimensions 0,1,2 and V=𝔽₅², the imported Hom sizes are 1,25,625; nonzero evaluation x on (1,0) is 1, while zero class evaluates to 0 everywhere | Imported §1.6 pairing; only detection of the actual Heegner line stays here. |
| 5.8 local error lengths | ℤ/49 contributes component length 2 at 7 and an independent ℤ/7 torsion term contributes length 1; their sum is 3, not 2 | Separate error terms retained. |
| 5.9 obstruction examples | Tate parameter valuation 7 gives geometric component order 7; valuation 1 gives component order 1; μ₇ supplies a subgroup of local torsion of order 7 in either case | Distinct local obstructions remain explicit. |
| 6.1 Howard bound | Bottom index 7³ has length 3; a paired finite part of length 2+2=4 satisfies 4≤6; bottom index 1 forces finite length 0 | The actual arithmetic system supplies the generic theorem's hypotheses. |
| 6.2 opposite eigenspace | A nonzero bottom line has dimension 1; an alleged independent opposite vector would add dimension at least 1 where the theorem gives 0 | Expanded the full residual-image, discriminant and nonzero-bottom hypotheses. |
| 6.3 preferred eigenspace | At nonzero bottom, span dimension is 1; at zero bottom it is 0, so the stated equality cannot have the same rank conclusion | Referenced the explicit §6.2 hypotheses. |
| 6.4 Gross mod-p descent | Cyclic 𝔽₅ Selmer space has size 5; nonzero Kummer line has size 5, leaving Sha[5] size 1 and Mordell–Weil rank 1 | Made D_K≠−3,−4 and fixed trace normalization explicit. |
| 6.5 square-index bound | For free index 7³, the allowed Sha order divides 7⁶=117649; paired ℤ/49⊕ℤ/49 has order 7⁴=2401 and satisfies the bound | Only an upper bound is claimed without primitivity. |
| 6.6 sharpness | Index length 3 and primitive system give length M=3 and paired length 6; scaling by p raises index length to 4 while the same M has length 3 | Added both dual H.0–H.5 and the deep-prime containment hypothesis from the source. |
| 6.7 level-raising congruence | Over 𝔽₇ a fixed family scalar 3 sends local values 1,2 to 3,6; independently chosen scalars could instead send the second value to 1 | The matched identifications must use one scalar for the family. |
| 6.8 rank lowering | A nonzero map 𝔽₇³→𝔽₇ is surjective with kernel dimension 2; the zero map has kernel dimension 3 | Nonzero localization is essential; ℓ=p is excluded from the ℓ≠p Euler characteristic argument. |
| 6.9 rank-zero formula | A Selmer length 2 and local lengths 1,2 give special-value valuation 2+1+2=5; a nonzero rank term would prevent a finite Selmer cardinality | The GL₂-type integral rank-zero obligation remains explicit. |
| 6.10 Jochnowitz units | In 𝔽₇, local value 3 has square 2≠0; value 0 has square 0; thus nonzero localization is equivalent to nonzero residue of the integral algebraic value | Integrality comes from the special-value identity, not a definition. |
| 6.11 period/Tamagawa identity | At p=5, η=5⁴u and ξ=5u′ give ratio valuation 3; local exponents 1 and 2 sum to 3, while raw η has valuation 4 | Corrected Néron monodromy locator; ratio, not raw congruence ideal, is used. |
| 6.12 vanishing order | Zero or empty support gives ∞; bottom support {1} gives 0; support {6} gives 2 distinct prime factors | The arithmetic system remains the carrier. |
| 6.13 base locus | For zero family, every prime outside D_KNp qualifies; one nonzero localization removes that prime; at p=7 the prime 7 is excluded regardless of all localization values | Both directions of the membership condition tested. |
| 6.15 residual reciprocity | Take finite/transverse coordinates f=(1,0),t=(0,1) and ψ(f)=t: the edge relation has both sides t; with w=−1,ν=0,1 the class signs are +1,−1 | Imported local pairing; retained only actual Heegner local conditions and edge law. |
| 6.18 triangular basis | At ν=0, dimensions are 1 and ≤0 with 1 detecting prime; at ν=1, dimensions are 2 and ≤1 with 3 primes; matrix [[1,2],[0,1]] has determinant 1 | Expanded the full arithmetic residual hypotheses; imported detection/ramification inputs. |
| 6.19 indivisibility | A nonzero residual value 2 mod 5 has divisibility 0, hence M∞=0; multiplying the whole family by 5 makes that value 0 and destroys the conclusion | The p-optimal normalized arithmetic family and Hypothesis ♠ remain explicit. |
| 7.1 finite prime divisibility | In ℤ², (20,30) has depths C₀(2)=1,C₀(5)=1,C₀(3)=0; in ℚ, 1=7^c·7^(−c) for every c | Mordell–Weil finite generation is needed before rank one is known. |
| 7.2 image application | SL₂(ℤ₅) has determinant image {1} and scalar commutant, but infinite index in GL₂(ℤ₅); full GL₂ spans all four matrix units | Kept the accepted adelic/scalar obligations separate from commutant supply. |
| 7.3 integral image errors | For u=−1, v₃(u−1)=0 and v₂(u−1)=1; full matrix span has C₃=0; scalar matrices have no nonzero multiple of E₁₂ | Replaced the unsupported End_K(A)=O_L inference by the coefficient-linear no-CM/self-twist criterion. |
| 7.4 integral detection | Loss C₂+C₃+4v_𝔭(2), with C₂=1,C₃=2, is 3 at an odd coefficient prime and 7 at an unramified dyadic prime; ramification e=2 makes it 11; u₀=2,Nℓ+1=8 gives degree 4, with M₀=1 or 2 at dyadic ramification 1 or 2 | Defined the stabilizer index, its ramified valuation and admissible-prime Frobenius depth; retained the integral factors. |
| 7.5 exceptional derivative errors | At C₁=2 a component class of order 25 is killed by 5²; C₁=0 does not kill a nonzero such class; κ₁=5²δ(y); at n=15,ℓ=3 the predecessor index is 5, while multiplying a class by 1/3 does not change conductor 15 | Defined the finite–singular map by its evaluations, retained its conjugation sign and corrected ambiguous class division to conductor n/ℓ. |
| 7.6 dyadic descent | For C₀=1 and other constants 0, B=2 at an odd prime and B=23 if v_𝔭(2)=1; if v_𝔭(2)=2, B=44 | No division by 2 and no silent ℤ₂-only formula. |
| 7.7 primary finiteness | A 5-primary group killed by 5² equals its 25-torsion; if that finite group has 125 elements, the full primary group also has 125; ℚ₅/ℤ₅ has finite 5^M-torsion of size 5^M but no uniform exponent | Uniform exponent plus finite Selmer at that exponent, not per-level finiteness alone. |
| 7.8 CM versus Heegner field | For CM field ℚ(i), 2 divides its discriminant and is ramified; the split Heegner condition forces 2 split in K, so K≠ℚ(i); two distinct quadratic fields have intersection ℚ and compositum degree 4 | CM descent uses the semilinear representation over K. |
| 7.9 CM error branch | All C_i=0 and odd p give B=0 and primary Sha size 1; at unramified p=2 with C_i=0, B=21 | No full GL₂-image hypothesis is imposed on CM curves. |
| 7.10 almost-all primary vanishing | An element of order 5³ has 5² multiple of order 5; therefore Sha[5]=0 excludes it. If finitely many exceptional groups have orders 4 and 9, their direct sum has order 36 | The torsion argument does not presuppose primary finiteness. |
| 7.11 classical full finiteness | A non-torsion rank-one Kummer line and finite quotient give rational rank 1; finite exceptional primary groups of sizes 4,9 give total order 36, while a rank-two lattice modulo one line has an infinite quotient | The rank conclusion and finiteness use the uniform integral bound. |
| 7.12 RM finiteness | For [L:ℚ]=2, rank one over O_L gives ℤ-rank 2=dim A; a proper finite quotient of order 7 has rank 0; this is not elliptic ℤ-rank 1 | General abelian finite generation and finite-Selmer supply retained. |
| 7.13 classical uniform order | I_K=7,d_E=1 permits order dividing 49; (ℤ/7)³ has exponent 7 but order 343, violating that order bound. v_ℓ(I)=0 at ℓ∈B(E) forces v_ℓ(#Sha)=0 | The accepted uniform length obligation is not replaced by an exponent bound. |
| 8.1 initial Euler factor | At p=5,a=1, inert Φ=36−1=35; split augmentation=(6−1)²=25; in ℤ₅[C₃], Φ=27−s−s² has coefficient content valuation 0 and augmentation valuation 2 | Finite group and augmentation are distinct. |
| 8.2 ordinary stabilization | With algebraic unit α=2, P₁=4,P₀=2, α⁻¹(P₁−α⁻¹P₀)=(4−1)/2=3/2; zero family gives 0. For p=5,a=1, f(1)=5 and f′(1)=1 mod 5 | The toy calculation is identified as algebraic, not an arithmetic root assertion. |
| 8.3 stabilized traces | Use α=2,p=6,a=5 in the algebraic identity α²−aα+p=4−10+6=0; with x=3,y=1, cor(raw_next)=14 and cor(raw)=18, cor(stabilized)=14−9=5, while αx−y=5 | Both sides of the recurrence agree; p=6 is explicitly only a polynomial ledger. |
| 8.4 simultaneous finite solvability | On ℤ/7, π=id and bottom 5 has unique q=5; π=0,bottom 1 has 0 solutions; q=1 and q=0 constraints have 1 solution each separately and 0 jointly | Compactness alone does not establish finite solvability. |
| 8.5 universal-norm choice | On ℤ/2 with π=0 and self-edge id=id, families 0 and 1 both satisfy constraints, difference 1 has bottom 0; on ℤ/7 bottom=id=5 forces q=5 | Existence does not imply uniqueness or arbitrary projection surjectivity. |
| 8.6 Λ-adic class | Identity comparison sends (1,0) to (1,0)≠0, second-coordinate specialization gives 0; multiplication by 5 has lattice index 5 | No every-specialization nonvanishing claim is made. |
| 8.7 primitive stratum | Identity preceding quotient excludes every character; C₂→C₂ identity does not factor through the trivial group and belongs; wrong torsion value −1 versus prescribed +1 excludes it | Exact conductor and torsion character are both tested. |
| 8.8 generic sign | For F=ℚ and no inert odd-exponent conductor prime, \|S\|=1 gives −1; one such prime gives \|S\|=2 and +1 | The real-place contribution remains explicit. |
| 8.9 joint CM distribution | For f=1 and probability measures, both averages are 1, difference 0; a forbidden component indicator has both averages 0; C₃ Artin conversion sends s to s² | Transported source geometric Artin convention to the standing arithmetic convention. |
| 8.10 reduction fibres | A finite fibre of size 2 with full-support measure assigns each point mass 1/2; omitting one point gives indicator averages 0 versus 1/2, incompatible with eventual distribution | Surjectivity is within permitted fibres, not a product of forbidden components. |
| 8.11 definite character nonvanishing | For C₂ and values (1,−1), the sign character sum is 1+1=2 and the trivial sum is 1−1=0 | Existence of one character is weaker than nonvanishing of every character; nonexceptionality retained. |
| 8.12 definite L-values | Even \|S\|=2 gives functional-equation sign +1; odd \|S\|=1 gives −1 and forces the central value 0 | The central-value branch uses definite parity. |
| 8.13 unit normalization | Modulo p, β≡0 gives split factor uα²(−1)²≡uα² and inert factor uα²(−1)≡−uα², both nonzero; Φ₀ can still be 25 at p=5 | Unit comparison does not invert the initial nonunit Euler factor. |
| 8.14 crystalline characters | At p=5,m=1,2, exponents are 4,20; torsion u=−1 gives u⁴=1 and fails nontriviality; a non-torsion unit has no positive power 1 | Made the non-torsion unit and generator hypotheses explicit. |
| 8.15 divisibility profile | Indices 4 and 1 at strata 0 and 1 give M₀=4,M∞≤1; a stratum with values 2,6 has minimum 2; zero/empty strata give ∞ | Specialized the supplier profile to this arithmetic family; kept zero convention. |
| 8.16 isogeny lattice comparison | Index pairs (I,C)=(25,5) and (5,25) both have product 125, although the separate factors differ | Only the product is compared integrally. |
| 8.17 near-one Tamagawa factors | Numbers 5 and 5+125=130 are congruent mod 125 and both have v₅=1; 5 and 25 agree mod 5 but have valuations 1 and 2 | Depth must exceed the relevant valuations. |
| 8.18 strict ordinary complex | G=0,L=R[0] gives fibre R[−1] with H¹=R; unshifted cone gives H⁰=R; G=R[−1],L=0 gives H¹=R; H⁰ quotient term of order 7 survives if not zero | The mapping fibre, compact/discrete distinction and H⁰ correction are retained. |
| 8.19 ordinary local factor | At p=5,a=1, #Ẽ(𝔽₅)=5 and split product is 25; #Ẽ(𝔽₂₅)=25+1−(1−10)=35 in the inert ledger | Scalar valuations 2 and 1 are distinct from group-ring content 0. |
| 8.20 tower torsion | Reduction groups of orders 12 and 25 at distinct residue characteristics bound the complementary primary torsion; prime-to-2 torsion divides 3 and prime-to-5 torsion divides 1, so in this numerical ledger total torsion is trivial | The example is a conditional divisibility ledger, not claimed simultaneous reductions of one curve. |
| 8.21 indefinite character points | A nontorsion generator P with C₂ orbit values P,−P has sign projector (P−(−P))/2=P; a torsion point of order 2 instead maps to 0 after characteristic-zero tensoring | General F and nontrivial torsion strata extend beyond the imported classical case. |
| 8.22 indefinite L-derivatives | Odd \|S\|=1 gives sign −1, compatible with central value 0 and nonzero first derivative; even \|S\|=2 is the distinct central-value branch | The precise Gross–Zagier input remains required. |
| 8.24 non-torsion bottom class | In Λ=ℤ₅⟦T⟧, y=T is nonzero and has annihilator 0, so Λy is free rank 1 although y(0)=0; a torsion module Λ/(T) would have a nonzero annihilator | Imported the earlier classical nonvanishing theorem instead of restating §8.23. |
| 8.25 continuous characters | For p=3,r=0,1,2 the generator values are 4,64,262144; v₃(3)=1,v₃(63)=2,v₃(262143)=3 | Continuous characters and their depth are valid without inert-prime crystallinity. |
| 8.26 near-one nonzero bottom | f(T)=T(T−5) vanishes at T=0,5 but not at 25: f(25)=500 has v₅=3; the punctured radius \|T\|₅<1/5 excludes the second zero | Nonvanishing is on a sufficiently small punctured neighborhood. |
| 8.27 logarithm index | For p=5,t=2,q=5,I=25,C=5, p^tq=125=IC; dropping q would instead give 25≠125 | Integral distinguished lattice and local torsion are retained. |
| 8.28 propagated control | With Sha size 25,C=5, product of local p-parts 25,q=5, the formula gives 25·25·25·25=5⁸=390625 | All squares and K-primes are retained; the propagated quotient is named. |
| 8.29 twisted index square | Combine the preceding ledger with t=4: p^t q=5⁵, I=(5⁵)/5=5⁴, so I²=5⁸; Sha·Tam_K·q⁴=5²·5²·5⁴=5⁸ | The q⁴ factor follows from both identities; rational equality is insufficient. |
| 8.30 determinant element | For trivial involution y=5, y⊗y gives 25; scaling y by 5 multiplies the tensor by 25; for a=γ, aι(a)=1 while a²=γ²≠1 | Corrected the unequal-factor (5,1) Check to the actual diagonal Heegner tensor. |
| 8.31 determinant/characteristic equivalence | For index ideal (5²), its product with its involution is (5⁴); a determinant coefficient 5⁴ is nonzero rationally but is not an integral basis | Integral equality, rather than rational trivialization, is required. |
| 8.32 specialized determinant lattice | With L_p=25,Tam_E=5,#X_BK=25, the lattice multiplier is 25²·5²·25=5⁸ | All-p ordinary complex and propagated finite quotient remain distinct from the (0,∅) module. |
| 8.33 Λ-adic derivative | Identity derivative followed by shear restriction inverse sends (0,1) to (−1,1); zero point family maps to 0; zero restriction has both 0 and 1 over 0 | The actual restriction equivalence and cyclic tensor are retained. |
| 8.34 Λ-adic local conditions | A class with finite coordinate (1,0) maps to 0 in the singular quotient, whereas (0,1) maps to 1; 5ℤ₅⊂ℤ₅ still has nonzero finite cokernel | Local membership is verified for the actual arithmetic class, integrally. |
| 8.35 Λ-adic edge relation | With χ=−1 and raw finite value 2, corrected value is −2; applying χ gives 2; using χ instead of χ⁻¹ in a shear gives (1,1) instead of (−1,1) | Global correction/localization compatibility is retained. |
| 8.36 Howard divisibility | For torsion half M=Λ/(T), char M=(T); index ideal (T²) is divisible by T but not equal to T; paired torsion ideal is (T²) | No equality is inferred from one divisibility. |
| 8.37 localized weak bound | Inverting p makes (p) the unit ideal; inverting T=γ−1 makes (T) the unit ideal. D_K=−3 is odd but excluded by (disc); D_K=−7 passes | The two localizations and discriminant restriction remain separate. |
| 8.38 initial-factor specialization | At p=5,a=1, split factor has valuation 2 and inert factor 35 valuation 1; (5³)⊂(5²) permits reduction mod 25, whereas (5)⊄(25) does not | Coefficient-ideal direction is fixed as M(n)≥m; initial nonunit factor is retained. |
| 8.39 uniform error bound | With bottom index 3 and error E=2, length M≤5; the same bound 5 applies for common multiplying powers t=0,4,9; under surjectivity E=0 gives bound 3 | The bound is independent of the common multiplier, not multiplied by its depth. |
| 8.40 paired exact length | M₀=4,M∞=1 gives length 2(4−1)=6; M∞=M₀ gives 0. At p=3 the printed p>3 lemma has false premise 3>3 | Aligned W_(α⁻¹) with T_α and retained the distinct accepted p=3 rigidity obligation. |
| 8.41 conditional finite nonvanishing | A finite family may have κ₁=0 and κ_ℓ=5≠0, so bottom vanishing does not imply zero system; a Λ-class y=T has y(0)=0 and y(25)=25≠0 | No analytic-rank-one hypothesis is introduced. |
| 8.42 refined stable divisibility | At p=5 with rational Tamagawa p-parts 5 and 25, M∞=1+2=3; K-prime product has valuation 6, while M₀ may be 7 | The stable index is half the K-prime sum, not M₀. |
| 8.43 determinant twisted square | Using L_p=25,Tam_E=5,#X=25 gives predicted bottom index square 5⁸, hence index 5⁴; dropping L_p² would give 5⁴ and the wrong index | Retains the initial local factors and integral determinant hypothesis. |
| 8.44 refined equivalence | Tam_E p-part 125 has valuation 3; the refined conjecture says M∞=3, not 6. Split p permits the supplied equality; inert p retains a conjectural premise | Both directions are stated under the exact p>3 and normalization hypotheses. |
| 8b.1 BDP convention | A square-root value 5² has square 5⁴; multiplying by a unit 2 changes its square by 4, a unit at 5; multiplying by 5 changes the square valuation by 2 | Ideal comparison retains nonunit period and Euler factors. |
| 8b.2 main-conjecture comparison | (3) and (1) in ℤ₃⟦T⟧ have height-one lengths 1,0, and both become (1) after inverting 3; rescaling the Heegner line by 3 adds 2 to its square-index length | The p=3 integral formulation obligation is kept distinct from rational comparison. |
| 8b.3 auxiliary fields | At p=5, ℓ=19 gives ℓ≡−1 mod 5 and uses the inert choice; ℓ=11≡1 uses split; F=ℚ(√5) is the excluded p=5 real quadratic field | Splitting, residual restrictions and finite avoidance are retained. |
| 8b.4 Euler-system bound | For ideal lengths 2 on X_tors and 4 on the index square, inclusion (T²)⊃(T⁴) holds; at p=3 the integral variant keeps length at (3), rather than setting it to 0 | No Howard full-image/class-number hypotheses are silently weakened. |
| 8b.5 reverse divisibility | At one height-one prime, upper bounds x≤a and y≤b together with x+y≥a+b force x=a,y=b; for a=2,b=3 the only allowed total 5 has x=2,y=3 | Cancellation requires nonzero factors and the supplied integral μ/period data. |
| 8b.6 rational Heegner equality | In Λ[1/5], (5T²)=(T²); both modules have rank 1 but their integral (5)-lengths can be 1 and 0 | Rational equality is explicitly weaker than the integral branch. |
| 8b.7 integral Heegner equality | For index ideal (5T), its square is (25T²), with (5)-length 2 and (T)-length 2; both lengths must match X_tors | Surjectivity and p>3 are retained. |
| 8b.8 rational Greenberg equality | Square-root ideal (5T) gives square (25T²), which becomes (T²) after inverting 5; the (0,∅) module has rank 0, unlike the ordinary rank-one dual | The local-condition carrier and coefficient extension remain explicit. |
| 8b.9 integral Greenberg equality | The same square (25T²) has (5)-length 2; replacing it integrally by (T²) loses 2 | Integral p-content retained. |
| 8b.10 Eisenstein equality | At p=3, local character ω²=1 is excluded, while a character neither 1 nor ω is the permitted branch; the ideals (3) and (1) remain distinct | Uses the independent odd-prime CGS formulation and accepted elliptic-unit/Katz obligation. |
| 8b.11 finite nonvanishing branches | The p=3 Eisenstein branch is allowed by 3∤2N; the irreducible BCS branch requires 3>3, which is false; p=5 satisfies 5>3 | No unsupported p=3 irreducible branch is inferred. |
| 8b.12 split refined equality | At p=5 with local p-parts 5,25, M∞=3 and not 6; an integral equality retains this factor while rational equality can invert it | The integral main conjecture discharges the conditional refined statement. |
| 8b.13 split determinant application | For p=5 the integral index square (25T²) has lengths 2 at (5) and (T); the determinant basis assertion requires both, while rational comparison sees only (T)-length 2 | Split equality is supplied; inert equality remains a hypothesis. |

### Individual definition/API laws

| Statement | Instances tried and computed values | Result and change |
| --- | --- | --- |
| §0.1 API 1: Membership is exactly integrality of the embedded, transported element. | The conjugated √2 matrix sends 5√2 to [[0,50],[1,0]], integral, and √2 to a matrix with entry 1/5, nonintegral. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.1 API 2: The conductor ideal exists and is unique. | ℤ₅+5ℤ₅√2 has conductor (5); candidate (1) would contain √2 and fails the membership test. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.1 API 3: The order is stable under quadratic conjugation. | Conjugation sends 5√2 to −5√2; both coefficients have valuation 1 and stay in the order. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.2 API 1: Its localization at each finite place is the specified local order. | At 3 the basis (1,3i) gives conductor 3; at 5, 3 is a unit so the localized order is ℤ₅[i]. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.2 API 2: It has finite index in O_E. | The lattice determinant is 3, so [ℤ[i]:ℤ+3ℤi]=3, not 9. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.2 API 3: Equality at all finite localizations implies equality of global orders. | Orders of conductors 3 and 1 disagree at 3: i lies only in the second; equal localizations cannot identify them. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.3 API 1: Idele multiplication maps to fractional-ideal multiplication. | Principal ideles 2 and 3 map to ideals (2),(3); their product maps to (6)=(2)(3). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.3 API 2: Principal ideles give principal ideals. | The principal idele 1+i maps to (1+i), whose Picard class is 1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.3 API 3: The quotient by principal and transported-unit subgroups is isomorphic to the invertible Picard group. | ℚ(i),conductor 3 has two proper invertible classes; quotienting only by principal ideles and local order units retains cardinality 2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.4 API 1: Extension Pic(O_cℓ)→Pic(O_c) is surjective. | For ℚ(i),c=1,ℓ=3, Pic(O₃) of size 2 maps onto the one-element maximal-order class group. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.4 API 2: The successive kernel has the displayed residue-unit description with the global-unit image. | The inert residue unit quotient has order 4; the global-unit image has order 2, leaving kernel 2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.4 API 3: Its cardinality is (ℓ−χ_K(ℓ))/u_c,ℓ for ℓ∤c and ℓ/u_c,ℓ for ℓ∣c. | At ℓ=7 and ordinary units, new inert degree is 8 and repeated degree is 7; the two formulas differ by 1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.5 API 1: Restriction is surjective. | Restriction C₂→1 is onto, with kernel of size 2; the corresponding field inclusion goes from degree 1 to degree 2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.5 API 2: It agrees with ideal extension under arithmetic Artin away from the conductors. | Identity ideal class maps to identity Artin automorphism at both conductors: 1↦1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.5 API 3: Its kernel is the actual conductor Picard kernel. | For ℚ(i),c=1→3, both the Picard kernel and Galois kernel have cardinality 2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.7 API 1: Restriction maps compose along the tower. | Reduction ℤ/27→ℤ/9→ℤ/3 sends 20 to 2 on both composite and direct routes. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.7 API 2: The torsion-free inverse-limit quotient has rank [F_P:ℚ_p]. | Local degree 2 gives ℤ_p² of rank 2; a procyclic replacement has rank 1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.7 API 3: Step degrees are eventually N(P), with the initial unit indices retained. | For F=ℚ,p=3 the eventual step is 3; exceptional-unit first step in ℚ(i) has degree 2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.9 API 1: Taking the trace dual twice recovers the order. | For trace matrix diag(2,−18) of (1,3i), taking the dual twice in the nondegenerate ℚ₃-pairing returns the original lattice determinant 3. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.9 API 2: The different times the trace dual is the unit ideal. | In the split conductor-3 example, (3,−3)·(1/3,−1/3)=(1,1), the unit ideal generator. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §0.9 API 3: The norm ideal of the different equals the discriminant ideal. | Split generator norm is −9, whose norm ideal is (9), matching discriminant (9); signed −9≠9. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §1.4 API 1: The divisor has degree zero. | With deg D=2, deg(2x−D)=2−2=0; deg(x−D)=−1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §1.4 API 2: Formation commutes with base change. | Base change of a rational divisor of degree 2 still has degree 2; 2x−D remains degree 0. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §1.4 API 3: Multiplying d multiplies the class by the same integer, retaining nonunit factors. | Changing d=2 to 6 gives 6x−3D=3(2x−D), with nonunit factor 3 at p=3. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §1.5 API 1: For the descended CM point x_c and the fixed quotient φ:J→A, P_c=φ([d x_c−d ξ]). | Postcomposition by zero gives 0 at every conductor, while cusp d=1 evaluates [x−∞]. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §1.5 API 2: Evaluation applies the fixed quotient to the d-cleared Jacobian class of x_c. | For a two-element negation orbit, evaluation at the chosen generator is 1 and the trace is 0; the evaluation formula gives 1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §1.5 API 3: Postcomposing φ by a defined homomorphism f carries each point to f(P_c). | On an additive quotient model φ=id and f=[3], f(φ(2))=6=(fφ)(2). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §1.5 API 4: The fixed quotient commutes with the Galois action on the descended CM family. | For σ acting by negation and φ=[3], σφ(2)=−6=φσ(2). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §2.4 API 1: Each predecessor commutes with the K_P× action and therefore descends to a Galois-equivariant map on CM points of positive conductor. | For a scalar a=2, O₁(2O₂)=2O₁ and P O₁(2O₂)=2P O₁; both routes agree. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §2.4 API 2: Their conductor is n−1, and prˡ=P·prᵘ on lattices; central multiplication is retained in the CM quotient. | For n=2, both predecessor conductors are 1; the lower predecessor is P times the upper, not the same lattice. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §2.4 API 3: The displayed trace identity holds in the divisor module for n≥2 and transports through the fixed integral quotient with its basepoint correction. | At q=5, local Hecke degree 6 minus one predecessor leaves a five-point trace; 6−1=5. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §2.5 API 1: K_P× preserves the type and commutes with the predecessor maps on their domains. | A scalar multiple preserves endpoint conductors (1,2), hence type I; pr(2L)=2pr(L). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §2.5 API 2: Reversing the orientation exchanges types I and II and exchanges the corresponding trace formulas. | Reversal (1,2)→(2,1) changes type I to II and upper operator to lower. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §2.5 API 3: The trace identities descend to the P-new quotient with the stated sign for δ=1 and zero for δ≥2 of type I/II. | In δ=1 new quotient, trace of predecessor coefficient 4 is −4; for δ≥2 type I/II it is 0. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §2.5 API 4: The good-point predicate is preserved by the K_P× action and by orientation reversal; at δ=0 it includes every CM point. | At δ=0 every point is good; at δ=2 endpoint conductors (1,2) and (2,1) are good, while (2,2) is bad, unchanged by reversal. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §3.1 API 1: Coefficient reduction carries the class to the corresponding finite Kummer class. | 10 mod 49 reduces to 3 mod 7; reducing the Kummer quotient before or after gives 3. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §3.1 API 2: Restriction agrees with field extension of the point. | The identity field extension sends point 2 to 2 and its mod-7 Kummer class 2 to 2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §3.1 API 3: Corestriction agrees with the actual point trace. | For negation orbit of 1 the trace is 0 and corestriction of its Kummer class is the class 0. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.1 API 1: For the finite prime set s and eigenvalues a, I_s is the sum over ℓ∈s of the ideals (a_ℓ,ℓ+1) in ℤ_p. | (10,20)+(25,150)=(5)+(25)=(5) in ℤ₅. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.1 API 2: I_∅=0. | The empty ideal sum is (0), so the quotient is ℤ₅, not 𝔽₅. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.1 API 3: For ℓ∉s, the ideal for insert ℓ s is span{a_ℓ,ℓ+1}+the ideal for s. | Inserting the second prime adds (25) to (5), leaving (5). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.1 API 4: For any prime p and nonempty finite s, I_s=(p^m) with m=min over s of min(v_p(a_ℓ),v_p(ℓ+1)), using v_p(0)=∞. Since ℓ+1 is a nonzero integer, the exponent is finite; the empty case is excluded. | The nonempty minimum is min(1,2)=1; for a=0, min(∞,v₅(20))=1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.1 API 5: s⊆t implies I_s≤I_t, hence there is the quotient map Z_p/I_s→Z_p/I_t. | The ideal inclusion (25)⊂(5) gives ℤ₅/(25)→ℤ₅/(5); 7 maps to 2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.2 API 1: The full Galois group fixes its class modulo the coefficient ideal. | For C₃, (s−1)D=3−Norm; modulo the ideal (3), the norm relation annihilates the action difference. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.2 API 2: Changing coset representatives preserves that reduced class. | If representatives differ by a term divisible by 3, their reduced coefficients both give the same value mod 3, although 1 and 4 differ integrally. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.2 API 3: At conductor one it is the full trace. Choice independence is asserted only after the required coefficient reduction. | At n=1 and orbit {1,−1}, the full sum is 0, whereas the raw point is 1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.4 API 1: The descended class is the unique class whose restriction is the invariant differentiated Kummer class z. | The shear equation χ(x,y)=(0,1) forces y=1,x=−1, hence exactly one solution. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.4 API 2: Its actual restriction equals z. | χ(−1,1)=(0,1), the prescribed invariant image. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.4 API 3: Any class with restriction z equals the descended class. | A second solution must have the same y=1 and x=−1; the zero map instead has at least two solutions. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §4.4 API 4: A commuting coefficient/restriction square carries the descended class to the class obtained by descending the reduced differentiated Kummer class. | Reducing the shear inverse (−1,1) modulo 7 gives (6,1), which maps to (0,1) modulo 7. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §5.2 API 1: Localization agrees with the specified finite–singular correction. | For identity localization, local correction of 3 by −id gives −3 on both routes; a noncommuting shear instead gives (−1,−1) versus (1,−1). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §5.2 API 2: Corrections at distinct auxiliary primes commute. | For commuting scalars χ=[−1],ψ=[2], χψ(3)=−6=ψχ(3). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §5.2 API 3: Cyclic generator change agrees with the compensating tensor coefficient. | At p=7, generator factor 3 and scalar inverse factor 5 give product 15≡1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §5.3 API 1: κ′=χ⁻¹κ for the proved global additive automorphism χ; the cyclic tensor is retained in the supplied target. | χ⁻¹(0,1)=(−1,1), while χ(0,1)=(1,1); the construction uses the first. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §5.3 API 2: κ′ is evaluation of the inverse of χ at κ. | For χ=[−1], evaluation of its inverse at 3 is −3. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §5.3 API 3: χ(κ′)=κ. | For the shear, χ(−1,1)=(0,1), recovering κ. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §5.3 API 4: For commuting χ,ψ, correction by their product equals successive correction by ψ then χ. | For χ=[2],ψ=[3] on ℚ and κ=6, (χψ)⁻¹κ=1=χ⁻¹(ψ⁻¹κ). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §6.12 API 1: The infimum of the distinct-prime count of a conductor n∈𝒩 with c(n)≠0, with empty infimum ∞. | Support only at 6 gives prime count 2 and infimum 2; empty support gives ∞. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §6.12 API 2: It is sInf{v:ℕ∞:∃n∈𝒩,c(n)≠0 and v=#prime divisors(n)}. | The value set for support {6,30} is {2,3}, with sInf=2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §6.12 API 3: If 1∈𝒩 and c(1)≠0, ν(κ)=0. | Support containing nonzero c(1) gives infimum 0 even if other conductors have counts 1,2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §6.12 API 4: Families with the same zero/nonzero support on 𝒩 have the same vanishing order. | Rescale the nonzero values 1 to 2 over 𝔽₅ without changing support {6}; both orders are 2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §6.13 API 1: The good primes outside D_KNp with all actual Heegner-class localizations zero. | For D_KNp=35 and zero family, prime 11 is in the locus and prime 7 is out. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §6.13 API 2: ℓ∈B iff ℓ is prime, ℓ∤D_KNp, and every n∈𝒩 has loc_ℓc(n)=0. | At prime 11, localization values all 0 give membership; changing one value to 1 excludes it. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §6.13 API 3: If the localizations of two families agree at every good prime and conductor in 𝒩, their base loci agree. | Two families with identical local values (0,0) at 11 both include 11, regardless of distinct global representatives. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §6.13 API 4: The zero family has every prime outside D_KNp in its base locus. | Zero family at a good prime 11 has every localization 0; at coefficient prime 7 the exclusion remains false membership. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §7.4 API 1: The integer u₀ is the index of the actual global stabilizer after the central quotient; at a new inert prime the cyclic conductor degree is (Nℓ+1)/u₀. | At u₀=2 and Nℓ+1=8, the first cyclic degree is 8/2=4; u₀=1 instead gives 8. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §7.4 API 2: M₀ is the valuation of this integer in O_𝔭; the auxiliary Frobenius depth is M+M₀ and includes coefficient ramification. | For u₀=2, v_𝔭(2)=1 or 2 gives M₀=1 or 2; at M=3 the Frobenius depths are 4 or 5. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §7.4 API 3: The set S₁(M) consists of inert good primes unramified in the specified finite extension with arithmetic Frobenius conjugate to ρ, with every fixed finite excluded set retained. | The trace/determinant of complex conjugation are 0 and −1, giving polynomial 1−X²; Nℓ≡−1 and a_ℓ≡0 match those two coefficients. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.1 API 1: Inert Φ=(p+1)²−a_p². | At p=5,a=1, inert Φ=36−1=35. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.1 API 2: Split Φ is the product of the two Artin quadratic factors, not its augmentation. | With s³=1, (5−s+s²)(5−s²+s)=27−s−s², whereas its augmentation is 25. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.1 API 3: Augmentation of the split factor is (p+1−a_p)²; inert augmentation is unchanged. | Split augmentation gives 27−1−1=25; inert augmentation leaves the scalar 35. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.1 API 4: A coefficient-ring map and compatible finite ring-class group map carry Φ to the corresponding factor. | Coefficient reduction mod 5 sends 27−s−s² to 2−s−s², and forming the reduced product gives the same polynomial. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.2 API 1: At k≥1 the scaled point is α_p⁻k(P[p^k]−α_p⁻¹P[p^(k−1)]). | At k=1, α=2,P₁=4,P₀=2 gives (4−1)/2=3/2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.2 API 2: An equivariant ℤ_p-linear map commutes with stabilization. | For linear map [3], stabilized raw values (12,6) give (12−3)/2=9/2=3·(3/2). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.2 API 3: A unit rescaling of all raw points rescales every stabilized point by that unit. | At p=5 the unit 3 rescales 3/2 to 9/2; a nonunit 5 instead changes the index. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.2 API 4: The conductor-zero value uses its separate split/inert correction with u_K. | At conductor zero, α=2 and trivial split Artin actions give (1−1/2)²=1/4, distinct from the positive-level result 3/2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.5 API 1: For the fixed data and the finite-solvability witness used by the construction, π[n](Q[n])=Φ[n]P[n]. | On ℤ/7, π=id,Φ=[5],P=1 gives π(Q)=5=Φ(P). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.5 API 2: For each edge j of the supplied permitted-edge index, the fixed trace tr[j] sends Q[target j] to a[j]Q[source j]. | On ℤ/7 with trace=id,a=2 and source value 3, the edge forces target 6; both sides equal 6. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.5 API 3: For the actual supplied level projections and transitions, assume cor[n,k]∘pr[n,k+1]=pr[n,k]; then cor[n,k](pr[n,k+1](Q[n]))=pr[n,k](Q[n]). | For identity projections and transition, cor(pr(Q))=Q=pr(Q); a zero transition would fail at Q=1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.5 API 4: For two families satisfying the same bottom and fixed auxiliary constraints, their difference has zero bottom projection and satisfies the same homogeneous auxiliary trace relations; it need not be zero. | On ℤ/2 with zero bottom projection and id=id self-edge, Q=0,Q′=1 have difference 1, bottom 0 and homogeneous trace 1=1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.6 API 1: Under Iwasawa–Shapiro, level k equals the Kummer class of y_k. | At identity level projection, y=2 mod 7 has Kummer quotient class 2 on both constructions. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.6 API 2: An equivariant quotient or scalar transport commutes with the class construction. | Scalar [3] applied to point 2 gives class 6=3·2 after Kummer. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.6 API 3: Changing the tower by a finite initial norm gives the imported corestriction comparison, with its degree/factor. | Trace from a trivial-action degree-two orbit sends 1 to 2; the induced corestriction factor is 2, not 1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.6 API 4: The identically zero compatible point family has zero class. | Zero family has every finite coordinate 0, so its inverse-limit Kummer class is 0. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.7 API 1: Membership is fixed torsion restriction together with failure to factor through G(n−1). | For G=C₂, preceding quotient 1 and trivial torsion subgroup, the nontrivial character has exact level 1 and is admitted. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.7 API 2: Every member restricts to χ₀ on G₀. | A character restricting to −1 on a prescribed torsion generator is excluded when χ₀ specifies +1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.7 API 3: Every pullback from G(n−1) is excluded. | For C₂→1, the pulled-back trivial character has values χ(1)=χ(s)=1; its exact-conductor membership is false, unlike the character with χ(s)=−1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.7 API 4: Compatible isomorphisms of tower quotients and torsion subgroups identify the strata. | The identity isomorphism of C₂ tower data preserves the one-element primitive set of nontrivial characters. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.14 API 1: α_m(γ)=u^((p−1)p^(m−1)), with its chosen Artin/infinity-type h. | At p=5,m=1,2 the exponent is 4,20, not 5,25. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.14 API 2: α_(m+1)=α_m^p for m≥1. | u²⁰=(u⁴)⁵, so α₂=α₁⁵. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.14 API 3: α_m≡1 modulo p^m, by the unit-power congruence. | At p=5,u=6, 6⁴−1=1295 has valuation 1; the next power has valuation 2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.14 API 4: For non-torsion u, α_m is nontrivial for every m≥1; its limit is1, which is not a member. | Torsion u=−1 gives (−1)⁴=1; non-torsion u=6 has 6⁴≠1 and every exponent positive. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.15 API 1: M_r is the infimum of the supplied actual indices at ν(n)=r. | Indices 2 and 6 in a stratum give infimum 2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.15 API 2: At r=0 the only conductor is1, so M₀=ind κ₁. | The only squarefree conductor with zero prime factors is 1, so index 4 at the bottom gives M₀=4. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.15 API 3: M_r=∞ iff every permitted class at level r is zero, with empty strata giving∞. | Zero stratum and empty stratum both give ∞; a nonzero value of index 2 forces M_r≤2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.15 API 4: Common p^t-rescaling adds t to indices when coefficient depth allows it; truncation at the quotient depth is retained. | In ℤ/5⁴, x=5 has index 1,5x=25 index 2,5³x=0 and index ∞, so addition applies only before truncation. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.18 API 1: The H⁰ error exact sequence is the one displayed above. | G=0,L=R[0] gives H⁰(G)=0,H⁰(L)=R,H¹(fibre)=R,ker=0, a nontrivial H⁰ error. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.18 API 2: For the specified compact coefficients and sufficiently near-one twists, H⁰(L)=0. | For compact ℤ₅ with a local element acting by 2, invariants solve (2−1)x=0 and are 0; the discrete quotient can have finite fixed torsion for an action by 1+5. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.18 API 3: After that vanishing, H¹ is the kernel of the global-to-local H¹ map. | With H⁰(L)=0 and global/local H¹ map ℤ/7→0, both H¹(fibre) and kernel have 7 elements. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.18 API 4: Specialization retains the derived local error terms. | Tensor the complex [ℤ₅ --5→ ℤ₅] with 𝔽₅: the map becomes 0, so a new one-dimensional kernel appears; naive cohomology specialization would miss it. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.25 API 1: Evaluation on γ^z is ((1+p)^(p^r))^z for every z∈ℤ_p. | For p=3,r=0,z=2, α(γ²)=4²=16, and α(γ)²=16. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.25 API 2: It is a continuous homomorphism Γ→ℤ_p×, with α_(r+1)=α_r^p. | 4³=64 gives α₁=α₀³; at z=1+1, 4²=4·4. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.25 API 3: Its depth is v_p(α_r(γ)−1)=r+1; every α_r is nontrivial. | v₃(4−1)=1 and v₃(64−1)=v₃(63)=2. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.25 API 4: The characters converge to the trivial character as r tends to infinity. | For any fixed m, r≥m−1 gives α_r(γ)≡1 mod 3^m; the limit value is 1, distinct from every finite value 4^(3^r). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.30 API 1: The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted. | With identity rational determinant map and y=5 in rank-one S, the tensor coefficient is 25 and z maps to 25. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.30 API 2: It is the unique rational determinant preimage of that Heegner tensor. | An identity map over ℚ has the unique preimage 25 of 25; a zero map would have none at 25. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.30 API 3: Rescaling y∞ by a multiplies z̃∞ by a·ι(a), not merely a. | At a=5 and trivial involution, aι(a)=25; at a=γ, aι(a)=1 rather than γ². | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.30 API 4: Compatible derived base change and determinant comparison carry z̃∞ to the tensor of the specialized bottom classes. | Specializing γ to 4 sends γγ⁻¹ to 1; the two tensor factors specialize to 4 and 1/4, whose product is 1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.33 API 1: Restriction recovers the invariant differentiated Kummer class. | Shear restriction sends descended (−1,1) to the invariant differentiated class (0,1). | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.33 API 2: Changing a cyclic generator transforms the class together with the specified tensor factor. | Modulo 7, generator change factor 3 and scalar factor 5 cancel to 1. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.33 API 3: Coefficient reduction commutes with the class when the quotient ideals are ordered correctly. | The inclusion (25)⊂(5) permits reduction of a class 7 to 2; the reverse ideal inclusion fails. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |
| §8.33 API 4: At empty auxiliary support, use the actual universal-norm Heegner bottom class. | Empty derivative is 1; applying it to actual bottom 2 gives 2 before the restriction inverse. | Law has the computed value under the stated carrier/hypotheses; source and arithmetic existence are separately recorded. |

### Conventions, supplier boundaries and worked examples

| Statement | Instances tried and computed values | Result and change |
| --- | --- | --- |
| Number fields, nonzero coefficients and local residue size | In ℚ, 1≠0 and characteristic is 0; the zero ring has 1=0; a residue field has q≥2, while a one-element ring has 1=0 | Zero-ring and q=1 models fail the stated carriers. |
| Finite and unramified coefficient rings | O_𝔭/ϖ has finite size p^f; ℤ_p^ur/(p) has infinite residue field 𝔽̄_p but length 1 | Separated the unramified completion from finite coefficient DVRs; p^length is not its quotient cardinality. |
| Characteristic-zero versus inseparable extensions | The map t↦t² on 𝔽₂(t) has zero derivative, whereas characteristic-zero quadratic discriminants −4 and −3 are nonzero | The purely inseparable test does not satisfy the number-field hypotheses. |
| Nonreduced arithmetic models | In 𝔽₂[ε]/ε², ε≠0 but ε²=0 and the algebra has dimension 2; in a number field x²=0 implies x=0 | Generic arithmetic fields are reduced; foundational model suppliers, rather than field shortcuts, own nonreduced test schemes. |
| Positive/squarefree conductors and total-function junk | Conductor 1 has zero prime factors and depth ∞; 6 has two distinct factors; 12 has two distinct factors but is not squarefree; 0 has no positive finite conductor meaning | Specified M(1)=∞; no theorem uses the prime-factor list at conductor 0. |
| Signed quadratic discriminant | For ℚ(i), radicand −1 gives field discriminant −4; for ℚ(√−3), both are −3; conductor 3 in ℚ(i) gives −36 | Signed field, order and radicand data remain distinct. |
| Exceptional units | For ℚ(i), #units=4 and u_K=2; for ℚ(√−3), #units=6 and u_K=3; for ℚ(√−7), #units=2 and u_K=1 | General CM construction retains units; the ordinary (disc) branch excludes −3 and −4. |
| Heegner splitting versus CM endomorphism field | For M=ℚ(i), the prime 2 is ramified and divides N; a Heegner K must split 2, so M cannot equal K; two distinct quadratic fields have compositum degree 4 | No full GL₂ hypothesis is imposed on the CM branch. |
| Quaternion parity | For [F:ℚ]=1, no real ramification needs even #S_B; for degree 2, one real ramification needs odd #S_B; total ramified-place counts are even | The indefinite algebra has exactly one split real place, with the correct finite parity. |
| Classical trace versus selected point | Under negation action, selected point 1 has trace 1−1=0; class number 3 gives three summands, class number 1 gives one | The bottom class always uses the full trace. |
| Free versus full index | For G=ℤ⊕ℤ/6 and y=(5,1), free index is 5 and full index is 30; y generates no nonzero torsion element | The torsion factor is retained in cardinality formulas. |
| Artin convention | In C₃, arithmetic/geometric conversion is s↔s², and (s²)²=s; in C₂ inversion is identity | The order-three witness detects an inversion that an order-two witness would miss. |
| Finite versus transverse conjugation | At ℓ≡−1 mod 5 and a Fr_ℓ-fixed vector v, finite evaluation transforms v↦v; tame evaluation transforms v↦−v; cyclic generator σ↦−σ, so (−v)⊗(−σ)=v⊗σ | Added a separate witness to §5.2; global correction includes the group and tensor actions. |
| Residue Frobenius normalization | In 𝔽₉, i³=−i and i⁹=i; Fr₃²=id on 𝔽₉ while Fr₃ is not id | The pointwise congruence uses the ℓ-power endomorphism, not residue-field Frobenius. |
| Kolyvagin and level-raising prime sets | At p=5, ℓ≡−1 gives ℓ²−1≡0; admissible q requires q²−1≠0, so the sets have empty intersection | No auxiliary prime is used in both roles. |
| Zhang residual coefficient field | For k₀=𝔽₂₅, GL₂(k₀) determinants have 24 values but the mod-5 cyclotomic determinant has only 4 values | Surjectivity with trivial nebentypus forces k₀=𝔽₅; the other coefficient-field branches remain general. |
| Zhang primitive normalization | At p=5, a nonzero residual value 1 becomes 0 under [5] and 2 under [2]; a denominator 3 has inverse 2 modulo 5 | Added the (O,𝔭)-optimal Tate image and p-unit Hecke normalization to the endpoint. |
| Tate-dual/inverse twist | At generator value α(γ)=4, the inverse twist has value 1/4 and their tensor product has value 1; twisting twice instead gives 16 | Aligned §8.40 with W_(α⁻¹), and retained the involution in determinant formulas. |
| Ordinary root and nonzero denominators | For p=5,a=1, f(1)=5 and f′(1)=1 mod 5; α is a unit, β has positive valuation, β−1 and β²−1 are units | Division by α is integral; division by the initial factor 25 is not. |
| Hodge normalization and degree | For deg D=2, 2x−D has degree 0; x−D has degree −1; an elliptic-point stabilizer of order 2 contributes 1−1/2=1/2 | Defined the orbifold correction and required positive logarithmic canonical degree. |
| Parametrization degree versus quotient dimension | A genus-two Jacobian of dimension 2 mapping onto an elliptic curve has kernel dimension 1; the induced nonconstant curve map X→E is finite of positive degree | Removed the inappropriate finite degree attached to every J→A; polarization degree has its own source and target. |
| Valuation versus coefficient ramification | At u₀=2, v_𝔭(u₀)=1 in an unramified dyadic DVR and 2 when e=2; 21v_𝔭(2) is 21 or 42 | Neither M₀ nor the dyadic error is silently specialized to ℤ₂. |
| Cohomological cone shifts | Cone(0→R[0])[−1]=R[−1] and H¹=R; Cone(0→R[0]) has H⁰=R | The inner local cones are unshifted and the outer cone is shifted by −1. |
| Ordinary local condition versus (0,∅) | For a rank-one ordinary Selmer lattice, rational rank is 1; a torsion (0,∅) dual has rank 0 | The two complexes/modules cannot be identified by notation. |
| Square-root BDP convention | A square-root value 5² gives squared value 5⁴; multiplying the root by 5 raises the square valuation by 2, while a unit factor raises it by 0 | Nonunit period/regulator factors remain visible. |
| Compactness and nonemptiness | On ℤ/7, equations q=1 and q=0 each have one solution but their intersection has zero; on an empty coordinate space the empty finite constraint already has no solution | Finite solvability is a separate theorem; no arbitrary projection surjectivity is asserted. |
| Finite-group character versus crystallinity | A character of order 4 has fourth power 1; a non-torsion unit 6 has fourth power 1296≠1; at p=3 the continuous depth sequence gives valuations 1,2,3 | Crystalline algebraic-Hecke and merely continuous twists are distinct constructions. |
| Ideal inclusion/divisibility direction | (5³)⊂(5²) gives reduction mod 25; (5)⊄(25). The generator 5² divides 5⁴, so (5²)⊃(5⁴) | Coefficient reductions and characteristic-ideal bounds have the stated directions. |
| Finite length versus exponent | (ℤ/5)³ has exponent 5, length 3 and order 125; ℤ/25 has exponent 25, length 2 and order 25 | The uniform exponent is not a uniform order bound. |
| Rank-zero and zero-point controls | The zero family gives every Kummer class 0, every divisibility value ∞ and determinant element 0; a non-torsion point fails this zero model | Nonzero-bottom, non-torsion and rank-one conclusions are never claimed for zero input. |
| Noncompact dynamics control | The constant function on a probability orbit has integral 1; its integral against an infinite Haar measure is infinite | The dynamical contract specifies a probability measure on the closed finite-volume orbit and a compact-open averaging group. |
| Identity and trivial-group controls | Identity restriction/norm has degree 1 and kernel size 1; the trivial character factors through the preceding trivial quotient, so its exact positive-conductor stratum is empty | No identity-map or empty-stratum exception is hidden. |
| gap:integral-family-logarithm | With t=2,q=5,I=25,C=5, both sides p^tq=IC are 125; omitting the local factor gives 25≠125 | Scope witness only; the accepted general integral reciprocity obligation remains unproved here. |
| gap:surjective-three-integral-comparison | In ℤ₃⟦T⟧, lengths at (3) of (3) and (1) are 1 and 0, while after inverting 3 both are 0 | The accepted p=3 integral comparison cannot be supplied by a rational theorem. |
| gap:jsw-propagated-specialization | Sha=25,C=5,Tam_K=25,q=5 gives total 5⁸; removing one square of C would give 5⁷ | The exact propagated control obligation retains every factor. |
| gap:classical-uniform-square-index | I=5,d=1 gives order bound 25; exponent-5 group (ℤ/5)³ instead has order 125 | The accepted uniform length theorem is a distinct obligation. |
| gap:self-dual-rigidity-three | At p=3 the inequality p>3 is false; M₀=4,M∞=1 would require exact paired length 6, beyond an upper bound of 8 | The accepted residue-three rigidity obligation is retained without claiming a proof. |
| gap:elliptic-adelic-open-image | SL₂(ℤ₅) has determinant subgroup {1}, infinite index in GL₂(ℤ₅), and scalar centralizer | The accepted image obligation is not replaced by the Tate commutant theorem. |
| gap:abelian-scalar-image | If the scalar subgroup has index at most 4, trivial reduction modulo 7 would force index at least 6, contradiction; −1 gives v₃(u−1)=0,v₂(u−1)=1 | The bounded-index scalar theorem gives the almost-all unit conclusion, with dyadic loss retained. |
| gap:zhang-level-raising | At p=7,q=5, q²−1=24≠0 mod 7 and a_q=1 has a_q²=(q+1)²=1 mod 7; this scalar congruence alone specifies no integral eigenfunction lattice | The accepted multiplicity-one and integral identification obligation is stronger than existence of a newform. |
| gap:gl2-integral-rank-zero | Selmer length 2 plus component lengths 1 and 2 requires normalized value valuation 5; inverting p erases that scalar valuation | The accepted GL₂-type integral control obligation remains explicit. |
| gap:cm-local-dynamics | In SL₂(ℚ₃), diag(3,1/3) conjugates u(1) to u(9); the real-line time interval has no such 3-adic scaling parameter | Real Ratner data do not constitute the accepted nonarchimedean contract. |
| gap:primitive-toric-mu | Series 1+5T has μ=0 and series 5(1+5T) has μ=1; they generate the same ideal after inverting 5 | The accepted primitive period/projection μ input retains p-content. |
| gap:eisenstein-elliptic-unit-inputs | At p=3 an unramified quadratic character has inertia value 1 and Frobenius value −1, so is neither trivial nor the cyclotomic character with nontrivial inertia | The accepted independent elliptic-unit/Katz obligation is not inferred from Heegner equality. |
| Worked example, Layer 0 | Index 3, discriminant −36, Picard number 2, and weighted local orbit 2·2=4 | Agrees with §§0.2,0.4,0.5 and 2.2. |
| Worked example, Layer 1 | deg(2x−D)=0 and 6x−3D=3(2x−D); parametrization scaling 5 sends (I,c) to (5I,5c) | Agrees with §§1.4–1.6. |
| Worked example, Layer 2 | Counts (0,6),(1,5),(2,4) total 6; coefficients 2−2=0 and 2−1=1 | Agrees with first-step formulas; no simultaneous global realization is asserted. |
| Worked example, Layer 3 | Component length 2 plus lattice index 5 is distinguished from its rational span, whose index is 1 | Agrees with the integral local comparison targets. |
| Worked example, Layer 4 | (5)+(25)=(5); (s−1)(s+2s²)=2−s−s² | Agrees with the minimum exponent and derivative sign. |
| Worked example, Layer 5 | Tate component orders 5 and 1 differ, while μ₅ supplies 5-torsion in either case; shear inverse gives (−1,1) | Agrees with the local error separation and correction direction. |
| Worked example, Layer 6 | Bottom valuation 3 gives length bound 6; ν=1 gives dimensions 2 and ≤1 and 3 detecting primes | Agrees with Howard and Zhang conclusions. |
| Worked example, Layer 7 | For (20,30), C₀(2)=C₀(5)=1; B(5)=2,B(2)=23 with other constants zero; exponent 5 does not determine order 125 | Agrees with integral error formulas. |
| Worked example, Layer 8 | Content valuation 0 versus augmentation valuation 2; paired length 2(3−1)=4; γι(γ)=1 | Agrees with local specialization, exact length and determinant involution. |
| Worked example, Layer 8b | Height-one (3) lengths 1 and 0 differ integrally; Tamagawa p-parts 5,25 give M∞=3 and K-product valuation 6 | Agrees with rational/integral and rational/K-prime distinctions. |
| Named anticyclotomic and CV hypotheses | At E(K)[5]=0 the group has one element, whereas a rational 5-torsion point gives at least 5 and fails (tor); at the moving ramified prime P, Eichler level P has exponent 1 and is nonmaximal, whereas CV(H2) applies only to Q≠P. | Expanded (Heeg),(spl),(tor),CV(H1),(H2); corrected the omitted Q≠P in §8.21 to retain ramified moving primes. |


Pull request: #1423 (roadmap/heegner-point-euler-systems at f62ba61)
