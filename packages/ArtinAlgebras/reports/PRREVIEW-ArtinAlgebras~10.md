# Review of ArtinAlgebras (pull request #2190 at 210c6e0)
Folder: `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/`
**Verdict:** needs changes

## R01 (P3) — The new “From Tau Ceti” entry changes what “the last three” qualifies

**Location:** `README.md:182–188`: “the isomorphism of two right minimal right almost-split maps `TauCeti.IsRightAlmostSplit.exists_iso_of_minimal` (…, in any category), and `…rightRadicalQuotientEquiv` and `…leftRadicalQuotientEquiv` (…), the last three for end terms with local endomorphism rings.”

**Claim:** after the insertion, “the last three” now covers `exists_iso_of_minimal`, which has no locality hypothesis, and no longer covers `isIrreducibleMorphism_iff_exists_isSplitMono`, which needs locality at both ends. The entry also sits under “In a balanced preadditive category:”.

**Witness:** at the pinned Tau Ceti, `AlmostSplit/Components.lean:40–42` and `RadicalQuotient.lean:39–41` assume `[IsLocalRing (End S.X₁)] [IsLocalRing (End S.X₃)]`. `AlmostSplit/Minimal.lean:163–170` assumes only `[Category C]`.

**Repair:** move the entry into the first sentence and put back the old wording of the second: “… `TauCeti.IsRightAlmostSplit.indecomposable` (`TauCeti.CategoryTheory.AlmostSplit.Basic`), the isomorphism of two right minimal right almost-split maps `TauCeti.IsRightAlmostSplit.exists_iso_of_minimal` (`TauCeti.CategoryTheory.AlmostSplit.Minimal`), and `ShortComplex.IsAlmostSplit` (…Sequence). In a balanced preadditive category: uniqueness … (…Uniqueness), the irreducible maps into the right-hand end … (…Components), and … `rightRadicalQuotientEquiv` and … `leftRadicalQuotientEquiv` (…RadicalQuotient), the last three for end terms with local endomorphism rings.”

## R02 (P3) — The §3.3 *Needs:* line omits the inputs of the new uniqueness route

**Location:** `README.md:817–819`: “*Needs:* 3.1's `Ext¹`; 0.2's `IsKrullSchmidt`; Tau Ceti `ShortComplex.IsAlmostSplit`, `TauCeti.IsLeftAlmostSplit`, `TauCeti.IsRightAlmostSplit`, `CategoryTheory.ShortComplex.ShortExact.isLeftAlmostSplit_f_iff_extClass`.”

**Claim:** the route at 790–800 uses the radical, the fact that a non-split morphism out of an object with local `End` lies in the radical, and `exists_iso_of_minimal`. The line names none of them. The radical step is a pinned lemma that neither the route nor “From Tau Ceti” (205–210) names.

**Witness:** at the pinned Tau Ceti, `Preadditive/Radical/Basic.lean:343` `TauCeti.mem_jacobsonRadical_iff_not_isSplitMono` needs only `[IsLocalRing (End X)]`, and its dual `mem_jacobsonRadical_iff_not_isSplitEpi` follows it. `AlmostSplit/Minimal.lean:167` is `exists_iso_of_minimal`.

**Repair:** append to 819 “; for the uniqueness, Tau Ceti `TauCeti.jacobsonRadical`, `TauCeti.IsLeftAlmostSplit.isLocalRing_end`, `TauCeti.IsRightAlmostSplit.isLocalRing_end`, `TauCeti.mem_jacobsonRadical_iff_not_isSplitMono`, `TauCeti.mem_jacobsonRadical_iff_not_isSplitEpi`, `TauCeti.IsRightAlmostSplit.exists_iso_of_minimal`”. Add the two `mem_jacobsonRadical_iff_not_isSplit…` names to the radical bullet of “From Tau Ceti” (205–210).

## Previous findings

Ids refer to `packages/ArtinAlgebras/reports/PRREVIEW-ArtinAlgebras~9.md`.

- R01 — repaired: README:799–800 end the route with “dually at the left end ([INP, Prop. 2.6(1)–(2)], for extriangulated categories)”. README:1438–1439 add “Prop. 2.6(1)–(2) (uniqueness of almost-split extensions)” to [INP]. The target assumes both (AS1) and (AS2), so the source's misprinted hypotheses do not affect it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §3.3 route: `g` right minimal ⟺ `f ∈ rad(A, B)`, given exactness of `Hom(B,A)→Hom(B,B)→Hom(B,C)` | `k → k[ε]/(ε²) → k`; `C = 0` | `h = a+bε`, and `h≫g = g` forces `a = 1`, a unit. `f≫u = 0`, so `𝟙−0` is invertible. Both sides ⟺ `B = 0` | true in any preadditive category | none |
| same, negative control | `0 → k² --pr₁--> k` | `f = 0` lies in rad, but `h = diag(1,0)` fixes `pr₁` and is not iso. `diag(0,1)` is in the kernel, not the image | exactness hypothesis needed and stated | none |
| §3.3 inflation lies in rad | `ℤ/2 →i ℤ/4 →d ℤ/2` over `ℤ/4`; `pr₁ : k² → k` | `i≫u = 0` for both `u`, so `i ∈ rad`. `b≫d = d` ⟺ `b ∈ {1,3}`, both units. For `pr₁`: `𝟙−pr₁≫incl₁ = diag(0,1)`, not iso | needs local source: pinned `mem_jacobsonRadical_iff_not_isSplitMono` | R02 |
| §3.3 isomorphism over `Z` | two AR sequences `k → k[ε]/(ε²) → k`, `g' = λg` | `e = λ⁻¹·𝟙` and `e≫g' = g`. In `proj ℤ`, `2 : ℤ → ℤ` is mono and epi but not iso | `exists_iso_of_minimal` needs only `[Category C]`, so it fits a non-balanced exact category | none |
| “From Tau Ceti” qualifiers (182–188) | the five declarations listed | locality: `nonempty_iso` none; Components needs both ends; `exists_iso_of_minimal` none; RadicalQuotient needs both ends | “the last three” now picks the wrong three | R01 |
| Radical convention | `f = pr₁`, `g = incl₁` | Tau Ceti `𝟙_X − f≫g = diag(0,1)` and JK/README `𝟙_Y − g≫f = 0`: both non-invertible | equivalent (`isIso_id_sub_comp_comm`) | none |
| [JK, Lemma 1.1] | jk lines 138–155, pp. 3–4 | complex `L→M→N` in `mod Λ` with an exact `Hom(M,−)` sequence. The proof uses only sums and composition | supports “valid in any additive category” | none |
| [INP, Prop. 2.6(1)–(2)] | inp lines 733–753, p. 11; `k[x]/(x³)`, `C = k ⊕ k[x]/(x²)` | (1) fixed right end, (2) fixed left end. The proof uses (AS1) and Prop. 2.5(2). With (AS1) alone, `A = k ≇ A' = k[x]/(x²)` | supports the target, which assumes both | none |

Rows for untouched statements stand as in the previous review, of `3662cec`.

- Source locators checked against the text: 2 (jk Lemma 1.1; inp Prop. 2.6). ABM's bibliographic data are confirmed by tattar lines 1093–1095.
- Library at the pin, 9 declarations opened: `AlmostSplit/Minimal.lean:96, 109, 167`; `Components.lean:68`; `RadicalQuotient.lean:119, 171`; `Uniqueness.lean:138`; `Radical/Basic.lean:166, 343`; `ShortComplex/LocalEnd.lean:96`. The pinned `ShortExact.isIso_of_comp_g_eq` needs `[Balanced C]`, so it does not apply to exact categories, and the JK route is needed.
- Gate: the worker's gate at 210c6e0 passes. A hand run reports every check 0 except `outside-folder` for `TauCetiRoadmap/RepresentationTheory/README.md`, the family index, which is this pull request's own file. This round does not change it.
- Elaboration: `lake env lean Suggested.lean` gives 19 `sorry` warnings and nothing else. `Suggested.lean` is unchanged since `3662cec`, so the `#check @` comparison and the one-tactic probe (0 of 19 closed) stand.
- Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Seeded sample: none of the fifteen targets falls in the changed passages. The sample stands as of the earlier reviews.
- Pull request text: the fifth-commit paragraph matches this head. Title and the remaining prose are unchanged and still accurate.
- Overlap check: read RepresentationTheory (main; #1047, #1220, #1775), QuiverRepresentations (main), GrothendieckEulerForms (main), GeneralAlgebraicKTheory (#1212). No roadmap or Tau Ceti module at the pin states almost-split conflations of exact categories or the minimality–radical lemma. The family-index heads assign them to ArtinAlgebras. Nothing is shared.

## Not verifiable

- abm (Assem–Beligiannis–Marmaridis, CMS Conf. Proc. 24, 1998): the sources service found no legal copy, and a web search found none. “2.5, Lemma, p. 25” and its Krull-Schmidt and weak-kernel hypotheses are unchecked. JK Lemma 1.1 independently supports the route.
- ars, ass, kr03, au78, mu, Nakaoka–Palu: as in the previous review.

## Source issues

- **Error** in inp at Prop. 2.6(1)–(2), p. 11: part (1) assumes only (AS1) and part (2) only (AS2). Part (1) fails for `ρ = (δ₁, 0)` and `ρ' = (0, δ₂)` over `k[x]/(x³)`. It should assume almost-split extensions, which is what its proof uses. Affects nothing.
