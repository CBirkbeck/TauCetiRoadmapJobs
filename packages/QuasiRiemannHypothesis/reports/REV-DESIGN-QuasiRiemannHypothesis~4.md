<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18769#issuecomment-6937198563 -->
Review (claude) of 5be56e1

Verdict: needs_changes

**Source independence:** 24 passages compared with 7 sources and a mechanical 8-word scan against 12 cached texts, none shared beyond titles and one 9-word mathematical description; largest share `openai2026quasiRH`, 62 of 139 locators; contents compared with `openai2026quasiRH`: independent.

**Research link:** The headline is Theorem 3.1 of OpenAI (2026), with Liu (2026) as second account; Layers 6 and 8 are the large sieves of Goldmakher–Louvel (2013), Blomer–Goldmakher–Louvel (2014), Heath-Brown (2000) and Patterson's cubic theta function (1977) as used by Dunn–Radziwiłł (2024). Rests on the README and the sources read.

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §7.3: the bound on the bin parameter is lost, and `ε` names two different numbers

   Location: `design/README.md` lines 1343–1345 (§7.3): "for every `ε > 0` there are `ε₀ > 0` and a
   finite height order `A` such that, when `(1 + T₁)^A ≤ U^(ε/10)`, `|M_r|² ≪ U^(δr + ε)`";
   `design/plan.json` target 7.3 (`statement`, `hypotheses`).

   Claim: in a bin `(i, a)` of §7.2, whose parameter `0 < ε < 10⁻³` is fixed there, the two bounds
   hold with loss `ε` under the height condition alone. The number `ε₀` is introduced and never used.

   Witness: the route's own shift to `Re s = a + 6ε` gives `|M_r|² ≪ U^(2(a − 1/2 + 6ε) r + 2ε₁) =
   U^(δr + 12εr + 2ε₁)`; at `r = 1` the loss is `12ε > ε`. `openai2026quasiRH` lines 2574–2577 and
   2603: the bin parameter is at most `ε₀`, chosen from the loss.

   Repair. In §7.3 write: "Prove: for every `ε' > 0` there are `ε₀ > 0`, depending only on `ε'` and
   the ranges of `r, m`, and a finite height order `A` such that, when the parameter `ε` of the bin
   (§7.2) is at most `ε₀` and `(1 + T₁)^A ≤ U^(ε'/10)`, `|M_r|² ≪ U^(δr + ε')` and
   `|S_m|² ≪ U^(δ min(m, 1 − m) + ε')` for `ψ ∈ 𝒳`". In §7.4 replace "for every `t ∈ [1, 3/2]` and
   `ε > 0`, after the preliminary losses are reduced" by "for every `t ∈ [1, 3/2]` and `ε' > 0`, when
   the bin parameter `ε` and the loss of §7.3 are small enough in terms of `ε'`", and write `ε'` in its
   seven displayed bounds; in §10.4 "after reducing the losses of §7.4" becomes "with the bin parameter
   small enough in terms of `ε`, as in §7.4". The same in `plan.json` 7.3 (add the hypothesis "bin
   parameter `ε ≤ ε₀(ε', ranges)`") and 7.4. Tested on the witness: with `r, m ≤ R`,
   `ε₀ = ε'/(48 max(1, R))` and `ε₁ = ε'/8`, the shifted line gives `δr + 12εr + 2ε₁ ≤ δr + ε'/2`,
   the reflected line `δ(1 − m) + (24 − 12m)ε + 2ε₁ ≤ δ(1 − m) + 3ε'/4`, and the height factor at
   most `U^(ε'/10)`: both below `ε'`.

2. **F02** (P3) §7.4: "the `O(ε)` constants are absolute" is the source's statement at the floor `51/100` only

   Location: `design/README.md` lines 1360–1361 ("the `O(ε)` constants are absolute") with line 1312
   ("Fix a floor `a₀ ∈ (1/2, 1)` (the source takes `a₀ = 51/100`)"), and lines 1373–1374 (Examples).

   Claim: the constants in `m ≤ 1/2 + O(ε)` and `r ≥ t − 1/2 − O(ε)` do not depend on the floor.

   Witness: the comparison of the route gives `2δ (m − 1/2)₊ ≪ ε`, so `m ≤ 1/2 + O(ε/δ)` with
   `δ > 2a₀ − 1`; at `a₀ = 1/2 + 10⁻⁶` the constant is of size `10⁶`. `openai2026quasiRH` line 2703
   uses `δ ≥ 1/50`.

   Repair: "the `O(ε)` constants depend only on the floor `a₀` (they are `O(1/(2a₀ − 1))`, absolute at
   the source's `a₀ = 51/100`)". In the Examples write "`|M_r|² ≫ U^(δ/2 − O(ε))`" (from
   `δr − ε ≥ δ/2 − (Cδ + 1)ε`). Tested: at `a₀ = 51/100`, `1/(2a₀ − 1) = 50`, the source's case.

3. **F03** (P3) four small slips

   One line each: location, witness, repair.

   - `design/README.md` line 957 (§5.1): "`|D_𝔯(σ + it)| ≪_ε N𝔯^((−σ)₊ + ε)`" lacks the dependence on
     `K` that the first bound of the same sentence carries. Witness: `K` of degree `d` with `2` totally
     split, `𝔯` the product of the `d` primes above `2`, `a_𝔭 = −1`, `σ = 0`: `|D| = 2^d = N𝔯`, against
     `N𝔯^ε = 2^(dε)`. Write `≪_{K,ε}` (the source has `K = F` fixed); the same in `plan.json` 5.1.
   - `design/README.md` lines 1980–1981 (§10.5, retained integral): the hypothesis "restricted as in
     `openai2026quasiRH` (10.14)" is stated by reference. State it: "every argument of a buffered
     `L`-value has imaginary part `γ_j + Σ_k a_jk v_k` with a fixed matrix `(a_jk)`, `|γ_j| ≤ (3i + 1)T₁`,
     and the `m` external heights are restricted to `|v_k| ≤ T₁/(2m(1 + max_j |a_jk|))`, so that they
     add at most `T₁/2`". Check: `Σ_k |a_jk| |v_k| ≤ m · max|a| · T₁/(2m(1 + max|a|)) < T₁/2`.
   - `design/README.md` line 2211 (Downstream consumers): "**ExplicitMultiplicativeFunctions**:
     qualitative power savings `M(x) = O(x^(11/12+ε))`". Witness: that roadmap's scope at its open head
     (README lines 588–591) says of the half-plane that "none of its consequences is planned". Write
     "**ExplicitMultiplicativeFunctions, Part II**", as the neighbouring bullets do.
   - `sources.toml`, entry `liu2026improved`: the README cites its (1.2) in §1.2 (line 415); the
     entry's `locator` has no "(1.2)" and its `cited_for` no "1.2". Add both. (`liu2026improved` line
     307 is the display.)

3 findings: 1 P2, 2 P3. All 6 findings of round 3 are repaired and the repaired passages survive
the adversarial pass. The new blocking finding comes from the seeded sample (§7.3): a hypothesis of
the source's lemma was lost, and the statement as written is not what its route gives.

Files read: `packages/QuasiRiemannHypothesis/design/README.md` (all 2259 lines),
`packages/QuasiRiemannHypothesis/design/plan.json` (11 layers, 55 targets, 159 tests, `gaps = []`),
`packages/QuasiRiemannHypothesis/sources.toml` (24 entries, all `certified`, no machine path). No
maintainer notes exist for this roadmap. No supplier gap is declared and no finding needs one. There
is no `Suggested.lean` at the design stage: nothing was elaborated (this lane does not elaborate),
and the padding probe has nothing to run on.

## Round 3 findings

| Id | Status | Repaired passage |
| --- | --- | --- |
| F01 | repaired | §5.2, lines 980–982: "This is Rademacher's convexity bound, ExplicitZetaBounds §3.2 (`norm_continuedL_le_rademacher`), at `η = 1/10` and the record `heckeData ψ`"; contract lines 274–283; `PhragmenLindelof.vertical_strip` is gone |
| F02 | repaired | §6.2, lines 1148–1150: "They form a `d`-th order Hecke family when they also satisfy the reciprocity law at the other coprime pairs and the primitivity axiom; these are hypotheses, not consequences"; lines 1176–1178 (`n ≥ 4` even, powers a quadratic family); Check, lines 1166–1172 |
| F03 | repaired | §8.5, lines 1527–1531: "form a finite-dimensional space … `θ` is the element given by the cusp `∞`, and no bound on the dimension of this space is asserted"; lines 1531–1536 for `(Γ₁(3), κ_P)` |
| F04 | repaired | §11.2, lines 2136–2140: "a modulus `𝔪` of `K` and a nontrivial `η : RayClassCharacter 𝔪` … `N𝔭 ≤ C_{K,θ} (log N𝔪₀ + 2)^(1/(1−θ))`"; Checks, lines 2152–2161 |
| F05 | repaired | §10.6, lines 2030–2037: the five pieces in the roadmap's notation with `1/24 − (62/75)(1/1000) = 1021/25000`; "unresidued" no longer occurs; no shared run of 8 words with the source remains |
| F06 | repaired | §5.4, lines 1054–1058 (`α = 1 + 3√2`, `N = −17`); §5.1, line 958 ("for `Z ≥ 1` and `B ≥ 0`"); `plan.json` 8.4, 10.3, 10.4 carry 3, 4, 3 tests |

The three "applied differently" items of the repair report (F01, F02 and the cusp list of F03) are
sound: `norm_continuedL_le_rademacher` carries `hfin` (finite order), so ZerosOfLFunctions §3.1 is
needed; the reciprocity of the powers holds only at pairs prime to the conductors; Patterson lists
twelve classes. The repaired patterns were looked for again: conductor against presentation modulus
(§§7.2, 11.2), inherited family axioms (§6.2, third bullet, verified at `openai2026quasiRH` lines
1586–1597), "every" over all `Γ(N)` (§8.7), reused source tables (none).

## Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 bullets | `s − 2`; `0`; `1/(s − 1)`; `s̄`; `χ = 1` at `s = 1` | orders `1`, `⊤`, `−1`, junk `0` (`meromorphicOrderAt_of_not_meromorphicAt`); pole of order `−1` whatever Mathlib's value | holds | none |
| §1.2 | empty family; `{s − 3/4}`; family with `0` | `1/2`; `3/4`; unbounded set, `sSup = 0`, excluded by the hypothesis | holds | none |
| §1.3 route | Mellin strip; `E*` | converges at `0` for `Re s < B`, at `∞` for `Re s > β* − E*`; `E* ≤ β* − σ₀ − ω`, so `β* − E* > σ₀` | holds | none |
| §1.4 | `A_η τ ≤ m/4` | `(1 + Z^τ)^A ≤ 2^A Z^(m/4)`: first term `Z^(C(β*) − 3m/4)`; `B_η − Nτ < C(β*) − m/2` | holds | none |
| §2.2 (sample) | `−2`, `1 + 3ω`, `−1 − 3ω`; six units mod `3`; `λ` | `−2 ≡ 1`; norms `4`, `7`; residues `±1, ±ω, ±ω²` distinct; `λ ∣ 3` | holds | none |
| §2.5 | `d = 1 + 3ω`; `π = −2 + 3ω` | `1 − λ² + λ³ = 1 − 6ω ≡ 1 + 3ω (mod 9)`; `(λ/d)_3`: `5² ≡ 4 = ω²` in `𝔽₇` `= ω^(−1)`; `t = −7`, `12⁶ ≡ 1` in `𝔽₁₉` | holds | none |
| §3.2 (sample) | tail; Mellin bound at `|T| ≤ 1`, `|T| ≥ 1` | `(1 + |t|)^N ≥ T₁^N`; `j = 0` and `j = N` terms with `|s|^(−N) ≤ |T|^(−N)`; `2m ≤ J + d + 2` in the first bound | holds | none |
| §3.3, §3.4 | `s = 0, 1`; `m ≡ 1`; `m(s) = s` | `∫ (2√π)⁻¹ e^(−u²/4 + su) du = e^(s²)`; `K_W(x) = W(1/x)`; `(y∂_y W)(1/x)` | holds | none |
| §3.5 (sample) | `e(ω)`, `e(ω/2)`; `H = 3`; shells | `exp(2πi) = 1`, `exp(πi) = −1`; ideals `(1), (λ)` against `1.81`; dual of `b𝓞` is `b⁻¹𝓞`, covolume `q_b` | holds | none |
| §4.1, §4.2 | conjugation; `a = 3, b = 5` over `ℚ` | `conj g_j = χ(−1)^j g_(−j)`; `(3/5)(5/3) · i√3 · √5 = i√15` | holds | none |
| §4.4 | four-term formula at `1, −1, λ, −λ, −3, 1 + 3ω, 4 + 3ω, −2 + 3ω` | `1, 1, i, −i, 1, i, 1, i`; phases `e(−cy²/4) = 1, i^(−b), i^a, i^(b−a)` at `y = 0, 1, ω, ω²`; `τ(λ, λ) = 1/i² = −1` | holds | none |
| §4.5 | `a = 1 + 3ω`, `b = −2 + 3ω`; `G(v²)` | `ω ↦ 7` in `𝔽₁₉`: `3³ = 8 = −ω²`; `χ_a(b) = 4 = ω²`; ratio `−1 = τ(λ, λ)`; `conj(χ_v(4))² = χ_v(4)`, `Γ(v²) = 1` | holds | none |
| §4.6 (sample) | `T = ℤ/2`; `n = p`; the pair of §4.5 | `Σ|a_θ| = 1 ≤ √2`; `0 = 0`; `(−ω²) · ω = −1` | holds | none |
| §5.1 (sample) | `𝔯 = 𝓞`; `(2)`, `a = 1`; degree `d`, `2` totally split | `2 = 2N𝔯^ε`; zeros on `Re s = 0`; `|D'/D| ≤ log N𝔯/(2^(σ₀) − 1)`; `2^d` against `2^(dε)` | holds; one subscript | R03 |
| §5.2 | `K = ℚ`, `s = −1/10` | `(0.9/2π)^(3/5) = 0.3116`, `× 3 ζ(11/10) = 9.895`; `3 · 10.5844 · 1.9332 = 61.385`; `|ℒ(−1/10)| = 1.1 · 0.4172/0.9 = 0.5099` | holds | none |
| §5.5 (sample) | `ρ = 1`; principal `χ`; real `K` | `L(1, χ) ≠ 0` for `χ ≠ 1`; pole kept since `∏(1 − p⁻¹) ≠ 0`; modulus `q𝓞_K` with the real places; deleted factors vanish on `Re s = 0` only | holds | none |
| §6.1 | `J = 1`; `z_j = j/N`, `Q < N` | `≍ Q^d`; `N² ≤ (Q + N) N` | holds | none |
| §6.5 (sample) | `M = N = 1`; `M = N`; the kink | `|c₁|²`; `N^(4/3)`; `(MN)^(2/3) > M ⇔ N > M^(1/2)`, `> N ⇔ N < M²` | holds | none |
| §7.2 | pigeonhole | `(I − 1)ε ≥ 1 + ε`; reflected exponent `(a − 1/2 + 6ε) + (6ε + ε₁)` | holds | none |
| §7.3 (sample) | `r = 1`; reflected line | `δ + 12ε + 2ε₁` against `δ + ε`; `δ(1 − m) + (24 − 12m)ε + 2ε₁` | hypothesis missing | R01 |
| §7.4 (sample) | `a₀ = 51/100`; `a₀ = 1/2 + 10⁻⁶` | `m − 1/2 ≪ ε/δ`: `50ε`; `10⁶ ε` | constant depends on `a₀` | R02 |
| §8.1 (sample) | `γ = (1 + 3ω, −3ω²; 3, 1 − 3ω)`; `γ ∈ Γ(9)` with `a = 10`, `c = 9 + 27ω` | `det = 1`; `(c/a)_3 = 9 ≡ 2 = ω`; `(b/d)_3 = 4⁴ ≡ 9 = ω` in `𝔽₁₃`; `(c/d)_3 = 3⁴ ≡ 3 = ω²`; `d ≡ 73 (mod 81)`, `d ≡ 5 (mod 1 + 3ω)`, `κ = 5² ≡ 4 = ω²`, `κ_P = ω` | holds: `κ_P = κ̄` | none |
| §8.2 | `v K_ν(cv) ě(μz)` | `Δ₃ = (1 − ν²) ·`; `ν = 1/3`: `8/9`; dual of `ℤ[i]` for the trace is `(1/2)ℤ[i]` | holds | none |
| §8.5 (repaired) | `Γ₁(3)` | `648/2 = 324`; `3 · 9 = 27`; `12` classes | holds | none |
| §8.7 (sample) | `k = 3n − 4`, `3n − 3`, `−4`; `d = −2` | `3^(n/2+2) ≤ 3^(n/2+7/3)`; equality `3^(n/2+5/2)`; `9|d|` against `12.98|d|`; `18 > 12.98` without `|b|` | holds | none |
| §9.1 | exponents under `t = s − 1/2` | `q_c^(−1/2) q_n^(−3/2+1/2)`; `L₀` converges for `Re s > 1/2` | holds | none |
| §9.2 | gamma quotient on `Re t = A`; `𝓜_{0,0}(V_G)` | `|u|^(2A)` per sign, `|u|^(4A)`; `√π e^(1/16) = 1.887` | holds | none |
| §9.3 (sample) | shell `2^i U < a q_μ ≤ 2^(i+1) U` | `C_A (1 + 2^i U/a)(2^i U)^(−A)`, sum `U^(−A) + a⁻¹U^(1−A) ≤ (1 + a⁻¹) U^(1−A)` for `A > 1`, `U ≥ 1` | holds | none |
| §9.4 (sample) | `N = B = 1`; `b = n t²`; `M = N = 1` | `≤ K`; `K · NB`, the size of the term `K · NB`; `O/2 + (1 − O) = 1 − O/2` | holds | none |
| §10.2 | `X = Y = Z^(1/2)`; `v = 1 + 3ω`, `v' = 4 + 3ω` | `Q^(−1/2) Z^(1/4) Z^(1/2) = Z^(1/4)`; `1/√91 = 0.105 > 1/13` | holds | none |
| §10.5 (sample) | probe data; moved bin; principal shifts | `C(s) = s − 2/3` both ways; `13/150 − 1/4 + 1/50 = −43/300`; `7/4 + 0.501 − 4 = −1.749`; `1 + 10ε`, `−6ε > −1/100`; `Z^(hz)`: `h/600`; `Y^(w−1)`: `l_y/20` | holds; one hypothesis by reference | R03 |
| §10.6 | closed forms | `1/24 − 62/75000 = 1021/25000`; `46 · 10⁻⁶ < 2.08 · 10⁻⁴`; `1/1600 > 1/2400` | holds | none |
| §10.7 (sample; headline) | data of §1.3 | `C(11/12) = 1/4`; `ω = (β* − 11/12)/2`, `σ = 1/4800` as at `openai2026quasiRH` line 3835; `D_η` nonvanishing on `Re s > 0`; `(1 − β) log q ≥ (log 3)/12` | holds | none |
| §11.1 (headline) | `ρ ↦ 1 − ρ̄`; `θ = 1/2` | `Re = 1 − Re ρ ≤ θ`; `Re ρ = 1/2` | holds | none |
| §11.2 (headline) | prime side; modulo `12`; `y = 30` | `ω(q) log x ≪ log q log x`; `5` against `2`; `41 ≤ 60` | holds | none |
| §11.3 (headline) | `θ = 11/12`, `7/8`; the route of `bimsissac2017` | `12`, `8`; `ϵ = 11/24 > 5/12`: `4/(1 − 11/12) = 48`; `ϵ = 7/16`: `32` | holds | none |
| §5.5, §1.3 (headlines) | as above | as above | hold | none |

## Verified sound

- **Principles.** No algorithm, no `set_option`, no Lean file, no re-planned roadmap, no cycle; the
  `7/8` stage is a named Part II; Layers 2 and 4–7 are stated over general number fields.
- **Sampled sources (15 targets), read at the locator.** §2.2 (`openai2026quasiRH` lines 407–414,
  p. 10; `dunnradziwill2024` line 216), §3.2 (lines 719–760 and proof 774–787, pp. 17–19), §3.5
  (lines 433–443, p. 11), §4.6 (lines 696–706, p. 17), §5.1 (lines 999–1014, p. 23), §5.5 (lines
  3788–3830, pp. 84–85), §6.5 (lines 2722–2731, p. 61; `heathbrown2000` line 113, p. 3;
  `gaozhao2024` lines 726–736), §7.3 (lines 2569–2620, pp. 57–58: R01), §7.4 (lines 2627–2706,
  pp. 59–60: R02), §8.1 (`kubota1969` lines 652–674, printed pp. 24–25; `patterson1977` lines
  109–134, pp. 126–127; `dunnradziwill2024` lines 1155–1226), §8.7 (`dunnradziwill2024` lines
  1227–1326; `openai2026quasiRH` lines 1123–1129 and 1172–1196, pp. 26–27), §9.3 (lines 1484–1500,
  1525–1535, 1569–1577, pp. 34–36), §9.4 (lines 1603–1631, p. 37; 1686–1707, 1892–1900, 1980–1983,
  pp. 38–44), §10.5 (lines 3206–3246, 3253–3276, 3319–3340, 3435–3469, 3514–3545, 3604–3623,
  3666–3673, pp. 72–82), §10.7 (lines 387–389, p. 10; 3831–3844, p. 85; `liu2026improved` line
  1140; `openai2026quasiRHalt` line 42, p. 2). 13 sound, 2 with a finding. The author flagged no
  locator as unverified. The other `liu2026improved` locators exist at lines 307, 531, 682, 728,
  1067.
- **Library at the pins.** Mathlib (file and line under `Mathlib/`): `meromorphicOrderAt_mul`,
  `meromorphicOrderAt_ne_top_iff`, `meromorphicOrderAt_of_not_meromorphicAt`
  (`Analysis/Meromorphic/Order.lean` 466, 129, 56; the definition at line 50 returns `0` off
  meromorphy), `riemannZeta_ne_zero_of_one_le_re`, `LFunction_ne_zero_of_one_le_re`,
  `LFunction_apply_one_ne_zero`, `LFunction_eq_zero_iff_of_re_nonpos`
  (`NumberTheory/LSeries/Nonvanishing.lean` 417, 404, 412, 468), `differentiableAt_LFunction`,
  `LFunction_changeLevel`, `gammaFactor`, `completedLFunction_one_sub`
  (`NumberTheory/LSeries/DirichletContinuation.lean` 91, 149, 206, 291), `mellinInv_mellin_eq`
  (`Analysis/MellinInversion.lean` 92), `gaussSum_mulShift`, `gaussSum_mul_gaussSum_eq_card`
  (`NumberTheory/GaussSum.lean` 76, 200; the second over a field, as the README says),
  `borelCaratheodory` (`Analysis/Complex/BorelCaratheodory.lean` 109),
  `norm_le_interp_of_mem_verticalClosedStrip'` (`Analysis/Complex/Hadamard.lean` 611),
  `integral_boundary_rect_eq_zero_of_differentiableOn` (`Analysis/Complex/CauchyIntegral.lean`
  313), `autAdjoinRootXPowSubCEquiv` (`FieldTheory/KummerExtension.lean` 277),
  `AlgHom.IsArithFrobAt` (`RingTheory/Frobenius.lean` 55), `Real.fourier_eq`
  (`Analysis/Fourier/FourierTransform.lean` 434), `fourierInv_fourier_eq`
  (`Analysis/Fourier/Inversion.lean` 166), `integral_gaussian`, `ZLattice.covolume`. 26 names, all
  present. Tau Ceti: the 29 names of the contracts were found again at the pin (among them
  `heckeLFunctionC`, `NumberTheory/LFunctions/Hecke/Basic.lean` 74; `PrimitiveRayClassCharacter`,
  `…/Hecke/Primitive.lean` 91; `IsPrimaryEisenstein`, `…/Cyclotomic/Three/Primary.lean` 59;
  `kroneckerWeber`, `…/ClassFields/KroneckerWeber.lean` 178; `rayClassField`,
  `…/ClassFields/RayClassField.lean` 123). No pinned declaration states a zero-free predicate, a
  Kubota character, a large sieve or a primary normalization `≡ 1 (mod 3)`.
- **Supplier citations resolved this round** (main unless said): ExplicitZetaBounds §3.2 (README
  line 1227; `Suggested.lean` line 412, whose hypotheses are those the contract lists); LFunctions
  Layers 0, 4–8 (`heckeData`, `EqOffZero`, `gaussSum_mul`, `norm_gaussSum`,
  `grossencharacterData_ofRayClassCharacter`, `Suggested.lean` lines 1632, 173, 2617, 2628, 2645);
  ZerosOfLFunctions §§1.6, 3.1, 4.4, 4.5, 8.4–8.6 and Layer 9 (lines 895, 1092, 1356, 1420, 2412,
  2473, 2528, 2900); ClassicalArithmeticCompletion §§1.12, 1.23, 1.33, 1.34, 1.38, 1.43, 1.52, 1.72,
  1.75; ClassFieldTheory Layers 11, 13 and §13.1; ThetaSeries Layer 1 (1A); GlobalNumberFields
  Layers 2 and 9 (Completed); SieveMethodsAndPrimePatterns §§2.2, 2.3, 2.7, 2.9;
  AnalyticNumberTheoryPartI §§0.34, 1.6; PartII §5.29; PartIII §8.2;
  AutomorphicFormsOnReductiveGroups §4.5 (it constructs `K_ν` with its equation and decay); at
  their open heads BianchiModularForms §§0.3–0.4, MaassForms §§7.1, 7.3,
  CharacterSumsOverFiniteFields Layers 1–2 and §3.4, AutomorphicSpectralTheory §§0.15, 0.16, 1.15a.
  `roadmaps resolve` reports nothing found nowhere; the worker's lead
  `SieveApplications.leastNonresidue` is a roadmap declaration cited by section.
- **Duplication by object.** Searched all roadmaps, open and on main, for the Kubota character, the
  cubic theta function, Fisher–Friedberg characters, Hecke families, sextic symbols and sieves,
  zero-free half-planes, least nonresidues and least prime ideals, Borel–Carathéodory and
  three-circle statements. No second owner. MetaplecticAutomorphicForms (open) owns the double cover
  of `Sp` and its theta kernels, not `n`-fold Kubota characters; "Kubota" elsewhere is
  Kubota–Leopoldt or unit types. ExplicitNumberFields §1.1 (open) is the Dedekind instance of
  ExplicitZetaBounds §3.2, as §5.2 here is its Hecke instance: one owner, two citing instances.
  ExplicitNumberFields §7.4 is the least prime ideal in a Chebotarev class with explicit constants,
  not §11.2. No roadmap cites QuasiRiemannHypothesis.

Overlap check: read ExplicitNumberFields, CongruenceSpectralGap, CharacterSumsOverFiniteFields, BianchiModularForms, ExplicitMultiplicativeFunctions, MetaplecticAutomorphicForms (open) and ZerosOfLFunctions, LFunctions, AnalyticNumberTheoryPartIII, ExplicitZetaBounds (main); shared: the convexity bound for records of finite-order type, owner ExplicitZetaBounds §3.2 (cited by §5.2); the Gauss sum of a residue character, owner LFunctions Layer 5 (cited by §4.1); the Fourier–Bessel expansion on `ℍ³`, MaassForms §7.3 for `PSL₂(ℤ[i])` and this roadmap for a general `(Γ, χ)` (scope section); nothing else shared.

- **Overlaps.** `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is
  dropped, none is defined only by an open revision, no second copy; the score list of results and
  headings is empty.
- **Supplier order.** Gate output:

      candidate: QuasiRiemannHypothesis is not in the merge order yet; checked as if placed after BianchiModularForms (the intake inserts it when its design is accepted)
      depcheck: 261 roadmaps, 2606 edges, 0 problem(s)

  No UPWARD or CYCLE line; no excluded roadmap is cited as a supplier.
- **Shape.** Eleven layers named by their mathematics, each with Examples and Dependencies; every
  section has a `*Needs:*` line; every definition has at least three Checks (19 definition
  sections, 3 to 6 each); Unicode mathematics, no LaTeX delimiters; this roadmap's own names are in
  italics; a scan for process words, pull-request numbers, anchors and machine paths found none.
- **Headline theorems** (for the package stage): the `11/12` half-plane (§10.7), the transfer
  (§5.5), the continuation principle (§1.3), the zero strip (§11.1), the conditional least-value
  bound (§11.2), `n(p) ≤ C (log p)^12` (§11.3). All are statable at the pins.
- **Arrangement.** 62 of 139 locators are into `openai2026quasiRH`. Layers against its sections:
  1 ↔ §2 and Lemma 11.1; 2–4 ↔ parts of §§4.1–4.3; 5 ↔ §4.4 and Proposition 11.3; 6 ↔ Lemmas 6.1,
  9.1 and three other papers; 7 ↔ §8; 8 ↔ none; 9 ↔ §5; 10 ↔ §§6, 7, 9.2, 10, 11. Not one to one and
  not in order.
- **Wording.** Beside the 15 sampled locators: §7.2's route with `openai2026quasiRH` lines
  2537–2560; §5.5's route with lines 3792–3830; §6.2's definition with `goldmakherlouvel2013` lines
  45–59 (a definition; 7 consecutive words); §8.1 with `patterson1977` lines 121–134; §10.5's first
  two bullets with `openai2026quasiRH` lines 3253–3276 and 3319–3330 (hypothesis lists in the order
  the mathematics gives; at most 4 consecutive words); §1.4 with lines 3691–3710. A mechanical
  search for runs of 8 words shared with 12 cached texts found only titles of cited works and the
  9-word description of `τ` as a bicharacter of the square-class group.

Source independence: 24 passages compared with 7 sources and a mechanical 8-word scan against 12 cached texts, none shared beyond titles and one 9-word mathematical description; largest share `openai2026quasiRH`, 62 of 139 locators; contents compared with `openai2026quasiRH`: independent.

Research link: The headline is Theorem 3.1 of OpenAI (2026), with Liu (2026) as second account; Layers 6 and 8 are the large sieves of Goldmakher–Louvel (2013), Blomer–Goldmakher–Louvel (2014), Heath-Brown (2000) and Patterson's cubic theta function (1977) as used by Dunn–Radziwiłł (2024). Rests on the README and the sources read.

## Not verifiable

- Displays of `openai2026quasiRH` that the OCR drops or garbles: the separation norm of its §4.3,
  (7.6)–(7.12) (§10.3), (10.12)–(10.16) (§10.5, the exponent `E(d; R, g)`), the bound (10.19), which
  was read from a reversed line; conjugation bars throughout. The README's formulas were tested for
  internal consistency instead (table).
- `patterson1977` §7, the nine series and six functional equations of §8.6, and Table III: the scan
  is illegible at the displays; outside the sample, existence of the locators only.
- §6.2, the corollary for `χ_𝔟^(n/2)`: whether the bound for the primitive inducing characters
  passes to the zero-extended powers for an abstract family (the two differ at ideals meeting the
  conductor of `χ_𝔟`) is decided by no source read; for the Fisher–Friedberg characters `bgl2014`
  p. 11 applies it, which is the roadmap's only use.
- `maynardpratt2024` Appendix C, `guthmaynard2026` §13.1, `baierbansal2018` Theorem 3, `bgl2014`
  Theorem 1.3 and Appendix II, `milnecft2020`: outside the sample, not reopened this round.
- Agreement of arXiv numbering with the published versions of `dunnradziwill2024`,
  `goldmakherlouvel2013`, `bgl2014`, `lamzourilisound2015`: no published text was read.
- Elaboration: no Lean file at the design stage; this lane does not elaborate.

## Source issues

- **Misprint** in dunnradziwill2024 at Remark 5.1, printed p. 17: the source says that the cubic symbols of `c` at `a` and at `d` are equal, after showing the symbol at `ad` is `1`; it should be that they are inverse, the symbol at `a` equalling that of `b` at `d`; affects nothing.
- **Error** in goldmakherlouvel2013 at Remark 3 and Corollary 1.2, printed p. 2: the source says the `(n/d)`-th powers of any `n`-th order Hecke family form a `d`-th order family, and bounds the sieve for the `n/2`-th powers; it should be restricted to families whose powers keep the primitivity axiom; affects a stated result.

## For the human reviewers

- Scope: the primary source `openai2026quasiRH` is an unrefereed, machine-written preprint;
  `liu2026improved` and `openai2026quasiRHalt` are unrefereed too. No refereed source states the
  headline (`sources.toml`, first three entries).
- Licence: `openai2026quasiRH` and `openai2026quasiRHalt` are read from a public code repository
  recorded as `author-page`; the repository's licence was not read.
- Licence: `liu2026improved` line 25 reports a Lean formalisation of its result; the package's
  `Suggested.lean` should be compared with it when it exists.
- Not tested: the cached text of `openai2026quasiRH` is an OCR of an image-only scan; displayed
  formulas and conjugation bars are missing, so wording and formulas were compared on prose and by
  computation only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5be56e119c5c750b1226a91953482886b3507b2d", "job": "REV-DESIGN-QuasiRiemannHypothesis~4", "model": "fable", "worker": "chris-x26"} -->
