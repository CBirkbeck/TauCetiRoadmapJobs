# Review of SchemeKTheoryOperations (pull request #1229 at 78ba9e5)

**Verdict:** needs changes

🤖 Independent AI incremental review of the 16 lines changed since 393a8f1. `needs changes` means the author makes the repairs below before the next review. The AI never approves or merges.

## R01 (P1) — The new supplier HomologicalStabilityOfGeneralLinearGroups closes a supply cycle

**Location.** TauCetiRoadmap/SchemeKTheoryOperations/README.md:2550: "*Needs:* HomologicalStabilityOfGeneralLinearGroups §§2.4 and 2.6, ring-level stability and the comparison with `GL(R)`; …". The same edge appears in the new supplier subsection at lines 71–77 and in the Layer 6 Dependencies at line 2818.

**Claim.** §6.7 now consumes HomologicalStabilityOfGeneralLinearGroups (HSGL) §§2.4 and 2.6. HSGL cannot be ordered before this roadmap. Its §2.2 spectral sequence comes from K3BlochGroups §4.1, and §§2.3, 2.4 and 2.6 are built on §2.2. K3BlochGroups in turn consumes this roadmap. The supply graph therefore has the cycle SchemeKTheoryOperations → HSGL → K3BlochGroups → SchemeKTheoryOperations.

**Witness.** At HSGL's open head (550b327), README lines 331, 411 and 461 require K3BlochGroups 4.1, and lines 355, 377 and 436 require §2.2/§2.3. K3BlochGroups README line 101 consumes §§3.6, 4.7, 5.2, 5.5 and 6.4 of this roadmap. In the merge order this roadmap is 36th and K3BlochGroups 138th.

The dependency tool confirms both placements fail. With HSGL inserted immediately before this roadmap it reports `UPWARD: HomologicalStabilityOfGeneralLinearGroups (#36) -> K3BlochGroups (#139) at README lines [331, 411, 461]`. Placed after its last supplier (K3BlochGroups), HSGL comes after this roadmap, so this roadmap's citation of it points upward.

The gate's depcheck passes only because HSGL is not in the merge order and its edges are not read (see Verified sound). The pull request's merge-order paragraph shows the same cycle: it puts K3BlochGroups, MotivicEtaleKTheory and ColemanIntegration ahead of this pull request. All three consume this roadmap; MotivicEtaleKTheory has a `From TauCetiRoadmap.SchemeKTheoryOperations` contract at its README line 51, and README line 9 here calls the other two downstream.

**Repair.** Break the cycle by moving ownership, then keep the citation as written.

- **Preferred: move the hyperhomology spectral sequence out of K3BlochGroups.** HSGL takes only the group-module hyperhomology spectral sequence from K3BlochGroups §4.1 (E¹ = H_q(G, C_p) for a group acting on a bounded-below complex). This is a generic construction. Make it HSGL's own target, or an earlier roadmap's, with K3BlochGroups importing it.
  - HSGL §2.5 and its Layer 2 Dependencies then drop K3BlochGroups.
  - Its K3BlochGroups Examples (4.2, 4.8, 4.15) become remarks that name no supplier.
  - HSGL's remaining suppliers (AlgebraicKTheory, StableHomotopyKTheory, GeneralAlgebraicKTheory) all sit at positions 15–17, so HSGL can go between GeneralAlgebraicKTheory and this roadmap.
  - The merge-order paragraph then lists HSGL before this pull request, with no consumer of this roadmap ahead of it.
- **Fallback: move the theorem down to this roadmap.** If HSGL keeps its K3BlochGroups edges, this roadmap cannot cite it.
  - Make the Noetherian ring-level theorem a §6.7 target here: for commutative Noetherian R of Krull dimension ≤ d, `H_j(GL_N(R);ℤ)→H_j(GL(R);ℤ)` is bijective for `N≥2j+max(1,d)`. Cite van der Kallen 1980, Theorem 4.11 and Corollary 4.12, together with AlgebraicKTheory A4's Bass bound.
  - State the hyperhomology spectral sequence its route needs.
  - Delete lines 71–77 and the HSGL entries at 2550 and 2818.
  - HSGL then cites this roadmap for that case.

**Test.** With HSGL placed immediately before this roadmap, `gate --depcheck` on HSGL's README must print no UPWARD line. At this head it prints the three lines above.

## R02 (P3) — HSGL §2.4 is described as the Noetherian case of the `GL(R)` comparison

**Location.** TauCetiRoadmap/SchemeKTheoryOperations/README.md:73: "Section 2.6 supplies the stable comparison `H_m(GL_n(R);ℤ)→H_m(GL(R);ℤ)` … and §2.4 its commutative Noetherian case". Line 2548 has the same wording: "§2.6, with its commutative Noetherian case in §2.4".

**Claim.** HSGL §2.4 does not state the `GL(R)` comparison. It is the Noetherian case of the one-step stabilization of §2.3. §2.6 is stated only under `SR_(sdim+2)` and has no Noetherian specialization in HSGL. The route in §6.7 does not need §2.4: it uses §2.6 with A4's Bass bound.

**Witness.** HSGL README:372 (at its head) states `homology_stabilization_of_ringKrullDim_le` for `groupHomology.map (stabilization R n)`, where `stabilization R n : GL_n(R) →* GL_(n+1)(R)`. For ℤ, m=1, n=3 it asserts that H₁(GL₃ℤ)→H₁(GL₄ℤ) is bijective. It says nothing about H₁(GL₃ℤ)→H₁(GL(ℤ)).

**Repair.** This applies if the citation survives R01. At lines 73 and 2548, attribute the Noetherian case to §2.6 together with AlgebraicKTheory A4's Bass bound. Then either drop §2.4 from lines 73, 77, 2550 and 2818, or describe it as "the one-step stabilization `GL_n→GL_(n+1)` for commutative Noetherian rings of Krull dimension at most d". The *Needs:* line at 2550 already splits the two sections correctly ("ring-level stability and the comparison with `GL(R)`").

## Previous findings

- None to account for. The previous report (r3, at 393a8f1) raised no findings and accepted the folder. Its four bullets record r2's R01–R04 as repaired. Those passages sit at README lines 60, 99, 922, 1019, 2382 and 2411–2447 at this head, shifted by +8 after line 70 because of the new supplier subsection. This diff does not touch them, and I checked that each still reads as r3 describes.

## Verified sound

**Scope and diff.** This is an incremental re-review of the 16 changed lines (12 insertions, 4 deletions) at 78ba9e50a3b35af581e82b5e96456a2cc781c7eb. The change is confined to TauCetiRoadmap/SchemeKTheoryOperations/README.md:

- the ownership sentence at line 11;
- the new `From TauCetiRoadmap.HomologicalStabilityOfGeneralLinearGroups` contract at lines 71–77;
- the §6.7 uniform-stability paragraph and its *Needs:* line at 2548–2550;
- the Layer 6 Dependencies at line 2818.

`git diff origin/main...HEAD` outside the folder is empty. The files listed outside the folder in the change summary arrive with the merge of main (3f7196b) and are not part of this pull request's diff. Suggested.lean and metadata.toml are byte-identical to 393a8f1. No pull-request file was edited.

**Gate and Lean.**

- The worker's gate reports every check at 0, including build=0 and depcheck=0. My rerun of the scanners printed `gate SchemeKTheoryOperations: … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- The dependency check printed `depcheck: 237 roadmaps, 2289 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. That result is a false negative for R01. HomologicalStabilityOfGeneralLinearGroups is not in the merge order, the check does not read its edges, and it does not report the unlisted supplier.
- In a scratch copy of the merge order with HSGL after K3BlochGroups, the tool printed `moved: HomologicalStabilityOfGeneralLinearGroups moved in the merge order up before SchemeKTheoryOperations (supplier of it listed after it)`. That move is impossible, because HSGL itself then points upward (R01).
- `lake env lean` on Suggested.lean succeeds; the only warning is `declaration uses sorry` at line 57.
- A scratch `#check @name` file for all three declarations elaborates to the same types as at r3. `IsStrictlyPerfect` and `IsPerfectComplex` take X and a cochain complex. The theorem keeps `CompactSpace`, `QuasiSeparatedSpace`, `HasDerivedCategory`, the finite-type quasicoherent quotient condition and `IsPerfectComplex X E`. No binder was lost.
- The new §6.7 statement is an intermediate stability lemma, not a headline. Its carriers (`GL(R)` as a colimit and its group homology over sections of affine opens) are README targets. The headline list and the docstring's not-statable list are unchanged, as is r3's padding verdict.

**Suppliers resolved at their heads.**

| Citation | Where it resolves | Result |
| --- | --- | --- |
| HSGL §2.6 (#2036, head 550b327) | TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/README.md:423–438 | Onto for n≥2m+e−1 and bijective for n≥2m+e, e=max(1,sdim), under `SR_(sdim+2)`. Matches line 73's range |
| HSGL §2.4 | same file, 369–378 | One-step `GL_n→GL_(n+1)` for Noetherian R of dimension ≤ d (R02) |
| HSGL §§2.2–2.3 | same file, 315–355 | §2.2 needs K3BlochGroups 4.1; §2.3 needs §2.2 (R01) |
| AlgebraicKTheory A4 (#1142, head 7398d9c) | TauCetiRoadmap/AlgebraicKTheory/README.md:428–462 | §4.1 `HasStableRangeLE`, shortening and K₁ stability. §4.2 `hasStableRangeLE_of_ringKrullDim_le` (s≤d+1, i.e. `SR_(d+2)`) and `hasStableRangeLE_one_of_isSemisimpleRing`. Line 11's new A4 sentence is accurate |
| GeneralAlgebraicKTheory §§3.3–3.4 (#1212, head 43e9df6) | its README, headings "3.3 Stable matrices and elementary transformations" and "3.4 Whitehead's stable commutator theorem" | Unchanged citation resolves |
| K3BlochGroups (#1430, head d0c9190) | TauCetiRoadmap/K3BlochGroups/README.md:101–103 and §4.1 at 1136 | Consumes this roadmap; §4.1 is a generic group-hyperhomology construction (R01) |

**Ownership by object.** I searched the open heads and main for "van der Kallen" and "homological/homology stability".

- HSGL is the only owner of ring-level `GL_n` homology stability. Its scope paragraph lists AlgebraicKTheory, ArithmeticKTheory and K3BlochGroups as non-owners, and its search matches mine.
- The K2SymbolsBrauer matches concern van der Kallen's Dennis–Stein presentation of K₂, a different object.
- ArithmeticKTheory states rank-filtration bounds that its README:1229 says are not homological stability bounds.
- Nothing in this roadmap restates the ring-level theorem; a grep for `H_m(GL`, `GL_N(` and "homology isomorphism" finds only lines 73, 77 and 2548.
- Recorded ownership move (conditional on R01): if HSGL keeps its K3BlochGroups edges, the Noetherian ring-level `GL` homology stability moves down to this roadmap's §6.7.

**Seeded sample.** None of the 15 seeded subsections (1.3, 1.5, 1.6, 2.2, 3.1, 3.3, 3.4, 4.4, 4.10, 4.11, 5.3, 5.6, 6.1, 6.11, 7.6) falls in the changed passages, and the README flags no locator as unverified. Their rows are carried below from r3, which carried them from r2.

**Remark on untouched text (no change requested).** README:2544 reads "The stable comparison the completed stable-GL/plus comparison identifies the latter …", which repeats its noun phrase.

**Adversarial table: changed statements.** All rows below are fresh computations at this head. K₁ and H₁ are written additively.

| Statement | Instances tried | Values computed on the two sides / negative control | Result; change |
| --- | --- | --- | --- |
| §6.7 threshold `N₀=2q+max(1,d)`, README:2548 | ℤ (d=1), q=2 | N₀=5. HSGL §2.6 needs N≥2j+1 for j≤1, i.e. N≥3. Control N=2: H₁(GL₂ℤ)=(ℤ/2)²→H₁(GLℤ)=ℤ/2 is not injective | Correct, not sharp (2q−2+max(1,d) suffices) |
| same | 𝔽₂ (d=0), q=2 | N₀=5. N=2: ℤ/2→H₁(GL𝔽₂)=0 is not injective. N=3: H₁(GL₃𝔽₂)=0→0 is bijective | Correct |
| same | ℤ[x], X=A¹_ℤ (d=2), q=2 | N₀=6. The HSGL §2.4 Check gives H₁ bijective from n≥4 | Correct |
| same, boundary | q=0; V=∅ | q=0: "degrees j<0" is empty, N₀=max(1,d)≥1 as before. V=∅: O(V)=0, GL_N=GL=1, H₀ is ℤ→ℤ identity | Correct |
| Uniformity over affine opens, README:2548 | Spec ℤ_(p) with V=D(p); A¹_ℤ with V=D(2) | dim ℚ=0≤1; dim ℤ[1/2][t]=2≤2; both rings Noetherian | Correct. "dim X≤d" excludes Nagata's infinite-dimensional Noetherian ring |
| Bass bound `SR_(d+2)` via A4, README:2548 | ℤ; a field; the zero ring | ℤ: (2,5) is unimodular (2·3−5=1) but 2+5c≠±1, so SR₂ fails and SR₃ holds (d=1). Field: SR₂ (d=0). Zero ring: every SR | Correct; matches AlgebraicKTheory §4.2 |
| HSGL contract range, README:73 | ℤ, m=1 | §2.6: bijective for n≥3, H₁(GL₃ℤ)=ℤ/2=H₁(GLℤ). n=2 is only onto | Agrees with HSGL at its head |
| "§2.4 its commutative Noetherian case", README:73, 2548 | ℤ, m=1, n=3 | §2.4 asserts H₁(GL₃ℤ)→H₁(GL₄ℤ) bijective (one step). The `GL(ℤ)` comparison is §2.6's, under SR only | Mismatch: R02 |
| Direction of the new edge, README:71–77, 2550, 2818 | Merge order with HSGL at 36 and at 139 | At 36: UPWARD HSGL→K3BlochGroups (lines 331, 411, 461). At 139: this roadmap (36) cites HSGL (139). K3BlochGroups (138) consumes §§3.6, 4.7, 5.2, 5.5, 6.4 here | Cycle: R01 |
| Ownership sentence on A4, README:11 | AlgebraicKTheory Layer 4 | §4.1 stable range and shortening; §4.2 Bass bound s≤d+1 and semilocal stable range one | Correct |
| Check "field point … uniform GL stability", README:2567 | Field F, d=0 | N₀=2q+1 gives bijectivity. Suslin's sharper range (K3BlochGroups 4.8) does not contradict it | Consistent |

**Adversarial table: unchanged statements, carried from r3.** These rows are carried from packages/SchemeKTheoryOperations/reports/PRREVIEW-SchemeKTheoryOperations~3.md (r3, at 393a8f1). Rows tagged r3 were computed there. Rows tagged r2 were carried by r3 from PRREVIEW-SchemeKTheoryOperations~2.md (at 98204e2). This diff changes none of their statements. README line numbers at or after line 71 in the r3 rows are 8 higher at this head. These rows were not recomputed in this review.

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

- **GS99, proof of Proposition 5, p.41.** This locator sits in the changed §6.7 paragraph; the locator text itself is unchanged. The sources service fetched the archived institutional copy, but it is an image-only scan. This worker has no OCR and no PDF page renderer, so the page could not be read. The locator was not re-certified, and r2's verification of it stands as r2's.
- **van der Kallen 1980 (Invent. Math. 60, DOI 10.1007/BF01390018), Theorem 4.11 and Corollary 4.12.** These are cited by HSGL, not by this README. The DOI resolves only to the paywalled publisher, by DOI and by title. I recomputed the numeric ranges restated at README:73 and 2548 against HSGL's own statement and Checks (𝔽₂, ℤ, ℤ[x]), not against the source.
- **Items carried from r2 and r3.** GS87's supported λ-construction and Theorem 8.2, GS99's filtration and supported-operation locators, Panin 2003 Theorem A, Riou, Brown–Gersten and Geisser were not retried. Hiller's obstruction proof was not read.
- **Lean coverage.** Targets without pinned carriers, including the new uniform-stability statement, were reviewed as specifications. The `sorry` build certifies elaboration only.

## Source issues

- none
