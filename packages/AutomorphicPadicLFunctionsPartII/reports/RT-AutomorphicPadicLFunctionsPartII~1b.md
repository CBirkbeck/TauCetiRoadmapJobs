<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1015#issuecomment-6397723513 -->
Red team round 1 pass b (claude) of aea0e21

Verdict: needs_changes

1. **F01** (P1) The class sign ε(d,β) is refuted at d=1, β=0 by the roadmap's own current

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:661` ("EK^(β,a)_Γ(h,x)=ε(d,β)·a!·Σ h(−t)E^(β,a+1)(t+x,0;Λ,Γ) … ε(d,β)=(-1)^(d(d−1)/2+|β|+1)"), `:667` ("the contraction and symmetric-degree signs multiply the printed formula by (-1)^(|β|+1)"), `:671` ("At d=1, β=0 the proposed corrected coefficient is −a!"); propagated at `:1016`, `:1080`, `:1156`, `:1184–1185`, `:1205`, `:1212–1213`, `:1227`, `:1245`.

   **Claim.** §4.3 asserts that for d=1, Γ=1, β=0 the critical coordinate is e_(0,a) = −a!·Σ_t h(−t)E^(0,a+1)(t+x,0), the opposite of KS-v4 Theorem 3.27, and §8.5 carries this ε(d,β) into the interpolation formula.

   **Witness (instance d=1, Γ=1, a=β=0, square lattice, computed from §3.3 and §3.5 as written).** §3.5 fixes vol(A)=−2i, C=−π and ι_v vol=+π ℓ̄ dz (its own Check at `README.md:581`), and Φ^(0,0)_s=(−1)^0 Γ(s) Σ_t h(t) Σ_{ℓ≠0} χ_ℓ(z−t)(π|ℓ|²)^(−s) ι_v vol. At s=b+j+1=1 this is Φ^(0)=Σ_t h(t)·G(z−t)·dz with G(u)=Σ_{ℓ≠0} ℓ̄ e^{2πi⟨ℓ,u⟩}/|ℓ|². Since ∂_ū e^{2πi⟨ℓ,u⟩}=πℓ e^{2πi⟨ℓ,u⟩} (⟨ℓ,u⟩=Im(ℓū)), one has ∂_ū G=π(Σ_{ℓ∈Λ*}e^{2πi⟨ℓ,u⟩}−1)=π(Σ_λ δ_λ−1) by Poisson summation with covolume 1, which equals ∂_ū of the continued E^(0,1)(u,0)=Σ′1/(u+λ) (∂_ū(1/u)=πδ₀, constant term −π). G−E^(0,1) is antiholomorphic, periodic and odd, hence 0. So Φ^(0)|_U=+Σ_t h(t)E^(0,1)(z−t,0)dz, with residue +h(t) at t; this is exactly what §3.6's equation ∇″Φ=δ_h·vol requires (with §3.2's sign, (∂̄Φ)(g)=−Φ(∂̄g)=2πi Σ_t h(t)g(t)=(δ_h vol)(g) because C·(−2i)=2πi). For d=1, Γ=1 the cap is the identity (§2.2 Check) and mom_0 is the augmentation, so e_(0,0)(h,x)=Φ^(0)(x)/dz=+Σ_t h(−t)E^(0,1)(t+x,0): the sign +1 of KS-v4 line 2102, not ε(1,0)=−1. The roadmap's three sections 3.5, 3.6 and 4.3 therefore contradict each other on this instance.

   **Cause.** The roadmap's corrected top contraction (−1)^(d(d+1)/2)d!C (verified below at d=1,2) differs from KS-v4 Lemma 3.16(3), −(−1)^(d(d−1)/2)d!C, by (−1)^(d−1), not by −1; §4.3 multiplied Theorem 3.27 by the uniform −1 that corrects Lemma 3.16(2), which Proposition 3.23 does not use.

   **Repair.** In §4.3 replace ε(d,β)=(-1)^(d(d−1)/2+|β|+1) by ε(d,β)=(-1)^(d(d+1)/2+|β|+1) (equivalently (−1)^(d(d−1)/2+|β|+d+1)), and at `:667` replace "(-1)^(|β|+1)" by "(-1)^(|β|+d+1)". Recompute every instance: `:671` → "At d=1, β=0 the coefficient is +a!, and at β=1 it is −a!"; `:672` (d=2, β=0: +a!) is unchanged; `:1016` → "ε(1,0)=+1 … At β=1 the sign is ε(1,1)=−1"; `:1080` → the d=1, β=0 combination is +(Av+Bw)=+31; `:1184` → "ε(1,0)=+1 … the constructed normalized moment and εδ_cU both equal −2352U"; `:1185` → raw signed multiplier −188160, translated −62720/27, twist value −82/81; `:1205` → "M(χ)=+Ω_p⁴U, so δ_(7)(χ)M(χ)=−2352Ω_p⁴U"; `:1213` → the new ε; `:1227` → "ε(1,0)=+1, so the unsmoothed normalized moment is +U … gives −2352U"; the second sentence of `:1227` → "For d=1, β=1 the sign is −1, whereas for d=2, β=0 it is +1"; `:1245` → "Here ε(1,1)=−1". Add the d=1, Γ=1, a=β=0 computation above as a Check of §4.3 (it is the instance that pins the sign). The general formula follows from the roadmap's own corrected contraction coefficient inserted into the chain of KS-v4 Proposition 3.23; the repair worker should recompute ε at (d,β)=(1,1) and (2,0) along that chain before relying on it beyond the instance proved here.

2. **F02** (P2) The scope paragraph makes NonordinaryCMSpecialValues a supplier edge to a later roadmap

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:18` ("NonordinaryCMSpecialValues owns the independent inert-prime CM central-value direction").

   **Claim.** The sentence is an ownership ("supplied by") citation of NonordinaryCMSpecialValues, which is at position 213 of `merge-order/ORDER.txt`, after this roadmap (202), is not in the brief's list of permitted suppliers, exists neither on main nor in an open pull request, and is named by this README itself as a downstream consumer (`README.md:1241`).

   **Witness.** The dependency check on the package README prints "moved: AutomorphicPadicLFunctionsPartII moved in the merge order from #201 to #212, right after its last supplier NonordinaryCMSpecialValues" with 588 edges; on a scratch copy in which only the sentence at line 18 is reworded, it prints "depcheck: 51 roadmaps, 587 edges, 0 problem(s)" and no `moved:` line. Submitting as is would place this roadmap after its own consumer.

   **Repair.** Replace the sentence at line 18 by: "The independent inert-prime CM central-value direction is outside this roadmap; nothing here is supplied by it." Keep the Downstream consumers paragraph (it creates no edge).

3. **F03** (P3) §2.6's statement refers to §3.5 and §3.6, which depend on §2.6

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:431` ("Its analytic image is the cohomology class of the residue-normalized solution of ∇φ=δ_h·vol identified in §3.6; the explicit representative is constructed in §3.5").

   **Claim.** A Layer 2 target states part of its conclusion in terms of two Layer 3 targets, while §3.6's *Needs* line (`README.md:602`) lists §2.6: a prose-level cycle (defect class 11).

   **Witness.** `README.md:602`: "*Needs:* §3.5; §1.3; §2.6."

   **Repair.** Delete the quoted sentence from §2.6; §3.6 already states "Its flat universal-extension image represents the equivariant de Rham polylogarithm", which is the analytic half of the comparison.

4. **F04** (P3) The two PeriodsAndSpecialValues gaps are cited without their gap slugs

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:862` ("*Needs:* §5.8; PeriodsAndSpecialValues PS.0; PeriodsAndSpecialValues PS.1.") and `:870` (Layer 5 Dependencies).

   **Claim.** Every other declared gap is cited as "<Supplier> <section> (gap:<slug>)"; these two are cited as if PS.0 and PS.1 already supplied Hecke motives and the CM c⁺ formula, although the contracts (`README.md:116` and `:118`) and `design/plan.json` declare them as gaps hecke-motive-periods and critical-cm-deligne-period.

   **Witness.** `design/plan.json` gaps list: slugs `hecke-motive-periods` (PS.0) and `critical-cm-deligne-period` (PS.1).

   **Repair.** At `:862` and `:870` write "PeriodsAndSpecialValues PS.0 (gap:hecke-motive-periods); PeriodsAndSpecialValues PS.1 (gap:critical-cm-deligne-period)".

5. **F05** (P3) "Part II" of a roadmap that does not exist, with no statement of the boundary

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:1` (title "part II") and the Scope paragraph `:7–8`.

   **Claim.** A Part II roadmap's introduction says where the base roadmap stops; no roadmap AutomorphicPadicLFunctions exists on main, among the 362 open roadmap pull requests (`roadmaps list`), or in `merge-order/ORDER.txt`, and the README is silent about this.

   **Witness.** `roadmaps list` has no entry for AutomorphicPadicLFunctions; `ORDER.txt` lines 27 and 96 are AutomorphicLFunctionsAndLocalFactors(PartII), a different roadmap.

   **Repair.** Add to the Scope paragraph, after the first sentence: "There is no base roadmap AutomorphicPadicLFunctions on main or among the open roadmaps; this roadmap is self-contained and imports only the suppliers named below."

## Verified sound

**Dependency check (run on the package README, unedited):**

```
moved: AutomorphicPadicLFunctionsPartII moved in the merge order from #201 to #212, right after its last supplier NonordinaryCMSpecialValues; checked as moved (the worker moves it there when it submits)
depcheck: 51 roadmaps, 588 edges, 0 problem(s)
```

No UPWARD or CYCLE line; the `moved:` line is R02.

**Suggested.lean (4 declarations read, elaborated types in the worker's signatures file compared with §§3.3–3.4; no Lean was run here).**

| Declaration | Instances tried | Values on each side | Result |
|---|---|---|---|
| `hermitianPairing` | h=1, z=1/2, w=i/2; h=2, z=w=1 | H(z,w)=−i/4, H(w,z)=i/4; H(1,1)=2 | linear in the first variable, alternating part as in §3.3 |
| `kroneckerTerm` | d=1, ν=1, z+l=i; l=−z; d=2, ν=(0,1), z+l=(1,0); h=0 | numerator −i; term 0 by the branch; numerator 0; log 0=0 would give denominator 1, excluded by hh | matches §3.3 Checks |
| `kronecker_meromorphic_continuation` | Mellin split of θ at t=1; ν=0, z∈Λ; ν≠0; s=−n | M has poles only at 0 (residue −e^{−2πi⟨z,w⟩}) and d (residue 1/vol); K=π^sM/Γ(s) regular at 0 and at −n, pole only at d, none for ν≠0; half-plane Re s>d+|ν|/2 is where ‖λ‖^{|ν|−2Re s} is summable (rank 2d) | statement true as typed |
| `kronecker_functional_equation` | Poisson with ⟨x,ξ⟩=Re H(x,iξ), m=iℓ, ℓ=−μ; FT of x̄^ν e^{−πt‖x‖²}: factor (−ξ̄_i/t)^{ν_i}, h_i cancel; applied twice | θ^ν(z,w,t,Λ)=e^{2πi⟨w,z⟩}/vol_H(Λ)·t^{−d−|ν|}θ^ν(w,z,1/t,Λ*); vol_H=∏h_i·covol_Leb; Res_{s=d}K=π^d/(Γ(d)vol_H) when ν=0, w∈Λ*; double application gives identity via ⟨z,w⟩=−⟨w,z⟩ and vol(Λ*)=1/vol(Λ) | phase order, volume, residue, exclusions correct |
| Λd hypothesis, square and rectangular examples | Λ=ℤ[i], h=2; Λ=2ℤ+iℤ, h=1 | Λ^∨=Λ*=½ℤ[i], metric covolumes 2 and 1/2; Λ^∨=½ℤ+iℤ, Λ*=ℤ+(i/2)ℤ, Im H(1/2,i)=−1/2 | README §3.4 Checks correct |

Neither theorem is padding; both definitions have real bodies and are needed by the statements. The module docstring names the eight not-statable headlines with the missing carriers. No `set_option`, no `lemma`, no sorry'd data, single `import Mathlib`.

**Targets read: 44 (all of §§0.1–8.5). Checks tested with computed values: 47.** Instances (values on each side): §0.1 μ=(−2,1) → a=1, β=1, unit weight at i is i≠1; quartic X⁴−2X²+2, |√(1+i)|²=√2, √2∉L since N(1−i)=2 is not a square; §0.2 γ=i gives −i on both cotangent lines; §0.3 ζ₆³=−1 in R, =1 in R/(2); §1.1 (2,−1,−1) trace 0, (Nc′−1)·0=0, restriction off e gives −2; §2.2 Hom(ℤ,M)→Hom(mℤ,M) is ·m, monodromy −1 gives H⁰=0, H¹=ℤ/2; §3.1 real dimension 3d−1=5 at d=2; §3.2 sign (−1)^{N−k} with N=2,k=1 is −1; §3.3 translation multiplier exp(−2πi⟨1,i/2⟩)=−1, K(0)=−1 for ℤ[i]; §3.5 ι_v(dz∧dz̄)=−v dz, C=−π for the square lattice, d=2 top contraction C v₁v₂(u₂−u₁)∧dz₁∧dz₂=−2C v₁v₂u₁∧dz₁∧dz₂ (recomputed directly), d=3 coefficient +6C consistent with (−1)^{d(d+1)/2}d!; §4.1 μ₄-orbit multiplicity 4; §4.2 Γ(a+1)=a!, Jacobian 2 at d=2; §5.1 different (2i), Tr(1/2)=1, Tr(i·(−i/2))=1; §5.2 2v/Ω³ and (2πi)v/(Ω²Ω∨); §5.3 χ=N^m gives ζ_L(s−m); §5.7 80·(49−2401)=−188160, (80/81)(−48/49)=−1280/1323; §6.1 5=(2+i)(2−i), 3 inert, i↦3 mod 5 gives 2+i connected and 2−i étale; §6.3 curve 49a1: Δ=−343, j=−3375, #E(𝔽₂)=2, X²−X+2≡X(X−1) mod 2, 24·8−192=0; §7.3 ℤ/4→ℤ/2 transform (1/2,0,1/2,0); §7.4 −(2·5+3·7)=−31; §8.1 (ζ₃²−ζ₃)/3=−i/√3; §8.2 7−1/2=13/2, 2·3≡1 mod 5; §8.3 U_f=1 for f=(3) in ℤ[i], δ_c(χ)=49−2401=−2352, (2+i)⁴=−7+24i, factors (12−24i)/5 and (632−24i)/625, 188160/81=62720/27, (−1/81)(−82)=82/81, Amice transform 2T−T²+T³−…, weight t⁻¹ gives δ₁+δ₋₁; §8.4 p⁻¹Σδ_g on the identity indicator is 1/p; §8.5 (3,1) unit weight i^{−3}(−i)=1, multiplier 1/4. All agree with the README except the ε-dependent values listed in R01.

**Locators.** Mathlib and Tau Ceti: 19 declarations opened at the pins (`CMField.lean:69`, `DirichletTheorem.lean:373` and `:415`, `ZLattice/Summable.lean:236`, `ZLattice/Basic.lean:433`, `Measure/Basic.lean:40`, `:97`, `:105`, `Measure/Monoid.lean:115`, `AmiceTransform.lean:157`, `Gaussian/FourierTransform.lean:352`, `MellinTransform.lean:90`, `Gamma/Basic.lean:319` and `:344`, `ZLattice/Covolume.lean:72` and `:98–99`; `Comodule/MonoidAlgebra/Basic.lean:416` and `:568`, `HeckeCharacter/Algebraic.lean:60`, `HeckeCharacter/Shift.lean:273`); all exist with the stated content and hypotheses (`amiceTransformEquiv` is ℤ_p/ℤ_p only, `covolume_pos` needs the full discrete lattice, `IsCMField` bundles total complexity and quadraticity). KS-v4: 61 cited lines checked; each lands on the cited definition, proposition, theorem, equation or proof step, and the page numbers agree with the page markers (e.g. Theorem 3.27 at line 2094 on p.44, Theorem 5.27 at line 3392 on p.74, Definition 5.26 at line 3373 on p.73). BKO-2021 line 70 is p.944, the inert/supersingular sentence at lines 71–73.

**Supplier citations resolved (16 roadmaps, 58 sections):** GlobalNumberFields Layers 2, 7, 9, 10 (main, lines 273, 453, 502, 525); ClassFieldTheory Layers 7, 11, 12, 13 (main, lines 1312, 1683, 1724, 1799); ThetaSeries 1A, 1E, 1F, 2A, 2C (main, lines 432, 473, 476, 489, 507; 2A gives `IsZLattice ℝ L^∨` and biduality, 2C the inverse covolume); SchemeAndStackFoundations §§2.6, 2.7, 2.19, 2.20, 2.23 (main; §2.23 has the two spectral sequences and cites Kings–Sprang Appendix A.1); AlgebraicTopology Stage 5 items 3–4, Stage 6, Stage 8 items 5, 7, 8 (main); DifferentialGeometry Layers 0, 1, 5 (main); Hyperfunctions HF2.AnalyticPreparation.CurrentResolution (main, line 251; the (−1)^p transport and sign-free regularization are stated there); PadicMeasuresIwasawaAlgebras §§0.1, 1.2, 1.7, 2.1, 2.2, 3.1 (main; §2.1 has `map_weight`, the projection formula); AbelianSchemesAndArithmeticModuliPartII P0.1–P0.6, P1.1, P2.1–P2.8, P3.2–P3.4, P4.1–P4.3 at its head (P2.2's ranks 3 and 6 and P2.3's noetherian base match the README); ComplexMultiplicationAndExplicitReciprocity §1.3 and `cmHodgeEigenspaces` at its head; ComplexComparisonPartII C1.1, C5.1, C5.4 at its head; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.7, R07.1.9, R07.1.13 at its head; AutomorphicLFunctionsAndLocalFactors AL.0 "Local Schwartz–Bruhat spaces and finite Fourier levels", AL.1 "Local epsilon factors and Gauss sums", "Global distributions and completed Euler products", "Rank-one specialisation and Hecke comparison" at its head; PeriodsAndSpecialValues PS.0, PS.1 at its head. All twelve declared gaps have the same slug, supplier and section in `design/plan.json` and the README contracts, each supplier section exists, each `needs` sentence is specific, and none asks for what the pins provide.

**Within-roadmap order.** Every *Needs* line cites only earlier sections (the one prose exception is R03). The README's four backticked own names are exactly the four Lean declarations; no `lemma`, no pull-request number, no process narrative in README or Lean. The package diff touches only its folder.

**Ownership.** `roadmaps grep` over main and the indexed open heads for Eisenstein–Kronecker classes, Epstein zeta, critical Hecke values and Katz measures finds no other owner of the generalized Kronecker series, the CM current, the Eisenstein measure or the ray-class desmoothing; the only nearby object is `epsteinZeta` in the open roadmap LFunctions, a number-field ideal lattice with `mixedInner`, which is neither on main nor in the merge order and is a different carrier.

## Not verifiable

- `design/plan.json` node prerequisites still cite `AutomorphicPadicLFunctions:L0/...` and `L3/...` (a roadmap that exists nowhere); the brief freezes plan.json nodes after the design, and the README replaced these by gaps, so this is recorded here rather than as a finding.
- Complex-conjugation bars are lost in the KS-v4 text extraction (Proposition 4.6, Theorem 5.23, Definition 5.24, Definition 5.26, the q-pairing of Theorem 3.27); the README's conjugation placements are internally consistent but could not be checked against the source text.
- The general-d corrected sign proposed in R01 is derived from the roadmap's own corrected contraction coefficient and KS-v4's Proposition 3.23 chain; only the instance (d,β,a)=(1,0,0) and the contraction coefficients at d=1,2 were computed independently here. The Borel-torus orientation and cap step at d≥2 were not recomputed.
- Ownership against open pull requests whose files the brief does not provide was checked only through `roadmaps grep`, not by reading those roadmaps.
- No Lean was elaborated in this pass; the worker's signatures file was used for the elaborated types.

## Source issues

- **Misprint** in KS-v4 at Proposition 3.13, p.35 (line 1525): the functional equation's phase is written with the pair (z,w) in one order; the theta transformation in its own proof (line 1536) and a direct Poisson computation give the opposite order; it should be exp(2πi⟨w,z⟩) with ⟨w,z⟩=Im H(w,z); affects a stated result.
- **Error** in KS-v4 at Proposition 3.13, p.35 (lines 1521–1523): the residues at s=0 and s=d are attributed to the uncompleted series; they are the residues of π^{−s}Γ(s)K, so K is regular at 0 and has residue π^d/(Γ(d)vol_H(Λ)) at d; affects a stated result.
- **Error** in KS-v4 at Lemma 3.16(2), p.37 (lines 1615–1622): the coefficient is given as (−1)^j j!(2πi)^d/vol(A); direct computation (j=0: ι(dz_i∧dz̄_i)=−(l̄_i/r_i)dz_i, as the proof itself states; j=1, d=2) gives (−1)^{j+1} j!(2πi)^d/vol(A); affects a stated result and the display of Proposition 3.17.
- **Error** in KS-v4 at Lemma 3.16(3), p.37 (lines 1644–1659, 1680–1682): the proof replaces (−1)^{d−1} by −1; with (2) corrected the top contraction is (−1)^{d(d+1)/2}d!(2πi)^d/vol(A), so the printed sign is right for odd d and wrong for even d; affects the proof of Proposition 3.23 for even d.
- **Error** in KS-v4 at Definition 3.15 and the proof of Theorem 3.20, pp.37 and 41 (lines 1600–1608, 1866–1875): the binomial expansion of (c+l̃)^{−(j+1)} omits (−1)^b, so the current of Definition 3.15 solves (3.5.1) only after the prefactor becomes (−1)^{j+b}; affects a stated result (Theorem 3.20 for b≥1 and the sign (−1)^{|β|} in Theorems 3.27 and 5.27).
- **Error** in KS-v4 at Proposition 3.17, display (3.4.2), p.38 (lines 1717–1727): the smooth representative on U_D carries the sign of Lemma 3.16(2) and of Definition 3.15; the current actually defined has the factor (−1)^{b+1} relative to the display; affects a stated result (the display only; Proposition 3.23's sign at d=1, b=0 is correct).
- **Error** in KS-v4 at Corollary 4.15, p.54 (lines 2559–2562): the ratio L_f(χ,0)/c⁺ is asserted to lie in the multiplicative group of the algebraic numbers; the L-value may vanish, so it lies in the algebraic numbers; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "aea0e21c879dd05f0bff04aee61711948d61a00b", "job": "RT-AutomorphicPadicLFunctionsPartII~1b", "model": "fable", "worker": "chris-h"} -->
