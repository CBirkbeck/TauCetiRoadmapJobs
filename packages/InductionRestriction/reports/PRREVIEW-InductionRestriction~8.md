# Review of InductionRestriction (pull request #2639 at d4b968d)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** accepted

**Summary.** Accepted: no finding. Every layer and item of the README on main is present at this head under its id, the statements and Checks recomputed below hold, `Suggested.lean` elaborates with `sorry` as its only warning, and none of its thirteen open statements closes in one tactic. There are five small corrections (two sentences that drop a hypothesis the cited declaration carries, two statements listed as targets that the Lean file already proves, and two points in the description) and two format notes, none blocking. For the humans: Serre, Isaacs, Curtis–Reiner and Mackey are behind paywalls and were not read, so only the Weibel locators were checked against a text.

## C01 — The simplicity criterion of Layer 4 is stated for "a category in which every object is injective", without the additive structure and kernels its declaration assumes

A reader takes the sentence "In a category in which every object is injective, … an object `X` is simple exactly when `End X` is nontrivial and every nonzero endomorphism of `X` is a unit" (README line 575) as a statement about arbitrary categories. The declaration it names, `CategoryTheory.simple_iff_nontrivial_end_and_isUnit` (Tau Ceti, `CategoryTheory/Simple/Endomorphism.lean`, line 57), is proved under `[Preadditive C] [HasKernels C]` (line 53) together with `[∀ Y : C, Injective Y]`; the converse direction uses the kernel of an idempotent. The use made of it, in `FDRep k G` for finite `G` with `|G|` nonzero in `k`, is unaffected.

Smallest change: "In a preadditive category with kernels in which every object is injective, …".

## C02 — The product model of `Ind_S^G A` in Layer 2 needs `S` of finite index, which the sentence does not repeat after changing the coefficients

In "Over a commutative ring, `Ind_S^G A` is, as a module, the product of copies of `A` indexed by the right cosets of `S`" (README line 239), the switch from "a field `k`, a subgroup `S` of finite index" to "a commutative ring" leaves it unclear whether finite index is kept. It must be: for infinite index the induced module is the direct sum, not the product, and `TauCeti.Rep.indSubtypeEquivPi` carries `[S.FiniteIndex]` (`RepresentationTheory/Induction/FiniteDimensional/Basic.lean`, line 197). The finitely supported left-coset model in the same sentence needs no finiteness.

Smallest change: "Over a commutative ring and for `S` of finite index, …".

## C03 — Two of the five statements §7.5 lists under "Prove" are already proved in `Suggested.lean` from the other three

`scalarProjectiveInertiaExtension_class_eq_obstruction` and `cliffordObstruction_eq_native` (README lines 1156 and 1159) carry proofs in the Lean file (lines 288–290 and 309–311): the first is `scalarProjectiveInertiaExtension_class_eq` applied to the chosen extension, the second is Tau Ceti's `TauCeti.IsProjectiveInertiaExtension.cohomologyClass_factorSet_eq_cliffordObstruction`. As targets they ask an implementer for nothing, and a reader counting the open statements of §7.5 finds five where there are three.

Would say in §7.5 that these two follow from the existence and uniqueness statements and are proved in `Suggested.lean` (the second being the comparison with Tau Ceti's class), leaving the three open ones under "Prove".

## C04 — The description lists under "What it adds" material that the README on main already has

The last bullet of "What it adds" names "the scalar Clifford obstruction over an arbitrary field, and the operator presentation of division crossed systems with the isotypic-category equivalence and its restriction–induction comparisons". The README at the merge base has all of these, as its item Layer7.ScalarObstruction and its section Layer7.DivisionCrossedSystem (the description itself says so two paragraphs earlier), and likewise the identity component of the Hom-space decomposition (its Layer 4), the isotypic-decomposition prerequisite (its Layer 5) and the finite-biproduct display of Mackey's formula (its Layer 3a).

Text that would be right: head the list "Open targets, now numbered sections" and keep "adds" for what main does not state: the generator formulas of §0.1, the change-of-representative equivalence of §4.2, Clifford's theorem and correspondence without splitting or invertibility (§§5.2–5.3), §6.1, and the class of a homomorphism to `PGL` in §7.2.

## C05 — The description does not say that the section "Ordering" of main is gone, nor that two references are dropped

A reader comparing with main finds no "Ordering" section and no entry for Karpilovsky's *Projective Representations of Finite Groups* or for Isaacs, Ch. 8, in the References, and the description mentions neither. The build order is now in each layer's Dependencies, and the Layer 7 citations are to Isaacs, Ch. 11.

Text that would be right, added to "What changes in form": "The section 'Ordering' of main is replaced by the Dependencies paragraph of each layer. The references to Karpilovsky and to Isaacs, Ch. 8, are dropped; Layer 7 cites Isaacs, Ch. 11, and Weibel."

## N01 — Four sections state targets with no source locator

§4.2, §7.3, §7.7 and §7.8 cite no text, while §7.6 cites Curtis–Reiner §11 for the same crossed systems. A locator for §§7.7–7.8 would let an implementer check the opposite and inverse conventions against a reference; §4.2 and §7.3 are adapters and may need none.

## N02 — Two entries of the References are cited nowhere in the text

James–Liebeck (Ch. 21) and Alperin–Bell (§16) appear only in the list of references (README lines 1557–1560). Would cite each where it is used, or say in the entry what it is background for.

## Questions for the author

- §6.1 gives "over `ℂ`: Serre, Part II, §9–10" for a statement over a field of characteristic zero that need not split `G`. Does Serre's §12.1 state the basis and orthogonality of the characters of the simple `K[G]`-modules for such a field? The book is behind a paywall and was not read.
- Which results of Curtis–Reiner §11 give Clifford's theorem and the correspondence of §§5.2–5.3 over an arbitrary field, and the crossed systems of §7.6? The text could not be read, so the section-level locators were not checked.

## Previous findings

The previous review (of `67fee23`) had no finding. Its other remarks against this head:

- C01 (the description did not say that "Worked examples (acceptance criteria)" and "Ordering" were removed) — partly repaired: the head has "## Worked examples" again (README line 1336) with the five examples of main, and the description lists it; "Ordering" is still unmentioned (C05 above).
- N01 (four sections without a locator) — not repaired: §4.2, §7.3, §7.7 and §7.8 still cite no text; written again as N01.
- N02 (two references cited nowhere) — not repaired: README lines 1557–1560; written again as N02.
- The two questions for the author are unanswered in the text and are asked again.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §0.1 generator formulas | relations of `Rep.ind` on both levels; inverse after forward | `⟦xg ⊗ ⟦tx⁻¹ ⊗ a⟧⟧ ↦ ⟦tx⁻¹xg ⊗ a⟧ = ⟦tg ⊗ a⟧`; `⟦st ⊗ sa⟧ ↦ ⟦stg ⊗ sa⟧ = ⟦tg ⊗ a⟧`; `⟦tg ⊗ ⟦1 ⊗ a⟧⟧ = ⟦g ⊗ ⟦t ⊗ a⟧⟧` | well defined, mutually inverse | none |
| §2.1.1 adapters | `S₃` on 3 points, `I = A₃`; trivial `f` | invariants of `k³` under `A₃`: dimension 1 = 1 orbit, `C₂` fixes the orbit sum; both `def`s have real bodies, 0 `sorry` | as stated | none |
| §3.1 `isIso_biproductDesc_mackeyInclusion` | `S₃`, `H = K = ⟨(1 2)⟩`, sign; `G = 1`; instance search | double cosets of sizes 2, 4; `1 + 2 = 3 = [G:H]`; `(3, −1) = (1, −1) + (2, 0)`; `HasFiniteBiproducts (Rep k K)` not inferred, `Abelian.hasFiniteBiproducts` elaborates | holds; hypothesis needed as README says | none |
| §4.1 identity component | `C₂`, `H = 1`, `V = k` | `End_G(k[C₂]) = k[C₂]`, dimension 2 = 1 + 1; `c ↦ c·id`, components `(c, 0)` | holds | none |
| §4.3 disjointness, conjugate form | `S₃ ⊃ A₃`, `λ`; `Q₈ ⊃ ⟨i⟩` over `ℝ` | `(1 2)⁻¹(1 2 3)(1 2) = (1 3 2)`, `{}^sλ = λ²`, Hom `= 0`; over `ℝ`: `j⁻¹ij = −i`, conjugation intertwines, Hom of dimension 2 | both sides agree | none |
| §4.4 real `Q₈` example | map `⟦g ⊗ v⟧ ↦ g⁻¹v` | `⟦hg ⊗ hv⟧ ↦ g⁻¹h⁻¹hv`; `x·⟦g ⊗ v⟧ ↦ xg⁻¹v`; dimensions `2 + 2 = 4 = dim ℍᵐᵒᵖ` | equivariant; disjointness fails, simple | none |
| §5.1 isotypic decomposition | `ℚ[C₃]`; `𝔽₃`, `C₂`, three trivial copies | `finrank Hom(U, ℚ[C₃]) = 2`, multiplicity 1; pairing `(3 + 3)/2 = 3 = 0` in `𝔽₃`, Hom dimension 3 | scalar hypothesis and characteristic caveat needed | none |
| §5.2 Clifford's theorem (both forms) | `C₄` on `ℚ²`; `S₃` on `𝔽₂²`; `N = 1`; `N = G`; infinite `G` | `χ(g²) = −2 = 2·(−1)`, `2 = 2·1·1`; `x² + x + 1` irreducible, `e = 1`; `N = 1`: `e = dim W`; `N = G`: `e = 1`; `Σ gV` is `G`-stable, so semisimple without Maschke | holds; one-tactic probe fails | none |
| §5.3 `clifford_correspondence` | `S₄ ⊃ V₄`; `A₃ ◁ S₃` over `ℚ`; `N = 1`, `N = G`; route for finite index only | `[S₄:T] = 3`, 2 of 4 characters of `T` over `χ`, `3 + 3 = 6`; over `ℚ`, `T = S₃`, one simple over `U`; `X ∩ gU ≠ 0 ⇒ X ⊇ U` | bijection `2 ↔ 2`, `1 ↔ 1`; Lean has `[(inertia V).FiniteIndex]`, no `Finite G` | none |
| §6.1 lattice in characteristic zero | `S₃` and `C₃` over `ℚ` | `(3,1,0) = (1,1,1) + (2,0,−1)`; `⟨(1,0,0), 1⟩ = 1/6 ∉ ℤ`; `⟨(2,−1,−1)⟩² = (4+1+1)/3 = 2 ≠ 0` | independent family; pin has it only for `IsAlgClosed` | none |
| §7.1 `AbstractUCE` | `C₂`; `A₅`; Weibel's proof | image of `U` is `[G,G] = 1`; kernel order 2; `F = [F,F]R` gives `[f₁r₁, f₂r₂] ≡ [f₁, f₂]` mod `[F,R]` | holds; perfection step is needed and stated | none |
| §7.2 class of a map to `PGL` | `C₂ × C₂` by `X`, `Z`; constant `α ≡ c`; `V = 0` | `XZ = 1·XZ`, `ZX = −XZ`: `α(a,b)/α(b,a) = −1`; `c·c = c·c`; on `V = 0` every `α` occurs | class nonzero; nonzero `V` needed | none |
| §7.3 twisted algebra coordinates | same class on `C₂ × C₂` | `e_ae_b = e_{ab}`, `e_be_a = −e_{ab}`, `e_a² = e_b² = 1`; dimension 4, noncommutative: `M₂(ℂ)` | as stated | none |
| §7.4 extension of a factor set, representation groups | `C₂`, `α(g,g) = −1`; `Q₈ → C₂ × C₂` | `(1,g)² = (−1, 1)`; coboundary needs `c(g)² = −1`; `ker = {±1} = [Q₈,Q₈]` | as stated | none |
| §7.5 scalar obstruction | `Q₈ ⊃ {±1}` over `ℂ`; `β` a coboundary; `W = V^{(I)}` | linear characters of `Q₈` kill `−1`: no extension, class nonzero; rescaling by `c` with `c(1) = 1` keeps the action of `N`; `Hom_N(V, V^{(I)}) = k^{(I)}` | iff holds both ways; evaluation bijective | C03 |
| §7.6 crossed-system laws | recomputed from `U_qU_r = a(q,r) r(k(q,r)) U_{qr}` | both bracketings of `U_qU_rU_t` give `s(q)s(r)s(t)s(qrt)⁻¹` in `N`; `a(q,r)a(qr,t) = σ_q(a(r,t))a(q,rt)`; gauge `a' = b_qσ_q(b_r)a b_{qr}⁻¹` | as stated | none |
| §7.7 `exists_cliffordMultiplicityFunctor_obj_iso` | `A₃ ◁ S₃` over `ℚ`; `M = 0`; `N = G`; action on `M ⊗_D V` | `(ℚ(ω)/ℚ, σ, 1) ≅ M₂(ℚ)`, 1 simple module, `Ind U` = 2 copies; `A_qA_r(f) = A_{qr}(f)a⁻¹` cancels `a` in `U_qU_r` | well-defined `T`-action; not vacuous | none |
| Layer 2 induced character and pairing | `S₃`, `⟨(1 2)⟩`, sign and trivial; `𝔽₂`, `C₂` | `(3, −1, 0)`; `(9 + 3)/6 = 2` double cosets; `(3 + 3)/6 = 1`; `0⁻¹ = 0` | as stated | C02 |
| Layer 2.1 fixed-coset identity | `S₃`, `g = (1 2)`; infinite `G` | `1·2 = 2·1`; both sides count `{x : x⁻¹gx ∈ H}`, each is `0` exactly when that set is empty or infinite | holds without finiteness | none |
| Layer 2.2 pair in `S₁₆` | element orders | `C₄ × C₄`: 1, 3, 12; `Q₈ × C₂`: 1, 3, `6·2 = 12` | same cycle types | none |
| Layer 4 simplicity criterion | declaration opened | pin: `[Preadditive C] [HasKernels C] [∀ Y, Injective Y]`; README: injectivity only | hypotheses omitted in prose | C01 |
| Worked example, Young subgroups, `n = 4` | shapes `(2,2)`, `(2,1,1)` | `(6,2,2,0,0) = (1,1,1,1,1) + (2,0,2,−1,0) + (3,1,−1,0,−1)`; `(12,2,0,0,0)` = trivial + 2-dim + 2·standard + sign-twisted | as stated | none |

- Source locators checked against the text: the 2 Weibel citations, 4 items (Weibel2013 lines 1949–1959, 1960–1968, 1970–1981: Lemmas 5.3.2–5.3.3, Example 5.3.4, Theorem 5.4, p. 37); 32 further locators into Serre, Isaacs, Curtis–Reiner and Mackey not readable.
- Library declarations: all 370 dotted library names of the README found declared at the pins; 24 opened for their hypotheses, among them `TauCeti.finrank_hom_indFDRep_mackey_erase` (`Mackey/Intertwining.lean` 387, no `CharZero`), `FDRep.clifford_restrict_iso` (`Clifford/Equivalence.lean` 227, `IsAlgClosed`), `FDRep.liesOver_indFDRep_of_inertia` (`Clifford/LiesOver.lean` 45), `FDRep.nonempty_iso_of_liesOver_inertia_of_nonempty_iso_indFDRep` (`Clifford/Injectivity.lean` 54, `Finite G`, `CharZero`), `TauCeti.exists_isProjectiveInertiaExtension` (`Clifford/Obstruction.lean` 162, `IsAlgClosed`), `TauCeti.repRingCharacter_injective` (`RepresentationRing/Injective.lean` 50).
- Cross-roadmap citations resolved on main: SemisimpleAlgebras Layer 1 anchor, CharacterTheory §4.5, InverseGaloisAndArithmeticFundamentalGroups IG.3.4, InductionRestrictionPartII; the five anchors other roadmaps link to (Layers 0, 2.1, 3, 6 and the universal central extensions) resolve at the head; the proposed names in FiniteGroupInvariants (lines 1619–1621) and PseudodifferentialOperators (line 1951) are as the README says.
- Record: the README at the merge base read against the head, layer by layer; Layers 0–7, 2.1, 2.2, 3a, 3b and the five worked examples are present with their statements; no item removed, no id reused.
- Elaboration of `Suggested.lean`: 13 `sorry` warnings and nothing else. One-tactic probe (`rfl`, `infer_instance`, `simp`, `exact?`) on a copy: 0 of 13 close. No `sorry` in a definition, no `set_option`.
- Dependency check: `depcheck: 168 roadmaps, 1944 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed. Changes outside the folder: none.
- Description read sentence by sentence against the head and the base: two remarks (C04, C05), no sentence contradicted.

Overlap check: read ModularInduction, MetaplecticAutomorphicFormsPartII, ArtinRepresentations, GlaubermanZStar and CohomologyOfGroups at their open heads and ModularCharactersAndBlocksPartII, FiniteGroupInvariants and ModularInduction on main; nothing shared (each cites this roadmap's layers; CohomologyOfGroups leaves the existence of the universal central extension to its supplier). No list by named results was produced.

Source independence: 4 passages compared with 1 source (Weibel2013), none shared; largest share Serre and Isaacs, 10 of 34 locators each, neither readable; contents compared with both by chapter titles only: independent (Isaacs Ch. 5, 6, 11 against Layers 2, 5, 7 with Layers 0, 1, 3, 4, 6 between; Serre Ch. 7, 9–12 against Layers 2–4, 6).

Research link: §7.1 is the universal central extension that Weibel (2013, Ch. III, Theorems 5.4–5.5) uses for the Kervaire–Steinberg identification of `K₂(R)`, consumed by StableHomotopyKTheory; Layers 5 and 7 feed ModularCharactersAndBlocksPartII and ArtinRepresentations. Rests on Weibel2013 lines 1970–1987 and the README's Downstream consumers.

## Not verifiable

- Serre, *Linear Representations of Finite Groups*, Part II (Layers 2, 4, 6; §§4.1, 4.3, 6.1): the sources service resolves it only to a paywalled page; not read.
- Isaacs, *Character Theory of Finite Groups*, Ch. 5, 6, 11 (Layer 2; §§5.1–5.3, 7.2, 7.4–7.6): no legal copy found by the sources service, none held locally; not read.
- Curtis–Reiner, *Methods of Representation Theory I*, §§10–11 (§§0.1, 3.1, 5.1–5.3, 7.6): no legal copy found; not read.
- Mackey, Amer. J. Math. 73 (1951), 576–592 (§3.1, Layer 4): the DOI leads to a paywalled host; not read.
- James–Liebeck and Alperin–Bell (References only): not read.
- How the hosting site renders the `<a id>` element before §7.1 was not tested in a browser.

Automatic checks set aside as false positives: the citation resolver lists eight names as found nowhere, of which seven are declared in this head's `Suggested.lean` (six in the namespace `AbstractUCE` and `Gassmann.normalInvariantEquiv`) and the eighth is the roadmap's own namespace; the signature check flags a dropped `[Group G]` on `AbstractUCE.derived`, the commutator subgroup of the free group on the set `G`, which uses no group structure on `G`.

## Source issues

- **Gap** in Weibel2013 at Ch. III, Recognition Theorem 5.4, p. 37: the source says uniqueness of the map out of `[F,F]/[R,F]` follows from Lemma 5.3.3, without showing that group perfect as the lemma requires; it should be noted that perfect `G` gives `F = [F,F]·R`, so every commutator of `F` is a commutator of elements of `[F,F]` modulo `[R,F]`; affects the proof.

## For the human reviewers

- Not tested: Serre and Isaacs share the largest number of locators (10 of 34 each in the README body) and neither could be read legally; wording was not compared with them, and their contents only by chapter titles.
