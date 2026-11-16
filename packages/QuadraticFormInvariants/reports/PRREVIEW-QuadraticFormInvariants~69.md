# Review of QuadraticFormInvariants (pull request #1411 at 60aa3a4)

**Verdict:** needs changes

## R01 (P3) — The description names two Checks blocks the head does not add, omits one it adds, and leaves the two README repairs unstated

**Location.** Pull request description, paragraph **QuadraticFormInvariants**: "Checks are added for the Witt ring and its fundamental ideal (Layer 4), the quadratic defect (6B), the Hilbert symbol and the local Hasse invariant (6C) and the Stiefel–Whitney classes (Layer 8)."

**Claim.** The change adds Checks for the fundamental ideal and for the local Hasse invariant, and changes nothing else in the folder.

**Witness.** `git diff origin/main...HEAD` on the folder: Checks blocks at README 1005, 1438, 1545, 1700 ("**Checks** for the dictionary `TauCeti.hilbertSign`") and 2354; none under the fundamental ideal (1022) or item 7 (1628). Further hunks at 363, 967, 1310, 1920.

**Repair.** Replace the paragraph's first sentence by: "Checks are added for the Witt ring (Layer 4), the quadratic defect (6B), the Hilbert symbol and the sign dictionary `TauCeti.hilbertSign` (6C) and the Stiefel–Whitney classes (Layer 8). The ProfiniteCohomology supplier contract and the opening of Layers 7 to 9 describe that roadmap's declarations as main has them, and the Dependencies of Layers 3 and 5 name Layer 1."

## Previous findings

- R01 — repaired: README 363–376 lists 17 names as "reducible aliases of Tau Ceti's declarations", `cup` as "a definition whose value is Tau Ceti's `TauCeti.TopPairing.cup` applied to its two arguments", and eight operations under Tau Ceti names only; 1920–1925 agrees.
- R02 — repaired: README 967 "Layers 0 to 2."; README 1310 "Layers 0 to 4 of this roadmap".
- R03 — not repaired: the description still reads "Checks are added for the Witt ring and its fundamental ideal (Layer 4), … the Hilbert symbol and the local Hasse invariant (6C)"; written again as R01 above.

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| F1 | ProfiniteCohomology's aliases (README 363–369) | main's `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`, each of the 17 names | All 17 are `abbrev` (lines 119, 128, 149, 155, 181, 203, 213, 218, 223, 229, 234, 239, 388, 393, 400, 408, 522), each with a Tau Ceti value; `cochainClass` is `TopRep.cochainClass`, declared in Tau Ceti's `Resolution/Basic.lean` 164 | holds | none |
| F2 | `cup` (README 367–368, 1924) | main's `Suggested.lean` 353–359 | `noncomputable def cup … := fun a b => TauCeti.TopPairing.cup P m n a b`: a `def`, not an `abbrev`; value as the README says. Over `ℚ_2`, `(2) ∪ (5) ≠ 0` under either name | holds | none |
| F3 | "declares no name of its own" for eight operations (README 370–375) | grep of main's `Suggested.lean` for `res`, `infl`, `kummerMap`, `kummerIso`, `kummerShortExact`, `hilbert90`, `B2`, `explicitCup11` | 0 declarations (only `galoisRes`, on `𝔽₂` coefficients along `L/K`). Tau Ceti: `Functoriality.lean` 358, 488; `Kummer.lean` 250, 384; `Coefficients.lean` 280; `Hilbert90.lean` 267; `LowDegree.lean` 515; `Cup/Product.lean` 567, in the namespaces cited | holds | none |
| F4 | Four aliases at README 1920–1923 | main's `Suggested.lean` 393, 400, 408, 522 | Values `TauCeti.trivialF2TopPairing G`, `TauCeti.ContCohomology.homClass H α hα`, `TauCeti.ContCohomology.inhomogeneousCochain2 f hf`, `TauCeti.galoisF2Iso K L σ n` | holds | none |
| F5 | Dependencies of Layers 3 and 5 (README 967, 1310) | every `*Needs:*` line of the two layers | Layer 3: 890 names Layer 1, covered by "0 to 2". Layer 5: 1210 names Layers 1 and 2, covered by "0 to 4"; agrees with README 387 | holds | none |
| F6 | Description against the diff | 5 Checks blocks, 4 further hunks | Blocks at 1005, 1438, 1545, 1700, 2354; hunks at 363, 967, 1310, 1920; 0 headings and 0 Lean declarations changed, so "No statement changes and `Suggested.lean` is untouched" holds | first sentence wrong | R01 |

The rows for untouched statements stand as in the previous review, of `dfca92f`.

- Incremental re-review of 39 changed lines since `dfca92f`; the diff changes no statement, no heading, no layer and no source locator, and no target of the seeded sample falls in a changed passage.
- Library declarations opened at the pinned Tau Ceti: 13 (the eight of F3, `trivialF2TopPairing` at `Cup/TrivialF2/Basic.lean` 67, `homClass` at `TrivialF2/Character.lean` 103, `inhomogeneousCochain2` at `InhomogeneousF2.lean` 116, `galoisF2Iso` at `GaloisCohomology/Restriction.lean` 62, `TopPairing.cup` at `Cup/Cohomology.lean` 169).
- Cross-roadmap citations resolved: ProfiniteCohomology's 18 declaration names against main's `Suggested.lean`, which is identical in this branch; the lead `ProfiniteCohomology.f2Pairing` of the citation check is that file's line 393.
- Title and summary block: "QuadraticFormInvariants: Checks" and "No quadratic-form-invariants statement changes" agree with the head; the description's supplier list concerns IntegralLattices, and this folder's suppliers are unchanged against main.
- Gate at this head: the worker's run passes every check; my run with `--base origin/main` reports only `outside-folder=2`, the two `IntegralLattices` files, which are this pull request's own. The three-dot diff outside the two folders is empty.
- Dependency check, verbatim: `depcheck: 261 roadmaps, 2605 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; the file is unchanged since `dfca92f`, and the four signatures in `scratch/signatures.md` are those the previous review compared.

Overlap check: read QuadraticFormInvariantsPartII, GeometryOfNumbersAndQuadraticArithmeticPartII, OrthogonalSpinGroups (main's `Completed` copy), QuaternionArithmetic, RealSurfacePeriodIndex, GlobalQuadraticForms, ProfiniteCohomology, ClassFieldTheory; nothing shared. As in the previous review; the overlap facts at this head list no shared folder, dropped id or second copy, and ProfiniteCohomology's declarations were read again for F1–F4.

Source independence: changed passages only: 4 passages compared with 0 sources, none shared (the changed passages describe library and supplier declarations and cite no source); largest share lam2005, 33 of 99 locators; contents not compared again, since the diff adds, removes or reorders no layer; lam2005's text and contents page could not be read.

Research link: Layer 9 is the degree-two case of Kahn's relative Stiefel–Whitney formula (Kahn 1984, Théorème 2), proved through Serre's trace-form theorem (Serre 1984, Théorème 1′); Layers 5 and 7 give the invariant `e₂` of Elman–Karpenko–Merkurjev (2008, Theorem 14.3). Rests on the README's References and on `kahn1984`, `serre1984cmh`, `ekm2008`.

## Not verifiable

- Locators into `lam2005`, `serre1973cia`, `serre1979lf`, `omeara1963`, `scharlau1985`, `gilleszamuely2017`, `milnor1970` and `delzant1962`: settled as uncertified, no text to read; none is in a changed passage.

## Source issues

- none

## For the human reviewers

- **Not tested.** `lam2005` carries 33 of the README's 99 locators and is uncertified: its wording was not compared with the roadmap, and its contents were compared only through the chapter numbers the README's References give.
