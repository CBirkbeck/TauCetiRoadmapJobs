# Review of SchemeKTheoryOperations (pull request #1229 at 6732a6a)

**Verdict:** needs changes

🤖 Independent AI incremental review of the 80 lines changed since 78ba9e5. `needs changes` means the author makes the repairs below before the next review. The AI never approves or merges. Both findings are P3; there is no P1 or P2 finding, and the r4 supply cycle is broken.

## R01 (P3) — The `GL(R)` comparison relies on a colimit step that its *Needs:* line does not supply

**Location.** TauCetiRoadmap/SchemeKTheoryOperations/README.md:2579: "it also follows from the one-step statement, because group homology commutes with the directed colimit `GL(R)`". The *Needs:* line at 2581 lists hyperhomology, frames, AlgebraicKTheory §§1.2 and 4.1–4.2, `Matrix.GeneralLinearGroup` and `groupHomology.map`, and nothing for this step.

**Claim.** The bijective comparison `H_m(GL_n(R);ℤ)→H_m(GL(R);ℤ)` needs `H_m(GL(R)) = colim_N H_m(GL_N(R))`, by either route. Van der Kallen's own proof of Theorem 4.8 uses the same identification at the end of 4.6 (Kal80, top of p.287). The uniform form at 2597 needs the bijective comparison. No target, supplier section or pinned declaration provides the injective half.

**Witness.** Tau Ceti `groupHomology.exists_map_subtype_eq` (TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean:113) gives only the surjective half. The module docstring (lines 30–32) says injectivity is not proved. For ℤ, m=1, n=3 it yields only that `ℤ/2→ℤ/2` is onto.

**Repair.**
- Add one sentence to the van der Kallen target: for a directed union `G=⋃G_i` of subgroups, a class of `H_m(G_i;ℤ)` that vanishes in `H_m(G;ℤ)` vanishes in some `H_m(G_j;ℤ)`. The reason is that a bounding chain involves finitely many elements, and Mathlib `groupHomology.chainsMap_f_map_mono` makes the chain maps injective.
- In the *Needs:* line at 2581, cite Tau Ceti `groupHomology.exists_map_subtype_eq` for the surjective half.
- Add `TauCeti.RepresentationTheory.Homological.GroupHomology.DirectedUnion` to the module table at lines 45–54.
- Alternative: cite StableHomotopyKTheory §1.17 (homology of classifying spaces commutes with filtered colimits) together with Tau Ceti's comparison of singular and group homology.

On ℤ, m=1, n=3, the two halves together give `H₁(GL₃ℤ)=ℤ/2≅H₁(GLℤ)=K₁(ℤ)=ℤ/2`.

## R02 (P3) — `d` denotes two different quantities in one paragraph

**Location.** README.md:2579: "For a commutative Noetherian ring of Krull dimension at most d, Bass's bound … allows `s=d`", and later in the same paragraph, "That complex is exact in degrees `≤d=n−t−2−s`, the action is transitive on frames of length at most `d+ε+1`".

**Claim.** The second `d` is van der Kallen's connectivity bound (Kal80 3.4, p.279), not the Krull dimension. The interface bullet at 2587 (`e=max(1,d)`) and the uniform form at 2597 (`dim X≤d`) use `d` as the dimension again.

**Witness.** For ℤ[x], d=2 and s=2. With n=5 and t=0 the connectivity bound is `5−0−2−2=1`, not 2.

**Repair.** Rename the connectivity bound: "exact in degrees `≤c`, where `c=n−t−2−s`, … transitive on frames of length at most `c+ε+1`". On the ℤ[x] instance this gives c=1, with d=2 unchanged.

## Previous findings

- R01 — repaired: README:11 now reads "Section 6.7 owns van der Kallen's integral homology stability for `GL_n` … They are consumed by the later roadmaps HomologicalStabilityOfGeneralLinearGroups and K3BlochGroups". No HSGL citation remains, and the dependency check reports 0 problems.
- R02 — repaired: the HSGL contract subsection and both "§2.4 its commutative Noetherian case" sentences are deleted. README:2579 now derives the Noetherian case from "Bass's bound of AlgebraicKTheory §4.2 allows `s=d`".

## Verified sound

**Scope and diff.** This incremental re-review covers the 80 changed lines (65 insertions, 15 deletions), all in README.md:

- the ownership paragraph at line 11;
- two module-table rows at 53–54;
- the low-degree contract at 66 and its new row at 72, which replaces the HSGL subsection;
- How to read the build, at 102;
- §6.7 at 2539–2599: three new targets (group hyperhomology, frame acyclicity, van der Kallen stability), the rewritten uniform form and its *Needs:* line;
- the Layer 6 Dependencies at 2867;
- the Kal80 reference at 3128.

Suggested.lean is byte-identical to 78ba9e5. `git diff origin/main...HEAD` outside the folder is empty.

**Gate and Lean.**

- My gate rerun prints `gate SchemeKTheoryOperations: … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate.md also shows build=0.
- The dependency check prints `depcheck: 236 roadmaps, 2267 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean` on Suggested.lean reports only `declaration uses sorry` at 57:8.
- A scratch `#check @name` file importing the module gives the types in signatures.md, unchanged from r4. `exists_strictlyPerfect` keeps `CompactSpace`, `QuasiSeparatedSpace`, `HasDerivedCategory`, the finite-type quasicoherent-quotient hypothesis and `IsPerfectComplex X E`.
- The new targets are ring-level lemmas behind scheme K-coherence, not headlines. The headline list and the docstring's not-statable list are unchanged.

**Kal80 read in full at every new locator.** The GDZ scan is image-only for the extractor. I rendered its pages with ghostscript and read the images; printed page = PDF page + 267 holds.

| Locator in README | What the page says | Result |
| --- | --- | --- |
| Convention 2.2, p.273 | R associative, satisfies `SR_(sdim+2)`, sdim ≥ 0 | Matches `SR_(s+2)`, s≥0 |
| Theorem 2.6(i)–(ii), p.274 | δ∈{0,1}; `O(Rⁿ+e_(n+1)δ)∩U` is (n−2−sdim)-connected; the transversal version is (n−2−sdim−k)-connected for k-frames, k≥1 | Matches 2563 |
| Remark 2.7.3, p.274 | `R=𝔽₂×𝔽₂`, sdim=0: `O(R+e₂)∩U` is nonempty and disconnected | Matches Check 2577 |
| 3.2, pp.278–279 | `G_n^PQ` fixes columns `e_j` (j∈P) and rows `e_i*` (i∈Q), with P∪Q=[1,t] | Matches |
| 3.4–3.6, pp.279–280 | d=n−t−2−sdim; ε=0 iff square; transitive on k-simplices for k≤d+ε; stabilizers lie in `F_n` | Matches (notation: R02) |
| Proposition 3.7 and proof, pp.280–281 | Bicomplex `L_r⊗R_s` of the truncated exact complex; Shapiro gives E¹ = stabilizer homology | Matches 2545 |
| Lemma 4.5, pp.285–286 | Under the Sq-surjectivity hypothesis, d¹ is 0 for r odd and the inclusion map for r even | Matches |
| Theorem 4.8, p.287 (proof to p.288) | e=max(1,sdim); `H_m(G_n^PQ)→H_m(XL(R))` onto at size ≥2m+e−1, bijective at ≥2m+e | With P=Q=∅ this gives the GL(R) comparison |
| Theorem 4.11, p.289 | `H_m(GL_n)→H_m(GL_(n+1))` onto for n≥2m+e−1, injective for n≥2m+e | Matches 2579 |

The bibliographic entry (Invent. Math. 60, 269–295; 28 PDF pages) agrees with the title page. GS99, proof of Proposition 5, p.41 (archived fff.pdf, also image-only, rendered the same way) has two steps at issue. Integral homology stability of `GL_N(O(U))→GL(O(U))` holds uniformly over affine opens. K₀ surjectivity comes from classifying maps on a hypercovering. Both match 2597, so r4's unverifiable item is now verified.

**Library declarations opened at the manifest pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d).**

- Mathlib GroupHomology/Basic.lean:226 `groupHomology` and :254 `groupHomologyIso`. The latter uses any `P : ProjectiveResolution (Rep.trivial k G k)`, with homology of `P.complex.coinvariantsTensorObj A`.
- Mathlib GroupHomology/Functoriality.lean:157 `groupHomology.map` and :111 `chainsMap_f_map_mono`.
- Mathlib GroupHomology/Shapiro.lean:65 `groupHomology.indIso`, giving `Hₙ(G, Ind_S^G A) ≅ Hₙ(S, A)`.
- Mathlib RepresentationTheory/Coinvariants.lean:410 `Rep.coinvariantsTensor`.
- Mathlib Algebra/Homology/Bifunctor.lean:83 `Functor.mapBifunctorHomologicalComplex`.
- Mathlib Algebra/Homology/TotalComplexSymmetry.lean `HomologicalComplex₂.totalFlipIso` (`K.flip.total c ≅ K.total c`).
- Tau Ceti Algebra/Homology/SpectralSequence/Bicomplex.lean:410, 442, 446, 476 and 484: row and column spectral sequences of a first-quadrant bicomplex in an abelian category. The first page is the row or column homology, numbered 2 in Mathlib's convention. The abutment is the homology of the total complex.
- Tau Ceti GroupHomology/DirectedUnion.lean:113: surjective half only (R01).

Every name in the two new module-table rows exists and says what the README claims.

**Suppliers resolved.**

- AlgebraicKTheory, at the head 10aafe6 of its open pull request (15th in the merge order):
  - §1.2 "The stable general linear group" defines GL∞ as the colimit along `g↦diag(g,1)`, with injective stage maps.
  - §4.1 "Stable range and the stability theorems" has `HasStableRangeLE R s` (rows of length s+1 shorten), the opposite-ring comparison (Vaserstein's Theorem 2), and the elementary row-reduction and orbit lemmas.
  - §4.2 has `hasStableRangeLE_one_of_isSemisimpleRing`, for R/Jac(R) semisimple, and `hasStableRangeLE_of_ringKrullDim_le`, giving s≤d+1.
  - The row at 72 and the sentence at 66 match these. The convention matches too: "stable range at most s+1" is `SR_(s+2)`.
- GeneralAlgebraicKTheory §§3.3–3.4 and StableHomotopyKTheory: unchanged citations.

**Ownership by object.** I searched open heads and main for "hyperhomology", "homology stability", "unimodular frame/sequence" and "directed union of subgroups".

- Group hyperhomology is owned by K3BlochGroups §4.1 (138th, head dcd87e4). ArithmeticKTheory (136th) uses it at its README:1348 without an owner.
- Frames and van der Kallen's theorem are owned only by HomologicalStabilityOfGeneralLinearGroups (#2036, head 9b02adb, not in the merge order). At that head, README:52–71 still says HSGL owns them, that §6.7 here applies its 2.4 and 2.6, and that hyperhomology comes from K3BlochGroups 4.1.
- No roadmap earlier than 36th owns any of these.

Recorded ownership move: frame acyclicity, the group-hyperhomology spectral sequence and van der Kallen's constant-coefficient stability with the `GL(R)` comparison move down to §6.7 here. The reason is that HSGL needs K3BlochGroups, which consumes this roadmap. HSGL and K3BlochGroups (and ArithmeticKTheory, if it wants an owner) cite §6.7 at their next revision. That repair is outside this folder, so it is not a finding here.

**Remarks (no change requested).**

- The pull-request description still lists #2036 under "Depends on". Its merge-order chain still puts K3BlochGroups, MotivicEtaleKTheory, ColemanIntegration and HSGL, all consumers, ahead of this pull request. The worker regenerates it.
- Untouched README:43 states the pins as "Mathlib 6b7abb3 and Tau Ceti a91d3aa", but lake-manifest.json pins 1b1ccf4b and 2fd255d9. The new rows were checked at the latter.

**Seeded sample.** None of the 15 seeded subsections falls in the changed passages: 1.2, 1.5, 1.6, 2.1, 2.6, 2.7, 3.3, 3.7, 3.8, 4.1, 4.2, 4.10, 4.11, 5.4 and 7.2. The README flags no locator as unverified. Their rows are carried below.

**Adversarial table: changed statements.** All rows are fresh computations at this head. H₁ is written additively. They supersede r4's HSGL-contract rows, whose statements are deleted.

| Statement | Instances tried | Values computed on the two sides / negative control | Result; change |
| --- | --- | --- | --- |
| Hyperhomology of a degree-0 complex, 2545, 2559 | G=ℤ/2, C=ℤ[0] | H₁(G;C)=ℤ/2 and H₂=0; the bare coinvariant complex gives 0 in degree 1 | Correct Check |
| First spectral sequence and d¹, 2545, 2560 | S₃, `C=(ℤ[S₃/A₃]→ℤ)` | E¹ maps: q=0 ℤ→ℤ identity; q=1 ℤ/3→ℤ/2 zero. So H₀=0, H₁=ℤ/2 (and H₂=ℤ/3). Second SS: H₀(C)=0 and H₁(C)=sgn, so H₁(G;C)=H₀(S₃;sgn)=ℤ/2 and H₂=H₁(S₃;sgn)=ℤ/3 | Both sequences agree |
| No converse to vanishing, 2561 | S₃, `C=(ℤ[S₃/⟨(12)⟩]→ℤ)` | H₁(C₂)→H₁(S₃) is an isomorphism, so H₀=H₁=0. Second SS: H₁(G;C)=H₀(S₃;V), V=ker(ℤ³→ℤ); (12) and (23) force e₁−e₂≡e₂−e₃≡0, so 0. Meanwhile H₁(C)=ℤ²≠0 | Correct |
| Vanishing for n≤t, 2545 | t=0 and t=1 in the S₃/A₃ example | H₀(C)=0 gives H₀(G;C)=0. H₁(C)=sgn≠0 and H₁(G;C)=ℤ/2: the hypothesis is needed at t=1 | Correct |
| Shapiro identification, 2545, 2555 | ℤ[S₃/A₃]; q=0,1 | H₀=ℤ=H₀(A₃); H₁=ℤ/3=H₁(A₃); matches `groupHomology.indIso` | Correct |
| Frame acyclicity (i), 2563, 2575 | 𝔽₃, n=1, δ=0 | 2 vertices, 0 edges: exact in degree −1=n−2−s; degree 0 fails (control s=−1) | Correct, sharp |
| same, 2576 | 𝔽₂, n=2, δ=0 | V=3, E=6, no 2-simplices; connected; rank H₁=6−3+1=4 | Exact through degree 0 only |
| same, δ=1, 2577 | 𝔽₂×𝔽₂, n=1 | 4 vertices (a,1); edges iff a−b=(1,1): {00,11} and {10,01}; 2 components | Bound −1 attained; Kal80 2.7.3 |
| Frame acyclicity (ii), 2563 | 𝔽₂, n=2, δ=0, u=(e₁), k=1 | F(u)={e₂, e₁+e₂}; no edge, since three vectors in 𝔽₂² are never a frame | Bound n−2−s−k=−1 attained |
| Stable-range convention, 72, 2563 | ℤ; a field | ℤ: (2,5) unimodular, 2+5c≠±1, so not ≤1 but ≤2: SR₃, s=1. Field: ≤1, SR₂, s=0 | Consistent with AlgebraicKTheory §4.1 |
| One-step stability, 2579, 2592 | 𝔽₂, m=1 (s=0, e=1) | n=1: 0→ℤ/2 not onto. n=2: ℤ/2→0 onto, not injective. n=3: 0→0 (GL₃𝔽₂ simple, GL₄𝔽₂≅A₈) | Bounds 2 and 3 attained; e=s=0 control fails at n=2 |
| `GL(R)` comparison, 2579, 2593 | ℤ, m=1 (s=1, e=1) | n=2: (ℤ/2)²→ℤ/2 onto, kernel ℤ/2. n=3: ℤ/2→K₁(ℤ)=ℤ/2 bijective | Correct; injectivity needs the colimit step (R01) |
| m=0; zero ring, 2591, 2594 | m=0, any R; R=0 | H₀: ℤ→ℤ identity for all n≥0 (onto bound e−1≥0). GL_n(0)=1, so H_m=0 for m>0 | Correct |
| Noetherian form, 2587, 2595 | ℤ[x] (d=2); ℤ; fields | e=2 gives H₁ bijective from n≥4; e=1 from n≥3 | Correct; matches Check |
| Semilocal form, 2579, 2587 | 𝔽₂×𝔽₂ | R/Jac semisimple; §4.2 gives stable range 1, so s=0 and e=1 | Correct |
| Theorem 4.8 with P=Q=∅ | Kal80 p.287 | t=0, `G_n^∅∅=GL_n(R)` square of size n; gives onto at ≥2m+e−1, bijective at ≥2m+e | Locator correct |
| Uniform N₀, 2597 | q=2 over ℤ (d=1), 𝔽₂ (d=0), A¹_ℤ (d=2); V=∅ | N₀=5, 5, 6; bijectivity for j≤1 needs N≥3, 3, 4. V=∅: O(V)=0 and H₀ is the identity | Correct, not sharp |
| Route sketch, 2579 | Kal80 3.4 with n=5, t=0, s=2 | Connectivity n−t−2−s=1; transitive on frames of length ≤1+ε+1 | Correct, but d is overloaded (R02) |
| GS99 K₀ step, 2597 | Rank-r bundle on a hypercover | GS99 p.41: the classifying map lands in `ℤ×ℤ∞BGL_N` with N≥r, and maps to [E] | Correct |

**Adversarial table: unchanged statements, carried from r4.** These rows are carried verbatim from packages/SchemeKTheoryOperations/reports/PRREVIEW-SchemeKTheoryOperations~4.md (r4, at 78ba9e5), which carried them from r3 (393a8f1) and r2 (98204e2) as tagged. This diff changes none of their statements. Their README line numbers are those of the round that computed them; locate rows by section number. They were not recomputed here.

| Statement | Instances tried | Values computed on the two sides / negative control | Result; change |
| --- | --- | --- | --- |
| Boundary supplier, README:60,914,1011 | DVR π; dual numbers ε; a unit | Cokernel/kernel lengths (1,0),(1,1),(0,0); indices 1,0,0 agree with §8.11 | r3 (393a8f1): Repaired R01 |
| Flag supplier, README:91 | Rank 3, type [1,2], scalar extension | Quotient ranks 3−1=2 and 3−2=1; kernel ranks 1 and 2. Base change preserves both | r3 (393a8f1): Repaired R04 |
| Standard pullback rank, README:2374 | Standard GL₂ over ℚ, G trivial | Forgetful class 2 in K₀(ℚ)=ℤ equals [ℚ²]=2 | r3 (393a8f1): Repaired R02 |
| General pullback rank, README:2374 | Determinant and zero representations of GL₂ | Classes [Λ²ℚ²]=1 and [0]=0; former blanket answer was 2 for both | r3 (393a8f1): Repaired R02 |
| Reduced q_T, README:2403 | T=S¹, ℚ-action by 2 versus 3 | q gives [2] and [3] in ℚ×; forgetting both gives rank 1 | r3 (393a8f1): Correct; automorphism data retained |
| Universal lifting identity, README:2409 | H=BGL(ℚ)⁺, η=q, unit 2 | id_*q([2])=[2]=η([2]); constant map gives [1]≠[2] | r3 (393a8f1): Correct |
| Universal lifting zero, README:2410 | η=0, unit 2; H=* | Constant factor gives 0=[1]=η([2]); maps into * form a singleton | r3 (393a8f1): Correct |
| Universal lifting point, README:2411 | T=*, A=ℚ and A=ℚ×ℚ | q sends ℤ and ℤ² respectively to the zero group [*,BGL(A)⁺], not isomorphically | r3 (393a8f1): Correct; reduced map distinguished from K₀ |
| Stabilized reduced λ², README:2403 | Standard GL₁ and GL₂; specialize y=1 | λ²(x−1)=1−x; λ²(x+y−2)=xy−2x−2y+3, also 1−x at y=1 | r3 (393a8f1): Correct compatibility; whole-source uniqueness remains a target |
| Lifting/operations order, README:2403–2439 | Representation, lifting, operations, identities, transport graph | Earlier cycle count 1; new order has 0 back-edges and 0 directed cycles | r3 (393a8f1): Repaired R03 |
| Operations and unitization, README:2413 | λ⁰; unitized rank-2 class | Reduced λ⁰=0, unitized λ⁰=(1,0); λ²(2,0)=(1,0), rank C(2,2)=1 | r3 (393a8f1): Correct |
| Unit-loop discriminator, README:2430 | u=2 in K₁(ℚ) | λ²[2]=−[2]=[1/2]≠[1]; ψ²[2]=[4]; exterior square of the actual rank-one module is 0 | r3 (393a8f1): Correct; genuine lifting needed |
| Transport commutes with λ, README:2437 | ℚ→ℚ(t); dual-representation involution | Extension gives [1/2] on both routes; duality sends λ²[2] to [2], and λ²([1/2])=[2] | r3 (393a8f1): Correct natural λ-homomorphism test |
| Downstream scheme convention, §6.8 | O(1) on P¹; unit 2 | ψ²[O(1)]=[O(2)]; λ²[2]=[1/2], matching affine construction | r3 (393a8f1): No regression |
| Downstream weight convention, §6.5 | Field ℚ, unit 2, parameters 2 and 3 | ψ²[2]=[4]=2[2]; ψ³[2]=[8]=3[2], weight 1 in both | r3 (393a8f1): No regression |
| 1.1 Strict perfectness | O(1) on P¹; skyscraper at 0 on A¹ | O(1): bounded and locally rank 1, hence true; skyscraper: local ranks 0 and 1, hence false | r2 (98204e2): Retain |
| 1.1 Local versus global summand | O(1) on P¹ | Hom(O(1),Oʳ)=0, although its local free rank is 1 | r2 (98204e2): Retain |
| 1.1 Zero and empty scheme | Zero complex; Spec(0) | Each term is zero; bounds [0,0] work; both predicates true | r2 (98204e2): Retain |
| 1.1 Term bounds versus acyclicity | O in all degrees ≤0; its identity cone | First has infinitely many nonzero Hⁱ; cone has Hⁱ=0 but infinitely many nonzero terms; strict predicate false for both | r2 (98204e2): Retain |
| 1.1 Cone and shift signs | k→0; k→k identity | Cone(k→0) has Euler −1; identity cone has 1−1=0 | r2 (98204e2): Retain |
| 1.1 Local lifting bound | P=N=k[0], M=0, a=1 | Claimed H-conditions hold, but id(k)≠0 cannot lift; P⁰≠0 violates the required lower term bound | r2 (98204e2): Retain negative control |
| 1.1 Surjective lifting | k²→k, first projection | Vector 1 lifts to (1,0); composite is 1 | r2 (98204e2): Retain |
| 1.1 Nullhomotopy | N=Cone(id Q), M=0 | Identity contraction gives every map P→N the zero homotopy class | r2 (98204e2): Retain |
| 1.2 Finite-level pseudo-coherence | ℤ/n; ⊕ℕℤ | ℤ/n has two finite free terms, hence finite type and presentation; countable free module has infinitely many generators and fails level 0 | r2 (98204e2): Retain |
| 1.2 Pseudo-coherent not perfect | k over k[ε]/ε² | ε-periodic resolution has one generator in every step; Torᵢ(k,k)=k for every i≥0 | r2 (98204e2): Retain |
| 1.2 Local versus uniform bounds | ⨿ₙSpec k with k[n] | Each component has amplitude [−n,−n]; no finite global interval contains all −n | r2 (98204e2): Retain qcqs restriction |
| 1.2 Tensor amplitude | k⊗ᴸ over k[x] with itself | Over k: degrees −1,0; over k[x], each copy of k contributes [−1,0], giving [−2,0] | r2 (98204e2): Retain |
| 1.2 Shift of amplitude | k[1] | Only H⁻¹=k; interval [0,0] shifts to [−1,−1] | r2 (98204e2): Retain |
| 1.3 Local perfectness | ℤ/n; residue field of dual numbers | First represented by [ℤ→ⁿℤ], true; second has nonzero Tor in every degree, false | r2 (98204e2): Retain |
| 1.3 Derived dual/tensor | k²[1], k³ | Dual is (k²)∨[−1]; tensor has dimension 6 in degree −1; Euler −6=(−2)·3 | r2 (98204e2): Retain |
| 1.3 Retracts | Projector diag(1,0) on k² | Image k is finite/projective; rank 1+1=2 under complementary splitting | r2 (98204e2): Retain |
| 1.4 Affine comparison | Spec ℤ and ℤ/2 | Tilde followed by sections gives ℤ/2; strict resolution has H⁰=ℤ/2 and H⁻¹=0 | r2 (98204e2): Retain |
| 1.4 Coherator versus identity | Quasicoherent tilde of A² | Unit/counit recover A², rank 2 on both sides; this tests only the supplied quasicoherent subcategory | r2 (98204e2): Retain |
| 1.5 Models and universes | Add acyclic [M→id M] of arbitrarily large cardinality | Derived object stays 0 and K₀ class stays 0; chain carriers have unbounded cardinalities | r2 (98204e2): Retain small-model qualification |
| 1.5 Corrected approximation | Bounded vector-space complexes, Euler-equivalence weak maps | A⊕A[1] has Euler 0 while retract A has Euler 1; the extra acyclic-retract condition fails | r2 (98204e2): Retain correction |
| 1.5 Flat/projective comparison | [ℤ→²ℤ] | Flat and projective models both give H⁰=ℤ/2, Euler 1−1=0 | r2 (98204e2): Retain |
| 1.6 Global strict headline | P¹ point; ℤ/n; empty scheme | [O(−1)→O] resolves the point; [ℤ→ⁿℤ] resolves ℤ/n; zero resolves empty scheme | r2 (98204e2): Retain Lean theorem |
| 1.6 Resolution-property necessity | Doubled affine plane | Naive bundle K₀=ℤ, perfect K₀=ℤ²; an origin class (0,1) cannot come from diagonal ℤ | r2 (98204e2): Retain hypothesis |
| 1.6 Derived isomorphism, not literal equality | E plus a contractible non-finite summand | H(E⊕Cone(id M))=H(E), but its terms need not be finite; Q(E⊕Cone(id M))≅Q(E) | r2 (98204e2): Retain conclusion |
| 1.7 Core truncation | Amplitude [0,0], k=𝔽₃ | Map(k,k) is discrete with 3 points; core has π₁=k×=C₂, so 1-truncated, not 0-truncated | r2 (98204e2): Retain +1 |
| 1.7 Enhanced versus triangulated gluing | Identity cover of Spec k | Descent object is k, endomorphism space has π₀=k and automorphisms k× on either side | r2 (98204e2): Retain enhanced carrier |
| 2.1 π₀ and exact additivity | k²→k³→k | 3=2+1; a [k²→0 k³] complex in degrees −1,0 has Euler 3−2=1 | r2 (98204e2): Retain |
| 2.1 Naive versus perfect K | Doubled affine plane | ℤ versus ℤ² in degree zero; separate origin classes survive only on the latter | r2 (98204e2): Retain distinction |
| 2.1 Negative grading | Nodal affine curve, full support | π₋₁ connective=0; coker(diagonal difference ℤ²→ℤ²)=ℤ | r2 (98204e2): Repaired: nonconnective groups used |
| 2.1 Regular negative vanishing | Spec ℤ; Spec k; empty | Nonconnective K₋₁=0,0,0 respectively | r2 (98204e2): Retain |
| 2.1 Connective cover at zero | Perf(k); even-Euler dense subcategory | First ℤ→ℤ is identity; second 2ℤ→ℤ is not onto | r2 (98204e2): Repaired locator and idempotence scope |
| 2.1 G-theory class | A=k[ε]/ε² | [A]=[k]+[k]=2[k] in G₀(A)=ℤ | r2 (98204e2): Retain |
| 2.2 Pullback preserves perfectness | k[t]→k, P=[A→ᵗA] | Pullback is [k→⁰k], still strict; cohomology k in degrees −1,0, Euler 0 | r2 (98204e2): Retain derived pullback |
| 2.2 Composition and identity | ℤ→𝔽₂→𝔽₄ applied to ℤ² | Successive and composite pullbacks both give 𝔽₄²; identity gives ℤ² | r2 (98204e2): Retain |
| 2.2 Finite-Tor G pullback | k[t]→k versus k[ε]/ε²→k | First Tor only degrees 0,1; second Torᵢ=k for all i, not bounded | r2 (98204e2): Retain finite-Tor hypothesis |
| 2.3 Proper transfer | P¹→Spec k, O(−1), O(−2), O(n) | Euler 0,−1,n+1, respectively | r2 (98204e2): Retain |
| 2.3 Finite locally free transfer | ℤ→ℤ[i] | Pushforward rank 2; transfer of a pulled-back rank r bundle is 2r | r2 (98204e2): Retain |
| 2.3 Proper alone not K-perfect | Spec k→Spec(k[ε]/ε²) | Pushforward k has infinitely many nonzero Tor groups, despite properness | r2 (98204e2): Retain perfectness condition |
| 2.3 Flat proper needs finite presentation | R=∏ℕk, I=⊕ℕk, Spec(R/I)→Spec R | All R-modules are flat; I is not finitely generated, so R/I is not finitely presented/perfect | r2 (98204e2): Retain finite-presentation repair already present |
| 2.3 Perfect is not coherent over arbitrary base | A=k⊕V, V²=0, V infinite-dimensional; differential e∈V\{0} | [A→ᵉA] is strict, but kernel=V is not finitely generated | r2 (98204e2): Retain separate K/G scopes |
| 2.4 Tor-independent base change | Point self-square in A¹ | Derived pullback k⊗ᴸ_A k=k⊕k[1], Euler 0; underived k has Euler 1 | r2 (98204e2): Retain Tor independence for underived square |
| 2.4 Projection formula | P¹, O(n), constant bundle kʳ | χ(O(n)⊗kʳ)=r(n+1)=rχ(O(n)) | r2 (98204e2): Retain |
| 2.5 Affine Cartan comparison | Finite projective A²; ℤ/n | Projective class 2[A] on both sides; Euler of ℤ/n=[ℤ]−[ℤ]=0 | r2 (98204e2): Retain supplied-map comparison |
| 2.6 Regular Cartan | k versus dual numbers | k: K₀→G₀ is 1↦1; dual numbers: 1↦2, not an isomorphism | r2 (98204e2): Retain regularity |
| 2.6 Compactness | D(k), k versus ⊕ℕk | Hom(k,⊕k)=⊕k; identity of ⊕ℕk has infinitely many coordinates and does not factor through a finite subsum | r2 (98204e2): Retain |
| 2.7 Continuity | A=colim k[t₁,…,tₙ], matrix using t₁,t₂ | Matrix and its finite relations descend to stage 2; no bound is asserted for arbitrary infinite matrices | r2 (98204e2): Retain finite-presentation data |
| 2.7 Negative G vanishing | Noetherian dual numbers | G₋₁=0 by coherent dévissage; singularity does not force negative G | r2 (98204e2): Retain distinction from K |
| 3.1 Supports | Cone(t), O on A¹, empty/full support | Cone(t) restricts to 0 on D(t), O does not; empty-supported category is 0, full is Perf(X) | r2 (98204e2): Retain |
| 3.1 Support is a subset | V(t) and V(t²) | Same supported perfect category; k[t]/t and k[t]/t² have units k× and k×·(1+tk) | r2 (98204e2): Retain no subscheme substitution |
| 3.1 Support intersection | Points 0 and 1 on A¹ | Derived tensor of their perfect skyscrapers is 0; intersection empty | r2 (98204e2): Retain |
| 3.1 All-degree support comparison | Node with full versus empty support | Full nonconnective K₋₁=ℤ; empty K₋₁=0; connective groups would give 0 for both | r2 (98204e2): Repaired: nonconnective groups used |
| 3.2 Object extension obstruction | Open restriction and its K₀ image | An extending object has class in image by definition; adjoining E[1] gives [E⊕E[1]]=0, removing the class obstruction | r2 (98204e2): Retain stable extension, not unconditional extension |
| 3.2 Roof denominators | D(t), multiplication t⁻¹ | Roof O←ᵗO→id O restricts to t⁻¹; no polynomial multiplication on O equals t⁻¹ globally | r2 (98204e2): Retain roofs |
| 3.2 Nullhomotopy denominators | Torsion ℤ/p² | Multiplication p² kills the module, whereas p need not; denominator exponent cannot be fixed at 1 | r2 (98204e2): Retain |
| 3.3 Oriented boundary | DVR π and π⁻¹ | ∂[π]=1; ∂[π⁻¹]=−1 in ℤ | r2 (98204e2): Retain |
| 3.3 Right/left product sign | ℤ₅, unit 2 | ∂([5][2])=[2]; ∂([2][5])=−[2]=[3] in 𝔽₅× | r2 (98204e2): Retain right-linear convention |
| 3.3 Full/empty localization | Z=X or Z=∅ | Fib(𝕂(X)→0)=𝕂(X); Fib(id)=0 | r2 (98204e2): Retain nonconnective formulation |
| 3.4 Excision | Étale identity near a support; empty support | Restricted supported object and class unchanged; empty side 0→0 | r2 (98204e2): Retain support-local hypothesis |
| 3.5 Dévissage | k[ε]/ε² with reduced point | G₀=ℤ and [A]=2; K₀(A)→G₀(A) is multiplication 2, so K-dévisage cannot ignore regularity | r2 (98204e2): Retain |
| 3.5 Thickness | DVR O/πᵐ | Composition length m; class m[k], unlike reduced class 1 | r2 (98204e2): Retain |
| 3.6 Determinant and scalar section | diag(u,v), diag(u,u⁻¹) | Determinants uv and 1; scalar diag(u,1) returns u | r2 (98204e2): Retain imported determinant |
| 3.6 Order normalization | πᵐ, unit u, zero | Additive order m,0 on nonzero elements; ordFrac(0)=0 in ℤᵐ⁰ is not the additive integer 0 | r2 (98204e2): Retain explicit adapter |
| 3.6 Specialization depends on parameter | π versus 2π over ℤ₅ | Relative unit changes by 2; the correction in K₁(𝔽₅) is −[2]=[3], not 0 | r2 (98204e2): Retain parameter convention |
| 3.6 Transfer and ramification | ℤ₂→ℤ₂[i], π=1+i | vπ(2)=2; finite transfer has rank 2 and norm(1+i)=2 | r2 (98204e2): Retain e/f distinction |
| 3.7 Divisor class | Dedekind A and nonprincipal prime I | [A/I]=[A]−[I], rank 0 but nonzero Picard component | r2 (98204e2): Retain Picard component |
| 3.7 Divisor multiplicities | 12∈ℚ× | v₂(12)=2, v₃(12)=1, all other finite valuations 0 | r2 (98204e2): Retain |
| 3.7 Proper curve reciprocity | t on P¹ | div(t)=[0]−[∞], degree 1−1=0; on Gₘ the boundary points are absent | r2 (98204e2): Retain proper-scope distinction |
| 3.8 Witt support degree | W(𝔽_p), Cone(pᵐ) | Length m; determinant valuation m; m=0 gives cone(id)=0 | r2 (98204e2): Retain |
| 3.8 Completion | Wₙ(𝔽₂)=ℤ/2ⁿ | lim ℤ/2ⁿ=ℤ₂; compatible rank-one free modules give rank one, not a direct sum of the stages | r2 (98204e2): Retain derived effectivity target |
| 3.8 Frobenius/perfection | 𝔽_p[t]→𝔽_p[t^(1/p∞)] | Frobenius becomes bijective; t has a pth root, unlike in the original polynomial ring | r2 (98204e2): Retain |
| 3.9 Quasi-isogeny sign | p and p⁻¹ on a Witt line | Degrees +1 and −1; composition has degree 0 | r2 (98204e2): Retain |
| 3.9 Identity quasi-isogeny | β=id on a rank-one object | Cone contributions 1−1=0; underlying rank is still 1 | r2 (98204e2): Retain degree is not rank |
| 3.9 Ramified coefficient | p=uπᵉ | degree(π)=1 and degree(p)=e; normalized p-degree cannot replace π-degree | r2 (98204e2): Retain |
| 4.1 Mayer–Vietoris and nonconnectivity | Nodal union with two components meeting twice | Rank-difference map ℤ²→ℤ² has diagonal image and cokernel ℤ in negative degree; truncating it would erase the obstruction | r2 (98204e2): Retain nonconnective grading |
| 4.1 Reduced presheaf condition | Constant Hℤ, including empty open | Value on ∅ is Hℤ with π₀=ℤ rather than 0; reducedness fails | r2 (98204e2): Retain hypothesis |
| 4.1 Brown–Gersten point case | One-point space | Sections and stalk both have πₙ=πₙ(E); if all stalk groups vanish, sections have 0 groups | r2 (98204e2): Retain |
| 4.2 Nisnevich residue condition | Spec(k×k)→Spec k | Two lifts with residue degree 1; cover true though source has two components | r2 (98204e2): Retain |
| 4.2 Nonexample cover | Nontrivial finite field extension L/k | Residue degree [L:k]>1 at the only point, so no residue-isomorphic lift | r2 (98204e2): Retain |
| 4.2 Distinguished square complement | Open identity square; empty complement | Complement maps 0→0; pullback diagram is identity on all values | r2 (98204e2): Retain |
| 4.3 Sheafification | Two-point discrete space, constant presheaf ℤ | Presheaf sections ℤ; sheaf sections ℤ²; map a↦(a,a) not onto | r2 (98204e2): Retain sheafification |
| 4.3 Hypercohomology not objectwise π₀ | Units on P¹ | H¹(P¹,Gₘ)=Pic(P¹)=ℤ, yielding a negative hypercohomotopy group for the associated degree-zero sheaf | r2 (98204e2): Retain |
| 4.3 Godement points | Spec field with identity stalk | Stalk and sections both k; augmentation followed by totalization is identity | r2 (98204e2): Retain |
| 4.4 Coniveau indexing | DVR with generic and closed point | E₁ residue differential F×→ℤ sends π↦1 and a unit↦0; total degree decreases by 1 | r2 (98204e2): Retain |
| 4.4 Support tower endpoints | Dimension 0 field | Filtration F⁰=K, F¹=0; sole nonzero column is p=0 | r2 (98204e2): Retain convergence bound |
| 4.4 Boundary squared | Regular surface Koszul square | Two ordered residue paths have opposite signs, +1 and −1; their sum is 0 | r2 (98204e2): Retain |
| 4.5 Coherent versus perfect coniveau | Residue field of dual numbers | Coherent class [k]=1 exists; k is not perfect because Torᵢ(k,k)=k for all i | r2 (98204e2): Retain separate towers |
| 4.5 Dimension versus codimension | Curve in smooth surface, then smooth threefold | Dimension remains 1; codimensions are 1 and 2 | r2 (98204e2): Retain dimension indexing for coherent cycles |
| 4.5 Proper residue transfer | 𝔽₄/𝔽₂ | K₀ transfer sends 1↦2; K₁ norm of generator α is α³=1 | r2 (98204e2): Retain residue degree/norm |
| 4.6 Gersten kernel | DVR | Kernel(v:F×→ℤ)=O×; π maps to 1, so v is surjective | r2 (98204e2): Retain |
| 4.6 Bloch's formula | P¹ over k, codimension 1 | CH¹(P¹)=Pic(P¹)=ℤ; O(1) maps to degree 1 on both sides | r2 (98204e2): Retain |
| 4.6 Codimension-zero case | Integral field | CH⁰(Spec k)=ℤ=H⁰(K₀); no negative-codimension terms | r2 (98204e2): Retain |
| 4.7 Geometric/equicharacteristic case | 𝔽₂(t), regular local k[x]_(x) | Field Gersten augmentation is identity; DVR residue of x equals 1 | r2 (98204e2): Retain includes imperfect fields through stated approximation route |
| 4.7 Semilocal continuity | k[t] localized at (t),(t−1) | One function field k(t) remains; product of two local rings would have two generic points | r2 (98204e2): Retain semilocal, not product replacement |
| 4.7 Continuity is not codimension preservation | R→R/(t) | Height of (t) drops from 1 to 0; a termwise fixed-codimension identification would fail | r2 (98204e2): Retain cohomological route |
| 4.8 Relative effacement | Λ a DVR, Λ[x]/(x−π) | Quotient is Λ and flat; Λ[x]/(π) is killed by π and not flat | r2 (98204e2): Retain relative-flat divisor condition |
| 4.8 Regular equation | t=0 versus x−π | Multiplication by 0 has full kernel; x−π has zero kernel | r2 (98204e2): Retain regularity hypothesis |
| 4.9 Filtered comparison | Regular DVR, identity cover | Descent and coniveau give H⁰(K₁)=O× and residue quotient 0; the nontrivial differential is v(π)=1 | r2 (98204e2): Retain filtered theorem, not an E₂-only argument |
| 4.10 Valuation lifting | D(t)→A¹ and valuation centered at 0 | t is nonunit at the center; there is no lift into D(t), so not a v-cover | r2 (98204e2): Retain |
| 4.10 Empty covers | ∅→Spec k; identity of ∅ | First fails lifting of Spec k; second has no valuation obstruction and both categories are zero | r2 (98204e2): Retain |
| 4.10 Derived Čech chart restriction | Invert a negative-degree generator with π₀-image 0 | The localized derived algebra can retain the inverted generator; base change through π₀ forces 0 invertible and gives zero | r2 (98204e2): Retain restricted chart theorem |
| 4.10 Amplitude detection | k and k[1] on a perfect point | Residue amplitudes [0,0] and [−1,−1]; the latter is excluded from the former stratum | r2 (98204e2): Retain |
| 4.10 h-to-v passage | Fixed [a,b], then all perfect objects | Core truncation bound b−a+1 is finite; no single bound works for complexes of arbitrarily large amplitude width | r2 (98204e2): Retain stratum-first passage |
| 4.11 Witt finite stages | W₂(𝔽₂)→𝔽₂ | Units {1,3} both reduce to 1; automorphism lifting has nontrivial kernel {1,3} | r2 (98204e2): Retain groupoid/derived descent |
| 4.11 Zero-object lifting | Zero perfect complex | Deformations and automorphisms are zero/identity; its lift space is contractible | r2 (98204e2): Retain |
| 4.11 Uniform amplitude | Finite free module over ℤ₂ and all mod-2ⁿ reductions | Every stage has amplitude [0,0] and rank 1; limit has the same interval and rank | r2 (98204e2): Retain uniform-bound condition |
| 4.11 Supported degree | Cone(pᵐ) on a perfect residue point | Supported K₀ degree and p-adic determinant valuation both m | r2 (98204e2): Retain |
| 4.12 Square-to-Čech descent | Identity cover; disjoint two-point cover | Identity gives E; disjoint cover gives E×E, equal to value on two points for a sheaf | r2 (98204e2): Retain |
| 5.1 G-homotopy invariance | A=k[ε]/ε², polynomial t | G₁(A[t])=G₁(k[t])=k×; K₁ has nonconstant unit 1+εt | r2 (98204e2): Retain G/K distinction |
| 5.1 Graded torsion category | S=R[t,u], S/tS | t-torsion true, but graded pieces R·uⁿ exist for every n≥0; finite-support grading would exclude it | r2 (98204e2): Retain |
| 5.1 Dehomogenization | S(−n), S/t, S/u, with t=1 | Outputs R[s],0,R respectively; grading shift becomes a free module | r2 (98204e2): Retain |
| 5.1 Zero-section Euler | Trivial line zero section | Koszul alternating class 1−1=0; two terms cancel | r2 (98204e2): Retain |
| 5.2 Regular K homotopy | k→k[t] | K₀ is ℤ→ℤ, 1↦1; K₁ is k×→k× | r2 (98204e2): Retain regularity |
| 5.2 Laurent factor | k[t,t⁻¹] | K₁=k×⊕ℤ; t has coordinates (1,1), a constant a has (a,0) | r2 (98204e2): Retain |
| 5.3 Rank-zero projective bundle | E=0 | P(E)=∅; K=0 and zero summands on the right | r2 (98204e2): Retain |
| 5.3 Rank-one convention | E=L | P(E)=X, O(1)=L, pushforward O(n)=Lⁿ | r2 (98204e2): Retain quotient convention |
| 5.3 Positive twist | E=L⊕O, rank 2 | π_*O(1)=L⊕O, not L∨⊕O | r2 (98204e2): Retain |
| 5.3 Negative twist/top cohomology | Rank-2 E | Rπ_*O(−1)=0; Rπ_*O(−2)=det(E)∨[−1] | r2 (98204e2): Retain determinant and shift |
| 5.3 Koszul relation | E=k², L=[O(−1)] on P¹ | 1−2L+L²=0, equivalently (1−L)²=0 | r2 (98204e2): Retain |
| 5.4 Relative regularity | O on P¹ over any affine base | H¹(O(−1))=0, evaluation surjective; no field-only hypothesis is used for this example | r2 (98204e2): Retain relative extension |
| 5.4 Quillen resolution | O(1) on P¹ | T₀ has rank 2, T₁ rank 1; Euler reconstruction 2−L=[O(1)] | r2 (98204e2): Retain |
| 5.4 Regularity negative control | O(−1) with an unjustified regular presentation | Naive zero-section data would give 0 although [O(−1)]=L≠0; required regularity fails | r2 (98204e2): Retain |
| 5.5 Projective bundle basis | O(m) on P¹ | Coordinates (m+1,−m); rank (m+1)−m=1, Euler m+1 | r2 (98204e2): Retain |
| 5.5 Independence in rank 2 | 1 and L on P¹ | Rank/Euler columns (1,1),(1,0) have determinant −1 | r2 (98204e2): Retain |
| 5.6 Bass boundary | k[t,t⁻¹] | ∂[t]=1, ∂[a]=0 for a∈k× | r2 (98204e2): Retain |
| 5.6 Nil terms | A=k[ε]/ε² | 1+εt is nonzero NK₁ class; evaluation 0 gives 1, evaluation 1 gives 1+ε | r2 (98204e2): Retain evaluation-at-zero convention |
| 5.6 Iterated Laurent signs | Symbols [t][u] and [u][t] | Iterated oriented residues are +1 and −1 | r2 (98204e2): Retain grading signs |
| 5.7 Codimension-one blowup | Cartier divisor | Blowup map is identity; exceptional-index set 1≤i≤d−1 is empty | r2 (98204e2): Retain |
| 5.7 Adjunction and vanishing | d=2, exceptional fibre P¹ | Rp′_*O=k, Rp′_*O(−1)=0; unit k→k is identity | r2 (98204e2): Retain |
| 5.7 Exceptional recovery | d=2 versus d=1 | In d=2 the unwanted twist has RΓ(O(−1))=0; d=1 retains an extra k[−1], so the proposed recovery would give k⊕k[−1] | r2 (98204e2): Retain d≥2 restriction |
| 5.7 Exceptional sign | Exceptional divisor E | 0→O→O(E)→i_*O_E(−1)→0 gives [i_*O_E(−1)]=[O(E)]−1 | r2 (98204e2): Retain |
| 5.8 Blowup decomposition | Blowup A² at origin; blowup P² at point | K₀ ranks 1+1=2 and 3+1=4; d=1 gives rank addition 0 | r2 (98204e2): Retain |
| 5.8 Exceptional image discriminator | O versus O_E(−1) on exceptional P¹ | RΓ(O)=k while RΓ(O(−1))=0; using O would destroy orthogonality | r2 (98204e2): Retain |
| 5.9 Bass comparison | k; nodal curve | Both nonconnective models give K₋₁(k)=0 and K₋₁(node)=ℤ; connective K gives 0 for the node | r2 (98204e2): Retain nonconnective comparison |
| 6.1 Internal/external products | k² and k³; disjoint supported points | Rank 2·3=6; disjoint support product 0 | r2 (98204e2): Retain |
| 6.1 Graded commutativity | Two degree-one unit classes | Reversing factors introduces −1; their DVR boundaries are [u] and −[u] | r2 (98204e2): Retain |
| 6.1 Relative fibre | Identity map X→X; restriction along ∅→X | Fibre of identity is 0; fibre of K(X)→0 is K(X) | r2 (98204e2): Retain nonconnective fibre |
| 6.1 Tensor versus auxiliary λ-product | Unit symbols t,u over k(t,u) | Iterated tame residue of tensor symbol is 1∈ℤ, hence product nonzero; auxiliary positive×positive product is 0 | r2 (98204e2): Retain distinction |
| 6.2 Special λ sum | Rank 2 and rank −1 | λ_t(2)=1+2t+t²; λ_t(−1)=1−t+t²−t³+… | r2 (98204e2): Retain formal inverse |
| 6.2 Universal product polynomial | Rank-2 bundles P,Q, operation λ² | λ²(P⊗Q) has rank C(4,2)=6; product identity gives 2·2·1+2·2·1−2·1·1=6 | r2 (98204e2): Retain |
| 6.2 Universal composition polynomial | Rank-4 bundle E, λ²λ² | C(C(4,2),2)=C(6,2)=15; corresponding universal expression 4·4−1=15 | r2 (98204e2): Retain |
| 6.2 Disconnected rank | Two-point scheme, ranks (1,2) | Augmentation is function (1,2), not one integer; λ² has ranks (0,1) | r2 (98204e2): Retain locally constant target |
| 6.2 Nonunital filtration | J=(x³) in ℤ[u,u⁻¹]/(u−1)⁴ | γ_t(x³)=1+x³(t−3t²+2t³); F³ in the ℤ-unitization is 2J, while J∩F³(ambient)=J | r2 (98204e2): Retain intrinsic/induced distinction |
| 6.2 Weighted products | η=(u−1)(v−1), with (u−1)²=(v−1)²=0 | γ²η=−η≠0 although η²=0; square-zero multiplication alone does not force F²=0 | r2 (98204e2): Retain weighted definition |
| 6.3 Exact versus split representations | Nontrivial extension 0→1→V→1→0 | Exact K₀ gives [V]=2[1]; an isomorphism V≅1⊕1 need not exist | r2 (98204e2): Retain exact category |
| 6.3 Dedekind Euler resolution | Torsion A/I | Class [A]−[I]; for A=ℤ,I=(p), this is 1−1=0 | r2 (98204e2): Retain |
| 6.3 Derived versus ordinary dual | A=ℤ[√−5], torsion A/I | Ordinary Hom(A/I,A)=0; derived Euler dual is [A]−[I∨]≠0 | r2 (98204e2): Retain |
| 6.3 Torus character coefficients | Trivial torus over ℤ[√−5] | [I]−[A]≠0 maps to rank 0; corrected K₀(A)-valued character maps it to itself | r2 (98204e2): Repaired K₀(A) coefficients |
| 6.3 Field formal character | Gₘ over 𝔽₂, weights 0 and 1 | Formal characters 1 and t; both rational-point characters take value 1 | r2 (98204e2): Retain scheme representation |
| 6.3 Highest-weight scope | SL₂/𝔽₂, weight 2 | Simple character t²+t⁻² (dimension 2); Weyl/induced character t²+1+t⁻² (dimension 3) | r2 (98204e2): Repaired: imported field classification |
| 6.3 Generic/residue lattice independence | ℤ and pℤ in ℚ | Both rank 1; both reductions intrinsically one-dimensional over 𝔽_p | r2 (98204e2): Retain PID comparison |
| 6.3 Stable representation convention | GL₀; determinant of GL₂ | GL₀ representation ring ℤ; determinant monomial x₁x₂; dual monomial (x₁x₂)⁻¹ | r2 (98204e2): Retain |
| 6.3 Group scheme versus abstract points | Gₘ/ℤ | Integer character lattice ℤ gives infinitely many monomials; ℤ×={±1} only detects parity | r2 (98204e2): Retain |
| 6.3 Associated projective representation | Weight −1 on a line P | Associated bundle P∨, not P; rank is 1 in both but tensor with P gives O only for P∨ | r2 (98204e2): Retain |
| 6.4 Higher λ and Adams | A unit loop u, k=2 | λ²[u]=−[u]; ψ²[u]=2[u]; ψ¹[u]=[u] | r2 (98204e2): Retain |
| 6.4 Composition | ψ²ψ³ on a unit loop | ψ²(3[u])=6[u]=ψ⁶[u] | r2 (98204e2): Retain |
| 6.4 Stable finite rank | Dimension 0 and 1 representations | Empty sum has rank 0; adding a trivial line increases rank by 1 while preserving the stabilized nontrivial weights | r2 (98204e2): Retain |
| 6.5 Rational projectors | Operator T=diag(2,4) on ℚ² | (4−T)/2=diag(1,0), (T−2)/2=diag(0,1); sum=id, product=0 | r2 (98204e2): Retain nonzero denominators |
| 6.5 Parameter 1 | Same proposed eigenweights with k=1 | Eigenvalue difference 1²−1=0, so projector division is invalid | r2 (98204e2): Retain k>1 requirement |
| 6.6 Splitting principle | Rank 2 E with formal roots L₁,L₂ | λ_t(E)=(1+L₁t)(1+L₂t); determinant L₁L₂; no ordering enters the symmetric coefficients | r2 (98204e2): Retain |
| 6.6 Higher filtration bound | Regular d-dimensional X, degree m | Bound F_γ^(m+d+1)=0 is distinct from individual γ^j=0; at m=d=0 only rank remains and F¹=0 | r2 (98204e2): Retain full-filtration theorem |
| 6.7 K-coherence comparison | Field point; P¹ | Point has cohomological dimension 0; P¹ has nonzero Pic=ℤ in sheaf cohomological degree 1, requiring dimension bound 1 | r2 (98204e2): Retain dimension control |
| 6.7 Pointed fringe | π₀ with a nontrivial π₁ stabilizer | Core of k has automorphism group k×; forgetting stabilizers changes a fibre from B(k×) to a point | r2 (98204e2): Retain pointed-set treatment |
| 6.8 Higher operations on schemes | O(1) and unit u on P¹ | ψ²[O(1)]=[O(2)]; ψ²[u]=2[u]; these are multiplicative in degree zero and additive on higher groups | r2 (98204e2): Retain different laws |
| 6.8 Product compatibility | Two line bundles L,M | ψ²(LM)=L²M²=ψ²(L)ψ²(M) | r2 (98204e2): Retain |
| 6.9 Endpoint/Bockstein indexing | Two-cell Moore space S¹∪ₙe² | Coefficient K₂ has endpoints K₂/n and K₁[n]; shifting the Moore space would give a K₂[n] endpoint instead | r2 (98204e2): Retain degree-two construction |
| 6.9 Finite eigenvalue separation | ℓ=5, k=2, weights 0,1,2 | Eigenvalues 1,2,4; differences 1,2,3 are units mod 5 | r2 (98204e2): Retain |
| 6.9 Collision negative control | ℓ=3, k=2, weights 0,1,2 | Eigenvalues 1,2,1; first/last difference 0 | r2 (98204e2): Retain strict prime/weight-width bound |
| 6.9 Generalized versus honest eigenspace | T=[[2,1],[0,2]] | (T−2)≠0 but (T−2)²=0; a length-two extension need not be scalar 2 | r2 (98204e2): Retain integral endpoint/splitting inputs |
| 6.9 Coefficient product supplier | Hℤ/2; S/p² at odd p | Hℤ/2 has π₀=𝔽₂ and higher π=0; q=2,n=1 satisfies 2≥2 | r2 (98204e2): Repaired supplier contract |
| 6.9 Even-prime E₁ bound | S/8 | q=3,n=1 gives 2q=6=3(n+1); S/2 gives 2<6 | r2 (98204e2): Retain corrected supplier range |
| 6.10 Bott class | Zero bundle; trivial line; line L, k=2 | θ²(0)=1; θ²(O)=2; θ²(L)=1+L | r2 (98204e2): Retain |
| 6.10 Negative integer convention | k=−1 and line L | θ⁻¹(L)=−L⁻¹; multiplying by (1−L) gives 1−L⁻¹ | r2 (98204e2): Retain |
| 6.10 Virtual rank-zero class | 1−u in ℤ[u,u⁻¹] | θ²(1−u)=2/(1+u), not generally in ℤ[1/2,u,u⁻¹] | r2 (98204e2): Retain stated localization/invertibility scope |
| 6.10 Twisted operation | Rank-one conormal, square-zero higher component x | Twisted positive product is 0; λ²(0,x)=(0,−x), not zero | r2 (98204e2): Retain twist is not trivial multiplication |
| 6.11 Gysin Adams factor | Trivial conormal rank c | θᵏ(Oᶜ)=kᶜ; ψᵏi_*x=i_*(kᶜψᵏx) | r2 (98204e2): Retain conormal correction |
| 6.11 Coniveau weight | Codimension p point, weight i−p | Extra kᵖ times k^(i−p) equals kⁱ | r2 (98204e2): Retain shifted residue weight |
| 6.11 Low-degree Serre-error claim | Rational coefficients | Finite-torsion error category becomes 0; claimed decompositions become genuine rational direct sums | r2 (98204e2): Retain modulo-error formulation integrally |
| 6.12 Supported λ/product | Regular divisor with class 1−L | λ_t(1−L)=(1+t)/(1+Lt); coefficient of t² is L²−L | r2 (98204e2): Retain support operation, not exterior powers of a torsion sheaf |
| 6.12 Support self-product | Point of regular curve | Derived tensor has k in Tor₀ and Tor₁; alternating class 1−1=0 | r2 (98204e2): Retain |
| 7.1 γ versus support filtration | h=1−[O(−1)] on P¹ | h∈F¹, h²=0; rank(h)=0, determinant(h)=O(1) | r2 (98204e2): Retain |
| 7.1 Rank-zero ideal | Field | K₀(k)=ℤ with rank=id; F¹=0, hence all higher filtration groups 0 | r2 (98204e2): Retain |
| 7.2 Leading Chern sign | Codimension c=1,2,3 | Coefficient (−1)^(c−1)(c−1)! is +1,−1,+2 | r2 (98204e2): Retain |
| 7.2 Point on P² | [O_P] | ch₂ is +[P], but c₂ is −[P]; conflating Chern class with character reverses the sign | r2 (98204e2): Retain |
| 7.2 Geometric character | O(n) on P¹ | ch=1+nH because H²=0 | r2 (98204e2): Retain |
| 7.3 γ-valued character | h=1−L on P², L=O(−1) | ch(h)=1−exp(−H)=H−H²/2; positive H²/2 would be wrong | r2 (98204e2): Retain |
| 7.3 Newton normalization | Line root a, degrees 1,2 | Components a and a²/2; denominator 2 is invertible over ℚ, not automatically over ℤ | r2 (98204e2): Retain rational coefficients |
| 7.3 Associated-graded isomorphism | P¹ | K₀⊗ℚ=ℚ·1⊕ℚ·h maps to ℚ·1⊕ℚ·H by 1↦1,h↦H | r2 (98204e2): Retain |
| 7.4 Euler/GRR | O(n) on P¹→point | (1+nH)(1+H)=1+(n+1)H; pushforward is n+1=χ(O(n)) | r2 (98204e2): Retain |
| 7.4 Adams–Riemann–Roch | P¹, k=2, h²=0 | θ²(Ω)=2−2h, inverse=(1+h)/2; pushforward gives (1+1)/2=1 | r2 (98204e2): Retain cotangent/inverse sign |
| 7.5 Relative-base normalization | Spec ℚ over Spec ℤ, e=1,r=0 | d=e+r=1 although absolute dim=0; homological ψ-factor on rank is k⁻¹ | r2 (98204e2): Retain base-relative index |
| 7.5 Independence under ambient enlargement | Same point in A¹ over Spec ℤ | e+r=2 and supported γ-weight 1 give j=1; k⁻¹ agrees with the previous ambient | r2 (98204e2): Retain |
| 7.5 Proper homological transfer | Finite field extension degree d | Rank class pushes to d; scalar k⁰ on dimension-zero cycles commutes: d·1=1·d | r2 (98204e2): Retain |
| 7.6 Transverse excess | Independent equations x,y in k[x,y] | Excess F=0, λ₋₁(F)=1; intersection length 1 | r2 (98204e2): Retain |
| 7.6 Self-intersection | Cartier conormal L∨ | Multiplier 1−L∨; a trivial conormal gives 1−1=0 | r2 (98204e2): Retain |
| 7.6 All Tor degrees | Regular codimension-2 point | Tor ranks 1,2,1, then 0; alternating sum 1−2+1=0 | r2 (98204e2): Retain exterior-power identification |
| 7.6 Supported map directions | Point included in a curve, then pulled back | K(point)→K(curve)→K(point) has multiplier 0; reverse restriction/extension cannot be substituted | r2 (98204e2): Retain |
| 7.7 Supported Chow versus ordinary Chow | Closed point in A¹ | CH¹_with_support(A¹)=ℤ, while CH¹(Spec k)=0; support codimension belongs to the ambient | r2 (98204e2): Retain |
| 7.7 Cycle multiplicity | O/πᵐ on a regular DVR | Leading cycle m[closed point], agreeing with length m and the supported K-class | r2 (98204e2): Retain |
| 7.7 Dimension-one indexing | Curve in surface and in threefold | Both contribute to Gr₁ of dimension filtration; corresponding codimensions are 1 and 2 | r2 (98204e2): Retain |
| 7.7 Zero-dimensional support | Finite set Y of closed points | CH₁(Y)=0; F₁G₀(Y)=F₀G₀(Y), hence Gr₁=0 | r2 (98204e2): Retain |
| 1.2 Finite-level noncoherent distinction | A=k⊕V, V²=0, V infinite-dimensional; M=k | M has one generator, but its kernel V in A→k is not finitely generated; level 0 holds, level −1 fails | r2 (98204e2): Retain |
| 1.3 Amplitude detection needs perfectness | ℚ/ℤ over ℤ, degree zero | Ordinary fibres over every residue field are 0, but Tor₁ at p is ℤ/p; tensor without derivation would misidentify the amplitude | r2 (98204e2): Retain derived test |
| 3.6 Algebraically closed field injectivity | k→k[t]→k, t↦0 | Composite on every K-group is identity; for A=0 the target groups are 0 and the K₀ map ℤ→0 is not injective | r2 (98204e2): Retain nonzero-algebra hypothesis |
| 6.1 Nonflat external perfect product | X=Z=Spec 𝔽₂ over Spec ℤ | Underived fibre product is Spec 𝔽₂; pullbacks of both units are 1, and their product is 1 | r2 (98204e2): Retain; do not impose coherent flatness on this K-product |
| 6.2 Integral filtration need not terminate | ℤ[C₂], σ²=1, x=σ−1 | x²=−2x and Fⁿ=2^(n−1)ℤx for n≥1; no term vanishes | r2 (98204e2): Retain nilpotence hypotheses |
| 6.3 Nonabelian representation ring | S₃ over ℂ, standard V | Character V=(2,0,−1); V⊗V=(4,0,1)=1+sign+V, so dimension 4=1+1+2 | r2 (98204e2): Retain arbitrary-group exact representation construction |
| 6.3 Cyclic positive-characteristic control | C₂ over 𝔽₂, regular module | Regular module is an indecomposable length-two extension, but its exact K₀ class is 2[trivial] | r2 (98204e2): Retain; no split-K₀ substitution |
| 6.9 A¹ representability | Spec k and A¹_k, degree zero | Both represented groups are K₀=ℤ; pullback sends 1 to 1 | r2 (98204e2): Retain regular scope |
| 6.9 Uniqueness cannot be tested only on points | ψ² versus identity on P¹ | Both fix rank; with L=1−h, ψ²(L)=1−2h while id(L)=1−h and h≠0 | r2 (98204e2): Retain natural operation on all smooth test schemes |
| 6.9 Trivial coefficient modulus | n=1 | Cofibre of identity on the sphere is 0; spectral coefficients and Moore mapping groups are both 0 | r2 (98204e2): Retain separate boundary case |
| 6.4 Full γ-product polynomial | x=[t],y=[u][2],z=xy, over ℚ(t,u), k=2 | γ²x=0, γ²y=−y; RHS=−z−2z=−3z=LHS; truncated formula gives −z | r2 (98204e2): Retain full sum |
| 6.4 Same formula, k=3 | Same weight-1 and weight-2 inputs | γ³z=(1−8+9)z=2z; coefficient C₃,₁,₂=−2 gives (−2)x(−y)=2z, all other contributions vanish | r2 (98204e2): Retain |
| 6.4 Operation endpoints and denominators | k=1; attempted positive Newton formula at k=0 | γ¹(xy)=xy on both sides; at 0 division by k has denominator 0 and is excluded | r2 (98204e2): Retain k≥1 |

## Not verifiable

- **Items carried from r2 and r3, not retried.** GS87's supported λ-construction and Theorem 8.2; GS99's filtration and supported-operation locators other than p.41; Panin 2003 Theorem A; Riou; Brown–Gersten; Geisser. Hiller's obstruction proof was not read.
- **Lean coverage.** Targets without pinned carriers, including the three new §6.7 targets, were reviewed as specifications. The `sorry` build certifies elaboration only.
- **Kal80 is not unverifiable.** The scratch request lists Kal80 as an unreadable image-only scan. I read every cited page from rendered page images (see the locator table), so that request is answered.

## Source issues

- none
