# QWittVectors repair report

The two reviews contain two new findings, both in pass b (also called S01 and S02 in its summary). Pass a raises none. Earlier settled design-file discrepancies are not reopened. All verdicts below follow source and mathematical checks, independently of either review's acceptance.

## F01 (P3) — applied differently

Named characteristic-two and characteristic-three theorem targets → polynomial Checks justified by the exact Mathlib supplier declarations. Deleted both Lean declarations and both README target names; retained the unequal-ideals target. The proposed replacement by `example`s would still test only library objects, contrary to the required restriction to examples of this roadmap's kept definitions.

Evidence: at Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:283` is `Polynomial.cyclotomic_one`; `Expand.lean:131–132` is `Polynomial.cyclotomic_mul_prime_eq_pow_of_not_dvd`. Taking n=1 gives Φ_p=(q−1)^(p−1) in characteristic p, hence both disputed polynomial statements. `Basic.lean:378` also gives `Polynomial.cyclotomic_two`. The two pinned files were read from GitHub and matched the locally available copies byte for byte. The source context for the retained completion target is Wagner–Habiro §2.7, pp. 15–16, wagner-habiro line 647, and the proof of Theorem 2.9, pp. 16–17, wagner-habiro line 709.

The unequal-ideals target remains necessary: reducing modulo 3 and writing h=q−1 gives the ideals (h²) and (h) in 𝔽₃[h]. The class of h in 𝔽₃[h]/(h²) is nonzero. No definition or carrier was introduced to retain the two redundant polynomial statements.

## F02 (P3) — applied

The radical identity for d>0 → the same identity for every d∈ℕ. Removed the positivity argument from `QWitt.cyclotomicCompletedFrobenius_ideals`, updated its docstring and README hypotheses, and added the d=0 Check. The completed coefficient Frobenius theorem still has positive d. Added the exact zero-index declaration to the Mathlib supplier contract.

Evidence: pinned `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:278`, `Polynomial.cyclotomic_zero`, gives Φ_0=1 over every ring. Thus at d=0 both generating sets contain 1 and both ideals are the unit ideal. Their radicals coincide and both completion functors are zero. If p is a unit, both ideals are unit ideals for every d, including over the zero ring. Otherwise, for positive d, passing to the nonzero characteristic-p ring A/pA and using the two identities in `Expand.lean:131–146` gives Φ_pd=Φ_d^k with k=p−1 or p; k>0. Pullback of equal radicals proves the assertion for arbitrary commutative A. DerivedModuleAlgebra §1.2 `isDerivedCompleteRadical` identifies complete objects for these finitely generated ideals; §1.3 supplies the completion functor.

## Adversarial mathematics pass

All numbered sections, conventions, defining conditions, API clauses and Checks were read. Rows group the statements and their API laws by their shared section hypotheses; naturality, identity and composition clauses use the maps specified in that section. These are mathematical boundary inspections, not formal proofs of the admitted targets. Supplier gaps remain assumptions requiring independent implementations.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: indices, geometric sums, twists, completions and signs | m=1; n=0,1,2; right scalar T; h=q−1; two-term Koszul and Bockstein | [0]=0, [2]=1+q; twists use right scalars; d¹(a,b)=D₁b−D₂a; β₁(T)=dT | None |
| §1.1 truncation sets, ghosts and APIs | ∅, Div(6), {2}; indices 1,2,6 | Div(6) is closed, {2} is not; w₂=x₁²+2x₂; mixed divisors remain in w₆ | None |
| §1.2 ghost image, injectivity and units | ℤ, 𝔽₂, zero ring; empty S; ghosts (1,3), (0,1) | Congruence mod 2 distinguishes image; characteristic two defeats injectivity without its hypothesis; uniqueness only on S | None |
| §1.3 big Witt construction and maps | S=∅,{1},Div(2); nonunital square-zero ℤ | τ(1)+τ(1)=(2,−1); square-zero example has zero product; unitization keeps nonunital inputs | None |
| §1.4 F,V,τ and identities | n=1,2; S=∅; τ(−1); shifted truncations | F₂V₂=2; τ(−1)=−τ(1)+V₂τ(1); shifted domains agree | None |
| §1.5 p-typical comparison | length 0; a=0; p=2,a=1; p=3,a=2 | Length is a+1; ghosts match x₀²+2x₁ and x₀⁹+3x₁³+9x₂ | None |
| §1.6 étale and coprime comparisons | ∅,{1},Div(2); diagonal ℤ→ℤ×ℤ; a=1 and a=2,b=3 | F₂ pushout is ℤ×ℤ; rational ghost count is 4=2·2; finite truncation retained | None |
| §1.7 commuting-endomorphism Koszul bridge | r=0,1,2; zero module; two noncommuting matrices | Signed square is zero for commuting operators; excluded example has d²(u₁)=u₁e₁∧e₂ | None |
| §1.8 fracture and detection | N=1; M=0,ℤ,ℤ[1/p] | N=1 has zero right product; ℤ[1/p] requires localization for detection | None |
| §2.1 Λ-coalgebras and Adams APIs | ℤ; toric ℤ[T]; identity lifts on 𝔽₂ | ψ₂(2)=2, ψ₂(T)=T²; Adams congruences alone fail on torsion | None |
| §2.2 prime sets and free rings | P=∅,{2}; no generators | Identity versus infinite 2-typical comonad; free empty object ℤ | None |
| §2.3 perfection and universal maps | ℤ; toric ℤ[T]; zero ring | Toric perfection adjoins rational nonnegative exponents; T has no ψ₂-preimage before perfection | None |
| §2.4 perfect coverage and its criteria | ℤ[T]; perfect rings; ℤ[ε]/ε² with ψ_nε=nε | Polynomial ψ₂ is free of rank 2; dual-number ψ₂ is nonflat modulo 2 | None |
| §2.5 relative perfection and twists | R=A; toric ℤ[T]/ℤ; perfect R/ℤ | Base linearization is an isomorphism; polynomial T is missing from ψ₂-image | None |
| §3.1 absolute FV systems | Zero coefficients; E_m=ℤ[q]/(q^m−1); m=1,2 | FV=2 and VF=1+q are distinct; V₂=2 fails | None |
| §3.2 absolute quotient and initiality | R=0,ℤ; m=1,2; q=1 | Q₁=R; V₂(1)=1+q; q=1 specialization need not be ordinary Witt restriction | None |
| §3.3 ghosts and quotient | m=1,2 over ℤ | First ghost kills 1+q at q=−1; q=1 sends it to 2 | None |
| §3.4 exact V-resolution and signs | m=1,2^a,6; R=0 | At 6 the composite is −V₂V₃+V₃V₂=0; a=0 uses separate augmentation | None |
| §3.5 localization and torsion APIs | R=ℤ,𝔽₂; m=1,2 | V₂(1) is nonzero with zero ghosts over 𝔽₂; torsion hypothesis needed for detection | None |
| §3.6 completion | m=1,2; R=ℤ; q²−1 parameter | Parameter annihilates Q₂(ℤ), so completing that quotient leaves it unchanged | None |
| §3.7 Witt injection, exactness, decomposition | R=0,𝔽₂; m=1,2; prime-power exponent 0 | Witt injection retains V₂(1); exponent 0 gives cyclotomic factors | None |
| §4.1 Λ-comparisons and coordinates | A=ℤ, toric ℤ[T]; m=1,2 | Image at 2 is ℤ[T²,q]+(1+q)ℤ[T,q], missing T | None |
| §4.2 relative FV definition | R=A,0; toric base; m=1,2 | Right scalar T is fixed by relative F; VF has the q-integer | None |
| §4.3 relative quotient and initiality | R=A,0,A[X]; toric A=ℤ[T], m=2 | Dual-number witness separates V₂(TX)⊗1 and V₂(X)⊗T; quotient relation is needed | None |
| §4.4 twisted ghosts | m=d=1,2; A=R=ℤ[T]; A=ℤ | a⊗1=1⊗ψ_d(a); T maps to T² at d=2 | None |
| §4.5 base change, image and presentations | A′=A,0; R=A[T]; evaluation T↦2 | Evaluation is not a Λ-map: 4≠2; Λ-map hypothesis is essential | None |
| §4.6 perfect-cover comparisons | R=A; A=ℤ; toric ℤ[T]/ℤ | Scalar comparison survives nonperfect base; nonperfect R need not give an isomorphism | None |
| §5.1 étale preservation and F-pushout | Identity; m=1; ℤ→𝔽₂ | Non-étale quotient has Tor₁=𝔽₂, so flatness cannot be dropped | None |
| §5.2 ghost pushout | m=d=1,2; R=A; ℤ→𝔽₂ | Periodic resolution gives Tor₁=𝔽₂ at level 2 | None |
| §5.3 relative torsion and completion | A=ℤ; R=A,ℤ/4; m=1 | Q₁(ℤ/4) has nonzero 2-torsion; base coverage does not imply coefficient torsion-freeness | None |
| §5.4 finite type | r=0,1; m=2; infinitely many variables at m=1 | Basis 1,T suffices over subring containing T²; infinite variable ideal chain is strict | None |
| §6.1 completed étale Frobenius | R=A,0; p a unit; ℤ×ℤ; smooth polynomial algebra | Unit-p completions vanish; polynomial relative Frobenius misses T modulo p | None |
| §6.2 radical and completed Frobenius assertions | d=0,1,p; p=2,3; A=0,ℤ,𝔽₂; p a unit | Zero-index ideals are unit ideals; positive-index radicals agree, ideals need not; q stays fixed | F01 and F02 |
| §6.3 completed ghost Frobenius | m=p,d=1; p=2; A=R=ℤ | Teichmüller value is r^p; q↦q differs from q↦q² in ℤ₂[[h]] | None |
| §7.1 differential V definition | m=1; exterior forms; characteristic-two nonalternating algebra | Odd squares must vanish explicitly; graded ideal (T) is not differential | None |
| §7.2 initial differential quotient | m=1; R=A,0,A[T] | Positive-degree relations preserve degree zero; d(T²)=2T dT, including characteristic two | None |
| §7.3 differential FV definition | n=1,2,3 on T | dF_n=nF_nd; F₂dτ₂(T)=T dT versus dF₂τ₂(T)=2T dT | None |
| §7.4 V-only differential and PD identities | p=2; x=0,T; degree-i V₂=2^(i+1) | dV₂(T²)=4T dT; γ₂ uses no inverse of 2 | None |
| §7.5 positive-degree Frobenius | m=1,2; τ₂(T), V₂(T), τ₂(T)² | θ₂V₂(T)=dT; θ₂(τ₂(T)²)=2T³dT fixes semilinear derivation law | None |
| §7.6 differential ghosts | m=1,2; degrees 0,1 | V₂ coefficients are 2 and 4 respectively | None |
| §7.7 differential base change and descent | Identity; m=1; Laurent localization; noncentral DGA | d(T⁻¹)=−T⁻²dT; noncentral degree-zero example cannot carry the proposed localized multiplication | None |
| §8.1 framed γ and its Lean headline | r=0; A[T]; zero base; localization frame | Formal étaleness gives unique lifts; q=1+h is a unit; r=0 has no indexed γ | None |
| §8.2 Jackson derivative | 1,T²,T³,T⁻¹; characteristic two | D(T²)=(1+q)T; D(T⁻¹)=−q⁻¹T⁻²; no division by an integer | None |
| §8.3 framed difference DGAs | r=0,1,2; T² | d_H(T²)=(q²−1)T dT; dT·T=qT dT fixes skew convention | None |
| §8.4 framed Frobenius | p=2; r=0; C□ versus H□ | φ(h)=2h+h²; C□ needs 1+q on dT; H□ sends dT to T dT | None |
| §9.1 Frobenius decomposition | r=0,1; p=2,α=0,1; exponent 0 | Ring basis 1,T and form basis T dT,dT; no inverse T in zero-exponent convention | None |
| §9.2 two-term theorem and three Lean targets | e=α=0; e=α; p=2,α=1,e=0; u=1,p | ann(h)=(h+2); H¹=ℤ₂; e=α gives zero differential; u=p excluded | None |
| §9.3 Bockstein and parameter change | m=1,2; zero variables; T,T² | β₁(T)=dT and β₂[T²]=[T dT]; plus sign retained | None |
| §9.4 product homotopy | rank 0,1; (dX,YdX+XdY); degrees 2 and 1 | H(dX,ω)=−XYdX; commutator is hX dX∧dY, a boundary | None |
| §9.5 framed cohomology system | m=1,2; T versus T²; zero variables | T² is a cocycle modulo q²−1; T is not; cohomology commutativity does not assert cochain commutativity | None |
| §9.6 simultaneous induction and ghost quotient | α=0; p=2; T dT; dV₂(T) | Cartier cycle lifts through F₂; dV₂(T) is outside im V₂ because dT is not 2-divisible | None |
| §9.7 smooth comparison and local decomposition | m=1; R=0; (p,m)=(2,6),(3,2),(2,2) | Twists at m=6 are ψ₂,ψ₆; CRT at p=3; ambient polynomial derived tensor would add Tor₁ | None |
| §10.1 smooth integer torsion and V | R=A; m=1; ℤ[x]/x² | Smooth case has torsion-free differentials; excluded singular ring has nonzero 2-torsion x dx | None |
| §10.2 bounded difference torsion and completion | m=1,2; ℤ[h]/h(h+2); reduction mod 2 | Integral h-torsion has bound 1; mod 2, nonzero h has h²=0 and bound 2 | None |
| Supplier gap contracts | m=1,6; distinct/equal cyclotomic indices; zero-variable frame; regular f=h; nondifferential ideal (T) | Explicit exclusions and regularity remain necessary; generic supplier targets are not re-owned here | None |

The nine remaining Lean theorem signatures retain their own explicit binders: three ghost statements; the all-d radical identity and unequal-ideals boundary; the full étale framed automorphism headline; and three p-adic two-term statements. There are no ambient `variable` blocks. The four retained proved examples still test only `BigWitt.TruncationSet` and `BigWitt.ghostPolynomial`, at most two per definition. The library-only polynomial specializations, including Φ_0=1, are justified through supplier declarations rather than additional unrelated Lean examples.

## Check outcomes and maintainer notes

- **Suggested.lean elaboration:** unavailable as specified by the job; not run. No `#check @name` elaboration was available. Signature and binder checks above are textual.
- **Dependency check:** exit code 0, with output exactly:

```text
depcheck: 3 roadmaps, 21 edges, 0 problem(s)
```

No UPWARD or CYCLE line was emitted. The prescribed `gate --depcheck` invocation used `packages/QWittVectors/README.md`, roadmap name `QWittVectors` and `merge-order/ORDER.txt`.

- **Text consistency:** passed. Every one of the 11 remaining named Lean declarations appears in the README. The file contains nine admitted theorem signatures, four proved examples and two real-bodied definitions, with one `import Mathlib`; no forbidden declaration forms, ambient hypotheses, `set_option` or admitted data were introduced. Deleted names occur in neither deliverable.
- **Whitespace and edit scope:** `git diff --check` passed; changed files are exactly the two deliverables and this report.
- **Sources:** all eight manifest entries are certified and all eight cached extractions exist. No additional work or missing legal source was needed. `sources.toml` and `metadata.toml` remain unchanged and parse as TOML.
- **Duplication check:** searches by cyclotomic/radical/span objects in the pinned Mathlib and Tau Ceti cyclotomic polynomial modules found no existing radical or unequal-ideal theorem to replace the kept targets. The removed polynomial statements follow directly from the pinned declarations above.
- **Supplier ownership:** DerivedModuleAlgebra §1.2 supplies radical invariance; the seven declared supplier gaps are unchanged. Searches of main and the two supplied sibling roadmaps found no consumers of the changed or deleted Lean names. ArithmeticDynamics uses cyclotomic polynomials for dynatomic objects, which does not own these q-Witt completion assertions.
- **Downstream names:** `QWitt.cyclotomicCompletedFrobenius_charTwo` and `QWitt.cyclotomicCompletedFrobenius_charThree` are deleted. `QWitt.cyclotomicCompletedFrobenius_ideals` keeps its name but no longer takes a positivity proof. No local consumers needed updating; the coefficient Frobenius and unequal-ideal signatures retain their names and hypotheses.
- **Scope:** only the README, Suggested.lean and this report were changed. No commits or external writes were made. The earlier settled design-file discrepancies remain outside the permitted edits.
