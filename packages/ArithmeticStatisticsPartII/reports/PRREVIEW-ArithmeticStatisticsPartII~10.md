# Review of ArithmeticStatisticsPartII (pull request #1173 at c5b1568)

**Verdict:** accepted

🤖 Independent AI review, incremental re-review of 0 changed lines since c5b1568; this round reads the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads “Good-prime hypotheses enter only three local statements: integral pencil-orbit uniqueness at odd p with p² not dividing the discriminant, three-isogeny integral representatives at p > 3 for good-reduction twists, and unramified Kummer images at good places of function fields.”

## Verified sound

**Adversarial table** (the folder's diff changes no statement; the rows are the statements the changed description text cites; values computed this round).

| Statement | Instances and computed values | Result |
|---|---|---|
| §1.16 good-prime integral pencils (`README.md:2085`), cited as “odd p with p² not dividing the discriminant” | Hypothesis non-vacuous: `x⁴+xy³+5y⁴` at p = 5 has `Δ = 256·125 − 27 = 31973 ≡ 3 (mod 5)`. Negative control: `x⁴+py⁴` has `Δ = 256p³`, `p² ∣ Δ`, excluded. | Holds; description matches |
| Three-isogeny mirror dictionary, `p>3` representative (`README.md:2137`) and its neutral orbit (`README.md:2133`) | `D(0,1,0,Dhat) = 4b³d`: Dhat = 1, −3, 5, 7 gives 4, −12, 20, 28 = `4Dhat`; ordinary discriminant of `3x²y+Dhat y³`: −108, 324, −540, −756 = `−27D`. | Holds; description matches |
| Function-field Kummer adapter (`README.md:1785`), cited as “unramified Kummer images at good places” | The text restricts the unramified-image claim to good places and takes S ⊇ bad places, finite and nonempty; `n = 2, 4` prime to the odd characteristic. | Description matches |
| `BinaryQuartic.cubicInvariant_determines_orbit` (`Suggested.lean:152`), cited as the Cremona–Fisher theorem “outside the small characteristics” | Signature carries `NeZero 2`, `NeZero 3`, `Nat.card K ≠ 5`, `4I³−J² ≠ 0`. `x⁴−y⁴`: `I = −12`, `J = 0`, `4I³−J² = −6912 = 27·(−256)`. | Holds; description matches |

All other statements are untouched and stand as in the previous review, of `c5b1568`.

- Exhaustiveness of the “only three local statements” sentence: every occurrence in `README.md` of good, unramified, odd p, `p>3`, `p≥5`, `∤`, “not dividing”, coprime, prime-to and of `ℤ_p`/`Q_p`/`O_v`/`F_v` statements was read. Beside lines 1785, 2085 and 2137 the hits are case splits that also treat p = 2 (lines 1346–1357, 1905), Checks (951, 1913) or hypotheses on a modulus m (1991, 2025); no fourth good-prime theorem.
- Pull-request text: title, the `roadmap-summary` block and every prose sentence read against the head and against the folder's change (the roadmap is not on main; three files, 28 headings and 26 declarations added, none removed). Confirmed at the head: `σ(n)` resolvents at content n (`README.md:523`); printed index and sign slips corrected (:401, :1231, :1271); the overring construction in place of exponent reduction (:239, :545); the étale criterion over imperfect fields (:185); maximality over ℤ or a DVR (Layer 1 introduction); `selmerGroup₂` (`Suggested.lean:189`); HeightsRationalPointsAndObstructions §3.18a as consumer (:21); descent in degrees two to five (§§1.6–1.7 and the supporting descent target); the Lean imports `Mathlib` and two `TauCeti` modules, no roadmap; the validation counts (gate below).
- Suppliers named in the README, resolved this round: on main EllipticCurves, GlobalQuadraticForms, SchemeAndStackFoundations, JacobianChallenge, DiophantineApproximationAndTranscendence, AnalyticNumberTheoryPartII, and under `Completed/` PolynomialGaloisGroups, GlobalNumberFields, OrthogonalSpinGroups; the seven others are the open roadmaps of the description's `depends-on` block, all earlier in the merge order. No supplier added or dropped against the description.
- Gate, independent rerun on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0 OK`.
- Dependency check (the brief's command, `--movable`): `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No file changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives nine `sorry` warnings (lines 152, 162, 173, 180, 189, 198, 205, 229, 243) and nothing else; the file is unchanged, so the signature comparison and one-tactic probes of the earlier reviews stand.
- Overlap report at this head: no other pull request changes this roadmap, no cited id dropped, no id only an open revision defines, no second copy. The five names `cubicInvariant_determines_orbit`, `solubleOrbit_bijection`, `quarticOfPoint`, `veroneseA`, `fibre_card_le` are declared by no other roadmap's `Suggested.lean`.

Overlap check: read ArithmeticStatisticsPartIII, ArithmeticStatisticsPartI, ArithmeticStatisticsPartVI, ClassicalArithmeticCompletion; nothing shared (PartIII cites §§1.2–1.3 and PartVI §1.12 here as owner; PartI owns Layer 0, cited here).

Source independence: changed passages only; the folder's diff is empty, so 0 passages compared with 0 sources this round; the comparison of c5b1568 stands (4 passages, 3 sources, none shared); no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- ref-17 (O'Dorney) and ref-5 (Gan–Gross–Savin): unchanged from the earlier reports; no passage citing them changed.
- [2] Theorem 6.2 and [19] Proposition 35, on which two of the description's three good-prime statements rest, are not in the sources cache; the description was checked against the README's statements, not against these texts again.
- The description's sentence on AI assistance and on passes “to follow” describes process, not the head.

## Source issues

- none

## For the human reviewers

- none
