<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18769#issuecomment-6933308851 -->
Review (claude) of 1260901

Verdict: needs_changes

**Source independence:** 18 passages compared with 7 sources, none shared beyond 7 consecutive words (`goldmakherlouvel2013` lines 54–55, a hypothesis list); largest share `openai2026quasiRH`, 59 of 133 locators; contents compared with `openai2026quasiRH`: independent. The five savings of §10.6 restate the margins of its lines 3678–3683 as prose with their use.

**Research link:** The headline is Theorem 3.1 of OpenAI (2026), with Liu (2026) as second account; Layers 6 and 8 are the large sieves of Goldmakher–Louvel (2013), Blomer–Goldmakher–Louvel (2014), Heath-Brown (2000) and the cubic theta function of Patterson (1977) used by Dunn–Radziwiłł (2024). Rests on the README and the sources read.

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) the cancellation identity of §4.6 is false without a complex conjugate

   Location: `design/README.md` line 816, §4.6: "`χ_n(p) χ_p(n) = R(p, n) 1_{(n,p)=1}` for a good prime `p`
   and primary `n` outside `S`".

   Claim: the product of the two orientations of the sextic symbol is the fixed-ray sign.

   Witness: `p = 1 + 3ω`, `n = −2 + 3ω` (the README's own pair of §4.5): `χ_n(p) = −ω²`, `χ_p(n) = ω²`,
   product `−ω`; `R(p, n) = τ(λ, λ) = −1`. By §4.5, `χ_n(p) χ_p(n) = R · χ_p(n)²`, a cubic symbol times `R`.

   Repair: state `χ_n(p) · conj(χ_p(n)) = R(p, n) 1_{(n,p)=1}`. On the witness: `(−ω²)(ω) = −1 = R`; at
   `n = p` both sides are `0`. Add the witness as a Check ("without the conjugate the left side is `−ω`").
   `openai2026quasiRH` line 703, as extracted, shows no bar; the extraction also drops the bar of
   `G(c) = χ̄_c(4) Γ(c)` (line 625), which the README restored, so the text does not settle what is printed.

2. **F02** (P2) §8.1 states two Kubota characters that are inverse to each other

   Location: `design/README.md` lines 1183–1187, §8.1: "define `κ(σ) = (c/d)_n` … For `K = F`, `n = 3`: on
   `Γ₁(3)` … the function `κ(γ) = (c/a)_3`".

   Claim: the second is read as the case `K = F`, `n = 3` of the first; §§8.5–8.7 and Layer 9 then use one `κ`.

   Witness: `γ = (10, b; 9 + 27ω, d) ∈ Γ(9) ∩ SL₂(𝓞)` with `10d − (9 + 27ω)b = 1`, `9 ∣ b` (so `d ≡ 5` modulo
   `1 + 3ω`): `(c/a)_3 = (10/(1+3ω))_3 = 3² = ω`, `(c/d)_3 = (5/(1+3ω))_3 = 5² = ω²`. Also `3` is not divisible by `n² = 9`.

   Repair: add to §8.1 the sentence "On `Γ(N) ∩ SL₂(𝓞_K)`, `(c/a)_n = (c/d)_n⁻¹` (reciprocity with `ad = 1 + bc`):
   the cubic character `κ = (c/a)_3` of §§8.6–8.7 and Layer 9 is the complex conjugate of the restriction
   of the general one, and its statement on `Γ₁(3)` (level `3`, not divisible by `9`) is Patterson's, not
   an instance of the general one", the witness as a Check, and in §8.5 the clause "for `n = 3` this is
   the theta function of `κ̄`".

3. **F03** (P2) the Fourier tail bound of §3.2 is off by `(2π)^d`

   Location: `design/README.md` line 634, §3.2: "`∫_{|t| > T₁} |ŵ(t)| (1 + |t|)^J dt ≤ T₁^(−N) ‖w‖_{J+N,sep}`".

   Claim: constant `1`, with `‖w‖_{J,sep} = (2π)^(−d) ∫ |ŵ| (1 + |t|)^J dt` as defined in §3.1 (line 610).

   Witness: `d = 1`, `J = N = 0`, `T₁ = 1`, `w_log(u) = e^(iτu) φ(u)` for a bump `φ` (a twisted profile, allowed by
   §3.1): as `τ → ∞` the left side tends to `∫ |φ̂|` and the right side is `(2π)⁻¹ ∫ |φ̂|`; ratio `2π > 1`.

   Repair: `≤ (2π)^d T₁^(−N) ‖w‖_{J+N,sep}`. On the witness the two sides then agree in the limit.

4. **F04** (P2) the contract for ZerosOfLFunctions §3.4 claims a uniformity the supplier does not state

   Location: `design/README.md` lines 250–251 ("with constants depending on the degree only") and line 863, §5.2.

   Claim: §3.4 gives `|ℒ(σ + it)| ≪_K (Q(3+|t|)^d)^(3/5)` on `−1/10 ≤ σ ≤ 11/10`, uniformly in the conductor.

   Witness: `TauCetiRoadmap/ZerosOfLFunctions/README.md` lines 1203–1206 say "there is `C`" for one record; the
   dependence of `C` is stated only for the corollary at `σ = 1/2` (lines 1211–1215), and it includes the
   spectral parameters and the coefficient-bound constant.

   Repair: in the contract write "§3.4 (the strip bound for one record; its constant is stated independent of
   the arithmetic conductor only at `σ = 1/2`)". In §5.2 make the uniform bound this roadmap's own: route
   "the functional equation of LFunctions Layer 5 and Stirling on `Re s = −1/10`, absolute convergence on
   `Re s = 11/10`, and Mathlib `PhragmenLindelof.vertical_strip` applied to `Q^(−3/5) ℒ(s)/(s + 2)^(6d/5)`
   (`openai2026quasiRH` Lemma 4.8)"; *Needs:* LFunctions Layer 5, that Mathlib theorem, ZerosOfLFunctions §3.4
   for the finite-order growth of one record. The exponent check `(3/5)(6/5)/(6/5) = 3/5` at `σ = −1/10` stays.

5. **F05** (P2) five targets are stated by pointing at displays of a source, not stated

   Location: `design/README.md` §8.6 (lines 1292–1297: "the shifted lattices of `patterson1977` (7.1) … (7.4)
   … (7.2) … (7.3) … (7.5)"), §9.2 (lines 1388, 1393: "(5.3)", "the integrated form (5.5)"), §10.2 (line 1476),
   §10.3 (lines 1488, 1496), §10.5 (lines 1537–1544).

   Claim: each is a target with exact hypotheses.

   Witness: `A_(m,σ,t₀)`, `B_(m,σ)`, `Ω` (line 1476), `F_(v,A)(H)` (1488), `P_p` (1496), `ϑ_t` (1385) occur and are
   never defined; §10.5 names Lemmas 10.2, 10.4 and 10.6 by title only, with no hypothesis and no inequality.

   Repair: write each object and statement in the roadmap's notation, the locator kept: in §8.6 the three
   lattices, the nine series, the gamma factor and the six functional equations; in §9.2 the dependence
   on moving primes and the integrated bound; in §10.2 `A`, `B`, `Ω`; in §10.3 the coefficient `F_(v,A)(H)`
   and the six values of `P_p`; in §10.5 one sentence with quantifiers and the displayed bound for each of
   `openai2026quasiRH` Lemmas 10.2–10.6 (lines 3253–3625), or split §10.5 into five targets.

6. **F06** (P2) the scope section says the roadmap follows its source, and carries planning narrative

   Location: `design/README.md` lines 32–42 ("It is restated here statement by statement in this roadmap's own
   words … The route of `openai2026quasiRH` is the one planned, because its later stage …"), lines 79–84
   ("Size of the two supplier blocks … either can become a separate roadmap"), line 1688 ("now unconditional").

   Claim: none mathematical; these are statements about how the roadmap was planned.

   Witness: the three passages quoted; the layers themselves do not follow the source (Arrangement, below).

   Repair: replace lines 32–42 by "**The sources.** The `11/12` half-plane is `openai2026quasiRH` Theorem 3.1, an
   unrefereed preprint; `liu2026improved` §§3–6 gives a second account of the same argument and
   `openai2026quasiRHalt` a second proof by a mean square of sextic-twisted Möbius sums. Every numerical constant
   of Layer 10 is a closed-form rational inequality stated with its target." Delete lines 79–84. In line 1688
   write "unconditional at `11/12` by §10.7".

7. **F07** (P2) Gauss sums modulo an ideal have a second owner, LFunctions Layer 5

   Location: `design/README.md` lines 56–57 ("Gauss sums modulo ideals of a number field containing `μ_n`", Owned
   here) and §4.1, lines 701–711.

   Claim: this roadmap owns the trace additive character `ψ_y` of `𝓞/𝔠`, `y ∈ 𝔠⁻¹𝔡⁻¹`, its Gauss sum and shift law.

   Witness: `TauCetiRoadmap/LFunctions/README.md` lines 998–1008: `τ_𝔪(χ_f, y) = ∑_{x mod 𝔪₀} χ_f(x) e^(2πi Tr(xy))`
   (`gaussSum`), the shift law `gaussSum_mul` and `norm_gaussSum` under "`y 𝔪₀ 𝔡` prime to `𝔪₀`".

   Repair: under "Consumed, not redefined" add "the Gauss sum of a residue character modulo an ideal for the
   character `x ↦ e^(2πi Tr(xy))`, its shift law and its norm: LFunctions Layer 5 (`gaussSum`, `gaussSum_mul`,
   `norm_gaussSum`)"; in "Owned here" and §4.1 keep only the variant, with the clause "for the powers of the
   power residue symbol, which are not residue characters of Hecke characters (`χ_p³(−1) = −1` at `p = 1 + 3ω`)",
   and delete the first two API bullets of §4.1 in favour of the citation.

8. **F08** (P3) the Check of `Γ(λ)` writes the wrong argument

   Location: `design/README.md` line 775: "`Γ(λ) = |λ|⁻¹ (1 + 2e(1/λ²)) = (1 + 2ω)/√3 = i`".

   Witness: `Σ_{x mod λ} e(x²/λ) = 1 + 2e(1/λ)` and `e(1/λ) = exp(2πi Tr(1/λ²)) = exp(−4πi/3) = ω`; but
   `e(1/λ²) = exp(2πi Tr(λ/9)) = 1`, which would give `√3`.

   Repair: write `e(1/λ)`. The value `i` and the four-term value `(1 − 1 + i + i)/2 = i` are correct.

9. **F09** (P3) the sign of the norm twist in §7.1

   Location: `design/README.md` line 1109: "`M_r` sees `L^orig(s + iv, ψ)⁻¹`".

   Witness: `Σ μ(𝔫)ψ(𝔫) N𝔫^(iv) N𝔫^(−s) = L^orig(s − iv, ψ)⁻¹`; `openai2026quasiRH` line 2588 has `s + σ − iw`.

   Repair: "`M_r` sees `L^orig(s − iv, ψ)⁻¹` against `MW(s)`"; it agrees with the Conventions line
   `M[W(y) y^(iw)](s) = MW(s + iw)` after the substitution `s ↦ s − iv`.

10. **F10** (P3) the separation of the reduced fractions

   Location: `design/README.md` line 1082 (Layer 6 Examples) and line 1479 (§10.2): "separated by `min(1, r₊)/Y`".

   Witness: `q_s, q_s' ≤ r₊Y` gives `|d/s − d'/s'| ≥ 1/|s s'| ≥ 1/(r₊Y)`. For `r₊ = 13`, `Y = 1`, `s = 1 + 3ω`,
   `s' = 4 + 3ω`: the distance is `1/√91 ≈ 0.105 < min(1, 13)/1`.

   Repair: `min(1, 1/r₊)/Y` in both places; `δ⁻² ≤ max(1, r₊²) Y²`, so the bound `(Q + Y²)/Y` is unchanged.

11. **F11** (P3) two library citations do not resolve at the pin

   Location: `design/README.md` lines 214, 671, 695 (`Real.fourierIntegral`) and line 422 ("Tau Ceti's rectangle
   integrals").

   Witness: at the pinned Mathlib, `Mathlib/Analysis/Fourier/FourierTransform.lean` declares
   `VectorFourier.fourierIntegral` (line 81), `Fourier.fourierIntegral` (339) and `Real.instFourierTransform`
   (428); no `Real.fourierIntegral`.

   Repair: cite `VectorFourier.fourierIntegral` and `Real.fourier_eq`; in §1.3 cite Mathlib
   `Complex.integral_boundary_rect_eq_zero_of_differentiableOn` (`Mathlib/Analysis/Complex/CauchyIntegral.lean`
   line 313).

12. **F12** (P3) `patterson1977` is cited by two page schemes

   Location: `design/README.md` lines 1188, 1256, 1300, 1317 ("pp. 2–5", "pp. 6–8", "pp. 23–24", "pp. 29–30") against
   line 1321 ("p. 151") and line 1717 ("125–161").

   Witness: `patterson1977` lines 925–926 (scan page 23 is printed page 146), lines 1150–1151 (scan 29 is printed 152).

   Repair: printed pages throughout: `125–128`, `129–131`, `146–147`, `152–153`.

13. **F13** (P3) sections without a `*Needs:*` line, and definitions without Checks

   Location: §§1.1, 3.1, 3.3, 3.5, 4.1–4.6, 5.5, 6.1, 6.3, 6.5, 7.1, 8.1, 8.3, 8.5, 8.7, 9.1, 10.1, 10.3, 10.4, 10.6,
   11.1, 11.3 (26 of 55 targets) have no `*Needs:*` line; §3.4 (`s_j`, `K_W`), §5.1 (`D_𝔯`), §7.2 (`M_j`), §9.2
   (`V♯`, `𝓜_{A,B}`, `B_p`) define objects with no `**Checks.**`.

   Witness: the headings listed; `plan.json` carries prerequisites for all 55, so the lines can be written from it.

   Repair: add the line to each section from its `prerequisites`; add three Checks to each of the four
   definitions (for instance `D_𝔯 = 1` at `𝔯 = 𝓞`; `B_p` at `j_p = 4` is `−q_p^(−1/2)` off `p`; `M_j` constant in `j`
   gives the bin `i = 1`). In §1.1 add the Check that a function not meromorphic at a point has order `0`
   there by Mathlib's convention, so the predicate holds vacuously, which is why §§1.1–1.3 assume meromorphy.

14. **F14** (P3) three supplier citations are loose

   Location: `design/README.md` line 746–747 ("`J(H, H³) = H(4) J(H, H)` (CharacterSumsOverFiniteFields Layer 2)"),
   lines 285–286 (BianchiModularForms §0.3 "groups commensurable with `SL₂(𝓞_K)`"), lines 135–137 ("Langlands'
   general theory of Eisenstein series of Hilbert type, which no roadmap plans").

   Witness: CharacterSumsOverFiniteFields at its open head states the duplication `g(χ) g(χη) = χ(4)⁻¹ g(χ²) g(η)`
   in §3.4 (Layer 3); BianchiModularForms §0.3 states discreteness for `Γ₀(𝔫, 𝔞)`; AutomorphicSpectralTheory
   §§1.15a–1.15c own the continuation of Eisenstein series of reductive groups.

   Repair: cite CharacterSumsOverFiniteFields §3.4 for the duplication formula; write "§0.3 (for `Γ₀(𝔫, 𝔞)`;
   finite-index subgroups of `SL₂(𝓞_K)` inherit it)"; write "for forms with a Kubota character, which are
   not automorphic forms of a reductive group and so are outside AutomorphicSpectralTheory", and say in §8.4
   that for trivial `χ` on a congruence group the statement is the classical form of that roadmap's.

15. **F15** (P3) references that no statement cites

   Location: `design/README.md` lines 1720–1722, 1746–1751.

   Witness: `kazhdanpatterson1984`, `yoshimoto1987`, `thornerzaman2019`, `bcss2025` and `quanta2026quasiRH` occur only
   in the reference list (one line each).

   Repair: cite each at the statement it supports or delete it from the list and from the manifest's
   `cited_for`; a magazine article on the reception of the preprints supports no statement.

15 findings: 1 P1, 6 P2, 8 P3. No previous review and no maintainer notes exist for this roadmap.
The design has no `Suggested.lean` (design stage), so steps 6 (Lean form) and 7 (headline and padding
probe) have nothing to elaborate; this lane does not elaborate. No supplier gap is declared
(`design/plan.json`, `gaps = []`), and none of the findings needs one.

Files read: `packages/QuasiRiemannHypothesis/design/README.md` (all 1751 lines),
`packages/QuasiRiemannHypothesis/design/plan.json` (11 layers, 55 targets, 108 tests, 12 suppliers),
`packages/QuasiRiemannHypothesis/sources.toml` (24 entries, all `certified`, no machine path).

## Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 predicate | `s − 2`; `0`; `1/(s − 1)`; non-meromorphic `f` | orders `1`, `⊤`, `−1`; `0` by `meromorphicOrderAt_of_not_meromorphicAt` | Checks hold; junk case not recorded | R13 |
| §1.2 abscissa | empty; `{s − 3/4}`; `{s − 1/4}`; `{s − 2}` | `1/2`, `3/4`, `1/2`, `2` | holds | none |
| §1.3 continuation | exponents of `f_η`; Gaussian on `Re s = 2` | `E* = min(β* − σ₀ − ω, σ) > 0`, `β* − E* > σ₀ > 1/2`; modulus `e^((7/6)² − t²)` | holds; matches Prop. 2.1 with the family made abstract | none |
| §1.4 late height | `Aτ ≤ m/4`, `Z ≥ 1` | `(1 + Z^τ)^A ≤ 2^A Z^(m/4)`, first term `Z^(C(β*) − 3m/4)` | holds | none |
| §2.1 | `(ℚ, 2, −1)`, `(ℚ, 2, 5)`, `(F, 6, −1)` | conductor `4∞`; `(5/3) = −1 = (3/5)`; `−1` at norm `7`, `+1` at `13` | holds | none |
| §2.2 primary | `−2`, `1 + 3ω`, six units | norms `4`, `7`; units distinct modulo `3` | holds; pin has `3 ∣ x − 2` (`Primary.lean` 59) | none |
| §2.3 sextic symbol | `p = 1 + 3ω`, `ω ↦ 2` | `χ_p(2) = 2 = ω`, `χ_p(3) = 3 = −ω²`, `χ_p(−1) = −1` | holds | none |
| §2.5 reciprocity, supplements | `π = −2 + 3ω` (`ω ↦ 7`), `t = −7`; `d = 1 + 3ω` | `12⁶ ≡ 1 (19)`; `1 − λ² + λ³ ≡ 1 + 3ω (9)`, `(ω/d) = ω²`, `(λ/d) = 5² = 4 = ω²` | holds | none |
| §3.2 tail bound | `d = 1`, `J = N = 0`, twisted bump | ratio of sides `→ 2π` | false constant | R03 |
| §3.3 Gaussian weight | `s = 0, 1, 1/2 + it`; variant `e^(−u²)` | `1`, `e`, `e^(1/4 − t² + it)`; `√π e^(s²/4)` | holds | none |
| §3.5 lattice | `e(1)`, `e(ω)`, `e(ω/2)`; `H = 3` | `1`, `1`, `−1`; area `√3/2 · 2/√3 = 1`; `2` ideals against `1.81` | holds | none |
| §4.1 `γ_3(1 + 3ω)` | `Tr(1/(pλ)) = −3/7`, `(4/7) = 1` | `γ_3 = i`; `γ_6 = −1/√7` | holds, agrees with §4.4 | none |
| §4.2 | `(ℚ, 2, 3, 5)`; `j = 0` | `(−1)(−1) i√3 √5 = i√15`; `(−1)(−1) = 1` | holds | none |
| §4.3 | `p = 1 + 3ω` | `γ_1 = H̄(4) γ_3 γ_2²`; `−α ω i = −0.6547 + 0.7559i`, `−α ω² i = −0.3273 − 0.9449i` | holds | none |
| §4.4 four-term formula | `1, −1, λ, −λ, 1 + 3ω, 4 + 3ω, −2 + 3ω`; five `τ` values | `1, 1, i, −i, i, 1, i`; `τ(λ,λ) = −1`, `τ(−1,λ) = −1`, `τ(−λ,λ) = 1`, `τ(−λ,−λ) = −1` | formula holds; Check text slips | R08 |
| §4.5 sextic reciprocity | `a = 1 + 3ω`, `b = −2 + 3ω` | `χ_b(a) = 8 = −ω²`, `χ_a(b) = 4 = ω²`, ratio `−1 = τ(λ, λ)`; `G(p) = ωi`; ray class group of order `12` | holds | none |
| §4.6 | same pair; `ℤ/2` indicator | product `−ω`, `R = −1`; `Σ|a_θ| = 1 ≤ √2` | identity false | R01 |
| §5.2 strip growth | `δ = 1/10`, `σ = −1/10` | exponent `0.6 · 1.2/1.2 = 3/5`; at `K = F`, `Q^(3/5)(3 + |t|)^(6/5)` | bound true; supplier uniformity unstated | R04 |
| §5.3 | `a = 1/2`; `|(s−1)/(s+1)|` on `Re s ≥ 0` | disc reaches `Re s = 1/2 + 2ε ≥ −1/10`; `≤ 1` | holds; matches Lemma 4.9 | none |
| §5.4–5.5 | `ℚ(i)` modulo `5`; `ℚ(√2)`; `χ₋₃` | `χ(9) = −1`; `N(1 + √2) = −1`; `L(1, χ₋₃) = π/(3√3)` | holds | none |
| §6.1 | `J = 1`; `z_j = j/N`, `Q < N` | `≍ Q^d`; `N² ≤ (Q + N) N` | holds | none |
| §6.2 Hecke family | `ℚ`, `a = 3, 7, 5` | `(21/·)` conductor `21`, `(15/·)` conductor `60`; conductor `λp` at `p = 1 + 3ω` | holds; matches Definition 1 | none |
| §6.3 | `(1 + λ²x)³` in `F_λ`; `(10/(1 + 3ω))_3` | `≡ 1 − λ⁴x (λ⁵)`; `100 ≡ 2 = ω` | holds | none |
| §6.5, Layer 6 Examples | `(MN)^(2/3)` against `M`, `N`; `r₊ = 13` | dominates for `M^(1/2) < N < M²`; distance `0.105` | separation constant wrong | R10 |
| §7.1 | `r = 0`; twist `x^(iv)` | `M_0 = W(1)`; argument `s − iv` | sign slip | R09 |
| §7.2–7.3 | pigeonhole with `I = ⌈1/ε⌉ + 2`; shift to `a + 6ε` | `(I − 1)ε > 1`; `U^(r(2a − 1) + …)` | holds; Lemma 8.2 is at pp. 57–58 | none |
| §8.1 | `γ = (1+3ω, −3ω²; 3, 1−3ω)`; `γ ∈ Γ(9)` of R02 | `(c/a) = ω = (b/d)` (`4⁴ ≡ 9 (13)`); `(c/a) = ω`, `(c/d) = ω²` | two conventions | R02 |
| §8.5 | `n = 3`, `n = 2` | pole `4/3`, eigenvalue `8/9`; `3/2`, `3/4` | holds | none |
| §8.6 | hypotheses against Theorem 7.1 | residues `r(0,0) = ω² r(1,−1) = ω r(2,−1)` agree | statement by pointers | R05 |
| §8.7 | `k = 3n − 4`, `3n − 3`, `−4` | `3^(n/2+2) ≤ 3^(n/2+7/3)`; `3^(n/2+5/2)` attained; `9 < 12.98` | holds; matches (5.6)–(5.14) | none |
| §9.1, §9.4 | coefficient of `T` at `cn³`; `M = N = 1` | `q_c^(−1/2) q_n^(−1)` at `s = 1/2 + w`; exponent `1 − O/2 ≤ 1` | holds; (5.28) agrees | none |
| §10.3 | `(s, 1, 1/6)`; `X = Z^(1/2)` | `1/6 ≥ 33/200`; `X^(1/3) Z^(s − 5/6) = Z^(s − 2/3)` | holds; `D₁`, `D₂` agree with (7.14)–(7.15) | R05 for `P_p` |
| §10.4 | `δ = 1/50, 2/3, 1` | `1`, `2/3`, `1/2` | holds | none |
| §10.6–10.7 | the closed forms | `46·10⁻⁶ < 1/4800`; `3m₀/4 = 1/1600 > 1/2400`; `C(11/12) = 1/4`; `ω = (β* − 11/12)/2 < β* − σ₀` | holds | none |
| §11.1 | `ρ ↦ 1 − ρ̄` | `Re(1 − ρ̄) ≤ θ` gives `Re ρ ≥ 1 − θ` | holds | none |
| §11.2 | `x` with `χ(n) ∈ {0, 1}` below it | `x ≪ x^θ log q + log q log x`, so `x^(1−θ) ≪ log q`; `θ = 1/2` gives `2` | holds; the source has only `θ = 1/2` | none |
| §11.3 | `θ = 11/12`; `ϵ = 11/24`, `7/16` | `12`; `4/(1 − 2ϵ) = 48`, `32` | holds | none |

## Verified sound

- **Principles.** No route-specific shortcut found: Layers 2, 4, 5, 6, 7 and 8 are stated over general
  number fields with the `ℤ[ω]` forms as instances. No algorithm (the algorithmic clause of Corollary 1.2
  is excluded, line 142), no `set_option`, no Lean file. The `7/8` stage is handed to a Part II by name.
- **Sampled sources (15 targets).** Verified at the locator: §1.3 (`openai2026quasiRH` lines 316–337, p. 8),
  §2.3 (lines 444–451, p. 11), §3.3 (lines 820–848, pp. 19–20), §3.5 (lines 433–443, p. 11), §4.4 (lines
  567–581, p. 14), §4.5 (lines 620–693, pp. 15–16), §5.2 (lines 898–902, p. 21), §5.3 (lines 957–967, p. 22),
  §7.1 (lines 489–494, p. 12), §7.3 (lines 2569–2582, pp. 57–58), §8.6 (`patterson1977` lines 930–953), §8.7
  (`patterson1977` lines 1154–1178; `dunnradziwill2024` lines 1229–1254, 1297–1320), §9.4 (`openai2026quasiRH`
  lines 1603–1625, p. 37), §10.3 (lines 2250–2266, 2368–2404), §11.2 (`lamzourilisound2015` lines 55–62, 236–252).
  Also read: Lemmas 4.1, 6.1, 6.2, 8.1, 11.1, Propositions 6.3, 11.2, 11.3; `goldmakherlouvel2013` lines 45–100;
  `kubota1969` lines 617–691, 1364–1367; `milnecft2020` lines 11185–11238 (printed p. 245); existence of the
  cited items of `liu2026improved`, `bgl2014`, `heathbrown2000`, `gaozhao2024`, `baierbansal2018`, `bimsissac2017`,
  `tao2015`, `maynardpratt2024`, `guthmaynard2026`, `openai2026quasiRHalt`. The author flagged no locator as unverified.
- **Library at the pins.** 22 Mathlib and 33 Tau Ceti names opened; all resolve except `Real.fourierIntegral`
  (R11). Read for content: `meromorphicOrderAt` (`Mathlib/Analysis/Meromorphic/Order.lean`, junk value `0`),
  `IsPrimaryEisenstein` (`TauCeti/NumberTheory/NumberField/Cyclotomic/Three/Primary.lean` 59),
  `gaussSum_powerResidueSymbol_three_pow_three_eq` (`…/Three/CubicReciprocity.lean` 84: `g³ = N P · f π`, any
  primitive additive character), `cubic_reciprocity` (144, different norms) and `cubic_reciprocity_intCast`
  (273), `heckeLFunctionC` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean` 74), `powerResidueSymbolIdeal`
  (`…/PowerResidueSymbol/Ideal.lean` 94), `Complex.borelCaratheodory` (`Mathlib/Analysis/Complex/BorelCaratheodory.lean` 109).
- **Supplier citations resolved.** On main: LFunctions Layers 4, 5, 7; ZerosOfLFunctions §§3.4, 4.4, 4.5, 8.4–8.8
  and Layer 9; ClassicalArithmeticCompletion §§1.12, 1.23, 1.33, 1.34, 1.38, 1.59, 1.72, 1.75; ClassFieldTheory
  Layer 11, §13.1; ThetaSeries Layer 1 (1A); AutomorphicFormsOnReductiveGroups §4.5; SieveMethodsAndPrimePatterns
  §§2.2, 2.3, 2.7, 2.9 (`SieveApplications.leastNonresidue`, README line 2457: the lead of `scratch/citations.md`
  is a supplier roadmap's name, not a library one, and is cited as such); AnalyticNumberTheoryPartI §§0.34, 1.6;
  AnalyticNumberTheoryPartII §5.29; AnalyticNumberTheoryPartIII §8.2; `Completed/GlobalNumberFields`. At open
  heads (new roadmaps, earlier in the merge order): CharacterSumsOverFiniteFields §§1.1, 1.2, 1.4, 1.5 and
  Layer 2; BianchiModularForms §§0.3, 0.4; MaassForms §7.1; AutomorphicSpectralTheory §§0.15, 0.16.
- **Duplication by object.** Searched all roadmaps for the Kubota character, cubic theta, Fisher–Friedberg
  characters, cubic and sextic large sieves, number-field large sieves, zero-free half-plane predicates,
  zero detection, least nonresidues, Eisenstein series on `ℍ³`, norm-composed characters: no second owner
  except R07. MetaplecticAutomorphicForms owns the double cover and oscillator theory only;
  AutomorphicSpectralTheory owns reductive groups (R14). `scratch/overlaps.md` lists no changed, dropped or
  revision-only id; confirmed that no pull request changes this roadmap and it is not on main.

Overlap check: read ZerosOfLFunctions, LFunctions, AnalyticNumberTheoryPartIII (main) and ExplicitNumberFields, CharacterSumsOverFiniteFields, CongruenceSpectralGap, ExplicitMultiplicativeFunctions (open); shared: the Gauss sum modulo an ideal, owner LFunctions Layer 5 (R07); nothing else shared.

- **Supplier order.** Gate output: `candidate: QuasiRiemannHypothesis is not in the merge order yet; checked as
  if placed after BianchiModularForms (the intake inserts it when its design is accepted)` and
  `depcheck: 261 roadmaps, 2605 edges, 0 problem(s)`. No UPWARD or CYCLE line; no excluded roadmap is cited.
- **Shape.** Eleven layers, each with Examples and Dependencies; Unicode mathematics, no LaTeX delimiters;
  this roadmap's own names are in italics, so no backticked name claims a Lean declaration.
- **Headline theorems** (for the package stage): the `11/12` half-plane (§10.7), the zero strip (§11.1), the
  conditional least-character bound (§11.2), `n(p) ≤ C (log p)^12` (§11.3), the continuation principle (§1.3)
  and the transfer (§5.5). All are statable at the pins with a three-line predicate; `leastNonresidue` is not
  in the pinned Tau Ceti, so §11.3 is stated there through `jacobiSym`.
- **Arrangement.** Layers against the sections of `openai2026quasiRH`: Layer 1 ↔ §2 and Lemma 11.1; 2, 3, 4 ↔
  parts of §4.1–4.3; 5 ↔ §4.4 and Proposition 11.3; 6 ↔ Lemmas 6.1, 9.1 and three other papers; 7 ↔ §8; 8 ↔ no
  section; 9 ↔ §5; 10 ↔ §§6, 7, 9.2, 10, 11. Not one to one and not in order. Inside Layer 10 the seven
  sections follow §§6, 7, 9, 10, 11; the lines "*Needs:* §10.1", "§§10.3–10.4", "§§10.2, 10.3, 10.6" force that order.

Source independence: 18 passages compared with 7 sources, none shared beyond 7 consecutive words (`goldmakherlouvel2013` lines 54–55, a hypothesis list); largest share `openai2026quasiRH`, 59 of 133 locators; contents compared with `openai2026quasiRH`: independent. The five savings of §10.6 restate the margins of its lines 3678–3683 as prose with their use.


Research link: The headline is Theorem 3.1 of OpenAI (2026), with Liu (2026) as second account; Layers 6 and 8 are the large sieves of Goldmakher–Louvel (2013), Blomer–Goldmakher–Louvel (2014), Heath-Brown (2000) and the cubic theta function of Patterson (1977) used by Dunn–Radziwiłł (2024). Rests on the README and the sources read.

## Not verifiable

- Whether `openai2026quasiRH` prints a conjugation bar in the display at its line 703, and how it normalises
  the separation norm (lines 715–716): the text is an OCR extraction that loses overlines and part of displays.
- The printed form of Kubota's symbol in `kubota1969` Proposition 1 (line 655 is illegible in the extraction);
  R02 rests on the README's two formulas.
- `kubota1968` locators, `dunnradziwill2024` Appendix A rows 1, 10, 19, `gaozhao2020` (1.1) and the content of
  `maynardpratt2024` Appendix C and `guthmaynard2026` §13.1: outside the sample, not compared in detail.
- Agreement of arXiv numbering with the published versions of `dunnradziwill2024`, `goldmakherlouvel2013`,
  `bgl2014`: the manifest records it as not checked, and no published text was read here.
- Elaboration: no Lean file at the design stage; this lane does not elaborate.

## Source issues

- **Misprint** in openai2026quasiRH at Lemma 6.2, proof, printed page 49: the source says, as extracted, that the fractions are separated by the minimum of one and the upper support bound, over Y; it should be the minimum of one and the reciprocal of that bound, over Y; affects nothing.

## For the human reviewers

- Scope: the primary source `openai2026quasiRH` is an unrefereed, machine-written preprint of 30 September 2026;
  `liu2026improved` and `openai2026quasiRHalt` are unrefereed too. No refereed source states the headline
  (`sources.toml` lines 19, 37, 55).
- Licence: `openai2026quasiRH` and `openai2026quasiRHalt` are read from a public code repository recorded as
  `author-page` (`sources.toml` lines 12, 30); the repository's licence was not read.
- Licence: `liu2026improved` line 25 and `quanta2026quasiRH` report public Lean formalisations of the argument;
  the package's `Suggested.lean` should be compared with them when it exists.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1260901233fb384c4dc663ab2db4eb4a1d9b74c4", "job": "REV-DESIGN-QuasiRiemannHypothesis", "model": "fable", "worker": "chris-x29"} -->
