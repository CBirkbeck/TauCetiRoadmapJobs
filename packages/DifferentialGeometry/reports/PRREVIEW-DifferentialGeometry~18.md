# Review of DifferentialGeometry (pull request #886 at 473c4df)

**Verdict:** needs changes

This is an incremental re-review of the 142 lines changed since `af91579`: the 2.4 rewrite (README 48–58, 253–255, 321–340, 929–1013) and the hypotheses and docstring of `orientable_of_forall_index_ne_two` (`Suggested.lean:760–770`).

- **Repaired:** the previous R02. 2.4 now names, bullet by bullet, what Tau Ceti proves at main's pin and plans only the three things it does not (triviality of the cover, commutation of the averaging operators with `d`, the orientation of `Sⁿ` with its antipodal sign). Every cited declaration exists where it is cited, with the hypotheses stated. The three new targets and their Checks are correct; the values are in the table.
- **Not repaired:** the previous R01 (the branch's Tau Ceti pin lags main's, and `Suggested.lean` conflicts with main) and R03 (the description names no order against #334 and #1187). R01 is the only blocking finding.
- **New:** none.

The gate passes. `Suggested.lean` elaborates with `sorry` as its only warning. The dependency check reports 0 problems.

## R01 (P2) — Written against Tau Ceti `358314d4`; main pins `2fd255d9`, which proves much of this file, and `Suggested.lean` conflicts with main

Re-raised: H01 (and H02). The board has no newer repair report. The reason given was that merging main is outside a repair job's files. That says who has to act; it does not make the folder mergeable, and this round widens the gap rather than closing it.

**Location.**

- `lake-manifest.json` still pins Tau Ceti `358314d4`, with Lean `v4.35.0-rc3`. Main (`1bea835`) pins `2fd255d9`, with Lean `v4.36.0-rc2`.
- README 48, 253–255, 321–325, 336–340, 935–937, 957–959 and 992 compare the two revisions ("at the Tau Ceti revision the content repository pins", "which lacks the cover", "at the content repository's pin"); `Suggested.lean:50–55` and `:764–767` do the same.
- `Suggested.lean:768–770` now states, with the same binders, the theorem that `Orientation/Cover/FundamentalGroup.lean:41` proves at `2fd255d9`; its docstring says so.

**Claim.** Everything in r15–r17 R01 still holds: 22 of the 60 admissions are proved sorry-free at `2fd255d9`, and the carriers `flowOf`, `mgradient`, `laplaceBeltrami`, `fullSimplex`, `Orientation`, `OrientationLift`, `IntegralManifold` and `integralTopForm` are native there. The π₁ admission is now a declared duplicate: its docstring names the Tau Ceti proof, and `Orientable` at `Suggested.lean:635–636` has the same body as the field of `TauCeti.Orientable` at `Orientation/Basic.lean:263–265`.

**Witness.** `git merge-tree --write-tree HEAD origin/main` lists `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` at stages 1, 2 and 3 with "CONFLICT (content)". At `2fd255d9`, `FundamentalGroup.lean:41–46` proves `TauCeti.Manifold.orientable_of_forall_index_ne_two [ConnectedSpace M] (x : M) (hπ : ∀ G : Subgroup (FundamentalGroup M x), G.index ≠ 2) : Orientable I M` with 0 `sorry`.

**Repair.** As r15 R01 steps 1–7 with r16's and r17's additions. In this round's terms:

1. Merge main (or rebase on it); take none of main's sorry'd definitions when resolving `Suggested.lean`.
2. Delete `orientable_of_forall_index_ne_two` (`Suggested.lean:760–770`) and the other 21 admissions that `2fd255d9` proves; cite them in the README.
3. Replace every revision comparison listed above with a plain *From Tau Ceti* citation; drop the 2.4 clause of the docstring (`Suggested.lean:50–55`).

The finding is repaired when `git merge-tree` reports no conflict and the targeted build passes at `2fd255d9`.

## R02 (P3) — Two other open pull requests change this folder, and the description states no order

Re-raised: H06, the last known id (r16 R06, r17 R03). The reason given before was that the description is outside the job's files. It still fails, because the worker or the author can edit the description.

**Location.** The pull-request description (data). It contains neither `334` nor `1187` (0 matches).

**Claim.** Both pull requests conflict with this head and the description does not say which merges first: #334 replaces this folder; #1187 bumps Tau Ceti to `ab00ba392`, an ancestor of main's `2fd255d9`.

**Witness.** The overlap report at this head: "#334 and #886 conflict in `…/README.md`, `…/Suggested.lean`" and "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, … `lake-manifest.json`".

**Repair.** Add one sentence to the description, not to the README:

> This head supersedes #334; for this folder #1187 is subsumed by main's Tau Ceti pin, and its conflict disappears once this branch merges main.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`; `git merge-tree HEAD origin/main` still conflicts in `Suggested.lean`; README 48, 321–325 and 957–959 keep both revisions. Re-raised as R01.
- R02 — repaired: README 935–972 now list the cover, its charts, canonical orientation, deck diffeomorphism, the two equivalences, the π₁ criterion, the averaging operators and the descent criterion by name; README 974–982 keep only triviality, `d`-commutation and `Sⁿ`; the *Needs:* line (990–995) points at `TauCeti.Manifold.orientable_of_forall_index_ne_two`; README 48–58 add 2.4 to the scope paragraph. The admitted theorem stays, which its repair step 4 placed under R01.
- R03 — not repaired: the description still contains neither `334` nor `1187` (0 matches). Re-raised as R02.

## Verified sound

**Gate.** My rerun of `gate … DifferentialGeometry --base origin/main` reports every scanner at `0` and `OK` (`set_option`, `tex`, `prnum`, `sorry-data`, `imports`, `statement-hygiene`, `readme-ids-missing`, `depcheck`, `stray-files`, `outside-folder` all `0`). The worker's run, which includes the targeted build, reports every check passed. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DifferentialGeometry'` is empty.

**Dependency check** (`--movable`):

    depcheck: 235 roadmaps, 2261 edges, 0 problem(s)

It prints no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` from the worktree exits 0 in 40 s with 60 `declaration uses 'sorry'` warnings and no other diagnostic.

**Signatures and padding.** The only touched declaration is `orientable_of_forall_index_ne_two` (`Suggested.lean:768–770`): it lost `[T2Space M]` and `[LocallyPathConnectedSpace M]` and keeps `[IsManifold I 1 M] [ConnectedSpace M] (x : M)` with the section's `[FiniteDimensional ℝ E]`, binder for binder the signature of `FundamentalGroup.lean:41–42` at `2fd255d9`. The other 120 declarations are the ones r15 checked with `#check @…`; r15's one-tactic probe still applies to the 59 untouched admissions, and the touched one does not close by `infer_instance`, `simp` or `exact` at `358314d4` (0 files there mention `OrientationCover` or `orientable_of_forall_index_ne_two`).

**Library declarations opened for the changed passages (24), all at Tau Ceti `2fd255d9`, none in a file containing `sorry`.**

- `Orientation/Cover/Basic.lean`: `OrientationCover` (`:55`, an `abbrev` for the bundle cover of the tangent bundle, "topology read in the trivializations" per the module header `:14–17`); `isCoveringMap_proj` (`:63`); `orientable_iff_exists_section` (`:71`); `orientable_iff_not_connectedSpace` (`:79`, `[ConnectedSpace M]`). Section variables `:60`: `[FiniteDimensional ℝ E] [IsManifold I 1 M]`.
- `Orientation/Cover/Smooth.lean`: charts by `chartedSpaceComap` (`:46–47`); `isLocalDiffeomorph_proj` (`:71`); `canonicalOrientation` (`:108`); `map_orientationAt_canonicalOrientation` (`:127`, the derivative of the projection carries the canonical orientation to `p.orientation`); `deckDiffeomorph (n : ℕ∞ω)` (`:149`); `isOrientationReversingAt_deck` (`:170`).
- `Topology/VectorBundle/Orientation/Cover.lean`: `deck` (`:164`, a homeomorphism); `deck_ne_self` (`:216`, no hypothesis); `eq_or_eq_deck` (`:320`, under `Fintype.card ι = finrank ℝ F`, satisfied by `Fin (finrank ℝ E)`).
- `Orientation/Cover/FundamentalGroup.lean`: `orientable_of_forall_index_ne_two` (`:41`, `[ConnectedSpace M]` only); local path-connectedness from `I.locallyPathConnectedSpace` and `ChartedSpace.locallyPathConnectedSpace` (`:43–44`; `Geometry/Manifold/Topology.lean:36`), which is the docstring's "comes from the charts".
- `DifferentialForm/Involution.lean`: `invariantPart` (`:42`, `(2 : ℝ)⁻¹ • (φ + mpullback I I τ φ)`); `antiInvariantPart` (`:48`); `invariantPart_add_antiInvariantPart` (`:123`, any `τ`); `mpullback_invariantPart` and `mpullback_antiInvariantPart` (`:184`, `:193`, `Involutive τ` and `MDifferentiable I I τ`); `isCompact_tsupport_invariantPart` and `…_antiInvariantPart` (`:234`, `:245`, `IsProperMap τ` and compact `tsupport φ`).
- `Orientation/Cover/Descent.lean`: `exists_mpullback_proj_eq_iff` (`:68`); `exists_mpullback_proj_eq_invariantPart` (`:79`); `exists_smoothForm_mpullback_proj_eq_iff` (`:91`, `[IsManifold I ∞ M]`, the README's "on a smooth `M`").
- `Orientation/Basic.lean:263–265`: `class Orientable` with field `Nonempty (Manifold.Orientation I M (Fin (Module.finrank ℝ E)))`, the body of the roadmap's own `Orientable` (`Suggested.lean:635–636`).
- Absent at `2fd255d9`: a lemma relating `mextDeriv` to `invariantPart` (0 hits); a homeomorphism `M × Fin 2 ≃ₜ OrientationCover` (0 hits for `Fin 2` in the cover modules); an outward orientation of the unit sphere or its antipodal sign (0 hits in `Orientation/`; `Instances/Sphere.lean:236` only covers the sphere by two antipodal complements). So the three remaining targets of 2.4 are not in the library.
- At `358314d4`: `Topology/VectorBundle/Orientation/Cover.lean`, `DifferentialForm/Involution.lean`, `Orientation/Cover/Basic.lean` and `Geometry/Manifold/Topology.lean` are all absent (`git cat-file -e`), as the "postdate" clause of README 322–323 says.
- Mathlib (`Geometry/Manifold/Instances/Sphere.lean`): `contMDiff_coe_sphere` (`:422`), `range_mvfderiv_subtypeVal` (`:486`), `injective_mvfderiv_subtypeVal_sphere` (`:527`), the three names the unchanged `Sⁿ` sentence consumes.

**Cross-roadmap citations of the changed passages.**

- 2.2's Check (README 906) states that the antipodal map of `S¹` preserves and that of `S²` reverses the orientation; the new 2.4 Check (README 1007–1009) gives signs `+1` and `−1` for `n = 1, 2`, in agreement.
- 0.3 (README 532) is rough forms and pullback, 1.1 (README 657–660) has `mextDeriv_add` for `C¹` forms, 1.2 (README 675) is naturality for a `C²` map and a `C¹` form: exactly what the new *Needs:* line (991–993) asks for the commutation with `d`.
- 9.2 (README 2154–2161) consumes `Orientation/Cover/Descent.lean` and 2.4; the sentence "This is what 9.2 … consumes" (README 971–972) matches.
- DeRhamCohomologyAndDuality (#2085) has 0 hits for descent, averaging, deck or the double cover; it restates none of 2.4. RicciFlow (#1023) cites 2.4 by id only; the id is kept.

**Overlaps.** §5.5 is still mapped to 5.5a and 5.5b at README 37–39. No open pull request drops an id this README cites, and no id it cites is defined only by an open revision. The two conflicting pull requests are R02.

**Ownership.** 2.4's three remaining targets have no owner at `2fd255d9` (above), on main or at the heads of the closest open roadmaps (#2085, #1807/#1854/#1808, #992). Ownership against open pull requests without a path was not checked.

**Seeded sample (8 targets).** All eight lie outside this round's hunks: README 386 ("Smooth 2-forms"), 1123, 1273 and 1846, 1630, 1761, 1866, 1881. Their text is unchanged since `b5e32fc`, so r15's verification stands; "Smooth 2-forms" is still out of date at main's pin, which is part of R01. The README flags no locator as unverified (0 matches).

**Headline theorems** (README 13–18, docstring 19–42) are unchanged. The π₁ headline is the one rewritten statement; it is R01.

**Adversarial table.** Rows marked r15, r16 or r17 are carried from those reports for statements this diff leaves untouched. The other rows were computed in this review.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Triviality ↔ orientable, no connectedness (README 974–979) | `∅`; a point; `S¹`; open Möbius `B`; `ℝP²`; `S¹ ⊔ S¹`; `S¹ ⊔ B` | components of the cover: `0`, `2`, `2`, `1` (annulus), `1` (`S²`), `4`, `3`; section: yes, yes, yes, no, no, yes, no; trivial: yes, yes, yes, no, no, yes, no; orientable: yes, yes, yes, no, no, yes, no | section ↔ trivial ↔ orientable on all seven; disconnected ≠ orientable on `S¹ ⊔ B` | none |
| Route of the triviality (README 976–979) | fibre; openness | fibre `{p, deck p}`: `eq_or_eq_deck` (`Cover.lean:320`), `deck p ≠ p` (`:216`); `s(V) = sheet ∩ proj⁻¹(V)` for `V = s⁻¹(sheet)` open, so `s(M)` and `deck(s(M))` are open and disjoint | the sketch's inputs exist at the pin | none |
| `d` commutes with the averaging operators (README 979–982) | `τ ≡ c` on `ℝ`, `f` a `C¹` function; `τ = id`; regularity | `d((f + f(c))/2) = df/2`; `(df + τ^*df)/2 = (df + 0)/2 = df/2` since `dτ = 0`. `τ = id`: both sides `dφ`. `τ` `C²`, `φ` `C¹` ⇒ `τ^*φ` `C¹`, so 1.2's naturality (README 675) and 1.1's `mextDeriv_add` apply | holds for any `C²` self-map; involutivity unused | none |
| Antipodal sign `(−1)^(n+1)` (README 1006–1013) | `n = 0, 1, 2`; the three conventions at `x = (1, 0)` | `det(−x) = −det(x)` (sign `−1`, swaps `±1`); `det(−x, −b) = det(x, b)` (sign `+1`); `(−1)³ = −1`. Outward-first: `det((1,0),(0,1)) = 1`; normal-last: `det((0,1),(1,0)) = −1`; inward-first on `S⁰`: `det(−x) > 0 ⇔ x = −1` | matches 2.2's Check (README 906) | none |
| Component counts of the first Check (README 997–1001) | `S¹ ⊔ S¹`; `S¹ ⊔ B` | cover of `S¹` ≅ `S¹ × Fin 2` (2 components) so `2 + 2 = 4`; cover of `B` connected by `orientable_iff_not_connectedSpace` (`B` connected, not orientable) so `2 + 1 = 3` | holds | none |
| π₁ criterion, Lean vs Tau Ceti (`Suggested.lean:768–770`) | binder comparison; `S²`; `ℝP²`; `S¹`; the plane with two origins | binders equal to `FundamentalGroup.lean:41–42` (`[IsManifold I 1 M] [ConnectedSpace M] (x) (∀ K, K.index ≠ 2)`), `Orientable` bodies equal. `S²`: trivial π₁, orientable. `ℝP²`: `{1}` has index 2. `S¹`: `2ℤ` has index 2, yet orientable. Plane with two origins: non-Hausdorff, simply connected, oriented atlas `{id, id}` | true, sufficient only, no separation needed | R01 (duplicate at main's pin) |
| Docstring route (`Suggested.lean:760–767`) | connected cover | a connected 2-sheeted cover of a connected, locally path-connected space gives a transitive π₁-action on a 2-point fibre, stabiliser of index 2 (Hatcher 1.32, cited at `FundamentalGroup.lean:25`) | holds | none |
| Scope paragraph (README 48–58) | 9 listed items vs the pin | each item has a declaration above; the 3 remaining items have none | holds | none |
| Module list (README 331–336) | the 2 added paths at both revisions | `Topology/VectorBundle/Orientation/Cover.lean`, `DifferentialForm/Involution.lean`: absent at `358314d4`, present at `2fd255d9` | holds | none |
| Compact support and descent hypotheses (README 960–972) | `IsProperMap τ`; `IsManifold I ∞ M` | `Involution.lean:234/245` take `IsProperMap τ` and compact `tsupport φ`; `Descent.lean:91` takes `[IsManifold I ∞ M]` | prose states both | none |
| *From Tau Ceti* covering bullet (README 253–255) | Tau Ceti's proof route | `Topology/VectorBundle/Orientation/Cover/FundamentalGroup.lean` imports `Topology/Homotopy/Monodromy/Basic`, not `UniversalCover/`; the sentence makes a mathematical claim (the criterion is the two-sheeted case), which is true | holds | none |
| r17: 2.3 chart formula (README 909–913) | Lean probe; `exp(i·)`; `exp(i·³)`; `id` | `chartAt H x y = chartAt H (p x) (p y)`; chart reads `t + c`; `t³ + c` (`1.1 ↦ 1.331 + c`); chart of `M` | prose matches Lean | none |
| r17: 2.3 "into" (README 909) | `(0,1) ↪ ℝ` | no surjectivity binder in `Comap.lean` | holds | none |
| r17: 2.3 uniqueness at main's pin (README 254–255, 921–924) | both revisions | `358314d4`: 0; `2fd255d9`: `Comap.lean:194` | holds | none |
| r17: `exp(i t³)` refutation (README 2447–2451) | derivative; pulled-back chart | `|p'(0)| = 0`, `|p'(1)| = 3`, `|p'(2)| = 12`; in the pulled-back chart `p` reads `u ↦ u` | true | none |
| r17: Lie-groups name map (README 926–928) | main `:1048`; probe | `IsCoveringMap.inducedChartedSpace H hp : ChartedSpace H X`; replacement elaborates | holds | none |
| r17: 2.4 section equivalence | `S¹`; Möbius; `∅`; point | recomputed above (row 1) | holds | none |
| r17: 2.4 connected equivalence | `S¹`, `ℝP²`, `S¹ ⊔ B` | `2`, `1`, `3` components; orientable yes, no, no | `[ConnectedSpace M]` needed and present | none |
| r17: AT sentence (README 342–344) | 11 paths | 3 absent at `358314d4`, 8 at both | holds | none |
| r17: de Rham bullet paths (README 326–337) | 43 paths | all absent at `358314d4`, present at `2fd255d9` | holds | none |
| r17: docstring 2.4 clause (`Suggested.lean:50–55`) | both revisions | `358314d4`: 0 `OrientationCover`; `2fd255d9`: `Basic.lean:71`, `:79` | true at each revision | R01 |
| r16: 2.3 smooth-lift criterion, `p = exp(i t³)`, `f = ∛` | `t = 2`; quotients at `0` | `(∛2)³ = 2.000000`; `∛h/h = 100.0` at `10⁻³`, `10000.0` at `10⁻⁶` | incompatible structures | none |
| r16: Mathlib covering-base bullet | both declarations | both chart the base | true | none |
| r15: `exists_isSliceChart_integralManifold` | `span e₁`; irrational leaf; rank 0 | slice elaborates; dense leaf in no line; `{e x}` | true | none |
| r15: `isCompleteVectorField_of_compactSpace`, `toFlow_apply` | branch vs main | native `Flow/Complete.lean:154` | padding after the merge | R01 |
| r15: headlines vs main's pin | 60 admissions | 22 proved at `2fd255d9` | stale pin | R01 |
| r15: 5.5b facet signs on `Q²` | outward-first | `det(−e₀,e₁) = −1`, `det(−e₁,e₀) = +1` | `(−1)^(i+1)` | none |
| r15: 5.5b product signs on `[0,1]²` | `ω = y dx` | `∫dω = −1.0`; top edge `−1.0` | holds | none |
| r15: 5.5b fibres | `Q²` at `(0,t)`, `(t,0)`, `(0,0)` | `1, 1, 2` | holds | none |
| r15: 5.1 half-space sign | chart `x ↦ (0,x)` | `det(−e₀,e₁,…) = −1` | consistent | none |
| r15: 12.4 volume Checks | `diag(4,1)`; `X = x∂ₓ+y∂ᵧ` | `√det g = 2.0`; `div = 2` | holds | none |
| r15: 12.3 `hessian`, `mgradient` | `e^{2x}δ`; `diag(4,1)` | `Γ²₂₁ = 1`; `grad x₁ = ¼∂₁` | holds | none |
| r15: `integral_divergence_eq_boundaryFlux` | `[0,∞)`, `X = e^{−t}∂ₜ`; `X = 1` | `−1.000000` both sides; `X = 1` fails `hSupport` | holds | none |
| r15: punctured family | `α = 0.7`; circle | curl `0.7478685`; `6.283185` | closed iff `α = 1` | none |
| r15: ellipse, HK gate, weak field | `a = 2, b = ½`; `t² sin t⁻²`; `|x−½|` | `3.141593`; `0.841471`; `1.0` | holds | none |
| r15: `green_verticalCell` | unit square, `P = y` | `−1 = −1` | holds | none |
| r15: contact adapter | `S(x,y,z) = (y,x,z)` | `S^*(dz − x dy) = dz − y dx` | matches | none |
| r15: `Density`, `m < dim` | `dim 3`, `m = 2` | `(2³ − 2²)·toFun v = 0` | forced to zero | none |
| r15: local flow, global law | `v = x²` at `0` | `x/(1−tx)` extends | true | none |
| r15: `timeDependentFlowDomain_eq_univ` | `(0,1)∪(2,3)` | excluded by `OrdConnected` | holds | none |
| r15: hairy ball | `n = 0, 1, 2` | `ix` nowhere zero on `S¹`; zeros at the poles of `S²` | parity needed | none |
| r15: 8.3 corner route | `[0,∞)`, `x₀ = 1` | `−ε ∉ range I` | needs a time cutoff | none |

**Remarks on untouched text** (not findings): README 821–827 give the three names `Manifold.Orientation.pullbackSign`, `continuous_pullbackSign` and `pullbackSign_mul_pullbackSign` in backticks; none is declared in `Suggested.lean` or at either Tau Ceti revision (the citation leads). They predate this round and passed r15; after the merge of R01 they are the natural place to decide whether the pin's `Orientation/Pullback.lean` carries them. The ⚠ glyphs at README 923 and 930 also predate this round.

## Not verifiable

- [Lee] GTM 218, [Tu] GTM 275, [Bott–Tu] GTM 82 and [Milnor]: no legal open copy (the earlier fetch of Lee was `uncertified`). The one locator in the changed lines, [Lee, Thm. 15.41–15.43] at README 935, is unchanged text; the equivalences it is cited for agree with Tau Ceti's statements at `2fd255d9`, whose module headers cite the same chapter.

## Source issues

- none
