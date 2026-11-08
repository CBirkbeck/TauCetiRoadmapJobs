<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2234#issuecomment-6654918057 -->
Review (claude) of dbdadd9

Verdict: needs_changes

1. **F01** (P2) Bhatt's quantitative Riemann extension theorem is statable at the pins but absent

   **Location.** `packages/PerfectoidSpacesPartII/Suggested.lean` lines 26–32 (module docstring: "Tau Ceti builds each `O⁺` of a rational subset only presentationwise … the tower, its transition maps and its limit are missing"); `README.md` §1.2 (line 578) and §1.1 (lines 532–536).

   **Claim.** The docstring lists Bhatt's Theorem 4.2 (README §1.2) among the headlines not statable at the pins because the transition maps of the annular tower are missing.

   **Witness.** README §1.1 itself names the carriers: `TauCeti.Huber.PairOfDefinition.completedPlusSubring` for the presentation `({tⁿ, g}, g)` and the comparison morphism `pairHomOfRationalSubsetSubset` as transition (line 536). Bhatt's Theorem 4.2(1)–(2) (BHATT18 line 355) only ever uses one transition `n + c → n` at a time, which is one comparison morphism of the inclusion `X⟨tⁿ/g⟩ ⊆ X⟨t^{n+c}/g⟩`; no functor and no limit is needed. The statement below elaborates at the pins with only the `sorry` warning (3.5 s), from `lake env lean` run in the content checkout.

   **Repair** (tested as written; `[DecidableEq R]` serves the `Finset` literals and may be replaced by `open Classical in`). Add to `Suggested.lean`, after the imports `TauCeti.RingTheory.Huber.LocalizationTopology.Plus` and `TauCeti.AlgebraicGeometry.AdicSpace.Spa.Localization.PlusComparison` (both exist at the pin with built object files), in a `/-! ## Layer 1 -/` section:

   ```lean
   open TauCeti.Huber TauCeti.ValuationSpectrum TauCeti.Huber.PairOfDefinition in
   /-- **Bhatt's quantitative Riemann extension theorem** (Bhatt, Theorem 4.2(2), p. 6), on the
   presentationwise annuli: `X⟨tⁿ/g⟩` is the rational subset of presentation `({tⁿ, g}, g)` with
   localisation `R[1/g]`, `O⁺` of it is `completedPlusSubring`, and the restriction from `n + c` to `n`
   is the comparison morphism of the inclusion of rational subsets. For `R = A[1/t]` perfectoid with
   `A = R°`, `t ∈ R°` a pseudouniformizer with a root system and `g ∈ R°` with a root system, for every
   `m` and `k` there is `c` such that for all `n`, every `x ∈ O⁺(X⟨t^{n+c}/g⟩)` and every `l`,
   `g^{1/p^k} t^{1/p^l} ρ(x)` is congruent modulo `tᵐ O⁺(X⟨tⁿ/g⟩)` to the image of an element of `A`. -/
   theorem bhatt_quantitative_riemann_extension
       (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
       [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] [DecidableEq R]
       (P : PairOfDefinition R)
       (hIplus : ∀ j : P.ringOfDefinition, j ∈ P.idealOfDefinition → (j : R) ∈ powerBoundedSubring R)
       (hAplus : ∀ ⦃a⦄, a ∈ powerBoundedSubring R → IsPowerBounded a)
       (t : ℕ → powerBoundedSubring R) (ht : IsPseudoUniformizer (t 0 : R))
       (htr : ∀ k, t (k + 1) ^ p = t k)
       (g : ℕ → powerBoundedSubring R) (hg : ∀ k, g (k + 1) ^ p = g k)
       (hden : ∀ n : ℕ, HasDenominatorPower P {(t 0 : R) ^ n, (g 0 : R)} (g 0 : R)
         (Localization.Away (g 0 : R)))
       (hsub : ∀ n c : ℕ,
         rationalSubset (powerBoundedSubring R) {(t 0 : R) ^ n, (g 0 : R)} (g 0 : R) ⊆
           rationalSubset (powerBoundedSubring R) {(t 0 : R) ^ (n + c), (g 0 : R)} (g 0 : R))
       (m k : ℕ) :
       ∃ c : ℕ, ∀ n : ℕ,
         letI := locUniformSpace P {(t 0 : R) ^ (n + c), (g 0 : R)} (g 0 : R)
           (Localization.Away (g 0 : R)) (hden (n + c))
         letI := isUniformAddGroup_locUniformSpace P {(t 0 : R) ^ (n + c), (g 0 : R)} (g 0 : R)
           (Localization.Away (g 0 : R)) (hden (n + c))
         letI := isTopologicalRing_locUniformSpace P {(t 0 : R) ^ (n + c), (g 0 : R)} (g 0 : R)
           (Localization.Away (g 0 : R)) (hden (n + c))
         letI := isHuberRing_completion_locTopology P {(t 0 : R) ^ (n + c), (g 0 : R)} (g 0 : R)
           (Localization.Away (g 0 : R)) (hden (n + c))
         letI := locUniformSpace P {(t 0 : R) ^ n, (g 0 : R)} (g 0 : R)
           (Localization.Away (g 0 : R)) (hden n)
         letI := isUniformAddGroup_locUniformSpace P {(t 0 : R) ^ n, (g 0 : R)} (g 0 : R)
           (Localization.Away (g 0 : R)) (hden n)
         letI := isTopologicalRing_locUniformSpace P {(t 0 : R) ^ n, (g 0 : R)} (g 0 : R)
           (Localization.Away (g 0 : R)) (hden n)
         letI := isHuberRing_completion_locTopology P {(t 0 : R) ^ n, (g 0 : R)} (g 0 : R)
           (Localization.Away (g 0 : R)) (hden n)
         ∀ x ∈ completedPlusSubring P (powerBoundedSubring R) {(t 0 : R) ^ (n + c), (g 0 : R)}
             (g 0 : R) (Localization.Away (g 0 : R)) (hden (n + c)),
         ∀ l : ℕ, ∃ a : powerBoundedSubring R,
         ∃ y ∈ completedPlusSubring P (powerBoundedSubring R) {(t 0 : R) ^ n, (g 0 : R)}
             (g 0 : R) (Localization.Away (g 0 : R)) (hden n),
           (pairHomOfRationalSubsetSubset P (powerBoundedSubring R) hIplus hAplus
               {(t 0 : R) ^ (n + c), (g 0 : R)} (g 0 : R) (Localization.Away (g 0 : R)) (hden (n + c))
               {(t 0 : R) ^ n, (g 0 : R)} (g 0 : R) (Localization.Away (g 0 : R)) (hden n)
               (hsub n c)).toRingHom
             (toCompletionLoc P {(t 0 : R) ^ (n + c), (g 0 : R)} (g 0 : R)
               (Localization.Away (g 0 : R)) (hden (n + c)) ((g k : R) * (t l : R)) * x) =
           toCompletionLoc P {(t 0 : R) ^ n, (g 0 : R)} (g 0 : R)
               (Localization.Away (g 0 : R)) (hden n) (a : R) +
             toCompletionLoc P {(t 0 : R) ^ n, (g 0 : R)} (g 0 : R)
               (Localization.Away (g 0 : R)) (hden n) ((t 0 : R) ^ m) * y :=
     sorry
   ```

   The hypotheses `hden` and `hsub` are presentation plumbing that always holds (`tⁿ` is a unit, so `{tⁿ, g}` generates the unit ideal and the denominator condition is met; `|tⁿ| ≤ |g|` implies `|t^{n+c}| ≤ |g|` since `|t| ≤ 1`); as hypotheses they weaken nothing. Clause (1) of Theorem 4.2 (almost injectivity of `f_n`, with `g` almost regular modulo `tᵐ`) is stated the same way; the derived form §1.3 (derived tensor products over presentationwise rings) and the limit form §1.5 (a limit over presentations) stay in the not-statable list, with the reason corrected to "no functor on the rational subsets and no limit over them". Then: move §1.2 to the docstring's "Stated here" list with the new name, backtick the name at README §1.2 (line 578 ff.) and in the §1.1 sentence on the intended signature, and keep the statement of the constant `c = pᵏm` as a README Check (the Lean asserts existence of `c`, as Bhatt's statement does).

2. **F02** (P3) a Tau Ceti declaration cited in the wrong namespace

   **Location.** `README.md` lines 222, 536, 553, 699: `TauCeti.Huber.PairOfDefinition.pairHomOfRationalSubsetSubset`.

   **Claim.** The comparison morphism of an inclusion of rational subsets is `TauCeti.Huber.PairOfDefinition.pairHomOfRationalSubsetSubset`.

   **Witness.** At the pin the declaration is `TauCeti.ValuationSpectrum.pairHomOfRationalSubsetSubset`: `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/PlusComparison.lean` line 219, inside `namespace TauCeti.ValuationSpectrum` opened at line 71 and closed at line 401; the name `TauCeti.Huber.PairOfDefinition.pairHomOfRationalSubsetSubset` does not exist (grep of the pinned Tau Ceti). The other two names of that bullet, `completionLocObj` and `completedPlusSubring`, are correctly in `TauCeti.Huber.PairOfDefinition` (`LocalizationTopology/CompleteSeparated/Basic.lean` line 91, `LocalizationTopology/Plus.lean` line 116).

   **Repair.** Replace the four occurrences by `TauCeti.ValuationSpectrum.pairHomOfRationalSubsetSubset` (and add its file, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/PlusComparison.lean`, to the From Tau Ceti bullet).

3. **F03** (P3) a Check names Mathlib's inverse perfection for the perfect closure

   **Location.** `README.md` lines 1056–1057 (§2.7, fourth Check): "`ucolim K^{1/p^i}` is the completed perfection of `K`, agreeing with Mathlib's `Perfection`-based perfection followed by completion".

   **Claim.** The uniform colimit of the `K^{1/p^i}` is the completion of Mathlib's `Perfection K p`.

   **Witness.** `Mathlib/RingTheory/Perfection.lean` line 39 defines `Perfection α p` as the inverse limit along Frobenius (compatible sequences `f (n + 1) ^ p = f n`). For `K = 𝔽_p(T)` this is `⋂_n K^{p^n} = 𝔽_p`, while `ucolim K^{1/p^i} = 𝔽_p(T^{1/p^∞})^∧` (ANDRE18A line 1316, Exemple 2.9.3(1): the completion of the perfect closure). The direct limit along Frobenius is `PerfectClosure K p`, `Mathlib/FieldTheory/PerfectClosure.lean` line 68. `Perfection` is the right name for §3.1's `A^♮ = ulim_F A` (inverse perfection), where the README uses it correctly.

   **Repair.** In the §2.7 Check write "agreeing with the completion of Mathlib's `PerfectClosure K p`, the direct limit along Frobenius; Mathlib's `Perfection K p` is the inverse limit and gives `𝔽_p` for `K = 𝔽_p(T)`", and add `PerfectClosure` to the From Mathlib bullet "Perfection and fields".

4. **F04** (P3) the extension argument for almost-pro-zero towers chooses its indices in the wrong order

   **Location.** `README.md` lines 357–360 (§0.1, fifth API bullet): "choose transitions into `M″_n` killed by `t^{1/p^{k+1}}` and then into `M′` killed by `t^{1/p^{k+1}}`; the composite into `M_n` is killed by `t^{2/p^{k+1}}`".

   **Claim.** With `n′ ≥ n` chosen for `M″` at the step `n′ → n` and then an index for `M′`, the composite transition into `M_n` is killed by `t^{2/p^{k+1}}`.

   **Witness.** With that order, for `x ∈ M_{n″}` and `a = ρ_{n″,n′}(x)`, the element `t^{1/p^{k+1}} ρ_{n′,n}(a)` maps to zero in `M″_n`, so it lies in the submodule `M′_n`, but nothing places it in the image of `M′_{n″} → M′_n`, which is where the second annihilation acts; the step is not justified. The order that works: first `n′ ≥ n` with `t^{1/p^{k+1}}` killing the image of `M′_{n′} → M′_n`, then `n″ ≥ n′` with `t^{1/p^{k+1}}` killing the image of `M″_{n″} → M″_{n′}`; then `t^{1/p^{k+1}} a` has zero image in `M″_{n′}`, so lies in `M′_{n′}`, and `ρ_{n′,n}` of it is killed by `t^{1/p^{k+1}}`. Value check: `2/p^{k+1} ≤ 1/p^k` iff `p ≥ 2`, as the bullet says.

   **Repair.** Rewrite the parenthetical as: "choose `n′ ≥ n` with `t^{1/p^{k+1}}` killing the image of `M′_{n′} → M′_n`, then `n″ ≥ n′` with `t^{1/p^{k+1}}` killing the image of `M″_{n″} → M″_{n′}`; for `x ∈ M_{n″}` the element `t^{1/p^{k+1}} ρ_{n″,n′}(x)` lies in `M′_{n′}`, so `t^{2/p^{k+1}}` kills `ρ_{n″,n}(x)`, and `t^{2/p^{k+1}}` divides `t^{1/p^k}` because `p ≥ 2`."

5. **F05** (P3) a Check counts the idempotents of the cyclotomic root algebra wrongly

   **Location.** `README.md` line 1237 (§3.2, third Check): "a perfectoid algebra with many idempotents (one for each compatible system of roots of unity)".

   **Claim.** The idempotents of `K⟨1^{1/p^∞}⟩` correspond one to one to compatible systems of `p`-power roots of unity.

   **Witness.** At level `i`, `K[S]/(S^{p^i} − 1)` is the product of `K[S]/(Φ)` over the irreducible factors `Φ` of `S^{p^i} − 1` over `K`, so its idempotents are indexed by the subsets of the set of those factors (`2^{i+1}` of them for `K = ℚ_p`, `2^{p^i}` when `K` contains all `p^i`-th roots of unity); in the completed colimit the idempotents are the clopen subsets of the profinite set of Galois orbits of compatible systems, not the points. The Check's purpose (the universal property chooses no root) is unaffected.

   **Repair.** Replace the parenthetical by "(at level `i`, one for each subset of the irreducible factors of `S^{p^i} − 1` over `K`; in the completed colimit, one for each clopen subset of the profinite set of Galois orbits of compatible systems of `p`-power roots of unity)".

6. **F06** (P3) the source manifest's `cited_for` fields use the design's `RA.` section ids

   **Location.** `packages/PerfectoidSpacesPartII/sources.toml` lines 20, 39, 58, 76, 94: `cited_for = ["RA.0", "RA.1", "RA.5.7", …]`, `["RA.1.1", …]`, `["RA.2.1", "RA.2.5", "RA.5", …]`, `["RA.3.9", "RA.4.4", "RA.5.2", "RA.5.11", …]`, `["RA.1.1"]`.

   **Claim.** The cited sections are `RA.0`, `RA.1.1`, `RA.5.7`, and so on.

   **Witness.** The README has no section with an `RA.` id: its layers are `## Layer 0` … `## Layer 5` and its targets `### 0.1` … `### 5.12` (51 subsections); the `RA.` labels are those of `design/README.md` (`## Layer RA.0`, line 62). The open consumer DirectSummandsAndBigCohenMacaulay cites "PerfectoidSpacesPartII RA.0–RA.5" and "§RA.5 (pure map)"; that drift is the consumer's to repair at its own review, but the manifest is this package's.

   **Repair.** Rewrite each `cited_for` with the README's ids (`RA.0` → `0`, `RA.1` → `1`, `RA.5.7` → `5.7`, `RA.1.1` → `1.1`, `RA.2` → `2`, `RA.3` → `3`, `RA.4` → `4`, `RA.5.4` → `5.4`, `RA.5.6` → `5.6`, `RA.5.12` → `5.12`, `RA.2.1` → `2.1`, `RA.2.5` → `2.5`, `RA.5` → `5`, `RA.3.9` → `3.9`, `RA.4.4` → `4.4`, `RA.5.2` → `5.2`, `RA.5.11` → `5.11`), keeping every other field as recorded.

Six findings: one P2 (a statable headline theorem absent from `Suggested.lean`) and five P3 (a Tau Ceti namespace slip, a wrong Mathlib name in a Check, a reversed choice order in a proof hint, a wrong count in a Check, design-era section ids in the source manifest). No P1. The elaboration passes, the one-tactic probe closes nothing, the dependency check is clean, and the sampled locators are all correct.

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap (PerfectoidSpaces on main is imported by P-section throughout; AbhyankarLemma on main is the classical tame Abhyankar lemma for a regular divisor, SGA 1 / Stacks 0EYG, a different object), no computational algorithm, no copied passage found in the sampled sections, no sorry'd data (every `def`/`abbrev`/`instance` has a real body), no `set_option`, no `lemma`, imports `Mathlib` plus three existing `TauCeti.RingTheory.Huber.*` modules.

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: warnings at lines 88, 206, 262 (`declaration uses sorry`), nothing else, exit 0, 8 s. One-tactic probe on a scratch copy (`first | rfl | (simp; done) | infer_instance | sorry` on each sorried theorem): all three fall through to `sorry`; `simp` makes partial progress on the two set-equality and purity statements and nothing on the flatness statement. `#check @` of all 22 declarations in the same run: types agree with `scratch/signatures.md` and with the README statements (binders `[CharP k p] [PerfectRing k p]`, `g ≠ 0`, `j l : ℕ∞`, universe `u` for the test modules); no section binder lost.

**Headline theorems** (README summary): Bhatt's quantitative Riemann extension and its derived, regularity-free and limit forms (§1.2–§1.5); André's perfectoid Riemann extension (§3.6); nested-systems theorem (§3.11); ramified almost purity (§4.5); perfectoid Abhyankar lemma (§4.7); André's flatness theorem (§5.8); purity of Kummer extensions (§5.9); ramified almost flatness modulo `pᵐ` (§5.12). Stated: §3.6(2) (`riemann_extension_completeIntegralClosure`), §5.8 first assertion (`kummer_almost_faithfullyFlat`), §5.9 in full (`kummer_isPureHom`). Named as not statable with a reason: §1.3–§1.5 (accepted), §3.6(1)(3)(4), §3.11, §4.5, §4.7, §5.12 (accepted: Banach localisations with transition maps and uniform limits, almost categories, almost finite étale algebras, a trace on non-free finite projective modules — Mathlib's `LinearMap.trace`, `Mathlib/LinearAlgebra/Trace.lean` lines 75–76, is `0` without a finite basis, as the docstring says). §1.2 is the exception: R01. Padding: none; the two proved helpers `kummerIntegralStage_mono` and `isIntegral_kummerVar_zeta` are used inside the statements of the headlines (the inclusion map, the membership proof of `kummerZetaSubOne`).

**Library declarations opened at the pins.** Mathlib: `completeIntegralClosure` and `IsAlmostIntegral` (`RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean` 26–31; multiplier form as the README says), `Ideal.mem_iInf_smul_pow_eq_bot_iff` (`RingTheory/Filtration.lean` 392, with `IsNoetherianRing` and `Module.Finite`), `Module.FaithfullyFlat.lTensor_injective_iff_injective` (`RingTheory/Flat/FaithfullyFlat/Basic.lean` 384), `Module.Flat.iff_lTensor_injective` (`RingTheory/Flat/Tensor.lean` 89), `AdicCompletion` (`RingTheory/AdicCompletion/Basic.lean` 171), `smoothingSeminorm` (`Analysis/Normed/Unbundled/SmoothingSeminorm.lean` 521), `AlgebraicGeometry.UniversallyInjective` (`AlgebraicGeometry/Morphisms/UniversallyInjective.lean` 46), `IsIntegralClosure.finite` (`RingTheory/DedekindDomain/IntegralClosure.lean` 175, needs `IsIntegrallyClosed` and `IsNoetherianRing`, as §5.4 assumes), `ModP` (`RingTheory/Perfection.lean` 517, `O ⧸ (p)`), `Perfection` (same file 39), `PerfectClosure` (`FieldTheory/PerfectClosure.lean` 68), `CategoryTheory.Functor.Linear` (`CategoryTheory/Linear/LinearFunctor.lean` 36), `DerivedCategory` (`Algebra/Homology/DerivedCategory/Basic.lean` 87), `CategoryTheory.Tor` (`CategoryTheory/Monoidal/Tor.lean` 44), `CategoryTheory.Abelian.Ext` (`Algebra/Homology/DerivedCategory/Ext/Basic.lean` 118), `Module.annihilator` (`RingTheory/Ideal/Maps.lean` 868), `IsSMulRegular`, `IsIdempotentElem`, `Polynomial.cyclotomic` (`RingTheory/Polynomial/Cyclotomic/Basic.lean` 229), `LinearMap.trace` (`LinearAlgebra/Trace.lean` 75), `Algebra.Etale` (`RingTheory/Etale/Basic.lean` 205), `IsLocalization.Away.invSelf` (`RingTheory/Localization/Away/Basic.lean` 58). Mathlib's `Ideal.Pure` (`RingTheory/Ideal/Pure.lean` 39, a pure ideal) is a different notion from §5.1's module purity; Mathlib has no module or ring-map purity, no almost mathematics and no perfectoid Tate rings (only `RingTheory/Perfectoid/{Untilt,BDeRham,FontaineTheta}.lean`). Tau Ceti: `IsTateRing` (`RingTheory/Huber/Basic.lean` 192), `IsPseudoUniformizer` (165), `PairOfDefinition` (142), `IsBounded` (`Bounded.lean` 89), `IsPowerBounded` (`PowerBounded.lean` 117), `powerBoundedSubring` (433), `topologicallyNilpotentIdeal` (494), `isPowerBounded_of_isIntegral` (459), `IsUniform` (`Uniform.lean` 65), `TauCeti.ValuationSpectrum.rationalSubset` (`RationalSubset/Basic.lean` 142), `PairOfDefinition.completionLocObj`, `PairOfDefinition.completedPlusSubring`, `HasDenominatorPower` (`LocalizationTopology/Basic.lean` 300), `toCompletionLoc` (`LocalizationTopology/Completion.lean` 238). PerfectoidSpaces' `Perfectoid.IsPerfectoidTateRing` (`TauCetiRoadmap/PerfectoidSpaces/Suggested.lean` 374) has exactly the fields restated in this file's class.

**Cross-roadmap citations resolved.** PerfectoidSpaces on main: P0.1, P0.2, P0.3, P0.6, P0.8, P0.9, P0.11, P0.12, P0.14, P0.16, P0.25, P0.26, P0.27, P1.1, P1.2, P1.4, P1.5, P1.7, P1.11, P1.24, P1.25, P1.27, P1.29, P1.30, P2.2, P2.3, P2.4, P2.13, P2.16, P3.10–P3.13, P4.15.4 all exist (README lines 879–11144), and all 30 cited slugs are found; the approximation lemma is inside P2.2 (line 6206) and change of basic setup inside P0.16 (line 2206) as cited; P1.11's criterion is "not discretely valued, `|p| < 1`, Frobenius surjective on `K°/p`", matching the Lean hypotheses `hK`, `hKp`, `hKF`. AdicSpaces (Completed) §2.2 and §3.1; AdicSpacesPartII R0.3 (line 1769), R0.4 (2270, `spectralSeminorm`, uniformization, uniform completed tensor product), R0.9 (affinoid Noether normalisation, line 343); AdicSpacesPartIII R3.5 (`uniform-iff-power-bound`, `uniform-spectral-seminorm`), R3.9 (`gelfand-spectrum-banach-ring`); AdicEtaleGeometry A4.2 (line 9246: `Algebra.galoisTensorMap`, `Algebra.IsFiniteEtaleTorsor`, `of_surjective`) and A4.2a; DerivedModuleAlgebra §0.K.1 (516), §0.2 (626), §1.T.1 (1403, `ModuleTower.lim`, `ModuleTower.limOne`), §1.1 (1573); EnhancedDerivedSheaves E2:towers.2 (1401: `IsProZero`, `IsProIsomorphism`, `proZero_cofinal`); DerivedDeRhamCohomology §1.10 at its open head (`ordinaryFaithfulFlatnessFromCompleteFaithfulFlatness`); DeformationAndDerivedPatchingAlgebra §1.13 at its open head (`flatCompletion_finiteComparison`); PerfectoidQuotients §1.3, §1.4 and PerfectoidShimuraVarieties §1.3 at their open heads; AdicSpacesPartIIPartII's design on the board (Riemann extension theorem for normal rigid spaces). The merge order lists every supplier before this roadmap; depcheck: `233 roadmaps, 2227 edges, 0 problem(s)`, no UPWARD or CYCLE line. No declared gaps (`design/plan.json` `gaps = []`). Downstream: DirectSummandsAndBigCohenMacaulay (open, later in the order) consumes this roadmap and declares the gap `ramified-multielement-kummer` against it; §5.8 already records the multi-element and ramified-base extension as André B Remarque 2.6.1(4). Ownership against open pull requests was checked with the roadmaps grep for "perfectoid Abhyankar", "almost-pro-zero", "uniform Banach", "Kummer tower", "IsPureHom|universally injective", "Riemann extension": the only hits on this roadmap's objects are its consumer; "universally injective" on main (SchemeAndStackFoundations, PerfectoidSpaces P4.9) is the spectral notion, which §5.1 distinguishes correctly.

**Sources.** Manifest: five entries, all `certified`, open-repository copies with sha256; every cited work is recorded. Sampled locators, all correct at the text: §0.2 against BHATT18 line 361 (Theorem 4.2(2), p. 6: uniformly almost-pro-zero, `c = pᵏm`) and line 418 (Remark 4.3, p. 7); §0.4 against line 337 (Lemma 3.6, p. 6, `A`-linear functor, proof through `F(M_n[t^{1/p^k}])`); §1.2 against lines 355–417 (Theorem 4.2 with proof, pp. 6–7, the two cases `e ≥ 1/pᵏ`, `e < 1/pᵏ`) and lines 111–119 (Theorem 1.6, Remark 1.7, pp. 2–3); §2.2 against ANDRE18A lines 591–704 (Sorite 2.3.1, pp. 16–19: gauge, `A_{≤1} = A` discrete / `A_*` otherwise, isometry criterion, `A^† ⊆ A^+ ⊆ A^* = A°`, the six equivalent conditions), 717 (Corollaire 2.3.2, p. 19) and 705–715 (Remarques 2.3.3, p. 19); §2.6 against lines 1256–1281 (§2.8.1, (2.27)–(2.28), p. 31; Exemples 2.8.2; Lemme 2.8.1, pp. 31–32); §2.8 against 1320–1356 (Exemple 2.9.3(2), (2.29)–(2.30), p. 33); §2.9 against 1372–1419 (Proposition 2.9.2, (2.31), pp. 33–34; Corollaire 2.9.3, (2.32), p. 34); §3.1 against 1711–1724 (§3.3.6, (3.10), Proposition 3.3.3, p. 40), 1514–1519 (Proposition 3.2.1, p. 36), 1648–1650 (Proposition 3.3.1, p. 38), 2312–2322 (§3.8.1, pp. 50–51); §3.10 against 2906–2930 (§4.4.2, (4.16), footnote 22, p. 61); §3.11 against 2924–2966 (Théorème 4.4.2 with proof, pp. 61–62; Question 4.4.3); §4.1 against 296–352 (§§1.9.1–1.9.2, (1.1), footnote 6, pp. 8–9) and 326–365 (Proposition 1.9.1 with proof, pp. 9–10); §5.1 against ANDRE18B lines 834–889 (A.1, Lemme A.1.1, p. 89; A.2, Lemme A.2.1, pp. 89–90); §5.2 against 940–962 (A.4, Lemme A.4.1, p. 92; setup `(V, m = m²)` with `m̃` flat, as a basic setup provides); §5.4 against 306–355 (§§2.1–2.3, (7)–(8), p. 78) and 358–366 (§2.4); §5.11 against 589–599 (§3.1, p. 83). Headlines: §3.6 against ANDRE18A 2580–2628 (Théorème 4.2.2, Lemme 4.2.3, pp. 55–56) and 1048–1063 ((2.18)–(2.19), p. 26); §5.8 against ANDRE18B 385 (Théorème 2.5.2, p. 79); §5.9 against 551–562 (Corollaire 2.6.1 with proof, p. 82; the proof covers infinite indices); §5.3 against 228–234 (Lemme 1.1.2, p. 76); §5.12 against 600–615 (Théorème 3.2.1, Corollaire 3.2.2, p. 83); §4.7 against ANDRE18A 56–68 (Théorème 0.3.1, p. 2, three clauses as restated). GR03 Definition 2.4.4 (line 1101, p. 23: flat / faithfully flat = exact / exact and faithful) and Lemma 2.4.2(iii) (1070–1096, pp. 22–23); SCHOLZE12 Lemma 6.4 (line 1393). Page numbers of André A and B are the published ones, as the manifest's version notes say.

**Shape and style.** 51 numbered subsections, each with a `*Needs:*` line, a locator at its claim and a `**Checks.**` list of 3 to 7 bullets (counted mechanically); every definition has an API list; each layer ends with Examples and Dependencies; no LaTeX, no pull-request numbers, no process words, no machine paths; the README's backticked own names are exactly the 22 declarations of `Suggested.lean`.

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §0.1 Bhatt's tower `K°/ϖ^{1/p^n}` almost-pro-zero (Check 1–2) | image of `M_{n′} → M_n` | generated by `ϖ^{1/p^n − 1/p^{n′}}`; `ϖ^{1/p^k}` kills it iff `1/p^k ≥ 1/p^{n′}` iff `n′ ≥ k`; `ϖ^{1/p^{n+r+1}}` does not kill the `r`-step image (exponent `1/p^n − 1/p^{n+r} + 1/p^{n+r+1} < 1/p^n`) | sound |
| §0.1 extension bullet | order of choices | with the bullet's order the element `t^{1/p^{k+1}}ρ_{n′,n}(a)` is in `M′_n` but not shown in the image of `M′_{n″}`; reversed order works; `2/p^{k+1} ≤ 1/p^k` iff `p ≥ 2` | R04 |
| §0.1 Check 5, `t = 1` | constant tower `(ℤ, id)` | almost zero = zero, almost-pro-zero = pro-zero; `(ℤ, id)` not pro-zero | sound |
| §0.2 uniform definition (Check 2) | `N_n = K°/ϖ`, `t = g = ϖ`, `p = 2`, `c(k) = 0`, `k = l = 2` | `ϖ^{1/4}·ϖ^{1/4} = ϖ^{1/2}`, `ϖ^{1/2}·1 ≠ 0` in `K°/ϖ` | sound |
| §0.2 Check 3, `g = 1` | Bhatt's tower, `c` fixed | `c`-step image generated by `ϖ^{1/p^n − 1/p^{n+c}}`, killed by `ϖ^{1/p^l}` iff `l ≤ n + c`; fails for `l > n + c` | sound |
| §0.2 API bullet 1 | `l = k` | `g^{1/p^k} t^{1/p^k} = (tg)^{1/p^k}` | sound |
| §0.3 Check 3 | `ℤ ←p ℤ ←p ⋯`, `t = 1` | `lim¹ = ℤ_p/ℤ ≠ 0`; not pro-zero | sound |
| §0.4 Check 3 | `M ↦ M ⊗_ℤ K°`, `M_n = K°/ϖ^{1/p^n}` | `p ∈ ϖ^{1/p^n}K°` since `|ϖ|^{1/p^n} ≥ |ϖ| ≥ |p|`, so `M_n ⊗_ℤ K° = M_n ⊗_{𝔽_p} K°/p`; `x ⊗ ϖ^{1/p} ≠ 0` as `|ϖ^{1/p}| > |p|` | sound |
| §1.1 Check 2, `g = 0` | presentation | `A/(t^{n/p^k})_k[u^{1/p^∞}]`, killed by every `t^{1/p^j}`: almost zero, consistent with `A⟨tⁿ/0⟩ = 0` | sound |
| §1.2 proof, cokernels | `e ≥ 1/pᵏ`, `c = pᵏm` | `ce ≥ m`, term `0` mod `tᵐ`; `e < 1/pᵏ`: `g^{1/p^k − e} t^{(n+c)e} ∈ A/tᵐ` using `g^{1/p^k}u_n^{1/p^k} = t^{n/p^k}` | sound (BHATT18 lines 409–416) |
| §1.2 Check 1 | `e ≥ 1/pᵏ` | `g^{1/p^k} t^{ce} u_n^e = t^{ce + n/p^k} u_n^{e − 1/p^k}` | sound |
| §1.4 Check 3 | `g = (T, 0)` | kernel `(0) × K°`, `(tg)^{1/p^k} = (t^{1/p^k}T^{1/p^k}, 0)` kills it | sound |
| §1.5 Example 2 | `A = K°`, `g = ϖ`, `|t| ≤ |ϖ|` | `|tⁿ| ≤ |t| ≤ |ϖ|` for `n ≥ 1`: annulus = `X` | sound |
| §2.1 Check 3 | `p = 3`, `ℤ ⊆ ℤ[i]` | `(a+bi)³ ∈ ℤ` iff `b(3a² − b²) = 0` iff `b = 0`; arguments of Gaussian integers in `(π/4)ℤ ∪ {irrational·π}` (Niven), `(π/4)ℤ ∩ (π/3ⁿ)ℤ = πℤ` | sound |
| §2.1 Check 4 | `ℤ`, `g = 2`, `s = a/2^e` | `2^m sⁿ ∈ ℤ` for all `n` forces `en ≤ m` for all `n`, so `e = 0` | sound |
| §2.2 Check 2 | `A = K° + K°°T·K°[T]` | `ϖ^{-s}T ∈ A` iff `s < 0`, so `|T| = 1`; `A_* = K°[T]` | sound |
| §2.2 Check 3 | `A = K°[T, ϖ^{-1}T²]` | coefficient of `T` in `K°`: `|T| = 1`; `T² = ϖ·(ϖ^{-1}T²)`: `|T²| ≤ |ϖ|`; `ϖ^{-1/2}T`: `r = −1/2`, gauge `|ϖ|^{-1/2} > 1` | sound |
| §2.2 Check 4 | `ℤ_p + pT·ℤ_p[T]` | `p^{-s}T ∈ A` iff `s ≤ −1`: gauge of `T` is `p`; `⋂_{s ≥ 1} p^{-s}A = p^{-1}A ≠ A` | sound |
| §2.3 Check 4 and §3.6 Check 3 | `B = K + (ΣT₁^{1/p^m}P)^−`, `g = T₁` | `T₂ ∉ B`, `T₁^{1/p^m}T₂ ∈ B`; `x ∈ P°` gives `T₁x ∈ B°` so `P° ⊆ B°[1/T₁]`; saturation `= P°` | sound |
| §2.4 Check 3 | `K⟨T⟩{λ²/T²}` | `λ/T = λ^{-1}TU`; coefficient of `T^{-1}` is `Σ_j a_{2j−1,j}λ^{2j} = λ`, some `|a_{2j−1,j}| ≥ |λ|^{1−2j} ≥ |λ|^{-1}` | sound |
| §2.4 Check 4 | `A = K×K`, `λ = ϖ`, `g = (ϖ², 1)`, `a = (1, ϖ²)` | first factor `K⟨U⟩/(ϖU − 1) = 0` (`ϖU − 1` unit, `|ϖ| < 1`), second `K⟨U⟩/(U − ϖ) = K`; quotient norm `q²`; `inf_m max(q^m, q^{2−m}) = q` (m = 0: 1, m = 1: q, m = 2: 1) | sound; refutes ANDRE18A line 1158 |
| §2.4 Check 5 | same `A`, `λ = ϖ³`, `μ = ϖ` | `A{ϖ³/g} = K × K`, `A{ϖ/g} = 0 × K`; restriction kills the first factor, `g` a nonzerodivisor | sound; refutes ANDRE18A line 1193 |
| §2.5 Check 3 | `B = K⟨T⟩`, `f = ϖT`, `λ = ϖ²` | `ϖ(ϖU − T) ∈ (ϖ²U − ϖT)`; `ϖU − T = (ϖ²U − ϖT)h` would force `1 = ϖh` | sound |
| §2.6 Check 4 | `Σ T^n/ϖ^{⌊√n⌋}` | `q^{-⌊√n⌋} r^n → 0` for `r < 1`; `sup_n q^{-⌊√n⌋} r_i^n → ∞` as `r_i → 1` | sound |
| §2.7 Check 4 | `K = 𝔽_p(T)` | `Perfection K p = ⋂ K^{p^n} = 𝔽_p`; `ucolim K^{1/p^i} = 𝔽_p(T^{1/p^∞})^∧ = (PerfectClosure K p)^∧` | R03 |
| §2.8 Check 1 | `A = K`, `g = 1`, level 1 | char 0: `K[S]/(S^p − 1)` reduced of dimension `p`; char `p`: `(S − 1)^p = 0`, uniformization gives `K` | sound |
| §3.0 Check 2 | `ℚ_p` | `ϖ^p ∣ p` forces `p^{-1/p} ≤ |ϖ| < 1`, no such `ϖ ∈ ℤ_p` | sound |
| §3.0 Check 3 | `ℂ_p[ε]/(ε²)` | `(ε/p^n)² = 0`: power-bounded for all `n`; `R°/p = ℂ_p°/p`, Frobenius surjective | sound |
| §3.1 Check 2 | `K⟨T⟩^♮` | `K⟨T⟩♭ = lim_F (K°/ϖ)[T]`: a `p^n`-th power for all `n` has degree `0`, so `= K♭°`; `K⟨T⟩^♮ = K` | sound |
| §3.2 Check 3 | `K⟨1^{1/p^∞}⟩`, `K = ℚ_p` | level `i`: factors `Φ_{p^j}`, `j ≤ i`: `2^{i+1}` idempotents, not one per compatible system | R05 |
| §3.5 Check 3 | `R = K°/ϖ^r`, `T ↦ 0`, `r = 1` | `R[j] = k_K[U^{1/p^∞}]`, `lim_j R[j] = k_K`, kernel `K°°/ϖ`; `ϖ^{1/p}·ϖ^{1/p²} = ϖ^{1/p + 1/p²} ≠ 0` mod `ϖ` | sound |
| §3.6(2) Lean form | `g` a unit, `R = K`, `g = ϖ` | LHS `{b : |b| ≤ |ϖ|^{-1/p^m} ∀m} = K°`; RHS `{b : powers bounded} = K°` | sound |
| §3.6(2) Lean form | zero ring | both sides `{0}`; `0 ∈ nonZeroDivisors 0` | sound (not vacuous elsewhere) |
| §4.1 Check 3 | `ℤ ⊆ ℤ[i]`, `G = ℤ/2` | images `(1,1), (i,i), (i,−i), (−1,1)`; determinant of the `4×4` real matrix `= 2·(−2)`, index `4`, cokernel `(ℤ/2)²` | sound |
| §4.1 Check 4 (convention witness) | `B = A × A`, swap | André: `(1,0)⊗(0,1) ↦ ((0,0),(0,1))`; A4.2: `↦ ((0,0),(1,0))`; `(1,0)⊗(1,0) ↦ ((1,0),(0,0))` under both | sound |
| §4.2 Check 4 | `ℚ(2^{1/3})` | `T = ℚ(2^{1/3}, ζ₃)`, degree `6 = |S₃|`, `Gal(T/S) = S₂` | sound |
| §4.7 Check 2 | `Y^ℓ = T`, `ℓ ≠ p` | `a p^k + bℓ = 1`: `(T^{1/ℓ})^a T^{b/p^k} = T^{1/(ℓp^k)}` | sound |
| §5.1 Check 5 | `R = K[x,y]/(xy)`, `S = K[x] × K[y]` | `(x+y)(1,0) = (x,0)`; `(x+y)(a + xf + yg) = x` forces `a = 1` and `a = 0` | sound |
| §5.2 Check 2 | `K°° ⊆ K°` | kernel after `⊗ K°/ϖ`: `ϖK°/ϖK°° ≅ K°/K°°`, nonzero, killed by `K°°` | sound |
| §5.2 Check 5 | `V = ℤ`, `m = V`, `M = ℚ` | `ℚ ⊗ ℤ/2 = 0`, `ℤ/2 ≠ 0`: faithfulness clause fails, flatness holds | sound |
| §5.3 Check 2 | `R = S = K°`, `M = K°/K°°`, `K = K°°` | `K·M = 0`, `R ∩ K ≠ 0`, `M ≠ 0`, `R` not Noetherian | sound |
| §5.4 Check 3 | `n = 0`, `p` odd, `g = p²`, `(0,1)` | `y = X^{(p+1)/2}/p`, `y^p = p^{p+1}/p^p = p`; coefficient `1/p ∉ ℤ_p`, `(p+1)/2 ≤ p−1` | sound |
| §5.4 Check 5 | `n = 1`, `g = T₁`, `j = l = 1` | `X^p − T₁ = (X − S)∏_{ζ≠1}(X − ζS)`, `S = T₁^{1/p}`, factors of degree `< p` nonzero, product `0` | sound |
| §5.4 Check 6 | `p = 2`, `g = 1`, `(0,1)` | `ℚ₂[X]/(X² − 1) ≅ ℚ₂ × ℚ₂`, integral closure `ℤ₂ × ℤ₂` | sound |
| §5.4 encoding | stages | `W(k)⟦T⟧[S]/(S^{p^j} − T) = W(k)⟦S⟧` (basis `1, …, S^{p^j−1}` on both sides); `W(k)[ζ_1, …, ζ_J]/(relations) = W(k)[X]/Φ_{p^J}` since `Φ_{p^J}(X) = Φ_p(X^{p^{J−1}})`; transitions finite free then localised, hence injective | sound |
| §5.4 Check 7 and `kummerAlmostIdeal` | `n = 0` | `v(ζ_{p^j} − 1) = 1/(p^{j−1}(p−1)) → 0`, ideal `= K°°_∞`; `ζ_p − 1 ∉ pK°_∞` | sound |
| §5.5 Check 3 | idempotency | `|ζ_{p^j} − 1|² ≥ |x|` for some `j`; `x = (ζ−1)·((ζ−1)u)` | sound |
| §5.8 Check 3 | `n = 0`, `g = p` | `K°°_∞Â°_∞∞ = {|x| < 1}` (as `|ζ_{p^j} − 1| → 1`), quotient `= k ≠ 0`; torsion-free over a valuation ring: flat; faithfully flat on the nose | sound |
| §5.9 Checks 2–3 | `ℤ_p → ℤ_p[p^{1/p}]`; `ℤ₂ → ℤ₂ × ℤ₂` | split by the coefficient of `1`; by the first projection | sound |
| §5.11 Check 5 | `n = 0`, `g = p` | residue field of `Â°_∞∞` is `k` (value group of `K_∞` already `p`-divisible, `k` perfect: defect extension, `f = 1`); every element `=` lift in `K°_∞` `+` element of `K°°_∞Â°_∞∞` | sound |
| §5.12 injectivity of `A/pᵐ → B/pᵐ` | `a = pᵐ b` | `b = a/pᵐ ∈ A[1/p]` integral over normal `A`: `b ∈ A` | sound |
| `IsPureHom` | identity, `ℤ → ℤ[1/2]` | `P ⊗ R → P ⊗ R` injective; `ℤ/2 → ℤ/2 ⊗ ℤ[1/2] = 0` not injective | sound |
| `IsAlmostZero`, `m = 0` and `m = V` | any `N` | every `N` almost zero; almost zero = zero | sound |
| `kummer_almost_faithfullyFlat` module structure | `AdicCompletion (pA°_∞0) A°_∞∞` | `I^n • A°_∞∞ = pⁿA°_∞∞`: the `p`-adic completion `Â°_∞∞` as an `A°_∞0`-module; `m = K°°_∞A°_∞0` idempotent since `K°°_∞` is | sound |
| `kummer_isPureHom` | `j = l`, `n = 0`, `g = 1`, `(0,1)` | `W(k) → ∏_{d | p} W(k)[ζ_d]` split by the factor `d = 1` | sound |
| Bhatt §1.2 statability | presentationwise carriers | scratch statement elaborates, only `sorry` warning | R01 |

## Not verifiable

- ANDRE18B's arXiv version 1 (the manifest's version note and the README's last correction item describe its Théorème 2.5.1, Lemme 1.1.2 and §5.5): the preprint is not in the cache and was not fetched; the published text, which every locator uses, was read.
- GR03 Theorem 3.5.28, Lemma 5.2.1, Remark 3.1.3, Proposition 2.4.35 and Definition 2.2.25 (cited in §4.4, §5.2, §5.11): locators exist in the text (lines 3371, 5263, 1888, 1410, 702) but their contents were not checked against the statements, which are outside the sample.
- BHATT18 Proposition 5.1 and Theorem 5.4 (cited through DerivedDeRhamCohomology §1.10 and in a §0.4 Check): not read beyond their locators (lines 451, 563).

## Source issues

- **Error** in ANDRE18A at §2.6.2 (property list after (2.24)) and Lemme 2.6.3 (proof), printed pages 28–29: the source says the norm of the image of `a` in `A{λ/g}` is the infimum over `m` of `|(g/λ)^m a|`, and that this infimum is at least `1` when `|λ| ≤ |ga|`; it should be the Banach quotient norm, which for `A = K × K`, `λ = ϖ`, `g = (ϖ², 1)`, `a = (1, ϖ²)` is `|ϖ|²` against the infimum `|ϖ|`, and the lower bound is `|a|`; affects the proof (the lemma's conclusion holds by detection at a bounded multiplicative seminorm).
- **Error** in ANDRE18A at Remarque 2.6.4(1), printed page 29: the source says every map `A{λ/g}^u → A{μ/g}^u` is injective; it should exclude the case shown by `A = K × K`, `g = (ϖ², 1)`, `λ = ϖ³`, `μ = ϖ`, where the restriction kills the first factor although `g` is a nonzerodivisor; affects a stated result (a remark used by no theorem).
- **Misprint** in ANDRE18A at formula (2.17), §2.5.3(1), printed page 26: the source inverts `p` in the middle term; it should invert `ϖ` (in characteristic `p` inverting `p` gives the zero ring); affects nothing.
- **Misprint** in ANDRE18A at Lemme 2.5.3, proof of (2) ⇒ (6), printed page 27: the source invokes condition (1); it should invoke condition (2), the elements `ϖ^{m/pⁿ}g^{m/pⁿ}b` lying in `B[1/g]`; affects nothing.
- **Misprint** in ANDRE18B at §1.2.1, formula (2), printed page 77: the source reads "if the valuation of `K` and discrete"; it should read "is discrete"; affects nothing.
- **Misprint** in ANDRE18B at Lemme A.2.1, proof of (4), printed page 90: the source takes the functional in `Hom_S(S, R)`; it should be `Hom_R(S, R)`; affects nothing.
- **Gap** in ANDRE18B at Lemme A.2.1, proof of (c) ⇒ (b), printed page 90: the source takes a single pair `(s, š)` with `š(s) = 1`; a generator only gives finitely many pairs with `Σ š_i(s_i) = 1`, and the retraction is `t ↦ Σ š_i(s_i t)`; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dbdadd9fcd60499cd7c3abdbf8555d2eebd46631", "job": "REV-PKG-PerfectoidSpacesPartII", "model": "fable", "worker": "chris-x19"} -->
