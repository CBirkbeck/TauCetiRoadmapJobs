# Review of ClassicalGroups (pull request #1192 at a75ea79)
Folder: `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/`

**Verdict:** needs changes

Four findings: one P2 and three P3. This is a full review of the repaired head: the folder changed by 328 lines since `4dcaac5` (the LieHighestWeight and RootSystems layer citations replaced by named native Tau Ceti declarations, the symplectic contraction, inverse-form wedge map and their commutator stated in §3A.3, the Sp Borel subgroup and Cartan-type comparisons added to §3A.1, the ClassicalGroupsPartII ownership restated, one Lean theorem renamed). Every check was redone on this head: the gate and dependency check, elaboration of `Suggested.lean` with a `#check` of all 22 declarations, the one-tactic probe of all 11 admitted theorems, every seeded locator reread in the cached texts, every cited library declaration reopened at the pins, every cross-roadmap citation resolved on main or at the open head, and every value in the adversarial table recomputed by exact arithmetic. Files are named by basename inside the folder; library paths are those of the pull request's manifest (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`).

## R01 (P2) — The new Tau Ceti supplier citations are read at a revision that is not the pull request's pin, and one of them does not exist at the pin

**Location:** `README.md:239–283` (From Tau Ceti, root/Weyl and semisimple Lie declarations), in particular `README.md:258–260`: "the type A Weyl group of the numbered model, `TauCeti.DynkinType.typeAWeylGroupEquiv` (`TauCeti/LinearAlgebra/RootSystem/Weyl/TypeA/Basic.lean:124`)".

**Claim:** Twenty-one named declarations are native in Tau Ceti at the stated files and lines and are consumed directly.

**Witness:** The pull request's `lake-manifest.json` pins Tau Ceti `a91d3aaf`. At that revision the directory `TauCeti/LinearAlgebra/RootSystem/Weyl/TypeA/` does not exist and `typeAWeylGroupEquiv` occurs nowhere in the library. The other twenty exist there but at other lines (`schurPolyBasis` at `Schur/Basis.lean:301`, `posRoots` at `Positive.lean:114`, `dominantChamber` at `Chamber.lean:137`, `longestElement` at `LongestElement.lean:194`, `HasCartanType` at `DynkinType.lean:416`, `existsUnique_dynkinType` at `Classification.lean:127`, `exists_int_apply_coroot` at `Integrality.lean:198`, `smoothCommHopfAlgProperty_of_charZero` at `CharZero.lean:148`, `exists_subcomodule_iff_forall_differential_mem` at `LieStable.lean:80`, and so on). All twenty-one match exactly, file and line, at Tau Ceti `2fd255d9`, the revision main's manifest pins: the citations were written against main's library, while the branch (merge base `528178d1`) still carries the older manifest.

**Repair:** Rebase the branch onto main so that its manifest pins Tau Ceti `2fd255d9`; the twenty-one citations are then exact and no text changes. If the pin stays at `a91d3aaf`, delete the `typeAWeylGroupEquiv` sentence (RootSystems §3.2 already supplies that comparison, as `README.md:314–317` says) and renumber the twenty lines to the pinned revision. Tested on the instance that refuted the original: after the rebase, `grep typeAWeylGroupEquiv` in the pinned library finds `Weyl/TypeA/Basic.lean:124`.

## R02 (P3) — §6.2 still cites a SpinRepresentations "branching contract" that does not exist

Re-raised: r7 R01. **Location:** `README.md:1142–1143`, "The comparison on spin and half-spin carriers consumes SpinRepresentations Layers 4–5, including its SpinHighestWeights and branching contracts".

**Claim:** SpinRepresentations Layers 4–5 supply a Spin(n) ↓ Spin(n−1) branching contract.

**Witness:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md` on main (`eaf17b10`) has `SpinHighestWeights` at line 781 and no "branching" anywhere; Layers 4 (line 665) and 5 (line 777) state the spin, half-spin and fundamental modules only. The passage is unchanged since the previous review.

**Repair:** Replace "including its SpinHighestWeights and branching contracts" by "including its spin and half-spin modules and SpinHighestWeights"; the spin branching with half-integral rows stays this roadmap's §6.2/§6.7 target. The Check "Spin₃ weight 1/2 restricts to Spin₂ weights ±1/2" is unchanged.

## R03 (P3) — Two locators cover less than the clause they are attached to

Re-raised in part: r7 R02 (its independence clause is repaired, see below). **Location:** `README.md:997–998`, "No height bound is needed: both sides vanish for taller shapes (Macdonald, Appendix A, (8.4), printed p. 163)"; `README.md:1899`, "Lemma 3.4 and Theorem 3.5, pp. 34–35".

**Claim:** Each cited place proves the clause.

**Witness:** `macdonald line 6389`–6397 ((8.4), printed p. 163) proves that the character of `R_λ` is `s_λ`, and `R_λ` is defined at `line 6350`–6351 only for `ℓ(λ) ≤ m`; the vanishing of the Schur module for taller shapes is Fulton–Harris Theorem 6.3(1), printed p. 77 (`fulton-harris line 2019`–2024), or the native `TauCeti.weylModuleOfShape_eq_bot_iff` (`WeylModule/Basic.lean:472`), and the polynomial side vanishes because `TauCeti.diagramSchurPoly` is a sum over bounded tableaux (`Schur/Basic.lean:174`). Molev's Lemma 3.4 (`molev line 1443`) and Theorem 3.5 (`line 1466`) both lie after the page-36 marker at `line 1442`, printed p. 34, as `README.md:1153` itself says ("printed pp. 33–34" with (3.13) on p. 33); the References entry's "pp. 34–35" names a page neither is on.

**Repair:** At the tall-shape clause cite Fulton–Harris Theorem 6.3(1), p. 77, or the native vanishing contract, next to (8.4); in the References entry write "(3.13), Lemma 3.4 and Theorem 3.5, pp. 33–34". The instance that refuted the original reading stays: shape (1,1) in one variable, Schur polynomial 0 and Schur module 0.

## R04 (P3) — The supplier contract lists native declarations no layer consumes

**Location:** `README.md:244–260` and `:274–278`: `TauCeti.openWeylChamber`, `TauCeti.longestElement`, `TauCeti.existsUnique_dynkinType`, `TauCeti.DynkinType.simplyConnectedRootDatum`, `TauCeti.DynkinType.simplyConnectedBase`, `TauCeti.DynkinType.typeAWeylGroupEquiv`, `TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector`.

**Claim:** The Exact supplier contracts name the declarations consumed.

**Witness:** Each of these seven names occurs in the README exactly once, inside the From Tau Ceti block; no `*Needs:*` line, layer or Check uses it (counted with `grep -c` over the file against the block at lines 239–293). The layers use `posRoots`, `dominantChamber`, `HasCartanType`, `integralWeightLattice`, `exists_int_apply_coroot`, `VermaModule`, `irreducibleQuotient`, the highest-weight uniqueness theorem, the Weyl character and dimension formulas, Cartier's theorem, the comodule stable-subspace theorem and `schurPolyBasis`, and those are the contract.

**Repair:** Delete the seven unconsumed names from the contract (and the Scope sentence's "the longest element" and "the numbered integral models" at `README.md:47–48`), or add the `*Needs:*` line that consumes each. Tested: the Layer 3/3A text reads unchanged without them.

## Previous findings

- r7 R01 (SpinRepresentations branching contract) — not repaired: `README.md:1142–1143` is byte-identical to the previous head (R02 above).
- r7 R02 (two Layer 4 locators) — partly repaired: the independence clause now cites the native Schur basis `TauCeti.schurPolyBasis` (`README.md:959–961`, `:977–978`), which exists at the pin (`Schur/Basis.lean:301`, partitions of each degree with at most as many parts as variables) and settles it; the tall-shape clause at `README.md:997–998` is unchanged (R03 above).

## Verified sound

### Mechanical checks

The worker's gate on this head returned every counter zero (`set_option=0 … outside-folder=0 … build=0 OK`). The dependency check rerun on this head returned exactly:

```text
depcheck: 239 roadmaps, 2429 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. The prescribed outside-folder diff is empty; the family index files under `TauCetiRoadmap/RepresentationTheory/` are byte-identical to main. Every supplier the README names (SchurWeyl, ReductiveGroups, RootSystems, LieGroups, SemisimpleAlgebras, SpinRepresentations, LieHighestWeight as a consumer) is a main roadmap; the two consumers in the merge order, ClassicalGroupsPartII (line 200) and TensorProductCombinatorics (line 292), are open pull requests placed after it.

`lake env lean` on `Suggested.lean` exits 0 in 19 s with exactly eleven `declaration uses 'sorry'` warnings (lines 51, 60, 65, 74, 87, 102, 110, 180, 198, 209, 216) and nothing else. A scratch copy with `#check @name` for all 22 declarations elaborated; every type keeps its binders: `[FiniteDimensional ℂ W]` and `TauCeti.IsRationalRep ρ` on `rationalRep_isSemisimple`; `[Simple W]` and rationality on the classification; `μ.colLen 0 ≤ n` on `nonempty_schurFunctor_iso_rationalWeylFDRep`; the support bound and the polynomial identity on the tensor-multiplicity theorem; `IsClosed`, `IsPreconnected` and the complex-direction law on the overgroup theorem; the scalar central-character law on the order isomorphism; `[FiniteDimensional]` and `[IsIrreducible]` on the two restriction theorems. Nothing changed and no binder repair is needed; the README generality equals the Lean generality in every row below. The rename `schurFunctor_iso_irreducible → nonempty_schurFunctor_iso_rationalWeylFDRep` is carried by the README (`README.md:564`, `:1000`), and `roadmaps grep` finds the old name only in main's own copy of this roadmap: no other roadmap cites it. The one-tactic probe (`first | rfl | simp | infer_instance | exact?` in place of each `sorry`, on a scratch copy) closed none of the eleven admitted theorems. The eleven `def`/`abbrev` declarations of Layer 6A have real bodies on native carriers; none is sorry'd data. No padding: no declaration restates a definition, mirrors a Check or computes a value. The module docstring names the SO/Sp classification, characters and branching, the GT bases and Capelli action, the symplectic multiplicity basis and the §3A.2 bridge as not statable, each with its missing carrier.

### Sources at the seeded sample

Cache ids and page keys: Molev `0bc32869` (printed page = marker − 2), Milne `f2ddd8fa` (printed = marker − 11), Macdonald `64e242b8` (printed = marker − 11), Fulton–Harris `9324d360` (institutional OCR scan, two printed pages per marker). All reads were from the existing cache; no manifest was touched.

| Target | Text at the locator and what it supports |
| --- | --- |
| 0.1 | Fulton–Harris §1.1, printed pp. 4–5 (`fulton-harris line 347`–376): representations, duals and tensor powers of the standard module. The trace Checks are recomputed below. |
| 0.2 | Milne §2.10, printed pp. 42–43 (`milne line 2068`–2099): the groups `AᵀCA = C` for the symmetric and alternating forms; the volume statement is the top exterior power of det = 1, as the README says. |
| 0.3 | Milne §2.8, p. 41 (`line 2019`–2032): `O(GLₙ) = k[Tᵢⱼ, 1/det]` with matrix comultiplication; Remark 4.1 and Example 4.2, pp. 84–85 (`line 3746`–3795): representations ↔ comodules through coefficient families, standard coaction `eⱼ ↦ Σ eᵢ ⊗ Tᵢⱼ`. |
| 1.3 | Fulton–Harris (6.1)–(6.2) and Theorem 6.3(2), pp. 77–78 (`line 2001`–2035): symmetric and exterior powers as the extreme Schur functors, with the complete and elementary symmetric characters. |
| 2.3 | SchurWeyl Layer 8 on main (`SchurWeyl/README.md:996`): the two action images and the double-centraliser theorem; its Scope (`:59–61`) assigns the Schur image and extremes to ClassicalGroups Layer 2 and the classification to Layers 3–5, consistent with the ownership here. |
| 3.1 | Milne Theorem 12.12, pp. 234–235 (`line 9716`–9724): every representation of a diagonalizable group is the sum of its eigenspaces. The dual-number differential Check is recomputed below. |
| 3.3 | Fulton–Harris Theorem 6.3, pp. 77–78 (`line 2019`–2035) and Proposition 15.47, p. 232 (`line 5429`–5431): unique decreasing labels, determinant twists. Native `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` at `Existence.lean:240`: Killing `L`, splitting Cartan, `IsAlgClosed`, `CharZero`, irreducible finite-dimensional `M`, exactly as the contract states. |
| 3.4 | Fulton–Harris §15.5, pp. 231–232 (`line 5377`–5425): two GL labels restrict to the same SL module iff they differ by a multiple of (1,…,1). RootSystems §3.2 on main (`RootSystems/README.md:562`–600): type `A n`, `n ≥ 1`, Weyl group ≃ `Equiv.Perm (Fin (n+1))`, no spanning hypothesis (its A₁ Check uses a non-spanning root span), as `README.md:314–317` restates. |
| 4.1 | Macdonald I(3.1), p. 40 and (3.4)–(3.5), p. 41 (`macdonald line 1804`–1836); the uniqueness input `TauCeti.schurPolyBasis` (`Schur/Basis.lean:301` at the pin): a basis of the homogeneous symmetric polynomials of degree `d` indexed by the partitions of `d` with at most `card σ` parts, over a commutative ring. |
| 4.2 | Macdonald Appendix A (8.4), p. 163 (`line 6389`–6397): the character of `R_λ` is `s_λ`, by density of diagonalizable matrices, for `ℓ(λ) ≤ m` (R03). The native Frobenius input `char_weylFDRepOfShape_diagramOf_diagonal_eq_sum_spechtChar` is at `WeylModule/SchurWeyl.lean:162`. |
| 4.3 | Macdonald I(3.1) and (3.4)–(3.5) as above; the determinant twist is `TauCeti.char_rationalWeylFDRep` (`WeylModule/Rational.lean:214`). The native Weyl character formula `formalCharacter_mul_weylDenominator_eq_weylNumerator` (`Weyl/Character.lean:319`) is for a finite-dimensional module generated by a highest-weight vector, with a finite Weyl group, as the contract states. |
| 5.1 | Macdonald I§3 Examples 1 and 4, pp. 44–45 (`line 1968`–1991): `s_λ(1,…,1)` as the hook-content product; (8.4) for the character. The native `finrank_eq_prod_coweightPairing_div` (`Weyl/Dimension.lean:113`) is the rational product over `posRootsFinset` for a module generated by a highest-weight vector, as the contract states. |
| 6.1 | Molev Theorem 2.1, printed p. 8 (`molev line 315`–319): multiplicity-free `glₙ ↓ glₙ₋₁` with the betweenness conditions (2.2); the transport to integer rows and the determinant twist is stated at `README.md:1104–1105`. |
| 6.2 | Molev (4.4), p. 48 (`line 2080`), (4.7), p. 50 (`line 2125`), the `o₂ₙ₋₁` generators `(Fₙᵢ − Fₙ′ᵢ)/√2` (`line 2116`–2117), (3.13), Lemma 3.4 and Theorem 3.5, pp. 33–34 (`line 1440`, `1443`, `1466`). The factor `i` in the norm-one coordinates is recomputed below. |
| 6.5 | Molev Theorem 2.1 iterated, Theorem 2.3 (`line 377`), Remark 2.2, p. 9 (`line 368`–374): patterns of a partition ↔ semistandard tableaux with entries in {1,…,n}. Native `card_gtPattern_topRow_eq_card_ssyt` (`GelfandTsetlin/Tableau.lean:453`) and `GTPattern.card_topRow_eq_weylDimension` (`GelfandTsetlin/Dimension.lean:187`). |

Also reread: Molev Proposition 2.4, p. 10 (`line 405`–410); Capelli (2.21)–(2.22), p. 16 (`line 673`–682); type C `ρᵢ = −i` (`line 1258`–1269); (3.10)–(3.12) with right evaluation (`line 1336`–1358); Theorems 4.1–4.4 (`line 2110`, `2159`, `2186`, `2220`); (4.5)–(4.6) with the skipped factor and the right denominator (`line 2087`–2101); (4.8)–(4.10) with `fᵢ = f′ᵢ − 1 = 2(Fᵢᵢ + n − i)` (`line 2128`–2148); Milne Proposition 10.31, p. 196 (`line 8168`–8178), Theorem 3.23, p. 71 (`line 3211`–3212), Theorem 22.42, pp. 478–479 (`line 19859`–19877). No copied passage was found.

### The adversarial table

Every row was recomputed this round by exact rational arithmetic in a scratch script (Schur polynomials by tableau enumeration, Schur expansions by solving the evaluation system at generic points, Weyl products, pattern counts, Molev's coefficients, Capelli polynomials, the C₂ interpolation nodes, and the symplectic contraction and inverse-form wedge maps on the full exterior algebra of `ℂ^{2r}` for `r = 1, 2, 3`), or by hand where marked.

| Statement | Instances | Values on each side / wrong model | Result |
| --- | --- | --- | --- |
| §0.1 standard, dual | diag(2,3); n = 0 | traces 5 and 1/2 + 1/3 = 5/6; empty module 0, zeroth power 1 | pass |
| §0.2 invariants | diag(2,1/2) on J; diag(−1,1) on I | AJAᵀ = J, det 1; AᵀA = I, det −1 | pass (hand) |
| §0.3 coefficients | det⁻¹ at 2; trivial at 0 | 1/2; 1 | pass |
| `rationalRep_isSemisimple` context | W = 0, n = 0 | zero module semisimple; trivial group | pass |
| §1.1, §1.3 | (2,3), d = 2; one variable 2 | 25 = 19 + 6; 4 = 4 + 0 | pass |
| §1.2 powers | (2,3): h₂, e₂, e₃ | 19, 6, 0 | pass |
| §2.2 images | (2), (1,1) on ℂ²; (1,1) on ℂ; empty on 0 | 3, 1; 0; 1 | pass |
| §2.3 | n = 2, d = 3 | 8 = 4·1 + 2·2 + 0 | pass (hand) |
| §3.1 torus, differential | GL₂ at diag(2,3); (1,−1) at diag(1+2ε,1+3ε) | 2 + 3 = 5, det⁻¹ 1/6; (1+2ε)(1−3ε) = 1 − ε, derivative −1 | pass (hand) |
| §3.2 labels, Weyl group | (1,−1); n = 0, 1 | shift −1, shape (2), value 19/6; trivial Weyl group, RootSystems §3.2 needs `n ≥ 1` so applies from GL₂ | pass |
| §3.3 classification | rank 1 weights −1, 0, 1 at 2; rank 0 | 1/2, 1, 2 distinct; one simple of dimension 1 | pass |
| `nonempty_schurFunctor_iso_rationalWeylFDRep` | (2,1), n = 2; (1,1), n = 1 | det ⊗ V of dimension 2 = 2; excluded by `colLen 0 ≤ n` (module 0) | pass |
| §3.4 SL | (2,1), (1,0) at diag(2,1/2); at diag(2,3); (1,0) vs (0,0) | 5/2 = 5/2; 30 ≠ 5; dimensions 2 ≠ 1 | pass |
| 3A.1 isotropic basis | u = e₁ + ie₂, v = (e₁ − ie₂)/2 | (u,u) = 0, (v,v) = 0, (u,v) = 1 | pass (hand) |
| 3A.1 antidiagonal | diag(2,3); diag(i,1); diag(2,1/2) | A^R = diag(3,2); diag(1,i) not diag(1,−i); AA^R = I versus 6I | pass (hand) |
| 3A.1 Sp torus | diag(t,t⁻¹), J = [[0,−I],[I,0]] | MJMᵀ = [[0,−tt⁻¹],[t⁻¹t,0]] = J; `Matrix.mem_iff` is `A * J * Aᵀ = J` at `SymplecticGroup.lean:117` | pass (hand) |
| 3A.1 Sp Borel block | M = [[A,B],[0,(Aᵀ)⁻¹]] | MJMᵀ = [[BAᵀ − ABᵀ, −I],[I, 0]], so MJMᵀ = J ⟺ A⁻¹B = (A⁻¹B)ᵀ | pass (hand) |
| 3A.1 Sp₂ unipotent | [[1,1],[0,1]]; [[1,0],[1,1]] | MJMᵀ = J; e₁ fixed, f₁ ↦ e₁ + f₁, weight 1, value 2 at diag(2,1/2); opposite fixes f₁ of weight −1 | pass (hand) |
| 3A.1 Cartan types | C₂ in order (ε₁−ε₂, 2ε₂); swapped; D₃ order (ε₂−ε₃, ε₁−ε₂, ε₂+ε₃) | ⟨αᵢ,αⱼ^∨⟩ = [[2,−1],[−2,2]] = `CartanMatrix.C 2`; [[2,−2],[−1,2]] = `CartanMatrix.B 2` (`Matrix/Cartan/Basic.lean:128`, `Base.cartanMatrix i j = pairingIn i j`); pairings −1, −1, 0 = `A 3` | pass (hand) |
| 3A.2 fixed spaces | Sp₂ standard at diag(2,1/2); SO₃ root operator; {±1} sign; Gₘ tᵖ in char 3 | 0 = 0; F₁₂w = u ≠ 0; Lie 1 ≠ group 0; 2³ = 2 ≠ 1 | pass (hand) |
| 3A.2 native hypotheses | `exists_subcomodule_iff_forall_differential_mem` | `[CharZero k] [IsAlgClosed k]`, `ConnectedSpace (PrimeSpectrum H)`, finite-type Hopf `H`, any comodule `M` (`LieStable.lean:49–51, 80`) = the README's standing hypotheses | pass |
| 3A.3 ω, Ω_J sign | ω(f₁,e₁), ω(e₁,f₁) | J_{inr,inl} = 1, J_{inl,inr} = −1; L₀(1) = f₁∧e₁, κ₂(f₁∧e₁) = 1 = r − 0; e₁∧f₁ gives −1 | pass |
| 3A.3 commutator | r = 1, 2, 3, every k ≤ 2r, every basis wedge | κ_{k+2}L_k − L_{k−2}κ_k = (r − k)·id on all 4 + 16 + 64 basis vectors; r = 1, k = 2: −f₁∧e₁ = (1 − 2)f₁∧e₁ | pass |
| 3A.3 sl₂ relations | H = r − k on ⋀^k | [H,κ] = (r−k+2)κ − κ(r−k) = 2κ; [H,L] = −2L; κ: V_{r−k} → V_{r−k+2} surjective iff r − k + 2 > 0 iff k ≤ r + 1 | pass (hand) |
| 3A.3 surjectivity, kernels | r = 2: k = 2, 3, 4; r = 3: k = 2..6 | ranks 1, 4, 1 (κ₄ into 6-dimensional ⋀²); ranks 1, 6, 15, 6, 1: surjective exactly for k ≤ r + 1; kernels 5, 0; 14, 14, 0 = binom(2r,k) − binom(2r,k−2) for 1 ≤ k ≤ r, and −5, −14 outside | pass |
| 3A.3 highest vector | e₁∧⋯∧e_k | ω(eᵢ,eⱼ) = 0 so κ_k kills it; weight ε₁+⋯+ε_k; Borel unipotent sends eⱼ into span of eᵢ, i ≤ j | pass (hand) |
| 3A.3 Hodge, dim 2 | ★e₁, ★e₂, ★u, ★v, ★² | e₂, −e₁, −iu, iv, −1 | pass (hand) |
| 3A.3 Hodge, dim 4 | ★(u₁∧u₂), ★(u₁∧v₂), η₂ | u₁∧u₂, −u₁∧v₂, (−1)¹(−i)² = 1 | pass (hand) |
| 3A monoid generation | D_r terminal coefficients; B_r last | a_{r−1} ≡ a_r mod 2; a_r even | pass (hand) |
| §4.1 `schurFunctor_tensor_multiplicity` | s₍₁₎² in 2 and 1 variables | s₍₂₎ + s₍₁,₁₎; s₍₂₎ only, (1,1) absent on both sides | pass |
| §4.1 nontrivial multiplicity | s₍₂,₁₎² in 3 variables | (4,2) + (4,1,1) + (3,3) + 2·(3,2,1) + (2,2,2); 27 + 10 + 10 + 16 + 1 = 64 = 8² | pass |
| §4.1 height bound | s₍₂,₁₎·s₍₁₎ in 3 vs 2 variables | (3,1) + (2,2) + (2,1,1); in 2 variables (2,1,1) drops and 3 + 1 = 4 = 2·2 | pass |
| §4.1 uniqueness input | `schurPolyBasis` | basis of `symmetricHomogeneousSubmodule σ R n` indexed by `{ν ⊢ n // ν.parts.card ≤ card σ}`: exactly the height bound of the hypothesis | pass |
| §4.2 `schur_character` | (2,1) at (2,3); (1,1) one variable; empty, n = 0 | 30 = 6·5; 0 = 0; 1 = 1 | pass |
| §4.3 Laurent | (1,−1) at (2,3) | 19/6 | pass |
| §5.1 `rational_dimension` | (), (−1), (2,1), (2,1,0), (1,0,−1), (3,1,0) | 1, 1, 2, 8, 8, 15 = pattern counts 1, 1, 2, 8, 8, 15 = tableau counts | pass |
| §6.1 `rationalWeyl_branching` | (2,1,0) → GL₂; (1,−1) → GL₁; n = 0 | (1,0),(1,1),(2,0),(2,1) of dimensions 2 + 1 + 3 + 2 = 8; −1, 0, 1 with trace 7/2; one empty summand | pass |
| §6.2 orthogonal | SO₃ 1 → SO₂; SO₄ (1,0) → SO₃; SO₅ → SO₃ fixing two; Sp₄ → Sp₂ | −1, 0, 1 (7/2); 3 + 1; 3 + 1 + 1; 2 + 1 + 1 | pass |
| §6.2 embedding | q = (u+v)/√2, w′ = i(u−v)/√2 | B(q,q) = 1, B(w′,w′) = 1, B(q,w′) = 0; (Fₙᵢ − Fₙ′ᵢ)/√2 sends eᵢ to −iw′, so the norm-one generator is i times Molev's | pass (hand) |
| §6.4 coefficients | (2,1,0), middle (2,0) ↔ (2,1), bottom 1 | E₂₃ coefficient 1, E₃₂ coefficient 1/2, product 1/2; raising the middle 2 to 3 gives numerator 0 | pass |
| §6.6 Capelli | (−1); (2,1); (3,2); (1,0); rank 0 | u − 1; u² + 2u (versus u² + 3u + 2); u² + 4u + 3 = A₂(u+1); u² − 1 = A₂(u−1); no generator | pass |
| §6.7 SO₃ | basis (u,w,v), F_{ij} = E_{ij} − E_{j′i′} | F₂₁: u ↦ w ↦ −v ↦ 0; F₁₂ on (u,w,−v): 0, u, w; F₁₁ = diag(1,0,−1); torus trace 7/2 | pass (hand) |
| 6B dictionary | a = (1,0) ↔ source λ = (0,−1) | two ν over μ₁ = 0, one over μ₁ = −1; 2·1 + 1·2 = 4 | pass (hand) |
| 6B interpolation | λ = (0,−1): g = (−1/2, −5/2) | (0,1) at −5/2, (1,0) at −1/2; without the half shift (11/32, 21/32); square differences −2 for (0,0), −6 for (0,−1) | pass |
| 6A subgroups | T = I + E₁₂, D = diag(2,1) | TD ≠ DT; (T,T) ∈ Δ, (T,I) ∉; r(D,I) = 2, r(I,D) = 1/2, r(T,I) = 1, r(2I,I) = 4 | pass (hand) |
| 6A normal kernel, normaliser | a = I, h = D, b = T; h with hgh⁻¹ = c(g)g | DTD⁻¹ = I + 2E₁₂ ≠ T; trace forces c = 1, h scalar | pass (hand) |
| 6A directions | H = Δ, H_det, r⁻¹(S¹), n = 2 | (N,N) ∈, (N,0) ∉; (N,0) ∈, (I,0) ∉ (ratio e²); (iI,0) ∈ with ratio e^{2it}, (−I,0) has ratio e⁻² | pass (hand) |
| `connected_complex_overgroup` | n = 0, 1; the four groups | all four ⊤; H_det = Δ and H_sc = P; each closed and connected | pass (hand) |
| 6A restriction | weights −1, 2 at (3,2); (3,3); scalar image of (3,2) | 4/3; 3; 3/2 = 2⁻¹·3 | pass |
| restriction theorems | n = 0; GL generated by SL and scalars | one-dimensional, irreducible; SL × SL ≤ H_det and Burnside on V ⊗ W | pass (hand) |

### Library declarations and ownership at the pins

Every file-and-line the README quotes under the ClassicalGroups, Schur and Gelfand–Tsetlin modules was opened at Tau Ceti `a91d3aaf` and is exact or within one line (`Character.lean:93, 132` for the cited `94, 133`): `IsRationalRep.isInternal_weightSpace` (`Weight/Decomposition.lean:233`), `char_tensorPowerRep` (`TensorPower.lean:198`), `char_extPowerRep_diagonal` (`ExteriorPower.lean:138`), `GTPattern.card_topRow_eq_weylDimension` (`GelfandTsetlin/Dimension.lean:187`), `weylModuleOfShape_eq_bot_iff` (`WeylModule/Basic.lean:472`), `tensorSquareRepEquiv` (`Decomposition.lean:49`), the Specht-character sum (`WeylModule/SchurWeyl.lean:162`), `char_rationalWeylFDRep` (`WeylModule/Rational.lean:214`), `eval_one_diagramSchurPoly_eq_card_boundedSSYT` (`Schur/Basic.lean:214`), `card_gtPattern_topRow_eq_card_ssyt` (`GelfandTsetlin/Tableau.lean:453`), `weylDimension_shift` (`WeylDimension/Basic.lean:256`), `hsymm_mul_diagramSchurPoly` (`Schur/Pieri.lean:231`). The twenty-one root, Lie, Cartier and comodule declarations are at the lines given in R01; their statements were read at the pin: `HasCartanType` is an equality of Cartan matrices after one relabelling `b.support ≃ Fin t.rank` (`DynkinType.lean:416`), `DynkinType.Valid` is `A ≥ 1, B ≥ 2, C ≥ 3, D ≥ 4` (`:156–160`), `existsUnique_dynkinType` needs finite, characteristic-zero domain, root system, crystallographic, reduced, irreducible, nonempty (`Classification.lean:120–128`), `longestElement` needs `IsRootSystem` with a finite Weyl group (`LongestElement.lean:191–194`), `posRoots` needs `CharZero` (`Positive.lean:114`), `integralWeightLattice` is a `Submodule ℤ (Dual K H)` of integral weights (`WeightLattice.lean:188`), `exists_isCompl_of_isKilling` needs `[FiniteDimensional K M]` over a Killing algebra (`CompleteReducibility.lean:259`), `smoothCommHopfAlgProperty_of_charZero` needs `[Field k] [CharZero k]` and `[Algebra.FiniteType k H]` (`CharZero.lean:148`); the Weyl character and dimension formulas and the comodule theorem are in the table. Also found: `slIdeal_le_or_le_center` (`GeneralLinear/Radical.lean:221`, needs `2 ≠ 0`), `isCompl_center_derivedSeries_one_matrix`, `normedAlgebraRatOfReal`, the `GeneralLinear.UpperTriangular` namespace (`Solvable/UpperTriangular.lean:37`) and `SpecialLinear/UpperTriangular/Basic.lean`, `gtPatternEquivSSYT`, `BoundedSSYT.fiberEquiv`, `rationalWeylSLRep`, `expUnit`, `glBlockSucc`. No pinned declaration states the general branching, the Schur character, the Weyl dimension of the rational Weyl module, or semisimplicity of rational representations, so the headlines are not duplicates.

At Mathlib `6b7abb3c`: `Matrix.J = fromBlocks 0 (−1) 1 0` and `mem_iff : A ∈ symplecticGroup ↔ A * J * Aᵀ = J` (`SymplecticGroup.lean:58, 117`), so the README's `J = [[0,−I],[I,0]]`, `AJAᵀ = J`, `ω(fᵢ,eⱼ) = δᵢⱼ`, `ω(eᵢ,fⱼ) = −δᵢⱼ` are the native conventions; `CartanMatrix.A/B/C/D` (`Matrix/Cartan/Basic.lean:121–153`) with `RootPairing.Base.cartanMatrix i j = pairingIn i j = ⟨αᵢ, αⱼ^∨⟩`; `Subgroup.goursatFst` (`Goursat.lean:43`); `exteriorPower.hodgeStar` and its wedge-pairing identity (`HodgeStar.lean:48, 53`, finite free module, bijective bilinear form, volume isomorphism, `k + l = finrank`); `GeneralLinearGroup.center_eq_range_scalar` (`GeneralLinearGroup/Basic.lean:52`); `Matrix.orthogonalGroup` as `unitaryGroup` under the trivial star.

Cross-roadmap citations resolved this round, on main (`eaf17b10`) unless noted: SchurWeyl Layers 0–2, 7 (`SchurWeyl/README.md:580`) and 8 (`:996`); ReductiveGroups Layers 0–3 (`ReductiveGroups/README.md:129–248`), 3A with its scheme stabilizers (`:249`, `:275–277`), 6 (`:466`), 7 Borel subgroups (`:627–630`), §10D (`:1850`); the dropped citation of its Layer 5P was right to drop (5P is the polynomial-unipotent exponential, `:460`, not Cartier smoothness); RootSystems §3.2 (`:562`); LieGroups Layers 0–4 with the anchor `layer-2-the-closed-subgroup-cartan-theorem` (`LieGroups/README.md:233–326`); SemisimpleAlgebras Layers 1 and 3 (`:186`, `:233`, the density theorem); SpinRepresentations Layers 2–5 and `SpinHighestWeights` (`:427–838`, `:781`; no branching, R02); LieHighestWeight Layer 9 (`:1432–1441`) consumes ClassicalGroups Layers 2–4 and no layer here consumes a LieHighestWeight layer any more, so the former layer-level mutual citation is gone; ClassicalGroupsPartII at its head (`rev/1492`, `README.md:28–49`, `:276–308`): its Scope assigns to ClassicalGroups §3A.1–§3A.3 exactly the torus, group/Lie comparison, contraction, inverse-form wedge map, commutator `(g − k)·id`, surjectivity for `1 ≤ k ≤ g`, highest weight `ω_k`, simplicity, dimension and Cartan components this head states, and keeps CG.1.4–CG.1.5 (multiplier-twisted, every characteristic-zero field) and CG.1.7 (rational GSp models) for itself, as `README.md:52–56` and `:1889–1895` say; its bivector `Σ aᵢ∧bᵢ` with `ω(aᵢ,bⱼ) = δᵢⱼ` is this head's `Σ fᵢ∧eᵢ`. TensorProductCombinatorics at its head (`rev/1107`) cites Layer 6A by section, not by Lean name. No other roadmap owns the diagonal-overgroup classification, the Capelli generators, the Mickelsson operators, the antidiagonal comparison or the symplectic contraction commutator. Ownership against open pull requests was checked only in the checkouts this brief lists.

### Headline inventory

| README headline | In `Suggested.lean` |
| --- | --- |
| Complete reducibility (§0.4) | `rationalRep_isSemisimple` |
| Unique GL classification and Schur identification (§3.3) | `rational_irreducible_classification`, `nonempty_schurFunctor_iso_rationalWeylFDRep` |
| Schur characters, tensor multiplicities and the Weyl dimension (§§4.1, 4.2, 5.1) | `schur_character`, `schurFunctor_tensor_multiplicity`, `rational_dimension` |
| GL branching (§6.1) | `rationalWeyl_branching` |
| Diagonal overgroups and restrictions (Layer 6A) | `connected_complex_overgroup`, `scalarRestriction_exists_orderIso`, `restrict_specialLinear_irreducible`, `external_determinantEqual_irreducible` |
| SO/Sp classification, characters and branching; the contraction kernels of §3A.3; GT bases and Capelli action; symplectic multiplicity vectors; the §3A.2 bridge | named in the module docstring as not statable, each with its missing carrier (rational SO/Sp models and their differentiated actions, Mickelsson operators, differentiation of a rational `Representation`): correct |
| SL exhaustion (§3.4) and the GT dimension formula (§6.5) | corollaries, not headlines |

## Not verifiable

- **Fulton–Harris beyond Lecture 20:** the cached institutional OCR scan ends there; every page the README cites (4–5, 77–78, 231–232) is inside it and was read, through OCR noise.
- **Goodman–Wallach, Weyl (1939), Procesi (2007):** broad references without claim-level locators; no legal readable copy is in the cache and none was sought, since no statement depends on them alone.
- **Universal statements:** the computed rows and the admitted elaborations certify instances and signatures, not proofs of the targets; the contraction identity is certified for `r ≤ 3`.

## Source issues

- **Misprint** in milne2022 at §2.10(b), printed p. 42 (`milne line 2088`): the source writes the last cross-term of the odd orthogonal form with the same index pair twice; it should pair xₙ with y₂ₙ and x₂ₙ with yₙ as the displayed Gram matrix does; affects a stated result.
- **Misprint** in milne2022 at §2.10(c), printed p. 42 (`milne line 2096`): the source places the symplectic matrices in GLₙ(R); it should be GL₂ₙ(R), the size of the displayed matrix; affects a stated result.
- **Misprint** in molev2002 at §3 introduction, printed p. 28 (`molev line 1191`): the source describes the multiplicity space by glₙ₋₁-highest vectors; it should say gₙ₋₁-highest vectors for the chosen orthogonal or symplectic subalgebra; affects a stated result.
