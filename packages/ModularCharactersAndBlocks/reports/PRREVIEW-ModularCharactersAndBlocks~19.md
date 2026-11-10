# Review of ModularCharactersAndBlocks (pull request #1775 at f491552)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

This is a full review of the same head the previous review read (`f491552`). There are five findings. R01 (P2) is new: two headlines the module docstring calls not statable can be stated at the pins on native carriers, and both statements elaborate. R02 and R03 (P3) concern §2.2. R04 (P3) is a conflict between the family index and another open revision of that index. R05 re-raises the family-index ownership sentence.

## R01 (P2) — Brauer reciprocity and the integral surjectivity of the decomposition map are statable at the pins but absent

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean:22–25`: “Brauer reciprocity `C = Dᵀ D`, the surjectivity of the decomposition map and the Brauer-character basis … need Brauer characters and the reduction of stable lattices over a complete discrete valuation ring into `G₀(k[G])`; the pinned Tau Ceti has neither”.

**Claim:** reciprocity and integral surjectivity cannot be stated at the pins.

**Witness:** Neither needs Brauer characters. `d_{TS}` is the multiplicity of `S` in a reduced lattice (`webb` line 6692). Pinned: `TauCeti.cartanMatrix` (`CartanMatrix.lean:138`), `TauCeti.jordanHolderMultiplicity` (`CompositionSeries/Multiplicity.lean:217`), `Representation.baseChange` along any algebra (`RepresentationTheory/BaseChange.lean:124`).

**Repair:**
1. Add the following to `Suggested.lean`.
   - Imports: `TauCeti.RepresentationTheory.GrothendieckGroup.CartanMatrix`, `TauCeti.RepresentationTheory.BaseChange` and `TauCeti.Algebra.Module.ProjectiveCover.Basic`.
   - Open `CategoryTheory TauCeti Matrix`, for `ᵀ`.
   - Put the statement in a `Layer 3` section, with `D c i` the multiplicity of `S i` in the reduction of the `c`-th lattice:

```lean
theorem cartanMatrix_eq_transpose_mul_decomposition
    {G O : Type u} [Group G] [Finite G] [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [CharZero O]
    {ζ : FractionRing O} (hζ : IsPrimitiveRoot ζ (Monoid.exponent G))
    [IsArtinianRing (MonoidAlgebra (IsLocalRing.ResidueField O) G)]
    {ι κ : Type u} [Fintype ι] [Fintype κ]
    (P : ι → (finiteProjectiveModules
      (MonoidAlgebra (IsLocalRing.ResidueField O) G)).FullSubcategory)
    (S : ι → FGModuleCat.{u} (MonoidAlgebra (IsLocalRing.ResidueField O) G))
    [∀ i, IsSimpleModule (MonoidAlgebra (IsLocalRing.ResidueField O) G) (S i)]
    (hind : ∀ i, IsIndecomposableModule (MonoidAlgebra (IsLocalRing.ResidueField O) G) (P i).obj)
    (hPnoniso : Pairwise fun i j ↦
      IsEmpty (↥(P i).obj ≃ₗ[MonoidAlgebra (IsLocalRing.ResidueField O) G] ↥(P j).obj))
    (hPexh : IsExhaustiveIndecomposableProjectiveFamily P)
    (hSnoniso : Pairwise fun i j ↦
      IsEmpty ((S i : Type u) ≃ₗ[MonoidAlgebra (IsLocalRing.ResidueField O) G] S j))
    (hSexh : IsExhaustiveSimpleFamily S)
    (hcover : ∀ i, ∃ f : (P i).obj →ₗ[MonoidAlgebra (IsLocalRing.ResidueField O) G] (S i : Type u),
      IsProjectiveCover f)
    (L : κ → Type u) [∀ c, AddCommGroup (L c)] [∀ c, Module O (L c)]
    [∀ c, Module.Free O (L c)] [∀ c, Module.Finite O (L c)]
    (ρ : ∀ c, Representation O G (L c))
    [∀ c, IsNoetherian (MonoidAlgebra (IsLocalRing.ResidueField O) G)
      (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule]
    [∀ c, IsArtinian (MonoidAlgebra (IsLocalRing.ResidueField O) G)
      (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule]
    (hirr : ∀ c, (Representation.baseChange (FractionRing O) (ρ c)).IsIrreducible)
    (hnoniso : Pairwise fun c d ↦
      IsEmpty ((Representation.baseChange (FractionRing O) (ρ c)).Equiv
        (Representation.baseChange (FractionRing O) (ρ d))))
    (hexh : ∀ (V : Type u) [AddCommGroup V] [Module (FractionRing O) V]
      [FiniteDimensional (FractionRing O) V] (σ : Representation (FractionRing O) G V),
      σ.IsIrreducible → ∃ c, Nonempty (σ.Equiv (Representation.baseChange (FractionRing O) (ρ c)))) :
    cartanMatrix P S hind hPnoniso hPexh hSnoniso hSexh =
      (Matrix.of fun c i => (jordanHolderMultiplicity (MonoidAlgebra (IsLocalRing.ResidueField O) G)
        (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule (S i) : ℤ))ᵀ *
      Matrix.of fun c i => (jordanHolderMultiplicity (MonoidAlgebra (IsLocalRing.ResidueField O) G)
        (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule (S i) : ℤ) :=
  sorry
```

2. In a `Layer 2` section, add `span_decompositionRows_eq_top`, the integral surjectivity of §2.4.
   - Binders: the same as above, without `P`, `hind`, `hPnoniso`, `hPexh`, `hcover`, `hnoniso` and the `IsArtinianRing` binder.
   - Conclusion: `Submodule.span ℤ (Set.range fun c i => (jordanHolderMultiplicity (MonoidAlgebra (IsLocalRing.ResidueField O) G) (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule (S i) : ℤ)) = ⊤`.
3. Name the two theorems in the README.
   - Name the reciprocity theorem in §3.1 (`README.md:559`) and the surjectivity theorem in §2.4 (`README.md:506`).
   - Neither statement assumes `k` algebraically closed, so they match the README's splitting systems.
4. Shorten the docstring's first bullet to the Brauer-character basis alone; that one does need Brauer characters.
5. Update the description's sentence “The module docstring names the headlines that are not statable … Brauer reciprocity, the surjectivity of the decomposition map and the Brauer-character basis”.

**Tested:**
- Both theorems elaborate at the pins (scratch copy, `lake env lean`): only `sorry` warnings.
- `hζ` is needed: for `O = ℤ₂`, `G = C₄` (with `i ∉ ℚ₂`), `D = (1, 1, 2)ᵀ` gives `DᵀD = [6]`, while `C = [4]`.
- With `O = ℤ₂[i]`: `D = (1, 1, 1, 1)ᵀ` and `DᵀD = [4] = C`.
- `S₃` with `O = ℤ₂[ζ₃]`: `D = [[1,0],[1,0],[0,1]]`, so `DᵀD = diag(2, 1) = C`.

## R02 (P3) — §2.2 states the count and the basis below the source's generality

**Location:** `README.md:434–438`: “over an algebraically closed field of characteristic `p`, a complete family … has as many members as `G` has `p`-regular conjugacy classes … The same count holds over every field of characteristic `p` containing a primitive `e'`-th root of unity, by §2.3.” The basis (`:426`) is likewise only over an algebraically closed `k`.

**Claim:** these two classes of fields are the generality of the count and of the basis.

**Witness:** Webb Thm 9.3.6 (`webb` 6167–6169) and Thm 10.2.2 (`webb` 7438–7445) assume only a splitting field. `𝔽₂` splits `S₃` without `ζ₃` (`README.md:488`; `webb` 6063–6064). It has 2 simples and 2 regular classes, which neither README statement covers.

**Repair:** Replace the second bullet of §2.2 with: “Over every splitting field `k` of characteristic `p` for `G` the count holds, and the Brauer characters of the simple `k[G]`-modules, read on `k̄ ⊗_k −`, form the same basis (Webb, Theorems 9.3.6 and 10.2.2, pp. 147 and 176): once `k` splits `G`, scalar extension to `k̄` is a bijection on simple classes (§2.3). In particular this holds over every field containing a primitive `e'`-th root of unity.” Add the Check: “`S₃` over `𝔽₂`, which splits `S₃` without a primitive cube root of unity: simples of dimensions `1` and `2`, against the two `2`-regular classes.”

**Tested:**
- `S₃` over `𝔽₂`: the simples are `𝔽₂` and the 2-dimensional module, whose endomorphism ring is `𝔽₂`; the regular classes are `{1}` and the `3`-cycles; `2 = 2`.
- The Brauer values `(1, 1)` and `(2, −1)` have determinant `−3 ≠ 0`.
- The existing control `C₃` over `𝔽₂` (not a splitting field, `2 ≠ 3`) stays excluded.

## R03 (P3) — Brauer's count has no route and no *Needs*

**Location:** `README.md:431–432`: “*Needs:* for the basis, GL2AutomorphicRepresentationsAndTransfer §R17.5.11, §2.1 and the count below.”

**Claim:** the §2.2 targets carry their inputs.

**Witness:** the only *Needs* line of §2.2 is scoped to the basis. The headline `card_simpleModules_eq_card_pRegularClasses` (`:434–436`) has a locator but no route or inputs. Webb's proof uses Prop 9.3.3 (`webb` 6130–6132) and the `p`-part decomposition (`webb` 6174–6175).

**Repair:** After the count bullet, add: “Route: for a finite-dimensional algebra `A` split over a field of characteristic `p`, the number of simple modules is the codimension of `T(A)`, the set of `a` with `a^{p^n}` in the span of commutators for some `n` (Webb, Proposition 9.3.3, p. 146). The classes of the `p`-regular elements give a basis of `k[G]/T(k[G])`, since `g ≡ pFreePart p g` modulo `T` (Webb, proof of Theorem 9.3.6, p. 147). *Needs:* SemisimpleAlgebras Layer 2; §0.1; Tau Ceti `TauCeti.pPart`, `TauCeti.pFreePart`.”

**Tested:**
- Prop 9.3.3 is at `webb` 6130–6132 (PDF p. 153, printed p. 146). The congruence `(st − s)^{p^n} = 0` is at `webb` 6174–6175 (printed p. 147).
- `S₃` at `p = 2`: `[k[S₃], k[S₃]]` is spanned by the differences of conjugates. `T` has codimension 2, spanned modulo `T` by `1` and `r`, while `t ≡ 1`.

## R04 (P3) — The family index conflicts with the open RepresentationTheory revision, and no order is stated

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:127–134`: “The following ownership boundaries distinguish the modular and ordinary theories … **Ordinary and modular representations have separate owners.**”

**Claim:** the index edit merges independently of other open work. The description names no order.

**Witness:** `git merge-tree` of this head with RepresentationTheory's head `e5e8364` conflicts in this file. `origin/main` merges `e5e8364` cleanly, and #1220 merges with this head cleanly. #1146's side still excludes “Brauer characters, decomposition matrices, blocks with defect” (its `:112–118`).

**Repair:** Add to the description: “The family index conflicts with RepresentationTheory (#1146) in *Scope and boundaries*. This pull request replaces the modular-exclusion bullet, and #1146 rewrites the bullet after it. Whichever merges second rebases and keeps both changes, this pull request's ownership bullet and #1146's *Harmonic decomposition stops at compact groups* bullet, and drops the old *No modular representation theory proper* bullet.”

**Tested:** the two sides of the conflict are this head's `:130–140` and #1146's `:112–125`. Keeping the first bullet of this head and the second of #1146 leaves no conflict marker and no copy of the exclusion.

## R05 (P3) — The family index still names this roadmap the owner of Brauer characters

Re-raised: H01

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim:** this roadmap owns the Brauer character.

**Witness:** this roadmap imports the Brauer character, its pairing and the independence of the simple Brauer characters from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (`README.md:91–100`). That section's *Needs* says “Modular characters and their projective pairing are owned here” (its `README.md:2938`).

**Why the reason fails:** the repair report says the index is outside the files a repair round may edit. It also agrees that the sentence is wrong and “must be edited in this pull request before merge”. The limit decides who makes the edit, not whether the pull request is correct. The brief makes the index this pull request's own file, and this pull request already rewrites the sentence (24 changed lines).

**Repair:** in the index, use the sentence the repair report proposes: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes all three, takes the Brauer character and its projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 and the decomposition map over finite extensions of `ℚ_p` containing the `|G|`-th roots of unity from ArithmeticGaloisDuality §R02.4.4, and owns the Brauer-character basis theorem, the decomposition map of an arbitrary `p`-modular system, decomposition matrices, Brauer reciprocity and blocks with defect.” This can be done in the same edit as the R04 rebase.

**Tested:**
- “All three” are cited: GrothendieckEulerForms (`README.md:70`), ModularInduction (`:72`) and CharacterTheory (`:76`).
- The qualifier holds: ArithmeticGaloisDuality §R02.4.4 assumes the `|G|`-th roots (its `README.md:3635–3636`). It does not apply to `C₂ × C₂` at `3`, where `i ∉ ℚ₃` (`README.md:529–531`).

## Previous findings

- **R01 (r18): not repaired.** The head is unchanged, and the index at `:132–133` still reads “consumes both and owns Brauer characters, decomposition matrices and blocks with defect”. It is carried as R05, re-raised against repair report H01.

## Verified sound

**Head, scope and diff.**
- The worktree is clean at `f491552`, the head the previous review read; `changes.md` shows 0 changed lines.
- `git diff --stat origin/main...HEAD` lists the folder's `README.md` (+1076), `Suggested.lean` (+216) and the family index (24 lines).
- The brief's command for changes outside these prints nothing.

**Gate.**
- Brief's command: `FAIL`. Two hits:
  - `depcheck=1`: “NOT IN ORDER: ModularCharactersAndBlocks”. The default order does not list this roadmap.
  - `outside-folder=1`: the family index.
- With `--order` set to the candidate order and `--build`: `depcheck=0`, `build=0`, and only `outside-folder=1` on the index.
- Every other counter is `0`, and the worker's gate is `OK`.
- Neither hit is a finding. The candidate order lists this roadmap at line 102, right after GL2AutomorphicRepresentationsAndTransfer (line 101), with ArithmeticGaloisDuality at line 62. The brief makes the index this pull request's own.

**Dependency check** (the brief's command), complete output:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

**Elaboration and signatures.**
- The targeted build passes.
- A scratch copy of `Suggested.lean` with `#check @name` for all 15 declarations elaborates.
- Each elaborated type matches its README statement:
  - `IsDefectGroup` and `brauerProjection` carry `[Finite G]` and `[Field k]` explicitly;
  - the `IsAlgClosed k` and `CharP k p` binders sit exactly where §§2.2, 6.1–6.2 and 7.1–7.3 put them;
  - no binder is lost.
- Nothing changed in the file, so no recheck after edits was needed.

**Padding probe.** Each of the 10 theorems with `first | rfl | infer_instance | simp | aesop | decide` fails (errors at probe lines 53, 69, 86, 122, 140, 150, 166, 181, 196 and 214).
- `complete_blockIdempotents_unique` is not implied by the pinned `TauCeti.exists_equiv_linearEquiv_span_singleton` (`RingTheory/Idempotents/Primitive/Decomposition.lean:185`), which gives only isomorphic ideals. The statement here needs commutativity of the centre.
- No declaration restates a definition, mirrors a Check or computes a value.

**Headline inventory** (`README.md:12–20`).
- Stated: the count, the block bijection between `O[G]` and `k[G]`, conjugacy of defect groups, Sylow defect groups of the principal block, the first main theorem, block-section orthogonality, the local third main theorem and the kernel theorem.
- Named as not statable, rightly:
  - the Brauer-character basis: it needs a Brauer character, which needs the root lifting `τ` as data;
  - generalized decomposition numbers and the second main theorem: they need Brauer characters of centralizers;
  - the agreement of `SameBlock` with the blocks of `O[G]`: `TauCeti.Representation.primitiveCentralIdempotent` (`CharacterTable/CentralIdempotent.lean:301`) needs an algebraically closed field.
- Wrongly named: reciprocity and integral surjectivity (R01).

**Library declarations opened at the pins** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`).
- `TauCeti.pPart`/`pFreePart` and their API: `GroupTheory/OrderOfElement/PPart.lean:69, 116, 129, 167, 185, 196, 205, 212, 240, 269`.
- `TauCeti.IsPrimitiveIdempotent`: `RingTheory/Idempotents/Primitive/Basic.lean:89`. Its fields are idempotent, `ne_zero` and non-splitting.
- `exists_completeOrthogonalIdempotents_isPrimitiveIdempotent`: `Decomposition.lean:223`.
- `IsAdicComplete.exists_isIdempotentElem_eq`: `RingTheory/AdicCompletion/Idempotent.lean:133`. It allows a noncommutative `S`, so it applies to `O[G]`.
- `TauCeti.exists_projective_quotient_smul_top_linearEquiv`: `Algebra/Module/Projective/Lift.lean:89`.
- `Ideal.nonempty_linearEquiv_of_quotient_smul_top`: `Projective/Reduction.lean:73`.
- `TauCeti.IsProjectiveCover`: `ProjectiveCover/Basic.lean:106`.
- `TauCeti.exists_isProjectiveCover_of_finite`: `ProjectiveCover/Existence.lean:195`.
- `CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule`: `RingTheory/Idempotents/Simple.lean:93`.
- The Cartan and `K₀` names:
  - `TauCeti.cartanMatrix` and `projectiveSimplePairing(_isPerfPair)`: `GrothendieckGroup/CartanMatrix.lean:77, 115, 138`. The convention `C i j = [P j : S i]` is stated there.
  - `TauCeti.cartanMap`: `ModuleCat/CartanMap/Basic.lean:414`.
  - `TauCeti.finiteModulesExactStructure`: `ModuleCat/CartanMap/Basic.lean:225`.
  - `TauCeti.ExactK0`: `GrothendieckGroup/Exact.lean:179`.
  - `TauCeti.resK0`: `GroupAlgebra/Restriction.lean:70`.
  - `TauCeti.indK0`: `GroupAlgebra/Induction.lean:91`.
  - `TauCeti.reductionK0`: `LatticeDefect/Basic.lean:105`. It takes `ℤ`-forms, as the README says.
- `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary`: `Induction/Brauer/Induction.lean:82`.
- The character-table names in `CharacterTable/`:
  - `TauCeti.sum_characterTable_mul_conj`: `Table.lean:585`. It gives `|G|/|C|` on the diagonal, matching `|C_G(g)|`.
  - `TauCeti.irreducibleCharacters`: `Table.lean:114`.
  - `TauCeti.irreducibleCharacter`: `Table.lean:201`.
  - `Representation.mem_ker_iff_char_eq` (root namespace): `Kernel.lean:115`.
  - `TauCeti.Representation.primitiveCentralIdempotent`: `CentralIdempotent.lean:301`. Its formula `χ(1)|G|⁻¹ ∑ χ(g⁻¹) g` matches §4.1.
  - `TauCeti.Representation.centralCharacter`: `CentralCharacter.lean:89`.
- `TauCeti.Cyclotomic.complexRoot`: `RingTheory/Cyclotomic/Basic.lean:536`.
- `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot` (root namespace): `Induction/Cyclotomic/SplittingField.lean`.
- `TauCeti.pSectionIndicator`: `Induction/PElementary.lean:91`. It is indexed by the `p`-free part, as `README.md:113` says.
- Mathlib: `littleWedderburn` (`RingTheory/LittleWedderburn.lean:169`), `IntermediateField.adjoin.finiteDimensional` (`IntermediateField/Adjoin/Basic.lean:486`), `Ring.jacobson_le_of_eq_bot` (`Jacobson/Radical.lean:167`) and `exists_isIdempotentElem_eq_of_ker_isNilpotent` (`RingTheory/Idempotents.lean:250`).
- No defect group, block idempotent, Brauer character, Brauer pair or `p'`-core exists at either pin (grep by object).

**Cross-roadmap citations resolved (9).**
- GL2AutomorphicRepresentationsAndTransfer §R17.5.11 and §R17.5.12 at its open head (its `README.md:2927`, `:2942`). Every item of the contract at `README.md:213–222` is there, including the pairing from the proof of recognition and “owned here”.
- ArithmeticGaloisDuality §R02.4.4, *Surjectivity of the decomposition map*, at its open head (`:3635–3644`). It uses rational surjectivity only and says integral surjectivity is not needed, as `README.md:88–89` says.
- On main (`5fc1aa8`):
  - SemisimpleAlgebras Layers 0–2;
  - QuiverRepresentations Layer 3, whose §3.3 transposed Cartan matrix matches `README.md:68–69`;
  - GrothendieckEulerForms Layers 2 and 4 (§4.3 Cartan map);
  - ModularInduction Layers 0, 1 and 3, with `modRepK0` and `modRepK0.baseChange` in Layer 1;
  - CharacterTheory §§3.5, 4.3 and 4.5;
  - InductionRestriction Layer 6.

**Ownership.**
- `roadmaps grep` by object (defect group, block idempotent, Brauer pair, Brauer homomorphism, main theorems, decomposition matrix, Brauer character, `p'`-core) over the heads of the index of 2026-11-10T21:37:48Z finds no second owner apart from those below.
- GL2AutomorphicRepresentationsAndTransfer and ArithmeticGaloisDuality are imported, with the kept variants said to differ (`README.md:85–100`).
- LocalFiniteGroupTheory (#1634) also defines `pPrimeCore`. The brief forbids it as a supplier, so §8.2 owns `O_{p'}`.
- `overlaps.md` reports no other pull request changing the folder, no cited id dropped and no id defined only by a revision.
- Notes for the consumer, not changes here:
  - GlaubermanZStar's head `581115c` cites this roadmap as “M1, M2, M4, M5, M7, M8” (its `README.md:49–54`, `:142–155`), labels this README never used (`git log -G` over the folder).
  - It places block-section orthogonality in “M5”; here it is in §7.2.
  - It takes `O(G)` from LocalFiniteGroupTheory.
  - Its six citation groups map onto §§1.1, 2.4, 4.2–4.3, 5.1 with 7.2, 7.2–7.3 and 8.2–8.3, and §8.4 and Downstream consumers list the same 10 section references.

**Seeded sample: 15 targets, every locator read at the text.**
- Printed page = PDF page − 7 for Webb, − 8 for Martínez and − 5 for Craven; Sambale's printed page equals the PDF page.
- §0.1:
  - Webb Lemma 9.3.4, p. 146 (`webb` 6147–6150);
  - Martínez p. 3 (`martinez` 164–167).
- §1.2:
  - Webb Thm 9.4.8, p. 153 (`webb` 6434–6437), for any `p`-modular system;
  - Martínez Thm 1.7 and Lemma 1.8, p. 4 (`martinez` 189–203).
- §1.3: Webb Props 9.4.3 and 9.4.5, pp. 149–151 (`webb` 6276–6280, 6334–6345); the primitivity equivalence is there.
- §2.3:
  - Webb Thm 9.2.7, p. 144 (`webb` 6054–6056), with its remark (6057–6070);
  - Ch. 9 Ex. 4, p. 165 (`webb` 6974–6976);
  - Ex. 8(a), p. 166 (`webb` 7004–7008);
  - the descent was checked step by step: `[k₁ : k₀]² = [k₁ : k₀]` forces `k₁ = k₀`.
- §2.4:
  - Webb Prop 10.3.2, p. 182 (`webb` 7703–7710);
  - Thm 10.2.2, p. 176 (`webb` 7438);
  - Cor 10.2.4, p. 178 (`webb` 7502–7505);
  - Thm 9.4.11, p. 155 (`webb` 6518–6523);
  - Martínez Def 1.6 and Thm 1.7, pp. 3–4.
- §3.1:
  - Martínez Prop 1.12, p. 5 and Cor 1.13, p. 6 (`martinez` 264, 300);
  - Webb Thm 9.5.4, p. 159 (`webb` 6670–6676);
  - Prop 10.2.1, p. 174 (`webb` 7383–7386), for any `p`-modular system;
  - Prop 9.5.1, p. 157 (`webb` 6623);
  - Cor 9.5.6, p. 160 (`webb` 6712);
  - Cor 10.3.3, p. 183 (`webb` 7720).
- §4.1: the native formula, `CentralIdempotent.lean:288–302`.
- §4.3: Sambale Def 1.2, p. 14 (`sambale` 335–337).
- §5.2: Sambale Thm 1.14, p. 16 (`sambale` 465–474); the block form of §7.2 matches it.
- §6.1:
  - Webb Prop 12.4.1, p. 238 (`webb` 10042–10051): p. 238 carries Lemma 11.3.1's transitivity and Mackey formula to `G`-algebras;
  - §12.5, p. 243 (`webb` 10234);
  - Lemma 12.5.3, p. 245 (`webb` 10341–10346);
  - Cor 12.5.4, p. 246 (`webb` 10365–10368);
  - Lemma 11.6.8(2), p. 215 (`webb` 9094–9098);
  - Martínez Thm 4.1, p. 23 (`martinez` 887–894).
- §6.3: Craven Def 2.6, p. 22; Lemma 2.7 and Def 2.8, p. 23; Lemma 2.9 and Def 2.10, p. 24; Thms 2.11–2.12, p. 25 (`craven` 814–898).
- §7.1:
  - Sambale Def 1.10, Prop 1.11 and Thm 1.12, p. 16 (`sambale` 424–444);
  - Martínez p. 25 (`martinez` 979–981);
  - Thm 4.5 and Cor 4.6, p. 26 (`martinez` 1004–1059);
  - Thm 4.10, p. 27 (`martinez` 1085–1088);
  - Webb Thm 12.6.4, p. 250 (`webb` 10524–10527), stated for `k` splitting `G` and its subgroups.
- §7.3:
  - Sambale Thm 1.15, p. 17 (`sambale` 478–480);
  - Martínez Cor 5.9, p. 35 (`martinez` 1370–1371): one direction, the other from central characters.
- §8.2:
  - Martínez Thm 8.5(iii), p. 52 (`martinez` 1928–1934);
  - Def 7.3 and Problem 7.4, p. 44 (`martinez` 1638–1648);
  - Thm 7.7, p. 45 (`martinez` 1710–1715);
  - Sambale Thms 1.23–1.24, p. 18 (`sambale` 542–549).
- §8.4: the list matches Downstream consumers item by item, 10 of 10 section references.
- The other Lean locators were also checked:
  - Webb Thm 9.3.6, p. 147;
  - Cor 12.3.2, p. 235;
  - Thm 12.4.5, p. 241;
  - Cor 12.4.7, p. 242;
  - Thm 12.5.2, p. 244, for any field of characteristic `p`;
  - Cor 12.5.5, p. 246;
  - Thm 9.6.1, p. 161;
  - Sambale Def 1.4, Prop 1.5 and Def 1.6, pp. 14–15;
  - Martínez Thm 1.14, p. 6;
  - Cor 2.4, p. 11;
  - Def 2.1, p. 9;
  - Thms 2.2, 2.11 and 2.12, pp. 10 and 15;
  - Cor 2.9, p. 15;
  - Def 3.2, p. 17;
  - Cor 3.9, p. 21;
  - Thm 4.3, p. 24.

**Adversarial table.** Notation: `r = (123)`, `t = (12)` (in `C₂` its generator), `ζ = ζ₃`, `α² + α + 1 = 0` in `𝔽₄`; in `𝔽₂[S₃]`, `e₀ = 1 + r + r²` and `e₁ = r + r²`.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| H01 | `complete_blockIdempotents_unique` | `𝔽₂[S₃]`; `𝔽₃[C₂]`; `G = 1` | `e₁² = r² + r = e₁`, `e₀e₁ = 2 + 2r + 2r² = 0`; `(−(1+t))² = 2 + 2t = −(1+t)`; `{1}` | Pass | none |
| H02 | `existsUnique_blockIdempotent_map_residue` | `ℤ₂[C₃]`; `ℤ₂[C₂]` | `(2 − r − r²)/3 ↦ r + r²`, `(1+r+r²)/3 ↦ e₀`; `(1 ± t)/2 ∉ ℤ₂[C₂]`, only `1 ↦ 1` | Pass | none |
| H03 | `card_simpleModules_eq_card_pRegularClasses` | `S₃` at 2, 3; `C₃/𝔽̄₂`; control `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `3 = 3`; `2 ≠ 3` | Pass | none |
| H04 | `brauerProjection_mul` | `S₃`, `p = 2`, `P = ⟨t⟩`, `x = y = e₁`; over `ℚ`; `P = C₃`, `x = T` (transposition sum) | `Br(x²) = 0 = 0²`; `Br(x²) = 2 ≠ 0`; `T² = 1 + r + r²` (char 2), `Br(T)² = 0` | Pass; controls fail as Checks say | none |
| H05 | `IsDefectGroup`, `isDefectGroup_conj` | `𝔽₂[S₃]`; `𝔽₂[C₃]` (non-split) | `Br_{⟨t⟩}(e₀) = 1`, 3 conjugate maxima; `Br_{⟨t⟩}(e₁) = 0`, defect `1`; both `𝔽₂[C₃]` blocks defect `1` | Pass | none |
| H06 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` | `𝔽₂[S₃]`; `G = 1` | `aug e₀ = 3 = 1` → Sylow `⟨t⟩` and conjugates; `aug e₁ = 0` excluded; `⊥ = ⊥` | Pass | none |
| H07 | `brauer_first_main` | `S₅`, `p = 3`, `D = ⟨r⟩`, `s = (45)` | `|N_G(D)| = 120/10 = 12`, blocks `(1 ± s)/2` ↔ `B₁ ∋ 1`, `B₂ ∋ sgn`; `Br_D(e_{B₁}) = (1+s)/2` | Pass | none |
| H08 | `sum_sameBlock_mul_conj_eq_zero` | `S₄` at 3, `g = (123)`, `h = (12)`; `S₃` at 2, `g = 1`, `h = t`; control `g = h = 1` | `B₀ = {1, sgn, χ₂}`: `1 − 1 + (−1)·0 = 0`; `χ_{(3,1)}`: `0·1 = 0`; `1 − 1 = 0`; control `2 ≠ 0` | Pass | none |
| H09 | `brauer_third_main_local` | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `P = 1` | `Br_P(e₀)·1 = 1 ≠ 0` ↔ `aug 1 = 1`; `e₀e₁ = 0` ↔ `aug e₁ = 0` | Pass | none |
| H10 | `mem_pPrimeCore_iff_forall_principalBlock` | `S₃` at 2, 3; `A₄` at 3 | `C₃ = C₃`; `1 = 1`; `B₀ = {1, ω, ω²}`, `⋂ ker = V₄ = O_{3'}`, `ψ`: `3(−1/3 − 1) = −4 ∉ M` | Pass | none |
| D01 | `SameBlock` | `S₃`, `M ∋ 2`, `M ∋ 3`; `C₃`; `S₄`, `M ∋ 3` | `−6 ∈ M`, `−3 ∉ M`; `−3, −3 ∈ M`; `(1−ζ)² = −3ζ`; `χ₂` vs `1`: `0, −6, −12, −6 ∈ M` | Pass | none |
| D02 | `pPrimeCore` | `S₃`; `A₄`; wrong model `O_p` | `O_{2'} = C₃`, `O_{3'} = 1`; `O_{3'} = V₄`, `O_{2'} = 1`; `O_p` gives `1`, `C₃` | Pass | none |
| S01 | §0.1 sections | `S₃` at 2 and 3; `C₆` | `3 + 3`, `3 = 2 + 1` classes, `|Cl(t)| = 3 = 3·1`; `4 + 2`; `g³g⁴ = g`, `2·3 = 6` | Pass | none |
| S02 | §1.2 lattices | `C₂`, `p = 2`; `G = 1` | `O[C₂] → k[C₂]` (non-split), `O(1+t) ⊕ O(1−t) → k ⊕ k`, both class `2`; `O`, `m` both class `1` | Pass | none |
| S03 | §1.3 lifting | `ℤ₂[C₃]` | `((1+r+r²)/3)² = (1+r+r²)/3`, reductions `e₀`, `e₁` | Pass | none |
| S04 | §2.3 splitting | `𝔽₄(T)`, `𝔽₂(T)`, `C₃` | `x³ − 1 = (x−1)(x−α)(x−α²)`: `k³`; `x² + x + 1` irreducible over `𝔽₂(T)`: dims `1, 2` | Pass | none |
| S05 | §2.4 decomposition map | `S₃` at 3; `C₂ × C₂` at 3 | `(2, 0) = (1,1) + (1,−1)`; `4 ∤ 3 − 1`, `i ∉ ℚ₃`, `D = I₄` | Pass | none |
| S06 | §3.1 reciprocity | `S₃` at 3 and 2; pairing at 2 | `DᵀD = [[2,1],[1,2]]`, `det 3`; `diag(2,1)`; `(2 + 4)/6 = 1`, `(4 − 4)/6 = 0` | Pass | none |
| S07 | §4.1 idempotents | `C₂/ℚ₂`; `C₃` | `e₊e₋ = (1 − t²)/4 = 0`; coefficient of `r` in `∑ e_j`: `(1/3)∑ζ^{−j} = 0` | Pass | none |
| S08 | §4.3 principal block | `𝔽₂[S₃]`; `𝔽₄[C₃]` | `aug e₀ = 1`, `aug e₁ = 0`; `aug(1 + α²r + αr²) = 1 + α² + α = 0` | Pass | none |
| S09 | §5.2 orthogonality | `S₃` at 3; `C₂` at 2; `S₃` at 2 | `det Q = −3`, `|det Q|² = 9 = 3·3`; `Q*Q = diag(2,2)`; `diag(2,1,2)` | Pass | none |
| S10 | §6.1 traces | `S₃`, `P = ⟨t⟩` | `Tr_1^P(r) = r + r²`; `Tr_1^P(1) = 1 + 1 = 0` | Pass | none |
| S11 | §6.3 Brauer pairs | `S₃`, `p = 2`, `Q = ⟨t⟩` | `Br_Q(e₀)·1 = 1` (pair for `B₀`); `Br_Q(e₁) = 0` (not) | Pass | none |
| S12 | §7.1 product criterion, `H = G` | `S₅` at 3, degree-4 character of `B₂` (value 2 at `s`) | eigenvalues of `s`: `1, 1, 1, −1`, so `(1+s)/2` and `(1−s)/2` both act nonzero | Pass | none |
| S13 | §7.3 third main theorem | `A₄`, `p = 2`, `P = V₄` | `N(V₄) = A₄`, `C(V₄) = V₄`, one block ↔ itself | Pass | none |
| S14 | §8.2 covering | `S₃`, `N = C₃`, `k ⊇ 𝔽₄` | `e_α + e_{α²} = 2 + (α² + α)(r + r²) = r + r²` | Pass | none |
| C01 | Cartan orientation | path algebra of `A₂` | native `[[1,0],[1,1]]` vs Quiver `[[1,1],[0,1]]` | Pass | none |
| C02 | Brauer character vs trace | trivial `𝔽₂[C₃]`-module `𝔽₂²` | trace `0`, Brauer value `2` | Pass | none |
| F01 | R01 reciprocity statement | `S₃`, `O = ℤ₂[ζ₃]`; `C₄`, `O = ℤ₂[i]`; control `C₄`, `O = ℤ₂` | `diag(2,1) = diag(2,1)`; `4 = 4`; `6 ≠ 4` without `hζ` | Statable; `hζ` needed | add (R01) |
| F02 | R02 count over a splitting field | `S₃/𝔽₂`; control `C₃/𝔽₂` | `2 = 2`, `det[[1,1],[2,−1]] = −3`; `2 ≠ 3` | Holds outside README's hypotheses | widen (R02) |
| F03 | R04 index merge | this head vs `e5e8364`; main vs `e5e8364`; this head vs #1220 | conflict; clean; clean | Conflict | state order (R04) |
| F04 | R05 index sentence | index `:132–133` vs folder `:91–100` | “owns Brauer characters” vs “imported from §R17.5.11” | Mismatch | re-raised (R05) |

## Not verifiable

- **Navarro (`navarro`), Theorem 6.10:**
  - the kernel theorem, `README.md:1003`, `Suggested.lean:209`;
  - settled as uncertified and cited by locator only. Nothing was fetched.
  - The statement was checked by computation instead (rows H10, D02).
- **Serre (`serre`):**
  - settled as uncertified;
  - listed in References (`README.md:1069`) but cited at no claim, so nothing depends on it.
- **Ownership against open pull requests** rests on `roadmaps grep` and `overlaps.md` over the heads in the index of 2026-11-10T21:37:48Z. Pull requests that index does not carry were not searched.

## Source issues

- **Misprint** in webb at §9.4, printed p. 148 (`webb` 6229–6231): the source says the residue field then contains a primitive `m`-th root of unity, `m` the exponent of `G`; it should be the `p′`-part of `m`; affects nothing.
- **Misprint** in webb at the remark after Theorem 9.2.7, printed p. 144 (`webb` 6057–6059): the source says `𝔽_p(ζ)` with `ζ` a primitive `m`-th root splits `G`; no such root exists when `p` divides `m`, so it should be the `p′`-part; affects nothing.
- **Misprint** in webb at Example 12.5.6, printed p. 246 (`webb` 10391–10392): the source says `e1` has defect group `1` right after giving it Sylow defect; it should be `e2`, the defect-zero block; affects nothing.
- **Misprint** in martinez at Theorem 4.10, Claim 2, printed p. 28 (`martinez` 1105–1106): the source says the defect groups of `b` lie in those of `b`; it should be those of `b^G`; affects the proof.
- **Misprint** in martinez at Theorem 5.8, printed p. 34 (`martinez` 1356): the source writes `e^G` in the conclusion; it should be `c^G`; affects a stated result.
