# Review of HeightsRationalPointsAndObstructions (pull request #1017 at 3d8c7ef)

**Verdict:** accepted

**Summary.** Accepted: the two small corrections of the previous review are repaired, and the new passages (the theta divisor and twice-theta bundle cited from JacobianChallengePartII, the constant-field remark and Check of §0.10, the cube scaling in §0.19, the genus-one normalization Check of §5.10, the pins) are mathematically correct and cite sections that exist on main with the stated content. Incremental re-review of 24 changed lines since b30550a. Two format notes, none blocking. Nothing new is left for a human to decide; the licence bullet of the previous report stands.

## N01 — the module docstring of `Suggested.lean` still states the implication opposite to the README's route

Lines 15–16 say that §5.9 "follows from Mordell–Weil and finite-rank Mordell–Lang". The implication is true (take Γ = A(K)), but the README derives Mordell (§6.4) and finite-rank Mordell–Lang (§5.13a) from §5.9. Would "is the case Γ = A(K) of finite-rank Mordell–Lang and is not stated separately" serve better?

## N02 — the new Check of §5.10 says the inequality "does not hold" at g=1

README line 2553. On an elliptic curve of positive rank it fails (w = nz has cosine 1 > 3/4 with ‖w‖ = n‖z‖ arbitrarily large); on one of rank 0 there are no large points and it holds vacuously. "Need not hold" or "fails at positive rank" would be exact.

## Previous findings

The previous report had no finding (its R01 of the round before was already repaired); its small corrections and format note are accounted for here.

- C01 — repaired: §3.21, line 2045, "The dependency on §4.6 uses only §5.9 and the Abel–Jacobi embedding of §6.4, whose inputs are Layers 0–1, §§5.1–5.4c, 5.9a–f and 5.17a and suppliers"; Layer 4 Dependencies, line 2202, "§§5.9 and 6.4 for §4.6".
- C02 — repaired: *How to read the build*, line 187, "Mordell's theorem for curves is §§4.6 and 6.4; citations of a Section 5.12 mean these."
- N01 — not repaired: `Suggested.lean` lines 15–16 unchanged; written again as N01 above.

## Verified sound

### Adversarial table (statements the diff changes)

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions and supplier contract: `L = O(θ_α + [−1]*θ_α)` is Θ_X, independent of α | JacobianChallengePartII §§3.2, 3.3, 3.9 on main; elliptic curve, α = O(0) | §3.3: Θ_X = Δ\*(P∨), no α. §3.9: Δ\*P ≅ O(−θ_α−[−1]\*θ_α); dual gives the claim. Elliptic: degree −(−4+2) = 2 = deg O(2·0). | correct, as Picard classes over a field, which is what §3.9 states |
| Conventions: `b_L/2 = b_Theta`, `‖z‖² = ĥ_Θ(z)+ĥ_Θ(−z)` | L symmetric; M symmetric principal | ĥ_L = ĥ_Θ+ĥ_([−1]\*Θ), ĥ_([−1]\*Θ)(z) = ĥ_Θ(−z); ‖z‖² = b_L(z,z)/2 = ĥ_L(z). M symmetric: 2ĥ_M(z), as the existing Check says. | consistent |
| §5.10 new Check, g=1 | E with origin O; rank 0 and rank ≥ 1 | Sym⁰C = Spec K, θ_α = origin (supplier §3.2 says so); L = O(2O); ‖z‖² = ĥ_(2O)(z) = 2·canonicalHeight/2 = canonicalHeight, matching §0.19's Check. Rank ≥ 1: w = nz has cosine 1. | normalization correct; wording of "does not hold" is N02 |
| §0.10: k not algebraically closed in K | K = ℚ(i)(t), k = ℚ, k₁ = ℚ(i), D: t = 0; a = i | k(D) = ℚ(i): weight [k(D):ℚ] = 2, value e⁻²; over ℚ(i) weight 1, value e⁻¹; ratio of exponents [k₁:k] = 2. ord_D(i) = 0 for all D: value 1, i ∉ ℚ. | correct; agrees with `extend_ofPolarization` (ℚ(t) → ℚ(i)(t): exponent [k′:k] = 2) |
| §0.10: O_(V,D) excellent | V normal projective over k, D prime divisor | Local ring of a normal finite-type k-scheme at a codimension-one point: a DVR, a localization of a finitely generated k-algebra, hence excellent. | meets §0.9's requirement |
| §0.19: `L⁺⊗L⁻ = L²`, `[2]*L⁺ ≅ (L⁺)⁴`, `[2]*L⁻ ≅ (L⁻)²` | general L; L symmetric; L antisymmetric | L⊗[−1]\*L⊗L⊗([−1]\*L)⁻¹ = L². [−1]\*L⁺ = L⁺, so n² = 4; [−1]\*L⁻ = (L⁻)⁻¹, so n = 2 (A1.5: n(n+1)/2 − n(n−1)/2 = n). L symmetric: L⁻ trivial, ĥ_L = ĥ_(L²)/2. | correct; d = 4 and d = 2 > 1 as §0.18 needs |
| §3.21: inputs of §4.6 through §§5.9, 6.4 | *Needs* lines of §§5.1–5.4c, 5.9, 5.9a–f, 5.17a | 5.9→5.9a–f; 5.9a→5.9b, 5.17a; 5.9c→5.3–5.4c, 5.9b; 5.4c→5.2–5.4b; 5.2→1.0, 5.1; 5.9d→0.19, 0.25; 5.9f→1.7, 5.4c; 5.17a→0.9, 0.14a. | closure lies inside the list stated; no Layer 2–4 target; acyclic |
| Pins in the README and the module docstring | `lake-manifest.json` | Mathlib rev 1b1ccf4b088b…, Tau Ceti rev 2fd255d997f4…: equal to the README's full hashes and the docstring's short ones. | correct |

The rows for the roadmap's other statements stand as in the previous review, of `b30550a`.

### Counts

- Automatic checks at 3d8c7ef: every check passes. Dependency check, run again: `depcheck: 200 roadmaps, 2209 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HeightsRationalPointsAndObstructions/Suggested.lean` prints seven `declaration uses sorry` warnings (lines 59, 71, 78, 90, 137, 151, 165) and nothing else. The diff changes one docstring line and no statement, so no one-tactic probe was repeated.
- Cross-roadmap citations resolved on main: JacobianChallengePartII §3.2 (line 483), §3.3 (line 505), §3.9 (line 594), with genus g > 0 and any field in its Conventions; AbelianSchemesAndArithmeticModuli A1.4 (line 882), A1.5 (line 898, `[n]^*L` formula), A2.2 (line 1093, Poincaré bundle). Both roadmaps are on main, so the new supplier is not upward.
- Library at the pin: the absence claim of the docstring spot-checked by object (no general abelian Néron–Tate height, generalized global field, Brauer–Manin pairing or K/k-trace in the pinned Mathlib or Tau Ceti); the elliptic `canonicalHeight` limit of naive height over n² is at `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Limit.lean` line 77, `fg_point_of_numberField` at `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean` line 145.
- Source locators: the diff adds none. The seeded sample falls in no changed passage; §0.18 was read against the changed §0.19 (d = 4, d = 2, both > 1).
- The title and description against the head: no sentence contradicted. The added supplier JacobianChallengePartII is on main, and the description says roadmaps on main are cited by name in the README.

Overlap check: read HeightsRationalPointsAndObstructionsPartII, ArakelovGeometryAndAbelianHeightsPartII, ArithmeticDynamics, ArithmeticStatisticsPartVI, SubspaceTheorem, DiophantineApproximationAndTranscendence, GroupSchemesOverABase, MordellLawrenceVenkatesh, ErdosProgressionPowers and NonabelianLevelStructures as in the previous reviews, and JacobianChallengePartII this round; the theta divisor θ_α and the bundle Θ_X are owned by JacobianChallengePartII §§3.2–3.3 and cited here, not restated; nothing shared.

Source independence: changed passages only; 4 passages (the Conventions sentence on Θ_X, the §0.10 constant-field remark, the §0.19 scaling sentence, the §5.10 Check) compared with the supplier text they cite (JacobianChallengePartII §§3.2, 3.3, 3.9; AbelianSchemesAndArithmeticModuli A1.5), none shared; no source locator is added and no source text was opened this round; largest share Poonen, 55 of 241 source lines as in the previous review; contents not compared again (no layer added, removed or reordered).

Research link: Layer 5 proves Faltings's theorem on subvarieties of abelian varieties (Faltings 1991) by Rémond's inequality (2000), with Mordell as its curve case, and Bogomolov by Ullmo (1998), Zhang and Szpiro–Ullmo–Zhang (1997); Layer 3 is the descent and Brauer–Manin theory of Sansuc (1981), Skorobogatov (2009), Cao (2018). Rests on the README's References and layer sources.

## Not verifiable

- Faltings 1991 (§§5.9, 5.9a): carried from the earlier reviews; JSTOR only. The statement of §5.9 is untouched.
- The description's sentence on AI assistance cannot be checked from the repository.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's *Provenance* paragraph (near line 3008) names the Apache-2.0 formalization AxiomMath/Mordell as overlapping §§0.11–0.21, 1.8 and 5.10–5.11 and says no code is transferred. Its Faltings statement differs from `mordell_finite` in name, binders and carriers.
