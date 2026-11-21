# Review of EquiangularLinesAndTwoGraphs (pull request #2938 at 617387c)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review (the `α = 1` sentence, false over `ℂ`) is repaired, as are its three small corrections and three format notes, and the 61 changed lines introduce no new defect. Every changed sentence was recomputed; there is one format note, not blocking. The single cited source still could not be read through the project's sources service, so its locators, wording and arrangement remain unchecked: that, and the status of the copy the README links, are left to the human reviewers.

## N01 — The second Check of 1.2 now asserts two general facts rather than a computed value

With the "(checked for …)" clauses gone, "Switching with respect to `U` and with respect to its complement give the same graph, and every switching class on `n ≥ 1` labelled vertices has exactly `2^(n − 1)` members" (README line 122) is a true general statement, the first half of which the Conventions already state. It would read as a Check with one value, for example "on four vertices each class has `8` members, so the `64` graphs fall into `8` classes"; or it could move to the prose of 1.2.

## Previous findings

- R01 — repaired: "it consists of the multiples `c • x 0` with `‖c‖ = 1`, that is, of the vectors `±x 0` over `ℝ`" (Conventions, line 64).
- C01 — repaired: "for `d ≥ 2`, the regular simplex of `d + 1` unit vectors in `ℝ^d` with inner products `−1/d`" (4.3, line 407).
- C02 — repaired: "equality in the real relative bound with `α > 0` forces the Seidel matrix to have only the eigenvalues `(n − d)/(α d)` and `−1/α`" (Summary, line 24).
- C03 — repaired: "a root in the fraction field of a monic polynomial over a unique factorisation domain lies in the domain" (supplier contracts, line 629).
- N01 — repaired: "It is meant for finite `V`: `Set.ncard` is `0` on an infinite set" (Conventions, line 57).
- N02 — repaired: no "checked" clause remains; the Checks of 1.2, 2.2, 2.4 and 3.2 state values or facts (see N01 above for one of them).
- N03 — repaired: "(roadmaps of another author)" and "that paper was not opened and no locator into it is given" are gone.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, `α = 1` family | `ℝ¹`: `e₁, −e₁`; `ℂ¹`: `e₁, i e₁` | Cauchy–Schwarz equality gives `x j = c • x 0`, `‖c‖ = 1`; `c = i` allowed over `ℂ`, `c = ±1` over `ℝ` | holds | none |
| Conventions, `IsRegularTwoGraph` on infinite `V` | `V = ℕ`, `Δ` all triples | pair lies in infinitely many triples; `Set.ncard = 0`; Lean body uses `.ncard` (`Suggested.lean` line 102) | sentence true | none |
| 1.2 Check, `D (J − I) D` on `K̄₄`, `U = {u}` | entries `(u,v)`, `(v,w)`, diagonal | `d_u d_v = −1`, `d_v d_w = +1`, diagonal `0`; `−1` marks adjacency: star centred at `u` | holds | none |
| 1.2 Check, class size `2^(n − 1)` | `n = 1, 2, 4` | switch by `U` fixes `G` iff `U ∈ {∅, V}`; fibres `{U, Uᶜ}`: `2ⁿ/2 = 1, 2, 8` | holds | N01 (form) |
| 2.2 Check, `1 ≤ n ≤ 6` | `n = 1, 4, 6`; `n = 0` | `n=1`: `1` graph, `2^C(0,2) = 1`; `n=4`: `64/8 = 8`; `n=6`: `32768/32 = 1024`; `n=0` excluded (`C(−1,2)`) | holds | none |
| 4.3 Check, simplex for `d ≥ 2` | `d = 1, 2, 3` | `d=2`: `2·(3/4)/(1/2) = 3`; `d=3`: `3·(8/9)/(2/3) = 4`; `d=1`: `dα² = 1`, now excluded | holds | none |
| Summary, equality in the relative bound with `α > 0` | orthonormal basis of `ℝ²` (`α = 0`); icosahedron | `α=0`: equality `n = d = 2`, `S² = I`, `(n−d)/(αd) = 0/0`, excluded by `α > 0`; icosahedron: `3/(3/√5) = √5`, `−√5`, multiplicities `3, 3` | holds | none |
| Summary, lines and Seidel matrices (real space) | `e₁, −e₁, e₁` in `ℝ¹` | sign graph `P₃`, eigenvalues `2, −1, −1`; `−1/α = −1` with multiplicity `2 = 3 − 1` | holds | none |
| Supplier contract, `isInteger_of_is_root_of_monic` | declaration at the pin | variables `[IsDomain A] [UniqueFactorizationMonoid A]`, conclusion `IsInteger A r` (`Mathlib/RingTheory/Polynomial/RationalRoot.lean` lines 60, 114) | description exact | none |

The rows for the statements the change does not touch stand as in the previous review, of `8892685`.

- Changed passages read: all 11 hunks of the README; `Suggested.lean` is unchanged since `8892685`.
- Source locators checked against the text: 0 (the change adds none; the source remains unreadable, see Not verifiable).
- Library declarations opened at the pin: 1, `isInteger_of_is_root_of_monic` (`Mathlib/RingTheory/Polynomial/RationalRoot.lean:114`, variables at `:60`).
- Cross-roadmap citations: none added or changed; the names kept in the Scope section (SpectralQuantumWalks, EquitableOperatorReduction, DiscreteQuantumWalks) are not suppliers; no id cited that an open pull request drops.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with 14 `sorry` warnings and nothing else.
- Pull request text: the title and description still describe the head (new roadmap, 14 theorems, 9 definitions, no roadmap supplier); the repairs change nothing they state.

Overlap check: read StronglyRegularAndMooreGraphs, SpectralGraphBounds, LinearAlgebraMethodInCombinatorics, PeriodicNonnegativeMatrices, LaplacianEigenvaluesOfGraphs, LovaszThetaFunction (as in the previous review; the change touches no owned object); nothing shared.

Source independence: changed passages only; 0 passages compared with 1 source, because its text could not be read; largest share Brouwer–Haemers, 13 of 13 locators; the change adds, removes or reorders no layer, so the arrangement was not compared again. The changed sentences are the roadmap's own repairs and computed Checks, none attributed to the source.

Research link: Rests on the README. The targets are the theory of Lemmens and Seidel, Equiangular lines (1973), as presented by Brouwer and Haemers; the README's scope names what builds on it: de Caen's constructions, the maximum at angle `arccos(1/3)`, `d²` complex equiangular lines, Delsarte–Goethals–Seidel bounds.

## Not verifiable

- All 13 locators into Brouwer–Haemers, *Spectra of Graphs* (§1.8.2, Proposition 10.1.1, §10.2, Theorem 10.3.1, §10.6.1, Theorem 10.6.1, Propositions 10.6.2–10.6.4, Theorem 10.6.4a, the attributions to Gerzon and Neumann): the sources service again refused the page given in the References as not shown to be an author's page, and the published book is paywalled. No other copy was sought. None of these locators is in a changed passage.

## Source issues

- none

## For the human reviewers

- **Licence.** The only source is the authors' version of Brouwer–Haemers at `homepages.cwi.nl/~aeb/math/ipm/ipm.pdf` (README References); the sources service could not classify that host as an author's page.
- **Not tested.** Brouwer–Haemers carries 13 of 13 locators and could not be read: wording, arrangement and locators were not compared with it.
- **Scope.** Every locator is to one textbook; the primary paper (Lemmens–Seidel, 1973) is named in the References with no locator into it.
