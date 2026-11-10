# Review of DGFloerPartII (pull request #1799 at 43d9b63)

**Verdict:** accepted

This is an incremental re-review of the 28 lines changed since `23ecb67`. All of them are in
`README.md` (16 insertions, 12 deletions), in three places:

- 1.1's Check on Dowker's product, whose closedness step is rewritten (lines 738–743);
- the Layer 1 Dependencies (lines 1018–1020);
- the Hatcher entry of the References (lines 2315–2322).

`Suggested.lean` is unchanged, nothing changed outside the folder, and the generated
`roadmap-summary` block of the description was regenerated.

Both findings of review 24 are repaired, the repairs introduce no new problem, and the gate
passes. No finding remains.

## Previous findings

- R01 — repaired: the `roadmap-summary` block now reads "GeneralAlgebraicKTheoryPartII's James
  construction and Bott–Samelson theorem" and "the boundaries for ΩCPᵈ vanishing by a rank count
  through the Hopf fibration, and those for ΩHPᵈ by the degree gaps".
- R02 — repaired: the Check now reads "the two projections of the compact set `f(K)` are compact,
  so each lies in finitely many of the intervals (Hatcher … Proposition A.1, p. 520)" and "No CW
  structure on the product enters".

The brief names no repair report, so no finding is marked "not actionable in this package".

## Verified sound

### Gate, dependency check and build

- **The worker's gate** (`gate.md`): every check is 0, including `build=0`, and the result is `OK`.
- **The brief's gate command** (configured order): one line fails, `depcheck: UPWARD:
  DGFloerPartII (#46) -> GeneralAlgebraicKTheoryPartII (#335) at README lines [454, 785, 1006,
  1512, 2196]`. This is the moved case recorded in reviews 23 and 24: the configured order lists
  this roadmap above its supplier, and the worker moves it when it submits. It is not a defect.
- **The same command with the moved order:** every check is 0 and the result is `OK`.
- **The brief's dependency check (`--movable`):**

      depcheck: 233 roadmaps, 2263 edges, 0 problem(s)

- **`lake env lean` on `Suggested.lean`:** exit 0, with 27 diagnostics, all "declaration uses
  `sorry`", and nothing else. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`.
- **Diffs.** `git diff --stat origin/main...HEAD` outside the folder is empty, and
  `git diff 23ecb67..HEAD` touches only `README.md`.

### The changed passages, against the source

| Claim in the diff | Source at the locator | Verdict |
| --- | --- | --- |
| A compact subset of a CW complex lies in finitely many cells: "Proposition A.1, p. 520" | `hatcher-at` line 22534; the file's page 529 is printed p. 520 (the same offset of 9 as pp. 524–525 in review 24) | matches |
| "Appendix, Proposition A.1 and the example after Theorem A.6 (pp. 520, 524–525)" (Dependencies) | line 22534, p. 520; lines 22728–22755, pp. 524–525 | correct |
| "Proposition A.1 (p. 520), Theorem A.6 and Dowker's example after it (pp. 524–525)" (References) | as above; Theorem A.6 at line 22693, p. 524 | correct |
| References: "the finite subcomplexes containing a compact set … (1.1)" | Proposition A.1 is exactly that statement | correct, in the README's own words |

Theorem A.6 stays in the References legitimately: the scope bullet (line 113) cites it for the
product CW structure left to AlgebraicTopology, and line 746 uses it as a position marker for the
example. No passage is copied.

### The new argument

The Check proves that `P` is closed in `k(X × Y)` with these steps, each checked:

1. `k(X × Y)` is tested on continuous maps `f : K → X × Y` from compact Hausdorff spaces. This is
   1.0's coreflection on Mathlib's `CompactlyGenerated` (README line 592 fixes
   `X ×_k Y = k(X × Y)`).
2. `f(K) ⊂ π₁f(K) × π₂f(K)`, and both projections are compact.
3. By Proposition A.1, `π₁f(K)` lies in `I_(s¹) ∪ … ∪ I_(sᵐ)` and `π₂f(K)` in
   `I_(j₁) ∪ … ∪ I_(jₙ)`. A finite subcomplex of a wedge of intervals is a union of finitely many
   of them.
4. A point `p_(s,j) = (1/s_j, 1/s_j)` has nonzero coordinates, so it lies in `I_(s') × I_(j')` only
   when `s' = s` and `j' = j`. So `f(K) ∩ P` has at most `m·n` points.
5. `f⁻¹(P) = f⁻¹(f(K) ∩ P)` is the preimage of a finite set of closed points of the Hausdorff
   space `X × Y`, so it is closed.

No step uses a CW structure on the product, so the scope sentence "nothing here uses it"
(lines 111–114) is true again.

### Adversarial table

Rows 1–57 and 59 are carried from reviews 20–23 as review 24 lists them, and rows 62–65 from
review 24, because the statements they test are untouched. Review 24's row 61 (closedness through
the closed cells) is replaced by rows 68–70, and its rows 66–67 by rows 71–72.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1–33, 35–36 | as in review 20 | as in review 20 | as in review 20 | true or sharp | none |
| 34, 37–41 | as in review 21 | as in review 21 | as in review 21 | as stated | none |
| 42–43, 45–52 | as in review 22 | as in review 22 | as in review 22 | as stated | none |
| 53–57, 59 | as in review 23 | as in review 23 | as in review 23 | as stated | none |
| 62–65 | as in review 24 (not closed in the product topology; the finite-wedge control; the `(1/2, 1/2)` control; pp. 524–525) | as in review 24 | as in review 24 | true or sharp | none |
| 68 | 1.1 Check: `f(K)` meets `P` in finitely many points | `m = 2`: `s¹ = (1, 2, 3, …)`, `s² = (2, 2, 2, …)`; `n = 2`: `j = 1, 2`; `f(K) = (I_(s¹) ∪ I_(s²)) × (I₁ ∪ I₂)` | the points of `P` inside are `(1, 1) ∈ I_(s¹) × I₁`, `(1/2, 1/2) ∈ I_(s¹) × I₂`, `(1/2, 1/2) ∈ I_(s²) × I₁` and `(1/2, 1/2) ∈ I_(s²) × I₂`: 4 distinct points, equal to the bound `m·n = 4` | true; the bound is attained | none |
| 69 | The same step at the vertex case `s_j = 1` | `p_(s¹,1) = (1, 1)`, the free endpoints of `I_(s¹)` and `I₁` | the endpoint `1` of `I_s` lies in no other interval of the wedge at `0`, so the point is counted once; the count of row 68 does not depend on open 2-cells | true | none |
| 70 | Whether a compact set can meet `P` in infinitely many points (the step that Proposition A.1 carries) | fixed `s` with `s_j → ∞`; the set `{p_(s,j) : j ≥ 1}` | its projection to `Y` is `{1/s_j ∈ I_j}`, one interior or end point in each of infinitely many cells, which is closed and discrete in `Y` (Hatcher's proof of A.1, lines 22536–22544), so not compact. Consistent with row 62: `(0, 0)` is in the product closure of `P`, but no compact set witnesses it | true; this is why `k(X × Y) ≠ X × Y` here | none |
| 71 | Scope lines 111–114, "nothing here uses it", against the Check | lines 738–743 | the argument uses Proposition A.1 on each factor and Hausdorffness of `X × Y`; the string "CW topology" no longer occurs in the Check | consistent | none |
| 72 | The `roadmap-summary` block on the boundaries | 2.2 and 2.3 with `d = 2` (values from review 24) | `ΩCP²`: `a₂ − b₁ = 1`, so the rank count is needed; `ΩHP²`: degrees `3, 10, 13, 20`, gaps at least 3. The block now says rank count for `CPᵈ` and degree gaps for `HPᵈ` | agrees | none |

### Cross-roadmap citations the diff touches

- **AlgebraicTopology Stage 4 item 5** (scope line 113, References line 2320). On main (`2485dfb`),
  `TauCetiRoadmap/AlgebraicTopology/README.md` line 752 has `cwProductKelley` and line 766 the
  weak topology as the compactly generated product topology. At the head of the open
  AlgebraicTopology revision, its README line 4640 maps `cwProductKelley` to §4.5, so the citation
  survives.
- **GeneralizedCohomology G4.0b** is defined on main (line 939 and the supplier rows at lines
  39–40), so the `overlaps.md` lead "only an open revision defines G4.0b" is a false positive, as
  in reviews 23 and 24.
- **`overlaps.md`** lists no other open pull request that changes this roadmap and no dropped id.
  **`citations.md`** lists nothing unresolved.
- The diff adds no supplier, no `*Needs:*` item and no cross-roadmap citation.

### The seeded sample, where the diff touches it

- **1.1** is the only sampled target the diff touches. Its Check and locators are rows 68–71 and
  the source table above.
- **The other sampled targets** (1.2, 1.3, 1.4, 2.1, 2.2, 2.3, 2.4, 2.5, 3.1, 3.3, 4.1, 4.3, 4.4,
  4.5) are untouched, and the rows of reviews 20–24 stand.
- No README locator is flagged as unverified.

### Suggested.lean

- The file is unchanged since `4def45e`, and the diff adds no backticked Lean name.
- The headline list, the elaborated-signature comparison (`signatures.md`, no lost binder) and the
  one-tactic probe from reviews 20–23 stand.

### The description

- The free text and the regenerated `roadmap-summary` block now agree with each other and with the
  README: "HomotopySpheres" occurs 0 times in the README, in `Suggested.lean` and in the
  `roadmap-summary` block.

## Not verifiable

- Dowker 1952, the primary source of the example, is not in the cache. The README cites Hatcher's
  exposition, which was read, so nothing depends on it.
- As in review 24, these texts are not in the cache: Ziller; Milnor, *Morse Theory*; Bott 1959;
  Steenrod; Milnor–Stasheff; Pontryagin; Thom 1954; BDHO, *Morse homology with DG coefficients*;
  [Jap87]. None of them bears on a changed passage.

## Source issues

- **Misprint** in hatcher-at at Appendix, Dowker's example after Theorem A.6, printed p. 525: the
  source says `P` has a single point in each 2-cell of `X × Y`. When `s_j = 1` the point `(1, 1)`
  is a vertex, and the open 2-cell `I_s × I_j` contains no point of `P`. It should be that `P`
  meets each closed cell in at most one point. This affects nothing: `P` is still closed in the CW
  topology.
