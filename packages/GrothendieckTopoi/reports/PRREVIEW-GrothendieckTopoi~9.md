# Review of GrothendieckTopoi (pull request #1520 at bb8d302)

**Verdict:** accepted

Incremental re-review of the 11 lines changed since 460a8d2 (all in `TauCetiRoadmap/GrothendieckTopoi/README.md`: the Isbell 1972 locator at 8.5 and in the references, and the Layer 6 Dependencies paragraph), which are exactly the two repairs the previous report asked for. The head merges main, so the pins moved to Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (the pull request's `lake-manifest.json` now equals main's); the unchanged `Suggested.lean` was re-elaborated and the README's library citations re-resolved at the new pin. The pull request changes nothing outside the folder (the three-dot diff against `origin/main` outside the folder is empty; `origin/main` is an ancestor of the head). No finding remains.

## Previous findings

- R01 — repaired: "Isbell 1972, the remark before 2.4 and the proof of 2.4, p. 18" at `README.md` line 1124 and "the remark before 2.4 and the proof of 2.4, p. 18, the square of `ℚ`" at lines 1184–1185; checked against the rendered page (below).
- R02 — repaired: "Layers 1–4, AdicSpacesPartII R0.19.10, and Mathlib. Within the layer, 6.2 uses 6.1 and 6.4 uses 3.1 and 6.2–6.3." (`README.md` lines 911–912); the `*Needs:*` lines of 6.1–6.4 cite 2.2, 2.5, 4.3, 1.1 and 3.1 from other layers, so Layers 1–4 exactly, and 6.2 uses 6.1, 6.4 uses 6.2–6.3.

## Verified sound

**Gate, build, direction.** Worker's gate at bb8d302: every check 0, OK (`build=0`, `depcheck=0`, `sorry-data=0`, `readme-ids-missing=0`, `outside-folder=0`). My own `lake env lean TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` from the worktree, at the new pins (`.lake/packages/mathlib` at `1b1ccf4b`, `.lake/packages/TauCeti` at `2fd255d9`): exit 0, 27 `declaration uses sorry` warnings (lines 95–535), nothing else. Dependency check with `--movable` against the merge order:

```
depcheck: 240 roadmaps, 2350 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; GrothendieckTopoi is at line 383 of the merge order, after its only roadmap supplier AdicSpacesPartII, which is on main.

**The repaired locator (8.5, references).** The cached OCR of isbell1972 is garbled at exactly the lines that carry the item numbers (isbell1972 line 537, 543–544, 547), so I rendered page 14 of the scan (printed p. 18) to an image and read it. The page carries, in order: the list 2.3 (1)–(8) (isbell1972 line 523–532), the summary and (4′) (line 533–536), the remark "for (3) of 2.3 we shall need a space whose square in 𝓛ᵒᵖ is not a space" with the argument that for disjoint dense subspaces `X, Y` of a Hausdorff `Z` the product `X × Y` contains the smallest dense part of the diagonal, hence is not primal (line 537–542), then "Hence 2.4": the functor Top → 𝓛ᵒᵖ does not preserve squares of quasi-compact primal T₁-spaces (line 543–544), and its proof: the one-point quasi-compactification `αℚ` has the open part `ℚ` whose square, by the preceding remarks, is not a space (line 545–548). So "the remark before 2.4 and the proof of 2.4, p. 18" names the two passages that state the square of `ℚ` is not spatial, and the printed page is right. The reference entry says the same. Isbell 1981 Theorem 2 (isbell1981 line 62–68) is unchanged since the previous report and is still read as the general statement applied to `ℚ` and `ℚ + √2`.

**The repaired Dependencies paragraph (Layer 6).** `*Needs:*` lines read at this head: 6.1 (line 808) cites 2.2, 2.5; 6.2 (line 829) cites 4.3, 6.1; 6.3 (line 862) cites 1.1 and AdicSpacesPartII R0.19.10; 6.4 (line 890) cites 3.1, 6.2, 6.3. The union over other layers is {1.1, 2.2, 2.5, 3.1, 4.3}, which is Layers 1–4 and nothing from 5, 7 or 8; within the layer 6.2 → 6.1 and 6.4 → 6.2, 6.3, as the paragraph says.

**Library names at the new pin.** One scratch file with `#check @name` for every backticked dotted identifier in the README (101 names) and every backticked identifier of the `## Exact supplier contracts` section, elaborated with `lake env lean` at Mathlib `1b1ccf4b`: every library name resolves (`GrothendieckTopology.Point`, `Point.sheafFiber`, `Point.isCofiltered`, `Point.skyscraperSheafFunctor`, `GrothendieckTopology.HasEnoughPoints`, `Nucleus.toSublocale`, `Locale.PT`, `IsIrreducible.genericPoint`, `Pi.instT0Space`, `Prod.instT0Space`, `Functor.Elements`, `Action.functorCategoryEquivalence`, `Functor.SmallCategories.instPreservesFiniteLimitsSheafSheafPullbackOfRepresentablyFlat`, and the rest). The only identifiers that do not resolve are this roadmap's own names (declared in `Suggested.lean`; the gate's `readme-ids-missing=0` confirms each), dot-notation on bound variables (`G.op`, `J.over`, `e.functor`, `P.FullSubcategory`, `A.Elements`), and `PowerObject`, `IsPowerObjectOf` and `GrothendieckTopology.IsLocallyConnectedSite`, which the README's "Mathlib's open work" paragraph (lines 52–55) declares as names of open Mathlib work used by 1.3 and 5.2, settled in earlier rounds.

**Cross-roadmap citation.** AdicSpacesPartII R0.19.10 on main (`TauCetiRoadmap/AdicSpacesPartII/README.md` line 8005, "Quasicompact and quasiseparated objects; algebraic topoi") defines `Topos.IsQuasicompact`, `Topos.IsQuasiseparated`, `Topos.Hom.IsQuasicompact`, `Topos.Hom.IsQuasiseparated` and `Topos.IsAlgebraic` (lines 8028–8031), as the supplier contract (README lines 160–164) and 6.3's `*Needs:*` line cite. No other roadmap is cited as a supplier.

**Ownership against open work.** The sibling checkouts opened since the previous review (#1817–#1845) were searched for geometric morphisms, Grothendieck topoi, localic or hyperconnected morphisms, frame coproducts and core-compact spaces. Every hit is a copy of a roadmap on main (AdicEtaleGeometry, AdicSpacesPartII, AdicSpacesPartIII, EnhancedDerivedSheaves, SchemeAndStackFoundations), already accounted for, except one sentence each in DiamondsAndVStacksPartII (#1830, line 389: the inverse image of a geometric morphism between the κ- and λ-small perfectoid-scheme topoi) and AutomorphicBundlesPartII (#1823, line 416: transporting geometric morphisms through derived identifications), both of which use the notion and own nothing of it. `scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped by an open pull request, no cited id is defined only by an open revision; the closest roadmaps in vocabulary (DiamondsAndVStacks, DiamondEtaleCohomology, HomotopyTheoryOfCategories) own diamonds, étale cohomology of diamonds and model categories, not topoi.

**Lean file.** Unchanged since the previous report; the 51 elaborated signatures of `scratch/signatures.md` are the ones compared with the README in earlier rounds, and the 17 "dropped binder" leads were examined then (primed binders, structure-literal fields and `#check @id` artefacts). No one-tactic probe was rerun since no statement changed; the previous probes (all 27 sorried theorems fail one tactic) stand.

**Adversarial pass.** Rows with computed values for the two changed passages; the untouched statements carry the previous report's rows (PRREVIEW-GrothendieckTopoi~7, and through it ~6 rows 1–45), each re-cited.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 6 Dependencies paragraph ("Layers 1–4 … 6.4 uses 3.1 and 6.2–6.3") | the four `*Needs:*` lines of Layer 6 | 6.1: {2.2, 2.5}; 6.2: {4.3, 6.1}; 6.3: {1.1, AdicSpacesPartII R0.19.10}; 6.4: {3.1, 6.2, 6.3}; union outside the layer {1.1, 2.2, 2.5, 3.1, 4.3} ⊆ Layers 1–4, each of Layers 1, 2, 3, 4 hit; nothing from Layers 5, 7, 8; inside the layer 6.2 → 6.1, 6.4 → 6.2, 6.3 | paragraph equals the Needs lines | none (R02 of r7 repaired) |
| 8.5 Isbell 1972 locator ("the remark before 2.4 and the proof of 2.4, p. 18") | rendered scan page 14 = printed p. 18 | remark: `X, Y` disjoint dense in Hausdorff `Z` ⇒ `X × Y ⊂ Z × Z` contains the smallest dense part `D` of the diagonal, whose closure has no point of `X × Y`, so `X × Y` not primal; 2.4 proof: `αℚ` quasi-compact primal T₁, open part `ℚ`, square of `ℚ` not a space; both on p. 18; the item 2.3 (3) (p. 18) and its proof (p. 19, `ℚ × J`) no longer cited | locator exact | none (R01 of r7 repaired) |
| 8.5 `not_isFrameCoproduct_opens_rat_prod` (statement) | `S = T = ℚ` | as in r7 row 7 and r6: Isbell 1981 Theorem 2 with `ℚ`, `ℚ + √2` disjoint dense in `ℝ`, localic meet ⊇ smallest dense sublocale of `ℝ`, so the localic product is not spatial and `Opens ℚ ⊗ Opens ℚ → Opens (ℚ × ℚ)` is not injective | unchanged | none |
| 6.4 slice route, 6.3 diagonal step, 3.1 and 3.3 Checks, 8.1 presentation step, `exists_of_isCocontinuous` | as in r7 rows 1–6, 8 | values in the previous report | unchanged by the diff | none |
| `IsGrothendieckTopos`, 1.2 structure, `wellPowered_op`, 1.3, Giraud axioms, `GeometricMorphism` and 2.1–2.3, `ofContinuous`, `IsFiltering`, Diaconescu, Grothendieck-group example, slices, `exists_etale`, `Subtopos`, closure operators, 4.3–4.5, Layer 5, 6.1–6.2, `Frame.grothendieckTopology`, 7.2–7.4, `IsFrameCoproduct`, `WayBelow`, `CoreCompactSpace`, `quasiSober_pi/prod`, `isFrameCoproduct_opens_prod`, universes | as in r6 rows 1–45 | untouched by the diff; values in the previous reports | unchanged | none |

**Seeded sample.** Of the fifteen sampled targets, only 8.5 falls in the diff (its locator, above); the other fourteen (1.1, 1.2, 3.3, 4.5, 5.1, 5.3, 5.4, 5.5, 6.1, 6.2, 6.3, 7.2, 7.4, 8.4) are untouched since 9bf309d and were verified in the previous reports.

**Headline theorems against the pins.** Unchanged: every end theorem that is statable is stated, and 1.3, 4.4, 5.2, 6.3, 8.1 and the topos-level 8.5 are named in the module docstring with their missing carriers. The diff adds no Lean statement and changes no hypothesis.

**Declared gaps.** None declared (no readable `design/plan.json`); the README states none.

## Not verifiable

- Mac Lane–Moerdijk IX.11 and SGA 4 VI §9 (Deligne's theorem, the form 6.4's slice route invokes), Elephant B3.4 (pushout of sites, 8.1): paywalled, no legal copy; untouched by the diff.
- The other paywalled items of the previous reports' lists (SGA 4 III, IV, VI; Elephant A4, B1.4, C1–C3; Mac Lane–Moerdijk III, V, VII, IX; Stone Spaces II, VII.4; Gierz et al.; Picado–Pultr; Godement; Joyal–Tierney; Moerdijk–Vermeulen): untouched by the diff. Stone Spaces II 2.14, cited beside the repaired Isbell locator, is paywalled; the Isbell texts in the cache support the statement on their own.
- isbell1972 is an image-only scan read through OCR; p. 18 was rendered to an image and read directly, so the locator verdict does not rest on the garbled lines.

## Source issues

- **Gap** in isbell1972 at proof of 2.4, printed page 18: the source says the open part `ℚ` of `αℚ` has a non-spatial square "by the preceding remarks"; those remarks treat two disjoint dense subspaces, so the step needs a disjoint dense homeomorphic copy of `ℚ` (such as `ℚ + √2`); affects the proof.
