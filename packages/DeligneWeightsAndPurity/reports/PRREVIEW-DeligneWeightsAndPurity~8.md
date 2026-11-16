# Review of DeligneWeightsAndPurity (pull request #929 at 82ab353)

**Verdict:** needs changes

Full review. The previous review (of fae1b73) was an acceptance with no finding, so there is nothing to re-check finding by finding.

## R01 (P1) — the `L²`-weight of a direct sum is not the maximum

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1224`, §2.15 (i): "`‖K[1]‖ = ‖K‖` and `‖K ⊕ K′‖ = max(‖K‖, ‖K′‖)`".

**Claim:** The second identity is false for Weil complexes: trace functions of summands in degrees of opposite parity cancel.

**Witness:** `K = E`, `K′ = E[1]` on `𝔸¹`: `t_{K,n} = 1`, `t_{K′,n} = −1`, so `E_n(K ⊕ K′) = 0` for all `n` and `‖K ⊕ K′‖ = −∞`, while `‖K‖ = ‖K′‖ = 0` (`E_n = qⁿ`).

**Repair:** Replace by "`‖K ⊕ K′‖ ≤ max(‖K‖, ‖K′‖)`, with equality when `‖K‖ ≠ ‖K′‖`" (from `E_n(K ⊕ K′)^{1/2} ≥ |E_n(K)^{1/2} − E_n(K′)^{1/2}|` along the `limsup` subsequence), and add the witness as a Check. §§2.16 and 4.5 use only the shift clause and (iii), so nothing downstream changes.

## R02 (P2) — §§8.9–8.10 translate Weil II (6.2.5) item by item

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2602` and `:2610`: "(a) For every `N ∈ ℤ`, `K` is mixed of weights `≤ w` iff `K(N)[2N]` is; hence in the definition of purity the dualizing complex may be replaced by any complex locally isomorphic to …".

**Claim:** 8.9 (a)–(b) follow the source's two items sentence by sentence in translation, with its lettering; 8.10 continues the same list as "(c)", "(d)".

**Witness:** WII line 4143–4150 (items a, b) and WII line 4154–4159 (items c, d): same four items, same order, same clause order inside a) and b); no verbatim words shared, since the source is French.

**Repair:** Rewrite 8.9 as: "Let `X₀` be of finite type over `𝔽_q` and `K` a mixed complex. The joint shift and twist `K ↦ K(N)[2N]` moves `ℋ^i` to degree `i − 2N` and lowers its punctual weights by `2N`, so every bound `≤ w` is unchanged. The lower bound `≥ w` can therefore be tested on `RHom(K, L)` for any `L` locally of the form `K_{X₀}(N)[2N]`; on smooth `X₀` take `L = ℚ̄_ℓ`, giving: weights `≥ w` exactly when `RHom(K, ℚ̄_ℓ)` has weights `≤ −w`. When all `ℋ^iK` are lisse both bounds are read on stalks, and `K` is pure of weight `w` exactly when each `ℋ^iK` is punctually pure of weight `w + i`. Hence `ℱ₀[m](r)` is pure of weight `w + m − 2r` for `ℱ₀` lisse and punctually pure of weight `w` on smooth `X₀`." In 8.10 drop the letters: "**Curves.** …" and "**Smooth divisors.** …".

## R03 (P2) — §5.12 drops the hypothesis of Weil II (1.8.5)

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1817`: "For an `ι`-mixed local system on a smooth curve, the relative monodromy filtration exists and agrees with the local weight filtration on pure graded pieces."

**Claim:** The source assumes a finite increasing filtration `W` by lisse subsheaves with `Gr^W_i` punctually `ι`-pure of weight `i`; without it "relative" has no `W`, and the existence of `W` is §§8.17–8.18, which 5.12's *Needs* does not list.

**Witness:** WII line 1547–1551 (p. 176). Instance: `E ⊕ L_b` with `w_ι(b) = 1/2` is `ι`-mixed with weights `{0, 1/2}`; no integer-indexed `W` has `Gr^W_i` of weight `i`.

**Repair:** "Let `ℱ₀` be lisse on a smooth curve `U₀` with a finite increasing filtration `W` by lisse subsheaves such that each `Gr^W_i` is punctually `ι`-pure of weight `i`. At each missing point the monodromy filtration of the local representation relative to `W` exists and equals its weight filtration." The witness is excluded by the hypothesis. The form for every `ι`-mixed lisse sheaf (class by class modulo `ℤ`, after a twist) belongs with §8.18, which supplies `W`.

## R04 (P3) — §8.24 cites a text that does not contain its statement

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2971` and `:2977`: "`E₁^{j,k} = ⊕_{|E(G)| = j} (H^k(∏_v M̄_{g_v,n_v}) ⊗ det E(G))^{Aut(G)}`" … "(Sources: [BFP], proof of Proposition 4.2, p. 7.)"

**Claim:** The cited proof quotes the weight spectral sequence from two other papers and displays its `E₁` term without the orientation factor; it states neither the general normal-crossings theorem nor the `det E(G)` form.

**Witness:** BFP line 289–290 and 310 (the sequence is taken from [PW21, §2.3] and [Pet17, Example 3.5]); BFP line 301–308 (invariants of the tensor product, no `det E(G)`).

**Repair:** Cite a primary source for `E₁^{m,k} = H^k(D^{(m)}, ε_m) ⇒ H^{m+k}_c(U)` with its orientation sheaf, at its locator (the two references BFP gives are the natural candidates), keep BFP for the application to `M̄_{g,n}`, and say that the `det E(G)` twist is the roadmap's correction of BFP's display.

## R05 (P3) — three locators

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1186` "(1.1.10)–(1.1.14), pp. 150–153"; `:1821` "(1.8.5)–(1.8.12), pp. 176–179"; `:2616` "Exemples (6.2.5) c), p. 248".

**Claim:** Wrong page ranges in the first two; the third omits the item that supports the divisor clause of 8.10.

**Witness:** WII line 578 and 606: (1.1.10) is on p. 151. WII line 1632–1648: (1.8.12) ends on p. 178; p. 179 is (1.8.14). WII line 4157–4159: the smooth-divisor statement is item d).

**Repair:** "pp. 151–153"; "pp. 176–178"; "Exemples (6.2.5) c), d), p. 248".

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 0.4 `ι`-weights (sample) | `q=2`, `α=1+√2`, `α=q⁻¹` | `±2log₂(1+√2) ≈ ±2.543`, sum `0 = w(−1)`; `w(q⁻¹) = −2`. WII line 710–723, p. 154 | pass |
| 0.13 tensor, dual, `Hom` (sample) | `F=diag(1,2)`, `q=2` | `F⊗F`: `{0,2,2,4}`; contragredient: `{0,−2}`; `Hom(V,V)`: `{0,2,−2,0}`. WII line 704–706, p. 154 | pass |
| 0.14 exterior powers (sample) | `F=diag(1,2)`, `d=2` | `∧⁰:{1}`, `∧¹:{1,2}`, `∧²:{2}=det`, `∧³=0`; counts `1,2,1,0`. AV Cor. 1.5, Rem. 1.6(a), printed p. 78; WII line 1116–1121 | pass |
| 1.7 curve `H⁰,H¹,H²` (sample) | elliptic curve over `𝔽₂`, trace `1` | roots `(1±i√7)/2`, modulus `√2`, weight `1`; `1−1+2=2` points; `H²` scalar `2`. AV Rem. 11.5, printed p. 119 | pass |
| 2.13 character sheaves, Gauss line (sample) | `q=3`; `q=5` quadratic; trivial `χ` | `(1−ζ₃t)(1−ζ₃⁻¹t)=1+t+t²`; `g²=χ(−1)·5=5`, `|g|=√5`; trivial: `−Σψ=1`, weight `0`. Lau line 328, p. 139; line 656–666, p. 150; KatzW line 430–434 | pass |
| 5.12 (sample) | `E ⊕ L_b`, `w(b)=1/2` | clauses on (1.8.9)–(1.8.12) match WII line 1581–1638; first sentence lacks `W` | R03, R05 |
| 6.2 reality (sample) | `E` on `𝔾_m` | factors `1−t` (`H¹_c`), `1−qt` (`H²_c`), both real. WII line 2423–2437, p. 200 | pass |
| 7.8 direct images (sample) | `ℚ_ℓ` on `𝔾_m`, `𝔸¹` | `H¹_c(𝔾_m)`: `0 ≤ 1`; `H²_c`: `2 ≤ 2`. WII line 2571–2573, p. 204 (source: finite type over `ℤ`; README: `ℤ[1/ℓ]`) | pass |
| 8.6 Galois sheaves (sample) | transcendental unit line; tame quadratic character | no weight, not mixed; trivial after a degree-2 trait extension, weight `0`. WII line 4087–4106, p. 246 | pass |
| 8.9 (sample) | `ℱ₀[m](r)` | `ℋ^{−m}=ℱ(r)`, weight `w−2r = W−m`, so `W = w+m−2r`; `K(N)[2N]`: `(w+i+2N)−2N` | R02 |
| 8.10 (sample) | elliptic family, multiplicative fibre, `w=1` | stalk of `j_*ℱ`: `0 ≤ 1`; of `j_*ℱ^∨`: `−2 ≤ −1`. WII line 4154–4159, p. 248 | R02, R05 |
| 8.16 extensions (sample) | `ℱ=ℚ_ℓ`, `𝒢=ℚ_ℓ(1)` on `𝔾_m` | `Hom(ℱ,𝒢)` has weight `γ−β=−2`; `H¹(𝔾_m, ℚ_ℓ(1))` has weight `0`, eigenvalue `1`: the Kummer extension, with `β>γ`, `β≡γ`. WII line 2724–2734, p. 208 | pass |
| 8.24 weight spectral sequence (sample) | `ℙ¹ ⊃ {0,∞}` | `E₁^{1,0}=ℚ²`, `E₁^{0,0}=ℚ`, `E₁^{0,2}=ℚ(−1)`; `H¹_c(𝔾_m)` weight `0`, `H²_c` weight `2` | R04 |
| 9.4 arithmetic models (sample) | `ℙ¹` over `ℤ[1/ℓ]` | `R²=ℚ_ℓ(−1)`, weight `2` on every closed fibre. WII line 2797–2800, p. 210 | pass |
| 10.2 point counts (sample) | `ℙ¹_{𝔽_{q²}}` over `𝔽_q`; genus `g` | `c_n=2,0`; counts `2(1+qⁿ)`, `0`; middle sum empty; curve: `2g·q^{n/2}`. WI line 79–171, pp. 274–277 | pass |
| 2.12 (iv) trace identity | `δ_a`; `π^*L_b[1]` on `𝔸¹` | `−ψ(Tr(ax′))`; `(−1)·(−bⁿ)·qⁿ = bⁿqⁿ` at `0′`, `0` elsewhere. Lau line 389–390, p. 141 | pass (R05 for the WII pages) |
| 2.14 conjugation | `conj t_{FT K}(x′)` | `= cⁿ t_{FT K♮}(−x′)`; the sum with `[−1]^*`, `L_c` equals its conjugate; `δ_a`, `p` odd: `ψ(ax′)+ψ(−ax′)` real | pass |
| 2.15 `L²`-weight | `E` on `𝔾_m`; skyscraper; `E ⊕ E[1]` | `qⁿ−1 → 0`; `1 → −1`; `0 → −∞` against `max = 0` | R01 |
| 2.16 Plancherel | `δ_0`; `E[1]`; `δ_a` | `1 → qⁿ`; `qⁿ → q^{2n}`; `Σ t² = 0` against `Σ|t|² = qⁿ`. FourierDeligneTransform §0.2 gives `|W|Σ t₁(w)t₂(−w)` | pass |
| 2.9 symplectic case | rank `2r`, multiplier `q_x^β` | `det F_x = q_x^{rβ}`, weight `2rβ`, determinantal weight `β`; needs only §§5.4, 5.6, 5.9 | pass |
| 4.5–4.6 Laumon's estimate | `ℒ_χ(x/(x−1))` | `χ_c = −1`, `H¹_c` a line; `−Σ_{y≠0,1}χ(y) = 1`, weight `0 < 1`; sequence terms equal FourierDeligneTransform §5.5 with `K = j_*ℱ[1]`. Lau line 2565–2569, 2620–2626 | pass |
| 4.7 reduction | `E` on `𝔾_m`; finite étale `f` of degree `d` | `H¹_c` weight `0 ≤ 1`; eigenvalues of `f_*` are `d`-th roots, `q_x^{β/2d} = q_y^{β/2}`. Lau line 2578–2612, pp. 206–207 | pass |
| 5.20 (ii) | eigenvalue `α` on `P_{−i}` | `c^{deg x}·α⁻¹q_x^{−i} = q_x^{β−i}/α = conj α`; elliptic check: `q_x·q_x⁻¹ = 1`. WII line 1307–1313; Lau line 2550–2560 | pass |
| 6.4 parabolic purity | duality into `E(−1)` | `2 − (1−β) = β+1` lower bound, `β+1` upper; `ℙ¹ ⊃ 𝔾_m`: `H¹ = 0` | pass |
| `abelianPointCountBound` | `g=0`; `g=1`, `q=2`, `m=2` | `0 ≤ 0`; `|8−4| = 4 ≤ 2·2+1 = 5`; subsets: `1 + 2g + (2^{2g}−2g−1)` | pass |
| `finiteFieldZetaRationality` | `𝔾_m`; empty scheme | `P=1−t`, `Q=1−qt`; `P=Q=1`; `E 0` unused (`n=0` branch) | pass |
| `degreeFactorExtraction` | `ℙ¹`; `b=(3+4i)/5`; two weight-0 lines | `Π₀=1−t`, `Π₂=1−qt`; `1−(6/5)t+t²` not integral; equal weights excluded by `IsPure … i`; Fatou gives `ℤ[t]` | pass |
| `lefschetzDecomposition` | `ℙ¹`: `n=1`, dims `1,0,1` | `r=1`: `P=𝒱₀`, rank `1 = 1−0`; `r=0`: `P=⊥ = 𝒱₁`, rank `0 = 0−0` | pass |
| `lefschetzPairings` | `x,y ∈ 𝒱(n−r)` | `B(λʳy,x) = (−1)^{n−r}B(x,λʳy) = (−1)^{n−r}B(λʳx,y)` | pass |
| Description | suppliers and section lists | 7 named: 3 on main (7b9b7c6), 4 open; the 11 "on main" are on main; FourierDeligneTransform list equals the README contract | pass |

- Source locators checked against the text: 53 (WII 24, Lau 19, WI 4, AV 6), plus KatzW, BFP and Yu by line; 3 wrong (R05), 1 unsupported (R04).
- Library declarations: none new opened; `lake env lean` on `TauCetiRoadmap/DeligneWeightsAndPurity/Suggested.lean` gives 5 `sorry` warnings (lines 83, 97, 112, 155, 180) and no error. Signatures compared with the README for all 10 declarations: no change; `primitivePiece` needs no `[FiniteDimensional K V]`.
- One-tactic probe (`first | rfl | simp | infer_instance | tauto`) on a scratch copy: 0 of 5 theorems close. No padding.
- Cross-roadmap citations: FourierDeligneTransform §§0.2, 3.2, 3.4, 3.8, 4.1–4.2, 5.2, 5.4–5.6 read at its open head (b215ba1) and match the contract; CongruenceSpectralGap §4.2b and AutomorphicLFunctionsAndLocalFactors §AL.3.11 exist. 201 lines of other roadmaps cite this one; every section id they cite exists at this head.
- Gate: every check zero, build passing. `depcheck: 261 roadmaps, 2605 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No change outside the folder.
- Overlap check: read FourierDeligneTransform, LefschetzPencilsAndVanishingCycles, EtaleDualityAndPerverseSheaves, WeightsInEtaleCohomology, WeilConjectures (lists for main and for named results are empty); the transform and its weight-free statements are FourierDeligneTransform's, every weight statement is this roadmap's; nothing shared.
- Source independence: 22 passages compared with 7 sources, one translated (R02); largest share WII, 147 of 219 locators; contents compared with WII: independent (Layer 5 merges its §§1–2, Layer 8 takes §6 before §3.4, Layer 10 holds §3.5).
- Research link: the targets are the theorems of Deligne (1974, 1980) with Laumon's (1987) Fourier-transform proof of the curve estimate; §8.24 is the weight spectral sequence used by Bergström–Faber–Payne (2023). Rests on the README's references and the texts read.

## Not verifiable

- [Int] (SGA 7 II, XXI §5) and [Sun]: not in the sources cache; cited by locator only.
- Lau line 2649–2653 (the product formula in (4.4)): garbled in the extraction, so the reality step there was not compared with §2.14.
- The file-by-file mapping to the two outside Lean repositories in "Provenance: existing Lean work": the repositories and their licence were confirmed, the files were not opened.

## Source issues

- **Error** in BFP at proof of Proposition 4.2, display (3), p. 7: the source says the `E₁` term is the automorphism invariants of the tensor product of the vertex cohomologies; it should carry the orientation character `det E(G)` of the edge set; affects nothing.

## For the human reviewers

- **Licence.** `README.md:3419–3520` maps targets to formal-arithmetic-geometry/weil-conjectures (55abf46) and AxiomMath/Weil and Stacks (27cdb20, f8e70c5), all stating Apache-2.0, and says no code is transferred; no `Suggested.lean` name matches theirs.
- **Licence.** [KatzW] was read from a text the operator holds locally; the README cites the author's manuscript pagination, not the published article's.
