# QWittVectors design repair

The mathematical findings are supported. R01, R03, R06 and R07 are repaired in the permitted design artifacts. R02 and the quotient part of R05 remain blocked by missing actual supplier contracts; R04 requires the merge-order owner. R08's prose cleanup is applied, but its request for actual contracts shares R02's blocker. This report does not certify acceptance.

## R01 (P1) — applied

§4.4's reversed coaction Check → `gh_1(s_m(a))=a⊗1=1⊗ψ_m(a)`, in both design artifacts. The toric m=2 witness computes T² and rejects T⁴=T. The target, right-factor action and twist remain as stated. No Lean file exists to update.

## R02 (P1) — applied differently

Unspecified supplier assertions → explicit required interfaces, with pinned cyclotomic factorizations and Kähler basis transport imported directly. The five residual contracts remain unresolved: no actual supplier sections were found. Proposed Part II requirements are identified as requirements, never existing contracts. Ownership cannot be repaired by editing these three design files; no supplier was replanned here.

## R03 (P2) — applied

Framed-only endpoint → §9.7 `QWitt.smoothDeRhamComparison`, covering every smooth R/A, perfectly covered A, prime and positive m, derived tensors, all Adams twists, cyclotomic factors, p-completion, E∞ multiplication and coherent functoriality. §9.6 remains the induction milestone. The completion requirement now permits unbounded cochain complexes with degreewise bounds. Construction dependencies and three Checks are explicit.

## R04 (P2) — applied differently

The asserted merge position → a statement solely about exported interfaces and supply direction. The prescribed gate was rerun and still exits 1 because QWittVectors is absent from the order. Registration requires the owner of the protected order file; that file was not edited. No clean dependency result is claimed.

## R05 (P2) — applied differently

DGAInfinity's overclaimed commutative/quotient interface → its actual associative carriers, maps, tensors and cohomology. §7.1 explicitly imposes homogeneous graded commutativity and strict odd alternation, with concrete Checks. §7.2 now records `gap:dga-quotient`, specifying the differential-ideal quotient and universal property. Its actual Part II supplier is still unavailable, so this finding remains partially unresolved.

## R06 (P3) — applied

§4.3's qualitative warning → an explicit toric level-2 witness detected by ε versus 0 in 𝔽₂[ε]/(ε²), with the relation killing their difference. §7.3's identity-map restatement → the nonidentity p=3 computation, including reduction modulo 3. §3.4 now requires a≥1 and retains the separate m=1 Check. Both design artifacts agree.

## R07 (P3) — applied

Target locators without printed pagination → versioned printed pages alongside extraction lines, including secondary references. The bhatt-scholze entry and References now include Remark 2.27, p. 20, bhatt-scholze line 775, cited for §2.3. Wagner's manifest records §9.7 and the extra quotient requirement; service provenance is preserved.

## R08 (P3) — applied differently

Checkout instructions, unavailable Lean-witness claims, consumer audit labels and the merge-position assertion → mathematical conventions, computed Checks and exported consumer interfaces. Mechanically split titles receive ordinary mathematical names. Supplier requirements are expressed without checkout or review narrative; actual contracts remain R02's unresolved external prerequisite. No fictitious Lean verification is asserted.

## Verification evidence

All sources used were the legally cached versions in `packages/QWittVectors/sources.toml`; no additional text required fetching and there is no missing-paper case. Printed pagination was checked against printed headers/footers, including the irregular extraction page markers in Wagner. Source text was not copied into this report or the design.

| Finding | Evidence checked | Mathematical conclusion |
| --- | --- | --- |
| R01 | hesselholt line 753, Definition 1.21, v3 p. 18; wagner lines 1318–1323, §2.31, v5 p. 26; wagner lines 1565–1582, §§2.44–2.45, p. 31 | The coaction's first ghost is a. Tensor balancing gives a⊗1=1⊗ψ_m(a). For A=ℤ[T], the twisted-base identification sends these to T² when m=2. |
| R02 | Main `TauCetiRoadmap/DerivedModuleAlgebra/README.md` §§1.5, 1.8; `TauCetiRoadmap/DGAInfinity/README.md` Layer 1; searches of active/completed roadmap files and packages | The former supplies quotient towers, Noetherian cohomology comparison and complete Tor-amplitude, not the full degreewise-hypothesis cochain theorem. The latter supplies associative DG carriers and cohomology, without either requested generic extension. The three named absent roadmap texts supply no inspectable sections. |
| R03 | wagner lines 2692–2702, Proposition 4.2, v5 p. 54; wagner lines 3198–3227, Lemma 4.25, pp. 64–65; wagner lines 3491–3583, §§4.34–4.35 and comparison proof, pp. 71–73; wagner lines 3644–3697, Lemma 4.36 and Proposition 4.2 proof, pp. 74–75 | The smooth equivalence is functorial and multiplicative. The general product uses ψ_(p^αd), not just ψ_(p^α). Lemma 4.25 imposes degreewise conditions, with no global boundedness premise. |
| R04 | `merge-order/ORDER.txt`; gate output below | The required registration is absent. The gate cannot certify a position by inferring one from prose. |
| R05 | Main `TauCetiRoadmap/DGAInfinity/README.md` Layers 0–1 and 7; wagner lines 1822–1838, Definition 3.1, v5 p. 37; wagner lines 1956–2010, Proposition 3.12 and Definition 3.13, pp. 40–41 | The signed associative carrier supports the two explicit multiplication conditions. The DG-category quotient in Layer 7 does not construct differential-ideal quotients of DG algebras. |
| R06 | wagner lines 1513–1528, Lemma 2.41, v5 p. 30; wagner lines 1348–1468, comparison image, pp. 27–29; wagner lines 1893–1929, Definition 3.6 and Lemma 3.7 proof, p. 39 | In the polynomial image for Q₂(ℤ[T,X]), coefficients with an odd exponent become even at q=1. Half the TX-coefficient modulo 2 is a derivation at the augmentation, since cross terms are divisible by 4. This proves the stated detecting map is multiplicative. It sends V₂(TX) to ε and V₂(X)⊗T to 0. Also F₃(dτ₃T)=T²dT, whereas dF₃(τ₃T)=3T²dT. |
| R07 | bhatt-scholze line 775, Remark 2.27, v4 p. 20; source printed headers/footers at the target line ranges | The omitted use is the single-prime perfection analogy for the multi-prime colimit; it is now recorded without attributing the multi-prime theorem to that remark. |
| R08 | README conventions, supplier requirements and consumers, compared with the actual artifact set | The unavailable Lean evidence and audit history were not mathematical hypotheses. They have been removed from the roadmap prose. |

The README shape was compared with main's `TauCetiRoadmap/DerivedModuleAlgebra/README.md`, `TauCetiRoadmap/DGAInfinity/README.md` and `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, at main commit `0e8b058a97cc4f9401d2679313e0e937761c1024`.

The two open sibling scopes were read at their actual heads: ArithmeticDynamics `1921611a7a96ac19fb15c2b1291b35958c3ef0cb` and ErdosProgressionPowers `e101259371172a32b3dd13e926676ae33b6af5cd`. ArithmeticDynamics was read from README blob `05bc3fc0bc4c41103081d7ead52c8a4a9d39aa95`, rather than substituting the differing package text. Scope reads and object searches found no competing q-Witt, arithmetic Λ, Jackson or regular-parameter DGA ownership in either sibling. Neither is added as a supplier.

### Pinned object checks

| Object | Pinned declaration/file read | Consequence |
| --- | --- | --- |
| Cyclotomic factorization | Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`, `Polynomial.prod_cyclotomic_eq_X_pow_sub_one`, `Polynomial.prod_cyclotomic_eq_geom_sum` | Both assume n>0 and a commutative coefficient ring. Imported directly; the integral ideal/intersection package is still required. |
| Étale differential basis | Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti/RingTheory/Kaehler/FormallyEtale.lean`, `TauCeti.kaehlerBasisOfFormallyEtale`, `TauCeti.kaehlerBasisOfFormallyEtale_apply` | Carries the commutative scalar tower and formal étaleness explicitly; it supplies the degree-one basis, not the exterior DGA or Cartier theory. |
| Bockstein carriers | Same Tau Ceti pin, `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean` and `Integral.lean` | These are group-cohomology coefficient-sequence constructions, not the required regular-parameter theorem on associative DGAs. A default-branch search also found `Bockstein/Leibniz.lean`, but the pinned fetch returned 404; it is not used as a supplier. |

### Remaining ownership requirements

These are not inaccessible sources. Each needs a real earlier section/target supplied by its owner, followed by a new dependency check. The design deliberately retains the `gap:` records instead of claiming these requirements are available.

| Requirement | Actual owner action needed | Affected targets |
| --- | --- | --- |
| `gap:cyclotomic-contract` | HabiroCyclotomicCompletions must supply the residual integral ideal, intersection, p-local CRT and radical/topology contracts beyond the imported Mathlib factorizations. | §§3.3, 3.4, 3.6, 6.2, 7.5, 9.3, 9.7, 10.1 |
| `gap:ordinary-derham` | DerivedDeRhamCohomology must supply ordinary exterior DGA, étale extension/descent and relative Cartier sections beyond the imported Kähler basis. | §§7.1, 7.7, 8.4, 9.6, 9.7 |
| `gap:cohomology-completion` | An actual DerivedModuleAlgebra Part II must state the unbounded cochain theorem under the three degreewise torsion conditions. | §9.5 |
| `gap:prismatic-frobenius` | PrismaticCohomology must supply q-PD/framed Frobenius/décalage sections and the PD-presentation comparison used to make §9.7 coherent and functorial. | §§9.6–9.7 |
| `gap:dga-bockstein` | An actual DGAInfinity Part II must state the regular-parameter multiplicative Bockstein and change-of-parameter laws. | §9.4 |
| `gap:dga-quotient` | An actual DGAInfinity Part II must supply homogeneous differential-ideal quotients, their universal property and generated differential ideals. | §7.2 |

No notion was taken from a later roadmap, and no generic supplier theory was moved here. The new §9.7 is the comparison on the q-Witt objects owned here. Its intermediate differential product is tensor over C_α=A[q]/(q^(p^α)−1); flatness is asserted over that quotient. The final de Rham comparison instead tensors over A. A negative-control Check records the extra Tor₁ introduced by using A[q] as the intermediate derived base. Its PD-presentation input enlarges the explicit prismatic requirement; it does not make that missing input available.

## Adversarial mathematics pass

Each target row includes its headline, definition, public laws, hypotheses and Checks. The results below are direct mathematical substitutions and interface audits, not Lean proofs or an assertion that all targets have been formalized. All-prime, nonunital absolute and arbitrary relative-base scope is retained. For these algebraic signatures, compactness and split-group tests are inapplicable; the relevant boundaries are zero rings, torsion, nonperfect bases, nonétale maps and empty frames.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | q=1; [0]_q; Φ₁; d=m; p=2,3; two-coordinate wedge | Polynomial rather than quotient division; right-factor twist; d¹(a,b)=D₁b−D₂a; positive Bockstein sign | Corrected first-ghost witness; no unavailable Lean claim |
| §1.1 and its API | S=∅, {1}, Div(2), Div(6), {2} | Empty product is singleton; w₆ has all four divisors; {2} fails closure | None |
| §1.2 and its API | ℤ, ℚ, 𝔽₂; S=∅ | Ghost collision (0,1) over 𝔽₂; units give triangular inversion | None |
| §1.3 and its API | W_∅, R=0; τ(1)+τ(1); nonunital square-zero R | Coordinates (2,−1); kernel model preserves nonunital operations | None |
| §1.4 and its API | n=1,2; Div(2); τ(−1); gcd(2,3), gcd(2,2) | Shifted domains and gcd factor correct; F₂V₂=2 | None |
| §1.5 and its API | a=0,1,2; p=2,3 | Length a+1; ghosts x₀⁴+2x₁²+4x₂ and x₀⁹+3x₁³+9x₂ | None |
| §1.6 and its API | S=∅,{1}; identity; finite versus infinite S; a=1,b=3 | Étale statement retains finite truncation; coprime iteration has matching coordinate count | None |
| §1.7 and its API | r=0,1,2; M=0; noncommuting D_i | d² is the commutator; flatness needed for cohomology base change | None |
| §1.8 and its API | N=1; ℤ,N=2; ℤ[1/p]; zero complex | Localization is essential; finite product and unbounded-complex domain retained | None |
| §2.1 and its API | ℤ; toric ℤ[T]; attempted identity Adams on 𝔽₂ | Full coaction excludes the torsion counterexample; ψ₂(2)=2 | None |
| §2.2 and its API | P=∅,{2}; empty generator set | Identity comonad, infinite p-typical carrier, free ring ℤ | None |
| §2.3 and its API | ℤ; toric ℤ[T]; identity transition | Rational nonnegative exponents give inverse Adams shifts; T is missing before perfection | Pagination and manifest use |
| §2.4 and its API | zero base; ℤ; ℤ[T]; ℤ[ε]/ε² with ψ_nε=nε | Dual numbers are torsion-free but ψ₂ fails flatness modulo 2 | None |
| §2.5 and its API | R=A nonperfect; ℤ[T]/ℤ; n=1,2 | Linearized map of base is an isomorphism; toric algebra over ℤ is not relatively perfect | None |
| §3.1 and its API | ℤ; zero nonunital ring; m=1,2 | VF=1+q excludes V₂=2 | None |
| §3.2 and its API | m=1,2; R=0; q=1 | Q₁=R; V₂(1)=1+q; specialization is not ordinary Witt restriction | None |
| §3.3 and its API | m=1,2; q=−1 versus q=1 | First ghost kills 1+q; F₂ sends it to 2 | None |
| §3.4 and its API | m=1,2,6; a=0,1 | Signed two-prime composite cancels; a=0 has no positive predecessor | Added a≥1 |
| §3.5 and its API | ℤ and 𝔽₂ at m=2; m=1 with torsion | Torsion hypothesis necessary for joint ghosts | None |
| §3.6 and its API | m=1,2; derived-discrete versus bounded torsion | Zero acting parameter completion is identity; hypotheses are distinct | None |
| §3.7 and its API | R=0,𝔽₂; m=1,2,6; square-zero kernel | V₂ survives in characteristic 2; kernel ring must allow no unit | None |
| §4.1 and its API | ℤ; toric ℤ[T]; m=1,2 | c₂ misses T; c_ms_m=ψ_m, not identity in general | None |
| §4.2 and its API | R=A; R=0; m=1,2 | Right A-scalars and q fixed; semilinearity would change the category | None |
| §4.3 and its API | R=A,0; toric ℤ[T,X]; m=1,2 | Detecting map gives ε versus 0 before quotient | Added explicit witness |
| §4.4 and its API | d=m=2,A=R=ℤ[T]; m=1; A=ℤ | Correct value is T², not the asserted equality T⁴=T | Repaired balancing Check |
| §4.5 and its API | identity base map; A′=0; polynomial R,m=2 | No flatness premise for ordinary Λ-base change; arbitrary base ring map lacks Λ data | None |
| §4.6 and its API | R=A; toric ℤ[T]/ℤ; torsion R over ℤ | Relative perfection and perfect coverage occur in distinct assertions | None |
| §5.1 and its API | identity; m=1; nonétale quotient | Étaleness supplies flat derived pushout, not arbitrary maps | None |
| §5.2 and its API | d=m=1; R=A; quotient by a nonregular element | Ghost pushout uses étale changed factor | None |
| §5.3 and its API | A=ℤ; R=A,m=1; nonperfectly-covered base | Perfect coverage is retained for descent of torsion/completion | None |
| §5.4 and its API | r=0,1; m=2; infinitely many variables | Finite generation uses finite type; filtered colimits need no finiteness | None |
| §6.1 and its API | p invertible; R=0,A,ℤ×ℤ; smooth ℤ[T]/ℤ | Zero completions allowed; coefficient equivalence fails for merely smooth R | None |
| §6.2 and its API | p=2,d=1,2; p=3,d=1 | Mod 3, Φ₃=(q−1)²; equal radicals do not imply equal ideals | None |
| §6.3 and its API | m=p,d=1; p=2; p divides d | q-fixed formula gives the same r^(m/d); q↦q^p is a different map | None |
| §7.1 and its API | exterior algebra; 𝔽₂[u] with |u|=1; even u; ideal (T) | Odd nonzero square excluded; (T) fails d-stability; even square may survive | Explicit multiplication conditions and Checks |
| §7.2 and its API | m=1; R=A,0; ℤ[T]; p=2 | Positive-degree relations preserve degree zero; dT²=0 is integral | Explicit unsupplied quotient interface |
| §7.3 and its API | m=2,3; R=ℤ[T]; reduction mod 3; n=1 | F₃dτ₃T=T²dT differs from dF₃τ₃T=3T²dT | Replaced identity-map Check |
| §7.4 and its API | p=2; x=0; Teichmüller generators | γ₂(V₂x)=V₂(x²), with no division by 2; no positive-degree F assumed | None |
| §7.5 and its API | p=2; ℓ≠p; m=1 | Integral θ₂τ₂T=T dT; Bézout determines coprime terms | None |
| §7.6 and its API | i=0,1; m=1,2; V₂(dT) | Degree-one smaller ghost is 4dT; exponent is i+1 | None |
| §7.7 and its API | identity; m=1; étale localization of A[T] | Differential on scalar extension differentiates new scalars; étale hypothesis retained | None |
| §8.2 and its API | r=0,1; characteristic 2; polynomial q versus q=1+h | q is invertible after completion; hT_i is regular by étale flatness | None |
| §8.3 and its API | n=0,1,2,3; q=1; characteristic 2 | D(T²)=(1+q)T; D(1)=0 avoids negative powers | None |
| §8.4 and its API | r=0,1,2; q=1; T,dT | dT·T=qT dT; skew product is not graded commutative | None |
| §8.5 and its API | p=2,3; r=0; T,h,dT | φ(h)=q^p−1; C needs [p]_q, H does not; coefficient injectivity uses reduced R/p | None |
| §9.2 and its API | r=0,1; α=0,1; p=2 | Basis 1,T in degree zero, T dT,dT in degree one; no inverse monomial needed | None |
| §9.3 and its API | α=e=0; e=α; p=2,α=1,e=0; two factors | H⁰=(h+2)S₁≅ℤ₂, H¹=S₁/(h)≅ℤ₂; ordinary tensor is over S_α | None |
| §9.4 and its API | m=1,2; T; rank 0; attempted f=0 | β_hT=dT; termwise regularity makes lift division unique; Fβ_fV=β_g by dx=gy | External Bockstein requirement retained |
| §9.5 and its API | m=1; zero variables; polynomial versus framed R | Bockstein recovers d despite zero differential modulo h; descent needs the completion input | Unbounded completion requirement corrected |
| §9.6 and its API | α=0,1; p=2; T dT modulo 2; kill only V | F₂(dτ₂T)=T dT; positive-degree quotient must also kill dV | Preserved milestone; linked general export |
| §9.7 and its API | m=1,2,6; p=2,3; R=0,A; A=ℤ[U] toric | Mixed m=6 factors require ψ₂ and ψ₆; m=2 splits at p=3 but not p=2; intermediate derived tensors must be over C_α, not A[q] | Added full smooth comparison and p-local differential decomposition |
| §10.1 and its API | R=A; m=1; ℤ[x]/x² | x dx is nonzero 2-torsion without smoothness; FV=n proves V-injectivity | None |
| §10.2 and its API | m=1,2; R=A; finite polynomial versus arbitrary base | (q−1)(q+1)=0 allows difference torsion without integer torsion; bound remains degreewise | None |
| Cyclotomic requirement | m=1; equal indices; p divides d; p=2,3 | Prime-generator formula excludes m=1; intersections require distinct factors; topology by radical | Imported two pinned primitives; ownership unresolved |
| Ordinary de Rham requirement | polynomial over 𝔽₂; nonperfect characteristic-p base; rank 0 | Cartier monomials need the relative twist; basis transport alone does not give DGA | Imported pinned basis; ownership unresolved |
| Cochain completion requirement | M^i=ℤ[q],d=0 for all integers i; p-torsion module; direct sum of ℤ[q]/h^r | First is unbounded and satisfies all three conditions; others violate required torsion conditions | Removed global boundedness; ownership unresolved |
| Prismatic/PD requirement | α=0,1; p=2; toric perfectly covered base; identity presentation | Empty décalage product at α=0; PD-presentation comparison supplies canonical map before descent | Expanded explicit input for §9.7; ownership unresolved |
| Generic Bockstein requirement | f=h,g=h; f=h²,g=h; f=0; scaled polynomial de Rham DGA | Multiplying a lift by f/g proves Fβ_fV=β_g; regularity cannot be dropped | Ownership unresolved |
| Generic quotient requirement | J=0,P; Ω*_{ℤ[T]/ℤ}, J=(T) versus (T,dT) | First two give P and zero; only the d-stable ideal gives a quotient differential | Explicit interface; ownership unresolved |

## Check outcomes and maintainer actions

The prescribed dependency check, on `packages/QWittVectors/design/README.md` with the supplied order, returned exit code **1** and exactly:

```text
NOT IN ORDER: QWittVectors (insert it after its last supplier)
depcheck: 3 roadmaps, 12 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. This is a failed dependency check, not a false positive or a clean result. The owner must register QWittVectors after all actual suppliers, including any Part II contracts established to close the gaps, and before its consumers; then rerun the gate. No order/tooling file was changed.

Additional local checks:

- JSON and TOML parsing: passed, eight source records.
- README/plan consistency: passed for all 52 target statements, 162 public API names, 156 Check texts and target locators. All internal target/gap references resolve.
- Structural scan: passed, ten layers, ten Examples subsections, ten Dependencies subsections; every target has three Checks and printed target pagination. Counts are not a mathematical correctness certificate.
- Restricted-content scan: passed, no machine paths in the edited artifacts or this report; no remaining checkout instructions or unavailable Lean-witness claims in the README.
- `git diff --check`: passed.
- Lean elaboration and elaborated binder checks: **not run**. There is no `Suggested.lean` in this package and no authorized Lean invocation in the brief. Creating or modifying one is outside the allowed edits. In particular the requested tensor-product Lean witness cannot be delivered here, and no theorem signatures or examples are claimed to elaborate. The general E∞ comparison remains a README target on heavy carriers.

No existing target/API name was deleted or renamed. New exports are `QWitt.smoothDeRhamComparison`, `QWitt.smoothDeRhamComparison_primePower`, `QWitt.smoothDeRhamComparison_natural` and `QWitt.differential_pLocalDecomposition`, all in §9.7. The new `gap:dga-quotient` records an existing construction need. Consumer-facing formulas keep their direction and names; consumers may now use the full smooth comparison once its supplier prerequisites are closed. No later roadmap became a supplier. No commits, GitHub writes or edits to protected files were made.
