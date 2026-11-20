# Review of SpecialFunctionsHeun (pull request #2540 at 05d48bd)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: the first two targets of 5.3 (the minimal solution of the recurrence and the eigenvalue criterion built on it) are false when `α` or `β` is a nonpositive integer, a case their hypotheses admit. Every finding of the earlier review is repaired at this head, and all the other statements and Checks I recomputed hold. There are five small corrections and one format note, none blocking, one question for the author, and two items for the human reviewers (the prior formalization's licence, and the main book source, which could not be read).

## R01 (P2) — In 5.3 the minimal solution and the eigenvalue criterion fail when `α` or `β` is a nonpositive integer

The first two bullets of 5.3 (README lines 1033–1036) are stated for `1 < |a|` and `γ, δ ∉ {0, −1, −2, …}` only: the recurrence 31.3.3 "has a minimal solution `(c*_j)` … unique up to a factor, with `c*_{j+1}/c*_j → 1/a`", and `q` is an eigenvalue "if and only if the coefficients of `Hl` are the minimal solution". When `α = −n` the coefficient `P_{n+1}` vanishes, the recurrence has a terminating solution for every `q`, that solution is the minimal one, and neither bullet can be proved.

Witness: `(a, α, β, γ, δ) = (3, −1, 2.4, 0.8, 0.45)`, the parameters of the section's own Check. Here `P₂ = 0`, so `(1, −2.4/(5.7 + q), 0, 0, …)` solves 31.3.3 for every `q ≠ −5.7`. Every solution that is not a multiple of it is eventually nonzero, so it is minimal in the sense of the bullet (and of SpecialFunctionsEiLiErfIncompleteGamma 4.1), and its ratio is `0/0`, not `1/a`. At the third eigenvalue `q₂ = −12.28267669` (the Wronskian of `Hl` with the analytic solution at `1` vanishes there, and `Hl` has two zeros in `(0, 1)`, as 5.2 requires) the coefficients of `Hl` are `c₂ = 3.3415`, `c₃ = 0.9438`, `c₄ = 0.2740`, with ratio `0.3214` at `j = 20`, tending to `1/3`: they do not terminate, so they are not a multiple of the minimal solution, although `q₂` is an eigenvalue. The section's Check already observes that at `α = −1` the continued fraction finds "none of the infinitely many others", and restricts the third bullet for that reason; the first two need the same care. AsymptoticExpansions, in the introduction to its Layer 12, gives the general warning: when a coefficient `g(n)` vanishes, its statements hold only in the tail form.

Smallest change: either move `α, β ∉ {0, −1, −2, …}` to the head of 5.3 so that it covers all three bullets, or state the first two in the tail form (solutions for `j ≥ N`, identified when they agree on a tail: the recessive tail solution has ratio tending to `1/a`, and `q` is an eigenvalue if and only if the tail of the coefficients of `Hl` is a multiple of it, the zero multiple for a Heun polynomial). The instance above is a ready negative control.

## C01 — The Type I bullet of 5.4 fixes `λ = α`, `μ = β − ε` for both solutions at `∞`

5.4, first bullet (line 1068), says that "every Fuchs–Frobenius solution of 3.2 at `∞`" is a series in the `P_j` of 31.11.2 with "`λ = α`, `μ = β − ε`". With that choice the terms behave like `z^{−α−j}` at `∞`, so the series can only give the solution belonging to `α`; the one belonging to `β` uses 31.11.11, `λ = β`, `μ = α − ε` (DLMF31-11 lines 526–532 and 557–560). Add the second choice, or say "the solution belonging to `α`, and the same with `α`, `β` exchanged".

## C02 — The third bullet of 6.3 follows from 3.1's uniqueness, not from "5.2's simplicity"

6.3 (line 1183) concludes `W = κ w_m` "by 5.2's simplicity". The simplicity proved in 5.2 is that of `q_m` as a zero of `F`, and only in the real problem. What the bullet uses is that a solution analytic at `0` is a multiple of `Hl` when `γ ∉ {0, −1, −2, …}`, which is 3.1's uniqueness and holds for complex parameters. Cite 3.1, so that the bullet is not read as restricted to the real case.

## C03 — The module docstring lists the Jacobi form among the headlines that lack something, and says it lacks nothing

`Suggested.lean` (lines 16–22) opens a list of "Bold headlines of the README without a Lean statement here, and what each lacks", and its second item says the Jacobi form "is left in prose, although it is statable". In README 2.4 the Jacobi form is not a bold headline, and at the pin everything it needs exists (`TauCeti.Real.jacobiSn`, `jacobiCn`, `jacobiDn` with `hasDerivAt_jacobiSn`, in `TauCeti/Analysis/SpecialFunctions/JacobiElliptic/Basic.lean`, lines 66–72 and 284; `legendreK` in `EllipticIntegral/Legendre.lean`, line 95). Either state 31.2.8 on `(0, K(k))`, or take the item out of the list and keep only the Weierstrass form with its reason.

## C04 — Three link anchors into SpecialFunctionsHypergeometric will dangle when its open revision merges

The supplier contracts link to `#32-fundamental-solutions`, `#34-riemanns-equation` and `#53-kummers-24-solutions` (README lines 265, 258, 272). Pull request #2552, which revises SpecialFunctionsHypergeometric, keeps the numbers 3.2, 3.4 and 5.3 and the content cited (15.11.1–15.11.8 are in its 3.4) but renames the three headings ("Solution pairs at the three singular points", "The Papperitz equation, Möbius maps and exponent shifts", "Kummer's solutions in six groups of four"). The citations by number stay valid on main and at that head; only the link fragments break. Dropping the fragments from these three links makes them independent of the order of merging.

## C05 — The hypothesis `γ ∉ {0, −1, −2, …}` of the second bullet of 4.2 is not needed

For `a > 1`, `δ > 0`, `β > 0` the characteristic polynomial of `M_n` at `(a; γ, δ)` and that of `M_n` at `(1 − a; δ, γ)` in `αβ − x` agree for `γ ∉ {0, −1, −2, …}` by the argument given, and both are polynomials in `γ`, so they agree for every real `γ`; the roots are then real and simple by the first bullet. At `γ = −1`, `a = 2`, `δ = β = 1`: roots `±√2` for `n = 1` and `2.5616, −1.5616, −4` for `n = 2`. The hypothesis could be dropped from the bullet and from `heunPolyMatrix_eigenvalues_real_of_one_lt`, or kept with a word that it is the route's and not the statement's.

## N01 — 5.1 uses `B(q)` where 3.5 does not define it

The equivalence of 5.1 is stated for `γ, δ ∉ {0, −1, −2, …}` and includes "`B(q) = 0` (3.5)", but 3.5 defines `B` only for `δ ∉ ℤ`. Add "when `δ ∉ ℤ`" to that item, or refer to the `F` of 5.2.

## Questions for the author

- Layer 3, Examples: the eight local solutions at `(3, 0.7; 0.3, 1.1, 0.8, 0.45)` are called pairwise independent because "no two exponents at the same point differ by an integer". That reason covers the four pairs at one point. For two solutions at different points independence says that `q = 0.7` is not an eigenvalue for that pair of points and exponents; 5.1's Check gives it for one pair. Was it checked for the others? I did not continue the solutions between the four discs, so I could not confirm the remaining pairs.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Fuchs' theorem, Fuchs relation | Heun; hypergeometric; `A = ∅`; `w = z^{−ρ}` at `∞` | sums `2, 1, −1` = `#A − 1`; `∞` polynomial `X² + (1 − ΣA₁)X + Σ(B₁ + cC₁)`; `z²g ∼ zΣC₁` | holds | none |
| 1.2 three singular points | hypergeometric equation; one finite point | `C₁(0) = −ab`, `C₁(1) = ab = σσ′`; Euler equation, `ρ + ρ′ + σ + σ′ = 0` | holds | none |
| 1.3 accessory parameter | `(a, α, β, C₀) = (3, 0.3, 1.1, −0.7/3)` | numerator `αβz + aC₀`; `q = 0.7`, `C₁ = 0.185`, `C_a = 0.04833`; determinant `a − 1` | holds | none |
| 1.4 normal form | random complex parameters; `γ = δ = ε = 1`; `N` general | `f²/4 + f′/2 − g` minus displayed form: `8·10⁻¹⁷`; `A + B + C`: `6·10⁻¹⁷`; `q̃₁ = A` | holds | none |
| 2.1 F-homotopic | at `0` with and without `ε`; twice at `0` | residual `4·10⁻¹³`; without `ε`: `−0.34874`; `q` returns to `q` | holds | none |
| 2.2 homographies | `z/a`, `1 − z` termwise, junk terms included; `a = 2`, `e^{iπ/3}` | each term maps to its image, also at zero denominators; orbits `{2, ½, −1}` and two values | holds | none |
| 2.3 the 192 automorphisms | orbit at `(7/2, 7/10, 3/10, 11/10, 4/5, 9/20)` over `ℚ` | `192` unordered, `384` ordered; `a′ ∈ {7/2, 2/7, −5/2, −2/5, 7/5, 5/7}`; Maier: `2n` sets of `2^{n−2}(n−1)!` | holds | none |
| 2.4 trigonometric form, Lamé | chain rule with `z = sin² θ`; `z = sn²` | `f sin 2θ − 2cot 2θ` gives the coefficient; `4s²c²g = 4(αβs² − q)/(a − s²)`; `q = −ah/4` | holds | none |
| 3.1 local solution | `(3, 0.7; 0.3, 1.1, 0.8, 0.45)`, `z = 0.3` | `Hl = 1.1030609539`, residual `9·10⁻¹³`; recurrence determines `c_j` since `R_j ≠ 0` | holds | none |
| 3.2 other singular points | `z = 0.8`, `2.6`, `5`, `6`; second set `a = −2.5` | residuals `≤ 2·10⁻¹²`; printed sign: `−1.631·10⁻³`, `−1.193·10⁻²` at `z = 5` | holds | none |
| 3.3 equivalent expressions | `z = 0.3`; keeping `δ` | both differences `0.0`; with `δ` kept: `−5.352·10⁻³` | holds | none |
| 3.4 boundary circle | `δ = 0.45`, `1.5`; `δ = 1`; `δ = 1 − m` | slopes `−1.55006`, `−0.50004`; `1/j` at `δ = 1`; `j^{−m−1}` summable | holds | none |
| 4.1 criterion, determinants | `n = 0, 1`; `j = 1..4`; Kristensson's example | differences `≤ 2·10⁻¹³`; `q² + 5.7q + 5.76`: `−1.31296, −4.38704`; `h = 1.82793, 0.54707` | holds | none |
| 4.2 reality | `a = −1`; `a = 2`, `δ = ±1`; 400 random, `n = 4`; `γ = −1` | `±√3`; `−2 ± √2`; `−1 ± i`; imaginary parts `0`; `±√2` at `γ = −1` | holds | C05 |
| 5.2 eigenvalues | `(3, −1, 2.4, 0.8, 0.45)`; `(3, 0.3, 1.1, …)`; `a = 1.2`; `γ = 1.5, δ = 2.5` | `−1.31296, −4.38704, −12.28268, −25.20687`: zeros `0,1,2,3`; `a = 1.2`: `0.21803, −0.43742, −2.19601`: `0,1,2` | holds | none |
| 5.3 continued fraction | `α = −1` at `q₂`; equivalence transformation | terminating solution minimal for all `q`; at `q₂`: `c₃ = 0.9438`, ratio `0.3214`; value `−q/(aγ)` gives 31.4.2 | bullets 1–2 false at `α = −1` | R01 |
| 5.4 series | Type I exponents at `∞`; `a = ½ + i` | terms `z^{−α−j}`; semi-axis `√5/2 = 1.1180`; second bullet agrees with DLMF31-11 lines 610–613 | holds for the `α`-solution | C01 |
| 6.1 orthogonality | four polynomials, `n = 3`, weight `ρ` on `[0, 1]`; `n = 3` against `n = 2` | off-diagonal `≤ 6·10⁻¹⁵`, diagonal `0.488, 1.337, 0.726, 0.504`; cross-degree `0.56695` | holds | none |
| 6.2 double orthogonality | six pairs `n = 3`; twelve pairs `n = 3` against `2`; self | `≤ 1.3·10⁻¹¹`; self `1.3344·10⁻³`; eigenvalue pairs `(nβ_n, q)`, `nβ_n` increasing | holds | none |
| 6.3 integral transforms | `K ≡ 1`; Lagrange identity signs | `(D_z − D_t)1 = αβ(z − t)`; `ρ·t(t−1)(t−a) = p`; `q∫wρ = 0` forced by bracket | holds | C02 |
| 6.4 kernels | `G = X²Y + 3Y²`, `XY³ + X³`, `a = 7/2`, at `(0.4, 0.7)` and `(0.3+0.2i, 2.5−0.4i)` | corrected: `0.0815217` both, `0.73409 − 0.09215i` both; printed: `0.08089` vs `0.08179`; exponent sums `1` | holds | none |
| 7.1 the four equations | ranks after `t = 1/z`; biconfluent at `0` | pole orders `2, 2, 3, 4` give ranks `1, 1, 2, 3`; indicial `X(X − 1 − γ)` | holds | none |
| 7.2 confluence | `(0.6, 0.35, −0.4, 0.8, 0.45)`, `z = ½`; recurrence limit | `1.3428769372`, residual `9·10⁻¹⁶`; differences `4.645·10⁻³, 4.547·10⁻⁴, 4.537·10⁻⁵, 4.536·10⁻⁶` | holds | none |
| 7.3 further confluences | three substitutions, by hand | `γ/t + δ/(t(t−μ)) + 1`; `−γ/t + t/(μt−1) − δ`; `λ³/(λ+t) − λ² + λt + γt → t² + γt` | holds | none |
| 7.4 rank one | confluent; doubly confluent at `∞` and `0`; Kummer | `μ = −α/ε`, `α/ε − γ − δ`; `−α`, `α − γ`; roots `0, δ` at `0`; `−a`, `a − b` | holds | none |
| 8.1 degenerate cases | `(0.3, 1.1, 0.8)`, `z = 0.3`; `q = 0.43` | `1.1617152329` four ways (two `δ`, `a = 3`); `1.2170049392` | holds | none |
| 8.2 reductions | same point; wrong `δ`; radii | differences `2·10⁻¹⁶`, `2·10⁻¹⁶`, `5·10⁻¹³`; wrong `δ`: `3.419·10⁻³`; `2r + r² < 1`, `0.926 < 1` | holds | none |
| Lean: `heun_moebius_div`, `heun_moebius_one_sub` for arbitrary `U` | termwise, at `z ∈ {0, 1, a}` | `deriv` of `w(z/a)` is `w′(z/a)/a` unconditionally; each junk term maps to a junk term | holds | none |
| Lean: `exists_entire_heunEigenvalue01_iff` | `δ = 1`; `δ ∈ {2, 3, …}`; `δ ∉ ℤ` | Wronskian with `Hl(1 − a, αβ − q; α, β, δ, γ; 1 − z)` at one point; other solution never analytic | holds | none |
| Lean: `confluentHeunLocalCoeff` | coefficient of `z^k` in 31.12.1 times `z(z − 1)` | `(k+1)(k+γ)c_{k+1} = (k(k−1+γ+δ−ε) − q)c_k + (ε(k−1)+α)c_{k−1}` | agrees | none |

- Source locators checked against the text: 78 DLMF equations in §§31.2–31.5, 31.7, 31.9–31.12, 31.14, the notation of §31.1 (DLMF31-1 line 58), and five Maier statements (Maier192 lines 70–73, 448–451, 580–583; MaierReducing lines 934–945, 997–1015).
- Library declarations opened at the pin: `jacobiSn`, `jacobiCn`, `jacobiDn`, `hasDerivAt_jacobiSn` (`JacobiElliptic/Basic.lean` 66–72, 284), `legendreK` (`EllipticIntegral/Legendre.lean` 95), `one_le_radius_ordinaryHypergeometricSeries`, `analyticOnNhd_ordinaryHypergeometric` (`OrdinaryHypergeometric.lean` 36, 56), `wronskian_eq_of_hasDerivAt` (`ODE/Wronskian.lean` 31); all 20 pinned names elaborate.
- Cross-roadmap citations resolved on main: SpecialFunctionsHypergeometric 1.3, 3.1, 3.2, 3.4, 5.3; AsymptoticExpansions 10.2–10.5, 12.1 (with the tail form of its Layer 12 introduction), 13.6; SpecialFunctionsEiLiErfIncompleteGamma 4.1; SpecialFunctionsBessel 10.1 (Sturm comparison); LaguerreJacobi 3.2–3.3, Layer 4; PainleveEquations Layers 2–3, 7.2, 7.4.
- Dependency check: `depcheck: 197 roadmaps, 2162 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: exit 0, 36 `sorry` warnings and no other; no `variable` block, so no binder can be lost, and the 36 elaborated types were compared with the README statements, nothing changed.
- One-tactic probe (`rfl`, `simp`) on a copy: none of the 36 theorems closes; `fuchs_relation` and `heun_accessory_parameter` are algebra on their hypotheses and are now marked as checks of the conventions.
- Earlier findings, all repaired: 5.4 now reads "analytic at `a` with exponent `α` at `∞`"; 6.4 has `{½ − δ − σ, ½ − ε + σ}`; the four Layer 2 theorems carry `hUs`; Pincherle, Darboux and the recessive solution are consumed; 2.3 has "`6` classes of `4`"; the Kummer example has `δ = 0` and `q = α`; the five corrections and two notes are made, and `F ≢ 0` for complex parameters is no longer a target.
- Headline theorems: Fuchs' theorem, the normal form, the transformations, `Hl` with uniqueness and radius, the solutions at `1`, `a`, `∞`, the polynomial criterion with reality, the real eigenvalue problem, orthogonality (single and double), the integral equation, the confluence limit and the four reductions are stated; the 192 automorphisms, the connection coefficients, the continued fraction, the series of 5.4, the loop orthogonality, the kernels and 7.3–7.4 are named in the docstring with what each lacks.

Overlap check: read SpecialFunctionsMathieu, SpecialFunctionsConfluent, SpecialFunctionsLegendre (open) and SpecialFunctionsHypergeometric, SpecialFunctionsBessel, SpecialFunctionsParabolicCylinder (main); nothing shared. SpecialFunctionsMathieu owns separated Sturm–Liouville problems on a compact interval with continuous potential; 5.2 is the singular problem on `(0, 1)` with analyticity at both ends, and both consume Sturm comparison from SpecialFunctionsBessel.

Source independence: 16 passages compared with 3 sources (DLMF Chapter 31, Maier 2007, Maier 2005), none shared beyond formulas and standard names; largest share DLMF Chapter 31, about 69 mentions and 146 equation numbers, then Ronveaux, 56 mentions; contents compared with DLMF Chapter 31: independent (31.14 and 31.2 open the roadmap, 31.5 precedes 31.4, 31.11 is merged into Layer 5, 31.9 and 31.10 into Layer 6, 31.12 precedes 31.7); Ronveaux's table of contents could not be read.

Research link: Maier (2007) proves the automorphism group and the split of the 192 solutions stated in 2.3, and Maier (2005) the reductions of 8.2; the README's consumers section names PainleveEquations, whose classification of Painlevé III and V cites Heun-class equations. Rests on the two Maier texts read and on the README.

## Not verifiable

- Ronveaux (ed.), *Heun's Differential Equations*: no legal copy found through the sources service; every locator into Parts A, B, D, E is unchecked (for the sampled 1.3, 1.4, 2.3, 3.2, 3.3, 5.2, 6.3, 7.1 the DLMF locators were checked instead; 4.2's remark that Ronveaux asserts nothing in general, and the Ronveaux locators of 7.3 and 7.4, stand unchecked).
- Kristensson: paywalled; Theorem 3.1, §4.4.1, (8.4)–(8.6), Theorem 8.1 (the only source of 3.4, whose statement I checked by Darboux's argument and the slopes), Example 8.1, Theorem 8.2, §8.5.
- Haraoka, Iwasaki–Kimura–Shimomura–Yoshida, Olver: paywalled or not found; the book locators of 1.1, 1.2 and 7.1.
- Whittaker–Watson: no copy reached through the sources service; §§10.6–10.8 and Ch. XXIII examples 7–10 (that they count 192 and that Heun listed 48 is confirmed by Maier192 lines 81 and 1247).
- The 2010 printed Handbook: the printed forms of 31.3.10–31.3.11 and 31.12.3 were not read; the online errata for both were (DLMF31-3 lines 423–425, 461–463; DLMF31-12 lines 177–182).

Automatic checks set aside as false positives: the section comment at the end of `Suggested.lean` with no declaration under it introduces the `#check` lines that pin library declarations, which are allowed there.

## Source issues

- **Error** in DLMF Chapter 31 at equation 31.10.8 (release 1.2.8; DLMF31-10 line 301): the source says the coefficient of the `φ`-derivative is `(1 − 2δ) cot φ − (1 − 2ε) tan φ`; it should be `(2δ − 1) cot φ − (2ε − 1) tan φ`, as its own 31.10.9 and 31.10.21 require; affects a stated result.
- **Error** in DLMF Chapter 31 at §31.3(iii), closing sentence (release 1.2.8; DLMF31-3 lines 553–556): the source says Kummer's 24 solutions are equivalent in 4 sets of 6; it should be 6 sets of 4, one set for each of the six local solutions (Maier192 lines 70–73 with `n = 3`); affects nothing.

## For the human reviewers

- **Licence.** `Suggested.lean` shares six declaration names (`IsHeunSolutionOn`, `heunLocalCoeff`, `heunLocal`, `heunPolyMatrix`, `IsHeunEigenvalue01`, `IsConfluentHeunSolutionOn`) with `DLMF/Heun/Basic/Definitions.lean` of the author's `lean-DLMF` (Apache-2.0); signatures differ. The README's "Prior formalization" declares the reuse.
- **Not tested.** Ronveaux (ed.), the book with the second-largest share of locators and the main book source, could not be read: wording and arrangement were compared with DLMF Chapter 31 and Maier only.
