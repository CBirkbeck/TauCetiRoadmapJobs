# Review of InductionRestriction (pull request #2639 at b28b20c)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** needs changes

**Summary.** Changes are needed for four findings. Two targets carry hypotheses their mathematics does not need: the Clifford correspondence (§5.3, a headline) holds over every field without `hG` or `hSplitG`, and §6.1 needs only characteristic zero, not a splitting field. The §7.7 equivalence, half of the fourth headline, can be stated at the pins, although `Suggested.lean` says it cannot. And §7.4 restates Tau Ceti's extension of a factor set on a copy of its carrier. There are also eleven small corrections and one format note, none blocking. For the humans: no cited text could be read legally, so wording and arrangement were not compared against the sources with the largest share of locators.

## R01 (P2) — The Clifford correspondence of §5.3 holds over every field, so `hG` and `hSplitG` narrow a headline theorem below its true generality

As stated, a user with a modular or non-split coefficient field cannot apply the correspondence. Consumers do apply Clifford theory in characteristic `p`: ModularCharactersAndBlocksPartII cites Layer 5. The overview also advertises the theorem only "over a splitting field". §5.3 (line 431) and `clifford_correspondence_of_scalarSchur` (`Suggested.lean` lines 124–139) "assume `hG : IsUnit (Nat.card G : k)` and that `k` splits `G` (`hSplitG`)". Neither assumption is used anywhere in the argument:

1. Let `U` be simple over `T` and lie over `V`. Then `Res_N U` is `V`-isotypic (§5.2 applied to `T`). Also `Res_N Ind_T^G U = ⊕_{g ∈ G/T} g ⊗ U` with `g ⊗ U` of type `{}^g V`, so the `V`-isotypic part of `Ind U` is exactly `U`. A nonzero `G`-submodule `X` has semisimple restriction to `N`, so some translate of `X` meets `U`. Hence `X ⊇ U` and `X = Ind U`.
2. Let `W` be simple over `V`. The `V`-isotypic part `W_V` of `Res_N W` is a `T`-module and `W = ⊕_{g ∈ G/T} g W_V`. So the map `Ind W_V → W` is onto between spaces of equal dimension. Also `W_V` is simple, because `Σ_g gY = W` forces `Y = W_V`.
3. An isomorphism `Ind U ≅ Ind U'` maps `V`-isotypic part to `V`-isotypic part, so `U ≅ U'`.

Tau Ceti's semisimplicity input, `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` (`RepresentationTheory/Induction/Clifford/Basic.lean` line 327), has no hypothesis on `|N|` either. Two instances where a hypothesis fails and the conclusion still holds:

- **`A₄ ⊃ V₄` over `ℚ`.** `ℚ` does not split `A₄`: its two-dimensional simple module has endomorphism algebra `ℚ(ω)`. A nontrivial character `χ` of `V₄` has inertia group `V₄`, and `Ind χ`, with character `(3, −1, 0, 0)`, is the three-dimensional simple module, the only one over `χ`.
- **`S₃ ⊃ A₃` over `𝔽₄`.** Here `|S₃| = 0` in `𝔽₄`. A character `λ` of order 3 has inertia group `A₃`, and `Ind λ` is the two-dimensional simple module, the only one over `λ`.

Smallest change: drop `hG` and `hSplitG` from the statement (and its name), from §5.3's first sentence and from the second headline of the overview. In the route, replace "Frobenius reciprocity … with Maschke's theorem for `T`" by step 2. The Checks of §5.3 stay as they are.

## R02 (P2) — §6.1 needs no splitting hypothesis: over any field of characteristic zero the irreducible characters form a basis of the virtual-character lattice

The target is narrower than its own argument, so consumers over `ℚ` or a number field get nothing from it. KTheoryFiniteLocalFields and ClassicalArithmeticCompletion both cite Layer 6. Two Tau Ceti lemmas suffice:

- `TauCeti.ClassFunction.characterPairing_ofFDRep_eq_zero` (`RepresentationTheory/CharacterTable/Pairing.lean` line 259) gives `⟨χ_V, χ_W⟩ = 0` for non-isomorphic simple modules over every field.
- `characterPairing_ofFDRep_eq_finrank` (line 231) gives `⟨χ_V, χ_V⟩ = dim_k End(V)`, which is nonzero in characteristic zero.

An orthogonal family with nonzero norms is linearly independent, and Maschke's theorem gives the `ℤ`-span statement. Layer 6's own Example confirms this. For `C₃` over `ℚ`, "which does not split it", it records exactly the conclusion: the basis `1, (2, −1, −1)`, with norm `2 ≠ 0`.

Smallest change: in §6.1 (line 480), its heading and the overview, write "a field of characteristic zero" in place of the splitting-field hypothesis. In the route, write "orthogonal, with `⟨χ_V, χ_V⟩ = dim End(V) ≠ 0`" for "orthonormal".

## R03 (P2) — The §7.7 equivalence, half of the fourth headline, can be stated at the pins, but `Suggested.lean` says it cannot and omits it

The acceptance test is missing a headline, and the docstring (lines 28–32) gives a reason that does not hold. The reason is the claim that the source category, the full subcategory of `V`-isotypic representations, is not defined at the pins. No such subcategory is needed:

- Tau Ceti defines `FDRep.cliffordMultiplicityFunctor A s hs : FDRep k (inertia A) ⥤ ModuleCat (cliffordCrossedSystem A s hs).opInv.Algebra` on all of `FDRep k (inertia A)` (`RepresentationTheory/Induction/Clifford/Extension/Module.lean` line 70).
- It states full faithfulness with source hypotheses written in Mathlib's predicates `IsSemisimpleModule` and `IsIsotypicOfType` (`Extension/FullFaithful.lean`, `cliffordMultiplicityFunctor_map_bijective`, line 155).

The missing half of the equivalence elaborates at the pins with `import Mathlib` and `import TauCeti.RepresentationTheory.Induction.Clifford.Extension.FullFaithful` only (`open CategoryTheory` and `open scoped MonoidAlgebra`):

```lean
theorem exists_cliffordMultiplicityFunctor_obj_iso {k G : Type u} [Field k] [Group G]
    {N : Subgroup G} [N.Normal] (A : FDRep k N) [Simple A]
    (s : (TauCeti.CliffordExtension.groupExtension A).Section) (hs : s 1 = 1)
    (M : Type u) [AddCommGroup M]
    [Module (TauCeti.CrossedSystem.Algebra (FDRep.cliffordCrossedSystem A s hs).opInv) M]
    [Module k M] [IsScalarTower k
      (TauCeti.CrossedSystem.Algebra (FDRep.cliffordCrossedSystem A s hs).opInv) M]
    [FiniteDimensional k M] :
    ∃ W : FDRep k (TauCeti.inertia A),
      IsSemisimpleModule k[N] (Representation.asModule (FDRep.ρ
        ((Action.res (FGModuleCat k) (Subgroup.inclusion (TauCeti.le_inertia A))).obj W))) ∧
      IsIsotypicOfType k[N] (Representation.asModule (FDRep.ρ
        ((Action.res (FGModuleCat k) (Subgroup.inclusion (TauCeti.le_inertia A))).obj W)))
        (Representation.asModule A.ρ) ∧
      Nonempty ((FDRep.cliffordMultiplicityFunctor A s hs).obj W ≅ ModuleCat.of _ M) := by
  sorry
```

Smallest change: state this, or an equivalent form, in `Suggested.lean`, and remove §7.7 from the docstring's list of unstatable headlines. Make the same correction in the description's sentence on the two unstated theorems. §7.8 may stay in that list if its comparisons need a functor for intermediate subgroups that the pins lack.

## R04 (P2) — §7.4's "product model" restates Tau Ceti's extension of a factor set, and its two facts, on a copy of its carrier

As written, an implementer is asked to prove two pinned theorems again, and the Scope section claims ownership of an object that Tau Ceti already has. In `GroupTheory/GroupExtension/Of/FactorSet.lean`:

- `TauCeti.FactorSet.Extension α` (line 180) is the pair `(left : M, right : G)`, with `⟨a, g⟩⟨b, h⟩ = ⟨a (g • b) α(g, h), gh⟩` (line 211). For the trivial action this is the README's `(a, g)(b, h) = (a b α(g, h), g h)`.
- `equivProd` (line 190) identifies it with `M × G`.
- `groupExtension` (line 345) makes it a Mathlib `GroupExtension M α.Extension G`, built from `range_inl_eq_ker_rightHom` (line 337).
- `inl_range_le_center` (line 398) gives centrality for the trivial action.

§7.4 says itself that the group structure "is transported from Tau Ceti's `TauCeti.FactorSet.Extension` along `factorSetNativeEquiv`". Both theorems are pinned facts carried across that transport:

- `factorSetScalarRange_eq_kernel` is `range_inl_eq_ker_rightHom`.
- `factorSetProjection_isCentralExtension` is `rightHom_surjective` together with `inl_range_le_center`.

Smallest change: delete `centralExtensionOfFactorSet` and the block from `normalizedFactorSet` to `factorSetGroupExtension` (`Suggested.lean` lines 300–305 and 375–452), together with the two §7.4 targets. Cite the Tau Ceti declarations in §7.4 and under From Tau Ceti, and remove "the product model of the extension of a factor set" from the owned list in Scope. The lifting target of §7.4 is unaffected. If downstream users want the `Prod` carrier, `factorSetNativeMulEquiv` alone, with no theorem about it, would serve.

## C01 — Serre's Chapter 7 is in Part II, not Part I

The locators at line 180 (§2.3), line 274 (§4.1) and line 305 (§4.3), and the References entry at line 977, send a reader to the wrong part of the book. The publisher's contents page places Ch. 7, "Induced representations; Mackey's criterion" (pp. 54–60), in Part II, "Representations in characteristic zero". Write "Part II, §7…" in all four places.

## C02 — Two Layer 7 citations cannot be followed

"Borcherds, p. 109" (lines 525 and 997) names no work, and it is the only source given for the §7.1 headline. Karpilovsky is cited with no chapter, section or theorem in §§7.2–7.5 (lines 571, 601, 619, 656). Give the Borcherds title and year, or cite a published account of the universal central extension of a perfect group. Add Karpilovsky locators at each claim.

## C03 — Several `Suggested.lean` declarations are adapters rather than headline statements, and ask an implementer for little

- `factorSet_mem_cocycles₂` closes at the pins with the single tactic `simpa [groupCohomology.mem_cocycles₂_iff, ← ofMul_mul, mul_comm] using hα`. It is Mathlib's `groupCohomology.cocyclesOfIsMulCocycle₂` (`RepresentationTheory/Homological/GroupCohomology/LowDegree.lean` line 721).
- `Gassmann.restrictEquiv` and `Gassmann.normalInvariantEquiv` (lines 55–70) are complete definitions with no statement about them. §2.1's two targets are therefore already carried out in the file.
- `twistedMul`, `twistedCoordinateEquiv` and their two lemmas are a coordinate adapter, not a headline.

Would mark them as sanity checks in the docstring, or keep them as README targets only.

## C04 — Both targets of §2.3 follow in a line or two from the Tau Ceti lemmas the section cites

- The second bullet, `⟨χ_V, χ_V⟩ = 1` for scalar endomorphisms, is `TauCeti.ClassFunction.characterPairing_ofFDRep_eq_finrank` (`CharacterTable/Pairing.lean` line 231) with `finrank k (V ⟶ V) = 1`.
- The first bullet is `TauCeti.characterPairing_ind_trivial_eq_card_doubleCosetQuotient` (`Induction/DoubleCosetPairing.lean` line 174) at `K = ⊤`, where there is a single double coset.

As targets they ask an implementer for nothing new. Would mark them as Checks, or state what more is meant.

## C05 — The finiteness of `G` in the two Clifford statements of §5.2 is unused

`exists_resFDRep_iso_cliffordSum` assumes `[Finite G]` and `clifford_restrict_character` assumes `[Fintype G]`. Tau Ceti's `FDRep.clifford_restrict_iso` (`Induction/Clifford/Equivalence.lean` line 227) assumes no finiteness of `G`, and neither do the route lemmas (`Clifford/Basic.lean` line 327, `Clifford/Multiplicity.lean` line 419, `Clifford/Orbit/Index.lean` line 297). So the every-field form does not generalize the pinned one in `G`. Drop both instances, and limit "Throughout, `G` is finite" (line 356) to §§5.1 and 5.3.

## C06 — The first Check of §7.2 says the opposite of what its example shows

Line 580 reads "The class of a projective action is not determined by its factor set alone". But the class is the cohomology class of the factor set. The example shows something else: two different homomorphisms `C₂ → PGL₂(ℂ)` with the same factor set. Would reword as "A projective action is not determined by its factor set: …".

## C07 — "The free group's commutator subgroup is not [perfect]" fails for the trivial group

The parenthetical at line 536, repeated in the docstring of `cover_isPerfect` (`Suggested.lean` line 240), is false for `G = 1`. That group is perfect, `F` is the free group on one generator (that is, `ℤ`), and `[F, F] = 1` is perfect. Add "for `G` nontrivial".

## C08 — `kernelMap_bijective` is not Hopf's formula

At line 531 and in `Suggested.lean` (line 230) the statement is called "Hopf's formula for the kernel". What it says is the isomorphism `(R ∩ [F, F])/[F, R] ≅ ker(U → G)`, an instance of the isomorphism theorems. Hopf's formula identifies that group with `H₂(G, ℤ)`, which this roadmap does not state. Would call it "the kernel of `U → G` as `(R ∩ [F, F])/[F, R]`".

## C09 — Ids that other roadmaps cite are dropped with no old → new mapping

- StableHomotopyKTheory (README line 84) links `#abstract-universal-central-extensions`, now `#71-abstract-universal-central-extensions`.
- PseudodifferentialOperators (line 2008) links `#layer-21-almost-conjugacy-and-permutation-representations`.
- ProfiniteCohomology (line 2000) cites the heading "What Mathlib already has (consume)".
- AnalyticNumberTheoryPartI (line 118) cites "Layer 3, Mackey §3a".

The Scope table maps old Layer 1, §2.1 and §2.2, but none of these. One sentence after the table would do: "The former subsection 'Abstract universal central extensions' of Layer 7 is now §7.1; former Layer 2.1 is §2.1; former Layer 3a is §3.1 together with Tau Ceti's `Rep.mackeyDecomposition`; the former list 'What Mathlib already has' is now From Mathlib under Exact supplier contracts."

## C10 — The Example of §3.1 gives no coefficient ring and fails over `𝔽₃`

Line 251 asserts `Ind_H^G A ≅ sign ⊕ standard`, in a section stated over an arbitrary commutative ring. Over `𝔽₃` the module `Ind_{⟨(1 2)⟩}^{S₃}(sign)` is the three-dimensional projective indecomposable module with head `sign`, so it does not decompose. Would write "over `ℚ`" (or "in characteristic not 3").

## C11 — Three sentences of the description do not match the head

- "layers with `### k.n` sections (each with a *Needs:* line, a source at the claim, Examples and Dependencies)". §2.1, §4.2, §4.4, §7.7 and §7.8 cite no source. Would write "…and a source where one applies".
- "Old Layers 2.1 and 2.2 keep their numbers §2.1 and §2.2". The head has no §2.2: the `S₁₆` pair is a row of the Scope table, consumed from Tau Ceti. Would write "Old Layer 2.1 keeps its number; old §2.2 is Tau Ceti's `TauCeti.exists_S16_gassmann_pair`, recorded in the Scope table".
- "Layer titles are unchanged, so the anchors other roadmaps link to for Layers 0, 3 and 6 still resolve". This is true, but it leaves out the two anchors that do break (C09). Would add "the anchors of old Layer 2.1 and of the subsection 'Abstract universal central extensions' change".

## N01 — The two files list different headline theorems

The module docstring of `Suggested.lean` counts the Mackey biproduct (§3.1) as a headline and calls §7.8 one. The README overview names four headlines and calls the biproduct an addition. Would use one list.

## Questions for the author

- The References (line 984) assign projective representations to Isaacs "Ch. 8 and Ch. 11", with the edition "AMS Chelsea (1976)". The published listings I found give Ch. 8 as Brauer's theorem, and the Chelsea printing is later than 1976. Is Ch. 8 intended, and which edition is meant? (The publisher's page refused access, so this rests on search listings only.)
- §2.3 cites Serre §7.3–7.4 for Frobenius reciprocity, and §4.1 cites "Prop. 23–25". Is the reciprocity formula in §7.2, and do Propositions 24–25 belong to Ch. 7 at all? (Only chapter-level contents were publicly readable.)

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.1 generator formulas | `S = 1`; relation `⟦t'g ⊗ ⟦t t'⁻¹ ⊗ a⟧⟧`; both composites | both sides map to `⟦t g ⊗ a⟧`; `⟦t g ⊗ ⟦1 ⊗ a⟧⟧ = ⟦g ⊗ ⟦t ⊗ a⟧⟧` | holds | none |
| 2.1 adapters | `f = id`; `I = 1`; `I = G` | restriction is `e`; invariants all of `V`, quotient `G`; invariants `V^G`, quotient trivial | holds, defs complete | C03 |
| 2.3 pairings | `S₃`, `H = ⟨(1 2)⟩`; `𝔽₂`, `C₂`; `ℝ`, `C₃` rotation | `(3+3+0)/6 = 1`; `2⁻¹ = 0` so pairing `0`; `(4+1+1)/3 = 2 = dim ℂ` | Checks true | C04 |
| 3.1 biproduct (Lean) | `S₃`, `H = K = ⟨(1 2)⟩`, sign; `K = 1`; finite biproducts | 2 double cosets, `1 + 2 = 3`, `(3, −1) = (1, −1) + (2, 0)`; `|G/H|` summands; instance derivable | holds, not vacuous | C10 |
| 4.1 identity component | `C₂`, `H = 1`, `V = k` | `dim End = 2 = 1 + 1`; `f = c ↦ (c, 0)` | holds | none |
| 4.2 representative change | `S₃`, `H = ⟨(1 2)⟩`, `s = (1 3)`, `h₁ = (1 2)` | `h₁ s = (1 3 2)`; both Mackey subgroups trivial; both spaces dimension 1 | holds | none |
| 4.3 conjugate form | `Q₈`, `H = ⟨i⟩`, `s = j` | `j⁻¹ i j = −i` in both forms; conjugation nonzero in both | forms agree | none |
| 4.4 real `Q₈` | map `⟦g ⊗ v⟧ ↦ g⁻¹ v` | `(hg)⁻¹ h v = g⁻¹ v`; `x·` gives `x g⁻¹ v`; dims `2 + 2 = 4 = dim ℍᵒᵖ` | holds | none |
| 5.2 structural (headline) | `C₄` on `ℚ²`, `N = ⟨g²⟩`; `GL₂(𝔽₂)`, `N = A₃` | `e = 2`, `T = G`, `2 = 2·1·1`; `e = 1`, `T = S₃`, `2 = 1·1·2` | holds, every field | C05 |
| 5.2 character (headline) | same; over `ℂ` | `χ(g²) = −2 = 2·(−1)`; over `ℂ`, `e = 1` for `g ↦ ±i` | holds | C05 |
| 5.3 correspondence (headline) | `S₄ ⊃ V₄/ℚ`; `A₄ ⊃ V₄/ℚ`; `S₃ ⊃ A₃/𝔽₄` | `|T| = 8`, two characters, `Ind` dims 3, 3; split fails, `Ind χ` 3-dim unique; `|G| = 0`, `Ind λ` 2-dim unique | holds without `hG`, `hSplitG` | R01 |
| 6.1 lattice | `S₃/ℚ`; `C₃/ℚ` (not split) | `(3,1,0) = χ₁ + χ₃`; `(1,0,0)` not in lattice, `6·(1,0,0)` is; `C₃`: basis `1, (2,−1,−1)`, norm 2 | holds without splitting | R02 |
| 7.1 UCE (headline) | `A₅`; `G = 1`; `C₂` | `U = SL₂(𝔽₅)`, kernel order 2; `F ≅ ℤ`, `[F, F] = 1` perfect; image `[G, G] = 1`, not onto | holds; aside false at `G = 1` | C07, C08 |
| 7.2 cocycle, `PGL` | constant `c`; Pauli `X, Z`; `diag(1, −1)` | `c·c = c·c`; `α(a,b) = 1`, `α(b,a) = −1`; factor set `1` twice, images differ | holds; Check framing wrong | C03, C06 |
| 7.3 coordinates | Pauli class | `e_a e_b = e_ab`, `e_b e_a = −e_ab`, `e_a² = e_b² = 1`, `M₂(ℂ)` | holds | C03 |
| 7.4 extension | `C₂`, `α(g,g) = −1`; Tau Ceti product law | `(1,g)² = (−1, 1)`; Tau Ceti product equals the README's for trivial action | duplicates pin | R04 |
| 7.5 obstruction (headline) | `Q₈ ⊃ {±1}/ℂ`; `C₄ ⊃ C₂` over `ℝ`, `ℂ` | nonzero (`−1 ∈ [Q₈, Q₈]`); `ℝ`: `c² = −1` impossible, nonzero; `ℂ`: `c = i`, zero | holds, every field | none |
| 7.6 crossed system | `A₃ ◁ S₃/ℚ`, `U = ℚ(ω)`; cocycle law | `σ` = conjugation, `a ≡ 1`; both sides give `s(q)s(r)s(t)s(qrt)⁻¹` | holds | none |
| 7.7 equivalence (headline) | `A₃ ◁ S₃/ℚ`; Lean statement | `(ℚ(ω)/ℚ, σ, 1) ≅ M₂(ℚ)`; `Ind U` char `(4,0,−2) = 2·(2,0,−1)`; statement elaborates | true, statable, absent | R03 |
| 7.8 restriction | `T' = N`, `D = ℚ(ω)`, `M = D` | `M ⊗_D V ≅ V`, one copy | holds | none |
| Convention 5 | `S₃`, `s = (1 2 3)`, `H = ⟨(1 2)⟩` | `s(1 2)s⁻¹ = (2 3)`; `s⁻¹(1 2)s = (1 3)` | holds | none |

- Source locators: the four Serre locators were checked for part and chapter against the publisher's public contents page, and all four name the wrong part. None of the other 20 body locators could be read (Isaacs, Curtis–Reiner, Alperin–Bell, Karpilovsky and Mackey 1951 are paywalled; Borcherds is unidentified).
- Tau Ceti declarations opened at the pin: `Clifford/Equivalence.lean` 64, 227; `Clifford/Decomposition.lean` 305; `Clifford/Correspondence.lean` 186, 226; `Clifford/Basic.lean` 327; `Clifford/Obstruction.lean` 87, 162, 304; `Clifford/Extension/Module.lean` 70; `Clifford/Extension/FullFaithful.lean` 155; `GroupExtension/Of/FactorSet.lean` 180, 190, 211, 337, 345, 398; `CharacterTable/Pairing.lean` 48, 231, 247, 259; `CharacterTable/Independence.lean` 126; `CharacterTable/VirtualCharacter.lean` 127, 328; `CharacterTable/Table.lean` 114; `Algebra/MonoidAlgebra/Twisted/Basic.lean` 288, 336, 356; `Induction/DoubleCosetPairing.lean` 110, 174.
- Mathlib declarations opened at the pin: `RepresentationTheory/Homological/GroupCohomology/LowDegree.lean` 629, 721; `RingTheory/SimpleModule/Isotypic.lean` 56.
- Cross-roadmap citations resolved: 21 roadmaps on main that cite this one (their citations read against the head, up to six per roadmap); InverseGaloisAndArithmeticFundamentalGroups IG.3.4 (its README line 3033); InductionRestrictionPartII's scope; CohomologyOfGroups 6.8 at its open head.
- Automatic checks: all passed at this head. Dependency check output: `depcheck: 199 roadmaps, 2195 edges, 0 problem(s)` (no roadmap suppliers).
- Elaboration: `Suggested.lean` elaborates with 17 `sorry` warnings and nothing else. `#check @` of all 48 declarations, run together in one file, elaborates. The binders flagged as dropped for `derived` and `normalizedFactorSet` are present, or not needed.
- Probes: `factorSet_mem_cocycles₂` closes with one tactic. `HasFiniteBiproducts (Rep k K)` is not inferred, but `HasFiniteBiproducts.of_hasFiniteProducts` supplies it. The §7.7 statement in R03 elaborates.

Overlap check: read ModularInduction, CharacterTheory, FiniteGroupInvariants (main), and ModularCharactersAndBlocksPartII, ArtinRepresentations, MetaplecticAutomorphicFormsPartII and CohomologyOfGroups (open heads). Nothing is shared:

- They consume this roadmap's Layers 0–7.
- CharacterTheory works over algebraically closed fields only.
- ModularInduction owns `G₀`.
- CohomologyOfGroups 6.8 owns Hopf's formula, and StableHomotopyKTheory §3.29 owns `H₂` of a perfect group.
- This roadmap is the sole owner of the abstract universal central extension and of general-field Clifford theory.

Source independence: 0 passages compared with source text, across 7 sources (none readable legally). The README prose shows no textbook clause-by-clause structure. The largest shares are Isaacs and Curtis–Reiner, 6 of 24 locators each, and neither text nor its contents could be read. The layers were compared with Serre's published contents (Ch. 7–12) and are independent: Layers 0, 3 and 7 have no counterpart, and Layers 2–4 share one chapter.

Research link: the targets are classical infrastructure for research roadmaps. StableHomotopyKTheory uses §7.1 for perfect groups, PolynomialGaloisGroupsPartIII uses §§2.1–2.2 for Gassmann's theorem on arithmetically equivalent fields, and InverseGaloisAndArithmeticFundamentalGroups IG.3.4 uses Layer 7's Schur covers. Mackey (1951) is the primary source. This rests on the README's Downstream consumers and the consumers' READMEs.

## Not verifiable

- Curtis–Reiner, *Methods of Representation Theory I*, §§10–11 (0.1, 3.1, 5.1–5.3, 7.6): Wiley paywall; no legal copy or contents page found.
- Isaacs, *Character Theory of Finite Groups*, Ch. 5, 6, 8, 11 (5.1–5.3, 7.2, 7.5, 7.6): the AMS page refused access; no legal copy found.
- Alperin–Bell, Ch. 8 (3.1, 5.2): Springer paywall.
- Mackey 1951, Amer. J. Math. 73 (3.1): JSTOR; the sources service found no legal copy.
- Karpilovsky 1985 (7.2–7.5): no locator given, and paywalled.
- "Borcherds, p. 109" (7.1): no work named.
- Serre's section and proposition numbers (2.3, 4.1, 4.3, 6.1): only chapter-level contents are public.

Automatic checks set aside as false positives: the citation resolver listed ten names declared in this roadmap's own `Suggested.lean` (the `AbstractUCE` declarations and `Gassmann.normalInvariantEquiv`), and the roadmap's own namespace, as found nowhere, although the head declares them.

## Source issues

- none

## For the human reviewers

- Not tested: no cited text was readable legally. Isaacs and Curtis–Reiner, with the largest share of locators (6 of 24 each), could be read neither as text nor as a table of contents, so the wording and arrangement checks were not run against them. Serre was compared at chapter level only.
