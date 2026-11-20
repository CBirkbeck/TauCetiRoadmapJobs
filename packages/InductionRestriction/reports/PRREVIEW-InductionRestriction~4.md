# Review of InductionRestriction (pull request #2639 at 61fab9d)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** needs changes

**Summary.** Changes are needed, for one sentence: §2.1 states the criterion "almost conjugate exactly when the permutation representations are equivalent" without the finiteness of `G` that the cited Tau Ceti theorem assumes, and for an infinite group the sentence is false for the predicate it names. Every target, Check and worked example was recomputed and holds; the headline statements elaborate and none closes in one tactic. There are five small corrections (one carried over from the previous round, which this unchanged head does not repair) and three format notes, none blocking. For the humans: the most-cited text, Isaacs, could not be read legally.

## R01 (P2) — The almost-conjugacy criterion of §2.1 is stated without the finiteness of `G` that it needs

Convention 1 says a group is finite "exactly where a statement needs it", the two adapters of the same section are for arbitrary groups, and the paragraph goes on to decomposition groups; so a reader takes the criterion for every group, and for an infinite group it is false.

The opening of §2.1 (README lines 144–147) says of `Subgroup.AlmostConjugate`: "over a field of characteristic zero it holds exactly when the permutation representations on `G ⧸ H` and `G ⧸ K` are equivalent". The cited `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction` (`TauCeti/RepresentationTheory/CharacterTable/FixedPointCount.lean`, line 183) stands under `[Finite G]` (line 77). Without it: let `G` be the finitary symmetric group on `ℕ`, `H = G` and `K` the finitary alternating group. Every nontrivial conjugacy class is infinite, and `Subgroup.AlmostConjugate` (`TauCeti/GroupTheory/AlmostConjugate.lean`, line 92) compares `Nat.card`, which is `0` for an infinite set and for the empty set; the counts are `1 = 1` at the identity and `0 = 0` on every other class, so `H` and `K` are almost conjugate, while `k[G ⧸ H]` has dimension 1 and `k[G ⧸ K]` dimension 2. The smallest change: "and, for finite `G` and over a field of characteristic zero, it holds exactly when …".

## C01 — The From Tau Ceti list gives `tensorRepEquiv` only the hypotheses of `evalTensor_injective`

Carried over from the previous round; this head is the one that round read, so the text is unchanged. In the Layer 7 list under From Tau Ceti (README lines 1022–1023), `TauCeti.IsProjectiveInertiaExtension.evalTensor_injective` and `TauCeti.IsProjectiveInertiaExtension.tensorRepEquiv` share the parenthesis "(algebraically closed, `V` simple)". At the pin, `tensorRepEquiv` (`Clifford/TensorFactorization.lean`, line 329) also takes `[σ.IsIrreducible]` and a nonzero `N`-map `φ`, as `evalTensor_surjective` does (line 292); without them the equivalence fails, since `Hom_N(V, W) = 0` for `W` not lying over `V`. The body of §7.5 has the hypotheses right. Would add after `tensorRepEquiv`: "and, for `tensorRepEquiv`, `W` irreducible with a nonzero `N`-map from `V`".

## C02 — `AbstractUCE.ker_projection_eq_map` is Mathlib's `QuotientGroup.ker_lift`, so it asks an implementer for nothing

`AbstractUCE.projection` is defined as a `QuotientGroup.lift`, and the kernel of `(presentation G).comp (derived G).subtype` is `(relations G).subgroupOf (derived G)` by unfolding. On a copy of `Suggested.lean` the statement is closed by the term `QuotientGroup.ker_lift _ _ _` (`Mathlib/GroupTheory/QuotientGroup/Defs.lean`, line 277). If it is kept as the step that `kernelMap_bijective` rests on, mark it so in the §7.1 list (line 551) or prove it in the file as `relationCommutators_le_relations` is proved; the content of the kernel statement is `kernelMap_bijective`.

## C03 — The target of §7.4 is the composition of two pinned lemmas

§7.4 (lines 647–651) asks to prove lifting through a finite stem extension for projective representations on arbitrary modules, and the pull request's description lists it among the targets that "stay". With `TauCeti.exists_finite_stem_factorSet_bijective_characterTransgression` supplying the extension and `TauCeti.IsProjectiveRep.exists_linearization_of_characterTransgression_surjective` the lift, the statement elaborates in five tactic lines on a scratch copy (the pin's own `TauCeti.exists_finite_stem_extension_lifting_pgl`, `RepresentationGroup/Lifting.lean` lines 46–55, is the same composition for `PGL`). The Route already names both lemmas; would say that the statement is their corollary, an API fact of the section, so that nobody plans work for it.

## C04 — `clifford_correspondence` assumes `G` finite where its route uses only that the inertia group has finite index

§5.2 is stated for every group and says so; §5.3 (Layer 5 preamble, line 358, and the Lean statement, `[Finite G]`) narrows to finite `G`. The Route of §5.3 uses the finiteness of `G` only through `G ⧸ T`: `Res_N U` is semisimple by §5.2 for the group `T`, `Res_N Ind U` is the finite sum of the translates `gU`, and for simple `W` the stabilizer of `W_V` is `T`. Tau Ceti's own lying-over clause is at that generality (`FDRep.liesOver_indFDRep_of_inertia`, `Clifford/LiesOver.lean` line 45, `[(inertia V).FiniteIndex]`). The same three clauses with `[(TauCeti.inertia V).FiniteIndex]` in place of `[Finite G]` elaborate on a scratch copy. Would state the correspondence under finite index of the inertia group, with finite `G` as the special case; the second headline of the overview then reads "if the inertia group has finite index".

## C05 — "Alperin–Bell, Ch. 8" names no chapter on induction

§3.1 (line 229), §5.2 (line 401) and the References (line 1052) cite *Groups and Representations*, Ch. 8, for induced representations, Mackey's theorem and Clifford theory. The publisher's contents listing gives the book six chapters and sixteen consecutively numbered sections; section 8 is "Finite p-groups" and the section on induction is the last, section 16, in the chapter on group representations. The text itself is behind a paywall and was not read, so where in it Mackey's and Clifford's theorems stand was not checked; would cite "§16 (Induction)" after confirming against the book, or drop the citation where it is not confirmed.

## N01 — The *Needs:* line of §7.5 (line 707) omits two declarations its paragraph uses

Carried over: `TauCeti.IsProjectiveInertiaExtension.isProjectiveRep_homAction`, which is in the type of `evalTensor`, and `FDRep.cliffordBalancedEvaluationEquiv`, used by the alternative route. Both are in the supplier contracts.

## N02 — The hypothesis `HasFiniteBiproducts (Rep k K)` of §3.1 is always available

Instance search indeed fails at the pin, as line 229 says, but `Rep k G` is abelian there (`Mathlib/RepresentationTheory/Rep/Basic.lean`, line 586) and `CategoryTheory.Abelian.hasFiniteBiproducts` supplies the hypothesis (checked on a scratch copy). One clause saying so would tell a consumer how to discharge it.

## N03 — The scalar-obstruction existence statement is in `Type` only

`exists_scalarProjectiveInertiaExtension` takes `k G : Type`, as Convention 9 announces for statements about Schur multipliers; it mentions no multiplier, and the pin's algebraically closed version (`Clifford/Obstruction.lean`, lines 156–162) has `k : Type u`, `G : Type v`. Would give the existence statement those universes.

## Questions for the author

- §7.5 (line 673) and §7.6 (line 731) state results over every field and cite Isaacs, Ch. 11, without the qualifier "for complex characters" that §§5.2–5.3 give their Ch. 6 citations. Does Ch. 11 work over a general field? Which result of Curtis–Reiner §11 gives the correspondence of §5.3 over an arbitrary field? Neither text could be read legally (AMS and Wiley paywalls).

## Previous findings

The previous review, of this same head, had no finding. Its small correction C01 and its format note N01 are unrepaired (the head is unchanged) and are carried over above under the same numbers. The findings of the earlier rounds were checked as repaired by that review; the passages it quoted stand as quoted (lines 699–701, 1040–1042, 456–458, 928, 546).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §0.1 generator formulas | relations `⟦t'g ⊗ ⟦t t'⁻¹ ⊗ a⟧⟧`, `⟦g ⊗ ⟦st ⊗ sa⟧⟧`; `x`-action | all map to `⟦tg ⊗ a⟧`; `⟦g x⁻¹ ⊗ y⟧ ↦ ⟦t g x⁻¹ ⊗ a⟧ = x·⟦tg ⊗ a⟧` | well defined, equivariant; matches pin composite (`Transitivity.lean` 344–353) | none |
| §2.1 adapters | Lean bodies; `I = 1`; `f = id` | real bodies, no `sorry`; `I = 1` gives `e`; `f = id` gives `e` | sound | none |
| §2.1 criterion sentence | finitary `Sym(ℕ)`, `H = G`, `K = Alt` | `Nat.card` counts `1 = 1`, `0 = 0`; dimensions `1` vs `2` | false without `Finite G` | R01 |
| §2.3 normalization | `S₃`, `⟨(1 2)⟩`; `𝔽₂`, `C₂`; `ℝ`, `C₃` rotation | `(3+3+0)/6 = 1`; `(2 : 𝔽₂)⁻¹ = 0` (field inverse, `Pairing.lean` 51); `(4+1+1)/3 = 2 = dim ℂ` | Checks true | none |
| §3.1 biproduct form | `S₃`, `H = K = ⟨(1 2)⟩`, sign; `K = 1`; relation at `x ∈ K ⊓ sHs⁻¹` | cosets of sizes 2, 4; `1 + 2 = 3`; `(3, −1) = (1, −1) + (2, 0)`; `⟦s⁻¹xu ⊗ x·a⟧ = ⟦s⁻¹u ⊗ a⟧` | holds; indexing by `K\G/H` pinned | N02 |
| §4.1 identity component | `C₂`, `H = 1`, `V = k` | `End = k[C₂]`, dim `2 = 1 + 1`; image of `c` is `(c, 0)` | holds; wrong placement gives the swap | none |
| §4.2 representative change | `h₁ s h₂` | `H ⊓ (h₁sh₂)H(h₁sh₂)⁻¹ = h₁(H ⊓ sHs⁻¹)h₁⁻¹` | conjugation by `h₁` as stated | none |
| §4.3 conjugate form | `Q₈`, `H = ⟨i⟩`, `s = j` | `j⁻¹ i j = −i`; `{}^j V` restricted is `V` along `y ↦ s⁻¹ys` | agrees with `MackeyDisjoint` (`Irreducible.lean` 102) | none |
| §4.4 `Q₈` over `ℝ` | relation and action on `⟦g ⊗ v⟧ ↦ g⁻¹v` | `g⁻¹h⁻¹hv = g⁻¹v`; `⟦gx⁻¹ ⊗ v⟧ ↦ x g⁻¹ v`; dims `2 + 2 = 4 = dim ℍᵐᵒᵖ` | simple, not disjoint | none |
| §5.1 isotypic decomposition | `ℚ[C₃]`; `𝔽₃`, `C₂`, `W = 1³` | `U` once, `finrank Hom = 2`; pairing `3 = 0`, `finrank = 3` | Checks true; hypotheses needed | none |
| §5.2 Clifford's theorem | `C₄` on `ℚ²`, `N = ⟨g²⟩`; `S₃` on `𝔽₂²`, `A₃`; coset `gT` | `e = 2`, `χ(g²) = −2`; `x² + x + 1` irreducible, `e = 1`; `{}^{gt}V ≅ {}^g V` | holds for any `G`; left cosets consistent | none |
| §5.3 correspondence | `S₄ ⊃ V₄` over `ℚ`; `A₃ ◁ S₃` over `ℚ`; infinite `G`, `[G:T] < ∞` | `[T,T] = ker χ`, 2 extensions, `3 + 3 = 6`; inertia `S₃`; route uses only `G ⧸ T` finite | holds; `Finite G` stronger than used | C04 |
| §6.1 lattice | `S₃` over `ℚ`; `C₃` over `ℚ` | `6a = 1` unsolvable for `(1,0,0)`; `(2,−1,−1)` norm `2 = dim ℚ(ω)` | holds without splitting | none |
| §7.1 universal extension | `C₂`; `G = 1`; `A₅`; `ker_projection_eq_map` by one lemma | image `[G,G] = 1`; `F = ℤ`, `U = 1`; kernel order 2; `QuotientGroup.ker_lift` closes it | sound; one statement is a library lemma | C02 |
| §7.2 `PGL` converse | `C₂ × C₂` with `X`, `Z`; `V = 0`; constant `α ≡ c` | `α(a,b) = 1`, `α(b,a) = −1`; any `α` on `0`; `c·c = c·c` | Checks true; nonzero `V` needed | none |
| §7.3 coordinates | pin definition; `C₂ × C₂` | subalgebra of `End(G →₀ k)` (`Twisted/Basic.lean` 288), not `G →₀ k`; `e_b e_a = −e_{ab}` | target has content | none |
| §7.4 lifting | composition of two pinned lemmas; `C₂`, `α(g,g) = −1` | elaborates in five lines; `c(g)² = −1` unsolvable in `ℝ`; `(1,g)² = (−1,1)` | true; a corollary of the pin | C03 |
| §7.5 scalar obstruction | `Q₈ ⊃ {±1}` over `ℂ`; two extensions `ρ' = cρ` | `−1 ∈ [Q₈,Q₈]`, no extension; `c(tn) = c(t)`, `β' = β·δc` | class well defined; criterion both directions | C01, N01, N03 |
| §7.6 crossed systems | `(U_qU_r)U_t` both ways; gauge `b_qU_q`; `A₃ ◁ S₃` over `ℚ` | `a(q,r)a(qr,t) = σ_q(a(r,t))a(q,rt)`; `a' = b_qσ_q(b_r)a b_{qr}⁻¹`; `σ` = conjugation | identities as stated | none |
| §7.7 isotypic category | `A_q(fd)`, `A_qA_r(f)`; `A₃ ◁ S₃` over `ℚ`; `M = 0` | `A_q(f)σ_q(d)`; `A_{qr}(f)a(q,r)⁻¹`; `M₂(ℚ)`, one simple, `Ind U = 2·std`; `W = 0` | holds; statement not vacuous | none |
| §7.8 intermediate subgroups | `T' = N` | crossed product `Dᵐᵒᵖ`; `M ⊗_D V` is `dim_D M` copies of `V` | consistent with §7.7; not stated in Lean, as the docstring says | none |

- Source locators checked against the text: Weibel2013 lines 1932–1981 (Definition 5.3.1, Lemmas 5.3.2–5.3.3, Example 5.3.4, Theorem 5.4, p. 37) for §7.1; they support the statement and the README's remark. Chapter titles of Isaacs (Ch. 5, 6, 11) and of Serre (Ch. 7, 9; §§7.2, 7.4, 9.1) agree with public contents listings; their texts were not read.
- Library declarations opened at the pins: Tau Ceti `Transitivity.lean` 332–353; `CharacterTable/Pairing.lean` 48–51, 231, 259; `CharacterTable/FixedPointCount.lean` 77, 183; `GroupTheory/AlmostConjugate.lean` 92; `CharacterTable/VirtualCharacter.lean` 127, 296, 328; `CharacterTable/Independence.lean` 76, 126; `RepresentationRing/Injective.lean` 50; `Induction/FiniteDimensional/Basic.lean` 375; `Mackey/Endomorphism.lean` 45–69; `Mackey/Hom.lean` 100; `Mackey/Irreducible.lean` 102, 151; `Mackey/Sufficient.lean` 46–59; `Clifford/Equivalence.lean` 64, 199, 227; `Clifford/Obstruction.lean` 156–162, 240, 309, 318; `Clifford/TensorFactorization.lean` 86–344; `Clifford/LiesOver.lean` 45; `Clifford/Injectivity.lean` 54; `Clifford/Extension/FullFaithful.lean` 155; `Algebra/MonoidAlgebra/Twisted/Basic.lean` 288, 336, 356; `ProjectiveRepresentation/Linearization.lean` 47; `ProjectiveRepresentation/PGL/Basic.lean` 59, 182; `ProjectiveRepresentation/PGL/Lifting.lean` 43; `ProjectiveRepresentation/RepresentationGroup/Basic.lean` 59, `Lifting.lean` 46. Mathlib `RepresentationTheory/Rep/Basic.lean` 574, 586; `GroupTheory/QuotientGroup/Defs.lean` 277.
- No pinned declaration states a target of §§0.1, 3.1, 4.1–4.4, 5.1–5.3, 6.1, 7.1, 7.5 (general field) or 7.7 (essential surjectivity): the pin's versions are algebraically closed, characteristic zero or dimension counts, as the README says.
- Cross-roadmap citations resolved: StableHomotopyKTheory (main, lines 12, 84), FiniteGroupInvariants (main, lines 56–68, 219–223), CharacterTheory (main, lines 111, 224), ModularInduction (main, line 60), ModularCharactersAndBlocksPartII, ArtinRepresentations, MetaplecticAutomorphicFormsPartII and CohomologyOfGroups at their open heads; each consumes this roadmap by layer and none owns one of its objects. The two anchors this revision renames are mapped by the paragraph after the Scope table (lines 889–895).
- Elaboration: `Suggested.lean` gives 14 `sorry` warnings and nothing else; no `set_option`, `lemma`, `#eval` or sorried data. The elaborated types of the 28 declarations were compared with the README: generality agrees.
- One-tactic probe on a scratch copy: none of the 14 sorried theorems closes by `rfl`, `simp` or `infer_instance`; `ker_projection_eq_map` closes by one library lemma (C02). Three further probes: `HasFiniteBiproducts (Rep k G)` fails by `inferInstance` and holds by `Abelian.hasFiniteBiproducts`; the §7.4 statement elaborates from two pinned lemmas; the correspondence elaborates under finite index of the inertia group.
- Dependency check: `depcheck: 199 roadmaps, 2195 edges, 0 problem(s)`. The automatic checks all passed. Changes outside the folder: none.
- The description agrees with the head: a revision of the roadmap on main, 28 Checks in 16 sections (counted), suppliers Mathlib and Tau Ceti only, removed and added declarations as listed.

Overlap check: read ModularCharactersAndBlocksPartII, ArtinRepresentations and MetaplecticAutomorphicFormsPartII at their open heads, and ModularInduction, CharacterTheory and FiniteGroupInvariants on main; nothing shared. Each consumes this roadmap (Clifford theory and the obstruction, induction theorems at the level of representations, almost-conjugacy and Schur covers) and this roadmap owns those objects. The open heads of ModularInduction and CharacterTheory were searched by object and not read in full.

Source independence: 5 passages compared with 1 source, Weibel2013 (the definition of a central extension, the statement of §7.1, its route, the perfection remark, and the docstring of `AbstractUCE.universal`), none shared beyond forced terms; largest share Isaacs, 7 of 23 locators, whose text could not be read; contents compared with Isaacs at chapter level from a public listing: independent (Layers 0, 3 and 4 have no counterpart among its chapters, and Layers 2, 5, 7 follow the order the dependencies force: Clifford theory needs induction, the obstruction needs the inertia group).

Research link: §7.1 is the universal central extension that Weibel (2013, Ch. III, Theorems 5.4–5.5) uses for the Kervaire–Steinberg identification `K₂(R) ≅ H₂(E(R); ℤ)`, consumed by StableHomotopyKTheory §3.29; Layers 5 and 7 feed block theory in ModularCharactersAndBlocksPartII. Rests on Weibel2013 lines 1970–1987 and the README's Downstream consumers.

## Not verifiable

- Isaacs, *Character Theory of Finite Groups*, Ch. 6 and Ch. 11 (§§5.1–5.3, 7.2, 7.4–7.6): AMS paywall; only the chapter titles were confirmed from a public listing.
- Curtis–Reiner, *Methods of Representation Theory I*, §§10–11 (§§0.1, 3.1, 5.1–5.3, 7.6): Wiley paywall; no public contents listing found.
- Serre, *Linear Representations of Finite Groups*, Part II, §§7.2, 7.4, 9–10 (§§2.3, 4.1, 4.3, 6.1): Springer paywall; section titles confirmed from public contents listings only.
- Alperin–Bell, *Groups and Representations* (§§3.1, 5.2): Springer paywall; see C05 for what the contents listing shows.
- Mackey, Amer. J. Math. 73 (1951), 576–592 (§3.1): paywalled.

Automatic checks set aside as false positives:

- The citation resolver listed nine names as found nowhere: eight are declared in this head's `Suggested.lean` (the `AbstractUCE` names and `Gassmann.normalInvariantEquiv`), and the ninth is the roadmap's own namespace.
- The overlap report lists two dropped anchors (old Layer 2.1 and "Abstract universal central extensions"); the paragraph after the Scope table maps both to their new places.
- The signature check flagged a dropped `[Group G]` on `AbstractUCE.derived`, which needs no group structure on `G`.

## Source issues

- **Gap** in Weibel2013 at Ch. III, Recognition Theorem 5.4, p. 37: the source says uniqueness of the map out of `[F,F]/[R,F]` follows from Lemma 5.3.3, without showing that group perfect as the lemma requires; it should be noted that perfect `G` gives `F = [F,F]·R`, hence every commutator of `F` is a commutator of elements of `[F,F]` modulo `[R,F]`; affects the proof.

## For the human reviewers

- Not tested: Isaacs, *Character Theory of Finite Groups*, has the largest share of the locators (7 of 23 in the README body) and could not be read legally; wording was not compared with it, and arrangement only at chapter level from a public contents listing.
