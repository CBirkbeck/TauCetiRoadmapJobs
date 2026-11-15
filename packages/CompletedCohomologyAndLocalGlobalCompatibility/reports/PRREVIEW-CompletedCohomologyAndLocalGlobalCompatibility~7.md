# Review of CompletedCohomologyAndLocalGlobalCompatibility (pull request #1270 at 0c236a0)

**Verdict:** needs changes

Incremental re-review of the 4 lines changed since `1148c33` (two reworded paragraphs of `README.md`, §4.5 and §6.1), and the first check of the pull request's title and description against this head. The folder's change is sound; both findings are in the description.

## R01 (P3) — The description's dependency paragraph names two suppliers and calls every other roadmap a consumer

**Location** Pull request description, paragraph "Dependencies": "By section, the README uses: PadicLocalLanglandsForGL2Qp, …; AutomorphicFormsOnReductiveGroups §§7.4–7.5, …. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim** The head contradicts it: the README consumes, by section, many further roadmaps that are not on main.

**Witness** `README.md` lines 129–141: CompletedCohomologyPartII Layers 0–3, 5; PhiGammaModulesAndIwasawaCohomology §§1.1, 1.2, 7.1, 7.5; ArithmeticStatisticsPartIV §3.2; IntegralHeckeAndGaloisDeterminants §3a.1; OverconvergentAutomorphicForms §§0.6–0.7. `*Needs:*` lines cite CompletedCohomologyPartII 24 times, LocalGaloisDeformationRings 12.

**Repair** Replace the two sentences by: "By section, the README's supplier contracts and `*Needs:*` lines use these roadmaps that are not yet on main: PadicLocalLanglandsForGL2Qp (the shared local Langlands core, transported in §§0.2–0.4); AutomorphicFormsOnReductiveGroups §§7.4–7.5 (common forms carrier and weighted Hecke adapter, §0.7); CompletedCohomologyPartII Layers 0–3 and 5 and §8.5; PhiGammaModulesAndIwasawaCohomology §§1.1–1.2, 7.1 and 7.5; ArithmeticStatisticsPartIV §3.2; IntegralHeckeAndGaloisDeterminants §3a.1; OverconvergentAutomorphicForms §§0.6–0.7; ModularCurvesPartII; HilbertModularVarietiesAndShimuraCurves; LocalGaloisDeformationRings; GlobalGaloisDeformations; DeformationAndDerivedPatchingAlgebra; AutomorphicGaloisRepresentations; GL2AutomorphicRepresentationsAndTransfer; PadicFamilies; ClassicalSerreModularity; and GL2ModularityLifting §10.1 for the nice-prime predicate of §5.7. The complete list is the Depends-on block below. Roadmaps on main are cited by name."

## R02 (P3) — The description says the Lean states definitions and theorems; it states none

**Location** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README."

**Claim** `Suggested.lean` at this head declares nothing, as the description's own "Validation" paragraph and the README say.

**Witness** `Suggested.lean` lines 112–114: the namespace opens and closes with no declaration; `README.md` line 9: "`Suggested.lean` states no theorem". The worker's diff: Lean declarations 0 added.

**Repair** Replace the clause by: "`Suggested.lean` states no declaration: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its module docstring names the missing carriers; every target is in the README."

## Previous findings

- none: the review of `1148c33` accepted the folder with no finding (its R01–R05 bullets recorded repairs of the review before it; the passages they concern are untouched by this diff).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §4.5 (line 1605), reworded Theorem 1.2.1 | `V̄|G_{ℚ_p}` = 1⊕1 with p odd; same with p = 2; V|G_{ℚ_p} = χ₁⊕χ₂ | p odd: 1⊕1 = χ⊗(1 0; 0 ε̄) forces ε̄ = 1, false, so (b) holds; it is χ⊗(1 0; 0 1), so not p-distinguished: (1) only. p = 2: ε̄ = 1, (b) and p-distinguishedness coincide. Split V: nonzero map, embedding clause not claimed | Same hypotheses and conclusions as EM11 lines 104–137; agrees with README lines 1607, 1611 |
| §4.5, Σ and equivariance | Σ ∌ p; Σ omitting a ramified prime | Text: Σ contains p and every prime where V ramifies; map equivariant for `GL_2(ℚ_p) × GL_2(𝔸_f^Σ)`; (2) for `GL_2(𝔸_f)`. EM11 lines 117–118, 132–133: the same | Unchanged in content |
| §6.1 (line 2198), reworded Corollary 1.2.2 | hypotheses (a), (b); conclusion (2) with V|G_{ℚ_p} = two characters of equal reduction | README: V̄ abs. irreducible, ≇ χ⊗(1 ∗; 0 ε̄); (2) excludes split with isomorphic reductions; weight k ≥ 2; "some twist of V". EM11 lines 155–169: the same | Matches; consistent with line 2200's remark on the extra hypothesis |
| §6.1, Theorems 1.2.3 and 1.2.4 | p = 2; (c) with only one of the two shapes excluded; tame level | README: p > 2; `V̄|G_{ℚ(ζ_p)}` abs. irreducible; (c) excludes both (1 ∗; 0 1) and (1 ∗; 0 ε̄); primes of tame level in Σ∖{p}; 1.2.4 drops promodularity. EM11 lines 177–191, 196–215: the same | Matches; (2) of 1.2.4 has no split exclusion, as line 2200 says |
| Description, R01 | supplier roadmaps named by the README, checked on main `1a19c9f` | Not on main: CompletedCohomologyPartII, PhiGammaModulesAndIwasawaCohomology, ArithmeticStatisticsPartIV, IntegralHeckeAndGaloisDeterminants, OverconvergentAutomorphicForms, ModularCurvesPartII, LocalGaloisDeformationRings; description names 2 | Contradicted |
| Description, R02 | declarations in `Suggested.lean` | 0 declarations; description says "definitions and theorems" | Contradicted |

Rows for the statements this diff does not touch stand as in the previous review, of `1148c33`.

- Gate at this head (worker): every counter 0, `build=0 OK`. Re-run here: every counter 0, `OK`, exit 0.
- Dependency check (`--movable`): `depcheck: 246 roadmaps, 2267 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/Suggested.lean` exits 0 with no output. The file is unchanged since `1148c33` and declares nothing, so the `#check @name` comparison and the one-tactic probe have nothing to test; the headlines remain not statable, as its docstring says.
- Source locators checked against the text: 4 (EM11 Theorem 1.2.1, lines 104–137; Corollary 1.2.2, lines 149–169; Theorem 1.2.3, lines 173–191; Theorem 1.2.4, lines 193–215). Promodularity is defined before use (README §2.5, lines 894–903; EM11 lines 96–101).
- Text that cites the changed passages, re-read: README lines 1607, 1611, 2192, 2200, 2218, 2315; all agree with the reworded statements. Seeded targets 6.5 and 6.6 cite §§4.5 and 6.1 by theorem number only and are unaffected; the other seeded targets lie outside the changed passages.
- Other parts of the description checked against the head and found to hold: the title; the summary block (consumers GL2ModularityLifting, Kato-type zeta elements via §2.6, Pan's locally analytic vectors, README lines 2378–2380; `Representation.IntertwiningMap`, `ContIntertwiningMap`, `PrimeSpectrum.zeroLocus` at README lines 46, 92, 104; rank `n ≥ 1` unitary groups, line 381; totally real F with p split completely, line 659); the folder's three files; the "Validation" paragraph. No file changes outside the folder.
- Remark (untouched text, passed by the previous review): README line 33 lists GL2ModularityLifting as a consumer while the `*Needs:*` line 2150 cites its §10.1; the dependency check reports no cycle.
- Overlap check: read CompletedCohomologyAndLocalGlobalCompatibilityPartII, GL2ModularityLifting, PadicLocalLanglandsForGL2Qp; the diff adds no owned object. Part II states that it starts after this roadmap's §§5.1–5.3 and imports §5.2a; PadicLocalLanglandsForGL2Qp names this roadmap as owner of §§5.1–5.6 and §6.3; Emerton's Corollary 1.2.2 is owned here and only cited by GL2ModularityLifting (its README line 2104). No open pull request changes this roadmap and no cited id is dropped.
- Source independence: changed passages only; 2 passages compared with 1 source (EM11 lines 104–137 and 149–215), none shared beyond forced hypothesis lists (longest common run 7 words, "is de Rham with distinct Hodge–Tate weights"); the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

Carried from the previous review; none is in a passage this diff changes:
- CHT §3.3: no legal copy found.
- Shimura, *Introduction to the arithmetic theory of automorphic functions*, Proposition 3.3: no legal copy.
- Ribet 1990, Proposition 3.8, and Ribet 1995: paywalled, uncertified.
- González–Rotger, Theorem 3.1 and Table 3.2: not fetched.

## Source issues

- none

## For the human reviewers

- none
