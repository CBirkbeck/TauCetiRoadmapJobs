<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/943#issuecomment-6370081173 -->
Review (claude) of 2e18779

Verdict: needs changes

1. **F01** (P2) A statable §1.5 headline is missing from Suggested.lean, and its docstring says it is not statable

   **Location.** `packages/SolidAnalyticRings/Suggested.lean` lines 13–16: "light integer derived solidification and the product-tensor theorem lack the enhanced derived light null-test solid category". Also lines 66–67: "None of these complete headlines is expressible by a few simple definitions on those carriers."

   **Claim.** The §1.5 headline cannot be stated at the pins. That headline is light solidification as a reflection, `∏_ℕℤ` as a compact projective generator, and derived solidification onto complexes with light-solid cohomology (RC Theorem 3.2.4(2), (5), (6), (12), RC line 757–776).

   **Witness.** With pinned `LightProfinite.NatUnionInfty`, `LightCondensed.free`, `MonoidalClosed.pre` and `DerivedCategory.homologyFunctor`, four real-body definitions state the headline, and the file elaborates with only `sorry` warnings. VStackSheavesAndLisseCategories `Suggested.lean` lines 48–57 states the compact-Hausdorff analogue the same way.

   **Repair.** Add the following block after the namespace line, under `/-! ## Layer 1: Light spectral sheaves and the null-sequence test -/`. I tested it at the pins with `lake env lean`: it gave two `sorry` warnings and nothing else. `#check @` of both theorems printed the intended types. A one-tactic probe (`infer_instance`, `simp`, `rfl`) closes neither theorem, so neither is padding.

   ```lean
   open CategoryTheory Limits MonoidalCategory LightProfinite LightCondensed

   noncomputable section

   /-- The marked shift `n ↦ n + 1`, `∞ ↦ ∞` of `ℕ∪{∞}` (§1.3). -/
   def natShift : ℕ∪{∞} ⟶ ℕ∪{∞} :=
     CompHausLike.ofHom _ ⟨OnePoint.map (· + 1), OnePoint.continuous_map continuous_of_discreteTopology
       (by simpa [Filter.coclosedCompact_eq_cocompact, Filter.cocompact_eq_cofinite,
         Nat.cofinite_eq_atTop] using Filter.tendsto_add_atTop_nat 1)⟩

   /-- The marked point `∞` of `ℕ∪{∞}` (§1.3). -/
   def inftyPoint : LightProfinite.of PUnit ⟶ ℕ∪{∞} :=
     CompHausLike.ofHom _ (ContinuousMap.const _ OnePoint.infty)

   /-- The light null-sequence object `P = coker(ℤ[{∞}] → ℤ[ℕ∪{∞}])` (§1.5). -/
   abbrev nullSeq : LightCondAb :=
     cokernel ((free ℤ).map (lightProfiniteToLightCondSet.map inftyPoint))

   /-- The shift `σ : P → P` induced by `natShift` (§1.5). -/
   def nullShift : nullSeq ⟶ nullSeq :=
     cokernel.desc _ ((free ℤ).map (lightProfiniteToLightCondSet.map natShift) ≫ cokernel.π _) (by
       have h : inftyPoint ≫ natShift = inftyPoint := by ext x; rfl
       rw [← Category.assoc, ← Functor.map_comp, ← Functor.map_comp, h]
       exact cokernel.condition _)

   /-- Light solidity: `1 − σ*` is invertible on the internal Hom out of `P`
   (RC Definition 3.2.1, p.16). -/
   def IsLightSolid : ObjectProperty LightCondAb := fun B =>
     IsIso (𝟙 ((ihom nullSeq).obj B) - (MonoidalClosed.pre nullShift).app B)

   /-- Light solidification exists, and `∏_ℕ ℤ` is a light solid compact projective generator
   (RC Theorem 3.2.4(2) and (12), p.17). -/
   theorem isLightSolid_reflective_and_generator :
       IsLightSolid.ι.IsRightAdjoint ∧
         ∃ h : IsLightSolid (∏ᶜ fun _ : ℕ => (discrete (ModuleCat ℤ)).obj (ModuleCat.of ℤ ℤ)),
           Projective (⟨_, h⟩ : IsLightSolid.FullSubcategory) ∧
           IsFinitelyPresentable (⟨_, h⟩ : IsLightSolid.FullSubcategory) ∧
           IsSeparator (⟨_, h⟩ : IsLightSolid.FullSubcategory) := by
     sorry

   /-- Complexes whose cohomology sheaves are light solid form a reflective subcategory of the
   derived category (RC Theorem 3.2.4(5)–(6), p.17). -/
   theorem derivedLightSolid_isRightAdjoint [HasDerivedCategory LightCondAb] :
       (ObjectProperty.ι (fun K : DerivedCategory LightCondAb =>
         ∀ n : ℤ, IsLightSolid ((DerivedCategory.homologyFunctor LightCondAb n).obj K))).IsRightAdjoint := by
     sorry

   end
   ```

   Add every name in this block to the §1.5 API bullets in the README as a backticked name (`natShift`, `inftyPoint`, `nullSeq`, `nullShift`, `IsLightSolid`, `isLightSolid_reflective_and_generator`, `derivedLightSolid_isRightAdjoint`).

   Then narrow the §1.5 docstring bullet to the parts that really are not statable:
   - the abelian solid tensor (RC Theorem 3.2.4(3)), which needs the solidification functor as data;
   - the derived solid tensor and the derived product-tensor theorem ((8), (11), (13)), because Mathlib's `DerivedCategory` has no monoidal structure at the pin;
   - universes above 0, because Mathlib has `ℕ∪{∞}` only in `LightProfinite.{0}` (Mathlib/Condensed/Light/Sequence.lean lines 20–22).

   Restrict the sentence at lines 66–67 to the remaining bullets.

2. **F02** (P2) EnhancedDerivedSheaves E5:animation.4 is cited for condensed coefficient rings it does not cover (§7.4, §2.3)

   **Location.** `packages/SolidAnalyticRings/README.md` line 736: "For the static B supplied by VS2.2, its animated image θB is the discrete Hℤ-algebra HB and its modules are D(B), through EnhancedDerivedSheaves E5:animation.4, `animatedModules_discrete`." The same use appears in line 738 ("Apply the supplied discrete-coefficient module comparison to B") and in line 278, last sentence.

   **Claim.** This supplier identifies HB-modules with D(B) for the coefficient ring of VS2.2.

   **Witness.** EnhancedDerivedSheaves README lines 2010–2012: `animatedModules` is Mod_{θB}(D(R)) for an ordinary B∈AnimAlg_R, and `animatedModules_discrete` covers discrete B. VS2.2 (VStack README line 713) puts its measures on a condensed ring. Topological E/ℚ_p (§7.4's Check) is not discrete.

   **Repair.** In §7.4, replace the sentence with a statement owned by this roadmap:

   > "For a static condensed commutative ring B whose underlying light condensed group is light-solid, the symmetric monoidal equivalence of §2.3 identifies HB-modules in Sp■ with the enhanced derived category of B-modules in SolidAb_light, compatibly with units, free objects and tensor."

   Give it this route: transport module objects through §2.3. Then use the generators B⊗■∏_Iℤ, which are static because ∏_ℕℤ is flat (RC Theorem 3.2.4(14), p.17, RC line 787).

   Also make these edits:
   - Cite E5:animation.4 only for the point value B(*).
   - Write "static" for "discrete" in line 736.
   - Change line 738 to match.
   - In §2.3, either delete the last sentence or say which animated rings (ordinary rings through δ) are compared, and with which module category.

   Tested on B the topological ℚ_p: its sections over ℕ∪{∞} are continuous sequences, so HB is static but not discrete. The repaired sentence asserts only staticity.

3. **F03** (P2) The consumer paragraph denies that §7.3 supplies discrete-adic Huber-pair solid structures, which misroutes HigherHidaAndColemanTheory

   **Location.** README line 764: "Its requests for discrete-adic Huber pairs, formal complements and topologically nilpotent annihilation require VS2.2’s geometric coefficient interface or a VStackSheavesAndLisseCategories, Part II extension. They are not consequences of the abstract spectral scalar theorem." Line 13 defers Huber-pair geometry to unnamed owners.

   **Claim.** This package supplies no Huber-pair solid structure.

   **Witness.** §7.3 (line 704) builds D_F for every F⊆π₀A(*). It cites MW line 1764–1775, where (R,R⁺)_■-modules are exactly those f-solid for all f∈R⁺, which is D_{R⁺} with algebra Â_F. VS2.2 owns only integer-solid spectra and formal complements (VStack README lines 725, 764).

   **Repair.** Replace the last two sentences of line 764 with:

   > "§7.3, with F a generating set of R⁺, supplies the module category and coefficient algebra of a discrete-adic Huber pair (R,R⁺)_■, including (A[T],A)_■ and A[T]_■ and the further localization between them (F⊆F′ in §7.3). §7.2 supplies completed scalar change along these maps. Not supplied here: the identification of the kernel of such a further localization with modules over an idempotent algebra, with its localization triangles; topologically nilpotent annihilation; and comparison with κ-condensed universes beyond VS2.2's common presentations. VS2.2's `ZSolidAnalytification.formalComplement` covers formal complements only for underlying-integer-solid structures."

   In line 13, name each deferred owner by roadmap and section, or delete the clause.

   Tested on A=ℤ:
   - F=∅ (equivalently {1}) gives integer-solid ℤ[T]-modules, that is (ℤ[T],ℤ)_■.
   - F={T} gives T-summable modules, that is ℤ[T]_■ (RC Example 4.6.4(2), RC line 2125–2133).

   Both are instances of §7.3.

4. **F04** (P3) §6.1 depends on §4.1 for no route step, which makes §§6.1, 6.3 and 6.4 conditional on gap:cardinal-interchange; the RefinedTraceMethods paragraph does not say so

   **Location.** README line 566: "Filter a large set of free summands by its countable subsets using an ω₁-filtered index only when §4.1 is needed." Line 568: `*Needs:* …; §4.1.` Line 762, the RefinedTraceMethods paragraph, mentions no gap.

   **Claim.** §6.1 needs §4.1.

   **Witness.** Following the Needs lines from §6.1, §6.3 and §6.4 reaches gap:cardinal-interchange through this single edge. Yet ⊕_I Σ^bG_A with I uncountable is resolved by its constant simplicial object, and the bar resolution uses only G_A.

   **Repair.**
   - Delete the sentence and remove "§4.1" from §6.1's Needs line.
   - If §6.4's passage from countable to arbitrary sums of generators uses ω₁-filtered colimits commuting with the p-power limit, add §4.1 to §6.4's Needs line. In that case also append to line 762: "§6.4 is conditional on gap:cardinal-interchange until EnhancedDerivedSheaves supplies it."

   Tested: after the edit, the Needs closure of §6.1 and §6.3 contains no gap.

5. **F05** (P3) The second Check of §4.1 is a negative control that is not labelled as one

   **Location.** README line 424: "For F(n,k)=Hℤ when k<n and 0 otherwise, with J=ℕ and discrete K=ℕ, the two π₀ groups are ⊕_ℕℤ and ∏_ℕℤ, respectively."

   **Claim.** As written, it reads as a test of the §4.1 equivalence.

   **Witness.** The two sides computed here differ: colim_n ℤ^n = ⊕_ℕℤ, while ∏_k colim_n = ∏_ℕℤ. The theorem survives only because ℕ is filtered but not ω₁-filtered: the countable subset ℕ has no upper bound.

   **Repair.** Append: "J=ℕ is filtered but not ω₁-filtered, so §4.1 does not apply, and the comparison fails. The ω₁ hypothesis is necessary."

6. **F06** (P3) The "algebra-pushout base change" of §7.2 never uses the pushout

   **Location.** README line 676: "Explicitly, for an algebra pushout B′=B⊗■_A A′ … both L_D_B′(B′⊗_B L_D_B(B⊗_A M)) and L_D_B′(B′⊗_A′ L_D_A′(A′⊗_A M)) are canonically L_D_B′(B′⊗_A M)."

   **Claim.** The identity is a base-change statement that needs the pushout.

   **Witness.** Take A=A′=B=Hℤ and B′=H𝔽₂. This is not a pushout, since the pushout would be Hℤ. Both paths still equal L(H𝔽₂⊗_{Hℤ}M), by the composition law that §7.2 already states.

   **Repair.** Delete "for an algebra pushout B′=B⊗■_A A′" and "algebra-pushout" from the statement. The displayed identity then reads as the two-path case of the composition law, which is what its proof route proves. If a genuine base-change theorem is intended, state it separately, because it is the step that needs the pushout: for every B-module N, the restriction of B′⊗_B N to A′ is A′⊗_A N. On the instance above with N=Hℤ, B′⊗_B N=H𝔽₂ but A′⊗_A N=Hℤ, so that identity does use the hypothesis.

Six findings: three P2, three P3. The mathematics of the 27 targets holds up under the computed pass below. The blocking problems are about what the package says it supplies: one statable headline is missing from `Suggested.lean`, one supplier declaration is cited outside its setting, and the consumer paragraph routes HigherHidaAndColemanTheory away from a structure that §7.3 actually supplies. Both declared gaps (`cardinal-interchange`, `light-countable-ab6`) are precise, minimal and declared in `design/plan.json` and the README under the same slugs. They are not findings.

## Verified sound

**Principles (all checked).**
- No route-specific shortcut. The theory covers all primes (p=2 and 3 are computed), general split coefficient data, and the sphere rather than Hℤ.
- No re-planned roadmap. RefinedTraceMethods §6.2 is relocated here, as instructed by the target.
- No upward or cyclic supply (the dependency check is below).
- No copied passages. An 8-word shingle comparison of the README against all nine source texts matches only titles and URLs.
- No computational algorithm.
- No sorry'd data and no `set_option`.

**Sources: the seeded sample, all 15 read at their locators.** No locator was flagged unverified.

| Target | Locator read | Theorem number, page, hypotheses, support |
| --- | --- | --- |
| 1.1 | RC Def 4.0.1 (RC line 1392, p.27); W 2.1 (W line 437, p.11) | Hypersheaves of spectra on light profinite sets; finite products and hyperdescent; matches. |
| 1.2 | W line 437–441; MW line 1748–1752, p.41 | Fully faithful symmetric monoidal left adjoint to point evaluation; matches. |
| 1.5 | RC Def 3.2.1 (line 732, p.16); Thm 3.2.4 (line 754–786, p.17) | Light (RC Def 2.3.1); parts (1)–(13) match the API; (14), flatness, is not used. |
| 2.2 | W line 448–451; RC 3.2.4(5)–(8), (12) | Reflection, L■(C⊗D)≃L■(L■C⊗D), solid tensor; integer free measures labelled as a model. |
| 2.4 | W 2.3 (line 472–475, p.12); RC 3.2.4(12) | Null■≃∏_ℕ𝕊, a compact generator; module generators; matches. |
| 3.1 | Q line 3673–3674, printed p.79; RC 3.2.4(13) (line 777) | Q states the ℕ×ℕ product parenthetically inside a proof sketch (Q line 3669); labelled as a model. |
| 3.2 | Q line 3672–3674 | Q's finite free stages; the splitting is the roadmap's own hypothesis, as stated. |
| 3.4 | Q line 3685, printed p.80 | Relative tensor identifies q₁ with q₂; matches the balancing use. |
| 4.1 | HTT Prop 5.3.3.3 (line 18705, printed p.394, PDF p.412); RC Rem 4.0.3 (line 1411, p.28); Q line 3688–3690 | κ regular; κ-filtered I ⇔ the colimit preserves κ-small limits in spaces; matches. |
| 4.2 | RC Thm 2.3.3(1)–(2) (line 539–540, p.12); Bosco A.4 proof (line 3504–3521, p.93) | Countable AB4* and AB6; surjective sequential limits; Bosco is non-light, labelled as a model. |
| 5.1 | Q line 3672–3688 | Model for split finite free stages; labelled as a model. |
| 5.2 | Q line 3693–3705, p.80; Bosco A.4 (line 3488, p.93) | f(n)→∞ is the same as properness; pointwise order; matches. |
| 6.1 | Bosco A.3 proof (line 3462–3469, pp.92–93); Q line 3688–3692 | Simplicial resolution by sums of compact projectives; matches. |
| 7.3 | MW 4.2 (line 1764–1775, p.41); RC Ex 4.6.4(2),(4) (line 2125–2145, p.44) | f-solidity is 1−fσ* on RHom(Null_ℤ,−); matches (see R03). |
| 7.4 | AG Def 6.12 / Prop 6.14 (lines 1361, 1384, p.39); Def 12.1 / Prop 12.4 / Rem 12.5 (lines 3014, 3041, 3054, pp.79–80); RC 3.2.4(12); CS Thm 5.8 (line 1243, pp.35–36) | Extremally disconnected models; the light comparison is restricted to common presentations, as stated. |

**Adversarial table (39 rows; every row computed).**

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. shift σ* | e₀, e₁ | σ*e₁=e₀, σ*e₀=0; (1−σ*)e₁=e₁−e₀; (1−σ*)(e₁+e₀)=e₁ | holds; agrees with RC line 812 (intended) | none |
| Conv. matrix order | 2×2 units | e₁₂e₂₁=e₁₁, e₂₁e₁₂=e₂₂ | holds | none |
| Conv. π_k=H^(−k) | ΣHℤ; ℤ in cochain degree 2 | π₁=ℤ, π₀=0; π₋₂=ℤ; agrees with StableHomotopyKTheory §5.15 Check | holds | none |
| Conv. quotients | a₀=1; a=0; H𝔽_p tower | cofib(id)=0, J₀=A; A⊕ΣA; p·id=0 in [H𝔽_p,H𝔽_p]=𝔽_p, [ΣX,X]=0, so diag(id,0), lim=H𝔽_p | holds; agrees with EnhancedDerivedSheaves spectra-comparison Check | none |
| Conv. profiles, units | f=j+1→g=j; p=2,3 | t^{j+1}A⊆t^jA; π₀𝕊^∧_p=ℤ₂, ℤ₃ against π₀𝕊=ℤ | holds | none |
| Conv. δ∏ vs ∏δ | e_n | e_n→0 in the product topology, not eventually 0 | holds | none |
| 1.1 Cond(Sp) | ∅; two points; C=ℕ∪{∞} | value 0; X(*)²; π₀𝕊[C](*)=⊕_Cℤ, at two points (⊕_Cℤ)²; 𝕊[T]⊗𝕊[∅]=0=𝕊[∅] | holds | none |
| 1.2 δ | 𝕊⊕Σ𝕊; lim δH(ℤ/p^r) at T=ℤ_p; 0 | π₀=ℤ⊕π₋₁𝕊=ℤ, π₁=ℤ/2⊕ℤ; π₀=C(ℤ_p,ℤ_p)∋id, not locally constant; δ0=0 | holds | none |
| 1.3 N, σ | singleton C; right shift r | cofib(id)=0; (1−r)(e₁+e₀)=e₀−e₂≠e₁ | holds; Mathlib's Type 0 restriction confirmed | none |
| 1.4 solidity | 0; δ𝕊; N | trivial; π₀=ℤ, π₁=ℤ/2; π₀N(*)=⊕_ℕℤ against π₀L■N(*)=∏ℤ∋(1,1,…) | N not solid | none |
| 1.5 SolidAb_light | ℤ; ℝ; S=∅,*,2; C; finite S | Hom(P,ℤ)(*)=⊕_ℕℤ, inverse x_n=Σ_{k≥n}b_k; for ℝ, x₀−x_{N+1}=H_{N+1}→∞ against the limit x₀; 0,ℤ,ℤ²; ℤ■[C]=lim ℤ^{n+1}=ℤ×∏ℤ; Q=ℤ_p/ℤ_p^δ has Q(*)=0 and (p^n)≠0 at C | holds; statable (R01) | R01 |
| 2.1 t-structure | ΣHℤ; 0; 𝕊⊕Σ𝕊 | π₁=ℤ; in every range; π₁=ℤ/2⊕ℤ; t-exactness of Hom(N,−) from internal projectivity (RC line 870–871) | holds | none |
| 2.2 L■ | 0; δ𝕊; δH𝔽₂ | L■0=0; L■δ𝕊=δ𝕊; π₀Hom(G,δH𝔽₂)(*)=ker(LC(C,𝔽₂)→𝔽₂)=⊕_ℕ𝔽₂ against Hom_Ab(∏ℤ,𝔽₂) of size 2^(2^ℵ₀) | holds | none |
| 2.3 Hℤ comparison | H𝔽_p⊗_{Hℤ}H𝔽_p for p=2,3; cofib(𝕊→Hℤ) | Tor₀=Tor₁=𝔽_p; π₁cofib=0, π₂=ℤ/2, so the π_b isomorphism holds | holds | R02 (citation) |
| 2.4 G | point; e_n; A=0; φ=(1,0) | π₀G(*)=∏ℤ∋(1,…); continuous into the product, not the discrete group; 0; φe₁₂=(0,1), (0,1)e₂₁=(1,0)=φe₁₁, φe₂₂=0 | holds | none |
| 3.1 product tensor | I=∅; 2×3; Σ𝕊 swap | 0=0; 6 spheres on both sides; degree −1 | holds | none |
| 3.2 split towers | 𝕊^{n+1}; ×2; retract of 𝕊^n | ranks 1,2,3, kernels of rank 1; 2b=1 has no integer solution; π₀ f.g. projective ⇒ free (`Submodule.basisOfPid`), Hℤ-detection ⇒ sphere sum | holds | none |
| 3.3 independent towers | rank 1; m=1, n=2 | 𝕊⊗■𝕊=𝕊; 2·3=6; diagonal cofinal in ℕ×ℕ | holds | none |
| 3.4 balancing | A=𝕊; A=𝕊[t]; ℚ over ℤ | trivial; π₀=ℤ[t₁,t₂]→ℤ[t]; (2^{−n})∈∏ℚ∖(∏ℤ)⊗ℚ, and ℚ is not dualizable | holds | none |
| 4.1 interchange | K=∅; J=pt; J=ℕ | 0=0; lim_K F on both sides; ⊕ℤ against ∏ℤ, but ℕ is not ω₁-filtered | holds | R05 |
| 4.2 AB6 in heart | ℚ ⊇ (1/n!)ℤ; B_j=0; ℤ^{n+1} | (1/(j+1)!) in the independent colimit, which equals ∏ℚ (every denominator divides some n!); the diagonal colimit has bounded denominators; 0; lim¹=0 | holds | none |
| 5.1 datum | A=𝕊[[t]]; A=0; 𝕊/p | cofib(t^r on 𝕊[t]/t^s)=𝕊[t]/t^r ⊕ Σ(rank r), Σ-part pro-zero (×t), so B_r rank r; all 0; π₀=ℤ/p not free | holds | none |
| 5.2 profiles | f=j; f=0; f_k=max(j−k,0); duplication twice | proper; {j:0<1}=ℕ; each f_k proper, inf_k f_k=0 not proper; {4j,…,4j+3}; ∏_IA≃A⊗■∏_Iδ𝕊 compact via §3.1 | holds | none |
| 5.3 null family | 𝕊[[t]] with f=j; two blocks; I₀=ℕ | (t^j)∈V_f, while (1)_j is 1 in every coordinate mod t^r; J₀=A gives A²; Λ_a(∏A)=∏Λ_aA=∏A | holds | none |
| 5.4 every degree | k<0; π₁𝕊[[t]]; duplication; fold | 0; lim⊕_{i<r}ℤ/2=(ℤ/2)[[t]]; survivors η, ηt; outputs 0–3 mod t²; Σt^j=(1−t)⁻¹≡1+t, (1−t)(1+t)=1−t² | holds | none |
| 6.1 resolutions | 0; Σ^bG_A; ⊕_IΣ^bG_A, I uncountable | constant resolutions; no ω₁ index used | holds | R04 |
| 6.2 connectivity | a=1; a=0; Hℤ with 2^r; ideal tower | 0; M⊕ΣM; lim=ℤ₂, lim¹=0, π₋₁=0; 2^rℤ gives lim=0, lim¹=ℤ₂/ℤ (agrees with EnhancedDerivedSheaves E2:towers Check) | holds | none |
| 6.3 realization | constant; degree-1 layer; Σ^{−n}A | identity; ΣM≥b+1; tail ≥b+d+1, so π_k is stable once d≥k−b+1 (that is, d>k−b); Σ^nΣ^{−n}A=A | holds | none |
| 6.4 p-complete | p=2,3; ℤ_p⊗■ℤ_p; Tor over ℤ_p | ℤ₂, ℤ₃; ℤ[[T,U]]/(T−p,U−p)=ℤ_p; Tor₁(𝔽_p,𝔽_p)=𝔽_p | holds | R04 |
| 7.1 structures | all modules; {0}; perfect modules | L=id; closed under everything, completed iff A=0; ⊕_ℕHℤ not perfect | holds | none |
| 7.2 complete tensor | D=0, A=Hℤ; H𝔽₂ span; D_B′={0}; non-pushout B′=H𝔽₂ | π₀ of the unit =0; π₀=π₁=𝔽₂; both paths 0; transitivity alone suffices | holds | R06 |
| 7.3 summability | e₁; ℚ_p with f=1/p (p=2,3); ε²=0; f=1 | e₁+fe₀−fe₀=e₁; b_n=p^n gives b_n−p⁻¹b_{n+1}=0 with b₀=1, so a nonzero kernel; (1−εσ*)(1+εσ*)=1; the test equals solidity | holds; F=R⁺ is MW's (R,R⁺)_■ | R03 |
| 7.4 measures | size 2, ∅, *; (∏O_E)[1/p]; 𝔽₂ | ℤ², 0, ℤ; (p^{−n}) excluded; H_*(BΣ₂;𝔽₂)≠0; completed iff B≃μ[*]=L(B[*]) | holds | R02 |
| gap cardinal-interchange | κ=ω₁; spaces; spectra | HTT 5.3.3.3 verified; κ-filtered colimits of Ω-spectra are levelwise, so the spectral case holds | precise and minimal | none |
| gap light-countable-ab6 | ℚ example above | RC line 539 states countable AB6; Mathlib AB.lean:31–36 has only CountableAB4Star and Grothendieck | precise and minimal | none |
| HabiroRings contract | its gap:light-solid-spectra (HabiroRings README line 85) | every requested item maps to §§1.2, 1.4, 2.1, 2.2, 2.4, 3.1, 3.3, 3.4, 4.1, 5.3–5.4, 6.1, 6.3 | supplied (conditionally on the gaps, as stated) | none |
| HigherHida R23–R24 | design README lines 1824–1834 at board head da88512 | (A[T],A)_■ is D_F of §7.3, but line 764 denies it | misrouted | R03 |
| Conditionality | Needs closure | §4.1, §6.1, §6.3, §6.4 depend on cardinal-interchange; §4.2, §5.3, §5.4 on ab6; §§7.1–7.4 on no gap | HigherHida's §7.2 and §7.4 are unconditional | R04 |
| Context and binders | repair block | no section variables; `[HasDerivedCategory LightCondAb]` carried explicitly; `#check @` types are as intended | holds | none |

**Library declarations opened at the pins.**
- Mathlib/Topology/Category/LightProfinite/Basic.lean:42, 56, 403
- Mathlib/Topology/Category/LightProfinite/EffectiveEpi.lean:28
- Mathlib/Topology/Category/LightProfinite/Sequence.lean:53, 56
- Mathlib/Condensed/Light/Basic.lean:28
- Mathlib/Condensed/Light/Module.lean:42, 68, 73, 85
- Mathlib/Condensed/Light/Small.lean:30
- Mathlib/Condensed/Discrete/Basic.lean:86
- Mathlib/Condensed/Light/AB.lean:31–36 (no AB6 anywhere in Mathlib)
- Mathlib/Condensed/Light/Monoidal.lean:41–62
- Mathlib/Condensed/Solid.lean:44, 48, 69, 74–85
- Mathlib/Topology/Category/Profinite/Nobeling/Induction.lean:153
- Mathlib/Condensed/Light/Sequence.lean:20–22, 302
- Mathlib/CategoryTheory/Preadditive/Projective/Internal.lean:41–47, 61
- Mathlib/Condensed/Light/Epi.lean:109
- Mathlib/LinearAlgebra/FreeModule/PID.lean:298
- Mathlib/Topology/Compactification/OnePoint/Basic.lean:173, 482
- Mathlib/CategoryTheory/Limits/FilteredColimitCommutesFiniteLimit.lean: Type-valued only, so the cardinal gap is minimal.

All 25 backticked Mathlib names were checked with one `#check` file. The other 4 backticked names are EnhancedDerivedSheaves targets.

Pinned Mathlib has no spectra and no monoidal structure on `DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory). Pinned Tau Ceti has no condensed or solid objects: its EilenbergMacLane files are spaces.

**Cross-roadmap citations resolved.**

EnhancedDerivedSheaves, on main:

| Citation | Where it is |
| --- | --- |
| §§0.1–0.3 | lines 429–491 |
| E0.4 | line 211 |
| E0.8 | lines 376–414; defines `IsKappaFiltered` and presentability, with no interchange theorem |
| E1.3 | line 549 |
| E2:towers | line 1294; fib(1−s) |
| E2.1 | line 2035; `IsReplete.countableProduct_epi` at line 2071 and Suggested.lean line 290 |
| E2.2 | line 2083; `IsReplete.milnor` at line 2097 |
| E2.3 | line 2125 |
| E2.6 | line 2293 |
| E2.7 | line 2375 |
| E3.2–E3.3 | lines 1153, 1203 |
| E4.1 | line 2569 |
| E4.4 | line 2703 |
| E5:abstract.2–5 | lines 1456–1583; extension of scalars by the bar construction, with transitivity |
| E5:presentability.1–2 | lines 1597, 1624; spectra are there, the interchange is not |
| E5:spectra-comparison | line 1842; `symmetricSpectra_towerComparison` at line 1876 |
| E5:animation.4 | line 1994; `animatedModules_discrete` at line 2012 |

The two Lean names that the citation index reported as "found nowhere" are these EnhancedDerivedSheaves targets, so the index leads are false positives.

Other suppliers:

| Citation | Where it is |
| --- | --- |
| GeneralizedCohomology G2.1–G2.7, G3.8–G3.9 (main) | items at lines 213–431, 785, 878 |
| StableHomotopyKTheory §§5.13–5.18 | at its open head; sections at README lines 1998–2111 |
| VStackSheavesAndLisseCategories VS2.1, VS2.2 | at its open head; all quoted subsection titles exist; the light common-presentation comparison is at Conventions line 53 and line 715 |
| HabiroRings §§2.6–2.12 | at its open head; lines 525–711 |

**Supplier order.**

```
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

- No UPWARD and no CYCLE line.
- In the merge order, SolidAnalyticRings is at line 150, right after VStackSheavesAndLisseCategories (line 149).
- StableHomotopyKTheory (line 4) and EnhancedDerivedSheaves (line 19) are earlier. GeneralizedCohomology is on main.
- The consumers are later: HabiroRings (219), RefinedTraceMethods (220), LocallyAnalyticRepresentationsOfLocalGroups (300). HigherHidaAndColemanTheory is at the design stage.
- Moved notion, recorded: light condensed and solid spectra, discreteness, null-test solidity, reflection, the generator and the p-complete comparison moved down from RefinedTraceMethods §6.2 to §§1–2 and 6.4 here. At its board head 87bc3ff, RefinedTraceMethods §6.2 (README line 2521) still constructs them and does not cite this roadmap. That is RefinedTraceMethods' repair, not a finding here.

**Gaps.** Both have a named supplier earlier in the order. Each `needs` sentence is a single statement with hypotheses, matches `design/plan.json` word for word, and sits in the supplier's subsection in the required shape. Nothing at the pins or on main provides either.

**Shape.**
- 7 layers and 27 targets.
- 61 API facts and 92 Checks; every subsection has at least 3 Checks.
- Every layer ends with Examples and Dependencies.
- Headings follow the upstream form.
- No LaTeX delimiters and no `lemma`.
- No process words, apart from "proposed" inside the gap contracts, which is taken from the plan.

**Lean.**
- `lake env lean packages/SolidAnalyticRings/Suggested.lean`, run from the content checkout, exits 0 with no output. The file has one `import Mathlib`, a module docstring and an empty namespace.
- With no declarations, there is nothing to probe for padding, and the `#check @name` binder comparison is vacuous. I ran it on the R01 repair block instead: both elaborated types match the README §1.5 statements, and no binder was lost.
- Headline theorems listed from the Summary: §§3.1, 3.3, 3.4, 4.1, 5.3–5.4, 6.1, 6.3, 7.2 and 7.3, plus the layer headlines §§1.2, 1.5, 2.1–2.4, 6.2, 6.4 and 7.4 named in the docstring.
- All of these need spectra or enhanced monoidal carriers that are absent at the pins, except the §1.5 parts (R01).

**Ownership against open pull requests.** Checked with `roadmaps grep` over main and all 330 open heads, using these searches:
- light solid, AB6, HTT 5.3.3.3;
- Cond(Sp), condensed or solid spectra, null sequence;
- Huber or f-solid structures;
- SolidAnalyticRings.

Only HabiroRings cites this roadmap, and no other roadmap owns these objects. The board heads of RefinedTraceMethods and HigherHidaAndColemanTheory were read with three REST calls; LocallyAnalyticRepresentationsOfLocalGroups was read locally.

## Not verifiable

- Q Lemma B.8 has only a proof sketch (Q line 3669). The general spectral statements of §§3.1–3.4 and 5.1–5.4 are proof obligations of this roadmap. I checked them on the computed instances above, not against a written proof.
- The route of §5.3, in which one proper profile dominates the per-block bounds as a sheaf statement via AB6, was checked on global sections only. The sheaf-level step is a proof obligation.
- The AS transcript was not read beyond its identification lines, because the README uses it as context only.

## Source issues

- **Misprint** in RC at Theorem 2.3.3(3), proof, printed p.12 (RC lines 550, 555–556): the map g is given source Z[S]⊗N, and the parameter space is written S×(N×{∞}); it should be Z[S]⊗P and S×(N∪{∞}); affects nothing.
- **Misprint** in RC at Proposition 3.2.5, proof of item (1), printed p.18 (RC line 812): the second coordinate of (1−Shift*)a is written as a₁ minus a₁; it should be a₁ minus a₂; affects nothing.
- **Misprint** in RC at Proposition 3.2.5, proof of item (4), printed p.19 (RC line 866): the relation x_n = x_{2n+1} is asserted for all integers n; it should be for all natural numbers n; affects nothing.
- **Misprint** in RC at Proposition 3.2.5, proof of item (7), printed p.19 (RC line 874): the displayed isomorphism and the following clause name the solid complex B; it was introduced as C, and should be C; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2e18779", "job": "REV-PKG-SolidAnalyticRings", "model": "opus", "worker": "fable-rev23"} -->

---

<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/943#issuecomment-6370605315 -->
Review (codex) of 2e18779

Verdict: accepted
Conditional on the announced gaps: `cardinal-interchange`, `light-countable-ab6`

1. **F01** (P3) Make the two non-boundedness Checks nonzero

   **Location:** `packages/SolidAnalyticRings/README.md:576` and `:608`: “The family Σ^(−n)G_A has no common lower bound”; “the tails never become more connective”.

   **Claim:** These are negative controls against dropping the uniform lower bound, in sections allowing the zero coefficient algebra.

   **Witness:** Set A=0. Then G_A=0, every Σ^(−n)G_A=0, every normalized layer is 0, and every tail is 0. All these objects lie in every connective range.

   **Exact repair:** In both Checks specify A=δ𝕊. In §6.1, π₋ₙ(Σ^(−n)G)=∏_ℕℤ≠0, so no integer bounds the entire family. In §6.3 take the split simplicial object with normalized term Σ^(−n)δ𝕊; each suspended normalized layer is δ𝕊, with π₀=ℤ, and its tails retain nonzero π₀. These computations test the repaired examples. Retain the zero algebra in the main theorems.

2. **F02** (P3) State the positive exponent range in the prime Check

   **Location:** `packages/SolidAnalyticRings/README.md:636`, also the abbreviated tower description at `:31`: “For X=H𝔽_p, X/p^r=X⊕ΣX”.

   **Claim:** The displayed splitting describes the positive stages of the prime completion tower.

   **Witness:** At r=0, p⁰=1 and cofib(id:H𝔽_p→H𝔽_p)=0; the displayed right side instead has π₀=π₁=𝔽_p. This fails for both p=2 and p=3.

   **Exact repair:** Add “for r≥1” to the splitting and to the diagonal transition description. If the initial r=0 stage is included, state that it is 0 and the first transition is the unique map to 0. At r=1,2 the scalars vanish on H𝔽_p and the transition square (p,id) gives diag(id,0); the tail limit remains H𝔽_p. This is a Check-range correction, not a defect in the main completion theorem: GeneralizedCohomology G3.9 and EnhancedDerivedSheaves E5:spectra-comparison explicitly supply the tower with r≥1.

3. **F03** (P3) Include the tower comparison in the balancing prerequisites

   **Location:** `packages/SolidAnalyticRings/README.md:388` and `:392`: “identify their action on … the projection-induced maps of §3.3”.

   **Claim:** §3.4 includes compatibility with the comparison constructed in §3.3, but its `*Needs:*` line lists only §2.2 and enhanced-category suppliers.

   **Witness:** For P_m=𝕊^(m+1), Q_n=𝕊^(n+1), the named projection at (m,n)=(1,2) has target 𝕊⁶. That comparison is the target of §3.3, absent from the prerequisite line.

   **Exact repair:** Add §3.3 to §3.4's `*Needs:*` line. Keep the general bar/scalar construction imported from EnhancedDerivedSheaves. This adds only the dependency needed for the stated projection compatibility: the rank-six projection still has six coordinates, and §3.3 precedes §3.4, so it introduces no cycle.

Acceptance is conditional on the two declared supplier contracts `cardinal-interchange` and `light-countable-ab6`. There are three non-blocking P3 findings and no P1/P2 findings. This review changes neither the mathematical package nor its source manifest. There was no previous package review. The earlier design records were consulted only to resolve the commissioned ownership move, not as evidence that the mathematics was checked.

## Verified sound

The review covered all 27 numbered targets, their 61 API bullets, all 92 Checks, the conventions, proof routes, seven Examples/Dependencies pairs, supplier contracts, downstream claims, metadata and acceptance file. The table below separates individual mathematical assertions; repeated Checks are also indexed so the computed coverage is auditable. The tables contain 126 assertion rows and 100 Check/example rows. Computed cases test the assertions, while the source and proof-route audit supplies their general justification; finite tests alone are not offered as proofs.

The package retains sphere coefficients, all primes, coherent rather than homotopy-category towers, sphere-linear rather than coefficient-linear splittings, derived scalar cofibers and actual reflection units. No computational algorithm, sorry'd data, option override, copied source passage, route-specific arithmetic restriction or duplicate pinned construction was found. The light null-test theory differs from VS2.1's compact-Hausdorff measure-test theory. Generic categorical operations are imported and specialized, not rebuilt.

### Source verification

All nine recorded texts were readable in their supplied legal cache copies. None is flagged unverified in the authored files. All 15 seeded targets were checked at theorem/paragraph, printed page, hypotheses and cited proof step. No additional source was required; the nine original manifest entries were left untouched. Q uses printed pages 79–80, extraction pages 124–125. CS and AG use their recorded May 2026 revisions; MW uses its recorded February 2026 author version.

| Seeded target | Opened evidence | Support and boundary |
| --- | --- | --- |
| 1.1 Ambient category | RC line 1392, Definition 4.0.1, pp.27–28; W line 437, paragraph 2.1, p.11 | Hypercomplete light spectral sheaves, empty and disjoint-union conditions. Presentability, free objects and finite-degree hypercover refinement are explicit construction targets using the named enhanced suppliers. |
| 1.2 Discrete embedding | W lines 437–441, p.11; MW lines 1748–1752, p.41 | Fully faithful symmetric monoidal left adjoint to point evaluation. No inverse-limit preservation is supplied or claimed. |
| 1.5 Light solid groups | RC lines 732–747, Definition 3.2.1, p.16; lines 754–786, Theorem 3.2.4, p.17; lines 870–895, proof, p.19 | Internal null test, all cohomological degrees, reflection, derived comparison, countable product tensor. Infinite S is explicitly needed for a single generator. |
| 2.2 Reflection/tensor | W lines 448–451, p.11; RC lines 761–786, Theorem 3.2.4(5)–(13), p.17 | Spectral reflection/tensor is directly recorded by W. Connectivity and the free-measure spectral formula are identified as extensions of the integer model, with their construction route retained. |
| 2.4 Generator | W lines 472–475, paragraph 2.3, p.12; RC lines 773–776, p.17 | Null solidification is the countable sphere product and compact generator; free module adjunction transfers generation. The t-structure/projectivity claims use §2.1 and the light integer theorem. |
| 3.1 Product tensor | Q lines 3672–3674, proof of B.8, p.79; RC lines 777–786, p.17 | Q explicitly uses the sphere-product comparison; RC proves its light integer model. The bounded-below Hℤ detection route preserves the sphere, including its positive stems. |
| 3.2 Split towers | Q lines 3672–3674, p.79 | Q gives finite free Habiro stages, not an arbitrary-tower theorem. The README correctly labels this a model and imposes coherent splitting. Integer matrix kernel freeness and its spectral lift are separately accounted for. |
| 3.4 Balancing | Q lines 3685–3686, p.80; EnhancedDerivedSheaves E5:abstract.2 | Q's variable identification is an arithmetic application. The general bar/scalar theorem is imported; the README retains the dualizability restriction for commuting with limits. R03 corrects one dependency line. |
| 4.1 Interchange | HTT line 18705, Proposition 5.3.3.3, printed p.394; RC line 1411, Remark 4.0.3, p.28; Q line 3688, p.80 | HTT gives regular-cardinal filteredness versus small-limit preservation in spaces. Spectra follow by levelwise stabilization. The general result is an explicit supplier gap; countable hyperdescent is supplied locally. |
| 4.2 Independent bounds | RC lines 537–547, Theorem 2.3.3, pp.12–13; Bosco lines 3504–3521, A.4 proof, p.93 | RC supplies countable AB6 and epimorphic sequential-limit behavior. Bosco works on extremally disconnected tests and is accurately labeled an abelian model, not a light-site proof. |
| 5.1 Coefficient datum | Q lines 3672–3688, pp.79–80 | The general complete split scalar datum is newly defined; Q supplies its model. Quotients are modules, their coherent square is marked, and ordinary Moore spectra are excluded from finite free stages. |
| 5.2 Profiles | Q lines 3693–3705, p.80; Bosco lines 3488–3503, A.4, p.93 | Properness corresponds to decay. Larger exponents give smaller ideals; reversing the index is correct. Compact-block finite-output factorization is derived from earlier targets, not attributed to Bosco. |
| 6.1 Resolutions | Bosco lines 3462–3469, A.3 proof, pp.92–93; Q lines 3688–3692, p.80 | The sources give integer/arithmetic resolution reductions. The README states the additional spectral resolution and one bound for all simplicial degrees. R01 repairs only its non-example. |
| 7.3 Summability | MW lines 1764–1775, paragraph 4.2, p.41; RC lines 2125–2145, Example 4.6.4(2),(4), p.44 | These are integer/animated models. RC explicitly requires a connectivity argument. The README provides a separate connective spectral endomorphism-inversion route and does not infer connectivity merely from reflectivity. |
| 7.4 Measure comparison | AG lines 1361–1410, Definition 6.12/Proposition 6.14, pp.39–40; lines 3014–3055, Definition 12.1/Proposition 12.4/Remark 12.5, pp.79–80; RC line 773; CS line 1243 | AG's tests are extremally disconnected. The light/cutoff passage is attributed to VS2.2's common-presentation contract. Static B is sent to HB; no identification of all Hℤ-algebras with animated rings is claimed. |

Other locators were also opened: W lines 443–462 for the null test and prime completion; MW line 1763 for integer modules; RC lines 1431–1458 and 1489–1519 for analytic structures and completed scalar adjunctions; Bosco lines 3459–3486 for the bounded-above relative p-adic theorem; CS lines 1578–1595 for derived solid tensor. AS lines 9–20 give the advertised lecture/page list and lines 39–44 disclose the transcript status. AS is contextual, not sole evidence for a target. Source misprints encountered in those readings are listed at the end.

### Pinned libraries and duplication by object

The content main revision is a07e2024f391f3022520c3f8ad194912b3eab614. The manifest pins match the README: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following bodies and variable blocks were opened, not merely their names searched.

| Pinned file and line | Declaration or body checked | What it supplies; limit of the claim |
| --- | --- | --- |
| `Mathlib/Topology/Category/LightProfinite/Basic.lean:42` | `LightProfinite := CompHausLike (fun X ↦ TotallyDisconnectedSpace X ∧ SecondCountableTopology X)` | The CompHausLike carrier contains compactness/Hausdorffness; the predicate adds the two light conditions. It does not require nonemptiness. |
| Same file `:56`, `:403` | `LightProfinite.of`; `EssentiallySmall` instance | Constructor explicitly requires CompactSpace and T2Space; a small equivalent site exists. |
| `Mathlib/Topology/Category/LightProfinite/EffectiveEpi.lean:28` | `LightProfinite.effectiveEpi_iff_surjective` | Effective epimorphism iff surjective, including the empty-source boundary. |
| `Mathlib/Condensed/Light/Small.lean:30` | `LightCondensed.equivSmall` | Ordinary sheaf equivalence on the induced topology; no spectral enhancement. |
| `Mathlib/Condensed/Light/Basic.lean:28` | `LightCondensed` | Ordinary sheaves for the coherent topology. |
| `Mathlib/Condensed/Light/Module.lean:36` | Ring/universe binders; `LightCondMod` at :42; `free` at :68; `freeForgetAdjunction` at :73; `LightCondAb` at :85 | Module-valued sheaves and ordinary free adjunction. `LightCondAb := LightCondMod ℤ` fixes the base universe, as the README says. |
| `Mathlib/Condensed/Discrete/Basic.lean:65` | `discrete`, `underlying`, `discreteUnderlyingAdj` at :72, :79, :86 | Category and HasSheafify assumptions; ordinary constant-sheaf/point adjunction. |
| `Mathlib/Condensed/Light/AB.lean:27` | Ring binder, `CountableAB4Star` at :31 and `IsGrothendieckAbelian` at :35 | Countable exact products and Grothendieck abelianness. No AB6 declaration was found by object searches. |
| `Mathlib/Condensed/Light/Monoidal.lean:33` | CommRing binder; monoidal, symmetric and closed instances at :41, :47, :53, :56; monoidal sheafification/free at :59, :62 | Ordinary light tensor, not derived solid tensor. |
| `Mathlib/Condensed/Solid.lean:31` | Ring/universe binders; `profiniteFree` :44, `profiniteSolid` :48, `profiniteSolidification` :69, `CondensedMod.IsSolid` :83 | Right Kan extension and inversion on every profinite object. The body is a measure test, not the light null test. Lines 74–81 contain the general-ring warning acknowledged by the README. |
| `Mathlib/Condensed/Light/Sequence.lean:20` | Type 0 coefficient binder and `internallyProjective_free_natUnionInfty` at :302 | Base-universe internal projectivity only. The README assigns transport beyond this universe to §1.3. |
| `Mathlib/CategoryTheory/Preadditive/Projective/Internal.lean:41` | `isInternallyProjective`, `InternallyProjective` :47, `ofRetract` :61 | Internal Hom preserves epis; retract transport. This is not sectionwise projectivity. |
| `Mathlib/Condensed/Light/Epi.lean:104` | Tower/limit/epi binders; `epi_π_app_zero_of_epi` :109 | Projection from an epimorphic sequential limit; tails give other projections. |
| `Mathlib/LinearAlgebra/FreeModule/PID.lean:278` | `Submodule.nonempty_basis_of_pid`; `Submodule.basisOfPid` :298 | Finite rank basis of a submodule of a finite free PID module. It supplies the integer matrix calculation, not its spectral lift. |
| `Mathlib/Topology/Category/Profinite/Nobeling/Induction.lean:153` | `LocallyConstant.freeOfProfinite` | Freeness of the actual locally constant integer function module; left with the compact-Hausdorff owner. |

Object searches covered both pinned trees: null-sequence/internal projectivity, measure solidification, light solid localization, spectra/sphere modules, enhanced sheaves, AB6 and independent unions, completion and derived tensor. The hits distinguish ordinary derived categories, ordinary monoidal sheaves and algebraic spectra from the enhanced solid spectral carriers. No Tau Ceti declaration is directly used. The absence claim concerns these full carriers and operations, not absence of ordinary `DerivedCategory`, simplicial objects, tensor, or sheaf APIs.

### Resolved roadmap ownership and supplier order

Shape exemplars were read on main: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, `TauCetiRoadmap/GeneralizedCohomology/README.md` and `TauCetiRoadmap/ComplexTori/README.md`. The prescribed package shape is present, with more explicit Checks and source locators than these exemplars.

The roadmap service was used for object searches across main and the indexed open heads. Broad searches were narrowed until no truncation remained. Queries included light solid objects, hypersheaves of spectra, null sequences, internal projectivity, AB6, cardinal interchange, analytic measures, scalar extension and split towers. The named open-roadmap set in the brief was included by these indexed searches; no unnamed remote heads were sought. Revised existing roadmaps were resolved on main. New-folder suppliers StableHomotopyKTheory and VStackSheavesAndLisseCategories were read at their indexed open heads.

All 37 entries in the supplied board index were inspected at the specified commits. Twenty-two had package READMEs; for fifteen the stated package README returned 404, but their design README at the same commit was readable. Those design files were searched instead. The local board packages were additionally searched by object. The relevant matches were RefinedTraceMethods, HigherHidaAndColemanTheory and the geometric VStack Part II. No other indexed board text supplied light null-test theory, its spectral comparison, or either declared gap. This is an object-based ownership audit, not a claim that the unreadable package paths contain no future work.

| Citation in this package | Resolved file and section | Boundary and computed convention witness |
| --- | --- | --- |
| GeneralizedCohomology G2.1–G2.7 | `TauCetiRoadmap/GeneralizedCohomology/README.md`, G2 items 1–7, main | Concrete symmetric sphere modules, stable/positive models, true π and HR. π₀𝕊=ℤ; π₀H𝔽₂=𝔽₂; these are distinct coefficient objects. |
| GeneralizedCohomology G3.8–G3.9 | Same file, G3 items 8–9, main | Product-minus-shift tower and r≥1 prime cofibers. For H𝔽₂ the positive transition is diag(1,0), limit H𝔽₂; an identity cofiber is 0. |
| StableHomotopyKTheory §§5.13–5.18 | `TauCetiRoadmap/StableHomotopyKTheory/README.md`, §§5.13–5.18, indexed new-folder head | Operadic/HR/cochain adapters and connective cellular induction. Right matrix multiplication gives e₁₂e₂₁=e₁₁, not e₂₂; cochain degree 2 gives π₋₂=ℤ and its [1] shift gives π₋₁=ℤ. |
| EnhancedDerivedSheaves §§0.1–0.3, E1.3 | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, those sections, main | Enhanced ringed-site modules, replacements, derived tensor/Hom. ℤ/p⊗ᴸℤ/p has H⁻¹=H⁰=𝔽_p. A point-site comparison alone does not supply the light spectral equivalence. |
| EnhancedDerivedSheaves E0.4, E0.8 | Same file, E0.4 and E0.8 | Stable operations and cardinal filteredness. The empty test forces a vertex; a one-point category is κ-filtered, the empty one is not. E0.8 does not state the gap's full interchange. |
| EnhancedDerivedSheaves E2:towers | Same file, E2:towers.1–.2 | Coherent inverse limit and pro-zero theory. Constant identity tower: limit M; zero-transition tower: limit 0; integer ×p tower: lim=0, lim¹=ℤ_p/ℤ. |
| EnhancedDerivedSheaves E2.1–E2.3 | Same file, E2.1 “Countable products in a replete topos”, E2.2 “The Milnor exact sequence”, E2.3 | `IsReplete.countableProduct_epi` and `IsReplete.milnor` are actual roadmap targets. The resolver's two missing-library-name leads are false positives, since they were cited as supplier targets. Surjective ℤ/p^r tower has lim¹=0. |
| EnhancedDerivedSheaves E2.6–E2.7 | Same file, E2.6 hypercovers and E2.7 sheaves of spaces | Hypercompletion is supplied separately from Postnikov completeness. A constant two-point augmentation has degree-one matching image of size 2 in a set of size 4, so is not a hypercover. |
| EnhancedDerivedSheaves E3.2–E3.3 | Same file, accessible localization, adjoints, stable colimits and compact generation | Empty test set gives identity localization; localization at all shifted generators→0 gives the zero category. These inputs do not themselves prove the solid t-exactness targets. |
| EnhancedDerivedSheaves E5:abstract.2–.5 | Same file, modules/bar scalar extension, monoidal localization, stable tensor and monadicity | Bar and scalar transitivity are imported. Unit scalar extension sends ℤ to ℤ; relative H𝔽₂ tensor retains its π₁=𝔽₂. Monadic reconstruction needs the separately verified generator and right action. |
| EnhancedDerivedSheaves E5:presentability.1–.2 | Same file, compact objects/Ind and stabilization | Compact means filtered mapping-space preservation. The identity of ⊕_ℕℤ does not factor through a finite subsum. Stabilization of the terminal category is 0. |
| EnhancedDerivedSheaves E5:spectra-comparison | Same file, `moduleSpectra_equiv_derived` and `symmetricSpectra_towerComparison` | Both names exist as targets; the latter specifies r≥1 and the (p,id) square. Relative Hℤ tensor has π₀=π₁=𝔽_p on the two torsion inputs. |
| EnhancedDerivedSheaves E5:animation.4 | Same file, `animatedModules_discrete` and animated-to-CAlg comparison | For discrete B, θB=HB and modules agree with D(B); the free derived commutative 𝔽₂ algebra has H₁(BΣ₂; 𝔽₂)=𝔽₂ in weight two, whereas the animated polynomial ring has zero π₁. |
| EnhancedDerivedSheaves E4.1, E4.4 | Same file, derived-completion reflector and completed tensor | These are integer-derived inputs. For I=0 completion=id; for ℤ_p and I=(p), the relative tensor of two 𝔽_p inputs has degrees 0 and 1. No ambient ordinary-tensor closure is imported. |
| VStackSheavesAndLisseCategories VS2.1 | `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md`, “The abelian category of solid groups”, “Solidification as a reflection”, “Solid tensor and internal Hom”, indexed new-folder head | Compact-Hausdorff integer measures, reflection and derived tensor. Finite measures have ranks 0,1,2; product tensor at ranks 2,3 has rank 6. Its native predicate is not §1.5's light null predicate. |
| VStackSheavesAndLisseCategories VS2.2 and Conventions | Same file, “Analytic measures and complete modules”, “Solid nonarchimedean coefficients”, size/cutoff convention | Static commutative coefficients and common-presentation free/tensor/Hom comparisons exist as targets. At finite S the integer measures are ℤ^S; (p⁻ⁿ) has no uniform denominator bound and is excluded from the Smith measure object. |
| HabiroRings §§2.6–2.12 | `TauCetiRoadmap/HabiroRings/README.md`, indexed open head, exact gap and those sections | It consumes this theory through `gap:light-solid-spectra` and owns arithmetic idempotence/monoidality. The first two positive factorial degrees are 1 and 3, not 1 and 2. No return dependency is used here. |
| HigherHidaAndColemanTheory R23–R24 | `packages/HigherHidaAndColemanTheory/design/README.md:1824`, `:1830`, head da88512 | The requests really are broader analytic scalar/localization and discrete-adic Huber-pair comparisons. This package only offers §§7.2 and 7.4, explicitly excluding the additional geometry. |
| LocallyAnalyticRepresentationsOfLocalGroups LR.3 | `packages/LocallyAnalyticRepresentationsOfLocalGroups/design/README.md:776` and its following solid-representation contract | The design uses finite E/ℚ_p, strongly inaccessible cutoffs, analytic coactions and group-ring/functional-analysis interfaces. Those are not silently promised by this light spectral package. |

**Commissioned ownership move.** The board head 87bc3ff of `packages/RefinedTraceMethods/README.md:2521` still displays “Light condensed and solid spectra” in §6.2; lines 2523–2545 contain the discrete embedding, null test, solidification/tensor, product generator and prime comparison. This review independently matched that block against §§1.1–2.4 and §6.4 here. The accepted design explicitly commissioned its move to this earlier owner, recorded in `packages/SolidAnalyticRings/reports/REV-DESIGN-SolidAnalyticRings~2.md:264` and retained by the repair report. The review brief permits precisely such downward ownership moves. Accordingly this is recorded as the consumer's relocation consequence, not a request to replan this package or cite a later supplier. RefinedTraceMethods retains trace-class maps, nuclearity, perfect-even sites and filtrations; its dual-of-generator example is not moved here. Its eventual consumer text must import the moved block once, preserving π₀ of the completed unit ℤ_p rather than ℤ. No supplier edge from this package points back to it.

Both declared gap sentences occur verbatim with the same slug and named supplier in `packages/SolidAnalyticRings/design/plan.json` and README lines 66 and 72. They are precise and concern one interchange each. Neither is provided by the pinned ordinary AB instances or the cited supplier sections. The spectra clause of cardinal interchange is the stabilization consequence of the same space theorem; it is not an unrelated compound request. The AB6 gap is on ambient light abelian groups; §1.5's inclusion creates the operations needed to restrict it to solid groups. The geometric VStack Part II at head 0987ba7, `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:5`, has VS6–VS11 geometry/trace scope, so its name is not repurposed for the AB6 continuation.

All 27 `*Needs:*` lines were read against the target and proof route. The seven layer summaries were checked as well. The local order is acyclic: integer null theory precedes spectral Hℤ comparison; split-tower input precedes profiles; independent-union input precedes null families; quotient connectivity precedes realization. §6.2 cites only the cofiber-tower definition from §5.1 and does not acquire its restrictive split-stage hypotheses. R03 is the one explicit prerequisite-list omission found. The requested mechanical command, executed from the supplied workspace with the supplied configuration and movable option, returned exit 0 and exactly:

```text
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Neither the merge order nor tooling was edited.

### Adversarial table: conventions, definitions, targets and API laws

Here π denotes homotopy sheaves unless “at *” is written, Map denotes the mapping spectrum in the stable setting, C=ℕ∪{∞}, P is the integer null object, N its spectral counterpart, and G=L■N. “Keep” means the computed instance supports retaining the statement with its written hypotheses. A row's example does not extend the theorem beyond those hypotheses. README line numbers identify individual assertions, including repeated appearances of the same law.

| Statement and README location | Instances tried | Values computed on the two sides, or defining test and wrong model | Result / change |
| --- | --- | --- | --- |
| Conventions: light site/universes, 17 | ∅; two points; discrete ℕ; uncountable Cantor cube | ∅ and two points satisfy compact/T2/second-countable tests; discrete ℕ fails compactness; an uncountable cube fails second countability. Empty stable product=0, rank 2×3=6. | Keep; no enlargement by an unmarked equivalence. |
| Module handedness, 19 | e₁₂,e₂₁ on row (1,0) | ((1,0)e₁₂)e₂₁=(1,0)e₁₁=(1,0); (1,0)e₂₂=(0,0). | Right precomposition order retained. |
| Grading, 21 | ΣHℤ; cochain ℤ at 2 | π₁ΣHℤ=ℤ, π₀=0; H²=ℤ gives π₋₂=ℤ, not π₂. | Keep. |
| Tensor sign, 21 | Two degree-one classes; two degree-zero classes | Swap acts by (−1)^(1·1)=−1 versus (−1)^0=+1; two swaps give +1. | Keep. |
| Coefficient distinction, 23 | 𝕊, Hℤ, weight two over 𝔽₂ | π₁𝕊=ℤ/2 versus π₁Hℤ=0; H₁(BΣ₂; 𝔽₂)=𝔽₂ versus animated polynomial π₁=0. | Keep both distinctions. |
| Shift convention, 25 | e₀,e₁ | σ*e₀=0, σ*e₁=e₀; (1−σ*)e₁=e₁−e₀; inverse(e₁)=e₁+e₀. | Keep; right shift gives e₂ and fails. |
| Discrete/product comparison, 27 | e_n∈∏_ℕℤ | Every fixed coordinate is eventually 0, so e_n→0 in the product topology; e_n≠0 for all n, so no convergence to 0 in the discrete product. | Keep δ(product)→product(δ), not its inverse. |
| Polynomial convention, 29 | 𝕊[t]/t² and constant section | π₀ has basis 1,t, t²=0; s(t·1)=0 whereas t·s(1)=t≠0. | Sphere-linearity only; monoid algebra, not free E∞ algebra. |
| Scalar fibers/quotients, 31 | a₀=1; scalar 0 | B₀=cofib(id)=0, J₀=A; cofib(0)=A⊕ΣA. Marked map J₀→A=id, not 0. | Keep. |
| Profile/quotient direction, 31 | t²→t; p=2,3 on H𝔽_p | t²x remains t²x in tA; positive quotient transition has π₀=id, π₁=0, tail limit H𝔽_p. At exponent 0 quotient=0. | Keep direction; R02 clarifies positive range. |
| 1.1 hypersheaf category, 84 | Zero hypersheaf; constant nonzero presheaf | At ∅: 0 satisfies descent, constant Hℤ gives ℤ≠0. On a two-point disjoint union: sections X(*)², not X(*). | Definition discriminates presheaves from sheaves. |
| 1.1 stable/presentable/closed construction, 84–86 | id:X→X; finite free inputs | cofib(id)=0=fib(id); Hom(𝕊²,Hℤ³)=(Hℤ)^6 on both tensor–Hom descriptions. | Keep supplied localization route. |
| 1.1 limits/colimits, 84 | Constant tower Hℤ; coproduct of two Hℤ | Limit=Hℤ with identity projections; coproduct=Hℤ², with π₀=ℤ²; empty value remains 0. | Keep sectionwise limits and hypersheafified colimits distinct. |
| 1.1 hypercover refinement, 84–86 | Identity cover; two-point cover of * | Identity totalization=X(*); Čech degrees have 2^(n+1) points, finitely many at every n and countably many degrees. | Finite matching refinements give the asserted countable shapes. |
| 1.1 API free evaluation, 92 | T=∅,* and two points, M=Hℤ | Map from 0,𝕊,𝕊² has π₀=0,ℤ,ℤ², equal to M(T). | Keep. |
| 1.1 API detection, 94 | id versus zero on δHℤ | On * the values send 1 to 1 versus 0; id is invertible, zero is not. On all values the zero object has zero groups. | Keep coherent value detection. |
| 1.1 API hyperdescent, 96 | Identity hypercover of * | M(*)→Tot(constant M(*)) is id; on Hℤ, π₀ map is 1:ℤ→ℤ. | Keep. |
| 1.1 API free tensor, 98 | T two points/U three points; T empty | Left rank 2·3=6=right rank; empty case 0⊗𝕊³=0=𝕊[∅]. | Keep. |
| 1.2 δ/adjunction/unit/monoidality, 110 | X=0,𝕊 and ΣHℤ | Unit gives π₀ 0→0, ℤ→ℤ with 1→1; on ΣHℤ gives π₁ ℤ→ℤ. δ𝕊⊗δ𝕊=δ𝕊; zero functor fails the ℤ unit. | Keep fully faithful colimit-preserving embedding. |
| 1.2 homotopy and inverse-limit map, 110 | Hℤ; H(ℤ/p^r) tower | π₀δHℤ=discrete ℤ; limit's sections on ℤ_p include id:ℤ_p→ℤ_p, absent from locally constant sections of δHℤ_p. | No unjustified limit equivalence. |
| 1.2 API functor/shifts, 118 | ×2 then ×3 on Hℤ; one suspension | δ(×3∘×2) acts by 6=3·2; zero map acts by 0; shift moves ℤ from π₀ to π₁ on both sides. | Keep. |
| 1.2 API unit in all degrees, 120 | 𝕊⊕Σ𝕊 | π₀=ℤ and π₁=(ℤ/2)⊕ℤ on both sides; both summands retained by the unit. | Keep. |
| 1.2 API tensor coherence, 122 | Ranks 2,3,1 | Both associations have 2·3·1=6 coordinates; unsuspended swap changes (i,j) to (j,i) with +1. | Keep. |
| 1.3 N/marked shift and transport, 134–136 | C versus singleton marked point | Point π₀N=ℤ^(ℕ), while the singleton cofiber=0; unreduced free C has an extra ℤ at ∞. ULift preserves these basis labels and σ(e_n)=e_(n+1). | Keep marked construction and separate universe target. |
| 1.3 internal-projective retract, 136 | Integer marked inclusion/retraction | On the ∞ generator the composite is 1; reduced summand kills ∞. Over base integers the internal epi test is the pinned theorem, transferred through this idempotent. | No duplicate native proof. |
| 1.3 API functoriality, 142 | Shift twice; identity | On point basis e_n, σ²(e_n)=e_(n+2), identity(e_n)=e_n; both maps send marked ∞ to ∞ before quotient. | Keep. |
| 1.3 API Hom fiber, 144 | M=δHℤ | Continuous C→ℤ sequences are eventually constant; fiber of limit evaluation consists exactly of eventually zero sequences, ⊕_ℕℤ. | Keep; unreduced Hom includes a constant ℤ. |
| 1.3 API precomposition, 146 | b=e₁ | Coefficient at 0 is b₁=1, at 1 is b₂=0; σ*b=e₀. | Keep. |
| 1.3 API universe/scalar transport, 148 | Lift of e₀,e₁ over ℤ | Both lifted shift paths send e₀ to e₁; reduction at marked point is 0 on both paths. | Keep comparison on common presentations only. |
| 1.4 solidity definition, 160 | 0, δHℤ, topological Hℝ | Tests: 0→0 invertible; finite-support difference invertible by tails; harmonic b_n has no null tail solution in ℝ. | Test excludes a plausible ordinary-topological wrong model. |
| 1.4 API internal/external iff, 168 | δHℤ at *; Hℝ harmonic test | Cone-test mapping groups vanish for δHℤ; for Hℝ the harmonic cokernel class is nonzero already at *. | Both directions follow by free-evaluation detection. |
| 1.4 API equivalence/inclusion, 170 | id, −id on Hℤ | Both tests conjugate to the same invertible difference; endomorphisms in the full subcategory and ambient category both have π₀=ℤ. | Keep. |
| 1.4 API discrete solidity, 172 | δH𝔽₂; δΣHℤ | Tail inverse of e₁ is e₀+e₁, with difference e₁ in either degree; constants at ∞ are removed. | Keep arbitrary spectral shifts. |
| 1.5 abelian/derived null categories, 184 | ℤ, ℝ, Σℤ | ℤ passes via finite tail sums; ℝ fails on harmonic sequence; Σℤ has one solid H⁻¹=ℤ. | Definitions have positive and negative models. |
| 1.5 API Grothendieck/closure/extensions, 192 | ×2 on ℤ; split ℤ extension; ⊕ℤ and ∏ℤ | ker=0, coker=ℤ/2; middle extension=ℤ²; sum has finite support, product has all-one vector. Both ambient and solid operations give these values. | Keep; extension and colimit laws are RC targets. |
| 1.5 API internal Hom, 192 | Hom(ℤ²,ℤ); ℤ target | Internal Hom=ℤ²; each coordinate null test has the same tail inverse. | Keep arbitrary source, solid target condition. |
| 1.5 API reflection/tensor/unit/ℝ, 194 | ℤ, ℤ², ℝ | Hom(Lℤ,ℤ)=ℤ=Hom(ℤ,ℤ); ℤ⊗■ℤ²=ℤ²; Lℝ=0. Identity reflector would give ℝ≠0. | Keep. |
| 1.5 API derived inclusion/cohomology, 196 | Σℤ versus Σℝ | H⁻¹=ℤ passes; H⁻¹=ℝ fails; all other cohomology is 0. Products and filtered sums retain those degrees. | Both directions tested. |
| 1.5 API derived Hom closure, 196 | RHom(ℤ,Σℤ) | Σℤ on both ambient and solid sides, H⁻¹=ℤ and otherwise 0. | Keep. |
| 1.5 API derived full faithfulness and left derivation, 198 | ℤ, Σℤ; two torsion factors | End(ℤ)=ℤ, Ext¹(ℤ,ℤ)=0 in both categories; 𝔽₂⊗ᴸ■𝔽₂ has H⁰=H⁻¹=𝔽₂. | Keep derived tensor rather than its heart truncation. |
| 1.5 API free measures/projectivity/generation, 200 | S=∅,*,2,C; topological/discrete ℤ_p quotient Q | Measures are 0,ℤ,ℤ²,ℤ×∏ℕℤ. Q(*)=0 while the class of p^n at C is nonzero, so finite S cannot generate. | Infinite hypothesis retained; product basis itself need not be canonical. |
| 1.5 API product tensor, 202 | Empty; ranks 2,3; I=J=ℕ | 0=0; ℤ⁶=ℤ⁶; countable product on ℕ² on both sides, higher Tor=0. | Keep countable scope. |
| 2.1 null-Hom exactness/colimits, 228 | ×2 on δHℤ; ΣHℤ | Hom(N,δHℤ)(*)=⊕ℕℤ; coker ×2=⊕ℕ𝔽₂, matching Hom(N,δH𝔽₂)(*); suspension moves the same group to degree 1. | Keep internal, not arbitrary sectionwise projectivity. |
| 2.1 solidity and complete t-structure, 228 | ΣHℤ, ΣHℝ, 𝕊⊕Σ𝕊 | Solid iff all π are solid: first passes, second fails; third has π₀=ℤ, π₁=(ℤ/2)⊕ℤ. Postnikov tower is eventually fixed in each specified degree. | Keep all homotopy sheaves; heart alone does not determine algebra. |
| 2.1 API truncations, 236 | ΣHℤ | τ≤0=0, τ≥1=ΣHℤ; π₁ comparison is ℤ→ℤ, excluded degrees are 0. | Keep. |
| 2.1 API heart, 238 | B=ℤ and 0 | π₀HB=B, π_kHB=0 for k≠0; H0=0. | Keep. |
| 2.1 API suspension, 240 | Hℤ, b=0 | Before: π₀=ℤ; after: π₁=ℤ, π₀=0; lower bound changes 0→1. | Keep. |
| 2.2 reflection/colimit/Hom closure, 252 | N; solid Hℤ; zero | L■N has π₀(*)=∏ℕℤ versus N(*)=⊕ℕℤ; L■Hℤ=Hℤ; Hom(𝕊²,Hℤ)=Hℤ²; L■0=0. | Keep genuine reflection, not identity. |
| 2.2 monoidal/connective/module construction, 252 | Σ^b𝕊⊗Σ^c𝕊; A=Hℤ; A=0 | Tensor=Σ^(b+c)𝕊 with first π=ℤ; module heart over Hℤ has π₀ modules; zero algebra admits only zero modules. | Keep arbitrary integer bounds. |
| 2.2 free spectral measures, 252 | ∅,*,2 and C | Finite quotient limits give 0,𝕊,𝕊² and 𝕊×∏ℕ𝕊; π₁ of the last is (ℤ/2)×∏ℕℤ/2. | Sphere stems retained. |
| 2.2 API adjunction, 260 | Source 𝕊; target δHℤ | Both mapping spectra have π₀=ℤ, π_k=0 otherwise; the unit sends 1→1. | Keep. |
| 2.2 API idempotence, 262 | N and 0 | L■N=G=L■G; the two maps G→L■G induce identity on each integer coordinate; at 0 both maps are unique. | Keep units marked. |
| 2.2 API closed tensor, 264 | C=𝕊²,D=𝕊³, M=Hℤ | Hom(𝕊⁶,Hℤ)=Hℤ⁶=Hom(𝕊²,Hℤ³); finite coordinates agree. | Keep. |
| 2.2 API presentation/naturality, 266 | Two-point set→*; refining its identity presentation | Both free-measure maps send (a,b) to a+b; refined identity partitions leave ℤ² and its two projections unchanged. | Zero map fails the marked unit. |
| 2.3 Hℤ equivalence and detection, 278 | Hℤ; Σ^b𝕊; H𝔽_p⊗HℤH𝔽_p | Units both ℤ at degree 0; bottom π_b is ℤ→ℤ identity; torsion tensor gives π₀=π₁=𝔽_p for p=2,3. | Keep bounded-below detection and relative tensor. |
| 2.4 generator/product/t-exact mapping, 294 | G; A=Hℤ; A=0 | π₀G(*)=∏ℕℤ, π₁G(*)=∏ℕℤ/2; Hℤ⊗■G has only π₀=∏ℕℤ; G_0=0 and all its modules=0. | Keep, including zero-category generation. |
| 2.4 endomorphism ring/right action, 294 | Two-coordinate retract | e₁₂e₂₁=e₁₁; φe₁₁=φ, φe₂₂=0 for φ=(1,0). Endomorphism spectrum has no negative π by mapping t-exactness. | Right action order retained. |
| 2.4 API reflection unit/projections, 302 | e₀,e₁∈N(*) | Images in product are coordinate basis e₀,e₁; first two projections are (1,0),(0,1). Zero unit fails both. | Keep specified measure unit. |
| 2.4 API homotopy formula, 304 | k=−1,0,1 | Both sides give 0, ∏ℕℤ, ∏ℕℤ/2, respectively. | Keep every degree. |
| 2.4 API module adjunction, 306 | A=Hℤ, M=A; A=0 | Both Map_A(A⊗G,A) and Map(G,A) have π₀=⊕ℕℤ; for A=0 both are 0. | Keep. |
| 3.1 product comparison/coherence, 330 | I,J empty/finite/ℕ | Empty=0; 2×3 gives six spheres; ℕ×ℕ gives countable product. Coordinate (1,2) sends e₁⊗e₂→1 on both sides. | Keep projection map, not an arbitrary equivalence. |
| 3.2 split tower definition, 346 | 0; identity rank one; ×2 on rank one | Sections: unique 0; id; impossible integer b with 2b=1. | Split hypothesis excludes bad tower. |
| 3.2 decomposition theorem/spectral lift, 346–348 | Projection ℤ³→ℤ²; retraction matrix diag(1,1,0) | Kernel rank=1, summand ranks 2+1=3; idempotent squared equals itself; lifted sphere decomposition has π₀=ℤ³ and π₁=(ℤ/2)³ on both sides. | Keep finite integer basis and bounded-below detection. |
| 3.2 API data, 354 | d(x,y)=x, s_a(x)=(x,ax) | ds_a(x)=x for a=0,1; s_0d≠id on (0,1), so only the stated right-inverse law is imposed. | Keep coherent sections as data. |
| 3.2 API equal maps, 356 | Identity tower, stage map ×2 | Both coherently identical maps of limits act by 2 on π₀ℤ. | Keep; no equality from unrelated stage homotopy classes. |
| 3.2 API kernel/limit formulas, 358 | P_n=𝕊^(n+1) | P₀ rank 1; first n kernels rank n; total rank n+1; limit coordinates are ∏ℕ𝕊. | Keep. |
| 3.2 API choice independence, 360 | s_0 versus s_1 for d(x,y)=x | Presentations use (x,y)↦(x,y) versus (x,y−x); inverse adds x; both retain first projection x. | Keep marked presentation comparison, not equality of coordinates. |
| 3.3 independent/diagonal comparison, 372 | Growing towers; constant rank-one | Stage (1,2) rank=6; diagonal stages cover every pair by max(m,n); rank-one limits give 𝕊=𝕊⊗■𝕊. | Keep independent indices and inverse-direction cofinality. |
| 3.3 naturality without section preservation, 372 | Shear (x,y)↦(x,y+x) with d(x,y)=x | d∘shear=x=d, but shear∘s_0=s_1; compatible limit maps preserve projection despite changing section. | Keep all coherent tower maps. |
| 3.4 balancing/transitivity, 388 | A=𝕊[t], X=Y=A; A=𝕊; X=0 | Absolute π₀=ℤ[t₁,t₂], balancing sends both variables to t, giving ℤ[t]; at unit both tensors=X⊗Y; zero gives 0. | Keep; R03 adds projection prerequisite. |
| 3.4 dualizable limit comparison, 388 | B=A²; B=Hℚ over Hℤ | Finite free B gives (∏M_i)²=∏(M_i²); rationalization of ∏ℤ has a common denominator, whereas (2⁻ⁿ)∈∏ℚ has none. | Dualizability retained; false arbitrary exchange excluded. |
| 4.1 countable interchange, 414 | Empty K; terminal J; ordinary filtered counterexample | Empty limits=0 on both sides; terminal J gives the same limit. With F(n,k)=Hℤ for k<n: π₀ left=⊕ℕℤ, right=∏ℕℤ, distinguished by (1,1,…). | Keep ω₁-filtered hypothesis; gap owns general theorem. |
| 4.1 sectionwise hyperdescent/module lift, 414–416 | Identity hypercover; fixed A, zero diagram | Tot of constant X is X, so both sectionwise paths give X; all limits and colimits of zero modules give 0. Countable Čech degrees use the specified cardinal bound. | Keep fixed algebra; no varying-algebra assertion. |
| 4.2 independent directed bounds, 430 | B_j=ℚ; B_(j,n)=(1/n!)ℤ | Independent index n_j=j+1 contains (1/(j+1)!)_j on both sides; a diagonal n would require j! divide n! for all j and fails. | Keep independent choices; nonempty directed sets understood in the usual sense. |
| 4.2 split tower homotopy/surjectivity, 430 | P_n=𝕊^(n+1), k=0,1,−1 | Limits give ∏ℕℤ, ∏ℕℤ/2, 0; projection to n+1 entries is onto by zero extension; lim¹=0 in each degree. | Keep split rather than arbitrary tower. |
| 5.1 coefficient datum, 456 | A=𝕊[[t]], a_r=t^r; A=0; 𝕊/p | B_r has ranks 0,1,2 for r=0,1,2 and limit A; A=0 gives all stages 0; π₀𝕊/p=ℤ/p is not finite free. | Definition has admitted and excluded models. |
| 5.1 completion and marked ideals, 456–458 | t^r on 𝕊[[t]] | π₀J_r=t^rℤ[[t]]≅ℤ[[t]]; marked map sends 1 to t^r, not 1; Λ_a(A)=A by completeness. | Keep unmarked isomorphism separate from inclusion. |
| 5.1 API data invariance, 464 | Reindex stages by 2r | Quotient ranks become 2r, but compatible power series coefficients and inverse limit remain ℤ[[t]] in degree 0. | Coherent datum, not just quotient isomorphism classes. |
| 5.1 API ideal maps, 466 | r=1,s=2, a_r=t^r | J₂→J₁ multiplies abstract A-coordinate by t; composing J₁→A gives t² on both paths. | Keep marking/divisibility. |
| 5.1 API natural unit/scalar maps, 468 | ×t:A→A and stage r=2 | Both composites send 1 to t mod t²; identity sends 1 to 1; zero sends it to 0. | Keep. |
| 5.1 API cofinality, 470 | All powers versus even powers | Both limits have arbitrary coefficients (c₀,c₁,…); projection to t² returns (c₀,c₁) on both sides. | Keep cofinal coherent reindexing. |
| 5.1 API cofiber/tensor, 472 | M=A, a=t; M=H𝔽₂, a=0 | First both quotients are 𝕊; second both are H𝔽₂⊕ΣH𝔽₂, with π₀=π₁=𝔽₂. | No underived quotient or quotient algebra substituted. |
| 5.2 profile definition/order/stages, 484 | f(j)=j, f=0; f=j+1→g=j | Sublevel sizes for r=0,1,2 are 0,1,2 versus 0,∞,∞; map t^(j+1)x remains itself in t^jA. | Keep properness and reversed order. |
| 5.2 block-map definition, 484–486 | Identity, duplication, attempted infinite column of ones | Supports are {j}, {2j,2j+1}; an image (1,1,…) is not in ⊕ℕA for A≠0, hence is not a map from a singleton free block. | Actual finite-output factorization excludes wrong model. |
| 5.2 API profile equality, 494 | f=j and g=j+1 | At j=0 values 0 versus 1, so unequal; replacing f(0) by7 changes only one finite sublevel membership and retains properness. | Keep. |
| 5.2 API filtered/not ω₁-filtered, 496 | f=j,g=j+1; f_k=max(j−k,0) | min(f,g)=j; any common target h≤f_k for every k must satisfy h(j)≤f_j(j)=0, hence h=0, not proper. | Keep distinction. |
| 5.2 API transition composition, 498 | j+2→j+1→j, t-adic datum | Abstract multipliers t·t=t²; marked element t^(j+2)x unchanged through either path. | Keep. |
| 5.2 API block-map composition, 500 | Duplication twice | Support {4j,4j+1,4j+2,4j+3}, cardinal 4; identity support {j}. | Keep finite unions. |
| 5.2 API automatic finite factorization, 502 | Block A and block ∏ℕA | A⊗𝕊=A; A⊗■G=∏ℕA. Both are retracts/free images of compact G, so a point of Map into a sum occurs at a finite subsum; identity A→A uses one output. | Keep compactness argument, not pointwise finite columns alone. |
| 5.3 spectral null-family equivalence, 520 | A=𝕊[[t]], singleton blocks | (t^j) has r survivors mod t^r on both sides; constant ones has infinitely many survivors already mod t and belongs to neither side. | Keep all homotopy degrees, no profile ω₁ argument. |
| 5.3 comparison map/modulo rule, 520–522 | f(j)=j, r=2 | Only j=0,1 contribute, giving 1,t; for j≥2 the marked composite to A/t² is zero by divisibility. | Keep specified nullhomotopies. |
| 5.3 mono/lim¹ proof input, 522 | t-adic stages, k=0,1 | Projection of ∏ℕπ_k𝕊 to first r coordinates is onto; π_kJ_r is the tail subgroup; lim¹=0. | Independent bounds plus exact products suffice. |
| 5.4 every-degree and naturality, 536 | k=−1,1; duplication and fold | Negative degree=0; degree 1 has (ηt^j), modulo t² gives η,ηt. Duplication gives outputs η,η,ηt,ηt; fold gives η+ηt modulo t². | Keep spectral rather than π₀-only result. |
| 5.4 scalar-data maps, 536 | Identity datum; A→0 | Identity preserves every t^r ideal and coefficient; zero datum receives only 0, so both completion paths give 0. | Marked tower compatibility, not arbitrary algebra map. |
| 6.1 uniform resolution/comparison, 564 | M=0; M=Σ^bG_A | Zero and constant simplicial resolutions realize to 0 and Σ^bG_A; each term has the same bound b. For A=δ𝕊, the latter has π_b=∏ℕℤ. The identity simplicial map realizes the identity. | Keep one b for all simplicial degrees; R01 fixes non-example. |
| 6.2 general quotient connectivity/exactness, 580 | a=1, a=0; Hℤ with 2^r | Quotients are 0, M⊕ΣM, H(ℤ/2^r); first nonzero degrees are never below b. In the last tower lim¹=0, π₋₁Λ=0, π₀Λ=ℤ₂. | Keep sharp ≥b without split stages or complete A. |
| 6.2 bottom-transition argument, 582 | π_bM=ℤ, a_r=2^r | coker at r is ℤ/2^r; transition sends [x] mod 2^(r+1) to [x] mod 2^r and is onto. At r=0 the target is0. | No ideal-tower substitution. |
| 6.3 realization/tail theorem, 596 | Uniform b=0; normalized degree 1 Hℤ | Degree1 layer is ΣHℤ, with π₁=ℤ, π₀=0; tail after d has degrees ≥d+1 on both completed and uncompleted sides. | Keep finite-skeleton proof, not arbitrary limit/realization interchange. |
| 6.3 fixed degree bound/bar action, 596–598 | b=0, k=1,d=2; bar over Hℤ on connective modules | Tail≥3 has π₁=0 on both sides; finite-skeleton comparison determines π₁. A-action through X gives a·(x⊗y)=(ax)⊗y=x⊗(ay) after balancing. | Keep specified A-linearity; R01 fixes failing example. |
| 6.4 prime embedding/tensor/unit, 612 | X=H𝔽_p; p=2,3; completed sphere | Positive quotient tail limit=X, adjunction unit=id; completed sphere π₀(*)=ℤ₂ or ℤ₃ versus ambient ℤ. | Keep completed codomain and all primes. |
| 6.4 orthogonality/reflection, 612 | Hℤ_p, Hℤ[1/p] | p-local telescope test into Hℤ_p is0; completion of Hℤ[1/p] is0 since each cofiber of invertible p^r is0. | Both positive and negative completion models tested. |
| 6.4 API evaluation unit, 620 | e_pH𝔽_p at * | π₀=𝔽_p, higher π=0, and unit sends 1→1. | Keep. |
| 6.4 API bounded tensor/unit, 622 | Two completed sphere units | Tensor in the completed solid category is the same unit, π₀(*)=ℤ_p on both sides. Ambient uncompleted unit would have ℤ. | Keep. |
| 6.4 API Hℤ relative comparison, 624 | Hℤ_p⊗HℤHℤ_p; H𝔽_p⊗Hℤ_pH𝔽_p | Solid first tensor=Hℤ_p; second has π₀=π₁=𝔽_p. | Keep absolute, relative and completed operations distinct. |
| 6.4 API full reflection tests, 626 | All shifts of p-inverted generator; rational input | Inverted scalar cofibers=0, hence reflector kills rational input; an unshifted π₀-only test cannot see a shifted nonzero rational object. | Keep all shifts and all light free tests. |
| 7.1 analytic structure definition, 650 | All modules; {0}; perfect Hℤ-modules | Reflectors id and 0 satisfy closure/connectivity; perfects fail coproduct closure since ⊕ℕHℤ has infinite rank and is not perfect. | Definition admits two valid structures and excludes wrong one. |
| 7.1 API data determine structure, 658 | Same A=Hℤ, D=all versus D=0 | Units on A have π₀ maps ℤ→ℤ versus ℤ→0; underlying algebra alone does not determine D. | Keep specified inclusion and unit. |
| 7.1 API marked uniqueness, 660 | Two identity reflectors on all modules | Unit comparison sends 1→1; composing it with −1 sends 1→−1 and fails the same unit marking. | Keep uniqueness under units, not unmarked equivalence. |
| 7.1 API morphism composition, 662 | Hℤ→H𝔽₂ with full structures; identity | Restriction returns the same underlying 𝔽₂ group; composite with identity equals the reduction map, 1↦1. | Keep. |
| 7.1 API completed iff unit iso, 664 | D=all; D=0, A=Hℤ or 0 | id:ℤ→ℤ invertible; ℤ→0 not invertible; 0→0 invertible. | Both directions tested. |
| 7.2 complete tensor/unit/algebra, 676 | D=all and D=0 over Hℤ | Tensor units have π₀=ℤ and 0; in D=0 both M⊗hatN and L_D(M⊗N) are 0. | Keep Â distinct from A. |
| 7.2 compatible scalar/pushout theorem, 676–678 | Identity square with zero target; H𝔽₂←Hℤ→H𝔽₂ | Both completed paths=0 in zero target despite unequal kernels. Trivial-structure pushout has π₀=π₁=𝔽₂ on both paths. | No kernel-generation assumption needed. |
| 7.2 API tensor unit, 684 | D=all; D=0 | L_DA=A versus 0; unit tensor sends M to M in each category (only M=0 in second). | Keep. |
| 7.2 API scalar adjunction, 686 | A=Hℤ,B=H𝔽₂, M=A,N=B, full structures | Both mapping spectra have π₀=𝔽₂, π_k=0 otherwise; units send 1→1. | Keep. |
| 7.2 API composition/coherence, 688 | Hℤ→H𝔽₂→H𝔽₂ and M=Hℤ | Both paths give H𝔽₂ with the same 1; third identity extension changes neither map nor object. | Keep. |
| 7.2 API completed pushout paths, 690 | Same square, all B′-objects killed | Left path 0, right path 0, direct target completion 0; ordinary pushout before completion can be nonzero. | Target reflector retained. |
| 7.3 summability/localization/connectivity, 704–706 | F=∅,{0},{1}; A=Hℚ_p,f=p⁻¹ | First three tests give all solid modules. In last test b_n=p^n has b₀=1 and b_n−p⁻¹b_(n+1)=0, so A is not local. | Definition excludes wrong completed-unit claim. |
| 7.3 endomorphism-inversion route, 706 | f=0; f nilpotent of square 0 | Inverted endomorphism is 1 or 1−fσ*, with inverse 1 or1+fσ*; the localization is the original connective algebra in both cases. | Keep explicit connective inversion target; general reflection alone would not suffice. |
| 7.3 API test/representatives, 712 | f=ε in 𝔽₂[ε]/ε² | (1−εσ*)(1+εσ*)=1−ε²(σ*)²=1; changing to equal scalar class leaves this identity unchanged. | Keep internal test. |
| 7.3 API free/local adjunction, 714 | F=∅, C=Hℤ, M=Hℤ | L_FC=C; both Map groups have π₀=ℤ and same 1. | Keep. |
| 7.3 API monotonicity, 716 | ∅⊆{p⁻¹} on Hℚ_p | Source has A as an object, target excludes A by b_n=p^n; L_target∘id=L_target. | Nontrivial direction D_F′⊆D_F verified. |
| 7.3 API scalar naturality, 718 | Hℤ→H𝔽₂, test f=0 | Both tests are identity; restriction preserves locality and 0 maps to 0. | Keep requirement that scalar tests are carried to target tests. |
| 7.3 API nilpotence, 720 | d=1,f=0; d=2,f=ε | Finite geometric inverses are 1 and 1+εσ*; multiplying gives 1 in either case. | Keep characteristic 2 and nonreduced inputs. |
| 7.4 common-presentation measure equivalence, 736 | Integer measures at ∅,*,2; zero structure over Hℤ | Free complete objects 0,ℤ,ℤ² agree; zero structure has μ[*]=0, so B→μ[*] is not invertible for B=ℤ and it is uncompleted on both sides. | Keep static coefficients and actual Dirac unit. |
| 7.4 completed iff, tensor/Hom/scalar comparisons, 736–738 | Integer structure; H𝔽₂ relative tensor; E=ℚ₂ | Dirac at * = id_ℤ; relative tensor has π₀=π₁=𝔽₂; measure product excludes (2⁻ⁿ), which an unrestricted product includes. | Both completedness directions and denominator boundary tested. |
| 7.4 animated/static and cutoff restrictions, 736–738 | B=𝔽₂, finite two-point presentation | θB=H𝔽₂, modules=D(𝔽₂); finite measure has rank 2 before and after cutoff enlargement. Free derived commutative weight-two π₁=𝔽₂ remains distinct from animated π₁=0. | Keep comparison only on supplied presentations. |

### Adversarial table: every README Check and worked example

Each numbered Check below follows its order within the subsection. Repeated identities are recomputed here so that no Check is certified merely by a count.

| Check (README line) | Instances tried | Computed values / comparison | Result / change |
| --- | --- | --- | --- |
| 1.1.1 (102) | Empty light space | Sheaf value=0; constant nonzero presheaf value=Hℤ, π₀=ℤ≠0. | Keep. |
| 1.1.2 (104) | Disjoint pair | Value M(*)×M(*); free object 𝕊², π₀=ℤ². | Keep. |
| 1.1.3 (106) | C at * and at two points | π₀=⊕_Cℤ and (⊕_Cℤ)²; all-one vector has infinite support and is absent. | Keep. |
| 1.2.1 (126) | X=0 | δ0=0; unit is the unique identity 0→0. | Keep. |
| 1.2.2 (128) | X=𝕊⊕Σ𝕊 | π₀=ℤ⊕0=ℤ; π₁=ℤ/2⊕ℤ. | Keep. |
| 1.2.3 (130) | T=ℤ_p, tower ℤ/p^r | Identity is continuous with infinite image; locally constant map from compact T to discrete ℤ_p has finite image. Thus id lies only in the limit's sections. | Keep. |
| 1.3.1 (152) | Singleton marked point | cofib(id_𝕊)=0, versus unreduced free object 𝕊. | Keep. |
| 1.3.2 (154) | e₁ | Difference=e₁−e₀; inverse=e₁+e₀, since σ*(e₁+e₀)=e₀. | Keep. |
| 1.3.3 (156) | Opposite shift | Right shift sends e₁→e₂, versus required e₀. | Keep. |
| 1.4.1 (176) | M=0 | Hom(N,0)=0 and its only endomorphism is invertible. | Keep. |
| 1.4.2 (178) | δ𝕊 versus δHℤ | π₀ both ℤ; π₁ is ℤ/2 versus 0. | Keep. |
| 1.4.3 (180) | N and its reflection | π₀(*)=⊕ℕℤ versus ∏ℕℤ; all-one vector belongs only to latter. Reflection of a local object would be an equivalence. | Keep non-example. |
| 1.5.1 (206) | P against ℤ, e₁ | Hom at*=⊕ℕℤ; (1−σ*)(e₁+e₀)=e₁. Wrong shift on e₁ gives e₁−e₂. | Keep. |
| 1.5.2 (208) | ∅,*,2,C and reduced P | Measures 0,ℤ,ℤ²,ℤ×∏ℕℤ; reduced measure ∏ℕℤ contains ones, P(*) does not. | Keep. |
| 1.5.3 (210) | I,J sizes 2,3; empty; bothℕ | Derived tensor=ℤ⁶; 0; ∏ℕ²ℤ respectively; higher Tor=0 in each case. | Keep. |
| 1.5.4 (212) | Σℤ; harmonic b_n in ℝ | H⁻¹Σℤ=ℤ; x₀−x_(N+1) tends to finite x₀ while harmonic partial sums diverge. No null solution; Lℝ=0 by the cited reflection result. | Keep. |
| 1.5.5 (214) | Q=topological ℤ_p/discrete ℤ_p | Q(*)=0; p^n has infinite image on C, so is not locally constant, even after a compact surjective cover. Its class at C is nonzero. | Keep finite S non-generator. |
| 2.1.1 (244) | ΣHℤ; cochain ℤ at2 | π₁=ℤ,π₀=0; cochain gives π₋₂=ℤ. | Keep. |
| 2.1.2 (246) | Zero module | All π_k=0; every upper and lower bound holds. | Keep. |
| 2.1.3 (248) | Square-zero 𝕊⊕Σ𝕊 | π₀=ℤ, π₁=(ℤ/2)⊕ℤ; its heart forgets the second summand. | Keep. |
| 2.2.1 (270) | Zero | L■0=0; 0⊗■M=0. | Keep. |
| 2.2.2 (272) | Discrete sphere unit | L■δ𝕊=δ𝕊; δ𝕊⊗■M=M. At M=Hℤ both have π₀=ℤ. | Keep. |
| 2.2.3 (274) | G against δH𝔽₂ | Continuous null coefficients give ⊕ℕ𝔽₂, cardinalℵ₀. Algebraic dual of∏ℕ𝔽₂ has cardinal2^(2^ℵ₀), so abstract Hom is different. | Keep. |
| 2.3.1 (286) | Hℤ-module unit | π₀=ℤ maps to H⁰=ℤ; all other groups0. | Keep. |
| 2.3.2 (288) | p=2,3, relative Hℤ tensor | Resolution ℤ→pℤ becomes zero differential after mod p: groups 𝔽_p in degrees 0,1, others 0. | Keep. |
| 2.3.3 (290) | Weight two over 𝔽₂ | H₁(BΣ₂; 𝔽₂)=𝔽₂; animated polynomial π₁=0. | Keep. |
| 2.4.1 (310) | G at* | π₀=∏ℕℤ contains(1,1,…). | Keep. |
| 2.4.2 (312) | Coordinate e_n | Each fixed coordinate eventually0; the sequence never equals0 and fails discrete convergence. | Keep. |
| 2.4.3 (314) | A=0 | G_A=0; a unital zero-algebra module must have id=0, hence is0. | Keep. |
| 2.4.4 (316) | φ=(1,0),matrix units | φe₁₂=(0,1); then e₂₁ gives(1,0); φe₂₂=0. | Keep. |
| 3.1.1 (338) | Empty I | Empty product=0; 0⊗■∏J𝕊=0=∏∅𝕊. | Keep. |
| 3.1.2 (340) | Sizes2,3 | Six coordinates; projection(1,2) takes e₁⊗e₂ to 1 and other basis pairs to 0. | Keep. |
| 3.1.3 (342) | Suspended/unsuspended swap | Two degree-one factors:−1; coordinate permutations on degree-zero bases:+1. | Keep. |
| 3.2.1 (364) | Constant0 and rank-one identity towers | Kernels0; limits0 and 𝕊 respectively. | Keep. |
| 3.2.2 (366) | P_n=𝕊^(n+1),n=0,1,2 | Ranks1,2,3; rank difference1 at each transition. | Keep. |
| 3.2.3 (368) | ×2 on 𝕊 | Any section would give 2b=1 inℤ; no integer b satisfies it. | Keep. |
| 3.3.1 (380) | Constant rank-one towers | 𝕊⊗■𝕊=𝕊=limit of constant 𝕊. | Keep. |
| 3.3.2 (382) | m=1,n=2 | Rank(2)·rank(3)=6, not diagonal rank 4. | Keep. |
| 3.3.3 (384) | Constant section A/(t)→A | s(t·1)=s(0)=0; t·s(1)=t≠0. | Keep. |
| 3.4.1 (396) | A=𝕊; X=0 | Both balancing sides=X⊗■Y; with zero X both 0. | Keep. |
| 3.4.2 (398) | A=𝕊[t],X=Y=A | Absolute π₀=ℤ[t₁,t₂]; multiplication sends(t₁,t₂)↦(t,t), yielding ℤ[t]. | Keep. |
| 3.4.3 (400) | Rationalization of∏ℤ | Each element has some common integer denominator; valuations of2⁻ⁿ are−n, unbounded, so this vector is only in∏ℚ. | Keep. |
| 4.1.1 (422) | K empty; J=* | Both sides0 in empty case; both lim_KF in point-index case. | Keep. |
| 4.1.2 (424) | F(n,k)=Hℤ for k<n | LHSπ₀=⊕ℕℤ; RHSπ₀=∏ℕℤ; ones missing only on left. ℕ is filtered but notω₁-filtered. | Keep. |
| 4.1.3 (426) | K=* | Comparison is id_colimF; on constant Hℤ it sends 1→1. | Keep. |
| 4.2.1 (438) | Subgroups(1/n!)ℤ ofℚ | Index n_j=j+1 contains(1/(j+1)!)_j. No fixed n bounds all its denominators. | Keep. |
| 4.2.2 (440) | B_j=0; empty family | Product and colimit both 0; empty product in Ab=0. | Keep. |
| 4.2.3 (442) | Truncation ℤ^(n+1) | Any tuple lifts by adding zeros; projection onto; difference map on tower products is onto, givinglim¹=0. | Keep. |
| 5.1.1 (476) | Spherical t-adic ring | Stages rankr; π_kA=(π_k𝕊)[[t]]; shift multiplication has cokernel π_k𝕊 in every k, so cofiber 𝕊. | Keep. |
| 5.1.2 (478) | A=0 | a₀=1=0; J_r=0,B_r=0,Λ=0. | Keep. |
| 5.1.3 (480) | 𝕊/p | π₀=ℤ/p≠ℤ^d for every d; finite free condition fails at first positive stage. | Keep. |
| 5.2.1 (506) | f=j and f=0 | At r=1 sublevels {0} versus ℕ; at r=2 sizes 2 versus ∞. | Keep. |
| 5.2.2 (508) | All I_j empty | Each inner product=0; outer product=0; V_f=0. | Keep. |
| 5.2.3 (510) | f_k=max(j−k,0) | Common target h(j)≤f_j(j)=0 forces h=0, whose r=1 sublevel is ℕ. | Keep; natural subtraction correctly handled. |
| 5.2.4 (512) | Identity and zero block maps | Supports {j} and ∅; quotient maps id and 0 respectively. | Keep. |
| 5.2.5 (514) | Duplication twice | Outputs 4j,4j+1,4j+2,4j+3: four distinct indices. | Keep. |
| 5.2.6 (516) | Profile j+1→j | t^(j+1)x∈t^jA; the element t^j is not generally in t^(j+1)A. | Keep direction. |
| 5.3.1 (528) | Singleton blocks, t-adic datum | t^j has exactly r surviving blocks mod t^r; ones has infinitely many already mod t. | Keep. |
| 5.3.2 (530) | Only blocks 0,1 nonempty | Proper f with f(0)=f(1)=0 gives A²; finite sum already complete, so RHS=A². | Keep. |
| 5.3.3 (532) | I₀=ℕ, all other blocks empty | f(0)=0 allows every coordinate of∏ℕA; both sides ∏ℕA, no within-block decay. | Keep. |
| 5.4.1 (544) | k<0 | Split ideals and limit have π_k=0; profile colimit also 0. | Keep. |
| 5.4.2 (546) | k=1, A=𝕊[[t]] | π₁A=(ℤ/2)[[t]]; mod t² the family is η,ηt,0,… . | Keep. |
| 5.4.3 (548) | Duplication of t^j | Mod t² output coefficients at 0,1,2,3 are 1,1,t,t; others 0. | Keep. |
| 5.4.4 (550) | Fold(t^j), mod t² | Sum=1+t; (1−t)(1+t)=1−t²=1; full inverse Σt^j exists since constant term 1 is a unit. | Keep; denominator justified. |
| 6.1.1 (572) | M=0 | Every term 0; realization 0. | Keep. |
| 6.1.2 (574) | M=Σ^bG_A | Constant simplicial realization=M; all terms have the same bound b. | Keep. |
| 6.1.3 (576) | A=0; repaired A=δ𝕊 | Original family all 0, thus every bound holds. Repaired π₋ₙ=∏ℕℤ≠0, defeating any fixed bound. | R01. |
| 6.2.1 (588) | a_r=1 | cofib(id_M)=0 at every r; limit 0. | Keep. |
| 6.2.2 (590) | Scalar 0 | Derived cofiber=M⊕ΣM; for M=Hℤ gives π₀=π₁=ℤ, not just π₀. | Keep. |
| 6.2.3 (592) | Quotient and ideal 2-adic towers | Quotients:lim ℤ₂,lim¹0. Ideals:lim0,lim¹ℤ₂/ℤ. Hence quotient completion π₋₁=0, ideal derived limit π₋₁=ℤ₂/ℤ. | Keep. |
| 6.3.1 (604) | Constant simplicial M | Both sides ΛM; comparison id; on M=Hℤ,2-adic completion sends 1→1 in ℤ₂. | Keep. |
| 6.3.2 (606) | Normalized degree 1, b=0, M=Hℤ | Layer ΣHℤ has π₁=ℤ,π₀=0; after 2-completion π₁=ℤ₂,π₀=0. | Keep. |
| 6.3.3 (608) | A=0; repaired A=δ𝕊 | Original layers/tails 0, arbitrarily connective. Repaired suspended layers=δ𝕊 and every split tail retains π₀≠0. | R01. |
| 6.4.1 (630) | p=2 | Completed-unit π₀(*)=ℤ₂; ambient π₀=ℤ. | Keep. |
| 6.4.2 (632) | p=3 | Completed-unit π₀(*)=ℤ₃; unit 1↦1. | Keep. |
| 6.4.3 (634) | Hℤ_p,H𝔽_p relative tensors | First π₀=ℤ_p, others 0; second π₀=π₁=𝔽_p. Same for p=2,3. | Keep. |
| 6.4.4 (636) | r=0,1,2, p=2,3 | r=0 quotient 0. Positive stages H𝔽_p⊕ΣH𝔽_p, transition diag(1,0), limit H𝔽_p. | R02. |
| 7.1.1 (668) | D=all modules | Reflector id; unit A→A=id; completed. | Keep. |
| 7.1.2 (670) | D={0}, A=Hℤ or 0 | Reflector 0; ℤ→0 not iso; 0→0 iso. | Keep both directions. |
| 7.1.3 (672) | Perfect Hℤ-modules | ⊕ℕHℤ has π₀=ℤ^(ℕ), infinite rank; cannot be a finite perfect Hℤ-cell object. | Keep closure failure. |
| 7.2.1 (694) | Zero input | Both completed tensor and scalar extension give L(0)=0. | Keep. |
| 7.2.2 (696) | D=0, A=Hℤ | Unit L_DA=0 has π₀=0, not ℤ. | Keep. |
| 7.2.3 (698) | H𝔽₂←Hℤ→H𝔽₂ | Two-term mod 2 resolution has zero differential; π₀=π₁=𝔽₂, others 0. | Keep. |
| 7.2.4 (700) | Identity algebra square, zero target structure | Both paths 0; intermediate kernels 0; target kernel all modules. | Keep stronger target, no kernel-generation requirement. |
| 7.3.1 (724) | F=∅,{0},{1} | No test; id test; solid difference test already invertible: all three yield all solid modules. | Keep. |
| 7.3.2 (726) | e₁+fe₀ | σ*(e₁+fe₀)=e₀; subtracting fe₀ leaves e₁. | Keep every discrete scalar. |
| 7.3.3 (728) | b_n=p^n,f=p⁻¹, p=2,3 | b_n→0 p-adically; b_n−p⁻¹b_(n+1)=0; b₀=1≠0. | Keep nonlocal coefficient. |
| 7.3.4 (730) | 𝔽₂[ε]/ε² | (1−εσ*)(1+εσ*)=1; inverse exists even though ε≠0. | Keep nilpotent/nonreduced control. |
| 7.3.5 (732) | φ=(1,0) | φe₁₂e₂₁=(1,0); φe₂₂=0. | Keep right action. |
| 7.4.1 (744) | Integer measures, finite sizes 0,1,2 | Free complete modules 0,ℤ,ℤ². | Keep. |
| 7.4.2 (746) | E=ℚ_p and finite extensions | v_p(p⁻ⁿ)=−n; no single p^N makes all entries integral. Uniform-denominator object excludes the vector; ∏E includes it. | Keep supplied finite-extension scope. |
| 7.4.3 (748) | Animated polynomial 𝔽₂ input | θ retains its discrete π₀=𝔽₂[t]; free commutative derived weight two π₁=H₁(Σ₂; 𝔽₂)=𝔽₂. | Keep inequivalence. |
| Layer1 Examples (218) | Empty and disjoint pair | 0; X(*)×X(*); marked shift sends finite e₁ coefficient to e₀. | Keep. |
| Layer2 Examples (320) | Sphere and integer-linear generator | π₁𝕊=ℤ/2; Hℤ⊗G has π₀=∏ℕℤ and π₁=0. | Keep. |
| Layer3 Examples (404) | Ranks 2,3; polynomial algebra | Rank 6; two absolute variables map to one balanced variable. | Keep. |
| Layer4 Examples (446) | Increasing finite-support vectors | Union ⊕ℕℤ lacks the all-one vector; the product contains it. | Keep. |
| Layer5 Examples (554) | r=0,1,2; t^r | Quotient ranks 0,1,2; profile decay is between blocks, not within I_j. | Keep. |
| Layer6 Examples (640) | Scalars 1 and 0 | Cofibers 0 and M⊕ΣM; completed unit π₀=ℤ_p. | Keep. |
| Layer7 Examples (752) | Trivial structure; Q_p,p⁻¹ | Reflector id; nonzero summability kernel vector(p^n),b₀=1. | Keep. |
| Consumer example (760) | Habiro positive indices 1,2 | Degrees of (1−q) and (1−q)(1−q²) are 1,3; constant section still fails A-linearity at q−1. | Keep consumer calculation; no arithmetic theorem imported. |

The families of signs, identities and boundaries are consistent across the package and suppliers. Nonabelian group multiplication is not used on abelian-sheaf carriers: S₃ and Q₈ are excluded by the abelian-object type. Noncommutative E₁ coefficients are admitted where stated, and the matrix-unit witness tests their order. Fields versus DVRs, ramification and inseparability impose no hidden restrictions on the general spectral coefficient definitions; the only topological field examples here use the supplied finite extensions of ℚ_p. No division by a scalar a_r occurs, and the only displayed inverses in examples have their nonvanishing/unit justification: p in ℚ_p and 1−t in ℤ[[t]].

### Headline and Lean acceptance audit

The following is the complete headline inventory, matched to the module documentation in `packages/SolidAnalyticRings/Suggested.lean`. The missing objects are substantial constructions assigned to this roadmap or its suppliers. Ordinary sheaves, ordinary derived categories and abstract category classes at the pins do not provide their enhanced spectral operations. Replacing them with free predicates or arbitrary tensor operations would not state the same mathematics.

| Headline from README | Docstring lines | Missing carrier or operation at the pins |
| --- | --- | --- |
| §1.2: fully faithful monoidal discrete spectral embedding and evaluation adjunction | 10–12 | Concrete stable spectra and enhanced light spectral hypersheaves. |
| §1.5: light derived solidification and product tensor | 13–16 | Enhanced derived light null-test solid category, closed derived tensor and coherent inclusion. |
| §2.1: homotopy detection of solidity and complete t-structure | 17–19 | Light spectral hypersheaves, spectral null object and homotopy sheaves. |
| §2.2: connective monoidal reflection and free spectral measures | 20–22 | Enhanced solid spectral category, reflector and spectral internal Hom. |
| §2.3: Hℤ-linear comparison and bounded-below detection | 23–25 | Spectral Hℤ-modules and enhanced derived light solid category. |
| §2.4: sphere-product compact generator and its module forms | 26–28 | Sphere, solid spectral tensor and enhanced module categories. |
| §3.1: countable product tensor comparison | 29–30 | Sphere and solid spectral tensor. |
| §3.3: independent split-tower tensor and diagonal comparisons | 31–32 | Coherent spectral towers and solid spectral tensor. |
| §3.4: balancing and dualizable scalar change through limits | 33–36 | Enhanced spectral algebras/modules and relative solid tensor. |
| §4.1: countable-limit interchange for light sheaves and modules | 37–39 | Enhanced spectral sheaves/modules and coherent diagram categories. |
| §§5.3–5.4: completed block-sum null families in every degree, with naturality | 40–44 | Connective solid spectral algebras, marked cofiber towers and coherent completion. |
| §6.1: uniformly bounded-below free resolutions | 45–46 | Solid spectral modules, their compact generator and realizations. |
| §6.2: sharp connectivity of scalar quotient completion | 47–49 | Spectral modules, homotopy and coherent cofiber-tower limits. |
| §6.3: bounded-below realization/completion comparison and tail estimate | 50–52 | Enhanced spectral modules and simplicial realization. |
| §6.4: prime-completed embedding, bounded tensor closure and unit | 53–55 | Ordinary and light solid spectra and coherent prime completion. |
| §7.2: complete tensor, scalar adjunction and pushout comparison | 56–58 | Reflective enhanced analytic module categories and relative tensor. |
| §7.3: connective spectral summability localization | 59–61 | Spectral generator, analytic structures and enhanced localization. |
| §7.4: integer-measure comparison on common presentations | 62–64 | Enhanced analytic-measure modules, Hℤ-linear realization and coherent site/cutoff comparisons. |

All 18 entries are named with their missing carriers. No full headline becomes statable by adding only a few simple definitions to native pinned carriers. Proper profiles and finite integer calculations are independently statable predicates/examples, but are not substitutes for the null-family theorem. The empty acceptance namespace is therefore appropriate.

The requested `lake env lean` elaboration of the actual acceptance file, run from the pinned content checkout with the supplied absolute file argument, finished with exit 0 and no output or warnings. It has exactly one import, `import Mathlib`, one module docstring and the prescribed namespace. There are zero declarations, zero admitted examples, zero sorry'd data and zero options. Consequently the declaration-by-declaration `#check @name` inventory and one-tactic padding probe are both empty: no binders can disappear and no theorem can be padding. No scratch stand-in was elaborated. No Tau Ceti module build was required. The stale generated-signature diagnostic supplied with the job does not reproduce on this file.

The README has an API and at least three Checks for each introduced definition; the individual Check table records their content, including the three corrections above. Every numbered target has a locator and a `*Needs:*` line. All seven layers end in Examples and Dependencies. The title, summary, ownership, conventions, supplier, reading-order, consumer and reference sections are present. `metadata.toml` identifies the mathematical topic. No own backticked declaration is falsely promised in the README: the remaining declaration names resolve to the pinned library or named supplier targets.

## Not verifiable

- No cited mathematical text was unreadable or required a new reference request. All nine source entries were examined in their recorded versions. The contextual AS transcript is identified as such; it is not used as the sole justification for a theorem.
- Fifteen package README paths in the supplied board index returned 404 at their specified heads: ArithmeticLocallySymmetricSpacesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII, CrystallineCohomologyPartII, EndoscopicTransferAndUnitaryTraceComparisonPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PELModuliPartII, PadicHodgeTheoryPartII, PadicLocalLanglandsForGL2QpPartII, RealSurfacePeriodIndex, SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII, VStackSheavesAndLisseCategoriesPartII and VectorBundlesAndIsocrystalsPartII. Their design READMEs at those same heads were readable and were searched. Ownership against those designs was checked; ownership against nonexistent package paths cannot be certified.

## Source issues

These are source-text slips, separate from the three package findings. The roadmap uses the corrected shifts and ambient categories, so none requires changing its principal targets.

- **Misprint** in RC at proof of Theorem 2.3.3(3), printed p.12, RC line 550: the source says the lifting map has tensor factor N although the defined reduced sequence object is P; it should be the tensor factor P used in the diagram; affects the proof.
- **Misprint** in RC at proof of Theorem 2.3.3(3), printed p.12, RC lines 555–556: the source says the sequence compactification is a product of ℕ with the singleton at infinity; it should be the union ℕ∪{∞}, with the convergent-sequence topology; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5(1), printed p.18, RC line 812: the source says the second coordinate of the difference is a₁−a₁; it should be a₁−a₂; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5(3),(8), printed p.18, RC lines 824–825: the source says the localization kernels are tensor ideals inside the solid target categories; it should be inside the ambient condensed abelian and derived categories, respectively; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5(4), printed p.19, RC line 866: the source says the sequence identity holds for indices in ℤ; it should be for indices in ℕ, the domain of the sequence; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5(7), printed p.19, RC lines 874–875: the source says the inner Hom and solidity condition concern B, which is unbound there; it should be C, the declared solid target; affects the proof.
- **Misprint** in RC at proof of Proposition 4.1.6, printed p.30, RC line 1514: the source says the object killed by completion lies in the complete category D(A); it should be in the ambient category D(A▷); affects the proof.
- **Misprint** in HTT at proof of Proposition 5.3.3.3, printed p.394, HTT line 18710: the source says the cofinal nerve maps into the category of spaces; it should be into the indexing category I, as the following restriction functor requires; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2e18779ebc7a9115da1964177c31038c4671a02f", "job": "REV-PKG-SolidAnalyticRings", "model": "gpt-6-astra", "worker": "chris-3"} -->
