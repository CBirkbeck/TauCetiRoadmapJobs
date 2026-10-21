# QWittVectors repair report

The review labels `r1a` and `r1b` distinguish repeated finding IDs in the two supplied reviews; each finding section names its review. The overlapping Borger finding is settled once. Changes are confined to `packages/QWittVectors/README.md`, `packages/QWittVectors/Suggested.lean`, `packages/QWittVectors/sources.toml` and this report. No commit or external write was made.

## F01 (P3) — applied

Review r1a F01, overlapping review r1b F02. Borger Theorem 9.1 / Corollary 9.3 → Theorem 9.2 / Corollary 9.4, verified at borger line 1995 and borger line 2095. Section 1.6 also cites Wagner Remark 2.49 (wagner line 1657). The Bockstein pointer §9.4 → §9.3. The source manifest already had the correct Borger numbering; Wagner's §1.6 use was added.

## F02 (P2) — applied

Review r1a. Missing series-automorphism headline → `QWitt.framedGamma_existsUnique`, with explicit coefficient algebra, scalar tower, étale frame and coordinate binders. README §8.1 lists it. Wagner §4.7 (wagner line 2830), Pridham Definition 1.22 (pridham line 371) and Scholze §3 (scholze line 319) support it. A series-algebra equivalence fixes h and preserves hⁿ, so h-adic continuity needs no extra hypothesis.

## F03 (P3) — applied

Review r1a. `QWitt.VPD_noFrobenius`, whose conclusion described proof order, → an explanatory construction sentence. The mathematical target remains `QWitt.verschiebungPrimeDifferential`, with its universal q-V-system hypotheses. Wagner Lemma 3.4 (wagner line 1856) proves that assertion without positive-degree Frobenius. No Lean declaration or internal consumer of the deleted name existed.

## F04 (P3) — applied

Review r1a. Eleven non-discriminating Checks → explicit product, zero-parameter, non-Λ-map, non-flat, Tor, coefficient-torsion, infinite-variable, Verschiebung-differential, ambient-Tor, differential-quotient and torsion-bound witnesses in §§1.6, 3.6, 4.5, 5.1–5.4, 7.4, 9.2, 9.6, 10.2. The table below records the recomputations. The periodic resolution is mathematical background, not a computational algorithm.

## F01 (P2) — not actionable in this package: the remaining design-manifest edit is outside the edit allowance

Review r1b. The mathematical objection is correct. The README's redundant supplier clause was deleted; §6.2 now uses Mathlib's two characteristic-p identities and DerivedModuleAlgebra §§1.2–1.3, including `isDerivedCompleteRadical`. Its supplier-gap dependency was deleted. The requested matching changes to `packages/QWittVectors/design/plan.json` cannot be made under the explicit file allowance; its gap text and dependency list remain inconsistent with the repaired README.

## F03 (P3) — applied

Review r1b. Board-specific manifest reference and extraction-based locator explanation → `sources.toml` in the same folder, with printed pages tied to the cited versions and extraction lines identified as supplementary. The mathematical theorem, section and page locators remain. No source extraction was copied into the repository.

## F04 (P3) — not actionable in this package: design/plan.json is outside the edit allowance

Review r1b. The witness holds: `packages/QWittVectors/design/plan.json` names the framed Frobenius §8.5, whereas README §8.4 contains it. Correcting the plan's target IDs, dependencies and gap announcement requires editing that excluded file. The README already gives the correct section in `gap:prismatic-frobenius`, whose supplier is PrismaticCohomology; no mathematical supplier target was invented or renamed.

## F05 (P3) — applied differently

Review r1b. Missing easy signatures → the ambient-series unit theorem, the general two-term kernel theorem, its p=2 kernel/cokernel boundary, the general cyclotomic radical theorem and three cyclotomic boundary targets. All are named in §§6.2 and 9.2. The two characteristic-p identities have proof bodies; unproved boundaries are named theorem targets. No artificial definition was introduced merely to support examples.

## F06 (P3) — applied

Review r1b. Unsupported faithful-flatness locator → Bhatt–Scholze Lemma 2.11 (p. 15, bhatt-scholze line 594), explicitly for the single-prime p-local case, and Wagner–Habiro §1.22(e) (p. 12, wagner-habiro line 493) for free arithmetic Λ-rings. Both source entries now include §2.2; Lemma 2.11 was added to the manifest locator and references. Generality of `LambdaP.free_polynomial` is retained.

## Mathematical evidence and adversarial pass

These are mathematical checks of target statements, not proof execution or independent acceptance. Each subsection row includes its definitions, named API clauses, construction identities and Checks; identity, composition and naturality clauses were checked with the maps and scalar structures specified there. Rows with no edit record no counterexample found, not a certification of a future implementation.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: positivity, zero objects, universes | Empty set; zero ring; positive-divisor sets; n=0 outside target indexing | Empty products allowed; ghostPolynomial has a total n=0 value but no positive-index theorem uses it | None |
| Conventions: q-integers and scalar action | [0]_q=0; [2]_q=1+q; toric A=ℤ[T], d=2 | Polynomial sums avoid division; r⊗a↦ψ₂(r)a sends T⊗1 to T² | None |
| Conventions: completion and Frobenius | p=2, d=1,3; equal ideals versus equal radicals; q=1+h | Completed coefficient Frobenius fixes q; framed Frobenius sends h to 2h+h² | None |
| §1.1 truncation sets and ghost polynomial API | ∅, Div(6), {2}; R=0, ℤ, 𝔽₂ | Divisor closure excludes {2}; w₆=x₁⁶+2x₂³+3x₃²+6x₆; maps preserve each summand | None |
| §1.2 image, injectivity, units | S=∅, Div(2); integer ghosts (1,3), (0,1); 𝔽₂ coordinates (0,1); rational coefficients | Integer congruence is b₂≡b₁ mod 2; characteristic-two ghosts fail injectivity; uniqueness only on S | None |
| §1.3 big Witt ring, maps, restrictions, unitization | Empty S; R=0; Div(1), Div(2); nonunital ℤ with zero multiplication | τ(1)+τ(1)=(2,−1); square-zero nonunital operations are componentwise additive with zero product | None |
| §1.4 F, V, τ, composition, gcd and projection laws | a=b=2; a=2,b=3; n=1; τ(−1) | F₂V₂=2; coprime interchange has coefficient 1; τ(−1)=−τ(1)+V₂τ(1) by ghosts (−1,1) | None |
| §1.5 p-typical comparison | p=2,a=0,1; p=3,a=2; empty length | Div(pᵃ) has a+1 coordinates; length zero is separate; final p=3 ghost x₀⁹+3x₁³+9x₂ | None |
| §1.6 étale and F base change | Empty S; S={1}; diagonal ℤ→ℤ×ℤ, S={1,2}, n=2 | Witt polynomials preserve products, and the tensor comparison is ℤ×ℤ | Locator and product Check |
| §1.7 commuting-action Koszul bridge | r=0,1,2; M=0; noncommuting maps on ℤ² | d¹(a,b)=D₁b−D₂a; noncommuting control gives d²(u₁)=u₁e₁∧e₂; scalar specialization agrees with cochain dual convention | None |
| §1.8 fracture and naturality | N=1; M=ℤ,N=2; M=ℤ[1/p] | Empty right product is zero; ℤ→ℤ₂ over ℤ[1/2]→ℚ₂; completion alone misses ℤ[1/p] | None |
| §2.1 Λ-coalgebra and Adams API | ℤ; toric ℤ[T]; zero ring; proposed identity lifts on 𝔽₂ | ψ₂(2)=2; ψ₂(T)=T²; coalgebra torsion relations exclude the 𝔽₂ proposal | None |
| §2.2 prime sets, free objects, colimits | P=∅, {2}, all primes; empty generator set | P=∅ gives rings; one prime uses infinite p-typical vectors; free empty object ℤ has identity Adams | Faithful-flatness sources |
| §2.3 perfection and universal property | ℤ; toric ℤ[T]; already perfect ring | Initial extension sends stage-m a to ψ_m⁻¹(f(a)); toric exponents become nonnegative rationals | None |
| §2.4 perfect coverage and torsion API | ℤ; toric polynomials; dual numbers ψ_n(ε)=nε; zero ring | Toric perfect cover is faithfully flat; ψ₂ on dual numbers is not flat modulo 2; faithful-flat convention includes zero base | None |
| §2.5 twists and relative perfection | R=A with ψ_p not surjective; ℤ[T]/ℤ; perfect R/ℤ | Right-hand action makes the base linearization invertible; T is missing in the polynomial image | None |
| §3.1 absolute FV system | ℤ[q]/(qᵐ−1), m=1,2; zero nonunital system | Reduction F and geometric-sum V work; V₂=2 violates VF=1+q | None |
| §3.2 initial absolute q-Witt and maps | m=1,2; R=0; R=ℤ | V₂(1)=1+q; F₂V₂(1)=2; specialization q=1 does not identify all structure with ordinary Witt theory | None |
| §3.3 ghosts, kernels, F and V compatibility | m=1,2; ℤ; V₂(1) | First ghost at m=2 evaluates q=−1; reduction q=1 sends V₂(1) to 2 instead of ordinary restriction's 0 | None |
| §3.4 V resolution, permutations and injectivity | m=1,2ᵃ,6; R=0 | At m=6, (−V₃,V₂) followed by (V₂,V₃) is zero; m=1 is an augmentation isomorphism | None |
| §3.5 localization and torsion | ℤ; 𝔽₂; m=1,2 | V₂(1) survives over 𝔽₂ although ghosts vanish; prime-specific torsion hypotheses are necessary | None |
| §3.6 completion and naturality | R=ℤ,m=n=2; m=1; cyclotomic d dividing n | Zero parameter acts nilpotently, so derived completion is identity; discreteness and bounded torsion retain distinct hypotheses | Zero-parameter Check |
| §3.7 Witt injection, exactness, p-local product | R=0; m=1; 𝔽₂,m=2; m=6,p=2 | Kernel rings need no unit; nonzero V₂(1) does not contradict injection; product uses d=1,3 | None |
| §4.1 Λ comparison, expansion and coordinates | ℤ; toric ℤ[T]; m=1,2 | c₂s₂=ψ₂; toric image ℤ[T²,q]+(1+q)ℤ[T,q] misses T; triangular coordinates give uniqueness | None |
| §4.2 relative FV system API | R=A; zero algebra; toric A, m=2 | F fixes right scalar T; FV=2 and VF=1+q remain different identities | None |
| §4.3 relative quotient and functoriality | m=1; R=A; toric ℤ[T]→ℤ[T,X],m=2 | The ε-detector distinguishes V₂(TX)⊗1 from V₂(X)⊗T; cross terms in the halved TX coefficient are divisible by 4 | None |
| §4.4 twisted ghosts and naturality | A=ℤ; A=R=ℤ[T],d=m=2; m=1 | T⊗1=1⊗T²; the reversed twist gives the false T⁴=T | None |
| §4.5 base change, polynomial image, colimits | Identity and zero base; toric T↦2 | ψ₂(T) maps to 4 while ψ₂(2)=2; this coefficient map is not a Λ-map | Non-Λ-map Check |
| §4.6 perfect-cover comparisons | R=A, A not perfect; toric ℤ[T]/ℤ; torsion R/ℤ | Comparisons exist before perfectness; isomorphisms keep relative-perfect hypotheses; V injection does not require R torsion-free | None |
| §5.1 étale preservation and F pushout | Identity; m=1; ℤ→𝔽₂ | Tor₁^ℤ(𝔽₂,𝔽₂)=𝔽₂, so the quotient is non-flat and not étale | Non-étale Check |
| §5.2 ghost pushout | R=A; identity; ℤ→𝔽₂,m=d=2 | B=ℤ[q]/(q²−1); Q₂(𝔽₂)=ℤ/4 with q=1. Resolve ℤ with q=−1 by alternating q+1,q−1; tensor gives 2,0 and Tor₁=2ℤ/4≅𝔽₂ | Derived-pushout negative control |
| §5.3 relative torsion and completion | A=ℤ; R=A; R=ℤ/4,m=1 | The element 2 is nonzero 2-torsion; perfect coverage of the base does not imply torsion-free coefficients | Coefficient-torsion Check |
| §5.4 finite type | Zero variables; one variable,m=2; countably many variables,m=1 | 1,T generate over the T²-subring; ideals (T₀,…,T_n) grow strictly in infinitely many variables | Non-Noetherian Check |
| §6.1 coefficient Frobenius | R=A; p invertible; R=ℤ×ℤ,p=2; smooth ℤ[T] | Étale product lift is identity; p-invertible completions vanish; polynomial Frobenius misses T modulo 2 | None |
| §6.2 cyclotomic Frobenius and all new ideal targets | p=2,3,d=1; p dividing d; R=0,A | Mod p the next factor is Φ_d^(p−1) or Φ_d^p, with positive exponent. For p=3 the ideals reduce to (h²) and (h); h is nonzero modulo h² | Supplier clause removed; general radical signature and boundary targets |
| §6.3 ghost Frobenius and deformation | m=p,d=1; p=2,m=2,A=R=ℤ | Teichmüller paths give r^p; q-fixed deformation sends 1+h to itself, whereas substitution gives 1+2h+h² | None |
| §7.1 differential V-system API | Level 1 polynomial de Rham; 𝔽₂ with u²≠0; even generator u | Odd strict alternation excludes u²≠0; even u is allowed; (T) is not differential since dT is outside | None |
| §7.2 initial differential quotient and V monomials | m=1; R=0,A,A[T]; characteristic 2 | All quotient relations have positive degree; degree zero survives; d(T²)=2T dT and dT²=0 | None |
| §7.3 differential FV API | m=1,2,3; polynomial T; mod 3 | F₃(dτ₃T)=T²dT while dF₃(τ₃T)=3T²dT; F is not a chain map | None |
| §7.4 prime differential identity and divided powers | x=0; p=2; q=1 truncated system Ω* with V₂ on degree i equal to 2^(i+1) | Structural maps id,gh₂ respect τ; V(ωdη)=VωdVη by degree scaling; dV₂(T²)=4T dT=V₂(T)dV₂(T) | Pseudo-theorem deleted; nonzero Check |
| §7.5 positive-degree Frobenius and θ API | p=m=2; τ₂(T), τ₂(T)², V₂(T); m=1 | θ₂τ₂T=T dT; θ₂(τ₂T)²=2T³dT; θ₂V₂T=dT | None |
| §7.6 differential ghosts | m=1,2; degree 0 and 1 | gh₂V₂(T)=2T; gh₂V₂(dT)=4dT; n^(i+1) is essential | None |
| §7.7 differential base change and descent | Identity; m=1; localization at T; noncentral associative square-zero DGA | d(T⁻¹)=−T⁻²dT; noncentral u with ux=0 cannot survive inversion of x | None |
| §8.1 framed automorphisms and uniqueness | r=0; polynomial rank 1; zero base; localization | γ(T²)=(1+2h+h²)T²; inverse requires q⁻¹, available in series; unique lifting works at every nilpotent quotient | Full series-algebra signature |
| §8.2 Jackson derivatives and commuting API | T,T²,T³,1,T⁻¹; char 2; two coordinates | D(T²)=(1+q)T; D(T⁻¹)=−q⁻¹T⁻²; cross-coordinate operators commute | None |
| §8.3 complexes and skew product | Rank 0,1,2; T² and dT·T | d_H(T²)=(q²−1)T dT; dT·T=qT dT; product is associative but not graded commutative | None |
| §8.4 framed Frobenius and chain/injection API | Rank 0; p=2; coordinate T; completion separatedness | φ(h)=2h+h²; H□ uses φ(dT)=T dT; C□ needs (1+q)T dT; injectivity uses reduced mod-p coefficients and p-torsion-freeness | None |
| §9.1 Frobenius decomposition | r=0,1; p=2,α=1; α=0 | Ring basis 1,T and form basis T dT,dT; zero exponent is not an inverse coordinate | None |
| §9.2 cohomology, kernel, unit and tensor API | e=α, α=0; p=2,α=1,e=0; u=1,p−1,p | In a domain f=gs gives ann(g mod f)=(s); constant coefficient u is a unit exactly when p∤u. At p=2, ann(h)=(h+2), cokernel ℤ₂. Ambient Tor₁(S₀,S₀)=S₀ | Unit/kernel signatures; p=2 boundary; ambient-Tor Check |
| §9.3 regular-parameter Bockstein API | m=1,2; zero variables; T² | β₁(T)=dT fixes positive sign; β₂(T²)=T dT; first coefficient m proves regularity over integer-torsion-free R | None |
| §9.4 product homotopy and quotient API | Rank 0,1; α=dX,β=YdX+XdY; α=dX∧dY,β=ZdX+XdZ | H=−XYdX and XZ dX∧dY respectively; boundaries give hX dX∧dY and hX dX∧dY∧dZ. Coordinate contraction has sign −T_i | None |
| §9.5 cohomology FV system | m=1,2; zero variables; T² cocycle versus T | T² commutes with dT modulo q²−1, T need not; torsion-free cohomology kills odd squares including at 2 | Bockstein reference |
| §9.6 simultaneous induction and ghost quotient | α=0; p=2; T dT; dV₂(T) | F₂(dV₂T)=dT but F₂V₂ω=2ω, so dV₂T is outside im V₂; both V and dV must be killed | Differential-quotient Check |
| §9.7 smooth comparison and p-local decomposition | m=1; R=0; p=2,m=6; p=3,m=2 | d=1,3 at p=2 use ψ₂,ψ₆; at p=3,m=2 Chinese remainders split q−1,q+1; tensor over the cyclotomic quotient avoids extra Tor | None |
| §10.1 smooth torsion-free exports | R=A; m=1; R=ℤ[x]/x² | Positive base degrees vanish; nonsmooth example has nonzero 2-torsion x dx | None |
| §10.2 bounded difference torsion and completion | m=1; A=R=ℤ,m=2; reduction mod 2 | Integral h-torsion is killed by h, since annihilators of h^k are (h+2); mod 2, h²=0 but h≠0 | Distinct integral/mod-2 bound Check |
| Seven supplier contracts | m=1; equal cyclotomic indices; α=0; rank zero; p=2; noncentral DGAs | Prime-generator/intersection exceptions retained; regularity, strict alternation, δ-compatibility and finite ideals explicit; unbounded completion stays a Part II contract | Only redundant radical clause changed |

For the new kernel statement, write B=ℤ_p[[h]], g=q^(p^e)−1 and s=∑_{j<p^(α−e)}q^(p^e j). Then f=q^(p^α)−1=gs and g≠0. If gx∈(f), cancellation in the domain B gives x∈(s). Conversely gs=f. For e=α, s=1, so the kernel is the whole quotient, as required. For p=2,α=1,e=0 this reads f=h(h+2), g=h, s=h+2. The quotient by h is the constant-coefficient ring ℤ₂. This proves the truth of the signatures independently of any elaboration.

The cyclotomic inequality has an explicit detector: reduce coefficients modulo 3, translate h=q−1 and quotient by h². Both 3 and Φ₃ vanish there, while q−1 maps to the nonzero h. Equal radicals follow from the positive-power cyclotomic identities. The exceptional cases p=2 and p|d remain included.

## Library, supplier and source checks

Mathlib was read at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, including `Mathlib/RingTheory/Etale/Basic.lean` (`Algebra.Etale`), `Mathlib/RingTheory/PowerSeries/Basic.lean` (`PowerSeries.algebraPowerSeries`), `Mathlib/RingTheory/PowerSeries/Inverse.lean` (`PowerSeries.isUnit_iff_constantCoeff`), `Mathlib/RingTheory/Polynomial/Cyclotomic/Expand.lean` (the two characteristic-p identities), `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`, `Mathlib/NumberTheory/Padics/PadicIntegers.lean`, and the truncated Witt carrier. Code search was used to locate declarations; search results on another commit were not used as pinned evidence.

Tau Ceti was read at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: `TauCeti/RingTheory/WittVector/Frobenius.lean`, `TauCeti/RingTheory/WittVector/Complete.lean`, and `TauCeti/RingTheory/Kaehler/FormallyEtale.lean`. Their characteristic-p, perfectness, adic completeness and scalar-tower hypotheses agree with the existing supplier contracts. None supplies the new framed series automorphism or the two-term q-cohomology target.

DerivedModuleAlgebra §§1.2–1.3 on main explicitly supply radical invariance of completeness and the completion reflector. DGAInfinity Layers 0–1 supply the DG carriers and signs; the declared Part II gaps remain. Main-branch roadmap shapes were read in DerivedModuleAlgebra, DGAInfinity, ComplexTori and GraphConnectivityAndFlows. The named-object search of the supplied ErdosProgressionPowers and ArithmeticDynamics roadmaps found no competing q-Witt or framed-difference ownership; ArithmeticDynamics consumes the ordinary cyclotomic polynomial API for a different purpose. No ownership moved across the merge order.

All eight works in `sources.toml` are legally cached and certified. The repair used borger line 1995 and borger line 2095 for numbering; bhatt-scholze line 594 and wagner-habiro line 493 for flatness; wagner line 1657 for ordinary Witt F-pushouts; wagner line 1856 for V-only differential identities; wagner line 2830, pridham line 371 and scholze line 319 for the framing; wagner lines 2950–3012 for two-term cohomology. Hesselholt's positive-index convention and ghost criterion were checked at hesselholt lines 205–267; Langer–Zink's underlying divided-power argument at langer-zink lines 601–645. No additional text or missing-reference request is needed.

## Check outcomes and maintainer notes

- **Lean elaboration:** unavailable, as specified in the brief. No Lean command was run. Generated types and the two new cyclotomic proof bodies still require the worker's elaboration check; mathematical verification is not an elaboration result.
- **Dependency check:** exit code 0, exact output:

```text
depcheck: 3 roadmaps, 20 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

- **Static consistency:** passed. Every named Lean declaration occurs in the README; both TOML files parse. `Suggested.lean` has 216 lines, one `import Mathlib`, two real-bodied definitions (counting the structure), four existing proved definition examples, eleven named theorem targets, no admitted data or examples, no `set_option` and no ambient variable blocks. The eight added targets use existing carriers and explicit binders. The cyclotomic boundary identities are proved named targets; the other new signatures use `sorry` honestly.
- **Whitespace:** `git diff --check` passed with no output.
- **Source access:** no unresolved missing source; no source text was stored in the package.
- **Remaining excluded-file work:** `packages/QWittVectors/design/plan.json` still requests the redundant radical/completion clause, still lists its §6.2 dependency, and still uses the old Layer 8 numbering. Only a maintainer authorized to edit that file can reconcile it. These residuals are recorded as not actionable above, not silently treated as repaired.
- **Names and consumers:** `QWitt.VPD_noFrobenius` is deleted; no mathematical replacement is needed. `QWitt.framedGamma_existsUnique`, the §6.2 boundary signatures and the §9.2 kernel/boundary signatures are additive. The existing ideal and unit API names are now written with their `QWitt` namespace explicitly. No existing mathematical endpoint was narrowed, and no consumer-side edit or merge-order change was made.

The validation repair converts TeX residue in three README Checks to ASCII formulas in code spans. It writes the same Layer 6–9 Lean declarations inside the fully qualified `TauCetiRoadmap.QWittVectors.QWitt` namespace; all full declaration names, signatures and proof bodies are unchanged. This avoids the identifier scanner treating the short declaration prefix as a promise to mirror every README-only q-Witt target. Finding headings retain the reviews' `F` IDs and identify the review in their bodies.

Validation recheck: the report parser recognizes nine merged finding sections; `tex=0`; `readme-ids-missing=0`. The namespace-equivalence check and `git diff --check` pass. The prescribed dependency check again exits 0 with `depcheck: 3 roadmaps, 20 edges, 0 problem(s)` and no UPWARD or CYCLE line. Lean elaboration remains unavailable; no Lean command was run.
