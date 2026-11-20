# Review of StronglyRegularAndMooreGraphs (pull request #2700 at 99ef5e6)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route step was found false. Every theorem of `Suggested.lean` was tested on all labelled graphs with at most six vertices under Mathlib's `IsSRGWith` convention, and every printed number was recomputed. There are two small corrections and one format note, none blocking. The two Brouwer books, which carry 21 of the 22 source locators, could not be read through a legal channel here, so their locators and the wording and arrangement comparison against them are left to the human reviewers; the Erdős–Rényi–Sós locator was verified against the text.

## C01 — The supplier contract places `irrational_sqrt_natCast_iff` in a file that does not exist at the pin

An implementer who opens the file named in "From Mathlib" (README line 546, `Mathlib/Data/Real/Irrational.lean`) finds nothing. At the pinned Mathlib the declaration is in `Mathlib/NumberTheory/Real/Irrational.lean`, line 129, with the statement the README gives (`Irrational (√n) ↔ ¬IsSquare n`). Replace the path; the name and the statement are right.

## C02 — In the boundary with LinearAlgebraMethodInCombinatorics, "carried out there" reads as the other roadmap

In "Scope and ownership" (README lines 498–500) the sentence "its route bounds a two-distance set on a sphere by the different number `f(f + 3)/2` and is carried out there" stands inside the bullet about LinearAlgebraMethodInCombinatorics, so "there" reads as that roadmap. Its 3.1 states only Blokhuis's bound `(n + 1)(n + 2)/2` for Euclidean two-distance sets; the spherical count is the route of 1.5 of this roadmap. Writing "and is carried out in 1.5" removes the ambiguity.

## N01 — Status phrases about other roadmaps will go out of date

"(a roadmap not on main)", "(an open roadmap, not on main)" and "(an open roadmap of another author, not on main)" in the Summary, in 1.3 and in "Scope and ownership" describe the state of other pull requests on one day. Naming the roadmap and its section, and saying that this roadmap does not depend on it, is enough.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: `IsSRGWith` on `⊤`, `⊥` | `K₅`, edgeless, `n ≤ 1` | pin: `IsSRGWith.top` gives `(n, n−1, n−2, μ)` any `μ`; `bot_strongly_regular` gives `(n, 0, ℓ, 0)` any `ℓ`; `n ≤ 1`: `⊥ = ⊤` | true | none |
| Conventions: `mooreBound` | `k = 0, 1, 2`; `d = 0, 2` | `1`; `2` (`0⁰ = 1`); `2d + 1`; `1 + k²` proved for all `k` in Lean probe; `3,2 ↦ 10`, `7,2 ↦ 50`, `57,2 ↦ 3250` by `decide` | true | none |
| 1.1 imprimitive graphs | `3K₄`, `K_(2×10)`, `Kₙ`, edgeless, pentagon | `μ = 0`: classes `k + 1 = 4`; `μ = k`: `param_eq` gives `n = 2k − ℓ`, complement `μ′ = 0`; `20 = 2·10 − 0` | true | none |
| 1.2 spectrum `{k, r, s}`, `s < r < k` | Petersen, pentagon, `K_(3×3)`, `K₅` (5,4,3,1), `3K₄`; all SRG on ≤ 6 vertices (40 labelled) | `Δ = 9, 5, 9, 16, 16`; `(r, s) = (1,−2)`, `((√5−1)/2, −(√5+1)/2)`, `(0,−3)`, `(3,−1)`, `(3,−1)`; `K₅` spectrum `{4,−1}` lacks `3`; `3K₄` has `r = k` | true; both controls fail as stated | none |
| 1.3 multiplicities, Frame quotient | Petersen, Hoffman–Singleton, `(3250,57,0,1)`, `(7,3,1,1)`, `3K₄` | `2f·3 = 30`, `2g·3 = 24`; `2f·5 = 245 + 35 = 280`, `f = 28`, `g = 21`; `2f·15 = 48735 + 3135`, `f = 1729`, `g = 1520`; `(f−g)√8 = −6`; `5·4·9 = 180 = 10·3·6` | true | none |
| 1.4 conference or integral | pentagon, Paley 13, Paley 9, Petersen; route `f = g` | `Δ = 5, 13, 9, 9`; `(μ−ℓ)(n−1) = 2k < 2(n−1)` forces `μ − ℓ = 1`, `n = 2k + 1`, then `k = 2μ`; conference case `2k + (n−1)(ℓ−μ) = 4μ − 4μ = 0`, `f = g = 2μ` | true | none |
| 1.5 absolute bound | pentagon, Petersen, `(28,9,0,4)`, `K_(2×10)`, `K₅`; projector entries | `10 ≤ 10`; `20 ≤ 40, 28`; `Δ = 36`, `r = 1`, `s = −5`, `f = 21`, `g = 6`, `56 > 54`; `g = 1`, `40 > 4`; `f = 0`; diagonal of `(A−kI)(A−sI)` is `k + ks` | true; controls fail as stated | none |
| 2.1 friendship ⇔ windmill (Lean form) | all graphs on 1–6 vertices; 1 and 2 vertices by hand | both sides agree on all 33,867 labelled graphs; hypothesis holds only for 1, 3, 5 vertices (1, 1, 15 labelled windmills); two vertices: both sides false | true | none |
| 2.1 route | `ℓ = μ = 1` | `Δ = 4(k−1)`, `(f−g)²(k−1) = k²`, so `k − 1 ∣ 1`, `k = 2`, `n = 3` | true | none |
| 3.1 `n ≤ mooreBound k D` | all connected graphs ≤ 6 vertices, `k` from max degree to max + 2; two isolated vertices | no violation; control: `D = 0`, `2 > 1` | true | none |
| 3.2 `mooreBound d t ≤ n` | all graphs ≤ 6 vertices, all `d ≤` min degree, all `t` with `2t + 1 ≤` girth (forests: all `t`) | no violation; `d = 1`, `t ≥ 1`: `2 ≤ n` | true | none |
| 3.3 equality ⇔ regular and girth | same graphs, same `k`; one vertex | equality cases: `K₂`–`K₆`, pentagon (12 labelled), none else; both directions agree; one vertex `k = 1`: `1 = 1` but not 1-regular | true | none |
| 3.4 diameter-two Moore graphs are SRG | all graphs ≤ 6 vertices; `K_(3,3)`, `C₆` | only the 12 pentagons satisfy the hypotheses, each `(5,2,0,1)`; `6 < 10`; diameter 3 | true | none |
| 3.5 Hoffman–Singleton | all graphs ≤ 6 vertices with free `ℓ`, `μ` where vacuous; `K₂`; route | only `(5,2)` occurs; `K₂` is `(2,1,0,1)` and `⊤`; `4k = (2r+1)² + 3`, `16k(k−2) ≡ 3·(−5) = −15`, `2r+1 ∈ {1,3,5,15}`, `k = 1, 3, 7, 57` | true | none |
| C01 | pin | `Mathlib/NumberTheory/Real/Irrational.lean:129`; no `Mathlib/Data/Real/Irrational.lean` | path wrong | C01 |
| C02 | LinearAlgebraMethodInCombinatorics 3.1 at its head | states `#P ≤ (n+1)(n+2)/2`; no `f(f+3)/2` | ambiguous pointer | C02 |

- Source locators checked against the text: 1 of 22 (Erdős–Rényi–Sós, Theorem 6: ErdosRenyiSos lines 944–947, printed p. 234; proof through a finite plane geometry, lines 982–990, p. 235, as the README says). The other 21 are in the two Brouwer books (below).
- Library declarations opened at the pin: 27, all present with the stated shape except the path of C01; among them `StronglyRegular.lean` 51–55 (`IsSRGWith`), 61, 70, 87, 160, 169, 206; `AdjMatrix.lean` 380, 398; `LapMatrix.lean` 57, 60; `Analysis/Matrix/Spectrum.lean` 71, 83, 240; `Eigenspace/Basic.lean` 423, 525; `Eigenspace/Matrix.lean` 136; `Diam.lean` 265, 271, 278; `Metric.lean` 66; `Girth.lean` 31, 38, 90. `Archive/Wiedijk100Theorems/FriendshipGraphs.lean` 331 is `Theorems100.friendship_theorem`.
- Duplication by object: no Moore bound, friendship theorem (outside the Archive), Hoffman–Singleton theorem or SRG spectrum in the pinned Mathlib or Tau Ceti; none in a roadmap on main or at an open head other than this one.
- Cross-roadmap citations resolved: SpectralGraphBounds 1.4 (multiplicity of the degree equals the number of components, for its sorted list) and its exclusion of strongly regular graphs; LinearAlgebraMethodInCombinatorics 3.1; SpectralQuantumWalks (nothing on strongly regular or Moore graphs). None is a supplier.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (10 theorems). `#check @name` for all 15 declarations: every theorem keeps `Fintype V`, `DecidableEq V`, `DecidableRel G.Adj` and its stated hypotheses; types agree with the README statements; nothing changed.
- One-tactic probe (`rfl`, `simp`, `omega`, `simp` with the definitions unfolded, `infer_instance`, `exact?`): none of the 10 theorems closes. No padding found. All ten headline statements of the README are stated; none is declared not statable.
- Automatic checks: all passed at this head; the pull request's text agrees with the head (new roadmap, 10 theorems, 5 definitions, single `import Mathlib`, no supplier roadmap).

Overlap check: read SpectralGraphBounds, MatchingPolynomial, GraphColouring, HamiltonianCycles, MatchingTheory (no roadmap on main is close); one shared object, the simplicity of the degree eigenvalue of a connected regular graph: SpectralGraphBounds 1.4 owns the general statement (multiplicity equals the number of components, on its sorted eigenvalue list); this roadmap keeps only the strongly regular case as a clause of 1.3, on eigenspace dimensions, and says so. Nothing else shared.

Source independence: 2 passages compared with 1 source (ErdosRenyiSos, statement and proof route of Theorem 6), none shared beyond what the hypothesis forces; largest share Brouwer–Haemers, 17 of 22 locators, whose text and table of contents could not be read, so wording and arrangement were not compared with it. By the README's own locators, Layer 1 draws on one section (§9.1) in an order the dependencies force (1.2 → 1.3 → 1.4 → 1.5), Layer 2 on other sources and Layer 3 on §12.7 and §9.1.7.

Research link: Per the README, the targets are Hoffman and Singleton's 1960 theorem on Moore graphs of diameter two (the degree-57 case is recorded as open), Seidel's absolute bound, and the friendship theorem of Erdős, Rényi and Sós (1966, read); the Damerell and Bannai–Ito theorem and the Krein conditions are named as the continuation.

## Not verifiable

- Brouwer–Haemers, *Spectra of Graphs*: all 17 locators (§9.1, §9.1.1, Theorems 9.1.2, 9.1.3, 9.1.5, §§9.1.4, 9.1.6–9.1.8, Theorem 10.6.7, Corollary 10.6.8, §12.7, Theorem 12.7.1). The publisher's copy is paywalled and the posted file's address could not be confirmed as an author's page by the sources service; no other copy was sought.
- Brouwer–Van Maldeghem, *Strongly Regular Graphs*: all 4 locators (p. 16, Proposition 1.3.14, Proposition 8.21.1, §10.19), for the same reason.
- The Checks that rest on computations beyond six vertices (the equality cases on seven vertices, the rationality conditions for `k ≤ 200000`) were not rerun; the seven-vertex friendship and Moore claims agree with the pattern found up to six.

## Source issues

- none

## For the human reviewers

- **Not tested.** Brouwer–Haemers carries 17 of the 22 locators (README "References", line 566); its text and contents could not be read, so wording and arrangement were not compared with it. Brouwer–Van Maldeghem (4 locators) likewise.
- **Licence.** The README reads both Brouwer books from files posted under `~aeb` on `win.tue.nl` and `homepages.cwi.nl` (README lines 567, 574); the address does not spell an author's name, so a human should confirm these are the first author's own pages.
- **Scope.** Section 2.1 states the friendship theorem, which Mathlib's Archive proves in the weaker "some vertex is adjacent to all others" form (`Archive/Wiedijk100Theorems/FriendshipGraphs.lean`, line 331); the README says so and states the windmill equivalence.
