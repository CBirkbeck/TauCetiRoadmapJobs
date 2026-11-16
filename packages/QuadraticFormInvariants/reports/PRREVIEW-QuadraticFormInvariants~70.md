# Review of QuadraticFormInvariants (pull request #1411 at 60aa3a4)

**Verdict:** accepted

No finding.

## Previous findings

- R01 — repaired: the description now reads "Checks are added for the Witt ring (Layer 4), the quadratic defect (6B), the Hilbert symbol and the sign dictionary `TauCeti.hilbertSign` (6C) and the Stiefel–Whitney classes (Layer 8)", then states the supplier-contract and Dependencies changes.

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| D1 | Description: Checks for the Witt ring (Layer 4), the defect (6B), the Hilbert symbol and `TauCeti.hilbertSign` (6C), Stiefel–Whitney classes (Layer 8) | the five added Checks blocks of `git diff origin/main...HEAD` | README 1005 (Layer 4, 973–1130), 1438 (6B, 1394–1534), 1545 and 1700 (6C, 1535–1723), 2354 (Layer 8, 2308–2419); none elsewhere | holds | none |
| D2 | Description: "seventeen are reducible aliases", `cup` a definition with value `TauCeti.TopPairing.cup` | main's `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`, identical in this branch | README 363–367 lists 17 names; all 17 are `abbrev` (lines 119–522); `cup` is a `def` at 353 with body `TauCeti.TopPairing.cup P m n a b` | holds | none |
| D3 | Description: restriction, inflation, Kummer map, isomorphism and sequence, Hilbert 90, `B²`, the `(1, 1)` cup "have no name of their own there" | grep of the same file for `res`, `infl`, `kummerMap`, `kummerIso`, `kummerShortExact`, `hilbert90`, `B2`, `explicitCup11` | 0 declarations of the 8 names; README 370–375 gives the 8 Tau Ceti names | holds | none |
| D4 | Description: "the introduction of Layer 7"; "The Dependencies of Layers 3 and 5 name Layer 1" | hunks at README 1920, 967, 1310 | 1920 lies between the Layer 7 heading (1904) and 7A (1927); 967 "Layers 0 to 2."; 1310 "Layers 0 to 4 of this roadmap" | holds | none |
| D5 | Title "QuadraticFormInvariants: Checks"; summary "No quadratic-form-invariants statement changes"; "`Suggested.lean` is untouched"; "A revision of the … QuadraticFormInvariants roadmaps" | the folder's diff against the merge base | 1 file, 88 insertions, 17 deletions, all in `README.md`; 0 headings and 0 Lean declarations changed; the roadmap is on main; no supplier row added or dropped | holds | none |
| D6 | Description: "It no longer changes ClassFieldTheory or `Completed/LocalGaloisGroups`" | three-dot diff outside the two folders | empty; the pull request changes 3 files, two in `IntegralLattices`, one here | holds | none |
| C1 | Hilbert-symbol Checks cited by D1 (README 1545–1557) | `ℚ_2`: `(2, 5)`, `(5, 5)`, `(−1, −1)`; `ℚ`: `(−1, 21)` | `5` is a nonsquare unit with unramified `ℚ_2(√5)`, `v(2) = 1` odd: `−1`; `5 = 25 − 5·4`: `+1`; `−1` is no sum of two squares in `ℚ_2`: `−1`; `21 = 3·7`, both `≡ 3 mod 4`: `−1`, while `(−1,3)(−1,7) = +1` | holds | none |
| C2 | Stiefel–Whitney Check cited by D1 (README 2359–2361) | `w₂⟨−1, 2⟩` over `ℚ_2`, strict pairs against `i ≤ j` | `2 = 1² + 1²` gives `(−1, 2)_2 = +1`, so `0`; the non-strict sum adds `(−1)∪(−1) ≠ 0` as `(−1, −1)_2 = −1` and `(2, 2)_2 = (2, −1)_2 = +1` | holds | none |

The rows for untouched statements stand as in the previous review, of `60aa3a4`.

- Incremental re-review of 0 changed lines since `60aa3a4`: the folder is unchanged, so this round reads the pull request's title and description against the head; no target of the seeded sample falls in a changed passage.
- Library declarations opened at the pinned Tau Ceti: `hilbertSign` (`Data/ZMod/IntUnitsPower.lean` 62), `quadraticDefect` (`NumberTheory/LocalField/QuadraticForm/Defect/Basic.lean` 247), `sw1Class` and `sw2Class` (`FieldTheory/QuadraticForm/StiefelWhitney/Class.lean` 100, 198).
- Cross-roadmap citations resolved: ProfiniteCohomology's 18 declaration names against main's `Suggested.lean` (D2, D3).
- The description's **Dependencies** paragraph lists IntegralLattices' suppliers (it names Quadratic Form Invariants among those dropped); this folder's suppliers are unchanged against main.
- Gate: the worker's run passes every check; my run with `--base origin/main` reports only `outside-folder=2`, the two `IntegralLattices` files, which are this pull request's own.
- Dependency check, verbatim: `depcheck: 261 roadmaps, 2605 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output (its theorems are proved, so there is no `sorry` warning); the four signatures in `scratch/signatures.md` carry every binder their README statements name.

Overlap check: read QuadraticFormInvariantsPartII, GeometryOfNumbersAndQuadraticArithmeticPartII, OrthogonalSpinGroups, QuaternionArithmetic, RealSurfacePeriodIndex, GlobalQuadraticForms, ProfiniteCohomology, LocalFieldsRamification; nothing shared. As in the previous review; the overlap facts at this head list no shared folder, dropped id, open-revision id or second copy.

Source independence: changed passages only: 0 passages compared with 0 sources, none shared (the folder did not change since `60aa3a4`); largest share lam2005, 33 of 99 locators; contents not compared again, since no layer is added, removed or reordered; lam2005's text and contents page could not be read.

Research link: Layer 9 is the degree-two case of Kahn's relative Stiefel–Whitney formula (Kahn 1984, Théorème 2), proved through Serre's trace-form theorem (Serre 1984, Théorème 1′); Layers 5 and 7 give the invariant `e₂` of Elman–Karpenko–Merkurjev (2008, Theorem 14.3). Rests on the README's References and on `kahn1984`, `serre1984cmh`, `ekm2008`.

## Not verifiable

- Locators into `lam2005`, `serre1973cia`, `serre1979lf`, `omeara1963`, `scharlau1985`, `gilleszamuely2017`, `milnor1970` and `delzant1962`: settled as uncertified, no text to read; none is in a changed passage.

## Source issues

- none

## For the human reviewers

- **Not tested.** `lam2005` carries 33 of the README's 99 locators and is uncertified: its wording was not compared with the roadmap, and its contents were compared only through the chapter numbers the README's References give.
