# GATE-EllipticModularityEffectiveComparisons~10: answers to the human review of `4a7a185`

This answers one review: CBirkbeck, 2026-11-09T05:48:16Z. It makes two points, F01 and F02, numbered here H01 and H02.
- Its "Previous findings" section (R01 not repaired, R02–R05 repaired) restates F01 and needs no separate answer.
- Its "Remarks, not findings" (the board's `design/plan.json` gap list, the pull-request description counts, the line-100 wording) concern files outside this job or are marked harmless. Nothing was edited for them.
- The review was read as data. It contains no instruction to the worker beyond its findings, and nothing suspicious was found in it or in the files read.

The repairs are one commit, `b3472ae` ("EllipticModularityEffectiveComparisons: review repairs (§5.25 point-to-curve lift via ModularCurvesPartII §9.7 at j∉{0,1728}; ofJ)"), on top of `4a7a185`. It changes only `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, and it is not pushed. `Suggested.lean` is byte-identical.

## H01 (CBirkbeck) — answered

The finding is correct. This folder plans again what EllipticCurveModularityPartII plans, and that roadmap is earlier in the merge order (`ORDER.txt` line 273, against line 283 here). Under the ownership rule the objects belong to the sibling. The only repairs are to close #1810, or to close #1491 and re-point its consumers. Both act outside this folder, so the choice is a human's. No edit here can make the duplication go away: deleting every target with a sibling counterpart deletes all of Layers 0–5.

Facts rechecked at the current heads:
- **Sibling head `33c1b4d`.** README line 7 reads "this Part II owns the six comparison layers below". The new Lean duplicates are at the cited lines: `NonCM` (line 144) and `HasCyclicIsogeny` (line 152) have the same bodies as `GeometricallyNonCM` and `CyclicIsogenyDegree` here; `noncm_prime_isogeny_degrees` is at line 165 and `rational_isogeny_j_tables` at line 230.
- **Who cites the sibling** (`roadmaps grep --fixed`, line counts): ErdosProgressionPowers 18, FaltingsFinitenessAndIsogenyTheoremsPartII 10, RankOneConverse 8, KatoEulerSystems 7, EllipticCurvePeriodsAndModularParametrizations 6 and AdelicImagesAndModularCurves 2. The last one cites §§5.0a–5.0b at its `Suggested.lean` line 407. KatoEulerSystems and RankOneConverse cite the sibling's §6.0e rank-zero theorem, which this folder does not own: here it is `gap:modular-rank-zero`.
- **Who names this folder.** ModularSymbolsPadicLFunctions (README line 2695) and FaltingsFinitenessAndIsogenyTheorems (line 2928) list it among their consumers. ImaginaryQuadraticClassNumber (line 205, at its #1914 head) lists it as the consumer of H1.1–H1.4, H3.2 and H3.5–H3.6. No roadmap uses it as a supplier.
- **H02 adds no new duplicate object.** It writes out a step that the sibling already records in the docstring of `rational_isogeny_j_tables` (sibling line 228: "No listed value is 0 or 1728").

What each option leaves to do:
- **Close #1810.** Every consumer and the merge order already point at the sibling. The one dangling mention is ImaginaryQuadraticClassNumber's consumer line 205.
- **Close #1491.** Re-point ErdosProgressionPowers, AdelicImagesAndModularCurves, EllipticCurvePeriodsAndModularParametrizations and FaltingsFinitenessAndIsogenyTheoremsPartII to the counterparts listed in this README's Downstream consumers paragraph (line 1706). RankOneConverse and KatoEulerSystems cite the sibling's §6.0e, which has no counterpart here. Then find owners for what only the sibling plans: its §1.8 numerical majorants, its §6.0e rank-zero theorem (requested here as `gap:modular-rank-zero` from EulerSystemsAndKolyvaginSystems), its §6.0f minimal period subvariety, and ErdosProgressionPowers's `FullRationalTwo`.

## H02 (CBirkbeck) — applied

§5.25 now gives both inclusions of `isogeny_j_tables_11_17_37` with their inputs, and the same step from a curve to a point is now cited in §5.1. Changes in `README.md`:
- **Locator, line 1631.** "lemos-2017 lines 191–202" → "lemos-2017 lines 191–202 and 212". Line 212 (p.6) is where the source records that −2¹⁵ is the only CM value.
- **Route, line 1635.** After "Evaluate the actual j-maps …", the route now passes from points to curves using the Borel level subgroup of X₀(r), which contains −I.
  - ⊆: a curve with a rational cyclic r-isogeny has a Galois-stable line (§4.0), so by the first assertion of ModularCurvesPartII §9.7 its j is the j of a rational point of Y₀(r).
  - ⊇: none of the seven values is 0 or 1728, so the converse in §9.7 gives every curve over ℚ with that j a Borel image, hence a Galois-stable line and, by §4.0, a rational cyclic r-isogeny. Mathlib's `WeierstrassCurve.ofJ` supplies one such curve per value.
  - At j=0 or 1728 §9.7 gives no converse, so ⊇ depends on the seven values avoiding 0 and 1728.
- **New `**Checks.**` block, lines 1641–1642.**
  - The lifted curves: [1,1,1,−30,−76], [0,−1,1,−7,10] and [1,1,0,−2,−7] have j = −24729001, −32768 and −121. [1,1,1,−8,6] and [1,1,1,−208083,−36621194] have j = −9317 and −162677523113838677.
  - A negative control for j∉{0,1728}: at r=2, t=−16 is a noncuspidal rational point of X₀(2) with j=(t+16)³/t=0. Yet y²=x³+2, which has j=0, has no rational 2-torsion and so no rational 2-isogeny.
- ***Needs:*, line 1644.** Adds Layer 4.0, "ModularCurvesPartII §9.7 for both directions …, the converse at j∉{0,1728}", and Mathlib `WeierstrassCurve.ofJ` and `WeierstrassCurve.ofJ_j`. §9.7 was already in the ModularCurvesPartII supplier contract (line 78) and in the Layer 5 Dependencies.
- **Mathlib contract, line 40.** Adds `WeierstrassCurve.j` and `WeierstrassCurve.j_eq` (`Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`, lines 388 and 401 at the pin). Adds `WeierstrassCurve.ofJ` and `WeierstrassCurve.ofJ_j` (`Mathlib/AlgebraicGeometry/EllipticCurve/ModelsWithJ.lean`, lines 134 and 183), noting that `ofJ` is one model and says nothing about the other curves with the same j. `WeierstrassCurve.j` is used in `Suggested.lean` and was not listed before.
- **Pattern, §5.1.** Here the ⊇ inclusion comes from CM directly, as the review says. But the CM corollary and the ⊆ inclusion use the step from a curve to a point, and the README did not cite it.
  - Line 1197 now gives that step: kernel line by §4.0, rational point by §9.7's first assertion, equal j forces isomorphism over ℚ̄.
  - The *Needs:* line 1211 adds Layer 4.0 and ModularCurvesPartII §9.7 (first assertion).
- **Other places checked for the same step.** §§4.9, 4.16, 4.17, 5.3b, 5.20–5.23 and 5.26–5.28 either speak only of rational points, or use only the direction from curve to point, which needs no hypothesis on j.
  - §5.23 is an equivalence between j-values and rational points of X₀(r), not curves.
  - §4.17 exports only the necessary degree restriction.

The suggested wording put the ⊇ sentence in the statement paragraph. The repair puts it in the route instead, because it is a proof step; the statement paragraph keeps the theorem and its locator.

## Build, gate and dependency check

- **Build.** `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested` reports "Build completed successfully (9205 jobs)". The only warnings are 17 "declaration uses `sorry`", at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298.
- **Gate** at `b3472ae`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **Dependency check** (`--depcheck … --movable`, board order, content checkout):

      depcheck: 238 roadmaps, 2322 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. The one new edge, ModularCurvesPartII §9.7, goes to line 71 of the order, before this roadmap at 283.
- **`roadmaps resolve`** on the README lists no cross-roadmap citation and no Lean name found nowhere. It did not check names outside TauCetiRoadmap, so the four Mathlib names above were opened at the pin by hand.

## Lean signatures

`Suggested.lean` is unchanged (`git diff` against `4a7a185` is empty for it). The elaborated types in the worker's `signatures.md` are therefore current, and they were compared with the README statements this commit touches:
- `exceptional_prime_isogeny_j`: `(r, γ) ∈ {(19, 96), …} → {j | ∃ E, ∃ (x : E.IsElliptic), CyclicIsogenyDegree E r ∧ E.j = j} = {-↑γ ^ 3}`, as in §5.1.
- `non_cm_prime_isogeny_degrees`: `GeometricallyNonCM E → ∀ r, Nat.Prime r → CyclicIsogenyDegree E r → r ∈ {2, 3, 5, 7, 11, 13, 17, 37}`, as in §5.1.
- `isogeny_j_tables_11_17_37`: three set equalities over all `E : WeierstrassCurve ℚ` with `E.IsElliptic`, as in §5.25.

These match their README statements in generality, and no binder can drop, since the file has no `variable` or `include`. No new `#check` file was elaborated, because the Lean file did not change and the brief allows only the build and gate commands.

## Ownership, citations and sources

- **No new object is introduced**, so nothing new needs an owner. ModularCurvesPartII §9.7 ("Rational points of `X_H` and Galois images", #913 head `07e21ad`) was read at its head. It states the forward assertion for any open H, and the converse for `−I∈H̄`, char K∤n and j(x)∉{0,1728}.
- **No notion moved down**, and no later roadmap is cited. ModularCurvesPartII is a new roadmap earlier in the order, cited as it stands at its head, so it is not an "only an open revision defines" citation. `overlaps.md` lists no open pull request changing this roadmap and no dropped id.
- **Sources.** No new source. The only new locator is lemos-2017 line 212, in the existing manifest key. `needs-references.toml` was not written.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §5.25 ⊇ via §9.7 converse | the seven table values; 0 and 1728 | −24729001, −32768, −121, −297756989/2, −882216989/131072, −162677523113838677, −9317; all negative, so none is 0 or 1728 | converse applies at all seven | route and *Needs:* |
| §5.25 lifted curves | [1,1,1,−30,−76], [0,−1,1,−7,10], [1,1,0,−2,−7], [1,1,1,−8,6], [1,1,1,−208083,−36621194] | c₄³/Δ = −24729001 (Δ=−121), −32768 (Δ=−1331), −121 (Δ=−14641), −9317 (Δ=−6125), −162677523113838677 (Δ=−6125); each equals a table value | consistent with both inclusions | Check added |
| j∉{0,1728} needed for the converse | r=2, t=−16, 8, −64; y²=x³+2; y²=x³+1 | j(−16)=0, j(8)=j(−64)=1728. y²=x³+2 has c₄=0 (j=0), and x³+2 has no rational root (candidates ±1, ±2), so no rational 2-isogeny. y²=x³+1 has (−1,0), so j=0 still occurs | the converse fails at j=0 for some curve; the set equality at r=2 is unaffected | negative-control Check |
| §5.25 ⊆ via §9.7 forward | 121b1 (CM, j=−2¹⁵) | the kernel of √−11 is conjugation-stable, so there is a rational 11-isogeny and j=−32768 ∈ S₁₁; the forward direction needs no hypothesis on j | holds | none |
| §5.1 CM corollary via §9.7 forward | y²+y=x³−38x+90 at r=19 | c₄=1824, Δ=−6859, j=−884736=j(P₁₉); equal j gives a ℚ̄-isomorphism to the CM curve | holds | route and *Needs:* |
| `WeierstrassCurve.ofJ` contract | j=0, 1728, −9317 at the pin | definition branches at `ModelsWithJ.lean` line 134; `ofJ_j` at line 183 for every j in a field; `IsElliptic` instance at line 164 | exists at pin | contract sentence |
| lemos-2017 line 212 | text at p.6 | line 212 records −2¹⁵ as the only CM j-invariant among the seven | locator correct | locator |
| §5.23 (scan for the same step) | r=2, j=0 | equivalence of j∈lemosIntegralJ(2) with a rational point; 0∈lemosIntegralJ(2) at t=−16; no curve is asserted | not affected | none |
| §4.17 (scan) | degree 22 | only the necessary restriction is exported, with no existence claim | not affected | none |
