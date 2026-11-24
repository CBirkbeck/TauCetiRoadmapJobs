# Review of AutomorphicSpectralTheory (pull request #3027 at 4a2d22f)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 23 changed lines since `592bdb1`. Checked: the new §6.4a (statement, route, Checks, locators, *Needs:* line), the extended Dependencies paragraph of Layer 6 and the three new references, against Müller's 1988 preprint and the Finis–Lapid–Müller authors' copy at their locators and against every section and supplier the new text cites. The statement of §6.4a is true and published, but the route of its discrete clause does not prove it as written. It omits its main input, Müller's polynomial bound on the number of discrete-spectrum eigenvalues, which no roadmap this one may consume states (R01). Its number-field step applies restriction of scalars to Müller's adelic corollary, which concerns the quotient by `Z(ℝ)⁰`, not `[G]¹` (R02). There is one small correction and one format note; nothing is left for a human to decide.

## R01 (P2) — The route of the discrete clause of §6.4a leaves out its main input, Müller's polynomial bound on the number of discrete-spectrum eigenvalues, and no roadmap this one may consume states it

An implementer of the discrete clause has nothing planned for the step that carries it. The *Needs:* line (line 2857: §§0.8, 0.9, 3.4, 4.4–4.5, 6.4, Dixmier–Malliavin, OperatorIdeals) supplies the cuspidal clause. Finite multiplicity (§4.5) does not bound how fast the residual spectrum grows, and trace class needs such a bound.

In [Mül89] (preprint MPI 88-31, p. 2) Corollary 0.2 is deduced from Theorem 0.1 and the Clozel–Delorme Paley–Wiener theorem, which is this roadmap's §6.1. Theorem 0.1 says that on a fixed `K`-type the number of `L²` eigenfunctions of the Casimir operator with eigenvalue below `λ` grows at most polynomially in `λ`. Its proof (outlined pp. 3–4, carried out in §§3–8) counts the real singular hyperplanes of cuspidal Eisenstein series through the factorization of the intertwining operators. The route's sentence "the residual spectrum is controlled by the Eisenstein series of §4.4 and the same factorization" (line 2848) names neither step. "The same factorization" there is Dixmier–Malliavin, not the factorization Müller uses. The counting bound is stated only in AutomorphicSpectralTheoryPartII §4.5a, an open roadmap whose *Needs:* line cites this roadmap's §§3.1–3.6, 4.1–4.5 and 6.3–6.4, so it cannot supply this roadmap.

The smallest repair is to state the counting bound here, either as a named step of §6.4a's route or as a section of its own, citing [Mül89] Theorem 0.1, p. 2, with the truncation, Maass–Selberg and intertwining-operator sections it uses. Then route the discrete clause through it and §6.1, and add §6.1 and the bound to the *Needs:* line and to the Layer 6 Dependencies sentence (line 3518). AutomorphicSpectralTheoryPartII §4.5a would then cite it.

## R02 (P2) — Müller's adelic corollary concerns the quotient by `Z(ℝ)⁰`, so restriction of scalars does not turn it into the statement on `[G]¹`

The number-field step of the route (line 2848), and the locator's attribution of the `K_∞`-finite case over `ℚ` to [Mül89] (line 2855), give trace class only on a proper summand of `L²_disc([G]¹)`. That happens whenever `Z(ℝ)⁰` is larger than `A_G(ℝ)⁰`, which is the case for `Res_{F/ℚ}GLₙ` for every `F≠ℚ`.

[Mül89] §8 ((8.6)–(8.7) and Corollary 8.8, pp. 83–84) works on `L²(Z(ℝ)⁰G(ℚ)\G(𝔸))`, where `Z(ℝ)⁰` is the identity component of the real points of the whole centre. `[G]¹` divides only by `A_G`. Take `G=GL₁` over `F=ℚ(√2)`. For `Res_{F/ℚ}G`, `Z(ℝ)⁰=ℝ_{>0}²` while `A_G=ℝ_{>0}`. Müller's space keeps only the Hecke characters trivial on `ℝ_{>0}²`. `L²(F^×\𝔸_F¹)` also contains the characters of infinity type `|x₁|^{it}|x₂|^{−it}` for `t` a non-zero multiple of `π/log(1+√2)`, which are trivial on the units and non-trivial on `ℝ_{>0}²∩𝔸_F¹`.

Müller's Corollary 8.8 is the `[G]¹` statement when `Z(ℝ)⁰=A_G(ℝ)⁰`, for instance for `GLₙ` and `SLₙ` over `ℚ`. The smallest repair is to say so in place of "For a number field F apply this to the restriction of scalars of G to ℚ" and of "over ℚ" in the locator, and to take the form on `[G]¹` over a number field from [Mül98] (and, independently, Ji 1998), as [FLM11] Remark 3 records it. Alternatively, keep Müller 1989 and add the missing step. Decompose `L²([G]¹)` under the compact torus that `Z(ℝ)⁰∩G(𝔸)¹` induces on `[G]¹`, apply to each character the twisted form Müller states after Corollary 8.8 (p. 84), and bound the trace norms summably over the characters.

## C01 — The cited Dixmier–Malliavin theorem gives one Schwartz factor, not two compactly supported ones

The route of the cuspidal clause (line 2848) cites AutomorphicFormsOnReductiveGroups §2.7 `dixmierMalliavin` for `f=Σ_i f_i∗g_i` with `f_i,g_i∈C_c^∞`. That section states two things: vectors of smooth Fréchet representations factor through `C_c^∞(G)`, and adelically `S(G(𝔸))=S(G(𝔸))∗C_c^∞(G(𝔸))`. `C_c^∞(G(𝔸))` is not a Fréchet stage of the kind it treats, so the compactly supported form does not follow as stated, and the group is `G(𝔸)`, not `G(𝔸)¹`. The Hilbert–Schmidt argument works just as well with one Schwartz factor. You could say `f_i∈S(G(𝔸)¹)`, or cite the compactly supported form of Dixmier–Malliavin as a separate input.

## N01 — [Mül98] is cited without a locator

"[Mül98] for general `f`" (line 2855) and its reference entry (line 3856) give no theorem number or page. Give the theorem number, or let [FLM11] Remark 3 carry the general form on its own.

## Questions for the author

- Does [Mül98] state its theorem on `G(ℚ)\G(𝔸)¹` for every reductive `G` over `ℚ`, or modulo `Z(ℝ)⁰` as Corollary 8.8 of the 1989 paper does? In the first case restriction of scalars applies to it, and the repair of R02 is a one-line change. Its text is behind the publisher's paywall and was not read.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.4a cuspidal clause | `GL₁/ℚ`; `G` anisotropic mod centre; `SL₂/ℚ`, spherical `f` | `GL₁`: only characters trivial on `f`'s level survive, finite rank. `SL₂`: `Σ_j\|ĥ(t_j)\|<∞` by `N(T)~T²/12` and rapid decay of `ĥ` | true | none |
| §6.4a discrete clause | `SL₂/ℚ`; `GL₁` over `ℚ(√2)` | `SL₂`: `L²_disc` = cusp ⊕ constants, extra rank-one term `∫f`. `GL₁/ℚ(√2)`: eigenvalue on `\|x₁/x₂\|^{it}` decays rapidly in `t` | true | none |
| Negative clause; second Check | `SL₂/ℚ`, bi-`K`-invariant `f` with `ĥ≠0` | `K`-fixed `L²_cont ≅ L²(ℝ_{≥0},dt)`; `R(f)` multiplies by `ĥ(t)`, a non-compact operator | true | none |
| First Check (`GL₁/ℚ`) | `ℚ^×\𝔸¹ ≅ Ẑ^×` | `R(f)χ=(∫_{𝔸¹}fχ)χ`; trace `Σ_χ∫fχ`, finitely many non-zero terms | true | none |
| "part of §6.17" when `[G]¹` compact | anisotropic `G` | `L²_disc=L²`; §6.17 (line 3073) asserts trace class there | true | none |
| Cuspidal route | `Λ^Tφ=φ` for cuspidal `φ` (§3.4) | `sup\|R(f_i)φ\|≤C‖φ‖₂` ⇒ `‖K(x,·)‖₂≤C` ⇒ kernel in `L²([G]²)`; `‖BC‖₁≤‖B‖_HS‖C‖_HS` (Tes09 Lemma 6.13, p. 142) | true, factor class off | C01 |
| Discrete route | Mül89 line 78–85, 101–120 | Corollary 0.2 = Theorem 0.1 (counting) + Clozel–Delorme; *Needs:* line has neither | input unowned | R01 |
| Number-field step | `GL₁` over `ℚ(√2)`, restricted to `ℚ` | `Z(ℝ)⁰=ℝ_{>0}²` vs `A_G=ℝ_{>0}`; Müller's quotient keeps only `t=0` characters | false step | R02 |
| [Mül89] locators | preprint MPI 88-31 | Corollary 0.2: printed p. 2 (line 84); Corollary 8.8: printed p. 84 (line 2116); quotient `Z(ℝ)⁰G(ℚ)\G(𝔸)` (line 2102–2106) | exact; scope narrower | R02 |
| [FLM11] Remark 3 | authors' copy, p. 10, line 387–389 | `P=G`: `ρ(G,h)` on discrete spectrum, `G` over number field `F` (line 69); Mül89 `K`-finite; Mül98, Ji98 general | supports statement | none |
| Layer 6 Dependencies sentence (line 3518) | against §6.4a *Needs:* | lists HS kernels, traces, rapid decay, discrete spectrum, Dixmier–Malliavin; matches line 2857 | consistent | with R01 |
| `analytic_fredholm` (headline, unchanged) | `K=0`; `K(z)=zP`, `P` rank-one projection | `K=0`: `R=1`. `(1−zP)⁻¹=(1−P)+P/(1−z)`: simple pole at `1`, residue `−P`, rank 1 | true | none |
| `green_kernel_continuation` (headline, unchanged) | `N=1`, `N=2` | `−12/1=−4π/(π/3)`; `N=2`, index 3: `−4=−4π/π` | true | none |

- Source locators checked against the text: 5 in [Mül89] (Theorem 0.1 and Corollary 0.2, p. 2; outline pp. 3–4; (8.6)–(8.7), pp. 83–84; Corollary 8.8, p. 84), 1 in [FLM11] (Remark 3, p. 10), 6 in Tes09 for §§0.8–0.9, which §6.4a uses ((6.8)–(6.13), Lemma 6.10, Theorems 6.6–6.7, Lemma 6.13, Corollary 6.14, Lemmas 6.15–6.16, printed pp. 136–144).
- The seeded sample lies outside the changed and affected text except §0.9, which §6.4a cites; its Tes09 locators are exact.
- Cross-roadmap citations resolved: AutomorphicFormsOnReductiveGroups §2.7 `dixmierMalliavin` (README line 453, main and head); OperatorTheory/OperatorIdeals OI-B30 (line 350), OI-B41 (line 375) on main; internal §§0.8, 0.9, 3.4, 4.4, 4.5, 6.4, 6.17; consumer DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1 cites §6.4a with the same statement.
- Library declarations: none new; §6.4a needs adelic reductive quotients, absent at the pins, as the unchanged module docstring of `Suggested.lean` says for Layer 6.
- Record: the README at `592bdb1` has Layers 0–7; the head keeps every id and title and adds one heading (§6.4a).
- Automatic checks: all passed. The dependency check prints `depcheck: 132 roadmaps, 1479 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` (unchanged) exits with two `sorry` warnings only. Nothing changed outside the pull request's own folders.
- Notion moved down (R01): Müller's counting bound, stated in the open AutomorphicSpectralTheoryPartII §4.5a, is needed by this roadmap's §6.4a and should be owned here.

Overlap check: read AutomorphicSpectralTheoryPartII, AutomorphicLFunctionsAndLocalFactors, AutomorphicLFunctionsAndLocalFactorsPartII, TwistedAutomorphicDescents, CongruenceSpectralGap, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicFormsOnReductiveGroups. Trace class of `R(f)` on `L²_cusp` and `L²_disc` is owned here (§6.4a) and cited by DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1. Müller's eigenvalue-counting bound, its input, is stated only by AutomorphicSpectralTheoryPartII §4.5a (R01). Nothing else is shared.

Source independence: 6 passages compared with 2 sources (changed passages only): the statement, the route's two clauses, the Checks and the locator sentence against [Mül89] lines 35–37, 78–99 and 2066–2131 and [FLM11] lines 387–389. No more than five consecutive words are shared, and those ("real points of a reductive") are forced by the mathematics. The largest share of the README's locators is Yu22, about 65 of 314 bracketed citations; no layer was added, removed or reordered, so the contents were not compared.

Research link: §6.4a is the trace-class theorem (Müller 1989, 1998; Ji 1998) underlying the spectral side of Arthur's trace formula, whose absolute convergence Finis, Lapid and Müller (2011) prove. The README's Layer 6 builds that trace formula. This line rests on the README's summary and on [FLM11] §1 and Remark 3.

## Not verifiable

- [Mül98] (Geom. Funct. Anal. 8, 1998, 315–355): the citation resolves only to the publisher's paywalled page; its content was taken from [FLM11] Remark 3.
- The Zbl number 0701.11019 in the [Mül89] entry was not opened.

Automatic checks set aside as false positives: the citation resolver lists four Lean names (`Modular.automorphic_green`, `Modular.green_kernel_continuation`, `SpecialFunctions.legendre_q`, `SpecialFunctions.point_pair_invariant`) as found nowhere, although `Suggested.lean` declares them under the roadmap's namespace. It lists two more (`LocallySymmetric.FrankeInput`, `LocallySymmetric.realPoints_lieGroup`) that are names proposed in ArithmeticLocallySymmetricSpaces' README on main. A manual run of the full check flags as "outside the folder" the other roadmap folders that this pull request carries as its own.

## Source issues

- none

## For the human reviewers

- none
