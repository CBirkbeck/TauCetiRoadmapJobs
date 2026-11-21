# Review of SpecialFunctionsAffineHeisenbergGroups (pull request #2936 at 8d5db04)

**Verdict:** needs changes

**Summary.** Changes are needed, for ownership and for one under-specified target; no stated formula was found false. Every identity and every numerical Check recomputed here agrees with the text, but the two results of 1.3 are already owned by SpecialFunctionsHypergeometric §6.3 on main, the Fock space and Bargmann transform of 3.4 are also built by an open roadmap, and the kernel composition law of 2.6 has no hypotheses and a derivation that does not cover its own use. There are five small corrections and one format note, none blocking. None of the six cited books could be read legally, so no source locator was checked against its text; that and a licence note are left for the human reviewers.

## R01 (P2) — The addition formula of the Gamma function and its dual form in 1.3 are the Mellin–Barnes integral of `(1 + u)^{−a}` and the half-line Beta integral that SpecialFunctionsHypergeometric §6.3 on main already owns

Two roadmaps would each carry the same two theorems, and an implementer of 1.3 would prove again what another roadmap is charged with.

SpecialFunctionsHypergeometric lists "the Mellin–Barnes integral of `(1 + u)^{−a}`" among what it owns (its scope table, §6.3) and states it in §6.3 (`TauCetiRoadmap/SpecialFunctionsHypergeometric/README.md`, lines 852–856): for `0 < σ′ < Re a` and `u > 0`, `Γ(a)(1 + u)^{−a} = (1/2π) ∫ Γ(σ′ + iy) Γ(a − σ′ − iy) u^{−σ′−iy} dy`, together with `∫₀^∞ t^{s−1}(1 + t)^{−a} dt = Γ(s)Γ(a − s)/Γ(a)`. With `u = 1/t`, `a = w`, `σ′ = c` the first is the addition formula of 1.3 (line 266), hypotheses included; with `s = w + u` the second is the dual form (line 268), whose condition `Re u < 0 < Re(w + u)` is `0 < Re s < Re a`. This README does not cite that roadmap anywhere.

The smallest change: in 1.3 cite SpecialFunctionsHypergeometric §6.3 for both identities (with the substitution above), add it to the supplier contracts, and keep as this roadmap's target what is new here, namely that the kernel identity of 1.2 for `g(1, b) g(1, 1) = g(1, b + 1)` reproduces the formula. `Gamma_mul_div_add_one_cpow` and `mellin_div_add_one_cpow` then leave `Suggested.lean`.

## R02 (P2) — The Fock space and the Bargmann transform of 3.4 are also constructed by ThetaKernelsForUnitaryDualPairs §3.45, so the object has two owners

The scope section says this roadmap "owns … the Fock space and the Bargmann transform" (line 740). The open pull request #2907 adds the roadmap ThetaKernelsForUnitaryDualPairs, whose §3.45(i) (`RiemannHypothesisForDirichletLFunctions/ThetaKernelsForUnitaryDualPairs/README.md`, lines 221–232) constructs the Fock space of holomorphic functions square-integrable for `e^{−πH(z,z)} dz` on a real symplectic space of any dimension `2N`, and the unitary Bargmann transform `L²(X) → 𝓕` intertwining the Schrödinger action; its Check (line 275) gives the one-dimensional kernel `2^{1/4} e^{2πuz − πu² − πz²/2}`.

That is the object of 3.4 in another normalisation. Substituting `u = √(2π) u′`, `ζ = √π z` in `bargmannKernel` gives the exponent `−πz²/2 + 2πzu′ − πu′²`, and the constant `π^{−1/4}` times the factor `(2π)^{1/4}` of the unitary rescaling of `L²(ℝ)` is `2^{1/4}`; the measure `π⁻¹ e^{−|ζ|²} dζ` becomes `e^{−π|z|²} dz`. Neither roadmap cites the other.

The smallest change that leaves one owner: cite ThetaKernelsForUnitaryDualPairs §3.45(i) at `N = 1` with this dictionary for the space, the unitarity and the intertwining, and keep here what that roadmap does not state: `B h_n = fockMonomial n`, the action in the coordinates of `TauCeti.HeisenbergGroup`, and Layer 4. If instead this roadmap is to be the owner of the one-variable case, the scope section should say so and say how the two statements are to be reconciled.

## R03 (P2) — The kernel composition law of 2.6 is stated without hypotheses, and its derivation "from 2.3 applied twice" does not cover the case it is then used for

A reader cannot tell which statement is to be proved, and the one route offered fails for the Whittaker application that follows it.

The law is stated "along a line in a common convergence domain" and "follows from 2.3 applied twice" (lines 462–463). The kernel realization of 2.3 assumes `Re σ = 0`, `a ≠ 0` and `0 < Re λ < c < 1` (lines 367–368). The next bullet applies the law to `g_1(t) = g_−(t) g_+(t) z(t²/2)` with the kernels of 2.5, where `σ = −1`, and `g_−(t)` has `a = 0`; by 2.4 its kernel converges for `Re λ > Re μ` (line 399), the opposite of 2.3's domain. So 2.3 gives neither factor.

The identity itself is true in that case. With `K_{++}(λ, ν; g_−(t)) = Γ(λ − ν) t^{ν−λ}/(2πi)` and `K_{++}(ν, μ; g_+(t) z(t²/2)) = e^{−t²/2} Γ(μ − ν) Γ(ν) t^{ν−μ}/(2πi Γ(μ))` it reads `Γ(λ) W_{κ,m}(t²)/t = (e^{−t²/2}/(2π Γ(μ))) ∫ Γ(λ − ν) Γ(μ − ν) Γ(ν) t^{2ν−λ−μ} ds` on `ν = c + is`, `0 < c < min(Re λ, Re μ)`. At `λ = 0.7 + 0.2i`, `μ = 0.5 − 0.4i`, `t = 0.9`, `c = 0.2` both sides are `0.68614 33553 − 0.10049 04888 i`; here `c < Re λ`, outside 2.3.

The smallest change: give the law its hypotheses, for instance for the factorizations actually used (`σ = −1`, `t > 0`, the line `0 < Re ν < min(Re λ, Re μ)`), and replace "follows from 2.3 applied twice" by a route valid there (Fubini on the absolutely convergent kernel integrals of 2.4 and 2.5, or a version of 2.3 for `Re σ < 0` and for `a = 0`).

## C01 — Several declarations of `Suggested.lean` ask an implementer for nothing

`mellin_mul_variable` closes with the single Mathlib lemma `mellin_cpow_smul f w 1` (`Mathlib/Analysis/MellinTransform.lean`, line 100). `mellin_affineAction_dilation` is `mellin_comp_mul_left` (line 133 there) once `affineAction` at `b = 0` is unfolded. `affineAction_one`, `affineAction_mul_I` and `heisenbergToTriangular_injective` close by unfolding the definitions and `simp`. The matrix realizations, the kernel of `Oscillator.toMatrix` and the second injectivity are of the same kind.

The module docstring says the file states "the targets of `README.md` that carry a Lean name", which makes it a list of the API as well as of the headline results. These statements could be marked as sanity checks of the definitions, or left to the README, where they already are.

## C02 — The module docstring names four results as headlines that are not stated, without saying what each lacks

It lists "the kernel composition law, the Mellin–Barnes integrals and the differential relations of README 2.6 … and the Mellin–Plancherel theorem of README 1.1" as "bold headlines … not stated here", and gives as the only reason that they are in prose. The Mellin–Plancherel theorem is statable at the pins (a linear isometric equivalence between `Lp ℂ 2 halfLineMeasure` and `Lp ℂ 2 volume` agreeing with `s ↦ (2π)^{−1/2} mellin f (is)` on compactly supported functions), and so is the composition law once R03 gives it hypotheses. Either state them, or say that they are not headline results; the README's own summary does not list them among its headlines.

## C03 — The route of 1.2 evaluates the inner integral with a Mathlib lemma that covers only a real rate

The route (line 244) uses `Complex.integral_cpow_mul_exp_neg_mul_Ioi` for `∫_0^∞ e^{λbx/a} x^{w−z−1} dx` under `Re(−λb) > 0`. At the pin that lemma is stated for `{r : ℝ}` with `0 < r` (`Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`, line 372), and the Gamma folder has no version with `0 < r.re`. For complex `λ` the route needs one more step, the continuation in the rate that the paragraph attributes to the source; say so, or name the complex-rate integral as an input.

## C04 — The integrability hypothesis in the kernel formula of the Bargmann transform is not needed

In 3.4 the formula `(B f)(ζ) = ∫ bargmannKernel ζ u f(u) du` is stated "for integrable square-integrable `f`", and `bargmann_spec` assumes `Integrable f`. For each `ζ` the kernel is a Gaussian in `u`, hence in `L²(ℝ)`, so the integral converges for every `f ∈ L²(ℝ)` and both sides are continuous in `f`; the formula holds without the hypothesis. It could be dropped.

## C05 — The guide to the layers says Layer 1 needs only Mathlib, while 1.1 needs SpecialFunctionsGroupModels

"Layer 1 … needs only Mathlib's Mellin transform and Gamma function" (lines 52–53), but the *Needs* line of 1.1 (line 226) lists SpecialFunctionsGroupModels §§0.2, 2.4, for the group and for the dictionary bullet. The sentence would be right as "needs Mathlib's Mellin transform and Gamma function and the `ax + b` group of SpecialFunctionsGroupModels".

## N01 — The last `#check` block of `Suggested.lean` checks the file's own theorems

The block headed "Namespaced targets as cited in the README" (lines 995–1001) applies `#check` to five declarations of this file; `#check` is kept for pinning library declarations.

## Questions for the author

- The README reports misprints in Klimyk–Vilenkin (Chapter 4, §1.4 (15)–(16) and (19); Chapter 6, §1.4 (5)), in Vilenkin–Klimyk Vol. 2 (§12.1.6 (9), §12.1.8 (1), (2), (4)) and in Miller ((4.95), Theorem 4.3). The corrected forms all pass the computations below, but the printed forms could not be read. Are these recorded anywhere a reader can check them without the books?
- In 2.3 the convergence domain `0 < Re λ < Re μ < 1` is attributed to Vilenkin–Klimyk Vol. 1, p. 210, and "the source exchanges the integrals formally". Does the source state the kernel realization for `Re σ = 0` only? The text could not be read.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.1 group law, matrix, centre, factorizations | `g=(0.7,−1.2,0.4,0.3)`, `h=(−0.5,0.9,1.1,−0.8)`; symbolic products | law defect `0`; order `hg` defect `0.97`; third factorization: `re^{−τ}=x+t`, `re^{τ}=x`, `b=x²/2+tx` both sides | holds | none |
| 0.2 oscillator law, kernel, embedding | symbolic `(1,3)` entry; sign-flipped embedding at the README's points | `δ=δ₁+δ₂−Im(X)/4`; wrong sign defect `(x₁y₂−y₁x₂)/2=−0.4` | holds | none |
| 1.1 `R_λ` law, dictionary, Mellin rules | `λ=0.3−1.1i`, `x=0.9`, `f=xe^{−x}` | both `−0.0053834360+0.2329706662i`; reversed order `0.1985010475+0.2092694395i` | holds | C01, C05 |
| 1.2 Gamma kernel | `a=1.3,b=0.7,λ=−0.8+0.5i,w=1.9+0.3i,c=0.6` | closed form and contour integral `0.2835198619+0.1996364628i`; exponent `w−z`: `0.0203228410−0.0538024362i` | holds | C03 |
| 1.3 addition formula and dual | `w=1.7+0.4i,t=0.6,c=0.8`; `t=1`; `c=2.5`; `u=−0.4+0.3i` | `0.1537750787−0.0480110634i` both; `0.2581049091−0.0489841714i` both; `c=2.5` gives `−0.2020435566−0.0070458538i`; dual `1.2029804832+0.6725852838i` both | holds; owned on main | R01 |
| 2.1 cocycle, unitarity range, equivalence | law at `σ=1.3i`, `ω=0.5+0.7i`; `Re ω=0.3`; dilation conjugation | defect `1.1e−16`, order `hg` `1.2173`; ratio `e^{−0.12}=0.88692`; conjugate is `U(γx,y,γz)` | holds | none |
| 2.2 infinitesimal operators | commutators of `d/dx`, `σx`, `σ`, `ω+x d/dx` | `[A₊,A₋]=σ`, `[A₊,E]=A₊`, `[A₋,E]=−A₋`; matrices `E₀₁,E₁₂,E₁₁` give the same | holds | none |
| 2.3 signed Mellin kernel | derivative rule at `ε=−1`; `g=1`; convergence at `0`, at the zero of `e^τεx+a`, at `∞` | `(λ−1)F₋(λ−1)`; `∫x^{λ−1−μ}` divergent; needs `Re λ>0`, `Re μ<1`, `Re λ<Re μ` | holds | none |
| 2.4 power kernels | the README's four parameter sets, `t=0.9` | `1.5797916581−0.2941461055i`; `1.2546400163−1.1102739560i`; `2.3396051286+0.2561716573i`; `1.0983491745+0.2099282062i`, quadrature and formula | holds | none |
| 2.5 Whittaker kernels | `λ=0.7+0.2i`, `μ=0.3−0.4i`, `t=0.9`; `W`, `M` from Kummer series | `0.7356543260−0.0810587023i`; `1.2036993199−1.1936999522i`; `0.5945816449−0.2409469890i`; `1.3683177364−1.1164563421i`; swapped index `0.7308738824−0.1415945493i` | holds | none |
| 2.6 composition, Mellin–Barnes | `λ=0.7+0.2i`, `μ=0.5−0.4i`, `c=0.2`; `W_{−0.3,0.2}(1.4)` | both `0.6861433553−0.1004904888i`; `W=0.3454479578` | true, outside 2.3's hypotheses | R03 |
| 3.1 Hermite matrix elements, bound | `(0.7,−1.1,0.4)`, `(m,n)=(0,0),(2,0),(3,1),(1,3),(2,2),(0,4),(5,2)`; bound for `m≤6`, `A≤40` | `(0,0)`: `0.4624690767+0.4621009468i`; `(1,3)`: `0.1661803456−0.4585786459i`; all formula = quadrature; max of bound `1.0` | holds | none |
| 3.2 addition, orthogonality, completeness | `g,h` of the README, `(2,1)`, `k<40`; grid integrals | `−0.1319763019−0.5667940604i` both; `hg`: `0.0007154161−0.5819559600i`; `∫∫|E₂₁|²=6.2831853072`; `⟨E₁₀,E₀₁⟩=0` | holds | none |
| 3.3 Charlier | `x=1.3`; `a=1.5`; `a=0` junk; `x≤0` | `0.6554062543`, `0.2859280288`, `0.4872355181` both sides; sums `1,0,0`; `c₃(5)=c₅(3)=−1/9`; at `x=0`, `k=n=1`: `1≠0` | holds, `x>0` needed | none |
| 3.4 Fock space, Bargmann transform | `ζ=0.4−0.3i`; `h₂,h₃`; README's `f`; cocycle of the Fock action symbolically | `0.0494974747−0.1697056275i`; `−0.0179629248−0.0477650500i`; intertwining `1.4661973284−0.1497107965i` both; swapped `0.0451048830+2.2875576036i` | holds; second owner | R02, C04 |
| 4.1 oscillator representation, matrix elements | README's `λ,g,h,ζ,F`; `(0,0),(2,1),(1,3)` | law defect `3e−16`, wrong sign `0.3629`; `(0,0)`: `0.2770015263+0.7341439581i` both; subgroup `1.7501891273+0.1878619536i` both | holds | none |
| 5.1 Miller's group | README's complex data; `(l,k)=(1,3),(3,1),(0,0),(4,2)` | law defect `3e−15`, `hg` `2.9549`; sum = Laguerre form in all four; addition `−0.5954731557−0.0660550294i` both; generating function `1.7282214108` both | holds | none |
| Local copies of supplier definitions | compared with the suppliers' `Suggested.lean` | `multiplierRep`, `schrodingerCocycle`, `oscillatorMatrix`, `whittakerW`, `whittakerM`, `kummerU`, `laguerre` identical; namespaces differ | no shared qualified name | none |

- Source locators checked against the text: 0 of the sample of 15 sections; none of the six books could be read legally.
- Library declarations opened at the pin: `mellin_cpow_smul`, `mellin_comp_mul_left`, `mellinInv_mellin_eq` (`Mathlib/Analysis/MellinTransform.lean` 100, 133; `MellinInversion.lean` 92), `Complex.integral_cpow_mul_exp_neg_mul_Ioi` (`Gamma/Basic.lean` 372), `Complex.Gamma_mul_Gamma_eq_betaIntegral` (`Gamma/Beta.lean` 124), `TauCeti.HeisenbergGroup` law (`Heisenberg.lean` 95), `TauCeti.hermiteFunction` (`Hermite/Function/Basic.lean` 36), `TauCeti.hermiteHilbertBasis` (`HilbertBasis.lean` 101), `ContRepresentation.IsUnitary` (`Unitary/Basic.lean` 49), `TauCeti.integral_rpow_mul_one_add_rpow` (`Beta.lean` 456, real parameters only).
- Cross-roadmap citations resolved: SpecialFunctionsGroupModels §§0.2, 1.2, 1.3, 2.4, 2.5, 3.1, 3.2 and SpecialFunctionsConfluent §§1.4, 1.6, 2.4, 4.2 at their open heads; LaguerreJacobi §§1.1, 2.3, 2.4, NoncompactQuantumSymmetry M2 (HeisenbergShear), MetaplecticAutomorphicForms 1.2 on main. All exist and say what is cited.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 48 `sorry` warnings and the `#check` output, nothing else. Elaborated types read against the README; casts of factorials are real, no binder lost.
- One-tactic probe on a copy of the file: `mellin_mul_variable`, `affineAction_one`, `affineAction_mul_I`, `heisenbergToTriangular_injective` close; the other 44 do not close with `rfl`, `simp` or unfolding.
- Pull request text read against the head: 48 declarations and 48 warnings agree; suppliers as listed; no sentence contradicted.
- Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsMotionGroupsBessel, SpecialFunctionsSU11MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsRankOneSymmetricSpaces, SpecialFunctionsBessel, SpecialFunctionsParabolicCylinder, LaguerreJacobi; nothing shared with these. Shared with others: the Mellin–Barnes and half-line Beta integrals, owner SpecialFunctionsHypergeometric §6.3 (R01); the Fock space and Bargmann transform, also in ThetaKernelsForUnitaryDualPairs §3.45 (R02). Charlier polynomials: no other owner found.

Source independence: 0 passages compared with 0 sources, since no cited text could be read; largest share Vilenkin–Klimyk Vol. 1, about 45 of 97 page locators; contents compared only through the README's own locators: Layer 1 draws on §3.4 and Layer 2 on §§5.1–5.2 in the source's order, not one to one (§5.1.1 is in Layer 0, §5.1.2 and §5.1.4 are each split, §§5.2.1, 5.2.3, 5.2.4 are merged), an order the lines 2.1 → 2.3 → 2.4, 2.5 → 2.6 force; Layers 3–5 combine three other books. Not tested against the table of contents.

Research link: the headline targets are the matrix-element and kernel theory of the `ax + b`, triangular, Heisenberg and oscillator groups as in Vilenkin–Klimyk (1991, 1993), Miller (1968) and Wawrzyńczyk (1984); they feed the Askey-scheme Charlier theory named under Downstream consumers. Rests on the README's references; no source was read.

## Not verifiable

- Vilenkin–Klimyk Vol. 1 (§§3.4, 5.1–5.2), cited for 0.1, 1.1–1.3, 2.1–2.6: paywalled at the publisher; no legal copy found.
- Vilenkin–Klimyk Vol. 2 (§12.1), cited for 3.1–3.4, 5.1: paywalled; no legal copy found.
- Klimyk–Vilenkin, Encyclopaedia of Mathematical Sciences 59, cited for 0.1, 0.2, 1.1, 2.1, 2.3–2.5, 3.3, 4.1: paywalled; no legal copy found.
- Miller, *Lie Theory and Special Functions*, Chapter 4, cited for 0.2, 3.1–3.4, 4.1, 5.1: no copy on a host the sources service accepts.
- Wawrzyńczyk, Chapter 12, cited for 3.1, 3.2, 3.4, 5.1: paywalled; no legal copy found.
- Dieudonné, CBMS 42, §17, cited for 0.1, 2.1, 2.5: the publisher's page is in no licence class; not read.
- Consequently every locator of the sampled sections 0.1–3.4 and 5.1, and every misprint the README attributes to a source, is unchecked against the text. The README flags no locator as unverified.

Automatic checks set aside as false positives: the rule against choice in the body of a definition, raised for the `L²` multiplier representation, which is a verbatim copy of the supplier's definition and picks a representation that is unique when it exists (agreement almost everywhere fixes each operator on `L²`); the rule against a section heading with no declaration under it, raised for the block of `#check`s that pins library names, a form roadmaps on main also use.

## Source issues

- none

## For the human reviewers

- **Not tested.** No cited book could be read legally, so the wording and the arrangement were not compared with any source; Vilenkin–Klimyk Vol. 1 has the largest share of locators (about 45 of 97).
- **Licence.** `README.md`, "Prior formalization", says the roadmap reuses the names and conventions of the author's repository `bjbraams/lean-SFVK` (stated Apache-2.0), files `SFVK/AffineHeisenberg/*.lean`; `Suggested.lean` declarations appear to be taken from it.
- **Licence.** Miller's 1968 book may be openly available from its author's university page; the sources service did not accept that host, so it was not read.
