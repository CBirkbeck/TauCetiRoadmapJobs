# Review of AlgebraicKTheory (pull request #1142 at ec22317)

**Verdict:** needs changes

Independent AI review of the four specified files at ec223173f6ae34ee01bcd356afcd7b816db9f345. The findings below are repairable. The supplied gate passes; mathematical counterexamples and a missing pinned supplier prevent acceptance. No pull-request file was changed.

## R01 (P1) — Exponential lifting does not imply surjectivity on K₁

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:669`: “so K₁ᵗᵒᵖ(A)→K₁ᵗᵒᵖ(B) is onto for surjective A→B.”

**Claim:** Every surjective continuous unital complex Banach-algebra homomorphism induces a surjection on stable components.

**Witness:** Restriction C(D²,ℂ)→C(S¹,ℂ) is surjective by Tietze. Its K₁ map is 0→ℤ. The boundary coordinate z has winding 1; every determinant extending invertibly over D² has winding 0.

**Repair:** Replace the conclusion by surjectivity GLₙ(A)₀→GLₙ(B)₀ for each n, proved by lifting the exponents in a finite exponential product. Retain the quotient comparison of §8.1. Add disk restriction as a negative-control Check: its identity-component map is onto, but its stable-component map misses [z]. This tests exactly the distinction the original implication loses.

## R02 (P1) — The balanced tensor supplier does not exist at the pin

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:23`, also :46, :95 and `Suggested.lean:22`.

**Claim:** Tau Ceti already supplies `TauCeti.BalancedTensorProduct` and its Basic, Unit, Corner and OuterFactors modules; §0.2 constructs only the remaining adapters and actions.

**Witness:** Tau Ceti HEAD equals the manifest pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. A whole-tree search finds neither `BalancedTensorProduct` nor `balancedTensorRelations`; `TauCeti/LinearAlgebra/TensorProduct/Balanced/` does not exist.

**Repair:** Make the ordinary associative balanced quotient and its universal property, maps and unit isomorphisms explicit targets preceding §0.2's outer actions and adjunction, rather than claiming a pinned implementation. Keep the specified quotient of the ℤ-tensor product and its balancing relation, with a single owner; cite an actual earlier supplier if assigning that construction elsewhere. Remove all claims that these four modules exist at this pin. The F₄ test must still distinguish 4 balanced tensors from 16 elements of the unbalanced tensor product. No pin change is required to repair the roadmap.

## R03 (P1) — The stable equality criterion needs two identity summands

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:365`: “after adding an identity triple (S,id,S) to each”.

**Claim:** Equal triple classes become isomorphic after adding the same identity triple to both.

**Witness:** Take T=id on finite-dimensional k-spaces. Both (0,id,0) and (k,id,k) represent 0. Adding (S,id,S) gives dimensions dim S and dim S+1, so they cannot be isomorphic.

**Repair:** Quantify independent objects S and S′: t⊕(S,id,S)≅t′⊕(S′,id,S′). For the witness take S=k and S′=0; both sides are (k,id,k). State the zero-class specialization separately and use this corrected criterion in the boundary exactness proof. Keep fullness where the proof uses it.

## R04 (P2) — State the positive-size hypothesis in K₂ Morita invariance

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:512`: “K₂(Mₙ(R))≅K₂(R)”.

**Claim:** Matrix Morita invariance is stated without a restriction on n, although the roadmap explicitly includes size-zero matrices.

**Witness:** For R=ℤ and n=0, M₀(ℤ) is the zero ring. The roadmap's own §5.2 gives K₂(0)=0, whereas §5.1 gives K₂(ℤ)=ℤ/2.

**Repair:** Require n≥1, just as §2.3 does for K₁, and state K₂(M₀(R))=0 separately as a README Check. At n=1 the map is the identity; at n=0 the repaired statement correctly gives 0 rather than ℤ/2.

## R05 (P2) — Reuse the native unitization and pullback facts

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:381–384` and :539–542.

**Claim:** The roadmap owns constructing Dorroh unitization, its augmentation splitting, and the pullback-projection surjectivity fact.

**Witness:** Mathlib `Algebra/Algebra/Unitization.lean:441,553,567,661` supplies that multiplication, ring, unit inclusion and augmentation; `RingTheory/LocalRing/Pullback.lean:87` supplies `RingHom.surjective_pullbackSnd_of_surjective` with the stated generality.

**Repair:** Put `Unitization ℤ J`, `Unitization ℂ A`, `Unitization.inlRingHom`, `Unitization.fstHom`, `Unitization.lift`, and the native pullback facts in the supplier contracts. Delete the duplicate construction/proof obligations, retaining reduced K-groups and genuinely new comparisons. A scratch theorem of the Dorroh multiplication closed with `exact Unitization.snd_mul x y`. For J=5ℤ, (2,5)(3,10)=(6,85), exactly the specified multiplication; for ℤ×_F₅ℤ, the native projection theorem gives the same surjective p₂ with kernel 5ℤ×0.

## R06 (P2) — Define Vaserstein's special meaning of essential

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:454`: “equivalently the largest d admitting an essential map to Sᵈ”.

**Claim:** The text uses essential maps to characterize covering dimension without defining essential.

**Witness:** Every map [0,1]→S¹ is null-homotopic, but dim[0,1]=1. Vaserstein p.20 instead fixes the inverse image of the equator and asks whether the map can be replaced by an equator-valued map there.

**Repair:** Define this relative-equator condition explicitly and distinguish it from non-null-homotopy. For example a(t)=(cos πt,sin πt) is null-homotopic but essential in Vaserstein's sense: its two endpoint values cannot extend to a continuous map [0,1]→S⁰. This restores the value 1 for the interval. Cite the definition on printed p.20, not just the name. [Vaserstein, definitions preceding Theorem 5](https://www.mathnet.ru/php/getFT.phtml?jrnid=faa&option_lang=eng&paperid=2577&what=fullt).

## R07 (P2) — Include the statable integral K₀ headline

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:3,111`; `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean:16–33,55`.

**Claim:** The acceptance file covers every statable headline and names the remaining ones as unstatable. The explicit K₀ calculations are listed as end theorems, but K₀(ℤ)≅ℤ is absent.

**Witness:** The existing `KZero` and `FiniteProjectiveRight` already type the normalized statement for ℤ. A scratch copy elaborated the same signature as `kZero_divisionRing`, with ℤ substituted for D and no DivisionRing assumption.

**Repair:** Add the normalized K₀(ℤ)≃ℤ theorem using those existing carriers, sending the rank-one free module to 1. This is not a small-value Check: it computes the entire group over a non-field. Also inventory the real tangent, Möbius and complexified-sphere end results in the module docstring, identifying genuinely missing carriers individually; their auxiliary algebraic identities do not state those K₀/module conclusions. The integral scratch signature elaborates at the unchanged pins.

## R08 (P2) — Resolve the clutching sign already fixed by the supplier

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:614,620,641`: “δ of the clutching function z (degree one) is ±β”.

**Claim:** The promised convention comparison still allows either sign.

**Witness:** `TauCetiRoadmap/TopologicalKTheory/README.md:142–150` on main puts E over D₀, F over D∞, uses the first-to-second transition z, and defines β=[L]−1 for that very transition. Here M(z) uses b=z a.

**Repair:** Order the disks as D₀,D∞ and state δ([z])=β and δ([zᵏ])=kβ; swapping the disks gives −β. Check k=1 and k=−1, yielding β and −β respectively. Do not leave the sign as an implementation choice. The supplier's conjugate-z Koszul symbol has the opposite class and must remain distinct.

## R09 (P3) — Apply the Lean form rules to both auxiliary files

**Location:** `TauCetiRoadmap/AlgebraicKTheory/MobiusSectionTargets.lean:1–22`; `TauCetiRoadmap/AlgebraicKTheory/SphereComplexificationTargets.lean:1–28`.

**Claim:** These files are target-signature files subject to the same form rules as Suggested.lean.

**Witness:** They contain eight Mathlib submodule imports in total and no `import Mathlib`; their seven definitions have no declaration docstrings. Their declaration names are absent from the README, and their module comments do not give the required headline/missing-carrier inventory.

**Repair:** Use the single `import Mathlib`, add the required module/declaration documentation and README name correspondence for definitions/results that survive the headline audit, and use the specified roadmap namespace/layer structure. The combined scratch copy with imports normalized to `import Mathlib` elaborated all 27 declarations, so the import repair needs no option override. The supplied passing gate does not establish compliance for these auxiliary forms.

## R10 (P3) — Remove Check-level admissions from the acceptance files

**Location:** `TauCetiRoadmap/AlgebraicKTheory/MobiusSectionTargets.lean:25,31`; `TauCetiRoadmap/AlgebraicKTheory/SphereComplexificationTargets.lean:31`.

**Claim:** `projection_periodic_idempotent`, `real_antiperiodic_has_zero`, and `rawSection_laws` are offered as admitted acceptance targets.

**Witness:** These repeat the explicit projection/IVT/raw-section Checks in README :165, :186 and :188. Their conclusions contain none of the finite-projective, nonfree, scalar-extension or K₀ assertions those sections aim to establish.

**Repair:** Delete these admissions from the target-signature files; do not promote them to Suggested.lean or prove them in place. Keep their mathematics as README Checks. For the sphere, the north-pole values are 0, 2 and √2>0; for the projection at t=0 the value is diag(1,0); for cos πt the zero is t=1/2. These remain useful Checks without becoming headline tests. One-tactic probes did not close them; the independent Check-mirroring criterion is the reason for this finding.

## R11 (P3) — Supply exact locators and correct the patching references

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:95,156,220,252,291,381,438,553,587,626,651,694–698`.

**Claim:** Each target is traceable to a precise legal source. Several sampled targets have no attached locator; the patching and six-term locators point at the wrong chapters/sections.

**Witness:** weibel Chapter I line 536 is Patching Theorem 2.7; Chapter III line 783 is the six-term Theorem 2.6. Chapter II line 595 is only the shorter K₀ sequence. grebennikov line 205 is in §2.4, not §2.3.

**Repair:** Cite Weibel I.2.7, chapter p.12 for §6.2; III.2.6, chapter p.15 for §6.4; and Grebennikov §2.4, p.5 for the one-surjective-leg criterion. Add individual locators to the sampled §0.2, §0.6, §1.2, §1.4, §2.2, §3.4, §4.3, §6.1, §7.2 and §8.1 claims. For example III.1.2.3, p.3 supports elementary lifting and II.§2, p.5 supports the normalized division-ring/integer K₀ calculations. A standard adjunction, a new explicit frame, and a covering-dimension theorem need their own supporting locator/proof attribution rather than the entire bibliography. Record the works once each in sources.toml; none is present at this head. Rechecking the one-leg cusp square against the corrected locations preserves the stated patching theorem and ℤ/5 calculation.

## Verified sound

The 141-row adversarial table below gives finite witnesses and consistency tests, not proofs of the general theorems. Each row records an actual value or logical truth value, including the negative controls. All nine layers and all four requested files were read. The headline audit, pinned-source audit and source sample follow the table.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Conventions: right modules, column matrices | R=M₂(k), a=E₁₂, b=E₂₁ | ab=E₁₁; ba=E₂₂; left matrix action commutes with right scalar action | Order matters; retained |
| Conventions: additive K₁ and inverse | ℤ, u=−1 | [u]+[u]=0=[u²]; [u]≠0 | Retained |
| 0.1 finite projectives | D, ℤ/5 over ℤ, zero ring | ranks over D are 0,1,2,…; ℤ/5 has torsion and no free summand realization; Proj(0) has only 0 up to iso | Definition distinguishes finite/projective requirements |
| 0.1 complements and summand closure | e=diag(1,0) over k | im e=k, im(1−e)=k; k⊕k=k² | Retained; no free-complement assumption |
| 0.1 small matrix model | e=0,1 in M₁(k) | image dimensions 0,1; objects have inequivalent isomorphism classes | Retained |
| 0.2 balancing | F₄ over ℤ | cardinalities 4 for F₄⊗_F₄F₄, 16 for F₄⊗_ℤF₄ | Correct mathematics; repair supplier R02 |
| 0.2 non-flat finite-projective base change | ℤ→F₂, P=ℤ² | P⊗F₂=F₂²; rank 2 on both sides of free-base-change formula | No flatness needed |
| 0.2 all-module adjunction | ℤ→F₂, M=ℤ, N=F₂ | Hom_F₂(F₂,F₂) and Hom_ℤ(ℤ,F₂) both have 2 elements; value at 1 determines each map | Retained |
| 0.2 unit/counit and triangles | ℤ→ℚ, m=2, scalar 3 | 3⊗2 maps to 6; applying unit then counit returns 2; counit on 1⊗3 returns 3 | Retained |
| 0.2 associator and identity | ℤ→ℚ→ℚ | (2⊗3)⊗5 and 2⊗15 both map to 30; 2⊗1 maps to 2 | Retained |
| 0.2 restriction warning | ℤ→ℚ | ℚ is rank-one free over ℚ, not finite over ℤ | Correct exclusion |
| 0.3 KZero and division-ring calculation | k, ℍ, 0 | [D]↦1, [D²]↦2 in ℤ; K₀(0)=0 | Native statement sound on tested cases |
| 0.3 integral K₀ calculation | ℤ | [ℤ]↦1, [ℤ²]−[ℤ]↦1 | Statable headline missing: R07 |
| 0.3 K₀ products | k×k | [(k,0)]↦(1,0), [(0,k)]↦(0,1), [k×k]↦(1,1) | Retained |
| 0.3 corner Morita convention | M₂(k), n=1, n=0 | corner class↦1, regular class↦2; n=1 identity; M₀(k)=0 | Positive-size qualification in prose is essential |
| 0.3 K₀ functor laws | ℤ→ℚ→ℚ, identities | 1↦1↦1; composite and identity both send free rank r to r | Retained |
| 0.4 rectangular equivalence | e=E₁₁, f=E₂₂ | E₁₂E₂₁=e, E₂₁E₁₂=f; image ranks 1=1 | Retained |
| 0.4 side conditions | e=f=0, x=1,y=0 | xy=yx=0 but ex=0≠1; compressed x=y=0 satisfies both | Discriminating Check |
| 0.4 V and group completion | k, 0 | V(k)=ℕ→ℤ, rank 2+1=3; V(0)={0}→0 | Retained |
| 0.4 difference/free-stabilizer description | k²,k | [k²]−[k]=1=[k]−[0]; equal rank 2 is stabilized by rank 0 | Retained; stable equality does not imply cancellation generally |
| 0.5 tangent projection | x=(0,0,1); x=(0,0,2) | p=diag(1,1,0), p²=p; off unit sphere p=diag(1,1,−3), p²=diag(1,1,9) | Unit-sphere hypothesis necessary |
| 0.5 splitting | x=e₃, v=(a,b,0), f=c | v+fx=(a,b,c); inverse gives ((a,b,0),c) | Both composites identity |
| 0.5 nonfreeness and stable class | S² | fibre rank=2; no nowhere-zero real field; [P]+1=3 hence [P]=2 | Retained; invokes resolved hairy-ball supplier |
| 0.6 complex scalar-extension map | x=e₃, v=e₁, f=i | v⊗i↦i e₁; p_ℂ(i e₁)=i e₁ | Source and target match |
| 0.6 complexPoint/rawSection, tangency and denominator | x=e₃ | x·w=0; w̄·w=2=1+x₂²; d=√2>0 | Retained mathematics; raw-law admission R10 |
| 0.6 firstSection/secondSection | x=e₃ | u=(1,i,0)/√2; v=(i,1,0)/√2; u* v=0; both norms²=1 | Conjugation is needed |
| 0.6 frame_unitary | x=e₃ and e₁ | U*U=UU*=I₃ at both; at e₁ columns are (0,i,0),(0,0,−i),(1,0,0) | Retained |
| 0.6 reconstruction | z=u+2v | (u* z,v* z)=(1,2); inverse returns u+2v | Both module maps agree |
| 0.6 sphere constraint negative control | x=0 | w̄·w=2≠1+x₂²=1; frame's third column=0, so U*U≠I | Lean hx excludes it |
| 0.6 tangent complex line versus complexification | outward S² | rank_ℂ(P_ℂ)=2 and c₁=0; J-oriented tangent line rank=1 and c₁[S²]=2 | Distinct objects; supplier C7 agrees |
| 0.7 antiperiodic module and norm | cos πt, constant 1 | v(t+1)=−v(t), sup on each unit interval=1; constant 1 has 1≠−1 | Correct real nonexample |
| 0.7 projection | t=0,1/2,1 | p=diag(1,0),diag(0,1),diag(1,0); each p²=p and trace=1 | Retained Check; R10 |
| 0.7 section/idempotent maps | t=0, v=2, w=(3,0) | inner(u,vu)=2; u inner(u,w)=(3,0)=pw | Inverse/isometry formulas agree |
| 0.7 real zero obstruction | v=cos πt | v(0)=1, v(1)=−1, v(1/2)=0 | Retained Check; R10 |
| 0.7 doubled splitting | t=0 and 1/2 | frame (u,u_perp)=I₂ and [[0,−1],[1,0]], determinant 1 at both | M⊕M≅R² |
| 0.7 exact order of η | real Möbius line | 2η=0; stabilization has det B(t+1)=−det B(t), forcing a zero, so η≠0 | Order exactly 2, not inferred from nonfreeness alone |
| 0.7 phase and complex factorization | χ(t)=exp πit; v=χ and v=0 | χ(0)=1,χ(1/2)=i,χ(1)=−1; periodic factors uniquely 1 and 0 | Retained |
| 0.7 scalar extension and K₀ effect | M_ℝ→M_ℂ | rank remains 1, M_ℂ≅R_ℂ, η↦1−1=0 | Retained |
| 1.1 elementary addition/inverse | e₁₂(2),e₁₂(3) over ℤ | product=e₁₂(5); e₁₂(2)e₁₂(−2)=I | Retained |
| 1.1 elementary commutators | M₂(k) coefficients a=E₁₂,b=E₂₁ | [e₁₂(a),e₂₃(b)]=e₁₃(E₁₁), not e₁₃(E₂₂) | Multiplication order correct |
| 1.1 distant commutation | e₁₂(2),e₃₄(3) | both products=I+2E₁₂+3E₃₄, commutator I | Index conditions sufficient |
| 1.1 generators and SL comparison | n=0,1,2; k=F₂ | E₀=E₁=1; E₂=SL₂=GL₂ has 6 elements, commutator subgroup has 3 | Not an abelian group in finite rank |
| 1.1 ring maps and block factors | ℤ→F₅, e₁₂(7); block A=(2,3) | image=e₁₂(2); upper block=e₁₂(2)e₁₃(3) | Retained |
| 1.2 GL∞ representatives and injections | diag(−1),diag(−1,1),diag(−1,−1) | first two stabilize equally; third has second diagonal −1≠1 at every stage | Correct equivalence relation |
| 1.2 finitary realization | e₁₂(1) | e₂↦e₂+e₁, other basis vectors fixed; cannot be a size-one matrix | Column convention agrees |
| 1.2 E∞ and zero ring | R=0; e₁₂(1) over ℤ | GL∞(0)=E∞(0)=1; elementary witness appears at stage 2 | Retained |
| 1.2 filtered colimit/ring functoriality | ℤ→ℤ[1/2]→ℚ, diag(2) | 2 becomes a unit at stage ℤ[1/2]; inverse 1/2 already present there | Finite inverse data descend |
| 1.3 Whitehead inverse block | T=−1, n=1 | rotation [[0,−1],[1,0]] squared=−I₂=diag(T,T⁻¹) | Correct sign |
| 1.3 finite commutator headline | g=(12),h=(23) in GL₂(F₂)≅S₃ | [g,h]=(132), determinant 1; diag([g,h],I₂)∈E₄ | Retained |
| 1.3 perfectness/commutator bound | n=3, n=2 over F₂ | e₁₂(1)=[e₁₃(1),e₃₂(1)]; at n=2, 6-element E₂ not contained in 3-element derived subgroup | n≥3 necessary |
| 1.3 empty-size factorization | n=0 | GL₀=1; all blocks and products are the unique empty matrix | No empty-index defect |
| 1.4 elementary lifting | ℤ→F₅, diag(2,3) | X=[[-8,5],[-5,3]] reduces to diag(2,3); det X=−24+25=1 | Explicit valid lift |
| 1.4 nonlifting/universal-liftability control | 2∈F₅ˣ; −1∈ℤˣ | lifts of 2 among ±1: none; −1 always lifts but class in K₁(ℤ)≠0 | Correct exclusions |
| 2.1 K₁ quotient and universal property | F₂; ℤ | GL∞/E∞=0 for F₂, but GL₂^ab=C₂; for ℤ quotient={±1} | Stable carrier essential |
| 2.1 block, inverse and conjugacy relations | ℤ, u=v=−1 | diag(−1,−1) has class 0=1+1 in C₂; inverse class=class | Retained |
| 2.1 products and filtered colimits | F₂×F₃; union of finite fields | K₁=1×C₂=C₂; a unit and its inverse belong to one finite subfield | Retained |
| 2.2 automorphism presentation | Proj(F₅), α=2,β=3 | composition class=class(6)=class(1)=0; det(diag(2,3))=1 | Relations agree with matrix K₁ |
| 2.2 triangular additivity | [[2,1],[0,3]] over F₅ | det=6=1, same as det(2)det(3), independent of corner | Retained |
| 2.2 complement independence | scalar 2 over F₅, complements 0,k | det(2)=2=det(diag(2,1)) | Retained |
| 2.2 zero category/functoriality | zero category; ℤ→F₅ | class=0 in zero category; [−1]↦[4] of order 2 | Retained |
| 2.3 Dieudonné determinant headline | F₂,n=2; ℍ,n=2 | F₂ target=1, kernel=all 6 matrices; diag(i,1)↦1, diag(2,1)↦2 under norm identification | Correct despite source's extraneous exception |
| 2.3 size-one noncommutative control | ℍ,n=1 | commutator units form S³, but E₁={1}; quotient ℝ>0 | n≥2 necessary |
| 2.3 split determinant and SK₁ | ℤ, F₅ | SK₁=0; K₁ values C₂ and C₄; scalar sections return determinant unchanged | Retained |
| 2.3 matrix/product computations | M₂(F₅),F₂×F₃ | K₁ values C₄,C₂ respectively | Positive-size normalization agrees |
| 3.1 congruence groups/normal closure | I=0 and I=R | GL(R,0)=E(R,0)=1, relative K₁=0; I=R gives GL/E=K₁(R) | Retained |
| 3.1 exactness at K₁(R) | ℤ, I=5ℤ and 2ℤ | kernel of ±1→F₅ˣ is {1}; kernel of ±1→F₂ˣ is both elements | Correct images, not definition as kernel |
| 3.1 relative conjugates | x∈I in e₁₂(r)e₂₁(x)e₁₂(−r) | modulo I product=e₁₂(r)Ie₁₂(−r)=I | Normal-closure convention works |
| 3.2 triple relations and difference | T=id; T:C→0 | first K₀=0; second triple (P,0,0)↦[P] and inverse returns same class | Retained |
| 3.2 fullness of quotient base change | ℤ→F₅, multiplication 2 | map on ℤ lifts multiplication 2 on F₅; P projective enables general lift | Fullness has stated proof input |
| 3.2 relative calculation | ℤ→F₅ | F₅ˣ/{±1}=C₂; [(ℤ,2,ℤ)] has difference 1−1=0 and order 2 | Retained |
| 3.2 non-full control | ℤ→ℚ | diag(2,1/2) class=0; entry 1/2 forbids any integral stable invertible realization | Fullness warning sound |
| 3.3 boundary construction | ℤ→F₅ | δ(2)=δ(3)=1 in C₂; δ(4)=δ(1)=0 | Composition/naturality signs agree |
| 3.3 two exact interior terms | ℤ→F₅; T=id | ker(ℤ→ℤ)=0=image difference; ker difference=C₂=image δ; identity case middle=0 | Retained |
| 3.3 full stable equality criterion | T=id, triples on 0 and k | classes 0=0; same stabilizer gives dimensions r versus r+1 | False as stated; R03 |
| 3.3 corrected independent stabilizers | same triples, S=k,S′=0 | both stabilized triples have source/target k and identity map | Repair passes original counterexample |
| 3.3 non-full determinant control | ℤ→ℚ | δ(2) detected by 2 mod ±1≠1; kernel on ℚˣ is ±1 | Retained instance; does not prove general non-full equality criterion |
| 3.4 unitization multiplication/augmentation | J=5ℤ, x=(2,5),y=(3,10) | xy=(6,85); product after map to ℤ×ℤ=(6,91), equal to (6,6+85) | Reuse native carrier: R05 |
| 3.4 unital/zero reductions | unital k; J=0 | J⁺≅ℤ×k with projection kernel Kᵢ(k); 0⁺=ℤ, kernel=0 | Retained |
| 3.4 arithmetic reduced group | J=5ℤ | J⁺≅ℤ×_F₅ℤ, K₀=ℤ⊕C₂, augmentation kernel=C₂ | Retained |
| 4.1 stable-range predicate | R=0; R=ℤ,s=0 | empty sum=0=1 in zero ring; in ℤ, row (1) would require 0=1 | Size-zero handling correct |
| 4.1 monotonicity/opposites | k and M₂(k) | both sr=1; opposite matrix algebra again sr=1; every s≥1 bound true | Retained |
| 4.1 ℤ negative control | row (2,5),s=1 | 2·3+5·(−1)=1; 2+5c never equals ±1 | sr(ℤ)>1 |
| 4.1 surjective stability headline | F₅,s=1,n=1, g=diag(2,3) | choose h=1, e=g, since det g=1; diag(h,1)e=g | Retained |
| 4.1 injective stability headline | F₅,s=1,n=2 | g=diag(2,3) elementary; diag(2,1) has det2 at every stage and fails hypothesis | Retained |
| 4.1 abelianization bound | F₂,s=1,n=2 | GL₂/E₂=0=K₁, but GL₂^ab=C₂ | Distinguishes quotient from abelianization |
| 4.2 finite-maximal-spectrum headline | F₅×F₇; ℤ | sr product=1; ℤ has infinitely many maximal ideals and sr=2 | Hypothesis used |
| 4.2 Bass dimension-bound headline | ℤ; ℤ[t]; zero ring | dimensions 1,2,⊥; bounds 2,3,d+1; zero ring satisfies all bounds | No junk ⊥ cast issue |
| 4.2 Jacobson reduction | F₂[ε]/ε², row (ε,1+ε) | shortened value ε+(1+ε)=1; quotient F₂ also sr=1 | Use ideals contained in Jacobson radical |
| 4.3 covering predicate | empty space; finite discrete X | empty refinement multiplicity 0; singleton cover multiplicity 1 | Correct d=0 controls |
| 4.3 interval obstruction | d=0, overlapping two-set cover | connected disjoint open refinement must have one nonempty member X, which is contained in neither cover member | Bound false at 0, true at 1 |
| 4.3 closed subspaces/finite closed covers | [0,1]=[0,1/2]∪[1/2,1] | component bounds 1,1; union dimension 1, endpoints dimension 0≤1 | Retained |
| 4.3 infinite dimension/value | Hilbert cube | closed (d+1)-cube has dimension d+1>d for every d; value ⊤, versus empty value ⊥ | Correct distinction |
| 4.4 indexed refinement | two identical indexed copies of point | indexed multiplicity 2; deduplicated/range multiplicity 1 | Parent/deduplication condition needed |
| 4.4 sphere extension | endpoints of interval to S⁰ | values −1,+1 do not extend to connected interval; S¹ extension criterion gives dim≤1 | Retained |
| 4.4 stable-value dimension | point; interval map t↦t−1/2 | point has d=0; perturbations of interval map of size <1/2 still change sign and hit 0 | Values 0 and 1 |
| 4.4 essential-map equivalence | a(t)=(cos πt,sin πt) | homotopy class=0; equator endpoint obstruction≠0 | Define specialized sense: R06 |
| 4.4 subordinate partitions | point cover, two repeated members | weights (1,0), sum=1, support multiplicity 1 | Retained |
| 4.5 complex Vaserstein headline | point, interval, S²; s=1,2 | stable ranks 1,1,2; at s=1 inequalities dim≤1 are T,T,F; at s=2 all T | Both sides agree |
| 4.5 real Vaserstein headline | point, interval; s=1,2 | ranks 1,2; dim≤s−1 gives (T,F) at 1, (T,T) at 2 | Both directions tested |
| 4.5 infinite/empty cases | Hilbert cube; ∅ | both finite-bound predicates F for cube, T for empty; C(∅)=0 | Retained |
| 4.5 s≥1 control | point,s=0 | stable range false; truncated 2·0−1=0 and 0−1=0 make dimension predicates true | Lean hs prevents false equivalence |
| 4.5 topological stable rank | point; interval over ℂ; S² | unimodular density thresholds 1,1,2, equal to Bass ranks | No general Banach-algebra equality inferred |
| 5.1 finite Steinberg presentation | n=0,1,2 over ℤ | St₀=St₁=1; St₂≅ℤ*ℤ nonabelian, matching absence of three-index relation | Retained |
| 5.1 coefficient/order relations | M₂(k),E₁₂,E₂₁ | images of commutator relation have coefficient E₁₁, not E₂₂ | Same convention as §1.1 |
| 5.1 stable universal central extension headline | R=0; R=ℤ | at 0, both groups and kernel trivial; at ℤ kernel C₂, so identity extension is not universal | Retained |
| 5.2 K₂ and absolute exact sequence | F₂; zero ring | K₂=0, St→E has zero kernel; GL/E=K₁=0 | Correct boundary cases |
| 5.2 matrix Morita claim | R=ℤ,n=0; n=1 | n=0 gives 0 versus C₂; n=1 gives C₂=C₂ | Add n≥1: R04 |
| 5.2 relative connecting/exactness | ℤ→F₅; ℤ→F₂ | K₂(F₅)=K₂(F₂)=0; relative K₁ values 0 and C₂ respectively | Consistent with §3.1 kernels |
| 5.2 Steinberg symbols/Matsumoto headline | F₂,F₃,ℝ | finite-field symbols all 1; {−1,−1} over ℝ has sign −1 and order 2 | Units required; {a,1−a} uses a≠0,1 |
| 5.2 functor/product/unitization | R×0; nonunital zero | K₂(R×0)=K₂(R)⊕0; reduced K₂(0)=ker id=0 | Retained |
| 6.1 pullback, kernels and units | ℤ→F₅←ℤ | D={(a,b):a≡b}; units=(1,1),(−1,−1); ker p₂=5ℤ×0 | Native projection theorem: R05 |
| 6.1 one-leg control | F₅[t]→F₅[t]/t²←F₅ | π₁ onto, π₂ image constants only; D=F₅+t²F₅[t] | No two-surjection assumption |
| 6.1 product/identity squares | Q=0; A₂=Q with π₂=id | D=A₁×A₂; D≅A₁ respectively | Universal property agrees |
| 6.1 matrix/unit pullback compatibility | n=0,1 | n=0 all groups=1; n=1 arithmetic units exactly the two compatible unit pairs | Retained |
| 6.2 patching equivalence headline | identity triple rank n | M(1)=Dⁿ; base changes A₁ⁿ,A₂ⁿ | Both inverse functors correct on free test |
| 6.2 nonfree patched projective | u=2 over arithmetic square | 2a=b mod5 has no solution with a,b both ±1; rank-one M(2) not free | Retained; stable nontriviality uses §6.4/§7.2 |
| 6.2 complementary patching | u=2,u⁻¹=3 | M(2)⊕M(3)≅D²; boundary classes sum 0 | Retained |
| 6.2 identity-leg equivalence | π₂=id | compatibility forces y=α(x⊗1), so M≅P₁ | Retained |
| 6.3 normalized boundary | u=1; lifted unit u | δ(1)=[Dⁿ]−[Dⁿ]=0; a↦u⁻¹a gives M(u)≅D when u lifts | Correct orientation |
| 6.3 idempotent formula | u=2, X=[[-8,5],[-5,3]] over ℤ | XeX⁻¹=[[-24,40],[-15,25]], trace1, determinant0, reduction e | Concrete representative of δ(2) |
| 6.3 inverse/additive/stabilization laws | u=2,v=3 over F₅ | δ(2)+δ(3)=δ(1)=0; adding I contributes [D]−[D]=0 | Retained |
| 6.3 swap sign | F₇ arithmetic square | quotient F₇ˣ/±1=C₃; δ(2)=1,δ(4)=2=−1 | Detects sign unlike F₅ |
| 6.3 products and Morita | two copies of F₅ square; M₂ of it | boundaries componentwise (δ2,0); corner normalization sends rank-one class to rank-one class | Retained |
| 6.4 six-term headline: K₁ interior terms | ℤ→F₅←ℤ | image f₁=diagonal C₂=ker g₁; im g₁={±1}=ker δ | Both containments have matching subgroup sizes/elements |
| 6.4 six-term headline: K₀ interior terms | same square | K₀(D)=ℤ⊕C₂; ker f₀=C₂=im δ; im f₀=diagonal ℤ=ker g₀ | Exact at both named terms |
| 6.4 endpoint controls | Q=0; Q=ℤ/6 | product case Kᵢ(Q)=0; for ℤ/6, g₀(a,b)=(a−b,a−b), not onto ℤ² | Correct absence of terminal zero |
| 7.1 pushout/function-ring comparison | S=∅,X=Y=point | pushout two points, C(M)=ℂ²=ℂ×₀ℂ | Empty case retained |
| 7.1 interval gluing | X=Y=[0,1],S={0,1} | quotient circle; compatible functions satisfy two endpoint equalities | Correct pullback |
| 7.1 bundle/section adapter | trivial line and zero bundle | modules C(X) and 0; fibres ℂ and 0, ranks 1 and 0 | Resolved H2/H5 convention |
| 7.1 clutching headline | z,z⁻¹,z⁰ | δ values β,−β,0 under the supplied first-to-second convention | Replace ±: R08 |
| 7.2 arithmetic headline | p=5 | coker(C₂²→C₄)=C₂, rank image diagonal ℤ, so K₀(D)=ℤ⊕C₂ | Retained |
| 7.2 torsion classes | p=5, u=2,3,4 | δ2=δ3=nonzero element of C₂; δ4=0 | Retained |
| 7.2 polynomial/cusp headline | F₅[t]→F₅[t]/t²←F₅ | Qˣ=F₅ˣ×(1+tF₅), image constants; (1+t)^5=1, coker=C₅ | ker f₀=C₅ |
| 7.2 small-prime control | p=2,3 | F₂ˣ/±1=1 and F₃ˣ/±1=1; K₀ arithmetic pullback=ℤ | Torsion vanishes in both |
| 8.1 component quotient and algebraic comparison headline | A=ℂ,M₂(ℂ),0 | algebraic values ℂˣ,ℂˣ,0; topological values 0,0,0; comparison kernels whole source | Retained |
| 8.1 nonzero component control | A=C(S¹),z,exp f | winding z=1; winding exp f=0 via exp(tf) | Comparison is not the zero map generally |
| 8.1 elementary path | eᵢⱼ(ta) | eᵢⱼ(ta)eᵢⱼ(−ta)=I for every t; endpoints I,eᵢⱼ(a) | Quotient factors correctly |
| 8.2 logarithm/identity component | ℂ,g=1/10 and −1 | norms of g−1 and g⁻¹−1 are 0.9,9; exp(iπt) reaches −1 although log series at −1 fails | Symmetric-neighborhood repair in prose is correct |
| 8.2 exponential lifts | interval→endpoints | exp(iπt) restricts to (1,−1), an invertible lift | Correct statement |
| 8.2 claimed K₁ surjectivity | disk→boundary | K₁ map 0→ℤ misses winding1 | R01 |
| 8.2 repaired component lifting | disk→boundary, exponential exp f | extended logarithm F gives exp F restricting to exp f; both components have winding0 | R01 repair tested |

**Seeded source sample (15 targets).** Source keys are shared across chapters of the same work; the chapter or Stacks tag below identifies which extraction the line number belongs to. Weibel's author page explicitly says chapter-PDF pagination differs from the printed book while theorem numbers agree. The page references here are the chapter pages actually read. Legal copies were requested through the sources service; no source text was copied into the worktree or this report.

| Sampled target | Locator/text inspected | Outcome |
|---|---|---|
| 0.2 all-module extension | No local locator. weibel line 562, II.2.8.1, p.13, covers finite-projective base change | This is not a source for the entire all-module adjunction; R02/R11. Balancing and adjunction tested above |
| 0.3 K₀ and functoriality | weibel line 195, II.§2, p.5; line 212 for functoriality | Division-ring, PID/integer, base-change statements supported; zero ring checked separately |
| 0.6 sphere complexification | No external locator for the explicit frame. CharacteristicClasses C7 resolved below | Frame identities computed directly; missing precise attribution is R11 |
| 1.2 stable GL | weibel line 18, III.§1, p.1 | Stabilization/union definition supported; needs the locator attached |
| 1.4 elementary lifts | weibel line 104, III.1.2.3, p.3 | Supports coefficientwise lifting, not lifting arbitrary invertibles |
| 2.2 Bass automorphisms | weibel line 358, III.1.6.3, p.8; preceding complement argument at line 330 | Projective-module comparison supported; no locator for the arbitrary-small-additive-category presentation is supplied |
| 3.2 relative triples | weibel line 613, II.2.10, pp.13–14; line 775, Ex.2.17, p.17 | Source uses projective categories and short-exact additivity. Roadmap explicitly discusses its full-functor comparison; R03 concerns the separate equality criterion |
| 3.4 unitization | weibel line 669, II.Ex.2.4, p.15; native Unitization source | Reduced K₀ definition supported. Native reuse missing: R05; no attached locator for whole target: R11 |
| 4.3 covering dimension | No supporting covering-dimension text cited at this target | Definition/Checks tested; finite closed-cover theorem needs its locator, R11 |
| 4.5 Vaserstein formulas | vaserstein, printed p.20, Theorems 5 and 7; web extraction lines 131–145 | Both formulas supported in terms of d(X); compact-Hausdorff covering-dimension bridge remains an owned theorem, not a consequence of the source's metrizable example |
| 6.1 Milnor squares | weibel line 504, I.2.6, pp.11–12; native RingHom pullback | One-surjective-leg square converts to the source's ideal square; product and cusp examples tested |
| 6.2 patching | weibel line 536, I.2.7, p.12; stacks line 578, tag 0D2J; stacks line 106, tag 0DVN | Theorem supported; README incorrectly says Chapter II. Stacks's latter example is in an Artinian deformation setting, while 0D2J supplies the general commutative statement |
| 6.4 six-term sequence | weibel line 783, III.2.6, p.15; grebennikov line 205, §2.4, p.5 | Correct four interior exactness terms; chapter/section locators need R11 |
| 7.2 arithmetic/polynomial squares | weibel line 607, II.2.9.1, p.13 for cusp; III.2.6 for the sequence | Direct calculations yield ℤ⊕C₂ and cusp kernel C₅; target lacks individual locators |
| 8.1 algebraic/topological comparison | Milnor §7 not legally retrieved; elementary paths and ℂ/S¹ calculations inspected directly | No source certification for that chapter; R01 refutes the later surjectivity inference |

The extra source checks included Whitehead's formula and perfectness (weibel Chapter III lines 171–195, pp.4–5), the stable-range bounds (lines 146–149 and 503–510, pp.3 and 10–11), the stable central extension (line 1984, Theorem 5.5, p.38), and the field-symbol presentation and finite-field vanishing (line 2454, Theorem 6.1 and Corollary 6.1.1, p.48). The K₂(ℤ) control is also explicitly recorded at weibel Chapter III line 1885, Example 5.2.2. This corroborates R04 independently of access to Milnor.

**Pins and duplication by object.** The checked revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, exactly the manifest revisions. The following source locations were opened, including their binder blocks, rather than inferred from declaration names:

| Pinned file and line | Declaration/interface inspected | What it actually supplies |
|---|---|---|
| `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:124` | `TauCeti.finiteProjectiveModules` | Finite and projective modules; no chosen basis, rank or freeness |
| Same file :231 | `finiteProjectiveModulesExactStructure_eq_split` | Induced exact structure equals split |
| `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean:114,124,142,172` | `SplitK0`, `of`, `of_biprod`, `exists_eq_sub` | Native carrier and generator/difference laws |
| Same file :249,289,315 | `liftEquiv`, `map`, `mapEquiv` | Additive invariant/functor/equivalence maps |
| `TauCeti/Algebra/Category/ModuleCat/CartanMap/Morita.lean:215` | `Equivalence.finiteProjectiveModulesK0Equiv` | Exact K₀ equivalence; split comparison needed |
| `TauCeti/Algebra/Category/ModuleCat/CartanMap/RingEquiv.lean:254` | `RingEquiv.finiteProjectiveModulesK0Equiv` | Ring-equivalence specialization |
| `Mathlib/RingTheory/Finiteness/Projective.lean:28` | `Module.Finite.exists_comp_eq_id_of_projective` | Actual finite free splitting maps; works over semirings |
| `Mathlib/RingTheory/Morita/Matrix.lean:187` | `ModuleCat.matrixEquivalence` | Requires an index i; no empty-index Morita equivalence |
| `Mathlib/Data/Matrix/Basic.lean:654` | `RingEquiv.mopMatrix` | Transpose/opposite ring equivalence, not an entrywise-only map |
| `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean:85,399,880` | restriction, extension, adjunction | Restriction for rings; extension/adjunction here require both commutative |
| `Mathlib/LinearAlgebra/Matrix/Transvection.lean:70,80` | `Matrix.transvection` | CommRing binder and I+single convention |
| `Mathlib/LinearAlgebra/Matrix/ElementaryRowOperations.lean:57,97` | GL transvection | CommRing binder; module does exist despite the resolver's lexical lead |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:273` | `Matrix.SpecialLinearGroup.toGL` | Native commutative SL→GL map |
| `Mathlib/RingTheory/LocalRing/Pullback.lean:53–91` | pullback, projections, unit criterion, surjectivity and kernel image | Ring-level facts already available; R05 |
| `Mathlib/Algebra/Algebra/Unitization.lean:441,458,553,567,661,767` | multiplication, `snd_mul`, ring, inclusion, augmentation, lift | Integral and complex unitizations on the exact native carrier; R05 |
| `Mathlib/Topology/Category/CompHaus/Basic.lean:133` | `CompHaus.hasColimits` | The compact-Hausdorff pushout carrier |

Object searches found no ordinary stable-GL/K₁ carrier, arbitrary-ring elementary subgroup, Steinberg group, covering-dimension predicate or classical relative-triple group in these pins. The E₆ elementary subgroups found by the search are different objects. They do not remove the need for Layers 1–5. The balanced tensor absence is different: the README treats it as installed, producing R02. The six external `Matrix.*` proof names from the resolver are attributed to grothendieck-project, not Mathlib; their absence at the pin is not itself a false library citation.

**Cross-roadmap and order audit.** Read the main versions of GrothendieckEulerForms and BanachAlgebras as shape examples, and resolved every actual supplier subsection:

| Citation | Resolved witness | Assessment |
|---|---|---|
| DifferentialGeometry 11.1 | main `TauCetiRoadmap/DifferentialGeometry/README.md:902`; `Suggested.lean:3089–3099` | Even sphere, continuous ambient field, tangency and ambient finrank are explicit; n=2 gives the needed obstruction |
| CharacteristicClasses C7 | main `TauCetiRoadmap/CharacteristicClasses/README.md:1557–1563` | Tangent-sphere adapter, Euler number and e=c₁ are stated |
| TopologicalKTheory T1/T4 | main `TauCetiRoadmap/TopologicalKTheory/README.md:142–163,225,871–880`; T4 sphere calculation | Category/clutching and sphere K-ring supplied; sign is explicit, R08 |
| BanachAlgebras A2 | main `TauCetiRoadmap/BanachAlgebras/README.md:161,284` | Holomorphic calculus and logarithms for complete complex Banach algebras; the component proof remains here |
| HilbertModules H2/H5 | supplied new-roadmap checkout `TauCetiRoadmap/HilbertModules/README.md:223–236,418–422` | Finite-projective Hilbert structures, adjointable isomorphisms and compact-base section equivalence supplied |

The numerical references within these contracts have drifted: the real tangent example is §0.5 and the characteristic-class terminal comparison is §0.6, not §§0.6 and 0.7 respectively; there is no §0.8. Correct those internal locators with R11.

Ownership searches used `roadmaps grep` by object (balanced tensor, relative triples, covering dimension, stable matrices, Steinberg groups, Milnor patching and unitization), the main tree, the supplied sibling heads and board packages. No AlgebraicKTheory base roadmap exists on the supplied main tree. The ordinary matrix K₁/Steinberg K₂ and their low-degree patching maps therefore remain appropriate work for this roadmap. OperatorKTheory's supplied checkout, `README.md:221,328`, consumes these groups and boundary; K2SymbolsBrauerPartII, `README.md:60–66`, likewise explicitly consumes this roadmap's classical carriers. Their C*-algebraic and symbol-comparison objects are not replacement owners. The GeometricTopology supplied head contains no covering-dimension core, so §4.3 does not import a fictitious supplier from it; claims in the PR description to the contrary were not treated as evidence.

GrothendieckEulerForms' supplied revision has a new Layer 2A, `README.md:296–310`, which consumes AlgebraicKTheory's balanced carrier and also describes action/coherence adapters. It is a revision of an existing roadmap, so the main version, which does not contain that new layer, is the admissible supplier. This review does not use that revision as an input or move AlgebraicKTheory after it. No fully qualified name collision was found in the supplier and consumer Lean files inspected. Ownership/citation verification against unprovided open heads, including the base GeneralAlgebraicKTheory, GeometryOfNumbersAndQuadraticArithmetic, StableHomotopyKTheory and KTheoryLowDegrees heads, was not completed; their consumer-only discussion is not a prerequisite justification. Their named Part II files were searched where supplied. No change to merge order is proposed.

All `*Needs:*` lines were read. The mechanical command required by the brief returned exactly:

```text
depcheck: 204 roadmaps, 1544 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This does not certify a nonexistent pinned declaration; R02 is a manual supplier-drift finding. No declared gap contract was available.

**Build, signatures and padding.** The worker's supplied gate says every scanner, dependency check and targeted build passed (`build=0`, `outside-folder=0`, `stray-files=0`, overall `OK`). The outside-folder diff was independently empty. The required CartanMap.Basic module was built first, then the actual Suggested.lean was elaborated with `lake env lean`; exit 0, exactly 10 `sorry` warnings, no other warnings. A single scratch file with `#check @name` for all 27 declarations across the three files elaborated successfully. Compactness, T₂, finite generation/projectivity encoded in the native carrier, Noetherianity, finite maximal spectrum, cardinality bounds, antiperiodicity and sphere equations remained present; no dropped-binder change was needed. Auxiliary imports were normalized only in the scratch copy, not in the PR.

Each of the 15 admitted theorems was probed in scratch with the single-tactic candidates `simp`, `rfl` and `infer_instance`; none closed. Pinned-source searches did not expose a directly matching one-lemma proof of the ten main headlines. The independent Check-mirroring test identifies the three admissions in R10. The native duplication witness `exact Unitization.snd_mul x y` closes, but is not offered as an additional acceptance theorem. The proposed normalized integral K₀ signature also elaborated without new definitions or options.

**Headline inventory.** The README's deep results are the normalized division-ring/integer and matrix/projective K₀ calculations; real tangent noncancellation, Möbius order-two class and complexification examples; Whitehead/perfectness; the projective-automorphism comparison and Dieudonné determinant; the relative exact sequences; Bass–Vaserstein stability and real/complex function-ring formulas; the universal Steinberg central extension, Matsumoto presentation and finite-field K₂ vanishing; Milnor patching and its six-term sequence; the arithmetic/cusp and sphere-clutching calculations; and the Banach algebraic-to-component K₁ comparison and exponential description. Suggested.lean states ten targets: division-ring K₀, two Whitehead statements, Dieudonné, two matrix stability statements, two stable-range bounds, and two function-ring equivalences. Its docstring correctly recognizes missing stable/relative/Steinberg and arbitrary-ring base-change infrastructure for many other headlines, subject to R02. It does not explain away the statable integral result in R07. No theorem is accepted solely because its `sorry` elaborates.

## Not verifiable

- **Milnor, Introduction to Algebraic K-Theory**, §§7 and 10 (and the cited §§1–6,9–12 generally): the source service did not retrieve the JSTOR text. Bielefeld's catalogue explicitly marks its Milnor copy as lacking publication permission, so that copy was not fetched. The README's locator-only status is recorded; this review does not certify those pages. Weibel corroborates the K₂(ℤ) statement but does not replace access to Milnor's proof.
- **Bass, Algebraic K-Theory**, V.3.5: Bielefeld lists an authorized PDF, but the sources-service fetch did not complete during the review and was stopped. The primary theorem/page was not read. The bound was checked in Weibel I.Ex.1.5(b) and mathematically on the cases above; that is not certification of Bass's locator.
- **grothendieck-project**, `lean/Quillen/Upstream/MatrixElementarySubgroup.lean`: the public repository landing page was accessible, but the cited file and license text were not retrieved through the attempted legal URLs. Thus the claim of a complete, CC0, admission-free port at the required generality is not certified. No external code was downloaded and executed.
- **Vaserstein extraction limitation:** the service timed out twice and the alternate host reset the connection. The legal MathNet browser PDF did expose printed pp.19–20, including the definitions and Theorems 5/7; those locators were read there, with browser extraction lines 112–145. There is no service-cache line-number certificate for this work. [Legal text inspected](https://www.mathnet.ru/php/getFT.phtml?jrnid=faa&option_lang=eng&paperid=2577&what=fullt).
- **Unspecified locators:** the seeded targets listed as lacking a locator in R11 cannot receive a source-at-the-author's-locator certificate. In particular the general all-module adjunction, arbitrary-additive-category presentation, covering-dimension closed-cover theorem and explicit sphere frame lack such references. Their mathematical computations and native interfaces were still reviewed.
- The upstream Mathlib proposal pages cited as design/provenance links were not all retrievable. The supplied pins, rather than any assumed upstream merge status, determine the library findings here. No ownership claim is made against open heads the brief did not provide.

## Source issues

- **Misprint** in weibel at III.1.2.4, chapter p.3 (line 114): the source says the elementary quotient formula excludes GL₂(F₂); it should be that this exception concerns the commutator subgroup, while GL₂(F₂)/E₂(F₂)=1; affects a stated result.
- **Misprint** in weibel at III.1.2.4, chapter p.3 (line 135): the source says a real place giving quaternion algebra ℍ is unramified; it should be ramified; affects nothing.
