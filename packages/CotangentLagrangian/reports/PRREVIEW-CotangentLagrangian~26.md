# Review of CotangentLagrangian (pull request #2687 at 1aad417)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 2 lines changed since `39183a0` has no findings. The one changed sentence now cites IntegrableSystems by the id it has on main, I5.2, which resolves there and is mapped to §5.2 by the open revision of that roadmap; the previous small correction about the anchors is repaired in the description. There is one small correction (a sentence of the description that the change makes out of date) and two format notes carried over, none blocking. Nothing is left for a human to decide.

## C01 — The description still says the IntegrableSystems citation reads "§5.2 (I5.2)", but this head cites I5.2 alone

The last sentence of "What changes in form" says: "The consumer citation of IntegrableSystems reads §5.2 (I5.2): §5.2 is the number its open revision gives the finite action and periodic-orbit dictionary, and I5.2 its number on main." At this head the Downstream consumers bullet (README line 1195) reads "IntegrableSystems I5.2, the finite action and periodic-orbit dictionary, instantiates the chain dictionary of §3.1", with no §5.2. A reader of the description would look for a citation of an open revision's numbering that is no longer there. The sentence would be right as: "The consumer citation of IntegrableSystems reads I5.2, the id that section has on main."

## N01 — Several targets still carry no locator

As in the two previous reviews: the Kodaira–Thurston target of §2.2 (Cannas da Silva has the example with b₁ = 3 at p. 102), the symplectic neighbourhood theorem of §4.6, the transverse composition of §3.0 and the polar diffeomorphisms of §2.0. A locator into a standard text for each would let a reader check the hypotheses.

## N02 — A sentence of §4.1 writes r*η where the paragraph has r*(i*η)

In §4.1 the target reads dβ = η − r*(i*η) (line 967), with r the retraction onto Q; the sentence on the Tau Ceti operator says its differential "is η − r*η" (line 974), which reads r as the self-map (q, p) ↦ (q, 0). Writing η − r*(i*η) in line 974 too would keep one meaning of r in the paragraph.

## Previous findings

The previous report had no findings (no R-numbered remark); its small correction and format notes are accounted for here.

- C01 (previous) — repaired: the description now says "The anchors `#c20-…`, `#c21-…`, `#c22-…` and `#c4-…` … are kept as explicit anchors before §2.0, §2.1, §2.2 and Layer 4, so those links still resolve"; anchors at README lines 239, 291, 428, 946.
- N01 (previous) — not repaired: the four targets still have no locator; written again as N01 above.
- N02 (previous) — not repaired: line 974 still reads "its differential is η − r*η for a closed C¹ form η"; written again as N02 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Consumer bullet, line 1195: IntegrableSystems I5.2 instantiates the chain dictionary of §3.1 "after its sign change" | S = qQ on ℝ × ℝ, N = 1 | This roadmap: p = ∂_q S = Q, P = −∂_Q S = −q, map (q, p) ↦ (p, −q). IntegrableSystems with −S: y = −∂₁(−qQ) = Q, Y = ∂₂(−qQ) = −q, the same map. Fixed point (0, 0); ψ(q) = S(q, q) = q², critical point q = 0 | the two conventions agree after S ↦ −S; one fixed point, one critical point | none |
| The id I5.2 (line 1195) | IntegrableSystems on main; its open revision | main: heading "I5.2. Finite action, quotient and periodic-orbit dictionary" (line 534), which cites this roadmap's chain dictionary (line 544); open revision: "I5.0, I5.1, I5.2, I5.3 and I5.4 are now §§5.0, 5.1, 5.2, 5.3 and 5.4" (its line 1238) | resolves on main; stays followable when the revision merges | C01 (description) |

The rows for the untouched statements stand as in the previous review, of `39183a0`.

- Source locators checked against the text: 0; the changed line carries no source locator, and no target of the seeded sample falls in it.
- Library declarations opened at the pin: 0; the changed line names none.
- Cross-roadmap citations resolved: 1 (IntegrableSystems I5.2: main lines 534 and 544; open revision lines 962 and 1238). The citing direction is consumer only, in Downstream consumers; no supplier edge is added.
- Automatic checks: run again on this head, all pass. Dependency check output: `depcheck: 178 roadmaps, 2030 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives eight `declaration uses sorry` warnings (lines 103, 135, 164, 181, 199, 221, 258, 278) and no other message; the diff touches no Lean file, so the binder comparison and the one-tactic probe of the earlier reviews stand.
- Headlines: unchanged; the eight stated theorems and the docstring's list of those not statable are as the earlier reviews read them.

Overlap check: read IntegrableSystems (main and its open revision, I5.2 / §5.2) for the changed citation; HamiltonianReduction, ContactGeometry and SymplecticGeometry (the family index) stand as read in the previous review; nothing shared: the chain dictionary is §3.1's and IntegrableSystems instantiates it, owning only the descent to the deck quotient.

Source independence: changed passages only: 1 passage compared (the consumer bullet, which cites a roadmap and no source), with 0 sources, none shared; largest share CannasDaSilvaLSG, 15 of 16 locator sites; contents not compared again, since the diff adds, removes or reorders no layer (previous result: independent).

Research link: Layer 4 is Weinstein's Lagrangian neighbourhood theorem (Weinstein, 1971) and Gotay's coisotropic embedding theorem (Gotay, 1982), as CannasDaSilvaLSG pp. 48–49 cites them and Gotay1982 proves; §2.2's example is Thurston's (1976). FukayaTheory, HeegaardFloer and TaubesGromov consume Layer 4. Rests on CannasDaSilvaLSG, Gotay1982 and the README's Downstream consumers.

## Not verifiable

- none: the changed citation was read on main and at the open revision's head.

## Source issues

- none

## For the human reviewers

- none
