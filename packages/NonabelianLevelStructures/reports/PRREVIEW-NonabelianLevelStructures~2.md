# Review of NonabelianLevelStructures (pull request #2273 at 896aaa4)

**Verdict:** accepted

No finding. Incremental re-review of the 26 lines changed since `b13e221` (README only; `Suggested.lean` is unchanged).

## Previous findings

- R01 — repaired: the `gap:gaschutz-generating-pairs` paragraph is gone; "From Tau Ceti", §0.5 *Needs:* and Layer 0 Dependencies cite `MonoidHom.exists_comp_eq_and_closure_range_eq_top_of_surjective` with ι = `Fin 2`; seven gaps remain, matching the declared list.
- R02 — repaired: §6.4 reads "P = (a, y, z) ∈ C₁(a)_t with (y, z) ≠ (0, 0) … in particular this holds on C₁(a)_t*"; the 𝔽₅ point (0, 1, 0) is a Check.
- R03 — repaired: §7.5 reads "It is free on X*, so its blocks have four points and |Y*| = D/4 (ArithmeticDynamicsPartII §7.2)"; the freeness bullet, Checks and proof clause are deleted; d_p = |Y*|.
- R04 — repaired: "(Chen, §2.2, pp. 323–325, Proposition 2.2.3 and Remark 2.2.4; Definition 3.2.1, pp. 351–352.)"; §3.2 opens on p. 351 and the definition is printed on p. 352.
- R05 — repaired: "(Chen, §5.6, pp. 419–420, the paragraphs before Theorem 5.6.6 and its proof; Theorem 5.6.6, p. 420.)".
- R06 — repaired: the description's first paragraph now ends "…the vertical automorphisms of SL₂(𝔽_q)-level structures, and the modular geometry of the trace −2 Markoff level curves."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 locator | CHEN2024 lines 47, 903, 963, 973, 2028, 2063 | §2.2 on p. 323; Prop. 2.2.3 and Remark 2.2.4 on pp. 324–325; §3.2 from p. 351, Def. 3.2.1 on p. 352 | locator correct | none |
| 0.5 functoriality, Gaschütz citation | pinned statement; C₂³ → C₂² | `[Finite G] [Finite ι]`, `hf`, `hg`, `hh` ⟹ `∃ g', f ∘ g' = h ∧ closure (range g') = ⊤`; C₂³ has no generating pair, `hg` fails | citation matches the README sentence | none |
| 6.4 rotation order, widened | every (a, y, z), (y, z) ≠ (0, 0), t ≠ 2 over 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₁, 𝔽₁₃; a = ±2; characteristic 2, a = 0 | 16, 96, 288, 1200, 2016 points, 0 with period ≠ n_q(a); eigenline (y, ±y) of a = ±2 has t = 2; (0, y, y) in characteristic 2 has t = 2 | holds; agrees with CHEN2024 lines 4193–4196, 4387–4390 | none |
| 6.4 new Check | 𝔽₅, P = (0, 1, 0) | 0 + 1 + 0 − 0 = 1 = t + 2, t = −1; orbit (1,0), (0,4), (4,0), (0,1), length 4; X² + 1 has order 4 | correct | none |
| 6.4 representation form | absolutely irreducible φ, central φ(a) | φ(a) = ±I makes the image abelian, hence reducible; so ord φ(a) = n_q(tr φ(a)) | consistent with the point form | none |
| 7.5 sign blocks, citation of §7.2 | p = 5, 7; supplier text at its head | \|X*(𝔽₅)\| = 40, 10 blocks of four points; D/4 = 7 at p = 7; supplier API: four-point blocks for odd p, #Y* = p(p ± 3)/4 for p ≥ 5 | cited, not restated | none |
| 7.5 Check, twists | a ↦ −I, b ↦ I; 𝔽₅ (3, 3, 3), (2, 3, 3) | (x, y, z) ↦ (−x, y, −z); 27 − 27 = 0; 4 + 9 + 9 − 18 = 4 ≠ 0 | correct | none |
| 7.5 Check, group side | all pairs of SL₂(𝔽₅) | 4920 pairs of commutator trace −2 on 41 triples, 4800 generating (the 120 others have triple (0,0,0)); 1200 generating pairs of PSL₂(𝔽₅) with commutator of order 5; 1200/120 = 10, 1200/60 = 20 | correct | none |
| 7.5 locator | CHEN2024 lines 4810–4857 | central quotient and Y* on pp. 419–420; Theorem 5.6.6 at line 4829, p. 420; its proof ends on p. 420 | locator correct | none |

The rows for untouched statements stand as in the previous review, of `b13e221`.

- Source locators checked against the text: 4 in CHEN2024 (§2.2 and Definition 3.2.1; Lemma 5.3.1 and its proof, pp. 405–409; §5.6, pp. 419–420; Theorem 5.6.6), all correct. Of the seeded sample, 0.1, 0.5, 6.4 and 7.5 fall in changed passages and were checked there.
- Library declarations opened at the pin: `TauCeti/GroupTheory/Gaschutz.lean:119` (binders at lines 48 and 68).
- Cross-roadmap citations resolved at the open heads: InverseGaloisAndArithmeticFundamentalGroups §IG.3.2, target "Exterior epimorphisms and `T`-systems"; ArithmeticDynamicsPartII §7.2 "Sign blocks" and §6.2 `traceOrder`.
- Declared gaps: the 7 slugs of the README are the 7 declared; `gap:gaschutz-generating-pairs` occurs nowhere in the README.
- Gate: every check passed. Elaboration: `sorry` the only warning (4 theorems). `Suggested.lean` is unchanged, so signatures and the one-tactic probe stand as in the previous review.
- Dependency check: `depcheck: 222 roadmaps, 1973 edges, 0 problem(s)`; nothing changed outside the folder. The pull request's title and description agree with this head: a new roadmap, no supplier added or dropped by the repair.
- Overlap check: read ArithmeticDynamicsPartII, InverseGaloisAndArithmeticFundamentalGroups, ModularCurvesPartII, GroupActionsOnRiemannSurfaces, AdelicImagesAndModularCurves, NoncongruenceModularForms, BelyiMaps; the level stacks M(G) and the sign blocks Y* are shared with ArithmeticDynamicsPartII, which owns them (§6.0 and §7.2 cited); nothing else shared.
- Source independence: changed passages only; 4 passages compared with 1 source (CHEN2024), none shared beyond formulas and forced hypotheses; largest share CHEN2024, 63 of 79 locators; no layer added, removed or reordered, so the comparison of contents with CHEN2024 stands: independent.

## Not verifiable

- ASADA2001, §7: uncertified, cited by locator.
- VDOVIN1999, Theorem A: uncertified, cited by locator.
- §6.4 in characteristic 2 beyond a = 0: checked by the eigenvalue argument, not enumerated.

## Source issues

- none

## For the human reviewers

- none
