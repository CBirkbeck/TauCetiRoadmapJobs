<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13815#issuecomment-6896355001 -->
Review (claude) of 72820b5

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) 1.5 and 1.4 give a one-measure lemma as the locator of statements deduced here

   **Location.** Line 597: "For real `a < b` prove (teschl line 4326–4332):"; line 556: "Prove the
   following characterisations (teschl line 4315–4332 and 4420–4427)."

   **Claim.** The source at those lines states the interval criterion and items (1)–(2) of 1.4.

   **Witness.** teschl line 4326–4329 is Lemma 3.15, `σ(μ_ac) = M_ac^ess` for one Borel measure;
   line 4424–4425 passes to operators through a maximal spectral measure. `M_x` plus the coordinate operator, on
   `L²[0,1] ⊕ ℓ²(ℝ)`, has no maximal spectral vector, yet 1.5 applies (`f = (1, 0)`, density `1`).

   **Exact repair.** Line 597: "For real `a < b` prove the following. They are deduced here from
   1.4(1), with no maximal spectral vector; for one Borel measure the underlying fact is teschl line
   4326–4332 (Lemma 3.15, p. 104):". Line 556: append "; the source states (3) through a maximal
   spectral measure, and (1) and (2), which assume none, are deduced here". Tested on the witness:
   1.4(1) gives `[0,1] ⊆ σ_ac` from `f = (1, 0)` although Lemma 3.15's maximal measure does not exist
   there, so the new wording matches what the route (lines 568–576, 605–607) actually proves. 1.3
   already uses this form ("is deduced here", line 522).

2. **F02** (P3) 3.1 names one pinned Green identity; its second support case uses another

   **Location.** Lines 950–952: "if `u` is `C²`, `v` is `C¹` and one of them has compact support";
   Needs, line 958; contract, lines 252–254.

   **Claim.** `TauCeti.Manifold.integral_mul_laplaceBeltrami` covers both support cases.

   **Witness.** Pinned `TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean:312`: hypothesis
   `hfc : HasCompactSupport f` on the `C¹` factor only. On `ℝ`, `v = 1`, `u` a bump: `v` has no
   compact support. The case is line 289, `integral_mul_divergence_of_hasCompactSupport_right`.

   **Exact repair.** Contract, after the `integral_mul_laplaceBeltrami` entry: "and
   `TauCeti.Manifold.integral_mul_divergence_of_hasCompactSupport_right` in the same file (`f` of
   class `C¹`, `X` a compactly supported `C¹` field), which with `X = grad u` gives the case of 3.1
   where `u` has compact support". Add the name to the Needs of 3.1. Tested on the witness: with
   `f = 1`, `X = grad u`, the second theorem gives `∫ Δu = 0 = ∫ ⟨d1, du⟩`; the first does not apply.

3. **F03** (P3) the References entry for `teschl` omits three places the text cites

   **Location.** Lines 1589–1593 (References, `teschl`).

   **Claim.** The entry lists the results of `teschl` the README cites.

   **Witness.** Line 632 cites teschl line 5056–5057 (Corollary 4.11), line 906 line 3043–3046
   ((2.68)), line 1241 line 6358–6360 (the remark on relatively compact operators before Lemma 6.22).
   `sources.toml`, entry `teschl`, `locator`, lists all three; the References entry lists none.

   **Exact repair.** In the `teschl` entry write "§2.3 (Theorems 2.12–2.13, (2.68))", insert
   "Corollary 4.11," after "Theorem 4.10," and "the remark before Lemma 6.22," after "Lemma 6.17,".
   Tested: the entry then agrees item by item with the manifest's `locator`.

Three findings, all P3; none blocking, but each carries a repair, so the verdict asks for changes.
The two declared supplier gaps `gap:weyl-criterion` and `gap:spectral-integral-resolvent` are
precise, minimal and declared in both files; they are contracts, not findings. The three findings of round 6 are
repaired. The last repair report marked nothing "not actionable", so nothing is re-raised. This is
a design review: the README, the plan and the manifest were not changed. Line numbers refer to
`packages/SchrodingerOperatorsAndSpectralTypes/design/README.md` unless another file is named.

## Previous findings, checked first

| Round 6 finding | Status | Repaired passage and what was verified |
|---|---|---|
| F01 (P2) complexification of R5c's operator had no owner | repaired | Lines 1153–1171: "UnboundedOperators UO-D06 (real unbounded spectral restriction) supplies the complexification `(L_D)_ℂ` … densely defined, closed and self-adjoint"; the eigenspace identity is "owned here"; Needs at 1191–1194 and 1257–1259; contract 317–324 and 399–401; plan prerequisites of 3.8 and 3.9 carry `UO-D06`. Main `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md` §4.7 read: domain `ι_H(dom A)+I•ι_H(dom A)`, "densely defined, closed and self-adjoint". Pins: `TauCeti.Complexification` (`TauCeti/Analysis/Normed/Module/Complexification.lean:82`, `smul_re`/`smul_im` 136, 140), `WithLp.instComplexificationInnerProductSpace` (`TauCeti/Analysis/InnerProductSpace/Complexification.lean:159`), `instComplexificationCompleteSpace` (136). |
| F02 (P3) 1.6 against the two existing Courant–Fischer statements | repaired | Lines 80–91: "1.6 is the statement for every self-adjoint operator bounded below, with values in `ℝ ∪ {+∞}` and the essential-spectrum alternative"; Check at 652–658. Main `TauCetiRoadmap/VariationalMethods/README.md` 4.4 (lines 782–808) and `Suggested.lean:163, 171` read; Mathlib `eigenvalues` and `eigenvalues_antitone` (`Mathlib/Analysis/InnerProductSpace/Spectrum.lean:277, 309`); Tau Ceti `eigenvalues_eq_iSup_iInf_re_inner` (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean:251`). |
| F03 (P3) "funnel" for the parabolic cylinder | repaired | Line 1570: "the part `y < 1` has area `∫_0^1 dy/y² = ∞`". The one remaining "funnel" (line 1339) is the hyperbolic cylinder, where it is the standard term. |

Repaired patterns searched in the rest of the text: every "Used:" or "Assumed:" sentence of the
contracts against its supplier (two remain, lines 303–304 and 352–353, both stated by the
supplier); every statement that an operator on complex functions comes from a supplier working on
real ones (3.8, 3.9 through UO-D06; K5a is stated over `RCLike 𝕜`, main
`TauCetiRoadmap/ComplexKahlerGeometry/README.md` line 1954–1955, so the first item of 3.8 is
supplied); every neighbour of an owned statement named in Scope; "funnel", "cusp".

## Verified sound

**Scope of this round.** The three repairs and every passage they changed; the fifteen seeded
targets in full (1.1, 1.3, 1.5, 1.6, 1.8, 1.9, 2.1, 2.3, 3.1, 3.3, 3.4, 3.5, 3.7, 4.2, 4.4); 1.2,
1.4, 1.7, 2.2, 3.2, 3.6, 3.8, 3.9, 3.10, 4.1, 4.3, 4.5 recomputed where a sampled target or a
repair uses them; every contract name at the pins; the open-head citations; both gaps; the six
maintainer notes; the plan (44 targets in 4 layers: 26 theorems, 17 definitions, 1 example; every
definition has at least 2 API entries and 3 tests); the manifest (21 entries, every key cited in
the README present, no key cited that the manifest lacks).

**Principles.** No route-specific shortcut (separability only in 1.4(4); every `d ≥ 1`;
disconnected, zero-dimensional and empty manifolds treated). No copied passage, no algorithm. Layers
named by their mathematics; the README does not say it follows a source. No pull-request number,
date, round label, TeX delimiter or machine path in the README (grep). Supply is one-directional
(gate below).

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 restriction, calculus, orthogonality | `diag(1,2)`, `f = (1,i)`, `g = 3·1_{{2}}`; `A = 0` on `ℂ²`, `f = h = e₁`; `ℋ = 0` | `μ_f = δ₁ + δ₂`; `g(A)f = (0,3i)`, `9δ₂` both sides (`|g|` would give `3δ₂`); `4δ₀ ≠ 2δ₀` with `⟪f,P(ℝ)h⟫ = 1`; zero measure | correct |
| 1.1 bare PVM | `1_B(2)Q + 1_B(5)(1−Q)`; `1_B(2)Q` | `(i − diag(2,5))·diag((i−2)⁻¹,(i−5)⁻¹) = 1`; value `Q ≠ 1` at `ℝ`, excluded by field `proj_univ` | correct, with the gap |
| 1.3 reduced restriction | `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0`; `U = ℋ` | `σ = {1,3}` (unrestricted `P_A` gives `{1,2,3}`); `∅`; `σ(A)`; `(z − A|_U)R_A(z)u = u` | correct |
| 1.5 three items | `a = b`, `A = 0`; `M_x` on `L²([0,1] ∪ [2,3])`; fat Cantor `K`; `M_x ⊕` coordinate operator on `ℓ²(ℝ)` | right side vacuous, `{a} ⊄ ∅`; mass of `(1,2)` is `0`, `[0,1] ⊆ σ_ac`; `K^ess` has no interval; criterion holds with no maximal vector | correct; R01 is the locator |
| 1.6 min–max, counting, form order | `diag(1,3,5)`; `M_x` on `L²[0,1]`; `ℋ = 0`; `λ = 4`; Neumann/Dirichlet on `(0,1)` | `1,3,5,+∞`; `μ_n = 0`, count `0 = 0` for `λ < 0`; `μ₁ = inf ∅ = +∞`; `dim ran P((−∞,4)) = 2 = #{1,3}`; `(n−1)²π² ≤ n²π²` | correct |
| 1.6 index dictionary (repair) | `diag(1,3,5)`, `d = 3`, `n = 0,1,2,3` | `μ_{n+1} = 1,3,5`; `λ_n = 1,3,5`; Mathlib indices `d−1−n = 2,1,0` give `1,3,5`; fourth: `+∞`, junk `0` (`dim ⊤ = 3 ≤ 3`), no index | correct |
| 1.8 definition and truncation | `x = |λ|^{−1/4}1_{[−1,1]}`; `m = ±1, 0` for `1_{[0,1]}`; `H = 0` on `ℂ` | `{h ≤ m²} = {|λ| ≥ m^{−4}}`, removed mass `2∫_0^{m^{−4}} λ^{−1/2} = 4/m²`; `1 ≤ 1`, `1 ≤ 1`, `1 ≰ 0`; `ℋ_ac = 0`, and without membership `∞ > 0` | correct |
| 1.8 Rosenblum bound, square root | rank-one `C = ⟨φ,·⟩φ`, `x = m·1_{[0,1]}`; `m = 0`; `V = diag((−1)^{n+1}/n²)` | both sides `2πm²` (no `2π`: fails); `0 ≤ 2π·0·⊤ = 0` in `ℝ≥0∞`; `Σ 1/n² = π²/6` both sides (pinned `nuclearENorm = ∑' singularValue`, `Nuclear/Basic.lean:53`) | correct |
| 1.9 Pearson | Duhamel derivative; `J = 0`; intertwining | `d/du ⟪ψ_u, Jφ_u⟫ = i⟪H₂ψ_u, Jφ_u⟫ − i⟪ψ_u, JH₁φ_u⟫ = i⟪ψ_u, Cφ_u⟫`; `W = 0` on `ℋ_ac ≠ 0`; `e^{isH₂}W(t) = W(t+s)e^{isH₁}` | correct |
| 1.9 Kato–Rosenblum | `J = 1`, `C = V`; `V = 0`, `H₁ = diag(1,2)`; `H₁ = diag(1/n²)`, `V = −H₁`; `M_x`, `2M_x` | `⟪(H₁+V)ψ,φ⟫ − ⟪ψ,H₁φ⟫ = ⟪ψ,Vφ⟫`; `W = P_ac = 0`, `Ω = 1`; `e^{−it/n²}c_n` converges iff `c = 0`; `(e^{it}−1)/(it) → 0` at norm `1`; completeness: `‖e^{itH₂}e^{−itH₁}x − y‖ = ‖x − e^{itH₁}e^{−itH₂}y‖` | correct |
| 2.1 cycle and `λ₀` | `A = 2` on `ℂ`, `γ = 1,2,3`; `ℋ = 0`; `M_x`; Gaussians `e^{−πx²/n²}` | T,T,F in all three; all true; all false; `‖u‖² = n/√2`, `‖u′‖² = π/(n√2)`, quotient `c + π/n²` | correct |
| 2.3 bound | `d > max(a/(1−b), a+b|γ|)`; `sup_{s≥γ} |s|/(s−μ)`; `A = 2, V = 1, μ = 0`; `a = 1, b = 1/2, γ = 0`; scalar `V = −(a+b|λ|)` | `a/d + b < 1` and `(a+b|γ|)/d < 1`; `max(1, |γ|/d)` (derivative `μ/(s−μ)² < 0` for `s < 0`); `(3/2)·2 = 3`; bound `−2`, true value `λ/2 − 1 ≥ −1`; `t − b|t|` increasing | correct; teschl's (6.3) misprinted, as the README says |
| 3.1 Green pairing | `v = a+ib`, `u = c+id`; circle `e^{inθ}`; `v = 1` on `ℝ` | `conj(v)Δu = aΔc + bΔd + i(aΔd − bΔc)`; `2πn² = 2πn²`, unconjugated `0`; second support case | correct; R02 is the pinned name |
| 3.3 maximal operator | `e^{−|x|}`; `χ/|x|` on `ℝ³`; `(0,1)` | `−u″ = −u + 2δ₀`; `4πδ₀`; `Δeˣ = −eˣ` | correct |
| 3.4 forms | `(0,1)`; `ℝ`; `X` discrete | `1 ∈ H¹ ∖ H¹₀` (Poincaré `‖u‖ ≤ π⁻¹‖u′‖` fails for `1`), Dirichlet `n²π²` (`n ≥ 1`), Neumann (`n ≥ 0`); `H¹ = H¹₀`; `du = 0`, `Δ_F = 0`; `𝔞(u,iv) = i𝔞(u,v)` | correct |
| 3.5 cutoffs | clamp `1/k`-Lipschitz, `η = 1/8`, `ε = 1/k`; `(0,1)`; thresholds `1/4, 3/4` | `g ≥ 7/8` where clamp `= 1`, `≤ 1/8` where `0`; gradient `≤ 2·(2/k)`; `1 ≤ (4/k)(1/2)` false for `k > 2`; `1 = ∫φ′ ≤ ½ sup|φ′|` forces `φ′ ≡ 2`, contradiction | correct |
| 3.7 vocabulary | circle; `ℝ`; point; torus `ℝ²/ℤ²`; two circles; infinite discrete `X` | `0,1,1,4,4 = μ₁..μ₅`; `λ₁⁺ = 0 = λ₁`; `+∞ = +∞`; `4π²` four times; `λ₁ = 0 ≠ 1 = λ₁⁺` (connectedness used); kernel `ℓ²(X)`, one dimension per point | correct |
| 3.8 `κ` and eigenspace identity (repair) | `u = a+ib`, `v = c+id`; `iu`; circle `μ = 1`; ONB | `conj(u)v = ac+bd + i(ad−bc)`, the pinned `inner`; `κ(iu) = −b + i•a` = pinned `smul` at `c = i`; `span_ℂ(e^{±iθ}) = span_ℂ(cos, sin)`, dimensions `2 = 2`; `⟪ιe_j, ιe_k⟫ = δ_jk` | correct |
| 3.9 route | `T = (A − is)⁻¹`; one point `s = 1`; circle `V = 1` | `T − T* = 2is·TT*`; `T = i`, `i + i⁻¹ = 0`; `1,2,2,5,5` | correct |
| 3.10 Weyl sequence | `u = e^{r/2}e^{itr}ψ((r−n)/n)` | `y²∂_y²(e^{r/2}F) = e^{r/2}(F″ − F/4)`; `‖u_n‖² = wn‖ψ‖²`; residual `−e^{r/2}e^{itr}(2itψ′/n + ψ″/n²)`; supports `[2^{j+1}, 3·2^j]`, `3·2^j < 2^{j+2}` | correct |
| 4.2 form and measure | `d = 1`, `ψ = e^{−πx²}`; `d = 0` | density `2·e^{−λ/(2π)}/(4π√λ)`, mass `(2π)^{−1}Γ(½)(2π)^{½} = 2^{−½}`; `q = 4π²·(4π√2)⁻¹ = π/√2`; `σ_ess = ∅` | correct; equals QuantumFoundations §8.2's density at `n = 1` |
| 4.3 resolvent point | scalar `s ≥ 0` | `(s+1)⁻¹(1 + (1+i)/(s−i)) = (s−i)⁻¹` | correct |
| 4.4 clauses | `V = c`; square well; `V = cos x₁`, `d = 3, 4`; teschl (6.3) at relative bound `0` | `σ = [c,∞)`; `k = 0.739`: `k tan k = 0.6737 = √(1−k²)`, `E = −0.454`; UO-E06 applies / does not; `γ − ‖V‖` | correct |

**Sources.** Read at the text this round: teschl line 2908–2920, 2955–2968, 3040–3047, 3276–3306,
3975–3995, 4310–4335, 4345–4368, 4384–4428, 4938–4948, 5030–5075, 5676–5724, 6274–6282, 6354–6361,
7080–7146, 7209–7230, 9572–9592, 10583–10621; kato57 line 12–40, 86–114; yafaev04 line 108–142,
186–210; rosenblum57 line 64–98; bms02 line 124–131, 148–158, 176–184, 240–258; hm23 line 38–48,
58–67, 102–106; kps26 line 16–54. Theorem numbers and printed pages agree: Lemma 2.24 p. 80,
Theorem 3.7 p. 96, Corollary 4.6 p. 116, Theorem 4.10 p. 119, Theorem 6.4 p. 135, Lemma 6.17
p. 145, (7.26) and Theorem 7.8 p. 168, Lemma 7.11 p. 170, Theorem 10.2 p. 222, (12.3) p. 247. Each
supports its statement with the hypotheses the README adds (the one-space `J` in Pearson; every
bounded `V` beyond Theorem 10.2's decaying class; the disconnected case beyond bms02's standing
connectedness). No locator is flagged as unverified by the author. Nothing was fetched and no
`needs-references.toml` was written.

**Pinned libraries.** Every Mathlib and Tau Ceti name of the contracts and of the Needs lines was
opened at the pins with its namespace; all exist where cited. Beyond those listed under the
repairs: Mathlib `LinearPMap.IsFormalAdjoint` (`Analysis/InnerProductSpace/LinearPMap.lean:73`),
`mem_adjoint_domain_of_exists` (163), `adjoint_apply_of_not_dense` (172), `le_adjoint` (194),
`adjoint_isClosed` (332); `IsClosable`, `closure`, `isClosable_iff_exists_closed_extension`,
`HasCore` (`Topology/Algebra/Module/LinearPMap.lean:66, 93, 132, 141`); `HaveLebesgueDecomposition`,
`singularPart`, `rnDeriv`, `mutuallySingular_singularPart`, `singularPart_add_rnDeriv`,
`eq_singularPart`, `eq_withDensity_rnDeriv` (`Lebesgue.lean:65, 73, 80, 106, 122, 404, 522`);
`MemSobolev`, `memSobolev_iff_exists_smulLeftCLM_fourier`, `MemSobolev.laplacian`
(`Sobolev.lean:153, 222, 348`); both `laplacian_eq_fourierMultiplierCLM`
(`FourierMultiplier.lean:107, 208`); `fourierTransformₗᵢ` (`LpSpace.lean:51`); `IsCompactOperator`,
`comp_clm`, `isCompactOperator_of_tendsto` (`Compact/Basic.lean:69, 271, 459`); `instLaplacian`
(`InnerProductSpace/Laplacian.lean:138`). Tau Ceti `ProjValMeasure` (`ProjValMeasure/Basic.lean:91`,
fields `diag`, `diag_finite`, `inner_proj`, `proj_univ`), `proj_mul_comm` (200),
`norm_sq_proj_apply` (275), `diag_univ` (299), `integral` (`Integral.lean:218`);
`IsRelativelyBounded` (`RelativeBound.lean:56`, with `domain_le`); `add_of_isRelativelyBounded`
(`KatoRellich.lean:118`); `IsSelfAdjoint.isFormalAdjoint` (`SelfAdjoint.lean:105`);
`riemannianVolume` (`Volume.lean:82`), its locally-finite instance (179), open-positivity
(`Support.lean:37`); `laplaceBeltrami`, `divergence` (`Laplacian.lean:238, 55`);
`integral_mul_laplaceBeltrami` (`DivergenceTheorem.lean:312`); `HyperbolicMetric`
(`Hyperbolic.lean:51`); `Wkp` (`Sobolev/Wkp/Basic.lean:145`), `W1p` (`Sobolev/W1p/Basic.lean:372`);
`IsReducing.isSelfAdjoint_restrict` (`Reducing.lean:144`); `resolvent`, `resolvent_sub_resolvent`
(`Resolvent/Basic.lean:169, 280`); the compact-resolvent equivalence (`CompactResolvent.lean:69`);
the eigenbasis theorem (`Eigenbasis.lean:113`); `nuclearENorm` and its compactness theorem
(`Nuclear/Basic.lean:53, 153`); `hilbertSchmidtEnergy`, `hilbertSchmidtEnergy_indep`
(`HilbertSchmidt/Basic.lean:89, 150`); the Hilbert–Schmidt compactness theorem (`Columns.lean:257`).
The lead of `citations.md` (`CompactFormPair.eigenvalue_eq_rayleighMinMax` found nowhere at the
pins) is no defect: the name is VariationalMethods', declared in main
`TauCetiRoadmap/VariationalMethods/Suggested.lean:171` and attributed to it at line 81.

**Suppliers, resolved now.** Main is at the commit the round-6 review resolved against (`1a19c9f`),
so its resolutions of the sections on main stand; reread this round: UnboundedOperators §4.7
(UO-D06), §5.6 (UO-E05: the graph closure from `C_c^∞(0,1)` has domain `H₀²`, as 3.2's Check says),
§5.7 (UO-E06); VariationalMethods 4.4 and 5.1; ComplexKahlerGeometry 5.7 (K5a, over `RCLike 𝕜`).
Open heads, reread: QuantumFoundations §8.2 (every `n ≥ 1`, `m > 0`, cores, intertwining
`M_(4π²|ξ|²/(2m))`, the density quoted in 4.2's Check) and §9.5 (Coulomb through UO-E06);
CongruenceSpectralGap §0.2 (`N′ = 3N`, Gaffney's cutoff argument on `Γ(N′)\ℍ`, kernel the
constants) and §0.6; AutomorphicSpectralTheory §1.16a and §§4.1–4.4; MaassForms §0.1. No cited
section is missing where it is cited.

**Declared gaps.** `gap:weyl-criterion` (UnboundedOperators UO-C02): the `needs` sentence is
teschl line 6277–6281 with its hypotheses; UO-C02 on main states no such item; same slug in the
plan (`neededBy` 3.10b) and at lines 332–337. `gap:spectral-integral-resolvent` (UO-A02): one
statement with its hypotheses, not provided on main; same slug in the plan (`neededBy` 1.1) and at
lines 339–344. Both name a supplier and a section; neither is vague, compound or already
provided. Remark needing no change: the one direction 3.10 uses also follows in three lines from
UO-C02's finite-rank-window item, so the package is not exposed if the supplier words the item
differently.

**Maintainer notes** (none holds at this head).

1. Not held: lines 121–128 give UO-E06 only `L² + L^∞` on `ℝ³` and send Coulomb to QuantumFoundations §9.5; lines 138–139 put `L^p` and the Kato class outside the roadmap.
2. Not held: lines 76–79 and 316–317 say UO-C03 gives self-adjointness with a finite control measure and 1.3 with SA-C19 in general.
3. Not held: every mention of Weyl's criterion carries `gap:weyl-criterion` (lines 67–68, 332–337, 1314–1317, 1363).
4. Not held: lines 1454–1462 state the passage from `(H₀ + 1)⁻¹` to `(H₀ − i)⁻¹`, with the identity recomputed above.
5. Not held: the last item of 1.1 (lines 449–456) with `gap:spectral-integral-resolvent`.
6. Not held: the contract lists SA-C86 and SA-E30 (lines 294–301), as the plan does.

The closing instruction is met at lines 1499–1502 (4.4 names UO-E06 as its three-dimensional case).
The ownership decisions of the notes are respected and were not reopened.

**Duplication and overlap.** By object, with `roadmaps grep` over main and the open heads:
Kato–Rosenblum, Pearson, maximal spectral vectors, essential closure, standard cusp ends: no other
text. Wave operators: only the Haag–Ruelle ones of RelativisticQuantumFieldTheory, a different
object. Essential self-adjointness of a Laplacian: CongruenceSpectralGap §0.2 and
AutomorphicSpectralTheory §1.16a (both cited as instances), UnboundedOperators (cited). Min–max:
VariationalMethods 4.4 and the Tau Ceti finite-dimensional theorem (both now named in Scope).
`overlaps.md` reports no pull request changing this roadmap, no dropped id, no revision-only id
and no second copy; the open SelfAdjointSpectralTheory revision drops none of the cited ids.

Overlap check: read UnboundedOperators, VariationalMethods, SelfAdjointSpectralTheory (main and its open revision), CongruenceSpectralGap, QuantumFoundations, AutomorphicSpectralTheory, RelativisticQuantumFieldTheory; shared: pp/ac/sc subspaces — UnboundedOperators UO-C03; essential spectrum — UnboundedOperators UO-C02; complexified real operator — UnboundedOperators UO-D06; `L² + L^∞` potentials on `ℝ³` — UnboundedOperators UO-E06; free Hamiltonian — QuantumFoundations §8.2; congruence Laplacians — CongruenceSpectralGap §0.2 and AutomorphicSpectralTheory §1.16a; Courant–Fischer for compact form pairs — VariationalMethods 4.4; form-bound criterion — SelfAdjointSpectralTheory; each cited, none owned twice.

**Supplier-order gate.** Output of the prescribed command:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2234 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every Needs line of the sampled targets was read against its statement
and route; the one missing name is R02.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, four layers each
ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Every
definition has API bullets and at least three Checks; every theorem its hypotheses and a locator.
Layers 1 and 2, and 3 and 4, are mutually independent, so no source's order is imposed. A design
has no `Suggested.lean`: headline statability, padding, binders and imports are package-stage
checks; the README attributes no backticked Lean name to this roadmap.

Source independence: 32 passages compared with 7 sources (teschl, kato57, yafaev04, rosenblum57, bms02, hm23, kps26), none shared beyond standard names, formulas and forced hypothesis lists; largest share teschl, 35 of 92 locators; contents compared with teschl: independent (Layer 1 draws on its Chapters 2, 3, 4 and 12 and on kato57, Layer 2 on Chapter 6, Layer 3 on none, Layer 4 on Chapters 7 and 10).

## Not verifiable

- Elaboration: not available (this lane does not elaborate). No Lean command was run.
- The thirteen settled uncertified texts (`strichartz83`, `chernoff73`, `kato76`, `cfks87`,
  `gaffney54`, `rs1`, `rs2`, `rs3`, `grigoryan09`, `chavel84`, `iwaniec02`, `lp76`, `pearson78`)
  were not read. Of the sampled targets, 3.1 and 3.4 (`grigoryan09` Ch. 4) and 3.5 (`gaffney54`,
  `grigoryan09` Ch. 11) rest on those locators alone; their statements were checked by computation
  and against the pinned Green identities, bms02 and RiemannianGeometry R7.8.
- `lp80` was not reread this round (3.10 is outside the sample); round 6 read line 247–302.
- Published numbering of the arXiv copies of `bms02`, `hm23`, `kps26`, `yafaev04` was not compared
  with the journal versions.
- Ownership against open pull requests was checked by object with `roadmaps grep` and by reading
  the seven roadmaps of the Overlap line; the other open heads were searched, not read.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135: the source says the second entry of the maximum is the ambient coefficient over the relative coefficient minus one; it should be over one minus the relative coefficient; affects a stated result.
- **Misprint** in teschl at Theorem 6.4, proof, last line, printed page 135: the source says the admissible shift lies below the same quotient with denominator the relative coefficient minus one; it should have one minus the relative coefficient and a negative sign; affects the proof.

## For the human reviewers

- **Licence.** `teschl` is read from the author's online edition of an AMS book; 35 of 92 locators point into it. The wording and arrangement checks found nothing shared (`sources.toml`, entry `teschl`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "72820b5dcd40adf512d7dae7a0fd83f587b60036", "job": "REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~7", "model": "fable", "worker": "chris-x83"} -->
