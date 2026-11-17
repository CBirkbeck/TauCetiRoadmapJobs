# Review of IntegralLattices (pull request #617 at da24d08)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `dec9d6b`. The head is a merge of main `c1107359`, which contains #1215 (`df3858aa`). `README.md` and `Suggested.lean` are byte-identical to `dec9d6b`; the pins are unchanged. Two findings, both P3.

## R01 (P3) — Gate `outside-folder`: five files under `Completed/` change in this pull request

- **Location.** `Completed/LocalFieldsRamification/COMPLETION.md`, `README.md`, `Suggested.lean`; `Completed/LocalGaloisGroups/README.md`, `Suggested.lean`. Description: "This pull request's own roadmap is LocalFieldsRamification. It carries the revision of IntegralLattices…"
- **Claim.** The gate still fails, so this folder cannot be accepted. The list grew by `Completed/LocalGaloisGroups/Suggested.lean`: its 6 changed lines were counted with #1215's while that was open.
- **Witness.** The worker's gate and my rerun at `da24d08` both print `outside-folder=5 … FAIL` with exactly these files; every other scanner is 0. `git diff --stat origin/main...HEAD` outside the folder lists the same five.
- **Repair.** Open the IntegralLattices revision as its own pull request (its `README.md` and `Suggested.lean` name neither LocalFieldsRamification nor LocalGaloisGroups), keeping the order before #1411; or move the `Completed/` changes to a separate pull request; or have the board register the two `Completed/` folders as this pull request's own. Test: the gate prints `outside-folder=0`.

## R02 (P3) — The description still presents #1215's changes as part of this pull request

- **Location.** Description, summary block: "The class field theory, global quadratic forms, integral lattices and quadratic-form invariants roadmaps now consume what Tau Ceti proves…"; prose: "**Merge order.** #1215 (ClassFieldTheory) → this pull request."
- **Claim.** #1215 is on main and merged into this head. This pull request no longer changes ClassFieldTheory, GlobalQuadraticForms or QuadraticFormInvariants, and nothing merges before it; the summary block does not name LocalFieldsRamification, the pull request's own roadmap.
- **Witness.** `git log origin/main`: `df3858aa ClassFieldTheory: correct hypotheses, conductors and lifting (#1215)`. `git diff --stat origin/main...HEAD`: only `TauCetiRoadmap/IntegralLattices/{README.md,Suggested.lean}` and the five `Completed/` files of R01. Generated block: "No open pull request must merge before this one".
- **Repair.**
  - Summary block, first paragraph: "**What this revision changes.** The local-fields ramification roadmap supplies the cyclic prime-power arithmetic for Hasse–Arf and completes the graded-norm programme; Local Galois Groups cites the tame-inertia quotient from Tau Ceti. Integral lattices consumes what Tau Ceti proves through exact supplier contracts and restates its genus, double-coset, 2-elementary and indefinite unimodular targets on the native lattice carrier." In "What the roadmap keeps", drop the class-field-theory, global-quadratic-forms and quadratic-form-invariants clauses.
  - Prose: delete the sentence "ClassFieldTheory, QuadraticFormInvariants and GlobalQuadraticForms are exactly as #1215 leaves them." and replace the "Merge order." paragraph by "**Merge order.** #1215 is on main. The branch is main plus this pull request's own changes to LocalFieldsRamification, LocalGaloisGroups and IntegralLattices."

## Previous findings

- R01 — not repaired: the gate at `da24d08` prints `outside-folder=5` (the three `Completed/LocalFieldsRamification` files, `Completed/LocalGaloisGroups/README.md` and `Suggested.lean`). Raised again as R01.

## Verified sound

| Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| 5G `forall_exists_primitiveEmbedding_iff` (Nikulin 1.12.4), `(t₊,t₋,l₊,l₋)` | `(0,0,8,0)`; `(1,0,1,1)`; `(1,0,1,0)`; `(1,1,1,1)`; `(2,0,2,2)`; `(0,0,0,0)` | `0 ↪ E₈` / `8 ≡ 0`: true/true. `⟨2a⟩ ↪ U` by `e + af` / `2 ≤ 2`: true/true. No even unimodular rank 1 / `1 ≢ 0`: false/false. `U(2)`, det `−4 ≠ −1` / `4 ≤ 2` fails: false/false. `A₁² ↪ U²` / `4 ≤ 4`: true/true. Zero lattice / all hold: true/true | holds | none |
| 3H/4B/6A input: GlobalQuadraticForms 6.3 `hasseMinkowski_equivalent` with 8.4, as on main `2bfb0f3` | `H` vs `⟨2,−2⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩` | both `≅ H`: true/true; discriminant ratio `3`, not a square in `ℚ₃`: false/false | holds | none |

The rows for all other statements stand as in the previous review, of `dec9d6b`.

- Folder: `git diff dec9d6b da24d08 -- TauCetiRoadmap/IntegralLattices` is empty; `lake-manifest.json` and `lean-toolchain` are unchanged.
- Gate (worker's run and my rerun): every scanner 0 except `outside-folder=5` (R01); `build=0`.
- Dependency check (`gate --depcheck … --movable --pr 617`): `depcheck: 248 roadmaps, 2587 edges, 0 problem(s)`; no UPWARD, no CYCLE line.
- `lake env lean` on `TauCetiRoadmap/IntegralLattices/Suggested.lean`: no error; 15 `declaration uses sorry` warnings at lines 266, 285, 309, 326, 372, 379, 400, 413, 427, 442, 454, 473, 486, 548, 575, the same set as at `dec9d6b`. No declaration changed, so the signature and one-tactic-probe results of the earlier reviews stand.
- Citations resolved again on main `2bfb0f3`: 1 changed supplier text. GlobalQuadraticForms' README gained 13 lines on main after the merge base (finite support of the localized symbol; the complex-place symbol); its lines on `hasseMinkowski_equivalent`, 8.4 and the name `equivalent_of_locallyEquivalent` are unchanged, so this README's citations at lines 549, 1051, 1175 hold.
- `git merge-tree --write-tree origin/main da24d08` prints no CONFLICT line. `overlaps.md`: no cited id dropped or defined only by an open revision; #1411 conflicts in this folder and the description's shared-folder block orders it after this pull request.
- `citations.md`: the 13 Lean names are declarations of this roadmap's own `Suggested.lean`; `readme-ids-missing=0`.
- Description, the sentences on this folder: "It carries the revision of IntegralLattices, which is main's text with the review repairs applied" and the build claim for `IntegralLattices` hold at this head. The `LocalGaloisGroups` sentence matches its diff (`quotientWildInertiaSubgroupEquiv` cited from Tau Ceti; `localLogarithm`, `localExponential` dropped from the deep-units row).

Overlap check: read OrthogonalTamagawaAndLatticeMass, ThetaSeries, OrthogonalSpinGroups; the mass formula, dyadic density and Eichler's theorem are OrthogonalTamagawaAndLatticeMass's (it cites IntegralLattices §§2G, 4B, 7C), theta series are ThetaSeries', `O`, `SO`, `Spin` and the spinor norm are OrthogonalSpinGroups'; nothing has two owners.

Source independence: changed passages only; 0 passages changed, so none compared; the arrangement was not compared again, since no layer was added, removed or reordered.

Research link: Layers 1 and 5 state the existence and primitive-embedding theorems of Nikulin (1979); Layer 3 the 2-adic symbol calculus of Conway–Sloane (1988, 1999) as corrected by Allcock–Gal–Mark (2015); Layers 4 and 6 follow O'Meara (1963) and Serre (1973); Theta Series and OrthogonalTamagawaAndLatticeMass consume it. Rests on the README's Summary and References.

## Not verifiable

- The seeded sample B1–B8 against its sources: no passage changed, and the texts cannot be read legally (Cox, *Primes of the form x² + ny²*, paywalled; `cohen1993` and Cassels, *Rational Quadratic Forms*, uncertified; `conway-sloane-mass1988` waived). Their native claims were confirmed at the unchanged pin in earlier reviews.
- Kawauchi–Kojima (1G) and `cassels1959` (2F): uncertified.

## Source issues

- none

## For the human reviewers

- **Not tested.** Nikulin (1979) is the most-cited source of `TauCetiRoadmap/IntegralLattices/README.md` (57 mentions; O'Meara 38) and is not in the sources cache; wording and arrangement were not compared with it in this round.
