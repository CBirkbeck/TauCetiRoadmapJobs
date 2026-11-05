# Review of ClassicalGroups (pull request #1192 at 4dcaac5)
Folder: `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/`

**Verdict:** accepted

Two findings, both P3. This is a full review of the repaired head: the folder changed by 921 lines since the previous review (five companion files deleted, Layers 0A and 2A and the three worked-example programmes removed, the LR gap replaced by a coefficient-comparison theorem, hypotheses trimmed). Every check below was redone on this head: the gate and dependency check, elaboration of `Suggested.lean` with a `#check` of all 22 declarations, the one-tactic probe of all 11 admitted theorems, every seeded locator reread in the cached texts, every cited library name reopened at the pins, every cross-roadmap citation resolved on main or at the open head, and every value in the adversarial table recomputed by exact arithmetic. Files are named by basename inside the folder; library paths are those of the manifest pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`).

## R01 (P3) — §6.2 cites a SpinRepresentations "branching contract" that does not exist

**Location:** `README.md:1017–1019`, "The comparison on spin and half-spin carriers consumes SpinRepresentations Layers 4–5, including its SpinHighestWeights and branching contracts".

**Claim:** SpinRepresentations Layers 4–5 supply a Spin(n) ↓ Spin(n−1) branching contract.

**Witness:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md` on main (`a75b986`) has `SpinHighestWeights` (line 781) but no branching statement in Layers 4–5 or anywhere (no "branching", no Spin(n) ↓ Spin(n−1) target). The spin branching with half-integral rows is this roadmap's own §6.2/§6.7 target, as the surrounding sentences say.

**Repair:** Replace "including its SpinHighestWeights and branching contracts" by "including its spin and half-spin modules and SpinHighestWeights"; the branching itself stays a target here. Spin₃ weight 1/2 ↦ Spin₂ weights ±1/2 remains the Check.

## R02 (P3) — Two locators in Layer 4 cover less than the clause they are attached to

**Location:** `README.md:873–874`, "No height bound is needed: both sides vanish for taller shapes (Macdonald, Appendix A, (8.4), printed p. 163)"; `README.md:836–837`, "the Schur polynomials of height at most n are linearly independent in n variables (SchurWeyl Layer 7)".

**Claim:** Each cited place proves the clause.

**Witness:** `macdonald line 6389`–6399 ((8.4), printed p. 163) proves `s_λ = trace F_λ` only for ℓ(λ) ≤ m; the vanishing of the Schur module for taller shapes is Fulton–Harris Theorem 6.3(1), printed p. 77 (`fulton-harris line 2019`–2024), and at the pin `TauCeti.weylModuleOfShape_eq_bot_iff` (`WeylModule/Basic.lean:472`), while the polynomial side vanishes because `TauCeti.diagramSchurPoly` is the sum over bounded tableaux (`Schur/Basic.lean:174`). SchurWeyl Layer 7 on main (`SchurWeyl/README.md:334–336`) states the ℤ-basis claim and the Kostka change of basis; the exact n-variable statement, that the `s_λ` with ℓ(λ) ≤ n form a ℤ-basis of the symmetric polynomials in n variables, is Macdonald I(3.2), printed p. 41 (`macdonald line 1819`).

**Repair:** At the tall-shape clause cite Fulton–Harris Theorem 6.3(1), p. 77 (or the native vanishing contract) next to (8.4); at the independence clause add "Macdonald, I(3.2), p. 41" after "SchurWeyl Layer 7". The instance that refuted the original reading stays: shape (1,1) in one variable, Schur polynomial 0 and Schur module 0.

## Previous findings

- R01 (LR gap) — repaired: the gap paragraph is gone; `README.md:29–32` assigns every tableau formula to SchurWeyl, and §4.1 now states `schurFunctor_tensor_multiplicity` as the coefficient comparison alone (`README.md:829–852`). Its instances 25 = 19 + 6 and 4 = 4 + 0 are in the Checks and recomputed below.
- R02 (four extension programmes) — repaired: Layers 0A, 2A, the Kan-extension, mixed-contraction and U(3) sections are deleted; `README.md:14–22` names the five programmes as not planned here and distinguishes the continuation from ClassicalGroupsPartII (the GSp roadmap, `ClassicalGroupsPartII/README.md:28–36` at its head). Layers 3A, 6A and 6B stay, as the finding allowed.
- R03 (`PolynomialMonoidExtensionTargets.lean`) — repaired: deleted.
- R04 (five companions, `set_option`) — repaired: all five files deleted; the folder holds `README.md` and `Suggested.lean` only; `grep` finds no "prototype", "illustrated in", `set_option` or submodule import.
- R05 (hypotheses) — repaired: `connected_complex_overgroup` (`Suggested.lean:177`) has no `2 ≤ n`, and its docstring and `README.md:1589–1592` state the n = 0, 1 coincidences; the two restriction theorems (`Suggested.lean:206, 213`) carry `[FiniteDimensional]` and `[IsIrreducible]` only, with docstrings saying why rationality is not assumed.
- R06 (LieHighestWeight Layer 9 direction) — repaired: `README.md:39–41` says Layer 9 consumes Layers 2–4 and no layer here uses it; `README.md:1085–1088` constructs the §6.4 differentiation through §3A.2 and the `*Needs:*` line at `README.md:1110` lists §3A.2. Scope also records the two Spin directions at different layers (`README.md:43–46`).
- R07 (locators) — repaired: "the notes" is gone with Layer 2A; Layer 6A says at `README.md:1538–1540` that the four-group classification is the roadmap's own derivation with no published statement cited.
- R08 (spacing, capitals) — repaired: a scan for a letter directly followed by a digit in the flagged forms and for capitalised emphasis returns nothing.

## Verified sound

### Mechanical checks

The worker's gate on this head returned every counter zero (`set_option=0 … build=0 OK`). The dependency check rerun on this head returned exactly:

```text
depcheck: 204 roadmaps, 1666 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. The prescribed outside-folder diff is empty; the family index files under `TauCetiRoadmap/RepresentationTheory/` (`README.md`, `PROGRESS.md`, `STATUS.md`, `metadata.toml`) are byte-identical to main. ClassicalGroups and all its suppliers on main (SchurWeyl, LieHighestWeight, RootSystems, ReductiveGroups, LieGroups, SemisimpleAlgebras, SpinRepresentations) are main roadmaps; its two consumers in the merge order, ClassicalGroupsPartII (188) and TensorProductCombinatorics (277), are open pull requests placed after it.

`lake env lean` on `Suggested.lean` exits 0 in 29 s with exactly eleven `declaration uses 'sorry'` warnings (lines 49, 58, 63, 71, 84, 99, 107, 177, 195, 206, 213) and nothing else. A scratch copy with `#check @name` for all 22 declarations elaborated; every type keeps its binders: `[FiniteDimensional ℂ W]` and `TauCeti.IsRationalRep ρ` on `rationalRep_isSemisimple`; `[Simple W]` and rationality on the classification; `μ.colLen 0 ≤ n` on the Schur isomorphism; the support bound and the polynomial identity on the tensor-multiplicity theorem; `IsClosed`, `IsPreconnected` and the complex-direction law on the overgroup theorem; the scalar central-character law on the order isomorphism; `[FiniteDimensional]` and `[IsIrreducible]` on the two restriction theorems. Nothing changed and no binder repair is needed; the README generality equals the Lean generality in every row of the table below. The one-tactic probe (`first | rfl | simp | infer_instance | exact?` in place of each `sorry`, on a scratch copy) closed none of the eleven admitted theorems. The eleven `def`/`abbrev` declarations of Layer 6A all have real bodies on native carriers (ranges and kernels of explicit homomorphisms, `TauCeti.expUnit`, `Representation.tprod`); none is sorry'd data. No padding was found: no declaration restates a definition, mirrors a Check or computes a value.

### Sources at the seeded sample

Cache ids and page keys: Molev `0bc32869` (printed page = marker − 2), Milne `f2ddd8fa` (printed = marker − 11), Macdonald `64e242b8` (printed = marker − 11), Fulton–Harris `9324d360` (institutional OCR scan, two printed pages per marker). All reads were from the existing cache; no manifest was touched.

| Target | Text at the locator and what it supports |
| --- | --- |
| 0.3 | Milne §2.8, printed p. 41 (`milne line 2019`–2032): O(GLₙ) = k[Tᵢⱼ, 1/det] with the matrix comultiplication; Remark 4.1 and Example 4.2, pp. 84–85 (`line 3746`–3795): representations ↔ comodules through coefficient families, standard coaction eⱼ ↦ Σ eᵢ ⊗ Tᵢⱼ. Supports the coordinate/comodule dictionary; polynomiality of the powers is the multilinear consequence the README derives. |
| 1.2 | Fulton–Harris (6.1)–(6.2), printed p. 77 (`fulton-harris line 1996`–2016): Symᵈ and ⋀ᵈ as the extreme Young images with characters the complete and elementary symmetric polynomials; Theorem 6.3(1) (`line 2019`–2024): vanishing when the shape has more rows than dim V. |
| 2.2 | Fulton–Harris Theorem 6.3, pp. 77–78 (`line 2019`–2035), for the Schur functor as the image of the Young symmetrizer and its functoriality; SchurWeyl Layer 2 on main for the symmetrizer. The native carrier is `TauCeti.schurFunctor` = `weylFDRepOfShape ℂ` (`WeylModule/Basic.lean:504`). |
| 2.3 | SchurWeyl Layer 8 on main (`SchurWeyl/README.md:352–377`): commuting actions, image-level double centraliser, decomposition with the image Schur functor; its text defers the Weyl-module reading and the Schur character to ClassicalGroups, consistent with the ownership stated here. |
| 3.1 | Milne Theorem 12.12, pp. 234–235 (`line 9716`–9724): every representation of a diagonalizable group is the direct sum of its eigenspaces. The dual-number differential Check is recomputed below. |
| 3.2 | Macdonald Appendix A (8.2), printed p. 162 (`macdonald line 6353`–6355; char 0 at `line 5903`): polynomial irreducibles of GLₘ(k) are the R_λ with ℓ(λ) ≤ m. Fulton–Harris §15.5 and Proposition 15.47, pp. 231–232 (`line 5377`–5431): determinant twists, the common-shift relation, unique decreasing labels. |
| 3.3 | Fulton–Harris Theorem 6.3 and Proposition 15.47 as above; the Lean statement adds the native carriers and the rank-zero and rank-one cases named in the README. |
| 3.4 | Fulton–Harris §15.5 (`line 5415`–5425): two GL labels restrict to the same SL module iff they differ by a multiple of (1,…,1). |
| 3.5 | No locator is claimed; the section defers to Layer 3A, whose sources were read: Milne Proposition 10.31, p. 196 (`line 8168`–8178: Lie(Stab_G W) = Stab_𝔤 W, equality of dimensions iff the stabiliser is smooth) and Theorem 3.23, p. 71 (`line 3211`–3212: Cartier smoothness in characteristic zero). |
| 4.2 | Macdonald Appendix A (8.4), p. 163 (`line 6389`–6399): the character of R_λ is s_λ, by density of diagonalizable matrices; its proof is explicit that ℓ(λ) ≤ m (R02). The native Frobenius input `char_weylFDRepOfShape_diagramOf_diagonal_eq_sum_spechtChar` is at `WeylModule/SchurWeyl.lean:162` with the 1/d! factor the README mentions. |
| 4.3 | Macdonald I(3.1), p. 40 and (3.4)–(3.5), p. 41 (`line 1804`–1836); the Laurent form is the determinant twist of `char_rationalWeylFDRep` (`WeylModule/Rational.lean:214`). |
| 5.1 | Macdonald I§3 Examples 1 and 4, pp. 44–45 (`line 1955`–1991): specialisation of s_λ at xᵢ = 1 as a hook-content product; (8.4) as above for the representation character. |
| 6.1 | Molev Theorem 2.1, printed p. 8 (`molev line 315`–319): multiplicity-free glₙ ↓ glₙ₋₁ with the betweenness conditions (2.2); the source's λ are complex with integral differences, and the README's transport to integer rows and the determinant twist is stated. Native `Interlaces` (`GelfandTsetlin/Basic.lean:265`) is λᵢ₊₁ ≤ μᵢ ≤ λᵢ; `glBlockSucc` (`BlockSucc.lean`) is the upper-left block fixing the last basis vector. |
| 6.3 | Molev Remark 2.2, p. 9 (`line 368`–374): patterns of a partition ↔ semistandard tableaux with entries in {1,…,n}, row k the shape of entries ≤ k; matches `gtPatternEquivSSYT` (`GelfandTsetlin/Tableau.lean`). |
| 6.7 | Molev §4: (4.1) p. 48 (`line 2059`), (4.4) p. 48 (`line 2080`), (4.5)–(4.6) p. 49 (`line 2087`–2101, with the factor pᵢᵢ′ skipped and the right denominator πᵢ), Theorem 4.1 p. 49 (`line 2110`), the o₂ₙ₋₁ generators (`line 2116`–2117), (4.7)–(4.10) pp. 49–50 (`line 2125`–2148, including fᵢ = f′ᵢ − 1 = 2(Fᵢᵢ + n − i)), Theorem 4.2 p. 51 (`line 2159`), §4.3 p. 51 (`line 2164`–2168), Theorems 4.3–4.4 pp. 51–52 (`line 2186`, `2220`). Every operator, denominator and inequality the README restates is there. |

Also reread: Molev Theorem 2.3, p. 9 (`line 377`–400, formulas (2.5)–(2.7) with the skipped zero factor and the zero convention for non-patterns) and Proposition 2.4, p. 10 (`line 405`–410); Capelli (2.21)–(2.22), p. 16 (`line 673`–682: column-ordered determinant, central coefficients generating the centre, scalar (u + l₁)⋯(u + lₙ) with lᵢ = λᵢ − i + 1); type C ρᵢ = −i, fᵢ = Fᵢᵢ + ρᵢ (`line 1258`–1269), (3.10)–(3.12) pp. 31–32 with gᵢ = fᵢ + 1/2 and right evaluation (`line 1336`–1358), lᵢ, γᵢ (`line 1368`), (3.13), Lemma 3.4 and Theorem 3.5 pp. 33–34 (`line 1436`–1484, product from lₙ to γₙ − 1); Milne §2.10 pp. 42–43 (`line 2068`–2099) and Theorem 22.42 pp. 478–479 (`line 19859`–19877); Fulton–Harris §1.1 pp. 4–5 (`line 347`–375). No copied passage was found.

### The adversarial table

Every row was recomputed this round by exact rational arithmetic in a scratch script (Schur polynomials by tableau enumeration, Schur expansions by leading-term elimination, Weyl products, pattern counts, Molev's coefficients, Capelli polynomials, the Hodge star on an orthonormal basis, the SO₃ root operators, the C₂ interpolation nodes, the Layer 6A matrices), or by hand where marked.

| Statement | Instances | Values on each side / wrong model | Result |
| --- | --- | --- | --- |
| §0.1 standard, dual | diag(2,3); n = 0 | traces 5 and 1/2 + 1/3 = 5/6; empty module 0, zeroth power 1 | pass |
| §0.2 invariants | diag(2,1/2) on J; diag(−1,1) on I | AᵀJA = J, det 1; AᵀA = I, det −1 | pass (hand) |
| §0.3 coefficients | det⁻¹ at 2; trivial at 0 | 1/2; 1 | pass |
| §0.4 semisimplicity | GL₁ weights ±1; zero module; n = 0 | 2 = 1 + 1; empty sum; trivial group | pass |
| `rationalRep_isSemisimple` context | W = 0, n = 0 | zero module semisimple; every representation of the trivial group semisimple | pass |
| §1.1 tensor character | diag(2,3), d = 2; d = 0 | 25 = 5²; 1 | pass |
| §1.2 powers | (2,3): h₂, e₂, e₃ | 19, 6, 0 | pass |
| §1.3 splitting | (2,3); one variable 2 | 25 = 19 + 6; 4 = 4 + 0 | pass |
| §2.2 images | (2), (1,1) on ℂ²; (1,1) on ℂ; empty on 0 | 3, 1; 0 (empty tableau set); 1 | pass |
| §2.3 decomposition | n = 2, d = 3 | 8 = 4·1 + 2·2 + 0 | pass (hand) |
| §3.1 torus | GL₂ at diag(2,3); det⁻¹ | 2 + 3 = 5; 1/6 | pass |
| §3.1 differential | (1,−1) at diag(1+2ε,1+3ε) | (1+2ε)(1−3ε) = 1 − ε; derivative 2 − 3 = −1 | pass (hand) |
| §3.2 labels | (1,−1); (0,1); rank 0 | shift −1, shape (2), value 19/6; not antitone; one weight | pass |
| §3.3 classification | rank 1 weights −1, 0, 1 at 2; rank 0 | 1/2, 1, 2 distinct; one simple of dimension 1 | pass |
| `schurFunctor_iso_irreducible` | (2,1), n = 2; (1,1), n = 1 | detShift 1, shape (1,0), det ⊗ V of dimension 2 = 2; excluded by colLen ≤ n (module 0) | pass |
| §3.4 SL | (2,1), (1,0) at diag(2,1/2); at diag(2,3) | 5/2 = 5/2; 30 ≠ 5 | pass |
| §3.4 control | (1,0), (0,0) | restricted dimensions 2 ≠ 1 | pass |
| §3.5, 3A lattices | SO₃ weight 1; sl₂ weight 1; SO₂ weight −1 at 2 | 3; 2 (no descent); 1/2 | pass (hand) |
| 3A isotropic basis | u = e₁ + ie₂, v = (e₁ − ie₂)/2 | (u,u) = 0, (v,v) = 0, (u,v) = 1 | pass (hand) |
| 3A antidiagonal | diag(2,3); diag(i,1); diag(2,1/2) | A^R = diag(3,2), twice gives A; diag(1,i) not diag(1,−i); AA^R = I and AᵀJA = J, versus 6I and 6J | pass (hand) |
| 3A.2 fixed spaces | Sp₂ standard at diag(2,1/2); SO₃ root operator on ℂw; sign character of {±1}; Gₘ tᵖ in char 3 | 0 = 0; F₁₂w = u ≠ 0; Lie 1 ≠ group 0; 2³ = 2 ≠ 1 | pass (hand) |
| 3A.3 Hodge, dim 2 | ★e₁, ★e₂, ★u, ★v, ★²u | e₂, −e₁, −iu, iv, −u | pass |
| 3A.3 Hodge, dim 4 | ★(u₁∧u₂), ★(u₁∧v₂), ★★ on 2-forms | u₁∧u₂ (κ₂ = 1), −u₁∧v₂, +1 | pass |
| 3A.3 κ_r | r = 1..4 | −i, 1, −i, 1 | pass |
| 3A.3 primitive | Sp₄ ⋀² | 6 − 1 = 5 | pass (hand) |
| 3A monoid generation | D_r terminal coefficients; B_r last | a_{r−1} = λ_{r−1} − λ_r ≡ a_r = λ_{r−1} + λ_r mod 2; a_r = 2λ_r even | pass (hand) |
| §4.1 `schurFunctor_tensor_multiplicity` | s₍₁₎² in 2 and 1 variables | c = s₍₂₎ + s₍₁,₁₎; c = s₍₂₎ only, (1,1) absent on both sides | pass |
| §4.1 nontrivial multiplicity | s₍₂,₁₎·s₍₂,₁₎ in 3 variables | (4,2) + (4,1,1) + (3,3) + 2·(3,2,1) + (2,2,2); 27 + 10 + 10 + 2·8 + 1 = 64 = 8² | pass |
| §4.1 height bound | s₍₂,₁₎·s₍₁₎ in 3 vs 2 variables | (3,1) + (2,2) + (2,1,1) with 15 + 6 + 3 = 24; in 2 variables (2,1,1) drops and 8 + 1 = 9 = 3·3 | pass |
| §4.1 degenerate | n = 0, l = m = ∅; l ≠ ∅ | c = δ_∅, Hom(ℂ, ℂ⊗ℂ) = 1; product 0 forces c = 0, Hom into 0 is 0 | pass (hand) |
| §4.2 `schur_character` | (2,1) at (2,3); (1,1) one variable; empty, n = 0 | 30 = 6·5; 0 = 0; 1 = 1 | pass |
| §4.3 Laurent | (1,−1) at (2,3) | 19/6 | pass |
| §5.1 `rational_dimension` | (), (−1), (2,1), (2,1,0), (1,0,−1), (3,1,0) | 1, 1, 2, 8, 8, 15 = pattern counts 1, 1, 2, 8, 8, 15 = tableau counts (8, 15 checked); n = 0 junk sf(0 − 1) = sf 0 = 1 | pass |
| §6.1 `rationalWeyl_branching` | (2,1,0) → GL₂; (1,−1) → GL₁; n = 0 | (1,0),(1,1),(2,0),(2,1) of dimensions 2 + 1 + 3 + 2 = 8; −1, 0, 1 with trace 7/2; one empty summand | pass |
| §6.2 orthogonal | SO₃ 1 → SO₂; SO₄ (1,0) → SO₃; SO₅ → SO₃ fixing two; Sp₄ → Sp₂ | −1, 0, 1 (7/2); 3 + 1; 3 + 1 + 1; 2 + 1 + 1 | pass |
| §6.2 embedding | q = (u+v)/√2, w′ = i(u−v)/√2 | B(q,q) = 1, B(w′,w′) = 1, B(q,w′) = 0; (F_{ni} − F_{n′i})/√2 kills u_r + v_r and sends e_i to −iw′, so the norm-one generator is i times Molev's | pass (hand) |
| §6.4 coefficients | (2,1,0), middle (2,0) ↔ (2,1), bottom 1 | E₂₃ coefficient 1, E₃₂ coefficient 1/2, product 1/2; raising the middle 2 to 3 gives numerator 0 | pass |
| §6.6 Capelli | (−1); (2,1); (3,2); (1,0); rank 0 | u − 1; u² + 2u (versus u² + 3u + 2); u² + 4u + 3 = A₂(u+1); u² − 1 = A₂(u−1); no generator | pass |
| §6.7 SO₃ | basis (u,w,v), F_{ij} = E_{ij} − E_{j′i′} | F₂₁: u ↦ w ↦ −v ↦ 0; F₁₂ on (u,w,−v): 0, u, w; F₁₁ = diag(1,0,−1); torus trace 7/2 | pass |
| 6B dictionary | a = (1,0) ↔ source λ = (0,−1) | 0 ≥ ν₁ ≥ 0 ≥ ν₂ ≥ −1 and 0 ≥ ν₁ ≥ μ₁ ≥ ν₂: two ν over μ₁ = 0, one over μ₁ = −1; 2·1 + 1·2 = 4 | pass |
| 6B interpolation | λ = (0,−1): g = (−1/2, −5/2) | (0,1) at −5/2, (1,0) at −1/2; without the half shift (11/32, 21/32); square differences −2 for (0,0), −6 for (0,−1) | pass |
| 6B endpoint | Lemma 3.4 product | from lₙ to γₙ − 1, length νₙ − λₙ ≥ 0 | matches (hand) |
| 6A subgroups | T = I + E₁₂, D = diag(2,1) | TD ≠ DT; (T,T) ∈ Δ, (T,I) ∉; r(D,I) = 2, r(I,D) = 1/2, r(T,I) = 1, r(2I,I) = 4 | pass |
| 6A normal kernel | a = I, h = D, b = T | DTD⁻¹ = I + 2E₁₂ ≠ T | pass |
| 6A normaliser | h = b⁻¹a with hgh⁻¹ = c(g)g | trace of h(I+E₁₂)h⁻¹ forces c = 1, so h centralises SLₙ and is scalar | pass (hand) |
| 6A directions | H = Δ, H_det, r⁻¹(S¹), n = 2 | (N,N) ∈, (N,0) ∉; (N,0) ∈, (I,0) ∉ (ratio e²); (iI,0) ∈ with ratio e^{2it}, i·(iI,0) = (−I,0) has ratio e⁻² | pass (hand) |
| `connected_complex_overgroup` | n = 0, 1; the four groups | all four equal ⊤; H_det = Δ and H_sc = P; each is closed and connected (Δ ≅ G, H_sc ≅ G × ℂˣ, H_det ≅ SLₙ × G) | pass (hand) |
| 6A restriction | weights −1, 2 at (3,2); (3,3); scalar image of (3,2) | 4/3; 3; 3/2 = 2⁻¹·3 | pass |
| `scalarRestriction_exists_orderIso` | action of (ug,g) | u^a·(ρ(g)⊗σ(g)): same stable subspaces as Δ; n = 0 forces a = 0 or V = 0 | pass (hand) |
| restriction theorems | n = 0; GL generated by SL and scalars | one-dimensional, irreducible; SL × SL ≤ H_det and Burnside on V ⊗ W | pass (hand) |

### Library declarations and ownership at the pins

Every file-and-line the README quotes was opened at Tau Ceti `a91d3aaf`: `IsRationalRep.isInternal_weightSpace` (`Weight/Decomposition.lean:233`), `char_tensorPowerRep` (`TensorPower.lean:198`), `char_extPowerRep_diagonal` (`ExteriorPower.lean:138`), `GTPattern.card_topRow_eq_weylDimension` (`GelfandTsetlin/Dimension.lean:187`), `weylModuleOfShape_eq_bot_iff` (`WeylModule/Basic.lean:472`), `tensorSquareRepEquiv` (`Decomposition.lean:49`), the one-row and one-column characters (`WeylModule/Character.lean:93, 132`), the Specht-character sum (`WeylModule/SchurWeyl.lean:162`), `char_rationalWeylFDRep` (`WeylModule/Rational.lean:214`), `eval_one_diagramSchurPoly_eq_card_boundedSSYT` (`Schur/Basic.lean:214`), `card_gtPattern_topRow_eq_card_ssyt` (`GelfandTsetlin/Tableau.lean:453`), `weylDimension_shift` (`WeylDimension/Basic.lean:256`), `hsymm_mul_diagramSchurPoly` (`Schur/Pieri.lean:231`), `IsPolynomialRep` and `IsRationalRep` (`Rational.lean:118, 139`). Definitions read: `DominantWeight` (`DominantWeight.lean:87`, antitone `Fin n → ℤ`), `detShift` and `detShiftShape` (`:117, :257`), `weightOfShape` (`:204`), `weylDimension` (`WeylDimension/Basic.lean:182`, numerator over superfactorial), `diagramSchurPoly` (`Schur/Basic.lean:174`, sum over bounded tableaux), `schurFunctor` (`WeylModule/Basic.lean:504`), `rationalWeylFDRep` (`WeylModule/Rational.lean:172`) with `simple_rationalWeylFDRep` (`:198`), `Interlaces` (`GelfandTsetlin/Basic.lean:265`), `GTPattern` and `topRow` (`:92, :196`), `expUnit` (`Exponential/Units/Basic.lean:59`), `glBlockSucc` (`BlockSucc.lean`). Also found: `slIdeal_le_or_le_center`, `isCompl_center_derivedSeries_one_matrix`, `normedAlgebraRatOfReal`, the `GeneralLinear.UpperTriangular` and `SpecialLinear.UpperTriangular` namespaces, `gtPatternEquivSSYT`, `BoundedSSYT.fiberEquiv`, `youngSymmetrizerOver`, `PiTensorProduct.reindexRepresentation`, `permTensorAction`, `rationalWeylSLRep` (`WeylModule/SpecialLinear.lean:92`). Tau Ceti's `Branching.lean` proves only the standard-module splitting along `glBlockSucc`; no pinned declaration states the general branching, the Schur character, the Weyl dimension of the rational Weyl module, or semisimplicity of rational representations, so the headlines are not duplicates.

At Mathlib `6b7abb3c`: `Matrix.J` (`SymplecticGroup.lean:58`) and the symplectic condition; `Matrix.orthogonalGroup` is `unitaryGroup` under the trivial star (`UnitaryGroup.lean:289–293`), so the README's "trivial star" remark is right; `exteriorPower.hodgeStar` and `exteriorPower_hodgeStar_eq_wedgePairing` (`HodgeStar.lean:48, 53`); `Subgroup.goursatFst` and `normal_goursatFst` (`GroupTheory/Goursat.lean:43, 66`); `GeneralLinearGroup.center_eq_range_scalar` and `scalar_commute`, `SpecialLinearGroup.toGLKerEquiv`, `Matrix.ProjGenLinGroup`, `diagonal_transvection_induction_of_det_ne_zero`, `SpecialLinearGroup.diagonal_transvection_induction'`, `symplecticGroup.symJ`, `symplectic_det`, `UnitaryGroup.embeddingGL`, `SemistandardYoungTableau.highestWeight`, `esymmPart`, `esymmAlgEquiv`, `IsSymmetricAlgebra`, `Representation.char_one`, `Representation.IntertwiningMap`, `Representation.tprod`, `Representation.directSum`, `Representation.Equiv`.

Cross-roadmap citations resolved this round, on main (`a75b986`) unless noted: SchurWeyl Layers 0–2, 7 (`SchurWeyl/README.md:323–351`) and 8 (`:352–377`); ReductiveGroups Layers 0–3 (`:129–248`), 3A (`:249`), 5P (`:460`), 6 (`:466`), 7 (`:627`), §10D (`:1850`); LieHighestWeight Layers 2–6 (`:370–869`) and 9 (`:1432`); RootSystems Layers 1–4 and 6 (`:218–390`); LieGroups Layers 0–4 with the Layer 2 anchor `layer-2-the-closed-subgroup-cartan-theorem` (`LieGroups/README.md:233–357`); SemisimpleAlgebras Layers 1 and 3 (`:186, :233`); SpinRepresentations Layers 2–5 and `SpinHighestWeights` (`:427–838`, `:781`), which consumes ClassicalGroups only for the standard module and orthogonal group (`:48`); ClassicalGroupsPartII at its head (GSp similitudes, consumes Layers 0–5 here by anchors that still match this head's headings); TensorProductCombinatorics at its head (`:330–350`), whose two declared gaps on ClassicalGroups ask for exactly Layer 6A's four-group classification with the Goursat order isomorphism and the three restriction statements, and whose §2.3 combines SchurWeyl's LR rule with Layer 4's coefficient identification, as this head provides. The mutual citation with LieHighestWeight is acyclic at the layer level: its Precursor to Layer 6 (`:608–620`) and Layers 6F and 9 consume Layers 3, 4 and 6.1 here, none of which uses LieHighestWeight Layers 3–6 (§3.2 uses Layer 2 for the lattice only), while Layers 3A, 4.3, 5.1 (SO/Sp) and 6.2 here consume LieHighestWeight Layers 2–6, whose Layer 6 is proved by the Freudenthal–Casimir route independent of the precursor (`:622–624`). No other roadmap owns the diagonal-overgroup classification, the Capelli generators, the Mickelsson operators or the antidiagonal comparison; `roadmaps grep` over the open heads finds the acceptance names only in this pull request and in main's copy of the same roadmap. Ownership against open pull requests was checked only in the checkouts this brief lists.

### Headline inventory

| README headline | In `Suggested.lean` |
| --- | --- |
| Complete reducibility (§0.4) | `rationalRep_isSemisimple` |
| Unique GL classification and Schur identification (§3.3) | `rational_irreducible_classification`, `schurFunctor_iso_irreducible` |
| Schur characters, tensor multiplicities and the Weyl dimension (§§4.1, 4.2, 5.1) | `schur_character`, `schurFunctor_tensor_multiplicity`, `rational_dimension` |
| GL branching (§6.1) | `rationalWeyl_branching` |
| Diagonal overgroups and restrictions (Layer 6A) | `connected_complex_overgroup`, `scalarRestriction_exists_orderIso`, `restrict_specialLinear_irreducible`, `external_determinantEqual_irreducible` |
| SO/Sp classification, characters and branching; GT bases and Capelli action; symplectic multiplicity vectors; the group/Lie bridge | named in the module docstring as not statable, each with its missing carrier (rational SO/Sp models, differentiated actions, Mickelsson operators, the bundled action/differentiation interface): correct |
| SL exhaustion (§3.4) and the GT dimension formula (§6.5) | corollaries, not headlines: the first needs no new carrier beyond the GL classification and scalar generation, the second is `rational_dimension` composed with the native pattern count |

## Not verifiable

- **Fulton–Harris beyond Lecture 20:** the cached institutional OCR scan ends there; every page the README cites (4–5, 77–78, 231–232) is inside it and was read, through OCR noise.
- **Goodman–Wallach, Weyl (1939), Procesi (2007):** broad references without claim-level locators; no legal readable copy is in the cache and none was sought, since no statement depends on them alone.
- **Universal statements:** the computed rows and the admitted elaborations certify instances and signatures, not proofs of the targets.

## Source issues

- **Misprint** in milne2022 at §2.10(b), printed p. 42 (`milne line 2088`): the source writes the last cross-term of the odd orthogonal form with the same index pair twice; it should pair xₙ with y₂ₙ and x₂ₙ with yₙ as the displayed Gram matrix does; affects a stated result.
- **Misprint** in milne2022 at §2.10(c), printed p. 42 (`milne line 2096`): the source places the symplectic matrices in GLₙ(R); it should be GL₂ₙ(R), the size of the displayed matrix; affects a stated result.
- **Misprint** in molev2002 at §3 introduction, printed p. 28 (`molev line 1191`): the source describes the multiplicity space by glₙ₋₁-highest vectors; it should say gₙ₋₁-highest vectors for the chosen orthogonal or symplectic subalgebra; affects a stated result.
