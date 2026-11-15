# Review of PerfectoidTowers (pull request #816 at 2dc4ab5)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README lines 69, 317, 1901, 1917 and 1919 cite `TauCeti.exists_continuous_lift`; line 317 locates it in `TauCeti/Topology/Discrete.lean`, matching the pinned declaration at line 50.
- R02 — repaired: the description’s `roadmap-summary` block now names `TauCeti.exists_continuous_lift`, matching the head and pin.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| P9.0 continuous lifting through discrete surjections | Reduction ℤ/4 → ℤ/2; identity on ℤ/2; section s(0)=0, s(1)=1 | π(s(0))=0, π(s(1))=1: π∘s=id; s is continuous on the discrete domain. | Holds; the section need not be additive: s(1+1)=0, s(1)+s(1)=2. | Citation repaired |
| P9.0 surjectivity on continuous cochains | G=S₃, degree 1, discrete trivial coefficients ℤ/4 → ℤ/2 | Source has 4⁶=4096 cochains; target has 2⁶=64; each target cochain has 2⁶=64 lifts. | Surjective for a nonabelian group; no equivariant section required. | Citation repaired |
| P9.0 inverse-limit comparison using the corrected supplier | G=1; Tₙ=ℤ/2ⁿ with reduction maps, trivial action | Both complexes have ℤ₂ in every degree; d⁰=0, d¹=id; H⁰=ℤ₂, Hⁱ=0 for i>0. | Comparison and differential conventions agree. | None |

Untouched statement rows stand as in the previous review, of `0e61ddc`.

- Sources: 2 locators checked, Rubin Appendix B §2, Definition 2.1, printed p. 151 (Rubin line 6571), and Remark 2.2, printed p. 152 (Rubin line 6584); 0 seeded targets changed.
- Pins: opened `TauCeti.exists_continuous_lift` (`TauCeti/Topology/Discrete.lean:50`), its cochain use (`TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean:524`), `continuous_pi_iff` (`Mathlib/Topology/Constructions.lean:774`) and `Algebra.IsInvariant` (`Mathlib/RingTheory/Invariant/Defs.lean:34`).
- Citations: resolved PerfectoidSpaces P7.16, AdicEtaleGeometry A4.2a and DiamondsAndVStacks D2.9/D6.9 on main; PadicPeriodRings #940, `TauCetiRoadmap/PadicPeriodRings/README.md:36`, still consumes the two P9.0 comparisons under their existing headings.
- PR text: checked the title, summary block and prose against the addition of 3 files, 3836 lines, 52 headings and 16 named declarations; no removed targets, supplier change or outside-folder edit is concealed.
- Lean: standalone elaboration and the 16-declaration `#check @name` probe passed with only 9 `sorry` warnings; the three reported binder suspects explicitly retain `IsTateRing A`. No signature changed.
- Gate: every counter zero, `OK`; targeted build passed. Its replay also emitted a module-system advisory on the untouched import form; standalone elaboration did not. Worktree clean.

Dependency-check output:

```text
depcheck: 245 roadmaps, 2207 edges, 0 problem(s)
```

Overlap check: read PerfectoidSpaces, DiamondsAndVStacks, AdicEtaleGeometry, PerfectoidSpacesPartII, ClassicalAdicEtaleCohomology, FarguesFontaineDiamonds, DiamondsAndVStacksPartII and PerfectoidShimuraVarieties; shared perfectoid carriers belong to PerfectoidSpaces, diamond/site comparisons to DiamondsAndVStacks, finite Galois descent to AdicEtaleGeometry, and tower quotients/descent applications to PerfectoidTowers. The corrected lifting result belongs to pinned Tau Ceti; no ownership changes.

Source independence: changed passages only; 5 citation-bearing passages compared with Rubin and the pinned Tau Ceti source, with no new copied expression or reused material. Largest share: HJ, 46 of 195 source-key occurrences before References. Arrangement not compared again: no layer added, removed or reordered.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
