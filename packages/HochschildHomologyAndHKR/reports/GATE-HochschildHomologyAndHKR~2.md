# GATE-HochschildHomologyAndHKR~2: answers to the human review of `d5f6490`

One comment is unanswered: kim-em's follow-up of 2026-11-24. Its status list (items 1–7) confirms
repairs from earlier rounds. Items 1–4, the locators of item 5 and item 7 need no reply. One item
does: the quasi-free boundary of item 6 cites a roadmap that no longer exists, and is H01. The
ordering remark (merge after RefinedTraceMethods, or move its §1.8 statement here) is H02. The
recommendation to approve is not a point to answer.

## H01 (kim-em) — applied differently

The quasi-free boundary that item 6 records as done named CyclicHomologyLieHomologyAndQuasiFreeAlgebras
Layer 4 as the owner of quasi-free algebras. That roadmap's pull request (#2037) was closed unmerged
on 2026-11-20. It is not on main, not in any open pull request and not in the merge order, so the
citation pointed at nothing. In `TauCetiRoadmap/HochschildHomologyAndHKR/README.md`, `## Scope and ownership`,
lines 2075–2077, "…the vanishing of `Ext²` over `Aᵉ`; they are CyclicHomologyLieHomologyAndQuasiFreeAlgebras
Layer 4's. The comparison point is §3.6, …" now reads "…the vanishing of `Ext²` over `Aᵉ`. The comparison
point with them is §3.6, …". Quasi-free algebras stay outside this roadmap, with the §3.6/§4.4 comparison
kept. No owner is named because a search by object (quasi-free, noncommutative formally smooth,
Cuntz–Quillen) over main and the 483 open heads finds none. The only other mention is a forward reference
to the closed roadmap in SmoothRepresentationsOfLocalGroups on main.

## H02 (kim-em) — answered

This roadmap merges after RefinedTraceMethods. The merge order already puts it there:
RefinedTraceMethods is line 358 and HochschildHomologyAndHKR line 359. RefinedTraceMethods does not
cite this roadmap, so there is no cycle, and the dependency check reports 0 problems. The other option,
stating §1.8 here, is not taken, for two reasons:

- **It would be a second plan of the same target.** At its head (`795405e`), RefinedTraceMethods
  §1.8 ("Étale base change (Weibel–Geller)") states the exact form §9.1(a) uses: for `k`-flat `A, B`
  and étale `φ : A → B`, the map `B ⊗_A HH_n(A/k) → HH_n(B/k)`, `b ⊗ [c] ↦ b·[φ(c)]`, is bijective
  on the homology of the cyclic bar complexes. That is the classical complex.
- **It would not make the two roadmaps independent.** The README also consumes RefinedTraceMethods
  §1.1, in §6.3 (lines 1308 and 1316), and §1.9, in the comparison clauses of §6.4(a) and (b)
  (lines 1336 and 1363). The Layer 6 Dependencies (line 1411) list both sections.

So "everything up to §8.5 is independent of it" holds for the HKR path but not for the whole
roadmap. Layer 8 uses only the definition of `ε^cl` in §6.4(a) (Layer 8 *Needs:* and Dependencies),
while the Layer 6 comparisons with the derived chains need RefinedTraceMethods.

## Build and gate

- `lake build TauCetiRoadmap.HochschildHomologyAndHKR.Suggested`: `Build completed successfully (18268 jobs).`
  There are 10 `declaration uses 'sorry'` warnings, one per stated theorem, at lines 138, 154, 173,
  203, 267, 284, 313, 334, 351 and 367.
- Gate at commit `d18fb7af`: `gate HochschildHomologyAndHKR: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable --pr 2447`): `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`.
  There is no UPWARD, CYCLE or `moved:` line.
- Citation resolver after the repair: "Cross-roadmap citations found nowhere: None. Lean names found
  nowhere: None." The worker's earlier lead `TauCeti.StarkSystems.toExteriorBidual` is a name that
  EulerSystemsAndKolyvaginSystems (README line 3743) and IntegralIwasawaTheory §12.6 on main plan.
  It is cited as theirs and needs no change.
- Commit: `d18fb7af HochschildHomologyAndHKR: review repairs (quasi-free boundary no longer names the
  closed CyclicHomologyLieHomologyAndQuasiFreeAlgebras)`. It is not pushed.

## Suggested.lean and signatures

`Suggested.lean` is unchanged this round. I compared the 18 elaborated types in the job's signature file
with their README statements. The comparison found no binder dropped and no generality gap:

- `homological_hkr` carries only `Algebra.Smooth k R`, as §9.1 states, with no projectivity.
- `cohomological_hkr_hom_kaehler`, `cohomological_hkr` and `normalized_hkr` carry `Algebra.Smooth k R`
  and `Module.Projective k R`, as §9.2 does.
- `normalizedHKRMap` and `normalized_hkr` carry `Invertible (n.factorial : k)`.

No scratch `#check` file was elaborated: the file did not change, and the module build is the only Lean
command this job may run.

## Adversarial pass (statements this round's change and answer rely on)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope sentence: over a field, quasi-free ⇔ `Ext²_{Aᵉ}(A,−) = 0`; §3.6 is the comparison point | `A = k⟨x,y⟩` free, `A = k[x]`, `A = k[x,y]`, over a field `k` | free algebra: bimodule resolution `0 → A⊗V⊗A → A⊗A → A → 0` of length 1, so `Ext² = 0`, and free algebras lift (Ginz05 §19.2, line 4902). `k[x]`: `HH² = 0` (§9.2 Checks). `k[x,y]`: `HH²` free of rank 1 on `[∂_x ∪ ∂_y]` (Layer 9 Examples) and not formally smooth (Ginz05 line 4912) | consistent in both directions | none |
| Same sentence: the qualifier "over a field" is needed | `k = ℤ`, `A = 𝔽₂`, extension `ℤ/4 → 𝔽₂` | `Aᵉ = 𝔽₂ ⊗_ℤ 𝔽₂ = 𝔽₂`, so `Ext^{≥1}_{Aᵉ}(A,−) = 0`. There is no ring map `𝔽₂ → ℤ/4`, since `1 + 1 = 2 ≠ 0`, so `A` does not lift. There is no `ℤ`-linear section either, since `2s(1) = 0` forces `s(1) ∈ {0, 2}`, both mapping to `0`. So the extension is not `k`-split, which agrees with §3.6 classifying only `k`-split extensions | the qualifier is needed and is present | none |
| §9.1(a) (the map RefinedTraceMethods §1.8 supplies) | `k[x] → k[x,x⁻¹]` étale; identity map; `k = 0`; non-étale `k[x] → k`, `x ↦ 0` | `B ⊗_A HH₁(k[x]) = B·[1⊗x] = HH₁(B)`, and `HH₂ = 0` on both sides (Layer 9 Examples). Identity: `A ⊗_A HH_n(A) = HH_n(A)`. For `k = 0` both sides are 0. Non-étale: `k ⊗ HH₁(k[x]) = k ≠ 0 = HH₁(k)` (existing §9.1 Check) | holds where stated, fails where excluded | none |
| §9.1(a) on a non-`k`-flat étale map (outside §1.8's hypothesis) | `k = ℤ`, `A = 𝔽₂ → B = 𝔽₂ × 𝔽₂` | `B ⊗_ℤ B = B ⊗_{𝔽₂} B` and `B` is separable over `𝔽₂`, so classical `HH_n(B,B) = 0` for `n ≥ 1` and `HH₀ = B = B ⊗_A HH₀(A)` | no conflict. §9.1 uses only `k`-flat smooth algebras (`Algebra.Smooth.flat`) | none |
| H02 claim: merge order and no cycle | ORDER.txt; RefinedTraceMethods README at its head | lines 358 and 359; no occurrence of "HochschildHomologyAndHKR" in RefinedTraceMethods | holds | none |
| H02 claim: Layer 6 consumes RefinedTraceMethods §§1.1 and 1.9 | README lines 1308, 1316, 1336, 1363, 1411; Layer 8 Dependencies | §6.3 cites §1.1; §6.4(a), (b) cite §1.9; Layer 8 cites only §6.4(a), "the antisymmetrisation map" | holds | none |

## Ownership, sources, untrusted text

- **Ownership.** The repair removes an owner citation. A search by object found no other owner on
  main or at the open heads (H01). No statement was added, and no new ownership is claimed.
- **Sources.** No new citation and no `needs-references.toml`. The Ginz05 locators above (lines 4902
  and 4912) are in the cached text and are used only in this report.
- **Untrusted text.** The review contains no instruction to run commands, touch credentials or change
  procedure.
