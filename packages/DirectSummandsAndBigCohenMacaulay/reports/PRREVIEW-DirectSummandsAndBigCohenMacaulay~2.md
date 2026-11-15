# Review of DirectSummandsAndBigCohenMacaulay (pull request #1735 at a6bccc9)

**Verdict:** needs changes

## R01 (P3) — Gate: local `HasDerivedCategory` instance in `Suggested.lean`

**Location:** `TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/Suggested.lean` line 178: `attribute [local instance] HasDerivedCategory.standard`.

**Claim:** `derivedUnit`, `DerivedSplinter`, `splinter_iff_derivedSplinter_charP` and `derivedDirectSummand` are stated cleanly against the pinned Mathlib.

**Witness:** the gate at a6bccc9 gives `statement-hygiene=1 … FAIL`, with "line 178: P3 `attribute [local instance] HasDerivedCategory`". Mathlib `Algebra/Homology/DerivedCategory/Basic.lean` lines 42–47 asks for a `[HasDerivedCategory.{w} C]` binder instead.

**Repair:** delete line 178. Carry the instance as binders, at the universe of the standard instance. This was tested: a copy with exactly these edits elaborates with only the ten `sorry` warnings, and `HasDerivedCategory.standard` instantiates `derivedDirectSummand`.

```lean
noncomputable def derivedUnit {X Y : Scheme.{u}} [HasDerivedCategory.{u + 1} X.Modules]
    [HasDerivedCategory.{u + 1} Y.Modules] (f : X ⟶ Y) : -- type and body unchanged

noncomputable def DerivedSplinter (R : Type u) [CommRing R]
    [HasDerivedCategory.{u + 1} (Spec (CommRingCat.of R)).Modules] : Prop :=
  IsNoetherianRing R ∧
    ∀ (X : Scheme.{u}) [HasDerivedCategory.{u + 1} X.Modules] (f : X ⟶ Spec (CommRingCat.of R)),
      AlgebraicGeometry.IsProper f → AlgebraicGeometry.Surjective f →
        ∃ ρ, derivedUnit f ≫ ρ = 𝟙 _
```

Then add `[HasDerivedCategory.{u + 1} (Spec (CommRingCat.of R)).Modules]` as the last binder of `splinter_iff_derivedSplinter_charP` and of `derivedDirectSummand`. In README line 53, say that `HasDerivedCategory.standard` instantiates these binders. In §7.1, add that a retraction exists for one choice of derived category exactly when it exists for every choice, because two choices are equivalent compatibly with the localization functor.

## R02 (P3) — `exists_resolution` is the field endpoint, not ResolutionOfSingularitiesCharacteristicZero §7.5

**Location:** README line 139: "Section 7.5, `exists_resolution`, supplies for every reduced Noetherian quasi-excellent ℚ-scheme Z … no finite-type hypothesis over a field is used". Lines 1342, 1352 and 1381: "§7.5 (`exists_resolution`)".

**Claim:** `exists_resolution` is the declaration for the supplier's §7.5.

**Witness:** in ResolutionOfSingularitiesCharacteristicZero on main, `Suggested.lean` line 81: `exists_resolution` assumes `[LocallyOfFiniteType s]` for `s : X ⟶ Spec k` with `k` a characteristic-zero field (docstring "README §§5.5, 7.8"). Its §7.5 (README line 1098) has no Lean declaration.

**Repair:** drop the name. This replaces the repair proposed for R01 of the review of aa4beac. Line 139 becomes "Section 7.5 supplies for every reduced Noetherian quasi-excellent ℚ-scheme Z …". In lines 1342, 1352 and 1381, write "ResolutionOfSingularitiesCharacteristicZero §7.5".

## R03 (P3) — §7.5 leaves g unrelated to f and π

**Location:** README line 1292: "Then X has a finite surjective cover π : Y → X, where Y comes with a proper map g : Y → S, for which the pullback π* : `τ^{≥1}`Rf_*O_X → `τ^{≥1}`Rg_*O_Y vanishes."

**Claim:** the statement determines the map π*.

**Witness:** pulling back along π maps Rf_*O_X to Rf_*Rπ_*O_Y = R(f∘π)_*O_Y. For a proper g ≠ f∘π there is no such map into Rg_*O_Y. The proof route of §7.6 (line 1317) uses g = f∘π.

**Repair:** "Take X and S to be Noetherian schemes over 𝔽_p, and f : X → S a proper morphism. Then X has a finite surjective cover π : Y → X such that, for the proper composite g = f ∘ π : Y → S, the pullback π* : `τ^{≥1}`Rf_*O_X → `τ^{≥1}`Rg_*O_Y vanishes."

## R04 (P3) — Description: the perfectoid inputs do not become theorems here

**Location:** description, summary block: "The perfectoid roadmaps leave almost purity, quantitative Riemann extension and Kummer towers as analytic contracts; here they become theorems about Mathlib's `IsRegularRing` and `IsRegularLocalRing`, valid in every characteristic."

**Claim:** this roadmap proves these three inputs, and its suppliers leave them as contracts.

**Witness:** README line 9 says "Its analytic statements remain supplier contracts here." PerfectoidSpaces §P3.13 (on main, README line 8746) and PerfectoidSpacesPartII §§1.2 and 5.4 (at its head) state these inputs as their own targets.

**Repair:** "Almost purity (PerfectoidSpaces P3), quantitative Riemann extension and the Kummer tower (PerfectoidSpacesPartII RA.1 and RA.5) are consumed here as supplier theorems. They are applied to prove splitting and big Cohen–Macaulay theorems about Mathlib's `IsRegularRing` and `IsRegularLocalRing`, in every characteristic."

## R05 (P3) — Description: flat domination and Cohen–Macaulay descent stated without their hypotheses

**Location:** description, summary block: "obtains faithfully flat domination of finite covers, the monomial theorem, Cohen–Macaulay descent along pure mixed-characteristic local maps, and the derived direct summand theorem for proper surjective morphisms."

**Claim:** the roadmap proves flat domination of every finite cover, and Cohen–Macaulay descent along every pure mixed-characteristic local map.

**Witness:** `finiteCover_flatDomination` assumes `IsRegularRing R`. §6.4 (README lines 1150 and 1154) assumes B′ regular with separable residue extension. Without regularity, flat domination fails, and a pure subring of a Cohen–Macaulay ring need not be Cohen–Macaulay (table rows for §5.3 and §6.4).

**Repair:** "… and obtains faithfully flat domination of finite extensions of regular rings, the monomial theorem, Cohen–Macaulayness of pure mixed-characteristic local subrings of regular local rings with separable residue extension, and the derived direct summand theorem for proper surjective covers of spectra of regular rings."

## Previous findings

- R01 — partly repaired: line 139 now reads "This roadmap's §7.7 applies it …", but `qeResolution` became `exists_resolution`. That declaration is the supplier's finite-type field endpoint (§§5.5, 7.8), not §7.5. See R02.
- R02 — repaired: the contracts read "What PerfectoidSpacesPartII must provide (gap:ramified-multielement-kummer): …", and likewise for the other three suppliers (lines 94, 113, 119, 131). §6.2 cites "PerfectoidSpacesPartII §RA.5 (ramified multielement kummer)" (lines 1110, 1114).
- R03 — repaired: all twelve prose-only sections now say "The target of this section is specified here in prose." None of the eleven former names remains anywhere in the README.
- R04 — repaired: line 873 now uses "B = ℤ_p⟦x, y, u, v⟧/((x, y) ∩ (u, v)), which has dimension 3 and depth 2"; line 1116 cites "pp. 87–88".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.5 (reworded) | E elliptic over 𝔽_p, S = Spec 𝔽_p, π = [p], g = f∘π; X = Spec R affine | [p]* on H¹(E,O_E) is multiplication by p = 0; affine: `τ^{≥1}`Rf_*O_X = 0, π = id | holds with g = f∘π; a free g leaves π* without a target | R03 |
| §4.8 Check, B = ℤ_p⟦x,y,u,v⟧/((x,y)∩(u,v)) | 0→B→ℤ_p⟦u,v⟧⊕ℤ_p⟦x,y⟧→ℤ_p→0; parameters (p, x+u, y+v) | dim 3; depth ≥ min(3, 1+1) = 2 and ≤ 2; in B/(p, x+u): x ≠ 0, x(y+v) = xy + xv = 0 | depth 2 < 3, not Cohen–Macaulay, as stated | none |
| §6.2 page, ANDRE18B §4.4(1) | ANDRE18B line 780; page markers at lines 745 and 788 | line 780 on cache page 17 = printed 87; item continues at line 790, printed 88 | "pp. 87–88" correct | none |
| gap:ramified-multielement-kummer | PerfectoidSpacesPartII §5.12 at its head; §6.2 target B′ = ℤ_p⟦T,U⟧/(T²−TU+p) | §5.12: base W(k)⟦T⟧, one discriminant g; B′ has p ∈ m², not of that form | not supplied; the gap is minimal | none |
| gap:parameter-systems | ℤ_p→ℤ_p[√p] finite; ℤ_p→W(𝔽_{p²}) flat with mR′ = m′; k⟦x,y⟧/(xy)→/(x) | (p) ↦ (π²), radical (π); (p) ↦ (p) = m′; (x+y) ↦ (y) in k⟦y⟧ | each image is a parameter system; K0.3 (DeformationAndDerivedPatchingAlgebraPartII head, line 516) has no transports | none |
| gap:common-cohen-extension | DeformationAndDerivedPatchingAlgebra §1.10 at its head | residue extension R→R′ of one ring with m_R R′ = m_R′; no compatible pair over a map β | not supplied | none |
| gap:perfectoid-base-modification-domination | SchemeAndStackFoundations §4.12 (main, line 6930) | `modification_domination` for Noetherian integral S; §7.4 base is a non-Noetherian K°-algebra | not supplied | none |
| §7.7 resolution input | Z integral, proper over Spec ℚ⟦t⟧ | `exists_resolution` needs `LocallyOfFiniteType` over a field; ℚ⟦t⟧ has uncountable transcendence degree over ℚ, so it is not finitely generated | name does not apply; supplier §7.5 prose does | R02 |
| `DerivedSplinter` with R01's binders | R = 0; standard instance | Spec 0 = ∅ forces X = ∅, every object zero, ρ = 0 gives derivedUnit ≫ ρ = 𝟙; `HasDerivedCategory.standard` instantiates the binder | content unchanged | R01 |
| `splinter_iff_derivedSplinter_charP`, `derivedDirectSummand` (`#check` after R01) | elaborated types | only `[HasDerivedCategory (Spec ↧R).Modules]` added; all other binders as at aa4beac | no binder lost | R01 |
| §5.3 `finiteCover_flatDomination` without regularity | R = ℤ_p⟦x,y⟧/(xy), S = ℤ_p⟦x⟧×ℤ_p⟦y⟧ | (x+y)(1,0) = (x,0) = x, so x ∈ (x+y)S ∩ R; (x+y)(c+xg+yh) = c(x+y)+x²g+y²h ≠ x | R→S not pure, so no faithfully flat T over S | R05 |
| §6.4 `pureSubring_cohenMacaulay` | identity of ℤ_p⟦x⟧; Segre product R of ℂ[x,y,z]/(x³+y³+z³) and ℂ[s,t] inside their tensor product | identity: regular, pure, separable, Cohen–Macaulay; R split by the weight-0 projection, dim R = 3, H²_m(R)₀ ⊇ H¹(E,O_E) = ℂ | pure into a Cohen–Macaulay ring, R not Cohen–Macaulay: regular target needed | R05 |

The rows for statements the diff does not change stand as in the review of aa4beac.

- Gate, rerun at a6bccc9: FAIL only on `statement-hygiene=1` (R01). Every other check is 0, including depcheck, outside-folder and stray-files.
- Elaboration: `lake env lean` on `Suggested.lean` gives ten `declaration uses sorry` warnings (lines 88, 99, 108, 115, 124, 131, 149, 166, 217, 225), exit 0. A scratch copy with R01's repair gives the same ten warnings; its `#check` types are in the table.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`, with no UPWARD or CYCLE line. This roadmap is at merge-order position 222; its open suppliers are at 24, 26, 79, 80 and 81. ResolutionOfSingularitiesCharacteristicZero is now on main.
- Cross-roadmap citations resolved, 8: ResolutionOfSingularitiesCharacteristicZero §7.5 and `exists_resolution` on main. In PerfectoidSpacesPartII at its head, the former-numbering table (lines 3167–3174) maps the RA.1, RA.3 and RA.5 targets cited in §6.2 to §§1.1–1.5, 3.6 and 5.1–5.12. Also DeformationAndDerivedPatchingAlgebra §1.10, DeformationAndDerivedPatchingAlgebraPartII K0.3 and SchemeAndStackFoundations §4.12.
- Source locators checked at the text, 2: BHATT12 line 42 (Theorem 0.4, p. 1) and ANDRE18B line 780 (pp. 87–88). No new locator was added.
- Overlap check: read PerfectoidSpacesPartII (#2286), PerfectoidQuotientsPartII (#2259), DeformationAndDerivedPatchingAlgebra (#1034), DeformationAndDerivedPatchingAlgebraPartII (#872) and PurityForFlatCohomology (#1840), plus SchemeAndStackFoundations, LocalPurity and PurityOfBranchLocus on main. Bhatt's perfectoid cover of a regular local ring is owned here (§§3.2–3.3); PerfectoidQuotientsPartII lines 111–116 defer it and state how its Q10.2 differs. The Kummer tower and purity are owned by PerfectoidSpacesPartII Layer 5, whose line 23 assigns the direct summand theorems here. Nothing else is shared.
- Remark (untouched text): the plan's four supplier-`none` gaps are not declared in the README. Their content is owned by §0.5 (line 302), §§4.2–4.5 (finite witnesses, line 757), §4.10 (line 910) and §7.7 (line 1336), as the review of aa4beac found. README line 3 contains the two unqualified phrases of R05.
- Source independence: changed passages only. 7 passages were compared with 2 sources (BHATT12, ANDRE18B); none shares words beyond the displayed formula and "finite surjective". No layer was added, removed or reordered, so the arrangement stands as reviewed at aa4beac. The largest share is ANDRE18B, 117 of 304 locators.

## Not verifiable

- HH95, HH92 and BH93 are uncertified in the manifest and cited by locator only, as in the review of aa4beac. No changed passage cites them.

## Source issues

- none

## For the human reviewers

- none
