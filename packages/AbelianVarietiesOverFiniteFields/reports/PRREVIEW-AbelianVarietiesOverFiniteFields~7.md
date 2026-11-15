# Review of AbelianVarietiesOverFiniteFields (pull request #1720 at e411d44)

**Verdict:** needs changes

An incremental re-review: the folder is unchanged since `e411d44` (0 lines), so its files stand as accepted there. This round read the pull request's title and description against the head. Two sentences of the description contradict the head; both findings are P3 and ask for a change to the description only, not to the folder.

## R01 (P3) — the description says `Suggested.lean` pins objects it does not declare

**Location:** pull request description, prose paragraph: "Suggested.lean pins the isogeny relation, orders in étale algebras, the Frobenius order and Deligne modules."

**Claim:** At this head `Suggested.lean` declares no isogeny relation, no Frobenius order and no Deligne module; it states Waterhouse's list and the ideal theory of orders.

**Witness:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean`: its 15 declarations are `waterhouse`, `IsOrder`, `IsFractionalIdeal`, `colon`, `multiplierRing`, `IsInvertible`, `WeakEquiv`, `weakEquiv_iff_one_mem`, `traceDual`, `IsGorenstein`, `isGorenstein_iff_forall_invertible`, `InvertibleIdeal`, `picSetoid`, `Pic`, `finite_pic`; lines 15–25 name the rest as not statable.

**Repair:** Replace the sentence with: "Suggested.lean states Waterhouse's list of elliptic Frobenius traces (4.6) and, for orders in finite étale rational algebras, the colon criterion for weak equivalence (8.6), the Gorenstein criterion (8.4) and the finiteness of the Picard group (8.2); every statement through `π_A` and `P_A`, Deligne's equivalence, Centeleghe–Stix and the polarization and Jacobian theorems are not statable at the pins and are named in its module docstring."

## R02 (P3) — the description attributes Tate's theorem to the wrong supplier and omits two suppliers

**Location:** pull request description, prose paragraph: "on Tate's theorem, the local invariants and Honda–Tate consumed from AbelianSchemesAndArithmeticModuliPartII".

**Claim:** The head consumes Tate's theorem and the lattice classification from ArithmeticStatisticsPartI, not from Part II; the Frobenius itself comes from DeligneWeightsAndPurity DWP.1 and every polynomial-level invariant from CurvesOverFiniteFields Layer 1, neither of which the prose names.

**Witness:** `README.md:17–20` ("Part II F3.2 for Honda–Tate and local invariants, and ArithmeticStatisticsPartI Supporting constructions for Tate and the all-prime lattice classification"), `README.md:314–315`, `README.md:90–91` (DWP.1), `README.md:97–104` (CurvesOverFiniteFields 1.1–1.11, 3.4).

**Repair:** Replace the clause with: "on the `q`-Frobenius and the Weil estimate from DeligneWeightsAndPurity DWP.1, Tate's theorem and the all-prime lattice classification from ArithmeticStatisticsPartI (Supporting constructions), the local invariants and Honda–Tate from AbelianSchemesAndArithmeticModuliPartII (F1.11, F3.2), and the Weil-polynomial invariants (slopes, angles, twists, Weil powers, virtual counts) from CurvesOverFiniteFields Layer 1 and 3.4".

## Previous findings

- none: the review of `e411d44` listed no finding (it accepted the folder; its eight `Previous findings` bullets were all "repaired"), and the folder has not changed since.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `waterhouse` (4.6; the statement R01's sentence should name) | `q = 8` (`p = 2`, `r = 3`); `q = 25` (`p = 5`, `r = 2`) | `q = 8`: `a² ≤ 32`; odd `a` give `±1, ±3, ±5`; `a² = 2⁴` gives `±4`; `a = 0` (odd `r`); `±2` refused. `q = 25`: `±10`; `±5` (`5 % 3 = 2`); `a = 0` refused (`5 % 4 = 1`); 16 traces prime to 5 | matches the known lists (`𝔽_8`: `0, ±1, ±3, ±4, ±5`) | none |
| `finite_pic` (8.2; named by R01's repair) | `E = ℚ × ℚ`, `Λ = {(a, b) : a ≡ b mod 3}`; `E = 0` | `𝓞 = ℤ²`, `Pic 𝓞 = 1`, `(𝓞/3)^× = (ℤ/3)^× × (ℤ/3)^×` of order 4, `(Λ/3𝓞)^×` of order 2, `𝓞^×/Λ^× = {±1}²/{±(1,1)}` of order 2, so `#Pic Λ = 4/(2·2) = 1`; zero ring: one class | finite | none |

The rows for all other statements stand as in the previous review, of `e411d44`.

- Description against the head: "11 layers and 51 milestones" — 11 `## Layer` headings and 51 numbered `###` sections (8, 2, 2, 1, 7, 5, 5, 7, 6, 6, 2) counted; `metadata.toml` is `topic = "math.NT"`; the title says the pull request adds a roadmap and the folder is not on main (2683 insertions, 0 deletions). The summary block's sentences each match a heading or scope bullet of the README (Layers 1–11, `README.md:2310–2311` for the Sato–Tate sentence).
- Gate, run on the worktree this round: every counter 0, `OK` (the worker's run adds `build=0`). `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Dependency check: `depcheck: 238 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives four `declaration uses 'sorry'` warnings (lines 38, 89, 115, 148) and nothing else. No statement changed, so the one-tactic probe and the `#check` comparison stand as in the previous review.
- Cross-roadmap citations resolved again where a head moved: CurvesOverFiniteFields is now at `0a47bd8a` (was `ab3bbe02`); its 1.1–1.11, 2.3, 3.4, 4.1, convention 10 and `card_frobeniusAngles` (`Suggested.lean:142`) are all still there, and its placement table (lines 135–139) still hands 5.4–5.6 to this roadmap. AbelianSchemesAndArithmeticModuliPartII at `6684834b`: F3.2 at its line 2747; its lines 146–154 confirm that ArithmeticStatisticsPartI owns Tate's theorem and the lattice space (the witness of R02). ArithmeticStatisticsPartI: "Tate's theorem over a finite field" at its line 2543.
- Overlap facts: `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no second copy.
- Remark (untouched text, no change asked): `README.md:2310` says SatoTateGroups consumes the invariants of Layers 3, 5 and 6; at its head `434744bc` that roadmap names this one once (its line 159), as the owner of abelian varieties over finite fields, and cites no section of it.

Overlap check: read CurvesOverFiniteFields, QuaternionArithmetic, AbelianSchemesAndArithmeticModuliPartII, SatoTateGroups; Weil polynomials as polynomials — CurvesOverFiniteFields (its Layer 1), their application to `P_A` — this roadmap (Layers 5–7); Gorenstein and Bass orders — this roadmap for the commutative étale instance (8.4), QuaternionArithmetic for the quaternion instance (its line 147); Tate's theorem and Honda–Tate — ArithmeticStatisticsPartI and Part II F3.2; nothing shared with SatoTateGroups.

Source independence: changed passages only — the folder changed by 0 lines, so 0 passages were compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered); by a rough count of the README's locators no source dominates (`hnr2009` about 15, `marseglia-icm` and `marseglia-sqfree` together about 12, Tate about 11, of roughly 75).

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests, outside this folder's review.
- The items of the previous review's `## Not verifiable` stand unchanged (Deligne 1969 Theorem 7 page numbers: the cached `deligne1969` text is not the article; the overlines in `marseglia-sqfree` Theorems 5.2 and 5.4; Weil 1957; Lauter 2000 and Howe–Lauter 2003; the locator-only references).

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md:2431–2485` (Provenance) names two public formalisations (formal-arithmetic-geometry/weil-conjectures, AxiomMath/Weil) as proof sources and states both are Apache-2.0; the licence statement was not checked against the repositories, and no declaration of `Suggested.lean` was compared with them this round.
- **Not tested.** The cached text for `deligne1969` is the volume's front matter, not the article, so the locator "Theorem 7, pp. 240–241" (9.1, 9.2) has not been checked against the text in any round.
