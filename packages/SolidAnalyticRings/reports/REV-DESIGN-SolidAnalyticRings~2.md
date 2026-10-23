<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/910#issuecomment-6368625701 -->
Review (claude) of 802490a

Verdict: accepted
Conditional on the announced gaps: `cardinal-interchange`, `light-countable-ab6`

1. **F01** (P3) The discrete functor and module categories are missing from several prerequisite lists

   **Location.** In `packages/SolidAnalyticRings/design/README.md`:
   - line 160 (§1.4): "*Needs:* §1.3; §1.1.";
   - line 250 (§2.2): "*Needs:* §1.4; EnhancedDerivedSheaves E3.2; EnhancedDerivedSheaves E5:abstract.3; §1.5; §2.1.";
   - also lines 84 (§1.1), 276 (§2.3), 316 (Layer 2 Dependencies), 410 (§4.1), 426 (§4.2) and 576 (§6.2), and the matching `prerequisites` in `plan.json`.

   **Claim.** Each *Needs:* line lists what its target's statement and route use.

   **Witness.** δ (§1.2) occurs in §1.4's API, §2.2's unit δ𝕊, §§2.3–3.3 and §§5.1–5.2, yet plan.json puts §1.2 only in §6.4's prerequisite closure. §§2.2, 2.3 and 4.1 use Mod_A; nothing in their closure lists E5:abstract.2.

   **Repair.**
   - Add §1.2 to the *Needs:* of §1.4 and §2.2, and `target:1.2` to their plan prerequisites. Every later user of δ then reaches §1.2 through §1.4 or §2.2. This creates no cycle, since §1.2 needs only §1.1.
   - Add EnhancedDerivedSheaves E5:abstract.2 (module objects and relative tensor) to the *Needs:* and plan prerequisites of §§2.2, 2.3 and 4.1.
   - Add EnhancedDerivedSheaves E5:animation.4, which §2.3 uses, to the Layer 2 Dependencies.
   - Add Mathlib `LightCondensed.epi_π_app_zero_of_epi` to the Mathlib contract and to the *Needs:* of §§4.2 and 6.2, next to RC Theorem 2.3.3(2). It is at `Mathlib/Condensed/Light/Epi.lean:109`. It says that, for a sequential tower of light condensed modules with epimorphic transitions, the projection from the limit is an epimorphism.
   - Add the Mathlib `CategoryTheory.EssentiallySmall` instance (`LightProfinite/Basic.lean:403`) and `LightCondensed.equivSmall` to §1.1's *Needs:*, because §1.1's statement fixes the small skeleton.

   **Tested.** I recomputed the closures from plan.json with the amended lists:
   - the closure of §2.2 becomes {1.1, 1.2, 1.3, 1.4, 1.5, 2.1};
   - §5.1 reaches §1.2 through §3.2 → §2.4 → §2.2.

   Every addition is an earlier target, a pinned declaration or a section on main, so no edge points upward and no cycle appears.

2. **F02** (P3) A §2.2 Check computes nothing

   **Location.** `packages/SolidAnalyticRings/design/README.md` line 268, the third Check of §2.2: "Internal Hom into a solid target is computed in Cond(Sp), rather than by forgetting condensation."

   **Claim.** The bullet is one of the three discriminating Checks of the construction §2.2.

   **Witness.** It names no object and computes no value. So nothing excludes the most plausible wrong model, abstract homomorphisms of the underlying groups. Round 1 repaired the same defect in §1.1 (F07).

   **Repair.** Replace the bullet by: "π₀ of Hom(G, δH𝔽₂) at the point is ⊕_ℕ𝔽₂, a countable group, whereas abstract homomorphisms ∏_ℕℤ→𝔽₂ form a group of cardinality 2^(2^ℵ₀)." In plan.json, give the test the kind `computation`.

   **Tested.**
   - Hom(G,δH𝔽₂)=Hom(N,δH𝔽₂), because δH𝔽₂ is solid (the §2.2 unit law).
   - By the t-exactness of §2.1, its π₀ at the point is Hom(P,𝔽₂)(*): the locally constant 𝔽₂-valued functions on ℕ∪{∞} that vanish at ∞. That group is ⊕_ℕ𝔽₂; RC line 808 gives the integer case.
   - Abstractly, Hom(∏ℤ,𝔽₂) is the 𝔽₂-dual of ∏𝔽₂, a space of dimension 2^ℵ₀.

3. **F03** (P3) §7.4's animated clause names inputs that its supplier does not provide

   **Location.** `packages/SolidAnalyticRings/design/README.md` line 726 (§7.4): "For an integer-linear analytic measure structure (B,μ) supplied by VS2.2, … For animated B use θB and the supplied animated-module comparison". The plan hypothesis for 7.4 reads "animated B is carried by θ".

   **Claim.** §7.4 covers animated measure structures through θ.

   **Witness.** VS2.2's "Analytic measures and complete modules" (head 0ca8db7) defines measures on a condensed commutative ring (CS 7.1/7.4, AG 6.12). "Animated" and AG Definition 12.1 occur nowhere in that roadmap, and no roadmap owns animated analytic rings.

   **Repair.** Choose one of two options.
   - Scope the clause to what VS2.2 supplies. Write: "For the static B supplied by VS2.2, θB is the discrete Hℤ-algebra HB and its modules are D(B) (EnhancedDerivedSheaves E5:animation.4, `animatedModules_discrete`); arbitrary connective Hℤ-algebras are not identified with animated rings." Amend the plan hypothesis to match, and keep Check 3 as the negative control.
   - If animated (B,μ) are really wanted, declare a gap instead: VS2.2 would supply AG Definition 12.1 and Proposition 12.4. The gap must appear in plan.json and in the README.

   **Tested.** Take B=ℤ with the integer solid measures. Then θℤ=Hℤ is discrete and Mod_{θℤ}=D(ℤ). The transported subcategory is the Mod_{δHℤ}(Sp■)≃D(SolidAb_light) of §2.3. The unit B→μ[*] is the identity of ℤ, so the structure is completed, as §7.4 says.

4. **F04** (P3) Locator and manifest precision

   **Location.**
   - `packages/SolidAnalyticRings/design/README.md` line 726, §7.4: "(AG, Definition 6.12 and Proposition 6.14, pp.39–40, AG lines 1361 and 1384; Definition 12.1, Proposition 12.4, Remark 12.5, pp.79–80, AG lines 3014–3055)".
   - Line 338, §3.2: "(split-tower argument)".
   - Line 766: "Example 4.6.4, p.44, RC line2114".
   - Lines 180 and 766: Theorem 3.2.4 is located on "pp.17–18".
   - `packages/SolidAnalyticRings/sources.toml` line 72, the `cited_for` of Q.

   **Claim.** Each locator supports its statement as written, and the manifest records every use.

   **Witness.** AG lines 1361–1412 and 3014–3055 use only extremally disconnected sets, never the light site. Q lines 3672–3674 give finite free stages, no splitting. RC line 2114 is p.43; Theorem 3.2.4 ends on p.17; §4.1 cites Q line 3688.

   **Repair.**
   - §7.4: mark the AG citations "(integer/animated model)". Add a locator for each side of the identification:
     - the light side: RC Theorem 3.2.4(12), p.17, RC line 773 (light free measures);
     - the compact-Hausdorff side: CS Theorem 5.8, pp.35–36, CS line 1243 (solid groups, used through VS2.1).
   - §3.2: write "(model: finite free stages; the splitting is this roadmap's hypothesis)".
   - References: write "Example 4.6.4, pp.43–44, RC line 2114".
   - §1.5 locator and References: Theorem 3.2.4 is on "p.17".
   - The fix worker adds "4.1" to the `cited_for` of Q.

   **Tested.** On (ℤ, ℤ■), the two sides agree, which is the identification that §7.4 claims:
   - RC line 773 gives ℤ■[ℕ∪{∞}]=lim ℤ[S_n]=ℤ×∏_ℕℤ;
   - CS Theorem 5.8 with Nöbeling gives Hom(C(ℕ∪{∞},ℤ),ℤ)=ℤ×∏_ℕℤ.

5. **F05** (P3) Spaces dropped before numerals

   **Location.** `packages/SolidAnalyticRings/design/README.md` line 25: "with index0 and marked ∞". The same defect occurs on lines 27, 39, 40, 43, 45, 62, 70, 506, 564, 580, 598, 624, 686, 734, 750 and 762–770. It also occurs in the same strings in plan.json.

   **Claim.** The README is prose for mathematicians, in house style.

   **Witness.** Tokens such as "eventually0", "realization0", "sends0 to0", "it isℤ", "are1,3", "lines437,443" and "of5 February2026" read as garbled symbols, not as words followed by numbers.

   **Repair.** Insert the missing space in each token, in the README and in the identical strings of plan.json. Examples: "index 0", "sends 0 to 0", "it is ℤ", "are 1, 3", "lines 437, 443", "of 5 February 2026".

   **Tested.** I searched for a lower-case word followed directly by a digit or ℤ, outside identifiers, arXiv ids and commit hashes. It finds about fifty tokens, all on the lines listed. After the edit the same search should find none.

Files reviewed: `packages/SolidAnalyticRings/design/README.md`, `packages/SolidAnalyticRings/design/plan.json` and `packages/SolidAnalyticRings/sources.toml`. The design has 7 layers and 27 targets, counting the new §1.5. It has 89 Checks, 61 API laws and two declared supplier gaps.

All eight round-1 findings are repaired. The five findings below are all P3, so none blocks. The acceptance is conditional on the two declared gaps, `gap:cardinal-interchange` and `gap:light-countable-ab6`.

## Verified sound

### Round-1 findings, one by one

- **F01 (P1): repaired.** §1.5, line 180: "Define SolidAb_light as the full subcategory of groups B for which 1−σ* is invertible on the internal Hom(P,B)."
  - Line 222 now says that the homotopy structure "has heart SolidAb_light of §1.5".
  - §2.3 (line 272), §3.1 (line 322) and §4.2 (line 422) are repointed to §1.5.
  - The round-1 contract sentence importing integer presentations from VS2.1 is gone.
  - Lines 9 and 68 now describe VS2.1 as the compact-Hausdorff theory, used only in §7.4.
- **F02 (P2): repaired.** String comparison confirms that README lines 64 and 70 and the plan's `gaps` carry identical `needs` sentences. Both are exactly the round-1 proposals.
- **F03 (P2): repaired.** Line 572: "if M≥b then M/a_r≥b for every r and Λ_a(M)≥b for every such tower".
  - The new Check is at line 584.
  - §6.3's tails are ≥b+d+1 (line 588), and its Check says "(b+1)-connective after completion" (line 598).
  - The plan hypothesis now reads "no completeness, finite-free quotient or split-stage hypothesis is imposed".
- **F04 (P3): repaired.** Line 478: "For these countable-product blocks the existence of a finite output factorization is automatic". The fold-map Check is at line 542.
- **F05 (P3): repaired.**
  - §2.1's Needs (line 226) lists §1.4 and E2.1–E2.3.
  - §1.1's Needs (line 84) lists E5:abstract.3.
  - §6.4's Needs (line 608) lists E5:spectra-comparison, and line 606 cites `symmetricSpectra_towerComparison`.
  - The Layer 5 Dependencies (line 550) list E2:towers.
  - The skeleton declarations are in the Conventions (line 17) and the contract (line 39).

  Further instances of this pattern elsewhere in the design are R01.
- **F06 (P3): repaired.** Line 50: "There is no direct Tau Ceti declaration imported." Line 760: "All locators use the versions recorded in sources.toml." A search finds no SA.1–SA.4 or legal-status sentence.
- **F07 (P3): repaired.** Line 102: "π₀ of 𝕊[C] at the point is ⊕_Cℤ; at a two-point space it is (⊕_Cℤ)²". Line 690 uses the span H𝔽₂←Hℤ→H𝔽₂ with π₀=π₁=𝔽₂. A further instance of this pattern is R02.
- **F08 (P3): repaired.** Line 668: "for every compatible square of analytic morphisms". The target-zero Check is at line 692. The plan hypothesis reads "no kernel-generation hypothesis is required".

### Principles

- **No shortcut.** The statements cover general coefficient data, every prime, every small family F and all countable index sets.
- **No re-planning.**
  - §1.5 builds light null-test solidity on `LightCondAb`. VS2.1 builds the profinite-measure predicate (`Mathlib/Condensed/Solid.lean:83`) on `CondensedAb`, which is sheaves on compact Hausdorff spaces. These are distinct carriers, and line 11 says how they differ.
  - The RefinedTraceMethods relocation was commissioned by the design target. It is recorded below.
- **Supply direction.** See the gate output below.
- **Own words.**
  - §1.5 matches RC lines 754–787 in content but not in wording.
  - §2.2 is paraphrased from W lines 445–451.
  - §7.3 is paraphrased from MW lines 1764–1775.
- **Algorithms and Lean.** The design contains no algorithms. At this stage there is no Lean, so there is no sorry'd data and no `set_option`.

### Sources: the seeded sample (15 targets)

| Target | Locator | What I read | Verdict |
|---|---|---|---|
| 1.1 | RC Def 4.0.1, pp.27–28; W 2.1, p.11 | RC 1392–1407: C-valued hypersheaves with terminal empty value, finite products and hyperdescent; W 437–441 | correct |
| 1.5 | RC Def 3.2.1, p.16; Thm 3.2.4(1)–(13) | RC 732–744 and 754–786: all thirteen items match the six API bullets; (13) needs countable I and J; (12) needs infinite S for generation | correct; page (R04) |
| 2.1 | RC Thm 2.3.3(1)–(3); Thm 3.2.4(6); proof RC line 870 | RC 537–541, 764–765 and 870–872: the cohomology of RHom(P,−) is computed degreewise because P is internally projective | correct (integer model) |
| 2.2 | W 2.1, lines 448–451; RC (5)–(8) at line 761; RC (12) at line 773 | closure under limits and colimits, the reflector and its tensor compatibility, the derived reflections, the free-measure formula | correct |
| 2.3 | MW 4.1, line 1763; RC (9)–(11), line 769 | D(ℤ■) defined as Mod_ℤ(Sp■); D(Solid)→D(CondAb) is fully faithful onto the solid objects | correct |
| 3.2 | Q 3672–3674 | the stages of the S_H tower are finite sums of 𝕊; the countable product tensor | correct as a model; annotation (R04) |
| 3.3 | Q 3672 | the double limit and its diagonal at Q 3675–3681 | correct |
| 3.4 | Q 3672, 3685 | the relative tensor over 𝕊[q^±1] identifies q₁ and q₂ | correct |
| 5.1 | Q 3672–3688 | S_H as a limit of finite free stages; completion as a countable limit | correct as a model |
| 6.1 | Bosco 3462–3469; Q 3688–3692 | a simplicial resolution of connective M by sums of compact projectives; reduction to countable sums | correct (integer model) |
| 6.2 | Bosco 3465; Q 3688; RC 540 | completion commutes with realization; sequential limits of surjections are surjective | correct |
| 6.4 | W 2.2, lines 452–462; Bosco Prop A.3, line 3459 | the p-complete embedding is fully faithful and monoidal on bounded-below objects; Bosco assumes a derived p-complete solid ring and cohomologically bounded-above M and N, as the README does | correct |
| 7.2 | RC Prop 4.1.6, lines 1489–1519; AG Prop 12.4 and Rem 12.5, lines 3041–3055 | the completion is uniquely monoidal; B⊗_A− factors through D(A) and is left adjoint to restriction; the pushout statement follows from RC 1511–1519 | correct |
| 7.3 | MW 4.2, lines 1764–1775; RC Ex 4.6.4(2),(4), lines 2125–2145 | f-solidity tested by 1−fσ*; T-summability; perfect localizations, with connectivity left to check | correct (integer model) |
| 7.4 | AG Def 6.12 and Prop 6.14 (lines 1361, 1384); Def 12.1, Prop 12.4 and Rem 12.5 (lines 3014–3055) | the numbering and pages are right, but the text covers only the measure formalism | partly (R04) |

- **Page numbering.** RC's printed pages equal its PDF pages. Q's printed pp.79–80 are PDF pp.124–125, and HTT's printed p.394 is PDF p.412. AG's and CS's printed pages equal their PDF pages.
- **Flagged locators.** The author flagged no locator as unverified.
- **Fetching.** All nine sources were in the cache, so I fetched nothing and added nothing to the manifest.

### Adversarial table

Values are at the point unless a sheaf is named. These rows cover every passage the repair changed and every sampled target. For the untouched §§1.2, 1.4, 2.4, 4.1, 5.3 and 7.1, the round-1 rows carry computed values, and I recomputed their Checks.

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| Conv. σ, σ* | e₁, e₀ against ℤ | σ*e₁=e₀ and σ*e₀=0; (1−σ*)(e₁+e₀)=e₁; the right shift gives e₁−e₂ | holds; opposite shift excluded | none |
| Conv. skeleton (repaired) | instance at Basic.lean:403; equivSmall at Small.lean:30 | both exist at the pin with the stated types | holds | R01 (§1.1 Needs) |
| 1.1 free-sheaf Check (repaired) | C=ℕ∪{∞} at the point and at two points | ⊕_Cℤ (the trivial hypercover refines every hypercover of *) and (⊕_Cℤ)²; ℤ■[C]=ℤ×∏ℤ contains the all-one vector | holds; free sheaf ≠ measure | none |
| 1.1 empty space and tensor | T=∅; \|T\|=2, \|U\|=3 | M(∅)=0; 𝕊[∅]⊗𝕊[U]=0=𝕊[∅]; 𝕊²⊗𝕊³=𝕊⁶=𝕊[T×U] | holds | none |
| 1.3 universe transport (repaired) | ℤ[C]=ℤ⊕P | split by the constant map to ∞, so `ofRetract` applies; Sequence.lean:20 fixes `R : Type` | holds; transport stated as a target | none |
| 1.4 δX solid | δ𝕊; N | π₀=ℤ and π₁=ℤ/2, both discrete and solid; N(*) has π₀=⊕ℤ but its solidification has ∏ℤ | holds | R01 (needs §1.2) |
| 1.5 test | ℤ; topological ℝ; P | Hom(P,ℤ)=⊕ℤ with (1−σ*)⁻¹e₁=e₀+e₁; for ℝ, x₀=Σ1/(n+1) diverges; P(*)=⊕ℤ but P■=∏ℤ | ℤ is solid; ℝ and P are not | none |
| 1.5 free measures | S=∅, *, {a,b}, C | 0, ℤ, ℤ², ℤ×∏ℤ | holds | none |
| 1.5 generator only for infinite S | S=*, M=ℤ_p/(ℤ_p)^δ | Hom(ℤ,M)=M(*)=0, but M≠0, since the sequence p^n gives a class in M(C) | finite S correctly excluded | none |
| 1.5 product tensor | I=∅; 2×3; ℕ×ℕ | 0=0; ℤ⁶=ℤ⁶; ∏_{ℕ²}ℤ on both sides | holds; countable only (RC (13)) | none |
| 1.5 universes | `LightCondAb := LightCondMod ℤ` (Module.lean:85; `R : Type u` at line 36) | universe 0 only | lifted ring at u>0 correctly used | none |
| 2.1 t-structure | ΣHℤ; HB; τ≥1 and τ≤0 of ΣHℤ | π₁=ℤ; π₀HB=B and all other homotopy 0; ΣHℤ and 0 | holds | none |
| 2.1 solid ⇔ π_k solid | δ𝕊; N | all π_k discrete, so solid; π₀N=P is not solid | both directions discriminated | none |
| 2.2 reflection and tensor | 0, δ𝕊, 𝕊[C]; b=1, c=2 | 0; δ𝕊; δ𝕊⊕∏δ𝕊; Σ𝕊⊗Σ²𝕊=Σ³𝕊, which is ≥3 | holds | none |
| 2.2 third Check | — | no value computed | not a test | R02 |
| 2.3 detection | X=Σ^bH𝔽₂; C=cofib(𝕊→Hℤ) | π₀C=π₁C=0 and π₂C=ℤ/2, so X⊗C≥b+2; π_bX=𝔽₂→𝔽₂ is iso, while π_{b+1} is only onto | holds as stated | none |
| 2.3 Tor | H𝔽_p⊗_{Hℤ}H𝔽_p, p=2,3 | π₀=π₁=𝔽_p; all else 0 | holds | none |
| 2.4 (route repaired) | the family e_n; A=0 | π₀G=∏ℤ contains (1,1,…); G_0=0 | holds | none |
| 3.2 split towers | zero; constant 𝕊; 𝕊^{n+1}; ×2; d=(1,1):𝕊²→𝕊 | 0; 𝕊; ranks 1,2,3 with rank-1 kernels; 2b=1 has no solution; section (1,0) and kernel spanned by (1,−1) | holds; π₀-onto transitions split automatically | none |
| 3.3 independent towers | rank 1⊗1; m=1, n=2; diagonal | 𝕊; 2·3=6; (m,n)≤(max,max), so the diagonal is cofinal | holds | none |
| 3.4 balancing | A=𝕊; A=𝕊[t]; (∏ℤ)⊗ℚ | X⊗Y; ℤ[t₁,t₂]→ℤ[t]; (2^{−n}) lies outside | holds | none |
| gap cardinal-interchange | κ=ω₁, J=ω₁, K=ℕ, F(α,k)=Hℤ for k<α; J=ℕ | ∏Hℤ on both sides; for J=ℕ, ⊕Hℤ versus ∏Hℤ | holds; ω does not suffice | none |
| gap light AB6 | B_j=ℚ with (1/n!)ℤ; B_j=0 | (1/(j+1)!)_j lies on both sides, taking α_j=j+1; 0=0 | holds | none |
| 4.2 (repaired) | same family; ℤ^{n+1} towers | the diagonal colimit omits that element; ∏ℤ→ℤ^{n+1} is onto, so lim¹=0 | holds | none |
| 5.1 datum | lim δ(𝕊[t]/t^r); A=0; 𝕊/p | cofib(t)=δ𝕊 with ranks 0,1,2; everything 0; ℤ/p is not free | holds | none |
| 5.2 automatic factorization (added) | A=𝕊[[t]]; I countable | ∏_IA=∏_{I×ℕ}δ𝕊≃A⊗■∏_Iδ𝕊, a retract of G (or G itself), hence compact, so it maps into a finite sub-sum | holds, also for finite or empty I | none |
| 5.4 fold Check (added) | (t^j)_j with f(j)=j | Σt^j=(1−t)⁻¹ and (1−t)(1+t)=1−t²≡1 | holds | none |
| 6.1 resolutions | 0; Σ^bG_A; Σ^{−n}G_A | 0; constant resolution; no common bound | holds | none |
| 6.2 bound (repaired) | Σ^bHℤ with 2^r; a_r=1; a_r=0 (r≥1) with b_{r,s}=0 or 1 | Σ^bHℤ₂ with π_{b−1}=lim¹ℤ/2^r=0; 0; M or M⊕ΣM, both ≥b | holds; Λ depends on the data b_{r,s} | none |
| 6.2 ideal tower | ℤ⊃2ℤ⊃⋯ | lim=0 and lim¹=ℤ₂/ℤ, giving π₋₁ | separated from the quotient tower | none |
| 6.3 tails (repaired) | layers N_n≥b; skeleton degree d | the tail is ≥b+d+1; π_k is iso exactly when d>k−b | holds; the threshold is sharp | none |
| 6.3 first layer | Σ^bHℤ in degree 1, 2^r | the completed layer has π_b=0 and π_{b+1}=ℤ₂ | (b+1)-connective | none |
| 6.4 tower | H𝔽_p, p=2,3 | [ΣX,X]=0, so X/p^r=X⊕ΣX canonically; the transition has components id, ∂τi=0, 0, Σp=0, so it is diag(id,0) with limit X | holds; agrees with the check in EnhancedDerivedSheaves E5:spectra-comparison | none |
| 6.4 units | p=2,3 | π₀e_p(𝕊_p)(*)=ℤ₂ and ℤ₃; the comparison ℤ→ℤ_p sends 1 to 1 | holds | none |
| 6.4 Hℤ-relative tensor | ℤ_p⊗^L■ℤ_p; 𝔽_p⊗^L_{ℤ_p}𝔽_p | ℤ_p; π₁=𝔽_p | holds | none |
| 7.1 structures | D=all, {0}, perfect | L=id; L=0, completed only when A=0; ⊕Hℤ is not perfect | holds | none |
| 7.2 base change (repaired) | all algebras Hℤ with D_B′=0; span H𝔽₂←Hℤ→H𝔽₂ | 0=0; π₀=π₁=𝔽₂ | holds without kernel generation | none |
| 7.3 tests | e₁ with any f; ℚ_p with f=1/p; 𝔽₂[ε] with f=ε; f=1 | (1−fσ*)(e₁+fe₀)=e₁; b_n=p^n lies in the kernel; (1−εσ*)(1+εσ*)=1; Hom(G,M)=Hom(N,M) | holds | none |
| 7.3 connectivity | connective X | Hom(N,X)≥0 by §2.1; fib(1−fσ*)≥−1; so cofib(Hom(R,X)→X)≥0 | holds (model: RC Prop 4.6.2(2)) | none |
| 7.4 comparison | (ℤ,ℤ■); ∅, *, 2 points; ℚ_p; 𝔽₂ | ℤ×∏ℤ on both sides; 0, ℤ, ℤ²; (p^{−n}) lies outside (∏O_E)[1/p]; H₁(BΣ₂;𝔽₂)=𝔽₂ | holds for static B | R03, R04 |
| Habiro consumer Check | (q;q)_n | ranks 1 and 3 at n=1,2, that is n(n+1)/2 | holds | none |

### Duplication audit, by object

**Mathlib at 6b7abb3c.** I opened each of the following at the pin, and every line number quoted in the README matches:
- `LightProfinite` (Basic.lean:42), `LightProfinite.of` (:56) and the EssentiallySmall instance (:403);
- `effectiveEpi_iff_surjective` (EffectiveEpi.lean:28);
- `LightCondensed.equivSmall` (Small.lean:30);
- `LightCondensed` (Light/Basic.lean:28);
- `LightCondMod`, `free`, `freeForgetAdjunction` and `LightCondAb` (Light/Module.lean:42, 68, 73, 85);
- `discreteUnderlyingAdj` (Discrete/Basic.lean:86);
- the AB4* and Grothendieck instances (Light/AB.lean:31, 35);
- the monoidal instances (Light/Monoidal.lean:41–62);
- `profiniteFree`, `profiniteSolid`, `profiniteSolidification` and `CondensedMod.IsSolid` (Solid.lean:44, 48, 69, 83, docstring 74–82);
- `LocallyConstant.freeOfProfinite` (Nobeling/Induction.lean:153);
- `internallyProjective_free_natUnionInfty` (Light/Sequence.lean:302, with `R : Type` at :20);
- `isInternallyProjective`, `InternallyProjective` and `ofRetract` (Projective/Internal.lean:41, 47, 61);
- `Submodule.basisOfPid` (FreeModule/PID.lean:298).

The pin also has `epi_π_app_zero_of_epi` and a countable-product epimorphism instance (Light/Epi.lean:109, 132). R01 asks for the first to be cited. Mathlib contains no AB6 anywhere.

**Tau Ceti at a91d3aaf.** It has no condensed, light or solid carrier. The only hits are a docstring mention and an import, so citing none is correct.

**Roadmaps.** I ran roadmap-service searches over main and the 330 open heads for "light solid", `LightCondAb`, "condensed spectra", "solid spectra", "AB6" and "animated analytic" rings. They find only HabiroRings, which is a consumer, and the AB4* remark in EnhancedDerivedSheaves E2.1.

**Board packages.** I searched the local packages, and fetched three packages at their heads: RefinedTraceMethods (87bc3ff), HigherHidaAndColemanTheory (da88512) and VStackSheavesAndLisseCategoriesPartII (0987ba7). None plans light null-test solidity or light AB6, so this roadmap owns them.

### Supplier order

Gate output, verbatim:

    candidate: SolidAnalyticRings is not in the merge order yet; checked as if placed after VStackSheavesAndLisseCategories (the intake inserts it when its design is accepted)
    depcheck: 27 roadmaps, 234 edges, 0 problem(s)

There is no UPWARD or CYCLE line.

**Citations resolved.**
- **EnhancedDerivedSheaves** on main (a07e202). Each cited section exists and says what is cited: §§0.1–0.3, E0.4, E0.8, E1.3, E2:towers, E2.1 (`IsReplete.countableProduct_epi`, line 2071), E2.2 (`IsReplete.milnor`, line 2097), E2.3, E2.6–E2.7, E3.2–E3.3, E4.1, E4.4, E5:abstract.2–5, E5:presentability.1–2, E5:animation.4 (θ is an equivalence only rationally) and E5:spectra-comparison (`symmetricSpectra_towerComparison`, line 1876).
- **GeneralizedCohomology** on main. G2 items 1–7, and G3 items 8 (spectral homotopy limits) and 9 (derived prime completion).
- **StableHomotopyKTheory** §§5.13–5.18 at #1227 (00bfbf7). §5.16 is the section that states π_k=H^(−k).
- **VStackSheavesAndLisseCategories** at #1230 (0ca8db7). VS2.1 contains the bold paragraphs “The abelian category of solid groups”, “Solidification as a reflection” and “Solid tensor and internal Hom”. VS2.2 contains “Analytic measures and complete modules” and “Solid nonarchimedean coefficients”. Its Conventions state the comparisons on common presentations.
- **HabiroRings** §§2.6–2.12 at #1425 (bb5d6cb).
- **Consumers on the board.**
  - RefinedTraceMethods §6.2 “Light condensed and solid spectra” at 87bc3ff: the bold paragraph under “6.2 Light solid spectra and module nuclearity”.
  - HigherHidaAndColemanTheory: R23 at line 1824 and R24 at line 1830 at da88512.
  - LocallyAnalyticRepresentationsOfLocalGroups: LR.3 in its board design.

**Declared gaps.**
- Both gaps name a supplier earlier in the order, and each is declared with the same slug and sentence in plan.json and the README.
- Each is precise and minimal: the needed statement appears in neither EnhancedDerivedSheaves nor VS, nor at the pins.
- The AB6 contract is elementary, because products and filtered colimits of light sheaves are computed sectionwise when covers are finite. This is not a finding.

**Move recorded.** The RefinedTraceMethods §6.2 block moves down to §§1.1–2.4 and §6.4 here. The block consists of:
- Cond(Sp) and the discrete embedding;
- Null and σ;
- closure of Sp■ and its reflector;
- the solid tensor;
- Null■≃∏𝕊 as compact generator;
- the bounded-below p-complete comparison, with the completed unit and the lax inclusion.

Its three Checks reappear in §1.4, §6.4 and §§1.1/2.2: discrete objects are solid; the p=2 units are ℤ₂ versus ℤ; 𝕊[ℕ∪{∞}] is not solid. Its even-filtration remark about Hom(Null,𝕊) stays in RefinedTraceMethods.

### Shape

- The README follows the upstream section order. Each of the 7 layers ends with Examples and Dependencies.
- There is no LaTeX, no target table and no field list.
- Each of the 12 definitions and constructions has API laws and at least three Checks.
- Each of the 27 targets has a locator.
- Plan and README agree on all 27 statements, all 27 prerequisite lists, 89 Checks and 61 API laws, and on both gap sentences.
- The 27 distinct backticked names are all Mathlib or supplier names, and each resolves at the pin or on main.

### Lean form and headline theorems

- **This stage.** There is no `Suggested.lean` at the design stage, and elaboration is not available (this lane does not elaborate). So no `#check` comparison and no one-tactic padding probe were run.
- **For the package stage.** The pin has `LightCondAb`, its closed monoidal structure and ℕ∪{∞}. So §1.5's light solid predicate, its abelianness and the existence of its reflector are statable. The spectral headlines of §§1.1–7.4 need an ∞-category of spectra, which the pin lacks; they will be named in the docstring as not statable.

### Ownership against open pull requests

- **Method.** I checked through the roadmap service over main and the 330 open roadmap heads (index of 2026-10-23T14:36:27Z), and through the board packages named above. The brief gives no path for any sibling checkout, so I read no sibling checkout; the service covers those heads.
- **Light null-test solidity.** This roadmap owns it: no roadmap on main, in an open pull request or on the board plans it. VS2.1's theory lives on another carrier.

## Not verifiable

- **AS.** This transcript is context only, and no target rests on it alone, so I did not open it.
- **MW versions.** The manifest pins the author version of 5 February 2026, which is the one I read. I did not check that its numbering agrees with arXiv 2410.23115.
- **Lean.** No Lean file exists at this stage, and this lane does not elaborate.
- **The spectral extensions.** Several statements extend an integer model in the sources to spectra. Examples are the colimit preservation of Hom(N,−) on all of Cond(Sp) in §2.1, and the identification of light and compact-Hausdorff solidity in §7.4. I checked them on the instances above, not in general.

## Source issues

- **Misprint** in RC at Theorem 2.3.3(3), p.12 (RC line 541): the source says the internally projective object is free on a disjoint union of ℕ and a point; it should be ℕ∪{∞}, as the proof uses; affects nothing.
- **Misprint** in RC at the proof of Theorem 2.3.3(3), p.12 (RC line 550): the source says the map to be lifted starts at ℤ[S] tensored with N; it should be ℤ[S]⊗P, as the diagram shows; affects nothing.
- **Misprint** in RC at the proof of Theorem 2.3.3(3), p.12 (RC lines 555–556): the source says the profinite factor is ℕ times the point at infinity; it should be ℕ∪{∞}; affects nothing.
- **Misprint** in RC at the proof of Proposition 3.2.5(1), p.18 (RC line 812): the source says the second coordinate of (1−Shift*) of a sequence is a₁ minus a₁; it should be a₁ minus a₂; affects nothing.
- **Misprint** in RC at the proof of Proposition 3.2.5(7), p.19 (RC lines 874–875): the source says the solid target is B in the displayed isomorphism and conclusion; it should be C, as introduced; affects nothing.
- **Misprint** in RC at the proof of Proposition 3.2.5, p.19 (RC line 876): the source says it assumes properties (11) and (12); it should be (12) and (13), which the arguments for (9)–(11) use; affects nothing.
- **Error** in RC at Lemma 3.3.2, p.20 (RC line 923): the source says every light profinite S has a map from P to ℤ[S] inverted by solidification; it should be stated for infinite S only, since for S a point the solidifications are ∏_ℕℤ and ℤ; affects nothing.
- **Misprint** in HTT at the proof of Proposition 5.3.3.3, printed p.394 (HTT line 18710): the source says the cofinal map from N(A) lands in the ∞-category of spaces; it should be the κ-filtered ∞-category I; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "802490a", "job": "REV-DESIGN-SolidAnalyticRings~2", "model": "opus", "worker": "fable-rev17"} -->
