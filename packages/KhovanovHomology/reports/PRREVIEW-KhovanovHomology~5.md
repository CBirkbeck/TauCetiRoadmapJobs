# Review of KhovanovHomology (pull request #2600 at ff26ea1)

**Verdict:** accepted

**Summary.** The verdict is accepted, with no findings. This is an incremental re-review of the 40 lines changed since `e66cf27`: the three small corrections of the previous review are repaired and each repair is true as written (the §5.9 Check now holds over every commutative ring, §6.5 and the supplier contract cite GeometricTopology §4.8.1, the overview carries "nonempty"). Two small corrections remain, none blocking: the head keeps two of the three old heading anchors that Foams and DiagrammaticCoherence link to and not the third, and the description still says such anchors cannot be kept. There are no format notes, and nothing is left for a human to decide.

## Deferred findings

- D01 — stands
- D02 — resolved: raised as C01; the head keeps the `k3-…` and `g-plane-geometry-…` anchors, so only the `k2-…` link of Foams still misses.

## C01 — Two of the three old heading anchors are kept; the one for the former K2 is not

The head adds an anchor carrying the old heading id before Layer 3 (line 598) and before Layer 8 (line 850), so the links of Foams (main, lines 2723 and 2888) and DiagrammaticCoherence (main, line 49) land on those layers again. Foams' third link (main, line 2887) points at `#k2-the-rank-two-frobenius-object-and-circle-tensors`, and no anchor with that id stands before Layer 2 (line 382): a reader following it still lands at the top of the README.

One more line of the same kind before the heading of Layer 2, with the id `k2-the-rank-two-frobenius-object-and-circle-tensors`, makes all four links resolve, and then nothing in Foams or DiagrammaticCoherence needs to change.

## C02 — The description says the old anchors cannot be kept, and the head keeps them

The description says: "the roadmap format admits no HTML anchors carrying the old ids; those two roadmaps need their links pointed at the headings of Layers 2, 3 and 8", and before it that those links "land at the top of the README". At this head the README carries two such anchors (lines 598 and 850), so the sentence is out of date and a reader of Foams or DiagrammaticCoherence is told to do work that is no longer needed for Layers 3 and 8.

Text that would be right: "The README keeps anchors with the old heading ids of K3 and G before Layers 3 and 8, so the links of Foams and DiagrammaticCoherence to them still land there" (and of K2 before Layer 2, once C01 is done; until then: "Foams' link to the old K2 heading lands at the top of the README").

## Questions for the author

- In §8.3 (lines 925–928), which half-edges of `TauCeti.OrientedPDCode.insertCircleClasp` are "the first slot `0` west and the second slot `1` west"? The conclusions are consistent with each other, but the pinned constructor (`TauCeti/KnotTheory/PDCode/Oriented/Reidemeister/Two/Basic.lean`, line 35) carries no plane frame, so the dictionary to its orientation bit could not be checked. (Repeated from the previous review; the passage is unchanged.)

## Previous findings

The previous review, of `e66cf27`, raised no finding (no R-numbered point). Its three small corrections and the deferred note:

- C01 (previous) — repaired: "unless `2 = 0` in `R`, `X_p − X_q` is not of this form: on `1 ⊗ 1` it is `X ⊗ 1 − 1 ⊗ X`, which lies in the image of `Δm` only when `2 = 0`" (lines 1545–1547).
- C02 (previous) — repaired: "Adequacy is GeometricTopology §4.8.1's: the state graphs of the all-`A` and all-`B` states are loopless" (line 1762); §4.8.1 is in the *Needs:* line (line 1788) and in the contract (lines 2340–2341).
- C03 (previous) — repaired: "For a nonempty diagram, the graded Euler characteristic of `Kh(D; ℤ)` is `(q + q⁻¹)` times the Jones polynomial" (lines 20–21); the docstring of `Suggested.lean` says the same (lines 20–22).
- N01 (of an earlier review) — not repaired: deferred (D02); two of its three links are settled by this head, the third is C01 above.

No repair introduced a new problem in the mathematics.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| §5.9 Check, as changed | `V ⊗ V` over `ℤ`, `𝔽₂`, `ℤ/4`, the zero ring | image of `Δm` = span of `1⊗X + X⊗1`, `X⊗X`; `X⊗1 − 1⊗X = a(1⊗X + X⊗1) + b·X⊗X` forces `a = 1 = −1`; `ℤ/4`: `2 ≠ 0`, not in image; `𝔽₂`, zero ring: equal to `Δm(1⊗1)` | true over every commutative ring | none |
| §5.9 Check, first half | all four basis vectors | `Δm`: `1⊗1 ↦ 1⊗X + X⊗1`, `1⊗X, X⊗1 ↦ X⊗X`, `X⊗X ↦ 0` / `X⊗id + id⊗X` gives the same four values | holds | none |
| Overview, Euler characteristic with "nonempty" | empty code; trefoil; Hopf | empty: `χ = 1`, right side `q + q⁻¹`, now excluded; trefoil `(q+q⁻¹)(q²+q⁶−q⁸) = q+q³+q⁵−q⁹`; at `q = 1`: `2`, `4`, and `1 = 2⁰` for the empty code | agrees with §3.5 and the pin (`0 < componentCount`, EulerCharacteristic.lean 164) | none |
| §6.5 adequacy against GeometricTopology §4.8.1 | main lines 4720–4730; pin Adjacent.lean 133–138; trefoil, positive kink | graph loopless ⇔ classes of slots `0`, `2` differ ⇔ `#circlesAt = 2`; trefoil: all-`A` 2 circles, all-`B` 3, no loop; kink: all-`A` 2 circles, all-`B` 1 circle, a loop | same notion | none |
| `IsAdequate` (cited by the changed text) | `n = 0`; kink; all-`A` only variant | `n = 0` vacuously true here, §4.8.1 speaks of nonempty diagrams, headline then reads `0 ≤ m`; kink fails the `B` conjunct; the `A`-only variant accepts the positive kink (Check, line 1798) | determines the object | none |
| `Suggested.lean` docstring, as changed | pinned theorem | "for a nonempty diagram" / hypothesis `h : 0 < D.toPDCode.componentCount` (EulerCharacteristic.lean 164), empty value `1` (line 172) | agrees | none |
| Contract "consumed in §§… 6.5 …" | *Needs:* lines | §6.5 names GeometricTopology §4.8.1 (line 1788); §4.8.1 exists on main (line 4714) and at both open GeometricTopology heads (lines 4720, 4925) | resolves | none |
| Anchors before Layers 3 and 8 | four links on main | ids at lines 598, 850 equal the fragments of Foams 2723, 2888 and DiagrammaticCoherence 49; Foams 2887 (`k2-…`) has no anchor | three of four links resolve | C01 |

The rows of the previous review for the statements this change does not touch stand as in the previous review, of `e66cf27`.

- Source locators checked against the text this round: 1 (Kho99 §7.7, Definitions 3–5 and Proposition 36, Kho99 lines 1778–1796, for the reworded opening of §6.5); the seeded sample falls in no changed passage.
- Library declarations opened at the pins: `TauCeti.PDCode.circlesAt` (Adjacent.lean 90), `TauCeti.PDCode.card_circlesAt_eq_two_iff` (Adjacent.lean 135), `TauCeti.OrientedPDCode.khovanovEulerChar_eq_mul_eval₂_jonesPolynomial` (EulerCharacteristic.lean 164), `khovanovEulerChar_empty` (line 172).
- Cross-roadmap citations resolved: GeometricTopology §4.8.1 on main and at its two open heads; the four links of Foams and DiagrammaticCoherence on main into this README.
- Automatic checks: all passed on a rerun. Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives five `sorry` warnings (lines 57, 70, 81, 112, 143) and nothing else; the change to the file is in the module docstring only, so the eight elaborated signatures are those of the previous review and agree with the README.
- Headlines and padding: no statement changed; the previous review's one-tactic probes stand.
- Description against the head: one sentence out of date (C02); the rest stands. GeometricTopology §4.8.1 is a new section of a supplier the description already names (Layer 4), so no supplier is added or dropped.

Overlap check: read GeometricTopology (main and its two open revisions), Foams and DiagrammaticCoherence (main); adequacy is owned by GeometricTopology §4.8.1 and now cited from §6.5; link cobordisms, §7.1 here and §6.5 of GeometricTopology's open revision (D01); nothing else shared by the changed passages.

Source independence: changed passages only; 3 passages compared with 1 source (Kho99: the opening of §6.5 against Definitions 3–5, the §5.9 Check and the overview sentence, which have no counterpart there), none shared; largest share Kho99, 9 of 19 parenthetical locators in the layers, as in the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Reidemeister invariance and functoriality (Khovanov 2000; Bar-Natan 2005; Jacobsson 2004) are what Rasmussen's invariant (2010) is built on; GeometricTopology on main names that invariant, built on this roadmap, for Piccirillo's theorem that the Conway knot is not slice. Rests on the README's references and GeometricTopology's README on main, lines 203 and 6515–6522.

## Not verifiable

- Golubitsky–Guillemin §II.4 Theorem 4.13 (§8.4), Hirsch Ch. 8 §1 Theorems 1.3–1.4 (§8.5) and Lickorish Ch. 1 and Ch. 5 (§8.6; GeometricTopology §4.8.1's own source for adequacy): books outside the manifest; not opened.
- Carter–Saito 1993, Roseman and Carter–Rieger–Saito (§7.5): paywalled articles outside the manifest; unchanged text.
- The clasp frame of §8.3: the pin has no plane data to check it against (see the question).

## Source issues

- **Error** in Kho99 at Proposition 22 (eq. 135, p. 35) and Proposition 28 (eq. 155, p. 41): the source says reversing one component shifts the bidegree by `(+2l, +2l)`; it should be `H^{i,j}(L₀) = H^{i−2l, j−6l}(L)`, which its equations (45) and (134) give; affects a stated result.
- **Misprint** in Kho99 at Proposition 37, proof, p. 46: the source says the chain groups of a minimal diagram vanish above `hl(L)`; it should be above `c(L)`, the number of crossings; affects the proof.

## For the human reviewers

- none
