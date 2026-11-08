# Review of TotallyDistributiveTopoi (pull request #1927 at 8ee1800)

**Verdict:** needs changes

Nine findings: three P1, six P3. `Suggested.lean` does not build at this head; the build fix is below and was tested on a copy. The theorems themselves survived the adversarial pass: no counterexample was found to any statement as written in the README or in Lean. The other blocking findings are two prerequisites that no layer, supplier or pinned declaration provides.

## R01 (P1) — `Suggested.lean` does not build: coproducts of sheaves time out

- **Location.** `TauCetiRoadmap/TotallyDistributiveTopoi/Suggested.lean`, lines 158, 173, 181, 191, 209, 215, 267: every statement that uses `ProductsDistribOverCoproducts (Sheaf J (Type u))` or `(Sh X)` at a variable universe `u`.
- **Claim.** These statements elaborate against the pinned Mathlib.
- **Witness.** The gate gives `build=8 FAIL`. Reproduced with `lake env lean`: `failed to synthesize ∀ (J_1 : Type u), HasColimitsOfShape (Discrete J_1) (Sheaf J (Type u))`, a typeclass timeout. The explicit term `Sheaf.instHasColimitsOfShape` (`Mathlib/CategoryTheory/Sites/Limits.lean:214`) elaborates at once.
- **Repair.** Add one line after `namespace TauCetiRoadmap.TotallyDistributiveTopoi`:

  ```lean
  attribute [local instance high] Sheaf.instHasColimitsOfShape
  ```

  Tested on a copy of the file with its `module` header intact: exit 0, 20 `sorry` warnings, no errors. A named instance before `section Site` also works (tested, same result):

  ```lean
  instance hasCoproducts_sheaf {C : Type u} [SmallCategory C] (J : GrothendieckTopology C) :
      HasCoproducts.{u} (Sheaf J (Type u)) := fun _ => Sheaf.instHasColimitsOfShape
  ```

  If the named instance is used, give it a docstring. No `set_option` is needed.

## R02 (P1) — Unowned prerequisite: connected objects and the connected-component decomposition

- **Location.** `README.md`, 2.2 route (lines 276–280): "is locally connected (GrothendieckTopoi 5.2 …) and so has a separating family of connected objects `Q`". The same step appears in 4.1 (lines 529–531: "so every object is the coproduct of its connected components") and in the (B) clause of 3.4 ("using 1.3 for (B)").
- **Claim.** The route's inputs are supplied by GrothendieckTopoi 5.2, Mathlib or an earlier target.
- **Witness.** GrothendieckTopoi 5.2 (at its head) gives only the `F = Type u` criterion and the `Sh(X)` case. Nothing defines connected objects of a topos or decomposes into them. Mathlib's `PreGaloisCategory.IsConnected` (`Galois/Basic.lean:103`, no nontrivial subobjects) is different.
- **Repair.** Add a target to 2.2, or declare `gap:connected-components` on GrothendieckTopoi 5.2 under `## Exact supplier contracts`. The target:
  - **Definition.** Define a connected object of `Sheaf J (Type u)`: not initial, and in every binary coproduct decomposition one summand is initial.
  - **Decomposition.** When `constantSheaf J (Type u)` has a left adjoint `π₀`, every sheaf `F` is the coproduct, over `π₀ F`, of connected sheaves (the fibres of the unit `F ⟶ Δ π₀ F`).
  - **Hom preserves coproducts.** For connected `Q`, `Hom(Q, −)` preserves `u`-small coproducts.
  - **Needs:** GrothendieckTopoi 1.2 (coproducts disjoint and universal, strict initial object).

  Cite this target in 2.2, 4.1 and 3.4. For 3.4, say that the subterminal connected sheaves are the connected elements of `L`, so 1.3 applies.

  Tested on two instances. In `Sh ℝ`, `Δ Bool = 1 ⊔ 1` has connected summands. In `Sh (ℕ → Bool)`, `Δ` has no left adjoint (2.2, Checks) and `⊤` has no connected element below it (1.3, Checks), so the hypothesis "`π₀` exists" is needed.

## R03 (P1) — Unowned prerequisite: products and coproducts of continuous `ℤ_p`-sets

- **Location.** `README.md` 3.6, lines 495–500: "The topos of continuous `ℤ_p`-sets … satisfies (B) … and not (A) … *Needs:* … Mathlib … `DiscreteContAction`". The 3.6 Examples bullet repeats it.
- **Claim.** (A) and (B) can be stated for `DiscreteContAction (Type u) ℤ_[p]` with Mathlib's API.
- **Witness.** (A) and (B) need `[HasProducts.{u}]` and `[HasCoproducts.{u}]`. `Action/Continuous.lean` has no limit or colimit instance (`Suggested.lean` lines 44–45 agree), and no roadmap supplies them. `DiscreteContAction` is also missing from "From Mathlib".
- **Repair.** Either delete the `ℤ_p` clause from 3.6 and its Examples (`ℝ` already gives (B) without (A)), or state it on a carrier that has the limits:
  - **Site presentation.** Present the topos as `Sheaf J (Type u)` for the atomic topology (every nonempty sieve covers) on the category of finite transitive continuous `ℤ_p`-sets `ℤ_p/p^n ℤ_p`.
  - **Equivalence target.** Add its equivalence with `DiscreteContAction (Type u) ℤ_[p]` as a target with a locator.
  - **The claim itself.** Prove there: (B) holds, and the product of the `ℤ_p/p^n ℤ_p ⟶ 1` is initial, because the stabilizer `⋂ₙ p^n ℤ_p = 0` is not open.

## R04 (P3) — `IsCompletelyDistributive` and 1.1 restate Mathlib's `CompletelyDistribLattice.MinimalAxioms`

- **Location.** `README.md` 1.1, lines 134–145; `Suggested.lean` lines 66–72.
- **Claim.** 1.1 defines a new predicate and asks for two proofs.
- **Witness.** `CompleteBooleanAlgebra.lean:118–120`: `CompletelyDistribLattice.MinimalAxioms L` has the same single field (`ι : Type u`, `κ : ι → Type u`). The two "Prove" sentences are `MinimalAxioms.of` and `ofMinimalAxioms`, which reindexes (`iInf_iSup_eq'`, lines 226–237).
- **Repair.**
  - Define `IsCompletelyDistributive L : Prop := CompletelyDistribLattice.MinimalAxioms L`. Keeping a roadmap name is reasonable, since Mathlib's docstring reserves the structure for building instances.
  - Replace the two "Prove" sentences of 1.1 with a Scope line: "already in Mathlib: `CompletelyDistribLattice.MinimalAxioms.of`, `CompletelyDistribLattice.ofMinimalAxioms`".
  - Both names `#check` at the pin.

## R05 (P3) — Two steps owned by GrothendieckTopoi are not cited

- **Location.** `README.md` 2.4, second route (lines 336–338: "the topos is sheaves on a small full separating subcategory with the induced topology, which is subcanonical"); 3.1 route (line 395: "the site of open sets is subcanonical"); their *Needs:* lines; "From GrothendieckTopoi".
- **Claim.** These steps come from Mathlib alone.
- **Witness.** `(Opens.grothendieckTopology ℝ).Subcanonical` fails to synthesize at the pin. GrothendieckTopoi 7.1 proves `Frame.grothendieckTopology` subcanonical and equal to it; GrothendieckTopoi 1.4 gives every topos as sheaves on a small subcanonical site.
- **Repair.** Cite GrothendieckTopoi 1.4 in the 2.4 route and *Needs:*, GrothendieckTopoi 7.1 in the *Needs:* of 3.1 (and so of 3.3 and 3.5), and both in "From GrothendieckTopoi".

## R06 (P3) — Source locators: Raney's Theorem 2 is described wrongly; Lucyshyn-Wright's version is unstated

- **Location.** `README.md` 1.4, lines 212–213: "In the completely distributive case, with completely join-irreducible elements, this is Raney's theorem (Raney 1952, Theorem 2…)". References, line 599.
- **Claim.** Raney's Theorem 2 assumes complete distributivity and uses a weaker notion than completely join-prime.
- **Witness.** Raney1952 lines 61–64: Theorem 2 has no distributivity hypothesis. Lines 46–48: his "completely join-irreducible" (Definition 5) is the condition `IsCompletelySupPrime` states. The proof is in §4 (lines 117–145).
- **Repair.**
  - **Raney sentence.** Replace it with: "This is Raney's theorem (Raney 1952, Theorem 2, p. 678, stated for complete rings of sets; his 'completely join-irreducible', Definition 5, p. 678, is the completely join-prime condition here; proof in §4, pp. 679–680)".
  - **Lucyshyn-Wright numbering.** In References, say that the Lucyshyn-Wright locators follow arXiv:1108.4032v3. I checked them there; the published version is paywalled.

## R07 (P3) — A 1.3 Check gives a false reason

- **Location.** `README.md` line 200–201: "every nonempty open set is the disjoint union of two nonempty clopen sets".
- **Claim.** Every nonempty open subset of the Cantor space is a disjoint union of two nonempty clopen sets.
- **Witness.** `U = (ℕ → Bool) \ {0̄}` is open and not closed. A union of two clopen sets is clopen, so `U` is not such a union. The conclusion of the Check (no connected element) still holds.
- **Repair.** Write instead: "a nonempty open `U` contains a cylinder `C = C₀ ⊔ C₁` (two nonempty clopen halves), and `U = C₀ ⊔ (U \ C₀)` with `U \ C₀ ⊇ C₁` open and nonempty".

## R08 (P3) — The module docstring catalogues the declarations

- **Location.** `Suggested.lean` lines 13–35: "Headlines stated here (README target, Lean name): * 1.1, `IsCompletelyDistributive`. …".
- **Claim.** The docstring lists the headlines.
- **Witness.**
  - The list names all 30 declarations, definitions included; the house form forbids catalogues of names.
  - No `Suggested.lean` on main carries such a list (0 of 141).
- **Repair.** Delete lines 13–35. Keep the "Not statable at the pins" paragraph and the standard note.

## R09 (P3) — Pull-request references in the README

- **Location.** `README.md` lines 38–41 ("A search of the roadmaps on main and in the open pull requests … finds one neighbour") and line 574 ("No roadmap on main or in the open pull requests cites this one").
- **Claim.** The README is timeless.
- **Witness.** "the open pull requests" names a process state that changes as pull requests merge. The house rules exclude pull-request references.
- **Repair.**
  - Lines 38–41: "GrothendieckTopoi is the neighbouring owner; no other roadmap owns these objects."
  - Line 574: "None."

## Verified sound

**Gate and build.**
- Gate at this head: every check 0 except `build=8 FAIL` (R01).
- Reproduced with `lake env lean` (7 errors). After the R01 repair: exit 0, 20 `sorry` warnings, no errors.

**Dependency check.** Output: `depcheck: 245 roadmaps, 2465 edges, 0 problem(s)`. No UPWARD or CYCLE line. The only supplier is GrothendieckTopoi, a new-roadmap pull request named in the description; it is not in the merge order yet, so the check places this roadmap after it.

**Elaborated signatures.**
- After the repair, `#check @name` was run on all 30 declarations in one scratch file. Each elaborated type matches its README statement.
- The four "dropped `[Category.{u} E]`" leads in the signatures file are false: the binder is present as `[inst : Category.{u_2, u_1} E]`.
- Before the repair, seven types showed `sorry` in place of `ProductsDistribOverCoproducts …` (R01).

**Padding probe.** Each of the 20 theorems was given `first | rfl | infer_instance | simp | decide` on a scratch copy. None closes. No declaration restates a definition, mirrors a Check or computes a value. No sorry'd data, no `set_option`, a single `import Mathlib`.

**Headlines.** All end theorems in the Summary are stated, except:
- the localic forms (3.4), which need GrothendieckTopoi 7.1's `Frame.grothendieckTopology` and are named in the docstring;
- the `ℤ_p` clause (R03);
- two corollaries kept in the README (`Sh ℝ` satisfies (B); a completely distributive frame is locally connected).

**Library declarations opened at the pin.**
- Order: `iInf_iSup_eq` (CompleteBooleanAlgebra.lean:295), `CompletelyDistribLattice.MinimalAxioms` (:118), `CompletelyDistribLattice.ofMinimalAxioms` (:288), `CompleteLinearOrder.toCompletelyDistribLattice` (:320), `LowerSet.completelyDistribLattice` and `LowerSet.instPartialOrder` (UpperLower/CompleteLattice.lean:113, :104; inclusion order).
- Sites and limits: `Sheaf.instHasColimitsOfShape` (Sites/Limits.lean:214, needs `HasWeakSheafify`), `presheafToSheaf` (Sheafification.lean:74), `constantSheaf` (ConstantSheaf.lean:64), `Functor.IsDenseSubsite.sheafEquiv` (DenseSubsite/Basic.lean:788), `GrothendieckTopology.Subcanonical` (Canonical.lean:129), `isRightAdjoint_of_preservesLimits_of_isCoseparating` (AdjointFunctorTheorems.lean:105; the coseparating family lives in the functor's domain, the presheaf topos, as 2.3 uses it).
- Categories and topology: `Projective` and `EnoughProjectives` (Preadditive/Projective/Basic.lean:48, :77), `Topology.WithLower` with `lower := generateFrom {(Ici a)ᶜ}` (LowerUpperTopology.lean:65, :75), `DiscreteContAction` (Action/Continuous.lean:150; no limits).
- Synthesized instances: `LocallyConnectedSpace ℝ`, `CompleteLinearOrder unitInterval`, `Order.Frame (Opens ℝ)`.

**Cross-roadmap citations.** All resolved at the GrothendieckTopoi head (38e9e22).
- Sections 5.2, 5.6, 6.5 and 7.1 exist with the cited content.
- The Lean names exist in its `Suggested.lean`: `GeometricMorphism.IsEssential` (429), `GeometricMorphism.isEssential_iff_preservesProducts` (435), `exists_equiv_presheaf_iff_essential_points` (467), `epi_piMap_presheaf` (479), `isIso_sigma_pi_presheaf` (485), `Frame.grothendieckTopology` (497).
- The citations-file lead for `isEssential_iff_preservesProducts` is that GrothendieckTopoi declaration.
- GrothendieckTopoi writes the map of (B) with `Pi.lift (Pi.π _ i ≫ Sigma.ι …)`. It equals `Limits.Pi.map (Sigma.ι …)` by `Pi.lift` extensionality, as the Scope paragraph says.

**Ownership.** Searched by object (completely distributive, completely join-prime or join-irreducible, locally connected frame, totally distributive, essential subtopos, presheaf-topos predicate, products of epimorphisms) on main and at the heads of the open pull requests. The roadmaps closest in vocabulary are GrothendieckTopoi, LocallyPresentableCategories, HigherToposTheory and HomotopyTheoryOfCategories.
- No second owner exists.
- GrothendieckTopoi states the presheaf instances of (A) and (B) inline and defines none of this roadmap's predicates.
- GrothendieckTopoi 6.5 has `Sh(ℝ)` failing (A) only as a Check.
- Mathlib and Tau Ceti have none of these notions, apart from R04.
- Overlap file: nothing dropped, no conflicting heads.

**Sampled sources** (locators, hypotheses and wording checked against the text).
- Raney1952 (AMS open archive):
  - Theorem 1, p. 678 (lines 52–57), the equivalence of the two complete distributivity laws (1.1) ✓.
  - Theorem 2 and Definition 5, p. 678 (lines 46–48, 61–64), and §4, pp. 679–680 (lines 117–145): R06.
  - §5, p. 680 (lines 146–155): `[0, 1]` is completely distributive with no completely join-irreducible element (1.4, Checks) ✓.
- LucyshynWright2012 (arXiv v3):
  - §1.1, p. 2 (lines 54–64): `t ⊣ c ⊣ y`, as `IsTotallyDistributive` (2.1) ✓.
  - Lines 74–78: Grothendieck topoi are the lex total categories with a small set of generators (2.5, Checks) ✓.
  - §1.5, line 155: every Grothendieck topos has a small dense generator ✓.
  - Theorem 1.5.3 (lines 156–159) ✓; Theorem 1.5.5 (lines 167–169) ✓; Remark 1.5.6 (lines 170–172) ✓; Proposition 2.2 (lines 219–220) ✓.
  - Propositions 5.1 and 5.3 (lines 383–393, 442–446), and line 440 "to prove Theorem 1.5.5 it remains only…" ✓.
- Sampled targets with no literature locator: 1.2, 2.2, 2.3, 2.4, 3.1, 3.3, 3.5, 3.6, 4.1, 4.2. Each was checked by recomputing its route (table below) and resolving its GrothendieckTopoi and Mathlib inputs. 3.4 cites only GrothendieckTopoi 7.1.

**Adversarial table.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 `IsCompletelyDistributive` | `ι = PEmpty`; one `κ i₀ = ∅`; `Opens ℝ`, `f n k = (k/(2n+2), k/(2n+2)+1/(n+1))`; `unitInterval` | PEmpty: LHS `⨅ ∅ = ⊤`, RHS one `g`, `⊤`. `κ i₀ = ∅`: LHS `⊥`, RHS empty join `⊥`. `Opens ℝ`: LHS `ℝ`, RHS interior of `⋂` of intervals of length `1/(n+1)`, `∅`. Chain: `d < LHS` gives `RHS ≥ d` | true | R04 (duplicate) |
| 1.2 `isCompletelyDistributive_iff_le_sSup_iInter` | `ι = ∅`; `S i = ∅`; `unitInterval`, `S 0 = {1}`, `S 1 = Ioo (1/2) 1` | `ι = ∅`: `⋂ = univ`, `sSup = ⊤ ≥ a`. `S i = ∅`: forces `a = ⊥`. Non-lower pair: sups `1, 1`, `⋂ = ∅`, `sSup = 0 < 1`, so the lower-set hypothesis is needed. ⇒: `⨅ g ∈ ⋂ S i`. ⇐: choice gives `g` | true | none |
| 1.3 `IsConnectedElem`, `IsLocallyConnected`, `isLocallyConnected_iff` | two-point discrete; one-element frame; `Opens ℝ`; Cantor | discrete: connected `{a}`, `{b}`; `⊤` not. Trivial frame: `sSup ∅ = ⊥ = a` and the equation hold. `Opens ℝ`: LC and disjoint-family equation hold, full complete distributivity fails. ⇐: a splitting `e(g) = c₁ ⊔ c₂` with `D' = {c₁, c₂} ∪ {e(h) : h ≠ g}` forces `c₂ = ⊥`. Cantor: join of connected below `⊤` is `⊥ ≠ ⊤` | true | R07 (Check wording) |
| 1.4 `IsCompletelySupPrime`, `nonempty_orderIso_lowerSet_iff` | one-element `L`; `Bool × Bool`; `unitInterval`; `LowerSet P` | one element: `≅ LowerSet PEmpty`, and `sSup ∅ = ⊥ = a`. `Bool × Bool`: primes are the 2 atoms, `⊤` is their join, `≅ LowerSet` of the 2-antichain. `unitInterval`: no primes, `sSup ∅ = 0 ≠ 1`. `LowerSet P`: primes `Iic p`. ⇐: `a ↦ {p ≤ a}` is onto, since `p ≤ sSup A` gives `p ≤ b ∈ A` | true | R06 (locator) |
| 1.4 `not_isCompletelySupPrime` | one-point chain; `a = ⊥`; `a ∈ (0, 1]` | `⊥`: `s = ∅`. `a > ⊥`: density gives `sSup (Iio a) = a`, and no `b < a` has `a ≤ b` | true | none |
| 2.1 (A) | `Type u`; `AddCommGrpCat`; `ι = ∅`; `Sh ℝ` | `Type`: choice. `Ab`: a product of surjections is surjective. `ι = ∅`: `Pi.map` is `𝟙` of the terminal object. `Sh ℝ`: fails (row 3.6) | consistent | none |
| 2.1 (B), Convention 2 | `ι = Fin 2`, `K = Fin 3`, `X = A`; `Ab` with `ℤ`; `K i₀ = ∅`; `ι = ∅`; pointed sets | `9·|A|²` on both sides. `Ab`: rank 18 against 6. `K i₀ = ∅`: `∅ × A = ∅` both sides. `ι = ∅`: `1 ≅ 1`. Pointed sets: `{pt} × S ≅ S ≠ pt` | true | none |
| 2.1 `IsTotallyDistributive` | `Type u`; `Ĉ` | `Type`: `c F = F PUnit`, via `(X, x, a) ↦ F(a) x` inverse to `x ↦ (1, x, ∗)`; its left adjoint is `A ↦ A · y(1)`. `Ĉ`: LucyshynWright2012 Proposition 2.2 | matches §1.1 | none |
| 2.1 `IsPresheafTopos` | `Type u`; one-object category; `AddCommGrpCat` | `D = PUnit`; `D = ∅`; `Ab` has `0 = 1`, and `PSh(D)` with `D ≠ ∅` has `0 ≠ 1` | true | none |
| 2.2 `productsDistribOverCoproducts_sheaf_iff` | `⊥` on `PUnit`; `Sh ℝ`; Cantor | `PUnit`: `π₀ = 𝟭`. Cantor: `Γ(∏ₙ Δ Bool) ∋ id`, not locally constant, while `Γ(Δ(ℕ → Bool))` is locally constant only, so (B) fails and `Δ` has no left adjoint. `ℝ`: both hold | true | R02 (route) |
| 2.3 `isRightAdjoint_presheafToSheaf_iff` | `J = ⊥`; `J = ⊤`; `Opens ℝ`; `SingleObj (Multiplicative ℕ)` with nonempty sieves | `⊥`: `a = 𝟭`, and the intersection of maximal sieves is maximal. `⊤`: `Sheaf ≌ PUnit`, left adjoint `∗ ↦ ∅`, every sieve covers. `ℝ`: `⋂ S n` is the sieve of `{∅}` and covers no point. `ℕ`: `⋂ {m ≥ n} = ∅` does not cover. `ι = ∅`: `⨅ = ⊤ ∈ J c` | true | none |
| 2.4 `productsPreserveEpis_and_distrib_iff` | `SingleObj (Multiplicative ℕ)`; `Opens ℝ`; `LowerIco`; Cantor | `ℕ`: sheaves are sets with `T` bijective, `≌ PSh(B ℤ)`, so (A) and (B) hold while covers have empty `⋂`; the representable `(ℕ, +1)` is not a sheaf, so `[J.Subcanonical]` is needed. `LowerIco`: a covering sieve of `[0, a)` contains every `[0, b)`, `b < a`, so intersections cover. Cantor: (A) without (B), not closed | true | R05 (citation) |
| 2.4 `…_iff_exists_essential` | `Type u`; `Sh ℝ` | `Type`: `D = PUnit`, `i = r = 𝟭`. `Sh ℝ`: such a `D` would give (A) by ⇐, which fails. `PreservesFiniteLimits r` follows from `r.IsRightAdjoint`: redundant, harmless | true | none |
| 2.5 `isTotallyDistributive_sheaf_iff` | `Type u`; `Sh ℝ`; `Sh LowerIco` | `Type`: `c = ev_PUnit` has a left adjoint; (A) and (B) hold. `ℝ`: total but not (A), so not totally distributive. `LowerIco`: (A) and (B), so totally distributive and not a presheaf topos. Matches Theorem 1.5.5 | true | none |
| 3.1 `Sh`, `productsPreserveEpis_and_distrib_sh_iff` | `PEmpty`; `ℝ`; discrete; Cantor | `PEmpty`: `Opens = {⊥}` and `Sh` is trivial; both hold. `ℝ`: both fail. Discrete: `Set X` and `X → Type u`. Cantor: both fail. Reduction: `sSup (S ∩ Iic a) = a ⊓ sSup S = a` in a frame | true | R05 |
| 3.2 `productsDistribOverCoproducts_sh_iff` | `PEmpty`; `ℝ`; `ℚ`; Cantor | `PEmpty`: vacuous LC, trivial topos. `ℝ`: `instLocallyConnectedSpace` synthesized. `ℚ` and Cantor: not LC, (B) fails | true | none |
| 3.3 `isPresheafTopos_sh_iff` | Sierpiński; `ℝ`; `PEmpty` | Sierpiński: primes `{o}` and `X`, presheaves on the arrow. `ℝ`: `(a, b) = ⋃ (a+ε, b−ε)`, so no primes and `sSup ∅ = ∅ ≠ ℝ`. `PEmpty`: `∅ = sSup ∅` | true | none |
| 3.5 `LowerIco` and its three theorems | opens of `WithLower (Ico 0 1)`; terminal sheaf; projective `P` | `⋃ Iio aₙ` is `Iio (sup aₙ)` or `univ`, so the opens are `[0, a)`, `a ∈ [0, 1]`. `∐_{c<1} [0, c) ⟶ ⊤` has no section. `P`: `s z` lies in a summand `(c₁, z₁, c₁')` with `c₁' ≥ c`, and `s z₁` restricts to the same summand, so `c₁' ≥ c₁ > c₁'`; hence `P[0, c) = ∅` and `P ≅ 0` | true | none |
| 3.6 Cantor (A), Cantor ¬(B), `ℝ` ¬(A) | clopen `V`; connected `W ⊆ ℝ` | Covers of `V` refine to finite disjoint clopen covers, so lifts glue. A section over `W` lies in `U n k(n)` for every `n`, so `diam W ≤ 1/(n+1)` and `W = ∅` | true | R03 (`ℤ_p` clause) |
| 4.1 `isPresheafTopos_sheaf_iff` | `Type u`; `Sh LowerIco`; Cantor; `Sh ℝ` | `Type`: (B), every object projective. `LowerIco`: (B), projectives are `0` only. Cantor: enough projectives, not (B). `ℝ`: (B), not a presheaf topos, so not enough projectives | true | R02 (route) |
| 4.2 `enoughProjectives_sh_cantor` | clopen `V`; complement of a point | `V` is projective by gluing. `Cₙ \ ⋃_{m<n} Cₘ` is clopen, so the complement of a point is a countable disjoint union of clopens: projective and not clopen | true | none |
| Conventions 3, 4 | `Sh PEmpty`; `P = {0 < 1}` | The empty sieve covers `⊥`, so `Sh PEmpty` is a single object. Opens `∅ ⊂ {0} ⊂ P`, so a sheaf is `F(P) ⟶ F({0})` | true | none |

## Not verifiable

- **Published Lucyshyn-Wright.** Lucyshyn-Wright, JPAA 216 (2012), doi:10.1016/j.jpaa.2012.03.018: the sources service resolves the DOI only to a paywalled page (uncertified). Its numbering and the page range 2425–2431 were not compared with arXiv:1108.4032v3, which was read (R06).
- **SGA 4 IV, Exercice 7.6.** Reached only through GrothendieckTopoi's citations; not opened.
- **The Buffalo 1973 video** (Research context): a recording, not a text. Its timestamps and the remark on Grothendieck's use of "essential" were not checked. No target depends on them.
- **Zbl 0049.30304** was not opened.
- **2.3, 2.4 (first statement) and 3.4.** The README presents these as its own, with proofs. No literature locator exists to check, so they were verified only by the routes and instances in the table.

## Source issues

- none
