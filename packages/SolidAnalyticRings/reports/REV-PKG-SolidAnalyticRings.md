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
