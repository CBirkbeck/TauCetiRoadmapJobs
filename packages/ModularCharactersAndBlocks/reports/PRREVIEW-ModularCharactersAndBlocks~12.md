# Review of ModularCharactersAndBlocks (pull request #1775 at 03f9b14)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

🤖 Full AI review. The head is the one the previous review read; its one finding (the description's `depends-on` block) is repaired. The gate passes, the dependency check is clean and the file elaborates. Reading every passage again found two statements that are false as written (R01, R02) and three P3 items (R03–R05). `Suggested.lean` needs no change.

## R01 (P2) — §7.1 extends the product rule to every `H ≥ N_G(D)`, where it is not a function

**Location:** `README.md:759–764`: “the rule `b ↦ B` with `Br_D(e_B) e_b ≠ 0` is a bijection from the blocks of `k[N_G(D)]` … For `N_G(D) ≤ H ≤ G` the same holds with `H` in place of `N_G(D)`”.

**Claim:** for every `H` between `N_G(D)` and `G`, the rule “`Br_D(e_B) e_b ≠ 0`” is a bijection between the blocks of `k[H]` and of `k[G]` with defect group `D`.

**Witness:** `G = H = S₅`, `p = 3`, `D = ⟨(123)⟩`, `s = (45)`. `N_G(D) = S₃ × ⟨s⟩` has the blocks `(1 ± s)/2`; `Br_D(e_{B₁}) = (1 + s)/2`, `Br_D(e_{B₂}) = (1 − s)/2`. On the degree-4 character of `B₂` (`χ(s) = 2`) `s` has eigenvalues `1, 1, 1, −1`, so `(1 + s)/2 · e_{B₂} ≠ 0` and `(1 − s)/2 · e_{B₂} ≠ 0`: the rule sends `B₂` to both blocks. (The blocks: `10 χ(s)/χ(1) ≡ 1` for `{1, χ₄', χ₅'}`, `≡ 2` for `{sgn, χ₄, χ₅}`, `0` for `χ₆`, modulo 3.) Sambale, Theorem 1.12 (`sambale` line 442) states the bijection for Brauer correspondence `b ↦ b^G`, not for this product.

**Repair:** replace the last sentence of the bullet by: “For `N_G(D) ≤ H ≤ G`, block induction `b ↦ b^G` (defined above by central characters) is a bijection from the blocks of `k[H]` with defect group `D` to the blocks of `k[G]` with defect group `D`, by applying the theorem to `H` and to `G` and identifying `N_H(D) = N_G(D)` (Sambale, Theorem 1.12, p. 16). The product criterion `Br_D(e_B) e_b ≠ 0` describes `b^G = B` only for `D C_G(D) ≤ H ≤ N_G(D)`.” Add the instance above as a Check of §7.1. Tested on it: `b ↦ b^G` for `H = G = S₅` is the identity on `{B₁, B₂}`, a bijection. The Lean statement `brauer_first_main` is for `N_G(D)` only and is correct on this instance (row A28).

## R02 (P2) — §1.1: “the roots of unity of `F` map onto those of `K`” is false

**Location:** `README.md:290`: “The canonical map `F → K` is injective and the roots of unity of `F` map onto those of `K`.”

**Claim:** every root of unity of the completion `K = F_v` comes from `F = ℚ(ζ_e)`.

**Witness:** `G = 1` (or `C₂`), `p = 5`: `e ∈ {1, 2}`, `F = ℚ`, `K = ℚ₅`. The roots of unity of `ℚ` are `±1`; `ℚ₅` contains the four roots of `X⁴ − 1` (`2² = 4 ≡ −1 mod 5`, Hensel). Four is not two.

**Repair:** “The canonical map `F → K` is injective and restricts to a bijection from the `e`-th roots of unity of `F` onto the `e`-th roots of unity of `K`.” This is what §2.1 uses (the identification `τ` on `μ_{e'}`). Tested on the witness: `μ₁(ℚ) = {1} → μ₁(ℚ₅) = {1}` and `μ₂(ℚ) = {±1} → μ₂(ℚ₅) = {±1}`; in general `X^e − 1` has at most `e` roots in `K` and `F` already supplies `e`.

## R03 (P3) — §1.2 Check: `V/mV` is the zero space

**Location:** `README.md:314–315`: “the lattices `O` and `mO` both reduce to the class `1`, although the reductions are different submodules of `V/mV`.”

**Claim:** the two reductions are submodules of `V/mV`.

**Witness:** `V = K` is a `K`-vector space, so `mV = V` and `V/mV = 0`. The reductions are `O/m` and `m/m²`, subquotients of `V`.

**Repair:** “… both reduce to the class `1`, although the reductions `O/m` and `m/m²` are different subquotients of `V`.”

## R04 (P3) — the block form of §5.2 needs §7.2, a later layer

**Location:** `README.md:617–618` (“the block form uses the second main theorem, §7.2”), `:621–622`, `:624–627` (block-section orthogonality “from the block form above”), `:649` (“§7.2 for the block form”), against `:809` (Layer 7 depends on “Layers 5–6”).

**Claim:** the layers are in build order.

**Witness:** Layer 5 lists §7.2 as a dependency and Layer 7 lists Layer 5: at layer level 5 → 7 → 5. The target-level order is acyclic (§5.1 → §7.2 → block form), but two statements of Layer 5 cannot be built before Layer 7.

**Repair:** move the block form of the orthogonality relations and the block-section orthogonality bullet (with its Check, `README.md:637–640`) into §7.2 as consequences of the second main theorem; keep in §5.2 the sum over all of `Irr(G)` and the matrix form; change Layer 5's Dependencies to “Layers 0, 2–4” and §8.4's reference from §5.2 to §7.2. No section number changes.

## R05 (P3) — the family index says this roadmap owns Brauer characters; the roadmap imports them

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md`, Scope and boundaries: “[ModularCharactersAndBlocks] consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim:** the Brauer character is owned here.

**Witness:** `README.md:80–85` and `:361–364` take the Brauer character from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, whose `*Needs:*` line at its open head says “Modular characters and their projective pairing are owned here”. Two texts name two owners.

**Repair:** in the index sentence write “… consumes both, takes the Brauer character from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and owns its basis theorem, decomposition matrices and blocks with defect.”

## Previous findings

- R01 of the previous review (the description's `depends-on` block listed `#1634 LocalFiniteGroupTheory`) — repaired: the block now reads “**Depends on** (suppliers still open; they merge first): - [ ] #931 GL2AutomorphicRepresentationsAndTransfer” and nothing else. The folder is byte-identical to the head that review read (0 changed lines).

## Verified sound

**Head and gate.** Worktree at `03f9b142c8dcf3878b0782c4166e04b9b4458f93`, clean. The pull request changes three files: the folder's `README.md` and `Suggested.lean`, and the family index; nothing outside. Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. The worker's gate: every counter `0`, `build=0`, `OK`.

**Dependency check** (the brief's command), complete output:

```text
depcheck: 228 roadmaps, 2122 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. This roadmap is line 101 of the merge order, after GL2AutomorphicRepresentationsAndTransfer (line 100).

**Elaboration.** `lake env lean` on `Suggested.lean`: exit `0`, eight `declaration uses sorry` warnings (lines 42, 56, 72, 99, 117, 127, 139, 153), nothing else. One `import Mathlib`, one `TauCeti.*` import that exists at the pin, no `set_option`, no sorry'd data; the three definitions have real bodies.

**Signatures.** The eleven elaborated types (the worker's `#check @name` output for this unchanged file) were compared with the README statements one by one: every binder the README names is present (`[Finite G]` on all; `[Fact p.Prime] [CharP k p]` on the six characteristic-`p` statements; `[IsAlgClosed k]` on the count and the first and third main theorems; `[IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete …]` on the lifting theorem). Nothing changed.

**Padding probe.** On a scratch copy each `sorry` was replaced by `first | rfl | simp | infer_instance | decide` (and, for the uniqueness theorem, `exact` with the native `CompleteOrthogonalIdempotents.exists_equiv_linearEquiv_span_singleton`): all eight fail. The native uniqueness theorem (`TauCeti/RingTheory/Idempotents/Primitive/Decomposition.lean:185`) concludes an isomorphism of left ideals, not equality of idempotents, so `complete_blockIdempotents_unique` is not a restatement.

**Headlines.** From the Summary: the count (stated), Brauer reciprocity (docstring: not statable), the bijection of blocks of `O[G]` and `k[G]` (stated), orthogonality of generalized decomposition numbers (docstring), conjugacy of defect groups (stated), Sylow defect groups of the principal block (stated), the first main theorem (stated), the second (docstring), the local third (stated), the kernel theorem (docstring). The docstring's reasons hold at the pins: `grep -rli 'brauerChar\|DefectGroup\|decompositionMa\|pModular\|BlockIdempotent'` over the pinned Mathlib and Tau Ceti finds no Brauer character, modular system, decomposition map, block or defect group; `TauCeti.reductionK0` takes a `Representation ℤ G W` (`TauCeti/RepresentationTheory/GrothendieckGroup/GroupAlgebra/LatticeDefect/Basic.lean:105`).

**Sources: the seeded sample, read at the locator** (Martínez printed page = extraction page − 8; Webb printed page = extraction page − 7; Sambale printed = extraction).
- §0.2: Webb, Propositions 12.1.1–12.1.2 (`webb` lines 9585, 9596, p. 227) and Corollary 12.1.3 (line 9608, p. 228); Martínez, Theorem 2.11 (`martinez` line 648, p. 15). Supported.
- §1.3: Webb, Proposition 9.4.3 (line 6276, p. 149: lifting and primitivity) and 9.4.5 (line 6334, p. 151). Supported; centrality and uniqueness are stated as added here.
- §2.1: Webb, Proposition 10.1.3 (line 7179, pp. 170–171: tensor, dual); Martínez, Lemmas 1.1–1.2 (lines 130, 150, pp. 2–3: restriction, dual) and the induction formula (line 1386, p. 37). Supported.
- §2.2: Webb, Theorem 10.2.2 (line 7438, p. 176, splitting `k`) and Theorem 9.3.6 (line 6167, p. 147); Martínez, Proposition 1.5 and Theorem 1.9 (lines 174, 219, pp. 3, 5). Supported.
- §2.3: Webb, Theorem 9.2.7 (line 6054, p. 144, a primitive `m`-th root with `m` the exponent; the README says how its statement differs), Exercises 4 and 8 of Chapter 9 (lines 6974, 7004, pp. 165–166). Supported.
- §2.4: Webb, Proposition 10.3.2 (line 7703, p. 182: `d` surjective), Corollary 10.2.4 (line 7502, p. 178), Theorem 9.4.11 (line 6518, p. 155: identity matrix in corresponding order); Martínez, Definition 1.6 and Theorem 1.7 (lines 178, 189, pp. 3–4). Supported.
- §3.1: Martínez, Proposition 1.12 and Corollary 1.13 (lines 264, 300, pp. 5–6); Webb, Proposition 9.5.1 (line 6623, p. 157), Theorem 9.5.4 (line 6670, p. 159, `R` complete), Corollary 9.5.6 (line 6712, p. 160), Proposition 10.2.1 (line 7383, p. 174), Corollary 10.3.3 (line 7720, p. 183). Supported.
- §4.3: Sambale, Definition 1.2 (`sambale` line 335, p. 14). Supported.
- §5.1: Sambale, Definition 1.9 (line 399, p. 15), with the coefficients in `ℤ[ζ_{|u|}]`. Supported.
- §5.2: Sambale, Theorem 1.14 (line 465, p. 16); Martínez, Corollary 2.4 (line 451, p. 11, `g` regular and `x` singular, as the README says). Supported.
- §7.2: Sambale, Theorem 1.13 and Proposition 1.11 (lines 445, 438, p. 16). Supported.
- §7.3: Sambale, Theorem 1.15 (line 478, p. 17); Martínez, Corollary 5.9 (line 1370, p. 35, one direction). Supported.
- §8.1: Martínez, Theorem 1.14 (line 316, p. 6), Corollary 8.2, Proposition 8.4, Theorem 8.5 (lines 1895, 1907, 1928, pp. 51–52); Sambale, Theorem 1.23 (line 542, p. 18). Supported.
- §8.3: Navarro, Theorem 6.10: under Not verifiable; the route is checked in row A32.
- §8.4: no locator; it names §§0.1, 5.2, 4.3, 8.3, 7.3, which exist.
- Also read for R01: Sambale, Theorem 1.12 (line 442, p. 16); Webb, Theorem 12.6.4 (line 10524, p. 250, `k` splitting for `G` and its subgroups); Martínez, Theorem 4.5, Corollary 4.6, Theorem 4.10 (lines 1004, 1055, 1085, pp. 26–27).

**Library declarations opened at the pins (41).** Tau Ceti: `pFreePart` (`TauCeti/GroupTheory/OrderOfElement/PPart.lean:69`), `orderOf_pFreePart` (`:116`), `eq_pFreePart` (`:129`), `pPart` (`:167`), `commute_pFreePart_pPart` (`:185`), `pPart_mul_pFreePart` (`:196`), `pFreePart_conj` (`:205`), `pPart_conj` (`:212`), `orderOf_pPart` (`:240`), `eq_pPart` (`:269`); `IsPrimitiveIdempotent` (`TauCeti/RingTheory/Idempotents/Primitive/Basic.lean:89`, a structure with a nonzero field); `exists_completeOrthogonalIdempotents_isPrimitiveIdempotent` (`…/Primitive/Decomposition.lean:223`, `[IsArtinianRing A]`); `IsAdicComplete.exists_isIdempotentElem_eq` (`TauCeti/RingTheory/AdicCompletion/Idempotent.lean:133`); `exists_projective_quotient_smul_top_linearEquiv` (`TauCeti/Algebra/Module/Projective/Lift.lean:89`); `Ideal.nonempty_linearEquiv_of_quotient_smul_top` (`TauCeti/Algebra/Module/Projective/Reduction.lean:73`); `IsProjectiveCover` (`TauCeti/Algebra/Module/ProjectiveCover/Basic.lean:106`); `exists_isProjectiveCover_of_finite` (`…/ProjectiveCover/Existence.lean:195`); `CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule` (`TauCeti/RingTheory/Idempotents/Simple.lean:93`); `cartanMap` (`TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:414`), `finiteModulesExactStructure` (`:225`); `ExactK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:179`); `projectiveSimplePairing` (`TauCeti/RepresentationTheory/GrothendieckGroup/CartanMatrix.lean:77`), `projectiveSimplePairing_isPerfPair` (`:115`), `cartanMatrix` (`:138`), `cartanMatrix_apply` (`:148`); `resK0` (`…/GroupAlgebra/Restriction.lean:70`), `indK0` (`…/GroupAlgebra/Induction.lean:91`), `reductionK0` (`…/LatticeDefect/Basic.lean:105`); `ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary` (`TauCeti/RepresentationTheory/Induction/Brauer/Induction.lean:82`, `[CharZero k] [IsAlgClosed k]`); `sum_characterTable_mul_conj` (`TauCeti/RepresentationTheory/CharacterTable/Table.lean:585`); `pSectionIndicator` (`TauCeti/RepresentationTheory/Induction/PElementary.lean:91`); `Representation.primitiveCentralIdempotent` (`…/CharacterTable/CentralIdempotent.lean:301`, `[IsAlgClosed k]`); `Representation.centralCharacter` (`…/CharacterTable/CentralCharacter.lean:89`); `Cyclotomic.complexRoot` (`TauCeti/RingTheory/Cyclotomic/Basic.lean:536`, `exp(2πi/e)`, so `complexRoot e' = (complexRoot e)^(e/e')`); `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot` (`TauCeti/RepresentationTheory/Induction/Cyclotomic/SplittingField.lean:107`). Mathlib: `CompleteOrthogonalIdempotents` (`Mathlib/RingTheory/Idempotents.lean:130`), `exists_isIdempotentElem_eq_of_ker_isNilpotent` (`:250`), `littleWedderburn` (`Mathlib/RingTheory/LittleWedderburn.lean`), `IntermediateField.adjoin.finiteDimensional` (`Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:486`, for an integral element), `Ring.jacobson_le_of_eq_bot` (`Mathlib/RingTheory/Jacobson/Radical.lean:167`, two-sided ideal), `MonoidAlgebra.mapRingHom` (`Mathlib/Algebra/MonoidAlgebra/MapDomain.lean:303`), `MonoidAlgebra.mapDomain` (`:34`), `MonoidAlgebra.lift` (`Mathlib/Algebra/MonoidAlgebra/Basic.lean:231`).

**Cross-roadmap citations resolved (10).** On main: SemisimpleAlgebras Layers 0, 1, 2 (`README.md:169, 186, 212`); QuiverRepresentations Layer 3 (`:505`) with its row convention `Cᵢⱼ = [Pᵢ:Sⱼ]` (`:106–107`), the transpose of the native one as the Scope says; GrothendieckEulerForms Layers 2 and 4 (`:352, :602`); ModularInduction Layers 0, 1, 3 (`:174, :202, :257`) with `modRepK0.baseChange` in Layer 1 (`:228`); CharacterTheory §§3.5, 4.3, 4.5 (`:497, :741, :817`); InductionRestriction Layer 6 (`:661`). At its open head: GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (hypotheses: `k` algebraically closed, `m` prime to `p` divisible by every `p`-regular order, a fixed `τ`; its API is the one the contract lists) and §R17.5.12 (finite solvable `Γ`). The worker's resolution lists no citation and no Lean name found nowhere.

**Ownership and overlaps.** `roadmaps grep` over main and the 437 indexed open heads for “defect group”, `IsBlockIdempotent`, `brauerProjection`, “Brauer homomorphism”, “generalized decomposition”, “Brauer pair”, “p-modular system”: no other roadmap states these objects (the other hits are unrelated uses or GlaubermanZStar, a consumer). `Suggested.lean` shares no fully qualified name with a readable roadmap. The overlap report lists no pull request changing this roadmap and no dropped or revision-only id. LocalFiniteGroupTheory is not named in the folder or the index. The `p'`-core stays owned by §8.2, as recorded in the previous review.

**Adversarial computations (this round).** `r = (123)`, `τ = (12)`, `s = (45)`, `t` generates `C₂`, `α² + α + 1 = 0` in `𝔽₄`, `ζ = ζ₃`.

| Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| A01 §0.1 class-size formula | `S₃`, `p = 2`, `g = τ`; `g = r` | `x = τ`, `s = 1`: `3 = [S₃ : C₂] · 1`; `x = 1`, `s = r`: `2 = 1 · 2` | Pass | none |
| A02 §0.2 blocks of `𝔽₃[C₂]`, `𝔽₂[C₂]` | `e_± = −(1 ± t)` | `(1+t)/2 = 2(1+t) = −(1+t)`; `(2+2t)² = 8+8t = 2+2t`; `e₊e₋ = (1−t²) = 0`; `(1+t)² = 0` in `𝔽₂[C₂]` | Pass | none |
| A03 `complete_blockIdempotents_unique` | `𝔽₃[C₂]`, families `(e₊, e₋)`, `(e₋, e₊)`; `G = 1` | the swap; singletons | Pass | none |
| A04 §1.1 residue field | `e = 3, p = 2`; `e = 3, p = 3`; `e = 4, p = 3` | `𝔽₄ = 𝔽₂(ζ₃)`; `𝔽₃`, `e' = 1`; `𝔽₉ = 𝔽₃(i)` | Pass | none |
| A05 §1.1 API “roots of unity of `F` map onto those of `K`” | `e = 1`, `p = 5`; `e = 3`, `p = 2` | `μ(ℚ) = {±1}`, `μ(ℚ₅) = μ₄`: `2 ≠ 4`; `μ(ℚ(ζ₃)) = μ₆ = μ(ℚ₂(ζ₃))` | **Fail** | R02 |
| A06 §1.2 Check `G = 1`, `V = K` | lattices `O`, `mO` | `V/mV = K/K = 0`; reductions `O/m`, `m/m²`, each of class `1` | **Fail** (wording) | R03 |
| A07 §1.3 lifts | `ℤ₂[C₃]`; `ℤ₂[C₂]` | `1 − (1+r+r²)/3 = (2−r−r²)/3 ↦ r + r²`; `(1 ± t)/2 ∉ ℤ₂[C₂]` | Pass | none |
| A08 `existsUnique_blockIdempotent_map_residue` | `ℤ₂[C₃]`; bijection claim of the docstring | unique lifts as A07; a block `b` of `O[G]` with `b̄ = c₁ + … + c_n`: `b·b_i` reduces to `c_i ≠ 0`, so `b = b_i` for all `i`, `n = 1` | Pass | none |
| A09 §2.1 induced and dual | `Ind_1^{S₃}(1)`, `p = 2`; `C₃/𝔽₄`, `r ↦ α` | `(6, 0) = 2·(1, 1) + 2·(2, −1)`; dual `r ↦ α² ↦ ζ²` | Pass | none |
| A10 §2.2 and `card_simpleModules_eq_card_pRegularClasses` | `S₃`, `p = 3`; `p = 2`; `C_p`; `C₃/𝔽₂` | `2 = 2`, `det [[1,1],[1,−1]] = −2`; `2 = 2`; `1 = 1`; `2 ≠ 3` without splitting | Pass | none |
| A11 §2.3 | `C₃`: `𝔽₄`, `𝔽₂`, `𝔽₄(T)`, `𝔽₂(T)`; `C₅`, `p = 5` | three simples; dimensions `1, 2`; `k³`; `k × k[x]/(x²+x+1)`; `e' = 1`, one simple | Pass | none |
| A12 §2.3 endomorphism count | `T` simple over `k₀`, `n = [k₁ : k₀]` | `dim End(k̄₀ ⊗ T) = n` and `= n²` when the conjugates are isomorphic: `n = 1` | Pass | none |
| A13 §2.4 `D` | `S₃`, `p = 3`; `p = 2`; `C₂` | `(2, 0) = (1,1) + (1,−1)`; `std|_{reg} = (2, −1)` simple; `[[1],[1]]` | Pass | none |
| A14 §2.4 surjectivity route | projection formula | `y = y·d(1) = ∑ n_E Ind_E(d_E(ψ_E)·Res y)`, each term in `im(d ∘ Ind_E)` | Pass | none |
| A15 §3.1 reciprocity | `S₃`, `p = 3`; `p = 2`; `C_p` | `DᵀD = [[2,1],[1,2]]`, `det 3`; `diag(2,1)`; `[p]` | Pass | none |
| A16 §3.1 Hom formula | `S₃`, `p = 2`, `P₁`, `U = k`; `U = std` | `(1/6)(2 + 2·2) = 1`; `(1/6)(4 − 4) = 0` | Pass | none |
| A17 §4.2 central characters | `S₃`, `p = 2`; `S₅`, `p = 3`, transpositions | `3, −3, 0`; `10, −10, 5, −5, 2, −2, 0 ≡ 1, 2, 2, 1, 2, 1, 0` | Pass | none |
| A18 §4.3 augmentation | `𝔽₂[S₃]`; `G = 1` | `aug(1+r+r²) = 1`, `aug(r+r²) = 0`; `1` | Pass | none |
| A19 §5.1 | `C₃`, `p = 3`, `u = r`; `S₃`, `p = 3`; `S₅`, `p = 3`, `u = r`, `χ₄` | `ζ^j`; `(1, 1, −1)`; `χ₄(r) = 1`, `χ₄(rs) = −1`: `d₊ = 0`, `d₋ = 1` | Pass | none |
| A20 §5.2 | `S₃`, `p = 3`; `C₃`, `u = v = r`; `S₅`, `p = 3`, `B₂`, `φ₋` | column products `2, 1, 2, 0, 0, 3`, `det Q = −3`, `9 = 3·3`; `3` with conjugation, `0` without; `1 + 1 + (−1)² = 3 = c^r` | Pass | none |
| A21 §5.2 block-section orthogonality | `S₃`, `p = 2`, `B₀`, `(1, τ)`; `g = h = 1` | `1 − 1 = 0`; `2 + 4 = 6` | Pass | R04 (placement) |
| A22 `brauerProjection_mul` | `S₃`, `P = ⟨τ⟩`, `x = r + r²`; `x = r, y = r²`; over `ℚ`; `P = C₃`, char 2 | `0 = 0`; `1 ≠ 0`; `2 ≠ 0`; `1 + r + r² ≠ 0` | Pass, each hypothesis needed | none |
| A23 §6.1 Rosenberg | primitive `e`, `eAe` local | `e ∈ I₁ + I₂` gives `e = e a₁ e + e a₂ e`, one summand a unit of `eAe` | Pass | none |
| A24 `IsDefectGroup` | `S₃`, `p = 2`, both blocks; `C₃`, `p = 2`; `G = 1` | `Br_{⟨τ⟩}(1+r+r²) = 1`, three Sylow subgroups; `Br_{⟨τ⟩}(r+r²) = 0`, group `1`; `C₃` excluded by `IsPGroup`; `1` | Pass | none |
| A25 `isDefectGroup_conj`, any field | route | `e Z(k[G])` is local for a primitive `e` of the commutative centre, so Rosenberg applies without splitting | Pass | none |
| A26 `isDefectGroup_iff_sylow_of_augmentation_ne_zero` | `S₃`, `p = 2`; `S₅`, `p = 3`, `N_G(D)` | Sylow for `e₀`; `aug((1+s)/2) = 1`, `aug((1−s)/2) = 0` | Pass | none |
| A27 §7.1, `H` in place of `N_G(D)` | `G = H = S₅`, `p = 3`, `D = ⟨r⟩` | `(1+s)/2 · e_{B₂} ≠ 0` and `(1−s)/2 · e_{B₂} ≠ 0` (eigenvalues `1,1,1,−1` on `χ₄`) | **Fail** | R01 |
| A28 `brauer_first_main` | `S₅`, `p = 3`, `D = ⟨r⟩`; `S₃`, `p = 2`; `D = 1` | in `k[N]`: `(1+s)/2·(1+s)/2 ≠ 0`, `(1−s)/2·(1+s)/2 = 0`, so `f` is the correspondence; `1·1 ≠ 0`; identity | Pass | none |
| A29 §7.2 | `S₃`, `p = 2`, `u = τ`; `S₅`, `p = 3`, `u = r` | `(1, −1, 0)`; `χ₄ ∈ B₂` has `d₋ ≠ 0` only, and `(1−s)/2 = Br_D(e_{B₂})`; `χ₆`: `0` | Pass | none |
| A30 §7.3 and `brauer_third_main_local` | `S₅`, `p = 3`, `P = D`, `H = N_G(D)`; `S₃`, `p = 2`; `P = 1` | `Br_P(e₀) = (1+s)/2`: product with `(1+s)/2` nonzero (principal), with `(1−s)/2` zero (`aug = 0`); `1`; `b = e₀` | Pass | none |
| A31 §8.1 | `S₃`, `p = 3`, `N = C₃` | `1 ↦ e₊ + e₋` in `𝔽₃[C₂]` | Pass | none |
| A32 §8.3 | `S₃`, `p = 2, 3`; `C_p`; route | `C₃ = O_{2'}`; `1`; `1`; `Φ₁(x) = Φ₁(1) ≠ 0` on `K` forces `K` `p`-regular | Pass | none |
| A33 §8.4 | the five exported sections | §§0.1, 5.2, 4.3, 8.3, 7.3 exist | Pass | R04 moves one reference |

## Not verifiable

- **Navarro, Theorem 6.10 (`navarro`) and Serre, Part III (`serre`)**: settled as uncertified; cited by locator only. The §8.3 route is checked in row A32 without the text.
- **Ownership against open pull requests** rests on `roadmaps grep` over the heads the index of 2026-11-10 carries; pull requests it does not carry were not searched.

## Source issues

- none
