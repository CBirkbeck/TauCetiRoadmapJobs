<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13155#issuecomment-6849507250 -->
Review (claude) of 86aea1c

Verdict: needs_changes

1. **F01** (P2) §3.2 uses the conditional half of §1.8 but lies outside the stated scope of the standing premises

   **Location.** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:164`, "to §§3.3–3.16,
   4.11 and after"; `:1200`, "Every statement from §3.3 on carries the supplier's standing premises";
   `:1243`, "Only pairs of opposite type can contribute a sign `−1` to `E_i`, by §1.8."

   **Claim.** §3.2 is unconditional: it identifies `E_i = ∏_{j ≠ i} ε(π_i × π_j)^{min(d_i, d_j)}` with the
   epsilon character of ModularityAndLanglandsExtensions §3.8 and says same-type pairs contribute `+1`.

   **Witness.** README:632–635 (§1.8, as repaired in round 6): the same-type root number `ε(π × π′) = 1`
   holds "under the standing premises". Arthur's `ε_ψ` ignores orthogonal × orthogonal pairs, which enter
   `E_i` with odd exponent `min(d_i, d_j)`; so both the identification and the bullet need that statement.

   **Exact repair.** README:164 `§§3.3–3.16` → `§§3.2–3.16`; README:1200 `from §3.3 on` → `from §3.2 on`;
   §3.2 `*Needs:*` → "§§1.8 (with the standing premises), 3.1; ModularityAndLanglandsExtensions §3.8".
   Tested on the instance: for `Δ₁₇[8] ⊕ [9] ⊕ [7] ⊕ [1]` the three trivial blocks pair with odd exponents
   `7, 1, 1`; §3.2 then cites §1.8 inside the premise scope. §3.1 needs no change (its type condition is a
   hypothesis, not a claim), and the Layer 7 Dependencies line `§§3.3–3.16` may stay.

2. **F02** (P3) "ModularForms Layers 3–4" is cited for content that main has moved into pinned Tau Ceti

   **Location.** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:428`, "ModularForms Layers
   3–4: the Petersson product, the simultaneous Hecke eigenbasis of level-one cusp forms, normalized
   eigenforms"; also `:102`, `:1153`, `:1156`, `:1193`.

   **Claim.** ModularForms Layers 3–4 supply the Petersson product and the simultaneous Hecke eigenbasis.

   **Witness.** `TauCetiRoadmap/ModularForms/README.md:632` and `:670` on main: Layer 3 is "fixed-character
   old and new spaces" (§3.1), Layer 4 "primitive associates" (§4.1); its table at `:338` sends the earlier
   Layers 3–4 to Tau Ceti. Pin: `TauCeti/NumberTheory/ModularForms/Petersson/Eigenbasis.lean:169`.

   **Exact repair.** Under "From Tau Ceti" add
   `HeckeRing.GL2.exists_peterssonOrthonormalBasis_eigenformAwayFromLevel`
   (`TauCeti/NumberTheory/ModularForms/Petersson/Eigenbasis.lean`), `HeckeRing.GL2.Newform`
   (`.../Newforms/Newform.lean`) and `HeckeRing.GL2.Newform.basis` (`.../Newforms/OrthogonalBasis.lean`: a
   basis of the newspace indexed by newforms; at level one the oldspace is zero). Replace "ModularForms
   Layers 3–4" by these names at README:102, 428, 1153, 1156 and 1193, and list them under "Already in the
   pinned libraries". Tested: §2.20 needs "number of normalized eigenforms of `S_{w+1}(SL₂(ℤ))` equals its
   dimension", which is `Newform.basis` at `N = 1` (`dim S₂₄ = 2`, two newforms).

3. **F03** (P3) `Suggested.lean` imports a Tau Ceti module it does not use

   **Location.** `packages/LevelOneAutomorphicFormsForClassicalGroups/Suggested.lean:8`,
   `public import TauCeti.LinearAlgebra.IntegralLattice.Isometry.Group`.

   **Claim.** The header lists only the Tau Ceti modules actually used.

   **Witness.** The only isometry object in the file is the structure `TauCeti.IntegralLattice.Isometry`,
   declared at `TauCeti/LinearAlgebra/IntegralLattice/Isometry/Basic.lean:77`; nothing of
   `Isometry/Group.lean` (the group structure, determinants) occurs.

   **Exact repair.** Replace line 8 by
   `public import TauCeti.LinearAlgebra.IntegralLattice.Isometry.Basic`. Tested on a scratch copy with that
   single change: it elaborates with the same four `declaration uses 'sorry'` warnings and nothing else.

4. **F04** (P3) a Check of §5.4 asserts that the dimension bound on `V` is attained; the source gives only the bound

   **Location.** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2072`, "Its dimension `14`
   is the minimum attained on `V`."

   **Claim.** Some element of the 181-element set `V` has dimension 14.

   **Witness.** CT20 lines 1430–1431 (after Proposition 4.1, p. 35) state only the two-sided bound
   `14 ≤ dim U ≤ 42` for the 181 parameters; the list itself is in the authors' data files, not in a cited
   text. The one element of `V` the README names, `A` of §5.8, has dimension 16.

   **Exact repair.** Replace the sentence by "Its dimension `14` equals the lower bound `14 ≤ dim U` that
   CT20 records for the elements of `V`." Tested against the instance: the reworded sentence is exactly CT20
   lines 1430–1431 and no longer asserts a 14-dimensional member of `V`.

5. **F05** (P3) the split-orthogonal contract lists types and forms in crossed order

   **Location.** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:425`, "types `B_n` and
   `D_n` over `ℤ` with the special orthogonal group schemes of the regular forms `x₁x_{2n} + ⋯` and
   `x₁x_{2n+1} + ⋯ + x_{n+1}²`".

   **Claim.** Read in order, type `B_n` is matched with the form in `2n` variables and `D_n` with the one
   in `2n + 1`.

   **Witness.** README:520–522 (§1.3) has the correct pairing: `SO_{2n+1}`, type `B_n`, with
   `x₁x_{2n+1} + ⋯ + x_{n+1}²` (rank `2n + 1`), and `SO_{2n}`, type `D_n`, with `x₁x_{2n} + ⋯` (rank `2n`).
   For `n = 1` the contract's order pairs `B₁` with the rank-2 form `x₁x₂`.

   **Exact repair.** In README:424–427 write "of types `B_n` and `D_n` over `ℤ` with the special orthogonal
   group schemes of the regular forms `x₁x_{2n+1} + ⋯ + x_nx_{n+2} + x_{n+1}²` and `x₁x_{2n} + ⋯ + x_nx_{n+1}`
   respectively". Tested at `n = 1`: `B₁ ↔ x₁x₃ + x₂²` (rank 3, `SO₃`), `D₁ ↔ x₁x₂` (rank 2). The slug and
   the plan are unchanged; the plan's `needs` sentence has the same crossed order and cannot be edited at
   this stage, so the supplier should be read against the README wording.

Five findings: one P2 and four P3; one blocking. The four findings of round 5 are repaired. The
mathematics of every repaired passage and of all fifteen sampled targets is sound; the findings are a
premise scope the last repair left one section short, a supplier citation that main has moved into the
pinned library, an unused import, a Check that reads more than its source says, and a crossed
enumeration in one supplier contract. No package input was edited.

## Verified sound

### Round-5 findings, finding by finding

| Round-5 finding | Repaired passage (quoted) | Status and what I recomputed |
| --- | --- | --- |
| F01 (P1), lost minus sign in `J_F(1 − e)` | §2.3: "`J_F(1 − e) = −∫_ℝ (Γ_ℝ′/Γ_ℝ(1/2 + 2πit) − Γ_ℝ′/Γ_ℝ(3/2 + 2πit)) F̂(t) dt`" and "`J_F(1 − e) = ∫_0^∞ F(x)/(2 cosh(x/2)) dx`" | **Repaired.** `D(s) = ½(ψ(s/2) − ψ((s+1)/2))`, so `D(s) + D(s+1) = −1/s`; `D₀(s) + D₀(s+1) = ∫_0^∞ e^{−sx} dx = 1/s`; `D ≤ 0` on `(0, ∞)` gives `|D(x)| ≤ 1/x`; a 2-periodic function tending to `0` vanishes. At `s = 1/2 + 2πit`, `e^{−x/2}/(1 + e^{−x}) = 1/(2 cosh(x/2))`. Matches CT20 line 649, (2.3.4). |
| F02 (P2), type criterion restricted to regular classes | §1.8: "a self-dual `π ∈ Π_alg` some weight of which has multiplicity one in `L(π∞)` is symplectic when `w(π)` is odd" | **Repaired.** CT20 lines 597–602 (§2.2, p. 14) ask for one simple weight. Route checked: `1, e, I_v` pairwise non-isomorphic and self-dual; a lone `I_v` carries one invariant form, alternating iff `det I_v = e^{v+1} = 1` iff `v` odd; a lone character is symmetric. `2I₁` control: both forms exist. Supplier text read at its head: ModularityAndLanglandsExtensions §3.8 has "Localization at v has parameter `⊕rec(µ_(i,v))⊗ν_(b_i)`" into `^LG`. The premise scope it introduced stops one section short: R01. |
| F03 (P3), order of `1/ω_g` | §6.12: "each simple trivial zero … lowers the order of `R` by one" | **Repaired.** `ω₁₆(12 + 2s) = ζ(12 + 2s) ∏_{i ≤ 16} ζ(24 + 4s − 2i)`: zeros at `i = 13, …, 16` (arguments `−2, −4, −6, −8`), `ζ(0) ≠ 0` at `i = 12`; order 4, reciprocal `−4`. Genus 24: `i = 13, …, 24`, order 12. |
| F04 (P3), §3.16 missing from the docstring | `Suggested.lean:44`: "the triangular relation `EP(G; λ) = κ(G, λ) N⊥(w(λ)) + R(G, λ)` … (§3.16)" | **Repaired.** The bullet names the missing carriers; no declaration was added. |

Consequential change of the repair, §2.9: `ε(U²) = (−1)^{ab + (a+b+1) Σ c_v(v+1)}` for
`U = a·1 + b·e + Σ c_v I_v`. Recomputed by hand: `ε(e)^{2ab} = (−1)^{ab}`; `ε(I_v)^{2(a+b)c_v} =
(−1)^{(a+b)c_v(v+1)}`; diagonal `I_v² = I_{2v} + 1 + e` gives `i^{2v+2} = (−1)^{v+1}` with multiplicity
`c_v² ≡ c_v`; off-diagonal pairs occur twice and give `+1`. With `det U = e^{b + Σ c_v(v+1)} = 1` the
exponent is `ab + (a+b+1)b ≡ 0`. `I₀ = 1 + e`: exponent `1`, value `−1`, as the §2.9 Check says.

Pattern search for the four repaired defects in the rest of the package: no other integral description
of `J_F`; no other statement narrower than its source among the sampled targets; no other "raise/lower
the order"; every Summary headline is stated or named in the docstring (table below).

### Seeded sample: fifteen targets against the texts

Numbers are lines of the cached extractions; pages are printed pages. CT20 is the HAL manuscript the
manifest records. No source was fetched; the manifest is unchanged and records all eight cited works.

| Target | Locator opened | Result |
| --- | --- | --- |
| 1.4 Dimension, determinant, gamma, epsilon | CT20 lines 572–580, §2.1, pp. 13–14 | `Γ(s, 1) = π^{−s/2}Γ(s/2)`, `Γ(s, I_w) = 2(2π)^{−s−w/2}Γ(s + w/2)`, `ε(I_w) = i^{w+1}` for `w ≥ 0`; so `ε(I₀) = i`, `ε(e) = i`. Agrees. |
| 2.10 Local Rayleigh minimum | CT20 lines 789–798, Lemma 2.6, p. 19 | Statement and both proof steps agree; the pinned lemma gives only the eigenvector. |
| 2.18 Positive definite covers | CT20 lines 881–890, Remark 2.11, p. 21; lines 1432–1437, §4.1, p. 35 | Rational lower bounds of the Gram matrix, used on effective vectors only; agrees. |
| 2.21 Repeated-weight `PGL₄` vanishing | CT20 lines 1036–1043, §2.4.7, p. 25 | Odd `1 ≤ w ≤ 53`, `U = 2I_w`, `δ = m = 1`, `ℓ = 5`, `S` the eigenform classes. The source's count of `S` is wrong (Source issues); the README's is right. |
| 3.9 Packet character in case (I) | CT20 lines 1797–1836, (5.2.2)–(5.2.3), pp. 44 | Sign identity, `e_s`, both branches and `δ`-independence agree. |
| 3.11 Even generators in case (H) | CT20 lines 1863–1902, (5.2.4)–(5.2.7), pp. 45–46 | List with `g − k + 1` omitted in (H2); the three branches agree, including `d_i = 1`, `r_i = 2`. |
| 4.16 Easy and hard indices of `Sp₁₆` | CT20 lines 1384–1411, §3.3, p. 34 | Definition and `766` agree; the `1427` and `1086` of §4.17 are at lines 1379 and 1412–1413. |
| 5.4 Weight-23 cover | CT20 lines 1432–1505, §4.1, pp. 35–37 | `ℓ = 9.74 = 487/50`; 187 residual; the six multiplicity-free parameters; `V` of 181 with (i)–(iii). The Check on dimension 14: R04. |
| 5.10 Three classes of weight 24 | CT20 lines 272–275, Theorem 5, p. 7; lines 1543–1547, p. 38 | Weights agree. The README's `Sp_{2n}`, `n ≤ 7`, corrects the source (Source issues). |
| 6.1 Siegel operator, standard `L` | CT20 footnote 17, p. 49 | `L(s, St, F) = L(s, St, Φ_gF) ζ(s − (g − k)) ζ(s + (g − k))`; agrees. |
| 6.8 Lattice eigenparameters | CL14 lines 473–477 (Théorème D, p. 9), 559–572 (Théorème E, Table I.2, p. 12), Table C.5 (p. 440); CT20 lines 2100–2106 | All 24 parameters, degrees and the dimension row `1,1,1,2,2,3,3,4,2,2,1,1` agree; surjectivity for `g ≤ 23` is Théorème D. |
| 6.9 Rallis relation | CT20 lines 2086–2090, §5.3.2, p. 50 | Agrees, with the genus `g` in place of the printed `g₀`. |
| 7.4 Regular enumeration | CT20 lines 1962–1975, §5.3.1, pp. 47–48 | Source: 199 parameters, 59 passing. README counts recomputed (table below). |
| 7.6 Scalar case (H1) | CT20 lines 2016–2112, Lemmas 5.5–5.7, pp. 49–51 | `(g, k) = (14, 13)`, `Sym²Δ₁₁[3] ⊕ Δ₁₁[8] ⊕ [3] ⊕ [1]`, `k ≡ 0 mod 4`, noncuspidality: agree. |
| 8.9 Rank-sixteen harmonic source | CT20 lines 2281–2285, §5.4, p. 55 | Dimension 2, parameters `Δ₂₁,₁₃[4]` and `Δ₁₇[8]`; agrees. |

Also opened for the Lean headlines: CT20 lines 1245–1262, Proposition 3.7 (pp. 30–31), and Mil02 lines
137–139, Theorem 1.6. No author-flagged unverified locator remains other than KT87.

### Adversarial table

Rows cover the sampled targets, the Lean declarations, the repaired passages and every finding. For
text no repair touched outside the sample I relied on the round-5 rows that carry computed values, and
recomputed the ones marked "recomputed".

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| §1.4 `Γ`, `ε` on `K∞` | `I₀`; `I₁₁`; `w = 0` | `Γ_ℝ(s)Γ_ℝ(s+1) = Γ_ℂ(s)`; `i¹² = 1`; `ε(1)ε(e) = i = i^{0+1}` | holds |
| §1.8 simple-weight criterion | `I₁ + 2I₂₃`; `2I₁`; `(1,0,0,−1)`; rank 1 | dim 6, det `e²·e⁴⁸ = 1`, lone `I₁` alternating; both forms; `±1` simple; weight `0` simple, symmetric, `w = 0` even | holds |
| §2.2 Odlyzko scalars (recomputed) | `û`, `ĝ`, `Ĝ_ℓ(i/(4π))` | `ĝ(ξ) = 8cos²(πξ)/(π²(1 − 4ξ²)²)`, `ĝ(0) = 8/π²`; `4π²ℓ(1 + cosh(ℓ/2))/(ℓ²/4 + π²)²`; `g″(0) = −π²`, `g″(1) = 0` | holds |
| §2.3 closed form | `s = 1`; recurrences | `D(1) = −log 2`, `D₀(1) = log 2`; `−1/s` and `+1/s` | holds |
| §2.8 multiplicity bound | `x = m⁻¹Σπ_i` | `A_F m/m² − J_F(U²) − (B_F/(2m²))Σe⊥ ≥ 0` | holds |
| §2.9 `ε(U²)` | general `U`; `I₀` | exponent `ab + (a+b+1)b ≡ 0` when `det U = 1`; `−1` for `I₀` | holds |
| §2.10–2.12 | `diag(1,2)`; `[[1,2],[2,1]]`; `a = c = 1, b = ±2` | `(0,1)` a maximum; eigenvalues `3, −1`, cone minimum `1`; `−2` at `(1,1)` versus minimum `1` | holds |
| §2.15 compression | `A_F = 1`, kernel 1, block of size 2 | expanded `[[0,−1],[−1,0]]`, minimum `−1`; compressed `−1/2`; lift value `−t²/2` both sides | holds |
| §2.19 Miller | `N = 2n+2`, `2n+1` | weights `±1/2, …, ±(2n+1)/2`; `det = e^n·e^n = 1`; `N ≤ 26` | holds |
| §2.21 | `w = 23, 53` | `dim S₂₄ = 2`, `dim S₅₄ = dim M₄₂ = 4`; 27 odd `w` | holds |
| §3.2 epsilon character | `Δ₁₇[8] ⊕ [9] ⊕ [7] ⊕ [1]` | orthogonal pairs with exponents `7, 1, 1`, all odd | R01 |
| §3.3 multiplicity test | `Δ_w[2] ⊕ [1]`, `k = (w+3)/2` | `χ = (−1)^{4/4} = −1`, `ε_ψ = i^{w+1} = (−1)^{k−1}`; passes iff `k` even | holds |
| §3.4 unitarity | `g = 3`, `k = (1,0,0)`; `g = 2`, `(1,1)` | `0 ≥ 1/2` false; `1 ≥ 0` true | holds |
| §3.7 (H2) | `k = 2` | forces `g = 2`, `d = 3`, `n = 1`, `π = 1`, which lacks `e`: impossible, so `k′ ≥ 2` | holds |
| §3.9 sign identity | `(ε, a) = (−1, 1), (1, 3)` | `−1 = −1`; `−1 = −1` | holds |
| §4.4, §4.9 index sets (recomputed) | all degrees by enumeration | `Sp`: `3, 12, 32, 92, 219, 530, 1158, 2521`; odd `SO`: `5, 19, 59, 165, 419, 1001, 2257, 4877` and `P₁`: `3, 12, 34, 99, 244, 598, 1339, 2948`; `SO₄,₈,₁₂,₁₆`: `12, 92, 530, 2521` and `6, 40, 211, 992` | all agree; `Sp₁₄` is 1158 |
| §4.6 Zassenhaus translation | order-4 rotation; hyperbolic `diag(t, t⁻¹)` | `(1+i)(1−i)/4 = 1/2 ∼ 2 = Φ₄(−1)`; `Q(−1) = (1+t)²/t`, `Q(1) = −(1−t)²/t` | holds |
| §4.10 characters (recomputed) | `λ = (2)` for `Sp₂`, `SO₃`; `λ = (1)` | `e₁² − e₂ = x² + 1 + x⁻²`; `e₁² − e₂ − 1 = x² + x + 1 + x⁻¹ + x⁻²`, `5` at `1`; `e₁` | holds |
| §4.12 `SO₃` (recomputed) | five rows against `m = (−1/12, 1/4, 1/3, 0, 0)` | `1/2, −1/2, −1/2, −1/2, −1/2`; `k = 5`: `11/12 + 3/12 + 4/12 − 6/12 = 1` | holds |
| `spinor_charpoly_obstruction` | `n = 0, 1`; hyperbolic plane; `SO₃ = PGL₂`; `x₁x₄ + x₂x₃` | `Q = 1`; over all `p` only `t = ±1`, `(a,b,Q) = (2,0,1), (0,1,1)`; orders 3, 4, 6: `Q(−1) = 1, 2, 3`, the last two have determinant `2`, `3` in `PGL₂`, non-units at `p = 2, 3`; `Φ₄²`: `4, 4`; `Φ₁₂`: `1, 1` | no counterexample |
| `IsRegularIntegralForm` | `[]`; `x²`; `xy`; `x² + y²`; `x₁x₃ + x₂²` | `1`; `2` (odd); `−1`; `4` (fails); `−2` (odd) | holds |
| `invariantAlternatingForms_eq_bot_of_roots_span` | rank 1 root lattice; degenerate form with a root; indefinite lattice | `ω(x) = ω(−x)`; reflection needs only `x·x = 2 ≠ 0`, giving `ι_x ω = 0` for each root, hence `ω = 0` when roots span | true without positivity |
| `finrank_invariantAlternatingForms_of_rootless` | `g = 0, 8, 24, 25`, odd `g` | `t²⁴ + t¹⁶ + t¹² + t⁸ + 1`: `1, 1, 1, 0`; `−1` kills odd degrees | holds |
| `thetaCoefficient`, nonvanishing | `g = 24` | summation set `O(Leech)·u`, value `±8315553613086720000`; `g = 8`: `|O|/10 · 5` | holds |
| §5.4, §5.5 | `U_exc`; first multiplicity-free residual | `U_exc ∈ U₂ ⊂ U₁`, not among the 187; `I₃ + I₁₁ + I₁₇ + I₂₁ + I₂₃` is the known `PGL₁₀` parameter, `N⊥ = 1` | holds; R04 for the dimension Check |
| §5.7, §5.9 | counts | `181 + 2 = 183`; `1 + 5 + 2 + 1 + 4 + 3 = 16` classes in 15 blocks; `1260 − 4 = 1256` | holds |
| §5.10 ranks | weight 24, rank `≤ 16` | even rank `≡ 2 mod 4` has `det = e`; odd ranks to 15 need `Sp₁₄` | holds |
| §6.1 | `g = 1`, `k = 4` | `ζ(s)ζ(s+3)ζ(s−3)` for `E₄` | holds |
| §6.3 neighbours | rank 16, `p = 2` | `255·129 = 32895 = 18225 + 14670 = 12870 + 20025`; `12870·405 = 18225·286 = 5212350`; `|O(E₈²)|/|O(D₁₆⁺)| ≈ 1.41608 = 405/286` | holds |
| §6.8 table | 24 rows | every dimension is 24; degree rule gives `0, 1, …, 12` with distribution `(1,1,1,1,2,2,3,3,4,2,2,1,1)` | holds |
| §6.9 | `n = 16, g = 4`; `n = 24, g = 12` | `Δ₁₁[4] ⊕ [7] ⊕ [1] = ψ_F ⊕ [7]`; `ψ_F = Δ₁₁[12] ⊕ [1]` | holds |
| §6.12, §8.7 (recomputed) | the five cases | `γ`: poles at odd `i ≥ 9` for `g = 16` (4), odd `i ≥ 1` for `g = 24` (12); `Γ_A`: `5 + 3 + 1 = 9` and `13 + 12 = 25`; rows `(0,0,0,−1,1)`, `(0,0,0,0,0)`, `(0,0,0,−1,1)`, `(0,−4,−4,−1,9)`, `(0,−12,−12,−1,25)` | all sum to `0` |
| §7.2 Igusa controls | `k = 20` | monomials `E₄⁵, E₄²E₆², E₄²χ₁₂, E₄E₆χ₁₀, χ₁₀²`: `5 − 2 = 3 = 1 + 2 + 0` | holds |
| §7.4 (recomputed by a full enumeration with the sign test) | all block sets from `L₂₄` with distinct weights `≤ 12` | two `Δ₂₃` classes separate: 224 with genus zero, 223 in positive genus; identified: 199 and 198; passing: 59 with genus zero, 58 without; 29 scalar, 29 nonscalar; the 25 extra all fail | agrees with README and with CT20's 199 and 59 |
| §§7.8–7.9 tables | the 58 passing parameters of that enumeration | the list is exactly the 29 rows of §7.8 and the 29 regular rows of §7.9, weight by weight | holds |
| §7.6 | `(14, 13)` | dimension `9 + 16 + 3 + 1 = 29`; `ε(I₁₁(I₂₂ + e))³ = (i³⁴ i¹² i¹²)³ = −1`; `χ = (−1)^{16/4} = 1` | holds |
| §7.10 | `g = 24` | `±12` once, `±1, …, ±11` twice, `0` three times on both sides | holds |
| §8.4 | orientable orbits | degrees `0,1,7,8,9,11,12,13,15,16,17,23,24` with dimensions `1,1,1,2,1,1,2,1,1,2,1,1,1`, the coefficients of the displayed polynomial | holds |

### Lean file

`lake env lean` on the package's `Suggested.lean`, run from the content checkout: exit 0, the only
messages are four `declaration uses 'sorry'` warnings, at lines 85, 129, 142 and 154. No Tau Ceti module
had to be built. One file-level defect: R03.

`#check @name` for all eight declarations in one scratch file: the elaborated types agree with the
README statements and with the supplied signature list; no binder is lost. The two rootless theorems
carry evenness, unimodularity, positivity, rank 24 and rootlessness; the root-span theorem carries the
span hypothesis and `0 < g`; the spinor theorem carries regularity and the all-primes hypothesis. The
four definitions have real bodies; there is no `set_option`, no sorried data, `theorem` throughout.

One-tactic probe on each of the four sorried theorems, with `simp`, `rfl`, `infer_instance`, `aesop`,
`omega`, `decide`, `trivial` and `exact?`: 28 errors for the first seven tactics (none closes any
theorem); `exact?` returns only the sorried declaration itself in the same file, so no library lemma
proves any of them. None restates a definition, computes a small value or mirrors a Check. No padding.

| Headline of the Summary | Disposition |
| --- | --- |
| Cone inequality, Miller, `PGL₄` vanishing (§§2.7, 2.19, 2.21) | docstring, carrier missing |
| Triangular relation (§§3.15–3.16) | docstring, carrier missing |
| Torsion masses (§§4.13–4.18) | docstring, carrier missing |
| Spinor obstruction (§4.7) | `spinor_charpoly_obstruction` |
| Classifications in weight ≤ 22, 23, 24 and under GRH (§§5.3–5.10) | docstring, carrier missing |
| Genus ≤ 8 dimensions, the 29 + 32 rows, four weight-13 forms (§§7.3, 7.8–7.10) | docstring, carrier missing |
| Eichler basis, harmonic realizations, theta isomorphisms, stable range (§§8.1, 8.8, 8.10, 8.12–8.14) | docstring, carrier missing |
| Leech invariant forms; root-spanned vanishing (§8.5) | two theorems |
| Leech theta nonvanishing (§8.6) | theorem; the exact value `±n_g e_g` is in the docstring |

§§2.10–2.12 and 8.3 are statable at the pins but are auxiliary statements, not headlines; their absence
is correct. All eight backticked names the README presents as its own are declared.

### Pinned declarations opened

`Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:312` (`Complex.Gamma_add_one`);
`.../Gamma/BohrMollerup.lean:111` (`Real.convexOn_log_Gamma`); `Mathlib/Analysis/Fourier/Inversion.lean:175`
(`Continuous.fourierInv_fourier_eq`); `Mathlib/Analysis/InnerProductSpace/Rayleigh.lean:266`;
`Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:65`, `:262`;
`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1154` (`Matrix.toQuadraticForm'`).
`TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63`; `Even.lean:67`; `Unimodular.lean:61`;
`Signature.lean:171` (`IsPosDef` is positivity of the quadratic map, a separate predicate);
`Norm.lean:78`, `:221`; `Isometry/Basic.lean:77` (a form isometry equivalence of the ambient spaces
mapping the carrier onto the carrier, so reflections in roots are isometries);
`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:98`;
`TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:120`, `Smooth.lean:93`;
`TauCeti/InformationTheory/Coding/Binary/Golay/Basic.lean:66`, `:136`, `:563`, `:606`, `:662`;
`TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Golay/Basic.lean:33`;
`TauCeti/NumberTheory/ModularForms/Petersson/Eigenbasis.lean:169` and
`.../Newforms/OrthogonalBasis.lean:256` (R02). None of the four Lean headlines exists at the pins.

### Citations resolved, duplication and ownership

Resolved now, at main (7342e8f) or at the open head: ModularityAndLanglandsExtensions §§3.4, 3.8, 3.15,
3.17, 3.20–3.22 (§3.22's third Check is the `π₂(1)` example the README quotes);
AutomorphicLFunctionsAndLocalFactors §§AL.1.4.3, AL.3.2.3, AL.3.3.8, AL.3.6.1–3, AL.3.7, AL.3.9.2 and
AL.3.9.4 (its third bullet has the all-rank strip bound "outside fixed neighborhoods of the polar
points"); AnalyticNumberTheoryPartI §§1.3, 1.8 (`WeilTestFunction`); SmallRamificationAndAbelianVarietyBaseCases
§§1.5–1.7 (`odlyzkoKernel`, `poitouTestFunction`); SymplecticReidemeisterTorsionModSquares §4.1
(`zassenhaus_primary_formula`); GeometryOfNumbersAndQuadraticArithmetic §2.4 and 2.4.2;
ComputationalNumberTheory §§4.17, 4.17a, 4.18, 4.26, 4.29–4.34, 5.1; OrthogonalTamagawaAndLatticeMass
§§3.1, 4.1, 4.2; CFSGBasicProperties P2-L (no average characteristic polynomial there, so the gap asks
for nothing already present); AutomorphicFormsOnReductiveGroups §§2.5, 5.5, 6.7, 6.8, 7.2, 7.2a, 7.4,
7.5; AutomorphicSpectralTheory §§4.4, 4.5, 4.10, 6.9, 6.17, 6.19, 6.20; MetaplecticAutomorphicForms
§§0.15, 2.4c, 3.1, 3.4, 3.5, 3.7, 3.10, 3.21, 5.1, 5.6, 6.14; AutomorphicBundles §§11.1, 11.2, 11.9,
11.16, 12.10, 12.11, 12.13, 12.15; on main ThetaSeries Layers 1, 5, 8 (8C gives
`Θ_L = E₄³ + (r_L(2) − 720)Δ`), Rank24LatticeConstructions Layer 6, SporadicOrders Layer 1
(`244823040`), IntegralLattices §4G, ReductiveGroups Layer 9, LieHighestWeight Layer 6, ClassicalGroups
Layers 3–5, and the completed IntegralLattices Layer 1, AlgebraicCodingTheory Layer 5 and
OrthogonalSpinGroups Layer 1. The one that no longer says what the README says of it is ModularForms
Layers 3–4: R02.

Searches by object over the open heads and main (Miller's theorem, the Stark–Odlyzko cone inequality,
the spinor obstruction on characteristic polynomials, invariant alternating forms of lattices) found no
second owner and no equal fully qualified name. The package is not a second copy of a roadmap on main,
and no open pull request changes it; `scratch/overlaps.md` lists no dropped id and no id defined only by
an open revision.

Overlap check: read SiegelModularForms, OrthogonalTamagawaAndLatticeMass, AutomorphicLFunctionsAndLocalFactorsPartII, ModularityAndLanglandsExtensions, AutomorphicSpectralTheory, Rank24LatticeConstructions, ThetaSeries, AlgebraicCodingTheory; the genus-`g` and harmonic theta maps of even unimodular lattices, the level-one Siegel operator statements and the level-one cusp dimensions are owned here and cited by SiegelModularForms (its Scope, §§6.1–6.2, 6.4, 6.7, 7.3, 7.9 of this roadmap); the rank-24 classification and `|O(Leech)|` are owned by OrthogonalTamagawaAndLatticeMass and CFSGBasicProperties and cited here; nothing else shared.

### Supplier order

```text
depcheck: 206 roadmaps, 1912 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every `*Needs:*` line names an earlier roadmap, a pin or an earlier
section; SiegelModularForms appears only as a consumer. None of the forbidden suppliers is cited.

### Declared gaps

The eight slugs of `design/plan.json` (`sp2g-lowest-weight-modules`, `siegel-adelic-lift`,
`gross-volume-rationality`, `same-type-pair-root-number`, `boecherer-theta-image`,
`integral-spinor-norm-units`, `split-orthogonal-regular-form`, `conway-group-average-charpoly`) each
appear in the README under their supplier with the "What … must provide (gap:…)" sentence, each with a
named supplier. Each asks for one result with its hypotheses and for nothing the supplier's head or the
pins already state. The wording slip in one of them is R05; it is not a vague or compound `needs`.

### Principles and shape

No route-specific shortcut (every prime, `p = 2` included, in the spinor obstruction); no re-planned
roadmap; computations are left to ComputationalNumberTheory; no copied passage; no process residue, no
LaTeX delimiters, no machine path, no pull-request number in the four inputs. The layers are named by
their mathematics and their order is forced (§4.11 needs §3.16, Layer 5 needs Layers 2 and 4, Layer 7
needs Layers 3–6). All eight layers end with Examples and Dependencies; every definition read has its
API and at least three Checks.

## Not verifiable

- **KT87**, pp. 466–511: settled as uncertified; the determinantal formulas of §4.10 were checked only
  on the small cases in the table above.
- **The 181-element list `V`, the 12106 exclusion triples, the mass tables and the rank computations**
  of CT20 §§3.3 and 4.1–4.3: they are in the authors' data files, which no cited text contains. I
  checked the statements about them against CT20 and recomputed what the paper's text determines (index
  sets, the `SO₃` system, the §7.4 enumeration). This is also why R04 cannot be settled the other way.
- **Ownership against open pull requests** was checked through the roadmap search tools at the indexed
  heads; a head the index could not serve would not have been seen.

## Source issues

- **Error** in CT20 at §2.4.7, printed p. 25: the source says the set of elliptic eigenform classes is empty for w = 13 and w < 11 and has one element otherwise; it should be dim S_(w+1), which is 2 at w = 23 and 4 at w = 53; affects the proof.
- **Misprint** in CT20 at Table 2 and §3.3, printed pp. 28 and 33: the source says the symplectic index set of Sp₁₄ modulo negation has 1157 elements; it should be 1158, by enumeration of the definition; affects nothing.
- **Misprint** in CT20 at §4.1, proof of Proposition 4.1, printed p. 36: the source says the exclusions with δ = m = 1 leave 187 elements of the two-class list U₂; it should be the one-class list U₁; affects the proof.
- **Misprint** in CT20 at §4.1, proof of Proposition 4.1, printed p. 36: the source says U₁ has 12230 elements and then counts 12293 − 187 = 12106 triples; it should use one cardinality in both places; affects nothing.
- **Misprint** in CT20 at §4.1, proof of Proposition 4.1, printed p. 36: the source says the one-class bound is the transform evaluated at i/π; it should be at i/(4π), as in Corollary 2.3; affects nothing.
- **Error** in CT20 at §4.1, proof of Proposition 4.1, printed p. 36: the source says no self-dual class has any of the six multiplicity-free residual parameters; it should except the first, which is the known PGL₁₀ class of Theorem 3; affects the proof.
- **Misprint** in CT20 at §4.2, proof of Theorem 5, printed p. 38: the source says the count in rank at most 16 uses symplectic groups Sp_2n with 2n ≤ 8; it should be 2n ≤ 14, since odd ranks up to 15 occur; affects the proof.
- **Misprint** in CT20 at Remark 5.3, printed p. 45: the source says k is at least two while its argument excludes two; it should be k at least three in case (H2); affects nothing.
- **Misprint** in CT20 at §5.3.2, displayed Rallis relation, printed p. 50: the source says the added standard block uses the first-occurrence genus g₀ for every theta lift; it should be the actual genus g of the lift; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "86aea1ca1f437667c71736973b33bf742a6031b0", "job": "REV-PKG-LevelOneAutomorphicFormsForClassicalGroups~6", "model": "fable", "worker": "chris-x58"} -->
