# Review of QuiverRepresentationsPartII (pull request #1486 at 8fe0038)
**Verdict:** accepted

:robot: Independent AI review, incremental: 2 changed lines of `TauCetiRoadmap/QuiverRepresentationsPartII/README.md` since 4f50add. Only the second sentence group of the Scope paragraph (line 7) changed. `Suggested.lean` and `metadata.toml` are byte-identical to the head the previous review read, and nothing changed outside the folder. The change applies the previous review's R01 repair word for word. The gate passes, and no finding remains.

## Findings

None.

## Previous findings

- R01 — repaired: line 7 now reads "they are the deliverables of the parent’s Layers 1, 2 and 5, and this roadmap consumes them through the pinned declarations named under Exact supplier contracts." The repair introduces no new problem; the checks are below.

## Verified sound

### What was checked at this head

- **The diff.** It replaces one clause of README line 7. The clause was read in context with everything that cites it or that it cites: the From Tau Ceti contract (lines 69–75), the From TauCetiRoadmap.QuiverRepresentations contract (lines 79–81), and the `*Needs:*` and Dependencies lines that consume the same results (lines 166, 221, 245, 259, 302). The diff adds no target, source locator, Check, theorem statement or Lean name.
- **Gate**, re-run on this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate, which includes the targeted build, also reports `build=0 OK`.
- **Dependency check**: `depcheck: 239 roadmaps, 2430 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. This roadmap is at line 264 of the merge order. SmoothRepresentationsOfLocalGroups (line 26) and EndoscopicTransferAndUnitaryTraceComparison (line 145) are earlier. QuiverRepresentations and AlgebraicVectorBundles are on main.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/QuiverRepresentationsPartII/Suggested.lean` exits 0 with exactly 13 `declaration uses sorry` warnings (lines 96, 99, 104, 122, 142, 187, 196, 200, 226, 231, 238, 242, 246) and nothing else.
- **`#check @name` pass.** A scratch copy with `#check @` appended for all 40 declarations elaborates with exit 0. Each elaborated type matches the worker's extraction, and none has lost a binder. For example, `chainWeight_peeling` keeps its guard `cutPart m a ≠ 0`, `grid_path_chain_max` keeps `a ≤ r` and `InWindow m r`, and `reconstruction_from_image` keeps the grade-dimension, grading and intertwining hypotheses. Nothing changed.
- **Resolver**, re-run: no cross-roadmap citation found nowhere and no Lean name found nowhere. The worker's single lead, `GridPath.weight_bound` (README line 690), is this roadmap's own theorem at `Suggested.lean` line 226.
- **Overlaps**, re-run: no open pull request changes this roadmap or drops an id it cites, and no id is defined only by an open revision. The closest roadmap in vocabulary is #1526, a revision of the parent at head eaba7a0, read by hand below.
- **Seeded sample.** None of the 15 sampled targets (0.2, 1.2, 1.3, 2.1, 2.2, 2.4, 3.3, 3.4, 3.5, 4.1, 4.2, 4.4, 4.7, 5.2, 5.5) lies in the changed passage, which is the Scope paragraph and carries no locator. So no source was reopened this round. Their statements and Checks are unchanged since the full review, and their adversarial rows are carried forward below.

### The changed sentence against the parent on main and at its open revision

| Claim in README line 7 | Resolved at | Result |
| --- | --- | --- |
| The module equivalence is the deliverable of the parent's Layer 1 | Parent on main (`TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md`), line 235: Layer 1 states `quiverRepEquivalence` as layer content | Resolved |
| Krull–Schmidt for finite-length modules and for representations is the deliverable of Layer 2 | Parent on main, line 251 ("both are built here") and line 266 ("then transport to `QuiverRep k Q` and to categorical biproducts") | Resolved; both forms the sentence names are Layer 2 content |
| Gabriel's correspondence is the deliverable of Layer 5 | Parent on main, line 376: `gabriel_indecomposable_equiv_posRoot` under line 350's `Q` connected, `[IsAlgClosed k]` | Resolved; the pinned form is more general (next table) |
| "this roadmap consumes them through the pinned declarations named under Exact supplier contracts" | README lines 69–73 name 7 pinned declarations; `*Needs:*` lines 221, 245, 259 and Dependencies line 302 cite Tau Ceti for them | Resolved; no line cites a parent declaration name for these results (grep for `krullSchmidt_unique` and `gabriel_indecomposable_equiv_posRoot`: 0 hits) |
| Cited parent layer ids at the open revision #1526 (eaba7a0) | Revision Scope, line 19: "Its layers retain their roles". Layer 1 is "representations and the module equivalence", Layer 2 "finite-length decomposition", Layer 5 "Gabriel and the marked rational root system". Its §5.1, line 723, still states the equioriented Aₙ interval classification that README line 81 consumes | No cited id is dropped. The revision lists these results in its own From Tau Ceti supply (line 29, "(Layers 0–2)"). As the brief requires for a revision, the sentence is written against main. |

### Pinned declarations reopened (Tau Ceti a91d3aa, the branch's `lake-manifest.json`)

| Pinned file and line | Declaration as it is at the pin | README claim checked |
| --- | --- | --- |
| `TauCeti/RepresentationTheory/Quiver/Representation/AsModule.lean:574` | `TauCeti.quiverRepEquivalence : QuiverRep k Q ≌ ModuleCat (pathAlgebra k Q)` | Line 69 and the line 7 consumption: correct |
| `TauCeti/RingTheory/KrullSchmidt/Existence.lean:178` | `exists_indecomposable_decomposition (hM : IsFiniteLength A M) : ∃ s : Finset (Submodule A M), … DirectSum.IsInternal …` | Line 71: correct |
| `TauCeti/RingTheory/KrullSchmidt/Uniqueness.lean:228` | `exists_equiv_linearEquiv_of_finset (hM : IsFiniteLength A M) {s t : Finset (Submodule A M)} …` | Line 71: correct |
| `TauCeti/RepresentationTheory/Quiver/Representation/KrullSchmidt.lean:85`, `:110`, `:148` | `QuiverRep.exists_indecomposable_iso_biproduct (M) (hM : IsFinDim k Q M) : ∃ n (P : Fin n → …)`; `exists_equiv_iso_of_iso_biproduct`; `card_iso_eq_card_iso_of_iso_biproduct … (N)` | Line 71: correct |
| `TauCeti/RepresentationTheory/Quiver/FiniteRepType/Correspondence.lean:78` | `gabrielIndecomposableEquivPositiveRoot (hpd : (titsForm V).PosDef) : Skeleton (FullSubcategory (IsFinDim ∧ Indecomposable)) ≃ …` | Line 73: correct |

For information only, since the pins are the branch's: main's newer Tau Ceti pin (2fd255d) still has all seven names. There `quiverRepEquivalence` is at `AsModule.lean:565` and `exists_equiv_linearEquiv_of_finset` at `Uniqueness.lean:215`. The README cites module paths, not line numbers, so it is unaffected.

### SmoothRepresentationsOfLocalGroups targets cited next to the changed sentence

Line 9 and the contract at line 89 cite SR.5.2 *segment-representations* and SR.5.3 *highest-derivative-adapter*. At the head 4178a1e of the new-roadmap pull request #1688, earlier in the merge order, *segment-representations* is defined inside §SR.5.2 (line 4427, section 3821–4853), and *highest-derivative-adapter* inside §SR.5.3 (line 4910, section from 4854). Both resolve.

### Adversarial computations

Rows computed at this head for the changed statement:

| Statement | Instances tried | Values computed on both sides / positive and negative controls | Result; change |
| --- | --- | --- | --- |
| Line 7: the three results are "the deliverables of the parent's Layers 1, 2 and 5" | Parent on main, Layers 1, 2 and 5 | Layers stating the result as their own content: 3 of 3 (lines 235, 251/266, 376); layers importing it from a library: 0 of 3. The replaced wording ("consume") gave 0 of 3 agreement | Pass; R01 repaired |
| Line 7: "this roadmap consumes them through the pinned declarations named under Exact supplier contracts" | From Tau Ceti, lines 69–73; *Needs:* lines 221, 245, 259; line 302 | Pinned names given: 1 equivalence + 2 module Krull–Schmidt + 3 representation Krull–Schmidt + 1 Gabriel = 7, all open at a91d3aa. Consuming lines that cite Tau Ceti: 4 of 4. Lines citing a parent declaration instead: 0 | Pass; retain |
| Line 7 direction against lines 71, 79, 81 | The four sentences about these suppliers | Line 7 "this roadmap consumes", line 71 "consumed from Tau Ceti", line 79 "From Layer 1 consume … through the pinned", line 81 "From Layer 5 consume the type-A specialization". One direction in 4 of 4; at 4f50add, line 7 contradicted line 79 | Pass; retain |
| Generality: "Gabriel's dimension-vector correspondence for positive-definite quivers" versus parent Layer 5 (connected, `[IsAlgClosed k]`, ADE) | A₂ and A₃ over ℂ; A₁ ⊔ A₁; A₂ over ℝ | A₂ over ℂ: pinned gives (1,0),(0,1),(1,1), Layer 5 gives α₁,α₂,α₁+α₂, so 3 = 3. A₃ (window [0,2]): 6 = 3·4/2 on both sides. A₁ ⊔ A₁ (q = d₀²+d₁², positive definite, disconnected): pinned gives 2 classes, Layer 5 does not apply. A₂ over ℝ: pinned applies, Layer 5 does not. This roadmap uses only ℂ and connected windows [u,v] with u ≤ v, where the two agree | Pass; the pinned result covers the parent's case, retain |
| Parent ids cited (Layers 1, 2, 5) at the open revision #1526 | Headings and content at eaba7a0 | Layer numbers kept, 3 of 3. The module equivalence is in Layer 1, the decomposition in Layer 2, and the Aₙ interval statement in §5.1 (line 723). Dropped ids: 0 | Pass; retain |

Rows carried forward for the statements the diff leaves untouched. Every row marked [r2] is quoted from the review at 4f50add, which computed the first six at that head and carried the rest from the full review at a3f4dcc. The diff changes no statement, Check, example or Lean signature these rows test. The full review also checked exhaustively all 1,001 multisets of at most four intervals with endpoints in {−1,0,1,2} under six cuts, 1,000 reinsertion cases, 100 commutator systems and 5,337 enumerated grid paths. Those instances are unchanged.

| Statement | Instances tried | Values computed on both sides / positive and negative controls | Result; change |
| --- | --- | --- | --- |
| From Tau Ceti: left-module convention of `quiverRepEquivalence` | Path 0→1→2, arrows α: 0→1, β: 1→2; rep [0,2] with v₀↦v₁↦v₂ | Pinned product: single⟨1,2,β⟩ · single⟨0,1,α⟩ = single⟨0,2,α.comp β⟩; hence (β·α)v₀ = v₂, α·β = 0 (not composable), e₁·α = α = α·e₀; the opposite convention would give (α·β)v₀ = v₂ and β·α = 0 | Pass; "later arrow multiplies on the left" is the pinned convention [r2] |
| From Tau Ceti: `exists_indecomposable_decomposition`, `exists_equiv_linearEquiv_of_finset` on a window module | Window [0,1], zero arrow, m=[0,0]+[1,1]; m=2[0,0] | First: kQ-submodules are the graded subspaces, so the only finset is {ℂv₀, ℂv₁}, cards 2=2, bijection the identity. Second: {ℂ(1,0), ℂ(0,1)} and {ℂ(1,1), ℂ(1,−1)} are two distinct finsets, each of two distinct, mutually isomorphic submodules; cards 2=2, multiplicity 2 of [0,0] survives in both | Pass; retain [r2] |
| From Tau Ceti: representation-level `exists_indecomposable_iso_biproduct`, `card_iso_eq_card_iso_of_iso_biproduct` | m=[0,1]+[0,0] on window [0,1], arrow of rank 1, dimension vector (2,1) | Decomposition `Fin 2` → {[0,1],[0,0]}; the family {[0,0],[0,0],[1,1]} has the same dimension vector but arrow rank 0≠1, so no isomorphism with M exists; `card_iso` for N=[0,0]: 1=1, for N=[0,1]: 1=1, for N=[1,1]: 0=0 | Pass; retain [r2] |
| From Tau Ceti: "finite dimensional over ℂ, hence of finite length" | Window [0,1], grade dimensions (1,1); window [0,0] with dimension 0 | dim_ℂ=2; composition series 0 ⊂ ℂv₁ ⊂ M (ℂv₁ is a submodule, arrows raise degree), length 2 ≤ dim 2; zero module has length 0; finite dimension gives Artinian and Noetherian by the scalar tower, as the pinned proof at `KrullSchmidt.lean:88` does | Pass; retain [r2] |
| From Tau Ceti: `gabrielIndecomposableEquivPositiveRoot` on A₂ and A₃ | A₂: q(d₀,d₁)=d₀²+d₁²−d₀d₁; A₃ | A₂ nonnegative solutions of q=1: (1,0),(0,1),(1,1), three = the three intervals in {0,1}; (2,1) gives q=3 and (1,−1) fails 0≤d, both excluded. A₃: (1,0,1) gives 1+1−0−0=2≠1, so a disconnected support is not a root, matching [0,0]+[2,2] decomposable; count 6=3·4/2 | Pass; retain [r2] |
| Parent Layer 5: type-A interval specialization and orientation reversal | Interval representation [i,j] on Aₙ with identity arrows; reversed orientation | End = ℂ (a scalar at i propagated by identity arrows), so indecomposable; dimension vector 1_{[i,j]}; q(1_{[i,j]}) = (j−i+1) − (j−i) = 1; the bijection sends its class to that root and no other class to it. Reversing all arrows changes neither dimension vectors nor q, so the same interval supports occur | Pass; the citation is the Aₙ instance of the parent’s bijection [r2] |
| Conventions: inclusive nonempty intervals | [0,2], [3,3], reversed (3,2) | Point counts 3,1; 2∈[0,2], 3∉[0,2]; reversed pair violates 3≤2 | Pass; retain [r2] |
| Conventions: operator directions | Grades (0,1), N=E₂₁, L=E₁₂ | Nv₀=v₁, Lv₁=v₀; N²=L²=0, N,L≠0 | Pass; retain [r2] |
| Conventions: trace sign | N=E₂₁, L=E₁₂, X=diag(1,0) | NL−LN=diag(−1,1); tr([X,N]L)=−1=tr(X[N,L]) | Pass; retain [r2] |
| Conventions: shift | [0,2], c=−1 | Image type [1,2], shifted image [0,1]=T[0,2]; opposite sign gives [2,3] | Pass; retain [r2] |
| Conventions: local-field norm and Z/L | q=2, trivial cuspidal, [0,1] | Norm of uniformizer 1/2; Z is determinant twist of exponent 1/2, L its Steinberg twist; singleton Z=L | Pass; retain [r2] |
| 0.1 length | [−1,1], [3,3] | e−b+1=3,1, equal to inclusive point counts | Pass; retain [r2] |
| 0.1 shift and membership | [2,4], c=−1 | [1,3], length 3=3; translated member 3 corresponds to 4 | Pass; retain [r2] |
| 0.1 shortening | [3,3], [3,4] | none, [3,3]; surviving lengths 0=1−1, 1=2−1 | Pass; retain [r2] |
| 0.1 shortening commutes with shift | [2,4], c=−1; [3,3] | Both orders [1,2]; both orders none for singleton | Pass; retain [r2] |
| 0.1 inclusion order | [1,1], [0,2], [3,3] | First⊆second true, reverse false; third⊆second false | Pass; retain [r2] |
| 0.2 multisegment occurrence carrier | 2[0,1], [0,0]+[2,2], 0 | Label counts 2,2,0; duplicate value has count 2, distinct values each count 1 | Pass; retain [r2] |
| 0.2 right truncation additivity | [0,0]+2[1,2] | T(sum)=2[1,1]=0+2T[1,2] | Pass; retain [r2] |
| 0.2 grade dimensions and total length | [0,2]+[1,1] | Grade dimensions (1,2,1); sum 4=3+1; occurrence count 2 | Pass; retain [r2] |
| 0.2 truncation decreases length | [0,0]+[1,3]; 0 | Lengths 4→2=4−2; empty 0→0=0−0 | Pass; retain [r2] |
| 0.2 translation and occurrence permutation | 2[2,4], c=−1; swap the two labels | Both give 2[1,3]; length 6=6, degree-1 count 2 equals original degree-2 count 2 | Pass; retain [r2] |
| 0.3 one-copy maximal part | 2[0,2]; [0,2]+[1,1] | M=[0,2] in both; R=[0,2] and [1,1] respectively; M+R=m | Pass; retain [r2] |
| 0.3 incomparable maxima and empty input | [0,0]+[2,2]; 0 | M=m,R=0; M0=R0=0; two different maxima are not inclusion-comparable | Pass; retain [r2] |
| 0.3 maximal containment | [0,2]+[1,1] | [1,1]⊆[0,2]; sole maximal interval contains both occurrences | Pass; retain [r2] |
| 1.1 coordinate carrier and grade | n=2, degrees (0,1) | Carrier dimension 2; grade dimensions 1,1; (1,0) lies in grade 0 but not 1 | Pass; retain [r2] |
| 1.1 constantSpace | n=2 at grade 3; n=0 | Dimensions at grades 3,4 are 2,0; zero presentation has all dimensions 0 | Pass; retain [r2] |
| 1.1 internal sum | Degrees (0,1), vector (1,1); n=0 | Unique components (1,0)+(0,1); zero case unique component family 0 | Pass; retain [r2] |
| 1.1 finite support and coordinate presentation | Degrees (3,3) | Nonzero-grade support {3}; grade dimension 2 equals two basis indices, not 1 | Pass; retain [r2] |
| 1.2 Direction and reversal | up, down | Steps 1,−1; twice reversal returns up; reflection [0,2]→[−2,0] | Pass; retain [r2] |
| 1.2 homogeneity and Pair | E₂₁ on grades (0,1); identity on grade 0 | E₂₁ has degree +1 and fails −1; identity fails +1; zero has both degrees | Pass; retain [r2] |
| 1.2 uniform nilpotence | [0,2], singleton, zero space | N³=0 while N²≠0; zero singleton killed by exponent 1; zero space likewise | Pass; retain [r2] |
| 1.2 graded pair isomorphism | Nonzero [0,1] arrow; scalar 2; shifted singleton | 2N=N2 and inverse scalar 1/2; zero arrow versus N has ranks 0≠1; singleton grade 0 versus 1 fails grading | Pass; retain [r2] |
| 1.2 isomorphism identity/inverse/composition | Scalars 1,2,1/2 on [0,1] | Intertwining values v₁,2v₁,v₁/2; composition 2·(1/2)=1 | Pass; retain [r2] |
| 1.2 finite-window equivalence | [0,0] enlarged to [−1,1]; [0,1] to [−1,2] | New vertex dimensions (0,1,0) and (0,1,1,0); boundary arrows 0; interior arrow 1 before/after | Pass; retain [r2] |
| 1.3 standardSpace and basis | [0,2], 2[0,1] | Total dimensions 3,4; duplicate grade-0 dimension 2; distinct occurrence vectors independent | Pass; retain [r2] |
| 1.3 standardVector junk indices | [0,1], degree 0 versus 2 | Valid vector v₀≠0; out-of-support vector 0; both satisfy their named grade condition | Pass; retain [r2] |
| 1.3 standardPair arrows | [0,1], both directions | Up v₀↦v₁↦0; down v₁↦v₀↦0; boundaries map to 0 | Pass; retain [r2] |
| 1.3 pairType | Singleton at 2; nonzero/zero arrows on (0,1) | [2,2]; [0,1]; [0,0]+[1,1], respectively | Pass; retain [r2] |
| 1.4 classification iff | Same (1,1) dimension vector, arrow 0 or 1 | Types differ and rank 0≠1 prevents isomorphism; nonzero scalars 1,2 give same type and a diagonal intertwiner | Pass; retain [r2] |
| 1.4 dimension formula | [0,2]+[1,1] | Interval counts at 0,1,2 are 1,2,1, equal to graded finranks | Pass; retain [r2] |
| 1.4 rank finite differences | [0,2]+[1,1] | R01=R12=R02=1; multiplicity [1,1]=2−1−1+1=1; [0,2]=1−0−0+0=1 | Pass; retain [r2] |
| 1.5 shift laws | [0,1], shifts −1 then 2 | Result [1,2]=shift by 1; shift by 0=[0,1]; empty remains empty | Pass; retain [r2] |
| 1.5 actual ImageModel | N on [0,2] | Image span(v₁,v₂), dimension 2; correct embedding has rank 2, zero embedding rank 0, span(v₀,v₁) misses v₂ | Pass; retain [r2] |
| 1.5 image intertwining | Same image basis v₁,v₂ | Restricted N(v₁)=v₂ and N(v₂)=0, equal after embedding | Pass; retain [r2] |
| 1.5 VN/WL image types | [0,2] | VN [1,2], then shift −1 gives [0,1]; WL directly [0,1] | Pass; retain [r2] |
| 1.5 iteratedImage | [0,2], k=0,1,2,3 | Ranges V,span(v₁,v₂),span(v₂),0; dimensions 3,2,1,0; one more image gives next range | Pass; retain [r2] |
| 1.5 zero and singleton images | Zero operator on a nonzero singleton; zero space | k=0 dimensions 1 and 0; all k≥1 dimensions 0 in both | Pass; retain [r2] |
| 1.6 reconstruction | [0,2]+[1,1] versus [0,2] | Both VN images [1,2], but degree-1 dimensions 2≠1; missing-dimension countermodel is excluded | Pass; retain [r2] |
| 1.6 reconstruction positive instance | Same type, scale N by 2 | Image equivalence scales (v₁,v₂) by (2,4); ambient diagonal (1,2,4) intertwines; dimensions (1,1,1) agree | Pass; retain [r2] |
| 2.1 centralizer submodule | [0,2]; [0,0]+[1,1]; 0 | Opposite-centralizer dimensions 0,1,0; full endomorphism centralizer would give a different answer | Pass; retain [r2] |
| 2.1 oppositePair preserves chosen operator | Adjacent singletons, coefficients 0,1,2 | v₁ maps to 0,v₀,2v₀ respectively; replacing all by zero fails at coefficient 1 | Pass; retain [r2] |
| 2.1 restriction and kernel | [0,1]+[1,2]; adjacent singletons | First restriction y₂↦λx₁ retains λ, rank 1→1; second restricts the entire scalar line to 0, kernel dimension 1 | Pass; retain [r2] |
| 2.1 conjugation naturality | Scale both x-vectors by 2 in [0,1]+[1,2] | Conjugated coefficient 2λ; restricting before/after gives y₂↦2λx₁ | Pass; retain [r2] |
| 2.2 Precedes iff block exists | Target/source [0,0]/[1,1], self [0,2], separated [0,0]/[2,2] | Block dimensions 1,0,0; inequalities true,false,false | Pass; retain [r2] |
| 2.2 independent block coordinates | Two targets at 0, three sources at 1 | Six independent entries; matrix [[8,16,32],[27,81,243]] has minor 216 and rank 2 | Pass; retain [r2] |
| 2.2 block extraction/reconstruction | [0,1]+[1,2], coefficient λ=2 | Values Ly₁=2x₀,Ly₂=2x₁; extraction returns 2; NLy₁=LNy₁=2x₁ | Pass; retain [r2] |
| 2.3 VN image restriction surjection | [0,1]+[1,2], image coefficient 2 | Source and image centralizers each dimension 1; λ=2 lifts to the same λ=2 | Pass; retain [r2] |
| 2.3 deleted singletons | [0,0]+[1,1] | Image zero, target centralizer dimension 0; source dimension 1 still surjects onto 0 | Pass; retain [r2] |
| 2.4 WL image restriction surjection | Reflect previous four-vector example | Degrees 0,−1,−1,−2; opposite map raises degree; same coefficient 2 lifts; reflected interval [1,2] becomes [−2,−1] | Pass; retain [r2] |
| 2.5 polynomial topology | D(X), D(0), D(3), unit disk | D(X)=ℂ\{0}, D(0)=∅, D(3)=ℂ; disk has infinite complement and is not a nonempty Zariski-open subset of ℂ | Pass; retain [r2] |
| 2.5 nonzero evaluation | p=X(X−1), x=0,1,2 | Values 0,0,2; constant 3 in zero variables evaluates to 3 | Pass; retain [r2] |
| 2.5 coordinate invariance | x↦2x, D(X) | Pullback D(2X)=ℂ\{0}=D(X); inverse x↦x/2 recovers original | Pass; retain [r2] |
| 2.5 irreducibility/finite intersection | D(X),D(X−1); dimension zero | Intersection ℂ\{0,1} contains 2; zero-dimensional whole space has exactly one point; empty family intersection is whole space | Pass; retain [r2] |
| 2.5 surjective pullback | Projection ℂ²→ℂ and D(X) | Inverse image x≠0 contains (1,0), excludes (0,1); zero map gives empty inverse image and fails surjectivity | Pass; retain [r2] |
| 2.5 affine-subspace intersection | D(X) against {0} and {1} | Intersections ∅ and {1}; only second satisfies nonemptiness and is dense in its one-point subspace | Pass; retain [r2] |
| 2.6 genericType and genericLocus | [0,2]; adjacent singletons; separated singletons | Types three singletons, [0,1], unchanged separated sum; loci point, ℂ×, point respectively | Pass; retain [r2] |
| 2.6 uniqueness of generic type | Adjacent singletons | Nonzero coefficient rank 1 on ℂ×; zero coefficient rank 0 only at {0}, which is not dense | Pass; retain [r2] |
| 2.6 generic conjugation/translation | Adjacent singletons, diag(2,1), shift −2 | λ=1↦2 stays generic; type [0,1] shifts to [−2,−1]; coefficient 0 remains nongeneric | Pass; retain [r2] |
| 2.7 incidence and tangent annihilator | Two one-dimensional adjacent grades | Equation nl=0; tangent to n≠0 orbit has dimension 1 and annihilator l=0; tangent at n=0 orbit is 0 and fibre ℂ | Pass; retain [r2] |
| 2.7 smooth locally closed irreducible orbits | Scalar up space ℂ | Orbits {0},ℂ×, dimensions 0,1; stabilizers G,diagonal Gₘ; orbit tangent ranks 0,1 | Pass; retain [r2] |
| 2.7 conormal bundle and closure dimension | Same scalar orbits | Base/fibre dimension sums 0+1=1 and 1+0=1=dim E₊; closures are the two axes | Pass; retain [r2] |
| 2.7 incidence components | nl=0; zero grading | Two distinct one-dimensional axis components; zero grading one point of dimension 0 | Pass; retain [r2] |
| 2.7 opposite projection and generic fibre | Up axis versus down axis | Projections to down space {0},ℂ; generic fibres meet opposite orbits in {0},ℂ×, each nonempty and dense in its fibre | Pass; retain [r2] |
| 2.7 reduced/test-scheme convention | n=l=ε in ℂ[ε]/(ε²) | nl=0, n≠0,l≠0; map does not factor through either axis, despite topological component cover | Pass; retain [r2] |
| 2.7 conormal symmetry | [0,2]; adjacent singletons | Generic opposite types three singletons and [0,1]; opposite-generic return types [0,2] and adjacent singleton sum | Pass; retain [r2] |
| 2.8 dual and nonadditivity | [0,2]; [0,0]+[1,1]; [0,0]+[2,2] | D values three singletons; [0,1]; unchanged separated sum; D(sum)≠sum of singleton duals in adjacent case | Pass; retain [r2] |
| 2.8 WL identification by transpose | Up pair [0,1]+[1,2] | L=N-opposite blocks transposes to degree +1 on dual grades; interval labels remain [0,1]+[1,2], without endpoint negation | Pass; retain [r2] |
| 2.8 dimension and translation compatibility | 2[0,0]+3[1,1]; adjacent sum shifted −2 | Dual 2[0,1]+[1,1] has dimensions (2,3), length 5=5; both shift orders give [−2,−1] | Pass; retain [r2] |
| 2.9 involution | 0; [0,2]; 2[0,0]+3[1,1] | D² results 0, [0,2], original five occurrences; all 1,001 finite tests return input | Pass; retain [r2] |
| 3.1 Admissible | Adjacent zero VN with λ=0 or 1 | WL types two singletons versus [0,1]; only λ=1 has type Dm | Pass; retain [r2] |
| 3.1 actual opposite image | [0,1]+[1,2], λ=1 | Im L=span(x₀,x₁), N-type [0,1]; span(x₁,y₂) has equal dimension 2 but is the wrong range | Pass; retain [r2] |
| 3.1 imageAdmissibleLocus | Same triple; single VN chain | Image WL type [0,0]+[1,1]=D[0,1]; chain has L=0 and zero image, giving 0=D0 | Pass; retain [r2] |
| 3.1 conjugation and shifts | λ=1→2; all grades shifted −1 | Actual image subspace unchanged; image N-type [0,1]→[−1,0]; both predicates stay true | Pass; retain [r2] |
| 3.2 image genericity and minor charts | Adjacent singleton pair | Open locus λ≠0; image basis λv₀ uses denominator λ; λ=0 is excluded from chart, not divided by | Pass; retain [r2] |
| 3.3 simultaneousRestrictions | [0,2], L=0, k=0,1,2,3 | Image dimensions 3,2,1,0; all induced L=0 and image-admissible; k=0 zero embedding wrongly has dimension 0≠3 | Pass; retain [r2] |
| 3.3 same original L at every image | [0,1]+[1,2], λ=2 | On Im N, Ly₂=2x₁; substituting zero gives 0≠2x₁; next opposite image span(x₁) has both types [1,1] | Pass; retain [r2] |
| 3.4 H definition and dual formula | Adjacent singletons | Dm=[0,1], TDm=[0,0], Hm=[0,0]; D(Hm)=[0,0]=TDm | Pass; retain [r2] |
| 3.4 actual image realization and length | [0,1]+[1,2] | Hm=[0,1], represented by span(x₀,x₁); length 2≤4 | Pass; retain [r2] |
| 3.4 chain, separated and empty cases | [0,2]; [0,0]+[2,2]; 0 | H values 0,0,0; lengths 0≤3,0≤2,0≤0 | Pass; retain [r2] |
| 3.4 translation compatibility | Adjacent singleton sum, shift −2 | Both orders give [−2,−2]; image grade moves 0→−2 | Pass; retain [r2] |
| 3.5 HT=TH | [0,1]+[1,2]; adjacent singleton sum | Both sides [0,0] in first case, 0 in second; Im LN=Im NL=span(x₁), then shift −1 | Pass; retain [r2] |
| 4.1 cut retains either grade | Adjacent singletons, a=0 | Cut size 2, although neither interval contains both grades | Pass; retain [r2] |
| 4.1 IsInclusionChain | Empty; {[0,2],[1,1]}; adjacent singleton set | Truth values true,true,false | Pass; retain [r2] |
| 4.1 chainWeight and full multiplicities | 2[0,1]+[1,1], a=0 | Maximum 3=2+1; support size 2 would undercount | Pass; retain [r2] |
| 4.1 attainment, bound and zero iff | Adjacent singletons at a=0 and a=3 | E₀=1≤2, attained by either singleton; E₃=0=cut size, attained by empty chain | Pass; retain [r2] |
| 4.1 adjacentDualCount | Adjacent singleton sum; [0,2], a=0 | Dual crossing counts 1 and 0; merely meeting counts 1 and 2 respectively | Pass; retain [r2] |
| 4.2 strict endpoint relation | [0,0]<[1,1]<[2,2]; duplicate [0,1] | Transitive edge 0→2 true; self/duplicate edges false; equal-left [0,0],[0,1] also incomparable | Pass; retain [r2] |
| 4.2 endpoint antichain and width | 2[0,1]; adjacent singletons; nested [0,2]+[1,1] | Widths 2,1,2; inclusion-chain weights on relevant cuts agree | Pass; retain [r2] |
| 4.2 matching predicate | Three successive singletons | {(0,1),(1,2)} valid, size 2; {(0,1),(0,2)} and {(0,2),(1,2)} invalid by repeated projections | Pass; retain [r2] |
| 4.2 matching maximum | Duplicate pair; adjacent pair; three ordered singletons | Matching numbers 0,1,2, all ≤ respective cardinalities 2,2,3 | Pass; retain [r2] |
| 4.2 maximum universal bounds/permutation | Three ordered singletons, reorder labels | Maximum 2 unchanged; every matching ≤2, and bound 1 fails on the two-edge matching | Pass; retain [r2] |
| 4.3 finite_dilworth | Empty; three-element total order; three-element antichain | Antichain/partition sizes 0=0,1=1,3=3; respective unions ∅,all three,all three | Pass; retain [r2] |
| 4.3 weak duality for covers | Three-element total order, A={1} | Each chain meets A in 0 or 1 point; one chain covers all and gives 1≤1 | Pass; retain [r2] |
| 4.3 matching-chain correspondence | Three ordered singletons | Two-edge matching yields one path; 3−2=1 chain; deleting an edge yields 3−1=2 chains | Pass; retain [r2] |
| 4.3 weighted_dilworth | 2[0,1]; adjacent pair; three ordered singletons; empty | Matching+width values 0+2=2,1+1=2,2+1=3,0+0=0 | Pass; retain [r2] |
| 4.3 cut_antichain_width | 2[0,1]+[1,1]; adjacent singleton pair | Width=E₀=3 and 1 respectively; duplicate occurrences remain distinct | Pass; retain [r2] |
| 4.4 endpoint edges versus allowed entries | Target [0,0], source [1,1]; separated [0,0],[2,2] | At cut 0 first pair supplies one entry; separated second interval is absent from cut, so no false overlap edge | Pass; retain [r2] |
| 4.4 generic rank equals matching | 2[0,0]+3[1,1] | Matrix [[8,16,32],[27,81,243]] has rank 2; matching 2, width 3, cut cardinality 5 | Pass; retain [r2] |
| 4.4 rank-zero controls | [0,2]; [0,2]+[1,1] | No allowed opposite coefficients; all adjacent ranks 0=matching numbers | Pass; retain [r2] |
| 4.5 GridPath endpoints and unit steps | r=3,a=1 | (2,1),(1,1),(1,2),(1,3); differences (−1,0),(0,1),(0,1), finish (1,3); start (1,1) is rejected | Pass; retain [r2] |
| 4.5 intervalWeight | m=2[1,3], vertices (2,1),(1,2),(1,3) | Weights 0,0,2: invalid, absent, multiplicity two | Pass; retain [r2] |
| 4.5 GridPath.weight | Same path and m | Sum 0+0+0+2=2; empty m gives 0 | Pass; retain [r2] |
| 4.5 InWindow | [1,3], [0,1], [2,4], empty, r=3 | Truth values true,false,false,true; empty also true for r=0 while [1,1] is false | Pass; retain [r2] |
| 4.5 monotonicity/distinct nested vertices | r=3,a=1 path above | Left count 1=a, up count 2=r−a; valid intervals [1,1]⊂[1,2]⊂[1,3]; exactly one invalid initial vertex | Pass; retain [r2] |
| 4.5 weight_bound without window | m=[0,1],r=3,a=1 | Every path weight 0≤E₁=1; no window needed for upper bound | Pass; retain [r2] |
| 4.6 grid_path_chain_max | m=2[1,3],r=3,a=1 | Maximum path weight 2=E₁; 5,337 enumerated paths respect the bound and attain the maximum per valid window/cut | Pass; retain [r2] |
| 4.6 boundary and impossible paths | (r,a)=(2,0),(2,2),(0,0),(2,3) | Boundary witness weights 1=E; zero window 0=E; a=3 needs 3 left steps but only 2 total, so no path | Pass; retain [r2] |
| 4.6 monotone minimum/staircase | r=2,a=1,m=[1,1]+[2,2] | Two monotone choices contribute 1,1; cut size 2 minus maximum boundary weight 1 gives 1 | Pass; retain [r2] |
| 4.7 adjacent formula | Adjacent pair; 2[0,1]+[1,1]; nested [0,2]+[1,1], a=0 | Crossing+E=1+1=2; 0+3=3; 0+2=2 | Pass; retain [r2] |
| 4.7 boundary/empty cuts | [1,1], a=0,1,3; empty | Values 0+1=1,0+1=1,0+0=0; empty likewise 0+0=0 | Pass; retain [r2] |
| 5.1 truncate_maximalPart | [0,0]+2[1,2]+[2,2] | M(Tm)=[1,1]=T(Mm); deleted singletons do not create extra maxima | Pass; retain [r2] |
| 5.1 truncate_remainder | Same m | R(Tm)=[1,1]=T(Rm); one of the two copies survives in each part | Pass; retain [r2] |
| 5.2 chainWeight_peeling | 2[0,1]+[1,1], a=0 | E(m)=3=E(Rm)+1=2+1; E(Mm)=1 | Pass; retain [r2] |
| 5.2 nonempty-cut guard | Empty m; adjacent pair at a=3 | Actual 0,0,0; unguarded equation 0=0+1 would fail, and hypothesis excludes it | Pass; retain [r2] |
| 5.3 ramified maximal additivity | [0,0]+2[1,2]+[2,2] | Hm=[0,0]=H(Mm)+H(Rm)=[0,0]+0 | Pass; retain [r2] |
| 5.3 repeated maximal interval | 2[0,2] | M=R=[0,2]; Hm=0=0+0 | Pass; retain [r2] |
| 5.3 both summands nonzero | 2[0,1]+[1,2]+[2,2] | Hm=[0,1]+[1,1]; H(Mm)=[0,1], H(Rm)=[1,1] | Pass; retain [r2] |
| 5.3 arbitrary-additivity negative control | [0,0]+[1,1] | H(sum)=[0,0] while H[0,0]+H[1,1]=0 | Pass; retain [r2] |
| 5.4 integral adapter and rank | GL₂ cuspidal, [0,1],c=0 | Twists ρ,ρν; total rank 2·2=4 on both sides; singleton rank 2; empty rank 0 | Pass; retain [r2] |
| 5.4 common twist | χ=norm²,q=2 | χ(ϖ) has absolute value 1/4; c=−log(1/4)/log2=2; χ₀=1; denominator log2≠0 | Pass; retain [r2] |
| 5.4 representation comparison | Trivial line, adjacent singleton sum | Dm=[0,1]; L(m)=Z([0,1]) is determinant twist 1/2; reversing Z/L would select Steinberg | Pass; retain [r2] |
| 5.4 equal-characteristic control | F=𝔽₂((t)), trivial line | q=2, norm(t)=1/2; same GL₂ normalized character/Steinberg alternatives as in characteristic zero | Pass; retain [r2] |
| 5.4 geometric recurrence | m=[0,2]; adjacent singleton sum | First has p=1,m′=[1,2], Dm=Dm′+[0,0]; second p=2,m′=0, Dm=[0,1]; length drops 1 and 2 | Pass; retain [r2] |
| 5.4 recurrence multiplicities | 2[0,1] | First deletion leaves [0,1]+[1,1]; final Dm=2[0,0]+2[1,1], dimensions (2,2) preserved | Pass; retain [r2] |
| 5.4 MW order | [2,3], [1,3], [0,2], empty | Decreasing left/right lexicographic order gives [2,3]>[1,3]>[0,2]>empty | Pass; retain [r2] |
| 5.4 singleton extraction | [0,0]+[1,1]; 2[0,0] | Greatest left endpoints 1,0; extracted residuals [0,0],[0,0]; ranks decrease by d, not by full segment length | Pass; retain [r2] |
| 5.4 involution on embeddings | Trivial line, α=ν, residual trivial GL₁ | Product ν×1 is reversed to 1×ν; Steinberg submodule changes to determinant-character submodule under τ | Pass; retain [r2] |
| 5.4 right-singleton candidates/exclusion | q=[0,2]+[1,3]+[2,2], k=3, A=[2,2] | B has one member [0,2], matched to [1,3]≤[2,3]; extension of B to [0,3] excluded | Pass; retain [r2] |
| 5.4 complete matching | q=2[0,0]+2[1,1], k=1 | Two domain labels inject into two targets; only singleton-addition label 2[0,0]+3[1,1] remains | Pass; retain [r2] |
| 5.4 complete-matching negative control | q=2[0,0]+[1,1], k=1 | Domain size 2>target size 1; no saturation; extension label [0,0]+[0,1]+[1,1] is not excluded | Pass; retain [r2] |
| 5.4 dual reinsertion, actual anchor | m=2[0,1]+[1,2]+[2,2] | Dm′=[0,0]+[0,1]+[1,1]+[1,2]; extend A=[1,1]; B=[0,1] matches C=[1,2]=extended A; Dm=[0,0]+[0,1]+2[1,2] | Pass; retain [r2] |
| 5.4 singleton-addition reinsertion | m=[0,1]+[1,1] | Dm′=[0,0]+[1,1]; Dm=[0,0]+2[1,1]; complete match [0,0]→[1,1] excludes the smaller extension candidate | Pass; retain [r2] |
| 5.4 cuspidal-line independence | d=1 versus d=2, m=[0,1] | Same dual label [0,0]+[1,1]; group ranks 2 versus 4, so comparison is of label maps, not representations on different groups | Pass; retain [r2] |
| 5.5 newformExample carrier | Seven displayed intervals | Cardinality 7, lengths 2+5+2+4+1+2+1=17; degree-3 count 4 | Pass; retain [r2] |
| 5.5 maximal part and remainder | Same example | Maximal part [3,7]+[2,5]+[1,2]+[0,0], remainder [5,6]+[3,4]+[3,3]; union with multiplicity recovers all 7 | Pass; retain [r2] |
| 5.5 exactly one shortening | D(maximal part)=[7,7]+[5,6]+[4,5]+[2,4]+[0,3] | T gives [5,5]+[4,4]+[2,3]+[0,2], length 7; a second shortening gives length 3 and fails | Pass; retain [r2] |
| 5.5 newform ramification identity | Seven-interval example | Hm=[4,4]+[2,5]+[1,2]+[0,0]; lengths 1+4+2+1=8, degree-3 count 1; H(Mm) plus H(Rm) gives exactly these four terms | Pass; retain [r2] |

### Headline coverage and padding

The Lean file is unchanged since a3f4dcc, so the full review's analysis still applies. The 13 sorried theorems are the acceptance statements: `Space.internal`, `Pair.nilpotent`, `reconstruction_from_image`, `centralizer_image_extension`, `polynomial_irreducible`, `finite_dilworth`, `weighted_dilworth`, `cut_antichain_width`, `GridPath.weight_bound`, `grid_path_chain_max`, `truncate_maximalPart`, `truncate_remainder` and `chainWeight_peeling`. The other 27 declarations are definitions with real bodies. The full review's one-tactic probes (`simp`, `rfl`, `infer_instance`) closed none of the theorems. The module docstring still names the headlines that are not statable at the pins (oriented-window and standard-pair carriers, generic type and conormal geometry, actual-image pairs, smooth representations) and states nothing in their place. This round's diff adds and removes no Lean name: `readme-ids-missing=0`.

### Ownership and duplication

The changed sentence makes no new ownership claim. It moves no object between this roadmap and the parent. It only states where the three results are planned (parent on main) and where they are implemented (pinned Tau Ceti). This roadmap consumes them from the pin and restates none of them. As in the previous round, no open pull request builds the window adapter, the occurrence-sensitive interval operations, the opposite-degree centralizers or the multisegment duality.

## Not verifiable

- Z81 (Zelevinsky, p-adic analogue of the Kazhdan–Lusztig hypothesis) is settled as uncertified in the manifest and cited by locator only. It is unchanged and was not requested again.
- No changed passage carries a source locator, so no source text was needed this round. The source checks of the earlier rounds (AKY, MW, Z98, DIL at the cited lines) stand for the untouched targets.

## Source issues

- none

No source was reopened this round. The seven errata recorded in the full review (three AKY misprints, one MW misprint, one MW gap and two DIL misprints) remain as recorded there.
