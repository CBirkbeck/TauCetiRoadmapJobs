# Review of ArithmeticGaloisRepresentations (pull request #856 at 00e8930)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `00e8930`: the folder is unchanged, and this round reads the pull request's title and description against the head. The three findings are all in the description's last paragraph; none asks for a change to the folder.

## R01 (P3) — Description says the README uses LFunctions and that §2.7 supplies Tate integrals and Artin equations

**Location:** pull request description, last paragraph: "On main: LFunctions Layers 0, 5–6 (… §2.7 here supplies adelic Tate integrals, comparison, local-epsilon normalization, completed Artin equations and globalization)".

**Claim:** The head contradicts both halves. The README consumes no continued L-function, the adelic inputs and local zeta integrals of §2.7 are a supplier's, and the completed Artin equation is another roadmap's and does not use §2.7.

**Witness:** `README.md:155–166`: scalar adelic inputs and local zeta integrals "are AnalyticNumberTheoryPartII §§5.3g, 5.3h and 5.3j"; LFunctions Layers 0, 5–6: "this roadmap consumes neither"; the Artin equation is AnalyticNumberTheoryPartI §2.41's, "it does not use §2.7". Also `README.md:678`.

**Repair:** Replace the LFunctions clause with: "No continued L-function is consumed: §2.7 owns the Gauss-sum character constants, the standard-test-function evaluations, the finite-sum root-number product formula and the finite-order globalisation; Hecke functional equations are LFunctions Layers 0, 5–6 and AnalyticNumberTheoryPartI §2.3a, the Artin functional equation is AnalyticNumberTheoryPartI §2.41, named as owners only."

## R02 (P3) — Description calls PadicPeriodRings a downstream consumer

**Location:** pull request description, last paragraph: "The period theory and the abelian-variety reduction theory formerly cited here now live downstream in PadicPeriodRings, FiniteFlatGroupsAndIntegralPadicHodgeTheory and NeronModelsAndSemistableAbelianVarieties, which consume this roadmap".

**Claim:** PadicPeriodRings is upstream of this roadmap, not a consumer of it. The other two are downstream as stated.

**Witness:** Merge order: PadicPeriodRings line 23, this roadmap line 58. PadicPeriodRings `README.md:12` (open head) lists ArithmeticGaloisRepresentations among its consumers and cites nothing from it. The description's own merge-order block puts PadicPeriodRings before this pull request.

**Repair:** "The period foundations are PadicPeriodRings §§1.1–1.5, 2, 4.1–4.3, earlier in the merge order. The finite-coefficient period functors and the abelian-variety reduction theory live downstream in FiniteFlatGroupsAndIntegralPadicHodgeTheory and NeronModelsAndSemistableAbelianVarieties, which consume this roadmap."

## R03 (P3) — Description does not state the AnalyticNumberTheoryPartI and PartII suppliers

**Location:** pull request description, last paragraph: "By section, the README uses: AdelicAlgebraicGroups AA.2.4 …; AbelianSchemesAndArithmeticModuli … On main: LFunctions …, CFSGBasicProperties T1–T2 …, and PivotalSpherical".

**Claim:** The by-section list omits two suppliers that the head adds, each with its own contract section. A reader of the prose cannot tell that the finite-level conductors and the adelic Fourier inputs are imported.

**Witness:** `README.md:481–497` ("From `TauCetiRoadmap.AnalyticNumberTheoryPartI`", §2.2a, `lowerArtinConductor`, `lowerSwanConductor`, `lowerConductors_integral`) and `README.md:499–512` ("From `TauCetiRoadmap.AnalyticNumberTheoryPartII`", §§5.3g, 5.3h, 5.3j, `adeleRing_selfDual`).

**Repair:** Add to the "On main" list: "AnalyticNumberTheoryPartI §2.2a (finite-level Artin and Swan conductors, their integrality, induction and the conductor–discriminant formula; §§3.2, 3.5 and 6.6 here build on them) and AnalyticNumberTheoryPartII §§5.3g, 5.3h and 5.3j (standard additive characters, self-dual measures, adelic Schwartz–Bruhat space, Poisson summation, local zeta integrals; consumed by §2.7)".

## Previous findings

- none: the review of `00e8930` had no finding.

## Verified sound

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| §2.7 unramified constant on the self-dual measure (cited by R01) | `a = 0`, `v(c) = ν`: `χ(c) q^ν vol = ω(ϖ^ν) q^(−sν) · q^ν · q^(−ν/2) = ω(ϖ^ν) q^((1/2−s)ν)`, the stated value | Holds |
| §2.7 ramified constant, `a ≥ 1` (cited by R01) | `ω(c) q^(−s(a+ν)) · q^ν · q^(−ν/2) · q^(a/2) 𝔤 = ω(c) q^((1/2−s)(a+ν)) 𝔤`, the stated value | Holds |
| Description: joint continuity is stronger than `ContRepresentation` | `a ↦ (1+ℓ)^a` on discrete `ℚ_ℓ`: each operator continuous; stabiliser of `1` is `{0}`, not open in `ℤ_ℓ`, so not jointly continuous | Holds |
| Description: `LinearMap.det` is 1 on non-free modules | `A = ℚ × ℚ`, `M = (1,0)A`, `u = 2`: no finite basis, pinned `det` returns `1`; determinant line gives `(2,1)` | Holds |
| Supplier order named in R02 | PadicPeriodRings line 23, this roadmap 58, FiniteFlatGroupsAndIntegralPadicHodgeTheory 67, NeronModelsAndSemistableAbelianVarieties 68 | R02 |

The rows for untouched statements stand as in the previous review, of `00e8930`.

- Gate, run on this head: `gate ArithmeticGaloisRepresentations: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0); the worker's run adds `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2223 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, 20 lines of output, each a `declaration uses 'sorry'` warning. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Pinned declarations opened: Mathlib `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean:55`); `LinearMap.det` (`LinearAlgebra/Determinant.lean:164–166`, value `1` without a finite basis).
- Cross-roadmap citations resolved on main for the description's supplier sentences: RamificationOfCompleteDiscretelyValuedFields §§3a.1–3a.3, 4a.1–4a.3 (`README.md:421, 566, 696, 908, 1079, 1185`); CFSGBasicProperties T1–T2 (`:222`); PivotalSpherical Layer 2 (`:168`); LFunctions Layers 0, 5, 6 (`:346, 929, 1100`); AnalyticNumberTheoryPartI §§2.2a, 2.3a, 2.41 (`:1309, 1356, 2037`); AnalyticNumberTheoryPartII §§5.3g, 5.3h, 5.3j (`:681, 698, 719`) and `adeleRing_selfDual` (`Suggested.lean:290`); `gap:unit-filtration-reciprocity` (`README.md:519` here).
- Description sentences checked and found to agree with the head: the title, the summary block, the first prose paragraph, the folder contents (README, `Suggested.lean`, `metadata.toml`; 33 declarations), "Supplier amendments", the AA.2.4, AbelianSchemesAndArithmeticModuli, CFSGBasicProperties and PivotalSpherical clauses, and "no longer depends on SelmerIwasawaCohomology or NeronModelsAndSemistableAbelianVarieties" (0 and 9 mentions, the 9 all as downstream owner).
- Remark, untouched text: AdelicAlgebraicGroups on main (`README.md:77–80`) maps the finite-image Artin functions of AA.2.4 to AnalyticNumberTheoryPartI §2.18a; the mapping keeps the citations at `README.md:179, 683, 721` valid.
- Seeded sample and unverified locators: none falls in a changed passage (0 changed lines); the README flags no locator as unverified.

Overlap check: read ArtinRepresentations, PotentialAutomorphyInfrastructurePartII, NeronModelsAndSemistableAbelianVarieties, RamificationOfCompleteDiscretelyValuedFields, SmoothRepresentationsOfLocalGroups, ClassFieldTheory (the results-and-headings list is empty); nothing shared: each cites this roadmap, or is cited by it, by section, with one owner per object.

Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change); arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- none in the text this round checks.

## Source issues

- none

## For the human reviewers

- none
