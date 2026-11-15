# Review of EffectiveClassNumbers (pull request #1406 at 471be8d)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 9553391: the folder is byte-identical to the one the previous review accepted, and nothing changed outside it. This round read the pull request's title and description against the head. No finding.

## Previous findings

- The previous report (of 9553391) had no finding; there is nothing to account for.

## Verified sound

### The pull request's text against the head

| Sentence of the title or description | What the head shows | Result |
|---|---|---|
| Title "EffectiveClassNumbers: roadmap"; "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" | The folder is not on main; the change is 1400 insertions, 0 deletions, in exactly these three files; nothing outside the folder | agrees |
| "continuing ImaginaryQuadraticClassNumber from its arithmetic and ineffective finiteness results" | README line 3: "ImaginaryQuadraticClassNumber, Part II"; H2.4's ineffective constant is replaced in §4.9 (line 1027) | agrees |
| "curves of conductors 37·139² and 5077 have analytic and arithmetic rank three" | §§2.12–2.13; `rankThree_139`, `rankThree_5077` state order 3 at s = 1 and `finrank ℤ … = 3`; 37·139² = 714877 | agrees |
| "θ(d)·log d ≤ 7000·h(K), or 55·h(K) for discriminants prime to 5077" | `global_7000`, `coprime_55` (§§3.6–3.7), the latter with `Coprime 5077` | agrees |
| "h(K) > κ(q)(log\|disc K\|)^(1−q) with explicit rational κ(q), a computable cutoff for each class number" | `effectiveKappa`, `effectiveLogarithmic_bound` (§§4.6–4.7), `effective_cutoff` (§4.8) | agrees |
| "the sixteen fields of class number three, the largest ℚ(√−907)" | `classThreeDiscriminants` has 16 elements, of largest absolute value 907 (§5.8) | agrees |
| "proved for any fixed pair (Ψ, M) under C1–C4 and every imaginary quadratic field with d > 4" | `oesterleTechnical`: C is chosen after M, Ψ and before K, G; hypothesis `discr K < -4` | agrees |
| "Vanishing of L′(1) comes from Gross–Zagier and a Heegner height gap, since no numerical enclosure proves a zero" | README line 495 (Layer 2 introduction), §§2.8, 2.11 | agrees |
| "twist comparisons cover every prime, wild ones included" | §3.1 line 782 and §3.3 line 846 treat wild potentially good and additive potentially multiplicative primes | agrees |
| "genus theory, reduced forms, residues and canonical heights come from Mathlib and Tau Ceti" | Scope and ownership, lines 35–38: all four cited as Tau Ceti declarations | agrees |
| "class numbers 4 to 100, orders, CM fields … small-degree CM points would cite its technical theorem, rank-three curves and constants" | Downstream consumers, line 1170 | agrees |
| "the Lean states only real-bodied definitions and theorems"; "the Lean imports none of them" | 7 definitions with bodies, 10 theorems with `sorry`; imports are `Mathlib` and two `TauCeti.*` modules | agrees |
| "Validation: … the dependency gate shows 0 problem(s) …; the outside-folder diff has 0 path(s)" | the dependency check and the outside-folder diff below | agrees |
| Suppliers (a reader must know them) | The README's suppliers that are not on main are AutomorphicLFunctionsAndLocalFactors, EffectiveDiophantineMethods, EllipticCurveModularity, ExplicitPrimeCounting and GL2AutomorphicRepresentationsAndTransfer; the description's dependency list names these five and AnalyticNumberTheoryPartI, which is on main | nothing left unstated |

No section, headline or declaration is removed (the pull request adds the roadmap), so the description has no renumbering to state.

### Adversarial table

The diff changes no statement; the rows below are statements the description cites, with values computed this round.

| Statement | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| §5.8 `classThreeDiscriminants`: sixteen discriminants, largest 907, each of class number three | all sixteen d | count 16, max 907; every d ≡ 3 (mod 4); the count of reduced primitive forms of discriminant −d is 3 for each of the sixteen | keep |
| §§3.6–3.7 at the largest field | d = 907 (prime, θ = 1, h = 3) | θ·log d = 6.8101 against 55·3 = 165 and 7000·3 = 21000 | keep |
| §§4.6–4.7 `effectiveKappa`, `effectiveLogarithmic_bound` | q = ε = 1/2, d = 907 | exponent 46 + ⌈256⌉ = 302; 2^(−302)·(log 907)^(1/2) < 3 = h | keep |
| §2.1 conductor in the description | 37·139² | 714877, the N of §2.12 (line 729) | keep |

The rows of the previous report for the other statements stand as in the previous review, of 9553391.

- **Seeded sample:** none of the fifteen targets (§§0.1, 0.6, 1.1, 1.2, 1.6, 1.8, 2.1, 2.5, 2.9, 2.11, 3.6, 3.7, 4.4, 4.6, 5.6) falls in a changed passage, since no passage changed; 0 source locators re-read this round. The README flags no locator as unverified.
- **Gate:** the worker's gate at 471be8d passes every check (`depcheck=0`, `build=0`). My run of the gate command passes every check except one line, `depcheck: UPWARD: EffectiveClassNumbers (#277) -> ExplicitPrimeCounting (#278) at README lines [90, 125, 129, 130, 958, 1044]`, read against the board's order, which still lists this roadmap one place before its supplier. This is the exempt merge-order move, not an upward supply: with `--movable` the check prints `moved: EffectiveClassNumbers moved in the merge order from #277 to #278, right after its last supplier ExplicitPrimeCounting` and `0 problem(s)`.
- **Dependency check** (the brief's order, `--movable`): `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/EffectiveClassNumbers/Suggested.lean` exits with ten "declaration uses `sorry`" warnings (lines 61, 80, 127, 134, 143, 150, 166, 177, 193, 206) and no other message. The file is unchanged, so the earlier signature comparison and one-tactic padding probe stand.
- **Citations resolved:** 12 supplier roadmaps located (7 on main, 5 at open heads, each named in the description's dependency list); AnalyticNumberTheoryPartI §§0.9, 0.23, 0.33, 0.34 are headings on main at README lines 288, 644, 863, 883. `roadmaps resolve` and `scratch/overlaps.md` list nothing unresolved, dropped or shared.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- Overlap check: read ImaginaryQuadraticClassNumber, AnalyticNumberTheoryPartI, QuadraticCharactersAndReduction (the closest lists; the third list is empty); nothing shared, as in the previous review: the folder and the Scope and ownership deferrals are unchanged.
- Source independence: 0 passages compared (changed passages only: no passage changed), none shared; largest share O85, 53 of 142 source mentions; the arrangement was not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- **O88** is recorded as waived and is cited by locator only.
- The description's sentence on AI assistance ("0 independent review rounds and 2 red-team rounds on the job board") describes the board's history, not the change; it was not checked against anything.
- AnalyticNumberTheoryPartI §0.34 and §0.9, ExplicitPrimeCounting §0.3b and GL2AutomorphicRepresentationsAndTransfer R16.0.1 are targets of supplier roadmaps: their statements were read in earlier rounds, not their proofs.

## Source issues

- none

## For the human reviewers

- **Scope.** §§4.8–4.9 rest, through AnalyticNumberTheoryPartI §§0.9 and 0.34, on LS26 (README lines 1009, 1025, 1182): a 9-page preprint of 1 October 2026 in a GitHub repository, with no refereed version cited. The statements take c₀ as a parameter.
