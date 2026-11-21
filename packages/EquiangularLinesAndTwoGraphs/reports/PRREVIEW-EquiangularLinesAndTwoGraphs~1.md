# Review of EquiangularLinesAndTwoGraphs (pull request #2938 at 8892685)

**Verdict:** needs changes

**Summary.** Needs changes, for one false sentence: the Conventions say that an equiangular family with `α = 1` consists of the vectors `±x 0`, in a bullet that covers `ℝ` and `ℂ`, and over `ℂ` this fails (`e₁`, `i e₁`). Every stated theorem, every Check and every Lean signature was recomputed and holds, including the degenerate cases `n ≤ 2`, `d ≤ 1`, `α ∈ {0, 1}` and the junk values of division and `finrank`. There are three small corrections and three format notes, none blocking. The one cited source could not be read through the project's sources service, so no locator, wording or arrangement was compared with it; that is left to the human reviewers.

## R01 (P2) — Over `ℂ` an equiangular family with `α = 1` need not consist of the vectors `±x 0`

The Lines bullet of the Conventions (README line 63) defines `IsEquiangular 𝕜 x α` "over `𝕜 = ℝ` or `ℂ`" and then says: "A family with `α = 1` is allowed: it consists of vectors `±x 0`." An implementer who takes this as an API fact for `IsEquiangular ℂ` will try to prove something false, and 4.2 and 4.3 do use the complex case.

In `ℂ¹` take `x 0 = e₁`, `x 1 = i e₁`. Both are unit vectors and `‖⟪x 0, x 1⟫‖ = |i| = 1`, so the family is equiangular with `α = 1`, and `i e₁ ≠ ±e₁`. Equality in Cauchy–Schwarz gives only `x j = c x 0` with `|c| = 1`.

Smallest change: "it consists of unit scalar multiples of `x 0`, that is, of vectors `±x 0` over `ℝ`."

## C01 — The regular simplex is an equality case of the relative bound only for `d ≥ 2`

The first Check of 4.3 (line 408) lists "the regular simplex of `d + 1` unit vectors in `ℝ^d` with inner products `−1/d`" under equality, for every `d`. For `d = 1` this is `e₁`, `−e₁` with `α = 1`, where `d α² = 1` and the hypothesis of 4.3 fails; the next Check of the same section uses exactly this pair as the example where the bound breaks (`1 · 0 / 0 = 0 < 2`). For `d ≥ 2`, `d(1 − 1/d²)/(1 − 1/d) = d + 1`, as claimed. Add "for `d ≥ 2`".

## C02 — The Summary's equality statement for the relative bound omits `α > 0`

The Summary says equality in the real relative bound "forces the Seidel matrix to have only the eigenvalues `(n − d)/(α d)` and `−1/α`" (lines 24–26), attached to a bound stated for any family with inner products of absolute value at most `α`. Statement 5.1 assumes an equiangular family and `α > 0`, and its own Check shows `α > 0` is needed (an orthonormal basis of `ℝ²` has equality and `S² = I ≠ 0`). Equiangularity is automatic for `n ≥ 2` (equality in the chain of 4.3 forces every `|⟪x i, x j⟫| = α`), but `α > 0` is not. Insert "with `α > 0`" in the Summary sentence.

## C03 — `isInteger_of_is_root_of_monic` is stated in Mathlib for a unique factorisation domain

The supplier contract (line 630) describes it as holding "over an integrally closed domain". At the pin, `Mathlib/RingTheory/Polynomial/RationalRoot.lean` line 114 states it under the variables of line 60, `[IsDomain A] [UniqueFactorizationMonoid A]`. The use in 5.1 and 5.3 is over `ℤ`, so nothing breaks; write "over a unique factorisation domain".

## N01 — `IsRegularTwoGraph` on an infinite type

`IsRegularTwoGraph` counts with `Set.ncard`, which is `0` on an infinite set, so on an infinite `V` the complete two-graph is "regular of degree `0`". Both theorems that use it carry `[Fintype V]`; a clause in the Conventions saying the definition is meant for finite `V` would be enough.

## N02 — Checks that report a verification rather than a value

"The identity was checked for every graph on at most five vertices and every `U`" (1.2), "(checked for all switching classes on at most seven vertices)" (3.2) and similar clauses in 2.2 and 2.4 tell the reader that a computation was run, not what it gives. Where a number is stated (the `448` graphs and `14` two-graphs of 2.4) the Check stands on its own; the bare "was checked" clauses could go.

## N03 — Two remarks about the writing of the roadmap in its text

"(roadmaps of another author)" in the Scope section and "that paper was not opened and no locator into it is given" in the References describe how the roadmap was written; a reader a year from now needs neither.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Seidel matrix, `J − I − 2A` | `C₅`; path `P₃`; complement | `C₅`: `5−1−4 = 0`, `−1−2θ = ∓√5`. `P₃`: `S² = S + 2I`, eigenvalues `2, −1, −1`, trace `0`. `S(Gᶜ) = −S` | holds | none |
| 1.2 `seidelMatrix_switch` | pair inside `U`, across, outside; edgeless `K̄₄` | entry `d_u S_uv d_v` flips sign iff exactly one end in `U`; Lean `Adj ↔ (G.Adj ↔ (u∈U ↔ v∈U))` agrees; one vertex gives `K₁,₃`, two give `C₄` | holds | none |
| 2.1 `isTwoGraph_oddTriples` | 4-sets with 0, 1, 3, 6 edges; `Xor` nesting | sum of triple edge counts `= 2e`; odd triples `0, 2, 0, 4`; `Xor a (Xor b c)` true for 1 or 3 edges; labelled counts `2^C(n−1,2) = 1,1,2,8,64` | holds | none |
| 2.2 switching classes | `V` empty, 1, 2 points; infinite `V`; both directions | a triple has 0 or 2 pairs split by `U`; converse via base point `ω` needs no finiteness; `2^C(n,2)/2^(n−1) = 2^C(n−1,2)` | holds | none |
| 2.3 `S² = (n−1)I + (n−2−2a)S` | `n = 0, 1, 2`; `C₅ + K₁`; 28 lines | `S_xy (S²)_xy = n−2−2a(x,y)`; `n=2`: `S² = I`, holds iff `a=0`; `n=6, a=2`: coefficient `0`, `S² = 5I`; `n=28, a=10`: `6`, roots `9, −3` | holds | none |
| 2.4 two eigenvalues | `n = 0, 1`; `n = 4, 5, 6` | discriminant `(n−2−2a)² + 4(n−1) ≥ 0`; `n=6`: `a ∈ {0,2,4}` only (`a=1,3` give trace `≠ 0`), `2 + 720/60 = 14` two-graphs, `14·32 = 448`; `n=5`: trivial only | holds | none |
| Conventions, lines | `α = 1` over `ℝ` and `ℂ` | `ℝ`: `±x 0`. `ℂ¹`: `e₁, i e₁` has `α = 1`, `i e₁ ≠ ±e₁` | sentence false over `ℂ` | R01 |
| 3.1 Gram `= I + αS`, multiplicity `n − r` | `n = 1`; icosahedron; `e₁, −e₁, e₁`; `α = 0` | `n=1`: eigenspace of `−α⁻¹` for `S = 0` has dim `0 = 1−1`; `φ/(φ+2) = 1/√5`; path `P₃`: `−1` twice `= 3−1`; `α=0`: `J−I` has `−1` | holds | none |
| 3.2 Seidel matrix to lines | `n = 0, 1`; `θ = 0`; `P₃`; `θ` below spectrum | `n=0`: span of empty family is `⊤` in `ℝ⁰`; `n=1`: `m=0`, one unit vector in `ℝ¹`; diagonal of `S−θI` is `−θ > 0`; `θ=0, n=1`: no unit vector in `ℝ⁰` | holds | none |
| 4.1 `2n ≤ d(d+1)` | `n = 0, 1`; 28 lines; `α = 1`; infinite dimension | `n=1`: `2 ≤ 2`; `c_j(1−α²) + α²Σc = 0`; 28 lines: norm² `18+6 = 24`, products `9−6+5 = 8`, `−12+4 = −8`; `e₁,−e₁,e₁`: `6 > 2` | holds | none |
| 4.2 `n ≤ d²` | four vectors in `ℂ²` | norms `1/3 + 2/3`; products `1/3 + (2/3)ω^k = ±i/√3`, modulus² `1/3`; `4 = 2²` | holds | none |
| 4.3 relative bound | `n = 0, 1`, negative `α`; simplex `d = 1, 2`; `d = 0` | `n=1`: `d(1−α²) ≥ 1−dα²` iff `d ≥ 1`; `tr Y² = Σ − n²/d`; icosahedron `3·(4/5)/(2/5) = 6`; simplex `d≥2`: `d+1`; `d=1`: hypothesis fails | holds; Check too wide | C01 |
| 5.1 equality in the relative bound | `d = 0`; `n = 1`; `n = d ≥ 2`; `n = 0, d ≥ 1`; 28 lines; `α = 0`; `α = 1` | `n=1` forces `d=1`, `ρ=0` mult `1`, `−1/α` mult `0`; `n=d≥2` and `n=0,d≥1` contradict hypotheses; `ρ = 21/(7/3) = 9`; `e₁,−e₁,e₁`: `ρ = 2` even | holds | C02 (Summary only) |
| 5.2 `(d+2)α² = 1` | `d = 1, 2, 3, 7`; `α = 1` | `(d−1)(d+2)α² = d−1`; `4·¼`, `5·⅕`, `9·⅑`; `d=1`: `α=½` gives `¾`; `d(d+1)/2 > 2d` iff `d ≥ 4`; `d+2 = 9, 25, 49, 81` | holds | none |
| 5.3 Neumann | `d = 0`; `n = 3, d = 1`; icosahedron; classes on `n ≤ 7` | `d=0`: no unit vector, vacuous; `n−d ≥ 2`; `e₁,−e₁,e₁`: `m = 1`; `n ≤ 7`: rank `r ≤ 3` forces `α = 1`, edgeless class, `n−1 > n/2` for `n = 3..7`: five | holds | none |

- Source locators checked against the text: 0 of 13 (the source could not be read; see Not verifiable).
- Library declarations opened at the pin: 24, among them `Matrix.gram` (`Analysis/InnerProductSpace/GramMatrix.lean:40`), `posSemidef_gram` (`:83`), `gram_eq_conjTranspose_mul` (`:131`), `charpoly_units_conj` (`LinearAlgebra/Matrix/Charpoly/Basic.lean:291`), `IsHermitian.charpoly_eq` (`Analysis/Matrix/Spectrum.lean:157`), `InnerProductSpace.rankOne` (`Analysis/InnerProductSpace/LinearMap.lean:303`), `isInteger_of_is_root_of_monic` (`RingTheory/Polynomial/RationalRoot.lean:114`), `TauCeti.rankOneHermitianProjector` and `TauCeti.trace_rankOneHermitianProjector` (`LinearAlgebra/Projectivization/HermitianProjector.lean:78`, `:138`); one description inexact (C03).
- Duplication by object: no Seidel matrix, two-graph, switching or equiangular family in the pinned Mathlib or Tau Ceti, nor in any roadmap on main or at an open head other than this one.
- Cross-roadmap statements resolved at the open heads: StronglyRegularAndMooreGraphs 1.5 (`2n ≤ f(f+3)`), LinearAlgebraMethodInCombinatorics 3.1 and its out-of-scope list (equiangular lines named there), SpectralGraphBounds Layer 1; none is cited as a supplier.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with 14 `sorry` warnings and nothing else; the elaborated types of all 23 declarations were compared with the README; the two dropped `[DecidableEq V]` binders (`IsTwoGraph`, `IsRegularTwoGraph`) are unused by those definitions.
- One-tactic probe (`simp`, `rfl`, `simp` with the definitions unfolded, `decide`, `aesop`) on a copy: none of the 14 theorems closes; no padding. All headline theorems of the README are stated.
- Pull request text: title and description agree with the head (14 theorems, 9 definitions, new roadmap, no roadmap supplier).

Overlap check: read StronglyRegularAndMooreGraphs, SpectralGraphBounds, LinearAlgebraMethodInCombinatorics, PeriodicNonnegativeMatrices, LaplacianEigenvaluesOfGraphs, LovaszThetaFunction (headings and scope); nothing shared. Seidel's absolute bound for strongly regular graphs is owned by StronglyRegularAndMooreGraphs 1.5 and is a different statement from 4.1.

Source independence: 0 passages compared with 1 source, because its text could not be read; largest share Brouwer–Haemers, 13 of 13 locators; contents not compared. By the README's own locators, Layer 1 draws on §1.8.2, Layer 2 on §10.2–10.3 and Layers 3–5 all on §10.6, so the five layers are not one section each; the order is forced by the dependency lines (2 and 3 need 1; 5 needs 3 and 4).

Research link: Rests on the README. The targets are the theory of Lemmens and Seidel, Equiangular lines (1973), as presented by Brouwer and Haemers; the README's scope names what builds on it: de Caen's constructions, the maximum at angle `arccos(1/3)`, `d²` complex equiangular lines, Delsarte–Goethals–Seidel bounds.

## Not verifiable

- All 13 locators into Brouwer–Haemers, *Spectra of Graphs* (the seeded sample 1.1–5.3: §1.8.2, Proposition 10.1.1, §10.2 and its table, Theorem 10.3.1, §10.6.1, Theorem 10.6.1, Propositions 10.6.2–10.6.4, Theorem 10.6.4a, and the attributions to Gerzon and Neumann): the sources service refused the first author's page given in the References as not shown to be an author's page, and the published book resolves only to a paywalled page. No other copy was sought.
- The claims that the source states 4.3 only for `n > 1`, 3.1 and 5.3 only for `0 < α < 1`, and remarks the passage from equality to its hypothesis in 5.1 without proof: same reason. The mathematics of each statement was verified independently of the source.

## Source issues

- none

## For the human reviewers

- **Licence.** The only source is the authors' version of Brouwer–Haemers at `homepages.cwi.nl/~aeb/math/ipm/ipm.pdf` (README References); the sources service could not classify that host as an author's page.
- **Not tested.** Brouwer–Haemers carries 13 of 13 locators and could not be read: wording, arrangement and locators were not compared with it.
- **Scope.** Every locator is to one textbook; the primary paper (Lemmens–Seidel, 1973) is named in the References as not consulted.
