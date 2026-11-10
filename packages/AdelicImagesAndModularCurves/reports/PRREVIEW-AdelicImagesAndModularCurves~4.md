# Review of AdelicImagesAndModularCurves (pull request #1727 at d3857c3)

**Verdict:** needs changes

## R01 (P2) — 3.3: isogenous CM curves need not have commensurable images

Location: `README.md:1517–1519`, “for an isogeny `φ` the images of `E` and `E'` are commensurable: `ρ_{E'}(G_K) ∩ ρ_E(G_K)` has finite index in both (3.2's `A` normalises an open subgroup)”.

Claim: for every `K`-isogeny, members of the two image classes meet in a subgroup of finite index in both.

Witness: `y² = x³ − x` (`End = ℤ[i]`) is 2-isogenous over `ℚ` to `y² = x³ − 11x − 14` (`j = 287496`, `End = ℤ[2i]`). The 2-adic images have integral spans `ℤ₂[i]` and `ℤ₂[2i]`. These rings are not isomorphic, so no `GL₂(ℤ₂)`-conjugates meet in finite index.

Why the witness works: if `U` is open in `ρ_E(G_K)` and `U ⊆ g ρ_{E'}(G_K) g⁻¹`, then both groups span the same `ℚ₂`-algebra. That algebra's intersection with `M₂(ℤ₂)` is then `ℤ₂[i]` (a DVR) and also `g ℤ₂[2i] g⁻¹` (not integrally closed), which is impossible. The given reason also fails here: `A` conjugates an open subgroup of `GL₂(Ẑ)` into `GL₂(Ẑ)`, but CM images are not open.

Repair: replace the sentence with the following.
- `ρ_{E'} = A ρ_E A⁻¹` with `A ∈ GL₂(𝔸_f)` the matrix of `T̂φ`, so the two classes are `GL₂(𝔸_f)`-conjugate.
- Members of the two classes are commensurable when `E` has no CM (both images are open, 4.4).
- For CM curves they are commensurable exactly when `End(E_K̄) ≅ End(E'_K̄)`. In `𝒪 ⊗ ẑ`-adapted frames `A` is then multiplication by an element of `(K ⊗ 𝔸_f)ˣ`, and the two images agree on `G_{KF}`.
- Add the pair above as a negative-control Check.

## R02 (P2) — 6.4: the explicit models of `X₁(N)` and `X₀(N)` are passed between this roadmap and CanonicalModelsAndGonality

Location: `README.md:2529`, “The explicit models of `X₁(N)` and `X₀(N)` are CMG's”; `435–436`, “models of `X_H` (the explicit models of the curves `X₁(N)` and `X₀(N)` used in 6.4)”; `121`, “no milestone of this roadmap names a model”.

Claim: CanonicalModelsAndGonality supplies the models on which the routes of 6.4 step 3 run:
- Weierstrass models of `X₁(14)` and `X₁(15)`;
- sextic models of `X₁(16)` and `X₁(18)`;
- `X₀(21)`, and `X₀(27) ≅ y² + y = x³ − 7`.

Witness: CanonicalModelsAndGonality's README (head of its pull request, lines 142–151) assigns the modular-curve dictionary to this roadmap. It supplies only curve-level machinery: “the sibling instantiates them at `X_H` and proves the statements that mention `H`”. Its README contains no model of any `X₁(N)` or `X₀(N)`.

Line 121 also contradicts 6.4 itself, which names `y² + y = x³ − 7` and the Fermat cubic.

Repair:
- In 6.4 step 3, own one target per curve. Each target identifies the modular curve with an explicit equation: `X₁(14)`, `X₁(15)`, `X₁(16)`, `X₁(18)`, `X₀(21)`, `X₀(27)`.
- Build these targets on CMG Layers 2 and 9 (model data, complete models, closed immersions) and on the Tate normal form of step 4.
- Delete the sentence at line 2529 and the parenthesis at lines 435–436.
- Restrict line 121 to the LMFDB's stored models.
- At `N = 16, 18` use R03's point lists.

## R03 (P2) — `X₁(16)(ℚ)` and `X₁(18)(ℚ)` have a second, earlier owner by contract

Location: `README.md:2533–2547`, the `N ∈ {16, 18}` route of 6.4 step 3, owned here; `README.md:103–104`, “including the rational points of the curves `X₁(N)` of composite level that the chain needs”.

Claim: this roadmap is the owner of the rational points of `X₁(16)` and `X₁(18)`.

Witness: ArithmeticDynamics (head of its pull request, README lines 263 and 267) declares two gaps on EffectiveDiophantineMethods:
- `gap:x1-16-rational-points`: the complete point list of `v² = u(u² + 1)(1 + 2u − u²)`, a model of `X₁(16)`;
- `gap:x1-18-rational-points`: the complete point list of `y² = x⁶ + 2x⁵ + 5x⁴ + 10x³ + 10x² + 4x + 1`, a model of `X₁(18)`.

Both roadmaps precede this one in the merge order (positions 339 and 177, against 357).

Repair:
- Under the EffectiveDiophantineMethods supplier subsection, consume both contracts by their slugs: “What EffectiveDiophantineMethods must provide (gap:x1-16-rational-points): …”, and likewise for `gap:x1-18-rational-points`.
- Own here only the identification of these two curves with `X₁(16)` and `X₁(18)` (R02) and the reading of their points as cusps.
- Drop the `x − T` descent route for `N = 16, 18`.
- Name both slugs in the description's gap paragraph.

## R04 (P3) — 3.4: the Serre weight and conductor are cited to sections that do not state them

Location: `README.md:1584–1586`, “are AGR's (its §3.5 Artin conductor and its Layer 4 weight recipe for two-dimensional residual representations)”; also `1591`, “*Needs:* … AGR §3.5, Layer 4”, and `1721`.

Claim: ArithmeticGaloisRepresentations §3.5 and Layer 4 supply `N(ρ̄)` and `k(ρ̄)`.

Witness: in that README (its open head):
- §3.5 is “Induction and the conductor–discriminant formula” (line 2959).
- `N(ρ̄)` is defined in §3.3 (line 2898).
- Layer 4 (lines 3119–3420) never mentions a weight.
- Serre's weight recipe is AlgebraicModularFormsAndSerreWeights Layer 4, “The local Serre weight” (§§4.1–4.3, its line 955).

Repair:
- Cite AGR §3.3 for `N(ρ̄)`.
- Cite AlgebraicModularFormsAndSerreWeights §§4.1–4.3 for `k(ρ̄)`. That roadmap is position 99 in the merge order, so the citation is not upward.
- Add it to the supplier contracts.
- Correct both *Needs:* lines and rerun the dependency check.

## R05 (P3) — 5.4: a step in the route for Bourdon–Ejder–Liu–Odumodu–Viray Theorem 1.1 is false over `ℚ(j(E)) ≠ ℚ`

Location: `README.md:2176–2177`, “and the prime-to-`m` part is all of `GL₂`; so `deg x = deg f · deg f(x)`”.

Claim: the image of `G_{ℚ(j(E))}` in `∏_{ℓ∤m} GL₂(ℤ_ℓ)` is the whole product.

Witness: take `k = ℚ(√65)`.
- Since `√65 ∈ ℚ(ζ₆₅)`, the pair `(χ₅, χ₁₃)(G_k)` has index 2 in `ℤ₅ˣ × ℤ₁₃ˣ`, although each `χ_ℓ(G_k)` is all of `ℤ_ℓˣ`.
- So a curve with surjective 5- and 13-adic images has a joint image of index 2.
- The step also skips any entanglement between the `m`-part and the prime-to-`m` part of the image.

Repair: replace the sentence by the source's input. Bourdon–Ejder–Liu–Odumodu–Viray Theorem 5.1, p. 14 (belov2019 lines 645–650) states:
- hypothesis: `im ρ_{E,m^∞} = π⁻¹(im ρ_{E,M})`;
- conclusion: `deg x = deg f · deg f(x)`.

Cite it, with Corollary 5.3 (lines 661–668), as the step.

## R06 (P3) — Names and locators

Each bullet gives the location, the witness, then the repair.

- **CanonicalModelsAndGonality model locator.**
  - Location: line 119 cites that roadmap's “2.5, 9.3” for the complete model.
  - Witness: its §9.3 is “Gonality under good reduction”; its own line 145 cites §§2.5 and 9.1.
  - Repair: cite §§2.5 and 9.1.
- **`Subgroup.AlmostConjugateOfFiniteIndex`.**
  - Location: lines 453 and 1347, and `Suggested.lean:303`.
  - Witness: FiniteGroupInvariants declares `AlmostConjugateOfFiniteIndex` in namespace `TauCetiRoadmap.FiniteGroupInvariants` (its `Suggested.lean:479`). Its README never writes a `Subgroup.` prefix.
  - Repair: use its name.
- **`Subgroup.AlmostConjugate`.**
  - Location: lines 453, 529, 1342, 1369 and `Suggested.lean:305` write “Tau Ceti main … cited in prose”.
  - Witness: it is a pinned declaration (`TauCeti/GroupTheory/AlmostConjugate.lean:92`).
  - Repair: list it under “From Tau Ceti” with module `TauCeti.GroupTheory.AlmostConjugate`, and drop “main” and “cited in prose”.
- **Bourdon–Ejder–Liu–Odumodu–Viray, Theorem 4.3.**
  - Location: line 2128 gives “p. 12”, while the References cite Adv. Math. 357.
  - Witness: p. 12 is the page in arXiv:1808.04520v2 (belov2019 line 496).
  - Repair: name that version as the one cited, and add Theorem 4.3 to the reference entry.

## Verified sound

**The previous review's findings (at 4f0c5ff): 9 of 9 repaired.**

| Previous | Status | Passage at this head |
|---|---|---|
| R01 Serre open image absent | repaired | `Suggested.lean:345` `exists_index_eq_two_range_le_rat`, `:361` `exists_surjective_tateModuleGaloisRepresentation`, `:373` `finiteIndex_range_pi_tateModuleGaloisRepresentation`, `:385/402` `endCommutant`, `finiteIndex_range_pi_subgroupOf_endCommutant`; docstring `:30–34`; README 1646, 1803–1805, 1869–1872, 1927–1933 |
| R02 push-forward unowned | repaired | 5.4 l.2119–2143 (Theorem 4.3 owned, route through Tau Ceti `Divisor.conorm`, CMG §§1.6, 7.2–7.3); level reduction l.2165–2167; negative control l.2187–2190; scope l.95–96, 2893–2894 |
| R03 padding `congruenceSubgroup_gamma0` | repaired | deleted; l.785 “follows from the definitions by `simp` and is the Bridge Check below” |
| R04 unused imports | repaired | each of the 7 `TauCeti.*` imports supplies a declaration the file uses (dropping `ZHat.Units`, `TateModule.Galois` or `Hom.ComplexMultiplication` gives 9, 5 and 4 errors; the other four are also reached transitively, but their declarations are used directly) |
| R05 locators, link, attribution | repaired | MF §10A l.359–361, 459; MF §8.2 l.363; link l.39; `CMAction`, `HasGeometricCM`, `GeometricEnd` under “From Tau Ceti” l.306–312; no “10B” or “8G” remains |
| R06 route steps | repaired | 4.4 step 1 cites 2.4 step 2 (l.1830); step 3 drops “perfect” (l.1850–1852); 4.5 `U_m` of the unit ideles of `KF` (l.1906); 6.4 sextic model and units (l.2536–2547) |
| R07 `m_f`, torsion growth list | repaired | l.2315–2321 (generalised eigenspace of a single newform); l.1683–1685 “do not exclude … that primitive growth occurs in each of them is the knowl's data” |
| R08 5.9 Checks | repaired | `X₀(22)` l.2359–2362, `X₀(23)` l.2363–2367 |
| R09 gaps in the description | repaired | the description's “Supplier gaps” paragraph names both slugs, suppliers and `needs` |

**Gate and dependency check.**
- The gate, rerun at this head, prints “OK” with every count `0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check printed `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- CanonicalModelsAndGonality, FiniteGroupInvariants and SatoTateGroups are open roadmaps not yet in the merge order. The description's depends-on block names all three.
- Consumers: ModularIwasawaMainConjectures cites §2.2 (its l.21, 171, 1295) and KatoEulerSystems cites §4.3 (its l.54, 96, 457, 1927). Both are later in the merge order (375, 358), so there is no cycle.
- CanonicalModelsAndGonality (its l.148, 2038–2041), SatoTateGroups (its l.148, 428, 2833) and HyperellipticCurves (its l.117, 179) all name this roadmap only as a consumer.

**Lean.**
- `lake env lean Suggested.lean` gives 25 `sorry` warnings and nothing else.
- I elaborated `#check @name` for all 44 declarations in one scratch file and compared each type with its README statement. None needed a change:
  - `adelicTateModule` omits `[CharZero F] [IsSepClosed K]`; the carrier needs neither, and `finrank_adelicTateModule` carries both.
  - The three Layer 4 theorems take `F : Type*`, `[NumberField F]` and `¬ W.HasGeometricCM` or `W.HasGeometricCM` (Tau Ceti: geometric over `SeparableClosure F`).
- One-tactic probes on a scratch copy; none closed its goal:
  - `simp [IsFullDet]` on `isFullDet_Gamma0Zhat`;
  - `simp` on `genus_eq_of_isTwist`;
  - `simp [GSp4]` on `card_GSp4_zmod`;
  - `exact?` on `isCongruenceSubgroup_congruenceSubgroup`, `red_surjective`, `exists_Gamma_le`, `mem_commutator_iff`, `exists_index_eq_two_range_le_rat` and `card_GL2_zmod`.
- `exists_index_eq_two_range_le_rat` allows an abstract index-two subgroup `H`, but this loses nothing against Serre. `det` is onto `ẑˣ` over `ℚ`, and `GL₂(Ẑ)^ab = ẑˣ × {±1}` (2.4). So an index-two subgroup containing the image is the graph of a character, and the graph is closed because the image is compact; the character is therefore continuous and `H` is open.
- `endCommutant` is not degenerate: for `y² = x³ − x` it is `∏_ℓ ℤ_ℓ[i]ˣ`. Since its range is not `⊥`, the CM theorem is not vacuous.
- Fully qualified names: the namespace `TauCetiRoadmap.AdelicImagesAndModularCurves` occurs in no other roadmap's Lean file (`roadmaps grep`).

**Headline theorems.**
- Stated in `Suggested.lean`:
  - `GL₂(Ẑ)` as an inverse limit;
  - level, `±H`, `Γ_H`, strong approximation, density;
  - Serre's lifting lemma, both forms;
  - the commutator subgroup;
  - twist and Gassmann invariance;
  - the rank of `T̂E`;
  - the index-two obstruction;
  - Serre's open image theorem: almost all `ℓ`, adelic finite index, and the CM counterpart;
  - Mazur's torsion theorem with realisation;
  - Kenku's class sizes;
  - `|GSp₄(𝔽_ℓ)|`.
- Named in the docstring as not statable, with the missing carrier:
  - the image as a class in `GL₂(Ẑ)` (a frame);
  - everything on `X_H` (the coarse curve);
  - the `X₀(N)` dictionary;
  - genus-two images (the Jacobian);
  - Mitchell's classification.
- No padding found.

**Adversarial pass.**

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.1 `card_GL2_zmod` | N = 1, 2, 3, 5, 9, 12, 25, 74 (script) | product formula = LMFDB form = 1, 6, 48, 480, 3888, 4608, 300000, 10933056 | holds |
| 0.1 `red` at `n = 0` | `ZMod 0 = ℤ` | `GL₂(ℤ)` infinite discrete; indexing by `ℕ+` excludes it | holds |
| 0.1 `exists_red_eq` | n = 1 | `GL₂(ZMod 1)` is a singleton; compatibility assumed for `n ∣ m` only | holds |
| 0.2 level of `±H` | `{g ∈ Γ(2) : g₁₁ ≡ 1 mod 4}` | `−I ↦ A = I`, `A₁₁ = 1`; levels 4 and 2 | holds |
| 0.2 `level (H ⊓ H')` | `Γ₀(4) ⊓ Γ₀(6)` | `Γ₀(12)`: 12 = lcm, against product 24 | holds |
| 0.3 exceptional preimages | `G_{A₄}(5)`, `G_{S₄}(13)` | order 48, index 480/48 = 10, det `{1,4}`, PSL₂-index 120/24 = 5; `13 ≡ −3 mod 8`, 2184/24 = 91 | holds |
| 0.3 Cartans | `N = 15` | `|C_ns| = 225·(8/9)(24/25) = 192`, `|C_s| = 8² = 64` | holds |
| 0.4 `pslIndex_eq_index_pm` | `Γ(3)`; `Γ₀(9)` | 12 ≠ 24 without full det; 12 = 12 | hypothesis needed |
| 1.1–1.2 coset model (script) | `Γ₀(2)`, `Γ₀(11)`, `Γ₀(13)`, `Γ₀(26)` | (3,1,0,{1,2},0); (12,0,0,{1,11},1); (14,2,2,{1,13},0); (42,2,0,{1,2,13,26},2) | holds |
| 1.3 cusp fields | `Γ₀(9)`, `Γ₀(16)`, `Γ₀(20)` (script) | widths {1,1,1,9}, {1,1,1,1,4,16}, {1,1,4,5,5,20}; `gcd(c, N/c) ≤ 2` test | holds |
| 2.1 orders | p = 5; p = 2 | 16 < 20 < 24; 1 < 2 < 3 | holds |
| 2.2 lifting route | ℓ = 5; ℓ = 3 | `c = 10 ≡ 0`, fifth power `[[1,5],[0,1]]`; `[[1,1],[−3,−2]]³ = I` in `SL₂(ℤ)` | holds |
| 2.3 entanglement | `S_{−3}`; `S_{−4}`; `S_χ`, odd conductor | projections full, level 6, index 2; index 1; index 2 | holds |
| 2.4 `mem_commutator_iff` | `T`; `[s, t]`; `S_1` | `red 2 T ^ 3 = T ≠ 1`, `ε(T) = −1`; `[[1,−1],[1,0]]` of order 3 mod 2; invariants (2, 0, 2, {2}, 0) | holds |
| 3.3 commensurability | `y² = x³ − x` → `y² = x³ − 11x − 14` | integral spans `ℤ₂[i]` against `ℤ₂[2i]`; Vélu on `x(x² + 3x + 2)` gives `x(x² − 6x + 1) ≅ x³ − 11x − 14`, `j = 287496` | **false (R01)** |
| 3.3 determinant | `K = ℚ`; `K = ℚ(ζ₃)` | `det` image `ẑˣ`; index 2 | holds |
| 3.5 Lean, Prop. 22 | serre1972 lines 2042–2063 (p. 310) | `H = {a : ε(a₂) = α(det a_m)}`, open, index 2 | holds |
| 4.1 generation | ℓ = 5, `b = c = 5` | `L(c)U(b)L(−c/u)U(−ub) = diag(1/26, 26)`, `26 ≡ 1 mod 25` | holds |
| 4.2 ℓ-adic openness | NEI §4.0 (its l.1921); `121.b2` | hypotheses `End_F̄ = ℤ`, every `p`; image in `N_𝒪(ℤ_ℓ)` of infinite index | holds; non-CM needed |
| 4.3 Lean | `y² = x³ − x`, `ℓ ≡ 1 mod 4`; `K = ℚ(ζ₇)` | image in a split Cartan normaliser; `ρ̄_7 ⊆ SL₂(𝔽₇)` | hypotheses needed |
| 4.4 step 3 | ℓ' < ℓ₀ ≤ ℓ | `ℓ ∤ ℓ'^a(ℓ'² − 1)` since `ℓ' + 1 < ℓ` | holds |
| 4.5 `endCommutant` | `y² = x³ − x` over `ℚ` | `∏ ℤ_ℓ[i]ˣ`, infinite; range ∩ it = `ρ(G_{ℚ(i)})`, index 2 | holds |
| 5.1 components | `X(5)`; `det⁻¹(ker mod 3)` | 4 × 60 = 240 = 480/2; 2 components, degree 2 | holds |
| 5.2 fine case | `Γ₁(3)`; `32.a3`, `32.a4` | `diag(1,−1)` fixes `e₁`, `diag(−1,1)` fixes `e₂`; `(2,4)`: 8 + 8 = 16 | holds |
| 5.3 `C_ns⁺(13)` | the 13 discriminants | `(D/13) = −1` exactly for −7, −8, −11, −19, −28, −67, −163 | holds |
| 5.4 push-forward | BELOV Theorem 4.3 (line 497); cusp ∞ of `X₀(11)` | three parts match; `1 ≠ 12 · 1` | holds |
| 5.4 CM bullet | Abramovich via CMG §8.6 | `4(ℓ − 1) < (7/1600)(ℓ² − 1)` iff ℓ ≥ 914 | holds for large ℓ |
| 5.4 Theorem 1.1 route | `k = ℚ(√65)` | `(χ₅, χ₁₃)(G_k)` of index 2, each factor onto | **step false (R05)** |
| 5.5 fibre product | `Γ₀(2) ∩ Γ₀(3)`; the twisted fibre product | 3·4 = 12 = ψ(6); 24 ≠ 12 | holds |
| 5.7 twists | `⊤`, `det⁻¹(ker mod 3)` over `ℚ(ζ₃)` | 1 against 2 components | holds |
| 5.9 decomposition | `X₀(22)`, `X₀(23)` (script) | (36,0,0,4 cusps,g 2), `m_f = 2`, conductor 121 against 11; (24,0,0,2,g 2), `m_f = 1`, 529 against 23 | holds |
| 6.4 step 2 | {2,3,5,7}-smooth n < 400 (script) | minimal excluded {14,15,16,18,20,21,24,25,27,35,49}; Kenku keeps {14,15,16,18,21,25,27}, has 26 values | holds |
| 6.4 `ℤ/2 × ℤ/2n` | `φ̂(E'[2]) = ⟨T⟩ ⊄ ⟨P⟩` | composite of degree `4n ∈ {20, 24}`, cyclic | holds |
| 6.4 `X₀(27)` | `(3, 4)` | `(12, 36)`, `36² = 1728 − 432`; `u³ + v³ = (432 + Y²)/X³ = 1` | holds |
| 6.4 composite-level inputs | CMG l.142–151; ArithmeticDynamics l.263, 267 | models handed back and forth; point lists contracted to ED | **no single owner (R02, R03)** |
| 6.4 `mazur_torsion` | `ℤ/16`, `(ℤ/2)³`, trivial | orders 16, 8 in the list but groups not; `ZMod 1` | holds |
| 6.5 class sizes | trees; 10-vertex 2-tree | {1,2,3,4,6,8}; 20, 22, 24, 26, 28, 30, 33, 35, 36, 45, 50, 54 ∉ Kenku; 6 = ψ(4) cyclic subgroups give scalars, det 1 | holds |
| 6.6 `N ∣ adelicLevel` | ℓ^k, j < k | `ℓ^j(ℤ/ℓ^k)² ≅ (ℤ/ℓ^{k−j})²` not cyclic; EM2 §6.0f `B(1,0) = 10⁷·985²` | holds |
| 7.1 `card_GSp4_zmod` | ℓ = 2, 3, 5 (script); `diag(1,1,u,u)` | 720, 103680, 37440000; `gJgᵀ = uJ` | holds |
| 7.2 two-torsion | `deg f = 5` | image ⊆ point stabiliser `S₅`, index 6 in `S₆ ≅ Sp₄(𝔽₂)` | holds |
| 7.3 Mitchell, ℓ = 5 | `|Sp₄(𝔽₅)| = 9360000` | indices 325, 300, 9750, 6500 | holds |
| 3.4 Serre invariants | AGR §3.5 (l.2959), Layer 4 | no conductor definition and no weight there | **wrong supplier (R04)** |
| `level_index_genus_of_almostConjugate` | `Γ₁(3)` against `±[[1,b],[0,1]]` | `−I` fixes 0 and 8 cosets; level 3, index 8 both | hypothesis discriminates |
| `finrank_adelicTateModule` | `y² = x³ + 1` over `𝔽̄₅` | `T₅ = 0`; signature carries `[CharZero F]` | holds |

**Source sample.** These are the seeded targets plus every external locator they rest on.

| Target | Opened | Result |
|---|---|---|
| 0.1 | Tau Ceti `zHat.ext_of_toZMod` (`ZHat/ZMod.lean:207`), `existsUnique_forall_toZMod_eq` (:250), `exists_monoidHom_mk_eq_toZMod` (:172), `isUnit_iff_toZMod` (`Units.lean:61`) | agrees |
| 0.3 | MC2 §3.8 (l.1111); AGR §§4.2–4.4 (l.3171–3289) | agrees |
| 2.1 | AGR §4.2 (l.3171) | agrees |
| 2.3 | no external source; computed above | holds |
| 2.4 | serre1972 §5.5, Prop. 22, p. 310 (lines 2042–2063) | agrees; Zywina 2010 not readable |
| 3.3 | Tau Ceti `ClosedSubgroupConjClasses`; AGR §6.4 (l.4330–4346) | agrees, except R01 |
| 4.2 | NEI §4.0 (l.1917–1924); serre1972 Théorème 3, p. 299 (line 1618, citing MG p. IV-19 at line 1622) | agrees |
| 5.1 | MC2 §5.10 (l.1836, degree `[GL₂(Ẑ) : ±H]`), §5.12 (l.1872), §§6.1, 6.3, 8.3 | agrees |
| 5.2 | MC2 §9.7 (l.2728: `−I ∈ H̄`, `j ∉ {0, 1728}` for the converse) | agrees |
| 5.5 | MC2 §§3.12, 5.16 | agrees |
| 5.7 | MC2 §§5.12, 5.14 | agrees |
| 5.9 | MC2 §§16.2 (l.4120), 16.3 (l.4139); MF §4.1 (main l.672), §8.2 (l.971) | agrees; Chen 1998 and de Smit–Edixhoven not readable |
| 6.6 | EM2 §6.0f (its l.146, 820) | agrees. EM2's heading at its l.818 reads “The split-Cartan rational-point theorem” over the isogeny-bound body; that heading is EM2's to correct. |
| 7.1 | AGR §7.3 (l.4614: `J_{2m} = −Matrix.J`, both conventions equal) | agrees |
| 7.2 | serre1986 §2.3, Théorème 3, p. 97 (lines 59–65); AGR §§6, 7.5 | agrees. The previous review's erratum on line 62 (“K-endomorphisms”) is withdrawn: it is a text-extraction artifact, since the same extraction also drops the bar from `K̄` at line 14. |
| also | serre1972 Théorème 2, p. 294 (line 1414), Théorème 5 and Corollary, p. 302 (lines 1709–1727); belov2019 Theorem 1.1 (lines 51–55), Theorem 4.3 (lines 497–501), Theorem 5.1 and Corollary 5.3 (lines 645–668) | agree, except R05 and R06 |

**Pinned declarations opened.**
- Mathlib (22):
  - `ModularForm.L` (`NumberTheory/ModularForms/LFunction.lean:151`)
  - `NumberField.Units.rank` and `basisModTorsion` (`…/Units/DirichletTheorem.lean:359, 466`)
  - `Subgroup.goursat` (`GroupTheory/Goursat.lean:131`)
  - `Representation.asGroupHom` (`RepresentationTheory/Basic.lean:512`)
  - `Subgroup.IsArithmetic` (`…/ArithmeticSubgroups.lean:126`), `adjoinNegOne` (:220), `relIndex_adjoinNegOne_eq_two` (:250)
  - `strictWidthInfty` and `CuspOrbits` (`…/Cusps.lean:318, 167`)
  - `cyclotomic.irreducible_rat` (`RingTheory/Polynomial/Cyclotomic/Roots.lean:190`)
  - `rank_two_simple'` (`…/PSL2.lean:124`)
  - `SL2.commutator_eq_top` (`…/SpecialLinearGroup.lean:804`)
  - `isOpen_of_isClosed_of_finiteIndex` (`…/ClosedSubgroup.lean:108`)
  - `quotient_finite_of_isOpen` (`…/OpenSubgroup.lean:312`)
  - `card_GL_field` and `card_SL_field` (`…/GeneralLinearGroup/Card.lean:122, 129`)
  - `Units.isClosedEmbedding_embedProduct` (`Topology/Algebra/Group/Units.lean:116`)
  - `ZMod.unitsMap` (`Data/ZMod/Units.lean:29`)
  - `ZMod.chineseRemainder` (`Data/ZMod/Basic.lean:889`)
  - `fermatLastTheoremThree` (`NumberTheory/FLT/Three.lean`)
- Tau Ceti (26):
  - `Divisor.conorm`, `degree_conorm` and `conorm_principal` (`FieldTheory/FunctionField/Divisor/Conorm.lean:136, 360, 413`)
  - `Isogeny.Hom.pointMapHom` (`…/Isogeny/Hom/Ring.lean:108`)
  - `TateModule.mapLinearMap` (`Algebra/Module/Torsion/TateModule.lean:295`)
  - `HeckeRing.GL2.Newform` (`…/Newforms/Newform.lean:104`) and `Newform.analyticRank` (`…/AnalyticInvariants.lean:80`)
  - `torsion_addEquiv_prod` (`…/MulByInt/Torsion/Structure.lean:133`)
  - `card_stabilizer_psl_I` and `card_stabilizer_psl_ρ` (`NumberTheory/Modular/Stabilizer.lean:239, 246`)
  - `GeometricEnd`, `HasGeometricCM`, `CMAction` and `CMAction.map` (`…/Hom/ComplexMultiplication.lean:94, 100, 143, 192`)
  - `tateModuleGaloisRepresentation` and `continuous_tateModuleGaloisRepresentation_apply` (`TateModule/Galois.lean:80, 188`)
  - `autGroupMulEquiv` (`EllipticCurve/Aut.lean:303`)
  - `Isogeny.galoisConj` (`Isogeny/Galois.lean`)
  - `zHat.ringLift` (`ZHat/ZMod.lean:432`) and `unitsEquivPiPadicInt` (`ZHat/Units.lean:79`)
  - `zHat.idem` (`ZHat/Idempotent.lean:131`)
  - `Subgroup.AlmostConjugate` (`GroupTheory/AlmostConjugate.lean:92`)
  - `inertiaSubgroup` (`…/Unramified/Inertia/Basic.lean:112`)
  - `tateModuleWeilPairing` (`TateModule/WeilPairing.lean`)
  - `Matrix.transpose_mul_J_mul_eq_det_smul` (`LinearAlgebra/Matrix/SymplecticMultiplier.lean`)
  - no `GSp`, isogeny class or adelic Tate module exists at the pin.

**Cross-roadmap citations resolved.** These were read at the open heads, or on main (4ee3e19).
- NEI §4.0; ECMIQ §5.1 (l.1436–1470).
- CMG §§1.6 (l.467), 2.5, 7.2–7.6 (l.1572–1700), 8.6–8.7 (l.1819–1850), 9.1, 9.3, 9.4 (l.1923).
- HRPO §5.9 (l.2416; its Check “a genus ≥ 2 curve gives finitely many points”).
- AGR §§3.3, 3.5, 4.2–4.5, 6.1 (l.4051), 6.4, 7.3, 7.5, 7.9–7.11.
- MC2 §§3.8, 3.9, 3.12, 5.8–5.17, 6.1, 6.3, 8.3, 9.5–9.8, 13.1, 16.1–16.6.
- EM2 §§5.0a (l.582), 5.0b (l.622), 6.0b, 6.0d, 6.0e (l.782, trivial character only, so the gap is needed), 6.0f.
- EI §8.8 (l.1303); ED §§3.10, 3.11, 3.20, 3.23, 3.26; FF R28.6.1 (l.2654), R28.6.5–6; SV §5.10 (l.1681).
- FiniteGroupInvariants 7.1 (l.1174), 7.3 (l.1213).
- On main: NC §§2.1–2.3, 2.5 (l.562, 608, 638, 690); MF §§4.1, 8.2, 10A, 10C; GQF Layer 5 with §§5.1, 5.5; SSF §5.11 (l.7273); IQ H1.4, H2.4, H3.1, H3.6; CFT Layer 11 (l.1683); FO Layers 3–5.
- AlgebraicModularFormsAndSerreWeights Layer 4 (l.955) for R04.

**Ownership against open pull requests.** I searched main and all open heads by object (`roadmaps grep`) for:
- `GL₂(Ẑ)` carriers;
- Mazur's torsion theorem and Kenku's class sizes;
- the abelian-surface large-image theorem;
- nebentypus rank zero;
- explicit `X₁(N)` and `X₀(N)` models;
- `GSp₄` images.

Results:
- No other roadmap states Mazur's torsion theorem.
- Both declared gaps ask for results no earlier roadmap provides. Each `needs` is one precise sentence.
- SatoTateGroups and HyperellipticCurves defer `GSp₄` images to this roadmap.
- The only conflicts are R02 and R03.
- Separately, CMG's “Not owned here” (its l.142–147) also assigns to this roadmap “the `E₄`/`E₆` coordinates of `X(1)`”, which this README neither plans nor defers. That assignment is for CMG to correct.

## Not verifiable

- Serre, *Abelian ℓ-adic representations*: IV-19, and IV-23 Lemma 3. This is a book, not legally reachable; dokchitser2012 lines 14–16 corroborate the lemma.
- None of the following was fetched, and I edited no manifest. `kubert1976` is waived.
  - Mitchell 1914;
  - Bray–Holt–Roney-Dougal 2013;
  - Kenku 1982; Mazur 1978; Lang–Trotter 1976;
  - Zywina 2010 and 2015;
  - Chen 1998; de Smit–Edixhoven 2000;
  - Baran 2014; Balakrishnan–Dogra–Müller–Tuitman–Vonk 2019; Banwait–Cremona 2014;
  - Clark–Cook–Stankewicz 2013; Abramovich 1996; Prasad–Rajan 2003;
  - Khare–Wintenberger 2009; Serre 1987;
  - Sutherland 2016, 2021; Jones 2010;
  - the Experiment. Math. Lemma 2.11.
- The Adv. Math. pagination of Bourdon–Ejder–Liu–Odumodu–Viray: only arXiv v2 was read.
- LMFDB data and knowl wording were not checked against the database. This covers the curve labels and torsion of worked examples 5–9, `cm_ramp`, the `isogeny_orbits` definition, and the label prefixes.

## Source issues

- none
