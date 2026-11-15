# Review of DirectSummandsAndBigCohenMacaulay (pull request #1735 at 03c84cc)

**Verdict:** accepted

No finding. Incremental re-review of 36 changed lines since a6bccc9, with the title and description read against this head.

## Previous findings

- R01 — repaired: `Suggested.lean` has no `attribute [local instance]`; `derivedUnit`, `DerivedSplinter`, `splinter_iff_derivedSplinter_charP`, `derivedDirectSummand` carry `[HasDerivedCategory.{u + 1} …]` binders; README line 53 and §7.1 (line 1205) state the instantiation and the independence of the choice.
- R02 — repaired: line 139 reads "Section 7.5 supplies for every reduced Noetherian quasi-excellent ℚ-scheme Z …"; lines 1342, 1352, 1381 cite "ResolutionOfSingularitiesCharacteristicZero §7.5". `exists_resolution` occurs nowhere in the folder.
- R03 — repaired: line 1292 reads "… a finite surjective cover π : Y → X such that, for the proper composite g = f ∘ π : Y → S, the pullback π* … vanishes."
- R04 — repaired: the description now reads "Almost purity, quantitative Riemann extension and the Kummer tower are consumed from the perfectoid roadmaps."
- R05 — repaired: the description and README line 3 now read "faithfully flat domination of finite extensions of regular rings", "Cohen–Macaulayness of pure mixed-characteristic local subrings of regular local rings with separable residue extension", "the derived direct summand theorem for regular rings".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `derivedUnit` (binders added) | `@derivedUnit X Y (HasDerivedCategory.standard _) (HasDerivedCategory.standard _) f` on a scratch copy | elaborates; `standard` has universe `max u v` = u + 1 for `X.Modules` (Mathlib `DerivedCategory/Basic.lean` line 81) | instance binders are instantiable; type and body unchanged | none |
| `DerivedSplinter` (binders added) | R = 0; R = 𝔽_p[t]/(t²) with X = Spec 𝔽_p; X = Spec R with a second instance on X | R = 0: X = ∅, ρ = 0 works. 𝔽_p[t]/(t²): H⁰ of the unit kills t, no retraction. Bound X-instance has an fvar type, so the R-instance is used for the target | holds for 0, fails for the nonreduced ring, no instance clash | none |
| `splinter_iff_derivedSplinter_charP` | R = 𝔽_p[t]/(t²); R = 𝔽_p; R = 0 | nonreduced: `Splinter` false (`IsReduced`), `DerivedSplinter` false (row above). 𝔽_p: both true (D(𝔽_p) splits, H⁰ ≠ 0). R = 0 excluded: `CharP 0 p` forces p = 1 | both directions agree | none |
| `derivedDirectSummand` | `@derivedDirectSummand R _ _ (HasDerivedCategory.standard _) : @DerivedSplinter R _ (HasDerivedCategory.standard _)` | elaborates on a scratch copy; `#check` shows only `[HasDerivedCategory (Spec ↧R).Modules]` added to the type of a6bccc9 | no binder lost | none |
| §7.1, independence of the derived-category choice | two localizations L₁, L₂ of `CochainComplex.Plus` at quasi-isomorphisms | the equivalence E with E∘L₁ ≅ L₂ carries the right derived functor and its unit to the other pair, so `derivedUnit` corresponds up to isomorphism and retractions transport | holds | none |
| §7.5 (g = f ∘ π) | E ordinary elliptic over 𝔽_p, S = Spec 𝔽_p, π = [p]; X affine, π = id | [p]* on H¹(E, O_E) is multiplication by p = 0; affine: `τ^{≥1}`Rf_*O_X = 0 | π* has source and target, and vanishes | none |
| §7.7 resolution input (sampled; citation changed) | Z integral, proper over Spec ℚ⟦t⟧ | supplier §7.5 on main (README line 1098): generically reduced Noetherian quasi-excellent ℚ-scheme, projective birational, regular source, no finite-type hypothesis; Z is reduced and excellent | supplier statement covers the use | none |
| Description: "direct summand theorem for every Noetherian regular ring", "André's, over W(k)⟦T₁,…,Tₙ⟧", "Kovács's route fails for disconnected generic fibres" | `directSummand`; Layer 2 heading; README line 1334 | `[IsRegularRing R]`, finite injective S; §2.3 base W(k)⟦T₁,…,T_n⟧; ℙ¹→ℙ¹ of degree 2: f_*ω has rank 2, ω rank 1 | description agrees with the head | none |

The rows for statements the diff does not change stand as in the previous review, of a6bccc9.

- Gate at 03c84cc: every check 0, including `statement-hygiene`, `depcheck`, `outside-folder`, `stray-files` and `build`: OK.
- Elaboration: `lake env lean` on `Suggested.lean` gives ten `declaration uses sorry` warnings (lines 88, 99, 108, 115, 124, 131, 149, 166, 219, 228) and nothing else. The scratch copy with the two `HasDerivedCategory.standard` examples adds no message.
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Library declarations opened, 1: `HasDerivedCategory.standard`, Mathlib `Algebra/Homology/DerivedCategory/Basic.lean` line 81 (`HasDerivedCategory.{max u v} C`).
- Cross-roadmap citations resolved, 1: ResolutionOfSingularitiesCharacteristicZero §7.5 on main (README line 1098). The worker's resolver lists no citation or Lean name found nowhere.
- Source locators checked at the text, 1: BHATT12 line 42 (Theorem 0.4, p. 1) for §7.5. No locator was added or changed.
- Title and description: read against the head and against the change from the base (the pull request adds the folder: 83 headings, 19 declarations, none removed). No sentence is contradicted; `git diff origin/main...HEAD` shows no change outside the folder.
- Overlap check: read PerfectoidSpacesPartII, PerfectoidQuotientsPartII, DeformationAndDerivedPatchingAlgebra, DeformationAndDerivedPatchingAlgebraPartII, PurityForFlatCohomology, SchemeAndStackFoundations, LocalPurity, PurityOfBranchLocus; the diff adds no object, and ownership stands as in the review of a6bccc9 (perfectoid covers of regular local rings owned here, §§3.2–3.3; Kummer tower and purity by PerfectoidSpacesPartII); nothing else shared.
- Source independence: changed passages only; 5 passages compared with 1 source (BHATT12), none shared beyond the displayed formula and "finite surjective"; largest share ANDRE18B, 117 of 304 locators; no layer added, removed or reordered, so the contents comparison stands as reviewed at aa4beac: independent.

## Not verifiable

- HH95, HH92 and BH93 are uncertified in the manifest and cited by locator only. No changed passage cites them.

## Source issues

- **Gap** in BHATT12 at Theorem 0.4, p. 1: the source says there are a proper g : Y → S and a finite surjective π : Y → X with vanishing pullback, without relating g to f and π; it should be g = f ∘ π, as its proof uses; affects nothing.

## For the human reviewers

- none
