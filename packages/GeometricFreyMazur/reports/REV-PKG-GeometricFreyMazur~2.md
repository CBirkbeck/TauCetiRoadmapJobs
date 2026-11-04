<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1184#issuecomment-6395515575 -->
Review (codex) of b4a6f3d

Verdict: needs_changes

1. **F01** (P1) Three supplier references point to the wrong targets

   **Location.** `packages/GeometricFreyMazur/README.md:150`, also lines 9, 70, 138, 218, 559 and 619: “ModularCurvesPartII §6.1 (conjugation)”. Line 122: “A1.1 identifies elliptic schemes with relative dimension-one abelian schemes”. Lines 13, 126, 1095 and 1103 use “CSG.5/congruence-bound”.

   **Claim.** Those sections supply conjugation, the relative elliptic equivalence and the numerical spectral theorem.

   **Witness.** At the supplied open heads, the actual targets are ModularCurvesPartII §8.4, AbelianSchemesAndArithmeticModuli A1.6 and CongruenceSpectralGap §5.3. The first two cited sections instead discuss compact uniformization and products/dimension; the CSG alias is absent.

   **Exact repair.** Cite ModularCurvesPartII §8.4, `complexConjugationComparison`, for conjugation everywhere; retain §6.1 wherever compact uniformization is actually used. Add §8.5, `genericBaseChangeAndLevelCompatibility`, for the generic compatibility claimed in the modular contract. Replace A1.1 by A1.6, `relativeEllipticEquivalence`, for the elliptic/abelian comparison in the contract and the consumers at lines 1187 and 1291. Replace CSG.5/congruence-bound by CongruenceSpectralGap §5.3 in all four occurrences. Update the scope's corresponding section list.

   **Repair test.** `TauCetiRoadmap/ModularCurvesPartII/README.md:2668` explicitly gives the determinant −1 frame change and pairing inversion: at p=7 it exchanges square classes, while at p=5 it preserves them. `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:898` preserves zero, multiplication and the differential bundle, including over dual numbers. `TauCetiRoadmap/CongruenceSpectralGap/README.md:728` supplies 21/100, including the empty-small-spectrum value 1/4. These are exactly the three consumed conclusions, with no new supplier or upward edge.

2. **F02** (P1) Étale presentation quotients do not supply the claimed finite group quotient comparison

   **Location.** `packages/GeometricFreyMazur/README.md:114`: “Use §§C−1.1–C−1.3 for analytic spaces, analytification, maps and finite quotients”.

   **Claim.** ComplexComparisonPartII supplies analytification of the finite group quotients used here, including points with nontrivial stabilizer.

   **Witness.** `TauCetiRoadmap/ComplexComparisonPartII/README.md:790` and line 814 construct quotients of étale equivalence relations. For the sign action on A¹, the coarse quotient is z↦z²; its derivative at zero is 0, and its action relation has nontrivial isotropy.

   **Exact repair.** Remove “finite quotients” from the C−1.1–C−1.3 supplied-content list. Declare `gap:finite-group-quotient-analytification` with supplier ComplexComparisonPartII, section C−1.3, in both the README supplier subsection and the plan's top-level gaps. Its precise need is: for a finite group acting on a projective complex scheme X, with scheme quotient q:X→Y, identify q^an with the finite categorical analytic quotient, including the invariant structure sheaf, stabilizers and nilpotents, compatibly with equivariant maps. Cite this contract at §0.2 and where the analytic quotient is used in §6.4. The existing algebraic quotient remains SchemeAndStackFoundations §1.17; no second construction of it is needed. A proof route may use C1.9's proper-pushforward GAGA and the characteristic-zero averaging idempotent.

   **Repair test.** For X=P¹ with sign action, the comparison must give w=z², local invariant germs C{z²}, and local degree 2 at zero, without declaring q étale there. For the trivial action on a projective dual-number point, the quotient retains ε≠0, ε²=0. The existing étale-presentation interface alone does not state these comparisons. The proposed contract has an earlier named owner and covers these witnesses.

3. **F03** (P2) The current-transport gap asks a second owner for existing current theory

   **Location.** `packages/GeometricFreyMazur/README.md:100` and `packages/GeometricFreyMazur/design/plan.json:5394`: “positive ddᶜ currents, Poincaré–Lelong, Green and Stokes formulas”. The README already imports analytic-cycle integration and Poincaré–Lelong from ComplexComparisonPartII at line 114.

   **Claim.** These are missing general inputs to be supplied by ComplexKahlerGeometry under `gap:analytic-cycle-current-transport`.

   **Witness.** ComplexComparisonPartII C5.4 already owns `CurrentCalculus`, `AnalyticCycleIntegration` and `lelongPoincareSection` on general complex manifolds, with weighted positive cycle currents and the local equation (i/π)∂∂̄log|f|=[div f].

   **Exact repair.** Trim this gap, in both locations, to the genuinely additional proper-normalization/branch-weight, finite-map integration, local-multiplicity, relatively compact sublevel Green/Stokes, and cusp-density transport statements. Explicitly consume the existing current calculus, weighted analytic-cycle integration and Poincaré–Lelong from ComplexComparisonPartII C5.4. Do not request their reconstruction in ComplexKahlerGeometry. Explain the dᶜ normalization conversion once. Keep the two hyperbolic-volume contracts separate and unchanged. This is a minimality correction to the gap, not a request to implement it here or make ComplexKahlerGeometry depend on its consumer.

   **Repair test.** `TauCetiRoadmap/ComplexComparisonPartII/README.md:3020`, line 3207 and line 3258 give the carrier, weighted integration and formula. For f=z², the supplier current is 2[0]; the package's ddᶜlog|z²|² is also 2[0], because its ddᶜ=(i/2π)∂∂̄. On a double line both integration functionals are twice the reduced-line functional. Thus the purported new current/PL content is exactly the imported object, not a new normalization or noncompact extension.

4. **F04** (P3) Procedural and duplicate Checks remain outside the repaired examples

   **Location.** `packages/GeometricFreyMazur/README.md:369`: “Check the two exact word identities”; line 729: “test sinh R instead of its small-R linear approximation”; lines 1179–1183 repeat scalar rescaling with a=1 and a=−1.

   **Claim.** These bullets are discriminating computed Checks. In §9.1 the first three bullets test the same projectivization property, leaving only two distinct properties with the twist control.

   **Witness.** At p=7, §1.3 gives M=[[8,21],[35,92]], determinant 1 and trace 100. At R=10, sinh R≈11013.233, not 10. The identity and negative-identity cases in §9.1 are already contained in its arbitrary-scalar bullet.

   **Exact repair.** Replace §1.3's instructions with the matrices at p=7 and p=11: [[8,21],[35,92]] and [[23,33],[154,221]], determinants 1 and traces 100 and 244, verifying the displayed words in both residue classes. Replace §4.4's instruction with the computed R=10 comparison and the rotation test p=7,d=1,R=1/2: precisely k=0,1,6 have displacement below 1. In §9.1 keep the arbitrary-scalar and twist controls, and replace the two redundant bullets by (i) multiplier 3 at p=7 has nonsquare class and selects the other component; (ii) the Legendre family has nonconstant j=256(1−t+t²)³/(t²(1−t)²), so its identity-torsion classifying map is nonconstant. Keep these in the README, not Suggested.lean.

   **Repair test.** Direct integer matrix multiplication gives both stated matrices and determinants. The nearest nonidentity rotation has displacement 0.980099; k=2,5 have larger displacement than 1. The determinant example distinguishes the two components, and the Legendre example excludes a constant-map construction. These are new witnesses, not repeated instances of forgetting a scalar.

Four findings: three blocking (two P1 and one P2), and one P3. The two native headline signatures elaborate. No mathematical counterexample to those signatures was found. The blocking findings concern supplier attribution and ownership, not the absence of the ten declared contracts.

## Verified sound

The review read all 66 numbered subsections in 11 layers, the conventions, APIs, Checks, supplier contracts and worked arguments. The earlier review's rows with computed values were usable evidence; rows merely identifying a route or a sign were expanded below. The changed passages, the 15 seeded targets, all three Lean declarations, all ten gap records and every Needs line were inspected afresh. The adversarial table contains 161 computed rows. No package implementation file was edited.

### Earlier findings, one by one

| Earlier finding | Repaired passage and status | Verification |
|---|---|---|
| F01 | **Repaired.** Suggested line 75: `theorem geometric_frey_mazur (N : ℕ) :`; README line 21: “the infimum in ℕ of the degrees [K:k(f)]”. | Real definition; threshold precedes k,K; actual torsion and native isogeny. The rational/genus-one/hyperelliptic/empty-set controls give 1,2,2,0. |
| F02 | **Repaired.** Suggested line 54: `theorem full_monodromy`; line 58: `hpN : 800 * N < 7 * p`. | All field, tower, ellipticity, nonconstant-j and prime binders survive elaboration. 7·229/800=1603/800>2. |
| F03 | **Repaired.** README line 15: “The subgroup-index and self-twist arguments are auxiliary README targets.” | All three old auxiliary declarations are absent. §8.2 includes p=2,3; §8.4 no longer assumes χ²=1. |
| F04 | **Repaired.** README line 188: “one matrix g̃∈GL₂(𝔽_p)”; “the frame matrices are equal”. | At j=1728, g and −g differ for p>3, although both have polynomial t²+1. Lie eigenvalues distinguish (i,i) from (i,−i); modular tangent characters do not. |
| F05 | **Repaired.** README line 925 explicitly consumes `gap:curve-extension-and-normalization`; the contract names the normalization “supplied by SchemeAndStackFoundations §4.13”. | The slug now reaches §§6.2,6.4,9.1,9.8,10.2,10.3,10.4. Normalization ownership is imported; extension/factorization remain the contract. |
| F06 | **Repaired.** README line 74: “§0.11 for finite-Galois descent”; line 66 cites the infinite-Galois fixed-isogeny criterion and integer degree scaling. | Read §0.11 on main and both Tau Ceti declarations at the pin. Other supplier drift is R01, not a reversal of this repair. |
| F07 | **Repaired.** §8.2 cites transvection generation; §8.4 cites `Matrix.SL2.commutator_eq_top`; §§8.3,9.6 cite BT16 lines 71–74 and 81–82. | Those sources contain the claimed inputs. The remark gives qualitative monodromy; the numerical constant is separately derived. |
| F08 | **Repaired at the reported locations.** §0.5 now has the “16 ordered pairs” table; §§1.7,1.8,3.5,3.6,4.3,6.5,8.1 contain computed instances. | Orders (1,2,3,p) give 13 trivial and three nontrivial equal-type entries. The repaired duplicates are gone. R04 records the same pattern elsewhere. |

No previous finding was marked “not actionable in this package”; none is being re-raised against a settled reason.

### Sources and the seeded sample

Read the legal cached published BT16, author BTE and arXiv-v1 ABR96 extracts. The manifest keeps one key per work, records published/preprint numbering, and has no newly unverified locator. BLR90 is the settled unread exception. Source evidence below distinguishes a source statement from an additional argument in the roadmap.

| Sample | Locator actually read | Result |
|---|---|---|
| 1.2 | BT16 §3.2, p.719, lines 427–433 | Marked vertices and cosine equation agree. The explicit matrices are an additional derivation; determinants, lifts and fixed point were independently computed. |
| 1.5 | BT16 Lemma 6, p.720, lines 450–452 and its proof | Embedded radius log p+O(1) and separation 2log p+O(1); p>5 and compact metric retained. |
| 2.1 | BT16 §3.3, p.721, lines 528–534 | Height is maximum entry absolute value. Its section/page locator identifies the definition; the supplementary line 537 pointer is the immediately following page marker. |
| 2.2 | BT16 Lemma 10, p.722, lines 539–576 | δ<1/2, marked order-two point and O(p^(4δ)) integral lift. Component transport is explicit in the package. |
| 2.6 | BT16 Proposition 12(b), p.723, lines 621–623; Lemma 13, pp.724–725, lines 644–662 | Two-centre lens gives a bounded enlargement. The package uses the correct doubled radius convention and restricts uniqueness to δ<1/8. |
| 4.3 | BT16 Proposition 18, pp.728–731, lines 814–929 | Supplies ordinary overlap/centralizer argument. Negative determinant and conjugate loci are an additional necessary correction, explicitly retained here. |
| 4.4 | BT16 Proposition 18(a), p.729, lines 819–827; Case 1, lines 853–860 | Supports the stabilizer-coset route. The printed linear-R count is insufficient for growing R; the package derives the exact sinh R count and additive 1. |
| 5.1 | BT16 p.713, lines 190–193; pp.741–742, lines 1407–1411 and 1450–1454 | Canonical degree/area normalizations agree. Weighted pushforward is explicitly imported, not inferred from reduced-image degree. |
| 6.4 | BT16 proof of Theorem 29, p.741, lines 1395–1407 | Dominating component, wreath stabilizer and quotient P¹ agree. The package adds the normalization and generic-freeness qualifications. |
| 7.2 | BT16 p.741, lines 1417–1419 | Source supplies an O(p) bound and noncuspidal factorial bound. The precise divisor 6n!p is derived here using cyclic inertia and n!-th powers. |
| 7.4 | BT16 p.742, lines 1448–1454 | Hurwitz contradiction supported. Package retains −2 deg α, weighted D and the lower bound D/(2n), rather than treating little-o as an exact zero. |
| 8.2 | Tau Ceti Transvection line 595 and Mathlib Index line 55 | No unsupported BT16 claim remains. The coset-action proof works at every prime; transvections cannot have order p in S_d when d<p. |
| 9.4 | BT16 Theorem 1, p.710, lines 58–64; pinned isogeny descent line 117 | Source states original-base isogeny. Scalar-compatible sign descent is the package's explicit proof, with the native descent criterion. |
| 9.5 | BT16 Theorems 1–3, p.710, lines 55–77 | Source initially fixes k. Package gives the additional finite-presentation argument making the threshold uniform in k; no embedding of an arbitrarily large k into C is asserted. |
| 9.6 | BT16 remark/footnote, p.710, lines 71–74 and 81–82; ABR96 Theorem 0.1, lines 14–17 | Qualitative surjectivity and determinant convention supported. Exact 800N<7p comes from the independent spectral/gonality branch, not the remark alone. |

BTE Propositions 2.1, 3.1, 4.1 and 4.2 were also read, including the corrected Heegner-only distinction, conjugate-tube normalization and the residual proof issues below. ABR96 §§1.4–1.7, lines 50–145, retain geometric gonality, Friedrichs energy, singular cutoff and area πD/3. The README's signed reconstruction, cusp-shell argument and relative point-ball derivation are additional mathematics, not attributed verbatim to either paper.

### Supply, gaps and ownership

Dependency check, using the prescribed command with `--movable`, exited 0:

```text
depcheck: 49 roadmaps, 560 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The check does not validate the content of an existing section; R01–R03 were found by reading it. The internal order of the 66 Needs lists is forward, including the separate monodromy branch; §9.4 does not need full monodromy. No supplier is prohibited by the brief.

Main was read at `5078569e9228c1621d251ed1483bae6baf465505`. Open supplier snapshots were ModularCurvesPartII `35be0c8`, ComplexComparisonPartII `2d50a88`, InverseGaloisAndArithmeticFundamentalGroups `740b9cc`, AbelianSchemesAndArithmeticModuli `71ecc01`, NeronModelsAndSemistableAbelianVarieties `3710abd`, and CongruenceSpectralGap `2fdf27d`. Main copies, rather than progress-only open revisions, were used for existing roadmaps. Representative main shapes read were AlgebraicCurves, FuchsianOrbifolds and SchemeAndStackFoundations.

| Supplier | Resolved content, and limiting hypotheses |
|---|---|
| ModularCurves, main | §§0D–0E finite étale/Galois data and descent; §2C dual identities; §§5B–5C pairing and twists. Actual torsion data is kept separately from its scalar class. |
| ModularCurvesPartII | §§1.2–1.3 pointed/lattice uniformization; §2.3 polygon automorphisms; §§3.9,3.14 frames/open uniformization; §§4.1,4.6–4.10 cusps, stabilizers and pairing components; §§5.7,5.13,5.16 scalar and subgroup quotients; §6.1 compact comparison. Conjugation belongs to §8.4 and generic compatibility to §8.5 (R01). §9.13 has the cyclic filter, correct polygon domains and ψ(m), including ψ(4)=6. |
| SchemeAndStackFoundations, main | §§0.8–0.9 spreading, §0.11 finite-Galois descent, §1.17 projective finite quotient over Noetherian base and flat base change, §3.2 Hurwitz, §§4.11–4.13 modifications and finite curve normalization, §§5.1–5.3 weighted cycles, §§5.9–5.10 intersections. §1.17 at lines 2657–2677 does not require A₀=base ring and does not assert arbitrary base change. |
| AlgebraicCurves, main | Layers 3–5 divisors/norm/Riemann–Roch; Layer 7 different/Hurwitz; Layer 12A–E function-field/proper-model dictionary. Arbitrary proper-target extension remains a declared gap, not an inference from the dictionary. |
| FuchsianOrbifolds, main | Layers 0–1 effective actions and faithful cyclic tangent charts, Layer 2 polygons/area/triangles, Layers 3–4 primitive widths, q-coordinates and compactification, Layer 5 finite holomorphic degree and Euler/Hurwitz. It does not supply the additional marked trigonometric contract as an existing target. |
| ComplexKahlerGeometry, main | K3 analytic local geometry; K5a and K6.1 local mass, positive integration and compact comparison. Additional cycle transport and hyperbolic estimates are contracts. The general current owner must not be duplicated (R03). |
| RiemannianGeometry, main | R7.0 fixes positive Laplacian; R8 fixes the round sphere and coordinate eigenvalues. Singular-metric balancing and cutoff are explicitly requested, not claimed supplied. |
| ComplexComparisonPartII | C−1.1–C−1.3 analytic spaces with nilpotents, maps and étale presentations; C2.2 ideals; C4.1–C4.5 proper images, algebraicity and curve connectedness; C5.4 cycle currents and Chern normalization; C6.2 finite-type Riemann existence. Finite group quotient comparison is R02. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.0.3 local systems and actions; IG.1.3 explicitly covers nonproper finite-type schemes under algebraically closed characteristic-zero extension; IG.3.1 punctured-curve comparison. No characteristic-p nonproper invariance is used. |
| AbelianSchemesAndArithmeticModuli | A1.8 Dedekind-base extension; A3.1–A3.5 isogeny/flat torsion/dual criteria; A3.7–A3.8 pairing/frames; A6.1,6.6–6.7 degrees/Hom lattice; A6.20 full-level descent; A6.25 normal-base extension; A6.34 twists. A1.6, not A1.1, supplies relative elliptic equivalence (R01). |
| NeronModelsAndSemistableAbelianVarieties | §§1.3,1.8 marked Néron mapping property and good abelian schemes. The base here is regular of dimension one, and both the isogeny and its dual are extended. |
| CongruenceSpectralGap | §5.3 all-level clipped Friedrichs bound 21/100, including empty small spectrum. Stale alias is R01. |

All ten slugs and their needs sentences agree between the README contracts and the plan's gaps. All have named earlier suppliers and are consumed by Needs lines. Minimality was checked by object, not just by slug:

| Declared gap | Result |
|---|---|
| analytic-cycle-current-transport | R03: trim existing current/PL content. Normalization, finite-map and cusp/sublevel transports remain legitimate additional requests. |
| hyperbolic-cycle-volume-comparisons | Distinct curvature −1/max-distance/sum-area comparison, retains weights and excludes ordinary diagonal components. Not an existing target found in the searched sources. |
| relative-point-ball-volume | Distinct upper relative growth bound, with no incidence requirement; the worked Green argument is checked below. |
| hyperbolic-trigonometry | Explicit marked-triangle, trace, rotation and midpoint comparisons, beyond the main polygon targets. |
| gonality-norm-and-base-change | General intrinsic gonality and proper-model comparison; the small native field-degree definition is only its acceptance adapter. No gonality declaration was found at the pins. |
| singular-metric-li-yau | Adds the singular Friedrichs/cutoff form; smooth round-sphere formulas alone do not give it. |
| free-locus-and-relative-cycle | Adds étaleness over the free image and finite-flat relative cycles; main §1.17 states neither generic torsor construction nor relative cycle morphism. |
| curve-extension-and-normalization | Trimmed repair imports finite normalization and requests extension, factorization and birational genus comparison. |
| cyclic-surface-resolution-and-contraction | Main Bertini smoothness does not include the combined connected/transverse/avoidance assertion or cyclic chains and Castelnuovo contraction. |
| surface-contraction-intersections | Requests the explicit cyclic matrix and contraction update; main intersection operations alone are not that comparison. |

`roadmaps list`, `roadmaps show` and object searches with `roadmaps grep` covered the supplied current open index and main. Searches included gonality, Frey–Mazur, self-twists, subgroup index, cyclic quotients, Hirzebruch–Jung, Castelnuovo, analytic-cycle currents, Poincaré–Lelong, point-ball growth and conjugate diagonals. Matrix/field/function-field/torsion/isogeny objects were also searched at both pins. ModularCurvesPartII is the existing owner of X(p) and cyclic T_m; the retained quotient-surface, repulsion and uniform rigidity targets are specific new applications. The two headline names have no collision found in the searched namespace sources. The current-theory collision is R03. General finite quotients, normalization, degree, transvections and SL₂ perfectness are imported rather than redeclared. No computational algorithm or route-specific restriction on large primes was found.

The board index was read before checking absence. Five accessible indexed board READMEs were searched: AnalyticNumberTheory, ArithmeticStatistics, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory. Their symmetric-power references concern representations or arithmetic normic varieties, not this geometric quotient. Fifteen unavailable board heads limit the ownership conclusion, as listed below; this report does not claim absence there.

### Pinned declarations and acceptance signatures

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Opened declaration | Pinned file and line; content checked |
|---|---|
| Projective general linear group and scalar relation | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:41`, line 64: quotient by centre, equality through a unit scalar. |
| PSL and its injection into PGL | `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:33`; `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:113`, line 120. Does not equate PSL and PGL over F_p. |
| Entrywise matrix norm | `Mathlib/Analysis/Matrix/Normed.lean:87`, line 106: scoped sup/sup norm and entry bound, not operator norm. |
| Subgroup index | `Mathlib/GroupTheory/Index.lean:55`: natural cardinality; infinite index gives 0. Every index used here is finite. |
| Sym and functorial maps | `Mathlib/Data/Sym/Basic.lean:43`, line 342 and line 361: indexed multisets, not schemes. |
| FunctionField | `Mathlib/NumberTheory/FunctionField.lean:58`: finite dimensionality over RatFunc; no finite-constant-field hypothesis. Explicit scalar tower supplies compatibility. |
| Actual torsion module | `Mathlib/Algebra/Module/Torsion/Basic.lean:972`, line 1010: killed-by-p subgroup and ZMod module. |
| Additive torsion maps are linear | `Mathlib/Algebra/Module/ZMod.lean:81`: `AddMonoidHom.toZModLinearMap`. |
| Geometric Galois action | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:823`: coordinatewise additive point map, so p-torsion is preserved. |
| Determinant | `Mathlib/LinearAlgebra/Determinant.lean:173`: finite-basis determinant, fallback 1 without a finite basis. Actual elliptic p-torsion in characteristic zero has rank two; arbitrary modules are not quantified over. |
| Perfectness | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`: field, a≠0 and a²≠1. In F₅, a=2 gives 4≠1. |
| Transvections | `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:595`: field-valued elementary transvections generate SL. |
| Degree and finite maps | `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean:120`, line 133, line 434: total degree, bundled nonconstant finite-fibre holomorphic maps, composition theorem. Compactness, separation and connectedness are supplied at applications, not silently built into an arbitrary map. |
| Ramification divisor | `TauCeti/Analysis/Complex/RiemannSurface/Ramification.lean:112`: coefficient (e:Z)−1. |
| Native isogeny | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:64`, line 72 and line 139: contravariant coordinate pullback with the integrality/pointedness condition. No arbitrary Prop placeholder; constant evaluation does not make the source coordinate integral over the constants. |
| Infinite-Galois descent | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Descent.lean:117`, with `IsGalois` at line 52: unique descent iff all conjugates fix the isogeny. |
| Integer degree scaling | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Hom.lean:63`: abs(n)² scaling, including zero. |
| Scheme normalization | `Mathlib/AlgebraicGeometry/Normalization.lean:122`: normalization of Y in a specified X; the relevant input is its function field, not the identity Y→Y. |

The prescribed `lake env lean` command on the absolute package file, run from the content checkout, exited 0 with only the two `declaration uses sorry` warnings, at Suggested lines 54 and 75. Its one Tau Ceti import already had the required object file. No build was needed. A scratch copy appended `#check @` for **all three declarations** and elaborated once; no binder was lost and no change was made. A separate scratch copy tried `simp`, `rfl` and `infer_instance` as single-tactic closures, with `solve` preventing a partially successful `simp` from masking failure. Neither headline closed. Object searches found no single pinned theorem to use with `exact`; no padding declaration remains.

The gonality definition retains precisely its fields and k-algebra structure. Full monodromy retains N, both fields, algebraic closedness, characteristic zero, both algebras, scalar tower, FunctionField, strict gonality bound, ellipticity, nonconstant j, prime p, 5<p and 800N<7p. Frey–Mazur has ∃M before k,K and retains both ellipticity/nonconstant-j assumptions and the actual equivariant additive isomorphism. For each P and σ the needed Q exists because the point map is additive and pσ(P)=σ(pP)=0; the implication-based equivariance condition is not empty.

Headline coverage: compact/filling-sensitive systoles (§§1.3–1.7); signed reconstruction/repulsion (§§3.1–3.6); overlap and big-diagonal multiplicity (§§4.3,5.8); the three stratum multiplicity bounds (§§5.2–5.4); wreath ramification decay and bounded-gonality rigidity (§§7.3–7.5); Abramovich/full monodromy (§§8.1,8.3,9.6); arbitrary-field rigidity and original-base/function-field Frey–Mazur (§§9.5–9.8); genus and surface-minimal-model conclusions (§§10.1–10.5). The two statable native headlines are present. Each other family is named in the module docstring with its missing modular, analytic-cycle, scheme-family or surface carrier. No weakened stand-in is substituted. The file has one import Mathlib, one used Tau Ceti module, one real-bodied definition, two theorems, no set_option, no sorry'd data and no admitted examples.

The README has the required summary, scope, conventions, supplier contracts, reading guide, 11 layers with Examples and Dependencies, downstream consumers, worked examples and references. The native names agree between README and Lean. Definition blocks have API lists and at least three listed Checks; R04 identifies a definition whose distinct checks fall short despite its bullet count. The remaining future-tense mathematical targets are not algorithms. All declarations remain under the package namespace.

### Computed adversarial table

Each row records an actual instance or algebraic computation, not a claim that numerical tests prove a quantified theorem. “Pass” means the stated hypotheses and proposed argument survive the indicated test. For asymptotics the computed exponents are part of the evidence. General analytic inputs remain the declared contracts. Ordinary definitions have positive and negative controls; constructed interfaces are also tested against the most plausible wrong model. All unlabelled section numbers refer to the package README.

| Statement | Instances tried | Computed left side / right side or excluded value | Result; change |
|---|---|---|---|
| Conventions: function-field gonality | K=k(t), f=t | [K:k(t)]=1; every eligible finite degree ≥1, hence infimum=1 | Pass; no change |
| Gonality: positive minimum | Genus-one and hyperelliptic fields, g≥2 | Degree-two pencil gives 2; degree-one would give genus 0, so minimum=2 in both cases | Pass; comparison remains declared |
| Gonality: total empty-set value | K=k; algebraic extension K/k | No transcendental f; sInf ∅=0; compatible RatFunc embedding impossible | Pass; excluded from headlines |
| Gonality: independence of chosen rational subfield | k(t), chosen subfield k(t²) | Chosen presentation has degree 2, intrinsic minimum remains 1 because f=t is eligible | Pass; definition excludes presentation-degree stand-in |
| Standing field and universe hypotheses | F₂, characteristic-p curve, cardinality larger than C | CharZero fails for F₂; no inseparable extension enters; finite coefficient sets have cardinality ≤ℵ₀ even inside arbitrarily large k | Pass; no cardinality restriction on k |
| Effective cycles | 0, [L], 2[L] | Volume/multiplicity/degree are respectively 0, their base values, twice those values | Pass; no reduced-support replacement |
| Product distance and area | Diagonal disc, r=1 | Max-distance radius=1; coordinate areas add to 2a(1), not a(1) | Pass |
| Curvature normalization | r→0, r=1 | a(r)/r²→π; a(1)=4πsinh²(1/2)≈3.412 | Pass |
| Current normalization | f=z and f=z² | ddᶜlog\|f\|² has masses 1 and 2; supplier (i/π)∂∂̄log\|f\| has the same masses | Pass; R03 ownership correction |
| Tube radius convention | Coordinate distance 3r/2 | Midpoint distances=3r/4<r; wrong threshold r rejects this point | Pass |
| Canonical diagonal normalization | p=7, g_X=3 | Deg Δ=2(2g−2)=8; volume=16π=2π·8 | Pass |
| 0.1 left action | Noncommuting g,h on a frame | g·(h·φ)=φh⁻¹g⁻¹=φ(gh)⁻¹; wrong no-inverse action reverses the product | Pass |
| 0.1 scalar equivalence/components | p=7, scalar 2 and diag(1,3) | det(2I)=4 square; det diag(1,3)=3 nonsquare; squares={1,2,4} | Pass |
| 0.1 effective group and residual inertia | p=7 | \|SL₂\|=336, \|PSL₂\|=168, \|PGL₂\|=336; −I has trivial coarse action but stack inertia order 2 | Pass; coarse curve has no universal elliptic family |
| 0.1 conjugation | p=5,7 | −1=4 square mod 5; −1=6 nonsquare mod 7 | Mathematics passes; R01 citation |
| 0.2 quotient and fibre | Generic point at p=7 | Fixed component-pair fibre=168; full two-component presentation has 336 orbit points | Pass |
| 0.2 invariant composition | Frames replaced by φ_i g⁻¹ | φ₂g⁻¹(φ₁g⁻¹)⁻¹=φ₂φ₁⁻¹ | Pass; quotient map determined |
| 0.2 factor swap | ψ and ψ⁻¹ | (φ₂φ₁⁻¹)⁻¹=φ₁φ₂⁻¹; nonsquare 3 mod 7 goes to 5, still nonsquare | Pass |
| 0.2 universal property/base change | Trivial action on dual-number point | Invariants=k[ε]/ε², length 2; reduced wrong quotient has length 1 | Algebraic API passes; analytic bridge R02 |
| 0.3 common-stabilizer definition | j-types 1728 and 0 | Effective orders 2 and 3 have gcd 1; CM membership false despite both having extra automorphisms | Pass |
| 0.3 sign normalization | Same framed j=1728 point | i and −i both give polynomial t²+1; matrices g and −g are unequal for odd p | Repaired; opposite lift excluded |
| 0.3 Lie distinction | Diagonal and conjugate diagonal at j=1728 | Lie pairs (i,i) and (i,−i); modular tangent pair (−1,−1) in both | Repaired; wrong tangent model excluded |
| 0.3 independence of simultaneous lifts | (i,i), (i,−i) under simultaneous negation | (−i,−i) remains equal; (−i,i) remains unequal | Pass |
| 0.3 conjugation/base change | t²+t+1=0, t≠1 | Other root=−1−t, not −t; conjugation exchanges unequal roots, equality remains algebraically decidable | Pass; R01 supplier citation |
| 0.3 equal j does not suffice | s=[[0,1],[−1,0]], g=[[1,1],[0,1]] | gsg⁻¹=[[-1,2],[-1,1]], unequal to ±s for p>3 | Pass |
| 0.4 singular-bicusp definition | p=7, same and different unipotent fixed lines | Same-line cusp count=(7−1)/2=3; distinct order-7 subgroups intersect in identity | Pass |
| 0.4 invariance and mixed points | (c,c), simultaneous g; cusp/elliptic pair | Shared group conjugates to gHg⁻¹ of order 7; gcd(7,2)=gcd(7,3)=1 | Pass |
| 0.5 exhaustive inertia table | Types 1,2,3,7 at p=7 | Matrix of possible shared orders: (1,1,1,1); (1,2,1,1); (1,1,3,1); (1,1,1,7). Equal-type maximum requires aligned subgroup | Pass; 16 entries, not nine |
| 0.6 cyclic degree | m=1,2,3,4,6,9 | ψ=1,3,4,6,12,12; σ₁(4)=7 and σ₁(9)=13 are wrong for cyclic kernels | Pass |
| 0.6 torsion isomorphism condition | m=1 versus m=p | Identity gives rank-2 torsion map; [p] is zero on E[p] | Pass; p∤m essential |
| 0.6 pull-push weights | m=4, cycle degree D | Each finite leg has degree 6; weighted pull-push multiplies canonical degree by 6, not 7 | Pass; supplier §9.13 read |
| 0.6 determinant and symmetry | Degree m prime to p | Weil multiplier=m; reverse isogeny composes to [m], hence inverse projective torsion class | Pass |
| 0.6 polygon maps | p=7,d=2 | φ_d:G_m×Z/14→G_m×Z/7 has degree 4; ψ_G degree 2; φ_d[p] invertible since 2≠0 mod 7 | Pass; source domain typo not inherited |
| 1.1 compact triangle | p=5,6,7 | Reciprocal sum=31/30,1,41/42; hyperbolic precisely for p>6 | Pass |
| 1.1 filling quotient | Peripheral U^p | Image U_p^p=−I, projectively 1; deck reduction has \|PSL₂(F₇)\|=168 | Pass; cusped and compact maps distinct |
| 1.2 coordinate branch | p=7,101; p=5 control | y₇=1.725082>1; (1−b₁₀₁)101²/π²≈1.000646; radicand at 5≈−0.381966 | Pass |
| 1.2 determinant | U_p and L_p | c²−b(b−1)=1; conjugation/inversion gives det L_p=1 | Pass |
| 1.2 lifted orders | p=7 and 11 | S²=U_p^p=(SU_p)³=−I to floating precision; projective values=1 | Pass |
| 1.2 fixed point | z=iy, y²=b/(1−b) | (b−1)z²=b; Möbius numerator equals z times denominator | Pass |
| 1.2 integer powers | a=0,1,−1 | RHS gives I,U_p,2cI−U_p=U_p⁻¹ respectively | Pass; includes negative powers |
| 1.2 marked transport | Change by A∈PSL₂(R) | tr(AU_pA⁻¹)=2c and displacement unchanged; orientation reversal changes marking | Pass |
| 1.3 integral witness, first residue | p=7 | M=(8,21;35,92); det=736−735=1, trace=100=2·49+2, M mod 7=I | Pass; R04 computed Check |
| 1.3 integral witness, second residue | p=11 | M=(23,33;154,221); det=5083−5082=1, trace=244=2·121+2 | Pass; R04 computed Check |
| 1.3 compact survival/asymptotic | p=101,1009 | compact trace/p²=0.679810,0.683877 versus 27/(4π²)=0.683918; trace magnitude>2 | Pass; word identities recomputed |
| 1.4 cusped lower bound | p=7 | min hyperbolic \|trace\|=47; length=2 arcosh(47/2)≈7.6994; half-length≈3.8497 versus 2log7≈3.8918 | Pass |
| 1.4 rejected old witness | U(7)L(−7) | Matrix=(−48,7;−7,1), trace −47; each factor maps projectively to 1 after filling, so compact image=1 | Pass; cannot supply surviving upper bound |
| 1.5 separation/embedded balls | p=7 | centres iy and i/y have distance 2log(1.725082)≈1.09055; radius log y≈0.54527, exactly half | Pass; asymptotic is 2log p+O(1) |
| 1.6 comparison | r=1, R=3 | tanh²(1/2)=0.213552≤h_X/h_Y≤1; coth(1.5)=1.10479 | Pass |
| 1.7 repeated visits | L≤4log p+C; visit cost ≥(log p)/2 | number≤8+o(1); accumulated error O(p^(−1/4)log p)→0, not a one-visit assertion | Pass |
| 1.8 q-disc | p=101,y=1/2 | exp(−π/101)=0.9693739; log(101/π)+log2=4.163538 | Pass; repaired Check |
| 1.8 Hecke enlargement | m=4 | height can decrease by factor 4; log-height radius increases by log4≈1.38629 | Pass |
| 2.1 entrywise height | All-ones 2×2 matrix J; M=(2,1;1,1) | h(J)=1 versus Frobenius norm 2; h(J²)=2=2h(J)²; h(M⁻¹)=h(M)=2 | Pass; native norm reused |
| 2.2 small elliptic displacement | M=(2,1;1,1) | sum squares=7; cosh d(i,Mi)=7/2; h(M)=2≤√7 | Pass |
| 2.3 cusp representative ambiguity | Right multiply by U_p^k | U_p^k fixes iy_p, hence M U_p^k·iy_p=M·iy_p; right coset, not arbitrary left coset | Pass |
| 2.4 double coset bound | γ∈H | Representative I has height 1 and displacement 0; both outer H factors leave the specified cusp fixed | Pass |
| 2.5 divisibility-to-zero exponent | δ=0.1 versus 0.2 | 8δ=0.8<1 versus 1.6>1; p^(8δ)/p tends to 0 versus infinity | Pass; δ<1/8 retained |
| 2.6 lens | (D,R)=(3,2),(10,1),(1,5) | actual transverse radii 2.686084,1.657454,5.566211 ≤ bounds 2.688536,1.657454,5.693136 | Pass |
| 2.6 large-R normalization | R→∞ | 2artanh√tanh(R/2)=R+log2+o(1), not 2R | Pass |
| 2.7 cusp overlap | x itself a cusp, δ<1/2 | Other centres are ≥2log p−O(1) away, radius=(1+2δ)log p; count=1 for large p≤Cp^(24δ) | Pass |
| 3.1 rank/determinant reconstruction | A projective solution line over F₅ | At most 2 singular points among 6; ≥4 invertible solutions. Unique invertible solution therefore forces kernel dimension 1/rank 3 | Pass |
| 3.1 determinant sign | Q and −Q; reflection diag(1,−1) | det(−Q)=det Q; reflection determinant=−1, unaffected by scalar sign | Pass; signed locus necessary |
| 3.2 positive centralizer | Gaussian and Eisenstein norm-one equations | a²+b²=1 gives 4 units; a²−ab+b²=1 gives 6 | Pass |
| 3.2 wrong normalizer | diag(1,−1) conjugating Gaussian i | Sends i to −i, determinant −1; positive-determinant hypothesis excludes it | Pass |
| 3.3 Heegner repulsion exception | Gaussian endomorphism 1+i | degree=1²+1²=2, so pair lies on T₂ | Pass; CM− not silently included |
| 3.4 conjugate locus and tangent | m=1, graph w=bar z | Real tangent span (1,1),(i,−i); i(1,1)=(i,i) is not in it | Pass; totally real, not a complex divisor |
| 3.4 involution and intersections | Apply c₂ twice; intersect ordinary diagonal | c₂²=id; z=bar z gives real line, dimension 1 real, not divisor intersection | Pass |
| 3.4 relative tube normalization | r=0.1, R=log101 | sinh r/sinh R≈0.00198369; multiplied by 101≈0.200353 | Pass; reciprocal would grow |
| 3.5 ordinary Hecke avoids CM− | E=C/Z[i], nonzero complex-linear f | f∘i=i∘f; opposite sign would force 2i f[p]=0, impossible for p>3 and invertible f[p] | Pass; repaired lift convention used |
| 3.6 signed bicusp example | p=13,a=5 | a²=25≡−1; v/u≡−1 forces u+v=13 at minimum, uv≥12=p−1 | Pass; bounded-degree unsigned locus fails |
| 3.6 three-centre strengthening | Three distinct nearby bicusps | Each coordinate has ≥2 distinct cusp centres; distance to any cusp ≥ρ−R_*−O(1), by choosing a different centre | Pass; repeated first/second coordinate cannot evade cusp complement |
| 4.1 graph-tube definition | Both matched distances=3R/2 | Product midpoint distance=3R/4<R in each slot | Pass |
| 4.1 graph intersections | g=h and g≠h | Same graph has dimension 2; distinct graphs project to Fix(h⁻¹g), finite for nonidentity effective deck map | Pass; containment distinguished |
| 4.1 small-Hecke projection condition | Curve with projection T₁ | Generic degree positive, but projection is Hecke; expressly excluded in §5.8 | Pass |
| 4.2 logarithmic centralizer count | Matrix (2,1;1,1) | Eigenvalue (3+√5)/2≈2.618034, log≈0.962424; powers of height≤p^A have \|n\|≤(Alog p+log2)/0.962424 | Pass |
| 4.2 unipotent control | U(1)^n | Height=max(1,\|n\|), so height≤p^A allows ≍p^A powers, not O(log p) | Pass; unipotent case excluded |
| 4.3 overlap signed branch | Reconstruction Q=diag(1,−1) | det Q=−1; image is conjugate diagonal, ordinary determinant cannot be made positive by −Q | Pass; source needs signed correction |
| 4.4 exact rotation | p=7,d=1,k=1 | sinh(D/2)=sinh1·sin(π/7)=0.509901; D=0.980099 | Pass |
| 4.4 count, identity and d=0 | p=7,d=1,R=1/2; d=0,R>0 | First count=3 (k=0,1,6); at centre all 7 rotations have D=0 | Pass; raw division at d=0 avoided |
| 4.4 growing radius | R=10 | sinh10≈11013.233 versus linear approximation 10; ratio≈1101.323 | Pass in theorem; Check repair R04 |
| 5.1 weighted degree adapter | Diagonal g_X=3, q=3 parametrization | Base degree 8/volume16π; pushforward degree24/volume48π | Pass |
| 5.1 local multiplicity | Node xy=0, weight 2 | Two branches each mult1; weighted total=4, not 1 or 2 | Pass |
| 5.1 constant coordinate | Curve t↦(x₀,t) | Constant coordinate contributes 0; other contributes (2g_X−2)deg(t) | Pass |
| 5.2 Heegner decay exponents | δ₂=0.01,δ₁=0.001 | p^(−2δ₂)=p^−0.02; p^(3δ₁−1)=p^−0.997 | Pass; both decay |
| 5.2 Hecke-degree summation | m<4 | ψ(1)+ψ(2)+ψ(3)=1+3+4=8<4³=64 | Pass |
| 5.3 anti-Heegner decay | p=101,1009; ε=0.1 | p sinh ε/sinh(log p)=0.200353,0.200334 | Pass; correct reciprocal |
| 5.4 p-weighted bicusps | δ₃=.01,δ₁=.001 | exponent before weighting=−1−2δ₃+3δ₁=−1.017; after ×p=−.017 | Pass; parameters chosen independently before p |
| 5.4 overlap factor | k overlapping balls at a point | Sum of indicators=k, union indicator=1; require p^(O(δ₃)) bound, not equality | Pass; repaired proof keeps factor |
| 5.5 cusped density pullback | q=t^e, e=1,2 | Numerator e² and (log\|q\|)²=e²(log\|t\|)² cancel; pulled density identical | Pass |
| 5.5 zero atom/integrability | ε=.01 and 10^−6 | mass=2π/(−log ε)=1.364376 and .454792→0 | Pass |
| 5.5 constant cusp coordinate | q≡0 | Assigned projection measure=0; formal 0/0 expression is not evaluated | Pass |
| 5.6 total-volume error | p=7,11,101 | g=3,26,40376; cusp counts=24,60,5100; ratio=p/(p−6)=7,11/5,101/95 | Pass; denominator positive under p>5 |
| 5.7 Hecke metric transport | z↦az, a>0 | \|a dz\|²/(a Im z)²=\|dz\|²/(Im z)²; compact metric comparison still needs cusp complement | Pass |
| 5.8 non-Hecke condition | General curve in T₁×T₁ | multiplicity/degree=3p/(p−6)=21 at 7,303/95 at101, limit3 | Negative control correctly excluded |
| 5.8 ordinary overlap term | Fixed δ=.01 | log p·p^−.01→0; no uniform δ depending on curve is chosen | Pass |
| 6.1 symmetric quotient | n=1,2; distinct and repeated points | Sym¹Z=Z; ordered fibre sizes at n=2 are 2 and 1; cycle 2[z] still has length2 | Pass; weights not orbit cardinality |
| 6.1 singularity | Swap two smooth surface factors | Normal direction dimension2, action (u,v)↦(−u,−v); invariant relation ac=b², singular at0 | Pass |
| 6.1 invariant morphisms/functoriality | Identity and two successive maps | Sym(id)({x,y})={x,y}; Sym(g)Sym(f)={g(fx),g(fy)}=Sym(gf) | Pass; no second multiset definition |
| 6.1 base change/relative cycle | Flat length-two family specializing to doubled point | Generic fibre [z₁]+[z₂], special fibre 2[z]; length remains2 | Pass; gap retained |
| 6.2 image normalization | Degree-two cover B→P¹ | gon(P¹)=1≤gon(B); factor degree2 retained, not mistaken for birationality | Pass |
| 6.2 birational model control | Nodal cubic normalization | Normalization=P¹ of genus0, although arithmetic genus of cubic=1 | Pass; normalization genus used |
| 6.3 pencil cycle map | Degree2 pencil with simple ramification | Generic cycle [f(b₁)]+[f(b₂)]; branch fibre2[f(b)] | Pass |
| 6.3 generic injectivity | f birational onto image, disjoint fibres t≠t′ | Nonempty generic supports cannot coincide; degree of cycle-map image parametrization=1 | Pass; nonempty n≥1 essential |
| 6.3 wrong constant map | f constant | Every cycle=n[f(b₀)], degree to image=0 | Excluded by reduction hypotheses |
| 6.4 wreath group | n=1 and2, p=7 | \|G\|=336; \|G²⋊S₂\|=2·336²=225792; permutation factor at n=1 has order1 | Pass |
| 6.4 stabilizer and component | Generic free W-torsor split into r components | Each fibre partitions into r sets of \|H\| points; r\|H\|=\|W\|, degree α=\|H\| | Pass; H need not equal W |
| 6.4 quotient and normalization | Local cyclic branch t=s^e | Invariants k[[s]]^C_e=k[[s^e]]=k[[t]]; e=2 gives ramification2, not étale | Pass; local normalization retained |
| 6.4 choice/base change | Component moved by w | Stabilizer changes from H to wHw⁻¹; cardinalities and degree remain \|H\| | Pass |
| 6.5 weighted projections | n=2,3; total D | Each slot appears n−1 times: sum pair-degrees=D,2D respectively | Pass |
| 6.5 constant pair | C=(x₀,f(t),x₁) | Pair contributions have degrees d,d,0; total2d=(3−1)d | Pass; image weights essential |
| 7.1 wreath ramification support | n=2, transposition with (g,g⁻¹) | Fixed equations x₁=gx₂,x₂=g⁻¹x₁; fixed locus is the corresponding graph | Pass; not just coordinate inertia |
| 7.2 cyclic local index | n=2, two order-p slots | lcm(p,p)=p; bound6·2!·p=12p, not p² | Pass |
| 7.2 mixed slots and permutation | n=3, orders2,3,p | After n! power, order divides lcm(2,3,p)=6p; full order divides36p | Pass |
| 7.2 noncyclic control | Abstract group C_p×C_p | Cardinality p², every element order p; curve inertia is cyclic, so group cardinality cannot substitute for local index | Pass |
| 7.3 ramification charging | Local e=2,3,p | e−1=1,2,p−1≤2,3,p; finite minimum of decay exponents remains positive | Pass |
| 7.4 upper Hurwitz identity | z↦z² on P¹ | −2=2(−2)+2; dropping −2deg α gives only a weaker upper bound | Pass |
| 7.4 lower bound | n=2, D=20, a coordinate degree d=3,K=4 | D≤2n dK=48; 2g−2≥dK=12≥D/(2n)=5 | Pass |
| 7.4 contradiction | ε=1/(4n), D>0 | Lower D/(2n) is twice upper allowance D/(4n); cannot both hold | Pass; D=0 excluded by nonconstant projection |
| 7.5 uniform N | N=1,2,3 | Positive pencil degrees n<N are ∅,{1},{1,2}; maximum of finitely many thresholds suffices | Pass |
| 8.1 spectral/gonality constant | Effective index D | Area=πD/3; (21/100)(πD/3)/(8π)=7D/800 | Pass; R01 locator |
| 8.1 empty small spectrum | λ′=1/4 | 1/4≥21/100; resulting D/96≥7D/800 | Pass; no nonexistent eigenfunction chosen |
| 8.2 subgroup lower bound | p=2,3,5,7 | \|SL₂\|=6,24,120,336; U(1) has respective orders2,3,5,7; no S_d with d<p has element of orderp | Pass; all primes retained |
| 8.2 small nonabelian examples | SL₂(F₂)=S₃; SL₂(F₃) | A₃ has index2; quaternion subgroup Q₈ has index3 | Pass; no exceptional small-prime omission |
| 8.3 full projective then linear image | N=2,p=229 | 7p/800=1603/800>2; any proper projective image forces gonality≥that value, contradicting gonality<2 | Pass |
| 8.3 central-lift control | Surjection H→PSL₂, H proper in SL₂ | Index would be2; perfectness forbids a quotient C₂ | Pass for p>3 |
| 8.4 self-twist kernel | γ∈ker ρ | A=χ(γ)A and A invertible imply χ(γ)=1; factored character of perfect SL₂ has image order1 | Pass; no χ² assumption needed |
| 8.4 nonsurjective countercontrol | p=5, D=diag(2,3), A=(0,1;1,0) | AD=(0,3;2,0)=−DA; nontrivial twist exists on this cyclic subgroup | Pass; surjectivity matters |
| 9.1 actual-to-projective constructor | Ψ=aI, a≠0 | Projective class=identity, determinant=a² square, image⊂H₁ | Pass; duplicate Checks R04 |
| 9.1 basis independence | Replace actual basis by B | Quotient expression ΨBB⁻¹=Ψ | Pass |
| 9.1 determinant component | p=7, Ψ=diag(1,3) | Multiplier3 nonsquare; other component selected | Pass; R04 replacement |
| 9.1 nonconstancy/extension | Legendre family over punctured P¹ | j(t) has a pole at0 and is not constant; proper extension fills finitely many missing points, not a good-reduction assertion | Pass |
| 9.1 projective data insufficient | Nontrivial quadratic twist, oddp | Sign cocycle becomes identity in PGL, but ±I remain different on actual E[p] | Pass |
| 9.2 Hom lattice and degree | Non-CM E; h=2f | End E=Z; deg(2f)=4deg f; kernel contains E[2] of order4, not cyclic | Pass; rank-one generator primitive |
| 9.2 wrong CM model | E=C/Z[i] | End E=Z[i], rank2, degrees a²+b²; its j=1728 is constant | Correctly excluded by nonisotriviality |
| 9.3 prime-to-p lift | Cyclic quotient of degree m, p∤m | det f[p]=m≠0; f[p]=λΨ with λ∈F_p×, not a free unspecified projective map | Pass |
| 9.4 sign descent | p=5, σf=−f | Scalar equivariance implies 2f[p]=0; 2≠0 and f[p] invertible contradict this | Pass |
| 9.4 small-prime negative control | p=2, quadratic twist | −1=1 on E[2]; sign argument gives 0=0 and cannot descend f | Correctly excluded by eventual threshold |
| 9.5 uniform field/spreading | Coefficients t₁,…,t_s in huge k | Descent field Q(t₁,…,t_s) has finite transcendence degree s; bound M_N unchanged under either algebraically closed extension | Pass; no k→C assumption |
| 9.5 closed Hecke membership | Ideal I of fixed H_m | Pullback I becomes0 after faithfully flat field extension iff it was0; fixed integer m remains fixed | Pass |
| 9.6 native monodromy example | Legendre K=C(t), N=2,p=229 | gonality1<2,800N=1600<1603; U(2)^115=U(1) mod229, analogous lower transvection generates all SL₂ | Pass; actual curve objects present |
| 9.6 determinant and constant-family control | Constant E over alg. closed k | Galois image order1 versus \|SL₂(F₂₂₉)\|=12008760; nonconstant-j hypothesis fails | Pass; theorem not true for arbitrary elliptic data |
| 9.7 original-base extension | f and dual with degree n | f∨f=[n]=ff∨; kernel⊂E[n] of rank n², hence finite; generic degree of f remains n | Pass; smooth Dedekind base supplied |
| 9.8 native Frey–Mazur | W′=W, Ψ=id on actual p-torsion | Equivariance holds; identity isogeny has degree1 and pointed pullback | Pass; not a substitute for quantified headline |
| 9.8 equivariance implication | P killed by p, any σ | pσ(P)=σ(pP)=0, so admissible Q exists; requirement is ordinary eσ=σe | Pass; no vacuity |
| 9.8 threshold quantifiers | N=0 or1, then N=2 | Gonality≥1 makes first cases empty; N=2 includes rational function fields; ∃M is outside all k,K quantifiers | Pass; overall headline nonvacuous |
| 10.1 bounded genus | g<N, N=1,2 | gon≤g+1≤N<N+1; thresholds M₂,M₃ suffice for those bounds | Pass; enlarged threshold |
| 10.2 rational and elliptic | g=0,1 | Gonality=1,2; both <3 | Pass; uniform M₃ |
| 10.3 cyclic resolution | 1/3(1,1),1/3(1,2),1/7(1,6),1/2(1,1) | Negative continued fractions [3],[2,2],[2,2,2,2,2,2],[2]; self-intersections −3,−2 chains | Pass |
| 10.3 exceptional intersection matrix | Chain [2,2] | Matrix (−2,1;1,−2), determinant3; reversing off-diagonal sign would disagree with one transverse intersection | Pass |
| 10.3 known curve set | Boundary coordinate curve at p=7 | Normalization has g_X=3, not rational; exceptional chain components have genus0 | Pass; known does not mean all known are rational |
| 10.4 rational-curve classification | Curve contracted by resolution versus noncontracted | Contracted component has genus0; noncontracted image normalization birational to P¹, genus0, hence Hecke/boundary alternative applies | Pass; normalization genus, not arithmetic genus |
| 10.5 contraction update | C²=−2, C·E=1 or2 | New C²=−2+1=−1 or −2+4=2 | Pass |
| 10.5 termination/rational ancestry | Sequence of r contractions | Picard number drops by r; strict transform of a rational curve remains birational genus0 | Pass; finite termination uses nonnegative rank |
| Worked bicusp area split | Coordinate degrees d₁=1,d₂=2 | Total area=(1+2)A=3A; first projection alone has A, so it cannot bound the second without its own counting estimate | Pass; projectionwise argument essential |
| Worked shell bound | Example fixed A=3,B=3 | 2B=6>A+1=4; p^(1+Aδ)e^(−R_*)=O(p^(−3δ)); (log p)² absorbable in p^δ | Pass; B before δ before p |
| Worked overlap charging | N(z)=2 or3 | Sum indicators=2 or3; low region charged once by2, high region requires a signed thin tube | Pass; no disjointness assertion |
| Worked boundary label ratio | p=13,a=5 | Conjugate scaling gives a²=−1; smallest positive uv with v/u=−1 mod13 is12 | Pass; cyclic filter and polygon source/target domains checked |
| Worked point-ball upper estimate | Coordinate line, (r,R)=(1,3),(2,4) | V(r)/V(R)=.059892,.104994 ≤(1+r)e^(r−R)=.270671,.406006 | Pass |
| Worked Green identity | n=1,u=log\|z\|²,v=h(u) | N=1; normalized integral V/(4π)=e^s/(1−e^s)=h′(s); boundary flux of dᶜu=1 | Pass; factors match |
| Worked lower/coarea estimate | s_t=log tanh²(t/2) | h(s_t)=2log cosh(t/2), h′(s_t)=sinh²(t/2), ds_t/dt=2/sinh t | Pass; correct growth e^t |
| Worked plateau and nonincidence | Curve (a,z), a≠0, radius below \|a\| | V=0 and N=0 below first level; taking open-ball limits from below gives no fictitious centre atom | Pass |
| Worked false stronger monotonicity | Curve (z,z/2), q=1/4,3/4 | V/a=6/5 then14/13, strictly decreasing | Pass; constant and (1+r) factor retained |

The full §5.8 route was read beyond its numerical examples: the count is first bounded separately in each projection, integrated against that projection's area, enlarged with B independent of the initial count constant, and charged globally on the N≤2 region. On N≥3, signed three-bicusp reconstruction gives both cusp avoidance and proximity to a signed Hecke tube; the cusp count supplies the overlap factor. Choosing δ after B makes every exponent negative. The relative point-ball derivation uses the same positive current and boundary flux, handles logarithmic poles with vanishing v, and takes limits below plateau levels. Thus the two proof passages left only partially examined last round have been reviewed at the level of the written roadmap argument; their formal analytic construction remains supplier work under the explicit contracts.

## Not verifiable

- **BLR90:** settled `uncertified`, paywalled. The §1.2 Proposition 8, p.15 and §1.4 Proposition 2, p.19 locators were retained without pretending to read the book. It was not requested again. The corresponding roadmap and native descent interfaces were checked independently.
- **Fifteen board package heads:** the indexed `packages/<Name>/README.md` paths returned HTTP 404 at their supplied heads: ArithmeticLocallySymmetricSpacesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII, CrystallineCohomologyPartII, EndoscopicTransferAndUnitaryTraceComparisonPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PELModuliPartII, PadicHodgeTheoryPartII, PadicLocalLanglandsForGL2QpPartII, RealSurfacePeriodIndex, SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII, VStackSheavesAndLisseCategoriesPartII and VectorBundlesAndIsocrystalsPartII. Ownership against those inaccessible files was not checked. Open roadmap heads available through the prescribed roadmap service were searched; the board failures are not claims that these packages do not exist.
- **BTE image confirmation:** the supplied OCR extraction was read. An independent local PDF rendering was unavailable (`pdftoppm` and Python PDF renderers were absent). The clearly extracted reciprocal at BTE lines 129–131 was checked mathematically; ambiguous OCR fragments were not used to invent additional errata.

No new work needed fetching and no new missing-reference request was created. The four author source entries remain unchanged. The declared supplier gaps are future mathematical contracts, not unread texts or findings merely because they are unimplemented.

## Source issues

- **Error** in BT16 at Lemma 5 proof, printed p.718: the source says its trace-(2−p²) matrix supplies the filling-sensitive upper bound; it should be a witness surviving filling, since that matrix is a product of killed peripheral powers; affects the proof.
- **Misprint** in BT16 at §3.1, printed p.718: the source says the cusped radius is an infimum of geodesic lengths; it should be half that infimum, consistently with its compact convention and later estimates; affects nothing.
- **Gap** in BT16 at Corollary 8 proof, printed p.720: the source says a shortest loop has at most one deep cusp visit; it should count finitely many visits using the 4log p+O(1) length bound; affects the proof.
- **Error** in BT16 at Proposition 12(a) proof, printed p.724: the source says δ<1/4 makes a p-divisible O(p^(8δ)) integer vanish; it should require 8δ<1 for that inference, hence δ<1/8; affects the proof.
- **Error** in BT16 at Proposition 17, printed pp.727–728: the source says reconstruction always gives an ordinary small Hecke locus; it should include conjugate loci when the reconstructed determinant is negative; affects a stated result.
- **Error** in BT16 at Proposition 18(a) and Case 1, printed pp.729–730: the source says the rotation count has linear-R dependence; it should retain sinh R and an additive identity term when R grows with log p; affects a stated result.
- **Error** in BT16 at Proposition 27, printed p.737: the source says the multiplicity decay applies without restrictions on the two projections; it should exclude Hecke projection components, since T₁×T₁ gives limiting ratio 3; affects a stated result.
- **Gap** in BT16 at Proposition 27 proof, printed pp.739–740: the source says diagonal-tube growth controls point-ball shells and bicusp balls are disjoint outside small Hecke loci; it should supply point-ball growth and bounded-overlap charging, including conjugate loci; affects the proof.
- **Gap** in BT16 at Corollary 30, printed p.742: the source says the same gonality threshold covers every small genus bound; it should enlarge to M_(N+1) when using gonality≤g+1, including genera zero and one; affects the proof.
- **Error** in BT16 at §2.5, printed p.717: the source says cyclic degree-n Hecke projections have degree σ₁(n); it should use ψ(n), giving 6 rather than 7 for n=4; affects a stated result.
- **Misprint** in BT16 at §2.5, printed pp.716–717: the source says the displayed polygon coordinates use Z/n for both maps; it should use Z/(pn) for the source of φ_n and Z/p for ξ_d; affects nothing.
- **Misprint** in BTE at Proposition 4.1 proof, p.3: the source says the small-tube bound uses sinh(ρ/2)/sinh ε; it should use sinh ε/sinh(ρ/2), which decays like p⁻¹; affects the proof.
- **Gap** in BTE at Proposition 4.2 proof, p.4: the source says a sum of ball volumes is bounded by a tube volume without overlap cost; it should retain the cusp-count overlap factor p^(O(δ₃)); affects the proof.
- **Gap** in BTE at Proposition 4.2 proof, p.4: the source says ordinary small Hecke loci suffice in the bicusp partition; it should include conjugate loci and their sinh-normalized tube comparison; affects the proof.
- **Misprint** in BT16 at Proposition 18 proof, printed p.731: the source says the cusped metric is smaller than the compact metric; it should say the compact metric is smaller, as Proposition 7 and the ensuing inequality require; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b4a6f3d3ee5a78beff0150e16df67514f0584889", "job": "REV-PKG-GeometricFreyMazur~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
