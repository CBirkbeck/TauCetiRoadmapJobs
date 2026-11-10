# Review of DGFloerPartII (pull request #1799 at 23ecb67)

**Verdict:** needs changes

This is an incremental re-review of the 32 lines changed since `4ecec6e`. All of them are in
`README.md` (22 insertions, 10 deletions), in three places:

- 1.1's Check on Dowker's product, which is rewritten as a full argument (lines 734–746);
- the Layer 1 Dependencies (lines 1015–1016);
- the Hatcher entry of the References (lines 2312–2318).

`Suggested.lean` is byte-identical to `4ecec6e`, nothing changed outside the folder, and the
pull-request description is unchanged.

Results:

- Review 23's R02 (the Dowker Check had no source) is **repaired**.
- Review 23's R01 (the stale `roadmap-summary` block) is **not repaired**. It is carried as R01.
- **New:** R02. The rewritten Check now argues through the CW topology on `X × Y`, which is
  Hatcher's Theorem A.6. The scope bullet says nothing in this roadmap uses that structure, and
  AlgebraicTopology on main owns it.

The gate passes with the moved order and the targeted build. Both findings are P3, so nothing
blocks.

## R01 (P3) — Not repaired: the description's `roadmap-summary` block is still stale

**Location.** The pull-request description, inside the generated `roadmap-summary` block:

- "A separate home lets them use … HomotopySpheres' James construction and Bott periodicity";
- "its boundaries vanishing by a Hopf-fibration rank count rather than degree gaps".

**Claim.**

- HomotopySpheres supplies the James construction and Bott periodicity.
- The boundaries for both `ΩCPᵈ` and `ΩHPᵈ` vanish by a rank count, not by degree gaps.

**Witness.**

- "HomotopySpheres" occurs 0 times in `README.md` and `Suggested.lean`.
- The James construction is GeneralAlgebraicKTheoryPartII §4.30b (line 92).
- "Bott periodicity is proved here" (line 116).
- 2.3 says to prove the Thom model "before using these gaps to infer vanishing boundaries"
  (line 1097).

**Repair.** Regenerate the block from the free text, or make these two edits in it:

1. Replace "HomotopySpheres' James construction and Bott periodicity" with
   "GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem".
2. Replace "its boundaries vanishing by a Hopf-fibration rank count rather than degree gaps" with
   "the boundaries for ΩCPᵈ vanishing by a Hopf-fibration rank count, and those for ΩHPᵈ by the
   degree gaps once the Thom model is built".

**Tested.** The free text of the description already says both things:

- "GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem (1.2)";
- "for `ΩHPᵈ` they vanish by the degree gaps once the Morse–Bott Thom model is built".

Both cases were recomputed with `d = 2`:

- `ΩCP²`: `a₂ − b₁ = 5 − 4 = 1`, so degrees alone do not exclude a boundary, and the rank count is
  needed.
- `ΩHP²`: `a_k = 10(k−1) + 3` and `b_k = a_k + 7` give the degrees `3, 10, 13, 20, 23, …`, with gaps
  of at least 3, so every boundary vanishes for degree reasons.

## R02 (P3) — New: 1.1's Dowker Check now uses the product CW structure that the scope says nothing here uses

**Location.**

- README lines 738–740, 1.1 Check: "meets each closed cell of `X × Y` in at most one point, so it
  is closed in the CW topology, which is the `k`-ification of the product (Hatcher, *Algebraic
  Topology*, Theorem A.6)".
- README lines 111–114, Out of scope: "The CW structure with the product cells on the convenient
  product … AlgebraicTopology Stage 4 item 5 builds it as `cwProductKelley`, and nothing here uses
  it."

**Claim.** The roadmap does not use the product-cell CW structure on `k(X × Y)` or its weak
topology.

**Witness.**

- The rewritten Check proves that `P` is closed in `k(X × Y)` by passing through the CW topology
  of that structure, which is the first half of Hatcher's Theorem A.6.
- AlgebraicTopology on main owns that identification. Its README (`4ee3e19`) says, at lines
  765–766, "Prove its weak topology is the compactly generated product topology (Hatcher Appendix
  A.6)".
- Review 23 checked "nothing here uses it" on the ground that the Check "is about the product
  topology, not about the CW structure". That is no longer true.

**Repair.** Replace "so it is closed in the CW topology, which is the `k`-ification of the product
(Hatcher, *Algebraic Topology*, Theorem A.6)" with:

> every compact subset of `X × Y` lies in the product of its two projections, which are compact
> and so lie in finitely many of the intervals (Hatcher, *Algebraic Topology*, Proposition A.1),
> so it meets `P` in finitely many points, and `P` is closed in the `k`-ification of the product

In the Layer 1 Dependencies (line 1015) and the Hatcher reference (line 2313), write "Appendix,
Proposition A.1 and the example after Theorem A.6 (pp. 520, 524–525)".

If the author prefers to keep the CW-topology argument, there is another repair: in lines 113–114,
replace "nothing here uses it" with "it enters only as the reason for 1.1's Dowker Check", and
cite AlgebraicTopology Stage 4 item 5 in the Check.

**Tested.** The replacement argument was checked on Dowker's pair:

- Let `K ⊂ X × Y` be compact. By `hatcher-at` line 22534 (Proposition A.1, p. 520), its
  projections lie in `I_(s¹) ∪ … ∪ I_(sᵐ)` and in `I_(j₁) ∪ … ∪ I_(jₙ)`. So `K ∩ P` has at most
  `m·n` points, and it is closed in the Hausdorff space `K`.
- The same holds for Mathlib's test maps `f : K → X × Y` from compact Hausdorff spaces. The image
  `f(K)` is compact, so `f⁻¹(P)` is the preimage of finitely many closed points.
- No CW structure on the product is used.
- The `(1/2, 1/2)` control still discriminates. Its set is `A × B` with `A ∩ I_s = {1/2}`, so it
  passes the same test and is also closed in the product topology.

## Previous findings

- R01 — not repaired: the generated `roadmap-summary` block still reads "HomotopySpheres' James
  construction and Bott periodicity" and "a Hopf-fibration rank count rather than degree gaps".
  This report carries it as R01.
- R02 — repaired: the Check now cites "(Hatcher, *Algebraic Topology*, Appendix, pp. 524–525,
  after Theorem A.6)". The Layer 1 Dependencies list "§4.J and Appendix, Theorem A.6 with the
  example after it (pp. 524–525)", and the References list "Dowker's product … (1.1)". The repair
  introduced R02.

The brief names no repair report, so no finding is marked "not actionable in this package".

## Verified sound

### Gate, dependency check and build

- **The worker's gate** (`gate.md`): every check is 0, and the result is `OK`.
- **The brief's gate command** (`gate <worktree> DGFloerPartII --base origin/main`, configured
  order): the result is `FAIL`, from one line: `depcheck: UPWARD: DGFloerPartII (#46) ->
  GeneralAlgebraicKTheoryPartII (#335) at README lines [454, 782, 1003, 1509, 2193]`. This is the
  moved case that review 23 recorded: the configured order lists this roadmap above its supplier,
  and the worker moves it when it submits. It is not a defect.
- **The same command with `--order merge-order-moved.txt --build`:** every check is 0, `build=0`,
  `depcheck=0`, `outside-folder=0`, `stray-files=0`, and the result is `OK`.
- **The brief's dependency check (`--movable`):**

      depcheck: 233 roadmaps, 2259 edges, 0 problem(s)

- **`lake env lean` on `Suggested.lean`:** exit 0, with 27 diagnostics, all "declaration uses
  `sorry`", and nothing else. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`.
- **Diffs.**
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
  - `git diff 4ecec6e..HEAD -- Suggested.lean` is empty.

### The changed passages, against the source

| Claim in the diff | Source at the locator | Verdict |
| --- | --- | --- |
| Dowker's `X`: a wedge at `0` of intervals indexed by all sequences of positive integers; `Y`: a countable wedge | `hatcher-at` lines 22734–22740, p. 525 | matches; the README's wording is its own |
| `P` = the points `(1/s_j, 1/s_j) ∈ I_s × I_j` | line 22741, p. 525 | matches |
| `P` is closed in the CW topology | lines 22742–22743 | matches (see R02 on the route) |
| The CW topology is `(X × Y)_c`, the `k`-ification | Theorem A.6, line 22693, p. 524; the definition of `X_c` at lines 22687–22689 | matches; for a Hausdorff product, compact-subset generation equals Mathlib's compact-Hausdorff test maps |
| Not closed: choose `s_j > max(j, 1/b_j)`, then `j` with `s_j > 1/a_s` | lines 22746–22755, p. 525; Hatcher picks `k > 1/a_t` and uses `t_k > k` | an equivalent route, in the README's own words |
| "pp. 524–525, after Theorem A.6" | the example starts at line 22728, p. 524, and ends at line 22755, p. 525 | correct |
| "Theorem A.6 with the example after it (pp. 524–525)" (Dependencies, References) | as above | correct |

No passage is copied: the shared notation (`I_s`, `s_j`, `a_s`, `b_j`) is the mathematics. The
README's "each closed cell … at most one point" is more precise than the source's wording (see
Source issues).

### Adversarial table

Rows 1–57 and 59 are carried, because the statements they test are untouched:

- rows 1–33 and 35–36 from review 20;
- rows 34 and 37–41 from review 21;
- rows 42–43 and 45–52 from review 22;
- rows 53–57 and 59 from review 23.

Row 58 of review 23 (the unsourced Check) is replaced by rows 61–64. Row 60 is carried as row 67,
because its finding is unrepaired.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1–33, 35–36 | as in review 20 | as in review 20 | as in review 20 | true or sharp | none |
| 34, 37–41 | as in review 21 | as in review 21 | as in review 21 | as stated | none |
| 42–43, 45–52 | as in review 22 | as in review 22 | as in review 22 | as stated | none |
| 53–57, 59 | as in review 23 | as in review 23 | as in review 23 | as stated | none |
| 61 | 1.1 Check: `P` meets each closed cell of `X × Y` in at most one point | `s` with `s₁ = 1`, so that `p_(s,1) = (1, 1)` is a vertex; the closed cells `I_s × I_j`, `{1_s} × I_j` and `{0} × I_j` | `I_s × I_j ∩ P = {p_(s,j)}`, because `p_(s',j')` with `s' ≠ s` has first coordinate `1/s'_(j') > 0`, outside `I_s`. `{1_s} × I_j ∩ P` is `{(1,1)}` if `s_j = 1`, and empty otherwise. `{0} × I_j ∩ P = ∅` | true | none |
| 62 | 1.1 Check: `P` is not closed in the product topology | `b_j = 2^(−j)`; `s_j = 2^j + 1`, which is `> max(j, 2^j)`; `a_s = 10^(−3)` | `j = 10` gives `s₁₀ = 1025 > 1000 = 1/a_s`. The point `(1/1025, 1/1025)` has `1/1025 ≈ 9.756·10^(−4)`, which is below `a_s = 10^(−3)` and below `b₁₀ = 1/1024 ≈ 9.766·10^(−4)`, so it lies in `U × V` | true | none |
| 63 | The Check's need for non-local-compactness: `Y` replaced by a finite wedge of `n` intervals (locally compact) | the same `P` restricted to `j ≤ n`, and `a_s = 1/(2·max_(j≤n) s_j)` | every point `(1/s_j, 1/s_j)` with `j ≤ n` has first coordinate at least `2a_s`, so it lies outside `[0, a_s)`; `U × V` misses `P`. This agrees with Theorem A.6 and Proposition A.15 (a locally compact factor gives the product topology) | the hypothesis is sharp | none |
| 64 | 1.1 Check: the control "one point per 2-cell at `(1/2, 1/2)` stays closed in both topologies" | `Q = A × B`, with `A = {1/2 ∈ I_s}` and `B = {1/2 ∈ I_j}` | `A ∩ I_s = {1/2}`, so `A` is closed in `X`; likewise `B`. So `Q = A × B` is closed in the product topology, and it meets each closed cell in at most one point | true; it discriminates the `1/s_j` choice | none |
| 65 | Locators of the diff | `hatcher-at` page markers: file page 533 is printed p. 524, file page 534 is printed p. 525 | Theorem A.6 is on p. 524 (line 22693); the example is on pp. 524–525 (lines 22728–22755) | correct | none |
| 66 | Scope lines 111–114, "nothing here uses it", against the rewritten Check | lines 738–740 | the Check's closedness step goes through the CW topology of Theorem A.6, which AlgebraicTopology Stage 4 item 5 owns (main, lines 765–766) | inconsistent | R02 |
| 67 | The `roadmap-summary` block on the boundaries (review 23's row 60) | 2.2 and 2.3 with `d = 2` | `ΩCP²`: `a₂ − b₁ = 1`. `ΩHP²`: `3, 10, 13, 20` with gaps of at least 3 | the block is wrong for `HPᵈ` | R01 |

The replacement argument in R02's repair was tested on Dowker's pair and on the `(1/2, 1/2)`
control: see R02 under "Tested".

### Cross-roadmap citations the diff touches

- **AlgebraicTopology Stage 4 item 5** (References, line 2317). On main (`4ee3e19`), `TauCetiRoadmap/AlgebraicTopology/README.md`:
  - line 752 has `cwProductKelley`;
  - lines 765–766 have the weak topology as the compactly generated product topology, citing
    Hatcher A.6.

  At the head of AlgebraicTopology #1652, its README line 4640 maps `cwProductKelley` to §4.5. The
  citation survives that revision.
- **Main moved** from `87976be` to `4ee3e19`. The changes are in DerivedModuleAlgebra,
  QuadraticCharactersAndReduction, RamificationOfCompleteDiscretelyValuedFields and
  RootSystemsPartII, and the README cites none of them (0 matches).
- **GeneralizedCohomology G4.0b** is still defined on main at line 1082 (and mentioned at line 939).
  So the `overlaps.md` lead "only an open revision defines G4.0b" is a false positive, as in
  review 23.
- **`overlaps.md`** lists no other open pull request that changes this roadmap and no dropped id.
- **`citations.md`** lists nothing unresolved.

### The seeded sample, where the diff touches it

- **1.1** is the only sampled target that the diff touches. Its new Check and its locators are
  rows 61–66.
- **The other sampled targets** (1.0, 1.2, 1.3, 1.4, 1.5, 2.2, 2.4, 2.5, 3.1, 3.2, 3.3, 4.2c,
  4.4, 4.5) are untouched, and the rows of reviews 20–23 stand.
- No README locator is flagged as unverified.
- `hatcher-at` is `certified` in the manifest. It is the author's online edition, whose printed
  page headers (524, 525) match the README.

### Suggested.lean

- The file is unchanged since `4def45e`.
- The diff adds no backticked Lean name.
- The headline list, the elaborated-signature comparison (`signatures.md`, 33 entries for 31
  declarations, no lost binder) and the one-tactic probe from reviews 20–23 stand.

## Not verifiable

- Dowker 1952, the primary source of the example, is not in the cache. The README cites
  Hatcher's exposition, which was read, so nothing depends on it.
- As in review 23, these texts are not in the cache: Ziller; Milnor, *Morse Theory*; Bott 1959;
  Steenrod; Milnor–Stasheff; Pontryagin; Thom 1954; BDHO, *Morse homology with DG coefficients*;
  [Jap87]. None of them bears on a changed passage.

## Source issues

- **Misprint** in hatcher-at at Appendix, Dowker's example after Theorem A.6, printed p. 525: the
  source says `P` has a single point in each 2-cell of `X × Y`. When `s_j = 1` the point `(1, 1)`
  is a vertex, and the open 2-cell `I_s × I_j` contains no point of `P`. It should be that `P`
  meets each closed cell in at most one point. This affects nothing: `P` is still closed in the CW
  topology.
