# GATE-EllipticLegendreCharacterInterfaces~2: answers to human review

Review: CBirkbeck, 2026-10-25T19:21:30Z, on head 3184462. The review makes six distinct points. Four of them (H01–H04) are the per-neighbour rows of its single blocking finding; H05 is its note on timeless wording; H06 is its note on source certification. It also says the Frey point is resolved and lists checks found sound; neither of those needs a reply.

Merge order (the board's `merge-order/ORDER.txt`): EllipticLegendreCharacterInterfaces is at position 105. The four neighbours come later: ComputationalNumberTheory at 154, MordellLawrenceVenkatesh at 173, ErdosProgressionPowers at 263 and ArithmeticDynamics at 268. They are all consumers of this roadmap, so the single direction of supply leaves the contested generic material here, and the reciprocal edits belong in those four roadmaps' own folders. This pull request may not edit those folders.

## H01 (CBirkbeck) — answered

Confirmed at MordellLawrenceVenkatesh head 73dc3e8: `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md` §6.4 still says the coefficient model "is to be defined" over every commutative ring (line 2086), lists that model, Δ and j as its own bullets (lines 2094–2096), and its `*Needs:*` line (2104) does not cite this roadmap. MordellLawrenceVenkatesh sits later in the merge order (173 against 105), so §§0.1 and 0.4 here own the model and invariants and §6.4 consumes them; this README states that allocation at line 13 and line 638. The matching edit is MordellLawrenceVenkatesh's: its three bullets become imports with `*Needs:*` "EllipticLegendreCharacterInterfaces §§0.1, 0.4", and it keeps the cyclic family and good-model statements. No text in this folder can make that change.

## H02 (CBirkbeck) — answered

Confirmed at ComputationalNumberTheory head 37b9f6f: `TauCetiRoadmap/ComputationalNumberTheory/README.md` §3.17 (lines 1681–1696) states the general count `q + 1 + Σ χ(f(x))` and the trace for every normal form over every odd finite field, singular ones included, with its own proof and without citing this roadmap. ComputationalNumberTheory comes later in the order (154), so §5.1 here owns the identity. The matching edit is in ComputationalNumberTheory: §3.17 cites "EllipticLegendreCharacterInterfaces §5.1" for the identity and keeps only its finite-enumeration bullet. I recomputed the exported identity (table below), so the import is sound.

## H03 (CBirkbeck) — answered

Confirmed at ErdosProgressionPowers head e007747:
- Scope (lines 61–69) and the supplier contract (lines 359–365) still take the ordinary model from MordellLawrenceVenkatesh §6.4.
- "Required Legendre-character interfaces" calls our normalization "over ℚ" (line 491) and our subgroup theorem prime-field and p≡3 mod 4 (line 495).
- §2.1 undertakes both extensions itself (line 1056: every field of characteristic ≠ 2; line 1081: every odd finite field).

This README already states those generalities in §0.9 (`exists_scaledLegendre_of_full_two_torsion`, every field with 2≠0) and §3.1 (`legendre_two_by_four_subgroup`, every finite field with 2≠0). Every item in the Erdős contract's LG.0–LG.5 list has a target here: LG.0 → §§0.1–0.3, 0.8–0.10; LG.1 → §§1.2, 1.4, 1.5; LG.2 → §§2.1–2.8; LG.3 → §§3.1, 3.2, 3.6, 3.7; LG.4 → §4.1; LG.5 → §§5.1, 5.2. So the Erdős-side change is a re-citation by section: replace `gap:legendre-character-interfaces` and the LG labels, drop the two §2.1 extension paragraphs, and redirect the ordinary-model supplier here. It needs no new target in this roadmap.

Searching this README for the same kind of defect turned up one wrong allocation, now fixed at README line 13. The old text read "ErdosProgressionPowers Layer 2 owns all progression-specific uses, character nontriviality and character-sum inequalities". The new text reads "ErdosProgressionPowers Layer 2 owns all progression-specific uses and character nontriviality, and its Layers 2–3 own the character-sum inequalities". The reason: the half-interval lower bound is Erdős §2.7 (line 1209), but the smooth-modulus character-sum bound is Erdős §3.1 (line 1267).

## H04 (CBirkbeck) — answered

Confirmed at ArithmeticDynamics head d7b0a19: lines 13 and 172–174 import the coefficient model, Δ and j from MordellLawrenceVenkatesh §6.4, and §6.35 (line 9096) restates them as the specialization behind its Lattès map. ArithmeticDynamics (268) may cite §§0.1 and 0.4 here directly, or keep MordellLawrenceVenkatesh §6.4 as a forwarding contract once that section imports them; both are forward edges. This README's line 638 already lists §§6.35 and 6.111 as consumers of §§0.1 and 0.4, and line 13 leaves the Lattès and torsion-image targets (§§6.35, 6.111–6.112) with ArithmeticDynamics. No change is needed here.

## H05 (CBirkbeck) — answered

The ownership text in this README is already in the permanent form the comment asks for. Scope (line 13) and Downstream consumers (line 638) state allocations by section, with no coordination, merge-condition or migration text. A search of the README for process vocabulary ("currently", "so far", "removed", "pending", "blocked", "deferred", "optional", "round", "review") finds nothing.

## H06 (CBirkbeck) — answered

The BS20 line numbers refer to the publisher version (Annals of Mathematics 191 (2020), the annals.math.princeton.edu PDF named in References). Each cited line was rechecked against that text:
- line 464: page 41 of Koblitz, a_p = 0 for p≡3 mod 4;
- line 513: equation (17);
- lines 526–546: Lemma 6.2, with the six λ-invariants at 544–545;
- lines 547–557: Lemma 6.3, with the halving test at 554;
- lines 568–569: the Lemma 6.4 good-reduction step;
- lines 658–662: the descent map, its kernel and the product relation;
- lines 663–672: Lemma 6.5;
- lines 703–705: F′_λ;
- lines 710 and 715: the root images;
- line 718: the printed order-four point.

Silverman §X.1, Proposition 1.4 and Koblitz p.41 stay uncertified (paywalled) and are cited by locator only, as References says.

## Build

`lake build TauCetiRoadmap.EllipticLegendreCharacterInterfaces.Suggested`: Build completed successfully (8995 jobs). The only warnings are the seven `declaration uses 'sorry'` lines, at Suggested.lean lines 34, 45, 58, 70, 79, 89 and 97.

## Gate

Before committing, the gate reported only `dirty=1` (the uncommitted README). After commit 31151835 ("EllipticLegendreCharacterInterfaces: review repairs (ErdosProgressionPowers ownership: character-sum inequalities in its Layers 2–3)"):

    gate EllipticLegendreCharacterInterfaces: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK

Direction check (`gate --depcheck … --movable`):

    depcheck: 55 roadmaps, 633 edges, 0 problem(s)

The output has no UPWARD, CYCLE or `moved:` line for this roadmap.

## Signatures

`Suggested.lean` is unchanged. I compared each of the 9 elaborated types in the job's signature file (from its `#check @name` scratch file) with its README statement:
- `legendre` and `scaledLegendre`: §§0.1–0.2, over `CommRing`.
- `exists_scaledLegendre_of_full_two_torsion`: §0.9, Field, `DecidableEq`, 2≠0, elliptic, kernel of doubling of cardinality 4.
- `legendre_units_of_good_reduction`: §1.2, p≠2, good reduction of the minimal model over ℤ_p.
- `scaledLegendre_halving_iff_squares`: §2.8.
- `legendre_two_by_four_subgroup`: §3.1, finite field, 2≠0, η≠0, η²≠1.
- `legendre_minus_one_point_count_v_two`: §3.7, q≡5 mod 8.
- `symmetric_cubic_trace_zero`: §5.1, q≡3 mod 4, every a.
- `quadraticTwistOf_frobeniusTrace`: §5.2, 2≠0, normal form, every d.

No binder is missing and none was changed.

## Adversarial pass (the changed sentence and the statements the consumers are asked to import)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| README line 13, Erdős ownership of character-sum inequalities | Erdős §2.7 (line 1209) and §3.1 (line 1267) at e007747 | §2.7: lower bound `|Σ_(k/2<m≤k) χ_a(m)Λ(m)| > 0.1239k`, Layer 2. §3.1: smooth-modulus upper bound, Layer 3 | Old text wrong for §3.1 | Layer 2 → Layers 2–3 |
| §5.1 count `pointCount = q+1+Σχ(f(x))` (to CNT §3.17) | All normal forms over 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₁, 𝔽₁₃, 𝔽₂₉ (27, 125, 343, 1331, 2197, 24389 equations). 243 over 𝔽₉ (a₆∈{0,1,i}). 𝔽₂, y²=x³+1 | Equality in every case over odd fields. 𝔽₂: count 3, formula 4 | Holds. Odd-characteristic hypothesis needed, as in the README Check | none |
| §5.1 symmetric cubic, q≡3 mod 4 | 𝔽₇ all a; 𝔽₂₇ all a; 𝔽₅ a=±1; 𝔽₉ a=−1 | 𝔽₇: every count 8. 𝔽₂₇: every count 28. 𝔽₅: counts 8 and 4 (traces −2, 2). 𝔽₉: count 16 (trace −6) | Holds. The congruence is necessary (𝔽₅, 𝔽₉) | none |
| §5.2 twist trace, every d | All (a₂,a₄,a₆,d) over 𝔽₅ and 𝔽₇, d=0 and singular W included. 𝔽₉ with a₆∈{0,1} | LHS = χ(d)·RHS in every case. 𝔽₉, y²=x³+x+1: count 16, χ(1+i)=−1, twist count 4 (traces −6, 6) | Holds | none |
| §0.4 Δ, c₄, j of L(λ) (to MLV §6.4, AD §6.35) | λ=2, 1/2, −1, 3, 7/5 over ℚ, from the b-invariant formulas | (Δ,c₄) = (64,48), (1,12), (64,48), (576,112), (3136/625, 624/25), each equal to (16λ²(1−λ)², 16(λ²−λ+1)). j = 1728, 1728, 1728, 21952/9 | Holds | none |
| §0.5 scaled invariants | (d,λ) = (2,3), (2,1/2), (−3,5/7) | Δ = 36864, 64, 1166400/2401 = 16d⁶λ²(1−λ)². c₄ = 448, 48, 5616/49 = 16d²(λ²−λ+1) | Holds | none |
| §3.1 ℤ/2×ℤ/4 in L(η²)(F) (to Erdős §2.1) | Every admissible η over 𝔽₅ (2), 𝔽₇ (4), 𝔽₉ (6), 𝔽₁₃ (10), 𝔽₁₇ (14), 𝔽₂₅ (22), 𝔽₂₇ (24). Checked: three nonzero 2-torsion points and a point of order 4 | True in all 82 cases, for q≡1 and 3 mod 4 and for prime and non-prime fields | Holds | none |
| §§3.6–3.7 L(−1), q≡5 mod 8 | 𝔽₅, 𝔽₁₃, 𝔽₂₉, 𝔽₃₇, 𝔽₅₃, 𝔽₁₂₅ (mod X³+X+1). Negative control 𝔽₄₁ | Counts 8, 8, 40, 40, 40, 104, each with v₂=3. 𝔽₁₂₅ point orders {2,4,13,26,52}. 𝔽₄₁: count 32 with a point of order 8 | Holds. The congruence is necessary | none |
| §0.9 full two-torsion (to Erdős §2.1), j=1728, characteristic 3 | y²=x³−x over 𝔽₃ | x³−x=0 for all x∈𝔽₃, so the points are O,(0,0),(1,0),(2,0), all killed by 2; d=1, λ=2, Δ=1 | Holds | none |

## Ownership and citations

I checked ownership against open work by object, at these copies:
- ComputationalNumberTheory, ErdosProgressionPowers and ArithmeticDynamics: the given sibling checkouts, at the heads the review names.
- MordellLawrenceVenkatesh: the brief's roadmap index tool, at head 73dc3e8.
- EllipticCurves and ModularCurves: on main.

EllipticCurves on main has the Frey worked example but no character-sum count and no Legendre model. ModularCurves §4C (the Legendre problem over ℤ[1/2]) and §9E (the Legendre line with its S₃ action) contain what line 11 attributes to them. The citation resolver finds no unresolved cross-roadmap citation or Lean name. No supplier later in the order is cited and no notion moved down this round.

## Sources

No new source was cited and none was fetched. `needs-references.toml` was not created.
