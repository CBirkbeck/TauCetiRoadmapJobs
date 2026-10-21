# QWittVectors design repair

F03 is applied. F02 is disputed by the prescribed passing design gate. F01 is not actionable in this package: the six declared supplier gaps require external owner work. This report does not certify those contracts as supplied or replace the independent review.

## F01 (P1) — not actionable in this package: actual supplier contracts require edits outside the permitted files

The six interfaces already have `gap:<slug>` dependencies and `gaps` records naming supplier, required section and `needs`. Creating supplier sections or Part II roadmaps cannot be settled by editing this package. The gaps remain explicit; no actual supplier section is invented, no endpoint is weakened, and no generic theory is replanned here.

The read-only main repository is `0e8b058a97cc4f9401d2679313e0e937761c1024`. Its roadmap inventory and the board package inventory contain no files for HabiroCyclotomicCompletions, DerivedDeRhamCohomology, PrismaticCohomology, DerivedModuleAlgebraPartII or DGAInfinityPartII. The three empty supplier section arrays remain empty. The descriptive `section` fields in the gap records specify required interfaces, not existing contracts.

| Existing gap | Evidence checked | Required owner action |
| --- | --- | --- |
| `gap:cyclotomic-contract` | Wagner Lemmas 2.1–2.2, wagner line 305 and wagner line 320; completion overlap at wagner-habiro line 647. Polynomial divisor products do not alone provide integral ideal intersections or completion topology. | HabiroCyclotomicCompletions must supply inspectable ideal, intersection, local factorization and topology sections. |
| `gap:ordinary-derham` | Wagner Definition 3.1, wagner line 1822, and the Cartier cycle argument, wagner line 3584. Degree-one Kähler basis transport does not supply the exterior DGA, étale differential extension or relative Cartier theorem. | DerivedDeRhamCohomology must supply these arbitrary-base interfaces, retaining strict alternation at 2 and the relative twist. |
| `gap:cohomology-completion` | Wagner Lemma 4.25, wagner line 3198, permits arbitrary cochain complexes and degree-dependent bounds. `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1808` supplies quotient-tower comparisons and a finite-cohomology comparison; `:2006` treats complete Tor-amplitude. Neither states this unbounded theorem. | DerivedModuleAlgebra, Part II, must supply the extension and identify where the base roadmap stops. |
| `gap:prismatic-frobenius` | Wagner Lemma 4.32, wagner line 3459, uses q-PD comparison and Frobenius décalage. Section 4.34, wagner line 3492, additionally needs δ-compatible PD presentations and multiplicative crystalline Poincaré comparison. Bhatt–Scholze Theorem 15.3 and Theorem 16.22, bhatt-scholze line 3898 and bhatt-scholze line 4378, support the mathematics. | PrismaticCohomology must supply actual contracts covering both §§9.6 and 9.7. F03 corrects the framing hypothesis in this existing gap. |
| `gap:dga-bockstein` | The construction and parameter maps occur at wagner line 3026 and wagner line 3178. `TauCetiRoadmap/DGAInfinity/README.md:293` supplies associative DG carriers and cohomology, without the regular-parameter Bockstein construction. | DGAInfinity, Part II, must supply the construction, signed derivation and parameter-change laws, with its base-roadmap boundary. |
| `gap:dga-quotient` | The least differential ideal and quotient occur at wagner line 1977. DGAInfinity Layer 1 does not state their construction or universal property; its Layer 7 quotients DG categories by subcategories. | DGAInfinity, Part II, must supply generated differential algebra ideals and their quotient universal property. |

GitHub code search located the relevant pinned candidates; their files were then read at the manifest commits:

- Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`: `Polynomial.prod_cyclotomic_eq_X_pow_sub_one` and `Polynomial.prod_cyclotomic_eq_geom_sum`, in `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`, assert polynomial product identities over commutative rings for positive indices. They remain direct imports.
- Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: `TauCeti.kaehlerBasisOfFormallyEtale`, in `TauCeti/RingTheory/Kaehler/FormallyEtale.lean:67`, transports a degree-one basis under a scalar tower and formal étaleness. It imposes no finite-module condition.
- At that Tau Ceti pin, `TauCeti.explicitBockstein1`, in `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean:92`, maps continuous H¹ to H² with mod-two coefficients. `TauCeti.integralBockstein`, in `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Integral.lean:136`, has integral continuous-cohomology codomain. These are different carriers from a regular-parameter DGA Bockstein.

The specified open siblings were checked at their actual heads: ArithmeticDynamics `1921611a7a96ac19fb15c2b1291b35958c3ef0cb` (README blob `05bc3fc0bc4c41103081d7ead52c8a4a9d39aa95`) and ErdosProgressionPowers `e101259371172a32b3dd13e926676ae33b6af5cd` (README blob `4c16df24893ccac630ed2aeb61b0a4dc617520a0`). Their scope and whole-text searches do not supply these interfaces. ArithmeticDynamics' cyclotomic statements concern polynomial factorization and dynatomic polynomials, not the integral ideal and topology gap. Main-roadmap shape and ownership were checked against DerivedModuleAlgebra, DGAInfinity and EnhancedDerivedSheaves.

F01 remains an external ownership issue for the maintainer. No ownership moved to a later roadmap. The review's request for outside-folder supplier work was treated as a claim about missing contracts, not authorization to edit other packages.

## F02 (P2) — disputed

The finding treats absence from `merge-order/ORDER.txt` and absence of `packages/QWittVectors/README.md` as design-stage defects. The binding brief explicitly permits candidate placement after the last supplier and prescribes `packages/QWittVectors/design/README.md`. That exact invocation exits **0**, with this complete output:

```text
candidate: QWittVectors is not in the merge order yet; checked as if placed after HabiroCyclotomicCompletions (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 12 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The previously reported `NOT IN ORDER` failure is not reproduced by the prescribed check in this environment. No tooling, merge-order file or package-level README was edited. This settles the alleged design-position defect; it does not certify the missing mathematical contracts in F01. Actual Part II suppliers, when established by their owners, will require their own placement and a corresponding dependency check.

## F03 (P2) — applied

Finite étale map → étale map from a polynomial algebra with finitely many coordinates. Corrected the convention, all affected Layers 8–9 statements and hypotheses, the §9.7 prime-power API clause and the prismatic gap in README and plan. Added the Laurent-coordinate Check in §8.3. The general smooth exports and all public target/API names are retained.

Wagner §4.7, p. 57, wagner line 2831, requires an étale framing. Its lifting and divisibility argument is at wagner line 2842, and its twisted product rule at wagner line 2858. Section 4.9, p. 58, wagner line 2882, extends the framed Frobenius using complete étaleness. Pridham Definition 1.22, p. 9, pridham line 371, uses formal étaleness. None requires the framing map to be finite. The smooth, framing-independent endpoint is Wagner Proposition 4.2, p. 54, wagner line 2692.

At the pinned Mathlib commit, `Algebra.Etale.of_isLocalizationAway`, in `Mathlib/RingTheory/Etale/Basic.lean`, states étaleness of localization at one element. For ℤ[T]→ℤ[T,T⁻¹], finiteness would make T⁻¹ integral; multiplying a monic equation by a sufficient power of T gives 1∈(T), a contradiction. Thus this is an étale frame excluded by the old convention.

In R[[h]], q=1+h is a unit. Applying γ to TT⁻¹=1 gives γ(T⁻¹)=q⁻¹T⁻¹. Consequently γ(T⁻¹)−T⁻¹=−hq⁻¹T⁻¹, and cancellation of the regular element hT gives D(T⁻¹)=−q⁻¹T⁻². At q=1 it gives the ordinary derivative −T⁻². This verifies the sign and the extra q⁻¹ factor without dividing by a possibly vanishing q−1.

There is no `Suggested.lean` in this package. The framed operators are roadmap constructions, not kept real-bodied definitions on existing carriers. The conditional Lean-example request therefore does not apply; no Lean file was added or edited, and no elaboration result is claimed.

## Check outcomes

| Check | Exact outcome |
| --- | --- |
| Prescribed dependency gate after final design edits | Exit 0; complete output under F02; no UPWARD or CYCLE line. |
| JSON/TOML parsing | PASS; 8 certified source records; source manifest unchanged. |
| README/plan agreement | PASS; all 52 target statements, hypotheses, locators and proof routes, 162 public API claims and 157 Check statements agree. |
| Definition/construction coverage | PASS; all 28 retain public APIs and at least three Checks. |
| Internal dependencies | PASS; every target reference resolves strictly earlier; every gap reference resolves to one of the six records, each retaining supplier, section and `needs`. |
| Scope comparison with initial plan | PASS; only framing phrase replacements and one additional Laurent Check differ. No target/API name, locator, proof route, dependency or consumer changed. |
| Framing phrase scan | PASS; no finite-map framing wording remains, including the §9.7 API clause. |
| Lean elaboration and proved examples | NOT RUN; no Suggested.lean exists and no Lean command is authorized by this brief. |
| Legal references | No new source needed or fetched; the relevant existing cached legal texts are readable. No missing-reference request. |
| Whitespace and permitted-file check | `git diff --check` exits 0. Only the two permitted design files and this required report differ; `packages/QWittVectors/sources.toml` is unchanged. |

## Adversarial mathematics pass

Each target row covers its statement, associated public laws, hypotheses, conventions and Checks. The results below record concrete substitutions and mathematical deductions, not formal proofs or independent acceptance. The unresolved external prerequisites are retained. Compact-group hypotheses, analytic periods and induction normalization do not enter these algebraic statements. No Lean section-binder claim is made in the absence of a Lean artifact.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | n=0,1,2; q=1; two coordinates; Laurent frame | [0]=0, [2]=1+q; q is invertible in series; localization is étale without being finite | F03 |
| 1.1 Truncation sets and ghosts | ∅, {1}, {2}, Div(6) | {2} fails divisor closure; w₆=x₁⁶+2x₂³+3x₃²+6x₆; empty product singleton | None |
| 1.2 Ghost image and injectivity | ℤ, ℚ, 𝔽₂; ∅ | Over ℤ the second ghost is congruent to the first mod 2; over 𝔽₂, (0,1) has zero ghosts; over ℚ indices are units | None |
| 1.3 Big Witt ring and functor | Zero ring, empty S, zero-product ℤ, τ(1)+τ(1) | Last sum has coordinates (2,−1); zero-product coefficients give componentwise addition and zero multiplication | None |
| 1.4 F, V, Teichmüller | n=1,2; a=b=2; τ(−1) | F₂V₂=2; gcd coefficient necessary; τ(−1)=−τ(1)+V₂τ(1) at level 2 | None |
| 1.5 p-typical comparison | p=2,3; a=0,1,2 | Div(p⁰) has length 1; at p=3,a=2 the last ghost is x₀⁹+3x₁³+9x₂ | None |
| 1.6 Étale Witt comparison | Identity, empty S, S={1}; coprime 2,3 | Empty tensor zero; S={1} recovers the given map; coprime composite has four coordinates; finite S hypothesis retained | None |
| 1.7 Commuting Koszul bridge | r=0,1,2; M=0; noncommuting E₁₂,E₂₁ | d¹(a,b)=D₁b−D₂a; the stated noncommuting pair gives d²(u₁)=u₁e₁∧e₂ | None |
| 1.8 Arithmetic fracture | N=1,2; M=0,ℤ,ℤ[1/2]; arbitrary complex degrees | N=1 left map identity; ℤ₂ alone loses ℤ[1/2]; localization supplies the missing detection | None |
| 2.1 Arithmetic Λ-coaction | ℤ; toric ℤ[T]; putative identity Adams on 𝔽₂ | ψ₂(2)=2 and ψ₂(T)=T²; δ₂(2)=−1 rules out the putative torsion-ring coaction | None |
| 2.2 Prime sets and free objects | P=∅,{2}; empty generators | Identity comonad for ∅; infinite p-typical object for {2}; free empty object ℤ | None |
| 2.3 Arithmetic perfection | ℤ, toric ℤ[T], perfect A | Toric colimit has nonnegative rational exponents; T has no ψ₂-preimage in ℤ[T]; perfect objects unchanged | None |
| 2.4 Perfect coverage | A=0,ℤ,ℤ[T],ℤ[ε]/ε² | Toric ψ₂ has basis 1,T; ψ₂(ε)=2ε is nonflat mod 2; integer torsion-freeness alone is insufficient | None |
| 2.5 Relative perfection and twists | R=A with nonperfect A; ℤ[T]/ℤ; n=1,2 | Base linearization r⊗a↦ψₙ(r)a is an isomorphism; polynomial T is missed over ℤ | None |
| 3.1 Absolute q-FV systems | R=0,ℤ; m=1,2 | FV₂(1)=2, VF₂(1)=1+q; using V₂=2 violates the latter | None |
| 3.2 Initial absolute q-Witt ring | R=0,ℤ; m=1,2; q=1 | Q₁=R; Q₂(ℤ)=ℤ[q]/(q²−1); at q=1, VF=2 | None |
| 3.3 Absolute ghosts | m=1,2,6; V₂(1) | First level-2 ghost kills 1+q; the m=1 ghost is identity; τ exponent m/d | None |
| 3.4 V-resolution | m=1,6,2^a; a=0,1 | For m=6, −V₂V₃+V₃V₂=0; a=0 is the augmentation, not a negative index | None |
| 3.5 Localization and torsion | R=ℤ,𝔽₂; m=1,2 | V₂(1) is nonzero with zero ghosts in characteristic 2; torsion hypothesis is necessary | None |
| 3.6 Absolute completion | m=1,2; zero/unit completion ideals | Zero ideal gives identity; unit ideal gives zero; discreteness and bounded torsion remain separate assumptions | None |
| 3.7 Witt injection and exactness | R=0,𝔽₂; nonunital kernel; m=1,2,6 | Characteristic-2 V₂ survives; kernels need no unit; local factors retain q↦q^d | None |
| 4.1 Λ-comparisons | ℤ, toric ℤ[T]; m=1,2 | c₂ misses T in the toric example; cₘsₘ=ψₘ, which need not be identity | None |
| 4.2 Relative q-FV systems | R=A,0; toric scalar T; m=1,2 | F₂ sends the right scalar T to T; a semilinear substitute sends it to T² | None |
| 4.3 Relative quotient | R=A,0,A[X]; toric A; m=2 | Dual-number detector sends V₂(TX)⊗1 and V₂(X)⊗T to ε and 0 before imposing the relative relation | None |
| 4.4 Twisted ghosts | A=R=ℤ[T]; d=m=2; m=1 | T⊗1=1⊗T²; both identify with T² under linearization; reversed twisting would give T⁴=T | None |
| 4.5 Relative base change | A′=A,0; toric polynomial algebra | Identity and zero maps agree; arbitrary Λ-base change retained without flatness | None |
| 4.6 Perfect-cover comparison | R=A; toric ℤ[T]/ℤ; torsion R/ℤ | Relative perfection differs from base perfect coverage; existence of comparison does not imply invertibility | None |
| 5.1 Étale preservation | Identity; m=1; nonflat quotient | Flat changed factor makes ordinary and derived pushouts agree; arbitrary quotient lacks this reason | None |
| 5.2 Ghost pushouts | d=m=1; R=A; quotient by x | Flatness is required of the horizontal q-Witt map, not the ghost | None |
| 5.3 Relative completion | A=ℤ; R=A; p invertible; torsion R | Zero p-completions allowed; perfect-cover descent uses completed extension | None |
| 5.4 Finiteness | r=0,1; m=2; infinite variables | Rank m at r=0; 1,T suffice over a subring containing T²; infinite variables do not imply Noetherianity | None |
| 6.1 Completed étale Frobenius | R=A,0,ℤ×ℤ; p invertible; ℤ[T]/ℤ | Product lift at 2 is identity; polynomial Frobenius misses T mod 2 and is not a relative equivalence | None |
| 6.2 Cyclotomic overlap | p=2,3; d=1,2 | Φ₄ mod 2=(q−1)²; Φ₃ mod 3=(q−1)²; radical equality does not imply ideal equality | None |
| 6.3 Completed ghost Frobenius | m=p; p divides d; A=R=ℤ; p=2 | τ paths give r^(m/d); q=1+h and q²=1+2h+h² differ on the completed overlap | None |
| 7.1 Differential V-system | Exterior Ω; odd u in characteristic 2; even u; ideal (T) | Odd-square vanishing must be imposed; even squares may vanish or survive; (T) is not differential | None |
| 7.2 Initial differential system | R=A,0,A[T]; m=1,2; characteristic 2 | Degree zero unchanged; at m=1, d(T²)=2T dT and dT∧dT=0 | None; quotient gap retained |
| 7.3 Differential FV-system | m=1,2,3; τ(T); mod 3 | dFₙ=nFₙd; F₃dτ₃(T)=T²dT remains nonzero mod 3, while dF₃τ₃(T)=0 mod 3 | None |
| 7.4 V-only prime identity | p=2; x=0; Teichmüller generators | γ₂(V₂x)=V₂(x²); 2γ₂(v)=v² uses no inverse of 2 or positive-degree F | None |
| 7.5 Positive-degree F | p=2,3; V₂(T); τ₂(T)²; m=1 | θ₂V₂(T)=dT and θ₂(τ₂(T)²)=2T³dT; ordinary derivation rule would give 2T²dT | None |
| 7.6 Differential ghosts | i=0,1; m=1,2 | gh₂V₂(T)=2T; gh₂V₂(dT)=4dT; degree-dependent factor required | None |
| 7.7 Differential base change | Identity; m=1; localization at T | d(T⁻¹)=−T⁻²dT; differentiating only the old tensor factor fails | None |
| 8.2 Framed γ | r=0,1; zero divisors in A; polynomial q; Laurent frame | γ(T²)=q²T²; hT is regular by flatness; γ(T⁻¹)=q⁻¹T⁻¹ | F03 convention |
| 8.3 Jackson derivative | n=0,1,2,3; q=1; characteristic 2; T⁻¹ | D(T²)=(1+q)T; D(1)=0; D(T⁻¹)=−q⁻¹T⁻², not −T⁻² before specialization | F03 added Check |
| 8.4 Framed complexes and skew product | r=0,1,2; T²,T⁻¹; q=1 | d_H(T²)=(q²−1)T dT; dT·T=qT dT; Laurent d_H is −hq⁻¹T⁻²dT | F03 framing wording |
| 8.5 Framed Frobenius | p=2,3; r=0; h,T,dT,T⁻¹ | At 2, φ(h)=2h+h² and φ_H(dT)=T dT; φ(T⁻¹)=T⁻²; C requires factor 1+q | F03 framing wording |
| 9.2 Frobenius decomposition | r=0,1; α=0,1; p=2; Laurent frame | Ring basis 1,T and form basis T dT,dT; Laurent coefficient subring contains T² and T⁻²; α=0 gives dT | F03 framing wording |
| 9.3 Two-term cohomology | α=e=0; e=α; p=2,α=1,e=0; two factors | H⁰=(h+2)S₁ and H¹=S₁/(h), both ℤ₂; at e=α the differential is zero; tensor is over S_α | None |
| 9.4 Framed Bockstein | m=1,2; r=0,1; f=0 | β₁(T)=dT; β₂([T²])=[T dT]≠0 by specialization; zero parameter is not regular on a nonzero term | F03 framing wording |
| 9.5 Framed cohomology system | m=1,2; zero variables; T,T² | Mod q²−1, cocycle T² commutes with dT; T is not a cocycle and need not commute | F03 framing wording; completion gap retained |
| 9.6 Simultaneous induction | α=0,1; p=2; T dT mod 2 | F₂dτ₂(T)=T dT; quotient must kill dV as well as V; no α=−1 premise required | None |
| 9.7 Smooth E∞ comparison | m=1,2,6; p=2,3; R=0,A; toric A | At m=6,p=2, factors use ψ₂ and ψ₆; wrong tensor base adds Tor₁; full smooth functoriality retained | F03 prime-power API framing wording |
| 10.1 Smooth integer torsion | R=A; m=1; ℤ[x]/x² | Positive forms vanish for R=A; nonsmooth example has nonzero 2-torsion x dx; FV=n yields V-injectivity | None |
| 10.2 Difference torsion and completion | m=1,2; R=A; flat polynomial base change | At m=1, h acts as zero; at m=2, h(q+1)=0; bounds remain degree/index dependent | None |
| Cyclotomic interface | m=1; equal indices; p divides d | Empty prime generators cannot give Φ₁; equal-factor intersection excluded; radical topology still works when p divides d | F01 external |
| Ordinary de Rham interface | Rank zero; characteristic 2; nonperfect characteristic-p base | Exterior alternation and relative Cartier twist are necessary; no base perfectness added | F01 external |
| Unbounded completion interface | M^i=ℤ[q], d=0 in all integer degrees; p-torsion; unbounded h-torsion | First example satisfies the assumptions; latter examples violate explicit conditions; no uniform degree bound assumed | F01 external |
| Prismatic/PD interface | α=0,1; p=2; étale localization frame | Empty décalage product at α=0; q-PD coordinates require étaleness, without finite-map restriction | F01 external; F03 wording |
| Generic Bockstein interface | f=g=h; f=h²,g=h; f=0 | If dx=gy then d((f/g)x)=fy, yielding Fβ_fV=β_g; lift independence uses regularity | F01 external |
| Differential-ideal quotient interface | J=0,P,(T),(T,dT) in Ω* of ℤ[T]/ℤ | Zero, whole and (T,dT) ideals give DG quotients; (T) fails d-stability | F01 external |

## Maintainer consequences

No public target or API name changed. The additional plan Check is `QWitt.framedJacksonDerivative_4`; it is not a new Lean declaration. Consumers retain the same interfaces and gain the intended étale-framing generality. F01 still requires real earlier supplier contracts, including the Part II extensions; the passing design-position check does not close those gaps. No commit, push, pull-request or issue edit, or message to another person was made.
