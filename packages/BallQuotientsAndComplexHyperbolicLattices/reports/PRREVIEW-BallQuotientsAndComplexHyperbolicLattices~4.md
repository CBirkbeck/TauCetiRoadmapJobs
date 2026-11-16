# Review of BallQuotientsAndComplexHyperbolicLattices (pull request #2425 at b8bc019)

**Verdict:** accepted

Incremental re-review of 6 changed lines since a4e5dee. No finding.

## Previous findings

- R01 — repaired: line 3 "which makes holomorphic maps from smooth algebraic varieties algebraic"; line 819 "§10.3 makes every holomorphic map from a smooth variety to S_Γ algebraic; for instance the maps S_(Γ_H) → S_Γ of §12.2, whose source is smooth (§12.2)".

## Verified sound

| Statement | Instances tried | Roadmap side | Computed / source side | Result |
|---|---|---|---|---|
| §10.3 Borel algebraicity, as cited at lines 3 and 819 | V smooth; V = {y² = x³}; exp: ℂ → Y(1) | lines 3, 819 and 777 all say smooth V, torsion-free Γ | MilneSVI line 1742 to line 1744: nonsingular quasi-projective V; cusp now excluded at all three places; PSL(2,ℤ) control unchanged | holds |
| §12.2, new clause: r_W(Γ_H) torsion-free for torsion-free Γ | n = 2, W = {z₂ = 0}, γ = [diag(A, e^(iθ))]; γ = [diag(1, 1, −1)]; γ = [diag(1, −1, 1)] | r_W(γ)^k = 1 forces γ = 1 | A^k = λ gives γ^k = [diag(λ, λ, e^(ikθ))] in the image of U(1) × U(W^⊥), compact; discrete, so finite order; second and third γ are torsion, excluded | holds |
| §12.2, "smooth and quasi-projective by §9.5 applied in dimension m" | r_W(Γ_H) lattice in PU(1,m), m ≥ 1 (§12.1), torsion-free | S_(Γ_H) smooth, so §10.3 applies to it | §9.5 (line 727): S_Γ normal quasi-projective, "smooth when Γ is torsion-free"; kernel of r_W compact as §12.1 (line 916) states | holds |
| Layer 10 Examples, line 819: source of j smooth for torsion-free Γ | Γ torsion-free, not assumed neat | cites §12.2 for smoothness | the §12.2 argument uses only torsion-freeness of Γ (neatness enters through §6.4, neat ⇒ torsion-free), so it covers this case | holds |

The rows of the other statements stand as in the previous review, of a4e5dee.

- Sources: 1 locator re-read at its lines (MilneSVI line 1742 to line 1744, with Aside 3.17(a), line 1782 to line 1785), for the sampled target §10.3, the only sampled target the change touches.
- Cross-references of the changed passages resolved inside the README: §§6.4, 9.5, 10.2, 10.3, 10.6, 12.1, 12.2 at lines 540, 727, 777, 912, 926; no supplier citation and no `*Needs:*` line changed.
- Other statements of algebraicity of holomorphic maps (README lines 787, 791, 809; the module docstring of `Suggested.lean`, lines 36 to 37; the pull request's description) searched for the unscoped claim: none makes it.
- Gate: every check passes at b8bc019 (`build=0 OK`). Dependency check: `depcheck: 248 roadmaps, 2342 edges, 0 problem(s)`. Nothing changes outside the folder.
- Lean: `Suggested.lean` is unchanged since a4e5dee; `lake env lean` gives 7 `sorry` warnings and nothing else.
- Pull request's text: title and description read against this head; they scope extension and Borel algebraicity to torsion-free lattices and say nothing the change contradicts.
- Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, KleinianGroups, ShimuraVarieties, GeometricFreyMazur, FuchsianOrbifolds, AdelicAlgebraicGroups, ConformalMappingPartII (scopes as in the previous review; the overlap lists are unchanged and report no dropped id, no second copy, no other pull request changing this folder); the change adds no object, nothing newly shared.
- Source independence: changed passages only; 3 passages compared with 2 sources (MilneSVI line 1742 to line 1785, BaldiUllmo2023 line 686 to line 702), none shared: the torsion-freeness argument of §12.2 is in neither; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Nothing in the changed passages. The uncertified and waived locators listed in the previous review (Goldman1999, Raghunathan1972, GarlandRaghunathan1970, Borel1969, Alperin1987, SiuYau1982, Cartan1957, Borel1972, BailyBorel1966) are untouched and remain unread.

## Source issues

- none

## For the human reviewers

- none
