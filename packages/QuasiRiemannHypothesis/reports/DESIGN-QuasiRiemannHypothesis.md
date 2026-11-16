# Design report: DESIGN-QuasiRiemannHypothesis

**Deliverables.** `packages/QuasiRiemannHypothesis/design/README.md` (1,750 lines, 11 layers),
`packages/QuasiRiemannHypothesis/design/plan.json` (55 targets, no gaps) and the updated
`packages/QuasiRiemannHypothesis/sources.toml` (24 sources, all `certified`; `sources check`:
0 problems). No `Suggested.lean` is part of this job; the README marks this roadmap's own
declarations in italics, so it claims no Lean name that `Suggested.lean` would have to declare.

## What the design covers

**The roadmap.** It proves the `11/12` half-plane (T1) for every finite-order Hecke `L`-function of
`F = ℚ(√−3)` and every Dirichlet `L`-function, `ζ` included, with the principal pole allowed and zeros
read through `meromorphicOrderAt`. Around it, it builds the general library the proof needs:

| Layer | Content | Target items |
| --- | --- | --- |
| 1 | zero-free half-planes, the zero abscissa `β*`, the continuation principle (T5), the late choice of height | 1.1–1.4 |
| 2 | fixed-numerator theorem over any `K ⊇ μ_n`, primary elements (`≡ 1 mod 3`), the sextic symbol, composite cubic reciprocity and supplements | 2.1–2.5 |
| 3 | smooth profiles and seminorms, the Gaussian weight, kernel seminorms, the self-dual lattice `ℤ[ω]` | 3.1–3.5 |
| 4 | Gauss sums modulo ideals (any `K ⊇ μ_n`), twisted multiplicativity, prime identities, the four-term formula, sextic reciprocity and the phase `G` | 4.1–4.6 |
| 5 | deleted Euler factors, strip growth and logarithmic control for any `K`, norm-composed characters, the transfer for abelian `K` (T6) | 5.1–5.5 |
| 6 (U2) | additive large sieve on `ℝ^d/Λ`, Hecke families and the quadratic sieve, Fisher–Friedberg characters, the `n`-th order sieve, the cubic and sextic residue-symbol forms | 6.1–6.5 |
| 7 (U5) | zero detection for finite-order Hecke `L`-functions of any number field | 7.1–7.4 |
| 8 (U1) | the Kubota character (any totally imaginary `K ⊇ μ_n`), automorphic functions and Eisenstein series on `ℍ³` with a unitary character, their continuation, theta residues, Patterson's converse theorem and the cubic theta function with its three cusp expansions | 8.1–8.7 |
| 9 | the completed cubic reflection, sectors and tails, the quadratic reduction and the reflected energy | 9.1–9.4 |
| 10 | the probe at `11/12`: low estimate, Poisson identity and principal correction, row envelope, contour estimates, high estimate, T1 | 10.1–10.7 |
| 11 | the zero strip (T3, conditional and at `11/12`), the conditional least-character bound (T4(a), Dirichlet and Hecke), the least quadratic nonresidue (T4(b), (c)) | 11.1–11.3 |

**Route for T1.** The design takes the route of `openai2026quasiRH` Part I (§§2–11), not the
Möbius mean square of `openai2026quasiRHalt`. Comparison on the criteria of `target.md`:

- *Inputs.* The alternative route needs Layers 2–4, the quadratic sieve (§6.2) and the cubic theta
  function (Layer 8), and adds Littlewood's criterion and its own recursion. The planned route also
  needs the continuation principle, zero detection and the sextic sieve.
- *Reuse by the `7/8` stage.* The `7/8` argument (`openai2026quasiRH` Sections 12–20) is built from
  Part I: the continuation principle, the reflection, the zero detector, the sextic sieve, the Poisson
  identity and its principal correction, and the contour estimates of Section 10. With the planned
  route these are layers here and its Part II consumes them. With the alternative route, the
  Part II would have to plan all of Part I as well.
- *Expert attention and verification.* `quanta2026quasiRH` reports expert study of the `11/12`
  paper. It also reports that the `7/8` paper, Part I included, is formally verified in Lean.
- *How the alternative route is recorded.* It is named in the README's status paragraph and in the
  proof sketch of §10.7, with the layers it would use. No target is stated for it, since no target
  needs it.

**Split.** The design takes the split fixed in `target.md` (Risk 2): this roadmap is the `11/12`
milestone together with the general blocks and the corollaries. Each corollary is stated in general
form and holds at `11/12`:

- T3 is §11.1;
- T4(a) is §11.2;
- T4(b) and (c) are §11.3, with exponent `12`, since any `θ < 1` suffices.

The following go to a proposed Part II:

- T2, the `7/8` half-plane;
- its strip `1/8 ≤ Re ρ ≤ 7/8`;
- the Landau–Siegel constant `(log 3)/8`;
- the exponent `8`;
- the preprint's Part II lemmas: 13.2–13.4, 14.2, 15.x and 17.x–20.x.

T1, T5 and T6 are planned in full. T2 is the one final target of `target.md` that this roadmap
leaves to another roadmap. The reasons:

- `openai2026quasiRH` Sections 12–20 run to about 110 OCR pages, and the two moment inductions
  alone take 66;
- with the supplier blocks U1 and U2, which are roadmap-sized themselves, one roadmap would carry
  four roadmaps' worth of targets.

**Generality decisions** (with the reason in each case):

- *T4(a) exponent.* T4(a) is stated with exponent exactly `1/(1 − θ)`. The smoothed explicit
  formula gives `x^(1−θ) ≪ log q`. The archimedean and conductor terms are `O(x^(1/2) log x)` and
  `O(log q log x)`, both below the main term. As a check, `θ = 1/2` recovers Ankeny's exponent `2`.
  The Hecke analogue needs no new input, so it is stated as well.
- *T6.* It is stated for abelian `K`. For non-abelian `K` the cofactor is an Artin `L`-function whose
  holomorphy is not known.
- *U1 (Layer 8).*
  - The Kubota character is stated for every totally imaginary `K ⊇ μ_n` (`kubota1969` §3).
  - Eisenstein series, their continuation and the theta residues are stated for discrete groups of
    finite type in `SL₂(ℂ)` with a unitary character (`kubota1968`). This is the imaginary quadratic
    case, `n ∈ {2, 3, 4, 6}`.
  - For fields of degree `2r > 2` the analysis lives on `(ℍ³)^r`, and its continuation is Langlands'
    general theory of Eisenstein series of Hilbert type. No legal open text of that theory was at
    hand, and no roadmap plans it. It is proposed as a separate roadmap below.
  - Theta coefficients are planned only for `n = 3` (Patterson), as `target.md` requires;
    `kazhdanpatterson1984` is cited for the limit.
- *U2 (Layer 6).*
  - `bgl2014` Theorem 1.3 holds for all `n ≥ 3`. This was read from the rendered PDF (abstract,
    p. 4 and Appendix II all show `n ⩾ 3`); the extracted text had lost the glyph.
  - The cubic large sieve over `ℤ[ω]` (`heathbrown2000` Theorem 2) is therefore the case `n = 3` in
    residue-symbol form (§6.5). The derivation: split the rows by their class in `R_𝔠` and by
    `S`-units, which leaves a fixed character of the column, then apply cubic reciprocity. No
    separate block is needed.
  - The sextic sieve (`openai2026quasiRH` Lemma 9.1) is the case `n = 6` in the same way, with
    sextic reciprocity.
- *Zero detection (Layer 7).*
  - It is stated for any number field `K`, with constants depending on `K`, as `target.md` asks.
  - The preprint proves it for `F` and its family `𝒳_u`. The proof uses only the strip bound,
    logarithmic control, the deleted Euler factors and the functional equation, and Layer 5 states
    each of these for any `K`.
  - The floor `51/100` is generalized to any fixed `a₀ ∈ (1/2, 1)`.
- *Where the cusp expansions come from.* The three expansions are Patterson's own computations:
  `patterson1977` (8.8)–(8.9) and Table III, p. 151, which are the 27-vector built in the proof of
  his Theorem 7.1. `dunnradziwill2024` (5.12)–(5.16) and Appendix A record them. No further step of
  `dunnradziwill2024` §5 is needed, so §8.7 cites Patterson for the result and DR for the
  normalization `σ = 3^(5/2)/2`.
- *Conventions fixed.*
  - The field is modelled by `[IsCyclotomicExtension {3} ℚ F]`, the model of Tau Ceti's Eisenstein
    files.
  - "Primary" means `≡ 1 mod 3`, with the translation lemma to Tau Ceti's `IsPrimaryEisenstein`
    (`≡ 2 mod 3`) and a witness at the prime of norm 7.
  - The additive character is `e(z) = exp(2πi Tr(z/λ))`, with `𝓞` self-dual of covolume 1.

**Size of the two supplier blocks** (recorded in the README, Scope):

- Layer 6: five sections, about 50 source pages.
- Layer 8: seven sections, about 100 source pages, plus the continuation theorem §8.4, which is
  Selberg's method on `ℍ³` with a character.

Each block uses no later layer and could become a roadmap of its own unchanged
(`NumberFieldLargeSieves`, `KubotaCoversAndThetaFunctions`).

## A sign error in the source's OCR text, found by computation

The OCR of `openai2026quasiRH` Lemma 4.2 and (4.7) reads `γ₁(p)γ₂(p) = H(4)γ₃(p)γ₂(p)³` and
`G(c) = χ_c(4)Γ(c)`. Computing the Gauss sums directly settles which is right:

- *At `p = 1 + 3ω`.* `γ₁γ₂ = −0.6547 + 0.7559i`. The value of `−α χ̄_p(4) γ₃` matches it, while
  `−α χ_p(4) γ₃ = −0.3273 − 0.9449i` does not.
- *At three more primes.* The conjugate form holds at the primes of norm 13, 19 and 19
  (`−2 + 3ω` and `−5 − 3ω`).
- *From the definitions.* The Gauss–Jacobi relation gives `γ₁ = H(4)⁻¹ γ₂² γ₃`, which is the
  conjugate form.

So the correct phase is `G(c) = χ̄_c(4)Γ(c)`. This also explains the OCR line
`G(v²) = χ_v(4)`: `χ̄_v(4)² = χ_v(4)`. The README states the conjugate form (§§4.3, 4.5) and keeps
the comparison as a Check.

The OCR lost a bar here, so the paper itself is not in error. Other OCR-sensitive constants were
compared with `liu2026improved`, which is text-layer:

- the margins `1021/25000`, `1/40`, `1/1200`, `43/300` and `1/4800`;
- the regions `D₁` and `D₂`;
- `R(δ)`, `V♯` and the local factors `B_p`.

## Adversarial pass

One row per statement; values are computed (by hand, or by the short numerical script in the job's
scratch directory, which evaluates the Gauss sums over residue representatives).

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 zero-free right of `σ` | `s−2`; `0`; `1/(s−1)`; `s−2` with value `1` at `2`; `ζ` at `1` | order `1` at 2 (fails `σ<2`); order `⊤`; order `−1` (passes); order `1` though value `≠0`; order `−1` | germ predicate correct; value predicate would fail the 4th | definition by `meromorphicOrderAt ≤ 0` kept; Checks added |
| 1.1 Dirichlet reading | `χ=1`, `s=1`, `N=1,4` | pole order `−1` ≤ 0 / clause `χ=1∧s=1` | agree | none |
| 1.1 Hecke presentation invariance | `σ<0` | deleted factors vanish on `Re s=0` | needs `σ ≥ 0` | hypothesis `σ ≥ 0` added |
| 1.2 zero abscissa | empty; `{s−3/4}`; `{s−1/4}`; `{s−3/4,1/(s−1)}`; `{0}`; `{s−2}` | `1/2`; `3/4`; `1/2`; `3/4`; junk `sSup = 0`; `2` | junk and out-of-range cases excluded only by hypothesis | hypothesis "zero-free right of 1" in every API item; non-example Checks |
| 1.3 continuation principle (T5) | empty family; `σ₀ ≥ β*`; `E* = min(Δ₀−ω, σ)` | `β* = 1/2 < σ₀`: vacuous; `C(σ₀)+ω = C(β*)−(Δ₀−ω)` | algebra checked: `|f_η| ≪ Z^(C(β*)−E*)` | added hypothesis `1/(L_η D_η)` bounded on `Re s ≥ 2` (used to move the line right) |
| 1.3 Gaussian | `|e^((2+it−5/6)²)|` | `e^((7/6)²−t²)` | integrable | Example |
| 1.4 late height | `A_η τ ≤ m/4`, `B_η − Nτ < C(β*) − m/2` | `(1+Z^τ)^A ≤ 2^A Z^(m/4)` | saving `m/2` | none |
| 2.1 fixed numerator | `ℚ,n=2,a=−1`; `ℚ,n=2,a=5`; `F,n=6,a=−1`; `a=b^n`; `n=1` | conductor `4∞`; `ψ(3)=(5/3)=−1=(3/5)`, conductor 5; `(−1)^((7−1)/6)=−1`, `(−1)^((13−1)/6)=1`; trivial; trivial | infinite part needed for `n=2` | "infinite part empty" stated only for `n ≥ 3`; integral `a` (the `K^×` case reduces, `a₁/a₂ = a₁a₂^(n−1)/a₂^n`) |
| 2.2 primary | `1, −2, 1+3ω, −1−3ω`, six units, `λ`, `(−1)(−1)` | primary, primary, primary, not; only `1`; no primary multiple; Tau Ceti's convention not multiplicative | translation `c ↔ −c` | convention `≡ 1 mod 3` with translation lemma |
| 2.3 sextic symbol | `p=1+3ω`: `χ(2)`, `χ(3)`, `χ(−1)`, `χ⁶(7)`, `χ_(p²)` | `ω` (num. −0.5+0.866i), `−ω²` (0.5+0.866i), `−1`; `0`; `χ_p²` | agree | none |
| 2.4 finite families | `v_𝔭` mod 6, units | `≤ 6^(|S|+1)` classes | — | none |
| 2.5 cubic reciprocity | conjugate pair `π=−2+3ω` (norm 19), `t=−7`; `d=1+3ω` supplements; `χ_c(4)` | `7⁶ ≡ 1 (mod 19)` both sides `1`; `α₂=−1, α₃=1`, `(ω/d)₃ = ω² = ω^((7−1)/3)`; `χ_c(4)=ω²=2² mod 7` | Tau Ceti's prime statement excludes equal norms | conjugate-pair argument added to the route |
| 3.1 profiles | `w_log(0)` inversion; zero profile; indicator | `(2π)^(−d)∫ŵ`; seminorms 0 but `p ≥ 1`; `‖·‖_{1,sep} = ∞` | — | Checks |
| 3.2 smooth calculus | exponent `J+d+2` | `2m > J+d`, `2m ≤ J+d+2` | — | none |
| 3.3 Gaussian weight | `MW_G(0)`, `MW_G(1)`, `MW_G(0.3+0.5i)`; variant `e^(−(log y)²)` | `1`; `2.718281828` vs `e`; `0.81408+0.25183i` vs `e^(s²)` same; `√π e^(s²/4)` | agree | none |
| 3.4 kernel seminorms | twist `y^(iw)` | extra `(1+|w|)^(h+j)` | — | none |
| 3.5 self-dual `ℤ[ω]` | `e(1), e(ω), e(ω/2)`; covolume; counts `H=3, 12` | `1, 1, −1`; `1`; 2 vs 1.81, 7 vs 7.26 | agree | none |
| 4.1 Gauss sums | unit ideal; `ℚ, (5), y=1/5`; `j=6`; `j=3` | `1`; `√5`; `γ₆(p) = −0.37796 = −1/√7`; `γ₃(p)² = −1` | zero extension changes `γ₆` from `0` to `−1/√7` | Checks |
| 4.2 twisted multiplicativity | `a=1+3ω, b=−2+3ω`, `j=1..5`; `ℚ`: `3·5` | errors `≤ 1.5·10⁻¹⁴`; `i√15` | agree | none |
| 4.3 prime identities | `p` of norms 7, 13, 19, 19 | `γ₂³` vs `−α`: equal; `γ₁γ₂` vs `−αχ̄(4)γ₃`: equal; vs `−αχ(4)γ₃`: unequal | **the conjugate is forced** | statement corrected to `H̄(4)`; Check added |
| 4.4 four-term formula | `c = 1, −1, λ, −λ, 1+3ω, −2+3ω`, `−3` | four-term `1,1,i,−i,i,i,1` = direct sums | agree | none |
| 4.4 bicharacter `τ` | `(λ,λ), (−1,λ), (−1,−1)` | `−1, −1, 1` = `(−1)^(eh+fg+fh)` | agree | none |
| 4.5 sextic reciprocity | `a=1+3ω, b=−2+3ω` | `χ_b(a) = −ω²`, `χ_a(b) = ω²`, ratio `−1 = τ(λ,λ)`; cubic parts `ω = ω` | agree | Check |
| 4.5 phase `G` | `G(v²)`; `R(p,p)` at norms 7, 13 | `χ̄_v(4)² = χ_v(4)`; `−1 = χ_p(−1)`, `1 = χ_p(−1)` | resolves OCR | `G = χ̄(4)Γ` |
| 4.5 squarefree identity | `c = (1+3ω)(−2+3ω)` | `γ₂(c)³ = −0.43355−0.90113i = μ(c)α(c)` | agree | none |
| 4.6 finite Fourier | `ℤ/2`; a character; `n=p` | `Σ|a|=1≤√2`; one coefficient; both sides `0` | — | Checks |
| 5.1 deleted factors | `σ < 0` | `|1 − a N𝔭^(−s)| ≤ 1 + N𝔭^(−σ)` | exponent `(−σ)₊` | none |
| 5.2 strip growth | `σ = −1/10, 11/10`, `δ = 1/10` | exponent `0.6·1.2/1.2 = 3/5`; `0` | the source's `(3+|t|)²` is weaker than `(3+|t|)^(6/5)` | general `K`, exponent `3d/5` |
| 5.3 log control | principal case | `|(s−1)/(s+1)| ≤ 1` on `Re s ≥ 0` | — | none |
| 5.4 norm-composed | `F`, `χ mod 7`; `ℚ(i)`, `χ mod 5`; `ℚ(√2)` | `χ(4)` at `(2)`; `i` at `(1+i)`, `−1` at `(3)`; `N(1+√2)=−1` | real places needed | modulus includes real places |
| 5.4 base change | unramified `p`, degree `f`, `g` primes | `∏_ψ(1−χψ(p)p^(−s)) = (1−χ(p)^f p^(−fs))^g` | — | none |
| 5.5 transfer (T6) | `q=1`; `χ = χ₋₃`; non-abelian `K` | `L(1,χ₋₃)=π/(3√3)`; cofactor principal; Artin cofactor | abelian needed | stated for abelian `K` |
| 6.1 additive sieve | `J=1`; `z_j=j/N`, `Q<N` | `≍Q^d`; `N² = N·N` | both terms needed | none |
| 6.2 Hecke families | `ℚ`: `(21/·)`, `(15/·)`; trivial family; `χ_p³` | primitive mod 21; conductor 60; fails axiom; conductor `λp` | axiom (3) only within a class | Checks |
| 6.3 Fisher–Friedberg | `F, n=3, 𝔠=(9)`, `𝔞=(10)` | cubing `U^(2) → U^(4)`; `χ_(10)((1+3ω)) = 3² = 2 ≡ ω` | — | Check |
| 6.4 `n`-th order sieve | range of `n` | `n ⩾ 3` (rendered PDF) | — | `n ≥ 3` |
| 6.5 cubic/sextic forms | `M=N=1`; `m=n`; regime | one term; `0`; `M^(1/2) < N < M²` | — | none |
| 7.1 detecting polynomials | `r=0`; `ℚ,ψ=1`; extra prime | `M₀ = W(1)`; Möbius sum; differs | — | presentation kept |
| 7.2 bins | `I−1` increments `> ε` | sum `> 1` impossible | — | floor generalized to `a₀` |
| 7.3–7.4 witnesses | `δ ≥ 1/50`, `t=1` | `m ≤ 1/2+O(ε)`, `r ≥ 1/2−O(ε)` | — | `t − 1/2 − O(ε) ≤ r` (OCR ambiguous; Liu (5.4)) |
| 8.1 Kubota character | `γ = (1+3ω, −3ω²; 3, 1−3ω)`; `(1 0;3 1)`; `(0 −1;1 0)` | `(c/a)₃ = ω`, `(b/d)₃ = ω` (num. equal); `1`; `1` (`a=0`) | agree | Checks |
| 8.2 automorphic | order `1/3` | eigenvalue `1 − 1/9 = 8/9 = (4/3)(2/3)` | agree | none |
| 8.3 Eisenstein series | constant term | `∫ v^s/(|cz+d|²+|c|²v²)^s = π|c|^(−2s)v^(2−s)/(s−1)` | — | `π/(s−1)` factor stated |
| 8.4 continuation | trivial `χ` | pole at `s=2`, eigenvalue `0` | `(1,2)` wrong | interval `(1,2]`, `2` iff `χ` trivial |
| 8.5 theta | `n=2,3`; residue at 1 | `3/2, 3/4, K_(1/2)`; `4/3, 8/9, K_(1/3)`; eigenvalue 1 | — | Checks |
| 8.6 converse theorem | `r(0,0) = ω²r(1,−1) = ωr(2,−1)` | from Theorem 7.1 | — | equations cited by number |
| 8.7 cubic theta | `n=0`, `k=−3`; `k=3n−4`; `τ₁` | `3^(5/2)|d| = 27·3^(−1/2)|d|` (15.588 both); `3^(n/2+2) ≤ 3^(n/2+7/3)`; `9 ≤ 12.98` | bound attained | Checks |
| 9.1 completed sum | `p²` vs `p³, p⁴` | not `cn³` / `cn³` | — | Check |
| 9.2 reflection | inactive prime | scalar times `1 − q_p⁻¹` | — | none |
| 9.4 reflected energy | `M=N=1, O=0` | exponent `0 + max(1,1) = 1` | agree with (5.39) | none |
| 10.2 low estimate | `X=Y=Z^(1/2)` | `Q^(−1/2)(Q/Y)^(1/2)Z^(1/2) = Z^(1/4)` | `= C(11/12)` | none |
| 10.3 Poisson/Euler | `u=1`; `(s,1,1/6) ∈ D₂` | `ζ^S(6z)ζ^S(w)/L^S(x,η)`; `1/6 ≥ 0.165`, `1 ≥ 0.95` | agree | Checks |
| 10.4 row envelope | `δ = 1/50, 1, 2/3` | `R = 1, 1/2, 2/3` | kink at `2/3` | Checks |
| 10.6 high estimate | `46E*`, `3m₀/4`, ordering | `4.6·10⁻⁵ < 2.08·10⁻⁴`; `1/1600`; `1/1200` least | agree | Checks |
| 10.7 T1 | real primitive `χ`, `q ≥ 3`; principal mod 4 | `(1−β)log q ≥ (log 3)/12`; pole order `−1`, zeros on `Re s=0` | agree | Checks |
| 11.1 strip (T3) | `θ = 1/2`; principal mod `p`; `ζ` | `Re ρ = 1/2`; zeros on `Re s = 0` excluded; `[1/12, 11/12]` | primitivity needed | stated for primitive, `Re ρ > 0` |
| 11.2 least non-one | `χ mod 5`; `(·/7)`; `χ mod 12` from `(·/3)` | `2`; `3`; `5` (not `2`) | `0` is not "non-one" | Checks |
| 11.2 exponent | `θ = 1/2`; `θ = 11/12, 7/8` | `2`; `12`, `8` | Ankeny recovered | exponent `1/(1−θ)` fixed |
| 11.3 least nonresidue | `bimsissac2017` route | open strip needs `ϵ = 11/24`: exponent `48`; at `7/8`, `ϵ = 7/16`: `32` (the preprint's) | closed strip ≠ open strip | Check records the margin |

## Notions moved down

None. Every supplier is on main or earlier in the merge order. The gate places this roadmap after
BianchiModularForms, its latest supplier; the other open-PR suppliers are MaassForms,
CharacterSumsOverFiniteFields and AutomorphicSpectralTheory.

## Proposed Part IIs and separate roadmaps

- **QuasiRiemannHypothesisPartII** (base: this roadmap). Its content:
  - the `7/8` half-plane T2, by the compensated probe of `openai2026quasiRH` Sections 12–20;
  - the strip `1/8 ≤ Re ρ ≤ 7/8`, the exponent `8` and the Landau–Siegel Check `(log 3)/8`;
  - the preprint's Lemmas 13.2–13.4, 14.2 (which uses the cubic sieve of §6.5 here) and 17.5;
  - the improvement of `liu2026improved`.

  Its introduction says that this roadmap stops at `11/12`.
- **KubotaCoversAndThetaFunctions** (separate). It would hold Eisenstein series of Hilbert type on
  `(ℍ³)^r` with a Kubota character and theta residues over totally imaginary fields of degree
  `> 2`. That needs Langlands' general continuation theory, which no roadmap plans. Layer 8 here
  would be its imaginary quadratic base.
- **NumberFieldLargeSieves** (optional relocation of Layer 6, unchanged).
- Part IIs of the consumers: ExplicitPrimeCounting, AnalyticNumberTheoryPartIII and
  ZerosOfLFunctions (README, Downstream consumers).

## Gaps

None. Every prerequisite in `plan.json` is a pinned declaration, a section of a roadmap on main or
earlier in the merge order, or an earlier target.

## Ownership

**Main and open pull requests.** Searched by object with `roadmaps grep` on main and on all 450 open
roadmap pull requests at their heads. The objects:

- Kubota character or cover;
- number-field, additive-torus and `n`-th order large sieves, Hecke families, Fisher–Friedberg;
- cubic theta / Patterson;
- zero-free half-planes / quasi-Riemann;
- least nonresidue, Ankeny, zero detection;
- Gauss sums modulo ideals, power residue symbols as ray class characters;
- Eisenstein series with a character on `ℍ³`;
- abelian zeta factorization, logarithmic control.

No other owner was found:

- *Least quadratic nonresidue.* `SieveApplications.leastNonresidue` is SieveMethodsAndPrimePatterns
  §2.9; the bound is this roadmap's.
- *Large sieves.* The quadratic large sieve over `ℚ` is AnalyticNumberTheoryPartII §5.29. §6.2 here
  is its number-field generalization and is recorded as such.
- *Hyperbolic three-space.* BianchiModularForms excludes Eisenstein series on `ℍ³`, and MaassForms
  Layer 7 treats only `PSL₂(ℤ[i])` with trivial character. Layer 8 here is therefore their first
  owner.

**Board packages.** AnalyticNumberTheory (#123) and LawrenceVenkateshMethod (#345) were checked, as
in the triage; neither overlaps.

**Overlaps tool.** `roadmaps overlaps QuasiRiemannHypothesis` reports "No roadmap
QuasiRiemannHypothesis on main or in an open roadmap pull request". That is expected at the design
stage.

## Sources

- **New entry.** `kubota1968` was fetched through the service from Cambridge Core's open Nagoya
  archive (publisher-open), as `yoshimoto1987` had been. It is the source for the continuation and
  functional equations of Eisenstein series with a unitary character on `ℍ³` (§§8.2–8.4). The
  provisional `needs-references.toml` the first attempt produced was removed once the text was
  read.
- **Updated entries.** The locators and `cited_for` of every entry were updated to the README's
  section numbers.
- **Not read, not needed.**
  - Langlands' *On the functional equations satisfied by Eisenstein series*: the `(ℍ³)^r` case is
    not planned.
  - Patterson's sequel fixing `σ > 0`: §8.7 takes `σ = 3^(5/2)/2` from `dunnradziwill2024` (5.6),
    and Patterson Theorem 8.1 gives `σ² = 3⁵/4`.
- **OCR texts.** `openai2026quasiRH`, `openai2026quasiRHalt` and `patterson1977` are OCR texts.
  - Constants were cross-checked against `liu2026improved` (text layer) and by computation (the
    `G` convention above).
  - The `bgl2014` range of `n` was read from page images rendered from its cached PDF.
  - No text is missing, so there is no `needs-references.toml`.

## Dependency check

```
$ tauceti-roadmap … gate --candidate packages/QuasiRiemannHypothesis/design/README.md --only QuasiRiemannHypothesis --order merge-order/ORDER.txt --content <content>
candidate: QuasiRiemannHypothesis is not in the merge order yet; checked as if placed after BianchiModularForms (the intake inserts it when its design is accepted)
depcheck: 261 roadmaps, 2605 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` reports no cross-roadmap citation and no Lean name found
nowhere. Its note "Lean names outside TauCetiRoadmap were not checked: no pinned Lake packages on
this host" was covered by hand: every Mathlib and Tau Ceti name in the README was grepped at the pins
(Mathlib `1b1ccf4`, Tau Ceti `2fd255d`). That check corrected four namespaces:

- `Ideal.gaussSum_powerResidueSymbol_three_pow_three_eq`;
- `TauCeti.ClassFieldTheory.rayClassField`;
- `TauCeti.ClassFieldTheory.isAdmissibleModulus_iff_le_rayClassField`;
- `TauCeti.ClassFieldTheory.IsAdmissibleModulus.mem_support_of_ramified`;
- `TauCeti.ClassFieldTheory.kroneckerWeber`.

## Statements cited by equation number

Several statements rest on long explicit formulas of the sources. The README states them in words
and imports the formula itself by equation number, so the PDF must be read for the exact constants:

- the six-case local factor table of `openai2026quasiRH` (7.11) in §10.3;
- the scalar `ζ_t` formula (5.3) in §9.2;
- the gamma factors and functional equations of `patterson1977` (7.3) and (7.5) in §8.6;
- the contents of `openai2026quasiRH` Definition 10.1 and Lemmas 10.2–10.6, summarized in §10.5.

Each is consistent with `liu2026improved` Part I where Liu restates it. No step rests on machine
computation: every numerical constant used (the margin table and `1/4800`) is a closed-form
rational inequality, checked in the table above.

## Suspicious text

None. No fetched page, paper or roadmap contained instructions addressed to this job.
