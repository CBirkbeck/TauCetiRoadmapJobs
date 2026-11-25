# Review of CoverTimeBoundsByEffectiveResistance (pull request #3122 at e01fdca)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. On connected networks 1.1 (a) now rests on SpectralSparsification 2.1 and no longer proves that identity a second time; the new step 3 of its route was recomputed exactly and is correct, and the citation resolves at the supplier's open head. There are no findings, no small corrections and no format notes. Three points are left for the human reviewers (the weight of textbook exercises among the sources, the relation to HittingAndCoverTimes, and the two open suppliers that must merge first).

## Previous findings

- R01 — repaired: step 3 of the route of 1.1 (a) cites "SpectralSparsification 2.1 (`dotProduct_inv_groundedLaplacian_mulVec`, connected), at the grounding `z` and the pair `a`, `x`"; the `*Needs:*` line, Layer 1 Dependencies, scope section and supplier contracts name it.
- N01 — repaired: "LP, Exercise 2.62 (a), (b), (d), p. 65, for finite, connected, simple networks; LP, Exercise 2.68, p. 65, for every finite network, in the form of a hitting probability".
- N02 — repaired: the References now read "the corrected and updated edition on the first author's site (version of 19 August 2026)".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 (a) `voltage_eq_effResistance` (statement unchanged; route step 3 new) | 35248 triples on 400 random weighted networks with loops, 2 to 6 vertices, disconnected included; `K₃` and path by hand | `K₃`, `a, z, x = 0, 2, 1`: voltage `1/3`, `(2/3 + 2/3 − 2/3)/2 = 1/3`; path `0–1–2`: `G = [[2, 1], [1, 1]]`, `(2 + 1 − 1)/2 = 1 = G(1, 0)` | holds | none |
| Route step 3: `R(a ↔ x) = G(a, a) − G(a, x) − G(x, a) + G(x, x)` and `G` symmetric | 17840 triples of distinct vertices with `L_z` invertible | both identities exact in every case; `K₃` grounded at `2`: `2/3 − 1/3 − 1/3 + 2/3 = 2/3 = R(0 ↔ 1)` | correct | none |
| SpectralSparsification 2.1 as cited | statement at its open head against the supplier contract here; `z` distinct from `a`, `x` | Lean signature: connected `N`, any `z`, `x`, `y`, `b` = `Pi.single x 1 − Pi.single y 1` restricted to `{w // w ≠ z}`; equals `e_a − e_x` when `a, x ≠ z` | agrees | none |
| Copied definitions against SpectralSparsification's | `weight`, `graph`, `laplacian`, `groundedLaplacian`, `voltage`, `effResistance` | bodies identical in both files | agree | none |

The rows for the statements the change does not touch (1.1 (b), 1.2, 2.1 (a), 2.1 (b), 2.2 and the Examples) stand as in the previous review, of `fe91f9d`.

- Source locators checked against the text: 2 of 2 in the changed passage (LP, version of 19 August 2026: Exercise 2.62 states a finite, connected, simple network, `lyons-peres` line 3927, printed p. 65; Exercise 2.68 states every finite network, line 3954, p. 65).
- Library declarations opened at the pin: `Matrix.IsSymm.submatrix` (`Mathlib/LinearAlgebra/Matrix/Symmetric.lean`, line 143), `Matrix.IsSymm.inv` (`Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`, line 295, no invertibility hypothesis), `Matrix.nonsing_inv_apply_not_isUnit` (same file, line 173), `Matrix.exists_mulVec_eq_zero_iff` (`Mathlib/LinearAlgebra/Matrix/ToLinearEquiv.lean`).
- Cross-roadmap citations resolved: SpectralSparsification 2.1 at its open head (`README.md` §2.1, `Suggested.lean` line 127); its route uses only ElectricalNetworksAndRandomWalks 1.2 and 2.1 and Mathlib, and its README does not cite this roadmap, so there is no cycle.
- No stale reference remains: `existsUnique_isHarmonicAt`, `effResistance_eq_div` and `Matrix.mul_nonsing_inv` occur nowhere in the folder.
- Elaboration of `Suggested.lean`: six `sorry` warnings, nothing else; the change touches one docstring only.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing in the pull request lies outside the folder.
- Automatic checks: all passed.
- Pull request text: the description names SpectralSparsification 2.1 as the supplier of 1.1 (a) on connected networks and lists it under the open suppliers; nothing in it contradicts this head.

Overlap check: read HittingAndCoverTimes, SpectralSparsification, ElectricalNetworksAndRandomWalks; effective resistance as the quadratic form of an inverse grounded Laplacian is owned by SpectralSparsification 2.1 and cited here; mean hitting and cover times, the voltage form of hitting times and Matthews' bounds are owned by HittingAndCoverTimes and cited; networks, voltages and resistance by ElectricalNetworksAndRandomWalks.

Source independence: changed passages only; 3 passages compared with 1 source (LP Exercises 2.62 and 2.68; the new step 3 has no counterpart in LP), none shared; largest share LP, 5 of 8 locators; no layer added, removed or reordered, so the contents comparison stands as in the previous review: independent.

Research link: The headline bounds are Tetali (1991), Aleliunas–Karp–Lipton–Lovász–Rackoff (1979) and Coppersmith–Feige–Shearer (1996), as attributed in LP (comments on Exercises 2.108, 2.132) and LPW (notes to Chapter 11), which I read; they are the resistance method behind the later `2n²` bound of Feige (1997).

## Not verifiable

- The original papers of Tetali, of Aleliunas, Karp, Lipton, Lovász and Rackoff, and of Coppersmith, Feige and Shearer were not read; the README gives them no locator and attributes them as LP and LPW do.
- Ownership against open pull requests was checked for the changed passage only, against SpectralSparsification, HittingAndCoverTimes and the closest-roadmap lists.

## Source issues

- none

## For the human reviewers

- **Scope.** Five of the README's eight source locators are exercises of Lyons–Peres (2.62, 2.68, 2.108, 2.132); the three others are two theorems of Levin–Peres §11.4. The results are attributed to refereed papers of 1979, 1991 and 1996, which the README does not cite directly.
- **Scope.** The roadmap has two layers and six theorems, and supplies exactly the items that HittingAndCoverTimes (open, same author) lists as not treated; whether it stands alone or belongs with that roadmap is yours to decide.
- **Scope.** The roadmap now has two suppliers that are still open pull requests, HittingAndCoverTimes (#2796) and SpectralSparsification (#2964); the description lists both as merging first.
