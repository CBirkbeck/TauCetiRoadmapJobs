# QWittVectors design repair

F03 is repaired in both design artifacts. F01 and F02 are verified and remain blocking: their required changes lie outside the authorized files. The outcome labels below record how each finding was handled; “applied differently” does not certify closure of either blocker.

## F01 (P1) — applied differently

Unowned supplier requirements → verified, explicitly unresolved requirements. No source citation or invented section is substituted for an actual supplier target. The six interfaces and the full smooth comparison retain their hypotheses and generality; closing ownership requires actual earlier supplier roadmaps outside this repair's permitted files.

The read-only repository is main at `0e8b058a97cc4f9401d2679313e0e937761c1024`. Its active/completed roadmap inventory and the board package inventory contain no roadmap files for HabiroCyclotomicCompletions, DerivedDeRhamCohomology, PrismaticCohomology, DerivedModuleAlgebraPartII or DGAInfinityPartII. The first three supplier entries still have empty section lists in `packages/QWittVectors/design/plan.json`. A merge-order name is not ownership of a mathematical target.

| Required interface | Verification | Remaining owner work |
| --- | --- | --- |
| `gap:cyclotomic-contract` | The integral ideal and distinct-factor quotient results occur at wagner line 305 and wagner line 320; the q-fixed completed overlap uses wagner-habiro line 647. The pinned polynomial product identities alone do not give this whole package. The restrictions m>1 and unequal indices are necessary. | HabiroCyclotomicCompletions needs actual named sections covering ideals, intersections, local factorization and completion topology. |
| `gap:ordinary-derham` | The exterior DGA and the relative polynomial Cartier calculation are used at wagner line 1822 and wagner line 3584. Degree-one Kähler basis transport does not construct exterior multiplication, the differential, étale extension or Cartier. | DerivedDeRhamCohomology needs actual sections with arbitrary-base exterior de Rham and relative characteristic-p Cartier contracts. |
| `gap:cohomology-completion` | Wagner Lemma 4.25, wagner line 3198, allows unbounded complexes with degreewise bounds. `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1808` gives quotient-tower comparisons and a Noetherian finite-cohomology result; `:2006` concerns complete Tor-amplitude. Neither is this theorem. | DerivedModuleAlgebra, Part II, must state the extension and where the base roadmap stops, retaining the unbounded hypotheses. |
| `gap:prismatic-frobenius` | The Frobenius/décalage input is used at wagner line 3459; the PD-presentation and crystalline Poincaré input at wagner line 3492. Bhatt–Scholze Theorem 15.3, bhatt-scholze line 3898, supplies mathematical evidence, not an inspectable roadmap contract. | PrismaticCohomology needs actual q-PD, Frobenius, iterated décalage and PD-presentation comparison targets. |
| `gap:dga-bockstein` | The cycle-lift Bockstein and parameter-change maps are used at wagner line 3026 and wagner line 3178. `TauCetiRoadmap/DGAInfinity/README.md:293` supplies associative DG carriers and cohomology, without the required regular-parameter theorem. | DGAInfinity, Part II, must state the multiplicative regular-parameter theorem, parameter-change law and base-roadmap boundary. |
| `gap:dga-quotient` | The generated differential ideal and its quotient are needed at wagner line 1977. DGAInfinity Layer 1 does not name that target; its later DG-category quotient concerns a different object. | DGAInfinity, Part II, must state homogeneous differential-ideal generation, quotient construction and universal property. |

Pinned declarations were located through GitHub code search and then read at the manifest commits, rather than accepting default-branch search as evidence:

- Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`: `Polynomial.prod_cyclotomic_eq_X_pow_sub_one` and the prime-power geometric-sum identities are polynomial identities, not the residual ideal/intersection contract.
- Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti/RingTheory/Kaehler/FormallyEtale.lean:67`: `TauCeti.kaehlerBasisOfFormallyEtale` transports a basis under a commutative scalar tower and formal étaleness. Its result is a degree-one basis.
- At that Tau Ceti pin, `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean:92`, `TauCeti.explicitBockstein1`, has continuous group-cohomology source and target with mod-two coefficients. `Integral.lean:136`, `TauCeti.integralBockstein`, lands in integral continuous group cohomology. Neither is a regular-parameter DGA theorem.

This is verification of the relevant candidates, not a claim of exhaustive absence of every possible library declaration. The imported primitives remain direct imports; no generic supplier theory is replanned inside QWittVectors.

The specified open siblings were inspected at their actual heads: ArithmeticDynamics `1921611a7a96ac19fb15c2b1291b35958c3ef0cb`, README blob `05bc3fc0bc4c41103081d7ead52c8a4a9d39aa95`; ErdosProgressionPowers `e101259371172a32b3dd13e926676ae33b6af5cd`, README blob `4c16df24893ccac630ed2aeb61b0a4dc617520a0`. Their scope and whole-text searches for q-Witt, arithmetic Λ-rings, Jackson calculus and DGA Bocksteins do not provide the missing contracts. The representative main roadmap shapes read were DerivedModuleAlgebra, DGAInfinity and EnhancedDerivedSheaves.

The review's out-of-scope proposal, “Put the generic extensions of DerivedModuleAlgebra and DGAInfinity in actual Part II roadmaps with explicit base-roadmap boundaries”, was treated as data, not authority to edit other folders. No outside-folder supplier, order or GitHub write was performed. No ownership moved to a later roadmap. F01 remains open.

## F02 (P2) — applied differently

Uncertified merge position → rerun of the exact authorized design dependency check, with its failure preserved. QWittVectors is absent from `merge-order/ORDER.txt`; neither that protected file nor the missing package README is created. Registration after the eventual actual suppliers remains external work.

The exact command prescribed in this brief was run against `packages/QWittVectors/design/README.md`, with name QWittVectors and order `merge-order/ORDER.txt`. It exited **1** and printed:

```text
NOT IN ORDER: QWittVectors (insert it after its last supplier)
depcheck: 3 roadmaps, 12 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. This is a failed gate, not a clean dependency certificate; no false positive is alleged. The independent review also discusses a package-level invocation against `packages/QWittVectors/README.md`; that file is absent. This brief prescribes the design invocation instead, so no package-level check was run or claimed. F02 remains open. The merge-order owner must account for actual supplier sections and the Part II suppliers needed by F01 before registration can certify the complete graph.

## F03 (P3) — applied

Qualitative or repeated Checks → computed witnesses in §§4.2, 7.5 and 9.4, plus stronger audit witnesses in §§1.3, 1.7, 6.3, 7.3, 7.6, 7.7 and 9.5. Twelve bullets changed identically in README and plan. The m=1 Frobenius boundary remains. No target, hypothesis, public API, dependency or locator changed.

The three proposed replacements are mathematically correct:

- In §4.2, take the polynomial relative system for toric A=R=ℤ[T]. By A[q]-linearity, F₂ on the right scalar T gives T. A ψ₂-semilinear map gives T². These are distinct in E₁=ℤ[T]. Definition 2.40, wagner line 1504, specifies precisely the required scalar linearity. The polynomial system also gives F₂V₂(1)=2 and V₂F₂(1)=1+q.
- In §7.5, for R=ℤ[T], m=p=2, the level-one target is Ω¹_{ℤ[T]/ℤ}. The equations at wagner line 2081 give θ₂(τ₂(T))=T dT and θ₂(V₂(T))=dT. Since F₂(τ₂(T))=T², the semilinear product law gives θ₂(τ₂(T)²)=2T³dT. With the same generator value an ordinary derivation, using τ₁(T)=T as scalar, would give 2T²dT. This replaces the Bézout uniqueness bullet by a computation; the Bézout argument remains in the mathematical target and proof route.
- In §9.4, for A=ℤ and the one-variable polynomial frame, d_H(T²)=h(1+q)T dT=(q²−1)T dT. Thus T² is a cycle modulo f₂ and the positive cycle-lift convention gives β₂([T²])=[T dT]. The specialization of the quotient complex at q=1 has zero differential, so this class maps to T dT≠0. This proves nonvanishing without confusing the specialized complex with de Rham cohomology. The definitions are at wagner line 3026 and the Jackson/skew formulas at wagner line 2858.

The remaining Check lists were audited for values, degenerate cases and negative controls. Additional replacements make nonunital square-zero operations explicit, exhibit a noncommuting pair with nonzero d², compute the two q-substitutions on the completed overlap, add the identity-index differential law, compare degree-zero and degree-one V-ghost factors, compute the differential of an étale inverse, and distinguish cocycles from arbitrary elements in the skew algebra. The étale differential extension is the one at wagner line 2561; the degree-dependent ghost factors are at wagner line 2033. These changes are confined to Check bullets and do not enlarge the mathematical scope.

## Check outcomes

| Check | Exact outcome |
| --- | --- |
| Required design dependency gate | Exit 1; exact two-line output recorded under F02. No UPWARD/CYCLE line; registration failure remains. |
| JSON and TOML parsing | PASS. Both parse; all eight source records retain certified status. No new source was needed or fetched. |
| README/plan Check agreement | PASS: all 156 Check statements agree literally. Twelve bullets changed in each artifact. |
| Target/API coverage | PASS: all 52 target names and 162 public API names occur in the README. |
| Internal graph | PASS: target and gap references resolve; target dependencies are strictly earlier in the target order. This does not close external ownership. |
| Construction Check counts | PASS: all 28 definition/construction targets retain at least three Checks. Discriminating quality was assessed mathematically, not inferred from this count. |
| Scope preservation | PASS: comparison of the plan with its initial version finds no change outside the twelve test statements; statements, hypotheses, APIs, proof routes, locators and supplier/dependency metadata are unchanged. |
| Lean elaboration and examples | NOT RUN: the package has no Suggested.lean and the brief gives no authorized elaboration command. No Lean file was added or edited; no elaborated type or proved-example claim is made. |
| Missing legal texts | None needed. The eight existing legal cached texts suffice; no missing-reference entry was required. |
| Whitespace/diff check | `git diff --check` exits 0. Only the two authorized design files and this required report differ. The source manifest is unchanged. |

## Adversarial mathematics pass

Each target row includes its defining statement or headline, public laws, hypotheses, proof route and Checks. “Consistent” records the listed substitutions and deductions, not formal proof or independent acceptance. The six external gaps remain prerequisites wherever consumed. Group compactness, induction parity and analytic-period normalizations are outside these objects; they are not extra hypotheses on this algebraic roadmap.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | n=0,1,2; q=1; toric d=m=2; two cochain coordinates | [0]_q=0; [2]_q=1+q uses no division; balancing sends T⊗1 and 1⊗T² to T²; d¹(a,b)=D₁b−D₂a; β_h(T)=dT | None |
| 1.1 Truncation sets and ghost polynomials | ∅, {1}, {2}, Div(6) | {2} fails divisor closure; w₆ includes 2x₂³ and 3x₃²; empty product is singleton | None |
| 1.2 Ghost image | ℤ, ℚ, 𝔽₂; empty S | Over ℤ, b₂≡b₁ mod 2; over 𝔽₂, (0,1) has zero ghosts; over ℚ triangular inversion is allowed | None |
| 1.3 Big Witt ring | R=0; empty S; zero-product ℤ; τ(1)+τ(1) | Coordinates of the latter are (2,−1); zero-product coefficients give componentwise addition and zero product | Concrete nonunital Check |
| 1.4 F, V and τ | n=1,2; a=b=2; τ(−1) | F₂V₂=2, not identity; gcd coefficient required; τ is multiplicative but not additive | None |
| 1.5 p-typical comparison | a=0,1,2; p=2,3 | Length a+1; final p=3,a=2 ghost is x₀⁹+3x₁³+9x₂ | None |
| 1.6 Étale Witt comparison | S=∅,{1}; identity; coprime 2,3 | Zero tensor and original étale map at boundaries; coprime iterated carrier has four coordinates; finite S retained | None |
| 1.7 Commuting Koszul bridge | r=0,1,2; M=0; E₁₂,E₂₁ on ℤ² | For the stated noncommuting pair d²(u₁)=u₁⊗e₁∧e₂; flatness is needed only for cohomology base change | Explicit negative-control Check |
| 1.8 Arithmetic fracture | N=1,2; M=0,ℤ,ℤ[1/2]; unbounded M | N=1 left map is identity; ℤ₂ alone loses the localization contribution | None |
| 2.1 Arithmetic Λ-ring | ℤ; toric ℤ[T]; identity Adams on 𝔽₂ | ψ₂(2)=2, ψ₂(T)=T²; the δ₂(2)=−1 obstruction excludes the proposed torsion-ring structure | None |
| 2.2 Prime sets | P=∅,{2}; no generators | Identity comonad; infinite 2-typical carrier; empty free ring is ℤ | None |
| 2.3 Perfection | ℤ; toric ℤ[T]; perfect A | Colimit permits nonnegative rational exponents; T has no ψ₂-preimage before perfection | None |
| 2.4 Perfect coverage | A=0,ℤ,ℤ[T],ℤ[ε]/ε² | Toric ψ₂ has basis 1,T; dual-number ψ₂ is not flat modulo 2, despite integer torsion-freeness | None |
| 2.5 Relative perfection | R=A with nonperfect toric A; ℤ[T]/ℤ; n=1,2 | Base linearization r⊗a↦ψ_n(r)a is invertible; ℤ[T]/ℤ fails relative perfection | None |
| 3.1 Absolute FV systems | ℤ, zero nonunital ring; m=1,2 | FV₂(1)=2 while VF₂(1)=1+q; V₂=2 fails | None |
| 3.2 Absolute q-Witt | R=0,ℤ; m=1,2; q=1 | Q₁=R; Q₂(ℤ)=ℤ[q]/(q²−1); q=1 gives VF=2, not ordinary restriction | None |
| 3.3 Absolute ghosts | m=1,2,6; proper V-images | First ghost at m=2 kills 1+q; at m=1 it is identity; Teichmüller exponent is m/d | None |
| 3.4 V-resolution | m=1,2,6; 2^a with a=0,1 | The m=6 composite is −V₂V₃+V₃V₂=0; a=0 is a separate augmentation | None |
| 3.5 Localization and torsion | R=ℤ,𝔽₂; m=1,2 | V₂(1) survives in characteristic 2 but has zero ghosts; joint injectivity needs torsion hypotheses | None |
| 3.6 Absolute completion | m=1,2; zero/unit parameter ideals | Zero-parameter completion is identity; unit-ideal completion is zero; discreteness and bounded torsion are separate hypotheses | None |
| 3.7 Witt injection and exactness | R=0,𝔽₂; nonunital kernel; m=1,2,6 | Characteristic-two V₂ survives; kernel cannot be required unital; p-local factors retain q↦q^d | None |
| 4.1 Λ comparisons | ℤ and toric ℤ[T]; m=1,2 | c₂ misses T in toric case; c_ms_m=ψ_m, rather than identity in general | None |
| 4.2 Relative FV system | R=A,0; toric T; m=1,2 | Right scalar T maps to T; ψ₂-semilinear substitute gives T²; two composite values differ | Computed scalar and FV Checks |
| 4.3 Relative quotient | R=A,0,A[X]; toric A=ℤ[T]; m=2 | The stated dual-number detector separates V₂(TX)⊗1 from V₂(X)⊗T; quotient imposes their equality | None |
| 4.4 Relative ghosts | d=m=2; A=R=ℤ[T]; m=1; A=ℤ | Balancing evaluates both sides to T²; reversed twisting gives false T⁴=T | None |
| 4.5 Relative base change | A′=A,0; polynomial toric base | Identity and zero comparisons; a Λ-map is required, flatness is not | None |
| 4.6 Perfect-cover comparison | R=A; toric ℤ[T]/ℤ; torsion R/ℤ | Relative perfection and base perfect coverage have different roles; existence does not imply equivalence | None |
| 5.1 Étale preservation | Identity; m=1; nonflat quotient | Ordinary/derived pushout agreement uses flat changed factor; arbitrary quotients do not supply it | None |
| 5.2 Ghost pushout | d=m=1; R=A; quotient by x | Base ghost can be nonflat; the étale horizontal map supplies Tor-independence | None |
| 5.3 Relative completion | A=ℤ; R=A; p invertible; torsion R | Zero p-completions allowed; ordinary tensor/limit interchange is not assumed | None |
| 5.4 Finite type | r=0,1; m=2; infinitely many variables | Rank m at r=0; 1,T generate over the m=2 comparison image; no infinite-variable Noetherian conclusion | None |
| 6.1 Étale completed Frobenius | R=A,0,ℤ×ℤ; p invertible; polynomial ℤ[T]/ℤ | Product lift is identity at p=2; smooth polynomial Frobenius misses T modulo 2 | None |
| 6.2 Cyclotomic overlap | p=2,3; d=1,2 | Φ₄ mod 2=(q−1)² and Φ₃ mod 3=(q−1)²; radicals agree without ideal equality | None |
| 6.3 Completed ghost Frobenius | m=p; p divides d; A=R=ℤ; p=2 | Teichmüller paths give r^(m/d); completed q has distinct images under identity and pth power | Computed q-fixed Check |
| 7.1 Differential V system | Exterior Ω; odd u over 𝔽₂; even u; ideal (T) | Odd-square vanishing must be imposed; even-square vanishing need not be; (T) is not differential | None |
| 7.2 Initial differential system | R=A,0,A[T]; m=1,2; characteristic 2 | Degree-zero quotient unchanged; d(T²)=2T dT and dT²=0 | None; quotient supplier still missing |
| 7.3 Differential FV system | m=1,2,3; τ(T); reduction mod 3 | dF_n=nF_nd; at p=3, F₃dτ₃(T) stays nonzero mod 3 while dF₃τ₃(T)=0 | Computed identity-index Check |
| 7.4 V-only prime identity | p=2; x=0; Teichmüller generators | γ₂(V₂x)=V₂(x²), with 2γ₂(v)=v² and no division or positive-degree F assumption | None |
| 7.5 Positive-degree F | p=2,3; V₂(T); τ₂(T)²; m=1 | θ₂V₂(T)=dT and θ₂(τ₂(T)²)=2T³dT distinguish two plausible wrong rules | Two concrete Checks |
| 7.6 Differential ghosts | i=0,1; m=1,2 | gh₂V₂(T)=2T and gh₂V₂(dT)=4dT; multiplicity depends on degree | Computed degree-zero comparison |
| 7.7 Differential base change | Identity; m=1; localization at T | d(T⁻¹)=−T⁻²dT; coefficient differential cannot be ignored | Computed étale-extension Check |
| 8.2 Framed γ | r=0,1; A with zero divisors; polynomial q | γ(T²)=q²T²; regularity follows from the étale frame; polynomial q need not be a unit | None |
| 8.3 Jackson derivative | n=0,1,2,3; q=1; characteristic 2 | D(1)=0, D(T)=1, D(T²)=(1+q)T; no division by 2 or negative exponent required | None |
| 8.4 Framed complex and product | r=0,1,2; T²; q=1 | d_H(T²)=(q²−1)T dT; dT·T=qT dT; ordered wedge fixes the cochain sign | None |
| 8.5 Framed Frobenius | p=2,3; r=0; h,T,dT | At p=2, φ(h)=2h+h² and φ_H(dT)=T dT; C requires factor 1+q | None |
| 9.2 Frobenius decomposition | r=0,1; α=0,1; p=2 | Ring basis 1,T; form basis T dT,dT; zero exponent never demands T⁻¹ | None |
| 9.3 Two-term cohomology | α=e=0; e=α; p=2,α=1,e=0; two factors | H⁰=(h+2)S₁ and H¹=S₁/(h), both ℤ₂; triangular tensor split is over S_α | None |
| 9.4 Framed Bockstein | m=1,2; r=0,1; invalid f=0 | β₁(T)=dT; β₂([T²])=[T dT]≠0; f=0 is not regular on a nonzero term | Nontrivial parameter Check |
| 9.5 Framed cohomology system | m=1,2; polynomial/étale frames; zero variables | T² commutes with dT modulo f₂ as a cocycle, while T is not a cocycle; zero variables give β=0 | Computed commutativity Check; completion supplier still missing |
| 9.6 Simultaneous induction | α=0,1; p=2; T dT mod 2 | F₂dτ₂(T)=T dT; first-ghost differential quotient must kill dV as well as V | None; de Rham/prismatic suppliers still missing |
| 9.7 General smooth comparison | m=1,2,6; p=2,3; R=0,A; toric A=ℤ[U] | At m=6,p=2 the second factor uses ψ₆, not ψ₂; tensor over A[q] in place of C_α adds Tor₁ | None; full derived, functorial E∞ scope retained |
| 10.1 Smooth integer torsion | R=A; m=1; nonsmooth ℤ[x]/x² | Nonzero x dx is 2-torsion in the nonsmooth example; F_nV_n=n proves V injective under torsion-freeness | None |
| 10.2 Difference torsion/completion | m=1,2; R=A; flat polynomial base change | h=0 at m=1; h(q+1)=0 at m=2 is compatible with integer torsion-freeness; bounds are degree/index dependent | None |
| Cyclotomic requirement | m=1; equal indices; p divides d | Empty prime generators do not give Φ₁; equal-factor intersection differs; radical topology works for p dividing d | F01 remains |
| Ordinary de Rham requirement | Characteristic 2; nonperfect base; rank zero | Strict alternation and relative Cartier twist cannot be dropped | F01 remains |
| Cochain completion requirement | M^i=ℤ[q], d=0 for all integer i; p-torsion; unbounded h-torsion | First is an allowed unbounded example; latter inputs fail the stated hypotheses | F01 remains |
| Prismatic/PD requirement | α=0,1; p=2; toric base | Empty décalage product at α=0; PD comparison required for the coherent smooth endpoint | F01 remains |
| Generic Bockstein requirement | f=g=h; f=h²,g=h; f=0 | If dx=gy, then d((f/g)x)=fy, giving Fβ_fV=β_g; regularity is necessary for lift independence | F01 remains |
| Differential quotient requirement | J=0,P,(T),(T,dT) in Ω*_{ℤ[T]/ℤ} | First two and (T,dT) give DG quotients; (T) fails d-stability | F01 remains |

## Maintainer consequences

No public target or API name changed, so consumers need no renaming. The mathematical supplier requirements were neither weakened nor declared supplied. HabiroRings, HabiroCohomologyFoundations, HabiroCohomologyFoundationsPartII and RefinedTraceMethods still consume the same intended endpoints, whose build remains blocked by F01 and F02. The worker must not interpret this report as acceptance or a passing dependency gate. No commit, push, pull-request edit, issue edit or message to another person was made.
