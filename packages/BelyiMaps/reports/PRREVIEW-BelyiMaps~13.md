# Review of BelyiMaps (pull request #3170 at 9552dbc)

**Verdict:** accepted

**Summary.** An incremental re-review of the 27 lines changed since `0c3be17`: the five small corrections of the previous review that lay in this folder are repaired correctly (the van Kampen file, the genus formula of 8.6, the carrier of `trueOrbitSize` in 14.2, the local constancy in 11.6, the source line of 10.7), and the repairs introduce no new problem. No finding remains. There is one small correction, on the pull request's description, which does not mention these corrections to text on main, and two format notes carried from the previous review; none blocks. One source question is left for a human (Lando–Zvonkin and Girondo–González-Diez could not be read).

## C01 — The description does not say that the pull request also corrects five passages of BelyiMaps that are on main

A reader of the description expects only the two additions in §§2.4 and 6.2 ("This PR adds planned targets …"; the BelyiMaps bullet names nothing else). The head also changes existing text: the file of the van Kampen declarations (lines 184 and 570), the Riemann–Hurwitz sentence of 8.6 (line 3279), the source line of 10.7 (line 4346), the carrier of `trueOrbitSize` in 14.2 (line 5451), and 11.6 (lines 4528–4531 and 4549), which gains a proof step and a new prerequisite, Layer 10.7.

A sentence at the end of the BelyiMaps bullet would do, for instance: "It also corrects existing text: the van Kampen file path, the genus formula in 8.6, the Köck source line of 10.7, the carrier of `trueOrbitSize` in 14.2, and 11.6, which now proves the local constancy that 11.4 requires and lists Layer 10.7 as a prerequisite."

## N01 — Three lines this pull request adds run past the 100-column limit

`Suggested.lean` line 11 (128 columns, in the module docstring) and README lines 90 (113) and 2499 (104). Rewrapping fixes it.

## N02 — "frozen" records, snapshot and schema (Layers 3.5 and 14, twelve times) are never identified

Saying once which state of the database is meant, or dropping the word, would fix this.

## Previous findings

- The review of `0c3be17` had no finding (R). Its small corrections and format notes:
- C01 — not repaired: deferred (D01).
- C02 — repaired: lines 184 and 570 now give `TauCeti/AlgebraicTopology/FundamentalGroup/VanKampen/Basic.lean`, where the four declarations are at the pin.
- C03 — repaired: "Both sides are read off `2g − 2 = −2n + Σ (e − 1)`, the sum over the three fibers".
- C04 — repaired: `def trueOrbitSize (c : AlgebraicBelyiPair.IsoClass ℚ̄)`, the carrier of 11.7 and of the pinned definition.
- C05 — repaired: "It is also locally constant, as 11.4 requires: for `σ` fixing a number field over which 10.7 gives a model … the family is the identity on an open subgroup"; 10.7 added to the prerequisites.
- C06 — repaired: the quotation is replaced by "(the pair has a model over some finite extension of `M(F, t)`, and over `M(F, t)` itself when the covering is Galois)".
- N01 — not repaired: carried above as N01.
- N02 — not repaired: carried above as N02.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 8.6 genus reconciliation, `2g − 2 = −2n + Σ (e − 1)` (line 3279) | torus triple, `n = 4`, cycle types 4, 4, 2+2 | `−8 + (3+3+1+1) = 0`, `g = 1`; Layer 0.6: `χ = 1+1+2−4 = 0`; agrees with line 3225 | true |
| same | `z ↦ zⁿ`: `e = n` over 0 and ∞, `n` unramified points over 1 | `−2n + 2(n−1) = −2`, `g = 0`; Layer 0.6: `χ = 1+n+1−n = 2` | true |
| same, against the old wording "both sides are `Σ (e − 1)`" | torus triple | `Σ (e − 1) = 8 ≠ 0 = 2g − 2` | old sentence false, new one true |
| 11.6 rigidity: trivial automorphisms give a continuous descent datum (lines 4526–4531) | degree 3, `σ0 = (1 2 3)`, `σ1 = (1 2)`: monodromy `S₃`, centraliser in `S₃` trivial | `f_σ` unique; for `τ` fixing the model's field `f_τ` is the model's identity; cocycle gives `f_{στ} = f_σ ∘ σ(f_τ) = f_σ`: constant on cosets of an open subgroup | 11.4's input holds |
| same, negative control | `z ↦ z²`, automorphism group `C₂` | hypothesis fails; 11.4's discontinuous twist by a character to `C₂` exists only because `f_σ` is not unique | hypothesis is used |
| same, direction of supply | 10.7 → 11.4 → 11.6 | 10.7's prerequisites are 9.1, 9.5–9.8, 10.4–10.6; 11.4 already lists 10.7 | no cycle |
| 14.2 `trueOrbitSize` carrier (line 5451) | `IsoClass n` (0.2) against `AlgebraicBelyiPair.IsoClass ℚ̄` | 0.2's classes carry no Galois action; pin: `trueOrbitSize (c : IsoClass k) := Nat.card (orbit (k ≃ₐ[ℚ] k) c)` in `AlgebraicBelyiPair.IsoClass`; `z ↦ zⁿ`: orbit 1, moduli field `ℚ` | agrees with 11.7 and the pin |
| 10.7 source line, Köck (2.2) and (3.3) (lines 4346–4348) | Koeck2004 lines 277–279, 398–405 | (2.2): defined over a finite extension of the relative moduli field, over it when Galois; (3.3) proof combines (3.2) and (2.2) | supported; own words, notation `M(F, t)` as in 10.5 |
| van Kampen file (lines 184, 570) | the pinned Tau Ceti | `VanKampen/Basic.lean`: `vanKampenLift` 440, `vanKampenLift_bijective` 523, `vanKampenEquiv` 549, `vanKampenEquiv_toMonoidHom` 558 | as cited |
| Description, BelyiMaps bullet | diff of the folder against the base | 2.4 equivalence with `Action FintypeCat (FreeGroup (Fin 2))`; 6.2 balanced product left adjoint to `Action.res`; one declaration added, none removed; five corrections to existing text unstated | bullet true; C01 |
| Description: pin `2fd255d`; "elaborates … with only `sorry` warnings" | `lake-manifest.json`; elaboration | Tau Ceti rev `2fd255d997f4…`; two `sorry` warnings (lines 113, 128), nothing else | as stated |

The rows of the previous review, of `0c3be17`, stand for the untouched statements; the diff changes no Lean statement.

- Source locators checked against the text: 2 (Köck (2.2) Theorem, Koeck2004 lines 277–279; (3.3) Theorem, lines 398–405, arXiv math/0108222v2).
- Library declarations opened at the Tau Ceti pin: 5 (the four van Kampen declarations in `TauCeti/AlgebraicTopology/FundamentalGroup/VanKampen/Basic.lean`; `trueOrbitSize` in `TauCeti/FieldTheory/FunctionField/Belyi/GaloisAction.lean:271`).
- Cross-roadmap citations in the changed passages: AlgebraicTopology Stage 1 (unchanged, resolved by the citation tool: nothing found nowhere); FuchsianOrbifolds Layer 5 and ModularForms §10B in 8.6 are untouched.
- Elaboration: `Suggested.lean` elaborates with two `sorry` warnings and nothing else. `Suggested.lean` is unchanged since `0c3be17`.
- Dependency check: `depcheck: 94 roadmaps, 1058 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all text and form checks pass on the folder; one flag set aside below.
- Record: no layer, item or id of the README at the merge base is removed or retitled (15 layers, 0 missing); the other open pull request that changes this folder (#1791) merges cleanly.
- Seeded sample: of its targets only "Fields of moduli and definition" (11.6) and the Riemann-existence passage of 8.6 meet the diff; both are in the table.

Overlap check: read ProfiniteArithmetic, NoncongruenceModularForms, GroupActionsOnRiemannSurfaces (main), NonabelianLevelStructures, SurfaceTopology, SurfaceGroupCharacterVarieties (open); nothing shared. The changed passages add no object.

Source independence: changed passages only. 2 passages compared with 1 source (the source line of 10.7 and the rigidity step of 11.6 with Koeck2004 lines 277–279 and 345–347), none shared; no layer is added, removed or reordered, so the arrangement was not compared. Largest share of the README's source mentions: Girondo–González-Diez, not readable.

Research link: the headline targets are Belyi's theorem (Köck 2004, Theorems (2.2), (3.3)), the branch-cycle theorem (Fried 1977; Szamuely 2009, §4.7) and faithfulness of the Galois action on dessins (Lenstra's argument, Girondo–González-Diez 2012, Theorem 4.49); this rests on the README's references.

## Not verifiable

- Lando–Zvonkin 2004, §1.3 and §1.5 (the source line of 2.4): no legal copy; only that the pinned `TauCeti/Combinatorics/RibbonGraph/Classification.lean` cites the same sections.
- Girondo–González-Diez 2012: no legal copy; the passages changed since `0c3be17` do not cite it.

Automatic checks set aside as false positives: the check for changes outside the folder lists 29 files, all in the fifteen other roadmap folders this pull request itself revises; each has its own review.

## Source issues

- none

## For the human reviewers

- **Not tested.** The one locator the pull request adds here, Lando–Zvonkin §1.3 and §1.5 (README 2.4, line 1132), could not be read; nor could Girondo–González-Diez, the most cited source of the README.
- The earlier scope questions (executable procedures in Layer 3.1, database record structures in Layer 14, the owner of the gap for transitive groups of degree 6 to 11) concern untouched text and are unchanged.
