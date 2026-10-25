# GATE-EllipticLegendreCharacterInterfaces~5: answers to human review

Review: CBirkbeck, 2026-10-25T22:50:11Z, on head 2b50d7a. Its one blocking finding makes two points, one per remaining consumer (H01–H02). The "Earlier resolutions" section makes five more (H03–H07). The Frey item, the confirmations of ClassicalArithmeticCompletion §1.51, NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g and EllipticCurveModularityPartII §5.1, and the "Checks found sound" list ask for nothing.

Nothing changed and no commit was made; the head is still 2b50d7a9. The review itself places the remaining repair in the consumers' folders and asks for no reverse dependency. This job may edit only this roadmap's folder.

## H01 (CBirkbeck) — answered

ComputationalNumberTheory §3.17 is unchanged at 37b9f6f (its README lines 1681–1695). It still states and proves W.pointCount = q+1+Σχ(f(x)), and the trace, for every normal form over every odd finite field, singular equations included. Its *Needs* (line 1688) lists only Tau Ceti and Mathlib, and the file cites this roadmap nowhere.

This README already gives the split the review asks for:
- line 13: §5.1 owns the identity, and ComputationalNumberTheory §3.17 keeps only its finite-enumeration form and its computational applications;
- line 640: the consumer statement.

ComputationalNumberTheory is line 155 of `ORDER.txt` and this roadmap is line 105, so citing §5.1 there is a forward edge. The fix is in that roadmap: replace its proof with a citation of "EllipticLegendreCharacterInterfaces §5.1", and keep the filtered-set bullet and the Checks.

## H02 (CBirkbeck) — answered

ErdosProgressionPowers is unchanged at e007747:
- Required interfaces, lines 490–491: LG.0's normalization is "over ℚ" and §2.1 "retains its extension".
- Line 496: LG.3's subgroup is stated for p≡3 mod 4.
- §2.1, lines 1056–1062: the extension to every field of characteristic ≠ 2, with the scalars D, Dλ, −D, D(λ−1), D(1−λ), −Dλ.
- §2.1, lines 1081–1088: the extension to every odd finite field.

Each item has a target here at its full generality:
- §0.9 `exists_scaledLegendre_of_full_two_torsion`: every field with 2≠0.
- §3.1 `legendre_two_by_four_subgroup`: every finite field with 2≠0, with no congruence condition.
- §0.2: the change with scaling u⁻¹ sends L(d,λ) to L(u²d,λ) by (x,y)↦(u²x,u³y).
- §0.8: the same six scalars in the same order.

That roadmap also cites "LG.0–LG.5" (lines 486 and 530). This README uses no LG labels, so its edit should cite §§0.2, 0.8, 0.9 and 3.1 by number. Erdős is line 265 of `ORDER.txt`, so this is again a forward edge. Nothing changes here.

## H03 (CBirkbeck) — answered

MordellLawrenceVenkatesh at 513c822 now imports §§0.1 and 0.4:
- supplier lines 82–83 and 411–414;
- §6.4 (heading at line 2089), lines 2091–2095;
- its *Needs*, line 2106.

Its §6.4 Check values (lines 2110 and 2112) agree with §0.4, recomputed from the full b-invariants:
- λ=4 gives j=35152/9;
- λ=−2 gives j=21952/9;
- λ=2 gives j=1728.

README lines 13 and 640 already describe this split, so nothing changes.

## H04 (CBirkbeck) — answered

ArithmeticDynamics has advanced to b87d2d4 and now cites §§0.1 and 0.4 directly:
- the scope bullet at its line 13;
- the supplier contract "From TauCetiRoadmap.EllipticLegendreCharacterInterfaces — §§0.1, 0.4" at line 172;
- §6.35's *Needs* at line 9104.

Its b-invariants at line 9102 are (−4(1+t), 2t, 0, −t²). At t=4 they give (−20, 8, 0, −16), matching the recomputation.

Erdős still takes the ordinary model through MordellLawrenceVenkatesh §6.4 (lines 490 and 1037). That section now forwards to §0.1, and a direct citation belongs in the H02 edit. Nothing changes here.

## H05 (CBirkbeck) — answered

The direction check covers the transitive chain. `gate --depcheck … --movable` printed `depcheck: 55 roadmaps, 635 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

Every named supplier is on main at 27c3e7d (EllipticCurves, ModularCurves, ClassicalArithmeticCompletion) or earlier in `ORDER.txt`:
- ArithmeticGaloisRepresentations: line 47;
- NeronModelsAndSemistableAbelianVarieties: line 55;
- ClassicalArithmeticCompletion: line 104 (also on main);
- this roadmap: line 105.

`roadmaps resolve` finds no unresolved citation or Lean name.

## H06 (CBirkbeck) — answered

The BS20 line numbers refer to the line-numbered extraction of the publisher PDF listed under References. Its page header at line 461 prints "366" for extraction page 12, so extraction page N is journal p.354+N. Pages 13, 14, 16, 17 and 18 begin at lines 501, 540, 650, 686 and 728. So:
- lines 513 and 526 are on p.367;
- lines 544–568 are on p.368;
- lines 655–672 are on p.370;
- lines 703–727 are on p.371.

These are the published locators the review confirmed: (17) p.367, Lemma 6.2 pp.367–368, Lemma 6.3 p.368, Lemma 6.5 p.370 and Lemma 6.6 p.371. Silverman §X.1 Prop. 1.4 and Koblitz p.41 stay marked uncertified (README lines 649–650).

## H07 (CBirkbeck) — answered

I reran `lake build TauCetiRoadmap.EllipticLegendreCharacterInterfaces.Suggested` at 2b50d7a: "Build completed successfully (8995 jobs)". The only warnings are the seven `declaration uses 'sorry'` lines, at Suggested.lean lines 34, 45, 58, 70, 79, 89 and 97.

## Build

`lake build TauCetiRoadmap.EllipticLegendreCharacterInterfaces.Suggested`: Build completed successfully (8995 jobs). The only warnings are the seven `declaration uses 'sorry'` lines (Suggested.lean lines 34, 45, 58, 70, 79, 89, 97).

## Gate

No change and no commit. I ran the gate against origin/main at 27c3e7d:

    gate EllipticLegendreCharacterInterfaces: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK

Direction check (`gate --depcheck … --movable`):

    depcheck: 55 roadmaps, 635 edges, 0 problem(s)

## Signatures

`Suggested.lean` is unchanged since the job's signature file was elaborated, so I did not elaborate a new `#check @name` file. I compared all 9 elaborated types with their README statements, and none lost or changed a binder:
- `legendre` and `scaledLegendre`: `CommRing`.
- §0.9: Field, `DecidableEq`, 2≠0, `IsElliptic`, and a kernel of cardinality 4.
- §1.2: p≠2, and good reduction of the minimal model over ℤ_p.
- §2.8: d≠0 and λ≠0,1.
- §3.1: `Finite F`, 2≠0, η≠0 and η²≠1.
- §3.7: q≡5 mod 8.
- §5.1: q≡3 mod 4, for every a.
- §5.2: 2≠0, normal form, and every d.

## Adversarial pass

No statement was added or changed. The rows below recompute, on instances not used in earlier rounds, the statements the review asks the consumers to import.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.1 count = q+1+Σχ(f(x)) (H01) | Every normal form over 𝔽₁₃ (2197 equations). 302 each over 𝔽₁₇, 𝔽₂₇, 𝔽₄₉ and 𝔽₁₂₁, including y²=x³ and y²=x³+x². Control: y²=x³+1 over 𝔽₂ | 0 failures. Over 𝔽₁₃, y²=x³+x+1 has count 18 and trace −4, and minus the character sum is −4. Over 𝔽₂: count 3, formula 4 | Holds, singular equations included. Odd characteristic is necessary | none |
| §5.2 twist trace (H01, via §5.1) | Every (a₂,a₄,a₆,d) over 𝔽₁₁ (14641 cases) and 𝔽₉ (6561 cases) | The twisting discriminant of (0,−d/4) is d every time. trace(twist) = χ(d)·trace(W) with 0 failures, d=0 and singular W included | Holds | none |
| §3.1 ℤ/2×ℤ/4 in L(η²)(F) (H02) | Every η≠0 with η²≠1 over 𝔽₁₇, 𝔽₁₉, 𝔽₂₃, 𝔽₂₇, 𝔽₄₉, 𝔽₁₂₁ | 14, 16, 20, 24, 46, 118 admissible η. Each has three nonzero 2-torsion points, a point of order 4 and 8∣count | Holds for q≡1 and q≡3 mod 4, prime and non-prime fields, characteristic 3 included | none |
| §0.9 full two-torsion ⇒ C•E = L(d,λ) (H02) | 1500 random general models (a₁,…,a₆) over each of 𝔽₁₁, 𝔽₁₃, 𝔽₂₅, 𝔽₂₇ | 180, 211, 234 and 232 elliptic models have exactly four points killed by 2. After completing the square and translating, every one is x(x−d)(x−dλ) with d≠0 and λ≠0,1 | Holds, characteristic 3 included | none |
| §0.8 ordering scalars (H02) | Roots (−2,1/3,5) and (4,−7,1/2) over ℚ | (−2,1/3,5): d′ = 7/3, 7, −7/3, 14/3, −14/3, −7, with λ′ = 3, 1/3, −2, −1/2, 3/2, 2/3. (4,−7,1/2): d′ = −11, −7/2, 11, 15/2, −15/2, 7/2. In all 12 cases the translated roots are (0,d′,d′λ′) | Holds | none |
| §0.2 square scaling (H02) | (d,λ,u) = (−2,7/3,3/2) and (5,−1/4,−3) over ℚ | (a₂,a₄) = (15,189/4) and (−135/4,−2025/4), equal to L(u²d,λ) in both cases | Holds | none |
| §0.4 Δ, c₄, j (H03, H04) | λ = 4, −2, 7/2, −5/3 over ℚ, from the full b-invariant formulas. Degenerate λ = 0, 1 | (Δ,c₄) = (2304,208), (576,112), (1225,156), (25600/81,784/9), each equal to 16λ²(1−λ)² and 16(λ²−λ+1). j = 35152/9, 21952/9, 3796416/1225, 470596/225, each equal to the formula. At λ=0, 1: Δ=0, c₄=16, no j | Holds. The λ=4 and −2 values are those of MordellLawrenceVenkatesh §6.4's Check | none |

## Ownership and citations

I checked ownership and citations at these copies:
- ComputationalNumberTheory and ErdosProgressionPowers: their sibling checkouts at 37b9f6f and e007747.
- MordellLawrenceVenkatesh (513c822) and ArithmeticDynamics (b87d2d4): through the roadmap index.
- Pinned Tau Ceti a91d3aaf, under `TauCeti/AlgebraicGeometry/EllipticCurve`:
  - `PointCount.lean` and `SingularPointCount.lean` have no character-sum count.
  - `QuadraticTwist/Basic.lean` uses no finite-field `quadraticChar` and has no trace statement.
  - No file mentions ZMod 2 × ZMod 4 or `legendre`.
  - So §§3.1, 5.1 and 5.2 duplicate nothing at the pin.

No statement was added, so no notion moved down. `roadmaps resolve` reports no unresolved citation or Lean name against main 27c3e7d and the open heads.

## Sources

No new source was cited or fetched, and `needs-references.toml` was not created. The review contains no instruction-like text. Its suggested fixes are edits to two other roadmaps' folders, which this job does not touch.
