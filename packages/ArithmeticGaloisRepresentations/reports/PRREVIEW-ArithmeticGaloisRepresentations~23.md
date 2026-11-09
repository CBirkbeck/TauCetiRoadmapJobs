# Review of ArithmeticGaloisRepresentations (pull request #856 at c0cf462)

**Verdict:** needs changes

This is a full review of the head `c0cf462`, which changes 205 README lines since `27e9e34`. The only previous finding (R01, the zeta-integral comparison handed to a nonexistent Part II) is repaired. The rewritten §2.7 supplier contract with AnalyticNumberTheoryPartII §§5.3g, 5.3h and 5.3j resolves at that pull request's head, with matching normalisations. The gate passes and the dependency check is clean.

The three findings below are all P3 locator defects in sampled targets (§§1.8, 1.11 and 7.8). In each, a cited source states the result in a narrower setting than the README, or does not contain the cited clause at all.

## R01 (P3) — Brauer–Nesbitt for every field and every monoid is cited to group-and-finite-field sources

**Location:**
- `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1235–1242` reads: "for any field `k` and any group or monoid `Γ`, finite-dimensional `V, W` with equal characteristic polynomials … (DDT, Prop. 2.6, pp. 53–54; Ribet 1976, §2, p. 154; DS, proof of Lemme 6.13, p. 523)".
- `TauCetiRoadmap/ArithmeticGaloisRepresentations/Suggested.lean:87–88`, the docstring of `iso_of_charpoly_eq`, reads: "in every characteristic and for any monoid … (DDT, Proposition 2.6)".

**Claim:** these sources prove that semisimple representations of a monoid over an arbitrary field are determined by their characteristic polynomials.

**Witness:**
- `darmon-diamond-taylor-2007` line 2009 states Prop. 2.6(b) for a semisimple `ρ : G_ℚ → GL_d(k)` with `k` finite.
- The Deligne–Serre text, line 616, states Lemme 6.13 for a group over a finite field.
- Chenevier treats the monoid case: Cor. 1.14 (line 593, p. 14; Amitsur's formula, so characteristic polynomials of monoid elements determine the determinant) together with Cor. 2.13 (line 1171, p. 29: "a group (or a unital monoid)").

**Repair:**
- At `README.md:1242`, add "Chenevier, Cor. 1.14, p. 14, and Thm 2.12 with Cor. 2.13, pp. 28–31, for a monoid over an algebraically closed field" to the locator.
- At `Suggested.lean:88`, replace "(DDT, Proposition 2.6)" with "(Chenevier, Cor. 1.14 and Cor. 2.13; DDT, Proposition 2.6(b), for `G_ℚ` over a finite field)".

**Test:** Chenevier Cor. 2.13 covers the monoid case. The descent paragraph at `README.md:1230–1231` takes `V^ss ≅ W^ss` from `(V ⊗ k̄)^ss ≅ (W ⊗ k̄)^ss`. That step holds over imperfect fields too: a central idempotent of `k[Γ]/ker` separates the `k̄`-constituents of non-isomorphic simple modules. The cited sources then cover the theorem as stated.

## R02 (P3) — Reductive quotients over an excellent DVR cite a proposition stated only for `p`-adic integer rings

**Location:** `README.md:1429–1438` reads: "For an excellent DVR `O`, a reductive group scheme `G/O` … prove the same assertions over `O` … (BHKT, Proposition 3.2, p. 8, and Proposition 3.10, pp. 10–11 of arXiv:1609.03491v2, using Seshadri's geometric reductivity over a base)".

**Claim:** BHKT's Prop. 3.10 gives the quotient theory over every excellent DVR.

**Witness:**
- BHKT line 436 fixes `O` as the ring of integers of a coefficient field `E ⊂ ℚ̄_ℓ`, and Prop. 3.10 (line 448) begins "Let notation be as above".
- Seshadri's theorem, which is what carries the generalisation, has no locator and no entry under References.
- LanglandsParameterStacks LP2e.2 consumes exactly the excellent-DVR form (`README.md:1418–1420`).

**Repair:** add *C. S. Seshadri, Geometric reductivity over arbitrary base, Adv. Math. 26 (1977), 225–274* to References. Cite at the claim the theorem of it that gives finite generation and the closed-orbit and closed-image properties over an excellent (universally Japanese) base. BHKT's own proofs use [Ses77, Theorem 3] and [Ses77, Proposition 3] (BHKT lines 346 and 470). Record the source as uncertified if it is cited by locator only. Keep BHKT for `O = O_E`.

**Test:** the Check at `README.md:1475–1477` (`C₂` acting on `ℤ₂[x]` by `x ↦ −x`) is untouched: its point is the non-flat reduction, which the repaired locator does not assert.

## R03 (P3) — §7.8's one-dimensional-constituent clauses are cited to a proof that does not contain them

**Location:** `README.md:5146–5152` reads: "that for `p ≥ 5` the one-dimensional constituents of `Sym^{2i}`, `0 ≤ i ≤ p − 1`, have multiplicity `≤ 1` … every one-dimensional constituent `χ` of `(ad ρ̄)^ss` has `χ² = 1`, so `H⁰(G_ℚ, M(1)) = 0` … (CHT, proof of Lemma 2.5.2, p. 56)".

**Claim:** the cited proof gives all three clauses.

**Witness:** CHT p. 56 (Numdam text, lines 2693–2696) only decomposes `ad Sym^{n−1} ≅ 1 ⊕ Sym² ⊕ ⋯ ⊕ Sym^{2n−2}` and notes that each factor is irreducible because `2n − 2 ≤ l − 1`. That supports the first clause. A search of the whole text finds nothing on `Sym^{2i}` with `2i ≥ p`, on `χ² = 1`, or on `H⁰(G_ℚ, M(1))`.

**Repair:**
- Keep the CHT locator on the irreducibility clause.
- For the second clause, cite the **Modulo `p`** target just above (the Jantzen II.2.16 sequence) as the route, and say the clause is proved here.
- For the third clause, either cite a source that states it, or mark it as proved here with its route: scalars act trivially on `ad`, and `SL₂(F_p)` is perfect for `p ≥ 5`.

**Test:** at `p = 5`, the sequences give the constituents the second clause names:
- `0 → Frob V ⊗ V → Sym⁶V → det² ⊗ Sym²V → 0` has dimensions `4 + 3 = 7`. Over `F₅`, `Frob V ⊗ V ⊇ ∧²V = det`, which is the `2i = p + 1` constituent.
- `0 → Frob V ⊗ Sym³V → Sym⁸V → det⁴ → 0` has dimensions `8 + 1 = 9`, which is the `2i = 2p − 2` constituent.

## Previous findings

- **R01 (previous) — repaired.**
  - `grep 'Part II' README.md` finds nothing.
  - `README.md:170–178` now assigns the local evaluations to AutomorphicLFunctionsAndLocalFactors AL.1.2.1, AL.1.2.3 and AL.1.2.4. It assigns the constant comparison to AL.1.3.2 and the root-number identification to AL.1.6.1 with AnalyticNumberTheoryPartI §2.3a. It describes AutomorphicSpectralTheory §1.15c as the Eisenstein derivation.
  - All of these resolve at AutomorphicLFunctionsAndLocalFactors `330bb72`:
    - AL.1.2.1, AL.1.2.3 and AL.1.2.4 consume §2.7's evaluations (its README lines 757–822).
    - AL.1.3.2 identifies `ε` with `tateLocalConstant` (line 911).
    - AL.1.6.1 identifies the product with `W(ω)(|d_k|N𝔣(ω))^(1/2−s)` of AnalyticNumberTheoryPartI §2.3a (line 1079).
  - The previous review's remarks on untouched text are also resolved: the dead anchors `rank-one-local-functional-equation`, `hecke-l-functional-equation` and `global-godement-jacquet` are gone, and the Hecke attribution now reads "LFunctions Layers 0, 5–6 … and AnalyticNumberTheoryPartI §2.3a".

## Verified sound

**Gate, dependency check, diff, elaboration.**
- The prescribed gate prints `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's run on this head adds `build=0`.
- The dependency check prints `depcheck: 239 roadmaps, 2369 edges, 0 problem(s)` (exit 0), with no UPWARD, CYCLE or `moved:` line.
- In the merge order this roadmap is on line 56. The new supplier AnalyticNumberTheoryPartII is on line 50 (the same author's new-roadmap pull request #1167, listed in the description). AutomorphicLFunctionsAndLocalFactors (92) and AutomorphicSpectralTheory (94) are cited only as downstream.
- `git diff --stat origin/main...HEAD` outside the folder is empty. `Suggested.lean` is unchanged since `27e9e34`.
- `lake env lean Suggested.lean` exits 0 in 14.8 s with exactly 20 `declaration uses sorry` warnings and nothing else.
- I put `#check @name` for all 33 declarations in one scratch file: 33 outputs and 0 errors. Each type matches its README statement.
- `scratch/signatures.md` flags `isEnormous_symPower` as having dropped `[Fintype n] [DecidableEq n]`. That is a false positive: the theorem binds its own `n : ℕ`, which shadows the section's `n : Type`.
- **Padding probe:** in a scratch copy I replaced each `sorry` with `first | (simp; done) | rfl | infer_instance | trivial | decide`. That gives 20 errors at 20 distinct theorems, so none closes in one tactic.

**Headline coverage.** The README's end theorems are all stated:
- recognition (`iso_of_frobenius_charpoly_eq`);
- odd absolute irreducibility, adequacy and enormity (`isAbsolutelyIrreducible_of_isOddAt`, `isAdequate_*`, `isEnormous_*`);
- Brauer–Nesbitt, Dickson, image algebra and descent, Carayol, Frattini, the multiplicative criterion, Serre's wild bound and Tate lifting.

The module docstring names the headlines that cannot be stated at the pins, and what each lacks:
- the Tate-module and pairing adapters (the `AbelianTate` fibre);
- the Weil–Deligne adapter and purity (the local Weil group);
- conductors with infinite inertia image (the absolute upper filtration over a general perfect residue field);
- the character-conductor comparison (unit-filtration reciprocity).

Grothendieck's monodromy theorem is the supplier's headline.

**Pinned declarations opened.**

| Declaration | File:line at the pin |
| --- | --- |
| `Representation.IsSemisimpleRepresentation` | Mathlib `RepresentationTheory/Semisimple.lean:34` (abbrev) |
| `NumberField.Set.HasDirichletDensity` | Mathlib `NumberTheory/NumberField/DirichletDensity.lean:81` |
| `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'` | Mathlib `LinearAlgebra/Projectivization/PSL/PSL2.lean:124` |
| `IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt` | Mathlib `NumberTheory/LocalField/Basic.lean:117` |
| `Rep.FiniteCyclicGroup.groupCohomologyIsoEven` | Mathlib `RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean` |
| `PadicAlgCl` | Mathlib `NumberTheory/Padics/Complex.lean:54` (`AlgebraicClosure ℚ_[p]`) |
| `AlgHom.IsArithFrobAt` | Mathlib `RingTheory/Frobenius.lean` |
| `TauCeti.IsLocalRing.ramificationGroup`, `_antitone` | Tau Ceti `RingTheory/LocalRing/RamificationGroup.lean:118`, `:183` |
| `Representation.nonempty_equiv_of_character_eq_of_isSemisimpleRepresentation` | Tau Ceti `RepresentationTheory/Semisimple.lean:63` (`[CharZero k]`, semisimple instances) |
| `WeierstrassCurve.torsionGaloisAction` | Tau Ceti `AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:77` |

**Cross-roadmap citations resolved (changed passages).** AnalyticNumberTheoryPartII at `3f8e782`:
- §5.3g (its README line 682) gives:
  - `ψ_ℝ = exp(2πix)`, `ψ_(ℚ_p) = exp(−2πi{x}_p)` and `exp(2πi(z+z̄))`;
  - the annihilator `𝔇_v^(−1)`;
  - the self-dual measures `dx`, `2dxdy` and `N(𝔇_v)^(−1/2)dx_v`;
  - local Fourier inversion.
- §5.3h (line 699) gives restricted-product duality, `F^⊥ = F` and Poisson summation. It names `adeleRing_selfDual`, which is declared at its `Suggested.lean:291` in `TauCetiRoadmap.AnalyticNumberTheoryPartII`.
- §5.3j (line 720) gives `d^×x_v = (1−q_v^(−1))^(−1)N(𝔇_v)^(−1/2)dx_v/|x|_v`, `dx/|x|` and `2dxdy/|z|_ℂ`, with `O_v^×` of mass `N(𝔇_v)^(−1/2) = q_v^(−ν_v/2)`. These are exactly the normalisations §2.7 claims, and its local zeta integral converges on `Re s > 0`.
- Its Downstream consumers (line 3166) records §2.7's import.

AnalyticNumberTheoryPartI §2.3a at `8984606`, lines 1361–1371: `Λ(s,ω) = W(ω)A^(1/2−s)Λ(1−s,ω⁻¹)`, with `W(ω)` the normalised Gauss sum times the archimedean signs.

AutomorphicFormsOnReductiveGroups at `4a03177` no longer cites §2.7.

AutomorphicSpectralTheory (`README.md:41`), GL2AutomorphicRepresentationsAndTransfer, MetaplecticAutomorphicForms and ClassicalArithmeticCompletion (main, `README.md:281`) still cite "§2.7 Global inputs" for the adelic Schwartz–Bruhat space. This head keeps that label (`README.md:2305–2311`) as a pointer to AnalyticNumberTheoryPartII §§5.3g–5.3j, so the id is not dropped.

**Ownership against open pull requests.** For the changed objects I checked ownership against main and the open heads with `roadmaps grep` and `roadmaps show`:
- the adelic Fourier inputs now have one owner, AnalyticNumberTheoryPartII;
- the finite Gauss-sum constants, standard evaluations and root-number product are owned here and consumed by AL;
- the Hecke functional equation is owned by AnalyticNumberTheoryPartI §2.3a.

`scratch/overlaps.md` lists no other pull request changing this folder and no dropped or revision-only id.

**Sources checked at the sampled locators** (texts read through the sources service):

| Target | Locators verified |
| --- | --- |
| §1.2 | DDT §2.1, p. 50 (line 1878, `ϵ_ℓ`), pp. 52–53 (lines 1960–1983); KW (I) §1.5, p. 4 (contents line 26, text lines 143–158); NT26 display (1.1), p. 3 (line 96) and §1.2, p. 7 (line 295) |
| §1.8 | DDT Prop. 2.6 and proof, pp. 53–54 (lines 2006–2021); Chenevier, end of proof of Thm 2.12, p. 31 (lines 1262–1267); DS Lemme 6.13, p. 523 (lines 616–624). Gap → R01 |
| §1.11 | CHT Lemma 2.1.5 and proof, pp. 10–11 (lines 385–411, including the ramified-quadratic step the README says it replaces); BHKT Prop. 3.2 (p. 8), Defs. 3.3 and 3.5, Thm 3.4, Props. 3.6–3.7 (pp. 8–9), Prop. 3.10 (pp. 10–11), Thm 4.8(ii) proof (p. 17, Larsen Lemma 2.4 and `Ĝ(E)^0`), Def. 4.9 (p. 17); Steinberg 1965, 6.11 d), 6.12, 6.13 on p. 64; CG arXiv v1, proofs of Prop. 6.8 (Baire) and Thm 6.13 (integral model after conjugation). Gap → R02 |
| §2.4 | Deligne 1973: 2.2.2–2.2.4 (pp. 521–522), 8.1 and Thm 8.2 (p. 566), (8.3.7) (p. 568), 8.4.2–8.4.3 (p. 569, `ρ'(F^nσ) = ρ(F^nσ)exp(−t_ℓ(σ)N)`); FSY §5.3.1, p. 54 (line 2438) |
| §3.5 | Serre 1961 n° 3.7 (31), p. 138 (line 1311); Serre 1987 §1.2 (a)–(c), p. 181 (lines 100–116); BK (2.5), p. 230, Lemmas 2.4 and 2.7 (pp. 229–231), p. 245 (line 604: `dim ind_H^G(1)^N = [G : NH]`) |
| §3.6 | DDT Lemma 2.7, pp. 54–55 (lines 2053–2063); Ulmer §6, p. 5 (lines 238–246) |
| §3.7 | DDT Prop. 2.12, pp. 57–58 (lines 2151–2170); Serre 1961 n° 4.4 Lemme 4, pp. 144–145 (lines 1535–1583); Ulmer §10, Prop. 1, pp. 7–8 (lines 331–354); Deligne, Weil I, Lemmes (8.12)–(8.13), p. 306 (lines 1232–1238) |
| §5.4 | Chenevier Lemma 1.9, p. 11 (lines 435–440: the identity `D(g)T(g⁻¹h) − T(g)T(h) + T(gh) = 0` exactly); DP Remark 4, p. 7 (lines 308–315) |
| §5.6 | Chenevier Thm 2.16, p. 31, Def.-Prop. 2.18(iii), p. 32, Def. 2.19, p. 33; BLGGT Lemma A.1.5 and proof, p. 85 (lines 3963–3995), which is `conj_into_of_trace_mem_of_distinct_eigenvalues` verbatim in hypotheses |
| §5.11 | BCGP25 Props. 4.11.1–4.11.2, pp. 109–110 (lines 4884–4916) |
| §6.1 | DDT §2.2: Prop. 2.8(a), p. 56 (line 2108), Prop. 2.11(a), p. 57 (line 2132) |
| §7.8 | CHT proof of Lemma 2.5.2, p. 56 (lines 2693–2696). Gap → R03 |

Also checked:
- §7.10's printed-bound remark against CHT Cor. 2.5.4, p. 57 (line 2723) and DDT Lemma 2.48, p. 82 (line 3033).
- §7.6's "eigenvalue list corrected" against BCGP25 p. 111 (line 4993).

**Adversarial table.** Matrices act on columns, `Frob` is arithmetic, and `χ_ℓ` has weight `+1`.

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| `baire_descent` | `n = 0` gives `E = K`. `a ↦ (1+ℓ)^a` on `ℤ_ℓ` has entries in `ℚ_ℓ`. A discontinuous `∏ℤ/p_n → ℚ̄_ℓ^×` with unbounded root-of-unity degrees is excluded by `Γ →ₜ*`. Finite extensions inside `ℚ̄_ℓ` are countably many (Krasner) | Holds |
| `exists_integral_conj_GL` | `ℤ ∋ 1 ↦ ℓ` is not compact, so `CompactSpace` excludes it. `a ↦ (1 a; 0 1)` is integral, and conjugation by `diag(ℓ,1)` gives `(1 ℓa; 0 1)`, still integral | Holds |
| `iso_of_charpoly_eq` | `F₂`, `ℤ/2`: trivial and `(1 1; 0 1)` both have `(X−1)²`; only the first is semisimple (hypothesis). `F₃`: `sgn^{⊕3}` and `1^{⊕3}` both have trace `0` but charpolys `(X+1)³ ≠ (X−1)³` at the generator. Monoid case: Chenevier Cor. 1.14 | Holds (locator: R01) |
| `isAbsolutelyIrreducible_of_isOddAt` | `ι` injective gives `c² = 1`. Characteristic `≠ 2`: eigenvalues `±1` are distinct and `k`-rational, so every stable `k̄`-line is rational. `F₂`, totally real cyclic cubic: `ρ(c) = 1`, excluded by the clause `ρ c ≠ 1` | Holds |
| `dickson_projectiveImage` | `GL₂(F₃)`: `πG = PGL₂(F₃) ≅ S₄`, with `tr²/det ∈ F₃` so `F₀ = F₃`. `SL₂(F₅)`: `A₅ ≅ PSL₂(F₅)`. Characteristic 2, Klein four: excluded by `p ∤ n` (that group is reducible). `F₉`: 5 squares generate `F₉` | Holds |
| `iso_of_frobenius_charpoly_eq` | A density-one `Pl` meets each Chebotarev class (densities `1` and `#C/#G > 0` cannot be disjoint), so `frobeniusSet Pl` is dense. Ramified lifts lie in a coset of inertia, which is harmless. An abstract character on `∏ℤ/2` is excluded by joint continuity | Holds |
| `imageAlgebra_isCentralSimple` | `Q₈` over `ℂ`, `k = ℝ`: `B = ℍ`, `dim_ℝ = 4 = n²`. Faithful `χ` of `ℤ/3`, `k = ℚ`: `B` over `ℚ(ζ₃)` has dimension `1`. The Gram matrix `(tr ρ(γ_iγ_j))` is invertible in every characteristic | Holds |
| `realizable_iff_imageAlgebra_split` | `Q₈`, `L = ℝ`: `ℍ ≇ M₂(ℝ)` and there is no real form (both sides false). `L = ℂ`: both sides true | Holds |
| `realizable_of_charpoly_mem` | `ℤ/3`, `ω ⊕ ω²` over `F₄`, `k = F₂`: charpoly `X² + X + 1 ∈ F₂[X]`, realised by the companion matrix | Holds |
| `conj_into_…_distinct_eigenvalues` | `Q₈` over `ℚ` has no element with two distinct rational eigenvalues, so it is excluded. `1 ⊕ sgn` of `ℤ/2` with `γ₀` the generator (eigenvalues `1, −1`) is rational | Holds |
| `carayol_conj_of_trace_eq` | `1 ⊕ 1` and `(1 ℓt; 0 1)` have equal traces and equal residual matrices, but the residual image is not spanning, so `habs` excludes them. A residual scalar is lifted and divided out to get `ḡ = 1` | Holds |
| `compact_matrix_frattini_isOpen` | `P = 1+ℓℤ_ℓ`: `Φ = 1+ℓ²ℤ_ℓ`, open. `P = 1`: the empty infimum is `⊤`, open | Holds |
| `multiplicative_residual_unramified_iff` | `11a1` over `ℚ_11`, `v(j) = −5`: `p = 5` is unramified (`5 ∣ 5`), `p = 3` is ramified. `p = ℓ` is excluded by `hp` | Holds |
| `lowerSwanConductor_le` | `ℚ₂(√2)`: `2 ≤ 1·1·2`. `χ₈` on `ℚ₂(ζ₈)`: `2 ≤ 3`. Characteristic `p` (Artin–Schreier with arbitrary `m`) is excluded by `[CharZero B]` | Holds |
| `isAdequate_of_coprime_or_large` | `SL₂(F₇)`, `d = 2`: `6 ≤ 7`, adequate. `SL₂(F₅)`: `6 > 5`, excluded (`H¹ ≠ 0`). When `p ∤ #H`, `n ∣ #H` forces `p ∤ n` | Holds |
| `isAdequate_tensor` | `F₅`, `C₃`, `A = (0 4; 1 4)`: `A³ = 1`, charpoly `X²+X+1` irreducible, and `A + 3I = (3 4; 1 2)` is a trace-zero centraliser, so `h₂` fails | Holds |
| `isEnormous_iff_isAdequate_rankTwo` | `SL₂(F₇)`: both hold. `SL₂(F₅)`: neither (`H¹ ≠ 0`). `SL₂(F₃)`: neither (quotient `ℤ/3`) | Holds |
| `isEnormous_of_contains_SL` | `n = 3`, `p = 5`: `diag(1,2,3)` has determinant `6 = 1`, is regular semisimple, and fixes the trace-zero diagonal. `[H : SL₃(k')]` is prime to `5` | Holds |
| `isEnormous_symPower` | `n = 2`, `p = 7`: `SL₂(F₇)` is enormous. `p = 5` fails `2n+1 < p`, matching `SL₂(F₅)` not enormous | Holds |
| `exists_linear_lift` | `n = 1`: `PGL₁ = 1` and `r = 1`. `ℤ/4 → ℤ/2` is a finite-kernel obstruction that dies in the colimit by Tate's vanishing | Holds |
| §1.2 frames, twists | `(1 a; 0 1)` and `(1 ℓa; 0 1)`: conjugate by `diag(ℓ,1)`, but their reductions differ for a unit `a`, so they are not `GL₂(ℤ_ℓ)`-conjugate. `ℤ_ℓ(1)^∨` and `ℤ_ℓ(1)` at `Frob_p` take `p⁻¹` and `p`. `det M(1)` for `M = ℤ_ℓ(1)` is `χ_ℓ²` | Holds |
| §1.8 Checks | `F₂`: unipotent against `1 ⊕ 1`. `F₃`, `d = 3`: traces `3 = 0` and `−3 = 0`. `F₇`, `d = 7`: `sgn^{⊕7}` against `1^{⊕7}`. `F₂`, `d = 2`, group: `det = 1`, so the trace determines the charpoly | Holds |
| §1.11 self-dual models | `(ϖ^aΛ)^* = ϖ^{−2a−i}(ϖ^aΛ)`: `i` even gives `a = −i/2`; `i` odd uses `ϖ⟨,⟩`. `PᵀJ₄P = antidiag(1,1,−1,−1)` checked entrywise. `C₂` on `ℤ₂[x]`: invariants `ℤ₂[x²]`, but over `F₂` all of `F₂[x]` | Holds (R02 is a locator issue) |
| §2.4 conventions | `Sp(2)`: `r(Φ)Nr(Φ)⁻¹e₀ = qe₁ = qNe₀`. `L(Sp(2)) = 1 − q⁻¹X` and `L(Sp(2)^∨) = 1 − X` | Holds |
| §2.7 (changed) | `ℚ₃` quadratic: `Σ = e^{−2πi/3} − e^{−4πi/3} = −i√3`, so `ε = −i·3^{1/2−s}`. Conductor 4: `ω₂(3) = −1`, `Σ = −2i`, `ε₂ = −i·4^{1/2−s}`, `W = 1`. Unit mass `q^{−ν/2}` equals AnalyticNumberTheoryPartII §5.3j's `N(𝔇)^{−1/2}`. Real `z(e^{−πx²}) = Γ_ℝ(s)`. `Γ_ℂ(1) = 1/π` | Holds |
| §3.5 | `S₃`-plane over `ℚ` and `F₂`: Artin `2 + ½·2 = 3`, Swan `1`. Over `F₃`: `3/2`, excluded. `Ind_{ℚ₂(i)} 1`: `2 = v₂(−4)` | Holds |
| §3.6 `11a1` | `Δ = −11⁵`; `−c₆ = −20008 ≡ 1 (mod 11)`; `#E(F₂) = 5` gives `a₂ = −2 ≢ 0 (mod 3)`. `ℓ = 5`: the point `(5,5)` has `30 = 30`, and the quotient is `11^{2−1}` | Holds |
| §3.7 | `3·(−5) = −15 ≡ 1 (mod 8)`. `F₂((t))`, `t⁻¹`: break `1`, conductor `2`, different `2`. `F₃((t))`, `t⁻²`: `2, 3, 6`. `t^{−p}` becomes break `1` via `β = α − t⁻¹` | Holds |
| §4.5 | `60 ∤ 336 = |PGL₂(F₇)|`. `F₁₁`: `1320 = 22·60` and `11 ≡ 1 (mod 5)`. Over `F₉`, the two transvections generate `SL₂(F₃)` | Holds |
| §5.4 | `diag(2,3)`, `h = 1`: `6·(5/6) − 10 + 5 = 0`, against `25` with `T(gh⁻¹)`. `F₂`: `1 ⊕ 1` and the unipotent both have `T = 0` and `δ = 1` | Holds |
| §5.6 | `ℤ/3` over `ℚ`: `W = ℚ(ζ₃)`, `a = s = 1`, `[Z : k] = 2`, so `dim W = 2`, and `W ⊗ ℚ̄ = χ ⊕ χ²` | Holds |
| §5.11 | `ρ = 1^{⊕2}`, `s = (1 log_p χ_p; 0 1)`: `(s−1)² = 0`. `m = 1` fails. `s = χ` gives `(χ−1)^m ≠ 0` | Holds |
| §6.1 | `y² = x³+1` at `5`: `#E(F₅) = 6`, `a₅ = 0`, charpoly `X² + 5`; determinant `5`, geometric `5⁻¹ = 3` in `F₇`. `N = 5`: the supersingular collapse. `y² = x³−x` mod `5`: `0, 1, 4` are distinct | Holds |
| §6.4 | `y² = x³ − x` over `ℚ(i)`, `ℓ = 5`: `d = 2`, `g = 1`, `dim V_λ = 1`. `c[i]c = [−i]` | Holds |
| §6.4a | `ℤ/4`: `Φ = {0,2}`. `ℤ_p²`: the kernel `pℤ_p × ℤ_p ⊄ pℤ_p²`. `∏_ℓ ℤ/ℓ`: `Φ = 1` is not open. Modular law `(M ∩ U)Φ(U) = U` | Holds |
| §7.8 | Transvection on `Sym^pV`: blocks `p, 1` against `2, p−1` for a complement. `x²+xy+y²` is `GL₂(F₂)`-invariant, but `y ↦ y + ux` changes it by `(u²+u)x²`. `p = 5` dimensions `4+3` and `8+1` | Holds (R03 is a locator issue) |
| §7.6 Asai at `g ∉ G_E` | Cyclic tensor polynomial `(X−β₁)(X−β₂)(X²−β₁β₂)` with `β₁β₂ = ν(g)²`. After twisting by `ν⁻¹`: `(X²−1)(X²−tX+1)`, eigenvalues `1, −1, λ, λ⁻¹` | Holds (source misprint below) |
| §7.10 `n = 2`, `l = 5` | `SL₂(F₅)`: `H¹(·, ad⁰)` is one-dimensional (DDT Lemma 2.48 excludes `#F = 5`), so the printed `l > 2n−1` fails | Holds (source error below) |

## Not verifiable

- **Serre 1972** (§4.5, Props. 15–18, pp. 280–283): the sources service found no legal copy, and DOI `10.1007/BF01405086` is paywalled.
- **Masser–Zannier 2020** (§6.4, §5.1, p. 658; §6.4a, proof of Lemma 5.1, p. 659): Annals is paywalled, the Project Euclid landing page has no PDF, and an arXiv search found no version.
- **Ribet 1976** (§§1.2, 1.8, 1.11): no legal source was found.
- **Not read (books, paywalled texts or online tags not opened in this review):** Larsen 1995, Bushnell–Henniart §32.6, Silverman, Milne 2008/2021, Ribet 1992, Schneider, Jantzen II.2.16, the Stacks tags cited in §6.1, and the published Duke pagination of CG (the arXiv v1 numbering was checked instead).
- **Uncertified in the manifest:** Serre, *Local Fields*, and KW (II).

## Source issues

- **Misprint** in boxer-calegari-gee-pilloni-2025 at proof of Proposition 4.11.2, p. 111: the source says an element outside `G_E` has eigenvalues `1, −1, λ, −λ` on `s(ϱ)⊗η⁻¹` and its `χ`-twist; it should be `1, −1, λ, λ⁻¹` there (negated for the `χ`-twist), from the Asai polynomial; affects nothing.
- **Error** in clozel-harris-taylor-2008 at Corollary 2.5.4, p. 57: the source asserts bigness of subgroups between `Sym^{n−1}SL₂(k′)` and `k^×Sym^{n−1}GL₂(k′)` for `l > 2n − 1`; it should require `l > 2n + 1`, since `n = 2`, `l = 5`, `H = SL₂(F₅)` has `H¹(H, ad⁰) ≠ 0`; affects a stated result.
