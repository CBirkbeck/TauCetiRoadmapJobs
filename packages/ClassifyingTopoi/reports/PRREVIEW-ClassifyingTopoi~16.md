# Review of ClassifyingTopoi (pull request #1997 at 25e5b86)

**Verdict:** needs changes

## R01 (P2) — the converse of 2.5 and 3.6 (a) are stated in every universe, but the definability they use is stated only in `max u₁ u₂ u`

**Location:** `TauCetiRoadmap/ClassifyingTopoi/Suggested.lean` lines 338–344, `exists_quotient_theory {T : GeometricTheory.{u} L} {C : Type u}`, and 628–635; `README.md` lines 787–788, "conversely, for every `J' ≥ J` some `T' ⊇ T` is classified by `(C, J')`", *Needs:* "2.1, 2.3, 2.4".

**Claim:** Turning a `J'`-covering sieve into sequents needs the separating family `[[φ]]` and the definability of subobjects of `[[φ]]` (2.4), which 2.4 states only for sites in `Type (max u₁ u₂ u)`; 3.5 restricts (a), (c), (d) for that reason, 2.5 and 3.6 (a) do not.

**Witness:** `L : Language.{1, 0}` with constants indexed by `Type`, `T = {⊢ ∃ x, ⊤, ⊤ ⊢ x = y}`, `u = 0`: the one-point site in `Type 0` classifies `T`; 2.3 gives a site in `Type 1`; `exists_equivalence` needs one `Type u`.

**Repair:** State both as the other consumers of definability are: `{T : GeometricTheory.{max u₁ u₂ u} L} {C : Type (max u₁ u₂ u)}` in `exists_quotient_theory`, and `T`, `T'`, `C` in that universe in `exists_quotient_isSetModel_iff_isHomogeneous` (both elaborate at the pins). In README 2.5 add: "The converse is stated in the universe `max u₁ u₂ u` of 2.3: for a `J'`-covering sieve on `c`, cover the sheafified representable by objects `[[φ]]` (2.4, API) and take the sequents `φ ⊢ ψ`, `[[ψ]]` the pullback of the sieve's image (2.4)." Add 2.5 (converse) and 3.6 (a) to the sentence of 3.5 (line 984) and of the module docstring that list the targets using definability. `exists_quotient_topology` and 3.6 (b) need no change.

## R02 (P2) — 1.5 asserts that `T'` is coherent, and the target does not state it

**Location:** `README.md` lines 497–498, "a geometric theory `T' : GeometricTheory.{0} L'`, its disjunctions indexed by types in `Type`", and 525–526, "`T'` is a coherent theory"; `Suggested.lean` line 245.

**Claim:** The statement now agrees with the Lean, by dropping coherence from both: the target is weaker than the cited result (D1.5.13, a coherent theory) and than what Scope line 50 says is owned, "the coherent theory of the Morleyization".

**Witness:** `Suggested.lean` line 72, `iSup {ι : Type w}`: at `w = 0`, `ι = ℕ` is admitted, so a `T'` with the sequent `⊤ ⊢ ⋁ (k : ℕ), φ k` satisfies the statement's type.

**Repair:** Define in README 1.1 and in `Suggested.lean`, beside `IsHorn`, `GeometricFormula.IsCoherent` (`top`, `equal`, `rel`: `True`; `and φ ψ`: both; `.iSup (ι := ι) φ => Finite ι ∧ ∀ i, (φ i).IsCoherent`; `.ex φ => φ.IsCoherent`), and add to `exists_morleyization`, first after `∃ … T'`, the conjunct `(∀ σ ∈ T', σ.lhs.IsCoherent ∧ σ.rhs.IsCoherent) ∧`. README statement: "a geometric theory `T' : GeometricTheory.{0} L'` all of whose sequents are coherent (finite disjunctions only)". Both elaborate at the pins; the `T'` of the README satisfies it (`PEmpty` and `Bool` are finite).

## R03 (P3) — the route of 3.3 takes from the literature a fact that a supplier section owns, and the *Needs:* line omits it

**Location:** `README.md` lines 906–910, "an equivalence of the presheaf topoi on `SingleObj G` and `SingleObj H` gives an equivalence of their Cauchy completions (Borceux–Dejean 1986, Proposition 2, p. 135 …)", and the *Needs:* line 913.

**Claim:** The step is an input of the route that is neither a target here, a supplier section nor a pinned declaration; a citation is not a supplier.

**Witness:** GrothendieckTopoi 6.5 (open head, README line 1063): the essential points of `Cᵒᵖ ⥤ Type u` form `Idempotents.Karoubi C`, "so that `C` is recovered from its presheaf topos up to equivalence exactly when `IsIdempotentComplete C`"; its first Check is the case of a group.

**Repair:** "Route: an equivalence of the presheaf topoi on `SingleObj G` and `SingleObj H` gives an equivalence of their categories of essential points, the idempotent completions (GrothendieckTopoi 6.5); an idempotent of a group is `1`, so `SingleObj G` is idempotent complete and equivalent to its completion, and an equivalence `SingleObj G ≌ SingleObj H` restricts to a group isomorphism on the endomorphisms of the object." Add "6.5" to the *Needs:* line of 3.3, write "6.5 (3.3 and 3.5)" in the Dependencies of Layer 3 and "for 3.3, 3.5 and 3.6" in the contract. The same section serves the Cauchy-completion step of 3.5 (a′), whose *Needs:* line already has it.

## R04 (P3) — "Downstream consumers" is contradicted by an open roadmap

**Location:** `README.md` line 1319: "No roadmap on main or in the open pull requests consumes ClassifyingTopoi."

**Claim:** ToposTheoreticBridges consumes three sections of this roadmap.

**Witness:** ToposTheoreticBridges (open), README lines 38–40 and 88–93: "**From ClassifyingTopoi** 2.1 … 2.5: `IsClassifyingSite.exists_quotient_topology` and `IsClassifyingSite.exists_quotient_theory` … 2.6: `MoritaEquivalent T T'`"; line 270, *Needs:* "ClassifyingTopoi 2.1, 2.5, 2.6".

**Repair:** "ToposTheoreticBridges consumes 2.1 (classifying sites), 2.5 (`IsClassifyingSite.exists_quotient_topology`, `IsClassifyingSite.exists_quotient_theory`) and 2.6 (`MoritaEquivalent`) in its Layer 4, and cites 3.2, 4.1 and 4.2 in Checks and Examples. No roadmap on main consumes ClassifyingTopoi." The sentence on GrothendieckTopoi, LocallyPresentableCategories and AdicSpacesPartIV stays.

## R05 (P3) — the pull request's description still predates 1.5

**Location:** the description: "It states 27 headline theorems with `sorry`"; "`Suggested.lean` has not changed over the last four heads"; "gives 27 `sorry` warnings"; "The last three commits change only the README"; "From Tau Ceti it consumes `FirstOrder.Language.BoundedFormulaInf` and its `Realize`, and … for 4.2".

**Claim:** The head contradicts each sentence, and the description names neither the target 1.5 nor its supplier.

**Witness:** `lake env lean` on `Suggested.lean` at 25e5b86 gives 28 `sorry` warnings; `git diff 675f027 HEAD` changes 7 lines of `Suggested.lean`; README lines 107–114 and 279–280 add InfinitaryModelExistence 5.1; line 502 cites Elephant D1.5.13.

**Repair:** "It states 28 headline theorems"; "gives 28 `sorry` warnings"; drop the two sentences on unchanged heads and say that the last two commits add 1.5 and `exists_morleyization` to both files; add to the Layer 1 bullet "Morleyization of a first-order theory into a geometric theory over Tau Ceti's `morleyize` (1.5)"; add to the suppliers "InfinitaryModelExistence 5.1 (on main)" and to the Tau Ceti list `morleyize`, `morleyRel`, `lhomMorleyize`, `morleyExpansion`, `BoundedFormula.toOmega`, `BoundedFormula.realize_toInf`; add D1.5.13 to the Elephant list. After R01 and R02, name the universe of 2.5 (converse) and 3.6 (a) and `IsCoherent`.

## Previous findings

- R01 (sequents of `T'` not on Mathlib's constructors): repaired. Lines 512–523: "by the constructor of `φ` among the five of Mathlib's `BoundedFormula`: `falsum` … `φ₁.imp φ₂`: `R_φ ∧ R_φ₁ ⊢ R_φ₂`, `R_φ₂ ⊢ R_φ` and `⊤ ⊢ R_φ ∨ R_φ₁`".
- R02 (first Check of 1.5 false): repaired. Lines 546–551, "The third sequent of `imp` is needed … `φ = falsum.imp falsum`"; recomputed below.
- R03 (coherence in the prose, not in the Lean): partly. Lines 497–498 now read "its disjunctions indexed by types in `Type`", as the Lean; line 526 still asserts coherence outside the statement. R02 above.
- R04 (Tau Ceti's Morleyization not cited): repaired by citation. Lines 107–114, 254–256, 279–280, 504–510 and the *Needs:* line 536–538 name `morleyize`, `lhomMorleyize`, `morleyRel`, `morleyExpansion`; the existential form is kept in both files.
- R05 (Scope, build paragraph, Dependencies): repaired. Lines 50–51, 288–293, 589–591.
- R06 (description): not repaired. R05 above.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 relabelling under `ex` | weakening of `ex (x₀ = x₁ * x₁)` to `Fin 2`, `ℤ` | `(4, 7)`: `4 = 2·2` true; `(2, 7)` false; along `castAdd 1` unextended: `4 = 7·7` false | holds | — |
| 1.2 `realize_hom`, `realize_toInf` | `ℤ ⊂ ℚ`, "`x₀` is a unit" at `2`; `toInf bot` | false in `ℤ`, true in `ℚ` (`1/2`): one direction only; no pair `⟨PEmpty, x⟩`, all branches `⊥`: false on both sides | holds | — |
| 1.3 `isModel_ofStructure_iff` | `{⊤ ⊢ ex top}` on `PEmpty`, `PUnit` | `PEmpty`: image of `∅ → pow 0` is `⊥`, `⊤ ≰ ⊥`, and no witness in sets; `PUnit`: `⊤ ≤ ⊤`, witness | both sides agree | — |
| 1.4 `IsModel.map` | `X ↦ X × X` on `Bool` with `c₀, c₁`; `X ↦ Bool × X` | `(false, true)` is neither constant: not a model; `Bool × PUnit` has 2 elements, terminal not preserved | hypotheses needed | — |
| 1.5 `exists_morleyization`, `imp` | `(R_φ₁, R_φ₂)` over four truth values; `φ = falsum.imp falsum`, `R_φ = False` | (F,F), (F,T): T by third; (T,T): T by second; (T,F): F by first. Check 1: first two sequents hold, `⊤ ⊢ R_φ ∨ R_falsum` fails | determined | — |
| 1.5, `all` and axioms | `PUnit`, `T = {∀ x, ∼P x}`; `M = ∅` | `P = ∅`: `R_(∼P) = M`, `R_(∼∼P) = ∅`, `R_ψ = True`; `P = M`: `R_(∼P) = ∅`, `R_ψ = False`. `∅`: `ex` false, `R_(φ₁.all) = True` | (a), (b) hold | — |
| 1.5, coherence | `GeometricTheory.{0}`, `ι = PEmpty`, `Bool`, `ℕ` | all three in `Type 0`; only the first two finite | not stated | R02 |
| 2.1 `IsClassifyingSite` | `(Discrete Bool, ⊥)`, `U` terminal, "exactly one element" | (i) holds; `F`, `G` evaluations: `Hom(F, G) = ∅` (component `PUnit ⟶ PEmpty`), `𝟙` is a homomorphism | (ii) excludes it | — |
| 2.2 (b) `exists_interp_eq_iSup_exs` | `top`, `bot`, `and (ex θ) ψ` | `ι = PUnit`, `m = 0`; `ι = PEmpty`; `ex (θ ∧ ψ[castAdd 1])`, in sets `(∃ y, θ) ∧ ψ ↔ ∃ y, θ ∧ ψ` | holds | — |
| 2.3 `exists_isClassifyingSite` | `0`-ary symbols indexed by `Type u`; `{⊤ ⊢ bot}` | `u + 1`-many distinct subterminals against a `u`-small `Sub(1)`: no site in `Type u`, one in `Type (u + 1)`; empty site | universes right | — |
| 2.4 `exists_equivalence`, definability | `ℤ/2`-torsor; object classifier; `(Discrete Bool, ⊥)` | 2 isomorphisms of generic models; `Sub(1) = {⊥, [N ≠ ∅], ⊤}` = `bot`, `ex top`, `top`; 4 subterminals against 2 definable | holds; hypothesis used | — |
| 2.5 `exists_quotient_topology` | `T' = T ∪ {⊤ ⊢ bot}`; `T' = T` | `J' = ⊤`, degenerate topos; `J' = J` | holds | — |
| 2.5 `exists_quotient_theory`, 3.6 (a) | `L : Language.{1, 0}` with constants indexed by `Type`, `u = 0`, one-point site | site in `Type 0`; 2.3 and definability live in `Type 1`; no comparison across universes | route does not reach | R01 |
| 2.6 `MoritaEquivalent` | trivial group against "exactly one element"; `ZMod 4`, `ZMod 2 × ZMod 2` | both classified by `Type u`; 2 elements of order 4 against 0 | holds | — |
| 3.1 `isOfPresheafType_of_isHorn` | `ℤ/2 × ℤ/2`, `x = (1, 0)` | `x` and `1 − x = (0, 1)` not units: products of local rings not local, no Horn axiomatization | holds | — |
| 3.2 `isClassifyingSite_genericObject` | object `3`; site `FintypeCat.Skeleton` instead of its opposite | `Fin 3`, `n`-th power the representable of `n`; functors on `FinSetᵒᵖ` classify Boolean algebras | variance right | — |
| 3.3 torsors | `f ≫ g = g * f`; `𝔖₃` | `(g * h) · x = x ≫ (g * h) = g · (h · x)`; precomposition not natural when `a * b ≠ b * a`; route input owned by GrothendieckTopoi 6.5 | holds | R03 |
| 3.4 `isClassifyingSite_genericInterval` | `σ 0`, `σ 1` on `0, 1, 2`; `δ` | `(0,0,1)`, `(0,1,1)`; vertex 1 gives `(0, 1)`, `(1, 0)` not in the image; `true ↦ δ 0` = vertex 1 | conventions agree | — |
| 3.5 (a′), (b) | theory `f (f x) = f x`; `(0, ∃ y, ⊤)` for objects | free model on `n` has `2n` elements, `(1, f x = x)` presents the point, a retract; `Hom(M, 2) ≥ 2` for `M ≠ ∅` against 1 required | holds | — |
| 3.6 (b) `isSetModel_iff_isIrreducibleObject` | `c = M`, `y = 𝟙`; `ℤ/6` | `𝟙_(op M) = u.op ≫ f.op ∈ S`; conversely `y.op ∈ S`. `(3, 4) = (1)`, `ℤ/6[1/3] = ℤ/2`, `ℤ/6[1/4] = ℤ/3`, no map back: `𝟙 ∉` sieve | holds without the cited hypotheses | — |
| 4.1 `isClassifyingSite_genericRing`, `finitePresentation_of_isFinitelyPresentable` | transport along `x ↦ x + 1`; `ℚ` | zero `1`, sum `a + b − 1`: carrier alone does not fix the ring; `ℚ` not finitely generated | holds | — |
| 4.2 `isSheaf_forget_zariskiTopology` | zero ring; `ℤ`, `{2, 3}`; `{2}` | `span ∅ = ⊥ = ⊤`, empty cover, one-element value; `3 − 2 = 1`, `ℤ = ℤ[1/2] ∩ ℤ[1/3]` in `ℤ[1/6]`; `ℤ ⟶ ℤ[1/2]` not bijective | holds | — |
| 4.3 `isClassifyingSite_localRingTheory` | `ℤ` at `3`; zero ring; `ℤ/4` | `3`, `−2` not units; `0 · 0 = 1` holds, so `0 = 1 ⊢ bot` excludes it; one of `x`, `1 − x` odd | holds | — |
| one-tactic probe, 28 theorems | `first \| rfl \| infer_instance \| simp_all \| trivial \| aesop` | 28 failures, 0 closed | no padding | — |

- Source locators checked against the text: 27, all found as cited. Car09 (arXiv:0905.0299v1): §2.1 (line 104), Definition 3.5 p. 14 (471), Theorem 3.6 (483), Remark 3.7 (638), Theorem 5.1 p. 37 (1285), Remark 14.2 p. 65 (2321), Theorem 14.4 p. 67 (2393), Definition 14.5 and §14.2 p. 68 (2414–2417), proof of Theorem 17.6 p. 81 (2928–2942). Caramello 2012a (TAC 26 no. 6): 3.1 (c) and 3.2 p. 182 (lines 239, 249), 3.13 (428), 3.15 (457), §4 p. 189 (496), 4.1 (i) (552), 4.3 (591). Car08 (arXiv:0805.2187v1): 4.4, 4.6, 4.8, 4.9 (lines 321, 335, 372, 386). Car14 (arXiv:1404.4610v2): Remark 6.27 (i) (line 5095), with the hypothesis the README reports. Borceux–Dejean: Theorem 1 (2)–(4) p. 134 (lines 99–106), Proposition 2 p. 135 (134). Stacks 00QO (line 14610).
- Library declarations opened at the pins: Tau Ceti `ModelTheory/ModelExistence/Morleyization.lean:80` (`morleyize`, `Language.{u, max u v}`), 88 (`morleyRel`), 117 (`lhomMorleyize`), 142 (`morleyExpansion`), 240; `ModelTheory/Infinitary/Syntax.lean:94, 226, 264` (`toOmega`); `Infinitary/Semantics.lean:168` (`realize_toInf`). Mathlib `Algebra/Category/Ring/FinitePresentation.lean:169, 175` (the converse of 4.1 is not there), `Algebra/Category/CommAlgCat/FiniteType.lean:118`. No geometric formula or classifying topos in either library.
- Cross-roadmap citations resolved at the heads: GrothendieckTopoi (open) Conventions 1, 4 and 1.1, 1.2, 1.4, 2.1, 2.2, 2.4, 2.5, 4.1, 4.2, 6.1, 6.5, 6.6, the Examples of Layer 1 and the ten declaration names of the contract; LocallyPresentableCategories (open) 1.5, 3.1, 3.5; InfinitaryModelExistence (main) 5.1, 5.2. The Out-of-scope sentences quoted from the first two are there.
- Gate at 25e5b86: every check 0, OK. Dependency check: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 28 `sorry` warnings and nothing else. `#check @name` on the seven declarations flagged for a lost `[Category.{v} E]` shows the binder in each elaborated type; `exists_morleyization` keeps `{L}`, `(T)` and the universe of `M`. The statements of R01 and R02 elaborate in a scratch copy.
- Shape: every definition has at least three Checks; every layer ends with Examples and Dependencies; every backticked name of the roadmap's own is declared.
- Overlap check: read ToposTheoreticBridges, GrothendieckTopoi, TotallyDistributiveTopoi, LocallyPresentableCategories (open), InfinitaryModelExistence, InfinitaryLogic, CountableModelCounting (main). Morleyization of a language: InfinitaryModelExistence 5.1, cited. Presheaf topoi and idempotent completion: GrothendieckTopoi 6.5 (R03). The lattice of quotients under Morita equivalence: ToposTheoreticBridges 4.1, a consumer of 2.5 and 2.6 (R04). Nothing else shared.
- Source independence: 12 passages compared with 6 sources, none shared; largest share Elephant and Caramello 2017, 14 each of 60 locators; contents compared with Caramello 2017 (arXiv:0905.0299v1, read) and with the public contents of Elephant D1 and D3 (text not readable): independent, 2.5 alone meets §3 and 3.5–3.6 meet §14, and Layer 1 gathers D1.1, D1.2 and D1.5 around 1.4, which is in neither.

## Not verifiable

- Johnstone, Elephant, D1.1, D1.2, D1.3.10, D1.4, D1.5.13, D3.1: paywalled (OUP, HTTP 403 on the landing page), no open copy; the item numbers were not confirmed.
- Mac Lane–Moerdijk, VIII.2–VIII.6, VIII.8, Proposition VIII.5.1, X.1–X.3, X.5–X.6 with their pages: paywalled (Springer); the form of the interval theory against VIII.8 was checked only by computation (Convention 6).
- Makkai–Reyes, LNM 611, pp. 272–297, and Hakim 1972, Chapitre III, §3, pp. 41–49: paywalled, no open copy found.

## Source issues

- none

## For the human reviewers

- **Not tested.** Elephant has 14 of the README's 60 locators (tied largest) and Mac Lane–Moerdijk 11; neither text could be read, so the wording of 1.1–1.5, 2.1–2.3 and 3.2–3.4 was not compared with them.
- **Scope.** R01 offers the narrow repair (universe `max u₁ u₂ u`). The general statement, definability on every classifying site in every universe, looks provable from the site of definable objects and maps; whether to plan it is a choice of scope.
