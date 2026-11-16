# Review of MatesDoubleCategories (pull request #2299 at 5823e4f)

**Verdict:** needs changes

## R01 (P3) — M1.4's finite-ordinal duality does not cite Mathlib's `SimplexCategory.II`

**Location:** `TauCetiRoadmap/MatesDoubleCategories/README.md` lines 276–281 and 318–321: "Prove the finite-ordinal duality `Δ₊ᵒᵖ ≅ Δ_∂`. … Prove the inverse, functoriality, and endpoint laws." … "finite-ordinal dualities … are targets here."

**Claim:** On nonempty ordinals the map on cuts, its functoriality and its endpoint laws already exist at the pin, with the same convention; the supplier contracts (lines 545–549) do not list them, so the target re-plans them.

**Witness:** Pinned `Mathlib/AlgebraicTopology/SimplicialObject/II.lean` line 226: `SimplexCategory.II`, `⦋n⦌ ↦ op ⦋n+1⦌`, `II.map' f x = min {i | x ≤ f i} = #{i | f i < x}`; lines 106, 111, 116, 122: `map'_last`, `map'_zero`, `map'_id`, `map'_map'`.

**Repair:** Add to "From Mathlib": "`Mathlib/AlgebraicTopology/SimplicialObject/II.lean` supplies `SimplexCategory.II : SimplexCategory ⥤ SimplexCategoryᵒᵖ` with the cut formula `II.map'`, its functoriality and `map'_zero`, `map'_last`." In M1.4 replace the two sentences by: "On nonempty ordinals the map on cuts is Mathlib's `SimplexCategory.II.map'`. Targets here: its factorisation through `Δ_∂` (by `map'_zero`, `map'_last`), the extension to the empty ordinal (sent to `[0]`), and the inverse functor." Add `SimplexCategory.II` to the M1.4 `*Needs:*` line.

## R02 (P3) — a proved `example` that tests no kept definition remains in Suggested.lean

**Location:** `TauCetiRoadmap/MatesDoubleCategories/Suggested.lean` lines 169–180: `example … : (S ≫ F₂.l ⟶ F₁.l ≫ T) ≃ (F₁.r ≫ S ⟶ T ≫ F₂.r) := Bicategory.mateEquiv F₁.adj F₂.adj`.

**Claim:** The previous R05 is partly repaired (the four definitions and two examples are gone). The remaining `example` is one library term, mentions no declaration of this file, and mirrors the README convention at lines 79–84.

**Witness:** Line 178 is `Bicategory.mateEquiv F₁.adj F₂.adj`; pinned `Mathlib/CategoryTheory/Bicategory/Adjunction/Mate.lean` line 146: `mateEquiv : (g ≫ l₂ ⟶ l₁ ≫ h) ≃ (r₁ ≫ g ⟶ h ≫ r₂)`.

**Repair:** Delete lines 169–180 from `Suggested.lean` and pin the declaration instead: `-- The library equivalence fixing the L ≃ R direction of the README conventions.` then `#check @CategoryTheory.Bicategory.mateEquiv`. A copy with this change elaborates with `sorry` (line 164) as its only warning.

## R03 (P3) — the module docstring does not name M1.4's theorems among those not statable

**Location:** `TauCetiRoadmap/MatesDoubleCategories/Suggested.lean` lines 17–26: "The following headline signatures require infrastructure specified in README.md but not constructed in this prototype: * M2.3's … * M3.3's … * M4's …".

**Claim:** README M1.4 adds two named theorems (the universal property, lines 257–264, and the "Hom-category theorem", lines 283–301). Neither is stated in the file and neither is listed with the carrier it lacks.

**Witness:** `grep -n 'M1.4\|alking' Suggested.lean`: no hit. The path 2-category of the walking adjunction is a quotient construction (README lines 250–254) with no carrier at the pins.

**Repair:** Add a bullet to the list: "* M1.4's universal property of the walking adjunction and the identification of its four hom-categories with `Δ₊`, `Δ₊ᵒᵖ`, `Δ_top`, `Δ_bot` require the walking-adjunction path 2-category (a presentation by generators and relations, M1.3–M1.4) and the endpoint-preserving subcategories of the simplex category."

## R04 (P3) — README form: what the previous R03 still leaves open

**Location:** `TauCetiRoadmap/MatesDoubleCategories/README.md` lines 27, 107, 137, 186, 235, 248, 303, 365, 402, 441, 478, 516, 528.

**Claim:** The previous R03 is partly repaired (title, Summary, Scope, Conventions, supplier contracts, per-target Checks now exist). Remaining: (a) Checks are prose paragraphs, not one bullet per test; (b) M1.4, M2.1–M2.3, M3.1–M3.3 and M4 have no API bullet list ("API and checks" is one paragraph); (c) no layer ends with `### Examples` and `### Dependencies`; (d) `WalkingAdjunction` (line 248 and the table) is backticked as this roadmap's own name but `Suggested.lean` declares none; (e) "The pilot's development order" (line 27) is a process word, undefined.

**Witness:** `TauCetiRoadmap/Foams/README.md` on main, lines 729 and 734 (`### Examples`, `### Dependencies`). `grep -n WalkingAdjunction Suggested.lean`: no hit.

**Repair:** (a), (b) Split each "Checks" / "API and checks" paragraph into an `**API.**` bullet list (the exported facts) and a `**Checks.**` bullet list, one computed test per bullet; the sentences are already there. (c) End M1–M4 with `### Examples` (the quintet double category, `Cat`, the walking adjunction) and `### Dependencies` (the rows of the table at lines 32–44). (d) Write the walking adjunction without backticks (e.g. *WalkingAdjunction*, `(+,+)` hom-category "of the walking adjunction"). (e) Line 27: "The build order is M1 → M2 → M3 → M4."

## R05 (P3) — the pull-request description does not mention M1.4 or its sources

**Location:** Pull-request description, first paragraph: "The roadmap first develops the reusable structures and tests their comparison with ordinary strict double categories; it specifies the path-evaluation, adjunction, coherence, and strictness prerequisites."

**Claim:** The head also plans the Schanuel–Street walking adjunction: its universal property and the four simplex hom-categories (README M1.3–M1.4), with two further sources (references 4 and 5) and Mathlib's simplex categories as a new supplier. The description names none of this.

**Witness:** README lines 246–324 and 545–552; headings added: "M1.3 — Implicit 2-categories and adjunctions", "M1.4 — The Schanuel–Street walking adjunction".

**Repair:** Add: "M1 also defines implicit 2-categories with their adjunctions and constructs the Schanuel–Street walking adjunction, with its universal property and the identification of its four hom-categories with `Δ₊`, `Δ₊ᵒᵖ` and the top- and bottom-preserving subcategories of `Δ` (Schanuel–Street; Riehl–Verity §3.3), on Mathlib's `SimplexCategory` and `AugmentedSimplexCategory`."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| M1.1 API and Checks (`StrictDoubleCategory`) | types of `interchange`, `hId_vComp`, `vId_hComp`, `id_id` | interchange: both `Cell (p≫q) (x≫y) (l≫l') (n≫n')`; `id_id`: both `Cell 𝟙 𝟙 𝟙 𝟙`; `hId_vComp`: both `Cell 𝟙 𝟙 (f≫g) (f≫g)` up to `𝟙≫𝟙` | matches README lines 114–117, 137–139 | none |
| M1.2 API and Checks; `representable_of_representation` | `nil`, `[f]`, `p.cons g`; one object, empty quivers | `nil ≅ [hUnit]`; `p.cons g`: `hComp iso (vId [g])` then `hMulIso`; empty quivers: no `hUnit a`, `Representable` false, no `Representation` | true; `simp`, `rfl`, `infer_instance`, `aesop`, one-term `exact` all fail | none |
| M1.3 API and Checks (implicit 2-categories, adjunctions) | empty vertical quiver; unit/counit types | cells `(p,q,[],[])`; full `Representation` needs `vUnit a : V a a`, empty; `[] ≫ … = []`, unit `[] ⟶ [f,g]`, counit `[g,f] ⟶ []` typecheck in the path category | consistent with FairbanksShulman lines 515–554 | none |
| M1.4 Simplex categories and conventions | `n=0`; `α : Fin n →o Fin m`, `j=0`, `j=m` | `∅ ↦ [0]`; `j=0 ↦ 0`, `j=m ↦ n`: both endpoints kept; formula equals `II.map'` (min of `{i | j ≤ α i}`); top-preserving `α` has left adjoint fixing `0` | correct; same convention as Mathlib | R01 |
| M1.4 universal property (headline) | RiehlVerity lines 1161–1169 | `f : + → −`, `η : id₊ ⇒ uf`, `ε : fu ⇒ id₋`; README `η : []₊ ⟶ [f,g]`, `ε : [g,f] ⟶ []₋` (diagrammatic) | agrees; unique 2-functor as stated | R03 |
| M1.4 Hom-category theorem (headline) and Checks | paths `g`, `gfg`, `gfgfg`; `g ◁ η`, `η ▷ f`; `(fg) → (fg)²` | `(-,+)`: `g↦[0]`, `gfg↦[1]`; 2-cells `gfg → gfgfg`: 3 = top-preserving maps `[1]→[2]`; `g◁η`: `0↦1`; `η▷f`: `0↦0`; two faces `[0]→[1]`; `2³ = 8` compositions | agrees with RiehlVerity lines 1252–1256, 1292–1296 | R03, R04 |
| M2.3 comparison (headline) | extraction∘expansion on a square; expansion∘extraction on `[f,g] ≅ [f⋆g]` | squares: `D.Cell (𝟙≫f) …` = `D.Cell f …` after `composePath_toPath`; chosen comparison ↦ `μ⁻¹ ≫ μ = id`; unit law needs unitor `= eqToIso`, in the hypothesis | isomorphisms as stated; not statable at the pins | none |
| M3.1 API and checks | `[]`, `[f]`, `[f,g]`, `[f,g,h]`; `[f]++[g,h]`; `[]++p`, `p++[]` | `𝟙`, `f`, `f≫g`, `(f≫g)≫h`; comparison `(f≫g)≫h ≅ f≫(g≫h)` = associator; `(λ_)⁻¹`, `(ρ_)⁻¹`; `[f]→[g]` is `f ⟶ g` | correct | none |
| M3.2 API and checks | vertical globular `F→F'`; `hId` on `F`; binary composite | `L`: `𝟙≫F'.l ⟶ F.l≫𝟙`; `Hom₂ F' F`: `τl : F'.l ⟶ F.l`, `τr : F.r ⟶ F'.r`; `conjugateEquiv F.adj F'.adj : (F'.l ⟶ F.l) ≃ (F.r ⟶ F'.r)`; identity `λ ≫ ρ⁻¹` / `ρ ≫ λ⁻¹`; `f₁≫f₂ ⊣ g₂≫g₁` | correct at the pins | none |
| M3.3 double isomorphism (headline) | singleton boundary; identity square; shared-edge pasting | `mateEquiv : (g≫l₂ ⟶ l₁≫h) ≃ (r₁≫g ⟶ h≫r₂)` = `L ≃ R`; `mateEquiv adj adj (λ ≫ ρ⁻¹) = ρ ≫ λ⁻¹` (Mate.lean 453); `mateEquiv_vcomp` shares `l₂` = this roadmap's horizontal pasting | orientation correct; not statable at the pins | R02 |
| M4 API and checks (headline) | `(F≫G)≫H` vs `F≫(G≫H)`; `Cat` | `l` equal by `Strict.assoc`, `r`: `r_H≫(r_G≫r_F)` vs `(r_H≫r_G)≫r_F`; units differ by `eqToHom`; `toNatTrans_mateEquiv` at `Adjunction/Cat.lean` 83; ChengGurskiRiehl lines 266–297 | consistent | none |

- Previous findings: R01 repaired (M1.3, lines 197–244); R02 repaired (`import Mathlib`, gate `imports=0`); R03 partly (R04 here); R04 repaired (per-target `*Needs:*` lines, table lines 32–44); R05 partly (R02 here); R06 repaired (title, three not-statable bullets, names at README lines 111–161).
- Source locators checked against the text: 20 (FairbanksShulman Definitions 2.1, 2.3, 3.1–3.3, 3.12, Remark 3.5, Propositions 2.5, 2.7, 2.9, 3.13, Corollaries 2.10, 3.14, Example 3.10; ChengGurskiRiehl Definition 1.1, Theorem 1.2; Schanuel–Street pp. 81–83; Riehl–Verity 3.3.4, 3.3.6, 3.3.8 in arXiv:1310.8279v4).
- Library declarations opened at the pins: `Bicategory/Adjunction/Mate.lean` 146, 214, 272, 360, 394, 425, 453; `Adj.lean` 63, 83, 179; `Adjunction/Basic.lean` 106, 161; `Adjunction/Cat.lean` 83; `Functor/StrictPseudofunctor.lean` 43; `SimplexCategory/Augmented/Basic.lean` 33; `Augmented/Monoidal.lean` 53, 125; `SimplicialObject/II.lean` 73, 106, 111, 226; `Widesubcategory.lean`, `PathCategory/Basic.lean`, `Bicategory/Coherence.lean`, `Strict/Basic.lean` and `TauCeti/CategoryTheory/Adjunction/Mates.lean` exist.
- No double category, walking adjunction or implicit-category declaration exists in the pinned Mathlib or Tau Ceti; no roadmap on main or open plans one or declares one of this file's names.
- Cross-roadmap citations: none in the README; the resolver reports none missing; no change outside the folder.
- Dependency check: `depcheck: 264 roadmaps, 2577 edges, 0 problem(s)`.
- Gate at 5823e4f: every check 0, targeted build passes. Elaboration: one warning (`sorry`, line 164); the 12 elaborated signatures compared with the README, none lost a binder.
- Pull-request text read against the head: pins (`v4.36.0-rc2`, Mathlib `1b1ccf4`) and "single `sorry`" hold; R05 is the one omission.

Overlap check: read HomotopyTheoryOfCategories, Foams (the third list is empty); nothing shared.

Source independence: 9 passages compared with 4 sources, none shared; largest share FairbanksShulman, 16 of 23 locators; contents compared with FairbanksShulman: independent (M1.2 ↔ §3, M1.3 ↔ §2, M2 ↔ 3.12–3.14, M3 ↔ 2.5 and 3.10; M1.4 and M4 rest on other sources; M4's place is forced by its `*Needs:* M2 and M3`). KellyStreet could not be read.

## Not verifiable

- Kelly–Street, Proposition 2.2, pp. 86–87, and the description of its diagrams (2.4)–(2.5) (README lines 87, 605–607): recorded as uncertified, text not read.
- Published page numbers of Riehl–Verity (README line 618: pp. 827–831): the linked author copy answered HTTP 403; arXiv v4 has the three items on its pp. 24–27, with the same item numbers.
- Journal page 346 for Cheng–Gurski–Riehl, Definition 1.1 and Theorem 1.2: only the arXiv text was readable (its pp. 6–7); the item numbers agree.
- Schanuel–Street's displayed composition formula (p. 82): the displays are missing from the text extracted from the Numdam scan; the composition conventions were checked against Riehl–Verity, Remark 3.3.8, only.

## Source issues

- **Misprint** in FairbanksShulman at Proposition 2.5, arXiv v2 p. 10: the source says the 2-cells of the clique live in a bicategory called B; it should be the bicategory C of the statement; affects nothing.
- **Misprint** in FairbanksShulman at Definition 3.12, arXiv v2 p. 16: the source says the third horizontal arrow h goes from A to B; it should be h from C to D, so that the triple composite exists; affects nothing.
- **Gap** in FairbanksShulman at Example 3.10, arXiv v2 p. 15: the source says the two adjunction double categories and their isomorphism exist for an implicit 2-category "in the same way", without proof; it should verify the pasting and representability axioms; affects a stated result.

## For the human reviewers

- Scope: the headline of M3 (README lines 468–469) rests on FairbanksShulman Example 3.10 (lines 878–882), an example stated without proof in a 2026 article; the strict case is Kelly–Street 1974.
- Not tested: Kelly–Street's text was not read; the convention comparison at README line 87 is unchecked.
- Licence: README line 569 names Geb's `GebLean/Utilities/DoubleCategory.lean` (GPL-3.0 per line 576). Its first 100,000 characters were compared: none of this file's 12 declaration names occurs there; the remainder was not read.
- Policy: README line 14 and `Suggested.lean` lines 10–11 call the Lean file suggested forms and a prototype, as the repository `README.md` ("Prototyping") does; R02 and R03 apply the acceptance-test rule instead.
