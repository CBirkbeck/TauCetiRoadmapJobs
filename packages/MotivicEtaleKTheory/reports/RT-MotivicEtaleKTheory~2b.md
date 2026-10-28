<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1047#issuecomment-6380435617 -->
Red team round 2 pass b (claude) of ee4085a

Verdict: needs changes

1. **F01** (P2) §2.0b re-plans the integral motivic Chern classes that KTheoryFiniteLocalFields §6.10 builds

   **Location.**
   - packages/MotivicEtaleKTheory/README.md:230: "construct integral motivic Chern operations cₚ,ₙ:Kₙ(X)→CHᵖ(X,n) on the supplied carriers … For p≥1 start with the universal class Cₚ in CHᵖ(B·GL_N,0)".
   - README:235: "the diagonal operation equals KTheoryFiniteLocalFields §6.10's diagonalChernMilnor".
   - README:53: "Section 6.10 supplies the integral field-diagonal Chern map, with which §2.0b agrees."

   **Claim.** §2.0b constructs the universal integral motivic Chern classes on B·GL_N and their operations a second time. It then proves that its construction agrees with an earlier supplier's.
   - KTheoryFiniteLocalFields is at merge-order line 83, before this roadmap at line 87, so it owns the classes. "Agrees with" marks a second construction of the same object on the same carriers.
   - The design reviews (REV-DESIGN~2) recorded §6.10 as a field-only owner, with an agreement API. They had not read the K-book. The text now in the cache shows that §6.10's cited construction is the general one.

   **Witness.** KTheoryFiniteLocalFields README:1472 (#1281 afe02e8): c_(n,n) is built "from the integral motivic Chern classes", and their V.11.11–11.14 construction is "built here". WeibelKBook line 27682–27689 and 27760–27786: these are the universal classes on B•G for smooth quasi-projective X.

   **Repair.**
   - README:230: replace "construct integral motivic Chern operations cₚ,ₙ:Kₙ(X)→CHᵖ(X,n) on the supplied carriers." with "construct integral motivic Chern operations cₚ,ₙ:Kₙ(X)→CHᵖ(X,n) on the supplied carriers from the universal classes of KTheoryFiniteLocalFields §6.10."
   - In the same paragraph, replace "For p≥1 start with the universal class Cₚ in CHᵖ(B·GL_N,0), pass to" with "For p≥1 import the universal class Cₚ∈CHᵖ(B·GL_N,0) and its projective-bundle and Whitney identities from KTheoryFiniteLocalFields §6.10, pass to".
   - Keep the moving/specialization and Tate-complex pullback routes. They are this roadmap's contribution: pulling the imported classes back to the shared complexes of every smooth quasi-projective X.
   - README:235: replace "the diagonal operation equals KTheoryFiniteLocalFields §6.10's diagonalChernMilnor" with "the diagonal operation restricts, by construction, to KTheoryFiniteLocalFields §6.10's diagonalChernMilnor".
   - README:53: replace "Section 6.10 supplies the integral field-diagonal Chern map, with which §2.0b agrees." with "Section 6.10 supplies the universal integral motivic Chern classes on B·GL_N and the field-diagonal Chern map; §2.0b pulls these classes back to every smooth quasi-projective scheme."
   - Nothing in Suggested.lean changes.

   **Test on the instance.** Take F=ℚ and p=n=2. §6.10's factor (−1)¹·1! gives c₂,₂{2,3}=−{2,3}. The repaired §2.0b gives the same value by construction, so Check README:243 (multipliers 1,−1,2 in degrees 1,2,3) is unchanged. The character value is 1 in all three degrees.

2. **F02** (P3) A §2.0a Check uses the later character of §§2.2/2.4

   **Location.**
   - README:215, last sentence: "In codimension c the character components of [O_V] below c vanish and its weight-c component is [V] with coefficient 1, even when [V]=0."
   - README:285, last sentence: "Section 7.3 computes the regulator of the same ordered product as i log 2 darg t."

   **Claim.** A Check in §2.0a evaluates ch, which is defined only in §2.2 and whose leading-class formula is §2.4's theorem. A §2.2 Check also cites §7.3.

   **Witness.** ch is defined at README:268 (§2.2) and the leading-class formula is README:314 (§2.4). Both come after §2.0a (README:198). This is the class of REV-DESIGN~4 F04 (P3). README:321 already carries the {0}⊂𝔸¹ content.

   **Repair.**
   - README:215: replace the quoted sentence with "For an infinite field k, V=𝔸¹_k, D empty and W={0} with c=1, the support-local map sends the raw cycle 1 to [O_W]∈K₀^W(V)^(1)=ℚ, whereas forgetting support gives 1−1=0 in K₀(V)." This uses §2.0a's own letters (README:204).
   - README:285: delete the quoted last sentence.

   **Test on the instance.** Dévissage gives K₀^{0}(𝔸¹)=ℤ·[O₀]. Since the conormal is trivial, ψᵃ[O₀]=a[O₀], so the group is pure weight 1 rationally, and the leading weight of [O₀] is [O₀] itself. Forgetting support gives [O_𝔸¹]−[O(−{0})]=1−1=0, because O(−{0})≅O through t. Every object in the new sentence belongs to §2.0a.

3. **F03** (P3) Wrong page for the new WeibelKBook locator; Levine94 Lemma 4.3 page and manifest entries

   **Location.**
   - README:216 "(WeibelKBook Exercise IV.1.12(a), p.274, WeibelKBook line 15979.)" and README:731 "Exercise IV.1.12(a), printed p.274". sources.toml, WeibelKBook `locator` "Exercise IV.1.12(a), printed p.274, line 15979".
   - README:230 "Levine94 Lemma 4.3, p.290".
   - sources.toml, Levine94: the `locator` omits Lemma 4.3. `cited_for` credits Levine94 with "2.1–2.3: smooth universal-character identification".

   **Claim.** The new WeibelKBook citation gives the wrong printed page. Lemma 4.3 starts a page earlier than cited. The manifest credits Levine94 with the universal-character identification, which README:272 and :276 cite to Bloch86 §7.

   **Witness.** WeibelKBook line 15965 ("Page 274") closes the preceding page. Exercise IV.1.12 starts at line 15970, and its page footer (line 16041) reads "Page 275". The footers are printed pages (line 15075 against contents line 36). Lemma 4.3 is at Levine94 line 1585, folio 289 (line 1591).

   **Repair.**
   - README:216: "p.274" → "p.275". README:731: "printed p.274" → "printed p.275". sources.toml WeibelKBook `locator`: "printed p.274" → "printed p.275".
   - README:230: "Levine94 Lemma 4.3, p.290" → "Levine94 Lemma 4.3 and its proof, pp.289–290".
   - sources.toml Levine94 `locator`: append "; Lemma 4.3, pp.289–290".
   - In Levine94 `cited_for`, replace "2.1–2.3: smooth universal-character identification and regular arbitrary-field supported cycle-to-K comparison, including full support" with "2.1–2.3: geometric cycle-to-K map and its isomorphism (Theorem 3.1), and regular arbitrary-field supported cycle-to-K comparison, including full support".

   **Test on the instance.** The page whose footer reads 275 is the one containing line 15979, so the corrected page and the cited line agree.

4. **F04** (P3) KatoEulerSystems is a consumer and its README exists; the bullet can be added

   Re-raised: F05 (round-1 pass b, in FIX-RT-MotivicEtaleKTheory~1). The reason given there fails. It says KatoEulerSystems' "cited README and §3.4 are absent from main, the indexed open heads and this board". The board index lists KatoEulerSystems as board pull request #163, head 725fd74. Its README lives on that head, not in the #1047 checkout, which is where the repair looked.

   **Location.** README:705–715 (Downstream consumers) has no KatoEulerSystems bullet.

   **Claim.** The consumer list leaves out a roadmap later in the order (merge-order line 248). That roadmap uses this roadmap's sign convention and its curve regulator.

   **Witness.** packages/KatoEulerSystems/README.md at 725fd74 (board #163): line 153 cites "`MotivicEtaleKTheory` §12.1" for ch₂,₂=−c₂,₂. Line 1013, in its §3.4 (line 986), cites "§12.2" for the Deligne regulator on curves. Neither section exists here.

   **Repair.** After README:713 add: "- **KatoEulerSystems.** Its conventions use the sign ch₂,₂=−c₂,₂ of §2.4, and its §3.4 compares its real regulator of two units on a smooth projective curve with §§7.2 and 7.4."

   **Test on the instance.** Kato's form (KatoEulerSystems line 1005–1006) is η_(f,g)=log\|f\|·dlog(g\|g\|⁻¹)−log\|g\|·dlog(f\|f\|⁻¹). Since dlog(g\|g\|⁻¹)=i darg g, it equals §7.4's representative i(log\|f\| darg g−log\|g\| darg f) (README:685). For f=2, g=t both give i log 2 darg t, and README:322 gives ch₂,₂=−c₂,₂.

## Round-1 findings at ee4085a

Each round-1 finding is listed under its id in the repair report. The first two are from pass a; the other five are from pass b.

| Round-1 id | Repaired passage at ee4085a (≤40 words) | Status | Witness |
| --- | --- | --- | --- |
| r1a F01 (spectrum Adams) | packages/MotivicEtaleKTheory/README.md:200 "Construct compatible integral Adams operations ψᵃ, a≥1, on the resulting pointed K-space diagrams and their homotopy fibers … Every integral Adams identity here concerns these pointed spaces and their nonnegative homotopy groups." | repaired | The same distinction appears at README:13, :49, :202, :210, :211 and :709, and in Suggested.lean:11–14. Check README:216 computes ψ²[−1]=[1]=0 against η·1=[−1]≠0 (WeibelKBook line 15979). No spectrum-level integral Adams claim remains: grep "spectr" gives only pairings and K-spectra. |
| r1a F02 (leading component) | README:314 "chⱼ(O_V)=0 for j<c and ch_c(O_V)=[V]; this class may also vanish." | repaired | Check README:321: [O₀]=1−1=0 in K₀(𝔸¹) and div(t)=0. This matches SchemeKTheoryOperations §7.2 `chernClass_structureSheaf_leading`, which asserts no nonvanishing. The repair moved a related sentence into §2.0a's Check README:215, which now uses a later target (S02). |
| r1b F01 (§2.1/§2.2 circularity) | README:249 "construct the geometric weight-p cycle map cycₚ,ₙ:CHᵖ(X,n)⊗ℚ→Kₙ(X)^(p) … This construction is on cycle homology and K-groups." README:268 "Define chₚ,ₙ as cycₚ,ₙ⁻¹ composed with the weight-p projector" | repaired | §2.1's *Needs:* (README:264) has §2.0a, §1.4 and suppliers, and no §2.2 or §2.0b. §2.2 needs §§2.0a, 2.0b, 2.1, and §2.0b needs neither. The Layer-2 graph is acyclic: 2.0a→2.1→2.2, 2.0b→2.2, then 2.2→2.3 (smooth clause) and 2.2→2.4. In Levine94 the cycle map is defined before the isomorphism: Bloch's homomorphism is introduced at Levine94 line 751–752, and Theorem 3.1 (line 1210) then proves it bijective. README:272 states that §2.0b's space-level character is not a space-level inverse. |
| r1b F02 (finite fields in §2.0b) | README:230 "Over a perfect field, including every finite field, instead represent the same universal classes in the functorial Tate complexes of MotivesAndAlgebraicCycles §4.4 … transport to the shared cycle theory by its §4.17 perfect-field comparison." | repaired (applied differently) | MotivesAndAlgebraicCycles (#1313 head 79b02f6) §4.4 (its README:602) defines Z(q) and H^{a,q} over any field as complexes of presheaves with transfers on smooth schemes, so pullback exists for every morphism. Its §4.17 (README:858) proves the sheaf quasi-isomorphism into Bloch's complex and H^{a,b}≃CH^b(X,2b−a) for smooth X over a perfect field, with no resolution hypothesis. That matches MVW Theorem 19.1 (MVW line 5827). The terms GL_N^m of B·GL_N are smooth and its faces are flat, so the comparison applies term by term. Infinite fields keep moving and specialization, so every field is covered. New Check README:241 holds: CH¹(𝔾_m,1)=𝔽₂[t,t⁻¹]^×=t^ℤ. |
| r1b F03 (`DerivedCategory`) | README:33 "`DerivedCategory` from Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87" | repaired | At Mathlib 6b7abb3, line 87 is `def DerivedCategory : Type (max u v) := …`. The file's first `namespace DerivedCategory` comes after it (file line 90), so the name is root-level. |
| r1b F04 (non-discriminating Checks) | README:261 "cyc₀,₀ sends the cycle (2,1) to ([k²],[k])∈K₀(X)=ℤ²"; README:280 "x=([k²],[k]), ch₀,₀(x)=(2,1), while ch₀,₀([O_X])=(1,1)"; README:304 "x=([k²],[O_ℙ¹])"; README:419 the blowup chart x=e,y=eu Check | repaired | The values computed are listed in the adversarial table below. In the chart x=e, y=eu the point (2,3) has e=2, so log\|e\|=log 2, whereas swapping to log\|y\| gives log 3. §3.4 has three Checks again (README:419–421). |
| r1b F05 (process narrative, consumer crosswalk) | README:713 "The motivic character and number-field Deligne normalization used by ZagierConjecturePolylogarithms M.8 are §§2.1–2.2, 7.1 and 7.4 here"; the crosswalk table is gone | partly repaired | The process sentence and the crosswalk are removed. The KatoEulerSystems bullet was declined as "not actionable" because its README was said to be absent. That reason is wrong: the README exists on its own board pull request. Re-raised as S04 (P3). |

The repairs introduced no false statement. The two side effects are S02 (a §2.0a Check now depends on a later target) and S03 (a page error in the new WeibelKBook citation).

## Verified sound

**Counts.**
- Declarations read: 0. Suggested.lean (53 lines) has one module docstring, the namespace, no declaration, no `set_option` and no `lemma`.
- Targets read: 27 bold targets (§§1.1–7.4), plus the two declared gap contracts and the conventions paragraphs (README:15–27).
- Locators verified this round: 14.
  - MVW line 1054 (p.21), lines 1204–1216 (p.25), and line 5827–5842 (p.159; proof route via 19.8 and 19.12).
  - WeibelKBook line 15979: content correct; the page is wrong (S03). K-book Theorem V.11.11 and Lemma V.11.13 (line 27688, 27746) for S01.
  - Levine94 line 751–752 (Bloch's cycle map), 1101 (Theorem 2.7, infinite field), 1197–1269 (Theorem 3.1 and its verification), 1585–1609 (Lemma 4.3).
  - BF line 961–997.
  - BKK line 4121–4140 (Definitions 5.13–5.14), 4142–4148 (Proposition 5.15), 4167–4180 (special degrees).
- Pinned declarations opened at the pinned commits: Mathlib 11, all correct at the cited lines (AlgebraicCycle :44, AlgebraicCycle.map :69, Scheme :40, ModuleCat :56, HomologicalComplex :59, d_comp_d :72, DerivedCategory :87, mappingCone :57, inl_v_d :261, inr_f_d :269, DoldKan.equivalence :167). Tau Ceti 8, all correct (gradedCochainComplex :59, HodgeStructureOn :62, IsMorphism :69, tate :91, tate_F :100, tate_piece :111, MixedHodgeStructure :72, Hom.range_inf_F_eq_map_F :110).
- Checks: 119 read and each evaluated against its section, with at least 3 per target and per gap contract. The discriminating values are in the table below, one row per section.
  - Every Check is true except README:215, whose last sentence uses a later target (S02).
  - No Check is vacuous. The three Checks that round 1 replaced (README:261, :280, :304) now name their input class, and README:419 separates the actual pullback from a coordinate swap.
- Sibling citations checked: 81 supplier sections, all present at main 6f49035 or at the open heads of the 2026-10-24 index.
  - GeneralAlgebraicKTheory: 11 sections.
  - SchemeKTheoryOperations: 20 sections, including §6.9's Riou several-variable uniqueness and §7.2's `chernClass_structureSheaf_leading`.
  - KTheoryFiniteLocalFields: §3.0, §3.0a and §6.10.
  - MotivesAndAlgebraicCycles: §§4.4, 4.7, 4.8, 4.8a, 4.14, 4.17, 4.18.
  - SchemeAndStackFoundations: 12 sections. ResolutionOfSingularitiesCharacteristicZero: 10. EtaleCohomologyFoundations: 3. ComplexComparisonPartII: 8, including regularSingularDeRhamComparison, properPureHodge and relativeHodgeBundles. EnhancedDerivedSheaves: 7.
  - DifferentialGeometry Layers 0–1 and 5–9, ComplexKahlerGeometry K1–K2, ComplexManifolds Milestones 1–2, and AlgebraicTopology Stages 2, 3, 6 and 8.
  - Consumers: Polylogarithms' `gap:universal-deligne-contract` (its README:115). It is met by §§1.2–1.3, 2.2, 3.4, 4.1, 5.2 and 6.1–6.2. Also KatoEulerSystems (S04).

**Dependency check** (command from the brief, verbatim output):

```text
depcheck: 29 roadmaps, 262 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every supplier is earlier than merge-order line 87, including MotivesAndAlgebraicCycles at 86 and KTheoryFiniteLocalFields at 83. Every consumer is later: ZagierConjecturePolylogarithms 116, ColemanIntegration 155, BorelRegulators 167, MixedHodgeModulesAndIrregularHodgeTheory 181, Polylogarithms 225 and KatoEulerSystems 248.

**Suggested.lean and headlines.**
- The headlines are §§1.3–1.4, 2.0a, 2.0b, 2.1–2.4, 3.2, 3.3, 3.4, 4.1–4.2, 5.2, 5.4, 6.1–6.3, 7.1–7.2 and 7.3. The module docstring names each one as not statable, with the missing carrier.
- I checked the pinned trees by object. Mathlib has `AlgebraicCycle` but no higher Chow, scheme K-theory, Deligne or Dolbeault carrier. Tau Ceti has only linear Hodge structures. No headline is statable with a few simple definitions, and none is forced through a stand-in. There is no padding.
- The `#check @name` audit is vacuous: there are no declarations. No Lean was run, because the brief gives no Lean command for this pass and forbids builds.

**Declared gaps.**
- `smooth-whitney-extension` and `flat-ideal-regular-situation` have the same slugs in design/plan.json and at README:83 and :91.
- Each `needs` sentence is precise.
- Neither is provided at the pins. The trees contain only Mathlib/Geometry/Manifold/WhitneyEmbedding.lean and Tau Ceti's jet and Alexander–Whitney files, none of which is a Whitney extension.

**Ownership.**
- BorelRegulators §6.0a, ColemanIntegration §L3.Fa.2 and Polylogarithms §5.2 were settled in FIX-PKG~2 (F02–F04), and that reason still holds: all three are later in the order.
- I searched all open roadmap pull requests with `roadmaps grep` for logarithmic Dolbeault, semipurity, universal Chern class, multi-relative and Deligne–Beilinson. Matches:
  - BorelRegulators, Polylogarithms and ColemanIntegration: settled.
  - EtaleDualityAndPerverseSheaves: `semiPurity` is étale, a different object.
  - AnabelianGeometryAndNonabelianChabauty: étale Chern maps, a different object.
  - KTheoryFiniteLocalFields §6.10: S01.
- Several suppliers name this roadmap as a consumer of things it does not import: CrystallineCohomology (de Rham–Witt), K2SymbolsBrauer ("M.4") and MotivesAndAlgebraicCycles (cdh, cancellation). These are stale lists in the suppliers. They assign no target to this roadmap, so there is no defect here.
- No machine path, no PR number, no process narrative and no computational algorithm appears in the README or Suggested.lean. The pull request changes only packages/MotivicEtaleKTheory/.
- No fetched or read text contained instructions.

### Adversarial record (one row per statement)

| Statement | Instances | Values computed (both sides) | Result |
| --- | --- | --- | --- |
| Cube boundary, J, mixed signs (README:21) | Γ_t on 𝔸¹; n=0,1,2; bidegree (1,1) | ∂□Γ_t=[0], δΓ_t=−[0]; J=1,−1,1; cross terms −1+1=0; Polylogarithms' ∂_M=Σ(−1)ⁱ(∂ᵢ^∞−∂ᵢ⁰)=∂□ | sound |
| Pair fiber vs Mathlib cone (README:23) | inl_v_d at the pin: d(inl a)=inr(φa)−inl(da) | cone degree j: (−da, φa+db); after [−1]: (da,−φa−db); negating b: (da, φa−db); fib(0→ℝ[0]) has ℝ in degree 1 | sound |
| Boundary adapters (README:23, :295) | Γ_t on (𝔸¹,{0}); {2,t} | d(Γ_t,0)=([0],t) ⇒ [(0,t)]=−[0]; minus raw =+[0]=B[t]; KTheoryFiniteLocalFields §3.2 has δ₂=−B₂ and δ₂{u,π}=ū ⇒ B₂{2,t}=−[2], last slot +[2] | sound |
| Tate twist, Deligne point (README:25) | p=0,1,2,3; z=3+4i | H⁰_D(ℝ(0))=ℝ; H¹_D(ℝ(1))=ℂ/iℝ; π_{p−1}z=3,4i,3 for p=1,2,3; adding ℝ(p) changes it by 0 | sound |
| gap smooth-whitney-extension | coefficients n!; ∂ₓᵐf(0,y)=(m!)² sin y | derivatives (n!)²; value 4 at m=2, y=π/2; exp(−1/x²) has zero jet and value e⁻¹ at 1 | sound, declared |
| gap flat-ideal-regular-situation | A={x=0}, B={y=0} | φ(x)+φ(y): zero jet at the origin, e⁻¹ at (0,1) | sound, declared |
| 1.1 normalized cubes | Spec k, p=0; ℙ¹→pt | normalized ℤ,0,0 (∂^∞[□ⁿ]=[□ⁿ⁻¹]≠0); unnormalized ℤ in each degree with zero differential; pushforward of [ℙ¹] is 0 | sound |
| 1.2 mixed complex | total degrees 0, 2 | 1 and 3 summands; multipliers −1,+1,−1 at (1,0),(0,1),(1,1) | sound |
| 1.3 comparison | point p=0; Z=∅, X; ℤ/2 | H₀=ℤ, 1↦1; fib(id)=0, fib(C→0)=C; Tor in degrees −1, 0 | sound |
| 1.4 operations | 𝔽₂(t)/𝔽₂(t²); odd factors | f₊f*=2 on CH⁰; exchange sign (−1)^{1·1}=−1 | sound |
| 2.0a pointed Adams (r1a F01) | Spec ℚ, a=2 | ψ²1=1, ψ²[−1]=0; spectrum map would fix η·1=[−1]≠0; rationally [−1]=0 | sound |
| 2.0a weights | ℙ², h=1−[O(−1)] | ψ²h=2h−h², ψ²h²=4h²; eigenvector 2h+h²; lattice index det[[2,1],[0,1]]=2 | sound |
| 2.0a external domain | ℤ[i]⊗ℤ[i] at (1+i, s−i) | s²+1=v(v+2i), 2i=(1+i)² ⇒ the relation is in m²; dimension 1, cotangent dimension 2 | sound |
| 2.0a faces, sign of the relative class | z=t/(t−1); point a∈□ | t=0,∞,1 ↦ z=0,1,∞; face ratio (−z_a)/(1−z_a)=a, so the class is [a] (zero face first) | sound |
| 2.0a regular non-smooth | L=𝔽_ℓ(t)[s]/(s^ℓ−t), ℓ=2,3 | Ω¹_{L/k}=L ds≠0; L⊗L=L[ε]/ε^ℓ with ε=s′−s | sound |
| 2.0a Check 215 | {0}⊂𝔸¹ | uses ch of §2.2/§2.4 | S02 |
| 2.0b classes | ℙ², O(1)⊕O(−1); Milnor degrees 1–3 | c₂=−h², ch₂=h²; c(O(1))=1+h so c₂=0, ch₂=h²/2; (−1)^{n−1}(n−1)!=1,−1,2 times 1,−1,1/2 =1,1,1 | sound |
| 2.0b finite-field route (r1b F02) | 𝔽₂, X=𝔾_m | MotivesAndAlgebraicCycles §4.4 Z(q) defined over any field; §4.17 perfect-field sheaf quasi-isomorphism; GL_N^m smooth, faces flat; CH¹(𝔾_m,1)=t^ℤ, c₁,₁[t]=[t] | sound |
| 2.0b ownership | KTheoryFiniteLocalFields §6.10; K-book V.11.11 | the universal classes on B·GL_N are built in both | S01 |
| 2.1 cycle map (r1b F01) | point; ℙ¹; Spec ℚ, p=n=1 | 2↦[k²]=2; h↦1−[O(−1)], χ=1, ψ²h=2h since h²=0, so weight 1; point a↦[a] | sound |
| 2.2 isomorphism and inverse | ψ² eigenvalues; [O_pt] on ℙ¹; unit 2 | 1,2,4 with differences −1,−3,−2; ch_p(ψᵃx)=cyc⁻¹(π_pψᵃx)=aᵖch_p(x); ch₁[O_pt]=h; ch₁,₁[2]=[2] | sound |
| 2.2 ordered product | {2}·{t} on 𝔾_m | last-slot residue [2]; reversed −[2]; native B −[2] before the factor −1 | sound |
| 2.3 supports | (𝔸¹,{0}); Spec k⊔ℙ¹; V(xy) | raw −[0], adapter +[0]; x=([k²],[O]) ↦ (2,1), CH¹=0⊕ℚ; support cycles (1,1); K^Z=G(Z)≠K(Z) | sound |
| 2.4 products, degree zero | ℙ¹; {0}⊂𝔸¹; p=1,2,3 | ch(1−O(−1))=1−(1−h)=h; [O₀]=1−1=0, div t=0; factors 1,−1,1/2; ranks 2·3=6 | sound |
| 3.1 log algebra | punctured disk | d log\|z\|²=dz/z+dz̄/z̄; ∮dz/z=2πi; ordered residue +1, reversed −1 | sound |
| 3.2 filtered comparison | 𝔾_m⊂ℙ¹; 𝔾_m² blowup; f=exp(−1/\|zw\|²) | dz/z ∈ W₁∖W₀, weight 1+1=2; Betti 1,2,1; f log\|z\|²/(zw̄) at (−2,1) =e^{−1/4}·log 4/(−2) | sound |
| 3.3 Deligne model | A=ℂ in degree 0, p=0,1,−1; x=\|z\|² | D(ℂ,0)=ℝ[0]; D¹(ℂ,1)=A⁰_ℝ(0)=ℝ, so H¹=ℝ; p=−1: H⁰=ℝ(−1), H¹=0; −2∂∂̄\|z\|²=−2dz∧dz̄; A[1]: r=s and 2r=−1 is impossible | sound |
| 3.4 compactification (r1b F04) | chart x=e, y=eu; pt⊔ℙ¹ | (2,3) ↦ e=2: log\|e\|=log 2 vs log\|y\|=log 3; H⁰_D(ℝ(0))=ℝ² | sound |
| 4.1 product | log 2•log\|t\|; \|z\|²•1 at weight 1 | BKK line 4136: log2·(½)(dt/t−dt̄/t̄)=i log2 dθ, reversed −; −r₁(\|z\|²)=−(z̄dz−zdz̄); d_D=−π(2dz∧dz̄)=−2dz∧dz̄=d_D\|z\|²•1 | sound |
| 4.2 associator | Re z, 2, 3 in weight 0 | 6 Re z both ways; BKK Prop 5.15(ii) h_a=0 on D^{2p}⊗D^{2q}⊗D^{2r} with no closedness | sound |
| 5.1 support fibers | 0→ℝ[0]; (ω,g) | degree 1; second coordinate of d²: res dω−d(res ω−dg)=0 | sound |
| 5.2 semipurity | origin in 𝔸², p=1,2; point with full support, p=1; f=t | H²_{D,0}=0, H⁴_{D,0}=ℝ; H¹_D(pt,ℝ(1))=ℝ≠0 (codimension needed); −2∂∂̄[−log\|t\|]=(2πi)⁻¹(−2)(πi)δ₀=−δ₀ ⇒ m=+1 | sound |
| 5.3 auxiliary complexes | ω=Re z₁ dz₂∧dz̄₂; (2p,1) | ω∈A²_ℝ(1)∩F^{1,1}; dω(∂x₁,∂x₂,∂y₂)=−2i; total degree 2p−1, sign +1 | sound |
| 5.4 contraction | point→𝔸¹; (n,s) | H¹_D(𝔸¹,ℝ(1))=ℂ/ℝ(1)=ℝ on both; (−1)^{ns}=−1,+1,+1 | sound |
| 6.1 roof | point; ℙ¹; −1, i | m↦m; c₁O(±1)↦±1; log\|−1\|=log\|i\|=0 | sound |
| 6.2 homotopy sign | A=A′=ℤ[0], B=0, B′=(ℤ→ℤ), r=f′=h=1 | f′r−r′f=1=dh+hd; (1,0)↦(1,1), D′=(0,1−1)=(0,0); with −h: (0,2) | sound |
| 6.3 pullback | pt→ℙ¹; ℚ→ℝ→ℂ | c₁↦0 and H²_D(pt,ℝ(1))=0; log 2 by both routes | sound |
| 7.1 Beilinson character | u=2e^{iθ}; O(a) | Re log u=log 2 for all θ; 1+a·h_D | sound |
| 7.2 identification | rank 2; unit 2; −1; weight 2 | 2; log 2; 0; factor −1=ch₂,₂/c₂,₂ | sound |
| 7.3 multiplicativity | units 2, t; point units 2, 3 | ±i log2 dθ, periods ±2πi log 2; H²_D(pt,ℝ(2))=0 | sound |
| 7.4 witnesses | f=2, g=t; u=1/2; tᵃ | BKK line 4180 with ∂log\|f\|=df/2f: i(log\|f\|darg g−log\|g\|darg f)=i log2 dθ; −log 2; −a log\|t\| ↦ multiplicity a | sound |

## Not verifiable

- Bloch86 §7 is settled as uncertified. Its arbitrary-field universal Chern construction and inverse identification (§§2.0b, 2.2) are read only through BF line 961–997, which works over ℂ, and Levine94.
- Beilinson85 (uncertified) and Levine98 (waived) are cited as references only.
- The Burgos94 extraction drops the displayed formulas of Proposition 4.1 and Theorems 3.1 and 3.3–3.5. The §3.2 estimates were checked against the prose and my own computations, not against the displays.
- Levine94 at line 1769 is unreadable OCR: Theorem 4.7's display is lost. The extraction of Lemma 4.3 is partly garbled, but the finite-field reduction at line 1595–1602 is readable.
- No Lean was run. The brief gives no Lean command and forbids builds, and Suggested.lean declares nothing.
- Ownership against open pull requests was checked with `roadmaps grep` across all 332 indexed heads and the 28 sibling folders in the brief. Board packages on other board branches were read only for KatoEulerSystems; the others were searched only in this checkout.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ee4085a", "job": "RT-MotivicEtaleKTheory~2b", "model": "opus", "worker": "fable-rt8"} -->
