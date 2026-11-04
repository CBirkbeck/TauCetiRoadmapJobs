# GATE-AlgebraicKTheory~2: answers to the review of `f590526`

The review was written against `f590526`. Head `9d466d0` adds the A0 sphere/Möbius subsections and two helper Lean files after line 49; the line numbers below refer to the repaired README (commit `8881692`). Points are numbered in the order R01…R08 make them. The status notes on roed-math's earlier items (A6 lift fixed; A8 partly fixed) are folded into H01–H03.

## H01 (rwst) — answered
A4 remains the single owner of `HasCoveringDimensionLE` and nothing in this roadmap changes. No roadmap on main defines covering dimension (grep of every README on main, Mathlib `f6090c7`, Tau Ceti `358314d`: no hits). The competing `CoveringDimensionCore` sits in the GeometricTopology pull request at head `778c5a5` (README :5052–5078 there), and that pull request revises a roadmap already on main, so it cannot be a supplier here. The amendment the review asks for (GeometricTopology consumes A4's predicate and value and keeps only its locally finite paracompact extension) has to be made in that pull request, not in these files.

## H02 (rwst) — disputed
Requested: amend OperatorKTheory K1 to use `TauCeti.finiteProjectiveModules Aᵐᵒᵖ`, then delete A8's identification sentence. The amendment belongs to the OperatorKTheory pull request. At its head `d1b2465`, OperatorKTheory K1 (README :118–126) still constructs its own essentially small category of finitely generated projective right modules. As long as it does, A8's sentence identifying that category with A0's Proj(A) (README :133) is the only step that makes A0's K₀(A) the group of OperatorKTheory's natural isomorphism, so deleting it now would leave A8's K₀ comparison unsupported. The sentence can go once K1 is restated on the Tau Ceti category.

## H03 (rwst) — applied
A8 now consumes OperatorKTheory K2's polar-deformation comparison instead of re-proving it. README :133 "identify it with OperatorKTheory K2's unitary K₁ in the C* case" → "in the C* case identify it with OperatorKTheory K2's unitary K₁ by consuming K2's natural polar-deformation comparison between stable unitaries and stable invertibles … no second comparison is proved here". The ownership paragraph (:17) now lists that comparison under K2. The source is OperatorKTheory README :158–160 at `d1b2465`.

## H04 (rwst) — answered
The merge-order block lives in the pull-request text, which this job cannot edit; it has to be added there. In the board merge order, HilbertModules (line 204) comes before AlgebraicKTheory (line 274). OperatorKTheory is not in the merge order: it is an open new-roadmap pull request by the same author. So this roadmap's merge has to wait for both HilbertModules and OperatorKTheory, as the review says. The mechanical depcheck does not see OperatorKTheory, because A8 names it without a link.

## H05 (rwst) — applied
A3 now defines the relative triple group K₀(T) for any small additive functor T:C→D, and K₀(R,I) is its specialisation K₀(T_I) to base change along R→R/I (README :73). The boundary δ:K₁ᴮ(D)→K₀(T) and the five-term sequence are stated for full, summand-dense T, and base change T_I is shown to be both (:81). To make §4.16's generic boundary sourceable here, A2 now gives the automorphism presentation K₁ᴮ(C) for any small additive category (:65). The ownership paragraph (:19) drops the comparison it had assigned to GeneralAlgebraicKTheory, which does not exist there (verified: §8.7 at `f16a788` compares only relative π₀ and A3's K₁(R,I)). It now says that GeneralAlgebraicKTheory's `ClassicalRelativeK0` and `ClassicalAdditiveK1` (§§4.15–4.16) are these same groups, and that its §§4.16–4.17 extend the boundary beyond full functors. Restricting to full T is a deliberate departure from the review's suggestion: with direct-sum relations only, I could not verify independence of complements when an isomorphism X⊕Y≅T(P) does not lift. Base change is full, so nothing the roadmap uses is lost. The reciprocal edit, making §§4.15–4.16 consume A3, has to be made in the GeneralAlgebraicKTheory pull request.

## H06 (rwst) — applied
A3 now has a target comparing Weibel's short-exact-sequence relation with the direct-sum relation, for full T (README :73). The argument: split P and Q, factor α as a unipotent automorphism with corner γα″⁻¹ composed with α′⊕α″, lift the unipotent factor by fullness, and use (Q,T(v),Q)=0. A second target proves that T_I is full, because P is projective and Q→Q/QI is onto. Locator: Weibel II, Definition 2.10, relation (a) (`Weibel-KBook` Chapter II, lines 613–626). Fullness is needed for the lift: base change along ℤ→ℚ is not full, since Hom(ℤ,ℤ)=ℤ does not map onto ℚ, so no claim is made for localisations.

## H07 (rwst) — applied
README :19 now splits the comparison of ordinary ring K-theory with the groups built here:
- GeneralAlgebraicKTheory §3.14 (`ringKGroup.zeroEquiv`, `ringKGroup.oneEquiv`): π₀ with A0's K₀ and π₁ with A2's K₁.
- GeneralAlgebraicKTheory §8.7: relative π₁ with A3's K₁(R,I).
- GeometryOfNumbersAndQuadraticArithmetic §6.1.7: the right-projective adapter, π₂ with A5's Steinberg K₂, and transport of A6's boundary.
- GeometryOfNumbersAndQuadraticArithmetic §6.10: the plus-construction comparison.

The list of what GeneralAlgebraicKTheory consumes changed from "A0–A2 and A6" to "A0–A3 and A6". This was checked at heads `f16a788` (§3.14 at :658–677, §8.7 at :1835–1849) and `cd2b780` (§6.1.7 at :2238–2250).

## H08 (rwst) — applied
A3 (:71) "Construct the connecting map K₂(R/I)→K₁(R,I) in A5 and prove the exact sequence K₂(R)→…" → "Prove that K₁(R,I)→K₁(R)→K₁(R/I) is exact at K₁(R); A5 extends this sequence to the left by K₂". A5 (:97) now constructs K₂(R/I)→K₁(R,I) itself and proves exactness at K₂(R/I) and K₁(R,I). The previous wording had A5 deferring this back to A3.

## H09 (rwst) — applied
A3 (:83) "reduced Kᵢ(J) … i=0,1,2" → "i=0,1; A5 gives the case i=2". A5 (:97) now defines reduced K₂(J)=ker(K₂(J⁺)→K₂(ℤ)) on A3's Dorroh unitisation, with its splitting and its maps for nonunital homomorphisms.

## H10 (rwst) — applied
A2 (:67) "Prove compatibility with products, filtered colimits and A6's boundaries" → "… products and filtered colimits; compatibility with A6's boundary is proved in A6". A6 (:117) now proves that δ commutes with A2's Morita isomorphisms and finite-product decompositions on all four rings of the square, and with filtered colimits of squares.

## H11 (rwst) — applied
A0 (:25) now cites these declarations at the pins instead of planning them:
- Tau Ceti `358314d`: `CategoryTheory.Equivalence.finiteProjectiveModulesK0Equiv` (`CartanMap/Morita.lean:215`) and `RingEquiv.finiteProjectiveModulesK0Equiv` (`CartanMap/RingEquiv.lean:254`). Both are stated for the exact K₀ and are transported to `KZero` by `finiteProjectiveModulesExactStructure_eq_split`.
- Mathlib `f6090c7`: `ModuleCat.matrixEquivalence` (`RingTheory/Morita/Matrix.lean:187`).

The targets kept here are the ring isomorphism Mₙ(R)ᵐᵒᵖ≅Mₙ(Rᵐᵒᵖ) for noncommutative R and the corner-module convention P↦P¹ˣⁿ, with [R]↦[e₁₁Mₙ(R)] and the free module Mₙ(R) going to n[R]. Mathlib's `Matrix.transposeRingEquiv` needs `CommMagma` entries (`Data/Matrix/Basic.lean:917`), so it does not cover the noncommutative case.

## H12 (rwst) — applied
A0 (:23) "Prove that every object is a direct summand of Rⁿ …" → the statement is Mathlib's `Module.Finite.exists_comp_eq_id_of_projective` (`RingTheory/Finiteness/Projective.lean:28`, for a semiring and a finite projective module), applied over Rᵐᵒᵖ. Only its packaging as a complement object of Proj(R) is left as a target.

## H13 (rwst) — applied
`Matrix.SpecialLinearGroup.elementary` does not exist at Mathlib `f6090c7`. README :15 now states the target without that name: for commutative R, the image under `Matrix.SpecialLinearGroup.toGL` of the subgroup of SL generated by the `Matrix.transvection i j c` with i≠j is `elementary`. It adds that neither pinned library names that subgroup of SL, so building it is a target here. Two checks: over 𝔽₂ with n=2 both sides are GL₂(𝔽₂)≅S₃; with n=1 both are trivial.

## H14 (rwst) — applied
The "AlgebraicTopology its CW gluing and bundle clutching" clause was deleted; AlgebraicTopology on main contains no clutching. README :17 now credits clutching to TopologicalKTheory T1 (its README :225 on main) and the compact Hausdorff pushout to Mathlib's `CompHaus.hasColimits` (`Topology/Category/CompHaus/Basic.lean:133`).

## H15 (rwst) — applied
`elementary_le_commutator` (Suggested.lean:81–82, README :57): "Lemma 1.3.3" → "Lemma 1.3.2", which says Eₙ(R) is perfect for n≥3 (`Weibel-KBook` Chapter III, line 171). `whitehead_commutator_elementary` now cites Whitehead's Lemma 1.3.3 with the factorisation (1.3.4) (lines 179–194).

## H16 (rwst) — applied
Suggested.lean:51 and README :29 "the division-ring example after Definition 2.1" → "the division-ring example … before Lemma 2.1". There is no Definition 2.1 in Chapter II; the example is at `Weibel-KBook` Chapter II line 204, and Lemma 2.1 is at line 226.

## H17 (rwst) — applied
The triple group (README :73) now cites Weibel II, Definition 2.10, Exercise 2.17(a)–(b) and Exercise 2.4(e) (`Weibel-KBook` Chapter II, lines 613–635, 688 and 775–781). The boundary and exactness cite (2.10.2) and Exercise 2.17(c)–(e).

## H18 (rwst) — applied
A4 (:89), the references (:142) and Suggested.lean:145 "Bass, K-theory and stable algebra (1964), Theorem V.3.5" → "Bass, Algebraic K-Theory, Benjamin 1968, Theorem V.3.5", which is the work Weibel cites as [Bass, V.3.5] (`Weibel-KBook` Chapter I, lines 148–154). Bass's book is paywalled, so this locator is uncertified.

## H19 (rwst) — applied
The Milnor reference (:139) now adds "§7, the case of a commutative Banach algebra, is the classical source for A8". The book is behind a paywall (JSTOR), so the section title is cited by its locator only (uncertified).

## H20 (rwst) — applied
The Suggested.lean docstring now reads "this file is not the roadmap and is not exhaustive". README :7 now reads "Suggested.lean is its acceptance test, not an exhaustive list of its targets".

## H21 (rwst) — disputed
Neither dropped item is a headline. `elementary_lift` follows directly from lifting the finitely many coefficients of each generator; README :59 keeps it as an A1 target. A6's fibre-product ring is Mathlib's `RingHom.pullback` (`RingTheory/LocalRing/Pullback.lean:52`), so re-defining it as `pullbackRing` would duplicate the library. A6 (:103) now cites `RingHom.pullback`, `RingHom.pullbackFst` and `RingHom.pullbackSnd`.

The same check found a stale statability claim. Tau Ceti `358314d` does have `TauCeti.BalancedTensorProduct` (`LinearAlgebra/TensorProduct/Balanced/Basic.lean:48`), but only as a ground-ring module, with `lift`, `liftEquiv`, `map`, `lid` and `rid`, and no outer action. The Suggested.lean docstring and README :11 now say exactly that. :11 previously linked an unpinned commit and named `Actions`, `Associator` and `Coherence` modules and `rightModule`/`leftModule`; none of these exist at the pin, and the outer actions are now targets. Milnor patching therefore remains not statable.

## H22 (rwst) — applied differently
A5 (:95) now spells out the three conditions: surjective, central kernel, and exactly one lift over E∞ to every central extension. Locator: Weibel III, Definition 5.3.1 and Theorem 5.5 (`Weibel-KBook` Chapter III, lines 1941 and 1984). The predicate is consumed from StableHomotopyKTheory §3.29 (`IsUniversalCentralExtension`) rather than defined a second time. That roadmap is line 4 of the merge order, before this one, so it is a permitted supplier and not downstream as the review assumes. §3.29's *Needs* contain nothing from this roadmap.

## H23 (rwst) — applied
README :29 "K₀(ℤ) as ℤ, of finite products …" → "Compute K₀(ℤ) as ℤ, K₀ of finite products by components and K₀ of matrix rings by the corner-module Morita map above."

## H24 (rwst) — applied
README :11–13: the double blank line was removed and the hard-wrapped paragraph was joined. The same repair was applied to the A0 sphere and Möbius paragraphs added at `b8d701c`–`9d466d0` (:31–55), which were hard-wrapped the same way.

## H25 (rwst) — answered
The pull-request body is not one of the roadmap files and cannot be edited by this job; it has to be rewritten to match `8881692`. Facts it needs to reflect:
- A4 owns covering dimension.
- A3 now owns the generic relative triple group, which GeneralAlgebraicKTheory §§4.15–4.16 are to consume.
- Suggested.lean has ten `sorry`s.
- The two helper files `MobiusSectionTargets.lean` and `SphereComplexificationTargets.lean` exist.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| K₀(T), invariance/sum/composition relations (A3) | T=id; D=0; R=ℤ, I=5ℤ | id: (P,α,Q)≅(Q,id,Q), group 0. D=0: K₀(T)≅K₀(C), so K₀(R,R)=K₀(R) and K₀(R,0)=0. ℤ,5ℤ: K₀(ℤ)→K₀(𝔽₅) is ℤ→ℤ, identity on rank, so the difference map is 0 and K₀(ℤ,5ℤ)=𝔽₅ˣ/{±1}={1,4,2,3}/{1,4}≅ℤ/2, generated by (ℤ,2,ℤ) | holds | added as three Checks |
| Exact-sequence presentation = sum presentation for full T | block computation; ℤ→ℚ | α=[[1,γα″⁻¹],[0,1]]·diag(α′,α″) has corner γα″⁻¹α″=γ. Hom(ℤ,ℤ)=ℤ→ℚ is not onto | holds for full T; fullness needed | hypothesis "T full" stated |
| T_I full | ℤ→𝔽₅, P=Q=ℤ | Hom(ℤ,ℤ)=ℤ→𝔽₅ onto | holds | — |
| K₁ᴮ split-exact relation (A2) | ℤ, [[1,1],[0,1]] and [[−1,1],[0,1]] | the first is elementary, class 0=[1]+[1]; the second has det −1, class [−1]=[−1]+[1]. Unipotent⊕id_Y = [e₁₃(δ),e₃₂(1)] | holds | — |
| Boundary δ on T_I | u=2∈GL₁(𝔽₅) | δ[2]=[(ℤ,2,ℤ)]≠0, since 2∉{±1} | consistent with A7's ℤ/2 | — |
| A5 relative sequence, exact at K₂(R/I), K₁(R,I) | ℤ, 5ℤ | K₂(𝔽₅)=0 and K₁(ℤ)→𝔽₅ˣ is injective (−1↦4), so K₁(ℤ,5ℤ)=0, matching (1+5ℤ)ˣ={1} | holds | — |
| UCE conditions (A5) | R=ℤ; zero ring | ker St(ℤ)→E(ℤ) = K₂(ℤ)=ℤ/2, central. Zero ring: St=E=1 | holds | — |
| Corner Morita convention (A0) | k field, n=2 | k↦row space k¹ˣ²=e₁₁M₂(k); free M₂(k) is two rows, giving 2[k] | holds | — |
| SL transvection image = `elementary` (A0/A1) | 𝔽₂, n=2; n=1 | SL₂(𝔽₂)=GL₂(𝔽₂)≅S₃=E₂(𝔽₂); n=1: both trivial | holds | — |
| δ compatibility with Morita/products/filtered colimits (A6) | product of two squares | fibre product of a product is the product of fibre products; finite limits commute with filtered colimits | holds | — |
| Bass bound with the 1968 locator | ℤ | d=1 gives sr≤2; matches the (2,5) Check | holds | — |

The signatures of Suggested.lean are unchanged: only docstrings were edited, and the build elaborates every declaration as before. Elaborating a separate scratch file of `#check`s is outside the Lean commands this job may run, and the precomputed `signatures.md` was not available, so the `#check` comparison was not done.

## Ownership, suppliers, sources

- **Moved into this roadmap:** the generic relative triple group (A3) and the additive automorphism presentation (A2) move here from GeneralAlgebraicKTheory §§4.15–4.16. GeneralAlgebraicKTheory already consumes A0–A3 and A6, so owning these here keeps the supply one-directional.
- **New supplier citation:** StableHomotopyKTheory §3.29, which is earlier in the merge order.
- **Merge-order inconsistency (not mine to fix):** the merge order lists GeneralAlgebraicKTheory (line 5) and StableHomotopyKTheory (line 4) before this roadmap, although both consume it.
- **Ownership against open pull requests:** checked for the open pull requests that carry these roadmaps — GeometricTopology `778c5a5`, OperatorKTheory `d1b2465`, HilbertModules `c3a41ca`, GeneralAlgebraicKTheory `f16a788`, GeometryOfNumbersAndQuadraticArithmetic `cd2b780`, StableHomotopyKTheory `1475fb2`. I ran the `roadmaps grep` index for `HasCoveringDimensionLE` and `IsUniversalCentralExtension`; for the other objects I searched by name and section in those roadmaps rather than by object across every open pull request.
- **Sources:** Weibel's K-book Chapters I–III were fetched from the author's page under the key `Weibel-KBook`. The roadmap folder has no `sources.toml` and this job may not create one, so the entry is not recorded there. No text was missing, and no `needs-references.toml` was written.
- **Helper Lean files:** `MobiusSectionTargets.lean` and `SphereComplexificationTargets.lean` (added at `b8d701c`/`9d466d0`) import `Mathlib.<submodule>` modules and use a second namespace layout. They are outside the files this job may edit; the gate reports `stray-files=0` and `mathlib-subimports=0` for them, so the gate does not inspect them.
- **Untrusted text:** nothing suspicious was found in the review text.

## Build and gate

`lake build TauCetiRoadmap.AlgebraicKTheory.Suggested`: Build completed successfully (8999 jobs), with ten `declaration uses 'sorry'` warnings and nothing else.

Gate at commit `8881692`: `gate AlgebraicKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck: `depcheck: 189 roadmaps, 1159 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved lines.
