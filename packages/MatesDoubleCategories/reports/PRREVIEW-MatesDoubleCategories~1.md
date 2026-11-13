# Review of MatesDoubleCategories (pull request #2299 at 7af11b6)

**Verdict:** needs changes

## R01 (P2) — M3.1 builds an object no target defines

**Location:** `TauCetiRoadmap/MatesDoubleCategories/README.md` lines 164–165 and 178–179: "Construct a represented implicit 2-category from `K`" … "adjunctions between singleton paths in this implicit 2-category".

**Claim:** M1 defines only strict and implicit *double* categories, their representations and double functors. "Implicit 2-category", its representation, its underlying bicategory and an adjunction inside it are used by M3.1 but are targets nowhere; M1's reference line only points at the source's Section 2.

**Witness:** M1.1–M1.2 (lines 78–115) contain no 2-category structure; FairbanksShulman lines 515–553 (Definitions 2.1, 2.3) define it separately from Definition 3.1 (line 750).

**Repair:** Add to M1.2: "Define an implicit 2-category as an implicit double category whose vertical generating quiver is empty, so every cell has boundary `(p, q, [], [])`; its representation, functors and underlying bicategory are the horizontal specializations of the definitions above (Fairbanks–Shulman, Definitions 2.1 and 2.3, Proposition 2.7). An adjunction between generators `f : a → b`, `g : b → a` is a pair of cells `[] ⟶ [f,g]`, `[g,f] ⟶ []` satisfying the two triangle equalities for path pasting." The M3.1 construction (cells `eval p ⟶ eval q`) is an instance of this definition.

## R02 (P3) — the gate fails on the import header

**Location:** `TauCetiRoadmap/MatesDoubleCategories/Suggested.lean` lines 5–9 and 32: `module`, three `public import Mathlib.CategoryTheory.…` lines, `@[expose] public section`.

**Claim:** The gate rules `imports`, `mathlib-subimports` and `no-import-mathlib` fail: the file must have the single line `import Mathlib` and no `Mathlib.<submodule>` import.

**Witness:** Gate at 7af11b6: `imports=1 mathlib-subimports=3 no-import-mathlib=1 … FAIL` (lines 7, 8, 9; "line 1: no `import Mathlib` line").

**Repair:** Replace lines 5–9 by `import Mathlib` and delete line 32. A copy with this header elaborates at the pins with `sorry` at `representable_of_representation` as its only warning.

## R03 (P3) — the README is not in roadmap form; definitions have no API lists or Checks

**Location:** `TauCetiRoadmap/MatesDoubleCategories/README.md`, headings at lines 1, 16, 76, 126, 162, 236, 265, 290; "**Completion checks.**" at lines 117, 153, 226, 259.

**Claim:** Missing: the `# Roadmap: …` title and `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k:` with `### k.n`, per-layer `### Examples` and `### Dependencies`, `## Downstream consumers`. No definition has an API bullet list or three `**Checks.**`; each milestone has one prose paragraph of checks with no computed value.

**Witness:** `TauCetiRoadmap/Foams/README.md` on main, lines 1, 11, 65, 170, 301, 312, 729, 734. No direction convention here has a computed witness.

**Repair:** Recast as: title `# Roadmap: mates as a double isomorphism`; split "Conventions and scope" into the two sections; turn "Existing library inputs" into `## Exact supplier contracts` (`### From Mathlib`, `### From Tau Ceti`); rename M1–M4 to `## Layer 1–4` with `### k.n`. Give each definition (strict double category, strict double functor, implicit double category, globular isomorphism, representability, representation, `L(K)`, `R(K)`, path evaluation) API bullets and three Checks. Checks that discriminate, verified at the pins: (i) with empty generating quivers on one object no representation exists and representability fails; (ii) the vertical globular cell `F → F'` of `L(K)` is `τ : F'.l ⟶ F.l` and its mate is `conjugateEquiv F.adj F'.adj τ : F.r ⟶ F'.r` (the reverse direction does not typecheck), equal to `𝟙` for `τ = 𝟙` (`Bicategory.conjugateEquiv_id`); (iii) the mate of the `L` identity cell `λ ≫ ρ⁻¹` on a vertical generator is the `R` identity cell (`Bicategory.mateEquiv_leftUnitor_hom_rightUnitor_inv`).

## R04 (P3) — M3 is blocked behind M2, which it does not use

**Location:** `TauCetiRoadmap/MatesDoubleCategories/README.md` line 232: "*Inputs:* M1, its M2 strict comparison test, Mathlib bicategory coherence, adjunctions, `Adj`, and mates."

**Claim:** One input line covers M3.1–M3.3, and it lists M2; no statement or route in M3.1–M3.3 uses expansion, extraction or their comparison. Only M4 consumes M2.

**Witness:** Lines 164–230 name no M2 construction; line 245 ("Apply M2's extraction to M3's double isomorphism") is the first use.

**Repair:** Replace by per-target lines: "M3.1 *Needs:* M1.2; Mathlib `Bicategory/Coherence.lean`, `Bicategory.Adjunction`." "M3.2 *Needs:* M1, M3.1; Mathlib `Bicategory.Adj.Hom`, `Bicategory.Adj.Hom₂`, `Adjunction.comp`, `Adjunction.id`." "M3.3 *Needs:* M3.2; Mathlib `Bicategory.mateEquiv`, `mateEquiv_vcomp`, `mateEquiv_hcomp`, `mateEquiv_square`, `conjugateEquiv`." Do the same for M1, M2, M4.

## R05 (P3) — padding in Suggested.lean: the Mates section

**Location:** `TauCetiRoadmap/MatesDoubleCategories/Suggested.lean` lines 164–197: `AdjEdge`, `LeftSquare`, `RightSquare`, `squareMateEquiv` and two `example`s.

**Claim:** Both `example`s close with one library lemma, and `squareMateEquiv` is `Bicategory.mateEquiv` restated; the four definitions serve no theorem stated in the file.

**Witness:** Lines 189 and 195: `Equiv.symm_apply_apply _ _`, `Equiv.apply_symm_apply _ _`; line 183: `Bicategory.mateEquiv F₁.adj F₂.adj`; pinned `Mathlib/CategoryTheory/Bicategory/Adjunction/Mate.lean` line 146.

**Repair:** Delete lines 164–197 from `Suggested.lean` (the README keeps the `L`/`R` convention at lines 42–47); pin the library declaration with `#check @CategoryTheory.Bicategory.mateEquiv`. A copy with this change and R02's elaborates with `sorry` as its only warning.

## R06 (P3) — Suggested.lean docstring and names do not match the README

**Location:** `TauCetiRoadmap/MatesDoubleCategories/Suggested.lean` lines 11–30: "# Mates double categories: suggested interfaces … Functor and isomorphism structures, induced bicategories, their strictness, and the general and strict double isomorphisms require the M1--M3 constructions."

**Claim:** The title is not "<title>: target signatures"; the headlines that are not statable are not named one by one with the carrier each lacks; no declaration name of the file (`StrictDoubleCategory`, `ImplicitDoubleCategory`, `Representation`, `Representable`, `representable_of_representation`, …) appears in the README.

**Witness:** `grep -n 'StrictDoubleCategory\|Representation\b' README.md` in the folder: no hit. README headlines: M2.3 (line 145), M3.3 (line 216), M4 (line 248).

**Repair:** Title "Mates as a double isomorphism: target signatures". Docstring: "Not statable at the pins: the comparison of M2.3 (lacks strict double functors, expansion and extraction); the represented double isomorphism `L(K) ≅ R(K)` of M3.3 (lacks path evaluation and the two implicit double categories, whose axioms are theorems); the strict isomorphism of M4 (lacks both)." In README M1.1–M1.2 name each kept declaration in backticks at its definition, and state `representable_of_representation` as the M1.2 target it is (Fairbanks–Shulman, Definition 3.3).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| M1.1 strict cells (`StrictDoubleCategory`) | types of `interchange`, `hId_vComp`, `id_id`, unit laws | both sides of interchange: `Cell (p≫q) (x≫y) (l≫l') (n≫n')`; `id_id`: both `Cell 𝟙 𝟙 𝟙 𝟙`; unit laws differ by `𝟙≫p = p`, hence `HEq` | well-typed, matches README list | none |
| M1.2 representation; `representable_of_representation` | `Paths.nil`, singleton, `cons`; empty quivers on one object | nil ≅ `[hUnit]`; `p.cons g`: `hComp iso (vId [g])` then `hMulIso`, inverse law by interchange + `v_id_comp`; empty quivers: no `hUnit`, statement vacuous, `Representable` false | true; not closed by `simp`, `rfl`, `aesop`, `infer_instance` | R06 |
| M1 completion checks | empty path beside `[1]`; globular iso types | `HorizontalIso`: `vComp hom inv : Cell p p ([]≫[]) ([]≫[])`, `[]≫[] = []` by reduction; `[] ≅ [hUnit]` is data, no axiom equates them | consistent with lines 60–62 | R03 |
| M2.1 expansion | horizontal bicategory of the expansion | 1-cells: arrows of `D`; `f⋆g = f≫g`; comparison cells are identity squares, so associator `= eqToIso` | strict in Mathlib's sense | none |
| M2.2 extraction | hypothesis vs FairbanksShulman lines 894–927, 946–949 | README: both induced bicategories strict; source: horizontally and vertically strict; squares = length-one boundaries on both sides | agrees | none |
| M2.3 comparison | extraction∘expansion on squares; expansion∘extraction on generators | first: same squares, pasting conjugated by identity cells = `D`'s; second: generators unchanged, cells moved by representation isos (FairbanksShulman lines 713–716, 996–997) | double isomorphisms, as stated | none |
| M2 completion checks | quintets of a strict 2-category | needs both pastings and interchange; source names the example at FairbanksShulman line 799 | discriminating | R03 |
| M3.1 path evaluation | `[]`, `[f]`, `[f,g]`, `[f,g,h]` | `𝟙`, `f`, `f≫g`, `(f≫g)≫h`; binary/nullary comparisons are identities; recovered hom `[f]→[g]` is `f ⟶ g` | recovers `K`; one bracketing chosen where the source uses all (lines 578–581) | R01 |
| M3.2 `L(K)`, `R(K)` | horizontal and vertical globular cells; `Adjunction.comp` | horizontal: `S≫𝟙 ⟶ 𝟙≫T` and `𝟙≫S ⟶ T≫𝟙`; vertical `F→F'`: `F'.l ⟶ F.l`, `F.r ⟶ F'.r` = `Hom₂ F' F` (`τl : α.l ⟶ β.l`, `τr : β.r ⟶ α.r`); comp: `f₁≫f₂ ⊣ g₂≫g₁` | README lines 201–203 correct | R03 |
| M3.3 double isomorphism (headline) | singleton boundary; identity cells; shared-edge pasting | `mateEquiv : (g≫l₂ ⟶ l₁≫h) ≃ (r₁≫g ⟶ h≫r₂)` = `L ≃ R`; Mathlib `vcomp` shares `l₂` = this roadmap's horizontal pasting, as line 270 warns | orientation correct; not statable at the pins | R05, R06 |
| M3 completion checks | "only `[Bicategory K]`" | no step of M3.1–M3.3 uses `Bicategory.Strict`; `mateEquiv_vcomp/hcomp/square` carry no strictness hypothesis | consistent | R04 |
| M4 strict specialization (headline) and its checks | `(F≫G)≫H` vs `F≫(G≫H)` in `Adj.Hom`; `Cat` | `l`, `r` equal by `Strict.assoc`; units agree after `eqToHom`; `Cat.bicategory.strict` exists; `toNatTrans_mateEquiv` has the stated shape | consistent; ChengGurskiRiehl lines 266–297 match | none |
| M2.3 headline | statability | needs strict double functors plus expansion (a structure with proof fields) | not statable without sorry'd data | R06 |

- Source locators checked against the text: 11 (FairbanksShulman Definitions 2.1, 2.3, 3.1–3.3, 3.12, Remark 3.5, Propositions 2.5, 2.7, 3.13, Corollary 3.14, Example 3.10; ChengGurskiRiehl Definition 1.1, Theorem 1.2).
- Library declarations opened at the pins: `Bicategory/Adjunction/Mate.lean` 146, 214, 272, 360, 394, 425, 453; `Adj.lean` 63, 83; `Adjunction/Basic.lean` 106, 161; `Adjunction/Cat.lean` 83; `Strict/Basic.lean` 40; `Category/Cat.lean` 237; `Bicategory/Opposites.lean` 29 (2-cell dual absent); `TauCeti/CategoryTheory/Adjunction/Mates.lean` 69, 91.
- No double category, quintet or implicit-category declaration exists in the pinned Mathlib or Tau Ceti; no other roadmap on main or open declares one of this file's names.
- Cross-roadmap citations: none in the README; resolver reports none missing.
- Dependency check: `depcheck: 240 roadmaps, 2175 edges, 0 problem(s)`; no change outside the folder.
- Gate: FAIL on `imports`, `mathlib-subimports`, `no-import-mathlib` (R02); all other checks 0, targeted build passes.
- Elaboration: `Suggested.lean` at the head, one warning (`sorry`, line 159); the 16 elaborated signatures compared with the README, none lost a binder its statement needs (the four flagged keep `[Bicategory K]`).
- Pull-request text: read against the head; no sentence contradicted.

Overlap check: read GrothendieckInfinityGroupoids, Foams (the third list is empty); nothing shared.

Source independence: 8 passages compared with 2 sources, none shared; largest share FairbanksShulman, 9 of 12 locators; contents compared with FairbanksShulman: independent (M1 ↔ 3.1–3.5, M2 ↔ 3.12–3.14, M3 ↔ 2.5 and 3.10, M4 ↔ another source; M4's order is forced by its use of M2 and M3). KellyStreet could not be read.

## Not verifiable

- Kelly–Street, Proposition 2.2, pp. 86–87, and the claim (README line 50) that they orient vertical arrows along right adjoints: the DOI resolves only to a paywalled page.
- Published page numbers of Fairbanks–Shulman (README line 298: p. 14, pp. 15–16): only arXiv v2 was readable, where Example 3.10 is on p. 15 and Definition 3.12–Corollary 3.14 on pp. 15–17; the item numbers agree.
- Journal page 346 for Cheng–Gurski–Riehl, Definition 1.1 and Theorem 1.2: only the arXiv text was readable (its pp. 6–7); the item numbers agree.

## Source issues

- **Misprint** in FairbanksShulman at Proposition 2.5, arXiv v2 p. 10: the source says the 2-cells of the clique live in a bicategory called B; it should be the bicategory C of the statement; affects nothing.
- **Misprint** in FairbanksShulman at Definition 3.12, arXiv v2 p. 16: the source says the third horizontal arrow h goes from A to B; it should be h from C to D, so that the triple composite exists; affects nothing.
- **Gap** in FairbanksShulman at Example 3.10, arXiv v2 p. 15: the source says the two adjunction double categories and their isomorphism exist for an implicit 2-category "in the same way", without proof; it should verify the pasting and representability axioms; affects a stated result.

## For the human reviewers

- Scope: the headline of M3 (README line 216) rests on FairbanksShulman Example 3.10, an example stated without proof in a 2026 article; the strict case is Kelly–Street 1974.
- Not tested: Kelly–Street's text was not read; the convention comparison at README line 50 is unchecked.
- Policy: the repository `README.md` ("Prototyping") calls `Suggested.lean` suggested forms, which the file's docstring follows; R05 and R06 apply the acceptance-test rule instead.
