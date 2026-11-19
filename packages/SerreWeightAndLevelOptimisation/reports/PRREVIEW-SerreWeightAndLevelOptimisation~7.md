# Review of SerreWeightAndLevelOptimisation (pull request #2518 at 79248cf)

**Verdict:** accepted

**Summary.** Accepted, with no finding. The repairs to §2.11, §5.8 and §6.10 agree with Ribet's (4.5), Buzzard's case (iii) and Khare–Wintenberger's proof of Theorem 8.4, the supplier sections are now cited by their headings, and ClassicalSerreModularity is named again as a consumer. There are two small corrections and one format note, none blocking: SerreModularityByCompatibleSystems has since changed and now cites §2.13 and §§5.9–5.10 for the level, so the new consumer sentence in the README, and the same sentences of the description, describe that roadmap as it was. The status of the Gross scan remains with the human reviewers.

## C01 — The consumer sentence says SerreModularityByCompatibleSystems reaches the level by minimal lifts; at its head it cites §2.13 and §§5.9–5.10

Downstream consumers (line 1710) says: "for odd p, and for `p=2` with `k(ρ)=2`, it reaches the level `N(ρ)` by minimal lifts instead of by §2.13 and §5.9", and that it consumes "§§3.7–3.8 for the weight". A reader concludes that §2.13 and §5.9 have no user there, and that §3.8 has one.

At the open head of SerreModularityByCompatibleSystems, the target `S6/strong-form-by-minimal-lifts` reads otherwise: for odd p it is "SerreWeightAndLevelOptimisation §2.13 … followed by its §3.7", with §2.1 for the divisibility; for `p=2`, `k(ρ̄)=2` it cites §5.9 with §5.2, and §5.10 in the scalar dihedral case; only the scalar non-dihedral dyadic case is proved by a minimal lift. Its *Needs* lines list §§2.1, 2.13, 3.7, 5.2, 5.9–5.11, 6.5 and 6.12 there, §5.6 and Layer 6 for the strong form, and §§3.1, 3.2, 3.5–3.7 and 4.1 for the consequences; §3.8 is cited nowhere in it. A sentence that agrees with that head: "SerreModularityByCompatibleSystems consumes §2.13 with §§2.1 and 3.7 for odd p, §§5.2 and 5.9–5.10 for `p=2` with `k(ρ)=2`, §5.6 and Layer 6 for `p=2` with `k(ρ)=4`, and §§3.1–3.2, 3.5–3.7 and 4.1 for its consequences; it proves only the scalar non-dihedral dyadic case, by a minimal lift."

## C02 — The description repeats the same account of SerreModularityByCompatibleSystems

The summary block says "It takes Edixhoven's weight theorem and small-weight twisting from here, and the dyadic optimisation for weight four at p = 2; for odd p it reaches Serre's level by minimal lifts", and the prose says it takes "§§3.7–3.8 for the weight in its strong form" and reaches the level "by minimal lifts rather than by §2.13 and §5.9". By the citations given under C01, that roadmap now takes the descent of §2.13 with Edixhoven's theorem of §3.7 for odd p and §§5.9–5.10 for `p = 2` with `k(ρ) = 2`, and uses a minimal lift only in the scalar non-dihedral dyadic case; it does not cite §3.8. The two sentences would read, for example: "It takes the descent to the full Serre level, Edixhoven's weight theorem and the dyadic optimisation from here, and proves only the scalar non-dihedral dyadic case itself, by a minimal lift." The rest of the description agrees with the head: one file changed, 18 lines added and 16 removed against main, no section or declaration added, removed or renumbered.

## N01 — Two of the renamed references still read awkwardly

In §5.11 (line 1337) a leftover label breaks the sentence: "is assigned to SerreModularityByCompatibleSystems, scalar dyadic completion and appears only in the export manifest"; "is assigned to the scalar dyadic completion of SerreModularityByCompatibleSystems and appears" would do. The Check of §6.11 (line 1668) lacks an article and a possessive: "nor final SerreModularityByCompatibleSystems Serre theorem".

## Previous findings

The previous report, of `514db70`, had no finding; its small corrections and its format note are accounted for here.

- C01 — repaired: line 1712 names ClassicalSerreModularity as consumer of §§3.1–3.8, Layer 4, §§6.6–6.11 and the dihedral export of Layer 5, as its *Needs* lines at its head say.
- C02 — partly repaired: the sentence was made exact for the head of that day; that roadmap has changed since and the sentence is again out of date (C01 above). Its other half is D01, now resolved.
- C03 — repaired: §2.11 assumes "`α` ramified and `α|I_q` of `ℓ`-power order, so that the residual `ᾱ` is unramified"; §5.8 says "ramified-special twists whose residual character is unramified".
- C04 — repaired: §6.10 takes `r_0` "not among the `v_i` and not above p", with principal congruence level above it for neatness, outside the discriminant, its ramification removed by Theorem 8.2.
- C05 — repaired: §§R18.3.24, R18.3.32 and R18.5.17–R18.5.18 are cited by subject; the three undeclared names no longer occur.
- C06 — repaired: the description no longer attributes θ-operators to this roadmap. Its replacement sentence is C02 above.
- N01 — partly repaired: the Check of §5.11 is now grammatical; lines 1337 and 1668 are unchanged (N01 above); §6.12 was left as it was, which is a matter of taste.

## Deferred findings

- D01 — resolved: at its open head `S6/strong-form-by-minimal-lifts` now cites §2.13 with §3.7 for odd p, and §§5.9–5.10 at `p = 2`, instead of proving the level again.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §2.11 hypothesis and route | ribet94 lines 497–506 (pp. 10–11); q=5, ℓ=2, `α|I=ω₅`; α with an unramified factor of odd order; ℓ odd | Source: `e>0`, α ramified, then ᾱ unramified, `α|I` of ℓ-power order. `ω₅` has order 4; `φ=ω₅⁻¹`, conductor 5, order 4, reduction 1; conductor `5²→5`. Old hypothesis fails for the second α, new holds. | matches |
| §2.11, emptiness for odd ℓ | `ε=α²χ^{2−k}`, ε of order prime to ℓ, `det ρ` unramified at q | `α²|I=1`, so `α|I` has order dividing `gcd(2,ℓⁿ)=1`: unramified, contradiction | true |
| §5.8 list of cases | buzzard00 lines 616–626, 636 (p. 108) | (iii): twist of special by a tamely ramified character with unramified reduction, removed by a twist of 2-power order | matches |
| §6.10 auxiliary place | kw2 lines 3578, 3583–3592 (p. 77), 3616–3618 (p. 78) | `r₀∉Σ`, not over p; level `U(r′)` above it, for neatness; `D_i` ramified at ∞ and above `v_1..v_i` only (2i finite places); Theorem 8.2 removes ramification above `r₀` | matches |
| Supplier headings (lines 115, 127) | HilbertModularVarietiesAndShimuraCurves on main, lines 2449, 2490, 3256, 4371 | R18.5.17 "Quaternionic dual graph identification", R18.5.18 "Quaternionic character lattice and monodromy", R18.3.24 "Common liftable image of Taylor–Wiles coefficient twists", R18.3.32 "Fixed ramified signs throughout a localized eigensystem" | matches |
| Downstream consumers, first paragraph | SerreModularityByCompatibleSystems at its open head, Layer S6 | cites §§2.1, 2.13, 3.7, 5.2, 5.9–5.11, 6.5, 6.12, 5.6, Layer 6, 3.1, 3.2, 3.5–3.6, 4.1; §3.8: 0 times; minimal lift only for scalar non-dihedral `p=2` | out of date: C01, C02 |
| Downstream consumers, second paragraph | ClassicalSerreModularity at its open head | cites §§3.1–3.6, 3.7, 4.2, 4.7–4.8, Layer 4, §§6.6–6.8, 6.6–6.11, Layer 5 for Lemma 6.2(i); table row "Layers 3–6" | matches |
| §5.11 Check (line 1351) | `S6/strong-form-by-minimal-lifts` at that head | third bullet proves the scalar non-dihedral case from Theorems 5.1(1) and 4.1; no result of this roadmap needs it | true |

The rows of the previous review, of `514db70`, stand for every statement the change does not touch; the change alters no statement of `Suggested.lean`.

- Source locators checked against the texts: 3 changed passages in 3 sources (ribet94 lines 490–510, buzzard00 lines 612–640, kw2 lines 3564–3628).
- Cross-roadmap citations resolved: 4 section ids of HilbertModularVarietiesAndShimuraCurves on main (4306cc7); the citations of this roadmap in SerreModularityByCompatibleSystems (17 lines) and ClassicalSerreModularity (9 lines) at their open heads.
- Dependency check: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. This roadmap is at position 177 of the merge order, ClassicalSerreModularity at 182, SerreModularityByCompatibleSystems at 266; both are named as consumers only.
- Elaboration: `lake env lean` on `Suggested.lean` gives four `declaration uses sorry` warnings (lines 74, 93, 108, 128) and nothing else; the file is the one on main, so the elaborated types and the padding probe of the previous review stand.
- The automatic checks all pass at this head. Against main the folder changes by 18 insertions and 16 deletions in `README.md` (1758 lines to 1760); no heading or Lean declaration is added or removed, and nothing outside the folder changes.
- Pull request text: title and description read against the head and the change; one point (C02).

Overlap check: read SerreModularityByCompatibleSystems and ClassicalSerreModularity at their open heads and HilbertModularVarietiesAndShimuraCurves on main; the readings of GL2ModularityLifting, GL2ModularityLiftingPartII, AutomorphicGaloisRepresentations, AlgebraicModularFormsAndSerreWeights and ModularCurvesPartII stand from the previous review. The one shared statement of that review, the level `N(ρ̄)` in odd characteristic, is now cited from §2.13 with §3.7 by SerreModularityByCompatibleSystems: owner this roadmap. The scalar non-dihedral dyadic completion and the unconditional theorem: owner SerreModularityByCompatibleSystems S6. Nothing else shared.

Source independence: changed passages only; 3 passages (§2.11, §5.8, §6.10) compared with 3 sources (ribet94, buzzard00, kw2), nothing shared beyond the hypothesis lists the mathematics forces; largest share ribet94, 29 of 102 locators; the change adds, removes and reorders no layer, so the contents were not compared again (independent, as in the previous review). The Gross scan was not read.

Research link: Layers 2–6 are the level and weight optimisation of Ribet (1990, 1994), Edixhoven (1992), Diamond (1995) and Buzzard (2000), and KW II §8 (2009); Khare–Wintenberger use it to pass from modularity to Serre's refined conjecture, and SerreModularityByCompatibleSystems S6 consumes it. Rests on the README and on kw2 §8.

## Not verifiable

- Nothing in the changed passages. The three items of the previous review (Gross 1990, Propositions 12.8–12.9; Diamond 1995, Lemma 2.2 and Theorem 1.1; Kisin's standing assumption at the start of his §3.1) are in untouched text and stand as recorded there.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` line 1734 links Gross's Duke article as a scan of the published paper on a third party's seminar page (`math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf`), neither the publisher's nor the author's; its status as a legal copy was not settled, and it carries 7 locators.
