# Review of ReflectionInvariantTheory (pull request #2539 at e508575)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. This was an incremental re-review of the 8 lines changed since `7001076`. The overview now states the height partition and the Coxeter-number statements for a reduced crystallographic root system, and the new `BC₁` Check of §4.5 is true in every value it gives, including its claim that Mathlib's `RootPairing.Base` admits no base for `BC₁`. The pull-request description was brought in line. There are no small corrections and no format notes; the human reviewers have the same two facts to note as before.

## Previous findings

- R01 — repaired: the overview reads "For the Weyl group of a reduced crystallographic root system, `#{i : eᵢ ≥ j}` positive roots have height `j`" (line 19); the next sentence, "For an irreducible one", inherits it. `BC₁` is now a Check of §4.5 (lines 795–800).
- C01 — repaired: the description's third bullet reads "for Weyl groups of reduced crystallographic root systems, the height partition of the positive roots; for irreducible ones, the dictionary between degrees and root data".

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Overview, lines 19–22, with "reduced" | `BC₁`; `B₃`; `G₂` | `BC₁` now excluded. `B₃`: heights `3,2,2,1,1` vs `#{eᵢ ≥ j}` for `1,3,5`: `3,2,2,1,1`; `|Φ|/r = 18/3 = 6 = h`. `G₂`: `2,1,1,1,1` both sides | true | none |
| §4.5 Check `BC₁` (new) | `Φ = {±α, ±2α}`, `W = {±1}` on a line | invariants `K[x²]`: degree `2`, exponent `1`; `ht(2α) = 2`, `#{eᵢ ≥ 2} = 0`; `ord(s) = 2`, `|Φ|/r = 4/1 = 4` | true | none |
| §4.5 Check `BC₁`, "Mathlib's `RootPairing.Base` … gives it no base" | supports `∅`, `{±α}`, `{±2α}` (one element at most, by linear independence) | `∅`: roots nonzero. `{±α}`: coroot `(2α)^∨ = α^∨/2` is no `ℕ`-multiple of `±α^∨`. `{±2α}`: root `α` is no `ℕ`-multiple of `±2α` | true | none |
| §4.5, `card_height_eq_card_degrees` (cited by the Check) | `BC₁`; `B₃` | `[P.IsReduced]` in the signature (line 176), so `BC₁` is outside it; `B₃` as above | true | none |

The rows for the untouched statements stand as in the previous review, of `7001076`.

- Source locators checked against the text: none this round; the changed passages (the word "reduced" in the overview, the `BC₁` Check) carry no locator, and no target of the seeded sample falls in them. The README flags no locator as unverified.
- Library declarations opened at the pins: Mathlib `LinearAlgebra/RootSystem/Base.lean:68–76` (`RootPairing.Base`: fields `linearIndepOn_root`, `linearIndepOn_coroot`, `root_mem_or_neg_mem`, `coroot_mem_or_neg_mem`; the last is the coroot condition the Check cites). `[P.IsReduced]` is in all six Layer 4 theorems of `Suggested.lean` (lines 141, 154, 164, 176, 189, 204).
- Cross-roadmap citations: the changed passages add none; the citation and overlap leads list nothing new (the one unresolved name, `etale_of_etaleAt_codimOne`, is PurityOfBranchLocus's own, resolved in the previous review).
- Automatic checks: all passed, none set aside. Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives eleven `declaration uses 'sorry'` warnings and nothing else; the file is unchanged since `7001076`.
- Description against the head: "64 Checks in 26 sections" counted and correct (63 before, plus `BC₁`); the description names the `BC₁` Check and states the Layer 4 headlines for reduced pairings.
- Agreement within the roadmap: the `BC₁` Check agrees with Convention 7 (reduced), §4.4's `|Φ| = r · ord(c)` and §4.5's partition, all of which assume reducedness.

Overlap check: read OrthogonalTamagawaAndLatticeMass (open), RootSystems, LieHighestWeight, RootSystemsPartII (main); the results-and-headings list was empty; nothing shared beyond what the previous review recorded (the Weyl Coxeter presentation, greatest roots and the classification belong to RootSystems and Tau Ceti and are cited here; degrees, exponents and `|W| = ∏ dᵢ` belong to this roadmap). The change adds no object.

Source independence: changed passages only; 2 passages (the overview sentence, the `BC₁` Check) compared with Macdonald1972 (§2.1, Corollary (2.7)) and Steinberg1959 (Theorem 1.4); none shared, and neither source treats `BC₁`. Largest share Stanley1979, 11 of 42 locators; the arrangement was not compared again, since the change adds, removes and reorders no layer.

Research link: Layer 2 is the Chevalley–Shephard–Todd theorem (Shephard–Todd 1954; Chevalley 1955) with Steinberg's stabilizer theorem (Steinberg 1964). Layer 4 is the Coxeter-element and exponent theory of Coleman 1958, Kostant 1959, Steinberg 1959, Macdonald 1972 and Springer 1974, which CharacteristicClasses C5a.7 uses for the rational cohomology of compact Lie groups. Rests on the README's References and the sources read.

## Not verifiable

- Fleischmann 2000 (uncertified): cited only through Fogarty 2001, p. 5; not read.
- Bourbaki 2002 (uncertified), Hochster–Eagon 1971, Shephard–Todd 1954, Chevalley 1955, Serre 1967, Kostant 1959, Coleman 1958, Humphreys 1990, Kane 2001, Smith 1995: listed in the References with no locator in the README; not fetched.
- The seeded sample's targets lie in passages unchanged since `7001076`; they were not reread in this incremental round.

## Source issues

- none

## For the human reviewers

- Licence: Springer 1974 and Macdonald 1972 were read as OCR of open GDZ scans; Stanley 1979, Smith 1997 and Steinberg 1959 from the free AMS back issues; SGA 1 from arXiv math/0206203.
- `STATUS.md` in this folder (generated; unchanged by this pull request) reports Tau Ceti proofs later than the pinned commit, so several `Suggested.lean` statements may be library theorems once the pin moves.
