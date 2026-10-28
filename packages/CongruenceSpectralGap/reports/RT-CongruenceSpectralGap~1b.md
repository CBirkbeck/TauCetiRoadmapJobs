<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/957#issuecomment-6393075561 -->
Red team round 1 pass b (claude) of 4e34392

Verdict: needs changes

1. **F01** (P2) gap:all-prime-self-pair-positivity asks for a boundary fact AL.3 already supplies

   - Location: `packages/CongruenceSpectralGap/README.md:98` ("and continuous pole-subtracted boundary values on Re(s)≥1"); same clause in `design/plan.json` gap `all-prime-self-pair-positivity`; consumed at README:358 ("checking boundary continuity of the pole-subtracted finite L function").
   - Claim: the supplier must provide that `L(s,π×π̃) − c/(s−1)` extends continuously to `Re s ≥ 1`.
   - Witness: `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2239` (*Continuation and the Rankin–Selberg pole criterion*: `Λ(s,π×π∨)` continues meromorphically with simple poles only at 0 and 1) and `:2263` (*Rankin–Selberg nonvanishing on the boundary*: no zeros on `Re s ≥ 1`, poles there only at `1+it` with `π₂ ≅ π₁∨⊗|det|^(−it)`, removed finite factors regular and nonzero on that boundary). For the self-pair the twist condition forces `t = 0`. The archimedean factor `A(s)=∏Γℝ(s−μⱼ−conj μₖ)` is regular and nonvanishing on `Re s ≥ 1` (its poles have real part `≤ β₀ < 1`, Mathlib `Complex.Gammaℝ_eq_zero_iff`), so dividing gives the finite function's continuation with the single simple pole at 1, i.e. the requested boundary continuity. Instance: `m=2`, `μ=±1/5`: `A` has poles at `2/5, 0, 0, −2/5` minus even naturals, none on `Re s ≥ 1`.
   - Repair (README:98 and the plan's `needs`): "What AutomorphicLFunctionsAndLocalFactors must provide (gap:all-prime-self-pair-positivity): For unitary cuspidal GL_m over ℚ provide nonnegative full finite self-pair coefficients including ramified primes, with coefficient one at n=1, and a positive residue of the finite self-pair L-function at s=1." In §2.1's route (README:358) replace "checking boundary continuity of the pole-subtracted finite L function" by "the continuity of the pole-subtracted finite function on Re s≥1 follows from AL.3 Continuation and the Rankin–Selberg pole criterion and Rankin–Selberg nonvanishing on the boundary, after dividing by A(s), which is regular and nonzero there". The two remaining clauses are not stated by AL.3 at its head (I searched its AL.3 targets for coefficient nonnegativity and residue positivity: absent).

2. **F02** (P3) process narrative in the README

   - Location: `packages/CongruenceSpectralGap/README.md:767` ("The manifest records this work as uncertified; these are published locators without certification of the source text.").
   - Claim: policy forbids process narrative in the README; the citation status belongs to `sources.toml` (`status = "uncertified"`, already recorded).
   - Repair: delete that sentence. The locators stay.

3. **F03** (P3) conventions attributed to specific displays of a text nobody read

   - Location: `packages/CongruenceSpectralGap/README.md:761` ("At lrs95 p.395 before (3.6), unit ordinary-integral mass does not imply Mellin value one: multiplicative mass does. At lrs95 p.397, the principal subtraction in (3.12) includes every coprime n, including n≡±1").
   - Claim: the roadmap states what two displays of lrs95 do and corrects them.
   - Witness: `sources.toml` records lrs95 as `uncertified` ("cited by its locator without the text"), and `reports/PKG-CongruenceSpectralGap.md:73` says the locators come from the design, not from reading the text. A citation that was never read cannot support a claim about the content of a particular display, and the sentence reads as an erratum of the source.
   - Repair: replace the two sentences by the roadmap's own conventions without page attribution: "The cutoff is normalized by its multiplicative mass, mellin(φ,0)=1, not by ordinary unit mass. The principal-character subtraction of §4.2 runs over every n coprime to q, including n≡±1; at n=1, q=5 the coefficient is 1, not 2." Keep the following sentence ("These conventions leave Proposition 3.1's main term and the final constant unchanged.").

4. **F04** (P3) vacuous API fact: proof irrelevance

   - Location: `packages/CongruenceSpectralGap/README.md:128` ("Prove independence of F and of the proof of congruence") and `:136` ("Changing the proof of IsCongruenceSubgroup does not change μΓ.").
   - Claim: an API theorem that μΓ does not depend on which proof of congruence is supplied.
   - Witness: `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:163` at the pin: `def IsCongruenceSubgroup (Γ : Subgroup SL(2, ℤ)) : Prop := ∃ N ≠ 0, Gamma N ≤ Γ`. Two proofs of a `Prop` are definitionally equal, so the fact is `rfl` and tests nothing.
   - Repair: at :128 write "Prove independence of F, and prove 0<μΓ(XΓ)<∞." and delete the bullet at :136. (The genuine independence, of the fundamental domain, stays as the first bullet.)

5. **F05** (P3) forward reference §0.4 → §0.6 inside Layer 0

   - Location: `packages/CongruenceSpectralGap/README.md:199` ("Use §0.6 to prove 0≤λ′₁(Γ)≤1/4"), `:207` ("λ′₁(Γ)≤1/4"), `:218` (*Needs:* "§§0.2–0.3 and 0.6 … AutomorphicSpectralTheory §4.8 and gap:all-level-spectral-realization"); acknowledged at `:120` and `:124`.
   - Claim: §0.4 needs the later §0.6.
   - Witness: §0.6's *Needs* (`:256`) is §0.2 and suppliers only; §0.7 (`:272`) already needs §§0.3–0.6. The build order is 0.1, 0.2, 0.3, 0.6, 0.4/0.5, 0.7, which the numbering contradicts.
   - Repair: move the upper bound out of §0.4: delete "Use §0.6 to prove 0≤λ′₁(Γ)≤1/4; the definition itself uses only the operator and mean-zero subspace." at :199, replacing it by "Prove 0≤λ′₁(Γ)."; delete the bullet "λ′₁(Γ)≤1/4." at :207 and the first Check at :212; in §0.7 add the API fact "λ′₁(Γ)≤1/4: the continuous spectrum of §0.6 begins at 1/4 and supplies Weyl sequences in HΓ⁰." (its Check "If SΓ=∅, its clipped bottom is 1/4" at :266 already covers the instance); set §0.4's *Needs* to "§§0.2–0.3; SelfAdjointSpectralTheory SA-E01–SA-E13; UnboundedOperators UO-A01–UO-A03, UO-D06 and gap:form-rayleigh-core" and add "AutomorphicSpectralTheory §4.8 and gap:all-level-spectral-realization" to §0.7's *Needs*. Also change `:124` to "The upper bound 1/4 for the positive bottom is proved in §0.7 from §0.6."

6. **F06** (P3) the promised agreement with the base's Γ₀(N) operator is not a named target

   - Location: `packages/CongruenceSpectralGap/README.md:7` ("and proves agreement on Γ₀(N)") and `:151` ("with a canonical agreement comparison on that family"); the §0.2 API list (`:155–161`) has no such fact.
   - Claim: §0.2 compares ΔΓ with the base roadmap's realization on Γ₀(N).
   - Witness: `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:1313` (§1.16a) constructs `modular_laplacian_realization` on `Γ₀(N)/{±I}\ℍ` with the same maximal-domain description; nothing in §0.2 names it, so the prose promises an interface with no target and no hypotheses.
   - Repair: add to the §0.2 API list: "For Γ=Γ₀(N), N≥1, ΔΓ equals `modular_laplacian_realization` of AutomorphicSpectralTheory §1.16a, with equal domains and actions, under the identification of Γ₀(N)/{±I}\ℍ with XΓ of §0.1; the action kernel is {±I} for every N, since −I∈Γ₀(N)." and add "AutomorphicSpectralTheory §1.16a" explicitly to the comparison's *Needs* (it is already in §0.2's *Needs* line).

7. **F07** (P3) `LFunctions.AnalyticLFunctionData` is cited without its owner

   - Location: `packages/CongruenceSpectralGap/README.md:102` (gap text: "as an `LFunctions.AnalyticLFunctionData` record") and `:106` ("`continuedL` of an `LFunctions.AnalyticLFunctionData` record"); Layer 3 Dependencies `:489`.
   - Claim: the record is part of the ZerosOfLFunctions contract.
   - Witness: `TauCetiRoadmap/ZerosOfLFunctions/README.md:160–185` ("From the L-functions roadmap": the data record `LFunctions.AnalyticLFunctionData` with `HasDirichletAgreement`, `HasMeromorphicContinuation`, `HasFunctionalEquation`, `HasAverageCoefficientBound` is supplied by LFunctions Layer 0; ZerosOfLFunctions owns `continuedL`, Layer 1.6, and the strip bound, Layer 3.3). LFunctions is open pull request #248 (new roadmap, another author), which the README never names. The `roadmaps resolve` tool does not catch this because the name resolves at ZerosOfLFunctions' head.
   - Repair: in the ZerosOfLFunctions contract (`:106`) prepend "The record `LFunctions.AnalyticLFunctionData` and its four hypothesis predicates (`HasDirichletAgreement`, `HasMeromorphicContinuation`, `HasFunctionalEquation`, `HasAverageCoefficientBound`) are owned by TauCetiRoadmap.LFunctions Layer 0 and consumed by ZerosOfLFunctions."; in the gap text (`:102`) write "as a `LFunctions.AnalyticLFunctionData` record of TauCetiRoadmap.LFunctions Layer 0"; add "LFunctions Layer 0" to the Layer 3 Dependencies (`:489`) and a line in Scope and ownership (`:18`). Tested: the depcheck on a scratch copy of the README with the LFunctions citation added reports `48 roadmaps, 536 edges, 0 problem(s)`.

8. **F08** (P3) the finite-place bound's owner is not named, and the base claims the same engine

   - Location: `packages/CongruenceSpectralGap/README.md:22` ("finite-place and number-field parameter refinements … do not enter this part") and `:7`.
   - Claim: the base roadmap stops at the spectral decomposition and this part owns the prime-twist method.
   - Witness: `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:3793–3808` (§7.1a): "prove the Luo–Rudnick–Sarnak bound |α_(i,v)|≤q_v^(1/2−1/(m²+1))" for unitary cuspidal `GL_m` over a number field, with "The quantitative cuspidal bound … constructed here" and *Needs* only AL.2–AL.3. That bound is proved in the literature by the same even prime-twist first moment that Layers 2–4 build here over ℚ (the source §7.1a cites is the 1999 generalisation of lrs95). So two open pull requests describe constructing the twisted-moment engine, the base without naming any of its objects.
   - Repair (this package only): at `:22` write "The finite-place Luo–Rudnick–Sarnak bound over number fields is stated and constructed by TauCetiRoadmap.AutomorphicSpectralTheory §7.1a and is not derived here; §7.1a supplies none of the even prime-twist moment engine of Layers 2–4, which this part owns over ℚ." For the maintainer: §7.1a's route is under-specified at its head; if the base is meant to prove it, the number-field moment (twists by ray-class characters of prime conductor, hyper-Kloosterman sums over residue fields) will duplicate §§2.1, 3.1–3.4, 4.1–4.5 unless one of the two heads cites the other.

Files reviewed: `packages/CongruenceSpectralGap/README.md` (771 lines, every line), `packages/CongruenceSpectralGap/Suggested.lean` (81 lines), `design/plan.json` (`gaps` list), `sources.toml`, both earlier reports. Sibling heads were read through `roadmaps show` dumps (AutomorphicSpectralTheory #925, AutomorphicFormsOnReductiveGroups #1037, AutomorphicLFunctionsAndLocalFactors #924, ArithmeticLocallySymmetricSpaces #871, DeligneWeightsAndPurity #929, GL2AutomorphicRepresentationsAndTransfer #931, UnboundedOperators #1027, ZerosOfLFunctions #253, AnalyticNumberTheoryPartI #1126); line numbers below for those files are README lines at those heads. Mathlib and Tau Ceti were read at the pinned commits from a local git object store (`git show <pin>:<file>`); no Lean was elaborated on this host (no pinned Lake packages here).

## Verified sound

Counts: 4 declarations read (1 def, 3 theorems); 28 targets read (§§0.1–0.7, 1.1–1.3, 2.1–2.2, 3.1–3.4, 4.1–4.5 with 4.2a–4.2b, 5.1–5.5); 18 Mathlib and 7 Tau Ceti declarations located at the pins with their files; 18 source lines verified in the four certified texts plus their printed pages; 46 Checks and worked-example values recomputed (table below); 52 sibling citations checked at the heads or on main.

- **Lean statements.** `hyperKloosterman` (rank-0 value 1 at r=1, else 0; k=1 gives ψ(r)), `hyperKloosterman_bound` (Deligne's bound; Katz 4.1.1 is stated for n≥1, bᵢ=b′ᵢpⁿⁱ with rank Σb′ᵢ, so bᵢ=1 gives rank k in every characteristic: katz-gkm line 1894, line 1897, line 1905), `gauss_power_even_average_bound` (identity Σ_{χ even≠1} χ̄(r)τ(χ)^k=((q−1)/2)(Kl_k(r)+Kl_k(−r))−(−1)^k recomputed from character orthogonality; Mathlib's `(1 : MulChar)` is 0 off units so `gaussSum 1 stdAddChar = −1` for prime q; bound (q−1)k q^((k−1)/2)+1 follows), `congruence_eigenvalue_bound` (true as typed: a bounded C² invariant eigenfunction is in L²(XΓ), has distributional −y²Δu=λu∈L², hence lies in the maximal domain of §0.2; λ=0 forces constancy; λ>0 puts u in HΓ⁰ by ⟨1,Δu⟩=0; sign fixed by −y²Δyˢ=s(1−s)yˢ). Binder context: no `variable` block, so nothing can be lost; `open … Laplacian in` gives Mathlib's `Δ` (`DerivNotation.lean:270`, instance `InnerProductSpace.instLaplacian`, `Laplacian.lean:138`), `γ • z` is `UpperHalfPlane.SLAction` (`MoebiusAction.lean:282`). Not elaborated here (see Not verifiable); the repair report's `#check @` record was read and agrees with the README statements.
- **Headlines and padding.** Headlines listed from the README: λ′₁(Γ)≥21/100 (§5.3), the parameter bound (§5.1), the prime-twist moment and nonvanishing (§§4.4–4.5), the exact two-kernel equation (§3.4), Deligne's hyper-Kloosterman bound (§4.2b), the Gauss-power average (§4.3), the Rayleigh inequality and rescaling (§§5.4–5.5). Pins have no automorphic representation, Maass form or Kloosterman carrier (grepped Mathlib and Tau Ceti), so the docstring's not-statable list is correct and the eigenfunction form is the statable headline. One-tactic probe by reading: none of the three theorems follows from one library lemma; `gauss_power_even_average_bound` is a corollary of `hyperKloosterman_bound` through an orthogonality identity, not a restatement; no boundary-case or Check-mirroring declaration. No padding.
- **Mathlib contract paraphrases** (`README:44–52`): `IsCongruenceSubgroup` body and `finiteIndex` (CongruenceSubgroups.lean:163, 181); `orbitRel.Quotient` (GroupAction/Defs.lean:349); `MulAction.toPermHom` (Action/End.lean:184); `UpperHalfPlane.volume_def` density `(1/im)²` (Measure.lean:44); `quotientMeasure_eq` with `[Countable G] [SMulInvariantMeasure] [MeasurableConstSMul]` (FundamentalDomain.lean:630); `mellin`, `mellinInv` with prefactor `1/(2π)` (MellinTransform.lean:90, 95), `mellin_comp_inv` (:153), `mellinInv_mellin_eq` with convergence, integrability and continuity hypotheses (MellinInversion.lean:92); `Gammaℝ_eq_zero_iff`, `Gammaℝ_residue_zero` limit 2 (Deligne.lean:75, 104); `sum_characters_eq` under `[NeZero n] [IsDomain R] [HasEnoughRootsOfUnity …]` (Orthogonality.lean:68); `gaussSum` (GaussSum.lean:72); `stdAddChar`, `isPrimitive_stdAddChar` (CircleAddChar.lean:83, 95); `Complex.Gamma_ne_zero`, `differentiable_one_div_Gamma` (Beta.lean:426, 521); Laplacian on ℂ via the basis `1, I` (Laplacian.lean:231).
- **Tau Ceti contract paraphrases** (`README:56–58`): `riemannianVolume_eq_volume` (PoincareMetric.lean:181); `IsSelfAdjoint.isFormalAdjoint` with `[CompleteSpace E]` and `IsFormalAdjoint.im_inner_self_apply` (LinearPMap/SelfAdjoint.lean:76, 82); `energyFormH1`, `energyFormH1L0` (EnergyForm/Sobolev.lean, module docstring :93, :98); `wienerIkehara` with exactly the stated hypotheses and the inclusive `Finset.Icc 1 ⌊x⌋₊` cutoff (SharpCutoff.lean:301); `primeCount_univ_isEquivalent_div_log` (PrimeIdealTheorem.lean:46).
- **Sibling citations at their heads.** AST §§0.6, 0.7, 1.16, 1.16a, 4.3, 4.4, 4.6 (unitary-character twist transport), 4.8 (one family per cusp at higher level), 4.14a: all present and as described. AFRG §§2.5–2.7, 3.1 (`classicalEquiv` with rational stabilizers, Γ₀(N) Check), 3.4–3.5, 4.5 (`MaassCuspForm(Γ,λ)` for finite-index congruence Γ, `maassClassicalEquiv` at level one against the ALS.F.6 PGL₂ cusp space); `genericUnitaryClassification` with complementary exponents 0<β<1/2 (so β₀<1). AL.1 *Canonical archimedean factors*; AL.3 *Global Whittaker factorization*, *The Rankin–Selberg local L-factor*, *Nonarchimedean factors under normalized induction*, *The local Rankin–Selberg functional equation*, *Continuation and the Rankin–Selberg pole criterion*, *The global Rankin–Selberg functional equation*, *Rankin–Selberg nonvanishing on the boundary*, *L-function data and derived products* (`LDatum`), *Niceness with specified root number and conductor* (`IsNicePinned`), *Hecke, eigensystem and Rankin–Selberg data* (`rsDatum π τ`, niceness outside the norm-twist pole case): all present (bold target titles under AL.3's subsection headings). ALS.F.6 with (iii) bounded ⇔ cusp form ⇔ square-integrable and (iv) discrete decomposition with finite multiplicities. DWP §7.12 (Weil II 3.3.4–3.3.10) and Layer DWP.10. GL2 R17.4.13 adjoint lift (self-dual, trivial centre, cuspidal iff no self-twist, self-twist branch by quadratic induction). UO-A01–UO-A03, UO-D06 (Friedrichs without compactness, square-root domain and form identity). ZerosOfLFunctions Layer 1 items 2–5 (item 5: `log‖γ(σ+it)‖=−(πd/4)|t|+A(σ)log|t|+O(1)` uniformly on compact σ-intervals, zeros absent, poles exact) and Layer 3 items 1–3 (strip bound for the pole-cleared `continuedL` on `[−δ,1+δ]`, polynomial in the analytic conductor). ANT-I §3.26 (τ(n)≤C n^ε for all n≥1, no restriction). On main: FuchsianOrbifolds Layers 0–3, DifferentialGeometry Layer 12, PDE Lane A item 1 and Lane E item 20, SelfAdjointSpectralTheory Part C and SA-E01–SA-E13 (E11–E13 are the form bounds from spectral support), GlobalNumberFields Layers 6, 9 (`HeckeCharacter.shift`, `unitaryPart`, `shift_eq_zero_iff`), 10, EtaleCohomologyFoundations F.0–F.6 and F.10.1–F.10.2b, ArithmeticDirichletSeries Layer 6 (Completed). Supplier direction: every cited roadmap is on main, Completed, earlier in `ORDER.txt`, or an open new-roadmap pull request (ZerosOfLFunctions #253, LFunctions #248, UnboundedOperators #1027); no sibling in the brief's list is cited.
- **Gaps.** The seven slugs in `design/plan.json` match the seven README contracts, each in its supplier's subsection with the `What X must provide (gap:slug)` form. Suppliers exist and the cited sections exist. Minimality: gap:self-pair-local-character-transport, gap:finite-rs-polynomial-strips (AL's `rsDatum` is an `LDatum`, not an `AnalyticLFunctionData`, so the bridge is genuinely missing), gap:principal-level-classical-constituents (component set `(ℤ/N)ˣ` and stabilizers Γ(N) recomputed for N=1, 2, 5), gap:all-level-spectral-realization and gap:form-rayleigh-core ask for nothing I could find at the heads or pins. gap:additive-character-sheaf-weight: no roadmap on main or at any open head constructs the ℓ-adic Artin–Schreier sheaf (grepped "Artin–Schreier", "Lang torsor"; the only Kloosterman sheaf elsewhere is the p-adic F-isocrystal of PadicDifferentialEquationsAndRigidCohomology, which this README assigns downstream), so the gap is not for something provided; note for the maintainer, not a finding: its supplier section §7.12 is a weight-bound theorem, and the construction via the Lang isogeny (katz-gkm line 2266) may sit more naturally with EtaleCohomologyFoundations.
- **Ownership.** `hyperKloosterman`, the Kloosterman sheaf over 𝔾ₘ, the quotient Laplacian at arbitrary congruence level and the LRS archimedean bound have no other owner (greps over main and all 352 open roadmap pull requests; essential self-adjointness appears only for Γ₀(N) in AST §1.16a, for spectral triples in SpectralManifolds, and for abstract operators in UnboundedOperators). The one overlap is R08.
- **Depcheck** (run on the package README): `depcheck: 48 roadmaps, 536 edges, 0 problem(s)`. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
- **Policy.** No pull-request numbers; `theorem` only; no `set_option`, `#eval`, `#print`, `True` placeholders or sorry'd data; single `import Mathlib`; every target carries a locator; the diff touches only the package folder. The one process sentence is R02.
- **Sources** (certified texts; `<id> line N` as cited in the README): katz-gkm lines 1845, 1871 (§4.0 product-fibre sums, printed pp.47–48), 1892–1905 (Theorem 4.1.1, p.49, n≥1, rank Σb′ᵢ, weight n−1), 2266 (§4.3 Lang isogeny, p.59), 2392, 2412, 2424 (Theorem 5.1 (1), (4)–(5), (7)–(8), pp.63–64); teschl lines 2914 (Theorem 2.12, p.70), 2960 (Theorem 2.13, p.71), 5044 (Theorem 4.10 min-max, p.119, inside §4.3 which begins at line 4991), 5053 (form-domain remark); gj78 lines 528 (Definition 3.1.3, p.485), 538 (Proposition 3.2, p.485), 721 (§3.7, p.491), Theorem 9.3 at line 2151 (p.534), Remark 9.9 at line 2384 (p.541); bms02 lines 151 (§2.1 minimal/maximal operators, p.4), 196 (Assumption B, p.5), 245 (Corollary 2.10, p.7). All agree with the README's locators and claims.

### Adversarial pass (computed values)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.1 μΓ areas | Γ(1); Γ(2) | π/3; index 6 in PSL₂(ℤ) (−I∈Γ(2)) so 6·π/3=2π | pass | none |
| §0.1 proof independence | two proofs of `IsCongruenceSubgroup Γ` | definitionally equal (Prop) | vacuous | R04 |
| §0.2 sign | y², 1, yˢ | Δy²=−2y²; Δ1=0; Δyˢ=s(1−s)yˢ, s=1/2+it gives 1/4+t² | pass | none |
| §0.2 torsion-free cover | N=1, 2 | Γ(3), Γ(6) torsion-free, normal in SL₂(ℤ), −I excluded | pass | none |
| §0.2 positivity Check | Δu≠0 | ⟨u,Δu⟩=‖Δ^{1/2}u‖²>0 | pass | none |
| §0.2 Γ₀(N) agreement | N=1 | base operator on Γ₀(1)/{±I}\ℍ = XΓ(1); no target names it | interface unnamed | R06 |
| §0.3 mean-zero | u=1, u=i | ∫=μ, iμ ≠ 0; a real-part mean would admit i | pass | none |
| §0.4 definition | bump minus mean | nonzero, in Dom, mean zero | nonempty | none |
| §0.4 → §0.6 | build order | 0.4 needs 0.6; 0.6 needs 0.2 only | forward ref | R05 |
| §0.5 clipped bottom | ∅, {21/100}, {1/3} | 1/4, 21/100, 1/4 | pass | none |
| §0.6 channels | Γ(1), Γ(2), SL₂(ℤ)⊇Γ(2) | 1 cusp; 3 cusps, projection (1/2π)·2π=1; S₃ transitive on 3 cusps gives 1 channel | pass | none |
| gap principal-level components | N=1, 2, 5 | (ℤ/N)ˣ has 1, 1, 4 elements; stabilizer Γ(N) since K(N) is normal in GL₂(ℤ̂) | pass | none |
| §1.1 eigenvalue | r=1/5, ε=0,1; r=0; r=1/2 | 1/4−1/25=21/100 both parities; 1/4; 0 | pass | none |
| §1.2 central exponent | σ=1; σ=0 | 2σ=2 violates unitarity; 0 | pass | none |
| §1.3 adjoint | (sgn\|·\|^r, sgn\|·\|^{−r}) | ratios \|·\|^{2r}, 1, \|·\|^{−2r}; signs cancel; O(3)-spherical | pass | none |
| Layer 1 example | S₃ regular rep | transposition-fixed 3, invariants 1, total 6 | pass | none |
| §2.1 ε at 1/2 | f, q, d | \|τπ\| q^{d/2} (fq^d)^{−1/2} = f^{1/2}q^{d/2}f^{−1/2}q^{−d/2}=1 | pass | none |
| §2.1 no self-twist | q∤fπ | π_q⊗χ_q ramified ≠ π_q; central character forces σ=0 | entire Λ | none |
| §2.1 ramified GL₁ pair | χ_p ramified | L(s,χ_p×χ_p⁻¹)=(1−p^{−s})⁻¹ | pass | none |
| §2.1 boundary continuity | m=2, μ=±1/5 | A poles 2/5,0,0,−2/5−2ℕ, none on Re s≥1; AL.3 gives the simple pole at 1 only | already supplied | R01 |
| §2.2 pole | r=1/5 | shifts {2/5,0,0,−2/5}; rightmost pole 2/5=β₀; Γℝ(0)=0 but sΓℝ(s)→2 | pass | none |
| §3.1 kernel | φ_c=φ(·/c); supp⊂[1,2], x=1/2, 3 | F₁(φ_c,x)=F₁(φ,x/c); 1; 0; mellin(F₁,s)=mellin(φ,s)/s for Re s>0 | pass | none |
| §3.2 G(w)=w | supp [3,4]; x∈(1/4,1/3), 2, 1/5 | βF₁(φ∘inv,x)−φ(1/x) vs +φ(1/x): differ only on (1/4,1/3); 0; 1 | pass | none |
| §3.3 exponents | σ=1/2, β₀=2/5, ε′=1/10 | x^{−1/2}, x^{−1/2}; ∫₀¹=2; pole order ≤ d+1 | pass | none |
| §3.4 identity | contour shift | residue k(0)Lχ(β)=Lχ(β); dual kernel argument nY/(fq^d), power n^{β−1}, root number τπχ(f)τ(χ)^d(fq^d)^{−β} | pass | none |
| §4.1 average | Q=0,1,2,3; fπ=5 | 0; q=2 no χ; q=3 no even χ≠1; q=5 one χ: 1; 0 | pass | none |
| §4.2 orthogonality | q=5: a=0,±1,±2; q=3 | 0, (5−1)/2−1=1, −1; empty | pass | none |
| §4.2a values | 𝔽₂ rank k; 𝔽₃ rank 2 at ±1; 𝔽₅ rank 3 trivial ψ; k=0 | (−1)^k; −1, 2; 16>15; 1 at r=1 else 0 | pass | none |
| §4.2b sign/weight | k=1; k=2 over 𝔽₃, 𝔽₂ | sheaf trace (−1)^{k−1}·raw: +ψ(r); +1/−2; −1; bounds 1, 2√3, 2√2 | pass | none |
| §4.3 identity | q=3,k=1; q=3,k=2; q=5,k=2; q=7,k=0 | 0=−1+1; 0=(−1+2)−1; ±5 ≤ 8√5+1; 2=3(1+0)−1 but bound 1<2 | pass | none |
| §4.4 exponents | d=4,σ=9/10; d=9,σ=4/5; σ=9/10 | 5/4; 2; 3/2; main term (1/2)(3/2)=3/4 | pass | none |
| §4.4 dual bound | Y=Q^{(d+1)/2} | Σ_q q^{−dσ}·dq^{(d+1)/2}·(q^d/Y)^σ ≍ Q^{1+(d+1)/2}Y^{−σ}=Q^{1+(d+1)(1−σ)/2} | pass | none |
| §4.5 region | m=3; m=2 | 1−2/10=4/5; 3/5 (equality gives exponent 2) | pass | none |
| §5.1–5.2 | m=3; m=2; r=1/5; r=−1 | 2/5; 3/10 and 4/25; 21/100; −3/4 (r≥0 needed) | pass | none |
| §5.3 Lean form | u≡1; E(z,3/2); yˢ; level-one cusp form | λ=0 (hnc needed); −(3/4), unbounded (hbdd needed); s(1−s); λ>1/4≥21/100 | true as typed | none |
| §5.3 chain | 3/16, 21/100, 1/4 | 75/400<84/400<100/400, 9/400 | pass | none |
| §5.4 | u=0; 2iu; u=1 | 0=0; 21/25 both sides; 0 < (21/100)μΓ | pass | none |
| §5.5 | κ=1, 4 | μ/4, 4Δ, energy unchanged, threshold 1, gap 21/25 | pass | none |
| Layer 0 example cutoffs | χ_R=χ(y/R), width w | missing mass ≤ w/R; energy (w/R)∫₁²\|χ′\|² | pass | none |
| Layer 3 example | φ=1 on [1,2] | dx mass 1, multiplicative mass log 2 | pass | none |
| Conventions | τ(1) for prime q; q=3 | −1; exp(2πi/3)=−1/2+i√3/2 | pass | none |
| Layer 5 example | (21/100)(π/3)/(8π) | 7/800 | pass | none |
| README:761 | lrs95 p.395, p.397 | text not read (uncertified) | unsupported attribution | R03 |
| README:767 | manifest sentence | process narrative | policy | R02 |
| ZoL contract | `AnalyticLFunctionData` owner | LFunctions Layer 0 per ZoL:160–185 | owner uncited | R07 |
| Scope :22 | AST §7.1a | finite-place LRS bound "constructed here" | overlap unaddressed | R08 |

## Not verifiable

- `lrs95` is `uncertified` (paywalled, settled); every lrs95 locator (Theorems 1.1–1.2, Lemma 2.1, (3.6)–(3.7), Lemmas 3.1–3.2, (3.11)–(3.12), (3.18)–(3.20), Proposition 3.1, pages) is cited by locator alone and was not checked against the text. The mathematics of Layers 2–5 was recomputed independently (table above).
- No Lean was elaborated on this host (no pinned Lake packages); the `#check @` comparison relies on the repair report's record, whose elaborated types I compared with the README statements by reading.
- Ownership against open pull requests was checked through `roadmaps grep` (all 352 at the index of 2026-10-25T02:57:03Z) and by reading the ten supplier heads named above; the other sibling checkouts listed in the brief were not read line by line, only grepped.
- Deligne's bound itself (katz-gkm Theorem 4.1.1 (1)) is cited from Katz, who cites Deligne; the primary text was not opened.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4e34392", "job": "RT-CongruenceSpectralGap~1b", "model": "fable", "worker": "fable-rt21"} -->
