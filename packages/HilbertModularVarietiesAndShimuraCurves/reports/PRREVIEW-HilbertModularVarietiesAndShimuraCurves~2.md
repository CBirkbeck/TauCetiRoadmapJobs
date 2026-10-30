# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at c3d1070)

**Verdict:** needs changes

## Status of the previous review's findings (r1 at 893083d)

| r1 | Status at c3d1070 | Evidence |
| --- | --- | --- |
| R01 (P1) construct basic PEL uniformisation before importing it | Repaired | New targets §§R18.5.12a–R18.5.12c (`README.md:2040–2100`) construct the integral auxiliary moduli, the polarized isogeny class (Hasse principle via BZ (6.8)–(6.11), KRZ Prop 7.1.11) and the morphism Θ with étaleness, surjectivity and Weil datum; §R18.5.13 (`README.md:2101`) now says "Consume the formal isomorphism of §R18.5.12c"; the PELModuli contract (`README.md:157`) now attributes the construction to this roadmap. One residual drift remains in §R18.5.21 (R01 below). |
| R02 (P1) obsolete `TopologicalCoefficientInput` supplier | Repaired | `TopologicalCoefficientInput` has 0 occurrences; Conventions (`README.md:76`), the ALS contract (`README.md:128`) and §R18.4.12 (`README.md:3500`) consume `LocallySymmetric.SheafDerived.isoSingular` with semi-local contractibility, closed semi-locally contractible Z, compact Hausdorff T for compact supports and the proper finite-fibre pushforward for traces. This matches ArithmeticLocallySymmetricSpaces at its head (`README.md:824–858`, `:758`). |
| R03 (P1) contradictory local splitting hypothesis | Repaired | §R18.5.15 (`README.md:2321`): "B split at exactly τ among the real places and division at the finite place v"; the discriminant-6, v=2 Check is retained. |
| R04 (P1) R18.3.8 ↔ R18.4.21 loop | Repaired | §R18.3.8 is stated with constant `F_l` coefficients and needs only §§R18.3.3, R18.3.6, R18.3.7; §R18.4.21 proves its definite injectivity clause from free orbits and coinduction and needs only Mathlib `Representation.coind`, §R18.4.8 and ALS.6.2. A DFS over all 439 `*Needs:*` edges of the 196 targets finds 0 cycles. |
| R05 (P2) re-planned derived-group comparison | Repaired | §H0.1 (`README.md:217`) now "Use the derived-group comparison of ShimuraData §5.4"; Scope (`README.md:46`) and the ShimuraData contract (`README.md:149`) name §5.4 as owner; ShimuraData §5.4 at its head states `G*^der=G^der=Res_{F/ℚ}SL₂` and `hilbertStarInclusion`. |
| R06 (P3) undeclared Lean names in API/Checks | Mostly repaired | The contrary naming rule is gone; `polarizationLattice`, `adjugateFrameAction_*` are gone and `readme-ids-missing=0`. Unbackticked Lean-flavoured residue remains (R03 below). |
| R07 (P3) add `sources.toml` | Not repaired; withdrawn | The brief's gate classes any non-roadmap file in the folder as `stray-files` (P3, "delete it; sources are the README's references"), so the r1 repair cannot be carried out; no roadmap in the repository carries a manifest. Not re-raised. |
| R08 (P3) Theorem 4.19 page | Repaired | §R18.4.29 (`README.md:4067`) cites "Theorem 4.17, p.28; Theorem 4.19, p.30"; MS19 line 1456 is on p.30. |

## R01 (P2) — §R18.5.21 attributes the p-level Rapoport–Zink uniformisation to PELModuli M2

**Location:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:2465`, proof route of §R18.5.21: "Use the basic Rapoport–Zink uniformisation of the auxiliary PEL family with p-level structures on the rigid generic fibre (PELModuli M2 contract)".

**Claim:** The all-level tower theorem is routed through a supplier theorem that the supplier does not state. PELModuli M2 is "Representability and smooth good models" (M2.1–M2.16 at its open head); the whole PELModuli README contains no Rapoport–Zink or basic uniformisation statement, and this roadmap's own PELModuli contract (`README.md:157`) only imports good-prime representability from M2. This is the same drift class as r1's R01, surviving in one proof route.

**Witness:** `grep -c 'Rapoport–Zink\|basic'` over PELModuli at its head returns 0; its M2 headings (`README.md:2174–2654` of that roadmap) are rigidity, neat levels, prorepresentability, formal smoothness at good primes, representability, universal family, Kodaira–Spencer, properness, displays and ordinariness. The in-roadmap construction §R18.5.12c is stated at the maximal distinguished level `K_{q₀}` only (`README.md:2042`), so no target supplies a PEL-side uniformisation with p-level structures either.

**Repair:** Delete the parenthetical and the PEL-side p-level clause. Route §R18.5.21 through §R18.5.20 (the identification of the v-part of H with the pullback of the universal special formal module, itself built on §§R18.5.12c, R18.5.13 and BC III Théorème (5.2)) and the finite torsion-level functors of §R18.5.4: the level-n covers on both sides are the torsors of level structures of the same p-divisible group, so no PEL-side uniformisation at p-level is needed. Tested on the discriminant-6 curve at v=2 with `Ǧ_n=1+Π^nO_D`: the maximal-level isomorphism of §R18.5.15 and the module identification of §R18.5.20 already determine `M_n` as `X[Π^n]`-trivialisations, and PELModuli M2 contributes nothing at this division prime (it has no good-prime hypothesis satisfied there).

## R02 (P3) — The closing scope note still places basic PEL uniformisation in §R18.5.13

**Location:** `README.md:4330`, "Scope of the comparison theorems": "Basic PEL uniformisation for the auxiliary datum is constructed in §R18.5.13 using the PELModuli moduli objects."

**Claim:** This contradicts the repaired text, which constructs it in §§R18.5.12a–R18.5.12c and has §R18.5.13 consume it (`README.md:157`, `:2101`, Summary at `:3`).

**Witness:** `README.md:2101`: "Consume the formal isomorphism of §R18.5.12c, whose deformation, polarized isogeny-class and Weil-descent prerequisites are constructed in §§R18.5.12a–R18.5.12c."

**Repair:** Replace by "constructed in §§R18.5.12a–R18.5.12c on the PELModuli M0–M1 carriers and consumed by §R18.5.13".

## R03 (P3) — Lean-flavoured residue and a garbled Check in the prose

**Location and claim:** seven passages read as leftovers of a Lean catalogue rather than mathematics:

- `README.md:857` (H3.5 Check): "At `M=0` the arbitrary-subgroup quotient is P itself; `P=⊥` is trivial even for `F=ℚ(√2)`": P is never defined and `⊥` is Lean's bottom subgroup. The intended fact is that for a subgroup P ≤ U the square-class quotient P/P² has order ≤ 2^g, trivial for P = 1, while Δ(0)=U⁺ is infinite for g ≥ 2.
- `README.md:802`, `:812` (H3.3): "the O-linear `automorphism[η]`" and "the `displayed[η]` isomorphism" are placeholder tokens; the mathematics is the automorphism [η] of A.
- `README.md:1952` (R18.5.9 Check): "is not a MulAction input" names a Mathlib class inside a Check; the rule is "a Check never names a Lean counterpart".
- `README.md:2970` (R18.3.15 API): "ActingFactor is defined under the explicit relation-kernel inclusion" names a declaration that exists nowhere (`Suggested.lean` is empty).
- `README.md:3043` (R18.3.18 API): "changeSign with identity/composition; reduction identified through the identity coefficient map", likewise.
- `README.md:3008` (R18.3.17 API): "For any commutative ring R, unit r and integers n,m, `r^(n+m) = r^n r^m`" is Mathlib's `zpow_add`, not an API fact of this roadmap.
- `README.md:3738` (R18.4.20 Check): "the selection uses finite-level Taylor–Wiles prime datum (§R18.4.20), finite-level Taylor–Wiles prime datum (§R18.4.20) and finite-level Taylor–Wiles prime datum (§R18.4.20)": the three distinct sub-targets (detecting class, prime selection, dimension count) were collapsed to one phrase three times.

**Witness:** `grep -n 'P=⊥\|automorphism\[η\]\|displayed\[η\]\|MulAction input\|ActingFactor\|changeSign' README.md` returns exactly these lines; `Suggested.lean` declares nothing (`Suggested.lean:50–52`).

**Repair:** Rewrite each in prose: name the subgroup P and state the bound; write "[η]"; replace "MulAction input" by "a group action (it fails the identity axiom)"; replace "ActingFactor"/"changeSign" by "the factorisation through the acting quotient"/"the sign change"; delete the exponent-law bullet; name the three sub-targets of §R18.4.20 (detecting class, prime selection, dimension count) once each.

## R04 (P3) — Four anchors into NeronModelsAndSemistableAbelianVarieties do not exist

**Location:** `README.md:108`, `:2380`, `:2394`, `:2432` link to `../NeronModelsAndSemistableAbelianVarieties/README.md#weighted-graph`, `#hecke-family`, `#semistable-torsion-datum`, `#semistable-jacobian-torsion`.

**Claim:** The objects exist in that roadmap, but as bold paragraphs inside §4.2 and §4.14, not as headings or `<a id>` anchors, so the fragments resolve to nothing; the fifth anchor `#layer-4-picard-schemes-of-semistable-curves-and-the-monodromy-pairing` is fine.

**Witness:** NeronModelsAndSemistableAbelianVarieties at its head: `README.md:2148` "**Weighted graphs and their discriminant groups.** Define `WeightedGraph V E`", `:2190` "**Hecke families and adjoint functoriality.** Define `HeckeFamily`", `:2691` "### 4.14 Semistable torsion with commuting coefficient actions", `:2792` "Define `TwoPlaceSemistableTorsionDatum`"; `grep -ic '<a id=' ` on that file returns 0.

**Repair:** Cite by section ("NeronModelsAndSemistableAbelianVarieties §4.2 (weighted graph, `HeckeFamily`)", "§4.14 (`SemistableTorsionDatum`, `TwoPlaceSemistableTorsionDatum`)") and drop the fragments, or link `#42-…`/`#414-…` heading anchors.

## R05 (P3) — Locator slips in four citations

- `README.md:2787` and `:3087` (R18.3.4, R18.3.20, R18.3.21): "[Tay06] Lemma 1.3 and its proof, pp.741–742". In the Documenta text (printed = file page + 728; footer "733" at Tay06 line 165) Lemma 1.3 starts at line 569 on p.740; Lemma 1.1/Corollary 1.2 (lines 392/404) are on p.738 as cited.
- `README.md:3955` (R18.3.29): "[Car86a] §§0.4–0.5, pp.409–410" and "§§0.10–0.11, pp.411–412". In the Numdam scan (footer "410 H. CARAYOL" at line 50, "412" at line 134) §0.5 begins at line 60 on p.411 and §0.11 at line 154 on p.413; Théorème (A) at line 86 is on p.411 as cited.
- `README.md:2073`, `:2092` (R18.5.12b–c): KRZ20 is cited as arXiv v1 with "pp.115–116", "p.120", "p.121". The only legal copy the sources service returns is v2 (`arXiv:2007.05211v2`, 16 May 2023), where Proposition 7.1.11 is on pp.117–118 (line 6009; page 118 begins at line 6021), Lemma 7.3.1 on p.122 (line 6251) and Proposition 7.3.2 on p.123 (line 6295). The numbering agrees. Either cite v2 pages or state that the pages are v1's.
- `README.md:3437` (R18.4.3): "[NT16] Proposition 3.7(3), p.32": in arXiv v1 the proposition begins at line 1412 on internal p.31 and its items run onto p.32.

**Repair:** Change the four page numbers (740; 409–411 and 411–413; v2 pages or a version note; pp.31–32).

## Verified sound

**Scope of the reading.** The whole 4,382-line README and the 53-line `Suggested.lean` were read at c3d1070; the 1,609-line change set was used only to locate the author's work. The outside-folder diff `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves'` is empty; `git status` is clean; the folder contains only `README.md`, `Suggested.lean`, `metadata.toml`.

**Gate and build.** Independent run of `tauceti-roadmap … gate … --base origin/main` at c3d1070: every scanner 0 and `build=0`, `OK` (identical to the worker's `scratch/gate.md`). `lake env lean …/Suggested.lean` exits 0 with no output in 2.6 s. The dependency check returns

```text
depcheck: 208 roadmaps, 1494 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line; the roadmap is at line 142 of `ORDER.txt`. Pins confirmed from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

**Principles.** No route-specific shortcut, no `set_option`, no sorry'd data, no computational algorithm, no copied passage in the checked passages, no pull-request number (`prnum=0`). The only re-planning candidate of r1 (derived-group comparison) is now imported. Chebotarev (open PR #1187, another author's new roadmap) and QuaternionicModularForms (open PR #934, another author's new roadmap) are the only suppliers outside main and the merge order, both permitted.

**Suggested.lean.** Single `import Mathlib`, module docstring naming the roadmap and each headline group with the missing carrier (relative HBAV moduli, canonical Shimura curves, special formal modules and the Drinfeld formal curve, auxiliary PEL moduli with framed polarized isogeny quotient and Weil datum, adelic quaternionic form modules, étale coefficient cohomology), namespace opened and closed, 0 declarations. Headline inventory from the README (Summary, `README.md:3`): Čerednik–Drinfeld uniformisation (§R18.5.15), Ihara's lemma with integral saturation (§§R18.4.32–R18.4.33), definite Ihara (§R18.3.8), paired torsion twists with local points (§§H6.2–H6.8); their stated foundations §§R18.5.7, R18.5.11, R18.5.12c, R18.4.29, R18.4.30, H6.5. None is statable at the pins: Mathlib has `QuaternionAlgebra`, `NumberField.FiniteAdeleRing`, `DoubleCoset.Quotient`, `HeckeCoset` and `Representation.coind`, but no adelic points of `D×` with Hecke operators at split places, no abelian schemes with real multiplication, no formal `O_D`-modules, no étale cohomology of a curve with coefficients; stating any headline would need a free `Prop` or a sorry'd carrier. With 0 declarations there are 0 signatures to `#check`, 0 one-tactic probes and 0 padding findings; this empty acceptance test is correct.

**Pinned declarations opened this round** (file at the pin, all present): Mathlib `Representation.coind` (`RepresentationTheory/Coinduced.lean:80`), `Rep.resCoindAdjunction` (same file), `groupCohomology.exists_div_of_norm_eq_one` and `H1ofAutOnUnitsUnique` (`GroupCohomology/Hilbert90.lean`), `Module.free_of_finite_type_torsion_free'` (`Algebra/Module/PID.lean`), `RingHom.ker_isMaximal_of_surjective` (`RingTheory/Ideal/Maps.lean`), `HeckeCoset`/`IsHeckeTriple` (`NumberTheory/HeckeRing/Defs.lean`), `DoubleCoset.eq` (`GroupTheory/DoubleCoset.lean:124`), `MvPolynomial.eval₂Hom`, `Matrix.adjugate_mul_distrib`, `Matrix.det_adjugate` (`LinearAlgebra/Matrix/Adjugate.lean`), `Submodule.mem_traceDual`, `FractionalIdeal.dual_eq_mul_inv`, `FractionalIdeal.dual_dual` (`RingTheory/DedekindDomain/Different.lean:385`), `NumberField.Units.instZLattice_unitLattice` and `dirichletUnitTheorem.unitLattice_span_eq_top` (`NumberTheory/NumberField/Units/DirichletTheorem.lean`); Tau Ceti `HeckeRing.GL2.degree_diagCoset_prime_pow`, `deg_heckeT` (`NumberTheory/HeckeRing/GL2/Degree.lean`), `TauCeti.exists_trace_mul_algebraMap_eq`, `exists_sum_trace_mul_smul_eq` (`RingTheory/DedekindDomain/Different/DualFamily.lean`), `LocalCoefficientSystem.constantFunctor` (`AlgebraicTopology/Singular/Twisted/Basic.lean`), `twistedCochainComplexCoefficientMap` (`AlgebraicTopology/Cohomology/Twisted/Basic.lean`), `NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm` (`NumberTheory/NumberField/NarrowClassGroup/CoprimeRepresentative.lean`), `NarrowClassGroup.instFinite` (`…/NarrowClassGroup/Finite.lean:38`), `symPowerRep` (`RepresentationTheory/SU2/SymmetricPower.lean`), `SU2.existsUnique_nonempty_equiv_symPower` (`RepresentationTheory/SU2/Exhaustion.lean`), `QuaternionAlgebra.normForm_coe` (`Algebra/Quaternion/NormForm.lean`), `totallyPositiveIntegerUnits`, `units_sq_index_eq`, `card_elementaryTwoQuotient_units`, `unitsMulEquivTorsionProdMultiplicative`.

**Cross-roadmap citations resolved at the heads named in the brief** (41 supplier READMEs dumped with `roadmaps show`; 160 section/name citations checked, all present unless listed in R04): PELModuli M0.5, M0.9, M0.12, M0.18, M1.2, M1.7, M1.9, M1.11, M2.8–M2.9, M3.2, M3.4, M3.6, M4, M5.4; ShimuraData §§5.3–5.4 (with `G*^der=G^der=Res SL₂` and `hilbertStarInclusion`); ShimuraVarieties §§P.1–P.3, 4.1, 4.9, 8.1–8.5, 8.6–8.7, 8.9–8.15, 8.18 (`CanonicalModel.minimal_defined_over_reflex`, `README.md:2622` of that roadmap), 8.21–8.22; ArithmeticLocallySymmetricSpaces ALS.1.1, 1.2, 1.4 (`RΓ.isoSingular`), 2.4, 3.5–3.8, 4.10, 5a.2–5a.4, 5b.1, 5b.4 (`FrankeInput`), 6.2, F.3 (`SheafDerived.isoSingular`), F.5–F.7; AutomorphicSpectralTheory §§4.5, 4.7, 5.10, 5.12, 5.14 (`franke_input` with split centre, balanced character, full K∞), Layer 6; WeightsInEtaleCohomology R34.1–R34.3 (§3.6 and §3.10 with `N_HK = e_V N_p`), R34.6 (§6.5 "Hilbert eigensummands and local monodromy weights": g>1, Carayol's hypothesis for even g, rank-two multiplicity, coefficient descent, compatibility at p); AbelianSchemesAndArithmeticModuli A1.3a (`relativeSerreTensor-functoriality`, `-base-change`), A4.7a (`relativeSerreTensor-lie-tate`), A2, A3.9, A4.CR.7.2, A6.25, A6.30–A6.32; AlgebraicModuliForArithmeticGeometry §§1.3, 1.4, 3.5, 4.5 (`torsorTwistSpace`), 5.1–5.4; NeronModelsAndSemistableAbelianVarieties §3.14, Layer 4, §4.2, §4.14 (`TwoPlaceSemistableTorsionDatum`, `TwoPlaceSemistableTorsionLaws`, `SemistableTorsionFrobeniusLaws`), §§5.0a–5.0c; GL2AutomorphicRepresentationsAndTransfer R16.2.13, R16.4.5, R16.6.3, R17.1.1–R17.1.5 (`RamifiedExactlyAt`), R17.3.1–R17.3.9; AutomorphicFormsOnReductiveGroups §§0.5, 5.8, 7.3 (`galoisAnemicEigenSystem`, anchors present); QuaternionicModularForms §§0.1–0.3, 1.3, 2.1–2.2, 3.1; DeformationAndDerivedPatchingAlgebra §3.3 "Finite actions and flat fibres"; CrystallineCohomology CR.7.3; SchemeAndStackFoundations §§1.19–1.23; GlobalQuadraticForms §§5.5, 6.1; AdelicAlgebraicGroups §§3.4, 4.1–4.5, AA.4.2 and AA.4.4 (marked anchors present); LefschetzPencilsAndVanishingCycles §§7a.1–7a.2; SelmerIwasawaCohomology §§2A.1–2A.5; GlobalGaloisDeformations §§3.3–3.7; LocalGaloisDeformationRings §§0.2, 1.1, 1.15–1.16, 3.1–3.9; ModularCurvesPartII §§3.1, 3.14, 8.1, 14.1–14.4a; AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2; DeligneWeightsAndPurity §§1.4, 4.3, 7.12; IntegralHeckeAndGaloisDeterminants §§1.2, 1.7, 3a.1, 4.1; SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4, SR.2.2–SR.2.3, SR.3.3–SR.3.4; ArithmeticGaloisDuality D7.4, R02.4.4; ArithmeticGaloisRepresentations §§1.2, 1.6, 1.9, 1.12, 2.4; ReductiveGroupsPartII RG2.0, RG2.0a, RG2.2, RG2.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2.21, R07.3.0–R07.3.3, R07.4.13, R07.4.20–R07.4.24, R07.4.27–R07.4.28, R07.6.8; EtaleCohomologyFoundations F.0–F.4; ClassicalAdicEtaleCohomology §§1.1–1.5, 9.2–9.7, 11.1; ComplexComparisonPartII C6.1, C6.3–C6.6; AdicSpacesPartIII F0.7–F0.8, R2.2–R2.6, R2.10; StableReduction Layers 0, 1, 4, 5, 6; Chebotarev Layer 10; ClassFieldTheory Layers 12–13; QuadraticFormInvariants Layers 2 and 6; JacobianChallenge Layer A; AlgebraicTopology Stage 6; ModularCurves 3B, 3D, Layer 8. The two inline Stacks tags were read: 0CCJ (effective descent for quasi-projective V along a surjective finite locally free X→Y) and 07S7 (free action of a finite locally free group scheme on a quasi-projective scheme gives a scheme quotient and an fppf torsor), as used in §§H2.2a and H3.6.

**Ownership.** The r1 ownership comparisons were re-resolved at the same heads (ShimuraData §5.4, PELModuli M2/M4, ASAM A1.3a/A4.7a, QuaternionicModularForms §§0.3/2.1–2.2/3.1, ALS.F.3, AST §5.14, WIEC R34.3/R34.6, DDPA §3.3, HilbertModularVarietiesAndShimuraCurvesPartII as consumer). The new owned objects (§§R18.5.12a–R18.5.12c basic uniformisation of the auxiliary quaternionic PEL datum) have no owner on main, in the board packages or in the sibling checkouts (searched with `roadmaps grep` for "Rapoport–Zink", "basic uniformi", "Boutot–Zink", "special formal"): only HilbertModularVarietiesAndShimuraCurvesPartII mentions them, as a consumer. No `Suggested.lean` name collision is possible (0 declarations).

**Source sample (15 targets in the brief's type order, chosen to cover the repaired text).** Texts are the sources-cache extractions; page maps were computed from the `=== page N ===` markers and printed footers.

| # | Type | Target | Text, locator, outcome |
| --- | --- | --- | --- |
| S01 | Definition | H2.1 | DP94 (`bc795da7`) §3.2 at line 349 (p.68), §4.1 at lines 444–453 (pp.70–71): closed subscheme of the Grassmannian of self-orthogonal O⊗𝒪-submodules; base change and products as stated. Matches. |
| S02 | Definition | R18.5.4 | BC91 (`2a9aa0b0`, printed = PDF page − 5) Part II (5.16) line 3428 (p.97), Définition (8.1) line 3773 (p.107), Théorèmes (8.2)/8.4 lines 3785/3807 (pp.107–108); BZ22 (`89efb1ef`) §5 pp.38–39. Special strict modules, framings and heights as stated; BC's inverse framing arrow is noted in the README. Matches. |
| S03 | Theorem | H2.3 | DP94 Théorème 2.2 line 226 (p.64: smooth over ℤ[1/nΔ], flat relative complete intersection over ℤ[1/n], non-smooth locus of codimension 2 at p|Δ), Corollaire 2.3 line 231 (p.64–65, normal fibres), Théorème 3.3 line 355 (p.68), Proposition 4.4 line 495 (p.72), §4.5 line 498 (p.73). Matches, including the N equations in 2N variables chart (lines 487–490). |
| S04 | Construction | R18.4.29 | MS19 (`3ae8ca92`) Definition 4.1 line 920 (p.19: weak patching system = uniformly bounded S∞-ranks, residual = ϖM_n=0 eventually), Props 4.2–4.6 lines 960–988 (p.20), Lemma 4.7 line 1004 (p.21), Thm 4.17 line 1385 (p.28), Thm 4.19 line 1456 (p.30), Props 4.20–4.21 lines 1478–1486 (p.30). Matches; R08 repaired. |
| S05 | Theorem | R18.5.15 | BZ22 Theorem 6.7 line 2559 (p.49): `Ď×\((Ω̂²×Spf O_Ě)×D×(A_f)/K) ≅ Sh∧`, descent `id×|Π⁻¹×τ_c`; Corollary 6.8 line 2578 (pp.49–50) stable and semistable for small K^p. Matches; the README's hypotheses (split at τ among real places, division at v, levels (6.31)) are those of the theorem. |
| S06 | Comparison | R18.5.13 | BZ22 Proposition 6.2 line 2247 (p.43), Theorem 6.3 line 2287 (pp.43–44), (6.31) line 2423 (p.46), Definition 6.5 line 2437 (p.47), Proposition 6.6 line 2452 (p.47) with (6.34) `0→F×→Ď××K×→I→0` at line 2459 and exactness on ℚ-points "by Hilbert 90" at line 2460, Theorem 6.7 proof line 2602. The README's central sequence, kernel and route match. |
| S07 | Construction | H6.2 | Tay02 (`e00ebd58`, internal = file page − 1) p.13 lines 422–435: fine moduli of quintuples `(A,i,j,m_λ,m_℘)` carrying the fixed alternating forms to the j(1)-Weil pairings; fineness from torsion-freeness of `ker(GL₂(O_{M,λ})→GL₂(O_M/λ))`; smooth and geometrically connected. Matches. |
| S08 | Theorem | R18.4.32 | MS19 Theorem 6.5 line 1700 (p.34): conditions (1) l | #ρ̄_m(G_F), (2) the l=5 PGL₂(F₅) clause with "automatic if √5∉F"; Remarks 6.6–6.7 lines 1708/1714 (p.34); proof pp.38 (Props 6.11–6.12 lines 1910/1923). Matches, including the auxiliary prime via Lemma 6.9 line 1761 (p.35). |
| S09 | Theorem | R18.3.8 | MS19 Theorem 6.8 line 1724 (pp.34–35): D totally definite unramified at p, H unramified at p, m non-Eisenstein, `π₁*+π₂*` injective; proof via `H^pSL₂(F_p)`-invariance and strong approximation for the norm-one group. Matches; the README corrects the norm quotient to `F_+^×` (source issue below). |
| S10 | Construction | R18.4.19 | MS19 Remark 3.4 line 729 (p.15), Props 3.5–3.7 lines 736–772 (pp.15–16), §3.6 line 831 (p.17) with the choice of `L_K` making every K-fixed type semistable (lines 849–856); Kis08 (`3e70d1f7`, printed = file page + 512) Theorem (2.7.6) line 1082 (p.534), Corollary (2.6.2) line 961 (p.532), (3.3.3)–(3.3.4) lines 1380–1391 (p.540), Theorem (4.3) line 1511 (p.543). Matches; the dimension count `4+[F_v:ℚ_l]` and the one-dimensional twist factor are as stated. |
| S11 | Comparison | R18.4.12 | ArithmeticLocallySymmetricSpaces at its head, `README.md:824–858` (ALS.F.3 arbitrary-stalk comparison with the exact hypotheses the README repeats) and `:1935` (ALS.1.4); Mil LEC (`ac4f122f`) Theorem 21.1 line 5007 (p.130). Matches; R02 repaired. |
| S12 | Construction | R18.5.12c | BZ22 (6.14)–(6.15) lines 2250–2271 (p.43): Θ• from the deformation argument of [RZ 6.23], surjectivity from the Hasse principle "[KRZ, Prop. 7.1.11, Prop. 7.3.2]", Weil datum by postcomposing ρ_i with the relative Frobenius; KRZ20 v2 (`c94c6cbd`) Proposition 7.1.11 line 6009, Lemma 7.3.1 line 6251, Proposition 7.3.2 line 6295. The new target restates exactly these three steps; page slip recorded in R05. |
| S13 | Application | H4.19 | BHW23 (`d59b7f70`, printed = file page + 1707) Lemma 8.20 line 2559 (p.1775): claims `Δ_n(N)↪Δ(N)` injective and `Δ_∞=Δ_n` for n≫0. Recomputed counterexample (i): F=ℚ(√2), ε=1+√2, p=3, N=4: ε mod 4 has order 4 so U_4=⟨ε⁴⟩ and Δ(4)=⟨ε²⟩/⟨ε⁸⟩≅ℤ/4; −ε⁴≡1 mod 3 so U_3=⟨−ε⁴⟩, A₁=U_3∩U⁺=⟨ε⁸⟩; ε mod 12 has order 8 so U_12=⟨ε⁸⟩, B₁²=⟨ε¹⁶⟩, Δ₁(4)≅ℤ/2 generated by ε⁸, which maps to 0 in Δ(4). Injectivity fails; the README's correction (stable images) stands. (ii) p=2, N=5: orders of ε mod 2ⁿ are 2ⁿ (n≥2), mod 5 is 12, so Δ_n(5)=⟨ε^{2ⁿ}⟩/⟨ε^{6·2ⁿ}⟩≅ℤ/6 with transition ×2; inverse limit ℤ/3, stable images of order 3. |
| S14 | Theorem | R18.4.30 | MS19 Lemma 5.1 line 1568 (p.31), Lemma 5.2 line 1591 (p.32: A=𝔽[[X,Y]]/(X²Y), M flat, XL=0, XYN=0 ⇒ N=M/XYM flat over A/(XY) and N/XN≅L), Lemma 5.3 line 1622 (pp.32–33: B=𝔽[[X,Y]]/(XY), N flat over B/(Y), filtration N, L⊕L, N). The README's two transfer targets restate these hypotheses verbatim in its own words, with no domain assumption added. Recomputed the thickening instance A, M=A, L=(XY): ann_A(X)=(XY), N=A/(XY), N/XN=k[[Y]]≅(XY) via 1↦XY. Matches. |
| S15 | Theorem | H6.5 | Tay02 Lemma 1.1 line 250 (p.9), Lemma 1.2 line 335 (p.10; proof pp.10–12 with the Kummer class `H¹(G_v,k(ε))` and the `H²=0` duality step at line 405), Lemma 1.3 line 407 (p.12, "much easier, left to the reader"), Lemma 1.4 line 416 (p.13); Rap78 (`dfeb77d0`) §2.9 lines 677–706 (pp.273–274). The README's (O1)–(O4) and the (C6) narrow-class correction are as stated. |

Additional locators checked this round: BHW23 Notation 5.1 (p.1740), Definition 5.2 (p.1741), Definition 5.6 (p.1743), Lemma 8.5 (p.1766), Lemma 8.9 (p.1769), Lemma 8.10 (p.1770), Corollary 8.11 and Lemma 8.12 (p.1771), Definition 8.17, Proposition 8.18, Lemma 8.19 (p.1773), Lemma 8.22 (p.1776); YZ18 (`29dfd5f1`, printed = file page + 532) Proposition 3.1 (p.551), Proposition 4.1 (p.562), Propositions 4.2 and 4.4 (p.563), Theorem 4.5 (p.564), Corollary 4.6 (p.566), Theorem 4.7 (p.567), Theorem 4.9 (p.568), Theorem 4.10 (p.569), Propositions 5.1–5.4 and Corollary 5.5 (pp.573–576); KW09 (`53f45f8b`) Eisenstein definition and display (5) (p.59), Lemma 7.1 (p.60), Lemma 7.2 (pp.60–61), §7.2 displays (6)–(7) (p.61), Lemma 7.3 (p.62), §7.4 (p.63), Lemma 7.4 and display (8) (pp.64–65), Corollary 7.5 (pp.65–66), Proposition 7.6 (pp.66–67), Lemma 9.1 (p.80); DP94 §2.1 (p.64), §2.4 Stein factorisation (p.65), Proposition 2.7 (p.65), Corollaire 2.9 (p.66); AIP §3.1 (p.10: Rapoport open, Hasse invariant, Hodge ideal `(p, lift of Ha)`), Definition 3.1 (p.10), §5.2.4 (p.22); CDN20 (`15e4868f`) §1.2 (pp.12–13), Proposition 5.4 and Remarque 5.5 (p.43); BC91 Part III Théorème (5.2) (p.140), §5.3.1 very free action "distance > 2" and gluing of standard charts (pp.141–142), §5.3.2 (p.142), §5.4.3 (p.145), Théorème (5.5) (p.146); Sai09 (`fb5b69b7`) Theorem 0 (p.10), Lemma 3 (p.30), Lemma 4 (p.32), Claim 4 (p.35); Car86 (`22c01e57`, printed = file page + 149) Proposition 4.4.3 and §4.5.1 (p.188), §4.5.5 (p.189); Zha14 (`698eb8a6`) (3.14)–(3.17) (pp.208–209: two copies of the Shimura set, exchanged by Atkin–Lehner and Frobenius), §6.3 (p.228); ACC+23 (`c5429e4f`) Lemma 7.1.8 (p.1091), Lemma 7.2.2 (p.1098), §7.2.5 and Assumption 7.2.6 (p.1103); Del80 (`b06eea61`) Corollaires (3.3.4)–(3.3.6) (p.206); Tay06 (`6ec26bfc`) Lemma 1.1, Corollary 1.2 (p.738), Lemmas 1.6–1.7 (p.744), Lemma 2.2 (p.747); BR10 (`dc3aad1d`) §1.5 (p.5), Remark 9.6 (p.20), Theorem 18.1 and Proposition 18.2 (pp.44–45); Car86a (`d4a5fb6b`) Théorème (A) (p.411), §0.4 (p.410), §0.10 (p.412); Conrad (`7eac62b9`, Stanford copy) Theorems 7.2 and 7.5 (file pp.23, 25; MSRI pagination not checkable); EGS15 (`5bc8520f`) Lemma 4.1.1 (file p.17), §6.2; Mil LEC Theorem 24.1 and Remark 24.2 (pp.144–145); Tay89 (`499da39a`) Conjecture 1 and Theorem 2 (pp.265–266).

**Adversarial pass.** One row per statement actually recomputed this round (102 statements; the remaining targets were recomputed in r1 at 893083d and their text is unchanged except where listed).

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| H0.0 trace form and h | F=ℚ, e₁,e₂ | h(i)=[[0,1],[−1,0]] gives h(i)e₁=−e₂; ψ₀(e₁,e₂)=1; −ψ₀(e₁,h(i)e₁)=ψ₀(e₁,e₂)=1>0 | Consistent |
| H0.1 centres | real quadratic split fibre | dims 8=2·4 and 7=8−1; t₁²=t₂² gives t₂=±t₁, (1,−1) off the diagonal | Consistent; R05 repaired |
| H0.3 lattice | c=2ℤ; c=O, F=ℚ(√2) | L_c=ℤ⊕½ℤ; second summand (2√2)⁻¹O≠O; diag(1,a⁻¹) sends c⁻¹d⁻¹ to (ac)⁻¹d⁻¹ | Consistent |
| H0.5 dual and stabiliser | general c | dual of O⊕c⁻¹d⁻¹ is d⁻¹-dual of each summand: c⊕d⁻¹=c·L_c; row action forces entries O,(cd)⁻¹,cd,O and unit determinant; diag(2,1) excluded | Consistent |
| H1.0 dual/torsion | b invertible, supersingular E | (b⊗A)∨=b⁻¹⊗A∨; T_p of geometric points 0 while A[p] has rank p² | Consistent |
| H1.8 pairing | O=ℤ | ẽ_m(x,y)(a)=e_m(ax,y) lands in Hom(ℤ,μ_m)=μ_m, Tr∘ẽ=e | Consistent |
| H1.9 multiplier law | β′=uβ | b′=u⁻¹b, agrees with Conventions | Consistent |
| H2.1 local model | k[T]/T², ⟨Te₁,Te₂⟩ | k-dimension 2, self-orthogonal, T-image 0 ≠ rank one free | Consistent; S01 |
| H2.3 DP theorem | hypotheses vs DP94 Thm 2.2 | smooth over ℤ[1/nΔ], flat lci over ℤ[1/n], codim-2 non-smooth locus; normal fibres by Cor 2.3 | Consistent; S03 |
| H2.5a polarization transport | F=ℚ, c=ℤ, b=2ℤ | c⊗b⁻²=¼ℤ; b⊗(cb⁻²)=½ℤ=b⁻¹c; using cb² gives 8ℤ | Consistent |
| H2.8 lift independence | ε=1, lifts 0 and p | |0|≥|p| false (empty), |p|≥|p| true (whole) | Consistent strict ε<1 |
| H2.2a descent | Stacks 0CCJ, 07S7 | effective descent for quasi-projective V along finite locally free; free finite locally free action on quasi-projective gives scheme quotient and fppf torsor | Consistent |
| H3.2 square image | F=ℚ(√2), M=12 | ε⁸=(577,408)≡(1,0) mod 12; roots ±ε⁴=±(17,12)≡(5,0),(7,0) ∉ U_12 | Consistent |
| H3.3 CM example | F=ℚ(√3), N=7 | S²=3I, S†=S; u=7+4√3 of norm 1; f=i(7I+4S): f†f=49I+56S+48I=97I+56S=ι(u²); mod 7, f≡4iS with (4iS)²=−48I≡I, trace 0; on the +1 line S=(4i)⁻¹=2·(−i)=−2i with S²=−4≡3; η=97+56√3≡−1 mod 7 ∉ S_7; −u²≡1 mod 7 so η² ∈ S_7 | Consistent (nontrivial stabiliser, order two) |
| H3.5 finiteness | M=0; subgroup P | U_0={1}, Δ(0)=U⁺ infinite for g≥2; |P/P²|≤2^g | Bound consistent; Check text garbled, R03 |
| H3.7 narrow quotient | F=ℚ(√3) | Minkowski √12/2<2 so h=1; x²−3y²=−1 impossible mod 3 so h⁺=2 | Consistent |
| H3.8 cyclic step | O=ℤ, D cyclic of order n in A[n] | alternating pairing makes D isotropic; |D||D^⊥|=n² so D^⊥=D; (A/D)∨≅(A∨⊗b)/(D′)∨ with D′=A[b]/D | Consistent |
| H4.4 adjugate action | u,v unipotents mod 2; uI₂ | uv=[[2,1],[1,1]]≠vu=[[1,1],[1,2]]; adj(uI₂)=uI₂, det γ·γ gives u³ | Consistent |
| H4.8 flags | char p, C₂=E[p]⊂E[p²] | e_{p²}(x,y)=e_p(x,py)=1 on E[p]: isotropic; C₂∩E[p]=E[p] rank p², [p]C₂=0 | Consistent: flag needed |
| H4.10 non-injectivity | F=ℚ(√2), p=3, N=4 | Δ₁(4)≅ℤ/2 → Δ(4)≅ℤ/4 is the zero map (see S13) | Consistent |
| H4.18 bound | general | [A_n:B_n²]≤[A_n:A_n∩B_n]·[B_n:B_n²]≤[U:U_N]·2^g | Consistent |
| H4.19 | (i), (ii) | as in S13 | Consistent; BHW23 Lemma 8.20 false as printed |
| H5.2 cusp algebra | e=3, L=ℚ(ζ₃); e=5, H_C=±1 | L⊗ℚ(ζ₃)=L×L; ℚ(ζ₅)^{±1}=ℚ(√5) | Consistent |
| H5.4 central character | scalar t | ∏τ(t)^{k_τ+2m_τ}=∏τ(t)^w=Norm(t)^w | Consistent |
| H5.5 | F=ℚ(√10), c=(2,√10) | a²−10b²=±2 mod 5 needs a²∈{2,3}, impossible; disc 40 so 5 ramifies | Consistent |
| H6.1 Isom torsor | paired rank-2 F₃ spaces | Sp₂(F₃)=SL₂(F₃) order 24, nonabelian | Consistent |
| H6.4 real points | F=ℚ, odd ℓ | conjugation on E[ℓ] has eigenvalues 1,−1, det −1 = cyclotomic value | Consistent |
| H6.5 (C2) | λ₀ choice | π_lπ_l^c=l∈λ₀, π_l+π_l^c=1∉λ₀ so exactly one factor in λ₀; π_l=(1+√(1−4l))/2 root of X²−X+l | Consistent |
| H6.5 first Check | K=ℚ, l=3, δ of ℚ(√13) | 13≡1 mod 3 so δ|_{G_3}=1: local shape diag(ε,1); global det=εδ≠ε | Consistent negative control |
| H6.5 l=7 Check | K=ℚ(α), α³−3α+1, p=19 | x³−3x+1 mod 7 takes values 1,6,3,5,4,6,3 (no root; 7 inert); roots 3,7,9 mod 19 (19 splits; 27−9+1=19, 343−21+1=17·19, 729−27+1=37·19); residual eigenvalues 19≡5 and 1; q_v=343≡1 mod 19; π₇³=−10−9√−3 (π₇²=(−13+3√−3)/2); √−3≡±4 mod 19 gives reductions 7 and 11 | Consistent |
| H6.5 (C6) example | ℚ(√19) | 170²−19·39²=28900−28899=1, totally positive; h=1, h⁺=2; genus field ℚ(i,√−19) | Consistent |
| H6.6–H6.7 | CM quadratic K/k | dim Res_{K/k}Y_i=2; X_i(ℝ)=Y_i(ℂ) | Consistent |
| R18.1.1a component class | B disc 6, level 1+7M₂(ℤ₇) | component group (ℤ/7)^×; idele 2 at place 2 ≡ global 1/2 at 7: c₂=4 (2·4≡1), c₂⁻¹=2, c₂²=16≡2; 2·2=4; orders of 4 and 2 mod 7 are 3 | Consistent |
| R18.1.1a norm of s | s=z_π Π⁻¹ | ord Nrd(s)=2−1=+1 | Consistent |
| R18.1.6 reflex | F=ℚ(√5), E=F(i) | Φ₁+Φ₂=τ₁+τ₂+2σ₁: weights (1,1),(2,0); stabiliser fixes σ₁ hence i: F′=E; g=1: weights (1,1), F′=ℚ | Consistent |
| R18.1.9 kernel | (z,z⁻¹), (2,2) | (z,z⁻¹)∈ kernel {(a⁻¹,a)}; (2,2)∼(4,1) nonidentity | Consistent |
| R18.5.1–2 tree | q=2 | valence 3; radius-one ball 4 vertices | Consistent |
| R18.5.2 index correction | K=ℚ₂, n=1, z=2 | CDN's U₁ removes B⁻(x,½) for x∈{0,1,∞} mod 2: |2−0|=½ not <½ so the rational point 2 is retained, and B⁻(0,½)≠B⁻(2,½) although 0≡2 mod 2 (lift-dependent); with centres mod 4 and radius ½, lifts differ by ≤¼ and 2 is removed | README's correction verified; source misprint |
| R18.5.3 node charts | e=2 | xy=π′² singular total space | Consistent |
| R18.5.4 heights | [K:ℚ_p]=2 | absolute height 8=2·4; mult. by π: relative 4, absolute 4[k:F_p] | Consistent |
| R18.5.8 lattice | (1,0),(1,−1),(−1,−1) | parities 1,0,0; differences —,1,0 | Consistent |
| R18.5.9 very free | translations by 3, 2 on ℤ | displacements 3>2 pass; 2 fails | Consistent; BC91 §5.3.1 "distance > 2" |
| R18.5.11 ampleness | q=2 | dualizing degree −2+3=1>0; stability needs ≥3 special points | Consistent |
| R18.5.12a m | p=2 | m=3 unit in ℤ₂, m=2 not | Consistent |
| R18.5.12b multiplier | F=ℚ(√2), f=3+2√2 | conjugates 3±2√2>0, norm 9−8=1, irrational | Consistent |
| R18.5.12b positivity | u=−1 | d*d>0 in a definite factor, so −1 not a correction | Consistent |
| R18.5.12c Weil steps | labels | (0,0)→(1,1)→(2,2) with the corrected (1,1) translation | Consistent with BZ Thm 6.3 and (6.39) |
| R18.5.13 central sequence | BZ (6.34) | 0→F×→Ď××K×→I→0, exact on ℚ-points by Hilbert 90 | Consistent |
| R18.5.13 Hilbert-90 route | x with x′x=f | N_{L/F}(Nrd x)=f² so N(f/Nrd x)=1, f/Nrd x=σ(k)/k; Nrd(xk⁻¹)=f/N(k)∈F× | Route consistent (the kernel-G_m Hilbert 90 of BZ is shorter) |
| R18.5.14 lengths | edge of thickness m | xy=πᵐ resolves to m unit edges; cycle coefficient multiplied by m | Consistent |
| R18.5.15 hypotheses | B/ℚ disc 6, v=2 | inv_∞=0, inv₂=½: admitted; M₂(ℚ): inv₂=0 excluded | R03 repaired |
| R18.5.17a weights | Hurwitz order | 24 units, effective weight 12 | Consistent |
| R18.5.17a incidence | dart e=(x→y), q darts out of y except reverse | a_*U_r e=q·y=q b_* e; b_*U_r e=T_r y−x=T_r b_* e−a_* e | Consistent |
| R18.5.17a two copies | Zha14 (3.14)–(3.17) | V(X_m)≅X_{m/q}×ℤ/2 by ord_q det mod 2 | Consistent |
| R18.5.18 Tate factor | v(q)=ℓ | X=ℤ, monodromy [ℓ], Φ[ℓ]=ℤ/ℓ; q^{1/ℓ}=u^{1/ℓ}π unramified so T^I=E[ℓ] of order ℓ², T^t=μ_ℓ: 0→ℤ/ℓ→(ℤ/ℓ)²→ℤ/ℓ→0 | Consistent |
| R18.5.18 toric Frobenius | f∈Hom(X,μ_ℓ) | (σf)(x)=f(F⁻¹x)^q, i.e. q·(f∘F⁻¹) | Consistent |
| R18.5.20 levels | central vs division uniformizer | 1+πᵐO_D=1+Π^{2m}O_D; odd levels need Π | Consistent |
| R18.5.21 | proof-route inputs | PELModuli M2: 0 statements about uniformisation | R01 |
| R18.2.3 ranks | F_v=ℚ_p split | H_v[p] has p⁴ points, e₁₁H_v[p] has p² | Consistent |
| R18.2.12 metric | z=i; z=1+i | ‖dz‖=2 Im z: 2 and 2, while 2|z|=2√2 | Consistent |
| R18.2.14 determinants | scalar a | weights a², a⁻² on det W, det W^t: product 1 | Consistent |
| R18.2.17 ramification | F=ℚ[t]/(t³−t²−3t+1), p=37 | t=30: 27000−900−90+1=26011=37·703; t=4: 64−16−12+1=37 and 3·16−8−3=37 (double root); disc 148=4·37 | Consistent |
| R18.3.1 | real quadratic F | F× quotient removes infinite central units | Consistent |
| R18.3.2 | d=2,k=4; p=2 Sym² | rank 9; Gram det ±4 | Consistent |
| R18.3.7 | F=ℚ(√3) | Cl⁺=2, Cl=1 (above) | Consistent |
| R18.3.8 one-point set | D disc 2, H maximal | class number 1; kernel contains (c,−c), norm-factoring | Consistent; S09 |
| R18.3.10 | F=ℚ(√17), b=i+j | b²=−2, Nrd b=2, 17≡1 mod 8 so two dyadic places, odd valuations | Consistent |
| R18.3.12 | C₈, N=2 | C₈/C₈[2]≅C₄; C₈/2C₈≅C₂ | Consistent |
| R18.3.15 | k=F₇, q=3, det 6 | S=q⁻¹det=5·6=30≡2 | Consistent |
| R18.3.17 | ψ_v(NrdΠ)=4; r=2 | r=½ satisfies r²=¼; values 4 and ¼ at valuations ±2 | Consistent |
| R18.3.18 | ψ_v(NrdΠ)=9 over ℤ₂ | r=±⅓ units, equal mod 2, R_Π eigenvalues ±3 | Consistent |
| R18.3.25 | C₈,N=2; C₂,N=2 | {0,4}⊂{0,2,4,6}; C₂∋1 nonsquare | Consistent |
| R18.3.28 | q≡1 in F₃ | roots 1,2 distinct; constant term qS | Consistent |
| R18.3.30 | γ=2, q≡1 in F₃ | roots qγ=γ=2 repeated | Consistent |
| R18.3.32 | p=3, q≡−1 | γ=±1 give the same pair {γ,−γ} | Consistent |
| R18.4.3 adjoint ideal | (T,S)=(1,2) in F₇ | S⁻¹=4; (S⁻¹T,S⁻¹)=(4,4)≠(1,2) | Consistent |
| R18.4.7 | q=3, trivial C_K | T=4, S=1; (X−1)(X−3)=X²−4X+3 | Consistent |
| R18.4.12 circle | u=−1 over ℤ₂; over ℂ | [ℤ₂→ℤ₂] with −2: H⁰=0, H¹=F₂; invertible over ℂ | Consistent |
| R18.4.13 | 𝔸¹, constant coefficients | H⁰=coefficients, H_c⁰=0, image 0 | Consistent |
| R18.4.14 Gram | q=2,T=3,S=2; S=1 | G(0,1)=(3/2,3); Δ=9−9=0 and G(1,−1)=0 | Consistent |
| R18.4.15 | ordering | δ†δ=((q+1)a+π₁*π₂*b, Ta+(q+1)b) with π₁*π₂*=S⁻¹T | Consistent with G |
| R18.4.17 | ×λ on O; (1,0):O→O² | nonsaturated image / saturated with cokernel O | Consistent |
| R18.4.18 | J in char 3 | J³=I, order 3 | Consistent |
| R18.4.19 dims | F_v=ℚ_l | R_v: generic 4, Krull 5; framed without det: 5 and 6 | Consistent with Kis08 (3.3.4) |
| R18.4.21 | 𝔽₂, free C₂-orbit; fixed point; A=k[x,y]/(x,y)² | regular module dim 2, fixed dim 1, coinduced injective; trivial module not injective (fixed (a,a)↦2a=0); socle dim 2 | Consistent; R04 repaired |
| R18.4.22 | q=11,l=5 | dims 1,11,12; 12 unit mod 5 | Consistent |
| R18.4.24b | g=2 | torus fibre dimension g−1=1 | Consistent |
| R18.4.29 | constant systems rank r | patched rank r | Consistent; S04 |
| R18.4.30 thickening | A=k[[X,Y]]/(X²Y), M=A, L=(XY) | N=A/(XY), N/XN=k[[Y]]≅(XY) | Consistent; S14 |
| R18.4.32 hypotheses | MS Thm 6.5 | l | #image; l=5 clause | Consistent; S08 |
| R18.4.33 | (1,0):O→O² mod λⁿ | cokernel O/λⁿ free but with λ-torsion | Consistent |
| R18.4.34 | g=2,w=4 | q₀=3·2=6, a=2, degree 7, weight 7−4=3=w−1; w=2: q₀=a=0 | Consistent |
| R18.4.35 | weights | Σn_i+2Σd_i−2b | Consistent |
| R18.4.24a | Tate curve over ramified L | N_HK coefficient 1, N_p=1/e_L; WIEC §3.10 says the same | Consistent |

**Supplier-order audit.** Every `*Needs:*` line and supplier-table entry names a roadmap on main, earlier in `ORDER.txt`, or one of the two permitted other-author pull requests; 0 UPWARD/CYCLE lines; 0 internal `*Needs:*` cycles (DFS over 196 targets, 439 edges); no notion is consumed from a later roadmap; the only supplier drift is R01.

## Not verifiable

- **Dim05** (H5.2, Theorem 8.6(iv), p.548; introduction p.525; §3): the author page `gitlabpages.univ-lille.fr` returned HTTP 503 to the sources service at review time; no other legal copy was found. Cusp-scheme formula not certified.
- **Kur79** (R18.5.14, Definition 3-1, Proposition 3-2, Lemma 3-3, Proposition 3-4, pp.285–289): the Tokyo repository returned HTTP 503; the Astérisque text BC91 §5.4 (pp.144–146) was read instead and supports the deletion convention, not Kurihara's exact statements.
- **KL05** (H3.8, §§1.9–1.10): the Harvard URL serves a `.dvi` the service does not recognise; recorded in `needs-references.toml`. The cyclic construction was checked against BHW23 Lemma 8.22 (p.1776) only.
- **PRR23** (R18.3.7 Theorem 1.34 pp.43–44; R18.3.17 §1.4.2 pp.31–33): paywalled; cited by locator alone.
- **KRZ20 v1 pages** and **Conrad MSRI pages**: only v2 (arXiv) and the Stanford copy are legally served; theorem numbers agree, pages differ (R05).
- **Seed identity:** the 15 seeded targets are given only by type; the sample above is one reproducible choice in that order, weighted toward the repaired passages.

## Source issues

- **Error** in BHW23 at Lemma 8.20 and proof, printed p.1775: the source says the connected groups Δ_n(N) inject into Δ(N) and equal their inverse limit for large n; it should be that the stable images of Δ_∞(N) in Δ_n(N) eventually equal the limit, injectivity failing already for ℚ(√2), p=3, N=4; affects a stated result.
- **Error** in MS19 at Theorem 6.8 proof, internal p.35: the source says the reduced norm quotient is F×\A_{F,f}×/ν(H); it should be the totally positive subgroup F_+^× in place of F×, since Nrd(D×)=F_+^× for a totally definite algebra; affects the proof.
- **Misprint** in CDN20 at §1.2, p.12: the source says U_n is P¹ minus the open balls of radius |ϖ|ⁿ about lifts of P¹(O_F/ϖⁿ); it should be lifts of P¹(O_F/ϖⁿ⁺¹), otherwise the complement depends on the lifts and retains rational points such as 2 for ℚ₂, n=1; affects nothing (U_n is only used as an exhaustion).
