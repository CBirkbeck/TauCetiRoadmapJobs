# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at 4d3f9ec)

**Verdict:** accepted

Incremental re-review of the 80 changed lines since e3ae167 (43 insertions, 37 deletions, all in `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`; `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder). No new finding. The four findings of the previous review are repaired without introducing a new problem.

## Previous findings

- R01 — repaired: RD.6.98 Hypotheses (`README.md:13768`) now read “`p` any prime with `p ∤ n + 1` (the hypothesis of §RD.6.96), `n ≥ 1, k ≥ 1`; (c) needs `kn ≥ 2`”, with the source's `p = 2`, `n` even caveat stated as not asserted, and the `p = 2, n = 2, k = 1` instance added as a Check (line 13784); Sources add §5.1.5, p. 49.
- R02 — repaired: RD.1.46 (`README.md:3363`) “Let `p` be any prime … (for `p = 2`, `π = −2`)”; step 3 routes (c) through Dwork's factorisation and §RD.1.63 for every `p`, keeps the `−π` rewriting as the odd-`p` shortcut, adds §RD.1.63 to *Needs* and a fourth Check with the `p = 2` coefficients; RD.1.64's hypothesis (line 3833) now says the break and Artin–Schreier statements of §RD.1.46 and §RD.2.44 are stated for every prime, and its closing paragraph (line 4155) says “for every prime `p`”.
- R03 — repaired: RD.1.63 *Needs* (`README.md:3820`) now lists Mathlib `PowerSeries.exp`, `ArithmeticFunction.moebius`, `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq`, `PadicInt.instBinomialRing`, `Ring.choose`, `PowerSeries.binomialSeries`, “nothing from earlier layers”; the six declarations are added to the Mathlib contract list (lines 281, 342, 354, 356, 361) and exist at the pin (table below).
- R04 — repaired: RD.6.96 Sources (`README.md:13720`) read “Proposition 2.10 (tensor/convolution comparison), p. 13”; RD.6.97 *Needs* (line 13748) cite §RD.6.52a as “Formal irregularity and good lattice pairs on algebraic curves” and §RD.6.42 as “The Dwork (Artin–Schreier) isocrystal `L_π`”, the headings' titles. The same repair retitled 27 further *Needs* items across RD.3.49, RD.3.53, RD.4.1a, RD.4.57, RD.5.8c, RD.5.78a, RD.5.79, RD.5.105a, RD.5.111, RD.5.112, RD.5.113, RD.6.52b, RD.6.53, RD.6.89, RD.6.94, RD.6.96, RD.7.21 and RD.7.22; a script comparing every titled `§RD.k.n *title*` reference in a *Needs* line with its `### RD.k.n` heading finds 2025 such references and no mismatch (its 18 reported differences are all titles containing a `*` inside a code span, cut by the script's own pattern, and agree with the headings when read).

## Verified sound

### Gate, dependencies, shape and elaboration

The worker's gate at this head passes every check (`set_option`, blob, LaTeX, pull-request numbers, sorry-data, residue, imports, round labels, long fences, layer and target ids, depcheck, metadata, stray files, outside-folder, build). `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. The prescribed dependency check on this head printed exactly:

```text
depcheck: 208 roadmaps, 1481 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The only supplier edge the diff adds is RD.1.46 → §RD.1.63 (same layer, RD.1.63 is a `Lemma` using only Mathlib, so no cycle: RD.1.63's *Needs* name no target of this roadmap). The diff removes the RD.1.63 → §RD.0.25 edge. The 44 added lines contain no process word (scan for “so far”, “to be checked”, “current”, “removed”, “checkpoint”, “handoff”, “packet”, round labels, pull-request references, “optional”, “deferred”, “TODO”: no hit).

`lake env lean` on `Suggested.lean` (unchanged since e3ae167) completes with exactly the two `declaration uses 'sorry'` warnings at lines 53 and 88. The worker's elaborated signatures of the three declarations (`RD0.arabia_controlled_lifting`, `RD1.CyclicFor`, `RD1.katz_cyclic_vector`) are those the previous review compared with the README; the Lean file and the README passages they state (RD.0.39, RD.1.7) are untouched by this diff, so the one-tactic probes and the headline-coverage conclusions of the previous review stand (no headline statable at the pins is absent; neither sorried theorem closes in one tactic).

### Pinned declarations opened for the changed passages

| File and line at the pin | What was read |
| --- | --- |
| `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:51` | `def moebius : ArithmeticFunction ℤ`. |
| `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:236` | `sum_eq_iff_sum_mul_moebius_eq [NonAssocRing R] {f g : ℕ → R}`: `(∀ n > 0, ∑ i ∈ n.divisors, f i = g n) ↔ ∀ n > 0, ∑ x ∈ n.divisorsAntidiagonal, (μ x.1 : R) * g x.2 = f n`. With `f` the indicator of 1 and `g = 1` it gives `∑_{d ∣ m} μ(d) = [m = 1]`, the divisor sum RD.1.63 step 1 uses; the more direct `moebius_mul_coe_zeta : (μ * ζ : ArithmeticFunction ℤ) = 1` is at line 156 (a note, not a finding). |
| `Mathlib/NumberTheory/Padics/MahlerBasis.lean:77` | `noncomputable instance instBinomialRing : BinomialRing ℤ_[p]` in `namespace PadicInt`: `multichoose x k` is `(ascPochhammer ℤ_[p] k).eval x / k!` in `ℚ_[p]` lifted by the norm bound `norm_ascPochhammer_le` (line 53), whose proof obtains a natural number near `x` with `PadicInt.denseRange_natCast.exists_dist_lt` and uses the ultrametric inequality: the contract's “Mathlib proves it by density of `ℕ` (`PadicInt.denseRange_natCast`)” is exact. |
| `Mathlib/NumberTheory/Padics/RingHoms.lean:501` | `theorem denseRange_natCast : DenseRange (Nat.cast : ℕ → ℤ_[p])`. |
| `Mathlib/RingTheory/Binomial.lean:379` | `def Ring.choose [AddCommGroupWithOne R] [Pow R ℕ] [BinomialRing R] (r : R) (n : ℕ) : R`. |
| `Mathlib/RingTheory/PowerSeries/Binomial.lean:47, 51` | `def binomialSeries (A) [One A] [SMul R A] (r : R) : PowerSeries A := mk fun n => Ring.choose r n • 1` with `binomialSeries_coeff`; the series for `(1 + X)^r`, so `(1 − X^m)^{−μ(m)/m}` is its substitution at `−X^m`, as RD.1.63 step 2 says. |
| `Mathlib/RingTheory/PowerSeries/WellKnown.lean` | `PowerSeries.exp` (already in the contract list; the grep for its `def` line at the pin returned it under `exp (A) [Algebra ℚ A]`). |

### Source checks on the changed passages

Cache texts are cited by their first eight hash characters; page numbers are the printed ones (the Numdam Dwork scan prints “56 BERNARD DWORK” at the top of its PDF page 53).

| # | Target (label) | Source passage | Result |
| --- | --- | --- | --- |
| 1 | RD.1.46 (Lemma), step 3 and Sources | Kedlaya, Fourier transforms and p-adic Weil II, `b678f13c` lines 1149–1170, Remark 4.2.3, pp. 29–30: `Σ c_i x^i = exp(−πx + πx^σ)` and “`Σ c_i x^i ∈ K⟨x⟩†` (an observation of Dwork)”; lines 1178–1184, §4.3, p. 30 (the Dwork isocrystal, trivial after `u^p − u = x`, `p`-th tensor power trivial on the line). | The series Kedlaya overconverges is exactly the README's `θ = exp(π(x^p − x))` at `q = p`. The text states no parity: a grep of the whole paper for “odd”, “`p > 2`”, “`p ≠ 2`”, “`p = 2`” returns nothing. “For every `p`” is a faithful reading. |
| 2 | RD.1.46 (b), (d) and RD.2.44 (d) | Kedlaya, Local monodromy of p-adic differential equations: an overview, `31d9e39e` lines 1301–1325, Lemma 5.4.7 (p. 33) and proof (pp. 33–34). | Hypotheses: `a ∈ k^*`, `p ∤ n`, `E` with no trivial submodule and `f^*E` constant; conclusion highest break `n`. The proof adjoins `π` with `π^{p−1} = −p` and uses `exp(−πb(t^{−n} − t_ρ^{−n}))` converging on `|t − t_ρ| < ρ^{n+1}`; no parity of `p` anywhere (grep for “odd” in the paper: no hit). RD.2.44's statement already carried no parity; RD.1.64's new sentence is correct. |
| 3 | RD.1.63 (Lemma) | Dwork, On the zeta function of a hypersurface, `587b2058` lines 2019–2023, (4.3)–(4.4), printed p. 56 (PDF page 53), inside the proof of Lemma 4.1, §4(a). | `E(t) = exp(Σ_j t^{p^j}/p^j)`, `E ∈ L(0,0)`, `E ≡ 1 + t` modulo the maximal ideal: the integrality and constant-term statement, as cited. |
| 4 | RD.6.98 (Theorem), Hypotheses | Fresán–Sabbah–Yu, `835580aa` lines 986–998, §3.2.1, pp. 23–24. | Concentration of `Sym^k Kl_{n+1}` in degree one “still holds for odd `p` or if `p = 2` and `n` is odd” (monodromy `SL_{n+1}` or `Sp_{n+1}`, Katz Th. 11.1); “if `p = 2` and `n` is even, the geometric monodromy group is either `SO_{n+1}` or `G_2`” and symmetric powers may contain the trivial representation. The README's caveat sentence restates exactly this. |
| 5 | RD.6.98 (a)–(c) | `835580aa` lines 1038–1064, §3.2.2, p. 25: `ϖ^{p−1} = −p`, `L_ϖ` with Frobenius `exp(ϖ(z^p − z))`, (3.13) for `? = ∅, c, mid`, (3.14) via weights `≤ kn` of the local contributions, and the hypersurface isomorphisms with `(−1)` and the smooth case. | No condition on `p` in the whole subsection. Clauses (a)–(c) are these displays. |
| 6 | RD.6.98 Sources, new locator | `835580aa` lines 2193–2196, §5.1.5, p. 49 (page marker at line 2177). | “for any prime `p`, there is an isomorphism of Frobenius modules `H¹_{rig,mid}(G_m/K, Sym^k Kl_2) = gr^W_{k+1} H¹_{rig,c}(G_m/K, Sym^k Kl_2)`”: the `n = 1` instance of (3.14) for every prime, as the README says. |
| 7 | RD.6.96 Sources (R04) | `835580aa` line 565, Proposition 2.10, between the page-13 marker (line 534) and the page-14 marker (line 585). | p. 13 is correct. |

The seeded sample's labels (Definition; Theorem ×3; Construction; Theorem; Construction; Theorem ×2; Lemma; Theorem ×2; Lemma; Application; Theorem) fall in the changed passages at RD.1.46 (Lemma), RD.1.63 (Lemma), RD.1.64 (Theorem), RD.6.98 (Theorem) and RD.5.10 (Example): rows 1–7 above cover their locators. The locators of the retitled *Needs* items are unchanged and were checked in the previous rounds.

### Adversarial computations

Rows for untouched statements are carried from the previous report (review at e3ae167), cited as “r3”; rows for changed statements show values computed in this review.

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| RD.1.46 (a) at `p = 2` (new) | `π = −2`, `n = 1 … 400`; `n = 3` | `v_2(π^n/n!) = n − v_2(n!) = s_2(n)` holds for every `n ≤ 400` (Legendre with `p − 1 = 1`); `v_2(8/6) = 3 − 1 = 2 = s_2(3)`; at `n = 2^k` the value is `1 = 1/(p−1)`. | Check (1)'s `p = 2` sentence is correct. |
| RD.1.46 (c), Check (4) (new) | `p = 2`, `exp(−2x + 2x²) = Σ c_n x^n`, `n ≤ 64`; its inverse `exp(2x − 2x²)` | `c_1, …, c_4 = −2, 4, −16/3, 20/3`, valuations `1, 2, 4, 2`; `min_{1 ≤ n ≤ 64}(v_2(c_n) − n/4) = 3/4` at `n = 1`; the inverse series has the same minimum `3/4` at `n = 1`; the product of the two series is `1` through degree 5. Every `c_n` with `n ≥ 1` has `v_2 ≥ 1/4 · n > 0`, so `|c_n| < 1`. | All stated values reproduce; `θ` is a unit of `R^int` at `p = 2`. |
| RD.1.46 step 3, Dwork's factorisation (new) | any `p`; the `x^p` term; the `j = 2` factor | `E_p(πx) = exp(πx + π^p x^p/p + Σ_{j≥2} π^{p^j}x^{p^j}/p^j)` and `π^p/p = π·π^{p−1}/p = −π`, so `exp(π(x − x^p)) = E_p(πx)·∏_{j≥2} exp(−π^{p^j}x^{p^j}/p^j)`. In the `j`-th factor the degree-`kp^j` coefficient has valuation `≥ k(p^j/(p−1) − j) − k/(p−1) = k((p^j − 1)/(p−1) − j)`; per degree this is `1/(p−1) − (j + 1/(p−1))/p^j`, which at `j = 2` equals `(p−1)/p²` and increases with `j`. The `E_p` factor contributes `≥ d/(p−1) ≥ d(p−1)/p²`. | The bound `v_p(c_i) ≥ i(p−1)/p²` follows from §RD.1.63 alone, for every `p`; RD.1.64's “`j = 2` is equality” agrees. |
| RD.1.46 (d) at `p = 2` (new) | `E_π^{⊗2}`, `π = −2` | `D(w ⊗ w) = −2π t^{−2} = 4t^{−2}`; horizontal section `exp(4 t^{−1})`, and `v_2(4^n/n!) = n + s_2(n)`, so it converges for `|t^{−1}| < 2`, hence on the whole Robba annulus. | `E_π^{⊗p}` trivial at `p = 2`: pass. |
| RD.1.46 (b) normalisation (new check of `p`-independence) | general `p` | `|L(s,k)π^k| = |π|^s p^{(s_p(s) − s_p(k))/(p−1)}` from `v_p(s!/k!) = (s − k − s_p(s) + s_p(k))/(p−1)`; `ω = p^{−1/(p−1)} = |π|`, so `R = ωρ²/|π| = ρ²`. | No step depends on the parity of `p`. |
| RD.1.63 Euler product (new) | `p = 2` and `p = 3`, degree `≤ 8` | `exp(Σ_j X^{p^j}/p^j)` and `∏_{p∤m}(1 − X^m)^{−μ(m)/m}` agree coefficientwise through degree 8 for both primes. `E_2 = 1 + X + X² + (2/3)X³ + (2/3)X⁴ + (7/15)X⁵ + (16/45)X⁶ + …`, `E_2^{−1} = 1 − X + 0·X² + (1/3)X³ − (1/3)X⁴ + …`; `E_3 = 1 + X + X²/2 + X³/2 + 3X⁴/8 + 7X⁵/40 + …`, `E_3^{−1} = 1 − X + X²/2 − X³/2 + 3X⁴/8 − …`: all denominators prime to `p`. The logarithm of the product has coefficient `(1/N)Σ_{m∣N, p∤m} μ(m) = [N is a power of p]/N`. | Pass; Check (“coefficient of `X²` in `E_2` is 1, in `exp(X)` is 1/2”) reproduces. |
| RD.1.63 binomial-ring route (new) | `r = −μ(3)/3 = 1/3 ∈ ℤ_2`, `n = 2`; `r = −μ(2)/2` excluded at `p = 2` | `Ring.choose (1/3) 2 = (1/3)(−2/3)/2 = −1/9 ∈ ℤ_2`; the factor `m = 2` is excluded by `p ∤ m`, so `1/2` never appears at `p = 2`. | The exponents are `p`-adic integers as claimed. |
| RD.6.98 at `p = 2, n = 2, k = 1` (new Check) | `p ∤ n + 1 = 3`; `kn = 2 ≥ 2`; `S_1 × μ_3 = μ_3` | RD.6.97(d) gives `Kl_3` pure of weight `n = 2` at every `p`; (b) gives weight `kn + 1 = 3`; (c) applies since `kn = 2`, with `𝒦 ⊂ G_m^{kn} = G_m²` a curve and the twist `(−1)` raising `H¹_c(𝒦)`'s weight-1 part to weight 3. Fresán–Sabbah–Yu lines 997–998 put `Kl_3` at `p = 2` in the `SO_3`-or-`G_2` case, so concentration in degree one is exactly what the README declines to assert. | The Check is consistent with (a)–(c) and with the source's caveat. |
| RD.5.10 at `p = 2` (hypothesis widened) | `π = −2`, `ω = Σ_k 2^k t^{2^k − 1} dt`; `L_π` on `A¹` | `σ^*ω = Σ_k 2^k (t²)^{2^k − 1}·2t dt = Σ_k 2^{k+1} t^{2^{k+1} − 1} dt = ω − dt`; `χ(A¹, L_π) = 1 − Swan_∞ = 1 − 1 = 0` with `H⁰ = 0`, so `H^*_rig(A¹, L_π) = 0`; the Taylor series `exp(π(t' − t))` has radius exactly 1 by the (a) row; the Frobenius series overconverges by RD.1.64 at `α = 1/4`. | (a) and (b) hold at `p = 2`; the restriction of the numerical checks to `p = 3, 5, 7` is stated honestly. |
| RD.2.44 (d) at `p = 2` (cited by RD.1.64's new sentence) | `n = 1`, `a = 1`, `u² − u = t^{−1}` | Kedlaya's proof gives the rank-one summand `∇w = −πb t^{−2} w ⊗ dt` with `π = −2`, horizontal section `exp(2b(t^{−1} − t_ρ^{−1}))`, converging exactly on `|t^{−1} − t_ρ^{−1}| < 1`, i.e. `|t − t_ρ| < ρ²`: highest break `1 = n`. | Parity-free, as the README now says. |
| `RD0.arabia_controlled_lifting` | r3 rows | `S = R, I = 0, C = 0` gives `E = B`; `R = B = ℤ, I = (7), S = ℤ[x,1/(2x)]/(x² − 2)`: roots mod 7 are 3 and 4, inverting `x + 3` kills `x ≡ 4`, `x² = 2` has no root in `ℤ`. | Pass (r3). |
| `RD1.katz_cyclic_vector`, `CyclicFor` | r3 rows | `K = ℚ(t)`, `v = (1, t)`, `Dv = (0, 1)`, determinant 1; `δ = 0` forces `D = 0`; `𝔽_p(t)` with `(d/dt)^p = 0`. | Pass (r3); `δ ≠ 0` and `CharZero` needed and present. |
| RD.2.7, RD.2.31, RD.5.8–RD.5.8c, RD.5.17, RD.5.23, RD.5.54, RD.5.76, RD.5.89, RD.6.35, RD.6.42, RD.6.85, RD.6.93, RD.6.94, RD.6.95, RD.6.96, RD.6.97, RD.7.21a, RD.7.7–RD.7.9, RD.1.4, RD.1.11, RD.3.51, FDRep contract | r3 rows | As tabulated in the previous report (slopes `0, 1` and the `ϖ`-adapter `1 = e_C · 1/2`; `N² = 0`; projectors `[[1,0],[h,0]]`; `(1+x)(2+x)/2` at `p = 2`; index `2 − 1 = 1`; `G_m` dimensions `(1,1,0)`; `v_3(8!) = 2`; constant term `−π + π = 0` for `exp(π(x^q − x))`; `H¹_c` weight 0 → `H¹` weight 2; polytope areas `2, 3`; trace `−1`, determinant `2`, `1 + T + 2T²` at `q = 2`; `x + z²/x = z(y + y^{−1})`; roots of `X² + X + 2` of modulus `√2`; `(1−T)(1+27T)` and `(1−T)(1+3⁶T)(1−3⁶T)²`; `Z_{P¹} = 1/((1−t)(1−qt))`; determinant 1 for `e_0 + Xe_1`; `R = ρ²` versus the source's “min”; `t^{(3−1)/2} = t`; zero action contradiction). | Pass (r3); these statements are untouched by the diff. |
| RD.6.98 (r3 R01 instance) | r3 row | `p = 2, n = 2, k = 1` as above. | Now a Check; R01 repaired. |

### Supplier citations touched by the diff

- RD.6.98 cites §RD.6.96 for `p ∤ n + 1`: RD.6.96 (`README.md:13708`) states “For `n ≥ 1` and `p ∤ n + 1`” and its Hypotheses give the reason (the finite étale power cover). RD.6.97 (`README.md:13737`) states “Every prime `p` and `n ≥ 0`” for (a)–(d), so the new Check's appeal to purity at `p = 2` is supplied.
- RD.1.46 cites §RD.1.63 (same layer, Mathlib-only) and §RD.1.64 records the estimate; RD.1.64's *Needs* cite §RD.1.63 and §RD.1.46 for the module the Frobenius acts on, not for the estimate, so the three targets form no cycle (RD.1.46's proof of (c) uses RD.1.63; RD.1.64 uses RD.1.63 and the object of RD.1.46).
- CongruenceSpectralGap §§4.2a–4.2b and DeligneWeightsAndPurity §§0.1, 0.10 (unchanged citations in RD.6.97/RD.6.98's *Needs*) resolved at their open heads in the previous review; the diff does not change them.

## Not verifiable

- The seeded sample names labels and no target identifiers; the targets checked are those of the changed passages carrying those labels.
- The Dwork locator was read from the Numdam scan (`587b2058`), whose OCR garbles formulas; equations (4.3)–(4.4) were identified by their labels, the words “Artin-Hasse exponential series” and the printed page header “56”.
- The unreadable bibliography records listed in the previous review (Berthelot's 1991 preprint and Dualité, EGA III, Hartshorne, Katz 1979/1988, Malgrange, Monsky–Washnitzer, Ogus 1984, Serre, Silverman, Sperber 1980, Le Stum, Tsuzuki's Gysin paper and the others) are not touched by this diff and were not retried.

## Source issues

- none
