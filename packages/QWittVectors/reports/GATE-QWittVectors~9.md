## H01 (CBirkbeck) — answered

The supplier graph confirms the two direct and five inherited omissions below, all indexed as new open roadmaps and absent from main at 6bddefd; `TauCetiRoadmap/QWittVectors/README.md:60` and `TauCetiRoadmap/QWittVectors/README.md:92` already name the direct mathematical imports correctly, and LocalPurity is present on that main snapshot. The live PR description at a1d1ebe still omits these seven prerequisites from both lists and still contains the inaccurate consumer-only and no-other-author assertions: this blocking item remains unresolved for the worker, because this job forbids PR-description and merge-order edits; the seven verified edges do not certify the entire transitive merge closure.

| Omitted prerequisite | Verified contract and required relative order |
| --- | --- |
| SchemeKTheoryOperations | §§6.2.1–6.2.2 at 88dbd5a supply special λ-rings and Newton Adams operations; its AlgebraicModuliForArithmeticGeometry §1.3 and AlgebraicKTheory A2/A4 prerequisites precede it, and it precedes QWittVectors; no K₀ assumption on the λ/Witt bridge |
| PrismaticCohomologyPartII | §§3.16, 5.0, 5.13, 5.18–5.20 at 2a6d228 supply the framed calculus and comparisons; PrismaticCohomology precedes it, and it precedes QWittVectors |
| AlgebraicKTheory (kim-em) | SchemeKTheoryOperations §3.6 and its supplier contracts import A2's determinant, scalar section and SK₁ splitting and A4's semilocal shortening; AlgebraicKTheory precedes SchemeKTheoryOperations |
| ColemanPowerSeries | PhiGammaModulesAndIwasawaCohomology §2.5 and its analytic supplier contract at 6ec1d64 import §§1.45–1.49; ColemanPowerSeries §1.48 imports IntegralIwasawaTheory §7.1, giving IntegralIwasawaTheory → ColemanPowerSeries → PhiGammaModulesAndIwasawaCohomology |
| TangentialBordism (kim-em) | AInfCohomology §AI.7.2 and its supplier contracts at b47987b import §B4 items 2 and 7 for actual dual Steenrod Hopf algebras; TangentialBordism precedes AInfCohomology; this whole-roadmap prerequisite adds no Steenrod assumption to the Koszul construction |
| PurityOfBranchLocus (tdupu) | CrystallineCohomology's supplier contract and §CR.5:log-algebra.4 at 013a921 import §§0.1, 2.1–2.2; PurityOfBranchLocus precedes CrystallineCohomology |
| AbhyankarLemma (tdupu) | The same CrystallineCohomology contract and subsection import §§0.1–0.3, 1.1, 3.3–3.4; AbhyankarLemma precedes CrystallineCohomology |

## H02 (CBirkbeck) — applied

Fixed-base naturality → naturality for every compatible pair consisting of a Λ-map between perfectly covered bases and a map of their étale algebras, with the completed linearization square, identity/composition laws, prime-power iterations and the formal-étale uniqueness argument in `TauCetiRoadmap/QWittVectors/README.md:876`; the same laws propagate to the q-fixed cyclotomic and ghost interfaces at lines 906 and 926, with computed controls at lines 893, 918 and 937. The HabiroRings export at line 1428 and `TauCetiRoadmap/QWittVectors/Suggested.lean:21` now agree with that contract; the Lean docstring at line 45 explains that the Λ-base, Adams-twist and derived completed scalar-extension carriers are missing at the pins, so no substitute theorem is introduced.

### Source, ownership and signature verification

The extension is a consequence of unique completed coefficient Frobenius (wagner-habiro line 647, §2.7, pp. 15–16), its static completed linearization (wagner-habiro line 651), the q-fixed gluing map (wagner-habiro line 661), and the mod-p ghost diagram and its completed lift (wagner-habiro line 679 and line 709, proof of Theorem 2.9, pp. 16–17). The two composites R→R′/pⁿ have the same A-action because f commutes with Adams operations and the same reduction g(r)ᵖ; uniqueness for formally étale R/A proves the equality without flatness of f, and tensor functoriality supplies the linearization and coherence laws.

The supplied main snapshot is 6bddefd; Mathlib and Tau Ceti were inspected at the manifest pins 6b7abb3 and a91d3aa. Native `Algebra.FormallyEtale` in `Mathlib/RingTheory/Etale/Basic.lean:46` imposes vanishing Kähler differentials and first cotangent homology; it contains no completion condition, and its square-zero lifting characterization is `Algebra.FormallyEtale.comp_bijective` at line 76 and `Algebra.FormallyEtale.iff_comp_bijective` at line 85, with `Algebra.Etale` retaining formal étaleness at line 205. General thickenings and relative Frobenius remain the SchemeAndStackFoundations §§4.1 and 0.29 contracts; tensor functoriality and completion remain DerivedModuleAlgebra §§0.2, 1.2–1.3, 1.7.

The right scalar convention is native `Algebra.TensorProduct.includeRight` in `Mathlib/RingTheory/TensorProduct/Basic.lean:277`. The cyclotomic controls use `Polynomial.cyclotomic_zero` and `Polynomial.cyclotomic_one` in `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:278` and line 283, and the characteristic-p prime identities in `Mathlib/RingTheory/Polynomial/Cyclotomic/Expand.lean:131` and line 145; these retain primality and the relevant p-divisibility case. No generic deformation or completion carrier is re-planned.

Cross-roadmap references were resolved again against main and the indexed heads, with no unresolved roadmap citations; the supplier sections and named exports were checked in those copies. Ownership was searched by object across main, board packages and the 32 supplied sibling roadmap folders: HabiroRings at 74e3c94 explicitly assigns this interface to QWittVectors at `TauCetiRoadmap/HabiroRings/README.md:84` and consumes it in §§1.1 and 4.1, while HabiroNahmSeries's supplier contract gives the same uniqueness argument. QWittVectors therefore owns the additional naturality of its existing completed coefficient map; HabiroRings remains a consumer, with no reverse dependency or competing carrier. Ownership against other open pull requests without supplied files was not independently checked beyond index discovery and the named supplier-contract checks.

A single scratch elaboration of `#check @name` for all four declarations of `Suggested.lean` succeeded. The elaborated types match README §§1.1–1.2 and §8.1: each ghost declaration retains its commutative-ring binder, and both algebra structures, the scalar tower, polynomial-algebra étaleness and coordinate index remain on the framed theorem; no hypotheses were lost, and no signatures changed. The only Lean edits describe the additional unavailable headline interface. No additional sources were required and no missing-reference request remains.

### Adversarial mathematics pass

All new statements retain perfectly covered arithmetic Λ-bases A,A′, étale R/A,R′/A′, a Λ-map f and a compatible unital ring map g; p is prime, d>0 and iteration exponent a≥0. No conclusion is a hypothesis. Tests below evaluate the toric Adams operations ψ_n(t)=t^n, self-algebras and f(t)=0, and the localization ℤ→ℤ[1/3]. The nonflat map f kills the injective multiplication-by-t map after tensoring, so it is a substantive control. Nilpotent reductions are tested modulo 4. These are local consequences of the unique completed Frobenius, not new completion or deformation carriers.

| Statement | Instances tried | Values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| §6.1 pair compatibility and naturality | A=R=ℤ[t], A′=R′=ℤ, f=g:t↦0; p=2; r=t+2 | f(ψ₂(r))=f(t²+2)=2=ψ′₂(f(r)); modulo 4 both are 2 while f(r)²=0 | Survives a nonflat base map and nonreduced reduction | Fixed-base law → arbitrary compatible pair law |
| §6.1 balanced source map | Same pair; (t+2)⊗(t+3) | Both balanced representatives map to 2⊗3; for the base relation t·1⊗1=1⊗t² both images are 0 | Right factor and ψ₂ direction agree | Explicit source and target added |
| §6.1 linearization square | Same tensor | f((t²+2)(t+3))=6=ψ′₂(2)·3 | No flatness of f needed | Square added |
| §6.1 identity maps | f=g=id on ℤ[t] | r⊗a maps to (t+2)⊗(t+3); both linearization paths give (t²+2)(t+3)=t³+3t²+2t+6 | Identity preserved | Identity law added |
| §6.1 composite pair maps | t↦0 followed by ℤ→ℤ[1/3], p=2 | Composite and successive maps give 2⊗3, then 6 | Composition preserved | Composition law added |
| §6.1 iterated linearizations | a=0,1,2 on r=t+2 | Before f: t+2,t²+2,t⁴+2; after f: 2,2,2; a=1+1 gives ψ₂(ψ₂(t+2))=ψ₂(t²+2)=t⁴+2 | Iteration and exponent-zero law hold | Iterated pair naturality made explicit |
| §6.1 degenerate and excluded cases | p=3 after ℤ→ℤ[1/3]; zero target; smooth R=ℤ[T] over ℤ | First two squares: 0=0; in smooth case mod 2, T is not in 𝔽₂[T²] | All primes and zero rings covered; étaleness remains essential | Existing hypotheses retained |
| §6.1 lifting route | R=A=ℤ[t], R′=ℤ, n=1,2,3, r=t+2 | Both composites give 0 modulo 2, 2 modulo 4, 2 modulo 8; (2)²=0 modulo 4, (2)³=0 modulo 8 | Nilpotent uniqueness applies with the same base action | Uniqueness proof added |
| §6.2 pair maps on twists e=d,pd | p=2,d=1, e=1,2, r=t+2,a=t+3 | At either index, pair source map gives 2⊗3; φ₂ then f and f then φ′₂ both give 6 | Adams balancing and scalar direction agree | Pair square added |
| §6.2 common completion topology | p=2,d=1; p=3,d=1; d=0 | Φ₂ mod 2=q−1=Φ₁ mod 2; Φ₃ mod 3=q²+q+1=(q−1)²; Φ₀=1 on both sides for d=0 | Equal radicals, no need for equal ideals; d=0 not in coefficient theorem | Generality retained |
| §6.2 parameter and base compatibility | q=1+h, same nonflat pair | Both paths give 1+h; q↦q² would give 1+2h+h² | q-fixed convention retained | Explicit completed pair maps added |
| §6.2 iterations and composition | d=1,a=0,2; composite to ℤ[1/3], p=2 | a=0 retains r⊗a; a=2 gives (t⁴+2)⊗(t+3), then 6 on either path; composite also gives 6 | Iteration agrees with tensor functoriality | Iteration/coherence law added |
| §6.3 mod-p ghost pair naturality | p=2,d=1,m=4, τ₄(t+2), f:t↦0 | Top ghost r² specializes to 4; bottom r⁴ specializes to 16; their mod-2 values are 0; target τ₄(2) gives the same 4 and 16 | Two routes agree in the asserted mod-p diagram | Pair law added |
| §6.3 completed deformation of bottom map | Same pair, test input (t+2)²⊗1 in twist 2 | Completed φ₂ gives (t²+2)²⊗1, then 4; applying the pair map first gives 4 and φ′₂(4)=4; literal squaring instead gives 16; all reduce to 0 modulo 2 | Lift is not literal squaring before reduction | Completed naturality distinguished from mod-p formula |
| §6.3 identities, composites, iterations | Identity pair; composite to ℤ[1/3]; p=2, two steps | Identity keeps r⊗a and 1+h; composite of test tensor gives 6 and 1+h; two coefficient steps yield (t⁴+2)⊗(t+3), specializing to 6 | Compatibility follows from §§4.4–4.5 and 6.1–6.2 | All coherence cases explicitly exported |
| BigWitt.TruncationSet | Div(6), empty set, {2} | Div(6)={1,2,3,6}; empty set has 0 membership requirements; 1 divides 2 but 1∉{2} | Positive-divisor closure is substantive | No signature change |
| BigWitt.ghostPolynomial | x_d=1 on Div(6); n=0,1,2,6 | w₀=0 (empty divisors); w₁=1; w₂=3; w₆=12 | Total-function junk index excluded by positive carrier | No signature change |
| BigWitt.ghost_image | ℤ, φ₂=φ₃=id, x_d=1; no preimage b=(0,1); empty S; 𝔽₂ | n=6 differences:12−4=8∈2ℤ,12−3=9∈3ℤ; b₂−b₁=1∉2ℤ; empty ↔ has 0 conditions on both sides; w(0,1)=(0,0) in 𝔽₂ | No torsion-free or commutation hypothesis is needed for existence | No signature change |
| QWitt.framedGamma_existsUnique | Polynomial rank 1, rank 0, square-zero h²=0, characteristic 2 | γ(T)=(1+h)T, constant term T; γ(h)=h, inverse sends T↦(1+h)⁻¹T; mod h², inverse factor 1−h (1+h at 2); rank 0 has no i:Fin 0 | Actual carrier, h-adic continuity from series algebra action; no missing binder | No signature change |

Source basis: wagner-habiro lines 647–658 (unique completed Frobenius and its invertible linearization), lines 659–661 and 709–716 (q-fixed completed overlaps), lines 679–709 (mod-p ghost square); hesselholt lines 223–267 (Dwork criterion). New naturality and coherence laws are consequences of these constructions and the cited supplier uniqueness and tensor functoriality, not quotations from separate theorems.

### Validation

Commit: `2a7475f` — `QWittVectors: review repairs (export Frobenius naturality across arithmetic bases)`; only the two authorized roadmap files changed, the working tree is clean, and nothing was pushed.

`lake build TauCetiRoadmap.QWittVectors.Suggested` exited 0:

```text
⚠ [8976/8976] Built TauCetiRoadmap.QWittVectors.Suggested (2.4s)
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:82:8: declaration uses `sorry`
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:102:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

The four-declaration signature elaboration exited 0. The dependency direction command exited 0, with no UPWARD or CYCLE line:

```text
depcheck: 33 roadmaps, 301 edges, 0 problem(s)
```

The final gate exited 0:

```text
gate QWittVectors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
