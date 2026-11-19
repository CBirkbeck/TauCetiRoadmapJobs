# Review of SerreModularityByCompatibleSystems (pull request #2514 at db32348)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 2 lines changed since `81acd5b`, together with a first reading of the pull request's title and description against this head. The one changed line, the Source line of the weight-and-level target in Layer S6, now cites Khare–Wintenberger's Theorem 4.1(1), Theorem 5.1(1) and Lemma 6.1, each at the page where the source has it, and the description's sentences on the route, the Lean file, the suppliers, the consumers and the two accompanying revisions all agree with the head. There is one format note, carried from the previous review and not blocking; one licence question remains for the human reviewers.

## N01 — "Definition 2.1" in an S2 Check is Khare–Wintenberger's; Dieulefait–Pacetti have no Definition 2.1

The Conventions say Dieulefait–Pacetti's numbered results are cited by their numbers, so the Check on `q = 5` (README line 148), "Definition 2.1 asks for `t > 5`", sends the reader to a definition that paper does not have (its §2 has only Definition 2.2, DP line 536). The good-dihedral definition is KW-I Definition 2.1 (KW-I line 171). Writing "Khare–Wintenberger's Definition 2.1" fixes the pointer.

## Previous findings

The previous review, of `81acd5b`, had no finding. Its two small corrections and its format note:

- C01 (previous review) — repaired: the description's summary now reads "SerreWeightAndLevelOptimisation reaches Serre's weight and level, except for p = 2 with scalar restriction at 2 and non-dihedral projective image, where a minimal lift does."
- C02 (previous review) — repaired: line 331 now reads "Source: [KW-I], §1.1, p. 2; Theorem 4.1(1), p. 7; Theorem 5.1(1), p. 9; Lemma 6.1, pp. 10–11." The repair introduces no new problem: the target's text names exactly these results.
- N01 (previous review) — not repaired: line 148 still reads "Definition 2.1 asks for `t > 5`". Raised again as N01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `S6/strong-form-by-minimal-lifts`, `p = 2`, `ρ̄|_{D₂}` scalar, projective image not dihedral (the case the changed Source line supports) | `𝔽_{2ⁿ}^×`; `S₄`, `A₄` in `PGL₂(𝔽̄₂)`; KW-I 4.1(1), 5.1(1), 6.1 at their hypotheses | `|𝔽_{2ⁿ}^×| = 2ⁿ − 1` odd, `ℤ₂^×` pro-2 ⇒ unramified, `k = 2`; unipotent `u` has `u² = 1`, `S₄` has order 4 ⇒ excluded; `V₄ ◁ A₄` fixes a line ⇒ reducible; so non-solvable; 5.1(1) needs `k = 2`, 4.1(1) crystalline weight 2: both met | holds | none |
| Source line of that target (line 331) | each locator opened in KW-I | §1.1 with Theorem 1.2: p. 2 (lines 70–78); Theorem 4.1(1): p. 7 (lines 267–273); Theorem 5.1(1): p. 9 (lines 366–372); Lemma 6.1: statement p. 10, proof p. 11 (lines 441–457) | correct | none |
| `S6/strong-form-of-serre-conjecture`, sentence citing "Theorem 5.1(1) with Theorem 4.1(1) at `2`" | against the changed Source line and the target's last bullet | same two results, same parts; Theorem 1.2(2) is the dyadic `k = 2` statement (KW-I line 78) | consistent | none |
| Corrections to the sources, first bullet | against the changed Source line | names Theorems 4.1 and 5.1(1) at 2 and Lemma 6.1, the three results the Source line now locates | consistent | none |

The rows for the untouched statements stand as in the previous review, of `81acd5b`; the diff changes no statement and no Lean line, so the one-tactic probe and the signature comparison were not repeated.

- Source locators checked against the text: 4, all in KW-I (§1.1 p. 2, Theorem 4.1(1) p. 7, Theorem 5.1(1) p. 9, Lemma 6.1 pp. 10–11); all correct.
- Library declarations opened at the pins: none new; the diff changes no statement.
- Cross-roadmap citations resolved for the changed target and for the description: SerreWeightAndLevelOptimisation §§2.1, 2.13, 3.7, 5.2, 5.6, 5.9, 5.10, 5.11, 6.5, 6.12 present on main and kept by its open revision; ClassicalSerreModularity Layer I (I.0–I.3) and `R27.1/dickson-and-the-dyadic-solvable-refinement` present at its open head.
- The pull request's text, sentence by sentence against the head: seven layers S1–S7; four `sorry` theorems with the names given; one Tau Ceti import; four interfaces repeated and eight declared; the six corrections of the README's "Corrections to the sources" match the description's list; the three open suppliers are not on main and the ten other roadmaps cited are; main's SerreWeightAndLevelOptimisation (lines 1685–1710) and SmallRamificationAndAbelianVarietyBaseCases (line 13) name ClassicalSerreModularity as the description says, and their open revisions name this roadmap; ClassicalSerreModularity's head maps R33.4 to Layer S4 and says R26.5 has no successor; the seven consumers named cite the layers the description gives. No sentence is contradicted and no change is left unstated.
- Dependency check: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- The worker's automatic checks all passed on this head; nothing is changed outside the folder.
- Elaboration of `Suggested.lean`: four `declaration uses sorry` warnings (lines 112, 121, 130, 143) and nothing else.

Overlap check: read SerreWeightAndLevelOptimisation (main and its open revision), ClassicalSerreModularity (open) and SmallRamificationAndAbelianVarietyBaseCases (main and its open revision), for the changed passage and the description; descent to the Serre level, Edixhoven's weight theorem and the dyadic optimisation: SerreWeightAndLevelOptimisation; scalar non-dihedral dyadic completion and the unconditional theorem: this roadmap (the open revision of SerreWeightAndLevelOptimisation says so; main's text still names ClassicalSerreModularity, as the description states); prescribed lifts and Khare–Wintenberger's lifting theorem: ClassicalSerreModularity; base cases: SmallRamificationAndAbelianVarietyBaseCases. Nothing has two owners.

Source independence: changed passages only; 1 passage (a line of locators) compared with 1 source (KW-I), nothing shared; largest share DP, as in the earlier reviews; the diff adds, removes and reorders no layer, so the contents were not compared again.

Research link: Layers S1–S5 are Dieulefait–Pacetti's 2022 proof of Serre's conjecture (Khare–Wintenberger 2009); S6 is the strong form (Khare–Wintenberger Theorem 1.2, Khare 2006); S7 gives Khare–Wintenberger Theorem 10.1(i) and Corollary 10.2(ii), the Artin conjecture for odd two-dimensional representations. Rests on the README and on DP, KW-I and Kh as read.

## Not verifiable

- Wiese's Theorem 10 and Diamond's Theorem 1.1, on which SerreWeightAndLevelOptimisation §2.13 rests: not read; this roadmap cites the supplier's section, which states the result with those inputs.
- Buzzard's and Wiese's papers behind SerreWeightAndLevelOptimisation §§5.2, 5.9–5.11: not read; cited through the supplier's sections.
- [Kh97], [KW-II] and the Skinner–Wiles papers: not read, as in the previous review; the change does not touch their citations.
- The description's generated lists of open suppliers and of the merge order were not checked: they are outside the reading of the text.

## Source issues

- none

## For the human reviewers

- Licence: ClassicalSerreModularity's Conventions §2.2 says its trace and determinant attachment interface follows the Imperial College London FLT project; `TauCetiRoadmap/SerreModularityByCompatibleSystems/Suggested.lean` declares that interface as `ArisesFrom`. It was not compared with that repository.
