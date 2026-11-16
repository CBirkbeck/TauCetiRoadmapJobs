# Review of LatticePackingsAndPerfectForms (pull request #1723 at cbcf644)

**Verdict:** accepted

Incremental re-review of 25 changed lines since `5efad72` (`README.md` only: the sphere-packing bullet of *Not owned here*, one sentence of 4.11, one entry of References). No finding.

## Previous findings

- none: the previous report, of `5efad72`, had no finding to carry.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| `README.md:183–187`: LeanPool's `PackingBound.lean` proves the Cohn–Elkies bound for arbitrary packings | `LinearProgrammingBound` at commit `f8b9b72` | Hypotheses there: `0 < d`, `f ≠ 0`, `f` and `𝓕 f` real, `(f x).re ≤ 0` for `‖x‖ ≥ 1`, `(𝓕 f x).re ≥ 0`; conclusion `SpherePackingConstant d ≤ f(0)/f̂(0) · vol ball 0 (1/2)`. README's `f̂(0) > 0` implies `f ≠ 0` | Pass |
| `README.md:187–188`: the `d`-th root of the infimum tends to `√(e/(2π))` | `PackingBounds.FullMain.exact_limit`, `fullLinearProgram` in `Conclusion.lean` | `fullLinearProgram d = unitBallVolume d / 2^d · sInf` of `f(0)/f̂(0)` over non-radial admissible `f` with `f̂(0) > 0`; limit `√(exp 1 / (2π))` ≈ 0.6577, `log₂` ≈ −0.6044 | Pass |
| `README.md:188–190`: the packing bound gives `centerDensity_le_cohnElkies` (`Suggested.lean:422`) by scaling | lattice of minimum `m`, determinant `D`, `g(x) = f(r x)`; Leech; `n = 1` | Scaled lattice: density `vol B(1/2) · m^{n/2}/√D`; `g(0) = f(0)`, `ĝ(0) = r⁻ⁿ f̂(0)`, so `(√m/2)ⁿ/√D ≤ (r/2)ⁿ f(0)/f̂(0)`. Leech, `r = 2`: `1 ≤ 1`. `n = 1`: `δ = 1/2 ≤ (r/2) f(0)/f̂(0)` | Pass |
| `README.md:1406–1408` (4.11): "formalizations named under *Not owned here* are provenance" | `README.md:181–183`, `:1428–1432` | Both repositories are named in that bullet; the `*Needs:*` line of 4.11 lists ThetaSeries Layer 1, Mathlib and Tau Ceti only, no external repository | Pass |
| `README.md:2153–2156` (References entry) | repository at `f8b9b72` | `lean-toolchain`: `leanprover/lean4:v4.35.0`; `LICENSE`: Apache-2.0; `NOTICE`: SpherePacking upstream `openai/ten-proofs`; both files exist under `LeanPool/SpherePacking` | Pass |
| Description: "The dimension-24 bound follows the Cohn–Elkies route using the existing sphere packing formalisation" | `README.md:182`, `:2152` | `math-inc/Sphere-Packing-Lean` is still named as provenance for the dimension-24 function; the added LeanPool folder covers the general bound only, so the sentence stands | Pass |

The rows of the earlier reviews, of `5efad72`, stand for every other statement of the folder: no statement of `Suggested.lean` changed.

- External declarations opened: 2 files of LeanPool at the cited commit (`LinearProgrammingBound`, `LinearProgrammingBound'`, `fullLinearProgram`, `FullAdmissible`, `exact_limit`), plus its `NOTICE`, `LICENSE` and `lean-toolchain`.
- Ownership: no roadmap on main or at an open head states a Cohn–Elkies bound (searched `Cohn.Elkies`, `SpherePacking`); ThetaSeries on main cites `math-inc/Sphere-Packing-Lean` as a migration source for its own layers only. 4.11 remains the single owner of the lattice bound.
- Title and description read against the head: none of the 14 sentences and bullets contradicted; the change adds no supplier, section or declaration, so nothing is left unstated. `git diff --stat origin/main...HEAD` outside the folder: empty.
- Gate at this head (the worker's): every check 0, including `build=0`, `depcheck=0`, `readme-ids-missing=0`, `outside-folder=0`; OK.
- Dependency check, run this round: `depcheck: 250 roadmaps, 2380 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration, run this round: `lake env lean` on `Suggested.lean` exits 0 with 53 messages, all `declaration uses sorry`.
- Overlap check: read IntegralLattices, GeometryOfNumbersAndQuadraticArithmetic, OrthogonalTamagawaAndLatticeMass, ThetaSeries, SuccessiveMinima, Rank24LatticeConstructions as compared in the earlier rounds; nothing shared (`overlaps.md`: no pull request changing this roadmap, no dropped or revision-only id).
- Source independence: changed passages only; 3 passages compared with 1 source (the declarations and headers of LeanPool's two files), none shared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The proofs in LeanPool's `PackingBound.lean` and `Conclusion.lean` were not built: only the statements, definitions and headers were read at the cited commit.
- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts": a statement about other pull requests, outside what this review reads.
- Conway–Sloane, *SPLAG*, Ch. 23 and Ch. 25: paywalled, cited by locator, as in the earlier reports.
- The LMFDB record `3.4.8.1.2` for `A₃`: only the label prefix was checked, as in the earlier reports.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md:182` names `math-inc/Sphere-Packing-Lean` as provenance for 4.11 and `README.md:2152` lists it under References; its licence was not read. `Suggested.lean` states `centerDensity_le_cohnElkies`, `exists_leech_auxiliary` and `hermiteConstant_twentyFour` from 4.11.
- **Licence.** `README.md:2153–2156` cites LeanPool's `LeanPool/SpherePacking` (Apache-2.0 per its `LICENSE` and file headers; copyright S. Hariharan and OpenAI). `Suggested.lean:422` differs from its `LinearProgrammingBound` in name, binders, carrier and conclusion.
