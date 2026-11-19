# GATE-VirtualFundamentalClassPartII~1: answers to the review of eb79a83

One review (kim-em, 2026-11-19T00:53:54Z) with eight requested changes; request 1 makes two points
(the gap paragraph and the pull-request description), so there are nine findings. The repairs are
commit `c5f07fa8` on the pull-request branch (not pushed). Line numbers below are those of
`TauCetiRoadmap/VirtualFundamentalClassPartII/README.md` at that commit.

## H01 (kim-em) — applied

VirtualFundamentalClass §1.5 on main does form the normal cone of a local immersion from smooth charts, with base change, flat base change and the normal bundle of a regular local immersion. So every `gap:normal-cones-of-local-immersions` (Convention 2, 3.5, 4.2, 8.1, 8.3, the Layer 3, 4 and 8 Dependencies, Scope) now cites VirtualFundamentalClass §1.5, the "What VirtualFundamentalClass must provide (gap:normal-cones-…)" paragraph is deleted, and the §§1.4–1.6 contract bullet (line 2423) lists what §1.5 now provides. 8.1's last sentence changed from "extends §1.5's deformation from representable closed immersions to local immersions" to "assembles into a stack over `G × ℙ¹` the deformation charts of a local immersion … which VirtualFundamentalClass §1.5 constructs" (line 1554), since §1.5 now builds those charts and their comparisons.

## H02 (kim-em) — answered

The pull-request description is not part of the roadmap folder, so this job cannot edit it: VirtualFundamentalClass (#1996, `a62b5c09`) and StackPointsAndResidualGerbes (#2429, `c421e904`) are both on main, and the description's merge-order paragraph should say so. Neither is an open dependency any more; the depcheck below reports no problem.

## H03 (kim-em) — applied

New §1.0 "Integral closed substacks and their images" (line 220), owned here: an integral closed substack is a reduced closed substack with irreducible space; `𝒱 ↦ |𝒱|` is a bijection onto irreducible closed subsets (by the uniqueness in StackPointsAndResidualGerbes §0.5), with finitely many components; and for proper `f`, `f(𝒱)` is the integral closed substack on the closed irreducible set `|f|(|𝒱|)` (universal closedness, SchemeAndStackFoundations §1.20), reached by a proper surjection `𝒱 → f(𝒱)`. It has three Checks (`Bμ₂` against `[V(x²)/μ₂]`, the coarse map of `[𝔸¹/μ₂]`, and `𝔾_m → 𝔸¹`). Every `gap:closed-substacks-of-stacks` (1.3, 2.1, 3.2, 3.3, 4.1, 5.2 and the layer Dependencies) now cites 1.0, the gap paragraph in the VirtualFundamentalClass contract is deleted, the Layer 1 title, the build guide and Scope name it, and no `gap:` id remains in the README.

## H04 (kim-em) — applied

§5.4 (line 1172) now defines *zeroCycleDegree* `deg_ℳ : Z_0(ℳ)_ℚ → ℚ`, `[𝒢_x] ↦ [κ(x) : k]/|Aut(x̄)|`, on every stack, and proves three things: the `𝒢_x` are exactly the integral closed substacks of dimension 0; `deg_𝒩 ∘ f_* = deg_ℳ` for proper `f`, by 1.3's `deg(𝒢_x/𝒢_y) = (|Aut(ȳ)|/|Aut(x̄)|)·[κ(x) : κ(y)]`; and for proper `ℳ`, `deg_ℳ` vanishes on `∂W_0(ℳ)` and induces `∫_ℳ`, as `ℳ → Spec k` is a case of the previous statement. The closed formula `∫_ℳ[𝒢_x] = [κ(x) : k]/|Aut(x̄)|` is now a consequence. Added: an API bullet saying that on schemes `deg_X` is Mathlib's `AlgebraicGeometry.AlgebraicCycle.degree`, which exists at the pin, and a Check that `deg_ℳ` does not descend on `𝔸¹` or `[𝔸¹/μ₂]`, where `div(t)` and `div(y)` both have degree `1`.

## H05 (kim-em) — applied differently

The Tau Ceti pin is `2fd255d`, and its `TauCeti/AlgebraicGeometry/Chow/` has only `Basic.lean` and `ClosedImmersion.lean`. `Chow.cyclesMap`, `Chow.cyclesDegree` and `Chow.cyclesRestrict` are not there, so the README cannot cite them until the pin moves. The `Suggested.lean` docstring now says "no proper pushforward of Chow groups in general" and adds that the pinned Mathlib has `AlgebraicGeometry.AlgebraicCycle.map`, pushforward of cycles with prescribed weights. That is accurate at the pin and stays accurate after the move.

## H06 (kim-em) — applied differently

§2.3's third bullet (line 551) now names the comparison, `[𝒱] ⊗ 1 ↦ [𝒱]`. VirtualFundamentalClass §2.1 builds Vistoli's rational group, which vistoli1989 (3.4) (p. 634, line 961) defines as the integral group of (3.1)–(3.4) tensored with `ℚ`, on the generators and relations of 2.1–2.2 here. So the map is the identity of `Z_i ⊗ ℚ` modulo `∂W_i ⊗ ℚ`, and the two constructions give one group. The requested sentence ("VirtualFundamentalClass §2.1's group is to be implemented as `stackChowGroup ⊗ ℚ`") is not added. It would make the supplier VirtualFundamentalClass, which is on main, depend on its consumer, which is later in the merge order and itself needs VirtualFundamentalClass §§0.2 and 1.5. Whether that roadmap adopts this carrier is a decision for its own README.

## H07 (kim-em) — answered

This roadmap keeps ownership; the README needs no change. VirtualFundamentalClassPartII is in the merge order (line 346), while AlgebraicGromovWittenTheory (#1998, head `fcd2977`) is not. Layer 9 states the obstruction theory for every base of pure dimension and every smooth target, and 9.1 already shows that the characteristic-0 stack of stable maps is a relative space of maps. AlgebraicGromovWittenTheory §4.1, which builds `(Rπ_* f^*T_X)^∨ → L_{MbarMap/Mpre}` itself, is the case `𝔅` = prestable-curve stack, `X` smooth projective. The split proposed in the review (that roadmap proves `MbarMap → Mpre` is a relative space of maps by 9.1 and imports 9.2–9.5) is what this README's Downstream consumers (line 2238) and Scope already say. Making the two READMEs agree is a change to #1998 for its author, which this job cannot make.

## H08 (kim-em) — applied

The `Suggested.lean` docstring now opens with the standard note from the repository README: "**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`." It replaces "The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: …". The rest is unchanged: it still states that the file gives the headline theorems against the pins, and lists each one that is not statable with what it lacks.

## H09 (kim-em) — applied

Every line citation of vistoli1989 (77) and behrend-fantechi1997 (36) now carries its page, and so does every line citation of kresch1999b, behrend1997, li-tian1998, rydh2015, deligne-mumford1969, keel-mori1997 and edidin-graham1998: 175 insertions in all, for example "(3.6)(iii), lines 985–987" → "(3.6)(iii), p. 635, lines 985–987". The pages are journal pages for Vistoli (scan page `N` is Invent. Math. 97 page `N + 611`, checked against the printed headers 613, 614, 621, 633, 651, 669, 670) and for Deligne–Mumford (`N + 73`, checked against printed 76 and 93). For the arXiv preprints they are the page of the version read; printed and PDF pages agree in each. References (line 2560) states this rule and the versions read (kresch1999b v2, behrend1997 v1, li-tian1998 v6, keel-mori1997 v1). Stacks Project citations keep their numbered results and lines.

## Build and gate

- `lake build TauCetiRoadmap.VirtualFundamentalClassPartII.Suggested`: `✔ [18238/18239] Built TauCetiRoadmap.VirtualFundamentalClassPartII.Suggested (2.1s)`, `Build completed successfully (18239 jobs).`
- Gate (after the commit): `gate VirtualFundamentalClassPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable --pr 2446`): `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The tool does not check Lean names outside TauCetiRoadmap, so the two new Mathlib names were checked by hand at the pin `1b1ccf4`: `AlgebraicGeometry.AlgebraicCycle.degree` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:95`, `@[stacks 0AZ2]`, `∑ᶠ x, f.residueDegree x • D x`, needs `[CompactSpace X]`) and `AlgebraicGeometry.Scheme.Hom.residueDegree` (`Mathlib/AlgebraicGeometry/ResidueField.lean:147`, `Module.finrank`, so `0` for an infinite extension).
- Elaborated signatures: `Suggested.lean` declares nothing (one docstring and an empty namespace), so the `#check @name` scratch file has nothing to elaborate and nothing changed. The docstring's backticked names (`CategoryTheory.Pseudofunctor.IsStack`, `TauCeti.AlgebraicGeometry.SchPseudofunctor`, `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace`, `TauCeti.AlgebraicGeometry.Chow.ChowGroup`, `AlgebraicGeometry.AlgebraicCycle.map`) all appear in the README.

## Ownership and citations checked

- Integral closed substacks (H03). There is no earlier owner:
  - SchemeAndStackFoundations on main stops at `Stacks.points`, `UniversallyClosedStack` and `IsProperStack` (§1.20).
  - VirtualFundamentalClass §2.1 on main uses integral closed substacks without defining them.
  - StackPointsAndResidualGerbes on main (Scope and Downstream consumers) says that "VirtualFundamentalClasses" builds integral closed substacks and cycles. That roadmap is at line 435 of the merge order, later than this one (346); it is neither an open pull request nor a readable board package, so it was not read. Being later, it would cite 1.0 here.
  - `roadmaps grep 'integral closed substack'` over main and the 355 open heads finds only MotivicStructuresInModuliOfCurves (#2437, which uses the term under its own gap id). SchemeAndStackFoundationsPartII (#2272) and StableReductionPartII (#1841) do not define integral closed substacks.
  - The open SchemeAndStackFoundations revisions #2489 and #2531 revise a roadmap on main, so they cannot be suppliers.
- Zero-cycle degree (H04): no roadmap on main or at an open head states a degree of zero-cycles on stacks. The grep `zero-cycles? (on|of) … stack | degree of zero-cycles on … stack` found no match. VirtualFundamentalClass §2.1 owns the degree on `A_0` of a proper separated stack, which 5.4 imports and does not redefine. Mathlib's scheme-level `AlgebraicCycle.degree` is cited, not restated.
- VirtualFundamentalClass §1.5 (H01) was read on main (`890b66d`, README lines 409–440), and the contract bullet was rewritten from that text.
- AlgebraicGromovWittenTheory (H07) was read at its head through `roadmaps show` (§§4.1–4.3, Scope; it cites VirtualFundamentalClass §§3.3, 6.1, 7.3, 9.2 and not this roadmap).
- No citation of another roadmap was added beyond VirtualFundamentalClass §§0.2 and 1.5, which are already suppliers. No notion moved down from a later roadmap.

## Adversarial pass on the statements changed or added

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.0 bijection `𝒱 ↦ \|𝒱\|` | `∅`; `BG`; `[𝔸¹/μ₂]` at `0`; line `L` with doubled origin | `∅`: no integral substack, no irreducible subset. `BG`: 1 ↔ 1 point. `[𝔸¹/μ₂]`: `{0}` ↔ `Bμ₂` only; `[V(x²)/μ₂]` has the same support and is not reduced. `L`: `{0₁}`, `{0₂}` ↔ two distinct substacks, no separatedness used | holds | Check added for `Bμ₂` against `[V(x²)/μ₂]` |
| 1.0 finitely many components | `𝒵` of finite type | `\|𝒵\|` = continuous image of the Noetherian `\|U\|` of an affine atlas of finite type, hence Noetherian | holds | none |
| 1.0 image `f(𝒱)` for proper `f` | `id`; `BG → Spec k`; coarse map `p : [𝔸¹/μ₂] → 𝔸¹`; non-proper `𝔾_m → 𝔸¹` | `id`: `𝒱`. `BG`: image `Spec k`. `p(Bμ₂) = V(y)`, and the factorisation has degree `(1/2)·[k:k] = 1/2` (1.3). `𝔾_m → 𝔸¹`: image not closed | holds; properness needed | Checks added (coarse map, `𝔾_m → 𝔸¹`) |
| 2.3 comparison `[𝒱]⊗1 ↦ [𝒱]` | `BG`; `[𝔸¹/μ₂]`; `Spec k` | `A_0(BG) ⊗ ℚ = ℤ ⊗ ℚ = ℚ`, matching VirtualFundamentalClass `A_0(BG)_ℚ = ℚ`. `A_0([𝔸¹/μ₂]) ⊗ ℚ = ℤ/2 ⊗ ℚ = 0`, matching `div(y) = 2[Bμ₂]` rationally. `ℤ ⊗ ℚ = ℚ` | holds (right exactness of `⊗ℚ`; vistoli1989 (3.4) line 961) | wording only |
| 5.4 dimension-0 integral substacks = `𝒢_x`, `κ(x)` finite | `Spec K` (`K/k` finite); gerbe `[Spec ℂ/(ℤ/4)]` over `ℝ`; `BG`; closed point of `𝔸¹` | `Spec K`: one point, `κ = K`, `[K:k] < ∞`. Gerbe: one point, `κ = ℝ`. `BG`: `κ = k`. `𝔸¹` at `P(t)`: `κ = k[t]/P`, finite; its atlas is itself, of dimension 0 | holds | route sketch states both directions |
| 5.4 `deg_𝒩 ∘ f_* = deg_ℳ` (proper `f`) | `BG → Spec k`; coarse `[ℙ¹/μ₂] → ℙ¹` at `𝒫`; char-`p` quotient `𝔸¹_y × B(ℤ/p) → Spec k[y^p]` at `y = a`; `Spec ℂ → Spec ℝ` | `f_*[BG] = (1/\|G\|)[pt]` gives `1/\|G\| = [k:k]/\|G\|`. `[ℙ¹/μ₂]`: `f_*[𝒫] = (1/2)[0]` gives `1/2 = 1/2`. Char `p`: `(1/p)·[k:k]·1 = 1/p = [k:k]/p`. `Spec ℂ → Spec ℝ`: `f_*[pt] = 2[pt]` gives `2 = [ℂ:ℝ]` | holds | none |
| 5.4 descent for proper `ℳ` | `[ℙ¹/μ₂]`, `div(t²/(t²−1)) = 2[𝒫] − [𝒪]`; non-proper `𝔸¹`, `[𝔸¹/μ₂]` | `2·(1/2) − 1·1 = 0`. `𝔸¹`: `deg div(t) = deg[0] = 1 ≠ 0`. `[𝔸¹/μ₂]`: `deg div(y) = 2·(1/2) = 1 ≠ 0` | holds for proper; fails otherwise, as stated | negative Check added |
| 5.4 agreement with Mathlib `AlgebraicCycle.degree` | `X = ℙ¹_ℝ`, closed point `t² + 1` | Mathlib: `residueDegree = [ℂ:ℝ] = 2`. Here: `[κ:ℝ]/1 = 2` | holds (`CompactSpace X` from quasi-compactness) | API bullet added |
| Convention 2 / 3.5 / 4.2 / 8.1 citing VirtualFundamentalClass §1.5 | `Spec k → BC₂` (§1.5's own Check: rank-0 cone, regular, not a closed immersion); diagonal `BG → BG×BG` | §1.5 covers local immersions, base change, flat base change and the regular normal bundle. The diagonal is a local immersion, and its cone is computed on the chart `U = V = G` (rank 0) | holds | citations repointed |
| 8.1 "assembles … deformation charts" | §1.5 text: "Construct the deformation charts and their comparisons used in specialization"; API: "For a local immersion use the open deformation charts" | §1.5 gives charts and comparisons; 8.1 forms the quotient of the groupoid `M°_R S ⇉ M°_U V` | consistent, no duplication | sentence rewritten |
| `Suggested.lean` docstring claims | pin `2fd255d`: `Chow/` has `Basic.lean`, `ClosedImmersion.lean`; Mathlib `AlgebraicCycle.map` at `Basic.lean:69` | proper pushforward of Chow groups is absent; a cycle pushforward with weights is present | holds after rewording | reworded |
| Page locators | Vistoli scan pages 2, 3, 10, 22, 40, 58, 59 → printed 613, 614, 621, 633, 651, 669, 670; DM pages 3, 20 → 76, 93; arXiv PDFs: printed equals PDF page on pp. 3 and 7 of each | offsets `+611`, `+73`, `+0` | consistent | 175 insertions; a second run of the insertion inserts 0 |

## Sources

No new source was fetched. Every locator added uses the cached texts of the sources already recorded (vistoli1989, behrend-fantechi1997, kresch1999b, behrend1997, li-tian1998, keel-mori1997, edidin-graham1998, deligne-mumford1969, rydh2015). No `needs-references.toml` was written.

## Untrusted text

The review contains no instruction to run commands, contact services or change how the job works. Its requests were treated as claims and checked above.
