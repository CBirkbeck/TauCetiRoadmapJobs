<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1098#issuecomment-6394115130 -->
Review (claude) of 1988e25

Verdict: needs changes

1. **F01** (P2) The resolution gap now makes two separate requests

   - **Location.** `README.md` l. 108 and `design/plan.json` `gaps[1]`: "Extend its §§7.5–7.6 marked strong resolution functor from reduced to generically reduced …; for both the reduced and generically reduced functors, provide a common countable ordered set of invariant values for synchronization."
   - **Claim.** This is one supplier gap.
   - **Witness.** The second clause now constrains ResolutionOfSingularitiesCharacteristicZero §7.5 `qeResolution` itself. ⊔ₙ{y² = x^(2n+1)} (reduced, not quasi-compact) needs only countability. Spa(K⟨x,y⟩/(y², xy)) (quasi-compact, non-reduced at the origin) needs only the extension.
   - **Repair.**
     1. Keep `gap:generically-reduced-functorial-resolution` with needs: "Extend its §§7.5–7.6 marked strong resolution functor from reduced to generically reduced noetherian quasi-excellent ℚ-schemes, preserving the entire regular locus and functoriality for all regular maps, with invariant values in a countable ordered set."
     2. Add `gap:countable-resolution-invariants` (supplier ResolutionOfSingularitiesCharacteristicZero, section 7.5–7.6) with needs: "Provide a countable totally ordered set of invariant values labelling the steps of the §§7.5–7.6 reduced resolution functor, compatibly with pullback along regular morphisms after deleting empty steps."
     3. Put both slugs in the README's supplier subsection, in plan `gaps`, and on the §5.3 Needs line.
     4. Test on the two examples above: each now needs exactly one gap.

2. **F02** (P2) §0.2 redefines a dimension that AdicEtaleGeometry A2.6 already defines

   - **Location.** l. 162: "The dimension of X is dim X = supₓ dim_x X." Also l. 174 (API) and Conventions l. 28.
   - **Claim.** The global dimension of a rigid space is defined here.
   - **Witness.** `TauCetiRoadmap/AdicEtaleGeometry/README.md` (main) l. 7403 ff., A2.6 *dimension-of-adic-spaces*, defines dim X as `topologicalKrullDim |X|` for every adic space. It also gives the classical-point local-ring criterion for pure dimension. The package cites no AdicEtaleGeometry section.
   - **Repair.**
     1. Add a `### From TauCetiRoadmap.AdicEtaleGeometry` contract consuming A2.6's dim X and its local-ring criterion.
     2. In §0.2 and l. 28, replace the definition by a comparison target: for X locally of finite type over Spa(K, K°), `topologicalKrullDim |X| = sup_x dim_x X`, and for affinoid X both equal the Krull dimension of O(X).
     3. Keep dim_x X as this roadmap's own notion.
     4. Test: for X = Spa(K × K⟨T⟩) both sides are 1; for X = ∅ both are ⊥ = −∞.
     5. AdicEtaleGeometry is on main, so the order is unchanged.

3. **F03** (P3) Gaps over-declared on two Needs lines and named loosely on two others

   - **Location.** §4.1 Needs (l. 645) and §4.3 Needs (l. 689) both read "AdicSpacesPartIII R2.4–R2.5 and gap:formal-affinoid-localization". §5.3 Needs (l. 843) reads "…and its generically reduced contract". §6.4 Needs (l. 944) reads "…and its smooth-quotient contract".
   - **Claim.** §4.1 and §4.3 need the global formal-localization gap.
   - **Witness.** Both routes use only the affinoid model Spf(A₀) of BH22 lines 243–252, whose generic fibre is Spa(A, A°); surjectivity of specialization is AdicSpacesPartIII R2.4. l. 88 itself places the localization extension in §4.6. The F01 repair introduced this.
   - **Repair.**
     1. Delete "and gap:formal-affinoid-localization" from the §4.1 and §4.3 Needs lines, keeping AdicSpacesPartIII R2.4–R2.5.
     2. Write `gap:generically-reduced-functorial-resolution` and the R01 countability slug on the §5.3 Needs line.
     3. Write `gap:represented-smooth-homogeneous-quotient` on the §6.4 Needs line.

4. **F04** (P3) Layer 4 has two circular dependencies

   - **Location.**
     - §4.2's route (l. 669) uses "§4.3(2) each generic point has exactly one preimage", but its Needs line (l. 671) omits §4.3, and §4.3's Needs (l. 689) lists §4.2.
     - Two §4.4 API bullets (ll. 707–708) rely on §4.6. §4.4's Needs (l. 713) omits §4.6, and §4.6's Needs (l. 745) lists §4.4.
   - **Witness.**
     - §4.3 uses nothing from §4.2: condition (1) is stated directly, and (4) is the Banach Shilov boundary.
     - The "weakly Shilov in U iff in X" bullet needs the Poineau transcendence criterion of §4.6.
   - **Repair.**
     1. Add §4.3 to §4.2's Needs line and delete §4.2 from §4.3's.
     2. Move the two bullets "weakly Shilov in U iff in X" and "weakly Shilov iff trdeg = dim_x X" from §4.4's API to §4.6 as consequences.

5. **F05** (P3) Locators, a section that does not exist, and manifest fields

   - **Location and witness.**
     - **§0.2 (l. 162).**
       - BH22 line 332 (Prop. 2.9(2), p. 8) uses dim_x X without defining it.
       - CONRAD99 line 653 (p. 14) says only that dim O_{X,x} is constant on an irreducible space.
       - Neither states the min-over-affinoids definition or the classical-point comparison.
     - **§1.8 (l. 410).** "CONRAD99 line 786" is the page-17 marker, and lines 786–799 treat Galois descent of connectedness. The connected-complement step is lines 801–805 (Lütkebohmert, algebraically closed base).
     - **§5.4 (l. 852).** "HK2 line 2707": the desingularization sentence is line 2708.
     - **Layer 0 Dependencies (l. 249).** It cites "RigidAnalyticGeometry §§… 3.1–4.2". That roadmap has no §§3.1–4.2, only one section "Layers 3–4" (`TauCetiRoadmap/RigidAnalyticGeometry/README.md` l. 398).
     - **`sources.toml`.**
       - HK2 `cited_for` omits Layers 1, 2 and 4 (§§1.6, 2.3–2.5, 4.7), and its `locator` omits §5.0 (Example 5.0.5, p. 32).
       - BH22 `cited_for` omits Layer 3 (§3.4).
     - **README References (ll. 995–1002).** HK2's page list omits p. 32, BH22's omits p. 13 (§0.4), and POINEAU13's omits p. 271 (§4.5).
   - **Repair.**
     1. §0.2: state the definition as the roadmap's own convention, cite BH22 line 332 as where it is used, and move CONRAD99 line 653 to §1.4's irreducible-dimension bullet.
     2. §1.8: write "CONRAD99 lines 801–805, proof of Theorem 2.3.1, p. 17".
     3. §5.4: write "HK2 line 2708".
     4. Layer 0 Dependencies: write "RigidAnalyticGeometry Layers 3–4".
     5. Extend the manifest fields and the reference page lists as listed. No manifest entry is removed.

6. **F06** (P3) The Summary and the Suggested.lean docstring list different headlines

   - **Location.** `Suggested.lean` ll. 10–19 and README l. 3.
   - **Claim.** The docstring names every headline that is not statable, and the Summary names the end theorems.
   - **Witness.** The docstring names neither the Summary's "connectedness of the resolution of an irreducible space" (§5.4) nor the G(C) form of §6.5. Conversely, it states Gauss-point closure (§3.4) as a headline, which the Summary omits.
   - **Repair.**
     1. Add to the docstring: "Connectedness of the resolution of an irreducible space and the group form of subfield detection on G(C) are not statable: they need the rigid-space and rational-point-manifold carriers."
     2. Add Gauss-point closure of rational polydisc points to the Summary's end theorems. It is a terminal target that HK2 Lemma 9.3.5 consumes.

7. **F07** (P3) A §6.2 Check omits the radius bound

   - **Location.** l. 905: "For V = G_m^an and x = 1, the discs {|T − 1| ≤ |c|} are neighbourhoods isomorphic to closed discs".
   - **Witness.** For |c| = 1 the disc contains T = 0, which is not in G_m^an.
   - **Repair.** Write "for 0 < |c| < 1". Test: |c| = 1/p gives |T| = 1 on the disc, which then lies in G_m^an.

Scope: `packages/AdicSpacesPartV/README.md` (1003 lines), `Suggested.lean` (102 lines), `metadata.toml`, `sources.toml`, and `design/plan.json` (gaps only). I read them against the content repository at main, the open roadmap pull requests through the roadmaps tool (352 heads), the board packages, `merge-order/ORDER.txt`, and the pinned Mathlib and Tau Ceti of the content `lake-manifest.json`. The previous review and its repair report were read first. All fifteen previous findings are repaired or settled. The repairs introduced two new defects (R01, R03). The fresh pass adds one blocking duplication (R02) and four non-blocking notes.

## Previous findings

| Id | Status | Repaired passage (README line unless stated) |
|---|---|---|
| F01 (P1) | repaired | l. 82 opens a `### From TauCetiRoadmap.AdicSpacesPartIII` subsection. l. 86 reads "What AdicSpacesPartIII must provide (gap:formal-affinoid-localization): For every quasi-separated quasi-paracompact rigid K-space X and every affinoid open W = Spa(R, R°) ⊆ X …". plan.json `gaps[0]` has the same supplier and text. l. 14 now says "below". The repair over-declares the gap on two Needs lines (R03). |
| F02 (P2) | repaired | l. 15 reads "Its §§0.3, 4.11 own relative Proj and modifications; StableReduction Layer 4 owns scheme blow-ups". A StableReduction contract is added (l. 100). No "R1.3", "R1.8" or "§0.15" remains (grep). l. 797 and l. 944 cite "AdicSpacesPartII R1.2–R1.6". |
| F03 (P2) | repaired | l. 979 reads "Its D6.9 constructs the analytification of the algebraic affinoid resolution supplied by ResolutionOfSingularitiesCharacteristicZero §7.8; that analytic resolution is the affinoid case of §§5.3–5.4". The diamond Checks are gone. Scope l. 15 assigns global rigid resolution here. Checked against DiamondsAndVStacks D6.9 at its head. |
| F04 (P2) | repaired | l. 122 and plan `gaps[2]` read "…the quotient morphism G → G/H is smooth and surjective." This is a single ask. The orbit map is now derived in §6.4 (l. 942). |
| F05 (P2) | repaired | l. 584 reads "For G = G_a, the only rigid analytic point of the B_dR⁺ affine Grassmannian Gr_G is 0 (HK2 line 1458, Example 5.0.5, p. 32)". This matches HK2 lines 1458–1464 (p. 32). |
| F06 (P3) | repaired | l. 223 reads "The domain case is proved here from excellence and completion comparison; CONRAD99 line 409 … supplies flatness". The smooth case goes through formal smoothness and André localisation (TEMKIN12 line 734), with no separability assumption. Lemma 1.1.5 is at line 274. |
| F07 (P3) | repaired | §0.4 cites HK2 lines 722–727 (p. 16). §4.5 cites POINEAU13 lines 182–184 (p. 271). §1.3 cites CONRAD99 lines 528–548. §1.1 cites line 435. §5.1 cites CONRAD06 lines 1937–1960 (pp. 1096–1097). All were verified in the texts. |
| F08 (P3) | repaired | ll. 59, 593 and 607 cite `classicalPoint_injective_of_isField`, `IsRestricted.gaussNorm_mul` and `restrictedMvPowerSeriesGaussEquiv`. l. 44 cites `Manifold.IsSubmersionAt`/`IsImmersionAt`. Each exists at the pin (see Verified sound). |
| F09 (P3) | repaired | l. 599 reads "If L̃ is infinite and n ≥ 1, D(L) is not closed … Over ℚ_p, D(ℚ_p) = ℤ_p is closed". It gives explicit separating neighbourhoods, recomputed below. |
| F10 (P3) | repaired | l. 922 reads "X(F) carries the analytic manifold structure transported from (X^an)(F) through the canonical bijection". l. 981 lists ReductiveGroupsPartII RG2.0.2, AbelianSchemesAndArithmeticModuliPartII B2.10 and LieGroupoidsPoisson G0.1, each checked at its head. |
| F11 (P3) | repaired | Scope l. 18 says "Finite-extension point classes". The diamond sentence is gone from the `Suggested.lean` docstring. |
| F12 (P3) | not actionable, settled | The finding itself left the title to the maintainer's naming decision, so the reason holds. Not re-raised. The naming note below covers the collision. |
| F13 (P3) | repaired | No near-duplicate bullets remain: a pairwise similarity scan found only distinct statements. l. 652 is now prose. Every definition keeps ≥ 3 Checks (counts below). |
| F14 (P3) | repaired | l. 67 reads "Under algebraic analytification, closed points and irreducible components agree with their analytic counterparts, and reducedness and normality are preserved and reflected." Normalization and X(L) are no longer credited to the supplier. |
| F15 (P3) | repaired, new defect | l. 106 now routes countability to the gap. The amended gap sentence (l. 108) is now compound (R01). |

## Verified sound

**Elaboration.**
- `lake env lean` on `packages/AdicSpacesPartV/Suggested.lean`, run from the content checkout, exits 0 in about 4 s. Its only diagnostics are three "declaration uses `sorry`" warnings (ll. 45, 62, 94). No `TauCeti.*` object file was missing.
- Form: one `import Mathlib` plus one used Tau Ceti module; no `set_option`, `lemma`, sorry'd data, `#eval` or `True`. `IsUnitGaussPoint` has a real body. Every declaration has a docstring. Layer section comments are present.

**Binder check.**
- `#check @` was run on all four declarations in one scratch file. The elaborated types match README §§3.4, 6.1 and 6.5.
- There is no `variable` block, so no binder was lost. Nothing changed.

**One-tactic probes.** These were run on scratch copies of the three theorems, elaborated as above. `simp`, `rfl`, `infer_instance`, `aesop`, `fun_prop`, `tauto` and `exact?` all fail on all three. There is no padding.

**Headlines.**
- Stated: constant rank (§6.1), subfield detection (§6.5, germ form) and Gauss closure (§3.4).
- Not statable: resolution (§5.3), connectedness of the resolution (§5.4) and the rational-point manifold (§6.3).
  - Tau Ceti has `AdicSpace` (`TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean` l. 243).
  - It has no finite-type, rigid or smooth adic-morphism carrier, so the docstring's claim is correct, apart from R06.
- No statable headline is absent.

**Dependency check.**

    moved: AdicSpacesPartV moved in the merge order from #9 to #10, right after its last supplier AdicSpacesPartIII; checked as moved (the worker moves it there when it submits)
    depcheck: 48 roadmaps, 541 edges, 0 problem(s)

There are no UPWARD or CYCLE lines. `roadmaps resolve` reports no citations or Lean names found nowhere.

**Naming and duplication against AdicSpacesPartIII and AdicSpacesPartIV.**
- The package extends AdicSpacesPartII R0–R1: affinoid geometry, morphisms, analytification and the identity principle.
- It consumes AdicSpacesPartIII R2.2–R2.5 (formal models) and R3.1–R3.3 and R3.6 (coherent sheaves and Kiehl).
  - It does not rebuild them. R3.3 *coherent-ideal-closed-subspace* gives the ideal ↔ closed-subspace bijection, and §0.1 adds only radicals and the Zariski topology.
- AdicSpacesPartIII covers formal geometry, formal models and coherent sheaves. Its blow-ups are admissible formal ones only.
- AdicSpacesPartIV covers étale sites, families and dagger geometry.
  - It assumes embedded resolution (RES) as a hypothesis (`TauCetiRoadmap/AdicSpacesPartIV/README.md` l. 5611). This package excludes embedded resolution and proves the non-embedded case.
- No duplication of either, so no P1 for the maintainer. The folder name remains the settled F12 naming question.

**Supplier citations resolved at main.**
- AdicSpacesPartII R0.6–R0.17, R1.1–R1.9 (R1.9 at l. 10509 and its component comparison at l. 10692).
- AdicSpacesPartIII R2.2–R2.5 (l. 4356–5714) and R3.1–R3.6 (l. 9136–10472).
- RigidAnalyticGeometry §§1.1–1.3, 2.1–2.3, Layers 3–4 (l. 398; includes reduced restriction and local-ring excellence), §6.2, §§7.3–7.4, §§8.1–8.3 (l. 690–738).
- SchemeAndStackFoundations §0.3 (l. 551), §0.21 (l. 1394), §4.11 (l. 5528).
- StableReduction Layer 4 (l. 468: Rees algebra, universal property, properness, flat base change).
- ReductiveGroups Layer 3 (l. 234: fppf quotient; no smoothness of G → G/H, so that gap is minimal).

**Citations resolved at open heads.**
- ResolutionOfSingularitiesCharacteristicZero §§7.1, 7.5, 7.6, 7.8 (reduced only; `resolution_affinoid` is algebraic).
- DiamondsAndVStacks D6.4, D6.5 and D6.9.
- ReductiveGroupsPartII RG2.0.2.
- AbelianSchemesAndArithmeticModuliPartII B2.10.
- LieGroupoidsPoisson G0.1.
- AdmissiblePairsAndPadicHodgeStructures exists as a board package and cites this roadmap's targets.

**Gaps.**
- `formal-affinoid-localization` is precise, statable by AdicSpacesPartIII and not already provided there. R2.5's realization is quasi-compact only, and there is no reduction homeomorphism.
- `represented-smooth-homogeneous-quotient` is single, precise and minimal.
- `generically-reduced-functorial-resolution`: see R01.
- README and plan texts agree verbatim (scripted comparison).

**Ownership against open work.**
- Searched with the roadmaps tool and by grepping board packages: weakly Shilov, Shilov, Riemann extension, rigid normalization, rigid components, rigid blow-ups, rigid resolution, constant rank, Gauss point, rational-point manifolds.
- No earlier roadmap owns these objects. The overlaps are all later in the order:
  - AbelianSchemesAndArithmeticModuliPartII B2.10 (real-analytic constant rank, #134).
  - ReductiveGroupsPartII RG2.0.2 (#25).
  - TropicalAndBerkovichArithmetic (Shilov points from canonical reduction, #205).
  - ClassicalAdicEtaleCohomology (#65) and PadicFamilies (#193), which use Conrad's components.
- This roadmap (#10) is the owner. TropicalAndBerkovichArithmetic could be added under Downstream consumers (optional, not a finding).

**Library declarations opened at the pins.**
- Tau Ceti:
  - `classicalPoint_injective_of_isField`, `classicalPoint_vle`, `classicalPoint`, `closedPolydisc` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean` ll. 182, 156, 147, 72).
  - `MvPowerSeries.IsRestricted.gaussNorm_mul` (`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean` l. 241; `NormMulClass`, positive radii).
  - `TauCeti.Huber.restrictedMvPowerSeriesGaussEquiv` (`TauCeti/RingTheory/Huber/Restricted/GaussNorm.lean` l. 80; it preserves the underlying series, l. 87).
  - `gaussPoint` (`.../Polydisc/GaussPoint.lean` l. 236; one variable only).
  - `powerBoundedSubring`, `topologicallyNilpotentIdeal`, `IsPowerBounded` (`TauCeti/RingTheory/Huber/PowerBounded.lean` ll. 433, 494, 117).
  - `weightedRestrictedSubring` (`.../WeightedRestrictedSeries/Basic.lean` l. 709).
  - `spa` (`.../Spa/Basic.lean` l. 101).
- Mathlib:
  - `Manifold.IsSubmersionAt` (`Mathlib/Geometry/Manifold/Submersion.lean` l. 171; namespace `Manifold` from l. 96). The rank criterion is only a TODO there (ll. 63–80).
  - `Manifold.IsImmersionAt` (`Immersion.lean` l. 190).
  - No constant-rank theorem exists at the pin (grep).

**Check counts per definition (all ≥ 3).** §0.1: 4, §0.2: 5, §1.1: 5, §1.3: 5, §1.4: 6, §2.1: 5, §2.3: 5, §3.1: 4, §4.1: 5, §4.2: 5, §4.4: 4, §5.1: 4, §5.2: 5, §6.3: 5. The imported-contract Check blocks have 3, 4, 3 and 3.

### Sample locators (15 seeded targets)

| Target | Locator | Result |
|---|---|---|
| 0.2 | BH22 l. 329/332 (Prop 2.9(2), p. 8); CONRAD99 l. 653 (p. 14) | do not state the definition (R05) |
| 0.3 | CONRAD99 l. 451–458 (§2.1, p. 10); BH22 l. 346–349 (Cor 2.10, p. 8) | supports (a), (c), (d) and the use of (e) |
| 1.2 | CONRAD99 l. 459–494 (Thm 2.1.2, pp. 10–11) | supports, including the cokernel support |
| 1.4 | CONRAD99 l. 599, 639, 673, 734, 747 (pp. 13–16); CONRAD10 l. 189 (Lemma 2.1.3, pp. 4–5) | supports |
| 1.8 | CONRAD10 l. 211 (p. 5) supports the normal case; CONRAD99 l. 786 | off by 15 lines (R05) |
| 2.4 | HK2 l. 2581–2582 (p. 57) | supports (finite smooth stratification) |
| 2.5 | HK2 l. 2590–2591 (p. 57) | supports |
| 3.1 | HK2 l. 691–694 (Def 2.2.1(1), p. 15) | supports |
| 3.2 | HK2 l. 699–705 (Rem 2.2.2, p. 15) | supports |
| 3.4 | HK2 l. 2730–2735 (p. 60); BH22 l. 228 (Ex 2.1, p. 6) | the source needs an algebraically closed residue field; the README's route needs only an infinite one (correct) |
| 4.2 | BH22 l. 235–294, 310 (Prop 2.2, Def 2.4, pp. 6–7) | supports; at most one preimage per generic point via (1)⇒(2) |
| 4.4 | BH22 l. 314–327 (Def 2.5, Ex 2.6, Lemma 2.8, pp. 7–8) | supports, with no quasi-separatedness |
| 4.6 | BH22 l. 329–345; POINEAU13 l. 705 (Lemme 4.4, p. 284), 857 (Cor 4.15, p. 287), 893 (Cor 4.18, p. 288) | supports; Cor 4.18 needs a unique strict component through x, which the route proves |
| 4.7 | BH22 l. 346 (Cor 2.10); HK2 l. 2710–2718 (Lemma 9.3.5, p. 60) | supports |
| 5.4 | TEMKIN12 l. 1563–1575 (Thm 5.3.2, p. 34); HK2 l. 1598 (p. 35), l. 2708 (p. 60) | supports; 2707 should be 2708 (R05) |

Also verified for the repaired passages:
- CONRAD99 l. 274 (Lemma 1.1.5, p. 6) and l. 409–417 (flatness only, p. 9).
- TEMKIN12 l. 99 (Thm 1.2.1, p. 3), l. 110 (Rem 1.2.2), l. 629–637 (Thm 2.3.5 and Rem 2.3.6, p. 14), l. 734 (André, p. 16), l. 1504–1521 (Thm 5.2.2, p. 33), l. 1534–1550 (§5.3.2 and Rem 5.3.1), l. 1572 (countably many invariants).
- CONRAD06 l. 1937–1960.
- POINEAU13 l. 182–184.
- HK2 l. 220 (p. 5), l. 722–727 (p. 16), l. 1458 (p. 32), l. 2602–2615 (p. 58), l. 2627–2629 (p. 58).

### Adversarial table (computed values)

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| gap formal-affinoid-localization, disc Check | R₀ = K°⟨T⟩ | kernel of (K°/ϖ)[T] → K̃[T] is (K°°/ϖ)[T]; x ∈ K°° ⇒ xⁿ ∈ ϖK°, so the kernel is nil and the map is a homeomorphism | correct | none |
| same, dual numbers | R = K[ε]/ε², R₀ = K°[ε]/ε² | R° = K° + Kε ⊋ R₀; R̃ = K̃; R₀/ϖ has one prime | 1 point ↔ 1 point; correct | none |
| same, statable and minimal | AdicSpacesPartIII R2.5 | realization for quasi-compact quasi-separated X only; no reduction homeomorphism | genuine gap | none |
| gap smooth homogeneous quotient | GL₂/B; G_m/μ₂; H = G; H = 1 | dimensions 4 − 3 = 1 smooth; t ↦ t² has derivative 2t ≠ 0 (char 0; in char 2 μ₂ is not smooth); G → pt; identity | precise, single; the char-0 hypothesis is needed | none |
| gap generically reduced resolution | ⊔ₙ y² = x^(2n+1); Spa K⟨x,y⟩/(y², xy) | reduced and non-quasi-compact: needs countability only; generically reduced with non-reduced locus {0}: needs the extension only | compound | R01 |
| §0.2 dim X vs AdicEtaleGeometry A2.6 | Spa(K × K⟨T⟩); ∅ | sup local dims = 1 = topologicalKrullDim; −∞ = ⊥ | equal values, two definitions | R02 |
| §4.1 surjectivity route | disc; annulus XY = c | A₀ = K°⟨T⟩ = A°; Ã = K̃[X,Y]/(XY) with generic points (Y), (X) from the boundary Gauss points | single affinoid model, no gap needed | R03 |
| §3.2 Grassmannian Checks | G_a; G_m with n = 0, 1 | 1 rigid point (0); B_dR^×/B_dR^{+×} ≅ ℤ, and t⁰B⁺ ≠ t¹B⁺ | correct | none |
| §3.3 finite-residue Check | ℚ_p, p = 2, 3; η; x: T² = p | \|T^p − T\|_η = 1 > \|a^p − a\| ≤ 1/p; \|a² − p\| ∈ {1, 1/p} > p⁻², while 0 at x | separating neighbourhoods correct | none |
| §3.3, rank-2 point near η | x = η⁻ toward 0 | {\|p\| ≤ \|T²\|} ∩ {1 ≤ \|T^(p−1) − 1\|} contains x; it forces a ∈ ℤ_p to be a unit and then excludes units | ℤ_p closed, confirmed | none |
| §0.5 inseparable Check | K = 𝔽_p((u)), a = u | Tᵖ − u irreducible; residue degree p, inseparable; base change K(u^(1/p))⟨T⟩ regular of dim 1 | correct | none |
| §0.5 domain route | disc ⊇ {\|T\| ≤ \|π\|} at 0 | both completions K[[T]], T ↦ T | descent applies | none |
| §0.5 scalar extension | K⟨T⟩ → K′⟨T⟩, K′/K finite separable | K[[T]] → K′[[T]], same parameter | correct | none |
| §6.4 orbit route | G_m/μ₂, y = p over ℚ_p; GL₂/B at [1:0] | lift needs √p, so F′ = ℚ_p(√p); orbit g ↦ pg² has derivative 2p ≠ 0 (also p = 2); c/a has derivative δc | correct, no rational lift assumed | none |
| §5.4 moved Check | T = Spa K[ε]/ε² | T_red = Spa K; resolution id; Spa K → T bijective on 1 point, proper | correct | none |
| §5.1 (CONRAD06) | D² at (X,Y); (T) on D; 0; unit ideal | exceptional (P¹)^an; iso; ∅; id | correct | none |
| §1.6 (no earlier row) | disc with Z = V(T); Spa L; M = D ⊔ D, Y = one disc | dim 0 < 1, so (ii) does not apply; Z ≠ ∅ ⇒ Z = X; Y is the component through y | correct | none |
| §2.3 (no earlier row) | K⟨T⟩/(T²); cusp; z² at a | m/m² = K·T (dim 1 > 0); 2 > 1; df = 2a | correct | none |
| §4.2 / §4.3 dependencies | ll. 669, 671, 689 | §4.2 uses §4.3(2); §4.3 lists §4.2 | cycle | R04 |
| §4.4 / §4.6 dependencies | ll. 707–708, 713, 745 | the API uses §4.6; §4.6 lists §4.4 | cycle | R04 |
| §6.2 G_m Check | \|c\| = 1; \|c\| = 1/p | disc contains 0 ∉ G_m; disc ⊂ {\|T\| = 1} | radius bound missing | R07 |
| `IsUnitGaussPoint` | n = 0; T = 0 (n = 1); `gaussPoint` with r < 1 | norm valuation (unique); vle T π holds but gaussNorm T = 1 > \|π\|; vle T c holds but 1 ≤ r fails | determines the unit Gauss class | none |
| `gaussPoint_mem_closure_rationalPoints` | n = 0; ℚ_p | the single point is both; residue field 𝔽_p fails `Infinite`, where the conclusion would be false | correctly hypothesised | none |
| `analytic_constantRank` | (x, x²); x² at 0; Tᵖ in char p; m = n = k = 0; F = ℝ | ψ(u,v) = (u, v − u²) gives (x, 0); the rank hypothesis fails; π^(np) ≠ 0 excluded by CharZero; empty coordinates; classical theorem | true; ContMDiffAt ω gives analyticity near a | none |
| `analytic_germ_eq_zero_of_subfield` | z(z − a), a ∉ E; m = 0; ℝ ⊂ ℂ | E-zeros near 0 = {0}, so the hypothesis fails; f(0) = 0 on both sides; identity theorem | true; CharZero and completeness of E unused (note) | none |

## Not verifiable

- **SCHNEIDER11** (paywalled; settled as uncertified). Its locators in §§2.3, 6.1–6.3, 6.5 and in the analytic-inverse contract were not read.
- **ANDRE74** (paywalled; settled as uncertified). The §0.5 localization theorem was checked only through its use at TEMKIN12 l. 734.
- Works cited only inside sources (BGR, Bosch, Lütkebohmert, Bartenwerfer) were not fetched. No manifest change was needed.

## Source issues

- **Misprint** in HK2 at §1.1, p. 5 (line 219): the source says the Zariski-closed V meets C in a vanishing locus; it should be the intersection of V with the affinoid open U; affects nothing.
- **Misprint** in HK2 at proof of Theorem 9.1.3, p. 58 (line 2600): the source says the orbit K₀·y is an element of V(C); it should be a subset of V(C); affects nothing.
- **Error** in CONRAD99 at §2.2, author p. 14 (line 648): the source says Spec O_{X,x} is irreducible exactly when one irreducible component passes through x; it should be only the forward implication (the nodal cubic has one component and two branches); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1988e25", "job": "REV-PKG-AdicSpacesPartV~2", "model": "opus", "worker": "fable-rev92"} -->
