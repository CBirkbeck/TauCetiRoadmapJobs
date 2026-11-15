<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13815#issuecomment-6897422472 -->
Review (claude) of 13b85d4

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) the `teschl` entry puts equation (2.68) in §2.3; it is in §2.4

   **Location.** Line 1604 (References, `teschl`): "§2.3 (Theorems 2.12–2.13, (2.68))"; the same
   words in `packages/SchrodingerOperatorsAndSpectralTypes/sources.toml`, entry `teschl`, `locator`.

   **Claim.** The resolvent convention (2.68), cited in 2.3 (line 917), is in §2.3 of the source.

   **Witness.** teschl line 3029 is the heading "2.4. Resolvents and spectra" (running head, p. 73,
   at line 3002); (2.68) is at line 3043–3046, after it. §2.3 (quadratic forms, Friedrichs) runs from
   line 2761 and holds Theorems 2.12 (line 2914) and 2.13 (line 2960) only.

   **Exact repair.** In both places write "§2.3 (Theorems 2.12–2.13), §2.4 ((2.68))". Tested on the
   witness: line 3046 lies between the §2.4 heading (3029) and the §2.5 heading (3242). This is the
   pattern of the round-7 correction for Lemma 3.15 (§3.2, not §3.3); the other items of the entry
   were rechecked against the headings (Lemma 3.16 line 4354, (3.83) line 4390, Lemma 3.19 line 4391,
   all after the §3.3 heading at 4346; (3.79) and Lemma 3.15, line 4319 and 4326, before it).

2. **F02** (P3) 1.7's last claim uses 1.3, which its *Needs:* line omits

   **Location.** Lines 688–691: "`Ω_±(ℋ_ac(H₁)) ⊆ ℋ_ac(H₂)` (the intertwined part of `H₂` is
   unitarily equivalent to the absolutely continuous part of `H₁`, by 1.1's transport law). *Needs:*
   1.1; SelfAdjointSpectralTheory SA-E26–SA-E30; UnboundedOperators UO-C03."

   **Claim.** 1.1, SA-E26–SA-E30 and UO-C03 suffice for the stated route.

   **Witness.** 1.1's transport law (lines 455–456) compares the spectral measures of `A` and
   `U A U⁻¹` on whole spaces. Here `A = H₁|_{ℋ_ac(H₁)}` and `A′ = H₂|_{Ω ℋ_ac(H₁)}`; passing from
   `μ^{A′}_{Ωx}` to `μ^{H₂}_{Ωx}` is 1.3 (line 527, `μ^{A|_U}_u = μ^A_u`). The plan's 1.7b lists
   `target:1.1` only.

   **Exact repair.** Line 690: "*Needs:* 1.1, 1.3; …"; in `design/plan.json`, target 1.7b, add
   `"target:1.3"` to `prerequisites`. 1.3 needs only 1.1, so no cycle arises. Tested: for
   `H₁ = H₂ = M_x ⊕ diag(5)` on `L²[0,1] ⊕ ℂ`, `Ω = 1`, `x = (1, 0)`: 1.3 gives
   `μ^{H₂|_{ℋ_ac}}_x = μ^{H₂}_x = Leb|[0,1]`, absolutely continuous; without 1.3 the route only
   knows the measure of the restricted operator.

3. **F03** (P3) the closing section does not name the owner on main of the cusp and collar theorem

   **Location.** Lines 1593–1594: "It needs the thick–thin decomposition of a finite-area surface
   into a compact core and finitely many standard cusp ends (through RiemannianGeometry R4's
   Killing–Hopf classification and FuchsianOrbifolds)".

   **Claim.** The thick–thin decomposition with cusp coordinates has no owner yet.

   **Witness.** Main `TauCetiRoadmap/ComplexCurveModuli/README.md` line 150 (D6, item 2): it owns
   "standard cusp/geodesic collar coordinates and the collar-width formula"; line 234: "the required
   thick/collar/cusp theorem is owned in D6".

   **Exact repair.** Line 1594: "(ComplexCurveModuli D6 owns the cusp and collar coordinates of
   finite-area hyperbolic surfaces; RiemannianGeometry R4's Killing–Hopf classification and
   FuchsianOrbifolds supply the uniformisation)". 3.10 needs no change: its "standard cusp end" is a
   hypothesis on a given Riemannian surface (an isometry onto `(ℝ/wℤ) × (a, ∞)`) and constructs no
   end, so nothing of D6 is restated; the package stage may add ComplexCurveModuli D6 to the Scope
   list in one clause to that effect.

Three findings, all P3; no P1 or P2. Each carries a repair, so the verdict asks for changes; the
two declared supplier gaps `gap:weyl-criterion` and `gap:spectral-integral-resolvent` are precise,
minimal and declared in both files, and are not findings. The three findings of round 7 are repaired. The last repair
report marked nothing "not actionable", so nothing is re-raised. This is a design review: the
README, the plan and the manifest were not changed. Line numbers refer to
`packages/SchrodingerOperatorsAndSpectralTypes/design/README.md` unless another file is named.

## Previous findings, checked first

| Round 7 finding | Status | Repaired passage and what was verified |
|---|---|---|
| F01 (P3) one-measure lemma as locator of 1.4(1)–(2) and 1.5 | repaired | Lines 564–565: "the source states (3) through a maximal spectral measure, and (1) and (2), which assume none, are deduced here"; lines 606–608: "deduced here from 1.4 by the route below, with no maximal spectral vector; for one Borel measure the underlying fact is teschl line 4326–4332 (Lemma 3.15, p. 104)"; Conventions lines 149–151. Read: teschl line 1780 (separability assumed), 4326–4332 (Lemma 3.15, one measure), 4424–4425 (operators through a maximal measure). The plan's 1.4d and 1.5 locators carry the same notes. |
| F02 (P3) second Green identity not named | repaired | Lines 255–262 and 969–972. Pins opened: `TauCeti.Manifold.integral_mul_divergence_of_hasCompactSupport_right` (`TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean:289`; `hf` of class `C¹`, `hX` of class `C¹`, `hXc` compact support of `X`), `integral_mul_laplaceBeltrami` (line 312, `hfc` on `f`), `contMDiff_mgradient` (`Gradient/Basic.lean:254`, namespace `TauCeti.Manifold`, needs `IsManifold I (n+1) M`), `HasCompactSupport.mgradient` (line 116, a `_root_` name). The plan's 3.1b lists all four. |
| F03 (P3) References entry for `teschl` incomplete | repaired, with a slip left in it | Lines 1602–1607 list (2.68), Corollary 4.11, the remark before Lemma 6.22 and §1.2, and agree item by item with the manifest. The section given for (2.68) is wrong in both: R01. |

Repaired patterns searched in the rest of the text: every `teschl` locator of the sampled targets
against the heading of the section it names (R01 is the one slip); every *Needs:* line of the
sampled targets against its route (R02 is the one omission; the pattern of F02); every statement
on arbitrary `ℋ` with a `teschl` locator (covered by lines 149–151).

## Verified sound

**Scope of this round.** The three repairs and every passage they changed; the fifteen seeded
targets in full (1.3, 1.4, 1.7, 2.1, 2.2, 2.3, 3.1, 3.3, 3.4, 3.6, 3.8, 3.9, 4.3, 4.4, 4.5); 1.1,
1.2, 1.5, 1.6, 1.9, 3.2, 3.5, 3.7, 4.2 where a sampled target uses them; the contracts; both gaps;
the six maintainer notes; the plan (44 targets in 4 layers: 26 theorems, 17 definitions, 1
example; every definition has API entries and at least 3 tests; every target a locator); the
manifest (21 entries, all cited in the README, no cited key missing). Round 7's table rows for
1.5, 1.6, 1.8, 1.9, 3.5, 3.7, 3.10 and 4.2 carry computed values and the text of those sections is
unchanged since (diff of the two heads read); they are relied on.

**Principles.** No route-specific shortcut: separability only in 1.4(4); every `d ≥ 1`;
disconnected, zero-dimensional and empty manifolds treated. No copied passage, no algorithm, no
`Suggested.lean` at this stage. Layers are named by their mathematics and the README does not say
it follows a source. A search of the README for pull-request numbers, dates, round labels, TeX
delimiters, machine paths, "optional", "deferred", "removed", "current" found nothing. Supply is
one-directional (gate below).

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.3 reduced restriction | `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0`; `U = ℋ`; resolvent step | compression `δ₁, δ₃`, `σ = {1,3}` (unrestricted: `{1,2,3}`); `Q = 0`, every `P_A(I)Q = 0`, `σ = ∅`; `σ(A)`; `(z − A)R_A(z)u = u` with `R_A(z)u ∈ U` | correct |
| 1.4(1) local mass, one `f` for all `ε` | `M_x` on `L²[0,1]`, `λ = 0` (endpoint); `A = 0` on `ℂ`, `λ = 0`, pp version; `ℋ = 0` | `f = 1`: ac mass of `(−ε, ε)` is `min(ε,1) > 0`; atomic mass `|f|² > 0` at `{0}` with no annulus charged, `f = 1` serves every `ε`; both sides false | correct in both directions |
| 1.4(2), (3) | `diag(1,2)`, `ψ = (1,1)`; `M_x ⊕ diag(q_n)` | `h = 0`, `{h>0}^ess = ∅ = σ_ac`; `σ_ac = σ_pp = [0,1]`, `([0,1])^ess = [0,1]` has no isolated point | correct |
| 1.4 type parts of a maximal vector | `M_x ⊕ diag(1/2)`, `ψ = (1,1)`, `f = (g, 0)` | `μ_f = |g|²Leb ≪ Leb|[0,1] = μ_{P_ac ψ}`, although `μ_ψ` has the atom `δ_{1/2}` | correct |
| 1.4 essential closure | `[0,1] ∪ {2}`; `ℚ`; `(0,1)` | `[0,1]`; `∅` (closure `ℝ`); `[0,1]` | Checks agree with (3.79), teschl line 4319 |
| 1.5 (changed text) | `M_x` on `L²([0,1] ∪ [2,3])`, `(a,b) = (1,2)`; `[a,b] = [0,1]` | mass of `(1,2)` is `0` for every `f`; `J = (c,d) ⊆ (0,1)` has mass `d − c > 0` for `f = 1` | correct |
| 1.7 wave operators | `H₁ = H₂`; `H₁ = 0, H₂ = 1` on `ℂ`; `M_x`, `M_x + c`; chain rule norm | `Ω = 1`; `e^{it}ψ` converges iff `ψ = 0`; `e^{itc}`, no limit for `c ≠ 0`; `‖U(a − b)‖ = ‖a − b‖` for unitary `U` | correct; R02 is the *Needs:* line |
| 1.7 image in `ℋ_ac(H₂)` | `⟪Ωx, e^{−isH₂}Ωx⟫` | `= ⟪Ωx, Ωe^{−isH₁}x⟫ = ⟪x, e^{−isH₁}x⟫`, so the two measures have one Fourier transform | true |
| 2.1 three-way equivalence and `λ₀` | `A = 2` on `ℂ`, `γ = 1, 2, 3`; `ℋ = 0`; `M_x` on `L²(ℝ)`; Gaussians `e^{−πx²/n²}` | T, T, F for each condition; all true; all false for every `γ`; `‖u′‖²/‖u‖² = (π/(n√2))/(n/√2) = π/n²` | correct |
| 2.2 bounds | `diag(0,1) + diag(1,−1)`; `V = c` | `λ₀ = 0 ∈ [0 + (−1), 0 + 1]`; `λ₀ + c` on both sides; `‖x‖ + ‖(A+V)x‖ ≤ (1 + ‖V‖)(‖x‖ + ‖Ax‖)` | correct |
| 2.3 norm of `A(A − μ)⁻¹` | `B = A − γ ≥ 0`, `d = γ − μ`, `M = max(1, γ²/d²)` | `‖(B + γ)y‖² = ‖By‖² + 2γ⟪y,By⟫ + γ²‖y‖² ≤ M(‖By‖² + 2d⟪y,By⟫ + d²‖y‖²)` term by term (`γ ≤ Md`), so the bound follows from the form bound alone; the triangle bound `1 + |μ|/d` would give `2` at `γ = 0` | correct, and owned by the listed inputs |
| 2.3 bound and signs | `a = 1, b = 1/2, γ = 0`; `A = 2, V = 1, μ = 0`; scalar `V = −(a + b|λ|)`; `b = 1`, `V = −H₀` | `a/d + b < 1` iff `d > 2`, bound `−2`; `(1 − V R_A(0))(A − 0) = (3/2)·2 = 3`, plus sign gives `1`; `λ − a − b|λ| ≥ γ − a − b|γ|` (`t − b|t|` increasing); `0` on `H²`, not closed | correct; (6.3) of teschl misprinted (line 5709–5711) |
| 3.1 Green pairing | `v = a + ib`, `u = c + id`; circle `e^{inθ}`; `v = 1`, `u` a bump on `ℝ` | `conj(v)Δu = aΔc + bΔd + i(aΔd − bΔc)`, the stated pairing integrated; `2πn² = 2πn²`, unconjugated `0`; `∫ Δu = 0 = ∫ ⟨d1, du⟩` through the line-289 theorem | correct |
| 3.3 maximal operator | `e^{−|x|}`; `χ/|x|` on `ℝ³`; `eˣ` on `(0,1)`; adjoint identity | `−u″ = −u + 2δ₀`; `4πδ₀ +` smooth; `Δeˣ = −eˣ`; `∫ conj(v)Δφ = ∫ conj(w)φ` for all `φ` iff `Δv = w` (`Δ` real) | correct |
| 3.4 forms | `(0,1)`; `ℝ`; discrete `X` | `1 ∈ H¹ ∖ H¹₀` (`‖1‖ = 1 > π⁻¹·0`); Dirichlet `n²π²`, `n ≥ 1`, Neumann `n ≥ 0`; `H¹ = H¹₀`; `du = 0`, `Δ_F = 0`; `𝔞(u, iv) = i𝔞(u,v)` | correct |
| 3.6 route (a), (b) | `⟨d(χ²u), du⟩ = χ²|du|² + 2χ conj(u)⟨dχ, du⟩` | (a) `∫χ²|du|² ≤ ‖Δu‖‖u‖ + ½∫χ²|du|² + 2 sup|dχ|²‖u‖²`, the stated bound; (b) `∫χ²|u|² ≤ sup|dχ|²‖u‖² ≤ 2 sup|dχ|²‖u‖² ≤ 32‖u‖²/k² → 0` | correct |
| 3.6 Checks | `ℝ⁴ ∖ 0`; `(0,1)` | `∫_0^1 r^{−4} r³ dr = ∞`; `1 ∈ dom Δ_max ∖ H¹₀` | correct |
| 3.8 `κ` and eigenspace identity | `κ(iu)`; circle, `μ = 1`; `N` points; `∅` | `−Im u + i•Re u = i•κ(u)`; `span_ℂ(e^{±iθ}) = span_ℂ(cos, sin)`, dimensions `2 = 2`; `λ_k = 0` for `k < N`, `+∞` after; `μ₁ = inf ∅ = +∞` | correct |
| 3.9 route | `T = (B − is)⁻¹`; one point, `s = 1`; `Tx = νx`; circle `V = 1`; `V = 1_{[0,π)}` | `T − T* = T(T*⁻¹ − T⁻¹)T* = 2is·TT*`; `T = i`, `i + i⁻¹ = 0`; `Bx = (is + ν⁻¹)x`; `1,2,2,5,5`; Rayleigh quotient of `1` is `π/2π = 1/2`, `u(0) = u′(0) = 0` forces `u = 0` | correct |
| 4.3 definition and laws | `1_{B_1} + (1+‖x‖²)^{−1/2}`; `cos x₁ − cos x₁`; `1_{⋃[n, n+n^{−2}]}`; `VW` | `≤ (1+R²)^{−1/2}` outside `B_R`, `R ≥ 1`; `0`; `|V| = 1` on positive measure beyond every `R`; `ε·ess sup|W|/(1 + ess sup|W|) ≤ ε` | correct |
| 4.3 compactness and resolvent point | HS energy; tail; scalar `s = 0, 1` | `‖V_R‖₂²‖f_R‖₂²`; `‖V − V_R‖_∞ + ‖V‖_∞(4π²R² + 1)⁻¹ → 0`; `(s+1)⁻¹(1 + (1+i)/(s−i)) = (s−i)⁻¹`: `i`, `(1+i)/2`; sign slip `2 − i` | correct |
| 4.4 clauses | `V = c`; square well; `1_{B_1}`, `d = 3`; `cos x₁`, `d = 3, 4` | `σ = [c, ∞)`, `σ_ess = [1,∞)` at `c = 1`; `k = 0.739`: `k tan k = 0.6737 = √(1 − k²)`, `E = −0.454 ∈ [−1, 0)`; `σ = [0,∞)`; UO-E06 applies / does not | correct |
| 4.5 quasi-periodic `V` | `cos x + cos √2x`; `V_{±e₁} = i`; `θ_{e₁} = 1, θ_{−e₁} = 2` | `conj(V) = Σ conj(V_n)e^{−i⟨θ_n,x⟩} = Σ V_{−n}e^{i⟨θ_{−n},x⟩} = V`; inf `−2` not attained (`√2(2k+1)` is no odd integer); `2i cos x`; `(e^{ix} + e^{2ix})/2`, not real | correct |

**Sources (the seeded sample).** Read at the text this round: teschl line 1778–1781, 2908–2918,
2956–2967, 3029–3047, 3276–3306, 4315–4332, 4346–4354, 4390–4391, 4418–4428, 4940–4948, 5040–5070,
5680–5722, 6345–6368, 7095–7143, 7209–7230, 9576–9590, 10583–10622; bms02 line 124–131, 148–158,
176–184, 240–258; kps26 line 14–52. Theorem numbers and printed pages agree: Lemma 2.24 p. 80,
Lemma 3.15 and (3.79) in §3.2, Corollary 4.6 p. 116, Theorem 4.10 p. 119, Corollary 4.11, Theorem
4.12(i), Lemma 6.3 and Theorem 6.4 p. 135, Theorems 2.12–2.13, the remark before Lemma 6.22,
Theorem 7.8, Lemma 7.9 and (7.26) p. 168, Lemma 7.11 p. 170, Theorem 10.2 p. 222, (12.3) p. 247,
Lemma 12.1, (12.6), Theorem 12.2; bms02 Theorem 2.3(i), Corollary 2.10, Remark 2.12, the standing
connectedness; kps26 (1.1)–(1.6) and Theorem 1.1 (`d ≥ 2`, `l > d`). Each supports its statement
with the differences the README states (arbitrary `ℋ`; every bounded `V` beyond Theorem 10.2;
disconnected `X`; every `l ≥ 1` in 4.5, a definition of this roadmap). The author flags no locator
as unverified. Nothing was fetched; no `needs-references.toml` was written.

**Pinned libraries** (opened this round, beyond those under the repairs):
`LinearPMap.IsReducing.isSelfAdjoint_restrict` (`TauCeti/Analysis/InnerProductSpace/LinearPMap/Reducing.lean:144`,
`[CompleteSpace E]`); `LinearPMap.resolvent`, `resolvent_sub_resolvent`
(`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:169, 280`);
`IsSelfAdjoint.hasCompactResolvent_iff_isCompactOperator_resolvent` (`CompactResolvent.lean:69`);
the eigenbasis theorem (`Eigenbasis.lean`, module docstring line 42);
`ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top` (`HilbertSchmidt/Columns.lean:257`);
`IsSelfAdjoint.add_of_isRelativelyBounded` (`KatoRellich.lean:118`); `LinearPMap.IsRelativelyBounded`
(`RelativeBound.lean`); `TauCeti.ProjValMeasure` (`ProjValMeasure/Basic.lean:91`, fields
`diag_finite` 98, `inner_proj` 100, `proj_univ` 103); `TauCeti.Complexification`
(`Complexification.lean:82`, `smul_re` 136); `instComplexificationCompleteSpace`
(`InnerProductSpace/Complexification.lean:136`); `isLocallyFiniteMeasure_riemannianVolume`
(`VolumeDensity/Volume.lean:179`); Mathlib `IsCompactOperator.comp_clm`,
`isCompactOperator_of_tendsto` (`Analysis/Normed/Operator/Compact/Basic.lean:271, 459`),
`laplacian_eq_fourierMultiplierCLM` (`Analysis/Distribution/FourierMultiplier.lean:107`),
`TemperedDistribution.MemSobolev` (`Analysis/Distribution/Sobolev.lean`). The other contract names
were opened by round 7 at the same pins and are unchanged. `roadmaps resolve` on this head: no
citation and no Lean name found nowhere (the round-start lead
`CompactFormPair.eigenvalue_eq_rayleighMinMax` is VariationalMethods' name, attributed to it at
line 82).

**Suppliers, resolved now.** Main is at `1a19c9f`, the commit round 7 resolved against. Reread on
main: SelfAdjointSpectralTheory SA-C12–SA-C19, SA-C54, SA-D22, SA-E05–SA-E13, SA-E30, SA-E44 (each
states what the README takes from it; SA-D22's hypothesis `c‖x‖ ≤ ‖Ax − zx‖` is the one 2.1
verifies); UnboundedOperators §3.2 (UO-C02: two definitions, equivalence, unitary invariance,
finite-rank windows; no Weyl criterion among its items), §3.3 (UO-C03: reducing subspaces for
every normalized PVM, finite control measure for Borel type projections), §§5.4–5.7 headings,
§4.7; every other cited id exists (UO-A01–UO-E06, SA-B44–SA-E47, 29 ids looked up). Open heads:
QuantumFoundations §8.2 (free Hamiltonian on `L²(ℝⁿ)`, cores, intertwining
`M_(4π²|ξ|²/(2m))`, the density quoted in 4.2) and §9.5; CongruenceSpectralGap §0.2, §0.6;
AutomorphicSpectralTheory §1.16a, §§4.1–4.3; MaassForms §0.1; HilbertModules H6 on main. None
missing where cited.

**Declared gaps.** `gap:weyl-criterion` (UnboundedOperators UO-C02, §3.2) and
`gap:spectral-integral-resolvent` (UO-A02, §1.2): each `needs` is one statement with its
hypotheses, is not provided on main (UO-C02 read; UO-A02 proves the resolvent only for the
spectral measure of a given operator), and has the same slug in the plan's `gaps` and at lines
340–352. Contracts, not findings.

**Maintainer notes** (none holds at this head).

1. Not held: lines 122–129 give UO-E06 only `L² + L^∞` on `ℝ³` and Coulomb to QuantumFoundations §9.5; lines 139–140 put `L^p` and the Kato class outside the roadmap.
2. Not held: lines 77–80 and 324–325 say UO-C03 gives self-adjointness with a finite control measure and 1.3 with SA-C19 in general.
3. Not held: every mention of Weyl's criterion carries `gap:weyl-criterion` (lines 68–69, 340–345, 1327–1330, 1376).
4. Not held: lines 1467–1475 state the passage from `(H₀ + 1)⁻¹` to `(H₀ − i)⁻¹`; identity recomputed in the table.
5. Not held: the last item of 1.1 (lines 457–464) rests on `gap:spectral-integral-resolvent`.
6. Not held: the contract lists SA-C86 and SA-E30 (lines 302–309), as the plan does.

The closing instruction is met at lines 125–129 and 1511–1515 (4.4 names UO-E06 as its
three-dimensional case). The ownership decisions of the notes were not reopened.

**Duplication and overlap.** At the pins, a search of Mathlib and Tau Ceti for wave operators,
essential closure, absolutely continuous spectrum, Kato–Rosenblum, Friedrichs extension, essential
spectrum, essential self-adjointness and maximal spectral vectors finds no declaration (one
unrelated hit, a Poincaré inequality file). `roadmaps grep` over main and the open heads:
Kato–Rosenblum and essential closure, no other text; wave operators, only the Haag–Ruelle ones of
RelativisticQuantumFieldTheory; "Gaffney", SobolevDifferentialForms' identity for forms on a cube
(another statement) and CongruenceSpectralGap §0.2 (cited); "Pearson's theorem",
MathematicalStatisticsAsymptotic's chi-square theorem (another object); `σ_ac`, QuantumFoundations
(cited); cusp coordinates, ComplexCurveModuli D6 (R03). `overlaps.md`: no pull request changes
this roadmap, no dropped id, no revision-only id, no second copy (the roadmap is not on main).

Overlap check: read UnboundedOperators, VariationalMethods, SelfAdjointSpectralTheory (main and its open revision's ids), CongruenceSpectralGap, QuantumFoundations, AutomorphicSpectralTheory, RelativisticQuantumFieldTheory, ComplexCurveModuli; shared: pp/ac/sc subspaces — UnboundedOperators UO-C03; essential spectrum — UnboundedOperators UO-C02; complexified real operator — UnboundedOperators UO-D06; `L² + L^∞` potentials on `ℝ³` — UnboundedOperators UO-E06; free Hamiltonian — QuantumFoundations §8.2; congruence Laplacians — CongruenceSpectralGap §0.2 and AutomorphicSpectralTheory §1.16a; Courant–Fischer for compact form pairs — VariationalMethods 4.4; cusp and collar coordinates of hyperbolic surfaces — ComplexCurveModuli D6 (not restated here; R03 asks for the citation); each cited or to be cited, none owned twice.

**Supplier-order gate.** Output of the prescribed command:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2238 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every *Needs:* line of the sampled targets was read against its statement
and route; the one omission is R02.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, four layers each
ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Every
sampled definition (spectral parts, essential closure, maximal spectral vector, wave operators,
`λ₀`, `Δ`, `Δ_max`, `H¹`, `H¹₀`, `Δ_F`, vanishing at infinity, `H_V`, quasi-periodic `V`) has its
API and at least three discriminating Checks; every theorem its hypotheses and a locator. Layers 1
and 2, and 3 and 4, are mutually independent (lines 432–438), so no source's order is imposed.
A design has no `Suggested.lean`: headline statability, padding, binders and imports are
package-stage checks, and the README attributes no backticked Lean name to this roadmap.

Source independence: 27 passages compared with 3 sources read this round (teschl 20, bms02 4, kps26 3), none shared beyond standard names, formulas and forced hypothesis lists; largest share teschl, 34 of 87 locators by this round's count; contents compared with teschl (section headings of its Chapters 1–4 listed, line 1632–5123): independent (Layer 1 draws on its §§2.5, 3.2, 3.3, 4.2, 4.3, 12.1 and on kato57, Layer 2 on §§4.3 and 6.1, Layer 3 on §2.3 only, Layer 4 on Chapters 7 and 10; no run of sections maps one to one onto a run of its sections).

## Not verifiable

- Elaboration: not available (this lane does not elaborate). No Lean command was run.
- The thirteen settled uncertified texts (`strichartz83`, `chernoff73`, `kato76`, `cfks87`,
  `gaffney54`, `rs1`, `rs2`, `rs3`, `grigoryan09`, `chavel84`, `iwaniec02`, `lp76`, `pearson78`)
  were not read. Of the sampled targets, 3.1 and 3.4 (`grigoryan09` Ch. 4) rest on those locators
  alone on the source side; their statements were checked by computation and against the pinned
  Green identities, and 3.6 against bms02.
- `kato57`, `yafaev04`, `rosenblum57`, `hm23`, `lp80` were not reread (their targets are outside
  the sample and unchanged; round 7 read them).
- kps26 is an OCR extraction: (1.3)–(1.6) are legible only in outline; `d ≥ 2`, `l > d`,
  `V_n = conj(V_{−n})` and Theorem 1.1 are legible.
- Published numbering of the arXiv copies of `bms02`, `hm23`, `kps26`, `yafaev04` was not compared
  with the journal versions.
- Ownership against open pull requests was checked by object with `roadmaps grep` and by reading
  the roadmaps of the Overlap line; the other open heads were searched, not read.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135: the source says the second entry of the maximum is the ambient coefficient over the relative coefficient minus one; it should be over one minus the relative coefficient; affects a stated result.
- **Misprint** in teschl at Theorem 6.4, proof, last line, printed page 135: the source says the admissible shift lies below the same quotient with denominator the relative coefficient minus one; it should have one minus the relative coefficient and a negative sign; affects the proof.

## For the human reviewers

- **Licence.** `teschl` is read from the author's online edition of an AMS book; 34 of 87 locators point into it. The wording and arrangement checks found nothing shared (`packages/SchrodingerOperatorsAndSpectralTypes/sources.toml`, entry `teschl`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "13b85d45e361ba1540f35163187d79f0978c4e5e", "job": "REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~8", "model": "fable", "worker": "chris-x80"} -->
