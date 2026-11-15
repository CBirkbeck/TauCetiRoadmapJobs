# Review of SmoothBanachRepresentations (pull request #1145 at 18e94ff)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`
**Verdict:** accepted

Incremental re-review: the folder has changed by 0 lines since `18e94ff`. The title and description were rewritten since the previous review and were read against this head; no finding.

## Previous findings

- R01 — repaired: title is now "Add roadmap: smooth vectors in real and complex Banach representations"; description opens "This adds the roadmap SmoothBanachRepresentations, which is not on main". The diff has 828 insertions, 0 deletions.
- R02 — repaired: the torus paragraph is replaced by "The smooth noncommutative torus … belongs to NoncommutativeGeometry N6; Layer 8 states only the generic smooth-algebra theorems", which agrees with `README.md:13`.
- R03 — repaired: the ownership paragraph now gives the gap `banach-gfinite-density` to CompactGroups with AutomorphicFormsOnReductiveGroups §2.1 consuming it, both scalar comparisons to §7.2a, and "N6 takes nothing from Layer 8"; these agree with `README.md:9`, :78, :84 and main NoncommutativeGeometry `README.md:23`, :104–106.
- R04 — repaired: "nine headline theorems, each with `sorry`, and the seven definitions they need"; the build sentence names this roadmap's module and nine `sorry` warnings. Counted at this head: 9 theorems, 7 definitions, 9 warnings.
- R05 — repaired: "NoncommutativeGeometry N1.Tensor, which §§7.2a–7.3 consume, is on main." Main (`3cf7342`) NoncommutativeGeometry `README.md:481` has the heading "N1.Tensor".

## Verified sound

| # | Statement | Instances and values computed | Result | Change |
|---|---|---|---|---|
| 1 | `contMDiff_orbit_iff_wordApply_isSome` (description: "finite-order domain criterion") | G=ℝ, π(t)v=e^t v on ℝ: generator is the identity on all of E, every word gives `some v`; orbit is C^k. Translation on C₀(ℝ), v the tent function, k=1: word of length 1 gives `none`; orbit not C¹ in sup norm. k=0: both sides true. | True both directions | — |
| 2 | `scalarParametrix` (summary: "one-variable parametrix with real test functions") | Fourier side: (−1)^n α_n D^(2n) has symbol α_n ξ^(2n), so the sum has symbol ≥ α₀ > 0. Without the sign, α₀=α₁=1 truncated gives 1−ξ², zero at ξ=1. | Sign convention fixed | — |
| 3 | `smooth_resolventIntegral` (summary: "holomorphic closure") | A=ℂ, a=0, unit circle, f=1: ∫dz/z=2πi=2πi·f(0). M₂(ℂ), conjugation by diag(e^t,1), a=E₁₂, f(z)=z: resolvent z⁻¹+z⁻²E₁₂, integral 2πi·E₁₂=2πi·f(a), orbit 2πi·e^t·E₁₂ smooth. | True | — |
| 4 | `dixmierMalliavin_function` (summary: "support-controlled") | φ=0: n=0, empty sum 0, both support conditions vacuous. One-point G, μ=m·δ, φ=c: f=1, h=c/m gives ∫f(y)h(y⁻¹x)dμ=m·c/m=c; tsupport h ⊆ tsupport φ. | True | — |
| 5 | Description's counts against the head | Declarations in `Suggested.lean`: 9 `theorem`, 7 `def`/`abbrev` (16 total); README layers numbered 0–8; diff stat lists 2 files, both in the folder. | Description agrees | — |
| 6 | Description's supplier status | AutomorphicFormsOnReductiveGroups and LocallyAnalyticDistributions: absent from main, open as new roadmaps. NoncommutativeGeometry, CompactGroups, LieGroups, BanachAlgebras, BanachSpaceTheory, OperatorKTheory: on main. OneParameterSemigroups: on main under `Completed/`. | Description agrees | — |

The rows for statements this re-review did not touch stand as in the previous review, of `18e94ff`.

- **Gate.** The worker's gate at `18e94ff` is OK. My rerun with the candidate merge order and the build: `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. Without the candidate order the configured order does not list the roadmap yet ("NOT IN ORDER … insert it after its last supplier"); the candidate order has it at line 61, after LocallyAnalyticDistributions (45) and AutomorphicFormsOnReductiveGroups (60).
- **Dependency check** (candidate order, `--movable`): `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exactly 9 warnings, all "declaration uses `sorry`", at :119, :135, :144, :156, :175, :188, :205, :223, :240.
- **Title and description.** Every sentence of the summary block and the prose was read against `README.md:3`, :7, :9, :13, :78, :84, :320–322, :351, :408–427, :462, :495, :535–537, :561–567 and the 16 declarations of `Suggested.lean`; none is contradicted. The pull request removes no heading and no declaration, so nothing is left unstated.
- **Cross-roadmap facts resolved**: 5 (main NoncommutativeGeometry :16–27, :98–106, :481, :1849–1855; OperatorKTheory §3.5 on main; the two open suppliers in the roadmap index). The worker's citation check lists nothing unresolved.
- Remark: the description's parenthesis of headlines not statable at the pins names four; the module docstring (`Suggested.lean:21–22`) names a fifth, smooth-topology approximation. Not a contradiction.
- Remark: the generated `revision-deps` block still names #1143 as merging first; it has merged (the prose says so correctly). Generated blocks are outside the text check.
- Overlap check: read NoncommutativeGeometry (main), BanachAlgebras (main; its A7 and A1–A2 clauses as cited) and AutomorphicFormsOnReductiveGroups (open); the worker's third list is empty. Shared objects and owners are unchanged: compact-finite density — CompactGroups Layer 5 with its gap, extended in AutomorphicFormsOnReductiveGroups §2.1; the locally convex projective tensor — Tau Ceti with NoncommutativeGeometry N1.Tensor; the real–complex tensor comparisons — this roadmap's §7.2a (main NoncommutativeGeometry :23 agrees); the torus seminorm comparison — NoncommutativeGeometry N6.
- Source independence: changed passages only; the diff changes no passage, so 0 passages compared; largest share `casselman2016`, 13 of 33 source mentions in the README; contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- "Closes #1144" and the description's line on AI assistance: the issue and that review are not among the texts provided.
- Dixmier–Malliavin, Bull. Sci. Math. 102 (1978), is uncertified in the manifest and was not read; no changed text cites it.

## Source issues

- none

## For the human reviewers

- The source with the largest share, `casselman2016` (`README.md:571`), is an expository note on its author's page, revision of 2016, and is not refereed. The refereed primary source, Dixmier–Malliavin 1978 (`README.md:577`), is recorded uncertified and was not read.
