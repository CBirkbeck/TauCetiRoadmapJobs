# Review of ArithmeticStatisticsPartVII (pull request #1178 at ddbc3d0)
**Verdict:** needs changes

The folder's five reworded passages are correct and the gate passes. The three findings are all about the pull request's description, which no longer matches the head; one edit of the description repairs them.

## R01 (P3) — The description does not state that the roadmap owns the large-sieve inequalities

**Location** Pull request description, prose paragraph: “Quadratic-isotropic and alternating-matrix probability laws, their locally compact and global Selmer comparisons, and arithmetic distribution conjectures: common-parity coupling, integral orthogonal Grassmannians, Delaunay laws at all primes, and conditional three-isogeny twist averages …”

**Claim** The description lists what the roadmap contains but leaves out an ownership a reader must know: the head owns three analytic inequalities and names SieveMethodsAndPrimePatterns, which the description's own merge order places before this pull request, as their consumer.

**Witness** `TauCetiRoadmap/ArithmeticStatisticsPartVII/README.md:17`: “That target owns the Montgomery–Vaughan Hilbert inequality with the uniform-spacing constant `π/δ` … SieveMethodsAndPrimePatterns consumes these three inequalities.” The description never mentions a large sieve.

**Repair** Add to the description: “§5.9 also states Kane's two-Selmer twist distribution with effective constants (prime sums from AnalyticNumberTheoryPartI §§0.6, 0.18, 0.28, 0.34) and owns its analytic input, the multiplicative large sieve: the Hilbert inequality with constant `π/δ`, the sharp additive large sieve `N−1+δ⁻¹` for `0<δ≤1` and the sharp primitive-character large sieve `N−1+Q²`. SieveMethodsAndPrimePatterns §2.9 is named as their consumer.”

## R02 (P3) — “The top layers” in the summary: the head has one layer

**Location** Pull request description, summary block: “The top layers state the Cohen–Lenstra and Cohen–Martinet conjectures as propositions, realise Selmer groups modulo a finite-module Sha as intersections of maximal isotropics, and derive three-isogeny Selmer and rank results …”

**Claim** The head has a single layer, and the conjectures named first are its opening sections, not its top.

**Witness** `README.md:77` is the only `## Layer` heading (“Layer 5: Quadratic probability models and twist applications”); the conjectures are §§5.1–5.3 (`:79`, `:145`, `:294`), the Selmer intersection §5.27 (`:1835`), the three-isogeny results §§5.10–5.11, 5.32.

**Repair** Replace “The top layers state” by “Its arithmetic sections state” (the rest of the sentence stands: §§5.1–5.3 and 5.8, §5.27, §§5.10–5.11 and 5.32).

## R03 (P3) — The description does not say that the pull request adds a new roadmap

**Location** Pull request description: “Roadmap folder `TauCetiRoadmap/ArithmeticStatisticsPartVII` (README, `Suggested.lean`, `metadata.toml`); the Lean states only real-bodied definitions and theorems …”

**Claim** Nothing in the title or description says whether the folder is new or a revision of a roadmap on main.

**Witness** The folder is absent from `origin/main`; the change against the base is 2813 insertions and 0 deletions in three new files (`README.md` 2601, `Suggested.lean` 211, `metadata.toml` 1).

**Repair** Begin the sentence with “This pull request adds the new roadmap folder `TauCetiRoadmap/ArithmeticStatisticsPartVII` (README, `Suggested.lean`, `metadata.toml`) and changes nothing outside it;”.

## Previous findings

The previous review, of `661d52f`, had no findings; there is nothing to account for.

## Verified sound

Incremental re-review of the 10 changed lines since `661d52f` (5 insertions, 5 deletions, all in `README.md`: lines 176, 450, 620, 867, 1564). `Suggested.lean` and `metadata.toml` are unchanged; the diff changes no statement, no heading, no anchor, no `*Needs:*` line and no locator.

| Statement (changed text cites it) | Instances and computed values on both sides | Result |
|---|---|---|
| `README.md:450`, fibres of the isotropic reduction map, `dim X = 1` | Hyperplanes of `W` avoiding `v`: `(p,n)=(2,1)`: `1−0=1=p⁰`; `(2,2)`: `3−1=2`; `(3,2)`: `4−1=3`; `(3,3)`: `13−4=9`; `(5,4)`: `156−31=125`. Fibre `p^{n−1}+1`: `2, 3, 4, 10, 126`. | Count correct. |
| same, inverse map | `v∉W₁` and `v∈Z⊇W₁` give `Z⊇W₁+𝔽_p v=W`, so `Z=W`; hence `Z∩X^⊥=W₁` and `π_X(Z)=(W₁+X)/X=W̄`. All hyperplanes instead: `(p,n)=(2,2)` gives `3+1=4≠3`. | Restriction needed; proof sound. |
| same, flag product | Stage `i`: ambient `2(n−i+1)`, factor `p^{n−i}+1`. `X` maximal: `𝔽₂, n=2`: `(2+1)(1+1)=6`; `𝔽₃, n=2`: `(3+1)(1+1)=8`, the counts of §5.4. | Agrees with `#I_V`. |
| `README.md:176`, Cohen–Lenstra–Martinet average | Reworded only: same family, same `p∤|G|`, same positive limit. `(S_2,3)`: `gcd(3,2)=1`; `(S_3,2)`: `2∣6`, excluded. Empty family: average 0, not positive. | Same statement as at `661d52f`. |
| `README.md:620` and `Suggested.lean:124`, `delaunay_compatibility` | Half prior, convolution against `poonenRainsWeight`: `p=2`, `d=0…4`: `0.20971122, 0.41942244, 0.27961496, 0.07988999, 0.01065200` on both sides; `p=3`: `0.31950229, 0.47925343, 0.17972004, 0.02073693, 0.00077763` on both. | Existence holds. |
| same, uniqueness (“no other choice”) | Prior `δ₀`, `p=2`: `d=0` gives `0.41942244≠0.20971122`; `d=1` gives `0≠0.41942244`. Triangular: `delaunayWeight p d 0>0`, so `ν_d` is determined by `d`. | Both directions of the `↔`. |
| `README.md:867` and `Suggested.lean:170`, `bklpr_injection_moments` | `inj·#OGr_{n−m}/#OGr_n` against `q^{m(m+1)/2}∏(1−p^{i−n})/∏(1+p^{−i})`: `(p,e,m,n)=(2,2,1,1)`: `1=1`; `(2,2,1,2)`: `2=2`; `(2,2,2,2)`: `8=8`; `(3,2,2,5)`: `196020/287` both; `(2,2,2,1)`: `0`; `(2,1,0,0)`: `1`. | Formula as reworded. |
| same, limit and the `p`-not-`q` factor | `(2,2,1,30)`: `3.99999999→4=q`. Injections `ℤ/4→ℤ/4`: `2=4(1−1/2)`; with `q` in the factor `4(1−1/4)=3`, wrong. `#OGr₂(ℤ/4)=12`. | Limit `p^{e·m(m+1)/2}` as in the Lean. |
| `README.md:1564`, CM three-isogeny Selmer ratio | `F=K`: `3¹·3^{−1}=1`; `[F:K]=2`: `3²·3^{−2}=1`; `[F:K]=3`: `27·3^{−3}=1`. `∏_{v|3}|a|_v=|N_{K/ℚ}(a)^{[F:K]}|₃=3^{−[F:K]}` since `N(a)=3ℓ`, `ℓ≠3`. `ℤ[i]`: `x²+y²=3` has no solution. | Reordered proof gives the same product. |

The rows for the untouched statements stand as in the previous review, of `661d52f`.

- Gate, run on this head: every check 0, `OK` (as the worker's run, `build=0`). `lake env lean` on `Suggested.lean`: exit 0, nine `declaration uses sorry` warnings (lines 74, 99, 112, 124, 139, 145, 170, 189, 206), nothing else.
- Dependency check: `depcheck: 245 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Source locators checked against the text, 5 (the seeded sample's §§5.2, 5.4, 5.5, 5.7, 5.11 contain all five changed lines): PR Proposition 2.6(a) and proof (lines 248–252, 300–313, pp. 5–6); PR Theorem 5.2 and proof (lines 1036–1053, pp. 21–22); BKLPR Theorem 5.10 and proof (lines 999–1017, p. 20); BKLOS Theorem 11.2 and proof (lines 832–869, pp. 18–19); LOWW (1.1) and the enriched-signature remark (arXiv v2 lines 24–41, 212–219). Each supports the statement as written. The other sampled sections contain no changed line.
- Cross-roadmap citations: the changed lines contain one, ArithmeticStatisticsPartIV §3.2 at `:452`, unchanged. The 11 citation leads are all on unchanged lines (ten declarations of this `Suggested.lean`, one of ArithmeticStatisticsPartI §0.1). `git diff --stat origin/main...HEAD` outside the folder is empty.
- Description checked sentence by sentence against the head: apart from R01–R03 it holds (title equals the README title; `IsMaxIsotropic`, `IsWeaklyMetabolic` exist; counts over `𝔽_q` at `:463`; `Sel_λ/Sha¹≅Z∩W` at `:1853`; imports are `Mathlib` and three `TauCeti.*` modules; build, `set_option` and dependency claims as measured above).
- Overlap check: grepped every open head and main for the objects of the changed passages; read GeometryOfNumbersAndQuadraticArithmetic §6.3 (isotropic reduction in hermitian K-theory of exact categories, a different object) and CMRankZeroConverse (cites BKLOS in its references only); nothing shared by the changed passages. The scopes of the closest-roadmap lists (ArithmeticStatisticsPartI, III, V, VI, RankZeroOneBSDPartII, AnalyticNumberTheoryPartI, II, ProbabilisticAndMetricNumberTheory) stand as read in the previous reviews.
- Remark on untouched text: the merge order now lists SieveMethodsAndPrimePatterns (line 57) before this roadmap (line 147), where the previous review found it later (line 269), and that roadmap's head now states the same three inequalities in its §2.9 and lists this roadmap as their consumer (`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:2405, 4128` at the head of #1495), while `README.md:17` here says the reverse. See the human reviewers' section.
- Source independence: changed passages only; 5 passages compared with 4 sources (PR, BKLPR, BKLOS, LOWW), none shared (longest common run 7 words, each a forced mathematical phrase); the `:450` and `:1564` proofs are also ordered differently from their sources; no layer is added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- LOWW, published pagination: the README cites the Forum of Mathematics, Pi pages (p. 2, pp. 5–6); I read arXiv v2, where the same passages are on pp. 1 and 4. The content agrees; the published page numbers were not re-read this round.
- Rubin, Proposition 3.14 (cited at `:1566`, unchanged) was not re-opened; it stands as in the earlier reviews.
- Carried from the previous review: AnalyticNumberTheoryPartI §0.34's sources were not refereed when checked; Kane's published numbering; DeJong, CM90, vanKampen, Silverman, Cassels1965, Oesterlé, Schaefer1996. No changed passage cites them.

## Source issues

- **Error** in PR at the proof of Proposition 2.6(a), printed p. 6 (arXiv v2): the source says the fibre maps bijectively onto all codimension-one subspaces of `W` together with `W`; it should be the codimension-one subspaces not containing `v`, together with `W`; affects the proof.
- **Misprint** in BKLPR at the proof of Theorem 5.10, printed p. 20 (arXiv v2): the source says the number of injections has factors `1−q^{i−n}`; it should be `1−p^{i−n}`, as in its own next display; affects nothing.

## For the human reviewers

- **Ownership order.** `README.md:17` owns the Hilbert inequality `π/δ` and the two sharp large sieves and names SieveMethodsAndPrimePatterns as consumer; that roadmap's head (#1495, `README.md:2405, 4128`) states them in §2.9 and names this roadmap as consumer; the merge order now has it first (57 against 147).
- **Not tested.** The arrangement was not compared with a table of contents this round (no layer changed); the wording check covers the five changed passages only.
