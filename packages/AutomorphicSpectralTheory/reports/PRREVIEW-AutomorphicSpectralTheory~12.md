# Review of AutomorphicSpectralTheory (pull request #3027 at 71bbefa)

**Verdict:** needs changes

**Summary.** This is an incremental re-review: the roadmap folder has not changed since `4a2d22f`, so both earlier findings on §6.4a stand. I checked them again against the sources. The route of the discrete clause still leaves out its main input, Müller's polynomial bound on the number of discrete-spectrum Casimir eigenvalues, and no roadmap this one may consume states it (R01). The number-field step still applies restriction of scalars to Müller's adelic corollary, which concerns the quotient by `Z(ℝ)⁰`, not `[G]¹` (R02). The earlier small correction and format note also stand (C01, N01). Nothing is left for a human to decide.

## R01 (P2) — The route of the discrete clause of §6.4a still leaves out Müller's eigenvalue-counting bound, and no roadmap this one may consume states it

An implementer of the discrete clause has nothing planned for the step that carries it. The route (line 2848) says "the residual spectrum is controlled by the Eisenstein series of §4.4 and the same factorization". The *Needs:* line (line 2857: §§0.8, 0.9, 3.4, 4.4–4.5, 6.4, Dixmier–Malliavin, OperatorIdeals) supplies only the cuspidal clause. Finite multiplicity (§4.5) does not bound how fast the residual eigenvalues grow, and trace class needs such a bound.

In [Mül89], Corollary 0.2 (preprint p. 2, Mül89 line 84) comes from two inputs. One is Theorem 0.1 (Mül89 lines 78–81): on a fixed `K`-type the number of eigenvalues below `λ` grows at most polynomially. The other is the Clozel–Delorme Paley–Wiener theorem, which is this roadmap's §6.1. Theorem 0.1 is proved by counting the real singular hyperplanes of cuspidal Eisenstein series through the factorization of the intertwining operators (Mül89 lines 100–124). "The same factorization" in the route is Dixmier–Malliavin, a different thing. This roadmap's §4.9 counts eigenvalues only for `SL₂(ℤ)` (`N(X)∼X/12`). The general bound is stated only in AutomorphicSpectralTheoryPartII §4.5a. That roadmap is open and not on main, and its *Needs:* line cites this roadmap's §§3.1–3.6, 4.1–4.5 and 6.3–6.4, so it cannot supply this one.

The smallest repair is to state the counting bound in this roadmap, either as a named step of §6.4a's route or as its own section, citing [Mül89] Theorem 0.1, p. 2, with the truncation, Maass–Selberg and intertwining-operator sections it uses. Then route the discrete clause through it and §6.1, and add both to the *Needs:* line and to the Layer 6 Dependencies sentence (line 3518). AutomorphicSpectralTheoryPartII §4.5a would then cite it.

## R02 (P2) — Müller's adelic corollary concerns the quotient by `Z(ℝ)⁰`, so restriction of scalars to `ℚ` does not give the statement on `[G]¹`

As written, the number-field step of the route ("For a number field F apply this to the restriction of scalars of G to ℚ", line 2848) gives trace class only on a proper summand of `L²_disc([G]¹)`. So does the locator's "for `K_∞`-finite `f` over `ℚ`" (line 2855). This happens whenever `Z(ℝ)⁰` is larger than `A_G(ℝ)⁰`, as it is for `Res_{F/ℚ}GLₙ` with `F≠ℚ`.

[Mül89] §8 ((8.6)–(8.7) and Corollary 8.8, preprint pp. 83–84, Mül89 lines 2102–2131) works on `L²(Z(ℝ)⁰G(ℚ)\G(𝔸))`, where `Z(ℝ)⁰` is the identity component of the real points of the whole centre. `[G]¹` divides only by `A_G`. Take `G=GL₁` over `F=ℚ(√2)`, with fundamental unit `ε=1+√2`. For `Res_{F/ℚ}G`, `Z(ℝ)⁰=ℝ_{>0}²` while `A_G=ℝ_{>0}`. The unramified Hecke character with archimedean component `|x₁|^{it}|x₂|^{−it}` takes the value `ε^{2it}` at `ε`. It is therefore a character of `F^×\𝔸_F¹` exactly when `t∈(π/log ε)ℤ`. On `(a,a⁻¹)∈Z(ℝ)⁰∩𝔸_F¹` it takes the value `a^{2it}≠1` for `t≠0`, so it lies in `L²([G]¹)` but not in Müller's space.

Corollary 8.8 is the statement on `[G]¹` when `Z(ℝ)⁰=A_G(ℝ)⁰`, for instance for `GLₙ` and `SLₙ` over `ℚ`. The smallest repair is to say so in place of the restriction-of-scalars sentence and of "over ℚ" in the locator. Then take the form on `[G]¹` over a number field from [Mül98] (and Ji 1998), as [FLM11] Remark 3 records. Alternatively, keep Müller 1989 and add the missing step. Decompose `L²([G]¹)` under the compact torus that `Z(ℝ)⁰∩G(𝔸)¹` induces, apply the twisted form Müller states after Corollary 8.8 (p. 84) to each character, and bound the trace norms summably over the characters.

## C01 — The cited Dixmier–Malliavin theorem gives one Schwartz factor, not two compactly supported ones

The route of the cuspidal clause (line 2848) cites AutomorphicFormsOnReductiveGroups §2.7 `dixmierMalliavin` for `f=Σ_i f_i∗g_i` with `f_i,g_i∈C_c^∞`. That section (line 453, the same on main and at this head) states two things. Vectors of smooth Fréchet representations factor through `C_c^∞(G)`. Adelically, `S(G(𝔸))=S(G(𝔸))∗C_c^∞(G(𝔸))`. `C_c^∞(G(𝔸)¹)` is not a Fréchet stage of the kind treated there, so the compactly supported form with both factors does not follow as stated. The Hilbert–Schmidt argument works just as well with one Schwartz factor. You could say `f_i∈S(G(𝔸)¹)`, or cite the compactly supported form of Dixmier–Malliavin as a separate input.

## N01 — [Mül98] is cited without a locator

"[Mül98] for general `f`" (line 2855) and its reference entry (line 3856) give no theorem number or page. Give one, or let [FLM11] Remark 3 carry the general form on its own.

## Questions for the author

- Does [Mül98] state its theorem on `G(ℚ)\G(𝔸)¹` for every reductive `G` over `ℚ`, or modulo `Z(ℝ)⁰` as Corollary 8.8 of the 1989 paper does? In the first case restriction of scalars does apply to it, and the repair of R02 is a one-line change. Its text is behind the publisher's paywall and was not read.

## Previous findings

- R01 — not repaired: "For the discrete clause, Müller proves it first for `K_∞`-finite `f` and then for general `f`; the residual spectrum is controlled by the Eisenstein series of §4.4 and the same factorization." *Needs:* still §§0.8, 0.9, 3.4, 4.4–4.5, 6.4 (lines 2848, 2857).
- R02 — not repaired: "Müller proves the `K_∞`-finite case … and deduces the adelic form over `ℚ` … For a number field `F` apply this to the restriction of scalars of `G` to `ℚ`." (line 2848).
- C01 (small correction) — not repaired: "write `f=Σ_i f_i∗g_i` with `f_i,g_i∈C_c^∞` by the Dixmier–Malliavin factorization" (line 2848).
- N01 (format note) — not repaired: "[Mül98] for general `f`" (line 2855); reference entry without locator (line 3856).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.4a cuspidal clause | `GL₁/ℚ`; `SL₂/ℚ`, bi-`K`-invariant `f` | `GL₁`: `ℚ^×\𝔸¹≅Ẑ^×`, eigenvalue `∫fχ` non-zero only for conductor dividing level: finite rank. `SL₂`: `Σ_j\|ĥ(t_j)\|<∞` from `N(T)∼T²/12` and rapid decay of `ĥ` | true | none |
| §6.4a discrete clause | `SL₂/ℚ`; `GL₁` over `ℚ(√2)` | `SL₂`: `L²_disc=L²_cusp⊕ℂ·1`, extra rank-one term `∫f`. `GL₁/ℚ(√2)`: characters `t∈(π/log ε)ℤ`, eigenvalues `f̂(χ_t)` rapidly decreasing in `t`, summable | true | none |
| Discrete route | Mül89 lines 78–85, 100–124; README §4.9; Part II §4.5a | Cor. 0.2 = Thm 0.1 (counting) + Clozel–Delorme; *Needs:* has neither; §4.9 is `SL₂(ℤ)` only; §4.5a consumes §§3.1–6.4 | input unowned | R01 |
| Number-field step | `Res_{ℚ(√2)/ℚ}GL₁`, `ε=1+√2` | `χ_t(ε)=ε^{2it}`, so `t∈(π/log ε)ℤ`; on `(a,a⁻¹)`: `a^{2it}≠1`; `Z(ℝ)⁰=ℝ_{>0}²`, `A_G=ℝ_{>0}` | step false | R02 |
| Cuspidal route, factor class | AutomorphicFormsOnReductiveGroups §2.7, line 453 | gives `v=Σπ(a_i)v_i` on Fréchet stages and `S=S∗C_c^∞`; not `C_c^∞(G(𝔸)¹)=ΣC_c^∞∗C_c^∞` | class off | C01 |
| Check, `GL₁/ℚ` | `ℚ^×\𝔸¹≅Ẑ^×` | trace `Σ_χ∫fχ`, finitely many non-zero terms; matches §6.17 for compact `[G]¹` | true | none |
| Check, `SL₂` whole `L²` | `K`-fixed continuous part | `≅L²(ℝ_{≥0},dt)`; `R(f)` multiplies by `ĥ(t)`, not compact unless `ĥ=0` | true | none |
| [Mül89] locators | preprint MPI 88-31 | Cor. 0.2: printed p. 2 (line 84); Cor. 8.8: printed p. 84 (line 2116); space `L²(Z(ℝ)⁰G(ℚ)\G(𝔸))` (lines 2102–2106) | exact; scope narrower | R02 |
| [FLM11] Remark 3 | authors' copy p. 10 | `P=G`: `ρ(G,h)` trace class; Mül89 `K`-finite, Mül98 and Ji98 general (lines 387–389); `G` over number field (line 69) | supports statement | none |

The rows for the other statements, including the two headline theorems of `Suggested.lean` (`analytic_fredholm`, `green_kernel_continuation`), stand as in the previous review, of `4a2d22f`.

- Change since `4a2d22f`: none in the folder (`git diff 4a2d22f HEAD` on it is empty). The files changed outside it in that range (`.github` scripts, `umbrellas/`, `ComplexCurveModuli`) arrive through the merge of main. Against the base, nothing changes outside the pull request's own folders.
- Source locators checked against the text: 4 in [Mül89] (Theorem 0.1 and Corollary 0.2, p. 2; proof outline, pp. 2–4; (8.6)–(8.7), p. 83; Corollary 8.8, p. 84), 2 in [FLM11] (§2.1 setting; Remark 3, p. 10). The seeded sample lies outside the changed text (there is none) and was not re-checked.
- Cross-roadmap citations resolved: AutomorphicFormsOnReductiveGroups §2.7 (line 453, identical on main and at this head). OperatorIdeals OI-B29–OI-B41 in the supplier contracts (line 3783). AutomorphicSpectralTheoryPartII §4.5a at its open head (statement and *Needs:*). DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1 at this head cites §6.4a with the same statement. Internal §§0.8, 0.9, 3.4, 4.4, 4.5, 4.9, 6.1, 6.4, 6.17 exist.
- Library declarations: none new. `Suggested.lean` is unchanged, and its module docstring says that Layer 6 needs adelic reductive quotients, which the pins lack.
- Record: the README at the merge base `aecb53a` has Layers 0–7. The head keeps every id and title and adds one heading (§6.4a).
- Automatic checks: the worker's checks all passed. The dependency check prints `depcheck: 132 roadmaps, 1479 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` exits 0 with two `sorry` warnings (lines 42, 84) only.
- Pull request's text: the description does not name this roadmap. Its general claims hold for §6.4a: a published theorem with its sources named, no mention of the family, and no new supplier, since AutomorphicFormsOnReductiveGroups and OperatorIdeals are already in the supplier contracts (lines 3783, 3797).
- Notion moved down (R01): Müller's counting bound, stated in the open AutomorphicSpectralTheoryPartII §4.5a, is needed by §6.4a and should be owned here.

Overlap check: read AutomorphicSpectralTheoryPartII (§4.5a and the sections that use it). I also searched every open head and main by object for trace class of `R(f)` on the cuspidal or discrete spectrum and for Müller's counting bound. The scopes of AutomorphicLFunctionsAndLocalFactors (main and open), AutomorphicLFunctionsAndLocalFactorsPartII, TwistedAutomorphicDescents, CongruenceSpectralGap, EndoscopicTransferAndUnitaryTraceComparison and AutomorphicFormsOnReductiveGroups stand as read in the previous review. Trace class on the cuspidal and discrete spectrum is owned here (§6.4a), and DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1 cites it. The counting bound is stated only by AutomorphicSpectralTheoryPartII §4.5a (R01). Nothing else is shared.

Source independence: changed passages only, and there are none since `4a2d22f`. §6.4a's route and locator sentences were compared again with [Mül89] lines 35–37, 78–99 and 2066–2131 and [FLM11] lines 387–389: 4 passages, 2 sources. At most four consecutive words are shared ("real points of a reductive"), and the mathematics forces them. The largest share of locators is Yu22, 67 of 367 bracketed citations. No layer was added, removed or reordered, so the contents were not compared again.

Research link: §6.4a is the trace-class theorem (Müller 1989, 1998; Ji 1998) underlying the spectral side of Arthur's trace formula, whose absolute convergence Finis, Lapid and Müller (2011) prove. The README's Layer 6 builds that trace formula. This line rests on the README's summary and on [FLM11] §1 and Remark 3.

## Not verifiable

- [Mül98] (Geom. Funct. Anal. 8, 1998, 315–355): the citation resolves only to the publisher's paywalled page. Its content was taken from [FLM11] Remark 3.
- The Zbl number 0701.11019 in the [Mül89] entry was not opened.

Automatic checks set aside as false positives: the citation resolver lists four Lean names (`Modular.automorphic_green`, `Modular.green_kernel_continuation`, `SpecialFunctions.legendre_q`, `SpecialFunctions.point_pair_invariant`) as found nowhere, although `Suggested.lean` declares them under the roadmap's namespace. It lists two more (`LocallySymmetric.FrankeInput`, `LocallySymmetric.realPoints_lieGroup`) that are names proposed in ArithmeticLocallySymmetricSpaces' README on main. A manual run of the full check flags as "outside the folder" the other roadmap folders that this pull request carries as its own.

## Source issues

- none

## For the human reviewers

- none
