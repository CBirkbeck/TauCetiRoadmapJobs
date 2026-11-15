# Review of ShimuraCompactifications (pull request #1053 at 5ba1eb2)

**Verdict:** needs changes

Incremental re-review of the 26 lines changed since `8587a09`, and of the pull request's title and
description against this head. Four P3 findings, none blocking: one carried from the previous
review, three in the description. The gate passes.

## R01 (P3) — 79 Checks still carry Lean-style labels

**Location:** `TauCetiRoadmap/ShimuraCompactifications/README.md` line 560, "`embedding_rankOne_test`:
for the trivial `G_m`-torsor and the positive ray, `T(σ) = A¹_Z`"; line 680
"`ArithmeticFan.zero_test`: for a rank-zero lattice".

**Claim:** A Check never names a Lean counterpart; the description adds "Check labels … are all zero".

**Witness:** ``grep -o '`[A-Za-z0-9_.]*_test`' README.md | sort -u | wc -l`` gives 79 at `5ba1eb2`, as
at `8587a09`; `Suggested.lean` declares two theorems, neither a Check. Commit `f51ec79` repaired
only 8.39.

**Repair:** Delete the label and its colon at the head of each of the 79 bullets and keep the prose:
"For the trivial `G_m`-torsor and the positive ray, `T(σ) = A¹_Z` with its standard open `G_m`."
The description's sentence is then true.

## R02 (P3) — The description still calls the roadmap Part II of AnalyticToricGeometry

**Location:** pull-request description, first paragraph after the summary block: "It is Part II of
AnalyticToricGeometry: it takes that roadmap's lattices, cones, dual monoids and finite fans over `ℂ`
and makes them work over every commutative ring".

**Claim:** The roadmap is the Part II of AnalyticToricGeometry.

**Witness:** README line 5: "Layer 0 extends AnalyticToricGeometry Layer 0 to arbitrary coefficient
rings, torsor bases and arithmetic cone systems"; README line 159 leaves the nonarchimedean
development to AnalyticToricGeometryPartII, a separate roadmap listed under Downstream consumers.

**Repair:** Replace the opening clause by the README's: "Its Layer 0 extends AnalyticToricGeometry
Layer 0 to arbitrary coefficient rings, torsor bases and arithmetic cone systems: it takes that
roadmap's lattices, cones, dual monoids and finite fans over `ℂ` and makes them work over every
commutative ring".

## R03 (P3) — The description names layers the head does not have

**Location:** pull-request description, same paragraph: "(Layer C0)", "(C1)", "(C2, with general
data in C2.general)", "(C3, C3.general)", "(C4)", "(C5)", "(C6)".

**Claim:** The roadmap's layers are C0–C6 with C2.general and C3.general.

**Witness:** `grep -n '^## Layer' README.md` at `5ba1eb2`: Layer 0 (line 376), 1 (907), 2 (1154),
3 general-data completion (1432), 4 (1457), 5 general-data maps (1738), 6 (1761), 7 (2219),
8 (3085). No heading or citation uses a `C`-label.

**Repair:** Renumber in the description: C0 → Layer 0, C1 → Layer 1, C2 → Layer 2, C2.general →
Layer 3, C3 → Layer 4, C3.general → Layer 5, C4 → Layer 6, C5 → Layer 7, C6 → Layer 8, as the
README's Summary has them.

## R04 (P3) — The AI-assistance sentence is out of date

**Location:** pull-request description: "AI assistance: GPT-6 (Codex) for the port from the accepted
explorer package, with author-side red-team passes to follow."

**Claim:** Codex is the only model used, and the red-team passes are still to come.

**Witness:** `git log origin/main..HEAD`: `8587a09` and `f51ec79` carry `Co-Authored-By: Claude Fable
5.1`, `5ba1eb2` carries `Claude Opus 5.5`; five commits are titled "red-team repairs".
`CONTRIBUTING.md` line 54–56 asks for the models used.

**Repair:** "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and the
red-team repairs; Claude Fable 5.1 and Claude Opus 5.5 for the review repairs and two rewordings."
(Adjust to the work actually done.)

## Previous findings

- R01 — not repaired: line 560 still reads "`embedding_rankOne_test`: for the trivial `G_m`-torsor
  and the positive ray"; 79 distinct labels remain. Raised again as R01.
- R02 — repaired: 8.39 (lines 3790–3792) now says "Dimitrov's (vi) states only "parallel"; his proof
  reduces to the triviality of the `κ`-action of `o_{C,1}^×`, which for an odd parallel weight needs
  `N(u) = 1` at every cusp." The repair introduces no problem (table below).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 7.33 isotriviality (reworded) | `G = G_m × C` | `ω = 𝒪_C`, degree `0`, `n = 1`; `T = G`, `G/T = 0` | both conclusions hold | none |
| same | rank-one torus twisted by a connected étale double cover of `C` | `ω = L` with `L^{⊗2} ≅ 𝒪_C`, `L ≇ 𝒪_C`; degree `0`; least `n = 2` | "some `n ≥ 1`" needed, not `n = 1`; agrees with "the torus Hodge line itself need not be trivial" | none |
| same | constant `E × C`; `E` twisted by the same double cover | `ω = 𝒪_C`, `T = 0`; `ω = L`, `n = 2`, constant after the cover | holds; second matches "constant after a finite étale cover" | none |
| same | semistable rational elliptic surface over `ℙ¹` | `deg ω = χ(𝒪) = 1 > 0` | hypothesis excludes it | none |
| same | old against new wording | old: extension of an isotrivial abelian scheme by a torus; new: torus `T ⊆ G` with `G/T` isotrivial abelian | same statement | none |
| 8.39 added sentence | `F = ℚ(√5)`, `u = φ⁵`, `κ = (k,k)` | `φ⁵ = 5φ+3 = (11+5√5)/2`; `N(u) = (121−125)/4 = −1`; `N(u−1) = (81−125)/4 = −11`; character `N(u)^k`: `−1` at `k = 1`, `1` at `k = 2` | odd parallel weight fails, as the sentence says; dimitrov line 1031–1032 has "parallel" alone, line 1069–1071 the `κ`-action of `o×_{C,1}` | none |
| 8.57 permitted `f°` (reworded) | Tate point `q = t` of `Y(N)` over `k((t))`; constant good-reduction curve | extension over `Spec V`: closed point at the cusp, in `Y* ∖ Y°`; closed point in `Y(N) = Y°` | first permitted, second not, under old and new wording alike; agrees with the second Check and dimitrov line 632–636 | none |

The rows for the statements the diff does not touch stand as in the previous review, of `8587a09`.

- Source locators checked against the text: 5. dimitrov line 573–583 (Définition 5.3, printed p. 538),
  line 610–619 (Remarque 5.7), line 626–636 (Lemme 5.8, Définition 5.9, p. 539), line 652–695
  (Définition 5.10, Théorème 5.11, p. 540), line 1031–1071 (Théorème 8.6(vi) and proof, pp. 548–549);
  moretbailly line 8289–8343 (Chapter XI, 4.3–4.5, printed pp. 234–236: (v bis) ⇒ (iv) through 4.4).
- Seeded sample: none of the fifteen targets lies in a changed passage; 8.29 and 8.56 are cited by
  the `*Needs:*` line of 8.39, which the diff only re-wraps.
- Cross-roadmap citations of the changed passages resolved: PadicDifferentialEquationsAndRigidCohomology
  §RD.5.116 (its README line 11427), ArakelovGeometryAndAbelianHeights §5.0b (the Hodge-degree
  criterion for principal Siegel data, its README line 1381; 7.33 keeps the general semi-abelian
  statement and cites it), HilbertModularVarietiesAndShimuraCurves H3, SchemeAndStackFoundations
  Layers 0 and 2.
- Gate at `5ba1eb2`, my run: every check `0`, `OK`; the worker's run adds `build=0`. Nothing changed
  outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ShimuraCompactifications'`
  is empty).
- Dependency check: `depcheck: 245 roadmaps, 2246 edges, 0 problem(s)`; the roadmap is line 165 of
  the merge order, right after HilbertModularVarietiesAndShimuraCurves (164).
- Elaboration: `lake env lean` on a scratch copy of `Suggested.lean` with `#check @` of both
  theorems: `sorry` the only warning (lines 43 and 60); the file is unchanged since `8587a09`, so
  the signatures and the one-tactic probe stand as in the previous review.
- Overlap check: read AutomorphicBundles, PerfectoidShimuraVarieties, PELModuli (their citations of
  this roadmap) and ArakelovGeometryAndAbelianHeights §5.0b; `roadmaps grep` for the isotriviality
  criterion and for formal gluing finds no second owner; nothing shared. `overlaps.md` lists no
  dropped id, no second copy and no other pull request changing this roadmap.
- Source independence: 3 passages compared with 2 sources (changed passages only), none shared;
  largest share dimitrov, 55 of about 180 locators; contents not compared again (the diff adds,
  removes and reorders no layer).
- Title and summary block: the title is the README's; the summary block's sentences agree with the
  head (Layer 0 on AnalyticToricGeometry's carriers and `AddMonoidAlgebra`, the consumers named
  under Downstream consumers). Its findings are R02–R04 and the "Check labels" clause in R01.

## Not verifiable

- [FC], Chapter V, Proposition 2.2, pp. 149–150 (7.33): Springer, paywalled; the wording of the
  reworded 7.33 was compared with Moret-Bailly's parallel statement only.
- M. Rapoport, Compositio Math. 36 (1978), Théorème 3.5 (8.57): not fetched; the statement was read
  in Dimitrov's Théorème 5.11, which reproduces it.

## Source issues

- **Error** in dimitrov at Théorème 8.6(vi), printed p. 548: the source says the weight sheaf extends
  invertibly to the minimal compactification exactly when the weight is parallel; it should also
  require the cusp-unit character to be trivial, which fails for odd parallel weight when a cusp
  unit has norm `−1`; affects a stated result.

## For the human reviewers

- none
