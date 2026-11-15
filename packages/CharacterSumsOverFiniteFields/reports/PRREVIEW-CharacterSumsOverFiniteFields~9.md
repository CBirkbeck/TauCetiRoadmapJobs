# Review of CharacterSumsOverFiniteFields (pull request #1712 at 52b794d)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `52b794d`: the folder is byte-identical to the head the previous review accepted, and no file outside it changed. This round read the pull request's title and description against the head. No finding.

## Previous findings

- The previous review, of `52b794d`, raised no finding; there is none to account for.

## Verified sound

**The pull request's text against the head.**

| Sentence of the title or description | What the head shows | Result |
|---|---|---|
| title "roadmap for character sums over finite fields"; "Initial draft of the roadmap …" | the folder is absent from `origin/main`; the change is 2956 insertions, 0 deletions, 3 files | adds a roadmap, as stated |
| "`README.md`: the roadmap, 8 layers and 49 milestones" | `## Layer 0` … `## Layer 7` = 8; numbered `### k.n` sections 7+5+5+6+9+6+5+7 = 50, of which 3.6 is "background, not a target" | 8 and 49 |
| "`metadata.toml`: arXiv topic `math.NT`" | `metadata.toml:1`: `topic = "math.NT"` | agrees |
| three files listed | folder holds `README.md`, `Suggested.lean`, `metadata.toml` | agrees |
| summary: Gauss, Jacobi, Jacobsthal, Kloosterman sums; Hasse–Davenport lifting; Weil bounds; Stickelberger factorizations; Gross–Koblitz for Gauss and Jacobi sums | owned list `README.md:96–137`; sections 2.5, 3.3, 4.7–4.8, 5.5, 6.2 (ideal factorization for every `a`), 6.5 | agrees |
| summary: final layer on integer moduli, "Salié evaluations and Weil bounds whose general twisted form includes a conductor factor" | 7.5 (`kloostermanSum_zmod_primePow`), 7.6 (`norm_kloostermanSum_zmod_le_of_char`, factor `√χ.conductor`, `Suggested.lean:527–531`) | agrees |
| summary: "identifies the integer-modulus Kloosterman sums used in automorphic spectral theory" | 7.3 against AutomorphicSpectralTheory §1.16 (present at that roadmap's open head, with `kloosterman_real`) | agrees |
| summary: finite commutative rings for definitions, finite fields at the estimates; reuse of `gaussSum`, `jacobiSum`; "the supplied Gross–Koblitz formula" | `README.md:14–22`; *From DirichletPadicLFunctions* §4.5 `grossKoblitz_formula` (present at its open head) | agrees |
| `depends-on` block: AutomorphicSpectralTheory, CongruenceSpectralGap, DirichletPadicLFunctions, EllipticLegendreCharacterInterfaces | the README's four open supplier subsections; all four still open, at merge-order positions 98, 159, 97, 103, before this roadmap at 161; ClassicalArithmeticCompletion is on main | agrees |

**The adversarial table** (a statement the description cites; recomputed this round, script `py/k.py` in the job's scratch directory):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 7.6 twisted bound `|S_χ(m,n;c)| ≤ τ(c)(m,n,c)^{1/2} 𝔠_χ^{1/2} c^{1/2}` | every `χ` modulo `9, 25, 27, 49, 81, 125`; all `m`, all `n` (six `n` at `c ≥ 81`) | max of left/right: `0.6265, 0.6614, 0.4992, 0.6653, 0.3997, 0.4998`, all `< 1` | sound |
| 7.6 "the factor is needed" | primitive `χ` modulo `17³`, `(m,n) = (1,15)` | max `|S_χ| = 289.0000` against `τ(17³)·17^{3/2} = 280.3712`; with the factor the bound is `19652` | sound |
| 7.6 untwisted bound | all `m, n`, every `c ≤ 60` | max of left/right `= 1.0000` (equality, e.g. `c = 1`), never above | sound |
| 7.5 Salié, 7.4 multiplicativity | `S(1,1;25)`, `S(1,2;25)`, `S(1,1;15)` | `8.763067 = 10cos(4π/25)`; `0`; `−2.618034 = S(2,2;3)·S(2,2;5)` | sound |

The rows for the other statements stand as in the previous review, of `52b794d`.

- Gate, run from the worktree with `--base origin/main`: every scanner 0, `OK`.
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 35 `declaration uses sorry` warnings and nothing else.
- Outside the folder: `git diff --stat origin/main...HEAD` is empty.
- Cross-roadmap citations resolved at the open heads: DirichletPadicLFunctions §§4.1, 4.4, 4.5; AutomorphicSpectralTheory §1.16; CongruenceSpectralGap §§4.2a–4.2b; EllipticLegendreCharacterInterfaces 5.1 (`symmetric_cubic_trace_zero`). The five "found nowhere" leads are three LMFDB knowl ids and a Tau Ceti module path, not declarations.
- Seeded sample: all fifteen targets lie in text unchanged since the previous reviews, which checked their locators; the diff is empty, so none was re-read.
- Overlaps: no pull request changes this roadmap, no dropped id.
- Overlap check: read HypergeometricMotives, KloostermanMomentsAndPotentialAutomorphy, KloostermanSheavesAndBesselIsocrystals, FourierDeligneTransform, HalfIntegralWeightModularForms, QuadraticCharactersAndReduction, ClassicalArithmeticCompletion, ThetaSeries; nothing shared (the first four cite this roadmap's §§0.1, 0.6, 3.3, 3.6, 5.1, 6.4–6.5 as its owner; the classical Kloosterman sum modulo `c` is owned by AutomorphicSpectralTheory §1.16 and the hyper-Kloosterman sum by CongruenceSpectralGap §4.2a, both cited here).

Source independence: changed passages only; 0 passages compared, the folder having no changed line since `52b794d`; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Nothing in this round depends on a text that cannot be read. The items of the earlier reviews (Ireland–Rosen, Lidl–Niederreiter, Iwaniec–Kowalski, Gross–Koblitz, Weil 1948, `schmidt1976` uncertified) are unchanged.
- "One of 23 roadmaps … opened as drafts" in the description is a statement about other pull requests, not about this folder; it was not checked.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` `## Provenance` (from line 2287) maps targets to two Apache-2.0 Lean repositories (`AxiomMath/Weil`, `formal-arithmetic-geometry/weil-conjectures`) and says neither is a supplier; no declaration of `Suggested.lean` was compared with them this round.
- **Not tested.** Several cited books (Ireland–Rosen, Lidl–Niederreiter, Iwaniec–Kowalski) and `schmidt1976` were not read by any review round; wording and arrangement were not compared with them.
