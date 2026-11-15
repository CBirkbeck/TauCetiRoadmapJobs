# Review of SmallRamificationAndAbelianVarietyBaseCasesPartII (pull request #1835 at acfed58)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since acfed58; this round reads the pull request's title and description against the head and re-runs the gate. The gate now fails on `statement-hygiene` (3 hits, all `letI` in a theorem signature of `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCasesPartII/Suggested.lean`); these are the only findings. The title and description agree with the head.

## R01 (P3) — `letI` in the signature of `lowDegreeHodgeVanishing`

**Location** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCasesPartII/Suggested.lean` line 67: "`letI : X.Over (Spec (.of ℚ)) := ⟨f⟩`".

**Claim** The gate's `statement-hygiene` rule refuses `letI`/`haveI` in a theorem signature; the structure morphism must be an instance binder.

**Witness** Gate at acfed58: "line 67: P3 `letI` in the signature of theorem `lowDegreeHodgeVanishing`; repair: use an instance binder or a named instance in the signature".

**Repair** Replace the signature (docstring unchanged) by the following, which elaborates at the pins with `sorry` as the only warning and passes the same morphism to `hasEverywhereWittGoodReduction`:

```lean
theorem lowDegreeHodgeVanishing (X : Scheme.{0}) [X.Over (Spec (.of ℚ))]
    [Smooth (X ↘ Spec (.of ℚ))] [IsProper (X ↘ Spec (.of ℚ))]
    (hX : hasEverywhereWittGoodReduction (X ↘ Spec (.of ℚ)))
    (i j : ℕ) (hij : i ≠ j) (hdegree : i + j ≤ 3) :
    Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      ((SheafOfModules.exteriorPower X.sheaf i).obj (X.relativeDifferentials ℚ)) j) := by
  sorry
```

## R02 (P3) — two `letI` in the signature of `geometricK3_hasBadWittPrime`

**Location** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCasesPartII/Suggested.lean` lines 83 and 92: "`letI : Xbar.Over (Spec (.of (AlgebraicClosure ℚ))) := ⟨fbar⟩`" and "`letI : Fact p.Prime := ⟨hp⟩`".

**Claim** Same rule: two `letI` in a theorem signature. Both are avoidable: Mathlib's `Scheme.canonicallyOverPullback` supplies the first instance once `X` carries `[X.Over (Spec (.of ℚ))]`, and the second disappears when the existential binds `Fact p.Prime`.

**Witness** Gate at acfed58: "line 83: P3 `letI` …", "line 92: P3 `letI` in the signature of theorem `geometricK3_hasBadWittPrime`". `Mathlib/AlgebraicGeometry/Pullbacks.lean` line 817: `instance canonicallyOverPullback : (pullback (M ↘ S) f).CanonicallyOver T`, with `hom := pullback.snd (M ↘ S) f`.

**Repair** Replace the signature (docstring unchanged) by the following; it elaborates at the pins with `sorry` as the only warning, the instance found for `Xbar` equals `pullback.snd (X ↘ Spec (.of ℚ)) a` by `rfl`, and the new conclusion is equivalent to the old one (proved in the probe by `⟨fun ⟨p, hp, h⟩ => ⟨p, ⟨hp⟩, h⟩, fun ⟨p, hp, h⟩ => ⟨p, hp.out, h⟩⟩`):

```lean
theorem geometricK3_hasBadWittPrime (X : Scheme.{0}) [X.Over (Spec (.of ℚ))]
    [Smooth (X ↘ Spec (.of ℚ))] [IsProper (X ↘ Spec (.of ℚ))] :
    let a := Spec.map (CommRingCat.ofHom (algebraMap ℚ (AlgebraicClosure ℚ)))
    let Xbar := pullback (X ↘ Spec (.of ℚ)) a
    let fbar := pullback.snd (X ↘ Spec (.of ℚ)) a
    (SmoothOfRelativeDimension 2 fbar ∧ IsProper fbar ∧
      GeometricallyIntegral fbar ∧
      Nonempty (((SheafOfModules.exteriorPower Xbar.sheaf 2).obj
        (Xbar.relativeDifferentials (AlgebraicClosure ℚ))) ≅
          SheafOfModules.unit Xbar.ringCatSheaf) ∧
      Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
        (SheafOfModules.unit Xbar.ringCatSheaf) 1)) →
    ∃ (p : ℕ) (_ : Fact p.Prime), ¬ hasWittGoodReductionAt (X ↘ Spec (.of ℚ)) p := by
  sorry
```

## Previous findings

- none: the review of acfed58 listed no finding of its own (its two bullets, on the approximate-embedding contract and the gap slugs, were both recorded as repaired at this same head, and the folder has not changed).

## Verified sound

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| `lowDegreeHodgeVanishing`, head versus R01 repair | the instance `⟨f⟩` against the binder `[X.Over (Spec (.of ℚ))]` with `f := X ↘ Spec (.of ℚ)` | same `relativeDifferentials ℚ X` term; the elaborated head type shows no residue of the `letI` (it is inlined); repair elaborates, one `sorry` warning | statement unchanged by the repair |
| `geometricK3_hasBadWittPrime`, instance on `Xbar` | `pullback (X ↘ Spec ℚ) a ↘ Spec ℚ̄` against `pullback.snd (X ↘ Spec ℚ) a` | equal by `rfl` (probe `example`); `canonicallyOverPullback.hom` is `pullback.snd` | the canonical instance is the head's `⟨fbar⟩` |
| `geometricK3_hasBadWittPrime`, conclusion | `∃ p (hp : p.Prime), letI := ⟨hp⟩; ¬ P f p` against `∃ p (_ : Fact p.Prime), ¬ P f p`; also against `¬ hasEverywhereWittGoodReduction f` | first equivalence by the anonymous-constructor term above; second by `simp [hasEverywhereWittGoodReduction]`; both elaborate | equivalent; either form removes the `letI` |
| `lowDegreeHodgeVanishing`, hypotheses (description's "i≠j and i+j≤3") | ℙ¹ with `i = j = 1`; total degree 0 | `H¹(ℙ¹, Ω¹) = ℚ ≠ 0`, so `i ≠ j` is needed; `i + j = 0` forces `i = j`, no instance | description, README §3.2 and Lean agree |

Rows for all other statements stand as in the previous review, of acfed58.

- Gate at acfed58: FAIL on `statement-hygiene=3` only; every other check 0, including `build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`. `git diff --stat origin/main...HEAD` outside the folder: empty.
- Elaboration: `lake env lean` on `Suggested.lean` at the head gives two `declaration uses sorry` warnings (lines 64, 78) and nothing else; the probe copy with both repairs and three checking `example`s gives the same two warnings.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Pull request text, 14 sentences checked against the head, none contradicted: the Hodge statement and its two Lean names; "upper break at most `1 + r/(p − 1)`, different strictly below it" (README §1.7, line 310); the discriminant rows replacing the class-number input (README line 452, scope line 7); Henselian lifting with no residue-field hypothesis (README lines 49, 306); "no projectivity, connectedness or Hodge symmetry" (README §3.2, lines 551, 555); the three groups declared not statable (module docstring, lines 19–26); the folder's three files; 53 headings and 4 declarations added, none removed; "adds a roadmap" (not on main). The validation counts (README identifiers missing 0, `set_option` 0, sorry'd data 0, dependency problems 0, outside-folder paths 0) are right at this head.
- Library declarations opened at the pin: `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean` lines 66, 85 (`relativeDifferentials` takes `[X.Over (Spec (.of R))]`); `Mathlib/AlgebraicGeometry/Pullbacks.lean` line 817.
- Fully qualified names: `roadmaps grep` finds the four declaration names in no other roadmap's `Suggested.lean`.
- Seeded sample: every seeded target lies in text the diff does not touch; the locators stand as verified in the earlier reviews of this text.
- Remark (untouched text, no change asked): README line 15 says EnriquesSurfacesAndIntegralNonexistence states the low-degree Hodge obstruction as a supplier contract; at that roadmap's open head the contract (`gap:fontaine-low-degree-hodge`, its README line 99) names PadicHodgeTheory "Part II" as supplier, not this roadmap.

Overlap check: read SmallRamificationAndAbelianVarietyBaseCases, EnriquesSurfacesAndIntegralNonexistence, PadicHodgeTheoryPartII (searched for the Fontaine obstruction: absent); the low-degree Hodge obstruction is owned here only, the other two cite or request it; the vocabulary lists on main and by results are empty.

Source independence: changed passages only — 0 passages changed, so 0 compared; largest share Fontaine93 as in the earlier reviews; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- "2 independent review rounds and 2 red-team rounds" in the description: a statement about the board's history, not about the folder; the board's report list is consistent with it but it is not checkable from the pull request.
- Fontaine 1985, Propositions 1.3 and 1.5, invoked by Fontaine93 §3.8: not in the manifest (as in the previous review).

## Source issues

- **Gap** in Fontaine93 at §3.4, printed p. 9 (line 322): the source chooses lifts of the Frobenius-matrix entries in O_E with no congruence condition; it should restrict to lifts congruent to the Teichmüller lift modulo b_E, for which the map to Hom_MF(M, A_E) is well defined; affects the proof.

## For the human reviewers

- **Declared gap wording.** The board's `design/plan.json` entry for `pm-remove-inverse-e` still says "every real c>0"; README line 73 states the repaired form (`c ≥ 1`, `(p−1)c ∈ ℤ`). The sentence announced to FiniteFlatGroupsAndIntegralPadicHodgeTheory should be the README's.
- **Merge order against the consumer.** The generated `depends-on` and `merge-order` blocks put #1488 EnriquesSurfacesAndIntegralNonexistence before this pull request, while the README (lines 15, 650) and the description call it a consumer; its own gap names PadicHodgeTheory Part II as supplier.
