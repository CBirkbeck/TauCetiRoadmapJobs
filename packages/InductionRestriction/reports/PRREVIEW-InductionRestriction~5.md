# Review of InductionRestriction (pull request #2639 at 5cf368c)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The one finding of the previous round (the almost-conjugacy criterion of §2.1 stated without finiteness of `G`) is repaired, and so are its five small corrections and three format notes. Every target, Check and worked example was recomputed and holds, including the Clifford correspondence in its new generality (inertia group of finite index, `G` possibly infinite); the statements elaborate and none closes in one tactic. There are no small corrections and two format notes, neither blocking. For the humans: of the cited texts only Weibel could be read; Isaacs, the most-cited one, is behind a paywall.

## N01 — Four sections state targets with no source locator

§4.2 (the representative-change equivalence), §7.3 (twisted coordinates), §7.7 (the isotypic-category equivalence) and §7.8 (restriction and induction between intermediate subgroups) cite no text; §7.6 cites Curtis–Reiner §11 for the same crossed systems. A locator for §§7.7–7.8 (the crossed-product description of the representations over `V`) would let an implementer check the conventions against a reference; §4.2 and §7.3 are adapters and may need none.

## N02 — Two entries of the References are cited nowhere in the text

James–Liebeck (Ch. 21) and Alperin–Bell (§16) appear only in the list of references (README lines 1070–1073). Would cite each where it is used, or say in the entry what it is background for.

## Questions for the author

- §6.1 (line 516) gives "over `ℂ`: Serre, Part II, §9–10" for the basis statement, while the target is over a field of characteristic zero that need not split `G`. Does Serre's §12.1 (the ring `R_K(G)`) state the basis and orthogonality of the characters of the simple `K[G]`-modules for such a field? If so it is the closer locator. The text is behind a paywall and was not read.
- Which results of Curtis–Reiner §11 give Clifford's theorem and the correspondence of §§5.2–5.3 over an arbitrary field, and the crossed systems of §7.6? The text could not be read (paywall), so the section-level locator was not checked.

## Previous findings

Each remark of the previous review (of head 61fab9d) against this head:

- R01 (finiteness in the §2.1 criterion): repaired. Line 149 now reads "and, for finite `G` and over a field of characteristic zero, it holds exactly when the permutation representations on `G ⧸ H` and `G ⧸ K` are equivalent"; the cited theorem stands under `[Finite G]` at the pin.
- C01 (hypotheses of `tensorRepEquiv`): repaired. Lines 1042–1043: "(algebraically closed, `V` simple, `W` irreducible with a nonzero `N`-map from `V`)".
- C02 (`ker_projection_eq_map` is a library lemma): repaired. The declaration is gone from `Suggested.lean`; the §7.1 API (lines 577–579) names `QuotientGroup.ker_lift` as the surjectivity half of `AbstractUCE.kernelMap_bijective`.
- C03 (§7.4 is a composition of two pinned lemmas): repaired. Line 662: "This is an API fact of the section, not a target".
- C04 (`clifford_correspondence` under `[Finite G]`): repaired. The Lean statement and §5.3 take `[(TauCeti.inertia V).FiniteIndex]`; the overview's second headline and the Layer 5 preamble agree.
- C05 (Alperin–Bell, Ch. 8): repaired. The citations in §3.1 and §5.2 are removed and the reference reads "§16 (induction), the last section of the chapter on group representations".
- N01 (the *Needs:* line of §7.5): repaired; lines 725–728 list both declarations.
- N02 (`HasFiniteBiproducts (Rep k K)`): repaired; lines 234–236 say how to discharge it.
- N03 (universes of the existence statement): repaired; `exists_scalarProjectiveInertiaExtension` takes `k : Type u`, `G : Type v`, and Convention 9 says so.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §0.1 generator formulas | relations `⟦t'g ⊗ ⟦t t'⁻¹ ⊗ a⟧⟧`, `⟦g ⊗ ⟦st ⊗ sa⟧⟧`; `S = 1` | both go to `⟦tg ⊗ a⟧`; pin lemma gives `⟦ψ(h)κ ⊗ a⟧` (`Transitivity.lean` 305–309) | well defined; matches pin | none |
| §2.1 criterion and adapters | pin theorem's context; Lean bodies; `f = id`, `I = 1` | `[Finite G]`, `[CharZero k]` at `FixedPointCount.lean` 77, 183; bodies real; both give `e` | sound; finiteness now stated | none |
| §2.3 normalization | `S₃`, `⟨(1 2)⟩`; `𝔽₂`, `C₂`; `ℝ`, `C₃` rotation | `(3+3·1+2·0)/6 = 1`; `(2 : 𝔽₂)⁻¹ = 0` (field inverse, `Pairing.lean` 51); `(4+1+1)/3 = 2 = dim ℂ` | Checks true | none |
| §3.1 biproduct form | `S₃`, `H = K = ⟨(1 2)⟩`, sign; relation at `x ∈ K ⊓ sHs⁻¹` | cosets of sizes 2, 4; `(3, −1) = (1, −1) + (2, 0)`; `⟦s⁻¹xu ⊗ x·a⟧ = ⟦s⁻¹u ⊗ a⟧` | holds; support `Hs⁻¹K` | none |
| §4.1 identity component | `C₂`, `H = 1`, `V = k` | `End = k[C₂]`, dim `2 = 1 + 1`; image of `c` is `(c, 0)` | holds | none |
| §4.2 representative change | `h₁ s h₂` | `H ⊓ (h₁sh₂)H(h₁sh₂)⁻¹ = h₁(H ⊓ sHs⁻¹)h₁⁻¹` | conjugation by `h₁`, as stated | N01 |
| §4.3 conjugate form | `Q₈`, `H = ⟨i⟩`, `s = j` | `j⁻¹ i j = −i`; `{}^j V` on `H` is `V` along `y ↦ s⁻¹ys` | agrees with `MackeyDisjoint` (`Irreducible.lean` 102) | none |
| §4.4 `Q₈` over `ℝ` | `⟦g ⊗ v⟧ ↦ g⁻¹v` on relation and action | `g⁻¹h⁻¹hv = g⁻¹v`; `⟦gx⁻¹ ⊗ v⟧ ↦ x g⁻¹v`; dims `2 + 2 = 4 = dim ℍᵐᵒᵖ` | simple, not disjoint | none |
| §5.1 isotypic decomposition | `ℚ[C₃]`; `𝔽₃`, `C₂`, `W = 1³` | `U` once, `finrank Hom = 2`; pairing `3 = 0`, `finrank = 3` | Checks true | none |
| §5.2 Clifford's theorem (headline) | `C₄` on `ℚ²`; `S₃` on `𝔽₂²`; infinite `G`; coset `gT` | `e = 2`, `χ(g²) = −2`, `dim = 2·1·1`; `e = 1`; `Σ gV = W` finite-dimensional forces `[G : T] < ∞`; `{}^{gt}V ≅ {}^g V` | holds for every group | none |
| §5.3 correspondence (headline) | `S₄ ⊃ V₄` over `ℚ`; `A₃ ◁ S₃` over `ℚ`; infinite `G`, `[G : T] < ∞`; `T = G` | 2 of 4 characters of `T` extend, `3 + 3 = 6`; inertia `S₃`; `V`-part of `Res Ind U` is `1·U`, `dim Ind W_V = dim W`; identity | all three clauses hold under finite index | none |
| §6.1 lattice | `S₃` over `ℚ`; `C₃` over `ℚ` | `3c = 1` unsolvable for `(1, 0, 0)`; `(2, −1, −1)` norm `2 = dim ℚ(ω) ≠ 0` | holds without splitting | none |
| §7.1 universal extension (headline) | `C₂`; `G = 1`; `A₅`; `[a'r, b's]` mod `[F, R]` | image `[G, G] = 1`; `F = ℤ`, `U = 1`; kernel order 2; equals `[a', b']` | sound for every `G` / perfect `G` as split | none |
| §7.2 `PGL` converse | `C₂ × C₂` with `X`, `Z`; `V = 0`; constant `α ≡ c` | `α(a,b) = 1`, `α(b,a) = −1`; every `α` on `0`; `c·c = c·c` | Checks true | none |
| §7.3 coordinates | pin carrier; `C₂ × C₂` | subalgebra of `End(G →₀ k)` (`Twisted/Basic.lean` 288); `e_b e_a = −e_{ab}`, `e_a² = 1` | target has content | N01 |
| §7.4 extension, lifting | `C₂`, `α(g,g) = −1`; `Q₈ → C₂ × C₂` | `c(g)² = −1` unsolvable in `ℝ`; `(1,g)² = (−1,1)`; kernel `{±1} = [Q₈,Q₈]` | Checks true; API fact | none |
| §7.5 scalar obstruction (headline) | `Q₈ ⊃ {±1}` over `ℂ`; two extensions; `σ` extending `V`; `W ≅ V^(I)` | no extension; `ρ' = cρ`, `c(tn) = c(t)`, `β' = β·δc`; `β ≡ 1`; `Hom_N(V, W) = k^(I)` | class well defined; criterion both ways; evaluation bijective | none |
| §7.6 crossed systems | `(U_qU_r)U_t` both ways; gauge `b_qU_q` | both sides give `s(q)s(r)s(t)s(qrt)⁻¹`, so `a(q,r)a(qr,t) = σ_q(a(r,t))a(q,rt)`; `a' = b_qσ_q(b_r)a b_{qr}⁻¹` | identities as stated | none |
| §7.7 isotypic category (headline) | `A_q(fd)`, `A_qA_r(f)`; `A₃ ◁ S₃` over `ℚ`; `M = 0`; infinite `Q` | `A_q(f)σ_q(d)`; `A_{qr}(f)a(q,r)⁻¹`; `M₂(ℚ)`, `Ind U = 2·std`; `W = 0`; `dim W = dim_D M · dim V` | essential surjectivity holds | N01 |
| §7.8 intermediate subgroups | `T' = N` | crossed product `Dᵐᵒᵖ`; `M ⊗_D V` is `dim_D M` copies of `V` | consistent with §7.7; not stated in Lean, as its docstring says | N01 |
| Conventions 5, 7 | `S₃`, `s = (1 2 3)`, `H = ⟨(1 2)⟩`; `ℚ`, `A₃` | `sHs⁻¹ = ⟨(2 3)⟩`, `s⁻¹Hs = ⟨(1 3)⟩`; `End(ℚ(ω)) = ℚ(ω)` | as stated | none |

- Source locators checked against the text: Weibel2013 lines 1941–1981 (Definition 5.3.1, Lemmas 5.3.2–5.3.3, Example 5.3.4 with (5.3.5), Recognition Theorem 5.4, p. 37) support §7.1 as written, including the remark that the proof of 5.4 applies Lemma 5.3.3 without showing the source perfect (line 1978); line 1984 (Theorem 5.5) for the research link.
- Library declarations opened at the pins: Tau Ceti `Induction/Transitivity.lean` 292–334; `Induction/Mackey/Decomposition.lean` 86–125, 413; `Mackey/Hom.lean` 41–100; `Mackey/Sufficient.lean` 40–59; `Mackey/Irreducible.lean` 102; `Induction/LiesOver.lean` 59; `Induction/Inertia.lean` 94; `Clifford/Equivalence.lean` 64–80, 199–228; `Clifford/LiesOver.lean` 45; `Clifford/Injectivity.lean` 54; `Clifford/Classes.lean` 59, 125; `Clifford/Obstruction.lean` 87–110, 156–162, 304–320; `Clifford/TensorFactorization.lean` 292, 303; `Clifford/Extension/Module.lean` 70; `CharacterTable/Pairing.lean` 48–51, 231, 259; `CharacterTable/FixedPointCount.lean` 77, 183; `CharacterTable/VirtualCharacter.lean` 127, 286, 296, 328; `CharacterTable/Table.lean` 114; `CharacterTable/Independence.lean` 126; `RepresentationRing/Basic.lean` 157, `Injective.lean` 50; `Induction/DoubleCosetPairing.lean` 110; `GroupTheory/AlmostConjugate.lean` 92; `Algebra/MonoidAlgebra/Twisted/Basic.lean` 288. Mathlib `GroupCohomology/LowDegree.lean` 629, 721; `GroupTheory/IsPerfect.lean`.
- No pinned declaration states a target: the pin's Clifford restriction, correspondence, obstruction and lattice statements carry `[IsAlgClosed k]` (and `[Finite G]`, `[CharZero k]` for the correspondence), as the README says.
- Cross-roadmap citations resolved on main: StableHomotopyKTheory (lines 12, 84, 1365), FiniteGroupInvariants (56–68, 219–223), PolynomialGaloisGroupsPartIII (264–265, 697), PseudodifferentialOperators (2008–2009), CharacterTheory (111, 224–229), OddOrderTheorem (995, 1105), ClassicalArithmeticCompletion (220), KTheoryFiniteLocalFields (11), EndoscopicTransferAndUnitaryTraceComparison (99), InverseGaloisAndArithmeticFundamentalGroups (158, 411), ModularInduction (60–65); each consumes this roadmap and none is a supplier.
- Elaboration: `Suggested.lean` gives 13 `sorry` warnings and nothing else; no `set_option`, `lemma`, `#eval` or sorried data. The elaborated types of the 27 declarations were compared with the README: generality agrees.
- One-tactic probe on a scratch copy (`rfl`, `infer_instance`, `simp`, `exact QuotientGroup.ker_lift _ _ _`): none of the 13 sorried theorems closes.
- Dependency check: `depcheck: 196 roadmaps, 2162 edges, 0 problem(s)`. The automatic checks all passed. Changes outside the folder: none.
- The description agrees with the head: a revision of the roadmap on main; 28 Checks in 16 sections (counted); suppliers Mathlib and Tau Ceti only; the correspondence under finite index; removed and added declarations as listed.

Overlap check: read ModularCharactersAndBlocksPartII, ArtinRepresentations and MetaplecticAutomorphicFormsPartII at their open heads, ModularInduction on main and at its open head, and CharacterTheory and FiniteGroupInvariants on main; nothing shared. Each consumes this roadmap by layer. CohomologyOfGroups (open) and StableHomotopyKTheory §3.29 (main) own Hopf's formula and the identification of the kernel with `H₂`, which §7.1 does not state; the abstract universal central extension is this roadmap's, as both say.

Source independence: 5 passages compared with 1 source, Weibel2013 (the definition of a central extension, the statement of §7.1, its route, the perfection step, the docstring of `AbstractUCE.universal`), none shared beyond forced terms; largest share Isaacs, 7 of 21 locators, whose text could not be read; contents compared with Isaacs at chapter level from memory of its chapter titles only: independent (Layers 0, 3 and 4 have no chapter there, and the order of Layers 2, 5, 7 is forced: Clifford theory needs induction, the obstruction needs the inertia group).

Research link: §7.1 is the universal central extension that Weibel (2013, Ch. III, Theorems 5.4–5.5) uses for the Kervaire–Steinberg identification `K₂(R) ≅ H₂(E(R); ℤ)`, consumed by StableHomotopyKTheory §3.29; Layers 5 and 7 feed ModularCharactersAndBlocksPartII. Rests on Weibel2013 lines 1970–1987 and the README's Downstream consumers.

## Not verifiable

- Isaacs, *Character Theory of Finite Groups*, Ch. 6 and Ch. 11 (§§5.1–5.3, 7.2, 7.4–7.6): a paywalled book, not among the texts recorded for this roadmap; not read.
- Curtis–Reiner, *Methods of Representation Theory I*, §§10–11 (§§0.1, 3.1, 5.1–5.3, 7.6): paywalled, not recorded; not read.
- Serre, *Linear Representations of Finite Groups*, Part II, §§7.2, 7.4, 9–10 (§§2.3, 4.1, 4.3, 6.1): paywalled, not recorded; not read.
- Mackey, Amer. J. Math. 73 (1951), 576–592 (§3.1): paywalled; not read.
- James–Liebeck and Alperin–Bell (References only): paywalled; not read.

Automatic checks set aside as false positives:

- The citation resolver listed eight names as found nowhere: seven are declared in this head's `Suggested.lean` (six `AbstractUCE` names and `Gassmann.normalInvariantEquiv`), and the eighth is the roadmap's own namespace.
- The overlap report lists two dropped anchors (old Layer 2.1, cited by PseudodifferentialOperators, and "Abstract universal central extensions", cited by StableHomotopyKTheory); the paragraph after the Scope table (lines 906–912) maps both to §2.1 and §7.1.
- The signature check flagged a dropped `[Group G]` on `AbstractUCE.derived`, the commutator subgroup of the free group on the set `G`, which uses no group structure on `G`.

## Source issues

- **Gap** in Weibel2013 at Ch. III, Recognition Theorem 5.4, p. 37: the source says uniqueness of the map out of `[F,F]/[R,F]` follows from Lemma 5.3.3, without showing that group perfect as the lemma requires; it should be noted that perfect `G` gives `F = [F,F]·R`, so every commutator of `F` is a commutator of elements of `[F,F]` modulo `[R,F]`; affects the proof.

## For the human reviewers

- Not tested: Isaacs, *Character Theory of Finite Groups*, has the largest share of the locators (7 of 21 in the README body) and could not be read legally; wording was not compared with it, and its contents only at the level of chapter titles.
