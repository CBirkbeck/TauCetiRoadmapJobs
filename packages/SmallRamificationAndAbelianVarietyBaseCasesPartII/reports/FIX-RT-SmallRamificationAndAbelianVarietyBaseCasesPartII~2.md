# FIX-RT-SmallRamificationAndAbelianVarietyBaseCasesPartII~2

Repair of red-team round 2 (passes 2a and 2b) on `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII`. Pins read: Mathlib `f6090c7`, Tau Ceti `358314d` (the content checkout's `lake-manifest.json`). Supplier heads read: FiniteFlatGroupsAndIntegralPadicHodgeTheory #879, PadicPeriodRings #940, SmallRamificationAndAbelianVarietyBaseCases #970, ArithmeticGaloisRepresentations #856; SchemeAndStackFoundations on main `a0ad405`; LocalFieldsRamification in `Completed/`.

## RT-SmallRamificationAndAbelianVarietyBaseCasesPartII~2a/F01, RT-SmallRamificationAndAbelianVarietyBaseCasesPartII~2b/F02 (P1) — applied

Verified: at Tau Ceti `358314d` the directory `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/` holds `Basic.lean`, `Free.lean`, `LocallyFree.lean`; there is no `ExteriorPower.lean`; `SheafOfModules.exteriorPower` is `ExteriorPower/Basic.lean:60` with the signature the file uses. `Suggested.lean` line 2: `import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower` → `TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic`. README "From Tau Ceti": module locator `…/Sheaf/ExteriorPower.lean` → `…/Sheaf/ExteriorPower/Basic.lean`. No theorem changed; both elaborations below pass.

## RT-SmallRamificationAndAbelianVarietyBaseCasesPartII~2a/F02 (P3) — applied

Verified by the reviewer's witness: E=Frac(W(𝔽₉))(√−3) over ℚ₃ has residue field 𝔽₉, so no ring map O(E)→𝔽₃ exists. §1.2: "A lift of λₛₜ through the residue field O(E)→k alone is not a permitted lift when E/K is ramified" → defines k_E=O(E)/𝔪_E and says that an element whose image in k_E is the image of λₛₜ under k→k_E "need not be a permitted lift when E/K is ramified" ("need not", since the Teichmüller lift is itself such an element and is permitted). The negative Check of §1.2 now notes k_E=k=𝔽₃ for its totally ramified E. Pattern search: "O(E)→k" occurred only there.

## RT-SmallRamificationAndAbelianVarietyBaseCasesPartII~2b/F01 (P1) — applied

Verified: FiniteFlatGroupsAndIntegralPadicHodgeTheory at #879 has sections R07.6.1–R07.6.10 and no R07.6.1a; its §R07.6.2 says Serre's numbering, Herbrand functions, quotient compatibility and the different formula over arbitrary perfect residue fields are supplied by PadicPeriodRings §0.3 and lists that section in its *Needs*. PadicPeriodRings §0.3 at #940 states that contract (complete discretely valued field, perfect residue field, no finiteness). PadicPeriodRings is at merge-order position 19, this roadmap at 137. Changes: Scope and ownership "R07.6.1a–R07.6.5" → "R07.6.2–R07.6.5" plus one sentence assigning perfect-residue ramification theory to PadicPeriodRings §0.3; LocalFieldsRamification's ownership sentence scoped to finite residue fields; Conventions names the supplier; FiniteFlat contract paragraph: "Section R07.6.1a supplies Herbrand theory …" → "§R07.6.2 supplies Fontaine's shifted numbering, u, ι and v₀(𝔇)=u−ι on the Serre-numbering contract of PadicPeriodRings §0.3"; LocalFieldsRamification contract: "whose Herbrand theory comes from … §R07.6.1a" → "from PadicPeriodRings §0.3"; §1.7 *Needs* and Layer 1 Dependencies: "R07.6.1a–R07.6.3" → "R07.6.2–R07.6.3" and PadicPeriodRings §0.3 added; new subsection "From TauCetiRoadmap.PadicPeriodRings" with the consumed contract and the ℚ₃(ζ₃) calibration.

## RT-SmallRamificationAndAbelianVarietyBaseCasesPartII~2b/F03 (P2) — applied

Verified: base §1.4 "Minkowski thresholds" at #970 proves only n≥3⇒rd>2, n≥6⇒rd>3, n≥12⇒rd>4 and says nothing about ramification; the base itself takes "unramified at all finite primes ⇒ ℚ" from Mathlib (`NumberField.finrank_eq_one_of_unramified` in its Mathlib table, `NumberField.abs_discr_gt_two` in its Layers 2–3). At Mathlib `f6090c7`, `NumberField.finrank_eq_one_of_unramified` is `Mathlib/NumberTheory/NumberField/ExistsRamified.lean:50` with hypotheses `[NumberField K] [IsIntegralClosure 𝒪 ℤ K] [Algebra.Unramified ℤ 𝒪]`, and `Algebra.unramified_iff_forall` (`Mathlib/RingTheory/Unramified/Locus.lean:137`, namespace `Algebra`) passes from unramifiedness at every prime to `Algebra.Unramified` for a finite-type algebra. Changes: Mathlib contract gains both names with their hypotheses; base contract drops "1.4" and "Minkowski's unramified-field obstruction"; §2.3 and §2.6 routes, their *Needs*, the Layer 2 Dependencies and the §2.6 worked example cite Mathlib `NumberField.finrank_eq_one_of_unramified` together with ArithmeticGaloisRepresentations §2.2 (Ramification and Frobenius, at #856) instead of base §1.4. Remaining "§1.4" mentions are this roadmap's own §1.4 and K3SurfacesAndSymplecticBoundedness §1.4.

## Adversarial pass on the changed statements

| Statement | Instances tried; values | Result; change |
| --- | --- | --- |
| §1.2 residue-only lifts need not be permitted when E/K is ramified | p=3, r=1, cutoff 1/2. E=Frac(W(𝔽₉))(π), π²=−3, k_E=𝔽₉: residue-only lift 1+π of λ=1 has v₀(π)=1/2, not >1/2, not permitted; Teichmüller lift 1 permitted. Unramified E=Frac W(𝔽₉): 𝔪_E=3O(E), any residue-only lift 1+3y has v₀≥1>1/2, permitted, so the qualifier "ramified" is necessary. | holds; sentence rewritten, "is not" → "need not be" |
| PadicPeriodRings §0.3 contract and the ℚ₃(ζ₃) calibration | L=ℚ₃(ζ₃), π=√−3: G₀=G of order 2, G₁=1, i_G(σ)=ord_L(σπ−π)=ord_L(−2π)=1, ord_L(𝔇)=Σ_{g≠1} i_G(g)=1, v₀(𝔇)=1/2; Serre's φ(u)=u/2 for u≥0, upper break 0. Fontaine: i_{L/K}(σ)=1/2=ι, φ(1/2)=min(1/2,∞)+min(1/2,1/2)=1, u=1, u−ι=1/2 as in §1.7's Check. Unramified L: i_G(g)=0 for g≠1, 𝔇=O_L, u=0, v₀(𝔇)=0<3/2. Supplier's infinite-residue Check K=Frac W(𝔽₃(s)^perf), L=K(√3): e=2, G₀=G, G₁=1, ord_L(𝔇)=1, v₀=1/2. | holds; new subsection |
| Mathlib unramified degree-one theorem in §§2.3, 2.6 | ℚ: degree 1, 𝒪=ℤ unramified. ℚ(i): disc −4, ramified at 2, hypothesis fails, degree 2 consistent. ℚ(√5): disc 5, ramified at 5. §2.6 instance: λ unramified at every finite prime, kernel field F unramified at every prime of 𝒪_F ⇒ `Algebra.Unramified ℤ 𝒪_F` (𝒪_F is finite over ℤ, so finite type) ⇒ [F:ℚ]=1 ⇒ λ=1. §2.3 instance U=0: kernel field ℚ, degree 1. Non-number-field inputs are excluded by `[NumberField K]`. | holds; citations replaced |
| `lowDegreeHodgeVanishing`, `geometricK3_hasBadWittPrime` after the import change | elaborated types below; the exterior power is the sheaf exterior power of `ExteriorPower/Basic.lean:60`, same signature as before; ℙ² off-diagonal groups 0, ℙ¹ at (1,1) excluded by i≠j, K3 h²⁰=1 versus 0. | unchanged |

## Checks run

**`#check @` test.** A scratch copy of `Suggested.lean` with `#check @` for all four declarations elaborated with exit 0 (two `declaration uses sorry` warnings, lines 64 and 78). Elaborated types, compared with the README statements, unchanged from the previous round:

- `hasWittGoodReductionAt : {X : Scheme} → (X ⟶ Spec ↧ℚ) → (p : ℕ) → [Fact (Nat.Prime p)] → Prop`
- `hasEverywhereWittGoodReduction : {X : Scheme} → (X ⟶ Spec ↧ℚ) → Prop`
- `lowDegreeHodgeVanishing : ∀ {X : Scheme} (f : X ⟶ Spec ↧ℚ) [Smooth f] [IsProper f], hasEverywhereWittGoodReduction f → ∀ (i j : ℕ), i ≠ j → i + j ≤ 3 → Subsingleton (Cohomology ((SheafOfModules.exteriorPower X.sheaf i).obj (Scheme.relativeDifferentials ℚ X)) j)`
- `geometricK3_hasBadWittPrime : ∀ {X : Scheme} (f : X ⟶ Spec ↧ℚ) [Smooth f] [IsProper f], (SmoothOfRelativeDimension 2 fbar ∧ IsProper fbar ∧ GeometricallyIntegral fbar ∧ Nonempty (Ω² ≅ unit) ∧ Subsingleton (Cohomology (unit) 1)) → ∃ p, ∃ (hp : Nat.Prime p), ¬hasWittGoodReductionAt f p`

Both theorems carry `[Smooth f] [IsProper f]` explicitly; there is no section `variable` block, so nothing is lost.

**Elaboration of `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/Suggested.lean`** (`lake env lean`, from the content checkout): exit 0; output exactly

    Suggested.lean:64:8: warning: declaration uses `sorry`
    Suggested.lean:78:8: warning: declaration uses `sorry`

No `lake build` was needed: the object files of all three `TauCeti.*` imports exist at the pin.

**Module-system header.** The worker's build logs a warning when a file imports `Mathlib` with a plain `import`, since the pinned Mathlib root is a module file. The header now reads `module`, then `public import Mathlib` and the three `public import TauCeti.*` lines, with `@[expose] public section` placed before the namespace; nothing else in the file changed (the two warning line numbers above shifted by four from the previous head).

**Dependency check** (the brief's command, `--movable`):

    depcheck: 236 roadmaps, 2160 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. PadicPeriodRings (position 19) is earlier than this roadmap (137).

**Citation resolver** on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." (the earlier lead, R07.6.1a, is gone).

## Gate failures

- `imports=1` (`TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower` does not exist at the pin): import replaced by `TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic`, which exists at Tau Ceti `358314d` and is the only module used from that directory. The file now elaborates.

## For the maintainer

- No gap was added or changed; `design/plan.json`, `metadata.toml` and `sources.toml` are untouched. No Lean name of this roadmap changed.
- PadicPeriodRings §0.3 itself consumes RamificationOfCompleteDiscretelyValuedFields (an open draft, not in the merge order); that is PadicPeriodRings' own supplier edge, outside this package, and the dependency check reports no problem for this roadmap.
- Review 2b notes that the K3SurfacesAndSymplecticBoundedness sibling's `Suggested.lean` carries the same stale exterior-power import; not in this package's scope.
- Ownership against open pull requests: the only new citation (PadicPeriodRings §0.3) was checked at head #940, and the Minkowski theorem is a pinned Mathlib declaration, so no ownership question arose. Open pull requests without files in the brief were not searched.
