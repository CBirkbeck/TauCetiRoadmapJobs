# Review of HomologicalStabilityOfGeneralLinearGroups (pull request #2036 at 41c3fd5)

**Verdict:** needs changes

## R01 (P3) — The description's source list leaves out five works the README cites

**Location:** pull-request description, `## Sources`: "Cited at the level checked: Nesterenko–Suslin 1989 (…), Guin 1989 (…); Dwyer 1980, Suslin 1984, … Randal-Williams–Wahl 2017, GKRW finite fields 2024 (Theorems A and B)."

**Claim:** "Read in open copies" and "Cited at the level checked" together are meant to account for every source. Five works the README cites appear in neither list:
- Szymik 2020 and Quillen 1972, in the non-target after 2.2;
- Sprehn–Wahl 2020 and Schlichting 2017, in Research context;
- Bass 1968, in References.

A reader cannot tell whether these five were checked, or how.

**Witness:** README line 428, "`H³(GL₆(𝔽₂); 𝔽₂) ≠ 0` (Szymik 2020)"; line 431, "(Quillen 1972)"; lines 721–722, "(Sprehn–Wahl 2020) … Schlichting 2017"; line 763, Bass 1968. None of the five names occurs in the description.

**Repair:** end that sentence with: "; Szymik 2020 and Quillen 1972 (the non-target after 2.2), Sprehn–Wahl 2020 and Schlichting 2017 (Research context), Bass 1968, Chapter V (References only)". If any of them was opened (Szymik, Sprehn–Wahl and Schlichting are on arXiv), move it to "Read in open copies" with the locators that were read.

## Previous findings

- none: the review of 41c3fd5 raised no finding.

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Description, Layer 2: the semilocal range `m ≤ n` (2.3, `homology_stabilization_of_infinite_residueFields`) | `ℚ × ℚ`, `m = n = 1`; `ℤ_(2)` | `ℚ × ℚ`: `H₁(GL₁) = (ℚˣ)² → H₁(GL₂) = (ℚˣ)²` through the two determinants, bijective. `ℤ_(2)`: residue field `𝔽₂`, so it is excluded, and the map is not onto (2.3, Checks) | holds | — |
| Description, Layer 1: transitivity up to length `d + ε + 1` (1.1) | `GL₂(𝔽₂)`, `t = 0`, `sdim = 0` | `d = 0`, `ε = 0`, so lengths `≤ 1` are claimed. The 3 nonzero vectors form one orbit, and `Stab(e₁)` has order `6/3 = 2` | holds | — |
| Non-target after 2.2, `m = 3` (Szymik 2020, Quillen 1972; R01) | `GL₆(𝔽₂)`, `GL₇(𝔽₂)` | Universal coefficients: `H³(G; 𝔽₂) = Hom(H₃G, 𝔽₂) ⊕ Ext(H₂G, 𝔽₂)`. `H₂(GL₆(𝔽₂)) = 0` (L₆(2) has trivial multiplier), so `H₃/2 ≠ 0`. `H₃(GL₇) ≅ H₃(GL(𝔽₂))` (2.1, `n ≥ 7`) has 2-part `0`. Hence not injective at `n = 6` | holds | — |
| Research context, `ℤ/9`, `m = 1` (paragraph citing Sprehn–Wahl, Schlichting; R01) | `n = 1, 2, 3` | `(ℤ/9)ˣ = ℤ/6`. `n = 2`: `[diag(−1,1), e₁₂(x)] = e₁₂(−2x)`, and `−2` is a unit, so `SL₂ = E₂ ⊆ [GL₂, GL₂]` and `H₁ = ℤ/6` through the determinant. `n = 3`: `E₃` is perfect, so `H₁ = ℤ/6` | holds | — |
| Description, Acceptance test: "states 6 headlines" | `Suggested.lean` | 4 definitions (`affineGroup`, `affineInclusion`, `elementaryStabilization`, `standardRep`) and 6 `theorem`s, with `sorry` at lines 76, 98, 113, 130, 151 and 166 | holds | — |

The rows for statements this round leaves untouched stand as in the previous review, of `41c3fd5`.

- **Gate.**
  - The worker's gate passed.
  - I reran it here with `--build` and the candidate order: every counter is 0, `build=0`, `OK`.
  - Against the default order the gate reports only `depcheck: NOT IN ORDER`. This is expected: the candidate order lists the roadmap at line 39, after SchemeKTheoryOperations at 38.
- **Dependency check** (the brief's command): `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`, with no UPWARD and no CYCLE line.
  - AlgebraicKTheory and StableHomotopyKTheory are now on main (3cf7342).
  - GeneralAlgebraicKTheory (merge order 19) and SchemeKTheoryOperations (38) come before this roadmap (39).
- **Elaboration.** `lake env lean` at Mathlib 1b1ccf4 and Tau Ceti 2fd255d gives exactly six `declaration uses sorry` warnings (lines 76, 98, 113, 130, 151, 166) and nothing else.
  - The folder diff since 41c3fd5 is empty, and so is the diff outside the folder.
  - `signatures.md` lists 10 types, with no dropped binder.
  - Seeded sample: no target falls in a changed passage.
- **Supplier sections re-resolved** (13 in all). The full list is in the table below.
  - SchemeKTheoryOperations §6.7 is at 1dfb7dd (heading at line 2511):
    - frames with the ranges `n−2−s` and `n−2−s−k` (2567);
    - directed unions (2583);
    - the GL_n theorem (2593);
    - scope line 12 names this roadmap as a consumer.
- **Pull-request text.** I read it sentence by sentence against the head:
  - the title;
  - three files, with `topic = "math.KT"`;
  - nothing changed outside the folder;
  - "Depends on" equals the supplier contracts (four roadmaps, the same sections);
  - the bullets for Layers 1–3 against 1.1–3.4;
  - ownership;
  - "Out of scope" against README lines 90–99;
  - "Acceptance test" against `Suggested.lean` (imports at lines 3–5, four definitions, six headlines, the docstring's list of what is not statable);
  - the points to check.

  Only R01 remains. The description has no `<!-- roadmap-summary -->` block. Its elaboration bullet records a check at Mathlib f6090c7 and Tau Ceti 358314d with stubs. That record is true, and the gate's build covers the pins.
- **Remark, no change asked.**
  - K3BlochGroups at cf5467c (its README lines 27 and 116–118) now consumes 1.3 and 2.3 for its §§4.8 and 4.22. It has also dropped `generalLinear_homology_stable` and `generalLinearStabilization`, which README lines 78, 520 and 690–695 still name, beside "No roadmap consumes a target of this one".
  - Bass 1968 (line 763) is cited nowhere in the body.

| Supplier | Where read | Sections and lines |
|---|---|---|
| AlgebraicKTheory | main, `Suggested.lean` | 4.1: `HasStableRangeLE` :272, `surjective_stability` :280, `injective_stability` :293. 4.2: :306, :313 |
| StableHomotopyKTheory | main, README | 1.30 :464, 1.32 :493, 3.12 :1132, 3.16 :1187, 3.25–3.27 :1290–1320, 3.31 :1375, 4.14 :1649 |
| SchemeKTheoryOperations | head 1dfb7dd | §6.7 (heading :2511) |
| GeneralAlgebraicKTheory | head 43e9df6 | 3.2 :419; 3.14 :646, which contains `K(R) ≃ K₀(R) × BGL(R)⁺` |

Overlap check: read K3BlochGroups, K2SymbolsBrauer, ProjectiveModulesOverPolynomialRings, SchemeKTheoryOperations and CohomologyOfGroups (open), and AlgebraicKTheory (main). The objects they share with this roadmap, and the owner of each:
- hyperhomology, frames and the GL_n theorem: SchemeKTheoryOperations §6.7, which this roadmap cites;
- stable range and the stability of K₁: AlgebraicKTheory 4.1–4.2, which this roadmap cites;
- hyperhomology over any ring `k`: CohomologyOfGroups 2.1, not used here;
- Suslin's spectral sequence and the semilocal range: this roadmap's 1.3 and 2.3, which K3BlochGroups consumes;
- the Nesterenko–Suslin property over infinite fields: a common special case of K3BlochGroups 4.3 and of 1.3, as the Scope section states.

Source independence: changed passages only. The diff changes none, so 0 passages were compared. The largest share of locators is van der Kallen 1980's, 27 of the 51 source citations in the body. The arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Nesterenko–Suslin 1989 and Guin 1989 (2.3) were not opened, as in earlier rounds. They are cited through GKRW 2025, arXiv:2005.05620v3, Theorem 9.4.
- Szymik 2020, Quillen 1972, Sprehn–Wahl 2020 and Schlichting 2017 were not opened this round: they are cited only in untouched text.

## Source issues

- none

## For the human reviewers

- Two passages rest on computations that the README labels "own computation", with no published source:
  - lines 664–672: `H¹(GL_n(𝔽₂); 𝔽₂ⁿ)` for `n ≤ 5`;
  - lines 724–728: `H_m(GL_n(ℤ/9); ℤ)` for `m ≤ 2`.
