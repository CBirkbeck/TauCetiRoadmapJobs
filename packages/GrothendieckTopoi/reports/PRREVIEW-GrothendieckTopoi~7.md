# Review of GrothendieckTopoi (pull request #1520 at 460a8d2)

**Verdict:** needs changes

Incremental re-review of the 77 lines changed since 9bf309d (74 in `TauCetiRoadmap/GrothendieckTopoi/README.md`, 3 in `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean`), against Mathlib `f6090c7` and Tau Ceti `358314d` (the pins of the pull request's `lake-manifest.json`). The pull request still changes nothing outside the folder. The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `sorry-data=0`, `readme-ids-missing=0`, all others 0). My own `lake env lean` of `Suggested.lean` exits 0 with 27 `declaration uses sorry` warnings and nothing else. Two findings remain, both P3: one locator the repair of R05 got wrong (the OCR of the scan hides the item number, and the previous report's proposed locator was itself wrong), and one layer-dependency paragraph the repair of R01 left behind.

## R01 (P3) — The Isbell 1972 locator for `ℚ × ℚ` names 2.3 (3); the statement is the remark before 2.4 and the proof of 2.4

Location: `README.md` line 1124 ("Isbell 1972, 2.3 (3), p. 18") and line 1184 (the reference entry: "2.3 (3), p. 18, the product `ℚ × ℚ`").

Claim: Isbell 1972, item 2.3 (3), printed page 18, states that the localic product `ℚ × ℚ` is not a space.

Witness: the page image of printed p. 18 (page 14 of the scan; the OCR at isbell1972 line 537 and 543–544 is garbled there) reads: 2.3 (3) is "the space of points of a strongly Hausdorff locale is a Hausdorff space, but not all Hausdorff spaces are strongly Hausdorff" (isbell1972 line 526–527). Its proof is on p. 19 (isbell1972 line 565–571) and uses `ℚ × J` with `J` the irrationals in a retopologised real line, not `ℚ × ℚ`. The `ℚ × ℚ` statement is the paragraph that follows the list, "for (3) of 2.3 we shall need a space whose square in 𝓛ᵒᵖ is not a space" with the disjoint-dense-subspaces argument (isbell1972 line 538–542), and the proof of the numbered item **2.4** ("the functor Top → 𝓛ᵒᵖ does not preserve squares of quasi-compact primal T₁-spaces"), which says that the open part `ℚ` of `αℚ` has a non-spatial square (isbell1972 line 545–548). The printed page is right; the item number is not.

Repair: at both places write "Isbell 1972, the remark before 2.4 and the proof of 2.4, p. 18" (the reference entry: "the remark before 2.4 and the proof of 2.4, p. 18, the square of `ℚ`").

## R02 (P3) — Layer 6's Dependencies paragraph omits Layer 3, which 6.4 now needs

Location: `README.md` lines 911–912 ("Layers 1, 2 and 4, AdicSpacesPartII R0.19.10, and Mathlib. Within the layer, 6.2 uses 6.1 and 6.4 uses 6.2–6.3.").

Claim: Layer 6 depends on Layers 1, 2 and 4 only.

Witness: the repaired 6.4 (lines 877–891) proves `hasEnoughPoints_coherentTopology` through the slice equivalence `Sheaf (coherentTopology C) (Type u) / ℓ c ≌ Sheaf ((coherentTopology C).over c) (Type u)` and its `*Needs:*` line (line 890) lists 3.1; Layer 3 is not in the paragraph.

Repair: write "Layers 1–4, AdicSpacesPartII R0.19.10, and Mathlib. Within the layer, 6.2 uses 6.1 and 6.4 uses 3.1 and 6.2–6.3."

## Previous findings

- R01 — repaired: 6.3 states local coherence of `Sheaf (coherentTopology C) (Type u)` for `[Precoherent C]`, `[HasPullbacks C]` and `[HasEqualizers C]`, with the equalizer step for the diagonal (lines 851–861, `*Needs:*` at 862); 6.4 keeps the headline at `[Precoherent C] [HasPullbacks C]` and proves it by the slice route with `*Needs:* 3.1, 6.2, 6.3` (lines 877–891). The route is checked below; the Dependencies paragraph it leaves behind is R02 of this report.
- R02 — repaired: "`yoneda.obj c` is not a sheaf there (its value at `d` is `∅`), so the topology is not subcanonical, while `ℓ d = yoneda.obj d`" (lines 491–493).
- R03 — repaired: "not full, since `(Bool, PUnit)` and `(Bool, Bool)` have 8 maps between them and their images `Bool` and `Bool × Bool` have 16" (lines 531–532).
- R04 — repaired: `exists_of_isCocontinuous` carries `[G.IsCocontinuous J K]` alone (`Suggested.lean` line 262); it elaborates (the instance is found by search), and its elaborated type has no Kan-extension binder.
- R05 — partly repaired: Isbell 1981 Theorem 2 is now described as the general statement, "applied to the dense copies `ℚ` and `ℚ + √2` of `ℝ`" (lines 1124–1125, 1186–1189), which matches isbell1981 line 62–68; the Isbell 1972 locator "2.3 (3), p. 18" names the wrong item, R01 above. The previous report proposed that item number from the garbled OCR; the rendered page shows the statement is the remark before 2.4 and the proof of 2.4.
- R06 — repaired: 8.1 chooses a small full subcategory of `E` closed under finite limits containing a generating family and the image of the `J`-filtering functor, presents `E` by it with the canonical topology (1.4), and only then forms the pushout (lines 1021–1026).

## Verified sound

**Gate, build, direction.** Worker's gate at 460a8d2: all checks 0, OK. `lake env lean TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` from the worktree: exit 0, 27 `declaration uses sorry` (lines 95–535), nothing else. Dependency check with `--movable` against the merge order:

```
depcheck: 232 roadmaps, 2107 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the merge order lists GrothendieckTopoi at line 379, after its only roadmap supplier AdicSpacesPartII, which is on main.

**The changed Lean statement.** `GeometricMorphism.exists_of_isCocontinuous` (`Suggested.lean` 262–265): elaborated type `∀ {C D : Type u_1} [SmallCategory C] [SmallCategory D] {J} {K} (G : C ⥤ D) [G.IsCocontinuous J K], ∃ f, Nonempty (f.direct ≅ G.sheafPushforwardCocontinuous (Type u_1) J K)`, which is 2.4's statement (README 387–390). Mathlib's `Functor.sheafPushforwardCocontinuous` (`Mathlib/CategoryTheory/Sites/CoverLifting.lean` 271, 288) takes `[∀ F, G.op.HasPointwiseRightKanExtension F]` as a section variable; for small categories and `Type u` it is found by instance search, so deleting the binder changes nothing mathematically. One-tactic probe on a scratch copy (`first | infer_instance | simp | rfl | trivial | exact ⟨_, ⟨Iso.refl _⟩⟩`): fails (the witness `f` cannot be synthesised), so the statement is not padding. The other 26 sorried theorems are untouched since the previous probe (all failed then).

**Library declarations opened at the pin.** `coherentTopology.subcanonical` (`Mathlib/CategoryTheory/Sites/Coherent/CoherentSheaves.lean` 67: the coherent topology on a precoherent category is subcanonical, so `ℓ t (s) = (s ⟶ t)` and the 6.3 Check's subsheaf is literally `{h : s → t | f h = g h}`); `flat_of_preservesFiniteLimits` (`Mathlib/CategoryTheory/Functor/Flat.lean` 158: a left exact functor out of a category with finite limits is representably flat, which is what makes 8.1's "the functor is a morphism of sites" true in 2.4's sense once `C_S` is a site with finite limits, as the next sentence of 8.1 assumes); `Functor.sheafPushforwardCocontinuous` and its section variable (`CoverLifting.lean` 271–288); `CategoryTheory.Limits.HasEqualizers` (the new hypothesis of 6.3 is a Mathlib class).

**Seeded sample, where it falls in the diff.** 2.4: the binder deletion, above. 3.3: the second Check recomputed (table). 8.1: the presentation sentence (table). The other twelve sampled targets are untouched since 9bf309d and were verified in the previous report.

**Sources read in the cache.** isbell1972 line 523–532 (the list 2.3 (1)–(8)), 538–548 (the `ℚ × ℚ` remark and 2.4 with its proof; the scan's page 14 is printed p. 18, rendered to an image to read the lines the OCR garbles), 565–571 (proof of 2.3 (3) on p. 19). isbell1981 line 53–54 (Theorem 1), 62–68 (Theorem 2 and its proof; "rational", "√2" do not occur).

**Ownership against open work.** The sibling checkouts opened since the previous review (#1793–#1816) contain no new roadmap folder mentioning geometric morphisms, Grothendieck topoi, frame coproducts or core-compact spaces; the hits in those checkouts are copies of roadmaps on main (AdicSpacesPartII, AdicSpacesPartIII, AdicEtaleGeometry, EnhancedDerivedSheaves, SchemeAndStackFoundations), already accounted for. The diff introduces no new object.

**Adversarial pass.** Rows for the changed statements carry computed values; the untouched statements carry the previous report's rows (PRREVIEW-GrothendieckTopoi~6, table rows 1–45), each re-cited.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 Check 3 (`Discrete {c, d}`, empty sieve covers `d`) | `yoneda.obj c`; `yoneda.obj d` | sheaf condition for the empty cover of `d`: `F d` a singleton; `(yoneda.obj c).obj d = (d ⟶ c) = ∅`, not a singleton, so not a sheaf and the topology is not subcanonical; `(yoneda.obj d).obj d = (d ⟶ d)` one element, `(yoneda.obj d).obj c = (c ⟶ d) = ∅`, a sheaf, equal to `ℓ d`, initial | Check now true | none (R02 of r6 repaired) |
| 3.3 Check 2 (direct image of the étale morphism of `Bool`) | `(Bool, PUnit) → (Bool, Bool)` | adjunction `Hom((S, S), (A, B)) = Hom(S, A) × Hom(S, B) = Hom(S, A × B)`, so the direct image is `(A, B) ↦ A × B`; `|Hom((Bool, PUnit), (Bool, Bool))| = 4 · 2 = 8`; `|Hom(Bool × PUnit, Bool × Bool)| = 4² = 16`; `8 < 16` | not full, as the Check says | none (R03 of r6 repaired) |
| 6.3 diagonal step with `[HasEqualizers C]` | parallel pair `f, g : t ⇉ c`; quasicompact `Y → ℓ c × ℓ c`; `C = Discrete (Fin 2)` | pullback of `Δ : ℓ c → ℓ c × ℓ c` along `(ℓ f, ℓ g)` is `Eq(ℓ f, ℓ g)`; `ℓ = sheafify ∘ yoneda` preserves finite limits, so it is `ℓ (eq(f, g))`, quasicompact; a quasicompact `Y` is a quotient of `∐ ℓ t_i`, the pullback over `∐ ℓ t_i` is `∐ ℓ (eq_i)` and maps epimorphically onto the pullback over `Y`; `Discrete (Fin 2)`: identity cospans and pairs give pullbacks and equalizers, no terminal object, effective-epi families are nonempty families of identities, precoherent; sheaves `Type u × Type u`, `ℓ 0 = (PUnit, ∅)`, diagonal an isomorphism; the topos is even coherent (`(PUnit, PUnit)` covered by `ℓ 0, ℓ 1`) although `C` has no terminal object | route sound; "coherent when `C` has a terminal object" is a sufficient condition, as written | none (R01 of r6 repaired) |
| 6.4 slice route for `hasEnoughPoints_coherentTopology` | `Over c` finite limits; conservativity; `C` empty; `C = Discrete (Fin 2)` | terminal `𝟙 c`; product of `d → c`, `e → c` is `d ×_c e`; equalizer of `f, g` is `d ×_{e ×_c e} e` along `Δ_e`, in `Type u` with `c = PUnit` the set `{x ∈ d ∣ f x = g x}`; if `φ × ℓ c` is an iso for all `c`, every `x : ℓ c → B` lifts uniquely through `(x, 𝟙)`, so `Hom(ℓ c, φ)` is bijective, which is `φ_c` bijective by Yoneda (subcanonical), so `φ` is an iso; family `Σ (c : C), ι_c` is `u`-small; `C` empty: degenerate topos, empty family; `Discrete (Fin 2)`: two slices, one point each, `(A, B) → (A', B')` iso iff both components are | route sound; the `*Needs:*` line lists 3.1, the layer paragraph does not | R02 |
| 6.3 new Check (fibre of the diagonal over `ℓ t`) | `f, g : t ⇉ c` in a subcanonical site | `Eq(ℓ f, ℓ g)(s) = {h ∈ (s ⟶ t) ∣ f h = g h}` since `coherentTopology.subcanonical` makes `ℓ t = yoneda.obj t` | true; a remark on the hypothesis rather than a computed test, acceptable beside the three other Checks | none |
| 8.1 presentation step | `E = Type u`, `S = Sheaf (Discrete {c, d})`, `A c = PUnit`, `A d = ∅` (2.5 Check 1) | `A` is `J`-filtering and not representably flat into any `E'` (`StructuredArrow ∅ A ≅ Discrete {c, d}`); so "morphism of sites" in 2.4's sense (`RepresentablyFlat`) needs `C_S` with finite limits, which the next sentence imposes via 1.4, and then left exactness gives flatness (`flat_of_preservesFiniteLimits`); the closure of a generating family and `im A` under finite limits in `E` is small (countably many closure steps) | sound under the stated finite-limit form | none (R06 of r6 repaired) |
| 8.5 locators | isbell1981 line 62–68; isbell1972 p. 18 | Theorem 2: two subspaces of a Hausdorff space, no common point, nonempty locale intersection, non-spatial product; `ℚ`, `ℚ + √2`: disjoint, dense, meet contains the smallest dense sublocale of `ℝ`; Isbell 1972: 2.3 (3) is a Hausdorff-locale statement, the `ℚ × ℚ` statement is the remark before 2.4 and the proof of 2.4 | Isbell 1981 right, Isbell 1972 item wrong | R01 |
| `exists_of_isCocontinuous` | `G = Over.forget c` (2.4 Check 3) | as in r6 row 14: not flat, cocontinuous, direct image `sheafPushforwardCocontinuous`; now with the Kan-extension instance inferred | elaborates; probe fails | none (R04 of r6 repaired) |
| `IsGrothendieckTopos`, 1.2 structure, `wellPowered_op`, 1.3, Giraud axioms, `GeometricMorphism` and 2.1–2.3, `ofContinuous`, `IsFiltering`, Diaconescu, Grothendieck-group example, slices, `exists_etale`, `Subtopos`, closure operators, 4.3–4.5, Layer 5, 6.1–6.2, `Frame.grothendieckTopology`, 7.2–7.4, `IsFrameCoproduct`, `WayBelow`, `CoreCompactSpace`, `quasiSober_pi/prod`, `isFrameCoproduct_opens_prod`, `not_isFrameCoproduct_opens_rat_prod`, universes | as in r6 rows 1–45 | untouched by the diff; values in the previous report | unchanged | none |

**Headline theorems against the pins.** Unchanged since 9bf309d: all the README's end theorems that are statable are stated, and 1.3, 4.4, 5.2, 6.3, 8.1 and the topos-level 8.5 are named in the module docstring with their missing carriers. 6.3's new hypothesis `[HasEqualizers C]` affects no Lean statement (6.3 is not stated; 6.4's headline keeps `[Precoherent C] [HasPullbacks C]`, which the README's slice route proves).

**Declared gaps.** None declared (no readable `design/plan.json`); the README states none.

## Not verifiable

- Mac Lane–Moerdijk IX.11 (Deligne's theorem for coherent topoi, the form 6.4's slice route invokes: a site with finite limits and a topology generated by finite covering families) and SGA 4 VI §9: paywalled, no legal copy; the route was checked against the standard statement.
- Elephant B3.4 (the pushout of sites in 8.1): paywalled.
- The other items of the previous report's list (SGA 4 III, IV, VI; Elephant A4, B1.4, C1–C3; Mac Lane–Moerdijk III, V, VII, IX; Stone Spaces II, VII.4; Gierz et al.; Picado–Pultr; Godement; Joyal–Tierney; Moerdijk–Vermeulen) are untouched by the diff.
- isbell1972 is an image-only scan read through OCR; for p. 18 I rendered the page to an image and read it, so the locator finding does not rest on the garbled lines.

## Source issues

- **Gap** in isbell1972 at proof of 2.4, printed page 18: the source says the open part `ℚ` of `αℚ` has a non-spatial square "by the preceding remarks"; those remarks treat two disjoint dense subspaces, so the step needs a disjoint dense homeomorphic copy of `ℚ` (such as `ℚ + √2`); affects the proof.
