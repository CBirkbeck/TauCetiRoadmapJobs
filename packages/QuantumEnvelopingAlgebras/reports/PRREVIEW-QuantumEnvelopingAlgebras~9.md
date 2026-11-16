# Review of QuantumEnvelopingAlgebras (pull request #2363 at a6737a5)

**Verdict:** accepted

No finding at this head.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/QuantumEnvelopingAlgebras/Suggested.lean` ends at `end Presentation` (`:572`); the section `QuantumPlaneLattice`, its 18 declarations and the docstring paragraph are gone; `:45–46` names the Layer 8 comparisons as not statable. The repair introduces no new problem: `gaussian` and `specialize` are still used by `quantumLucas` (`:140–145`).

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 0.3 `quantumLucas` (`Suggested.lean:138–146`; the only remaining user of `gaussian`, `specialize`) | `ζ` of order 3, `l = 3`, `m = 3`, `r = 1, 3`; `ζ = i`, `l = 2`, `(m, r) = (2, 1), (3, 2), (−1, 1)` | `r = 1`: `[3]_ζ = 0`, right `ζ⁻³·[0 choose 1]·1 = 0`; `r = 3`: `1 = ζ¹⁸·1·1`; `(2, 1)`: `0 = 0`; `(3, 2)`: `[3]_i = −1 = i¹⁰·1·1`; `(−1, 1)`: `−1 = i²·1·1` | holds |
| 8.2 specialized `C_L` (`README.md:1410–1440`; the README statement the deleted Lean encoded) | `L = 3`, `ζ` primitive cube root; `n = 2` | diagonal `[3 choose j]_ζ = 1, 0, 0, 1`: kernel `span(b₁, b₂)`, image `span(w₀, w₃)`, as the text says; `C₂ = diag(1, v + v⁻¹, 1)` | holds |
| Module docstring, "Not statable" (`Suggested.lean:25–46`) | Layer 8 bullet against the file | no declaration of Layer 8 remains; the 8.1–8.2 comparisons are modules over `R ⊗_A U_A`, which the same docstring (`:33–35`) lists as not at the pins | consistent |

The rows for the untouched statements stand as in the previous review, of `c1f4398`.

- Change since `c1f4398`: 119 deletions in `Suggested.lean`, nothing else; no file changed outside the folder; `README.md` is unchanged, so no source locator, layer or supplier citation changed.
- README against the Lean: none of the 18 deleted names occurs backticked in `README.md` (the 16 names of the previous R01 occur 0 times; `comparison` and `torus` occur only as words); `quantumLucas`, cited at `README.md:1422` and `:1434`, is declared.
- Gate at a6737a5: every check 0, `OK`. Dependency check: `depcheck: 253 roadmaps, 2401 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean` at the pins: 16 `declaration uses sorry` warnings and nothing else; the file has 70 declarations, 16 of them theorems, all in Layers 0–2. No signature changed, so the elaborated types are those of the previous review; the one-tactic probe was not repeated, since no theorem was added or changed.
- Pull-request text against the head: "The `QuantumPlaneLattice` prototypes and their introductory paragraph are removed", "leaves the entire README and all Layer 0–2 declarations unchanged", "70 declarations in Layers 0–2", "16 theorem targets with `sorry`" all agree with the head; the summary block's "the quantum plane retain[s its] scope" holds for `README.md` §§8.1–8.2.
- Cross-roadmap citation re-resolved on main (2b9ce21): `TauCetiRoadmap/KacMoody/README.md:52–54` (see the last section). Sampled targets: 8.1 and 8.2 are the only ones the change bears on, and their README text and locators are unchanged; the others are untouched.
- Overlap check: read KacMoody, QuantumGroups, HopfologicalAlgebra (scope sections on main); ReductiveGroups and SpringerResolutionAndCharacteristicCycles searched for the quantum plane and its lattices, no occurrence; the change moves no ownership: bicharacter-braided ambient: HopfologicalAlgebra, cited; `U_q(sl₂)` and quantum integers: QuantumGroups, cited; quantum Casimir: owned here (§2.3), see the last section; nothing else shared.
- Source independence: changed passages only; the change adds no passage (deletions only), so 0 passages compared; largest share McGerty2006, as in the previous reviews; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Lusztig1993 (uncertified): Chapters 5, 37–38 for 2.3, Theorem 33.1.3 for 1.3a and Chapter 34 for `quantumLucas` are cited by locator only.
- Kassel1995 (uncertified): Chapter VII §3, cited for 8.1, by locator only.
- Ownership against open pull requests was checked through the overlap lists and a search of the open heads for the quantum plane only.

## Source issues

- none

## For the human reviewers

- **Ownership.** Main's `TauCetiRoadmap/KacMoody/README.md:52–54` names KacMoody, Part II as the home of "the quantum Casimir"; `README.md:30–31` here owns it (§2.3). The description says so and leaves that line to a separate change.
- **Pin.** The generated `STATUS.md` (`:24`, `:26`) lists `TauCeti.CartanDatum`, `signedLaurentQuantumBinomial` and `quantumFactorial` in Tau Ceti; the pin has none, so the Layer 0 definitions of `Suggested.lean` duplicate nothing today.
