# Review of SpecialFunctionsHeun (pull request #2540 at 0274267)

**Verdict:** accepted

**Summary.** Accepted: this head repairs the one finding of the previous review (the minimal solution and the eigenvalue criterion of 5.3 now carry `α, β ∉ {0, −1, −2, …}`) and all of its corrections, and every statement, Check and convention I recomputed holds. There is one small correction (the spheroidal example of Layer 7 needs a prefactor to reach the form 31.12.1) and two format notes, none blocking. Two items are left for the human reviewers: the declared reuse of the author's own prior formalization, and the main book source, which could not be read.

## C01 — The spheroidal wave equation reaches the confluent form 31.12.1 only after a prefactor

The Examples of Layer 7 (README lines 1211–1212) say that "the spheroidal wave equation is one in `z = (1 + x)/2`", that is, a confluent Heun equation; Conventions fixes that name to the normalization 31.12.1, and the Examples are stated to be statements to prove. In that normalization `g(z) → 0` at `∞` and the characteristic roots there are `0` and `−ε` (7.4). For `(1 − x²)w″ − 2xw′ + (λ + γ²(1 − x²))w = 0` (order `μ = 0`) the substitution gives `w″ + (1/z + 1/(z − 1))w′ + (4γ² − λ/(z(z − 1)))w = 0`: the coefficient of `w` tends to `4γ²`, and the characteristic roots are `±2iγ`. It becomes 31.12.1 only for `v = e^{−κz}w` with `κ² = −4γ²`: then `γ = δ = 1`, `ε = 2κ` and the coefficient of `v` is `(2κz − κ − λ)/(z(z − 1))`; for `μ ≠ 0` a factor `(z(1 − z))^{μ/2}` is needed as well. The Mathieu half of the sentence is literally of the form 31.12.1 (`γ = δ = ½`, `ε = 0`, `α = q`).

Smallest change: "and the spheroidal wave equation becomes one in `z = (1 + x)/2` after multiplying the solution by an exponential and a power of `z(1 − z)`", which is also how DLMF §31.12 puts it (special cases of solutions). In the same family, Downstream consumers (line 1294) points to "7.4, Examples"; the examples are those of Layer 7.

## N01 — The module docstring leaves open which statable targets are in prose

`Suggested.lean` (lines 33–34) says that other headlines are left in prose although the pin has what they need, "for example" the Jacobi form. Naming them would let a reader see the coverage at a glance; 31.7.4, the third reduction of 8.2, is one, and it would be a one-line statement like its two siblings.

## N02 — Two slips of form in the README

In Scope and ownership (line 1311) "The numbers are those of the layers below" now stands after the layers and should read "above". In the Summary (line 23) "Iwasaki–Kimura– Shimomura–Yoshida" has a stray space.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Fuchs' theorem, Fuchs relation | Heun; `A = ∅`; Lean `fuchs_relation` by Vieta | finite sums `1 − A₁(c)`, at `∞` `ΣA₁ − 1`; total `#A − 1`; `A = ∅`: `−1` | holds | none |
| 1.2 three singular points | hypergeometric equation; `A = {c₁}` | `C₁(0) = −ab`, `C₁(1) = ab = σσ′`; one point: `C₁ = 0`, Euler equation, exponent sum `0` | holds | none |
| 1.3 accessory parameter | `(a, α, β, C₀) = (3, 0.3, 1.1, −0.7/3)`; general numerator | numerator `αβz + aC₀`; `q = 0.7`, `C₁ = 0.185`, `C_a = 0.04833`; determinant `a − 1` | holds | none |
| 1.4 normal form | `(3, 0.7; 0.3, 1.1, 0.8, 0.45)` at `z = 0.37 + 0.2i` | `A + B + C = 0.0`; `f²/4 + f′/2 − g` minus the displayed form: `2·10⁻¹⁶`; DLMF31-2 lines 213–228 agree | holds | none |
| 2.1 F-homotopic | by hand at `0`, `1`, `a`; numerically at `0.3`, `0.3 + 0.1i` | shifts `λ(aδ + ε)`, `λaγ`, `λγ`; residuals `2·10⁻⁸`, `4·10⁻⁸`, `3·10⁻⁸` (finite differences) | holds | none |
| 2.2 homographies | `z/a`, `1 − z` by hand, junk terms included; `a = 2`, `e^{iπ/3}` | `q′ = q/a`, `q = αβ − q′`; orbits `{2, ½, −1}` and `{e^{±iπ/3}}` | holds | none |
| 2.3 the 192 automorphisms | Maier's count at `n = 3, 4` | `2n` sets of `2^{n−2}(n − 1)!`: `6 × 4`, `8 × 24` (Maier192 lines 580–582) | holds | none |
| 2.4 Lamé parameters | `γ = δ = ε = ½`, `α = −ν/2`, `β = (ν + 1)/2` | `α + β + 1 = 3/2 = γ + δ + ε`; `ν = h = 0`: `q = αβ = 0`, `w = 1` | holds | none |
| 3.1 local solution | `(3, 0.7; 0.3, 1.1, 0.8, 0.45)`, `z = 0.3` | `Hl = 1.1030609539`, residual `0.0` in double precision, `ε = 1.15` | holds | none |
| 3.2 other singular points | `z = 0.8`, `2.6`, `5` | residuals `≤ 1.3·10⁻⁷` (finite differences); printed sign at `∞`: `−1.631·10⁻³` | holds | none |
| 3.3 equivalent expressions | `z = 0.3`; keeping `δ` | both differences `0.0`; with `δ` kept `5.352·10⁻³` | holds | none |
| 3.4 boundary circle | `δ = 0.45` | slope of `log‖c_j‖` between `j = 1000` and `4000`: `−1.55006` against `−1.55` | holds | none |
| 3.5 connection coefficients | Abel's identity; `q = 0.7` | `exp(−∫f) = z^{−γ}(z − 1)^{−δ}(z − a)^{−ε}`; `B(0.7) ≠ 0` by the slope above | holds | none |
| 4.1 criterion, determinants | `n = 0, 1`; both directions of the iff | `det(q − M₁) = q(q + Q₁) − R₀P₁`; roots `−1.31296, −4.38704`, `h = 1.82793, 0.54707` | holds | none |
| 4.2 reality | `a = −1`; `a = 2` with `γ = −1`, `δ = −1`; 400 random, `n = 4` | `±√3`; `±√2`; `2.56155, −1.56155, −4`; `−1 ± i`; largest imaginary part `0` | holds | none |
| 4.3 the eight classes | class I, `n = 0`; class II, `γ = ½`, `α = −½` | `q = 0`, `αβ = 0`; `α′ = α + 1 − γ = −n` gives `γ − α = n + 1 = 1` | holds | none |
| 5.1 equivalences | `δ = 1`, `δ = 2`, `δ ∉ ℤ` | analytic solutions at `1` are the multiples of the exponent-`0` solution in each case | holds | none |
| 5.2 eigenvalues | `(3, −1, 2.4, 0.8, 0.45)`; `(3, 0.3, 1.1, 0.8, 0.45)` | `−1.31296, −4.38704, −12.28268, −25.20687, −43.05662`; `0.21277, −2.83959, −10.84491, −23.77153`; zeros `0, 1, 2, 3, 4` | holds | none |
| 5.3 continued fraction | `α = −1` at `q₂`; Pincherle's normalization | `c₂ = 3.34155`, `c₃ = 0.94376`, `c₄ = 0.27399`, ratio `0.32137`; value `−f(1)/f(0)` gives `q = aγK` | holds | none |
| 5.4 series | exponents of `P_j`; `a = ½ + i` | `(1 − γ) + (1 − δ) + λ + μ = 1` for both choices; semi-axis `1.11803`; DLMF31-11 lines 557–560, 602–612, 790–793 | holds | none |
| 6.1–6.2 orthogonality | Pochhammer factor; `nβ_n` | `−4e^{πi(γ+δ)} sin πγ sin πδ = (1 − e^{2πiγ})(1 − e^{2πiδ})`; `(n + 1)β_{n+1} − nβ_n = γ + δ + ε + 2n > 0` | holds | none |
| 6.3 integral transforms | Lagrange form; `K ≡ 1` | `ρ·t(t − 1)(t − a) = p`, `p′/p = f`; `(D_z − D_t)1 = αβ(z − t)` | holds | none |
| 6.4 kernels | two `G` at `(z, t) = (0.4, 1.7)`, `(0.7, 2.2)`, `a = 7/2` | corrected: ratios `0.403373`, `0.403369` and `0.669647`, `0.669646`; printed: `−0.0571` against `0.5979` | holds | none |
| 7.1 the four equations | pole orders after `t = 1/z`; biconfluent at `0` | `2, 2, 3, 4` give ranks `1, 1, 2, 3`; indicial `X(X − 1 − γ)` | holds | none |
| 7.2 confluence | `(0.6, 0.35, −0.4, 0.8, 0.45)`, `z = ½`; recurrence from 31.12.1 | `1.3428769372`, residual `9·10⁻¹⁶`; differences `4.645·10⁻³, 4.547·10⁻⁴, 4.537·10⁻⁵, 4.536·10⁻⁶` | holds | none |
| 7.3 further confluences | the three substitutions, by hand | `γ/t + δ/(t(t − μ)) + 1`; `−γ/t − δ + t/(μt − 1)`; `λ³/(λ + t) − λ² + λt + γt → t² + γt` | holds | none |
| 7.4 rank one | confluent; doubly confluent; Kummer | `μ = −α/ε`, `α/ε − γ − δ`; `−α`, `α − γ`; at `0` roots `0, δ`; Kummer `−a`, `a − b` | holds | none |
| Layer 7 Examples | Mathieu in `cos² x`; spheroidal in `(1 + x)/2`; Kummer case | Mathieu: `γ = δ = ½`, `ε = 0`; spheroidal: `g → 4γ²`, roots `±2iγ`; Kummer `b = γ`, `a′ = α/ε` | spheroidal needs a prefactor | C01 |
| 8.1 degenerate cases | `(0.3, 1.1, 0.8)`, `z = 0.3`; `q = 0.43` | `1.1617152329` four ways (`δ = 0.45`, `2.2`; `a = 3`; Gauss series); `1.2170049392` | holds | none |
| 8.2 reductions | same point; `z = 0.2` for 31.7.4; wrong `δ`; radii | differences `2·10⁻¹⁶` each; wrong `δ`: `3.419·10⁻³`; `2r + r² < 1`; `0.926 < 1` | holds | none |
| Lean: `heun_moebius_div`, `heun_moebius_one_sub` for arbitrary `U` | termwise, zero denominators included | uniform factor `a²`, respectively `1`; each junk term maps to a junk term | holds | none |
| Lean: `confluentHeunLocalCoeff` | coefficient of `z^k` in 31.12.1 times `z(z − 1)` | `(k + 1)(k + γ)c_{k+1} = (k(k − 1 + γ + δ − ε) − q)c_k + (ε(k − 1) + α)c_{k−1}` | agrees | none |
| Lean: `heunPoly_double_orthogonal` | `n = 0`; `n ≥ 1` | `β₀ = γ + δ + ε − 1` may be `≤ 0`, root `q = 0` only; `β_n > n − 1 ≥ 0` otherwise | holds | none |

- Source locators checked against the text: DLMF equations and passages in §§31.2, 31.3, 31.4, 31.5, 31.7, 31.9, 31.10, 31.11, 31.12, 31.14 for all fifteen sampled targets (among them DLMF31-2 lines 69–71, 126–135, 213–228, 634–681; DLMF31-3 lines 141, 214, 274–434, 496, 526; DLMF31-4 lines 53–56, 95; DLMF31-5 line 52; DLMF31-7 lines 60, 94, 120, 145; DLMF31-12 lines 68–231; DLMF31-14 lines 65–212), and Maier192 lines 448, 580–582, MaierReducing lines 934, 997.
- Library declarations opened at the pin: `analyticOnNhd_ordinaryHypergeometric` (`TauCeti/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean` line 56), `jacobiSn` (`JacobiElliptic/Basic.lean` line 66), `wronskian_eq_of_hasDerivAt` (`TauCeti/Analysis/ODE/Wronskian.lean` line 31); all 20 pinned names elaborate. No declaration on Heun's or Fuchsian equations exists in Mathlib or Tau Ceti at the pins.
- Cross-roadmap citations resolved on main: SpecialFunctionsHypergeometric 1.3, 3.1, 3.2, 3.4, 5.3; AsymptoticExpansions 10.2–10.5, 12.1 (with the tail form of its Layer 12 introduction), 13.6; SpecialFunctionsEiLiErfIncompleteGamma 4.1; SpecialFunctionsBessel 10.1 (Sturm comparison); LaguerreJacobi 3.2–3.3, Layer 4; PainleveEquations Layers 2–3, 7.2, 7.4.
- Dependency check: `depcheck: 181 roadmaps, 2050 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: exit 0, 36 `sorry` warnings and no other; the file has no `variable` block, so no binder can be lost; the 36 signatures were compared with the README statements, nothing changed.
- One-tactic probe (`rfl`, `simp`) on a copy: none of the 36 theorems closes. `fuchs_relation` and `heun_accessory_parameter` are algebra on their hypotheses and are marked as checks of the conventions.
- Earlier findings, all repaired: 5.3 opens "for `1 < |a|`, `γ, δ ∉ {0, −1, −2, …}` and `α, β ∉ {0, −1, −2, …}`" and carries the instance `α = −1` as a negative control; 5.4 names 31.11.10 and 31.11.11; 6.3 cites "3.1's uniqueness"; the docstring list no longer holds the Jacobi form; the three links into SpecialFunctionsHypergeometric have no fragment; the second bullet of 4.2 is for "real `γ`", with a Check at `γ = −1`; 5.1 reads "when `δ ∉ ℤ`, `B(q) = 0`"; the Layer 3 example claims independence at each singular point only.
- Headline theorems: Fuchs' theorem, the normal form, the transformations, `Hl` with uniqueness and radius, the solutions at `1`, `a`, `∞`, the polynomial criterion with reality, the real eigenvalue problem, orthogonality (single and double), the integral equation, the confluence limit and the reductions 31.7.1–31.7.3 are stated; the 192 automorphisms, the Weierstrass form, the connection coefficients, the continued fraction, the series of 5.4, the loop orthogonality, the kernels and 7.3–7.4 are named in the docstring with what each lacks.

Overlap check: read SpecialFunctionsConfluent, SpecialFunctionsLegendre, SpecialFunctionsMathieu (open) and SpecialFunctionsHypergeometric, SpecialFunctionsBessel, SpecialFunctionsParabolicCylinder (main); nothing shared. SpecialFunctionsMathieu owns separated Sturm–Liouville problems on a compact interval with continuous potential, while 5.2 is the singular problem on `(0, 1)`; both consume Sturm comparison from SpecialFunctionsBessel. ConformalMappingPartII (main) uses "accessory parameters" for the Schwarzian of one covering and states no Fuchsian equation.

Source independence: 18 passages compared with 3 sources (DLMF Chapter 31, Maier 2007, Maier 2005), none shared beyond formulas and standard names; largest share DLMF Chapter 31, 167 of about 288 locators, then Ronveaux, 56; contents compared with DLMF Chapter 31: independent (31.14 and 31.2 open the roadmap, 31.5 precedes 31.4, 31.11 is merged into Layer 5, 31.9 and 31.10 into Layer 6, 31.12 precedes 31.7); Ronveaux's table of contents could not be read, and its section numbers as the README cites them do not map one to one either (§3.6 precedes §3.5, §2.7 and §1.3 close the roadmap).

Research link: Maier (2007), Theorems 4.3 and 4.7, proves the automorphism group and the split of the 192 solutions stated in 2.3, and Maier (2005), Theorems 3.7–3.8, the reductions of 8.2; the README's consumers section names PainleveEquations, whose 7.2 cites Heun-class equations. Rests on the two Maier texts read and on the README.

## Not verifiable

- Ronveaux (ed.), *Heun's Differential Equations*: no legal copy found; every locator into Parts A, B, D, E is unchecked (for the sampled 1.3, 1.4, 3.1, 3.3, 5.1, 5.2, 7.1, 7.3, 8.1 the DLMF locators were checked instead; the Ronveaux locators of 3.5, 4.2 and 4.3, which have no other source, stand unchecked, and those statements were checked by computation only).
- Kristensson: paywalled; Theorem 3.1, §4.4.1, (8.4)–(8.6), Theorem 8.1, Example 8.1, Theorem 8.2 (the source of the absolute convergence on `E` in 5.4), §8.5, §8.6.2–8.6.3.
- Haraoka, Iwasaki–Kimura–Shimomura–Yoshida: paywalled; the book locators of 1.1–1.3.
- Olver, Whittaker–Watson: no legal copy found; Ch. 5 §4.1 and Theorem 4.1 (3.1, 7.1), §§10.6–10.8 (1.2) and Ch. XXIII.
- The 2010 printed Handbook: the printed forms of 31.3.10–31.3.11 and 31.12.3 were not read; the online errata for both were (DLMF31-3 lines 423–425, 461–463; DLMF31-12 lines 177–180).

Automatic checks set aside as false positives: the section comment at the end of `Suggested.lean` with no declaration under it introduces the `#check` lines that pin library declarations, which are allowed there.

## Source issues

- **Error** in DLMF Chapter 31 at equation 31.10.8 (release 1.2.8; DLMF31-10 line 301): the source says the coefficient of the `φ`-derivative is `(1 − 2δ) cot φ − (1 − 2ε) tan φ`; it should be `(2δ − 1) cot φ − (2ε − 1) tan φ`, the form equivalent to its own 31.10.3; affects a stated result.
- **Error** in DLMF Chapter 31 at §31.3(iii), closing sentence (release 1.2.8; DLMF31-3 lines 553–555): the source says Kummer's 24 solutions are equivalent in 4 sets of 6; it should be 6 sets of 4, one set for each of the six local solutions (Maier192 lines 580–582 with `n = 3`); affects nothing.

## For the human reviewers

- **Licence.** The README's "Prior formalization" section says the roadmap reuses the design of the author's own `lean-DLMF` (Apache-2.0), including the definitions behind six declaration names of `Suggested.lean`; the repository was not opened in this round.
- **Not tested.** Ronveaux (ed.), the main book source (56 locators, second after DLMF), could not be read: wording and arrangement were compared with DLMF Chapter 31 and Maier only.
