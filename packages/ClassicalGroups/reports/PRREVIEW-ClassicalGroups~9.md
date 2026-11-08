# Review of ClassicalGroups (pull request #1192 at c8d3edd)
Folder: `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/`

**Verdict:** needs changes

One finding (P3). All four findings of the previous review are repaired. This is an incremental re-review of the 69 changed lines since `a75ea79`, all in `README.md`; `Suggested.lean` is byte-identical (`git diff a75ea79 HEAD` on it is empty). The lines checked are the Scope sentence on native root theory, the From Tau Ceti contract (renumbered to the pin, seven names dropped, `HasCartanType` described), the §4.2 tall-shape clause, the §6.2 Spin sentence and the Molev References entry. Everything those passages cite or rely on was checked too. Library paths are those of the pull request's manifest (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`). Files inside the folder are named by basename.

## R01 (P3) — The From Mathlib root-system bullet names two declarations that do not exist at the pin

**Location:** `README.md:163–164`: "`RootPairing`, `RootSystem`, `RootPairing.Base`, `RootPairing.cartanMatrix`, `RootPairing.weylGroup` (`LinearAlgebra/RootSystem/*`)".

**Claim:** These are the Mathlib declarations this roadmap consumes as its abstract root-system skeleton. The rewritten contract at `README.md:244–249` defines `TauCeti.HasCartanType` through "the Cartan matrix of `b`", which is this Mathlib object. This line is unchanged, but the new contract depends on it.

**Witness:** At Mathlib `6b7abb3c`, `cartanMatrix` is declared only inside `namespace RootPairing.Base` (`RootSystem/CartanMatrix.lean:44, 106`; line 50 says `RootPairing.Base.cartanMatrix`). Root systems are the class `RootPairing.IsRootSystem` (`RootSystem/Defs.lean:120`). Neither `RootSystem` nor `RootPairing.cartanMatrix` is declared anywhere.

**Repair:** Write `RootPairing.IsRootSystem` in place of `RootSystem`, and `RootPairing.Base.cartanMatrix` in place of `RootPairing.cartanMatrix`. Tested on the refuting instance: at the pin the two names are declared at `Defs.lean:120` and `CartanMatrix.lean:106`. The body of `TauCeti.HasCartanType` (`DynkinType.lean:417`) uses `b.cartanMatrix`, which resolves to the second name.

## Previous findings

- R01 — repaired: `README.md:239–278` now cites the pinned lines, for example "`TauCeti.posRoots` (`…/Positive.lean:114`)", "`TauCeti.dominantChamber` (`…/Chamber.lean:137`)", "`TauCeti.HasCartanType` (`…/DynkinType.lean:416`)". The `typeAWeylGroupEquiv` sentence is deleted. All 28 Tau Ceti file-and-line locators open on the named declaration at `a91d3aaf`.
- R02 — repaired: `README.md:1134–1137`: "consumes SpinRepresentations Layers 4–5, including its spin and half-spin modules and SpinHighestWeights; … the spin branching itself, with half-integral rows, is a target of this section and §6.7."
- R03 — repaired: `README.md:984–990` cites (8.4) "stated there for the representations `R_λ` with `ℓ(λ) ≤ m`", and for taller shapes Fulton–Harris Theorem 6.3(1), p. 77, and `TauCeti.weylModuleOfShape_eq_bot_iff`. `README.md:1892` now reads "(3.13), Lemma 3.4 and Theorem 3.5, pp. 33–34".
- R04 — repaired: `openWeylChamber`, `longestElement`, `existsUnique_dynkinType`, `simplyConnectedRootDatum`, `simplyConnectedBase`, `typeAWeylGroupEquiv` and `finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` occur nowhere in the README. Scope `README.md:47–49` reads "Positive roots, dominant chambers and the oriented Cartan-type predicate are native in Tau Ceti". No layer text depends on the dropped names: a grep for "longest", "chamber", "criterion" and "simply connected" finds only consumed uses.

## Verified sound

### Mechanical checks

- **Worker's gate.** The worker's gate on this head (`gate.md`) set every counter to zero and ended `OK`.
- **My gate rerun.** My own rerun of the full gate stopped before any check: the GitHub API rate limit refused the remote fetch of the merge order (exit 77). No check reported a failure. I ran the gate's local components separately instead.
- **Dependency check.** The local merge-order file printed exactly:

  ```text
  depcheck: 239 roadmaps, 2430 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Files outside the folder.** The prescribed outside-folder diff against `origin/main` is empty. The folder holds only `README.md` and `Suggested.lean`.
- **Elaboration.** The seven imported Tau Ceti modules were built first (`lake build`, up to date). `lake env lean` on `Suggested.lean` then exits 0 with exactly eleven `declaration uses sorry` warnings, at lines 51, 60, 65, 74, 87, 102, 110, 180, 198, 209 and 216, and nothing else.
- **Signatures.** The `#check @name` file for all 22 declarations elaborates with no error. `schur_character` elaborates as `∀ n μ (t : Fin n → ℂˣ), (TauCeti.schurFunctor n μ).character (TauCeti.diagGL t) = eval (↑∘t) (TauCeti.diagramSchurPoly n ℂ μ)`, with no height hypothesis. That is the generality the rewritten §4.2 prose states.
- **Probe and padding.** Since the file is unchanged, the one-tactic probe and padding audit of r8 stand: none of the eleven admitted theorems closes, and nothing is padding.

### Changed passages: sources

| Target | Text at the locator and what it supports |
| --- | --- |
| 4.2 (8.4) | Macdonald, cached copy `64e242b8`, line 6389, printed p. 163 (marker 174): the character of `R_λ` is `s_λ`. `R_λ` is introduced at line 6350, printed p. 162, only for `ℓ(λ) ≤ m`. The new wording matches exactly. |
| 4.2 tall shapes | Fulton–Harris, cached copy `9324d360`, line 2019 (marker 46, the two-page spread 76/77, right-hand page 77): Theorem 6.3(1) says that `S_λ V` vanishes when `λ_{k+1} ≠ 0`, with `k = dim V`. Native `weylModuleOfShape_eq_bot_iff` (`WeylModule/Basic.lean:472`, `[Nontrivial k]`) states `weylModuleOfShape k n μ = ⊥ ↔ n < μ.colLen 0`. `schurFunctor n μ` is `weylFDRepOfShape ℂ n μ` (`WeylModule/Basic.lean:504`). `diagramSchurPoly` is a sum over `BoundedSSYT N μ` (`Schur/Basic.lean:174`), which is column-strict (Mathlib `col_strict'`) with entries `< n` (`Kostka.lean:206–207`). Both sides vanish, as stated. |
| 6.2 Spin | §6.7's heading (`README.md:1285`) carries `Spin(n) ↓ Spin(n-1)`, and its body uses the supplied spin carriers (`:1292`, `:1338–1339`). SpinRepresentations on main (`eaf17b10`) has Layer 4 (`:665`), the half-spin summands (`:736`) and `SpinHighestWeights` (`:781`), and no "branching". The new sentence cites what exists. |
| 6.2 / Refs Molev | Molev, cached copy `0bc32869` (printed page = marker − 2): (3.13) is at line 1440, above the printed folio "33" at line 1441. Lemma 3.4 (line 1443) and Theorem 3.5 (line 1466) follow the marker for page 36 (line 1442), so they are on printed p. 34. "pp. 33–34" is right in both `README.md:1146` and `:1892`. |

The seeded targets 0.2, 0.3, 1.1, 1.2, 1.3, 3.2, 3.3, 3.4, 3.5, 5.1, 6.1, 6.3 and 6.5 lie in unchanged text. Their r8 source verification stands. No copied passage was found in the changed lines.

### Library declarations opened at the pins this round

- **The 28 Tau Ceti locators.** All 28 Tau Ceti file-and-line locators in the README were opened at `a91d3aaf`, and each line is the named declaration:
  - `isInternal_weightSpace` (`Decomposition.lean:233`), `char_tensorPowerRep` (`:198`), `char_extPowerRep_diagonal` (`:138`)
  - `GTPattern.card_topRow_eq_weylDimension` (`:187`), `weylModuleOfShape_eq_bot_iff` (`:472`), `tensorSquareRepEquiv` (`:49`)
  - the two `char_weylFDRepOfShape_diagonal_of_*_le_one` (`Character.lean:93, 132`), the Specht sum (`SchurWeyl.lean:162`), `char_rationalWeylFDRep` (`:214`)
  - `eval_one_diagramSchurPoly_eq_card_boundedSSYT` (`:214`), `card_gtPattern_topRow_eq_card_ssyt` (`:453`), `weylDimension_shift` (`:256`), `schurPolyBasis` (`Basis.lean:301`)
  - `posRoots` (`Positive.lean:114`, `[CharZero R]`), `dominantChamber` (`Chamber.lean:137`, in `namespace TauCeti` under `[LinearOrder R]`, so the renamed `TauCeti.dominantChamber` is right), `HasCartanType` (`DynkinType.lean:416`, `[P.IsCrystallographic]`)
  - `integralWeightLattice` (`:188`), `exists_int_apply_coroot` (`:198`), `VermaModule` and `irreducibleQuotient` (`Verma.lean:195, 525`), the highest-weight uniqueness theorem (`Existence.lean:240`)
  - `exists_isCompl_of_isKilling` (`:259`), the Weyl character (`:319`) and dimension (`:113`) formulas
  - `smoothCommHopfAlgProperty_of_charZero` (`CharZero.lean:148`), `Submodule.exists_subcomodule_iff_forall_differential_mem` (`LieStable.lean:80`, in `namespace Submodule`), `hsymm_mul_diagramSchurPoly` (`Pieri.lean:231`)
- **The new `HasCartanType` description.** It matches the native docstring and body (`DynkinType.lean:409–417`): there is one simultaneous relabelling `b.support ≃ Fin t.rank` and no transposition. `DynkinType.Valid` is `A ≥ 1, B ≥ 2, C ≥ 3, D ≥ 4` (`:156–161`).
- **Mathlib at the pin.**
  - `RootPairing.weylGroup` (`RootSystem/WeylGroup.lean:55`), cited at `README.md:492` and `:1016`.
  - `cartanMatrixIn i j = P.pairingIn S i j` (`CartanMatrix.lean:52–53`) and `pairing i j = P.root' i (P.coroot j)` (`Defs.lean:195`).
  - `CartanMatrix.B` and `CartanMatrix.C` (`Matrix/Cartan/Basic.lean:128, 137`).
  - `exteriorPower.hodgeStar` and `exteriorPower_hodgeStar_eq_wedgePairing` (`HodgeStar.lean:48, 53`, `namespace exteriorPower`).

### The adversarial table

New rows were computed this round, by exact arithmetic in a scratch script (Mathlib's B/C matrices, the pairing `⟨αᵢ, αⱼ^∨⟩`, a search over all relabellings, and Schur polynomials by enumerating bounded column-strict tableaux). Rows marked (r8) cover statements the diff leaves untouched and are carried from the previous report with its values.

| Statement | Instances | Values on each side / wrong model | Result |
| --- | --- | --- | --- |
| §4.2 `schur_character`, tall shapes (new) | (1,1), n = 1; (1), n = 0; (1,1,1), n = 2; (2,2,1), n = 2 | 0 tableaux each, so Schur value 0; `n < colLen 0` (1 < 2, 0 < 1, 2 < 3, 2 < 3), so the module is ⊥ and the character is 0 | pass |
| §4.2 `schur_character`, bounded shapes (new) | (2,1) at (2,3); (3) at 2; empty, n = 0 | 2 tableaux, 30 = 6·5 (det ⊗ std); 8 = 2³ (Sym³ ℂ¹); 1 tableau, value 1 = character of the trivial module | pass |
| `HasCartanType` contract, rank 2 (new) | Sp₄ base (ε₁−ε₂, 2ε₂); SO₅ base (ε₁−ε₂, ε₂) | [[2,−1],[−2,2]] = `C 2`, and the swap (1,0) gives `B 2`; [[2,−2],[−1,2]] = `B 2`, and the swap gives `C 2`: "B₂ and C₂ coincide" | pass |
| `HasCartanType` contract, ranks 3–4 (new) | Sp₆, SO₇; Sp₈, SO₉ | Cartan matrices equal `C 3`, `B 3`, `C 4`, `B 4`; no relabelling of 3 or 4 nodes takes C to B: "distinguished from rank 3 on" | pass |
| Validity sentence (new) | `Valid (C 2)`, `Valid (C 3)`, `Valid (B 2)`, `Valid (D 3)` | 3 ≤ 2 false; 3 ≤ 3 true; 2 ≤ 2 true; 4 ≤ 3 false: matches "C≥3, B≥2, D≥4" and §3A.1's D₃ = A₃ remark | pass |
| §6.2 Spin wording (new) | Spin₃ weight 1/2 → Spin₂ | interlacing 1/2 ≥ \|μ₁\| with μ₁ ∈ ℤ + 1/2 gives ±1/2, dimension 2 = 1 + 1; the target is §6.7's `Spin(n) ↓ Spin(n−1)`, not SpinRepresentations | pass |
| §0.1 standard, dual (r8) | diag(2,3); n = 0 | traces 5 and 5/6; empty module 0, zeroth power 1 | pass |
| §0.2 invariants (r8) | diag(2,1/2) on J; diag(−1,1) on I | AJAᵀ = J, det 1; AᵀA = I, det −1 | pass |
| §0.3 coefficients (r8) | det⁻¹ at 2; trivial at 0 | 1/2; 1 | pass |
| `rationalRep_isSemisimple` (r8) | W = 0, n = 0 | zero module semisimple; trivial group | pass |
| §1.1, §1.3 (r8) | (2,3), d = 2; one variable 2 | 25 = 19 + 6; 4 = 4 + 0 | pass |
| §1.2 powers (r8) | (2,3): h₂, e₂, e₃ | 19, 6, 0 | pass |
| §2.2 images (r8) | (2), (1,1) on ℂ²; (1,1) on ℂ; empty on 0 | 3, 1; 0; 1 | pass |
| §2.3 (r8) | n = 2, d = 3 | 8 = 4·1 + 2·2 + 0 | pass |
| §3.1 torus, differential (r8) | diag(2,3); (1,−1) at diag(1+2ε,1+3ε) | 5, det⁻¹ 1/6; derivative −1 | pass |
| §3.2 labels (r8) | (1,−1); n = 0, 1 | shape (2), value 19/6; trivial Weyl group | pass |
| §3.3 classification (r8) | rank 1 weights −1, 0, 1 at 2; rank 0 | 1/2, 1, 2 distinct; one simple of dimension 1 | pass |
| `nonempty_schurFunctor_iso_rationalWeylFDRep` (r8) | (2,1), n = 2; (1,1), n = 1 | dimension 2 = 2; excluded by `colLen 0 ≤ n` | pass |
| §3.4 SL (r8) | (2,1), (1,0) at diag(2,1/2); at diag(2,3) | 5/2 = 5/2; 30 ≠ 5 | pass |
| 3A.1 isotropic basis, antidiagonal (r8) | u = e₁ + ie₂, v = (e₁ − ie₂)/2; diag(2,3) | (u,v) = 1, (u,u) = (v,v) = 0; A^R = diag(3,2) | pass |
| 3A.1 Sp torus, Borel block, Sp₂ unipotent (r8) | diag(t,t⁻¹); [[A,B],[0,(Aᵀ)⁻¹]]; [[1,1],[0,1]] | MJMᵀ = J; ⟺ A⁻¹B symmetric; weight 1, value 2 | pass |
| 3A.1 Cartan Check (r8; recomputed above) | C₂ order (ε₁−ε₂, 2ε₂), swapped; D₃ | `C 2`, `B 2`; `A 3` | pass |
| 3A.2 fixed spaces, native hypotheses (r8) | Sp₂ at diag(2,1/2); {±1}; Gₘ tᵖ, char 3 | 0 = 0; Lie 1 ≠ group 0; 8 ≠ 1 | pass |
| 3A.3 ω sign, commutator, surjectivity (r8) | r = 1, 2, 3, all k, all basis wedges | κL − Lκ = (r − k)·id on 4 + 16 + 64 vectors; kernels binom(2r,k) − binom(2r,k−2) | pass |
| 3A.3 Hodge (r8) | ★ in dim 2, 4 | e₂, −e₁, −iu, iv; η₂ = 1 | pass |
| §4.1 `schurFunctor_tensor_multiplicity` (r8) | s₍₁₎², s₍₂,₁₎² in 3 variables, height drop in 2 | s₍₂₎ + s₍₁,₁₎; 64 = 8²; 3 + 1 = 4 | pass |
| §4.3 Laurent (r8) | (1,−1) at (2,3) | 19/6 | pass |
| §5.1 `rational_dimension` (r8) | (), (−1), (2,1), (2,1,0), (1,0,−1), (3,1,0) | 1, 1, 2, 8, 8, 15 = pattern counts = tableau counts | pass |
| §6.1 `rationalWeyl_branching` (r8) | (2,1,0) → GL₂; (1,−1) → GL₁ | 2 + 1 + 3 + 2 = 8; trace 7/2 | pass |
| §6.2 orthogonal, embedding (r8) | SO₃ → SO₂; SO₄ → SO₃; Sp₄ → Sp₂; q, w′ | 7/2; 3 + 1; 2 + 1 + 1; norm-one generator is i times Molev's | pass |
| §6.4, §6.6 (r8) | (2,1,0) coefficients; Capelli (2,1) | product 1/2; u² + 2u | pass |
| §6.7, 6B (r8) | SO₃ basis (u,w,v); λ = (0,−1) | torus trace 7/2; 2·1 + 1·2 = 4; nodes −1/2, −5/2 | pass |
| 6A subgroups, directions (r8) | T = I + E₁₂, D = diag(2,1); H = Δ, H_det | TD ≠ DT; ratios 2, 1/2, 1, 4 | pass |
| `connected_complex_overgroup` (r8) | n = 0, 1 | all four groups ⊤; H_det = Δ | pass |
| `scalarRestriction_exists_orderIso`, restriction theorems (r8) | weights −1, 2 at (3,2); n = 0 | 4/3; one-dimensional, irreducible | pass |

### Cross-roadmap citations and ownership

- **Scope sentence.** The changed sentence still names RootSystems §3.2, which is on main at `RootSystems/README.md:562` ("Type A as a permutation group").
- **No new ownership.** The diff adds no ownership claim. It removes the claim to consume the Cartan classification and the numbered integral models, and no layer used either.
- **Overlap tool.** `scratch/overlaps.md` lists no other open pull request changing this roadmap and no dropped or revision-only ids. The closest open roadmaps (TensorProductCombinatorics, LieHighestWeight, ClassicalGroupsPartII, RepresentationTheory) are untouched by this diff's passages, and the r8 ownership check stands.
- **Scope of the ownership check.** Ownership against open pull requests was checked only through the listed checkouts and the overlap tool.

## Not verifiable

- **Universal statements:** the computed rows certify instances and elaborated signatures, not proofs of the targets.
- **Full gate rerun:** my own run of the gate stopped on a GitHub API rate limit before any check executed. The gate result recorded here is the worker's run on this head (every counter zero, `OK`). I reran its local components (dependency check, elaboration, outside-folder diff) independently, with the results above.

## Source issues

- none
