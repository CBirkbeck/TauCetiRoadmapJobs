# Review of SerreModularityByCompatibleSystems (pull request #2514 at 81acd5b)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 44 lines changed since `272ffeb`. The rewritten passage to weight and level in Layer S6 cites SerreWeightAndLevelOptimisation for odd `p` and for the dyadic nonscalar, `ℚ(i)`-induced and scalar dihedral cases, and each cited section states what is attributed to it; the one case kept here, `p = 2` with scalar `ρ̄|_{D₂}` and non-dihedral projective image, meets the hypotheses of Khare–Wintenberger's Theorems 4.1(1) and 5.1(1). The three small corrections of the previous review are repaired. There are two small corrections and one format note, none blocking; one licence question remains for the human reviewers.

## C01 — The description's summary still says that minimal lifts reach Serre's weight and level in general

A reader of the pull request is told a route the roadmap no longer takes. The summary block says "minimal lifts and the dyadic optimisation reach Serre's weight and level, the scalar dyadic case included". At this head the overview (README line 7) and `S6/strong-form-by-minimal-lifts` (lines 327–329) take the passage from SerreWeightAndLevelOptimisation: §2.13 with §3.7 for odd `p`, §§5.9–5.10 for `p = 2`, and a minimal lift only when `ρ̄|_{D₂}` is scalar and the projective image is not dihedral. A sentence that would be right: "the optimisation theorems of SerreWeightAndLevelOptimisation reach Serre's weight and level, and a minimal lift does so in the one case they leave, `p = 2` with scalar restriction at `2` and non-dihedral projective image".

## C02 — The Source line of the weight-and-level target still points to the proof of Lemma 6.2(i), which the target no longer uses

After the rewrite the target `S6/strong-form-by-minimal-lifts` uses, from Khare–Wintenberger, Theorem 5.1(1), Theorem 4.1(1) and Lemma 6.1; the dihedral cases now go through SerreWeightAndLevelOptimisation §§5.9–5.10. Its Source line (line 331) still reads "proof of Lemma 6.2(i), p. 11" and gives no locator for the two results the last bullet rests on. In the source, Theorem 4.1 is on p. 7 (KW-I line 267) and Lemma 6.1 on pp. 10–11 (KW-I line 441). Replacing "proof of Lemma 6.2(i), p. 11" by "Theorem 4.1(1), p. 7; Lemma 6.1, pp. 10–11" makes the line match the text.

## N01 — "Definition 2.1" in an S2 Check is Khare–Wintenberger's; Dieulefait–Pacetti have no Definition 2.1

The Conventions say Dieulefait–Pacetti's numbered results are cited by their numbers, so the Check on `q = 5` (line 148), "Definition 2.1 asks for `t > 5`", sends the reader to a definition that paper does not have (its §2 has only Definition 2.2, DP line 536). The good-dihedral definition is KW-I Definition 2.1 (KW-I line 171). Writing "Khare–Wintenberger's Definition 2.1" fixes the pointer.

## Previous findings

The previous review, of `272ffeb`, had no finding. Its three small corrections and its format note:

- C01 (previous review) — repaired: the description's summary now reads "modularity up to a twist of odd, irreducible, regular rank-two compatible systems (Khare–Wintenberger's Theorem 10.1(i))".
- C02 (previous review) — repaired: line 131 now says §I.3 "constructs Khare–Wintenberger's four prescribed lifts", Paso 2 being Theorem 5.1(4); item (a) of line 296 lists the uses as 5.1(2) and 5.1(4) and says the general case "is not needed".
- C03 (previous review) — repaired: line 33, line 477, the module docstring and the description now say that four names repeat the supplier's declarations and that the eight others, specified there in words, are declared here.
- N01 (previous review) — not repaired: line 148 still reads "Definition 2.1 asks for `t > 5`". Raised again as N01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `S6/strong-form-by-minimal-lifts`, odd `p` | supplier §2.13, §3.7, §2.1, §6.12 on main; `p = 3`; level `q³` with `n_q = 2` | §2.13: every odd `ℓ`, level exactly `N(ρ)`, nonsquarefree included; §3.7: weight `k(ρ)`, no exception for `p > 2`; newform level `M ∣ N(ρ̄)` and `N(ρ̄) ∣ M` by §2.1 | holds | none |
| `S6/strong-form-by-minimal-lifts`, `p = 2`, `ρ̄|_{D₂}` nonscalar | supplier §5.2, §5.9; Jordan block with equal roots; `ℚ(i)`-induced | §5.2 gives multiplicity one for every nonscalar restriction; §5.9 gives weight 2 at `N` when finite flat, with a separate `ℚ(i)` branch | holds | none |
| `S6/strong-form-by-minimal-lifts`, `p = 2`, scalar and dihedral | supplier §5.10, §6.5 | scalar ⇒ unramified at 2, which §5.10 assumes; Katz weight one at `N`, classical weight 2 by the Hasse invariant | holds | none |
| `S6/strong-form-by-minimal-lifts`, `p = 2`, scalar and non-dihedral | `𝔽_{2ⁿ}^×`; `A₄`, `S₄` in `PGL₂(𝔽̄₂)`; KW-I 4.1(1), 5.1(1) | `|𝔽_{2ⁿ}^×| = 2ⁿ − 1` odd, `ℤ₂^×` pro-2 ⇒ unramified, `k = 2`; Lemma 6.1 ⇒ non-solvable; lift minimal at odd primes, crystalline at 2 ⇒ level `N(ρ̄)` | holds | C02 |
| `S6/strong-form-of-serre-conjecture` | the three case bullets against the target they cite | odd `p`: §2.13 with §3.7; `k = 2` at 2: §§5.9–5.10 or the minimal lift; `k = 4` forces nonscalar (scalar ⇒ `k = 2`), so §5.6 applies | holds | none |
| `S2/good-dihedral-prime-insertion`, last sentence | KW-I 5.1(4) at `(p, q) = (q, N)`; `q = 13`, `N = 406561` | needs `p ∣ q + 1`: `406562 = 13 · 31274`; weight-2 lift with parameter `(ω⁰ ⊕ 1, 0)` at `k(ρ̄) = 2` is crystalline; Theorem 5.1(4) on p. 10 | holds | none |
| `S5/globalisation-dependency-check`, item (a) | Pasos 1, 2, 6; Lemma 2.3 at `(3, 2)` | Pasos 1 and 6: 5.1(2), parameters `(ω^{k−2} ⊕ 1, 0)` and `(id, N ≠ 0)`; Paso 2 and Lemma 2.3: 5.1(4), `3 ∣ 2 + 1` | holds | none |
| `S1/weak-form-and-the-solvable-case`, last sentence | against Layer S6 at this head | S6 takes the passage from the supplier and proves the scalar dyadic case by a minimal lift, as the sentence says | consistent | none |
| Lean spellings (Conventions, Suggested Lean forms, module docstring) | ClassicalSerreModularity's Lean file at its open head | it declares `GQ`, `IntBar`, `IsFrobAt`, `IsUnramifiedAt` (lines 57–70) and none of the other eight | consistent | none |

The rows for the untouched statements stand as in the previous review, of `272ffeb`; the diff changes no Lean statement (three docstring lines only), so the one-tactic probe was not repeated.

- Source locators checked against the text: 6, all in KW-I (Theorem 1.2 p. 2, Theorem 4.1 p. 7, Theorem 5.1(1) p. 9, Theorem 5.1(4) p. 10, Lemma 6.1 pp. 10–11, Lemma 6.2(i) p. 11); all correct.
- Library declarations opened at the pins: none new; the diff changes no statement.
- Cross-roadmap citations resolved: 12 in SerreWeightAndLevelOptimisation on main (§§2.1, 2.13, 3.7, 5.2, 5.6, 5.9, 5.10, 5.11, 6.5, 6.12, Layers 2–6, Layer 6), all present, and its open revision keeps them; ClassicalSerreModularity §I.3 (`I.3/prescribed-lifts`) at its open head.
- Dependency check: `depcheck: 200 roadmaps, 2199 edges, 0 problem(s)`; no UPWARD or CYCLE line. SerreWeightAndLevelOptimisation is on main and earlier in the merge order.
- The worker's automatic checks all passed on this head; nothing is changed outside the folder.
- Elaboration of `Suggested.lean`: four `declaration uses sorry` warnings and nothing else.
- Duplication: the change removes a second proof of the odd-characteristic and dyadic dihedral passages and cites their owner; the scalar non-dihedral dyadic completion is owned here, and the open revision of SerreWeightAndLevelOptimisation points to `S6/strong-form-by-minimal-lifts` for it.

Overlap check: read SerreWeightAndLevelOptimisation (main and its open revision), ClassicalSerreModularity (open) and AlgebraicModularFormsAndSerreWeights (main), for the changed passages; descent to the Serre level, Edixhoven's weight theorem, the dyadic optimisation: SerreWeightAndLevelOptimisation; scalar non-dihedral dyadic completion and the unconditional theorem: this roadmap (main's SerreWeightAndLevelOptimisation still names ClassicalSerreModularity, which its open revision corrects, as the description says); prescribed lifts: ClassicalSerreModularity. Nothing has two owners.

Source independence: changed passages only; 5 passages compared with 1 source (KW-I), none reproduced; largest share DP, as in the previous review; the diff adds, removes and reorders no layer, so the contents were not compared again.

Research link: Layers S1–S5 are Dieulefait–Pacetti's 2022 proof of Serre's conjecture (Khare–Wintenberger 2009); S6 is the strong form (Khare–Wintenberger Theorem 1.2, Khare 2006); S7 gives Khare–Wintenberger Theorem 10.1(i) and Corollary 10.2(ii), the Artin conjecture for odd two-dimensional representations. Rests on the README and on DP, KW-I and Kh as read.

## Not verifiable

- Wiese's Theorem 10 and Diamond's Theorem 1.1, on which SerreWeightAndLevelOptimisation §2.13 rests for every odd `p` and every conductor: not read; this roadmap cites the supplier's section, which states the result with those inputs.
- Buzzard's and Wiese's papers behind SerreWeightAndLevelOptimisation §§5.2, 5.9–5.11: not read; cited through the supplier's sections, which were read.
- [Kh97], [KW-II] and the Skinner–Wiles papers: not read, as in the previous review; the change does not touch their citations.

## Source issues

- none

## For the human reviewers

- Licence: ClassicalSerreModularity's Conventions §2.2 says its trace and determinant attachment interface follows the Imperial College London FLT project; `TauCetiRoadmap/SerreModularityByCompatibleSystems/Suggested.lean` declares that interface as `ArisesFrom`. It was not compared with that repository.
