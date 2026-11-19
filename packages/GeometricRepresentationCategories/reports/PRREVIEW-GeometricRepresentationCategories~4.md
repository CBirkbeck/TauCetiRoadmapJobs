# Review of GeometricRepresentationCategories (pull request #2579 at 3e11d5b)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 17 lines of §3.4 changed since `4ae6385`, and of the pull request's description against this head. The repair of §3.4 is correct: the covariance isomorphism and the coherence are now stated as consequences of the pinned family's cells, the two factorizations in `H ⋊ S` compute as written, and the description agrees with the head. There are no small corrections and four format notes carried from the previous review, none blocking; nothing is left for a human to decide.

## N01 — Convention 9 and the Tau Ceti contract say names in `CategoryTheory` drop that prefix, but the `MonoidalLeftAction` names are in `CategoryTheory.MonoidalCategory`

Mathlib `CategoryTheory/Monoidal/Action/Basic.lean` opens `namespace CategoryTheory.MonoidalCategory` at line 42, so a reader restoring only `CategoryTheory.` finds none of `MonoidalLeftAction`, `MonoidalLeftAction.pseudofunctor`, `MonoidalLeftAction.curriedActionMop`. Name the second namespace in Convention 9 (line 98) and in the opening of "From Tau Ceti" (line 1014).

## N02 — In §1.2 (line 173), "an action of `D` by exact functors" should read "an action on `D`": `D` is the category acted on.

## N03 — The References list Johnson–Yau, Theorem 8.4.1, p. 238 (line 1156), but no layer cites it. Cite it where it is used, or drop the locator.

## N04 — The unit of §4.2's biequivalence is statable at the pins, should the author want one statement in `Suggested.lean`

As in the previous review: `Nonempty (Bicategory.Equivalence L L.normalizedTransport.toLift)` for `L : TauCeti.EquivariantGroupoidLift Γ actions` elaborates at the pins. It is weaker than the headline, so leaving the file as it is conforms to the rule against substitutes; this is an offer.

## Previous findings

The previous review had no finding (no R-numbered point); its small correction and format notes are accounted for here.

- C01 — repaired: "The covariance isomorphism `T_σ ∘ T_h ≅ T_(βσ h) ∘ T_σ` is then the composite of the family's `Pseudofunctor.mapComp` cells … and the product and unit coherence are the pseudofunctor axioms of the family." No new problem introduced.
- N01 — not repaired: "names in the namespace `CategoryTheory` are written without that prefix" (lines 98–99, 1014–1015). Carried as N01.
- N02 — not repaired: "an action of `D` by exact functors" (line 173). Carried as N02.
- N03 — not repaired: "Theorem 8.4.1, p. 238 (coherence for bicategories)" (line 1156), cited by no layer. Carried as N03.
- N04 — an offer, not taken up; `Suggested.lean` is unchanged and still conforms. Carried as N04.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §3.4 two factorizations in `H ⋊ S` (sampled target) | Mathlib `mul a b = ⟨a.1 * φ a.2 b.1, a.2 * b.2⟩` (`GroupTheory/SemidirectProduct.lean:64`) | `(1,σ)(h,1) = (1·βσ(h), σ) = (βσh, σ)`; `(βσh,1)(1,σ) = (βσh·β₁(1), σ) = (βσh, σ)` | equal | none |
| §3.4 covariance isomorphism as `mapComp` composite | `ActionCategory.comp_hom : (f ≫ g).hom = g.hom * f.hom` (`CategoryTheory/Action.lean:124`); `mapComp f g : map (f ≫ g) ≅ map f ≫ map g` (`Pseudofunctor.lean:60`) | label `(1,σ)(h,1)`: first `(h,1): p→p`, then `(1,σ)`, functor `T_σ∘T_h`; label `(βσh,1)(1,σ)`: functor `T_(βσh)∘T_σ`; both ≅ image of `(βσh,σ)` | true; one cell inverted, as "composite" allows | none |
| §3.4 arrow `(h,σ) ↦ T_h^(σ·p) ∘ T_σ^p` against the pinned family | transport is restriction along `(a g)⁻¹` (`discreteCentralCharacterFamily_map_toFunctor_obj_obj`); `a(h,σ) = a_h∘aσ` | `(a_h aσ)⁻¹ = aσ⁻¹∘a_h⁻¹`; restriction along `f∘g` is restrict-`f` then restrict-`g`, so `T_σ` first, then `T_h` | agrees | none |
| §3.4 covariance against A4.2's conjugacy | `T_σ∘T_h` = restriction along `(aσ a_h)⁻¹`; `aσ a_h = a_(σ(h)) aσ` | right side: restriction along `(a_(σh) aσ)⁻¹ = T_(βσh)∘T_σ`; Check's `diag(t,t⁻¹)`, `φ=at`: `a²e_(n+2)` both sides | consistent with the Check | none |
| §3.4 character equation on `H ⋊ S` | family's hypothesis `χ (g • x) = (χ x).comp (centerCongr (a g)).symm`; `g = (h,σ)` | `(a_h aσ)⁻¹|_Z = aσ⁻¹∘a_h⁻¹|_Z = aσ⁻¹|_Z` as `a_h` fixes `Z`; `(h,σ)·p = σ·p`; gives `χ_(σ·p) = χp∘aσ⁻¹`, §3.3's | true | none |
| §3.4 citation of A8.3 for "`a_h` fixes `Z`" | AffineLieAlgebras on main, A8.3 | A8.3 asks to prove that the original `G((t))` action fixes the critical centre pointwise, and `eval_(σp) = eval_p ∘ a_σ⁻¹` | supported | none |
| §3.4 objects of the arrows | `(h,1)` at `p`; `(βσh,σ)` at `p` | `H` acts on opers through `S`: `(h,1)·p = p`, `(βσh,σ)·p = σ·p`, so both composites run `p → σ·p` | well-typed | none |

Rows for the untouched statements stand as in the previous review, of `4ae6385`.

- Source locators: the changed passage carries none; its two supplier citations (AffineLieAlgebras A4.2, A8.3) were read on main. The sampled target falling in the change is §3.4; the other sampled sections are untouched.
- Library declarations opened at the pin: Mathlib `CategoryTheory/Bicategory/Functor/Pseudofunctor.lean:57–60` (`Pseudofunctor`, `mapComp`, in namespace `CategoryTheory`), `GroupTheory/SemidirectProduct.lean:63–66`, `CategoryTheory/Action.lean:124–125`; Tau Ceti `Algebra/Category/ModuleCat/CentralCharacter/ActionCategory.lean:107–157` (`TauCeti.discreteCentralCharacterFamily` and its transport lemmas).
- Cross-roadmap citations resolved: AffineLieAlgebras A4.2 and A8.3 and FormalConnectionsOpers §5.1 on main (headings present; A8.3 read). No open pull request drops an id this roadmap cites.
- Automatic checks at this head: all passed, none set aside. Dependency check output: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives no message. The file has no declaration (unchanged since `4ae6385`), so there is no signature to compare and no padding to probe.
- Pull-request description against this head: its §3.4 sentences (covariance as two `mapComp` cells at `(1, σ)(h, 1) = (βσ h, σ) = (βσ h, 1)(1, σ)`, coherence as pseudofunctor axioms, character equation from §3.3, restriction to loop arrows still to prove) match lines 433–438; 28 Checks counted; it says the roadmap on main is revised, the R-label correspondence (lines 55–56), the 28 old Lean declarations removed and the two suppliers. No sentence contradicts the head and no change is left unstated.
- Headline theorems: unchanged; none statable at the pins, and the module docstring says which carrier each lacks, as in the previous review.

Overlap check: read AffineLieAlgebras, FormalConnectionsOpers (the closest roadmaps, open and on main; the list by results is empty). Shared objects and owners as in the previous review: the completion, loop and coordinate lifts, the Feigin–Frenkel normalizations, the centre-fixing property and the coordinate character equation belong to AffineLieAlgebras; opers, `K_N`, the gauge groupoid and `IsomOp` belong to FormalConnectionsOpers; coherent actions, fibres, the family over `H ⋊ S`, descent and the outer-derivation map belong to this roadmap.

Source independence: changed passages only; 1 passage (the rewritten sentences of §3.4) compared with 0 sources, since it carries no source locator and states only a semidirect-product identity and library cells; nothing shared. Largest share Frenkel2007, 14 of 22 locators, as in the previous review; the arrangement was not compared again, the change adding, removing or reordering no layer.

Research link: the roadmap makes precise Frenkel–Gaitsgory's local geometric Langlands proposal (2006, (0.8)–(0.9)) and Frenkel's Conjectures 10.1.2 and 10.3.10 (2007); §5.2 is Frenkel–Gaitsgory's Lemma 7.4.1, Theorem 7.4.2 and map (7.2); §5.1 uses the Frenkel–Zhu oper-reduction theorem. Rests on the README and the two sources read.

## Not verifiable

- The sources were not opened again in this round: the changed passage cites none. The items of the previous review stand (the Zulip discussion and the Mathlib pull request in the References not opened; printed editions not compared with the open copies).

## Source issues

- none

## For the human reviewers

- none
