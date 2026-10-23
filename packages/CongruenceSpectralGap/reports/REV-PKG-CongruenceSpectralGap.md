<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/957#issuecomment-6372386530 -->
Review (claude) of 2ce573c

Verdict: needs changes

1. **F01** (P2) The end theorem can be stated at the pins but is missing from `Suggested.lean`

   **Location.** `packages/CongruenceSpectralGap/Suggested.lean` lines 9–12 (module docstring): "The congruence spectral gap, operator and closed-form Rayleigh inequalities, spectral clipping comparison, and constant-metric rescaling lack the canonical finite-area orbifold closed-energy domain and quotient Friedrichs realization." The README's end theorem is §5.3 (lrs95, Theorem 1.1).

   **Claim.** The docstring says the 21/100 gap cannot be stated without the quotient Friedrichs operator. That is not true. The classical eigenfunction form can be stated with native carriers only: a congruence Γ, the SL(2,ℤ) action on ℍ, Mathlib's `Laplacian` and boundedness. In that form, every nonconstant bounded C² Γ-invariant eigenfunction of −y²Δ has eigenvalue ≥ 21/100. It is equivalent to λ′₁(Γ) ≥ 21/100. A bounded eigenfunction lies in L² because the area is finite. The residual spectrum is the constants (§0.6). λ′₁ = min(λ₁, 1/4) (§0.7), and 1/4 ≥ 21/100. ArithmeticLocallySymmetricSpaces ALS.F.6(iii) ("cusp form iff bounded iff square integrable") supports using boundedness as the hypothesis.

   **Witness.** The statement below elaborates at the pin under `lake env lean`, with only `import Mathlib`; its sole warning is `declaration uses sorry`. Carriers used: `InnerProductSpace.instLaplacian` (Laplacian.lean:138), `UpperHalfPlane.SLAction` (MoebiusAction.lean:282) and `IsCongruenceSubgroup` (CongruenceSubgroups.lean:163).

   **Repair.**
   1. Add the theorem below to `Suggested.lean` under `/-! ## Layer 5: The parameter bound and congruence gap -/`, placed after Layer 4.
   2. In the docstring, replace "The congruence spectral gap" by "the Rayleigh-infimum form λ′₁ of the gap".
   3. In README §5.3, add: "Prove `congruence_eigenvalue_bound`: for congruence Γ, every nonconstant bounded C² Γ-invariant u with −y²(∂ₓ²+∂ᵧ²)u=λu has λ≥21/100 (lrs95, Theorem 1.1 p.387)." Give the route: boundedness gives u∈L² (§0.1); u lies in Dom ΔΓ; λ=0 forces a constant (§0.2); otherwise apply §§0.7 and 5.3.
   4. In README §0.2, add the maximal-domain identification that the route needs: Dom ΔΓ = {f∈L² : distributional Δf∈L²}. AutomorphicSpectralTheory §1.16a proves this for Γ₀(N).

   Tested: this exact text elaborates.

   ```lean
   open UpperHalfPlane Laplacian in
   /-- Luo–Rudnick–Sarnak, Theorem 1.1, in eigenfunction form: for a congruence subgroup,
   every nonconstant bounded Γ-invariant eigenfunction of the positive hyperbolic Laplacian
   `−y²(∂ₓ² + ∂ᵧ²)` has eigenvalue at least `21/100`. -/
   theorem congruence_eigenvalue_bound (Γ : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℤ))
       (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) (u : ℂ → ℂ)
       (hu : ContDiffOn ℝ 2 u {z : ℂ | 0 < z.im})
       (hinv : ∀ γ ∈ Γ, ∀ z : ℍ, u ((γ • z : ℍ) : ℂ) = u (z : ℂ))
       (hbdd : ∃ C : ℝ, ∀ z : ℍ, ‖u (z : ℂ)‖ ≤ C)
       (hnc : ∃ z w : ℍ, u (z : ℂ) ≠ u (w : ℂ))
       (lam : ℝ) (heig : ∀ z : ℍ, -((z.im : ℂ) ^ 2) * Δ u (z : ℂ) = (lam : ℂ) * u (z : ℂ)) :
       (21 / 100 : ℝ) ≤ lam := by
     sorry
   ```

2. **F02** (P2) The all-level Friedrichs operator has two owners, and gap:all-level-spectral-realization is compound

   **Location.** README line 75: "Extend the modular spectral realization to every principal congruence level and every intermediate congruence subgroup, compatibly with its quotient Friedrichs operator, with one scattering channel per cusp, …". Line 146 (§0.2) constructs ΔΓ "for every congruence Γ". Line 238 (§0.6): "identify the supplied arbitrary-level spectral realization with ΔΓ".

   **Claim.** AutomorphicSpectralTheory sits at merge-order line 98, this roadmap at line 107, so AutomorphicSpectralTheory cannot consume §0.2. To meet the gap it must therefore build its own quotient Friedrichs operator at every congruence level. That is the object §0.2 builds here, which gives two owners. §0.6 exists only to identify the two copies. If instead "its" in the gap means this roadmap's ΔΓ, the supplier depends on its consumer, which is an upward edge. Separately, the `needs` sentence bundles seven deliverables: level extension, operator compatibility, scattering channels, the absolutely continuous [1/4,∞) spectrum, no singular continuous spectrum, a finite small spectrum, and constants-only residual spectrum.

   **Witness.** AutomorphicSpectralTheory §1.16a constructs `modular_laplacian_realization` only on Γ₀(N)/{±I}\ℍ. §4.8 displays only the PSL₂(ℤ) expansion, noting that a level subgroup has one family per cusp. The Scope says this Part II owns the all-level extension (README line 7).

   **Repair.** This roadmap keeps ownership of the operator, as its Scope says. Reword the gap so that AutomorphicSpectralTheory supplies only operator-independent adelic input, for example: "For GL₂/ℚ at every principal level K(N) and trivial central character, extend §§4.3–4.4 and 4.8: the SO(2)-fixed K(N)-invariant L² space is one-dimensional characters ⊕ cuspidal ⊕ Eisenstein integrals, with one family per cusp of Γ(N); the continuous Casimir spectrum is absolutely continuous on [1/4,∞); and the residual part is the one-dimensional characters." Let §0.6 transport this to ΔΓ through the classical–adelic gap of R03. Then delete "compatibly with its quotient Friedrichs operator". Tested on the conflict above: the reworded `needs` names no operator built at this roadmap's merge position.

3. **F03** (P2) gap:principal-level-classical-constituents is vague, partly already provided, and misses its existing supplier objects

   **Location.** README line 81: "Provide the norm-compatible principal-level classical–adelic comparison and passage to invariants of each intermediate congruence subgroup, intertwining the weight-zero Casimir with the positive hyperbolic Laplacian and the cuspidal constituent extraction of …ALS.F.6." §§0.6 and 1.1 speak of cuspidal eigenfunctions on Γ but never cite their owner.

   **Claim.** The phrase "norm-compatible" is undefined, and the sentence asks for three things at once. AutomorphicFormsOnReductiveGroups already supplies part of it:
   - §3.1 `classicalEquiv` works at every compact open J, with the actual stabilizers, so it includes J=K(N).
   - §4.5 defines `MaassCuspForm(Γ,λ)` "for a finite-index congruence subgroup of SL₂(ℤ)" and gives `maassClassicalEquiv`, the Casimir/Laplacian comparison, at level one.

   The README cites neither §4.5 nor `MaassCuspForm`.

   **Witness.** AutomorphicFormsOnReductiveGroups §3.1 builds the restriction to the rational stabilizer Γᵢ of each tᵢJ. §4.5 defines `MaassCuspForm(Γ,λ)` as smooth, Γ-invariant, square-integrable, with −y²Δφ=λφ and zero constant terms. `maassClassicalEquiv` covers SL₂(ℤ) only.

   **Repair.**
   1. Restate the gap as a single object: "Extend §4.5's `maassClassicalEquiv` from SL₂(ℤ) to every congruence Γ⊇Γ(N). Identify `MaassCuspForm(Γ,λ)` with the Γ/Γ(N)-invariants of the K(N)-invariant SO(2)-fixed Casimir-λ eigenspace of the ALS.F.6 cusp space, via §3.1's `classicalEquiv` at J=K(N), isometrically for the normalized quotient measures."
   2. Add AutomorphicFormsOnReductiveGroups §4.5 (`MaassCuspForm`, `maassClassicalEquiv`) to the supplier contracts and to the *Needs* of §§0.6 and 1.1.

   Tested on the witness: the reworded gap asks only for the level-N extension that §4.5 lacks.

4. **F04** (P2) gap:complex-gamma-strip-estimates and gap:finite-rs-polynomial-strips ask AutomorphicLFunctionsAndLocalFactors for inputs that are provided or owned elsewhere

   **Location.** README line 99: "Provide zero-free meromorphic Gamma factors, their pole orders and complex Stirling estimates on finite vertical strips away from poles, including polynomial growth of the balanced ratio A(1−s)/A(s)." Line 101 asks for polynomial strip growth of the finite twisted function "by finite-order continuation and Phragmén–Lindelöf".

   **Claim.**
   - Mathlib at the pin already proves that Gamma has no zeros off its poles: `Complex.Gamma_ne_zero` (`Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:426`) and `Complex.differentiable_one_div_Gamma` (same file, line 521).
   - The complex Stirling estimates, including balanced Gamma quotients, are owned by the open new roadmap ZerosOfLFunctions, Layers 1.2–1.5. So is Phragmén–Lindelöf convexity of the continued uncompleted function, Layers 3.3–3.4. AnalyticNumberTheoryPartI is earlier in the merge order (line 99) and already consumes exactly these sections.
   - Asking AutomorphicLFunctionsAndLocalFactors to plan them again creates a second owner.

   **Witness.** AnalyticNumberTheoryPartI's ZerosOfLFunctions supplier table, row 1.2–1.4: "Analytic logΓ …, Stirling remainder, vertical-strip modulus/phase, digamma and balanced Gamma quotients". Row 3.3–3.4: "Pole-cleared conductor-uniform convexity". ZerosOfLFunctions Layer 3 says convexity must be run on the uncompleted function.

   **Repair.**
   1. Add a `### From TauCetiRoadmap.ZerosOfLFunctions` contract citing §§1.2–1.5 (Stirling for Γℝ and Γℂ, balanced quotients) and §§3.3–3.4 (convexity). Add the two Mathlib names to `### From Mathlib`.
   2. Delete gap:complex-gamma-strip-estimates.
   3. Narrow gap:finite-rs-polynomial-strips to the instance AutomorphicLFunctionsAndLocalFactors must supply: the prime-twisted self-pair as a record meeting the hypotheses of ZerosOfLFunctions 3.3, namely entire completion, functional equation with the specified ε and conductor, and the average coefficient bound.
   4. Update the *Needs* of §§2.2, 3.3 and 3.4 to match.

   Tested: every clause deleted from the gap now has a named owner.

5. **F05** (P3) A false Check in §4.3 explains why rank 0 is excluded

   **Location.** README line 589: "Rank k=0 is excluded; the empty-product fibre would force a different identity."

   **Claim.** The identity does not change at k=0. Since `hyperKloosterman` at rank 0 is 1 at r=1 and 0 otherwise, both sides agree at k=0. What fails at k=0 is the norm bound, which is why `1 ≤ k` is a hypothesis.

   **Witness.** Take q=7, r=1, k=0. There are two even nonprincipal characters, so the left side is 2. The identity's right side is 3·(1+0)−1=2, so it holds. The bound's right side is 6·0·7^(−1/2)+1=1, which is less than 2.

   **Repair.** Replace the Check with: "Rank k=0 is excluded because the norm bound fails: at q=7, r=1 both sides of the identity equal 2, while (q−1)·0·q^(−1/2)+1=1." Tested on the instance above.

6. **F06** (P3) The Layer 3 kernel definitions do not have three discriminating Checks each

   **Location.** README lines 410–412 (§3.1 Checks) and lines 432–434 (§3.2 Checks).

   **Claim.**
   - In §3.2, Checks 1–2 (φ=0 or G=0 gives 0) hold for any definition linear in φ and G. Check 3 uses G=1, so it never tests the argument β−s of G. A wrong model using G(β+s) passes all three Checks.
   - In §3.1, Check 1 (F₁(0,x)=0) is vacuous in the same way.

   **Witness.** For G(w)=w the integrand mellin(φ,−s)(β−s)/s inverts to F₂ = βF₁(φ∘inv,x) − φ(1/x). The G(β+s) model gives +φ(1/x) instead. They differ wherever φ(1/x)≠0, e.g. x∈(1/4,1/3) for φ supported in [3,4].

   **Repair.**
   - In §3.2, add the Check: "For G(w)=w, F₂(φ,G,β,x)=βF₁(φ∘inv,x)−φ(1/x); the orientation G(β+s) would give +φ(1/x)."
   - In §3.1, add a dilation Check: for φ_c(y)=φ(y/c), F₁(φ_c,x)=F₁(φ,x/c). An ordinary dy tail would carry an extra factor c.

   Tested on the support-[3,4] instance.

7. **F07** (P3) Locator and citation drift in supplier references

   **Location and claims.**
   - (a) Line 93 says "AL.3, L-function data and derived products, supplies the canonical completed-function strip bounds"; the same section is the plan.json `section` of gap:finite-rs-polynomial-strips. That item states that it "imposes no analytic continuation or growth assertion". The completed Rankin–Selberg strip bounds are in AL.3 "Hecke, eigensystem and Rankin–Selberg data" (`rsDatum`, `IsNicePinned`, `BoundedOnStrips`).
   - (b) Lines 14, 67, 189, 212 and 266 cite "SA-E01–SA-E14" for the unbounded "functional calculus" and the Rayleigh comparison. SA-E14 is the positive-shift Yosida approximant. The form bounds are SA-E11–SA-E13, and the unbounded calculus is UnboundedOperators UO-A01–UO-A03.
   - (c) Line 166 cites "PDE local weak derivatives" with no section. The weak derivatives are PDE Lane A, item 1.
   - (d) Line 363 writes "gaps:all-prime-self-pair-positivity and self-pair-local-character-transport". The second slug lacks its `gap:` prefix.

   **Witness.** See the supplier texts quoted in (a)–(c).

   **Repair.**
   - (a) Repoint to "AL.3, Hecke, eigensystem and Rankin–Selberg data".
   - (b) Cite SA-E01–SA-E13 plus UnboundedOperators UO-A01–UO-A03.
   - (c) Cite "PDE Lane A".
   - (d) Write `gap:all-prime-self-pair-positivity; gap:self-pair-local-character-transport`.

Scope of this review: `packages/CongruenceSpectralGap/README.md`, `Suggested.lean`, `metadata.toml`, `sources.toml`, with the design's `design/plan.json` gaps. First round: there is no earlier review to carry forward. Seven findings: four P2, three P3. No P1.

## Verified sound

**Principles.**
- No sorry'd data, no `set_option`, no `lemma`, no process words, pull-request numbers, LaTeX delimiters or local paths (grep of the README and the Lean file).
- No computational algorithm and no copied passages; I spot-checked §4.2b against Katz.
- The only restriction to good primes is the choice of the twisting prime q. Ramified places are kept (§2.1).
- The Lean file has a single `import Mathlib`.
- The README is not a re-plan: it is AutomorphicSpectralTheory Part II, and its Scope states where the base roadmap stops.

**Elaboration.** I ran `lake env lean` on `Suggested.lean` from the content checkout. It exits 0 with two `declaration uses sorry` warnings only (lines 42 and 53). No `TauCeti.*` import is needed.

**`#check @` comparison.** I put `#check @` for all three declarations in one scratch copy and elaborated it once. Each elaborated type equals its README statement:
- §4.2a: rank k, ψ : `AddChar F ℂ`, r : Fˣ.
- §4.2b: `1 ≤ k`, `ψ ≠ 1`, bound k·|F|^((k−1)/2) with a real exponent.
- §4.3: `Fact q.Prime`, `2 < q`, `1 ≤ k`, r : (ZMod q)ˣ, the sum over χ ≠ 1 with χ(−1) = 1, and `star (χ r) * gaussSum χ ZMod.stdAddChar ^ k`.

There are no section variables, so no binder can be lost. Nothing changed.

**Padding probe.** On scratch copies I replaced both `sorry`s by each of `simp`, `rfl`, `infer_instance`, `norm_num`, `positivity` and `exact le_of_eq rfl`. All twelve attempts fail, so neither theorem is padding. `hyperKloosterman` is a real-bodied definition needed for the statement.

**Headline inventory (README).**

| Headline | At the pins | In `Suggested.lean` |
|---|---|---|
| Spherical GLₘ/ℚ parameter bound (§5.1) | Not statable: no cuspidal automorphic representations | Named in docstring ✓ |
| Congruence gap (§5.3) | Statable in eigenfunction form | Absent (R01) |
| Rayleigh inequality and metric rescaling (§§5.4–5.5) | Not statable without an ad hoc fundamental-domain encoding for the non-free action | Named ✓ |
| First moment and nonvanishing (§§4.4–4.5) | Not statable: no Rankin–Selberg functions | Named ✓ |
| Kloosterman sheaf (§4.2b) | Not statable: no adic direct images | Named ✓ |
| Deligne bound | Statable | Stated ✓ |
| Gauss-power bound | Statable | Stated ✓ |
| Exceptional dictionary and adjoint (§§1.1–1.3) | Not statable | Named ✓ |

**Library declarations opened at the pins (26).**

Mathlib:
- `CongruenceSubgroup.IsCongruenceSubgroup` (CongruenceSubgroups.lean:163, ∃ N ≠ 0) and `.finiteIndex` (:181)
- `MulAction.orbitRel.Quotient` (GroupTheory/GroupAction/Defs.lean:349)
- `MulAction.toPermHom` (Algebra/Group/Action/End.lean:184)
- `UpperHalfPlane.volume_def` (UpperHalfPlane/Measure.lean:44)
- `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq` (FundamentalDomain.lean:630; needs countable G, an invariant measure and measurable constant action)
- `MeasureTheory.Lp` (LpSpace/Basic.lean:89)
- `LinearPMap` (LinearPMap.lean:41)
- `mellin` (MellinTransform.lean:90), `mellinInv` (:95, prefactor 1/(2π)), `mellin_comp_inv` (:153)
- `mellinInv_mellin_eq` (MellinInversion.lean:92; MellinConvergent, VerticalIntegrable and ContinuousAt, as stated)
- `Complex.Gammaℝ` (Gamma/Deligne.lean:45), `Gammaℝ_eq_zero_iff` (:75), `Gammaℝ_residue_zero` (:104, limit 2)
- `DirichletCharacter.sum_characters_eq` (Orthogonality.lean:68; NeZero n, HasEnoughRootsOfUnity, IsDomain)
- `gaussSum` (GaussSum.lean:72)
- `ZMod.stdAddChar` (CircleAddChar.lean:83) and `ZMod.isPrimitive_stdAddChar` (:95)

Tau Ceti:
- `UpperHalfPlane.riemannianVolume_eq_volume` (PoincareMetric.lean:181)
- `IsSelfAdjoint.isFormalAdjoint` (LinearPMap/SelfAdjoint.lean:76) and `LinearPMap.IsFormalAdjoint.im_inner_self_apply` (:82)
- `TauCeti.PDE.energyFormH1` (EnergyForm/Sobolev.lean:372; real-valued) and `energyFormH1L0` (:600)
- `TauCeti.LSeries.wienerIkehara` (WienerIkehara/SharpCutoff.lean:301; hypotheses match the README)
- `TauCeti.primeCount_univ_isEquivalent_div_log` (PrimeIdealTheorem.lean:46)

**Cross-roadmap citations resolved (46).**
- AutomorphicSpectralTheory §§0.6, 0.7, 1.16, 1.16a, 4.3, 4.4 and 4.8, at its open head.
- UnboundedOperators UO-D06, at its open head. It is a new folder by another author, so it is a permitted supplier.
- SelfAdjointSpectralTheory Part C and SA-E01–SA-E13, on main.
- AutomorphicFormsOnReductiveGroups §§2.5, 2.6, 2.7, 3.1, 3.4 and 3.5, plus §4.5 found by object search.
- ArithmeticLocallySymmetricSpaces ALS.F.6.
- GlobalNumberFields Layers 6, 9 and 10, with `HeckeCharacter.shift` and `HeckeCharacter.unitaryPart` declared in its Suggested.lean at lines 588 and 590 (main).
- GL2AutomorphicRepresentationsAndTransfer R17.4.13 (adjoint-lift anchor).
- AutomorphicLFunctionsAndLocalFactors, nine named items: Global Whittaker factorization; RS local L-factor; Nonarchimedean factors under normalized induction; Continuation and the pole criterion; global RS functional equation; boundary nonvanishing; L-function data and derived products (but see R07); local RS functional equation; Canonical archimedean factors.
- DeligneWeightsAndPurity §7.12 and DWP.10.
- EtaleCohomologyFoundations F.0.1–F.6, F.10.1, F.10.2 and F.10.2b, on main.
- ArithmeticDirichletSeries Layer 6, on main (Completed).
- AnalyticNumberTheoryPartI §3.26.
- FuchsianOrbifolds Layers 0–3, on main. The open revision of that roadmap was not used.
- DifferentialGeometry Layer 12, on main.
- PDE Lane A, on main.

**Declared gaps.**
- All eight slugs are identical in `design/plan.json` and in the README sentences, and each has a named supplier. None is unowned.
- form-rayleigh-core, all-prime-self-pair-positivity, self-pair-local-character-transport and additive-character-sheaf-weight are precise and minimal. UO-D06 lacks the explicit core and Rayleigh comparison. AL states no self-pair coefficient positivity. DeligneWeightsAndPurity and EtaleCohomologyFoundations construct no Artin–Schreier sheaf L_ψ.
- The other four gaps are R02–R04.

**Supplier order.** All suppliers are on main, earlier in the merge order, or open new-folder pull requests by other authors. No later roadmap is cited. The dependency check prints:

    depcheck: 27 roadmaps, 239 edges, 0 problem(s)

**Ownership and duplication.** I searched by object with `roadmaps grep` over main and the 330 open heads, and grep over the board packages, for: Kloosterman, Friedrichs, hyperbolic Laplacian, spectral gap, 21/100, LRS, approximate functional equation, Phragmén–Lindelöf and Stirling.
- Notion moved down: the raw all-rank hyper-Kloosterman sum and Deligne's bound (§§4.2a–4.2b). The same object appears later in PadicDifferentialEquationsAndRigidCohomology (merge order 139; RD.6.95/RD.6.97, with `kloostermanSum` and `kloostermanSum_bound` in its Suggested.lean), KloostermanMomentsAndPotentialAutomorphy (256) and KloostermanSheavesAndBesselIsocrystals (257). No earlier owner exists, so this roadmap owns it. The later roadmaps should cite §§4.2a–4.2b. The names differ by namespace, so there is no fully-qualified-name clash.
- This roadmap rightly owns: the quotient-measure adapter, mean-zero restriction, λ′₁ and clipping, the two Mellin cutoff kernels, the even prime-twist average and the Gauss-power identity. The only approximate functional equation elsewhere is EffectiveClassNumbers' Dirichlet-L version. CyclotomicClassGroupsAndStickelberger's Gauss-power valuations are a different object.
- No Mathlib or Tau Ceti Kloosterman sum exists at the pins.

**Sampled sources** (one row per sampled target; lrs95 is uncertified, so for those I checked the mathematics independently).

| Target | Locator | Outcome |
|---|---|---|
| 0.2 | teschl §2.3, Thms 2.12–2.13, pp.70–72 (teschl line 2914, 2960) | Verified: Friedrichs extension on p.70, form representation pp.71–72, generic Hilbert-space statements as used |
| 2.1 | lrs95 §2.1, Lemma 2.1 | Text not read; ε modulus f^(1/2)q^(d/2)(fq^d)^(−1/2)=1 and local factor at q checked |
| 2.2 | lrs95 pp.389–390, 395 | Text not read; pole at β₀ from the diagonal shift 2Re μⱼ checked |
| 3.1 | lrs95 (3.6)–(3.7), Lemma 3.1 | Text not read; mellin(F₁)=mellin(φ)/s derived |
| 3.2 | lrs95 (3.7) | Text not read; G=1 reduction via `mellin_comp_inv` checked |
| 3.3 | lrs95 Lemma 3.1 | Text not read; rightmost pole σ+β₀−1 checked |
| 3.4 | lrs95 Lemma 3.2 | Text not read; contour signs and the dual argument nY/(fq^d) checked |
| 4.2b | katz-gkm §4.0 pp.47–48, Thm 4.1.1 pp.48–49, §4.3 p.59, Thm 5.1 pp.63–64 (katz-gkm line 1845, 1871, 1892, 1902, 2266, 2392, 2412, 2424) | Verified: rank Σb′ᵢ with bᵢ=1 gives k; weight k−1; trace sign (−1)^(k−1) with geometric Frobenius; Swan 1; tame at 0; convolution rank, weight and trace laws |
| 4.3 | lrs95 (3.18)–(3.20) | Text not read; identity verified at q=3 (k=1,2) and q=5 (k=2, r=1,2) |
| 4.4 | lrs95 Prop. 3.1 | Text not read; Y=Q^((d+1)/2) balances primal and dual errors to the stated exponent |
| 4.5 | lrs95 Prop. 3.1 | Text not read; region σ>1−2/(m²+1) checked |
| 5.2 | lrs95 §1 | Text not read; arithmetic checked |
| 5.3 | lrs95 Thm 1.1 | Text not read |
| 5.4 | lrs95 Thm 1.1; teschl Thm 4.10 p.119 (teschl line 5044, 5053) | Teschl part verified, including the form-domain remark |
| 5.5 | lrs95 §1; teschl Thm 4.10 | Teschl part verified; the scaling is elementary |

The gj78 supplier locators also check out: Definition 3.1.3 and Proposition 3.2 on printed p.485 (gj78 line 528, 538); §3.7 on p.491 (line 721); Theorem 9.3 on p.534 (line 2151); Remark 9.9 on p.541 (line 2384).

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Δ sign convention | 1, y², yˢ | Δ1=0; Δy²=−y²·2=−2y² (div-grad gives +2y²); Δyˢ=s(1−s)yˢ; s=1/2+it gives 1/4+t² | Pass | none |
| Complex form and mean | iu, 1, i | q(iu,iu)=|i|²q(u,u); ∫1=M, ∫i=iM≠0 | Pass | none |
| Gauss sign | q=3, 5 | e(1/3)=−1/2+i√3/2; τ(χ₀)=−1; quadratic τ mod 5=√5 | Pass | none |
| Mellin conventions | Mathlib definitions | prefactor 1/(2π); mellin(φ∘inv,s)=mellin(φ,−s); [1,2]↦[1/2,1] | Pass | none |
| Γℝ junk value | s=0 | Γℝ(0)=0 pointwise; sΓℝ(s)→2 | Pass | none |
| §0.1 | Γ(1), Γ(2), Γ₀(2) | PSL indices 1, 6, 3 give areas π/3, 2π, π; double-counting ±I gives 2π/3 | Pass | none |
| §0.2 | 0, 1, bump b, −Δ, 0-operator | Δ1=0; q[b]>0 versus −q[b]<0; the zero operator fails Check 4 | Pass | maximal domain needed (R01) |
| §0.3 | M=π/3 | ∫1=π/3; ∫i=iπ/3; Cauchy–Schwarz equality at u=1 | Pass | none |
| §0.4 | constant, empty S, eigenvector | Rayleigh 0/M excluded; Weyl sequences give 1/4; eigenvector gives λ | Pass | none |
| §0.5 | ∅, {21/100}, {1/3} | 1/4, 21/100, 1/4 | Pass | none |
| §0.6 | Γ(1), Γ(2) | 1 and 3 cusps; projections (3/π)(π/3)=1 and (1/2π)(2π)=1 | Pass | ownership (R02) |
| §0.7 | ∅, {21/100}, {1/4} | 1/4, 21/100; 1/4∉(0,1/4) gives 1/4 | Pass | none |
| §1.1 | r=1/5, ε=0,1; r=0, 1/2 | λ=21/100 for both parities; 1/4 and 0 lie outside (0,1/4) | Pass | cite AFRG §4.5 (R03) |
| §1.2 | σ=0,1; real quadratic | central exponent 2σ is 0 or 2; θ unitary gives Re=0 | Pass | none |
| §1.3 | r=1/5, θ twist | exponents 2/5, 0, −2/5; sgn·sgn⁻¹=1; θ²θ⁻²=1 | Pass | none |
| §2.1 | m=2, f=4 | d=4, conductor q⁴; |ε(1/2)|=1; |τπ|=2; odd χ shifts the pole to β₀−1 | Pass | none |
| §2.2 | μ=±1/5 | shifts {2/5,0,0,−2/5}; ord_{2/5}A=−1 forces Lχ(2/5)=0 | Pass | none |
| §3.1 | normalized φ on [1,2]; indicator | F₁(1/2)=1, F₁(3)=0; dx-mass 1 versus dy/y-mass log 2≈0.693 | Pass | Check (R06) |
| §3.2 | supp [3,4], x=2; G(w)=w | F₂(2)=0 versus F₁(φ,2)=1; βF₁(φ∘inv)∓φ(1/x) | Pass | Check (R06) |
| §3.3 | (σ,β₀)=(1/2,2/5), (9/10,2/5) | rightmost pole −1/10 and +3/10; log⁴ from order 5 absorbed | Pass | none |
| §3.4 | Y=2, 4 | s=−w turns ∫₍₋₁₎ into −∫₍₁₎, so the dual term has + sign; argument doubles | Pass | none |
| §4.1 | (Q,fπ)=(0,1),(1,1),(2,1),(3,1),(3,5),(3,0) | 0, 0, 0, 1, 0, 0 | Pass | none |
| §4.2 | q=3, 5 | empty sum; values 0, 1, −1; n=1 coefficient 1 | Pass | none |
| §4.2a | 𝔽₂, 𝔽₃ (k=2), 𝔽₅ (ψ=1, k=3) | (−1)ᵏ; −1, 2; 16>15 | Pass | none |
| §4.2b | k=1, 2; convolution | rank k+1, Swan 1, weight k; traces +1, −2 | Pass | none |
| `hyperKloosterman_bound` | 𝔽₅ k=2; k=1; k=0; ψ=1 | 0.382, 2.618 ≤ 2√5≈4.472; 1≤1; 1>0 (excluded by hk); 16>15 (excluded by hψ) | Pass | none |
| §4.3 identity | q=3 (k=1,2); q=5 (k=2); q=7 (k=0) | 0=0, 0=0; 2(0.382+2.618)−1=5; 2(−3.236+1.236)−1=−5; at k=0 both sides are 2 | Pass | Check false (R05) |
| `gauss_power_even_average_bound` | q=5 k=2; q=7 k=1; q=7 k=0 | 5≤18.9; 3·2cos(2π/7)+1≈4.74≤7; at k=0, 2>1 (excluded) | Pass | none |
| §4.4 | d=4, σ=9/10; d=9, σ=4/5 | QY^(1−σ)=Q^(1+(d+1)/2)Y^(−σ) at Y=Q^((d+1)/2); exponents 5/4 and 2; main term 3/4 | Pass | none |
| §4.5 | m=2, 3 | thresholds 3/5 and 4/5; σ=9/10 gives exponent 3/2<2 | Pass | none |
| §5.1 | m=2, 3 | bounds 3/10 and 2/5 | Pass | none |
| §5.2 | r=1/5, 3/10, −1 | λ = 21/100, 4/25 (excluded), −3/4 | Pass | none |
| §5.3 | rationals; noncongruence | 75/400<84/400<100/400; Selberg's noncongruence covers have λ₁→0, so hΓ is necessary | Pass | Lean absent (R01) |
| §5.4 | 0, eigenvector, 2iu, constant 1 | 0≥0; 21/100 both sides; 21/25 both sides; 0<(21/100)M | Pass | none |
| §5.5 | κ=1, 4 | μ/4, 4Δ, threshold 1, gap 21/25; ‖u‖² goes 1→1/4 | Pass | none |
| R01 probe | constant u; E(z,s); noncongruence | excluded by hnc; excluded by hbdd (growth yˢ); excluded by hΓ | Elaborates | add (R01) |
| Layer 0 and 1 examples | cusp cutoff; S₃ | tail ≤ w/R, energy (w/R)∫|χ′|²; fixed dimensions 6, 3, 1 | Pass | none |

## Not verifiable

- **lrs95** (Luo–Rudnick–Sarnak, GAFA 5, 1995) is settled as `uncertified` (paywalled) and was not reopened. I checked no theorem, equation or page number of it against text. Its locators are recorded as uncited text, and the mathematics was checked independently (table above).
- For the same reason I cannot confirm the two misprints in this source recorded at the design stage (normalization before (3.6); the subtraction in (3.12)). Their corrected formulas are consistent with my computations in §§3.1 and 4.2.
- Whether ZerosOfLFunctions' model class covers the twisted self-pair without a bridge to AutomorphicLFunctionsAndLocalFactors' `LDatum` depends on the LFunctions roadmap's record, which I did not resolve.
- Ownership against open pull requests was checked with the roadmaps index of all 330 open heads, not by reading each sibling checkout.

## Source issues

- **Misprint** in teschl at Theorem 2.13, formula (2.60), printed p.72: the source says the domain is defined through the sesquilinear form of q itself while the action subtracts (1−γ)ψ; it should be defined through the scalar product of H_q, as the proof uses; affects nothing.
- **Gap** in teschl at §4.3, inequality (4.31), printed p.118: the source says the lower bound for the infimum over vectors orthogonal to the first eigenvectors follows by taking ψ=ϕₙ, which only bounds it above; it should be derived from the spectral theorem on that orthogonal complement; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2ce573c", "job": "REV-PKG-CongruenceSpectralGap", "model": "opus", "worker": "fable-rev27"} -->
