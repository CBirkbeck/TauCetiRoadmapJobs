# Review of GeometricRepresentationCategories (pull request #2579 at 4ae6385)

**Verdict:** accepted

**Summary.** Accepted: no finding blocks. This head is the one the previous review read, so its small correction and two format notes are still open, and every passage was checked again from the sources, the pinned libraries and the two supplier roadmaps. The mathematics holds: the 28 Checks recompute, the 22 source locators are at the cited places, and every library name resolves at the pins. There is one small correction (§3.4 asks to prove cells the pinned family already carries) and four format notes, none blocking; nothing is left for a human to decide.

## C01 — §3.4 asks to prove the covariance isomorphism and the product and unit coherence, which are cells of the pinned pseudofunctor the family is defined as

An implementer who constructs the family as §3.4 says has nothing left to prove for these two targets. §3.4 (lines 433–434) reads "Prove the covariance isomorphism `T_σ ∘ T_h ≅ T_(βσ h) ∘ T_σ`, the product and unit coherence". The family is `TauCeti.discreteCentralCharacterFamily`, which at the pin is a `Pseudofunctor (LocallyDiscrete (ActionCategory G X)) Cat` built from a homomorphism `G →* (A ≃ₐ[R] A)` with continuous inverses and the equation `χ (g • x) = (χ x).comp (centerCongr (a g)).symm` (Tau Ceti `Algebra/Category/ModuleCat/CentralCharacter/ActionCategory.lean`). In `H ⋊ S`, `(1, σ)(h, 1) = (βσ h, σ) = (βσ h, 1)(1, σ)`, so the covariance isomorphism is the composite of two `mapComp` cells, and the product and unit coherence are the pseudofunctor axioms.

What does remain: that `(h, σ) ↦ a_h ∘ aσ` is a homomorphism (A4.2's conjugacy), the character equation on `H ⋊ S` (A8.3, with `a_h` fixing `Z`), and that the restriction to the arrows `(h, 1)` is the action of §3.2. The two cells could be stated as consequences ("are then the `mapComp` and `mapId` cells of the family"), as §2.3 does for the rank-one cells.

## N01 — Convention 9 and the Tau Ceti contract say names in `CategoryTheory` drop that prefix, but the `MonoidalLeftAction` names are in `CategoryTheory.MonoidalCategory`

Mathlib `CategoryTheory/Monoidal/Action/Basic.lean` opens `namespace CategoryTheory.MonoidalCategory` at line 42, so a reader restoring only `CategoryTheory.` finds none of `MonoidalLeftAction`, `MonoidalLeftAction.pseudofunctor`, `MonoidalLeftAction.curriedActionMop` and the rest. Name the second namespace in Convention 9 (line 99) and at line 1012.

## N02 — In §1.2 (line 173), "an action of `D` by exact functors" should read "an action on `D`": `D` is the category acted on.

## N03 — The References list Johnson–Yau, Theorem 8.4.1, p. 238 (line 1153), but no layer cites it. Cite it where it is used, or drop the locator.

## N04 — The unit of §4.2's biequivalence is statable at the pins, should the author want one statement in `Suggested.lean`

The full biequivalence is not statable, as the docstring says. The component §4.2 names, "the unit at `L` an equivalence in the bicategory of lifts between `L` and the reconstruction of its normalized data", is: `Nonempty (Bicategory.Equivalence L L.normalizedTransport.toLift)` for `L : TauCeti.EquivariantGroupoidLift Γ actions` elaborates with `sorry` as the only warning, importing Tau Ceti's `EquivariantGroupoidLift/Bicategory` and `Comparison` modules. It is weaker than the headline, so leaving the file as it is conforms to the rule against substitutes; this is an offer.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Previous C01 (§3.4 cells) | text at lines 433–434; semidirect product law | unchanged; `(1,σ)(h,1) = (βσh,σ) = (βσh,1)(1,σ)` | not repaired (same head) | C01 |
| Previous N01, N02 | lines 99, 1012, 173 | unchanged; Mathlib namespace at `Action/Basic.lean:42` | not repaired (same head) | N01, N02 |
| §1.1 actions and pseudofunctors; Check | `(ℤ/2)²` bicharacter; `SingleObj` composition | `c((0,1),(1,0)) = −1`, `c((1,0),(0,1)) = 1`; Mathlib `comp x y := y * x`; `F ⊗ G = F ⋙ G` | true | none |
| §1.1 Frenkel §1.3.3, p. 25; FG §20.1 | Frenkel2007 lines 1284–1297; FrenkelGaitsgory2006 lines 5883–5909 | source: `F_1` identity, `F_gh → F_g∘F_h`, cocycle; FG: unit and associativity constraints | supported | none |
| §1.1 Johnson–Yau | JohnsonYau2021 lines 5332, 5392, 6020, 6592, 12209 | Def. 4.1.2 p. 103–104, 4.2.1 p. 117, 4.4.1 p. 126, Thm 8.4.1 p. 238 | supported | N03 |
| §1.2 restriction, abelian fibres; Check | `ℂ[x]`, `x = λ`, Jordan block | `x − λ ≠ 0` on `[[λ,1],[0,λ]]`; Mathlib instance needs zero, kernels, cokernels, finite products | true | N02 |
| §1.3 congruence predicate; Check | printed definition; `(ℤ/2)²` | `∃ N, 0 < N ∧ ∀ g ∈ K N, Nonempty (g ⊙ X ≅ X)`; coboundary symmetric, `c` not | true | none |
| §2.1 twisting order; Checks | `g: x↦2x`, `h: x↦x+1`, `ℂ_λ` | `T_h: λ−1`; `T_gT_h = T_(gh): (λ−1)/2`; `T_(hg): λ/2−1`; along `a h`: `λ+1` | true | none |
| §2.2 strict fibres; Checks | `ℂ[y]`, `χ(y)=1`, `y↦y+1`; `∏ ℂ[[x]]/x^N` | twist lands at `y↦0`, wrong direction at `y↦2`; `x^M(1,1,…) ≠ 0` in factor `N > M` | true | none |
| §2.3 rank-one cells | `_unit`, `_assoc` signatures at the pin; A8.3 | `S_n ↦ q_(−n−2)`; assoc lemma states cell at `g, h` on the fibre's inclusion | true; stated as consequences | none |
| §3.1 fibres; Checks | `sl₂` vacuum; `q = 0, 1` | `S_(−2)|0⟩ = f₋₁e₋₁ + ½h₋₂ + ¼h₋₁²` on `|0⟩` (via `[e₋₁,f₋₁] = h₋₂`); `S_0|0⟩ = 0`; `q_0 = 0, 1` | true | none |
| §3.2 loop action | A4.2, A8.3; Frenkel2007 lines 12793–12800, 12898–12900 | `a_h` fixes `Z`, so `χ∘a_h⁻¹ = χ`; source: fibrewise `G((t))` action | true | none |
| §3.3 coordinates; Checks | `φ=2t, ψ=t+t²`; `φ=at` | `σφσψ(t) = 2t+4t²` vs `2t+2t²`; `L_n(p^φ) = a^(−n)L_n(p)` both sides; wrong inverse gives `a^n` | true; agrees with A2.3, A8.3 | none |
| §3.4 semidirect family; Check | `diag(t,t⁻¹)`, `φ=at` | `aσ a_h aσ⁻¹(e_n) = a^(−n)·a^(n+2) e_(n+2) = a² e_(n+2) = a_(σh)(e_n)` | true | C01 |
| §3.5 congruence invariance, `Q_M`; Checks | Frenkel2007 lines 1349–1351, 1437–1438; `Q_1` | Lemma 1.3.1 p. 26, extension p. 29; `Res κ(g⁻¹dg, x) = 0`; `f_M ↦ f_(M−2)`; `ad h_0(1) = 0 ≠ h_0·1` | true | none |
| §4.1 lift packages; Check | printed structure; Frenkel2007 lines 13944–13973 | joint pseudofunctor, comparisons, equivalence field; source: `E_Id = Id`, cocycle for composition isomorphisms | true | none |
| §4.2 biequivalence; Check | `Γ`, `H` trivial; `Mat` vs `fdVect` | 2-morphisms forced by fully faithful comparison; normalized data contractible; skeletal ≠ non-skeletal, equivalent | plausible as stated; pin lacks it | N04 |
| §4.3 linearity; Check | conjugation on `Vect_ℂ` | `F(if) = −iF(f)`; `IsLinear` field is `Functor.Linear R (L.transport g)` | true | none |
| §4.4 conjecture; Checks | `PGL₂`, `q = 0, 1`; Frenkel2007 lines 12936–12940, 13974–13975 | both regular, trivial local system; stabiliser of `d` is `PGL₂(ℂ)`; Conj. 10.1.2 p. 311, 10.3.10 p. 335 | true; never asserted | none |
| §4.5 cocycles; Checks | `ℤ/2`, `b(s) = i`; `(ℤ/2)²` | `b(s)²/b(1)·c(s,s) = (−1)(−1) = 1`; bicharacter asymmetric, `H² = ℤ/2` | true | none |
| §5.1 descent; Check | FormalConnectionsOpers §§3.4, 6.1, 8.1; Frenkel2007 lines 12882, 12903–12910 | `IsomOp` is the 2-fibre product, so fully faithful; §6.1 gives essential surjectivity on `ℂ`-points; `d` not of DS form | true | none |
| §5.2 `θ`, classes; Checks | FrenkelGaitsgory2006 lines 2460–2499; `ℂ[x]`, `d/dx`; `sl₃` | `[δ_z,δ_w] = δ_({z,w})` mod inner; `δ_(zw) = zδ_w + wδ_z`; depths 2, 1; `4 ≥ 4`, `5 < 6` | true | none |
| §5.2 threshold `r ≥ w_i N` | rank one, `S[r] = S_(r−1)` | `S_n ∈ ker π_N ⇔ n ≥ 2N−1 ⇔ r ≥ 2N`, matching A8.1's indexing `Σ S[r] z^(−r−1)` | true | none |
| §5.3 relative data; Checks | `c = 1`; flow product; `ℂ[ε]/ε²` | `(1+ε)(v+εu) ↔ (u+v, v)`; product `= 1 − εη[X,Y]`; `b(γγ′) = b(γ) + a_γ b(γ′)` | true | none |
| Headline: family over `H ⋊ S` | statability at the pins | no loop action on `CompletedEnveloping`, no Feigin–Frenkel, no opers (searched Tau Ceti) | not statable; docstring says so | none |
| Headline: biequivalence | statability | no biequivalence in Mathlib or Tau Ceti; `Comparison.lean` line 26 says so; unit statable | not statable; docstring says so | N04 |
| Headline: descent | statability | `IsomOp` and the gauge groupoid absent at the pins | not statable; docstring says so | none |
| Headline: `θ` and `Ext¹` | statability; FG (7.2) | deformation family absent at the pins; source naturality equals README naturality | not statable; docstring says so | none |

- Source locators checked against the text: 22 in-text (Frenkel2007 14, FrenkelGaitsgory2006 7, JohnsonYau2021 1 with three definitions) and the two extra locators of the reference list; printed pages read from the running heads.
- Library: 233 `#check` lines over every dotted name of the README, elaborated once at the pins with 241 Tau Ceti modules imported; all resolve. Printed and read: `TauCeti.congruenceInvariant`, `IsObjectwiseCongruenceInvariant`, `EquivariantGroupoidLift`, `IsLinear`, `discreteModules`, `centralCharacterModules`, `discreteCentralCharacterModules`; signatures of `discreteCentralCharacterFamily`, `transport`, `transportEquivalence`, `endAction`, `centralCocyclePseudofunctor`, `toEquivariantGroupoidLift`, `coordinateCompletedEnvelopingAut`, `hasExt_discreteModules`. Opened: Mathlib `CategoryTheory/SingleObj.lean:62`, `Monoidal/End.lean:46`, `Abelian/Subcategory.lean:60`; Tau Ceti `Algebra/Lie/Current/ResidueCocycle.lean:14–36`, `EquivariantGroupoidLift/Comparison.lean:23–26`, `Normalized.lean:72`.
- Cross-roadmap citations resolved on main: AffineLieAlgebras A2.2, A2.3, A2.4, A3.1, A3.2, A4.1, A4.2, A5.1–A5.4, A6.3, A8.1, A8.3; FormalConnectionsOpers §§1.2, 3.1, 3.4, 5.1, 5.2, 6.1, 7.1, 7.2, 8.1, 8.2. All present; statements read for all but A4.1, A5.1, A5.2, §7.1 (headings only). FormalConnectionsOpers' citations of this roadmap by R3–R5 resolve through the label map at lines 55–56.
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. No change outside the roadmap folder; the pull request changes only `README.md` and `Suggested.lean`.
- Elaboration: `lake env lean` on `Suggested.lean` gives no message. The file has no declaration, so there is no padding to probe and no signature to compare with the README.
- Pull-request description read against the head: 28 Checks counted; revision of a roadmap on main with all 28 old Lean declarations removed, as the description says; the R-label map is present; suppliers are the two it names. No sentence contradicts the head.
- Ownership against open pull requests: searched every open head and main by object (equivariant groupoid lifts, normalized transport, `IsomOp`, categorical lift, outer derivations, weak equivariance, central-character fibres, `Ccrit`). The only other hits are the two suppliers and an unrelated use of "weakly equivariant" in SheafTheoreticSmithTheory.

Overlap check: read AffineLieAlgebras, FormalConnectionsOpers (the closest roadmaps, open and on main; the list by results is empty). Shared objects and owners: the completion, loop and coordinate lifts, rational integration, the deformation family, the Feigin–Frenkel normalizations and the coordinate character equation belong to AffineLieAlgebras; opers, evaluation characters, `K_N`, the gauge groupoid, oper reduction, the cotangent algebroid and `IsomOp` belong to FormalConnectionsOpers; coherent actions, fibres, descent, the outer-derivation map to `Ext¹` and the Artinian adapters belong to this roadmap, as AffineLieAlgebras' scope (its lines 43–44) assigns.

Source independence: 24 passages compared with 3 sources (the 22 locators, the Summary's statement of the proposal against FrenkelGaitsgory2006 lines 372–377, and the `Suggested.lean` docstring), none shared beyond formulas and standard names; largest share Frenkel2007, 14 of 22 locators; contents compared with Frenkel2007: independent (the layers use only its §1.3 and §§10.1, 10.3.7, and their order is forced by the *Needs:* lines: §3.1 needs §§2.1–2.2, §4.4 needs §3.2, §5.1 needs §§4.1, 4.4).

Research link: the roadmap makes precise Frenkel–Gaitsgory's local geometric Langlands proposal (2006, (0.8)–(0.9)) and Frenkel's Conjectures 10.1.2 and 10.3.10 (2007); §5.2 is Frenkel–Gaitsgory's Lemma 7.4.1, Theorem 7.4.2 and map (7.2); §5.1 uses the Frenkel–Zhu oper-reduction theorem. Rests on the README and the two sources read.

## Not verifiable

- The Zulip discussion and the Mathlib pull request in the References were not opened; they are design references and support no statement.
- The printed Cambridge and Oxford editions were not compared; pages were read from the author's copy of Frenkel's book and from arXiv v3 of Johnson–Yau, which the README names as its numbering.

## Source issues

- **Misprint** in Frenkel2007 at §1.3.4, Lemma 1.3.1, p. 26: the lemma on finitely generated smooth modules over the loop algebra carries the number already used on p. 19 for a different lemma; it should be numbered separately; affects nothing.

## For the human reviewers

- none
