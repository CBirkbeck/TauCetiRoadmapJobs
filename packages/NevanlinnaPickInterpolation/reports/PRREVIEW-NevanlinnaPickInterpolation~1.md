# Review of NevanlinnaPickInterpolation (pull request #2846 at e87931e)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and convention was recomputed (the Schur step and its division-by-zero cases, Schur's theorem, Pick's theorem with repeated nodes, the uniqueness and rank statements, the coefficient criterion), and every locator into Simon and Sarason was read at its place and supports what is cited. There is one format note, not blocking, and nothing is left for a human to decide beyond the final approval.

## N01 — Two linear-algebra steps of the routes in 3.2, 3.3, 4.2 and 4.3 are not pinned declarations and are not named in the `*Needs:*` lines

The routes use (a) "positive definiteness of the matrix is equivalent to `|w₁| < 1` together with positive definiteness of `Q`" (3.2, line 326; likewise 4.2) and (b) "the rank of the matrix is `1 + rank Q`" (3.3, line 352; likewise 4.3). At the pin, `Mathlib/LinearAlgebra/Matrix/PosDef.lean` has the Schur-complement criterion only for `PosSemidef` (`Matrix.PosDef.fromBlocks₁₁`, line 649), and Mathlib has no statement on the rank of a `fromBlocks` matrix; the cited `Matrix.rank_mul_eq_left_of_isUnit_det` and `Matrix.rank_mul_eq_right_of_isUnit_det` give only `rank (D Q Dᴴ) = rank Q`. Both steps are short (block elimination by a unitriangular congruence), so a clause in each route saying that the positive definite form of the Schur complement and the additivity of rank over the block `[1]` are proved in place would tell an implementer that they are not to be looked for in the library.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 Schur functions | `(1+z)/2`, `2z` at `3/4`, `conj z` | `|(1+z)/2| ≤ 1`; `2·3/4 = 3/2 > 1`; `conj` not holomorphic | sound; Simon (2.5) read |
| 1.2 Schur step | `f = z`; constant `1`; `(z+a)/(1+ā z)`, `a = i/2`; `(1+z)/2` | step `1`; step `0` (0/0 at 0, Lean-checked); step `1`, unconjugated variant `3/(5−4iz) = 3/5 + 12i/25 z − 48/125 z²`; `2/(3−z)` | sound |
| 1.3 inverse step | `γ = 2, g = 0`; `γ = 1, g = 1`; value at 0 of step of unstep | constant `2` (Lean-checked); `1` on disc, step `0 ≠ 1`; `(1−|γ|²)g(0)/(1−|γ|²) = g(0)` | sound; hypothesis `|γ|<1` needed |
| 2.1 Schur parameters | `z`, `z²`, `z/2`, `(1+z)/2` | `0,1,0…`; `0,0,1,0…`; `0,1/2,0…`; iterate `2/((2n+1)−(2n−1)z)` verified by induction, `γₙ = 2/(2n+1)` | sound |
| 2.2 uniqueness | `z/2` vs `(z+z²)/2` | `γ₀ = 0, γ₁ = 1/2` both; `γ₂ = 0` vs `2/3` | sound; Simon (3.6), (3.8), Lemma 3.2 read |
| 2.3 existence | terminating sequence `0,1,0…`; sequence `0,2,0…` | gives `z`; not a Schur sequence in either disjunct | sound; Simon (3.9) read |
| 2.4 Blaschke iff | `n = 0`; `z²`; function `1` at 0, `0` elsewhere | both sides: unimodular constant; `0,0,1`; `|γ₀| = 1` but not constant, so `hf` needed | sound; leading coefficient `c − a∏(−āᵢ) ≠ 0` checked |
| 3.1 Pick's theorem | `n = 0`; `n = 1`; `z=(0,1/2)`, `w=(0,1/4)`, `(0,3/5)`; repeated `z=(0,0)`, `w=(0,1/2)` | empty PSD; `(1−|w|²)/(1−|z|²)`; det `1/4`; entry `64/75`, det `−11/75`; minor `−|wᵢ−wⱼ|²/(1−|z|²)² = −1/4` | sound; Hermitian checked; Schur complement `= D Q Dᴴ` recomputed |
| 3.2 uniqueness iff not PD | `n = 0`; `w=(0,1/4)`; `w=(0,1/2)`; `z₁ = 2, w₁ = 0`; `z=(0,0)=w` | empty matrix PD (Lean-checked), not unique; `z/2`, `z²` both; only `z`; `[−1/3]`, `0` and `(z−2)/4` both; singular, `0` and `z/2` both | sound; both hypotheses needed |
| 3.3 degree = rank | `z=(0,1/2)=w`; `|w₁| = 1`; `z=(0,0)=w` with `z/2` | rank 1, `f = z`; matrix `0`, degree 0; rank 1 but `z/2` not Blaschke | sound; rank `min(n,r)` confirmed via evaluations on the `r`-dimensional model space |
| 3.4 Pick kernels | `conj z` at `0, 1/2, i/2`; two points; `2z` at `3/4` | `u = 15/17 − 8i/17`, det `−|u−1|² = −4/17`; `[[1,u],[ū,1]]` det 0; entry `(−5/4)/(7/16) < 0` | sound |
| 4.1 coefficient criterion | `n = 0`; `n = 1`; `c=(1/2,1)`; `c=(1/2,1/2)`; `|c₀| = 1` | `[1−|c₀|²]`; det `(1−|c₀|²)² − |c₁|²`; `[[−1/4,−1/2],[−1/2,3/4]]`; det `5/16`, `(3+4z)/(6+2z)` has `f(0)=f′(0)=1/2`; forces `c₁=…=0` | sound; congruence identity and block form `diag(1−T_dᴴT_d, [1])` recomputed; Sarason §3 read |
| 4.2 uniqueness | `c=(0,1)`; `(3/5,16/25)`; `(3/5,13/20)`; `(1,0)`; `(1,1/10)` | `diag(0,1)`; det `(16/25)² − (16/25)² = 0`; det `< 0`; `0`; entry `−1/100` | sound |
| 4.3 degree = rank | `c=(0,1)`; `(1,0)`; `zʳ` with `n ≥ r`; degree 1, `n = 2` | rank 1; rank 0; `1 − TᴴT` a projection of rank `r`; `1 + rank(0) = 1` | sound |
| N01 (3.2, 3.3, 4.2, 4.3 routes) | search of pinned Mathlib for PD Schur complement and rank of `fromBlocks` | only `PosSemidef` form at `PosDef.lean:649`; no rank lemma on `fromBlocks` | format note |

- Source locators checked against the text: 15 (Simon2005: (2.5) p. 3 line 139, (2.9) p. 4 line 166, sequence space p. 6 line 256, (3.1)–(3.2) p. 7 lines 344–351, (3.6), (3.8), Lemma 3.2, (3.9) p. 8 lines 382–405; Sarason1967: §3 p. 186 lines 302–313, §4 pp. 186–188 lines 328–381, §5 Corollary p. 189 lines 410–420, bibliography years lines 914–979).
- Library declarations opened at the pins: 22 (Mathlib `Schwarz.lean:234`, `AbsMax.lean:283`, `RemovableSingularity.lean:60`, `TaylorSeries.lean:72`, `Liouville.lean:47`, `LocallyUniformLimit.lean:136`, `PosDef.lean:62, 176, 311, 433, 467, 624, 649`, `Rank.lean:263, 281`, `Reproducing.lean:63, 282`, `CanonicalDecomposition.lean:54`, `Topology/Bases.lean:350`; Tau Ceti `PseudoHyperbolic.lean:237`, `Moebius.lean:33, 83, 101, 204`, `Montel/Basic.lean:58`, `SchwarzPick/Basic.lean:120`, `SchwarzPick/Derivative.lean:100`); every cited name and stated hypothesis agrees.
- Cross-roadmap citations resolved: ConformalMappingPartII 3.1 and 3.2 on main (boundary factor a unimodular constant; `|B| < 1` with an interior zero), Completed/ConformalMapping Layer 2, DiracScatteringAndNonlinearFourierTransform 4.5, OperatorTheory/ToeplitzOperators, RepresentationTheory/SchurWeyl, and the open PositiveDefiniteSequencesAndToeplitzForms 5.1–5.2 with its scope exclusion.
- Automatic checks: all passed. Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/NevanlinnaPickInterpolation/Suggested.lean`: 13 `declaration uses sorry` warnings and nothing else. Elaborated signatures of all 21 declarations compared with the README: same generality, no binder lost (the file has no `variable`).
- One-tactic probe (`rfl`, `simp`, `simp_all`, `infer_instance`, `simp` with all eight definitions unfolded) on a scratch copy: none of the 13 theorems closes; no padding.
- Headline theorems (Schur's theorem 2.2–2.4, Pick's theorem 3.1–3.3, Pick kernels 3.4, the coefficient problem 4.1–4.3): all stated; none unstatable.
- Pull request text read against the head: adds a new roadmap, 13 theorems and 8 definitions as stated, suppliers and locators as stated; nothing contradicted.

Overlap check: read PositiveDefiniteSequencesAndToeplitzForms, OperatorMonotoneFunctionsAndMatrixMeans, ConformalMapping, ConformalMappingPartII, DiracScatteringAndNonlinearFourierTransform; finite Blaschke products are shared with ConformalMappingPartII, which owns them (3.1–3.2), this roadmap keeping only a degree-recording predicate on the disc that cites it; nothing else shared. No other roadmap, on main or open, states the Schur algorithm, Pick's theorem or the bounded coefficient problem; no fully qualified name of `Suggested.lean` occurs elsewhere.

Source independence: 9 passages compared with 2 sources, none shared; largest share Simon2005, 12 of 20 locators; contents compared with Simon2005 (eleven sections on orthogonal polynomials on the circle, of which Layers 1–2 use part of §§2–3) and with Sarason1967 (§§3–5, which Layers 4 and 3 meet in the opposite order and by a different route): independent.

Research link: Layers 3–4 are the classical cases of Sarason's generalized interpolation theorem (Sarason 1967, §§3–5), the origin of commutant lifting; Layers 1–2 are the Schur algorithm underlying Verblunsky's and Geronimus' theorems for orthogonal polynomials on the circle (Simon 2005, §3). Rests on the two sources read and the README's scope section.

## Not verifiable

- none

## Source issues

- **Misprint** in Sarason1967 at §3, first sentence, p. 185: the source says the Carathéodory problem is given n complex constants and then lists them as c₀, c₁, …, cₙ; it should be n + 1 constants; affects nothing.

## For the human reviewers

- none
