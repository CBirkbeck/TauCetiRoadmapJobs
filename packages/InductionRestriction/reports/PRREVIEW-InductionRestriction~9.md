# Review of InductionRestriction (pull request #2639 at 3595e3b)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 36 lines changed since `d4b968d`: the three README repairs (the hypotheses of the simplicity criterion in Layer 4, finite index for the coset models in Layer 2, the two corollaries of §7.5) each agree with the declaration they name at the pin, and the description now states what the previous review asked of it. There is one small correction (the description's paragraph on `Suggested.lean` does not mention the two proved corollaries) and two format notes carried over, none blocking. For the humans: Serre, Isaacs, Curtis–Reiner and Mackey are behind paywalls and were not read.

## C01 — The description says `Suggested.lean` "states only the targets that the pinned libraries do not already prove", while the file also proves two corollaries that §7.5 no longer counts as targets

After this change §7.5 of the README says that `scalarProjectiveInertiaExtension_class_eq_obstruction` and `cliffordObstruction_eq_native` "follow from these and are proved in `Suggested.lean`" (README lines 1160–1166), and the file proves them (lines 281–290 and 303–311). A reader of the description who counts the file's open statements against "the scalar Clifford obstruction" expects five statements with `sorry` in §7.5 and finds three, with two proofs beside them.

Text that would be right, added to the paragraph "Suggested.lean": "For the scalar obstruction it states existence, uniqueness of the class and the vanishing criterion, and proves from them two corollaries: every compatible extension has the obstruction class, and over an algebraically closed field the class is Tau Ceti's."

## N01 — Four sections state targets with no source locator

§4.2, §7.3, §7.7 and §7.8 cite no text, while §7.6 cites Curtis–Reiner §11 for the same crossed systems. A locator for §§7.7–7.8 would let an implementer check the opposite and inverse conventions against a reference; §4.2 and §7.3 are adapters and may need none.

## N02 — Two entries of the References are cited nowhere in the text

James–Liebeck (Ch. 21) and Alperin–Bell (§16) appear only in the list of references (README lines 1563–1566). Would cite each where it is used, or say in the entry what it is background for.

## Questions for the author

- §6.1 gives "over `ℂ`: Serre, Part II, §9–10" for a statement over a field of characteristic zero that need not split `G`. Does Serre's §12.1 state the basis and orthogonality of the characters of the simple `K[G]`-modules for such a field? The book is behind a paywall and was not read.
- Which results of Curtis–Reiner §11 give Clifford's theorem and the correspondence of §§5.2–5.3 over an arbitrary field, and the crossed systems of §7.6? The text could not be read, so the section-level locators were not checked.

## Previous findings

The previous review (of `d4b968d`) had no finding. Its other remarks against this head:

- C01 (simplicity criterion without additive structure and kernels) — repaired: "In a preadditive category with kernels in which every object is injective, …" (README line 576), the hypotheses of `CategoryTheory.simple_iff_nontrivial_end_and_isUnit` at the pin.
- C02 (product model without finite index) — repaired: "Over a commutative ring and for `S` of finite index, `Ind_S^G A` is, as a module, the product of copies of `A` …" (README line 239); both named equivalences carry `[S.FiniteIndex]`.
- C03 (two proved statements listed under "Prove" in §7.5) — repaired: three statements remain under "Prove"; "Two statements follow from these and are proved in `Suggested.lean`" (README line 1160), with the route of each as the file has it.
- C04 (description listed under "What it adds" material main has) — repaired: the list is headed "Open targets, now numbered sections", says each "states, in exact form, a target that main already has", and names the generality of §§5.2–5.3 and §6.1 as what is new.
- C05 (description silent on "Ordering" and two references) — repaired: "The section "Ordering" of main is replaced by the Dependencies paragraph of each layer. The references to Karpilovsky's … and to Isaacs, Ch. 8, are dropped".
- N01 (four sections without a locator) — not repaired: written again as N01.
- N02 (two references cited nowhere) — not repaired: written again as N02.
- The two questions for the author are unanswered in the text and are asked again.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Layer 4 simplicity criterion (changed) | `FDRep ℚ C₃`: 2-dim simple, regular, zero object; declaration opened | simple: `End = ℚ(ω)`, a field of dimension 2; regular: `End = ℚ × ℚ(ω)`, `(1, 0)` nonzero non-unit; zero: `End = 0`, not nontrivial; pin has `[Preadditive C] [HasKernels C] [∀ Y, Injective Y]` | prose equals the declaration; criterion separates all three | none |
| Layer 2 coset models (changed) | `C₂ ⊃ 1` over `ℤ`; `G = ℤ ⊃ 1` | `Ind = ℤ[C₂]`, rank `2 = [G:S]·1`, product of 2 copies; `ℤ[ℤ]` is countable, `∏_ℤ ℤ` is not | finite index needed for the product; `indSubtypeEquivPi` and `indLeftCosetCoinvariantEquiv` both carry `[S.FiniteIndex]` | none |
| §7.5 class of every extension (changed) | `Q₈ ⊃ {±1}`, `V` the sign, `ρ(ε·s(q)) = ε`; rescaling `ρ' = c·ρ`, `c = 1` on `N` | `β(ī, j̄)/β(j̄, ī) = −1`, an invariant of the class on `C₂ × C₂`: class nonzero; `−1 ∈ [Q₈, Q₈]`: no ordinary extension; `β' = β·δc`, same class | iff and uniqueness agree; the proof in the file is uniqueness applied to the chosen extension | C01 |
| §7.5 comparison with Tau Ceti's class (changed) | algebraically closed `k`; declaration opened | `TauCeti.IsProjectiveInertiaExtension.cohomologyClass_factorSet_eq_cliffordObstruction` (`Clifford/Obstruction.lean` 309): every extension has class `TauCeti.cliffordObstruction A`; applied to the chosen one gives the equality | as the README now says; elaborates without `sorry` | C01 |

The rows for the untouched statements stand as in the previous review, of `d4b968d`.

- Source locators checked against the text: none falls in the changed passages (the one locator there, Isaacs, Ch. 11, in §7.5, is untouched and not readable); the Weibel locators stand as checked before.
- Library declarations opened at the pin for this round: 5 (`CategoryTheory/Simple/Endomorphism.lean` 53–58; `Induction/FiniteDimensional/Basic.lean` 197; `Induction/FiniteDimensional/LeftCoset.lean` 43–48; `Induction/Clifford/Obstruction.lean` 250 and 309).
- Record: no layer or item removed, retitled or added against the merge base; the change touches no heading and no id.
- Elaboration of `Suggested.lean`: 13 `sorry` warnings and nothing else; no `set_option`, single `import Mathlib` followed by six Tau Ceti modules; the diff changes no Lean statement, so the one-tactic probe of the previous review stands.
- Dependency check: `depcheck: 171 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed. Changes outside the folder: none.
- Description read against the head and the README at the merge base: main has the nested-subgroup generator comparison (Layer 0), the representative-change comparison (Layer 3a), the class of a homomorphism to `PGL` (Layer 7) and the virtual-character lattice over a splitting field of characteristic zero (Layer 6), as the description says; one remark (C01), no sentence contradicted.

Overlap check: read ModularInduction, MetaplecticAutomorphicFormsPartII, ArtinRepresentations, GlaubermanZStar and CohomologyOfGroups at their open heads and ModularCharactersAndBlocksPartII, FiniteGroupInvariants and ModularInduction on main, as in the previous review; nothing shared, and the change adds no object. No list by named results was produced.

Source independence: changed passages only; 3 passages compared with 0 sources (the changed sentences cite Tau Ceti declarations and one unreadable locator), none shared; largest share Serre and Isaacs, 10 of 34 locators each, neither readable; the diff adds, removes or reorders no layer, so the contents were not compared again.

Research link: §7.1 is the universal central extension that Weibel (2013, Ch. III, Theorems 5.4–5.5) uses for the Kervaire–Steinberg identification of `K₂(R)`, consumed by StableHomotopyKTheory; Layers 5 and 7 feed ModularCharactersAndBlocksPartII and ArtinRepresentations. Rests on Weibel2013 lines 1970–1987 and the README's Downstream consumers.

## Not verifiable

- Serre, *Linear Representations of Finite Groups*, Part II (Layers 2, 4, 6; §§4.1, 4.3, 6.1): paywalled; not read.
- Isaacs, *Character Theory of Finite Groups*, Ch. 5, 6, 11 (Layer 2; §§5.1–5.3, 7.2, 7.4–7.6): no legal copy found; not read.
- Curtis–Reiner, *Methods of Representation Theory I*, §§10–11 (§§0.1, 3.1, 5.1–5.3, 7.6): no legal copy found; not read.
- Mackey, Amer. J. Math. 73 (1951), 576–592 (§3.1, Layer 4): paywalled; not read.
- James–Liebeck and Alperin–Bell (References only): not read.

Automatic checks set aside as false positives: the citation resolver lists eight names as found nowhere, of which seven are declared in this head's `Suggested.lean` (six in the namespace `AbstractUCE` and `Gassmann.normalInvariantEquiv`) and the eighth is the roadmap's own namespace; the signature check flags a dropped `[Group G]` on `AbstractUCE.derived`, the commutator subgroup of the free group on the set `G`, which uses no group structure on `G`.

## Source issues

- **Gap** in Weibel2013 at Ch. III, Recognition Theorem 5.4, p. 37: the source says uniqueness of the map out of `[F,F]/[R,F]` follows from Lemma 5.3.3, without showing that group perfect as the lemma requires; it should be noted that perfect `G` gives `F = [F,F]·R`, so every commutator of `F` is a commutator of elements of `[F,F]` modulo `[R,F]`; affects the proof.

## For the human reviewers

- Not tested: Serre and Isaacs share the largest number of locators (10 of 34 each in the README body) and neither could be read legally; wording was not compared with them, and their contents only by chapter titles.
