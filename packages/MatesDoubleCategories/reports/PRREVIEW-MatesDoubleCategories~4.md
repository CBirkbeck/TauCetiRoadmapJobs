# Review of MatesDoubleCategories (pull request #2299 at ed02250)

**Verdict:** needs changes

## R01 (P3) — the pull-request description omits M1.4, the 2-cell dual, and their sources and suppliers

**Location:** Pull-request description, first paragraph: "The roadmap first develops the reusable structures and tests their comparison with ordinary strict double categories; it specifies the path-evaluation, adjunction, coherence, and strictness prerequisites."

**Claim:** Not repaired since the previous review (its R04). The head also plans the walking adjunction with its universal property and four simplex hom-categories (a headline, per `Suggested.lean` lines 20–22) and the 2-cell dual of a bicategory; the description names neither, nor references 4–5, nor the simplex suppliers.

**Witness:** `TauCetiRoadmap/MatesDoubleCategories/README.md` lines 308–411 (M1.4), 616–624 (2-cell dual), 103–117 (simplex and `SimplexCategory.II` contracts), 849–857 (references 4, 5). The description has no occurrence of "walking", "simplex" or "dual".

**Repair:** Add to the first paragraph: "M1 also defines implicit 2-categories with their adjunctions and constructs the Schanuel–Street walking adjunction, with its universal property and the identification of its four hom-categories with `Δ₊`, `Δ₊ᵒᵖ` and the top- and bottom-preserving subcategories of `Δ` (Schanuel–Street; Riehl–Verity §3.3), on Mathlib's `SimplexCategory`, `AugmentedSimplexCategory` and `SimplexCategory.II`. M3.2 also constructs the 2-cell dual of a bicategory, which Mathlib lacks, to compare the vertical globular bicategories with `Bicategory.Adj`."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| M1.1 API | middle-four grid; `id_id`; `hId_vComp` | both sides `Cell (p≫q) (x≫y) (l≫l') (n≫n')`; both `Cell 𝟙 𝟙 𝟙 𝟙`; both `Cell 𝟙 𝟙 (f≫g) (f≫g)` | README lines 165–171, 193–194 match `Suggested.lean` lines 97–108 | none |
| M1.2 API; `representable_of_representation` | `nil`; `p.cons e`; one object, empty quivers | `nil ≅ [hUnit a]`; cons: `hComp iso (vId [e])` has vertical boundaries `𝟙, 𝟙` with no transport, then `hMulIso`; empty quivers: `hUnit a` has no value | true; `simp`, `rfl`, `infer_instance`, `aesop`, `tauto`, one `exact` all fail | none |
| M1.3 API | empty vertical quiver; unit, counit | cells `(p,q,[],[])`; `η : 𝟙 a ⟶ f ≫ g`, `ε : g ≫ f ⟶ 𝟙 b` as in Mathlib `Bicategory.Adjunction`; full `Representation` needs `vUnit a`, empty | agrees with FairbanksShulman lines 515–554 | none |
| M1.4 API; universal property (headline) | Riehl–Verity (3.3.3), 3.3.4 | source: `u : − → +`, `f : + → −`, `η : id₊ ⇒ uf`, `ε : fu ⇒ id₋`; README: `η : []₊ ⟶ [f,g]`, `ε : [g,f] ⟶ []₋`, diagrammatic | same data; unique 2-functor as stated (arXiv:1310.8279v4 lines 1158–1169) | R01 |
| M1.4 Simplex categories and conventions | ordinals `∅, 1, 2`; `α : 1 → 2`; cuts `j = 0, m` | `∅ ↦ [0]`; `#Hom(1,2) = 2 = #Δ_∂([2],[1])`; `α(0)=0`: cuts `0,1,1`; `α(0)=1`: `0,0,1`; `0 ↦ 0`, `m ↦ n`; equals `II.map'` = min of `{i | i = last ∨ x ≤ f i}` | correct; `II.lean` lines 47–49, 73–74, 226 | none |
| M1.4 Hom-category theorem (headline) and Checks | `n = 0, 1`; `g ◁ η`; `η ▷ f`; `[1] → [2]` | `(+,+)`: `[] ↦ ∅`, `fg ↦ [0]`; `(−,+) = Δ_top`: `ηu = η ⊕ id : [0] → [1]`, `0 ↦ 1`; `(+,−) = Δ_bot`: `0 ↦ 0`; `#Δ_top([1],[2]) = 3` = 2 unit insertions + 1 through `[0]`; `2³ = 8` compositions | agrees with arXiv:1310.8279v4 lines 1255–1256, 1292–1296 | none |
| M1.4 top/bottom duality | top-preserving `α : [n] → [m]` | left adjoint exists iff top preserved; it preserves bottom; `(βα)ˡ = αˡβˡ` | `Δ_topᵒᵖ ≅ Δ_bot`, arXiv:1310.8279v4 lines 1227–1248 | none |
| M2.1 API | `[]`, `[f,g]` in strict `D` | `𝟙`; `f ≫ g`; cell `([f,g],[f≫g],[],[])` is a `D`-square `(f≫g, f≫g, 𝟙, 𝟙)` = `vId (f≫g)` | consistent with `HorizontalIso` | none |
| M2.2 API | `id_id` of the extracted structure; `FreeBicategory` on one loop | 3×3 grid rows `[ι,h⁻¹,ι],[v⁻¹,ι,v],[ι,h,ι]`: rows-first gives extracted `hId 1`, columns-first `vId 1`, equal by interchange; `comp (comp f f) f = comp f (comp f f)` forces `comp f f = of e`, refuted in Lean | hypothesis needed and sufficient | none |
| M2.3 API (headline) | extraction∘expansion on a square; expansion∘extraction on a path cell | generators and `⋆ = ≫` agree both ways; cells `(p,q,l,r)` ↔ cells on `[eval p],…` by conjugation; `μ⁻¹ ≫ μ = id` | isomorphisms, stronger than the equivalence of FairbanksShulman line 996, and true | none |
| M3.1 API | `[]`, `[f]`, `[f,g,h]`; `[f]++[g,h]`; `[]++p` | `𝟙`, `f`, `(f≫g)≫h`; comparison `(f≫g)≫h ≅ f≫(g≫h)` = associator; `eval p ≅ 𝟙 ≫ eval p` = `(λ_)⁻¹` | correct | none |
| M3.2 API | vertical globular `F → F'`; `hId F`; horizontal globular `σ`; composite | `L`: `𝟙≫F'.l ⟶ F.l≫𝟙`; `Hom₂ F' F`: `τl : F'.l ⟶ F.l`, `τr : F.r ⟶ F'.r` = `conjugateEquiv F.adj F'.adj τl`; `λ ≫ ρ⁻¹` / `ρ ≫ λ⁻¹`; `ρ ≫ σ ≫ λ⁻¹` / `λ ≫ σ ≫ ρ⁻¹`; `F → F' → F''` ↦ `Hom₂ F'' F' ≫ Hom₂ F' F` | 2-cell dual needed, and now a target; `Adj.lean` 83–88, `Opposites.lean` 29 | none |
| M3.3 API (headline) | singleton boundary; identity square; two identity adjunctions | `mateEquiv : (g≫l₂ ⟶ l₁≫h) ≃ (r₁≫g ⟶ h≫r₂)` = `L ≃ R`; `Mate.lean` 453 gives `λ ≫ ρ⁻¹ ↦ ρ ≫ λ⁻¹`; `mateEquiv id id (ρ_S ≫ σ ≫ λ_T⁻¹) = λ_S ≫ σ ≫ ρ_T⁻¹` proved in a scratch file | orientation and formula correct; `mateEquiv_vcomp` shares `l₂`: this roadmap's horizontal pasting | none |
| M4 API (headline) | `(F≫G)≫H` vs `F≫(G≫H)`; `Cat` | `l` equal by `Strict.assoc`; `r`: `r_H≫(r_G≫r_F)` vs `(r_H≫r_G)≫r_F`; units differ by `eqToHom` only; `toNatTrans_mateEquiv` (`Adjunction/Cat.lean` 83) has the stated type | consistent with ChengGurskiRiehl lines 266–297 (categories only) | none |

- Previous findings: R01 repaired (README lines 616–624, 631–633, 90–93: the 2-cell dual is a target with API, Checks and contract); R02 repaired (lines 679–688, 639–641, 707–708); R03 repaired (M2.1 Checks 450–459, M2.2 Checks 481–494, contracts at line 79 before the layers); R04 not repaired (R01 here).
- Source locators checked against the text: 20 (FairbanksShulman Definitions 2.1, 2.3, 3.1–3.3, 3.12, Remark 3.5, Propositions 2.5, 2.7, 2.9, 3.13, Corollaries 2.10, 3.14, Example 3.10; ChengGurskiRiehl Definition 1.1, Theorem 1.2; Schanuel–Street pp. 81–83; Riehl–Verity 3.3.4, 3.3.6, 3.3.8 in arXiv:1310.8279v4).
- Library declarations opened at the pins: `Bicategory/Adjunction/Mate.lean` 146, 214, 272, 360, 394, 425, 453, 609, 651, 684; `Adj.lean` 63, 83–88, 179; `Adjunction/Basic.lean` 106, 161; `Adjunction/Cat.lean` 83; `Functor/StrictPseudofunctor.lean` 43; `Opposites.lean` 23–29; `SimplicialObject/II.lean` 47–49, 73, 106, 111, 116, 122, 226; `SimplexCategory/Augmented/Basic.lean` 14–15; `TauCeti/CategoryTheory/Adjunction/Mates.lean` 43–50, 69. Every backticked library name in the README resolves by `#check`.
- Duplication: no double category, walking adjunction, implicit 2-category, 2-cell dual or endpoint-preserving simplex subcategory in the pinned Mathlib or Tau Ceti; none planned on main or at an open head (GeneralAlgebraicKTheory §5.14 uses a double category of commuting squares only as a nerve); none of the 12 fully qualified names is declared elsewhere.
- Cross-roadmap citations: none in the README; the resolver reports none missing; no change outside the folder; `metadata.toml` has `topic = "math.CT"`.
- Dependency check: `depcheck: 248 roadmaps, 2566 edges, 0 problem(s)`.
- Gate at ed02250: every check 0, targeted build passes. Elaboration: one warning (`sorry`, line 168). The 12 elaborated signatures compared with the README: none lost a binder, nothing changed.
- Pull-request text against the head: "adds only" the folder, topic, toolchain `v4.36.0-rc2`, Mathlib pin `1b1ccf4b` and "single `sorry`" hold; R01 is the one omission.

Overlap check: read HomotopyTheoryOfCategories, GrothendieckInfinityGroupoids, Foams (the third list is empty); nothing shared.

Source independence: 9 passages compared with 4 sources, none shared (longest common run 5 words, forced by the definition); largest share FairbanksShulman, 16 of 23 locators; contents compared with FairbanksShulman: independent (M1.2 ↔ §3, M1.3 ↔ §2, M2 ↔ 3.12–3.14, M3 ↔ 2.5 and 3.10, not in the source's order; M1.1, M1.4 and M4 rest on other sources). KellyStreet could not be read.

Research link: M3.3 formalises the mates correspondence for bicategories of Fairbanks–Shulman (2026), Example 3.10; M4 is Kelly–Street (1974), Proposition 2.2, as restated by Cheng–Gurski–Riehl (2014), Theorem 1.2; M1.4 is the free adjunction of Schanuel–Street (1986) used by Riehl–Verity (2016). Rests on the README's references and the four texts read.

## Not verifiable

- Kelly–Street, Proposition 2.2, pp. 86–87, and the description of its diagrams (2.4)–(2.5) (README lines 59, 842–844): recorded as uncertified, text not read.
- Published page numbers of Riehl–Verity (README lines 855–856): only arXiv v4 was read; it has the three items on its pp. 24–27 with the same item numbers.
- Journal page 346 for Cheng–Gurski–Riehl, Definition 1.1 and Theorem 1.2: only the arXiv text was read (its pp. 6–7); the item numbers agree.
- Schanuel–Street's displayed composition formula (p. 82): the displays are missing from the text extracted from the Numdam scan; composition conventions were checked against Riehl–Verity, Remark 3.3.8, only.
- Ownership against open Mathlib pull requests (a 2-cell dual, double categories) was not checked.

## Source issues

- **Misprint** in FairbanksShulman at Proposition 2.5, arXiv v2 p. 10: the source says the 2-cells of the clique live in a bicategory called B; it should be the bicategory C of the statement; affects nothing.
- **Misprint** in FairbanksShulman at Definition 3.12, arXiv v2 p. 16: the source says the third horizontal arrow h goes from A to B; it should be h from C to D, so that the triple composite exists; affects nothing.
- **Gap** in FairbanksShulman at Example 3.10, arXiv v2 p. 15: the source says the two adjunction double categories and their isomorphism exist for an implicit 2-category "in the same way", without proof; it should verify the pasting and representability axioms; affects a stated result.

## For the human reviewers

- Scope: the headline of M3 (README lines 665–674) rests on FairbanksShulman Example 3.10 (lines 878–882), an example stated without proof in a 2026 article; the strict case is Kelly–Street 1974.
- Not tested: Kelly–Street's text was not read; the convention comparison at README lines 58–59 is unchecked.
- Licence: README line 806 links Geb's `GebLean/Utilities/DoubleCategory.lean` (GPL-3.0 per line 813). That file was not re-read in this round; since the last comparison `Suggested.lean` changed only in its module docstring.
- Policy: `Suggested.lean` lines 10–15 and README line 14 call the Lean file suggested forms and a prototype, as the repository `README.md` ("Prototyping") asks; its one theorem is an M1.2 target, and all four headlines are listed as not statable.
- Sources: the roadmap's source manifest records references 1–3 only; Schanuel–Street and Riehl–Verity (references 4, 5) were read from open copies (Numdam, arXiv:1310.8279v4) and have no manifest entry.
