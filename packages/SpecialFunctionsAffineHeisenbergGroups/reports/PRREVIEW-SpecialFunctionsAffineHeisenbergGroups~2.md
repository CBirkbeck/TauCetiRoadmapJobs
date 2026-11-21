# Review of SpecialFunctionsAffineHeisenbergGroups (pull request #2936 at bea1c8a)

**Verdict:** needs changes

**Summary.** Changes are needed for one point: three items that the README declares to be targets "of the same standing" have no statement, and the one in 4.1 is described through a parameter this roadmap does not have. The three findings of the previous review are repaired, and every formula, Check and Lean statement recomputed here, including the new kernel compositions of 1.3 and 2.6 and the dictionary of 3.4, agrees with the text. There are three small corrections and no format note. None of the six cited books could be read legally, so no locator was checked against its text; that and two licence notes are left for the human reviewers.

## R01 (P2) — Three items declared as targets "stated in prose" are not stated: the orthogonality relations of 4.1, the differential relations of 2.6 and the change of coordinates of 0.2

The README and the module docstring of `Suggested.lean` both say that these prose items have the same standing as the named targets, so an implementer must be able to tell what is to be proved and when it is done. For these three that is not possible from the text.

In 4.1 (lines 769–772) the target is "the orthogonality relations of Miller's Theorem 4.3", described by `δ(l − l') = (1/2π) ∫ e^{ix(l−l')} dx` and the remark that the `α`-integration "gives `δ_{λλ'}` for integer weights". No integral, domain, measure or constant is given, and the representations `oscillatorFock λ` of this roadmap have no continuous parameter `l` (their central character is fixed at `e^{−2iδ}`), so the Dirac delta refers to nothing defined here. Over the full group the integral in `δ` diverges, so the relation can only be modulo the centre, and its constant depends on the measure: with `dRe w dIm w dα` on `ℂ × [0, 2π)` and the matrix elements of 4.1 at `δ = 0`, 3.2 gives `∫ D^λ_{mn} conj D^{λ'}_{m'n'} = 2π · 2π · δ_{λλ'} δ_{mm'} δ_{nn'} = 4π² δ_{λλ'} δ_{mm'} δ_{nn'}` for integer `λ`, `λ'`, while in the Haar coordinates `r dr dϑ dα` with `w = 2re^{iϑ}` of SpecialFunctionsGroupModels §0.2 the constant is `π²`.

In 2.6 (lines 522–528) the "first-order relations between `K(g_1(x))`, its `x`-derivative and the infinitesimal operators" are not written, and "the contiguous relations of `W_{κ,μ}` and `M_{κ,μ}`" are not identified among DLMF 13.15.1–13.15.26. In 0.2 (lines 177–180) the change of coordinates to Miller's `S₄` is given only as `w = 2re^{iθ}` and three equation numbers of a book.

The smallest change: for each of the three, either write the statement (for 4.1 the relation above with its measure; for 2.6 the relation obtained from the derivatives `1/2`, `−1/(2x)`, `x/2` of the Check, and the numbers of the DLMF recurrences it becomes; for 0.2 the full map of coordinates), or say that it is a remark on the sources and not a target. The Mellin–Barnes item of 2.6 needs no change: with (a)–(c) and the closed forms of 2.4–2.5 it is determinate.

## C01 — For a once continuously differentiable `f`, `mellin f` does not decrease rapidly on vertical lines

The route of 1.2 says the contour may be moved "since `mellin f` is entire and decreases rapidly on vertical lines" (lines 255–256), but the hypothesis of the target is `f` continuously differentiable with compact support in `(0, ∞)`; then `mellin f (c + is)` is only `o(1/|s|)`, with `s · mellin f (c + is)` square-integrable (for `f(x) = ((x − 1)(2 − x))₊²` the decay is exactly of order `|s|^{−3}`). What the route needs is true: `mellin f (c + is)` is integrable in `s` and tends to `0` uniformly in vertical strips, which is what `mellinInv_mellin_eq` (hypothesis `VerticalIntegrable`) and the shift of the contour use. Replace "decreases rapidly" by that.

## C02 — The supplier contract attributes "the holomorphic polynomials are dense" to ThetaKernelsForUnitaryDualPairs §3.45(i)–(ii), which states something else

In 3.4 (lines 678–680) and in the supplier contracts (lines 944–947) the Fock space of §3.45 is cited "with the holomorphic polynomials dense in it". At its head §3.45(ii) says that the holomorphic polynomials are the `K`-finite vectors for the preimage of the unitary group; density follows (the `K`-finite vectors of a unitary representation of a compact group are dense) but is not what the section states. Cite it as stated and add the one step, or rest the density on this roadmap's own target on `fockSpace` in 3.4, which is where it is proved here.

## C03 — The summary gives the norm of the Laguerre matrix elements as `2π`; it is their squared norm

"are orthogonal on `ℝ²` with norm `2π`" (line 21): the statement of 3.2 is `∫∫ E_{mn} conj E_{m'n'} dx dy = 2π δ_{mm'} δ_{nn'}`, and `∫∫ |E_{00}|² = 2π`, so the norm is `(2π)^{1/2}`, as the factor `(2π)^{−1/2}` of the completeness bullet shows. Write "with squared norm `2π`".

## Questions for the author

- The README reports misprints in Klimyk–Vilenkin (Chapter 4, §1.4 (15)–(16), (19); Chapter 6, §1.4 (5)), Vilenkin–Klimyk Vol. 2 (§12.1.4 (1), §12.1.7 (15), §12.1.8 (1), (2), (4), (5)) and Miller ((4.95), the line before Theorem 4.3). The corrected forms are consistent with every computation below, but the printed forms could not be read. Is there a published erratum, or a place where a reader without the books can check the printed forms?
- In 3.2, corrected form (2): the left side "as printed" is not reproduced, so the identity could not be recomputed. Could the left side be written out?

## Verified sound

The previous review's findings at this head: R01 (the addition formula and its dual owned by SpecialFunctionsHypergeometric §6.3) repaired, 1.3 now states only the kernel composition and says "neither identity is restated here", the two Lean statements are gone; R02 (two owners of the Fock model) repaired, 3.4 "consumes that statement at `N = 1`" through a dictionary and the scope section owns "only the normalization in Tau Ceti's coordinates"; R03 (composition law without hypotheses) repaired, 2.6 states three cases with their lines and a route by Fubini and Mellin inversion. C01–C05 and N01 repaired (sanity checks labelled; Mellin–Plancherel and the compositions stated; the complex-rate integral cited from AsymptoticExpansions §4.1; integrability hypothesis dropped; the guide to Layer 1 corrected; the `#check` block pins library names only).

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.1 triangular group: law, centre, three factorizations, Heisenberg subgroup | symbolic products of `(a,b,d,τ)`; `g_+(t)g_1(x)` | third: `(re^{−τ}, r²/2+tx/2, re^{τ}) = (x+t, x²/2+tx, x)` both sides; `g_−g_+z(t²/2) = (t,t²/2,t,0)`; `g_+g_−z(−t²/2)` same | holds | none |
| 0.2 oscillator group: law, kernel, embedding | commutator of images of `(x,0,0)`, `(0,y,0)`; sign-flipped embedding | commutator `(0,0,−xy/2)`, so `δ = −z/2`; wrong sign defect `(0.18−0.98)/2 = −0.4` | holds; change of coordinates not stated | R01 |
| 1.1 `R_λ`, dictionary, Euler operator, Mellin–Plancherel | by parts; `x = e^u`; `R_0(a,0)f = f(a·)` | `mellin(xf′) = −w·mellin f`; `(2π)^{−1/2}∫e^{isu}f(e^u)du` unitary; multiplier `a^{−is}` | holds | none |
| 1.2 Gamma kernel | `a=1.3, b=0.7, λ=−0.8+0.5i, w=1.9+0.3i`; C¹ decay | `aΓ(w+1)(a−λb)^{−w−1} = 0.283519861947+0.199636462773i`; kernel `= Γ(w−z)(−λb)^{z−w}a^{−z}` | holds; route wording | C01 |
| 1.3 composition of Gamma kernels | README data, `c = 0.7, 1.5, 2.3` | `2πi`·left `0.253584314074+0.199544525871i`; right the same at `0.7`, `1.5`; at `2.3`: `−0.151493597473−0.312705202583i` | holds; reduces to SpecialFunctionsHypergeometric §6.3 at `u=1/b` | none |
| 2.1 `T_χ`: cocycle, unitarity range, irreducibility, equivalence | cocycle symbolically; `Re ω = 0.3`, `τ = 0.3`; dilation conjugation | exponents agree; ratio `e^{−0.12} = 0.88692`; conjugate is `U(γx, y, γz)`; scalar intertwiner forces `ρ = ρ′` | holds | none |
| 2.2 infinitesimal operators | commutators of `d/dx`, `σx`, `σ`, `ω + x d/dx` | `[A₊,A₋] = σ`, `[A₊,E] = A₊`, `[A₋,E] = −A₋`; matrices `E₀₁, E₁₂, E₁₁` the same | holds | none |
| 2.3 signed Mellin kernel | convergence at `0`, at the zero of `e^τεx + a`, at `∞`; `ε = −1` derivative rule | needs `Re λ > 0`, `c < 1`, `Re λ < c`; `(λ−1)F₋(λ−1)`; Fubini bound finite under the stated hypotheses | holds | none |
| 2.4 power kernels | README's parameter sets, `t = 0.9` | `1.57979165814−0.294146105508i`; `2.3396051284+0.2561716573i`; `1.09834917447+0.209928206175i`, quadrature and formula | holds | none |
| 2.5 Whittaker kernels | `λ=0.7+0.2i, μ=0.3−0.4i, t=0.9` | `0.73565432599−0.08105870233i`; `1.2036993199−1.1936999522i`; `0.594581644875−0.240946988953i`; `1.36831773639−1.11645634212i`; `Γ(λ−μ+1)` never a pole since `Re(λ−μ+1) > 0` | holds | none |
| 2.6 composition (a), (b), (c) | `λ=0.7+0.2i, μ=0.5−0.4i, t=0.9`; lines `0.2, 0.4, 0.6; 0.8, 1.3; 0.6, 0.9` | `K₊₊`: `0.686143355328−0.10049048877i` by quadrature, (a), (b), and from `W`; (a) at `c=0.6`: `0.481367120604+0.672121963377i`; `K₋₊`: `1.35725248061−1.75727613098i` by quadrature, (c), and from `M` | holds; differential relations not stated | R01 |
| 3.1 Hermite matrix elements, bound | `(0.7,−1.1,0.4)`, `(m,n) = (0,0),(3,1),(1,3),(2,2)`; BCH for the route | `0.462469076737+0.462100946776i`; `−0.458446166631+0.166545471331i`; `0.166180345597−0.45857864588i`; `−0.156661399745−0.15653669572i`, formula = quadrature | holds | none |
| 3.2 addition, orthogonality, completeness; corrected forms (4), (5) | `g,h` of the README, `(2,1)`, `k<40`; (4), (5) from the generating function | `−0.131976301924−0.566794060399i` both; (4) is 5.1's series at `x=λzz̄`, `Z=w/z`; (5) follows by the continuation rule | holds; summary wording | C03 |
| 3.3 Charlier | `a=1.5`; `x=1.3`; `a=0`; sign of `x` | `c₃(5)=c₅(3)=−1/9`; sums `1, −1e−23, −2e−24`; `0.655406254327`, `0.285928028802`, `0.487235518127` both sides; `x<0` changes the sign `(−1)^{k−n}` | holds, `x > 0` needed | none |
| 3.4 Fock space, Bargmann transform, dictionary | `ζ=0.4−0.3i`, `z=0.3−0.2i`, `v=0.37`, README's `f`, `p` | `Bh₂ = 0.0494974746831−0.169705627485i`; intertwining `1.46619732845−0.149710796498i` both; dictionary `2.60214031055−0.584667090495i`, `1.80807285926−1.29133923553i`, `1.43436824476−0.293800043091i` both | holds; density attribution | C02 |
| 4.1 oscillator representations, matrix elements | `λ=2.3`, `g=(0.4−0.9i,0.7,0.2)`; unitarity on `L²`; orthogonality modulo the centre | `(0,0)`: `e^{1.21i}e^{−0.2425} = 0.2770+0.7341i`; `‖ζ+w/√2‖²` expansion gives norm ratio `1`; `4π²δδδ` in `dw dα`, `π²` in `r dr dϑ dα` | holds; orthogonality target not stated | R01 |
| 5.1 Miller's group | README's complex data; `(l,k)=(1,3),(3,1),(4,2)` | sum = Laguerre form: `5.00514689187+6.45178553303i`, `0.206272236939+0.0370331916864i`, `0.193411043502+0.147680416723i`; addition `−0.59547315565−0.0660550293736i` both; generating function `1.72822141076` both | holds | none |
| Local copies of supplier definitions | compared with the suppliers' `Suggested.lean` at their heads | `multiplierRep`, `oscillatorMatrix`, `whittakerW`, `kummerULog`, `laguerre` identical text; namespaces differ | no shared qualified name | none |

- Source locators checked against the text: 0 of the sample of 15 sections; none of the six books could be read legally.
- Library declarations opened at the pin: `Complex.integral_cpow_mul_exp_neg_mul_Ioi` (`Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean` 372, real rate only), `mellin_cpow_smul`, `mellin_comp_mul_left` (`Mathlib/Analysis/MellinTransform.lean` 100, 133), `mellinInv_mellin_eq` (hypothesis `VerticalIntegrable`), `MeasureTheory.Lp.fourierTransformₗᵢ` (`Mathlib/Analysis/Fourier/LpSpace.lean` 51), `TauCeti.hermiteFunction` (`Hermite/Function/Basic.lean` 36), `TauCeti.hermiteHilbertBasis` (`HilbertBasis.lean` 101), `TauCeti.HeisenbergGroup` law (`Heisenberg.lean` 95). No Charlier, Bargmann, Fock or Laguerre declaration in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: SpecialFunctionsHypergeometric §6.3 (lines 852–856), AsymptoticExpansions §4.1 (line 391), LaguerreJacobi §§1.1, 2.3, 2.4, MetaplecticAutomorphicForms §0.15 (line 225), NoncompactQuantumSymmetry M2 (HeisenbergShear) on main; SpecialFunctionsGroupModels §§0.2, 1.2, 1.3, 2.4, 2.5, 3.1, 3.2, SpecialFunctionsConfluent §§1.4, 1.6, 2.4, 4.2 and ThetaKernelsForUnitaryDualPairs §3.45 at their open heads. All exist; one says less than cited (C02).
- Dependency check: `depcheck: 116 roadmaps, 1398 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 47 `sorry` warnings and the `#check` output, nothing else; no `set_option`, no sorried definition. Every theorem carries its binders in its own signature; the one `variable` block serves the copied multiplier definitions, whose types mention it.
- One-tactic probe on a copy: none of the 47 sorried theorems closes with `rfl` or bare `simp`; the ones that close after unfolding are those the file now labels as sanity checks of the definitions.
- Pull request text read against the head: 47 declarations and 47 warnings, 38 = 47 − 9 proved in the prior formalization, four Tau Ceti imports and the suppliers by section all agree; no sentence contradicted.
- Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsMotionGroupsBessel, SpecialFunctionsSU11MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsBessel, SpecialFunctionsParabolicCylinder, SpecialFunctionsAppell; nothing shared with these (SpecialFunctionsGroupModels §0.2 owns only the Haar measure of the triangular group, cited). Elsewhere: Mellin–Barnes and half-line Beta integrals, owner SpecialFunctionsHypergeometric §6.3, cited; Fock model and Bargmann transform, owner ThetaKernelsForUnitaryDualPairs §3.45, cited with this roadmap owning the one-variable normalization; Charlier polynomials, no other owner (SpecialFunctionsOrthogonalPolynomialsGeneral uses the Charlier measure at `a = 1` only as an example).

Source independence: 0 passages compared with 0 sources, since no cited text could be read; largest share Vilenkin–Klimyk Vol. 1, about 45 of 109 page locators; contents compared only through the README's own locators: Layer 1 draws on §3.4 and Layer 2 on §§5.1–5.2 in the source's order but not one to one (§5.1.1 is in Layer 0, §5.1.4 is split over 2.4 and 2.5, §§5.2.1, 5.2.3, 5.2.4 are merged in 2.6), an order the lines 2.1 → 2.3 → 2.4, 2.5 → 2.6 force; Layers 3–5 combine three other books. Not tested against the table of contents of Vilenkin–Klimyk Vol. 1.

Research link: the headline targets are the matrix-element and kernel theory of the `ax + b`, triangular, Heisenberg and oscillator groups of Vilenkin–Klimyk (1991, 1993), Miller (1968) and Wawrzyńczyk (1984), and the one-variable case of the Fock model used by ThetaKernelsForUnitaryDualPairs; they feed the Askey-scheme Charlier theory named under Downstream consumers. Rests on the README; no source was read.

## Not verifiable

- Vilenkin–Klimyk Vol. 1 (§§3.4, 5.1–5.2), cited for 0.1, 1.1–1.3, 2.1–2.6: resolves only to a paywalled publisher page.
- Vilenkin–Klimyk Vol. 2 (§12.1), cited for 3.1–3.4, 5.1: paywalled.
- Klimyk–Vilenkin, Encyclopaedia of Mathematical Sciences 59, cited for 0.1, 0.2, 1.1, 2.1, 2.3–2.5, 3.3, 4.1: paywalled.
- Miller, *Lie Theory and Special Functions*, Chapter 4, cited for 0.2, 3.1–3.4, 4.1, 5.1: no legal source found by the sources service; the author's university page was refused because its address does not name him.
- Wawrzyńczyk, Chapter 12, cited for 3.1, 3.2, 3.4, 5.1: paywalled.
- Dieudonné, CBMS 42, §17, cited for 0.1, 2.1, 2.5: the publisher's page is in no licence class; not read.
- Consequently every locator of the sampled sections 0.1–0.2, 1.1–1.3, 2.2–2.6, 3.1, 3.3, 3.4, 4.1, 5.1, and every misprint the README attributes to a source, is unchecked against the text. The README flags no locator as unverified.

Automatic checks set aside as false positives: the rule against choice in the body of a definition, raised for the `L²` multiplier representation, which is a verbatim copy of the supplier's definition and picks a representation that is unique when it exists; the rule against a section heading with no declaration under it, raised for the closing block of `#check`s that pins library names; a lead that the kernel statement of the oscillator matrix realization is declared nowhere, which is declared in this roadmap's own Lean file.

## Source issues

- none

## For the human reviewers

- **Not tested.** No cited book could be read legally, so wording and arrangement were not compared with any source; Vilenkin–Klimyk Vol. 1 has the largest share of locators (about 45 of 109), concentrated in Layers 1–2.
- **Licence.** `README.md`, "Prior formalization", says the roadmap reuses names and conventions of the author's own repository `bjbraams/lean-SFVK` (stated Apache-2.0), files `SFVK/AffineHeisenberg/*.lean`; the declarations of `Suggested.lean` appear to be taken from it.
- **Licence.** Miller's 1968 book appears to be offered on its author's university page; the sources service did not accept that address, so it was not read.
