# Review of AutomorphicGaloisRepresentations (pull request #1007 at 0ae744f)

**Verdict:** needs changes

Three findings, all P3; nothing blocking. Both findings of the previous review are repaired. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as its only warning. All three findings are in material new at this head: the three Layer-0 theorems added to `Suggested.lean`, and two Checks in the new §§0.2a and 0.2c.

## R01 (P3) — The three Layer-0 theorems in `Suggested.lean` are lemmas on free variables, not headlines

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/Suggested.lean`, lines 56–89 (`lt_of_slope_sum_le`, `bol_identity`, `eq_zero_of_intertwining_of_norm_lt`) and docstring lines 22–25. In the README they are backticked at lines 645–648 (build paragraph), 1059 (§0.2e) and 1147, 1210 (§0.2f).

**Claim:** None of the three mentions an object this roadmap studies (a quaternionic form, weight, Hecke operator, eigenform or Galois representation):
- `lt_of_slope_sum_le` is an inequality about `ℕ` and `ℝ`;
- `bol_identity` is a power-series identity over an arbitrary field;
- `eq_zero_of_intertwining_of_norm_lt` is the Neumann-series argument for arbitrary normed spaces.

In each case the conclusion is arithmetic or analysis on the hypotheses. They are steps inside §§0.2e–0.2f, not among the Summary's end results. Under the `Suggested.lean` rules a theorem on free variables is not a headline, so these three are padding. All three statements are true (adversarial table below), so the defect is one of policy, not truth.

**Witness:** the elaborated types (`#check @…` on a scratch copy):
- `lt_of_slope_sum_le : ∀ (hU : ℕ), 0 < hU → ∀ {v h : ℝ}, 0 < v → ∀ (n : ℕ), v * ∑ j ∈ Finset.range n, ↑(j / hU) ≤ ↑n * h → n < hU * (⌊2 * h / v⌋₊ + 2)`;
- `bol_identity` binds only `[Field K] (a b c d : K)`;
- `eq_zero_of_intertwining_of_norm_lt` binds arbitrary `E →L[K] E` and `E' →L[K] E'`.

The one-tactic probe does not apply: `simp`, `nlinarith` and `simp_all` all fail. The rule that applies is the free-variable rule.

**Repair:**
- Delete the three theorems, their `/-! ## Layer 0 … -/` header and docstring lines 22–25 from `Suggested.lean`.
- In the README, keep the three statements as prose targets of §§0.2e–0.2f but drop the backticked Lean names at lines 1059, 1147 and 1210, and the clause naming them in the build paragraph (lines 645–648).

**Tested:** a scratch copy without the three theorems elaborates with the single warning `declaration uses 'sorry'` at the §7.7 theorem. The README's own backticked Lean names are then `ordinaryGoodPrimes` and `fixedSquarefreeForm_ordinary_density_one`, both declared.

## R02 (P3) — §0.2a's dyadic Check gives a false reason

**Location:** README §0.2a, Checks, lines 810–812: “At `p=2` the family `u↦exp(w log u)` is formed on `1+4ℤ₂` and extended through `{±1}`; on `1+2ℤ₂` it would need `exp` on `2ℤ₂`, where the series diverges.”

**Claim:** The logarithm maps `1+2ℤ₂` into `4ℤ₂`, so `exp(w log u)` converges for every `u∈ℤ₂^×` and `|w|≤1`. The formula never needs `exp` on `2ℤ₂∖4ℤ₂`. The real obstruction is that `log` kills `−1`: on `1+2ℤ₂` the formula gives the character `u↦⟨u⟩^w`, which is trivial on `−1`, so at `w=1` it is not `u↦u`. That is why the family is formed on `1+4ℤ₂` and the sign is supplied separately. As written, the Check tests the wrong property.

**Witness:**
- For `u∈1+2ℤ₂` we have `u²∈1+8ℤ₂`, so `2log u=log(u²)∈8ℤ₂` and `log u∈4ℤ₂`. For example `log 3=log(−3)`, with `−3=1−4`, has 2-adic valuation 2.
- `exp(log(−1))=exp(0)=1≠−1`.

**Repair:** Replace the clause after the semicolon with: “on `1+2ℤ₂` the logarithm kills `−1`, so `u↦exp(w log u)` is trivial on `−1` and at `w=1` is not `u↦u`; the sign is a separate character of `{±1}`.” If you want to keep the divergence point, attach it to the right object: the weight coordinate of §0.2e uses `exp(4)`, because `exp(2)` diverges.

**Tested:** at `u=−1`, `w=1` the corrected clause predicts the value 1 for the formula and `−1` for `u↦u`, which is what happens. At `u=3` the series `exp(w log 3)` converges, since `v₂(w log 3)≥2`.

## R03 (P3) — §0.2c's real-quadratic Check says a global unit acts as the identity

**Location:** README §0.2c, Checks, lines 948–950: “For `F` real quadratic and maximal level, each stabiliser contains a unit of infinite order. When `n_σ+2s_σ` is parallel that unit acts as the identity, so the stabiliser still acts through a finite group.”

**Claim:** With `n_σ+2s_σ=w` parallel, a unit `u` acts by `∏_σσ(u)^w=N(u)^w=±1`. GL2AutomorphicRepresentationsAndTransfer §R17.3.8a (“Global units”, at its open head, README line 1812) states this as `N_{F/ℚ}(u)^w=±1`. A fundamental unit of norm `−1` therefore acts by `−1` when `w` is odd. The conclusion (action through a finite group) is right; “acts as the identity” is not.

**Witness:** take `F=ℚ(√2)`, `ε=1+√2` with `N(ε)=−1`, and `(n,s)=((1,1),(0,0))`, so `w=1`. Then `ε` acts by `σ₁(ε)σ₂(ε)=−1`. At maximal level `ε` lies in every stabiliser.

**Repair:** Replace “that unit acts as the identity” with “that unit acts by `N(u)^w=±1`”. Optionally add the instance above as a control: `ε=1+√2` acts by `−1` at odd `w`, and `ε²` acts by 1.

**Tested:** `ε` acts by `−1` and `ε²` by `+1`. The image is `{±1}`, which is finite, consistent with the corrected wording.

## Verified sound

### Previous review (round 5)

| Finding | Status at 0ae744f |
|---|---|
| R01 (P2), §1.7 used `a_p` for non-normalized eigenforms | **Repaired.** Conventions, lines 177–184, define `λ_p(f)` and prove `a_p(f)=λ_p(f)a₁(f)`. §1.7 (line 1822) states the attachment with polynomial `X²−λ_p(f)X+ψ(p)p^{k−1}`, and rigidity as “`λ_p(f)=λ_p(f′)` on a prime set of Dirichlet density one … then `k=k′`, `ψ(p)=ψ′(p)` and `λ_p(f)=λ_p(f′)` for every prime `p∤NN′`”. Line 1826 adds “Corollaire 6.3, printed p. 521”. Lines 1830–1843 add the `E₄`, `Δ(3τ)`/`E₄(3τ)`, `Δ`/`Δ(3τ)` and `2Δ` Checks. DeligneSerre line 527–531 (p. 521) concludes `k=k′`, `ε=ε′` and `a_p=a′_p` for `p∤NN′` from equality on a density-one set. |
| R02 (P3), §§6.4a–6.6 restricted `Σ` to `Σ_ρ̄` | **Repaired.** Line 3064 now reads “Let `Σ` be any finite set of primes”. Lines 3072–3078 define `Σ_ρ̄` (DDT Definition 3.25) and state that §6.7 assumes it. Lines 3092–3096 replace the Check with the ramified `p∈Σ` computation (`p·p=p²` against `p³`). §6.6 (line 3149) uses “an arbitrary finite `Σ`”. §6.7 (lines 3206 and 3210–3215) adds `Σ⊂Σ_ρ̄` and explains why it is needed. The new §6.7 Checks at `ℓ=7` and 19 compute correctly (table below). |

The previous review marked no finding “not actionable”, so nothing is re-raised.

### Gate, dependency check, Lean

- **Gate rerun** on this head: every check is 0, then `OK`. `git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds only `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`).
- **Dependency check:** `depcheck: 244 roadmaps, 2484 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0. Its only warnings are four `declaration uses 'sorry'`, at lines 62, 70, 83 and 108.
- **Pins:** the docstring's Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…` match `lake-manifest.json`.
- **Form:** no `set_option`, `lemma`, `#eval`, `True` placeholder or sorry'd data. The imports are `Mathlib` plus two `TauCeti.*` modules, both used.
- **Signatures:** I ran `#check @` on all five declarations in one scratch file.
  - `ordinaryGoodPrimes : {N : ℕ} → [NeZero N] → HeckeRing.GL2.Newform N 2 → Set (HeightOneSpectrum (𝓞 ℚ))`.
  - `fixedSquarefreeForm_ordinary_density_one` keeps `[NeZero N]`, `Squarefree N` and `f.χ = 1`.
  - `eq_zero_of_intertwining_of_norm_lt` keeps `[CompleteSpace E']`.
  - No binder was lost, and each type matches its README statement.
- **One-tactic probe:** `simp` (density, Bol), `nlinarith` (counting bound) and `simp_all` (Neumann) all fail. The density theorem is not padding, and `ordinaryGoodPrimes` is the one definition it needs.
- **Unique names:** `roadmaps grep --lean-only` finds none of the five names in another roadmap.

### Seeded source sample (cached texts; line numbers in each text)

| Target | Source, lines, locator | Result |
|---|---|---|
| 0.1 | Conrad (locchar) Def. B.1 line 1421 (p. 32); Prop. B.3 line 1472 (pp. 33–34); Prop. B.4 lines 1528–1538 (p. 35) with proof to p. 36; Ex. B.5 line 1579 (p. 36). Uses the arithmetic Artin map; `φ^a` acts by `ψ(r_L(π))⁻¹χ(π)`. | Supported; computation in table. |
| 0.2a | Buzzard (Eigenvarieties): forms and Hecke operators lines 2479–2506 (p. 69); `k=n+2`, `w=v+n+1` lines 2510–2511 (p. 70); weight as character of `O_p^×× O_p^×` line 2532 (p. 70); `v(π_j)=1` lines 2549–2550 (p. 71); action `n(cz+d)v(det γ)h((az+b)/(cz+d))` lines 2583–2584 (p. 72). Jacobs: Def. 1.27 with monoid `Σ_α` and (1.5.13), lines 719–746 (p. 19). | Supported. The Check is R02. |
| 0.2e | Supplier-based: CompactOperators §1.2 (minor bound), §1.4 (cyclicity, diagonal intertwining, `H_(au)(T)=H_u(aT)`), §1.6 (blocks), §1.7 (`c0_completedBaseChange`, README line 461) on main. The counting identity was computed. | Supported. |
| 1.1 | Deligne (Bourbaki 355): Prop. 3.18(ii) `R_p=p^kI_p^*`, lines 465–468 (p. 158); Prop. 4.8 `T_p=F+I^*V`, `FV=VF` with `VF=p^k·p`, lines 624–639 (p. 166); Thm. 4.9, line 646 (p. 167). | Supported. |
| 1.3 | Scholl: `ε` and `Π_ε∈ℤ[1/2n·k!][Γ_k]`, lines 89–91; Thm. 1.2.1 line 103 and Thm. 1.2.4 lines 118–129 (p. 2); Remark 1.2.5 line 130; 1.3.3 line 173 (p. 3); §4.1 lines 410–430 (p. 8). | Supported. |
| 3.3a | Carayol 5.4 lines 770–783 (p. 428): the three possibilities and the order-2 ambiguity. 5.5 lines 784–801 (pp. 428–429): `απ≅π`, then `ασ≅σ`, so `α=1`. 5.6.1–5.6.3 lines 802–807 (p. 429). | Supported. |
| 3.4 | Carayol 6.7 Proposition and Remarque, lines 913–930 (p. 432): special iff nonzero; sub `χ⁻¹`; non-splitting deferred to Picard–Lefschetz. 11.4 Proposition lines 1595–1608 (p. 451): `N` maps onto `Ker(H¹(X_s)→H¹(X̃_s))`. 11.5 lines 1614–1627 (p. 451): constant on components, or `H⁰=H²=0`. | Supported. |
| 3.17 | Carayol 0.3 lines 35–43 (p. 409): even `d` requires an essentially square-integrable finite place. (A) lines 86–92 (pp. 410–411); (B) lines 121–125 (p. 411); 0.11 line 154 (p. 412); 12.3.1 line 1879 (pp. 458–459); 12.3.2 line 1920 (p. 459). | Supported. |
| 4.6 | KisinPST §4.1 lines 1449–1480 (p. 542): any totally real `F`, any multiweight of one parity, any `p`. Thm. (2.5.5) line 887 (p. 530). Thm. (2.7.6) and Cor. (2.7.7) lines 1082–1104 (p. 534), tested on finite `E`-algebras `B`. Thm. (4.3) lines 1511–1514 (p. 543): residually absolutely irreducible, Frobenius semisimplification keeping the Jordan form of `N`. | Supported. |
| 4.11 | SW (3.2) lines 1196–1204 (p. 38); the twist to the nearly ordinary case and (3.3) lines 1207–1219 (p. 39). ColmezFontaine Thm. A line 95 (p. 2); §3.4 line 1104 (pp. 21–22); Prop. 4.2 and the equivalence after it, lines 1232–1238 (p. 23); Prop. 4.4 lines 1276–1284 (p. 24). Conrad App. B as for 0.1. | Supported. |
| 5.3 | HaraOchiai `(ord_{F/F⁺})` line 836 (§2.1.5, p. 17); Prop. A.3 and proof, lines 3413–3470 (pp. 70–71). DK Lemma 9.2 and proof, lines 2528–2537 (p. 67): the distinct ramified/unramified characters. | Supported. |
| 6.4a | DDT type `Σ` for any finite `Σ`, line 2841 (p. 76). Definition 3.25 lines 3474–3478 (p. 94): “sometimes assume `Σ⊂Σ_ρ̄`”. Lemma 3.26 lines 3484–3491 (p. 94): `δ=0` iff `ρ̄` good and `ℓ∉Σ`, and `N_Σ≠∅` for all `Σ`. | Supported. |
| 6.6 | DDT: `T_Σ` reduced, local, complete, finite free, lines 3492–3495 (p. 94). Lemma 3.27(a)–(c) lines 3496–3507 (pp. 94–95); the proof leaves the remaining properties “as an exercise”, line 3527 (p. 95). Example 3.28 lines 3528–3538 (p. 95): `T_∅={(x,y)∈ℤ₃²:x≡y mod 3}`, `T_∅/3≅𝔽₃[ε]`. | Supported. |
| 6.11 | KW Lemma 7.2 and proof, lines 2794–2829 (pp. 60–61); Remark line 2830 (p. 61): `γ_v(Frob_v)` is the inverse of the uniformiser eigenvalue. | Locators correct. The `Nv≢−1` hypothesis the README keeps is needed; see Source issues. |
| 7.3 | DP Definition 1.10 lines 273–292 (pp. 6–7); the almost-strict exception lines 297–301 (p. 7). Skinner Thm. 1 and (1), p. 242, checked in round 4. | Supported; §7.1's exception matches DP exactly. |

### Adversarial table

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions `λ_p` | `E₄`; `2Δ`; `Δ(3τ)` | `a₂(E₄)=2160=λ₂·a₁=9·240`. `a₂(2Δ)=−48=(−24)·2`. `Δ(3τ)` has `a₁=a₂=0` and `λ₂=τ(2)=−24`. | True |
| §1.7 attachment and rigidity | `E₄` at 2; `Δ(3τ)` against `E₄(3τ)`; `Δ` against `Δ(3τ)` | `(X−1)(X−8)=X²−9X+8`, trace `9=λ₂`. The `λ₂` values are −24 and 9, so the hypothesis fails. `λ_p` agree for `p≠3` and `k=12` on both sides. | True |
| §0.1 | `ε_p`, `K=ℚ_p`, `ϖ=p` | Geometric values `u` and `N(p)/p=1`, `a=−1`. `φ=1·p⁻¹=ν(p)=q⁻¹`. Conrad B.4(ii) gives `ψ(r(p))⁻¹χ(p)=1·p⁻¹`. | True |
| §0.2a right action | `γ=diag(p,1)`, `δ=((1,0),(p,1))`, `z=1` | `(f|γ)|δ` and `f|γδ` both give `f(p/(p+1))`; `f|δγ` gives `f(p/(p²+1))`. | True |
| §0.2a scalars, row estimate | `2I` at odd `p`; expansion of `w_γ` | `n(2)ν₀(2)²` is `2^k`, or `2^{k+2}` when `ν₀(u)=u`. `coeff_m w_γ=(det/d²)(−c/d)^{m−1}`, of norm at most `s^m`. | True |
| §0.2a dyadic Check (R02) | `u=3`, `u=−1`, `w=1` | `v₂(log 3)=2`, so the series converges. `exp(log(−1))=1`, against `−1`. | Reason false |
| §0.2b | `p=3`, `s=1` | Three discs. `z=a+3w`, `w=b+3w′` gives `z=(a+3b)+9w′`. | True |
| §0.2c level/radius Check | `F=ℚ`, one class, degree `k` | `p^s(k+1)` on the left. `[K₀(p^t):K₀(p^{t+s})]=p^{t+s−1}(p+1)/p^{t−1}(p+1)=p^s` classes, times `k+1`. | True |
| §0.2c `C_U` | `N=5` | `Ẑ^×/{±1}U₁(5)≅(ℤ/5)^×/{±1}`, of order `2=φ(5)/2`. | True |
| §0.2c unit Check (R03) | `ℚ(√2)`, `ε=1+√2`, `w=1` | `N(ε)^1=−1`. | “Identity” false; finite image true |
| §0.2d certificates | Buzzard p. 69; Jacobs p. 21 (lines 851–860) | `(Tφ)(c_i)=Σ_tφ(c_ix_t⁻¹)|x_t=Σ_tφ(c_j)|(ux_t)`. | True |
| §0.2e counting bound (Lean) | `h_U=2`, `v=1`, `h=1`; `h=−1`; `h_U=1`, `h=0` | Partial sums 0,0,1,2,4,6,9: largest `n` is 6 (`6≤6`, `9>7`), against bound `2·(2+2)=8`. Only `n=0`, against bound 2. `n≤1`, against bound 2. | True |
| §0.2e Checks | `∏(1−p^jT)`; `exp(3w)−1`; `ℚ₃(√−3)` | `v_p(coeff_n)=n(n−1)/2`. Coefficients `1/3`, `|9/2|=|27/6|=1/9`, so Gauss norm `1/3`. `ζ₃=1−ϖ∈1+ϖO` but `∉1+ϖ²O`. | True |
| §0.2f Bol (Lean) | `r=1,j=0`; `r=2,j=0`; `(a,b,c,d)=(0,1,1,1)` | `(ad−bc)/L²`. `(N²/L)″=2(aL−cN)²/L³=2(ad−bc)²/L³`. `(−1)^r(j+1)⋯(j+r)(z+1)^{−(j+r+1)}`. | True |
| §0.2f Neumann (Lean) | `‖U′‖≤1`, `‖c‖<‖μ‖` | `Θ(U−μ)^N=(cU′−μ)^NΘ` and `cU′−μ=−μ(1−(c/μ)U′)` with `‖(c/μ)U′‖<1`. | True |
| §0.2f Checks | `ℚ`, `n=0`, constants; `|nrd η|_f^{−r}` | `U_p=p`, `H=(1−pT)H′(pT)`, slope `1=r` excluded. `p^r`, `ℓ^r`, `ℓ^{2r}`. | True |
| §1.1 Check | `y²=x³−x` over `𝔽₁₇`, `p=3` | `#E=16`, `a₁₇=2`. `X²−2X+2` is irreducible mod 3; a root has order 8 in `𝔽₉^×`, so projective order 4: one 4-cycle on `ℙ¹(𝔽₃)`. | True |
| §1.3 Check | `n=3`, `r=2` | `|Γ₂|=(2·9)²·2=648`. | True |
| §3.3a | 11a1 at 3; nonquadratic `s` | `X²+X+3`, determinant 3. Carayol's determinant `q/s≠qs`. | True |
| §3.15 Check | `y²=x³−x` at 5 | `a₅=−2` (counted); `(−1±2i)` has norm 5 and sum −2. | True |
| §4.11 line argument | `W=ρ|G_K⊗η⁻¹` | Degrees `(0,k−1)`, so `t_H(line)≥0`. With `t_N=0` and `t_H≤t_N`, `t_H=0`; rank one gives admissibility (ColmezFontaine Prop. 4.4(ii)). | True |
| §6.4a Check | ramified `p∈Σ`; good `ℓ`, `Σ=∅` | `p·p=p²` against `p³`. The bound is `N(ρ̄)`. | True |
| §6.7 Checks | 11a1 at `ℓ=7` (`Σ={7}`, `{11}`) and `ℓ=19` | `a₇=−2` and `4−28≡4` mod 7, a square: unit root exists. `11·11=121` against 1331. `a₁₉=0`: no unit root. | True |
| §6.11 Check | `p=3`, `Nv≡−1` | `{χ̄γ̄,γ̄}={−γ̄,γ̄}={−χ̄γ̄,−γ̄}`. | Hypothesis needed and kept |
| §7.1 / DP | exception set | DP imposes (6) at reducible `λ` only when `p` is odd and `WD_p` is unramified; the README omits exactly when `ℓ=2` or the parameter is ramified. | Same |
| §7.3 | `Δ` at 2 | `X²+24X+2048`, `|τ(2)|=24≤2·2^{5.5}≈90.5`. | True |
| §7.7 and Lean | 11a1 at 3, 19, 11; CM | `−1∉(3)`, `0∈(19)`, `11∣11`. A trivial-character CM form has `p²` in its level at `p∣d_K`, so squarefree level excludes CM. | True |

### Library declarations opened at the pins

- **Mathlib:**
  - `Matrix.charpolyRev`, `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:290`, and `Matrix.reverse_charpoly`, line 292;
  - `NumberField.RingOfIntegers.instFintypeClassGroup`, `Mathlib/NumberTheory/NumberField/ClassNumber.lean:59`;
  - `PowerSeries.derivative`, a `Derivation`;
  - `Nat.descFactorial`;
  - `Representation.averageMap`, with `[Fintype G] [Invertible (card G)]`, and `Representation.isProj_averageMap`.
- **Tau Ceti:**
  - `Matrix.charpolyRev_eq_reflect` and `Matrix.natDegree_charpolyRev_le`, `TauCeti/LinearAlgebra/Matrix/Charpoly/Reverse.lean:71,77`;
  - `HeckeRing.GL2.EigenformAwayFromLevel` and `Newform`, `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84,104`;
  - `TauCeti.CoefficientField : Newform N k → IntermediateField ℚ ℂ`;
  - `NumberField.Set.HasNaturalDensity`.

The README describes all of these correctly.

### Cross-roadmap citations resolved

- **GL2AutomorphicRepresentationsAndTransfer (open head):**
  - §R17.3.8a (README line 1777): `L_{n,s}`, normalized determinant `ν_alg(ϖ_v)^e`, `Σ₀`/`Σ₁` with nebentypus, analytic inclusion;
  - §R17.3.8b (line 1894), and §R17.3.8c (line 1970) with averaging `‖e_i‖≤‖|H_i|⁻¹‖` (line 2026);
  - §R17.3.8d (line 2070): `x_α=η_v(1 0; ϖ_v^tα 1)∈Σ₁`, giving `q_v` cosets.
- **HilbertModularVarietiesAndShimuraCurves (open head):** §R18.5.16a, item 4, gives `[GL₂(O_v):K₀(𝔭^e)]=q^{e−1}(q+1)`. §R18.5.16b gives the fibres `Γ_x\U/U′` and the normal-core product formula.
- **On main:**
  - CompactOperators §§0.1–0.5, 1.2–1.7 (`IsRowCompact`, `c0_completedBaseChange`), 3.1–3.5, 4.3;
  - RestrictedPowerSeries §§0.1, 1.1–1.3, 2.2–2.4;
  - PadicFunctionalAnalysis §§0.3–0.4, 1.1, 2.2, 4.1–4.3, 4.6, 5.2–5.5;
  - NewtonPolygons Layer 2, AdicSpacesPartII R0.5, and RigidAnalyticGeometry Layers 1 and 6.

  All exist.
- **IntegralHeckeAndGaloisDeterminants:** the resolver's two leads, `Determinant.exists_realization_of_henselian` and `…existsUnique_isCoefficientChange_of_compact`, are declared in its `Suggested.lean` at its open head, lines 205 and 365.
- The other citations are unchanged since round 5 and were resolved there. The resolver reports no cross-roadmap citation found nowhere.

### Ownership, overlaps, headlines

- **Overlaps:** `overlaps.md` reports no open pull request changing this roadmap, no dropped id this roadmap cites, and no revision-only id.
- **Never-cite list:** the README cites none of the listed roadmaps (grep).
- **Overlap with QuaternionicModularForms, for the human approver (not raised as a finding):**
  - That open roadmap (#934, another author) owns analytic weights, form spaces, (Pr), Hecke operators, Fredholm theory, Bol's identity, theta maps and small-slope classicality (its README lines 38–47, and Layers 1–5 at lines 426–1417).
  - This head re-plans the same objects as §§0.2a–0.2f (README lines 718–1260, scope lines 85–91).
  - GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–d does the same for its algebraic Layers 0–3.
  - The brief forbids citing QuaternionicModularForms, which removes the only repair available in this package (cite the earlier owner). The two owners therefore have to be settled at board level.
- **Headlines:**
  - The Summary's end results are §3.10, §§4.4 and 4.7, §2.10, §7.3, §§4.11 and 5.1–5.2, §§7.4–7.5, §§6.6–6.12 and §7.7.
  - Only §7.7 is statable at the pins, and it is stated. The docstring names the missing carrier for each of the others.
  - §1.7's density-one rigidity (cusp-form case) is statable on `EigenformAwayFromLevel`. It is a corollary of the supplied attachment, not an end result here, so its absence is not raised.

## Not verifiable

- **T. Saito, *Modular forms and p-adic Hodge theory*, Invent. Math. 129 (1997), Theorem 1 (§§4.5, 5.2).** The manifest records it as `uncertified` (paywalled), cited by locator; that is settled.
- **Kisin, *Overconvergent modular forms and the Fontaine–Mazur conjecture*, Prop. 5.14 and Cor. 5.15 (§0.4).** Only the author DVI is cited, which could not be fetched in round 4. It was not in this round's sample.
- **Jacobs, equation (1.5.13), p. 19.** The extracted text (Jacobs line 739) loses the sign of the exponent of `(cz+d)`. The README's `(cz+d)⁻²` agrees with its own Check `κ_J=u²↔n=1`, but the sign could not be read in the extraction.

## Source issues

- **Gap** in KW at Lemma 7.2, proof of case (i) (`p>2`), printed p. 61 (author version): the source says independence of `γ_v` from the eigenform follows from independence of the residual representation. It should assume that `ρ̄` is ramified at `v` or that `Nv≢−1` mod `p`. When `ρ̄` is unramified at `v` and `Nv≡−1`, `±γ_v` give the same residual semisimplification. Affects a stated result.
