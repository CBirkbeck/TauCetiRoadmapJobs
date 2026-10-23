<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/943#issuecomment-6372546531 -->
Red team round 1 pass b (claude) of 3ac1b2b

Verdict: changes needed

1. **F01** (P2) §6.4's tensor closure rests on a p-adic null-family formula that no target states

   **Location.** `packages/SolidAnalyticRings/README.md:619` states "If M,N are p-complete bounded-below solid spectra then M⊗■N is p-complete." Its proof route, line 621: "prove the generator tensor comparison through the integer p-adic null-family calculation and bounded Postnikov intervals".

   **Claim.** The roadmap's only null-family theorem (§§5.3–5.4) requires a complete split coefficient datum, whose quotients B_r must be finite free sphere modules (line 463). The roadmap itself excludes the p-power tower (line 487: "The tower 𝕊/p^r is not a split finite free sphere tower"). So the light-site p-adic null-family formula, and the two-index profile comparison needed to tensor two completed sums, are inputs of a headline that no layer, supplier section or pinned declaration provides. §6.4's Needs (line 623) lists neither §5.2 nor any null-family target.

   **Witness.** A=Hℤ_p, a_r=p^r: B₁=H𝔽_p has π₀=𝔽_p, not finite free, so the datum of line 463 does not exist and §5.3 cannot apply; Bosco states the integer formula separately (Lemma A.4, Bosco line 3488).

   **Repair.** Insert in §6.4, before the sentence beginning "On Hℤ-linear inputs":
   "For every prime p and countable sets I_j, j∈ℕ, the natural map colim_(f proper) ∏_j∏_(i∈I_j) p^(f(j))ℤ_p → (⊕_j∏_(i∈I_j)ℤ_p)^∧_p of light solid abelian groups, with proper profiles ordered as in §5.2, is an isomorphism, natural for finite-output block maps; the same holds for e_p(𝕊^∧_p) in place of Hℤ_p on every bounded Postnikov interval. Every proper profile h on ℕ×ℕ admits proper f,g with f(j)+g(k)≤h(j,k), and every such f(j)+g(k) is proper. (Bosco Lemma A.4, p.93, Bosco line 3488, integer model.)"
   Add "§5.2 (profile order only)" to §6.4's *Needs:*.
   Tested on the refuting instance and its neighbours: I₀=ℕ with all other blocks empty gives ∏_ℕℤ_p on both sides (take f(0)=0); for singleton blocks, (p^j)_j lies in the stage f(j)=j and (1)_j lies in no proper stage and is not p-adically null; p=2 and p=3 give the same values. For the two-index clause, f(j)=⌊min_k h(j,k)/2⌋ and g(k)=⌊min_j h(j,k)/2⌋ are proper and f(j)+g(k)≤h(j,k); for h(j,k)=max(j,k) this gives ⌊j/2⌋+⌊k/2⌋≤max(j,k); conversely {(j,k): j+k<r} has r(r+1)/2 elements, so j+k is proper.

2. **F02** (P3) §3.4 uses §3.3 but its Needs line omits it

   **Location.** `packages/SolidAnalyticRings/README.md:395`: "identify their action on these solid spectral tensors and the projection-induced maps of §3.3" and "apply balancing to the completed object produced by §3.3"; line 399: "*Needs:* §2.2; EnhancedDerivedSheaves E5:abstract.2; … E5:abstract.4."

   **Claim.** A statement input is missing from the *Needs:* line (build order, defect class 11).

   **Witness.** Lines 395 and 399 of the README; §3.3's own Needs (line 383) are §3.1, §3.2 and E2:towers, so adding the edge creates no cycle.

   **Repair.** Replace line 399 by "*Needs:* §2.2; §3.3; EnhancedDerivedSheaves E5:abstract.2; EnhancedDerivedSheaves E5:abstract.3; EnhancedDerivedSheaves E5:abstract.4." Tested: §3.3 precedes §3.4 and does not reach §3.4 in its Needs closure; rerun the depcheck after the edit.

3. **F03** (P3) "common light presentation" and "cutoff" are undefined, and §1.3's universe target is stated only through them

   **Location.** `packages/SolidAnalyticRings/README.md:135`: "the additional target is its natural scalar/site transport on the common light presentations"; line 149 (API law) and line 755: "represented on its common size-bounded light presentation … commute with cutoff enlargement on the supplied common presentations".

   **Claim.** Neither term is defined in the README (Conventions, lines 17–31, do not define them), so §1.3's additional target and its law, and the site clause of §7.4, have no checkable content (defect classes 15 and adversarial item 11).

   **Witness.** The term occurs at lines 9, 13, 45, 71, 135, 137, 149, 755, 757 and 785 without definition; the supplier's Conventions (VStackSheavesAndLisseCategories at its open head, line 53) and VS2.2 (line 715) also leave it undefined.

   **Repair.** (a) In §1.3 replace "At the base universe, internal projectivity is imported; the additional target is its natural scalar/site transport on the common light presentations, not another base-universe proof." by "At the base universe, internal projectivity is imported. The additional target: for every universe u, with C_u the one-point compactification of ULift ℕ among u-small light profinite spaces, the free LightCondMod(ULift ℤ)-module on C_u is internally projective, and the universe-lift functor from LightCondAb carries ℤ[C], ℤ[{∞}], P and σ to their counterparts on C_u." Restate the law at line 149 the same way. (b) Add to Conventions: "A common light presentation of a light condensed object is a presentation as a colimit of free objects on light profinite sets S=lim_n S_n, given by countable inverse systems of finite sets; such a system defines S in every universe and at every cutoff (a regular-cardinal bound on the site of profinite sets used by VS2.2), and comparison functors are evaluated on these presentations." Tested on C=ℕ∪{∞}=lim_n {0,…,n−1,∞}: the inverse system is universe-independent, ULift gives C_u, and P(*)=⊕_ℕℤ at every universe.

4. **F04** (P3) the compactness clause of the first headline carries a free universe parameter

   **Location.** `TauCetiRoadmap/SolidAnalyticRings/Suggested.lean:119`: "IsFinitelyPresentable (⟨_, h⟩ : IsLightSolid.FullSubcategory) ∧".

   **Claim.** At the pin `IsFinitelyPresentable.{w} X` is `IsCardinalPresentable.{w} X ℵ₀` with w the universe of the filtered index categories (Mathlib/CategoryTheory/Presentable/Finite.lean:49–50). Left unannotated, w becomes a universe parameter of the theorem, which then asserts preservation of filtered colimits indexed in every universe. The README (line 195) asserts preservation of filtered colimits by Hom, and the pinned API only passes from larger to smaller index universes (`preservesFilteredColimitsOfSize_shrink`, Mathlib/CategoryTheory/Limits/Preserves/Filtered.lean:89).

   **Witness.** Elaborating `#check @isLightSolid_reflective_and_generator` at the pins prints `isLightSolid_reflective_and_generator.{u_1}` with `IsFinitelyPresentable.{u_1, 1, 1}`; `LightCondAb` carries `Category.{1, 1}`.

   **Repair.** Write `IsFinitelyPresentable.{1} (⟨_, h⟩ : IsLightSolid.FullSubcategory) ∧`. Tested in a scratch copy at the pins: the file elaborates with only the two expected `sorry` warnings, the theorem has no universe parameter, and `isFinitelyPresentable_iff_preservesFilteredColimits` (Finite.lean:69) identifies the clause with `PreservesFilteredColimits (coyoneda.obj (op X))` for every X in the solid subcategory.

## Verified sound

**Counts.** Declarations read: 7 of 7 (all of `Suggested.lean`, 132 lines). Targets read: all 27 subsections §1.1–§7.4 and every other paragraph of the README (801 lines). Locators verified: 32 Mathlib file:line locators read at the pin, 29 cited Mathlib names elaborated at the pin (all resolve), 51 source locators read in the cached texts (RC 22, W 5, MW 4, Q 6, Bosco 6, AG 4, CS 2, HTT 1, AS 1). Checks tested: 99 of 99 (at least three per definition in every subsection), recomputed below or in the declaration table. Sibling and supplier citations checked: 41 (GeneralizedCohomology G2.1–G2.7, G3.8, G3.9; StableHomotopyKTheory §§5.13–5.18; EnhancedDerivedSheaves §§0.1–0.3, E0.4, E0.8, E1.3, E2:towers, E2.1–E2.3, E2.6, E2.7, E3.2, E3.3, E4.1, E4.4, E5:abstract.2–.5, E5:presentability.1–.2, E5:spectra-comparison, E5:animation.4 and the targets `IsReplete.countableProduct_epi`, `IsReplete.milnor`, `symmetricSpectra_towerComparison`, `animatedModules_discrete`; VStackSheavesAndLisseCategories VS2.1 with its three named subsections, VS2.2 with "Analytic measures and complete modules", "Solid nonarchimedean coefficients" and `ZSolidAnalytification.formalComplement`; HabiroRings §§2.6–2.12 and gap:light-solid-spectra; RefinedTraceMethods §6.2; HigherHidaAndColemanTheory R23–R24; LocallyAnalyticRepresentationsOfLocalGroups LR.3).

**Mechanical signature check.** The seven declarations were copied into one scratch file with `#check @name` for each and elaborated once against the pinned Mathlib and Tau Ceti: exit 0, exactly two warnings ("declaration uses `sorry`", at the two theorems). The elaborated types agree with README §1.5 (lines 185, 195, 197): `natShift` and `inftyPoint` are maps of the universe-zero `LightProfinite.NatUnionInfty`, `nullSeq : LightCondAb`, `nullShift` its endomorphism, `IsLightSolid : ObjectProperty LightCondAb`; the second theorem keeps its explicit `[HasDerivedCategory LightCondAb]` binder. No section variable exists, so none can be lost. The only change found is R04 (free universe), and its repair was elaborated as well.

**Declaration table.**

| Declaration | Context | Instances tried | Values on each side | Result |
| --- | --- | --- | --- | --- |
| `natShift` (line 88) | no variables | 0, 1, ∞; constant map to 0 | images 1, 2, ∞; the wrong model gives 0, 0, 0 | correct marked shift |
| `inftyPoint` (line 94) | none | the point; composite with `natShift` | value ∞; natShift(∞)=∞, so the composite is `inftyPoint` (the `h` of line 104) | correct |
| `nullSeq` (line 98) | none | value at * | ℤ[ℕ∪{∞}](*)/ℤ[∞] = ⊕_ℕℤ | equals P of RC line 548 |
| `nullShift` (line 102) | none | basis e_n; precomposition on Hom(P,ℤ) | e_n↦e_(n+1); σ*e₁=e₀, σ*e₀=0 | direction agrees with Conventions line 25 |
| `IsLightSolid` (line 110) | none | B=ℤ, 0, topological ℝ | ℤ: inverse b↦(Σ_(i≥n) b_i)_n, e₁↦e₀+e₁; 0: identity of 0; ℝ: b_n=1/(n+1) has no null preimage since x₀−x_(N+1)=H_(N+1)→∞ | positive and negative instances behave |
| `isLightSolid_reflective_and_generator` (line 115) | none | G=∏_ℕℤ; Q=ℤ_p/δℤ_p | G(*)=ℤ^ℕ contains (1,1,…); Q(*)=0 so Hom(ℤ,Q)=0, while the class of (p^n) in Q(C) is nonzero, so a finite free object is no separator | true (RC Theorem 3.2.4(2),(12)); universe point is R04 |
| `derivedLightSolid_isRightAdjoint` (line 125) | explicit `HasDerivedCategory` | ℤ[1]; ℝ[0]; 0 | H^(−1)=ℤ is solid, so ℤ[1] is in; H⁰=ℝ is not, its reflection is 0 (RC Theorem 3.2.4(4)); 0 is in | true, the homotopy-category shadow of RC Theorem 3.2.4(5)–(6) |

**Adversarial table (README).**

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.1 values and free objects | ∅; two points; C=ℕ∪{∞} | 0; X(*)²; π₀𝕊[C](*)=⊕_Cℤ and (⊕_Cℤ)² at two points, all-one vector absent | holds |
| §1.2 unit | X=𝕊⊕Σ𝕊; X=0 | π₀=ℤ, π₁=ℤ/2⊕ℤ on both sides; 0 | holds |
| §1.2 limit Check | lim δH(ℤ/p^r) at T=ℤ_p | identity of ℤ_p is a section, not locally constant | holds |
| §1.3 Checks | e₁; singleton marked space | (1−σ*)e₁=e₁−e₀, (1−σ*)(e₀+e₁)=e₁; right shift gives e₁−e₂; cofib(id)=0 | holds |
| §1.4 N not solid | N | π₀N(*)=⊕_ℕℤ against π₀L■N(*)=∏_ℕℤ | holds |
| §1.5 free measures | S=∅, *, two points, C | 0, ℤ, ℤ², ℤ×∏_ℕℤ; P■=∏_ℕℤ | holds |
| §1.5 product tensor | 2×3; ∅×J; ℕ×ℕ | ℤ⁶=ℤ⁶; 0=0; ∏_(ℕ²)ℤ both sides | holds |
| §1.5 flatness | B=ℤ/2; B=0; ℤ/2 with itself | ∏𝔽₂ in degree 0 (2 is injective on ∏ℤ); 0; Tor₁=𝔽₂ | holds |
| §2.1 grading | ΣHℤ; cochain ℤ in degree 2 | π₁=ℤ, π₀=0; π₋₂=ℤ; agrees with StableHomotopyKTheory §5.16 | holds |
| §2.2 Check | π₀Hom(G,δH𝔽₂)(*) | ⊕_ℕ𝔽₂ (countable) against Hom_Ab(ℤ^ℕ,𝔽₂) of cardinality 2^(2^ℵ₀) | holds |
| §2.3 π_b detection | fib(𝕊→Hℤ) | π₀=0 and π_k=π_k𝕊 for k≥1, so the fiber tensored with X is (b+1)-connective | holds |
| §2.3 Check | H𝔽_p over Hℤ, p=2,3 | Tor₀=Tor₁=𝔽_p | holds |
| §2.4 action order | φ=(1,0), e₁₂, e₂₁ | (φe₁₂)e₂₁=(0,1)e₂₁=(1,0)=φe₁₁; φe₂₂=0; agrees with StableHomotopyKTheory §5.14 | holds |
| §3.2 Checks | P_n=𝕊^(n+1); ×2 on 𝕊 | ranks 1, 2, 3, kernels rank 1; 2b=1 has no integer solution | holds |
| §3.3 Check | m=1, n=2 | 2·3=6 summands | holds |
| §3.4 Checks | A=𝕊[t]; ∏ℤ⊗ℚ | π₀ of absolute tensor ℤ[t₁,t₂], balanced ℤ[t]; (2^(−n))_n has unbounded denominators | holds |
| §4.1 negative control | F(n,k)=Hℤ for k<n, J=ℕ | π₀ of colim lim is ⊕_ℕℤ; of lim colim is ∏_ℕℤ; J is not ω₁-filtered | correctly outside the hypothesis |
| §4.2 Check | B_j=ℚ with (1/n!)ℤ | (1/(j+1)!)_j lies in stage α_j=j+1; diagonal stages have bounded denominators | holds |
| §5.1 Check | A=lim δ(𝕊[t]/t^r) | cofib(t) on each stage is 𝕊⊕Σ𝕊t^(r−1), transitions zero on the second summand, limit 𝕊 | holds |
| §5.2 Checks | f=id; f=0; max(j−k,0); duplication twice | proper; {j : 0<1}=ℕ; a common target forces h≤0; outputs {4j,…,4j+3} | holds |
| §5.3 Checks | singleton blocks, A=𝕊[[t]]; I₀=ℕ | (t^j)_j at f=id, (1)_j at no stage; ∏_ℕA on both sides | holds |
| §5.4 Checks | fold map; (ηt^j) | Σt^j=(1−t)⁻¹≡1+t mod t², (1−t)(1+t)=1−t²; survivors η, ηt mod t² | holds |
| §6.2 Check | Hℤ, a_r=2^r; ideal tower | lim=ℤ₂, lim¹=0, π₋₁=0; ideal tower has lim=0, lim¹=ℤ₂/ℤ | holds |
| §6.3 Checks | normalized layer in degree 1; Σ^(−n)A in degree n | ΣM is (b+1)-connective; suspended layer A never improves | holds |
| §6.4 Checks | H𝔽_p, p=2,3; units | X/p^r=X⊕ΣX, transition diag(id,0) ([ΣX,X]=0), limit X; π₀ of units ℤ₂, ℤ₃ against ℤ | holds |
| §6.4 generator step | A=Hℤ_p, a_r=p^r | B₁ has π₀=𝔽_p, not finite free, so §5.1 does not apply | R01 |
| §7.1 Checks | D=0; D=all; perfect Hℤ-modules | completed iff A=0; L=id; ⊕_ℕHℤ is not perfect | holds |
| §7.2 Checks | non-pushout square with B′=H𝔽₂; D_B′=0 | both paths H𝔽₂ while the pushout is Hℤ; both paths 0 | holds |
| §7.3 Checks | e₁ and any f; ℚ_p with f=1/p; 𝔽₂[ε] with f=ε; εT | (1−fσ*)(e₁+fe₀)=e₁; p^n−p^(n+1)/p=0 with b₀=1; (1−εσ*)(1+εσ*)=1; (εT)²=0 | holds |
| §7.4 Checks | B=ℚ_p; B=ℤ/2 | (p^n) is a section at C, not locally constant; ∏𝔽₂ in degree 0, Tor₁(ℤ/2,ℤ/2)=𝔽₂ | holds |
| Conventions, quotient transition | a_s=a_r b_(r,s) | the square (b_(r,s), id) commutes: a_r b_(r,s)=a_s | holds |
| Downstream Habiro ranks | (q;q)₁, (q;q)₂ | degrees 1 and 3, so ranks 1, 3 | holds |

**Suppliers, gaps and order.** Every cited supplier section exists where cited with the stated content (list above); StableHomotopyKTheory and VStackSheavesAndLisseCategories were read at their open heads, GeneralizedCohomology and EnhancedDerivedSheaves on main. Both declared gaps carry the same slug in `design/plan.json` and in the README; neither is provided by the pins (no AB6 statement in pinned Mathlib; no interchange theorem in EnhancedDerivedSheaves E0.8 or E5:presentability.2), each `needs` sentence is single and precise, and each names a supplier. Depcheck output:

```text
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

**Ownership.** Object searches (null-sequence solidity, light solid abelian groups, solidification, condensed or solid spectra, cardinal interchange, countable AB6) over main, the 330 open heads (`roadmaps grep`), the 26 sibling checkouts and the board packages found no earlier owner and no fully qualified name collision. VS2.1 owns the compact-Hausdorff integer theory, a different category from the light null-test theory of §1.5. One move is recorded: `packages/RefinedTraceMethods/README.md` at 87bc3ff, §6.2 "Light condensed and solid spectra" (line 2529), still constructs Cond(Sp), the null-sequence solidity, solidification, the generator and the p-complete comparison, citing VS2 only. This roadmap is their owner because it is earlier in the merge order (line 150 against 220) and RefinedTraceMethods consumes HabiroRings, which consumes this roadmap, so the reverse supply would be a cycle. RefinedTraceMethods §6.2 must be repointed to §§1.1–2.4 and §6.4; that is a consumer-side edit, not a defect of this package. HigherHidaAndColemanTheory R23–R24 and LocallyAnalyticRepresentationsOfLocalGroups LR.3 cite "SA.1–SA.4"; the README's Downstream consumers paragraph (line 785, 787) correctly declines the idempotent-algebra, localization-triangle and group-ring requests.

**Policy.** `git diff --stat origin/main...HEAD` touches only `packages/SolidAnalyticRings/` (6 files). No pull-request number, `lemma`, `set_option`, extra import, sorry'd data, `True` placeholder or computational algorithm. Every subsection has a locator. Every Lean name appears in README §1.5, and every backticked name of this roadmap is declared. The module docstring names each non-statable headline with its missing carrier.

## Not verifiable

- The spectral foundations of §§1.4, 2.1–2.4 and 6.4 rest on texts that recall or sketch them (W §2, MW §4.1, Q B.6–B.8) and on unpublished lectures; instances were computed, but no complete written proof of, for example, colimit preservation by internal Hom from N in Cond(Sp) was available to check.
- That the universe-polymorphic compactness clause of R04 is nevertheless true (via the equivalence of the solid category with modules over the endomorphisms of its compact projective generator) was argued, not proved in Lean; R04 is raised as a signature defect, not as a falsity.
- RefinedTraceMethods and HigherHidaAndColemanTheory were read at the heads named in the board index (87bc3ff and da88512), one request each; no other unindexed head was fetched.
- The AS transcript was read only for its identification lines; it is not the sole support of any target.

## Source issues

- **Misprint** in RC at proof of Theorem 3.2.4(1) within Proposition 3.2.5, printed p.18: the source says the second entry of the image of a sequence under 1 − Shift* is a₁ minus a₁; it should be a₁ minus a₂, the entries being a_n − a_(n+1); affects nothing.
- **Misprint** in RC at proof of Theorem 3.2.4(7) within Proposition 3.2.5, printed p.19: the source says the displayed isomorphism and the solidity used involve B, an object not introduced in that step; it should be C, the given solid complex; affects nothing.
- **Misprint** in RC at proof of Proposition 3.2.5, printed p.19: the source says it now assumes properties (11) and (12) before deriving (9)–(11); it should be (12) and (13), as the statement of the proposition and the proof of (11) use; affects nothing.
- **Error** in RC at Lemma 3.3.2, printed p.20: the source says every light profinite S receives a map from P inducing an isomorphism of solidifications, which fails for finite S (S=∅ gives 0 against ∏_ℕℤ); it should be stated for infinite S, as the proof's enumeration requires; affects nothing.
- **Misprint** in RC at proof of Lemma 3.3.3, printed p.22: the source says the retract cut out by the idempotent is the solidification of ℤ[S]; it should be the solidification of the bounded-sequence group of that lemma; affects nothing.
- **Misprint** in RC at proof of Proposition 4.1.6, printed p.30: the source says the object killed by A-completion is taken in the complete category D(A); it should be taken in D(A▷), all condensed modules; affects nothing.
- **Misprint** in HTT at proof of Proposition 5.3.3.3, printed p.394: the source says the cofinal map from the nerve of the κ-filtered poset lands in the ∞-category of spaces; it should land in I, as the factorization that follows uses; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3ac1b2b", "job": "RT-SolidAnalyticRings~1b", "model": "opus", "worker": "fable-rt3"} -->
