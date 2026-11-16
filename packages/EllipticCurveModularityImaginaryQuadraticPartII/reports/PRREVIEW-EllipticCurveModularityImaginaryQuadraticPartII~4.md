# Review of EllipticCurveModularityImaginaryQuadraticPartII (pull request #2445 at 8aabd7a)

**Verdict:** accepted

No findings. Incremental re-review of 13 changed lines since `fcd601d`, with the pull request's title and description read against this head.

## Previous findings

- R01 — repaired: README lines 932–933 now read "`1 + D + ⋯ + D^(q_v − 1) = 1` when `p ≥ 5` and `p | q_v − 1`", agreeing with (d) at line 918.
- R02 — repaired: the description's summary now reads "Theorems 6.2 and 8.1 remove the hypothesis ζ₅ ∉ F from the residual criterion of ModularityAndLanglandsExtensions §2.29; Theorem 6.2 also serves CM lifting arguments with residual image SL₂(𝔽₅) and a protected place."

## Verified sound

| Target | Instances tried | Values computed (roadmap side / check side) | Result |
| --- | --- | --- | --- |
| 3.3, fourth Check (now "For `p = 5`") | tame extension of ramification index 5 at `ℓ ≠ 5`; index 3 as control | inertia of the extension maps to `τ⁵`, `U⁵ = [[1,5],[0,1]] = 1` in `𝔽₅`; index 3 gives `U³ ≠ 1`, protection kept, as the third API bullet says | holds |
| 3.5, first Check (now "For `p = 5` and `μ₅ ⊂ F_v`") | `D = Ad(U)` on `e, h, f`; `q_v ≡ 1` and `q_v ≡ 2 mod 5`; `ρ̄(φ) = [[q_vδ, z],[0, δ]]` | `ker(D − 1) = k e` (`D(h) = h − 2e`, `D(f) = f + h − e`); `φ` scales `e` by `q_v`: `1` gives `h⁰ = 1`, `h¹ = 1 + 1 = 2`; `2` gives `h⁰ = 0`, `L_v = 0` | holds |
| 3.5, second Check (R01) | `(p, q_v) = (5, 11), (7, 29), (7, 11), (3, 4)`; cocycle on `φτφ⁻¹ = τ^(q_v)` with `ρ̄(φ) = 1` | `q + C(q,2)(D−1) + C(q,3)(D−1)²`: `1`, `1`, `4 + 6(D−1) + 4(D−1)²`, and `C(4,3) ≡ 1 mod 3`; relation gives `ξ(τ) − (D−1)ξ(φ) = ξ(τ)`; `dim Z¹ − dim B¹ = 4 − 2` | holds; the stated condition is exactly the one (d) uses |
| Downstream consumers, Theorem 6.2 bullet (proviso added) | `ρ̄` with image `SL₂(𝔽₅)`, `ζ₅ ∈ F`, potentially good reduction away from five; §6.2 lines 1381–1385 | then `P = ∅`, clause (4) fails and neither alternative of §6.2 applies; the bullet now requires a nonempty `P` with the four conditions of §6.2 | holds; agrees with §6.2 |
| 6.2 (headline, cited by the changed bullet) | the two alternatives at lines 1381–1385 against the bullet and against the description's summary | protected alternative: `ζ₅ ∈ F`, nonempty finite `P`, `v ∤ 5`; bullet and summary both state the protected place | consistent |

The rows for the untouched statements stand as in the previous review, of `fcd601d`.

- Changed passages: 4 (README lines 857–858, 929–933, 1756–1758); no heading, section number, supplier citation or Lean line changed; no layer added, removed or reordered.
- Source locators checked against the text: 1 (the sampled §3.5: CaptainSude26 lines 177–226 state Lemmas 3.1–3.2 for `μ₅ ⊂ F_v`, `ρ̄(τ) = U`, `ρ̄(φ) = 1`, with `q_v ≡ 1 mod 5` at line 193, the case the first Check now names).
- Cross-roadmap citations resolved for the changed bullet: 2 (CrystallineLocalGlobalCompatibilityCM §9.12 and ModularityAndLanglandsExtensions §2.29, both at their open heads).
- Pull request text: title and description read against the head. It adds the roadmap (3 files, 1849 lines, no removal); the three headline theorems, the layer contents, the statement that `Suggested.lean` declares nothing, and the sentence on Theorems 6.2 and 8.1 all agree with the README and the Lean docstring. No sentence is contradicted and no change is left unstated.
- Gate at 8aabd7a: every check passes (all counters 0, `OK`). `depcheck: 258 roadmaps, 2463 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The diff outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there is no signature to compare and no declaration to probe for padding; none of Theorems 2.5, 6.2, 8.1 is statable at the pins and the docstring names each with what it lacks.
- Declared gap `gap:acc-torsion-inertial-comparison`: untouched by the change; stands as in the previous review.

Overlap check: `overlaps.md` lists no shared pull request, dropped id or revision-only id; the closest roadmaps are those the previous review read (EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityTotallyReal, PotentialAutomorphyInfrastructurePartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, CrystallineLocalGlobalCompatibilityCM, ArithmeticGaloisRepresentations), and the change touches no object any of them owns; nothing shared.

Source independence: changed passages only; 4 passages compared with 1 source (CaptainSude26 lines 177–226), none shared beyond formulas; largest share CaptainSude26, 22 of 51 parenthetical locators, unchanged; no layer added, removed or reordered, so the contents comparison stands as at `fcd601d`: independent.

## Not verifiable

- The description's sentence on AI assistance (the number of review and red-team rounds): no file of the pull request records it.

## Source issues

- **Misprint** in CN23 at the end of the proof of Theorem 5.2, p. 86 (line 4460): the source says the auxiliary set contains all `q`-adic places of `K`; it should be of `F`, the field of the theorem; affects nothing.

## For the human reviewers

- Scope: Theorems 6.2 and 8.1 (Layers 3–8) rest on CaptainSude26, a pseudonymous, unrefereed GitHub release of 7 October 2026 (README lines 112–113 and the References entry). LeHung26 line 355 has no seed when `ζ₅ ∈ K`; no other cited source treats that case.
- Scope: Theorem 2.5 rests on LeHung26, an unrefereed discussion draft whose Theorem 1.1 (line 86) assumes three inputs of OpenAI26, also unrefereed. No refereed statement was found in the eight cited sources or the open roadmaps.
- Licence: CaptainSude26 states no licence (README, References); `sources.toml` records it and OpenAI26 as `author-page`, both GitHub-hosted files.
