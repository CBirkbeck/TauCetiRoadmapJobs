# Review of MatesDoubleCategories (pull request #2299 at ac07d7d)

**Verdict:** needs changes

## R01 (P3) — the 2-cell dual needed to compare with `Bicategory.Adj` is a conditional target

**Location:** `TauCetiRoadmap/MatesDoubleCategories/README.md` lines 534–535: "If a packaged local-opposite construction is needed for that comparison, build its bicategory instance here."

**Claim:** The vertical globular bicategory of `L(K)` and `R(K)` is `Bicategory.Adj K` with its 2-cells reversed (lines 530–532). That identification cannot be stated without the 2-cell dual of a bicategory, which neither pin has; "if needed" leaves an implementer to guess whether it is in scope.

**Witness:** Pinned `Mathlib/CategoryTheory/Bicategory/Opposites.lean` lines 13, 29: only the 1-cell dual `Bᵒᵖ` is built; "Define the 2-cell dual" is a TODO. `Adj.lean` lines 85, 87: `Hom₂ α β` has `τl : α.l ⟶ β.l`, `τr : β.r ⟶ α.r`.

**Repair:** Replace the sentence by: "Define the 2-cell dual of a bicategory (same objects and 1-cells, each hom-category replaced by its opposite), with its `Bicategory` instance and the transfer of `Bicategory.Strict`; Mathlib's `Bicategory/Opposites.lean` supplies only the 1-cell dual. Identify the vertical globular bicategories of `L(K)` and `R(K)` with the 2-cell dual of `Bicategory.Adj K`." Add the 2-cell dual to M3.2's API list and to "From Mathlib" as absent at the pin.

## R02 (P3) — the mate of a horizontal globular cell has no formula, no Check and no owner

**Location:** `TauCetiRoadmap/MatesDoubleCategories/README.md` lines 578–580 and 597: "Additional unit/counit characterizations belong in the general bicategory API when needed for these boundary operations"; "Empty-boundary action agrees with the globular formulas of M3.2."

**Claim:** M3.2's Checks give formulas for vertical globular cells and identity squares only. Preserving the horizontal representation families (line 567) needs the mate under two identity adjunctions; it is not at the pin, and "when needed" does not make it a target.

**Witness:** Pinned `Mate.lean` has identity-adjunction lemmas only for `conjugateEquiv` (lines 439, 445) and composites (177, 186). Tau Ceti's `CategoryTheory.mateEquiv_adjunction_id` (`Adjunction/Mates.lean` line 69) is for ordinary categories.

**Repair:** Replace the sentence at 578–580 by: "Prove, for `σ : g ⟶ h` in `K`, that `Bicategory.mateEquiv (Adjunction.id a) (Adjunction.id b)` sends `(ρ_ g).hom ≫ σ ≫ (λ_ h).inv` to `(λ_ g).hom ≫ σ ≫ (ρ_ h).inv`: the bicategory counterpart of Tau Ceti's `mateEquiv_adjunction_id`." Add to M3.2's Checks: "A horizontal globular cell given by `σ : S ⟶ T` is `(ρ_ S).hom ≫ σ ≫ (λ_ T).inv` in `L` and `(λ_ S).hom ≫ σ ≫ (ρ_ T).inv` in `R`." Replace line 597 by: "The mate of the horizontal globular `L` cell of `σ` is the `R` cell of the same `σ`." The identity elaborates at the pins (`rw [mateEquiv_apply']`, `dsimp [Bicategory.Adjunction.id]`, `bicategory`).

## R03 (P3) — README form: M2.1 and M2.2 have no Checks; supplier contracts follow the layers

**Location:** `TauCetiRoadmap/MatesDoubleCategories/README.md` lines 377–416 (M2.1, M2.2: `**API.**` then `*Needs:*`) and line 690 (`## Exact supplier contracts`, after M4).

**Claim:** (a) Expansion and extraction are definitions with no `**Checks.**` list; their tests are pooled under M2.3, and the strictness hypothesis of M2.2 has no negative control. (b) The contracts section comes after the layers that consume it.

**Witness:** M1.1–M1.4, M3.1–M3.3 and M4 each carry `**Checks.**`; `grep -n 'Checks' README.md` has no hit in lines 377–416. `TauCetiRoadmap/Foams/README.md` on main: contracts at line 170, "How to read the build" at 301, Layer 0 at 312.

**Repair:** (a) Move the first two M2.3 Checks to M2.1 and add: "The chosen comparison `[f,g] ≅ [f ≫ g]` is the vertical identity cell of `f ≫ g` after the evaluation transport; `[]` and `[𝟙]` stay distinct paths." and "With generators restricted to non-identity arrows no generator represents `[]`." Under M2.2 add: "The extracted horizontal identity square on `f` is the path identity cell on `[f]` with both empty boundaries replaced by `[1]` through the nullary comparison."; "The extracted composite of squares with tops `f`, `g` has top `f ⋆ g`, from the pasted cell with top `[f,g]`."; "Without strictness the generators under `⋆` are not a category: for `L(K)` with `K` Mathlib's `FreeBicategory` on a quiver with a composable triple, `(f ⋆ g) ⋆ h ≠ f ⋆ (g ⋆ h)` as distinct terms of the inductive 1-cell type." (b) Move `## Exact supplier contracts` (lines 690–733) to between `## Conventions` and `## How to read the build`, and put `## Conventions` before `## How to read the build`.

## R04 (P3) — the pull-request description still omits M1.4, its sources and its supplier

**Location:** Pull-request description, first paragraph: "The roadmap first develops the reusable structures and tests their comparison with ordinary strict double categories; it specifies the path-evaluation, adjunction, coherence, and strictness prerequisites."

**Claim:** Not repaired since the previous review (its R05). The head plans the Schanuel–Street walking adjunction, its universal property and four simplex hom-categories (README M1.3–M1.4), with references 4 and 5 and Mathlib's simplex categories and `SimplexCategory.II` as suppliers.

**Witness:** README lines 254–357 and 707–721; headings "M1.3 — Implicit 2-categories and adjunctions" and "M1.4 — The Schanuel–Street walking adjunction". The description names neither.

**Repair:** Add: "M1 also defines implicit 2-categories with their adjunctions and constructs the Schanuel–Street walking adjunction, with its universal property and the identification of its four hom-categories with `Δ₊`, `Δ₊ᵒᵖ` and the top- and bottom-preserving subcategories of `Δ` (Schanuel–Street; Riehl–Verity §3.3), on Mathlib's `SimplexCategory`, `AugmentedSimplexCategory` and `SimplexCategory.II`."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| M1.1 API | interchange grid; `id_id`; `hId_vComp` | both sides `Cell (p≫q) (x≫y) (l≫l') (n≫n')`; both `Cell 𝟙 𝟙 𝟙 𝟙`; both `Cell 𝟙 𝟙 (f≫g) (f≫g)` | README lines 139–142 match `Suggested.lean` lines 96–107 | none |
| M1.2 API; `representable_of_representation` | `nil`, `p.cons g`; one object with empty quivers | `nil ≅ [hUnit a]`; `cons`: `hComp iso (vId [g])` then `hMulIso`, boundary `nil ≫ nil = nil`; empty quivers: `Cell := PUnit`, `¬ Representable` proved in a scratch copy | true; six one-tactic probes fail | none |
| M1.3 API | empty vertical quiver; unit, counit, triangles | cells `(p,q,[],[])`; `η : [] ⟶ [f,g]`, `ε : [g,f] ⟶ []`; `[f] → [f,g,f] → [f]`; full `Representation` needs `vUnit a`, empty | agrees with FairbanksShulman lines 515–554 | none |
| M1.4 API (walking adjunction, universal property) | RiehlVerity (3.3.3), 3.3.4; SchanuelStreet p. 83 | source `f : + → −`, `u : − → +`, `η : id₊ ⇒ uf`, `ε : fu ⇒ id₋`; README `η : []₊ ⟶ [f,g]`, `ε : [g,f] ⟶ []₋` diagrammatic | same data; unique 2-functor as stated | R04 |
| M1.4 Simplex categories and conventions | ordinals `∅, 1, 2`; `α : 1 → 2`; `j = 0, m` | `∅ ↦ [0]`; `#Hom(1,2) = 2 = #` endpoint maps `[2] → [1]`; `α(0)=0`: cuts `0,1,1`; `α(0)=1`: `0,0,1`; `j=0 ↦ 0`, `j=m ↦ n`; equals `II.map'` (min of `{i | j ≤ α i}`, last as sentinel) | correct; `II : [k] ↦ [k+1]ᵒᵖ` at `II.lean` 226 | none |
| M1.4 Hom-category theorem and Checks | `n = 0, 1`; `g ◁ η`, `η ▷ f`; `(fg) → (fg)²` | `(+,+)`: `[] ↦ ∅`, `fg ↦ [0]`; `(−,−)`: `[] ↦ [0]` in `Δ_∂`; `(−,+) = Δ_top`, `(+,−) = Δ_bot`; unique top map `[0]→[1]`: `0↦1`; unique bottom map: `0↦0`; two faces `[0]→[1]`; `2³ = 8` compositions | agrees with RiehlVerity lines 1255–1256, 1227–1235 | none |
| M1.4 top/bottom duality | `α : [n] → [m]` top-preserving | left adjoint exists iff top preserved; it preserves bottom; `(βα)ˡ = αˡβˡ` | `Δ_topᵒᵖ ≅ Δ_bot`, RiehlVerity lines 1227–1248 | none |
| M2.1 API | `[]`, `[f]`, `[f,g]` in a strict `D` | `𝟙`, `𝟙 ≫ f = f`, `(𝟙 ≫ f) ≫ g = f ≫ g`; `[f,g] ≅ [f ≫ g]` is `vId (f ≫ g)` after transport | consistent | R03 |
| M2.2 API | strict and non-strict induced bicategory | strict: `(f⋆g)⋆h = f⋆(g⋆h)`, associator `eqToIso`; non-strict: tops `(f⋆g)⋆h`, `f⋆(g⋆h)` differ | hypothesis needed; FairbanksShulman lines 894–927, 946–949 | R03 |
| M2.3 API (headline) | extraction∘expansion on a square; expansion∘extraction on a path cell | same objects and generators both ways; cells with boundary `p` ↔ boundary `[eval p]` by conjugation; `μ⁻¹ ≫ μ = id` | isomorphisms, not only the equivalence of FairbanksShulman line 996 | none |
| M3.1 API | `[]`, `[f]`, `[f,g]`, `[f,g,h]`; `[f]++[g,h]`; `[]++p`, `p++[]` | `𝟙`, `f`, `f≫g`, `(f≫g)≫h`; associator; `(λ_)⁻¹`, `(ρ_)⁻¹` | correct | none |
| M3.2 API | vertical globular `F → F'`; `hId F`; horizontal globular `σ` | `L`: `𝟙≫F'.l ⟶ F.l≫𝟙`; `Hom₂ F' F`: `τl : F'.l ⟶ F.l`, `τr : F.r ⟶ F'.r`; `conjugateEquiv F.adj F'.adj`; `λ ≫ ρ⁻¹` / `ρ ≫ λ⁻¹`; `σ`: `ρ ≫ σ ≫ λ⁻¹` / `λ ≫ σ ≫ ρ⁻¹` | correct; reversal matches `Adj.lean` 83–88 | R01, R02 |
| M3.3 API (headline) | singleton boundary; identity square; two identity adjunctions | `mateEquiv : (g≫l₂ ⟶ l₁≫h) ≃ (r₁≫g ⟶ h≫r₂)` = `L ≃ R`; `mateEquiv adj adj (λ ≫ ρ⁻¹) = ρ ≫ λ⁻¹` (`Mate.lean` 453); `mateEquiv id id (ρ ≫ σ ≫ λ⁻¹) = λ ≫ σ ≫ ρ⁻¹`, proved in scratch | orientation correct; `mateEquiv_vcomp` shares `l₂`: this roadmap's horizontal pasting | R02 |
| M4 API (headline) | `(F≫G)≫H` vs `F≫(G≫H)`; `id ≫ F`; `Cat` | `l` equal by `Strict.assoc`; `r`: `r_H≫(r_G≫r_F)` vs `(r_H≫r_G)≫r_F`; units equal up to `eqToHom`; `toNatTrans_mateEquiv` at `Adjunction/Cat.lean` 83; ChengGurskiRiehl lines 266–297 (categories only) | consistent | none |

- Previous findings: R01 repaired (README lines 288–296, 712–718 cite `SimplexCategory.II`, `II.map'` and its four lemmas); R02 repaired (`Suggested.lean` lines 172–173, `#check`); R03 repaired (docstring lines 20–22); R04 repaired (API and Checks bullets, `### Examples`, `### Dependencies`, no backticked walking-adjunction name, line 27); R05 not repaired (R04 here).
- Source locators checked against the text: 20 (FairbanksShulman Definitions 2.1, 2.3, 3.1–3.3, 3.12, Remark 3.5, Propositions 2.5, 2.7, 2.9, 3.13, Corollaries 2.10, 3.14, Example 3.10; ChengGurskiRiehl Definition 1.1, Theorem 1.2; Schanuel–Street pp. 81–83; Riehl–Verity 3.3.4, 3.3.6, 3.3.8 in arXiv:1310.8279v4).
- Library declarations opened at the pins: `Bicategory/Adjunction/Mate.lean` 146, 214, 272, 360, 394, 425, 439, 453; `Adj.lean` 63, 83–88, 179; `Adjunction/Basic.lean` 106, 161; `Adjunction/Cat.lean` 83; `Strict/Basic.lean` 40–54; `Functor/StrictPseudofunctor.lean` 43; `Opposites.lean` 13, 29; `SimplicialObject/II.lean` 73, 106, 111, 116, 122, 226; `SimplexCategory/Augmented/Basic.lean` 33, `Monoidal.lean` 53; `TauCeti/CategoryTheory/Adjunction/Mates.lean` 69.
- Duplication: no double category, walking adjunction, implicit 2-category or endpoint-preserving simplex subcategory in the pinned Mathlib or Tau Ceti; none planned by a roadmap on main or at an open head; none of this file's 12 fully qualified names is declared elsewhere.
- Cross-roadmap citations: none in the README; the resolver reports none missing; no change outside the folder; `metadata.toml` has `topic = "math.CT"`.
- Dependency check: `depcheck: 248 roadmaps, 2566 edges, 0 problem(s)`.
- Gate at ac07d7d: every check 0, targeted build passes. Elaboration: one warning (`sorry`, line 167). The 12 elaborated signatures compared with the README by `#check @name`: none lost a binder, nothing changed.
- Pull-request text read against the head: "adds only" the folder, the pins and "single `sorry`" hold; R04 is the one omission.

Overlap check: read HomotopyTheoryOfCategories, Foams (the third list is empty); nothing shared.

Source independence: 9 passages compared with 4 sources, none shared (longest common run 5 words, forced by the definition); largest share FairbanksShulman, 16 of 23 locators; contents compared with FairbanksShulman: independent (M1.2 ↔ §3, M1.3 ↔ §2, M2 ↔ 3.12–3.14, M3 ↔ 2.5 and 3.10; M1.4 and M4 rest on other sources). KellyStreet could not be read.

Research link: M3.3 formalises the mates correspondence for bicategories of Fairbanks–Shulman (2026), Example 3.10; M4 is Kelly–Street (1974), Proposition 2.2, as restated by Cheng–Gurski–Riehl (2014), Theorem 1.2; M1.4 is the free adjunction of Schanuel–Street (1986) used by Riehl–Verity (2016). Rests on the README's references and the four texts read.

## Not verifiable

- Kelly–Street, Proposition 2.2, pp. 86–87, and the description of its diagrams (2.4)–(2.5) (README lines 87, 774–776): recorded as uncertified, text not read.
- Published page numbers of Riehl–Verity (README lines 787–788): only arXiv v4 was read; it has the three items on its pp. 24–27 with the same item numbers.
- Journal page 346 for Cheng–Gurski–Riehl, Definition 1.1 and Theorem 1.2: only the arXiv text was read (its pp. 6–7); the item numbers agree.
- Schanuel–Street's displayed composition formula (p. 82): the displays are missing from the text extracted from the Numdam scan (SchanuelStreet lines 69–74); composition conventions were checked against Riehl–Verity, Remark 3.3.8, only.
- Ownership against open Mathlib pull requests (a 2-cell dual, double categories) was not checked.

## Source issues

- **Misprint** in FairbanksShulman at Proposition 2.5, arXiv v2 p. 10: the source says the 2-cells of the clique live in a bicategory called B; it should be the bicategory C of the statement; affects nothing.
- **Misprint** in FairbanksShulman at Definition 3.12, arXiv v2 p. 16: the source says the third horizontal arrow h goes from A to B; it should be h from C to D, so that the triple composite exists; affects nothing.
- **Gap** in FairbanksShulman at Example 3.10, arXiv v2 p. 15: the source says the two adjunction double categories and their isomorphism exist for an implicit 2-category "in the same way", without proof; it should verify the pasting and representability axioms; affects a stated result.

## For the human reviewers

- Scope: the headline of M3 (README lines 572–573) rests on FairbanksShulman Example 3.10 (lines 878–882), an example stated without proof in a 2026 article; the strict case is Kelly–Street 1974.
- Not tested: Kelly–Street's text was not read; the convention comparison at README line 87 is unchecked.
- Licence: README line 738 links Geb's `GebLean/Utilities/DoubleCategory.lean` (GPL-3.0 per line 745). That file was not re-read in this round; the previous round found none of the 12 declaration names in its first 100,000 characters.
- Policy: `Suggested.lean` lines 10–15 and README line 14 call the Lean file suggested forms and a prototype, as the repository `README.md` ("Prototyping") asks; its one theorem is an M1.2 target, and all five headlines are listed as not statable.
