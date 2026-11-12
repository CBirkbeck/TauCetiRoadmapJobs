<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13151#issuecomment-6783207861 -->
Review (codex) of fdbc84f

Verdict: needs_changes

1. **F01** (P2) Specify localization at a prime ideal

   **Location.** `packages/LocalFieldsRamificationPartII/README.md:448`: “every localization of an integrally closed `V`-subalgebra `A ⊆ L` is a valuation ring of `Frac A`”. The proof route repeats the unrestricted formulation at line 453.

   **Claim.** An arbitrary localization of such an algebra is a valuation ring. The correct statement quantifies over prime localizations. An integrally closed algebra of this kind is Prüfer; it need not itself be local.

   **Witness.** Take `V=ℤ_(7)` and `A=ℤ[√2]_(7)`. Its identity localization has two maximal ideals. For `x=(3−√2)/(3+√2)`, its two valuation values are `(1,−1)`; neither `x` nor `x⁻¹` belongs to `A`.

   **Exact repair.** Say “for every prime ideal `𝔮` of `A`, the localization `A_𝔮` is a valuation ring of `Frac A`”, and make the route explicitly concern `A_𝔮`. Add the semilocal example above as the negative control against replacing prime localization by arbitrary localization. Temkin's proof uses `A_𝔮` (`temkin17` line 333); the prolongation theorem likewise uses maximal ideals (`aid25` lines 366–371).

   **Repair tested.** At the two primes over 7 the normalized values of `x` are respectively 1 and −1, and each prime localization satisfies the valuation-ring alternative. Their intersection `A` fails that alternative. The missing qualifier therefore excludes exactly the demonstrated wrong interpretation without restricting the intended Prüfer theorem. This also agrees with the package's own two-maximal-ideal Check at line 458.

2. **F02** (P3) The maximal-wildness negative control does not meet the other hypothesis

   **Location.** `packages/LocalFieldsRamificationPartII/README.md:1141`: “The reverse implication requires `E/K` to be henselian: `ℚ(√2)/ℚ` at `7` has `ℚ(√2)ʰ = ℚ_7ʰ` but is not henselian.”

   **Claim.** This example demonstrates why the henselian-extension hypothesis cannot be removed from the equivalence about **maximal separable purely wild** extensions in §4.3.

   **Witness.** Here `Eʰ/Kʰ` is the identity, but is not maximal separable purely wild: `X⁷−7` gives a totally ramified separable degree-7 extension of `ℚ_7ʰ`. Thus both the proposed antecedent and conclusion are false.

   **Exact repair.** Replace this Check with `K=ℚ(t)` under the `t`-adic valuation and `E=Kʰ`. The residue characteristic exponent is 1, so `Eʰ/Kʰ` is the identity and is maximal separable purely wild. However, `E/K` is nontrivial strictly unramified, hence not purely wild and not a henselian extension. Keep the existing example at lines 1144–1149: it correctly tests reflection of pure wildness, which is a different assertion.

   **Repair tested.** `√(1+t)` belongs to `Kʰ` by the simple residue root 1 of `X²−(1+t)` but not to `ℚ(t)` (the divisor of `1+t` has odd order at `t=−1`). Thus `[K(√(1+t)):K]=2`, whereas `[Eʰ:Kʰ]=1`. Since `Kʰ⊆Kᵗ`, the nontrivial intersection excludes pure wildness of `E/K`. At residue exponent 1 there is no nontrivial purely wild enlargement of the identity over `Kʰ`. The replacement actually has true antecedent and false conclusion when the relative-henselian hypothesis is omitted.

3. **F03** (P3) Trivial endpoint valuations are not identity extensions

   **Location.** `packages/LocalFieldsRamificationPartII/README.md:1297`: “For `i = 0` or `i = d` one of the two steps is the identity and the statement is tautological.”

   **Claim.** One of the coarse or residual **field extensions** in the unramified composition criterion is an identity at either endpoint.

   **Witness.** Let `K=𝔽₂((t))`, `L=𝔽₄((t))`, `d=1`. At `i=0` both extensions have degree 2; at `i=1` their degrees are again 2 and 2. Neither endpoint supplies an identity extension.

   **Exact repair.** Replace the Check by the actual endpoint descriptions. At `i=0`, the coarse extension is `L/K` with trivial valuations and the residual extension is the original valued extension. At `i=d`, the coarse extension is the original one and the residual extension is `κ_L/κ_K` with trivial valuations. Explain that the extra endpoint condition is separability of the underlying field extension, respectively of the residue extension, and follows from unramifiedness.

   **Repair tested.** In the displayed finite-field example both trivial-valuation extensions are separable of degree 2, so both endpoint criteria are true, agreeing with `e=1`, `f=2` for the original unramified extension. An inseparable trivial-valuation extension is not unramified; the replacement does not silently discard that condition.

Three findings: one P2 and two P3. The seven previous requested repairs are applied. The acceptance test elaborates, all fourteen signatures retain their hypotheses, and none of its seven admitted theorems closed in the padding probes. The remaining repairs concern the quantifier on localization and two misleading Checks; they do not require changing the Lean theorems.

## Previous findings checked first

All references in this subsection are to the previous review's R01–R07. None was marked “not actionable in this package”; none is re-raised here.

| Previous finding | Repaired passage and independent check | Status |
|---|---|---|
| R01, duplicate valuation ownership | README lines 57–64: “are ClassicalAdicEtaleCohomology §5.1” and “is ClassicalAdicEtaleCohomology §5.3”. Contracts at lines 254–272 import both; the old owned theorem is gone. Read both sections at open PR #875's head. For a strict DVR, both descriptions give `Γ=ℤ`, separably closed residue, tame group `∏_(ℓ≠p) ℤ_ℓ(1)`; rank two gives its square. | Repaired |
| R02, henselization supplier drift | README lines 245–251: “§0.12: `henselization_at_prime`” and “§0.13: `henselization_integral_base_change`”. Lines 217–241 name the pinned constructions, local universal property, ind-étaleness, direct limits and radical comparison. Reopened the main supplier and these pinned files. | Repaired |
| R03, module flatness | README lines 553–556: “if `M` is flat as an `A`-module, then `M` is a finitely presented `B`-module”. Prüfer version is equally explicit at lines 558–573. The `A/𝔪` counterexample is now excluded by its nonzero torsion. Stacks 053E(2), line 2909, agrees. | Repaired |
| R04, root threshold | README lines 1083–1089: “monic of degree `n ≥ 1`”, “the Gauss valuation, with `v(0) = ∞`”, and “for every tolerance `ε` with `0 < ε ≤ ε_{f,g}`”. Constants are separated at lines 1090–1091. Recomputed all four quantitative Checks against cks23 Theorem 16. | Repaired |
| R05, two false controls and API form | README lines 327–329 now use the reversed-inclusion model for `P=∅`; lines 1144–1149 explicitly restrict reflection of pure wildness to henselian extensions. §0.2 now has five API bullets. Zero is rejected for empty support even without positivity, but accepted by the positivity-free all-primes predicate. The newly identified maximality Check is R02 above, not the repaired pure-wildness Check. | Repaired |
| R06, organization | README lines 298–304: “the build has two independent branches” and “it uses only Layers 1 and 2 and none of Layers 3–4”. Layer 5's introduction and layer dependency endings agree. This implements the earlier review's explicit parallel-branch option; it invents no edge from approximation to composition. | Repaired |
| R07, import header | Suggested.lean starts with ordinary `import Mathlib`, followed by the two used individual Tau Ceti imports. There is no `module`, public-section wrapper or `set_option`. Re-elaboration succeeds. | Repaired |

The previous review's F01 domain-algebra repair and F02 pro-`p`-kernel lifting repair also remain in place. The Boolean-ring example still excludes the erroneous local-to-global finite-presentation argument. The lifting route still uses the kernel's finite images, and the inverse-limit assembler has no pro-`p` assumption on the covering group.

## Verified sound

**Coverage.** Read all 42 numbered target subsections, the conventions, supplier contracts, API/Check lists, examples, fourteen Lean declarations, metadata, all ten manifest entries, the previous review and repair report, board package index, overlap leads and library near-matches. Rechecked every changed mathematical passage and the fifteen seeded targets. For unchanged material, reused the previous review's computed adversarial rows only after matching the present statement; no uncomputed summary was treated as verification. The compact table below contains fresh computations for the sample, all seven headlines, changed mathematical passages and the findings. Read main SchemeAndStackFoundations and completed ProfiniteProPGroups and LocalFieldsRamification for supplier contents and roadmap shape.

**Principles and shape.** This is a genuine Part II extending the complete discrete finite-residue-field scope to arbitrary Krull valuations. No good-prime restriction, route-specific substitute, computational algorithm, copied source passage, sorry-valued data, free predicate placeholder, `set_option`, admitted example or `lemma` was found. The layer order now explicitly presents two prerequisite branches feeding the final theorem. All seven layers have Examples and Dependencies endings. Definitions have API lists and at least three Check cases, sometimes shared or tested again by a consuming target; R02/R03 identify the remaining defective controls. The fourteen own backticked declaration names match the fourteen Lean declarations. No process dates, PR numbers, machine paths or HTML anchors occur in the package's roadmap text. Metadata is the single `math.NT` topic. The ten works cited are present under their existing manifest keys; no source fetch or manifest change was necessary.

**Elaboration and signatures.** Ran the prescribed `lake env lean` command on `packages/LocalFieldsRamificationPartII/Suggested.lean` from the pinned content checkout: exit 0, exactly seven warnings, all “declaration uses `sorry`”, at lines 105, 113, 128, 145, 160, 171 and 181. The two imported Tau Ceti object files were present; no build was needed. A scratch copy with `#check @...` for all fourteen declarations also exited 0 with the same warnings. Compared every printed type to its README claim and the supplied signatures: no hypothesis disappeared. In particular the KPR theorem retains `[HenselianLocalRing V]`; the section theorem retains compactness, topological-group structure and total disconnectedness on both groups; Abhyankar retains `[vK.HasExtension vL]`; height retains `Algebra.trdeg K L = n`; the characteristic-p theorem retains both primality and characteristic p. The native totally-disconnected topological-group setting supplies the separation needed by the profinite arguments; the theorem is not about arbitrary non-Hausdorff compact spaces.

An initial scratch invocation from the board, rather than the content checkout, stopped because no toolchain was configured there; the successful package, signature and probe runs above all used the required content checkout. All Lean processes finished.

**Padding probes.** In a scratch copy, replaced each of the seven `sorry`s with alternatives that require a single `rfl`, `infer_instance`, `simp`, `simp_all` or `assumption` to close the goal. All seven failed; the reported final alternative failed at probe lines 113, 131, 149, 174, 188, 204 and 220. Read the relevant near-match declarations at the pin. None supplies a one-lemma `exact` proof: `AlgebraicIndependent.sumElim` requires independence over an adjoined coefficient algebra, not value/residue independence; the existing projectivity lifting theorem requires a pro-p covering group; `IsSepClosed` and perfect-field comparisons do not identify the prime-supported predicates; Krull-dimension bounds for ideals do not bound valuation height by relative transcendence degree. No padding found, and no deletion from Suggested.lean is requested.

**Headline inventory.** All statable summary headlines are present:

| README headline | Suggested.lean declaration or documented carrier gap |
|---|---|
| Characteristic-p absolute Galois dimension, §3.1 | `cohomologicalDimensionAt_absoluteGaloisGroup_le_one` |
| Continuous sections through pro-p kernels, §3.2 | `exists_continuous_section_of_isProP_ker` |
| Henselian KPR splitting, §3.6 | `sup_galoisTamePart_eq_top_of_henselian`; together with its explicit disjointness hypothesis this is the stated tensor splitting |
| Elementwise Abhyankar and height bound, §5.3 | `algebraicIndependent_of_valuation_independent`, `ringKrullDim_le_ringKrullDim_comap_add` |
| Arbitrary-height tameness, §6.4 | `isTameField_of_isPClosed` |
| Separable tameness export, §6.5 | `isSeparablyTameField_of_isSeparablyPClosed` |
| Non-henselian height-one splitting, §4.4 | Named in module docstring: general wild inertia and its tame fixed field are absent at the pins |
| Valued henselization, tensor decomposition and decompletion, §§1.3–1.4, 4.2 | Named in module docstring: ring/pair henselization exists, but the valued fraction-field construction does not |
| Composition criteria, §§5.4–5.6 | Named in module docstring: general non-henselian unramified/tame extension carriers need that valued henselization |

The seven definitions have real bodies on native carriers. Finite Galois inertia is an appropriate way to state the two field-tameness predicates; it does not misidentify the non-henselian tame closure. No statable summary headline was found missing or replaced by a stand-in.

**Sources: seeded sample.** These are source-text checks, with printed or explicitly identified author-copy pages rather than PDF indices. No extra locator is marked unverified by the author. Serre remains the one unread primary source in the sample, as explicitly settled by the manifest.

| Sampled target | Locator inspected | Result |
|---|---|---|
| 0.4 Maximal prime-supported extensions | temkin17 §2.1.1, p. 103, lines 256–270; Theorem 2.6.6 proof, p. 112, lines 625–632 | Supports Zorn maximality, closedness and the positive-characteristic perfection deduction. Separable variant is obtained inside the separable closure. |
| 0.5 Split towers | temkin17 §2.1.2, p. 103, lines 272–274 | Exactly disjointness plus compositum; factor maps in the README remove an unmarked-isomorphism ambiguity. |
| 2.1 Étale criterion | temkin17 Lemma 2.3.8, pp. 105–106, lines 350–383; ega4 17.7.5(iv), pp. 73–74, lines 2750–2758; 17.7.7, pp. 74–75, lines 2795–2798 | Finite extension; essentially étale equivalence; finite-height promotion to étale; source-descent hypotheses retained. |
| 2.3 Unramified/strict | temkin17 §§2.2.3, 2.3.7, pp. 104–105, lines 290–292, 344–349 | Henselian unramified classification and general definition agree; strict means unchanged residue, not separably closed residue. |
| 2.5 Henselian extensions | temkin17 Lemma 2.3.11, p. 106, lines 388–396; ega4 18.6.14(ii), p. 141, lines 5616–5619 | Unique prolongation iff disjoint from henselization; filtered colimit uses local transition maps. |
| 2.6 Total/pure wildness | temkin17 §§2.2.4, 2.2.7, p. 104, lines 293–310; §2.3.12, p. 106, lines 397–401 | Includes inseparable residue and defect; general relative-henselian hypothesis retained. |
| 2.7 Tame fields | temkin17 §2.3.9, p. 106, lines 384–387 | Tame means algebraic closure equals tame closure, hence perfect; no henselian assumption added. |
| 2.10 Perfection | temkin17 §2.4.6, p. 108, lines 469–470; Theorem 2.5.5 proof, p. 110, lines 544–546 | Galois comparison respects inertia and tame compositum. Degree preservation and residue/value hulls are the stated purely inseparable deductions. |
| 3.2 Pro-p-kernel sections | serre-cg I §3.4 Proposition 16, unread; kpr86 p. 44, lines 230–245 | KPR explicitly applies the general pro-p-kernel theorem, including the relative subgroup form; does not certify unread Serre pages. |
| 3.4 Complements | temkin17 Lemma 2.4.4, pp. 107–108, lines 430–449 | Both tensor splittings and residue/value maximality arguments match. |
| 5.3 Abhyankar/height | kkv16 Lemma 2.1, author p. 6, lines 238–242; inequality (12), author p. 8, lines 358–365; temkin17 p. 112, lines 633–638 | Correct value/residue independence; finite-transcendence-degree height consequence. The sharper relative-height bound is justified by the README's convex-chain argument. |
| 6.1 Residue/value control | temkin17 Theorem 2.6.6 proof, p. 112, lines 625–632 | Supports residue closedness and p-divisibility. Lifting monic polynomials and the characteristic-zero coarsening case are spelled out. |
| 6.2 Finite-height tameness | same proof, lines 625–632; Corollary 2.6.4, lines 612–620 | Induction uses two strictly smaller heights and the final residue prime. |
| 6.3 Descent | same proof, lines 633–638 | Relative algebraic closure preserves finite transcendence degree, not necessarily finite generation; finite degrees survive regular base change. |
| 6.5 Separable export | temkin17 Lemma 3.2.5, p. 116, line 796; Remark 2.4.7, p. 108, lines 478–483 | Full P-tameness plus the explicitly supplied perfection comparison gives the claimed separable form, including imperfect K. |

Additionally read the repaired root statement at cks23 lines 610–625 and 637–730 (Theorems 14/16 and Example 15, author pp. 12–15); flat-module homogenization at stacks-more-algebra lines 2879–2919 (053D/05GS/053E); valuation-ring henselization at lines 17762–17806 (0ASJ/0ASK); normalization at aid25 lines 306–308, 366–379 and 515–535; KPR Theorems 2.1–2.2 and their proof at kpr86 pp. 42–44; and the composition proof at temkin10 lines 520–549, author pp. 11–12. These checks introduce no source request.

**Computed adversarial table.** “True/false” below refers to the stated predicate, with the numerical, field or group values that determine it. The prime-local qualifier in R01 and the two Check replacements are tested here as well.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| 0.1 definition and repaired control | P=∅; all primes; {3}; n=0,1,6,9 | Empty-support predicate gives false,true,false,false; positivity-free all-primes predicate accepts 0, actual predicate rejects 0; {3} rejects 6 and accepts 9. | Repaired control discriminates. |
| 0.2 extension/tower API | ℚ⊂ℚ(∛2)⊂ℚ(∛2,ζ₃) | Degrees 3,2,6; for P={3}, tower conclusion false and conjunction true∧false=false; two cubic fields have compositum degree 6. | No implicit Galois/compositum closure. |
| 0.3 closedness definitions | Finite fields; separable closure F of 𝔽_p(t); empty support | Finite fields have separable degree-ℓ extensions; F has no separable degree>1 extension but adjoining t^(1/p) has degree p; empty support tests only 1. | Full/separable definitions differ correctly. |
| 0.4 maximal extensions | Empty support, all primes, {3} | Maximal fields K, Kᵃ, and a field containing a degree-3 cubic but excluding its degree-6 normal closure; in char p a missing p-th root has degree p. | Zorn and perfection claims survive. |
| 0.5 split towers | ℚ(√2,√3); two S₃ cubic fields | First tensor dimension 2·2=4 equals compositum degree 4; second tensor dimension 3·3=9 differs from degree 6 despite intersection degree 1. | Linear disjointness is essential. |
| 1.1 localization quantifier | A=ℤ[√2]_(7), identity and prime localizations | Two maximal ideals; x=(3−√2)/(3+√2) has value pair (1,−1), inverse (−1,1); neither is in A. Each A_𝔮 admits one of them. | R01. |
| 1.2–1.4 repaired henselization interfaces | Field; ℤ_(p); ℚ(√2)/ℚ at 7; inseparable degree p | Value groups 0→0 and ℤ→ℤ, residues unchanged for ordinary henselization; split quadratic tensor has 2 field factors, total degree 2; inseparable tensor has 1 field factor, degree p. | Native ring constructions support valued targets. |
| 1.5 repaired module/algebra route | Value group ℚ, B=A, M=A/𝔪; M=A; M=0; Boolean quotient | 𝔪 has no least positive generator value; A/𝔪 cyclic but non-f.p. and nonflat; A rank 1 and 0 rank 0 are flat/f.p.; Boolean quotient locally 0 or 𝔽₂ but globally non-f.p., base not a domain. | Correct flatness hypothesis and domain boundary. |
| 2.1 étale iff | Identity; ℚ_p(√p); 𝔽₂((t)) identity | Identity: e=f=1, étale true. Radical: e=2, (p)⊊(√p), essentially étale false. Strict identity residue is 𝔽₂, not separably closed. | Both directions agree. |
| 2.2 repaired imported tower | Trivial valuation; strict henselian DVR; rank-two Γ | Trivial: D=G, I=W=1, Kᵘ=Kᵗ=Kˢ. DVR tame character group ∏_(ℓ≠p)ℤ_ℓ(1); rank two gives its square; p=1 gives W=1. | Same values as earlier owner. |
| 2.3 unramified/strict | 𝔽_(p^r)((t))/𝔽_p((t)); Kʰ/K | e=1, f=r: unramified=true, strict iff r=1; henselization has residue degree 1, strict=true. | Correct relative definition. |
| 2.4 finite-inertia predicates | ζ_p (odd p), Q₂(i), ζ_(p²), unramified degree p | Inertia orders p−1,2,p(p−1),1; coprimality true,false,false,true. The last decomposition group has order p, distinguishing it from inertia. | Native predicate excludes wildness. |
| 2.4 galoisTamePart | Henselian K; S₃ example X³−X−2 over ℚ at 2 | Henselian: galoisTamePart=Kᵗ. In S₃, wild image C₂ has normal closure S₃; a cubic subfield lies in Kʰ while normal tame part intersects the splitting field in ℚ. | Largest Galois tame part is not general Kᵗ. |
| 2.5 relative henselianity | ℚ/ℚ; ℚ(√2)/ℚ at 7; purely inseparable degree p | Prolongation counts 1,2,1; tensors with Kʰ have 1,2,1 field factors. | Both directions of disjointness criterion survive. |
| 2.6 total/pure wildness | 𝔽_p(u^(1/p))((t)); a^p−a=t⁻¹; tame radical | First e=1,f=p with inseparable residue: total/purely wild true; AS has v(a)=−1/p,e=p,degree p; tame radical e=ℓ≠p is total but not purely wild. | Does not substitute f=1 for general total ramification. |
| 2.7 tame field definitions | Trivial 𝔽_p(t), algebraically closed K, ℚ_p | First inertia 1, separably tame true, perfect/tame false; algebraically closed both true; ℚ_p has inertia divisible by p in ζ_(p²), both false. | Perfection distinguishes full tameness. |
| 2.10 perfection | 𝔽_p(t), t-adic; tame radical; AS extension | Γ changes ℤ→ℤ[1/p]; ℓ-radical degree remains ℓ; AS degree remains p and becomes immediate over the perfect hull, hence is still not tame. | No loss of wild separable degree. |
| 3.1 dimension headline | 𝔽_p, separably closed char-p field, ℚ_p | cd_p values 1,0,2 respectively; first two ≤1, last violates CharP hypothesis. | No characteristic-zero overclaim. |
| 3.2 section headline/route | S₃→C₂, p=3; C_(p²)→C_p; Ẑ→∏_(ℓ≠p)ℤ_ℓ | S₃ kernel C₃, cd₃(C₂)=0, transposition gives section; cyclic quotient has no order-p lift and cd_p=∞; third kernel ℤ_p, cd_p target=0, section g↦(0,g). | Nonabelian, nonsplit and non-pro-p-source cases covered. |
| 3.4 complements | Trivial valuation; ℚ_p | First tensors K⊗Kˢ=Kˢ, Kˢ⊗K=Kˢ. For ℚ_p, unramified complement has residue 𝔽_pˢ and radical complement value group ℤ with all prime-to-p denominators adjoined. | Both factor maps and disjointness retained. |
| 3.6 KPR headline | Residue exponent 1; separably closed imperfect henselian K | First Kᵗ=Kᵃ,E=K; second Kᵗ=K,E=Kᵃ. Both suprema are Kᵃ and tensors have the asserted whole field as image. | No conclusion inserted into maximality hypothesis. |
| 4.1 repaired tolerance | f=g=X²−1 over ℚ₂; f=X,g=X−2 | Quadratic kras=1, bound=∞; tolerance 1 gives distances ∞,1 and 2 roots, tolerance 2 gives 1 root. Linear bound=1 equals distance value 1. | Strict uniqueness and non-strict distance correct. |
| 4.1 γ* and zero degree | f=X²−1/16,g=f+2X; f=g=1 | γ*=−2, Gauss difference=1, threshold=−3/2; root-distance values are 0 or −1, below the incorrect 1/2. Constants have 0 roots; threshold is not formed. | Repaired checks exclude both wrong models. |
| 4.3 maximality Check | Original Q at 7; replacement Q(t), E=Kʰ | Original henselized identity has a degree-7 purely wild enlargement, so RHS maximality=false. Replacement p=1, henselized degree=1 and maximality=true, while K(√(1+t))/K has degree 2 inside E, so E/K pure wildness=false. | R02. |
| 4.3 repaired reflection Check | ℚ(p^(1/ℓ))/ℚ at p, ℓ≠p; Q(√2) at 7 | First has one prolongation, e=ℓ both before/after henselization, not purely wild; second has 2 prolongations, becomes degree 1 after henselization. | Previous R05 repair remains valid. |
| 5.1–5.2 composition/height | ℚ_p((t)), composite; field; DVR | v(t)=(1,0), v(p)=(0,1), v(p⁻¹)=(0,−1); convex kernel second ℤ; heights 2,0,1 respectively; composite exponents 1,p. | Map direction, sign and height agree. |
| 5.3 Abhyankar headline | 𝔽_p(t) t-adic and Gauss; empty families; x=0 | rr+residue trdeg=1+0=1 and 0+1=1; empty family has size 0; x=0 fails hx at exponent vector (1), since zero is a base value. | Correct total-function and empty-index behavior. |
| 5.3 height headline | ℚ(t) composite; algebraic extension; trivial base | 2=1+1; n=0 gives unchanged height; trivial base gives bound height≤trdeg. Infinite base height makes RHS ∞. | No lost finiteness hypothesis. |
| 5.4 endpoint Check | 𝔽₄((t))/𝔽₂((t)), d=1 | i=0: coarse degree 2, residual degree 2; i=1: coarse degree 2, residual degree 2; e=1,f=2 throughout original extension. | R03; criterion itself true. |
| 5.5–5.6 composition | ℚ_p((s))/ℚ_p((t)), s^p=t | Coarse tame=true (residue exponent 1), residual identity=true, coarse quotient ℤ/p; fine tame=false. Base coarse group ℤ is not p-divisible. | Final residue prime is essential. |
| 6.1 value/residue control | Algebraically closed mixed-characteristic K; ℚ_p | For algebraically closed K, Γ/pΓ=0 and residue has no degree-p extension. For ℚ_p, Γ/pΓ=ℤ/p and X^p−p has degree p, so hypothesis=false. | Positive-prime root argument consistent. |
| 6.2 induction | Heights 0,1,2 | Height 0: perfect field/inertia 1; height 1: splitting branch; at d=2, i=d−i=1 and coarse Γ/pΓ=0 by 6.1. | Both induction parameters decrease. |
| 6.3 descent | K algebraic over prime field; K=algebraic closure of ℚ(t), L=K | First K₀=K, height≤1. Second choose K₀=ℚ̄ inside K, trdeg(K₀/ℚ)=0, L₀=K₀, descended degree 1, tensor K₀⊗K=K. | No finite-generation claim after relative closure. |
| 6.4 final headline | Residue exponent 1; trivial p-closed field; ℚ_p and 𝔽_p((t)) | Support ∅ at exponent 1, hypothesis true and inertia prime to 1; trivial case reduces to perfection. Last two have degree-p extensions, hence hypothesis=false. | General valuation and small-prime cases retained. |
| 6.5 separable headline | F=(𝔽_p(t))ˢ; P=∅; 𝔽_q((t)) | F has separable degrees only 1 and inertia 1, but inseparable degree p remains; P=∅ makes residue-membership false; AS degree p rejects closedness for Laurent series. | Imperfect-field and empty-set boundaries correct. |

Unchanged targets not individually reproduced in this compact table were checked against the previous round's computed rows: §1.3, the six tower/union laws (§2.8), the local comparison (§2.9), prescribed maximal extensions (§3.3), splitting equivalences (§3.5), decompletion and height-one splitting/tameness (§§4.2, 4.4–4.5). The local Frobenius convention also recomputes concretely: on `ℚ₂(ζ₇)`, arithmetic Frobenius is `ζ₇↦ζ₇²`; its inverse is `ζ₇↦ζ₇⁴`. The S₃ polynomial has discriminant −104, one simple root mod 2 and a ramified quadratic factor, so its decomposition/wild image C₂ is nonnormal. These confirm the unchanged map and normality conventions rather than merely repeating a soundness label.

**Pinned declaration and duplication evidence.** Content main is `5fc1aa8fb5158b49283293de7401899b6efc359b`; the manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened the definitions and hypotheses at those copies, including:

- `Mathlib/RingTheory/Valuation/ValuationSubring.lean:37`, 161, 232, 284, 298, 327, 334 and 854: valuation subring, value group with zero, overrings/coarsenings, prime correspondence and restriction. The native valuation-subring axiom is the alternative that an element or its inverse belongs; it includes no henselianity, completeness, rank or residue-perfection requirement. R01 explicitly tests this axiom.
- `Mathlib/RingTheory/Valuation/RamificationGroup.lean:29` and 49: decomposition is a stabilizer, inertia the kernel of the residue action. No wild subgroup or general tame fixed field occurs in that module. `Extension.lean:68`, 134, 169, 197 and 243 supply restriction equivalence, integer/subring algebras, local residue maps and value-group maps; `RankOne.lean:56` includes nontriviality.
- `Mathlib/FieldTheory/LinearDisjoint.lean:158`, 699, 716; `PurelyInseparable/Tower.lean:97`; `PurelyInseparable/Basic.lean:322`: genuine disjointness, the algebraic tensor-field theorem, separable/purely-inseparable disjointness and finite prime-power degree. `LinearDisjoint.lean:732` transports disjointness under isomorphisms; it is not the asserted split-tower tensor isomorphism.
- `Mathlib/NumberTheory/SmoothNumbers.lean:45` and 75 use a **finite** prime-support set. `IsPNumber` has arbitrary set support and explicitly rejects zero, so it is not a duplicate of that finite-support API. `FieldTheory/IsSepClosed.lean:65` and `Perfect.lean:289` are stronger/different native predicates, not the prime-supported closedness definition.
- `Mathlib/Analysis/Normed/Field/Krasner.lean:56`, 63 and 73 require the stated separable/splitting hypotheses, and completeness for the supplied existence theorem. The incomplete henselian rank-one bridge remains additional mathematics.
- `Mathlib/RingTheory/Flat/TorsionFree.lean:125` supplies precisely the Prüfer-domain flat iff torsion-free input. `RingTheory/FinitePresentation.lean:44` and `Algebra/Module/FinitePresentation.lean:68` are the algebra/module presentation predicates. `Etale/Basic.lean:205`, `Etale/Descent.lean:79` and `Finiteness/Descent.lean:98` supply finite-presentation étaleness and tensor **base-change** descent, not the declared source-descent gap.
- `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45`, `Transcendental.lean:168` and 199; `RingTheory/DiscreteValuationRing/TFAE.lean:243`; `FieldTheory/AbsoluteGaloisGroup.lean:42`: transcendence degree, sum-family independence, DVR dimension and the absolute Galois group. None is an exact proof of the seven retained headlines.
- `TauCeti/RingTheory/Henselization/Algebra.lean:43` and 47; `Henselian.lean:154`; `Lift.lean:130` and 155; `Local.lean:60`, 79, 85 and 104; `Map.lean:50`; `IndEtale.lean:47`; `DirectLimit.lean:153`; `Radical.lean:42`: every repaired henselization name exists with the asserted meaning. The direct-limit comparison uses directed systems of pairs and their generated limit ideal; the radical comparison requires equality of radicals. `TauCeti/RingTheory/Etale/IndEtale.lean:94` supplies flatness.
- `TauCeti/RingTheory/StrictHenselization/Algebra.lean:75`, 79 and 175; `Henselian.lean:45`; `Lift.lean:166`; `Map.lean:124`; `FromHenselization.lean:74`: pointed colimit, stage representation, henselianity, pointed lift, functoriality and ordinary-to-strict comparison. These are ring constructions, not the missing valued-field henselization.
- `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68`; `Sylow/Basic.lean:62`, `Existence.lean:102`, `Conjugacy.lean:42` and 48, `Functoriality.lean:52`, `CohomologicalDimension.lean:95`: pro-p finite quotients, Sylow existence/conjugacy/normal uniqueness, surjective transport and Sylow dimension equality. No finite-generation hypothesis was imported.
- `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:131`, 146 and 194: all discrete p-primary coefficients, extended-natural dimension and its vanishing comparison. `TauCeti/Topology/Algebra/Group/Profinite/EmbeddingProblem/PGroupKernel.lean:85`, 172; `CohomologicalDimension.lean:64`; `Level.lean:85`; `Compatible.lean:41`; `Projective.lean:150`, 197, 204; `Lift.lean:35`; and `TauCeti/Topology/Algebra/Group/ClosedSubgroup.lean:208` are the exact inputs of §3.2. Read the minimal-closed-subgroup compatibility argument: changing the source assumption to a kernel assumption is justified by the finite image of `H∩ker f`, not by assuming `E/U` is a p-group.
- `TauCeti/Algebra/Order/Group/ConvexSubgroup.lean:83`, `TauCeti/RingTheory/Valuation/Coarsen.lean:103`, `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:327`, 340 and `TauCeti/NumberTheory/LocalField/RamificationIndex.lean:161` provide the convex, Galois and local-field comparison notions. The function-field Abhyankar module concerns ramification in composita, not the value-rank/residue-transcendence inequality.

The supplied near-match list was used as leads, not as evidence of absence. Object searches covered prime-supported field extensions, wild/tame fields, KPR splitting, valuation henselization, the rank/transcendence inequality and flat finite presentation in the pinned libraries, main roadmaps and indexed open heads. No additional owner collision or identical fully qualified declaration was found. In particular this roadmap owns the general-valued-field extension beyond the local-field owner, while it now consumes the already-owned strictly henselian character theorem.

**Supplier and overlap audit.** Read the board package index before any absence claim. Resolved each named supplier against main or the eligible open new-roadmap head, not an open revision substituted for main:

| Supplier / overlap | Present resolution and comparison |
|---|---|
| SchemeAndStackFoundations | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1160`, 1168 and 1208: §§0.12–0.13 contain exactly the three consumed planned targets. Pinned replacements listed above handle the former nonexistent names. |
| ClassicalAdicEtaleCohomology, open PR #875 | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:2865`, 3071: §§5.1 and 5.3 own arbitrary-rank strict localization and tame inertia. The package's new contracts import these at the same generality. |
| LocalFieldsRamification | Main `Completed/LocalFieldsRamification/README.md:576`, 724 and Layer 4: unramified/tame/wild predicates, e·f and arithmetic Frobenius. Only the general/local comparison is retained here. |
| ProfiniteProPGroups | Main `Completed/ProfiniteProPGroups/README.md:1094`, 1131–1165 and 1316–1325 resolves Layers 5–6 and the six finite-embedding/lifting steps. The already-pinned pro-p-source theorem is narrower than this package's pro-p-kernel section theorem. |
| ProfiniteCohomology | Main `TauCetiRoadmap/ProfiniteCohomology/README.md:4125`, 4130 maps the two legacy cd names to pinned declarations, with the nonzero-prime condition satisfied here. |
| AdicCoefficientsAndComparisonsPartII, PR #1796 | `TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md:18`, 94 imports this package's pointwise theory; it owns globalization over compact valuation sets and alterations. No reverse supply. |
| QuadraticFormInvariantsPartII, PR #1834 | `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:83`, 333–342 imports valued henselization, decompletion and Abhyankar. No competing ownership. Its GF labels refer to the retained plan layers. |
| EtaleDualityAndPerverseSheavesPartII, PR #1743 | `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:146` imports the strictly henselian tame quotient from ClassicalAdicEtaleCohomology. This agrees with the repaired owner. |
| DiamondEtaleCohomology, PR #922 | Scope and §C8.35 concern a valued-field action's wild kernel and prime-to-p cohomology after quotienting; they do not own the pro-p-kernel section theorem. |

The supplied overlap computation lists no conflicting head, dropped cited id, or id defined only by an open revision. No such conflict emerged from the inspected heads. The removed old §2.2 is not a numbered citation in either identified consumer; their retained GF layer/plan references do not establish a deletion requiring another mapping. `roadmaps resolve` found no missing cross-roadmap citation or roadmap Lean name; its output expressly did not check pinned library names, which were checked separately as above.

Ran the prescribed dependency gate. Exact output:

```
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Read every Needs line separately: the repaired ClassicalAdicEtaleCohomology edge points to the earlier supplier; internal definition dependencies of §2.1 do not cycle back from §2.3; the two branches have no invented dependence. No unowned prerequisite or supplier drift was established beyond the findings above.

**Declared gap.** `source-side-fpqc-descent` occurs in `packages/LocalFieldsRamificationPartII/README.md:252` and `packages/LocalFieldsRamificationPartII/design/plan.json:3236`, with SchemeAndStackFoundations Layer 1 §1.1 as owner and matching needs. The two clauses are the finite-presentation and étaleness steps of the same source-descent contract; both carry the required hypotheses. The base-change descent lemmas at the pin do not already supply it. EGA locators match the readable text. The gap remains a declared supplier contract, not a finding; this needs-changes verdict is not conditional acceptance.

## Not verifiable

- `serre-cg`, I §3.4 Proposition 16 and II §2.2 Proposition 3/Corollary 1: settled uncertified/paywalled. Read KPR's corroborating use at p. 44, but did not inspect or certify Serre's primary pages. No renewed request.
- `rg71`, Corollaire 3.4.7: settled uncertified/paywalled. Temkin's application and the independent Stacks homogenization route were readable; the primary corollary remains uncertified. No renewed request.

All other sampled sources were available in the supplied legal cache. No package input file was modified, and no source entry was added or rewritten.

## Source issues

- **Misprint** in temkin17 at Lemma 2.3.2, printed p. 104: the source says tensor factors are indexed by isomorphism classes of valued extensions with fixed underlying field; it should be distinct prolongations on that field; affects a stated result.
- **Misprint** in temkin17 at Lemma 2.3.4, printed p. 105: the source says all localizations are valuation rings; it should be localizations at prime ideals, as used by its proof; affects a stated result.
- **Error** in temkin17 at §2.4.6(4), printed p. 108: the source says arbitrary valued fields admit the quotient and semidirect-product formulation; it should be restricted to normal wild inertia, or replaced by subgroup factorization; affects a stated result.
- **Misprint** in temkin17 at proof of Lemma 2.6.3(ii), printed p. 112: the source says the relevant prime equals the coarse residue characteristic; it should be the final residue characteristic exponent; affects the proof.
- **Misprint** in temkin17 at proof of Theorem 2.6.6, printed p. 112: the source says the rank-one input is Corollary 2.5.6(ii); it should be Corollary 2.5.6, which has one assertion; affects nothing.
- **Misprint** in cks23 at proof of Theorem 16(a), author p. 13: the source says g−f is monic when the degrees differ; it should be its leading coefficient is 1 or −1, hence has valuation zero; affects nothing.
- **Misprint** in cks23 at proof of Theorem 16(c), author p. 14: the source says the root-distance value is strictly above the threshold; it should be at least the threshold, as in the statement; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "fdbc84f4aa5a828c46822caa5b81392e119e52ba", "job": "REV-PKG-LocalFieldsRamificationPartII~3", "model": "gpt-6-astra", "worker": "chris-4"} -->
