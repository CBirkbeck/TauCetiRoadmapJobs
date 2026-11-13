<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13155#issuecomment-6857363045 -->
Red team round 1 pass b (claude) of 56357cf

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §4.18 locates the mass values in a text that does not contain them

   Location: `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2005-2006`, "the masses of
   §§4.12–4.17 are the rational numbers listed in the tables accompanying CT20 Theorems 6–7 (p. 12)".

   Claim: the values are listed at CT20 p. 12.

   Witness: CT20 line 516 and line 525 (p. 12) say only that the masses are given in the authors' online
   tables, bibliography entry at CT20 line 2450; `sources.toml` has no entry for that dataset, and CT20
   prints only the `SO₃` values (CT20 line 499).

   Repair (replace the first sentence of §4.18; nothing else changes):

   > Prove that the masses of §§4.12–4.17 are the unique solutions of the rational systems of §§4.11,
   > 4.15 and 4.17 (CT20 Theorems 6–7, p. 12, which print no values and refer to the authors' online
   > tables for them); no table of values is taken over, and the only values stated here are those of
   > `SO₃` in §4.12.

   The fourth Check of §4.18 ("A value table without the rank and vanishing statements …") then stands
   as written. The same dataset is the only place that lists the 187 residual parameters and the set `V`
   of §5.4; §5.4 is sound as an existence statement ("an explicit set of 187 parameters"), so no change
   is needed there, but see "For the human reviewers".

2. **F02** (P3) CL14 locators for the rank-16 neighbour counts name the wrong section

   Location: `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2354-2355`,
   "`N₂(E₈ ⊕ E₈, D₁₆⁺) = 18225` (CL14 III §2, p. 63), and `|O(E₈ ⊕ E₈)| / |O(D₁₆⁺)| = 405/286`
   (CL14 III §2, p. 64)".

   Claim: both facts are in CL14 III §2.

   Witness: CL14 line 2378–2379 opens III §3 ("Exemples", §3.1, the operator `T₂` in rank 16); the
   count 18225 is at CL14 line 2402 (p. 63), the count 12870 at CL14 line 2449 (p. 64), the ratio at
   CL14 line 2469–2470 (III §3.2, p. 64). III §2 ends with Proposition 2.3 (CL14 line 2347, p. 61),
   which the README cites correctly at line 2340.

   Repair: in the second Check of §6.3 replace "(CL14 III §2, p. 63)" by "(CL14 III §3.1, pp. 63–64)"
   and "(CL14 III §2, p. 64)" by "(CL14 III §3.2, p. 64)". In `sources.toml`, the CL14 locator's "III"
   may stay.

3. **F03** (P3) supplier sections that a target uses but no `*Needs:*` line names, and contract sections no target uses

   Location: `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2290` (§6.1 `*Needs:*`),
   `:1109` (§2.16 `*Needs:*`), and the contract lists at `:246`, `:245`, `:355-358`.

   Claim: every input of a proof plan is named in its `*Needs:*` line, and every contract section is
   consumed.

   Witness (mechanical comparison of the contract sections with all 143 `*Needs:*` lines):

   - AutomorphicBundles §12.13 (Hecke action at non-neat level) is listed in the contracts (line 350)
     and in the scope (line 79) and in no `*Needs:*` line; §6.1 uses the Hecke operators at level
     `Sp_{2g}(ℤ)`, which contains `−1` and is not neat, so §12.11 alone does not give them.
   - ComputationalNumberTheory §4.18 (rational enclosures of the eight scalars) is listed in the
     contracts (line 398) and in no `*Needs:*` line; §§2.19, 2.21, 4.13, 4.15 and 5.4 obtain their
     enclosures through §2.16, whose line names only §§4.29–4.33.
   - AutomorphicFormsOnReductiveGroups §§2.4, 3.2, 3.4 and MetaplecticAutomorphicForms §§0.15, 2.4c,
     3.4, 3.5, 3.7, 5.6 are listed in the contracts and the scope and in no `*Needs:*` line and no layer
     `### Dependencies` paragraph.

   Repair:

   - §6.1: `*Needs:* AutomorphicBundles §§11.1–11.2, 11.9, 11.16, 12.10, 12.11, 12.13 and 12.15.` and
     add "12.13" to the Layer 6 `### Dependencies` line (`README.md:2561`).
   - §2.16: `*Needs:* §§2.4, 2.9; ComputationalNumberTheory §§4.18 and 4.29–4.33.` and add "4.18" to the
     Layer 2 `### Dependencies` line (`README.md:1239`).
   - AutomorphicFormsOnReductiveGroups: add "§§3.2 and 3.4" to the `*Needs:*` of §1.1 (the automorphic
     representations and restricted tensor products of which `Π_alg` is a predicate) and "§2.4" to the
     `*Needs:*` of §3.4 (the discrete series that `ρ_k` is for `k_g > g`).
   - MetaplecticAutomorphicForms: add "§§3.4, 3.5, 3.7 and 5.6" to the `*Needs:*` of §6.10 (the theta
     lift and Howe duality behind Lemma 5.7's square-integrability) and "§§0.15 and 2.4c" to the
     `*Needs:*` of §6.4 next to §5.1 (the Weil representation behind the theta kernel), or delete these
     six sections from the scope line (`README.md:82-83`) and the contract (`README.md:355-358`) if the
     route through §§3.10, 3.21, 5.1 and 6.14 is the only one meant.

4. **F04** (P3) §2.6 applies the supplier's explicit formula to a function that is not of its stated shape

   Location: `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:890-891`, "Apply
   AnalyticNumberTheoryPartI §1.8 to `Λ₁(s) = Λ(s, π^∨ × π′)` and `Λ₂(s) = Λ(s, π × π′^∨)` with
   `c = 1`".

   Claim: `Λ₁` satisfies hypothesis (iv) of that §1.8.

   Witness: the supplier's (iv) requires `Λ₁(s) = A^s ∏ Γ(a_i s + b_i) ∏_p …` exactly
   (AnalyticNumberTheoryPartI §1.8, third paragraph). With the Conventions' `Γ_ℂ(s) = 2(2π)^{−s}Γ(s)`,
   `Γ(s, I₁₁) = 2(2π)^{−11/2} · (2π)^{−s} Γ(s + 11/2)`: for `(π, π′) = (1, Δ₁₁)` the constant is
   `2(2π)^{−11/2} ≈ 8.148·10⁻⁵ ≠ 1`; likewise `Γ(s, e) = Γ_ℝ(s + 1) = π^{−1/2} · π^{−s/2} Γ(s/2 + 1/2)`
   carries `π^{−1/2}`. For `π = π′ = 1` the constant is `1`, so the first Check of §2.6 does not see it.

   Repair (insert after "which §2.1 makes admissible."):

   > The supplier's shape `A^s ∏ Γ(a_i s + b_i)` has no constant factor, while `Γ(s, I_w)` carries
   > `2(2π)^{−w/2}` and `Γ(s, e)` carries `π^{−1/2}`; apply §1.8 to `κ⁻¹Λ₁` and `κ⁻¹Λ₂`, with `κ` the
   > product of these constants over the summands `I_w` and `e` of `L(π∞)L(π′∞)`. They have the zeros,
   > poles and logarithmic derivatives of `Λ₁`, `Λ₂`, bounded differences from their principal parts,
   > and the same functional equation, so every term of the formula is unchanged. Here
   > `A = B = π^{−a/2}(2π)^{−b}` for `a` characters and `b` summands `I_w`, which is the `log π` and
   > `log 2π` content of `J_F`.

   Add as a Check of §2.6: "For `(π, π′) = (1, Δ₁₁)`: `Γ(s, I₁₁) = 2(2π)^{−11/2}(2π)^{−s}Γ(s + 11/2)`, so
   `κ = 2(2π)^{−11/2} ≈ 8.148·10⁻⁵ ≠ 1`; for `(1, 1)`, `κ = 1`."

Four P3 findings (R01–R04) for the repair worker; no P1 or P2. Both files were read in full
(`packages/LevelOneAutomorphicFormsForClassicalGroups/README.md`, 3157 lines;
`packages/LevelOneAutomorphicFormsForClassicalGroups/Suggested.lean`, 162 lines). No Lean was
run and no file of the package was edited. The numerical claims were recomputed with three scratch
scripts (index-set counts, the Miller range, the weight-13 parameter enumeration); their values are in
the tables below.

Dependency check (command of the brief, unchanged README):

    depcheck: 223 roadmaps, 1988 edges, 0 problem(s)

No UPWARD or CYCLE line. Ownership against open pull requests was checked for SiegelModularForms
(the closest open roadmap): it cites this roadmap's §§6.1, 6.2, 6.4, 6.7 and 7.9 as supplier and
owns none of them.

## Verified sound

Counts: 8 declarations read (all of `Suggested.lean`); 143 README sections read, with 110 Check
blocks holding 359 Checks (82 blocks with three, 27 with four, 1 with five; none with fewer); about
130 locators found at their place in the cached texts, about 60 of them read for content; about 120
Checks recomputed (those of the table below); 88 cited supplier sections found by heading at the
suppliers' current text, 14 of them read for content; 31 pinned declarations grepped at the pins.

### Suggested.lean declarations

No section `variable` is used; every binder is in the declaration's own signature, and the elaborated
types of the worker's signature file agree with the README statements (compared for all 8).

| Declaration (section) | Context | Instances computed | Result |
|---|---|---|---|
| `IsRegularIntegralForm` (Layer 4) | `{n} (c : Matrix (Fin n) (Fin n) ℤ)` | `n = 0`: empty determinant `1`, `Even 0`: regular. `x²`: `det = 2`, odd: regular. `x₁x₂`: `−1`: regular. `x₁x₃ + x₂²`: `−2`: regular. `x₁² + x₂²`: `4`: not regular. Odd `n` forces an even determinant | matches CT20 line 1245 and §4.7 |
| `specialOrthogonalPoints` (Layer 4) | `[CommRing R]` explicit | `x₁x₂` over `ℤ₂`: `{diag(t, t⁻¹)}`, the swap has `det = −1`. Even rank over a domain with `2 ≠ 0`: `det = (−1)^{Dickson}`, so `det = 1` is the Dickson kernel. Odd rank: `O = μ₂ × SO`, `det ζ·h = ζ` | body is the `ℤ_p`-points, `p = 2` included |
| `spinor_charpoly_obstruction` (Layer 4) | `c`, `hc`, `a b : ℕ`, `Q : ℚ[X]`, `hQ`, `hloc` over all primes | `P` monic in `ℤ_p[X]` for all `p` gives `Q ∈ ℤ[X]` monic. `deg Q` even. `b = 0`: spinor norm `≡ 2^{a−n}(−1)^{n+a}Q(−1) ≡ Q(−1)`. `a = 0`, `n` odd: impossible (vacuous). `n = 0`: `Q = 1`. `SO₃`, `Φ₁Φ₆`: `Q(−1) = 3` | true as typed; = CT20 Proposition 3.7 |
| `invariantAlternatingForms` (Layer 8) | `[AddCommGroup V] [Module ℚ V]`, `L` | real body; `g = 0`: all of `ℚ`. `Isometry L L` at the pin is an equivalence of `V` mapping the carrier onto itself | submodule proofs are real |
| `thetaCoefficient` (Layer 8) | same, `ω`, `T` | `finsum`; for `IsPosDef` the support is finite (each `x_i` has norm `T_ii`); `g = 24`, `T = Gram(u)`: `|O(L)| ω(u)` | no junk value in the theorem's range |
| `finrank_invariantAlternatingForms_of_rootless` | `hev huni hpos hrank hroot`, all `g` | coefficients of `t²⁴ + t¹⁶ + t¹² + t⁸ + 1`: `1` at `g = 0, 8, 12, 16, 24`; `g > 24`: `⋀^g = 0`; `g = 24` needs `det = 1` on `O(Leech)` | true; `IsLattice ℚ` at the pin makes the carrier span `V` |
| `invariantAlternatingForms_eq_bot_of_roots_span` | `L` any integral lattice, `hspan`, `0 < g` | `V = 0`: both sides `⊥`. Degenerate form: the reflection `y ↦ y − (y·x)x` is still an isometry. `ℤx`, `x·x = 2`, `g = 1`: `ω(x) = −ω(x)` | true without positivity, evenness or nondegeneracy |
| `exists_thetaCoefficient_ne_zero_of_rootless` | Leech hypotheses, `g ∈ {8, 12, 16, 24}`, `ω ≠ 0` invariant | `g = 24`: `±|O(Leech)| = ±8315553613086720000`. `g = 8`: `±5·|O|/10`. `g = 12`: `±18·|O|/3`. `g = 16`: `±5·|O|` | = CT19a Theorem 2 |

Headline theorems of the README and their status: CT20 Theorems 1–7, Corollary 1, Propositions 2.2
and 5.12–5.15 and Corollary 5.10, Miller's theorem, the triangular relation, and CT19a Theorems 1–2.
Statable at the pins and stated: the spinor obstruction, the Leech invariants, the root-span
vanishing, the nonvanishing half of CT19a Theorem 2. Every other headline is named in the module
docstring with its missing carrier (Siegel forms of genus `≥ 2`; cuspidal representations of `GL_m`
and Rankin–Selberg functions; the `L²` spectrum and Arthur parameters; the trace formula; Conway
coordinates). One-tactic probe on the four theorems: none follows from one library lemma (the pin has
`rootReflection` and `BinaryGolay.span_vectorsOfNorm_two`, not the vanishing of invariant forms). No
padding found; no statable headline missing. Form: one module docstring, namespace
`TauCetiRoadmap.LevelOneAutomorphicFormsForClassicalGroups`, `theorem` only, no `set_option`, no
`#eval`, imports `Mathlib` plus five existing `TauCeti.LinearAlgebra.IntegralLattice.*` modules.

### README targets: computed instances

| Target | Instances tried and values computed | Result; change |
|---|---|---|
| §1.2 `K∞` | `I₁² = I₂ + 1 + e` (dim 4); `det I_w = e^{w+1}`; `I₂₃² ∋ I₄₆` | sound; none |
| §1.4 | `Γ_ℝ(s)Γ_ℝ(s+1) = Γ_ℂ(s)`; `ε(I₁₁) = i¹² = 1`; `ε(e) = i` | sound; none |
| §1.6 | `m = 1, 2, 3, 4, 5`: determinant one fixes the zero characters (`m = 4`: `χ₁χ₂ = e`, so `1 + e`); `3·1` vs `1 + 2e` | sound; none |
| §1.8 | `ε(I₁₁I₁₅) = i²⁷·i⁵ = 1`; `ε(I₁₇) = −1`; `I₁ + 2I₂₃`: dim 6, det 1; `2I₁` carries both forms | sound; none |
| §1.9 | `Sp₂`: `(k+1, 0, −k−1)`; `SO₅` inverse of `(1/2,1/2,−1/2,−1/2)`: `(−1, 0)`; `SO₄`: `(0, 1)` | sound; none |
| §2.1–2.2 | `g″(x) = π sin πx − π²(1−x) cos πx`: `−π²` at 0, `0` at 1; `F̂_ℓ(i/4π) = 8ℓ/π²`; `Ĝ_ℓ(i/4π) = 4π²ℓ(1+cosh(ℓ/2))/(ℓ²/4+π²)²` from `û(ξ) = 2cos(πξ)/(π(1−4ξ²))` | sound; none |
| §2.3 | `D(s) + D(s+1) = −1/s`, `D₀(s) + D₀(s+1) = 1/s`, `−1/x ≤ D(x) ≤ 0`; `D = −β`; sign witness recomputed `0.2254836448` | sound; none |
| §2.5–2.8 | `C^F(x,x)` at `x = m⁻¹Σπ_i`: `A_F/m − J_F(U²) − …`; central zero gives `Z ≥ B_F e⊥` | sound; none |
| §2.9 | `ε(U²) = (−1)^{ab + (a+b+1)Σc_v(v+1)}` rederived; `det U = 1` gives exponent `2ab + b² + b ≡ 0`; `U = 1 + e`: `−1` | sound; none |
| §2.11–2.15 | `[[1,2],[2,1]]`: `μ = 1`; `diag(0,1)`: `μ = 0`; expanded `[[0,−1],[−1,0]]`: `−1`, compressed `−1/2` | sound; none |
| §2.17 | `B_f^{F₁}(1,1)`: only `(p,k) = (2,1)` (`log 3 > 1`, `2 log 2 > 1`); value recomputed `0.0399754` | sound; none |
| §2.19 | `max_ℓ (J_{F_ℓ}(U²) − A_{F_ℓ})` over `ℓ ∈ ¼ℤ ∩ [½, 20]`: rank 2: `+1.755`; 14: `+53.79`; 24: `+24.35`; 25: `+15.27`; 26: `+3.966` (`ℓ = 8.75`); 27: `−7.90`; 28: `−22.08`. `I₁₁`: `−0.044`; `I₁₃`: `−0.204` | route holds for ranks 2–26, fails at 27, as Mil02 line 137–139 |
| §2.20–2.21 | `dim S₂₄ = 2`, `dim S₅₄ = dim M₄₂ = 4`; 27 odd `w` | sound; none |
| §3.1–3.3 | `16+9+7+1 = 33`; `ε_ψ(s₁) = i^{w+1}`; Saito–Kurokawa test `−1 = (−1)^{k−1}`; centralizer of `diag(−1,−1,1)` in `SO₃(ℂ)` is `O₂` | sound; none |
| §3.4 | `g = 3`, `k = (1,0,0)`: `0 ≥ 1/2` false; scalar `k`: bound `0`; `(1,1)`: weights `0, ±0, ±1` | sound; none |
| §3.7–3.13 | `Δ₁₁[12] ⊕ [1]`: weights `±11…±1`, `0` three times; `χ = (−1)^6 = 1 = i¹²` | sound; none |
| §3.14–3.16, Examples | `dim M₂₀(Γ₂) = 5`, `dim S₂₀(Γ₂) = 3 = 1 + 2 + 0`, `dim S₃₈ = 2`; `λ = (9,7,4,2)`, `q(SO(4,4)) = 8` | sound; none |
| §4.4, 4.9 | recomputed: `|P(Sp_{2n})/∼| = 3, 12, 32, 92, 219, 530, 1158, 2521`; `SO_d`: `5, 12, 19, 59, 92, 165, 419, 530, 1001, 2257, 2521, 4877` and `3, 6, 12, 34, 40, 99, 244, 211, 598, 1339, 992, 2948` | all equal the README; `1158` confirmed against the printed `1157` |
| §4.6–4.8 | `det((1+γ)/2 | ker Q(γ)) = 2^{−deg Q}(−1)^{deg Q}Q(−1)`; order-4 rotation: `1/2`; `Φ₆(−1) = 3`, `Φ₄(−1) = 2`, `Φ₃(−1) = 1`, `Φ₅(−1) = 1`, `Φ₅(1) = 5`; `Q(∓1) = ±(1±t)²/t` | sound; none |
| §4.10 | `Sp₂`, `(2)`: `e₁² − e₂`; `SO₃`, `(2)`: `e₁² − e₂ − 1 = 5` at the identity; `(1)`: `e₁` in both; the four fibre and outer-orbit cases of the `SO_{2n}` bullet | sound; signs agree with the determinantal formulas |
| §4.12 | all 25 trace entries from `sin((2k+1)π/i)/sin(π/i)`; determinant `288`; the solution checked in all five rows; `k = 5`: `1` | sound; none |
| §4.16–4.17 | `|P(Sp₁₆)_hard/∼| = 766` recomputed from the three conditions | sound; none |
| §5.4–5.10 | `dim U_exc = 14`, `dim A = 16`; `2+3+7+1 = 13`; 16 classes of rank `≤ 4` in 15 blocks; determinants of the four survivors `e⁶ = e⁸ = 1` | sound; none |
| §6.1–6.2 | `(−1)^{gk}`; at `g = k`: `ζ(s)²` | sound; none |
| §6.3 | `(2⁴−1)(2³+1) = 135`; `|O(E₈²)|/|O(D₁₆⁺)| = 3⁴·5/(2·11·13) = 405/286`; `12870·405 = 18225·286 = 5212350`; row sums `32895 = (2⁸−1)(2⁷+1)` | sound; none |
| §6.8–6.12 | degrees sum to 24; `[23 − 2g₀]` rule; `L`-arguments `0, 4, 0, −4, −12`; zeros of `ω_g`: 4 and 12 | sound; none |
| §7.4, 7.8–7.10 | enumeration over the 27 classes with the characters of §3.5 and `ε_ψ` of §3.2: 223 candidates in positive genus, 25 with a `Δ₂₃`, 198 shapes, 58 passing (none with `Δ₂₃`), 29 scalar and 29 nonscalar, 29 distinct nonscalar weights, genera `3, 7, 4, 5, 4, 6`; weight 12: `1,1,1,2,2,3,3,4,2,2,1` for `g ≤ 11`; weight 10 at `g = 2,4,6,8`; weight 8 at `g = 4`; weight 13 at `g = 8, 12` | every number of §§7.4, 7.8, 7.9 reproduced |
| §7.6–7.7 | `(14,13)`: dim `9+16+3+1 = 29`, `ε(I₁₁(I₂₂ + e)) = i³⁴·i¹² = −1`; `(16,13)`: weights `±12…±4` once, `±3,±2,±1` twice, `0` three times; `(24,13)`: `24 + 25 = 49` | sound; none |
| §8.3–8.5 | orientable sizes from Lemma 1.3: `1,7,9,11,13,15,17,23` once, `8,12,16` twice, `0, 24` once: the coefficients of the `M₂₄` average | sound; none |
| §8.6–8.7 | `n₈ = |O|/κ₁₆`, `n₁₂ = |O|/κ₁₂`, `n₁₆ = |O|/κ₈`; poles of `γ`: `i = 9,11,13,15` (`g = 16`), `i = 1,…,23` odd (`g = 24`); rows sum to `0` | sound; none |
| §8.11–8.14 | (H2) forces `g ≤ 2k − 2`; (I) needs `k − 1 > g − k ≥ k`; `d_i ≤ k < 2(g′−k)+1` | sound; none |

### Pins, suppliers, gaps

- Pinned declarations found with the stated content: `TauCeti.IntegralLattice` (fields `carrier`,
  `form`, `isLattice`, `isSymm`, `le_dual`), `IsEven`, `IsUnimodular`, `IsPosDef` (the quadratic form
  is positive definite on all of `V`), `norm`, `vectorsOfNorm`, `Isometry`; `TauCeti.Symplectic.groupScheme`,
  `.pointsMulEquiv`, `.instSmoothCoordinateHopfAlgebra`; `TauCeti.BinaryGolay.code`, `finrank_code`,
  `isTypeII_code`, `hammingMinDist_code`, `weightEnumerator_code`, `constructionALattice`;
  `CliffordAlgebra.orthogonalSpinorNorm`; `CuspForm.peterssonInnerCosets`;
  `HeckeRing.GL2.exists_peterssonOrthonormalBasis_eigenformAwayFromLevel`, `.Newform`, `.Newform.basis`;
  `TauCeti.cuspFormsNew_one`, `TauCeti.Gamma1_one_map_eq_SL`; `ModularForm.dimension_level_one`,
  `CuspForm.discriminantEquiv`, `IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn`, `Complex.Gamma_add_one`,
  `Real.convexOn_log_Gamma`, `Continuous.fourierInv_fourier_eq`, `Matrix.toQuadraticForm'`,
  `PadicInt.Coe.ringHom`.
- Supplier sections found at the suppliers' current text with the cited content:
  SymplecticReidemeisterTorsionModSquares §4.1 (`zassenhaus_primary_formula`, no determinant-one
  hypothesis); AnalyticNumberTheoryPartI §§1.3, 1.8 (`WeilTestFunction`, hypotheses (i)–(iv));
  SmallRamificationAndAbelianVarietyBaseCases §§1.5–1.7; AutomorphicLFunctionsAndLocalFactors
  §§AL.1.4.3, AL.3.2.3, AL.3.3.8, AL.3.6.1–3, AL.3.7.2, AL.3.9.2, AL.3.9.4 (strip bounds outside
  neighbourhoods of the poles); ComputationalNumberTheory §§4.17, 4.17a, 4.18, 4.26, 4.29–4.34, 5.1;
  ModularityAndLanglandsExtensions §§3.4, 3.8, 3.15, 3.17, 3.20–3.22 and its contracts section;
  AutomorphicFormsOnReductiveGroups §§2.2, 2.4, 2.5, 3.2, 3.4, 3.5, 4.2, 5.1 (`IsAlgebraicCT`), 5.5,
  6.7, 6.8, 7.2, 7.2a, 7.4, 7.5; AutomorphicSpectralTheory §§4.4, 4.5, 4.10, 6.9, 6.17, 6.19, 6.20;
  AutomorphicBundles §§11.1, 11.2, 11.9, 11.16, 12.10, 12.11, 12.13, 12.15; MetaplecticAutomorphicForms
  §§0.15, 2.4c, 3.1, 3.4, 3.5, 3.7, 3.10, 3.21, 5.1, 5.6, 6.12, 6.14;
  GeometryOfNumbersAndQuadraticArithmetic §2.4.2; OrthogonalTamagawaAndLatticeMass §§3.1, 4.1, 4.2;
  CFSGBasicProperties P2-L; IntegralLattices 4G; Rank24LatticeConstructions Layer 6; ThetaSeries
  Layers 1, 5, 8; SporadicOrders Layer 1; ReductiveGroups Layer 9.
- The eight declared gaps: each slug is in `design/plan.json` and in the README under its supplier
  with the same supplier and section; each `needs` sentence states its hypotheses; none asks for
  something the supplier section or a pin already states (GeometryOfNumbersAndQuadraticArithmetic
  §2.4.2 covers only nondyadic fields, so the `p = 2` request is minimal).
- Policy: the pull request changes only the package folder; no `lemma`, `set_option`, pull-request
  number or process narrative in the README or the Lean file; every target has a locator.

### Copyright, licences and scope

Wording: 16 passages of the README and of the Lean docstrings were set beside their sources (§1.6
regularity against CT20 line 206–207; §1.8 against CT20 line 597–602; §2.19 against CT20 line 714–717
and Mil02 line 137–139; §2.21 against CT20 line 1037–1043; §3.4 against CT20 line 1706–1708; §3.5
against CT20 line 1734–1757; §4.7 and the Lean docstring of `spinor_charpoly_obstruction` against
CT20 line 1245–1249; §4.13–4.17 against CT20 line 1337–1414; §5.4 against CT20 line 1432–1507; §5.9
against CT20 line 1519–1540; §6.3 against CL14 line 2347–2350 and 2396–2449; §6.12 against
BoechererNote line 14–40; §8.4–8.5 and the docstring of `invariantAlternatingForms_eq_bot_of_roots_span`
against CT19a line 246–254, 283–299 and 1052–1058; §8.6 against CT19a line 105–116; §8.11–8.14 against
CT20 line 2289–2338; §3.15 against Tai17 line 2377–2396 and 2408–2415). No sentence is reproduced,
translated or followed clause by clause; the longest shared runs are formulas and statements of a
dozen words that the mathematics forces (the five definitions of §6.12 appear in the note's order
because each uses the previous one).

Arrangement: CT20 has the largest share of the locators. Its contents (CT20 line 54–80) against the
layers: Layer 1 ↔ §§1.2, 2.1, 2.2 and part of §1.4; Layer 2 ↔ §§2.3–2.4; Layer 3 ↔ §§5.1–5.2 with
Tai17 §4; Layer 4 ↔ §1.4 and §3; Layer 5 ↔ §2.4.6 and §4; Layer 6 ↔ CL14 III, V, VII, IX with parts of
CT20 §§5.3.2 and 5.4; Layer 7 ↔ §5.3; Layer 8 ↔ §§5.4–5.5 and CT19a. The order of the source's
sections along the layers is 2, 2, 5, 3, 4, 5, 5, 5: not a run of the source's contents. Layer 3 is
placed before Layer 4 because §3.16 feeds §4.11, and Layer 6 before Layer 7 because §§6.8 and 6.10
feed §7.6. Inside Layer 2, §§2.7–2.17 run parallel to CT20 Proposition 2.2 to §2.4.5; that order is
forced by the `*Needs:*` chain 2.7 → 2.8, 2.9 → 2.11, 2.13 → 2.15 → 2.17.

Reuse: no table, figure or list of numerical data is taken over; the mass values are not reproduced
(R01), and the 29 nonscalar weights and 32 scalar parameters of CT20 Tables 5–6 are described by
counts and by four worked instances, not listed.

Source independence: 16 passages compared with 6 sources, none shared; largest share CT20, 120 of 184 locators; contents compared with CT20: independent

## Not verifiable

- KT87 (uncertified by the manifest): the two determinantal character formulas of §4.10 were checked
  against the standard forms and on `λ = (1), (2)` for `Sp₂` and `SO₃`, not against the paper.
- The mass values, the list of 187 residual parameters and the set `V` (§§4.18, 5.4): they are in the
  authors' online dataset, which is not in the manifest and was not read (R01).
- The numbers of rows `974`, `1274`, `1810`, `3477`, `3461`, `1086`, `1427`, the cover size and the
  counts `1260`, `1256` are computer results of CT20; they agree with CT20 lines 1349–1413 and
  1532–1539 and were not recomputed.
- The Böcherer criterion itself (Böcherer 1989, Theorem 5) is behind a declared gap and was not read;
  the five order computations were checked against BoechererNote only.
- Arthur's Theorem 1.5.3(b), the Mœglin–Renard and Arancibia–Mœglin–Renard statements: checked
  through the suppliers' sections and CT20's use, not against the primary texts.

## Source issues

- **Misprint** in CT20 at Table 2, p. 28 (repeated in §3.3, p. 33): the source says the number of classes of index polynomials for `Sp₁₄` modulo negation is 1157; it should be 1158 (recomputed by enumeration); affects nothing.
- **Misprint** in CT20 at §1.4, "A simple example", p. 11: the source says the trace of an order-`i` class on `V_k` has denominator `sin(2π/i)`; it should be `sin(π/i)`, as its own matrix shows; affects nothing.
- **Misprint** in CT20 at §3.3, footnote 13, p. 33: the source says the count 26 comes from the dimension two of the weight-23 cusp space; it should be the weight-24 cusp space (motivic weight 23); affects nothing.
- **Error** in CT20 at §2.4.7, p. 25: the source says the known set has one element for every odd `w ≤ 53` other than 13 and those below 11; it should have `dim S_{w+1}` elements (two at `w = 23`, four at `w = 53`); affects nothing.
- **Misprint** in CT20 at §4.1, proof of Proposition 4.1, p. 36: the source says the bound defining the one-class list is the transform at `i/π`; it should be at `i/(4π)`; affects nothing.
- **Misprint** in CT20 at §4.1, proof of Proposition 4.1, p. 36: the source says the 187 resistant elements belong to the two-class list and counts 12293 against 12230 elements; it should name the one-class list with one consistent count; affects nothing.
- **Error** in CT20 at §4.1, proof of Proposition 4.1, assertion (a), p. 36: the source says every parameter other than the exceptional one carries at most one class; it should say at most one class outside the known set, since `I₂₃` carries two; affects nothing.
- **Misprint** in CT20 at §4.3, proof of Theorem 4, p. 38: the source says the dual pair is excluded with self-duality flag and multiplicity both equal to 2; it should be flag 0 and multiplicity 2; affects nothing.
- **Misprint** in CT20 at §5.3.1, p. 48: the source says 199 parameters of which 59 pass, for genus at least one; it should be 198 and 58 in positive genus (199 and 59 with genus zero), as its Tables 5–6 show; affects nothing.
- **Error** in CT20 at §5.3.2, after (5.3.1), p. 50: the source says the Rallis relation for the lift to any genus `g ≥ g₀` adds a block of length computed from the degree `g₀`; it should use the genus `g` of the lift; affects nothing.

## For the human reviewers

- **Licence.** CT20 line 2450 names an online dataset on the authors' pages as the only place that lists the mass values, the 187 residual parameters and the set `V` (README §§4.18, 5.4); it has no manifest entry and no stated licence.
- **Licence.** BoechererNote is an unpublished three-page note on an author's page (`sources.toml`, `licence_class = "answered-by:CBirkbeck"`); README §§6.12 and 8.7 take their five order computations from it.
- **Scope.** README §§5.4–5.10, 4.13–4.17 and 7.4 state results whose published proofs are computer verifications (CT20 lines 1337, 1485, 1539, 1974 refer to the authors' programs); the roadmap states them as targets and supplies no algorithm.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "56357cf455bb49109d6c93876eb950c92162017d", "job": "RT-LevelOneAutomorphicFormsForClassicalGroups~1b", "model": "fable", "worker": "chris-x26"} -->
