<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15095#issuecomment-6875403435 -->
Review (codex) of 80f3b7c

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The acceptance file omits promised headline forms

   **Location.** `packages/CohomologyOfGroups/README.md:2083`: “Prove the homological form”; `packages/CohomologyOfGroups/Suggested.lean:145` states only the cohomological double-coset formula. Also README:2132–2135 promises homological and Tate stable elements, whereas Suggested.lean:169 states only ordinary cohomological stable elements.

   **Claim.** The acceptance file covers the statable headline theorems. The double-coset and stable-element theorems are explicitly end theorems in README:18–20. Their omitted forms are not listed among the unavailable headlines in the module docstring.

   **Witness.** The homological formula elaborates at the pins with two small definitions, using `groupHomology.map` and `TauCeti.groupHomology.transfer`; the latter is defined in `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:79`. The complete tested signature is below.

   **Exact repair.** Add the homological double-coset identity with its actual maps and arbitrary commutative coefficients. The following independent elaboration demonstrates that no missing carrier prevents it. Move its two definitions into the package namespace with mathematical docstrings, give their README API and Checks, and add the one used Tau Ceti import. Name all three declarations in the README. Keep the theorem admitted, as required for an acceptance signature.

   ```lean
   import Mathlib
   import TauCeti.RepresentationTheory.Homological.GroupHomology.Transfer.Basic
   noncomputable section
   open CategoryTheory
   namespace ReviewWitness
   universe u
   /-- The homological compatible pair used in the double-coset summand. -/
   def conjPush {k G : Type u} [CommRing k] [Group G] (M : Rep k G) (A : Subgroup G)
       {B : Type u} [Group B] (β : B →* G) (g : G)
       (h : ∀ b, g⁻¹ * β b * g ∈ A) (n : ℕ) :
       groupHomology (Rep.res β M) n ⟶ groupHomology (Rep.res A.subtype M) n :=
     groupHomology.map
       { toFun := fun b => ⟨g⁻¹ * β b * g, h b⟩
         map_one' := Subtype.ext (by simp)
         map_mul' := fun a b => Subtype.ext (by simp [mul_assoc]) }
       (Rep.ofHom ⟨M.ρ g⁻¹, fun b => by
         ext v
         change M.ρ g⁻¹ (M.ρ (β b) v) = M.ρ (g⁻¹ * β b * g) (M.ρ g⁻¹ v)
         rw [← mul_apply_eq_comp, ← map_mul, ← mul_apply_eq_comp, ← map_mul]
         congr 2
         group⟩) n
   /-- Transfer to the intersection, then conjugation and inclusion into H. -/
   def homDoubleCosetTerm {k G : Type u} [CommRing k] [Group G]
       (H K : Subgroup G) [H.FiniteIndex] (M : Rep k G) (n : ℕ) (g : G) :
       groupHomology (Rep.res K.subtype M) n ⟶ groupHomology (Rep.res H.subtype M) n :=
     TauCeti.groupHomology.transfer (Rep.res K.subtype M)
         ((H.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf K) n ≫
       conjPush M H (K.subtype.comp ((H.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf K).subtype)
         g (fun b => by
           show g⁻¹ * ((b : ↥K) : G) * g ∈ H
           have hb := b.2
           rw [Subgroup.mem_subgroupOf, Subgroup.mem_comap] at hb
           simpa [MulAut.conj_apply] using hb) n
   /-- README 7.1, at its full stated generality. -/
   theorem homological_double_coset {k G : Type u} [CommRing k] [Group G]
       (H K : Subgroup G) [H.FiniteIndex] (M : Rep k G) (n : ℕ)
       (r : DoubleCoset.Quotient (K : Set G) (H : Set G) → G)
       (hr : ∀ q, DoubleCoset.mk K H (r q) = q) :
       groupHomology.map K.subtype (𝟙 (Rep.res K.subtype M)) n ≫
           TauCeti.groupHomology.transfer M H n =
         ∑ᶠ q, homDoubleCosetTerm H K M n (r q) := sorry
   end ReviewWitness
   ```

   This file elaborated successfully with the sole warning that the theorem uses `sorry`. Its `#check` retains `CommRing k`, `Group G`, `H.FiniteIndex`, arbitrary `K`, `M`, `n`, representatives `r`, and `hr`. In degree zero for `G=S₃`, `H=K=C₂`, and trivial integral coefficients, both sides are multiplication by 3; the two terms are multiplication by 1 and 2. For `H=G`, it is the inclusion-induced map on both sides. The coefficient map in `conjPush` is multiplication by `g⁻¹`, so the right summand agrees with the inverse-conjugation convention of README:2084 and its degree-zero Check.

   Also supply the two missing stable-element forms of §7.2 using explicit stability predicates: homological transfer to each intersection followed by conjugation, and Tate restriction followed by conjugation. State, respectively, bijectivity of inclusion on the homologically stable classes onto the p-primary part for `n≥1`, and bijectivity of Tate restriction onto the Tate-stable classes for every integer degree. The carriers and operations exist: the homological maps above; `TauCeti.TateCohomology.map` for a group isomorphism and compatible coefficient map (`TauCeti/RepresentationTheory/Homological/TateCohomology/Functoriality.lean:249`), and `TauCeti.TateCohomology.res` (`…/Restriction/AllDegrees.lean:48`). Conjugation between the actual conjugate subgroups is a group isomorphism, with coefficient map `ρ(g)`; this is small subgroup/representation data, not a new cohomology construction. These two further signatures were assessed from the pinned definitions, not separately elaborated. Their distinguishing checks are `G=(C₃)²⋊C₂`, inversion action, `M=ℤ`, where the homological stable part and `H₂(G,ℤ)(3)` are both `C₃`, and `G=P=C₂`, `M=ℤ`, Tate degree zero, where both sides are `C₂` (ordinary degree-zero p-primary invariants would instead be zero).

2. **F02** (P3) Two consumed representation constructions lack exact pinned citations

   **Location.** `packages/CohomologyOfGroups/README.md:832`: “or the projection formula for `Ind_H^G`”; README:2090–2091: “the restriction to `H` of `Ind_K^G Res M` decomposes”. Neither exact construction is named in the supplier contracts or these `*Needs:*` lines.

   **Claim.** These routes have identified all their supplied inputs. The same omission pattern as repaired F03 remains for constructions described in words rather than backticks.

   **Witness.** `TauCeti.indProjection`, `TauCeti/RepresentationTheory/Induction/Projection.lean:196`, supplies the first. `Rep.mackeyDecomposition`, `TauCeti/RepresentationTheory/Induction/Mackey/Decomposition.lean:392`, and its natural isomorphism at :425 supply the second for arbitrary subgroups and representations.

   **Exact repair.** Add these contracts, and name the corresponding declarations in the two routes and `*Needs:*` lines:

   - From Tau Ceti: `TauCeti.indProjection` (`RepresentationTheory/Induction/Projection.lean`) gives `Ind_φ(X ⊗ Res_φ Y) ≅ Ind_φ X ⊗ Y` over a commutative ring. In §1.4 use `φ=H.subtype`, `X=k_χ`, `Y=M`, followed by Shapiro. The trivial-character case remains `TauCeti.indResProjection`.
   - From Tau Ceti: `Rep.mackeyDecomposition` and `Rep.mackeyDecompositionNatIso` (`RepresentationTheory/Induction/Mackey/Decomposition.lean`) identify `Res_K Ind_H A` with the sum of its conjugate-intersection induced summands, naturally in `A`. Use them with the subgroup roles interchanged in §7.1's homological route and reindex `H\G/K` by inversion. This contract does not assert a coinduction decomposition for arbitrary infinite index.

   **Tested.** For the projection formula, `H=G=C₂`, `k=ℤ`, and both `X` and `M` the sign representation, each side is the trivial rank-one representation. Its native generator formula uses `ρ(h⁻¹)` (`Projection.lean:202`); for a 3-cycle permuting three basis vectors it sends `e₁` to `e₃`, whereas the mistaken `ρ(h)` sends it to `e₂`. For Mackey, `H=K=C₂≤S₃`, the restricted rank-three permutation representation splits into orbit modules of ranks 1 and 2. For `H=G` there is one summand. These are existing constructions to cite, not new targets to implement.

Two findings: one P2 and one P3. The three round-2 findings are repaired. This review changed none of the four reviewed files. No new source was fetched.

## Verified sound

### Previous findings, checked first

| Previous finding | Status and repaired passage | Verification |
|---|---|---|
| F01, free-group homology already pinned | Repaired. README:1196–1199: “the target adds every coefficient representation, cohomology and the universe `u`.” README:486–489 supplies the exact pinned theorem. | `TauCeti.isZero_groupHomology_freeGroup`, `TauCeti/AlgebraicTopology/ClassifyingSpace/WedgeCircles.lean:259`, is only trivial coefficients with `S,k : Type`. README:2001, :2006 now use it for Hopf, and :2066 no longer makes Hopf wait for §3.6. The arbitrary-coefficient conjunction in Lean:84 is a genuine extension. |
| F02, Alexander–Whitney/shuffle already pinned | Repaired. README:1301–1307 identifies the supplied Alexander–Whitney map composed with the simplicial diagonal. README:1480: “the comparison theorem makes it a homotopy equivalence of resolutions over `G × H`”. | README:440–466 gives the map contracts. Equivariance is proved from naturality of the maps; equivariant inverse homotopies use resolution comparison. The contract’s natural-homotopy statement also has pinned support: `SSet.prodChainComplexHomotopy_hom_naturality` and `SSet.tensorChainComplexHomotopy_hom_naturality`, `TauCeti/AlgebraicTopology/SimplicialSet/EilenbergZilber.lean:277,:705`. The two `(1,1)` shuffles have signs + and −, matching the computed torus cycle below. |
| F03, directed unions and `Rep.ofHom` | Repaired. README:490–497: “for a nonempty directed family of subgroups `S i` of `G` with supremum `⊤`”. README:275 includes `Rep.ofHom`. | Opened `groupHomology.exists_map_subtype_eq` at `TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean:113` and `TauCeti.groupHomology.isZero_groupHomology_of_directed` at :132. The first supplies surjectivity only; README:1653 onward still takes the complete colimit comparison from SchemeKTheoryOperations §6.7. |

The changed contracts, §3.6, §4.4, §5.1, §5.4 and §6.8 were reviewed again. The old omission pattern was searched elsewhere; R02 is the surviving instance. No finding was marked “not actionable” by the repair report. There were no maintainer notes to adjudicate.

### Principles, shape and signatures

Read all 41 numbered target sections, their APIs, Checks, Examples, dependencies, conventions and scope. There are eight mathematical layers; each ends in Examples and Dependencies. Every numbered section has at least three Checks (3–5 in each), and the three real Lean definitions have discriminating examples and API statements. The roadmap keeps arbitrary groups and commutative coefficients where claimed, with explicit finite-group, PID, flatness, projectivity and finite-generation assumptions where needed. No computational algorithm, route-specific prime restriction, second copy of a roadmap on main, sorry'd data, `set_option`, placeholder proposition or imported open-roadmap module was found.

The house-shape comparison used the main versions of ProfiniteCohomology, DerivedModuleAlgebra and ClassFieldTheory. The package has the required opening, ownership, conventions, supplier contracts, reading guide and references. No process narrative, machine path, pull-request number or HTML anchor was found in the roadmap/Lean text. All 12 declared package names occur in the README, and its own backticked declaration claims resolve to those declarations. The eight cited works have eight manifest entries, with no duplicate work key. `metadata.toml` identifies `math.GR`.

The pinned revisions are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, read from `lake-manifest.json` in the content checkout. Running the prescribed `lake env lean` on the unchanged package from that checkout succeeded, exit 0, with exactly nine `declaration uses sorry` warnings and no other warnings/errors. Imports are `Mathlib` and the three actually used Tau Ceti modules. No missing object-file build was required.

A scratch copy with `#check @name` for all 12 declarations was elaborated. The resulting types agree with the README: no section binder was lost. In particular the arbitrary ring/group binders, finite-index assumption, prime instance, positive-degree restrictions, normality of the Hopf kernel, finite-group assumptions, cyclic generator and normalized character are present. The exterior-square, Hopf and finite integral Tate headlines intentionally use `Type`, as stated in the conventions. No change to an existing signature is requested.

### Headline coverage and padding

| README headline | Acceptance-file coverage |
|---|---|
| Hochschild–Serre sequences, filtration, edges and products, §§6.2–6.5 | Named in the docstring as unavailable: positive-degree quotient representations and normalized extension filtration are missing. The degree-zero quotient functors alone do not supply them. |
| Transgression and low-degree sequences, §§6.6–6.7 | Named in the docstring: the constructed cochain transgression and homological `d²` are missing. |
| Tree and amalgam/HNN exact sequences, §§3.5–3.6 | Named in the docstring: the action-on-tree carrier and connecting constructions are missing. Free-group vanishing and the free-product headline are stated. |
| Homological/cohomological Künneth and UCT, §§5.1–5.3 | Named in the docstring: group cross product, general group cup product and evaluation comparison are missing. Pinned simplicial shuffle and abstract module sequences are not those identified maps. |
| Pontryagin/exterior-square consequences, §5.4 | The arbitrary-abelian-group degree-two isomorphism is stated; it is not merely the finite-abelian case owned elsewhere. The specific cycle map is a README construction. |
| Hopf, §6.8 | Existence of the additive isomorphism is stated; the README determines the connecting-map sign. |
| Double cosets, §7.1 | Cohomological form stated; homological form omitted: R01. |
| Stable elements with arbitrary coefficients, §7.2 | Ordinary cohomological form stated; homological and Tate forms omitted without docstring explanations: R01. |
| Tate duality, §8.1 | Stated on the actual internal-Hom representation and Tate cup product. |
| Cohomologically trivial exact-sequence periodicity, §8.3 | Named as unavailable: the iterated connecting class is not yet constructed. |
| Cyclic cup periodicity, §8.4 | Stated in every integer degree, beyond the pinned degree-zero character calculation and abstract two-periodic isomorphism. Swan's p-period calculation remains with K3BlochGroups. |
| Periodicity equivalences, §8.5 | All four clauses stated, including arbitrary coefficient modules and generalized quaternion Sylows. |

Every sorried theorem was tested in a scratch copy with the alternatives `simp` (required to solve), `rfl`, `infer_instance` and `exact?`. None closed. Eight exhausted the search; the double-coset probe reached the default 200000-heartbeat limit. No option was raised. The latter was also compared by reading its maps and pinned near-matches: representation Mackey decomposition and continuous integral Mackey do not directly prove this ordinary arbitrary-coefficient map identity. This timeout is not counted as a completed exhaustive lemma search.

| Theorem, package Lean line | Probe and object comparison |
|---|---|
| `freeGroup_isZero_of_two_le`, 84 | No closure; the pinned free-group theorem only gives trivial-coefficient homology in `Type`. |
| `coprod_groupHomology_bijective`, 92 | No closure; the two actual inclusion maps and arbitrary representation are essential. |
| `nonempty_groupHomology_two_addEquiv_exteriorPower`, 107 | No closure; native exterior powers are a carrier, not a computation of group `H₂`. |
| `nonempty_groupHomology_two_addEquiv_hopf`, 116 | No closure; commutator subgroup and quotient APIs do not supply the Hopf isomorphism. |
| `res_comp_corestriction_eq_finsum`, 145 | Default-limit timeout; read the native ordinary/continuous Mackey inputs as above. |
| `bijOn_res_sylow_isStableClass`, 169 | No closure; pinned Sylow injectivity does not identify the stable image. |
| `tate_duality`, 183 | No closure; cup/evaluation operations do not give perfection by definition. |
| `cup_characterConnectingClass_bijective`, 200 | No closure; abstract periodicity is not its normalization by the character's connecting class. |
| `tfae_periodic_cohomology`, 214 | No closure; native Sylow/quaternion carriers do not supply periodicity equivalence. |

No padding deletion is requested. The supplied library near-match search was read, but candidates were assessed at the pin, not accepted from search descriptions.

### Computed adversarial evidence

Notation: `C_m` is cyclic of order `m`; `F_p` is the prime field; unlabelled integral coefficients are trivial. The table records the seeded targets, all acceptance headlines, the repaired passages and the findings. Unchanged portions were additionally checked against the previous round's rows that actually supplied values; its uncomputed summaries were not treated as evidence. Zero coefficient modules and the zero coefficient ring make every relevant group and map zero; all formulas remain well-defined. No division by a possibly zero group order is used: a finite group has positive cardinality, and a generator of a finite group has positive order. Natural-number predecessor sums are empty in degree zero.

| Statement | Instances tried | Computed sides / discriminating value | Result; change |
|---|---|---|---|
| §1.1 conjugation; `conjRes` | `S₃`, `g=(123)`, `(12)`; inner conjugation | `g(12)g⁻¹=(23)`, opposite convention gives `(13)`; the coefficient intertwining sides both equal `ρ(βb)ρ(g)`. Inner action on its own (co)homology is identity. | Sound; no change. |
| §1.2 quotient action | `G=C₄`, `N=C₂`, integral sign module; `N=1` | `N` acts trivially and `M^N=ℤ`; nonidentity quotient acts by −1, not +1. For `N=1`, degree zero is `M`, higher degrees 0 on both descriptions. | Sound. |
| §1.3 sums/products | `G=C₂`, integral direct sums; infinite-rank free abelian group | `H₁(C₂,ℤ^(I))=C₂^(I)` on both sides. The identity of `ℤ^(ℕ)` is not a finite-coordinate sum of homomorphisms. | The finite-sum qualification in cohomology is necessary. |
| §1.4 permutation/twisted Shapiro | `C₂` acting on `G ⊔ pt`; two sign representations | `H₀=ℤ²`, `H₁=C₂`; summing points gives the wrong `ℤ³`. Sign tensor sign is trivial on both projection-formula sides. | Mathematics sound; R02 citation repair. |
| §1.5 discrete comparison | `ℤ` discrete and `ℤ` with profinite topology, coefficient `ℤ` discrete | Discrete `H¹=Hom(ℤ,ℤ)=ℤ`; continuous homomorphisms for the profinite topology are 0 since an open kernel contains `mℤ`. On `C₃,F₃`, identity character maps to 1, not −1=2. | Discreteness and normalized comparison discriminate. |
| §2.1 hyper(co)homology | `G=1`, `C=M[0]`; two-term `S₃` permutation augmentation with kernel `ℤ_sgn` | Total degree zero is `M`, higher degrees 0 in the first case. In the second, hyperhomology in degrees 0,1,2 is `0,C₂,C₃`, matching the shift of sign-coefficient homology. | Sound. |
| §2.2 long exact sequences | `0→ℤ --2→ ℤ→C₂→0`, `G=C₂` | Connecting map `H¹(C₂,C₂)=C₂ → H²(C₂,ℤ)=C₂` sends 1 to 1; adjacent maps have zero image/kernel as exactness requires. | Sound mathematics; CE56 text unavailable. |
| §2.3 / §3.2 spectral sequences | Same augmentation complex; reflection of a circle by `C₂` | Degree-zero augmentation map is identity; positive-degree map `C₃→C₂` is zero, leaving hyper-`H₂=C₃`. For reflection, `E¹_{0,q}=C₂²` for positive odd `q`, and `E¹_{1,q}=0` for `q>0`. | Stabilizers and degree directions agree. |
| §3.1 tensor versus Hom hypotheses | Exact complex `C₂→ℤ/4→C₂` over `ℤ/4`; flat localization over `ℤ` | Tensoring with `C₂` gives top homology `C₂`, not 0. For the flat telescope with arrows `e_i−2e_(i+1)`, a dual sequence with alternating data 1,0 forces `a₀=−1/3` in `ℤ₂`, not an integer. | Flatness cannot replace projectivity in the Hom comparison. |
| §3.3 free complexes | Free `C₂` circle action with sign coefficients; cyclic resolution | Quotient local differential is −2, giving `H₀=C₂`, `H₁=0`; constant coefficients incorrectly give `ℤ,ℤ`. Cyclic resolution gives `H_(2j+1)=C_m`, `H_(2j+2)=0`. | Sound; local coefficient action retained. |
| §§3.4–3.5 tree exactness and signs | Infinite line for `ℤ`; one loop | Line differential `t−1` has kernel 0 and augmentation cokernel `k`; a loop differential is 0 with kernel `k`. On the sign module, the edge map is −2, yielding `H₁=0,H₀=C₂`. | Tree/loop and boundary direction discriminate. |
| §3.6 tree/amalgam/HNN headlines | `C₄*_(C₂)C₆`; `BS(1,2)` | Abelianization of the amalgam is `C₁₂`; HNN edge difference is `1−2=−1`, leaving `H₁=ℤ`. A sum would leave an extra `C₃`. | Sound. |
| §3.6 free group and free product signatures | Empty/singleton free basis; `C₂*C₂`; sign coefficients on `F₂` | For empty or singleton basis, both groups vanish in degree 2. For `C₂*C₂`, degree 3 is `C₂²` and degree 2 is 0 on both sides. In degree 1, `ker(-2,-2)=ℤ` but the two sign-twisted cyclic `H₁` groups are 0. | `n≥2` is essential; F01 repaired. |
| §§4.1–4.2 cup and connecting signs | `C₂,F₂`; degree-one classes of `ℤ²` | The degree-one class has nonzero square over `F₂`. Ordered torus cup evaluates to 1. Omitting the coefficient action in the cochain formula leaves defect `2(t−1)` in the tested differential. | Sound. |
| §4.3 identities | Coordinate classes `x,y` on `ℤ²` | On `(e₁,e₂)`, `x∪y=1` while `−y∪x=0` as cochains; on the torus cycle their evaluations are both 1. | Graded commutativity is asserted on classes, not literally on cochains. |
| §4.4 diagonal approximation | Homogeneous edge `(g₀,g₁)` | AW gives `(g₀)⊗(g₀,g₁)+(g₀,g₁)⊗(g₁)`; the boundary is `g₁⊗g₁−g₀⊗g₀`, as is diagonal after boundary. Augmentation is 1. | F02 repair sound; zero or same-degree-only diagonal fails. |
| §4.5 projection formula | Index 2, degree zero, trivial coefficients, `x=2,y=3` | `cor(x·res y)=2·6=12`; `(cor x)·y=4·3=12`. Index 1 gives the identical product. | Sound. |
| §4.6 cap/evaluation | Ordered torus and its second coordinate class | Back-face convention gives `y cap [T²]=e₁`; pairing with `x` gives 1, equal to evaluation of `x∪y`. Front-face variant gives −1. | Sound normalization. |
| §4.7 Tate/continuous comparisons | `C₂,F₂`; `C₂,ℤ`; infinite product of `C_p` | Positive Tate cup gives the same nonzero degree-one square. Ordinary `H⁰=ℤ` maps to Tate `C₂` by quotient. Continuous characters on `(C_p)^ℕ` have finite support; arbitrary abstract linear forms need not. | Comparison scope is necessary. |
| §5.1 homological Künneth and repaired shuffle | `C₂×C₂,ℤ`; `C_p×C_p,F_p`; nonflat coefficient control | Integral `H₂=C₂`, `H₃=C₂³` (two tensor terms plus one Tor term). Over `F_p`, degree `n` has dimension `n+1`. Without flatness, `G=H=1,M=N=C₂,n=1` gives middle 0 but Tor term `C₂`. | Sound; flatness retained. |
| §5.1 shuffle sign | Degree `(1,1)` | Shuffle gives `[(g,1)|(1,h)]−[(1,h)|(g,1)]`; evaluation against ordered coordinate cup is `1−0=1`. | Matches the pinned shuffle generator theorem; F02 repaired. |
| §5.2 universal coefficients | `C₂`, coefficients `C₂`; `ℤ`, coefficients `ℤ` | `H₂(C₂,C₂)=Tor₁(C₂,C₂)=C₂`; `H¹(ℤ,ℤ)=Hom(ℤ,ℤ)=ℤ`, while the relevant Ext term is 0. | Terms and degree shifts sound. |
| §5.3 cohomological Künneth | `ℤ²`; infinite-rank free groups | Finite-rank ordered pairing is 1. The infinite diagonal bilinear form has infinite rank, whereas every finite sum of pure tensors has finite rank. | Finite-dimensional hypothesis on the stated comparison is needed. |
| §5.4 exterior square / Pontryagin | `1,C_m,C₂²,ℤ²,ℚ`; degree 3 of `C₂` | `H₂` and `Λ²` are respectively `0,0,C₂,ℤ,0`. But `H₃(C₂,ℤ)=C₂` and `Λ³C₂=0`; the full exterior claim is confined to torsion-free groups. In characteristic 2, the divided-power square is `2γ₂=0`. | Sound; no unjustified all-degree claim with torsion. |
| §5.4 directed union repair | Union of finitely generated subgroups of `ℚ` | Each finitely generated subgroup is cyclic, hence `H₂=0`; colimit and `Λ²ℚ` are both 0. The family includes the zero subgroup and is nonempty. | F03 repair and full-colimit supplier agree. |
| §§6.1–6.2 extension filtration and indexing | `N=G`; `N=1`; bidegree `(p,q)` | For `N=G`, increasing `F_(−1)=0`; for `N=1` no global lower bound works on an unbounded cochain complex. Native index `(2p+q+1,−p−1)` recovers classical `(p,q)`; bound `max(q+3,p+2)` kills both possible remote terms. | Degreewise convergence used, not a false global finite-filtration claim. |
| §§6.2–6.3 Hochschild–Serre | `C₄` extending `C₂` by `C₂`, coefficients `F₂`; split `C₂²` | The initial groups are `F₂` in all bidegrees. Nonsplit abutment has dimension 1 per degree and nonzero transgression; split abutment has dimension `n+1`. | Extension information is not discarded. |
| §6.4 edge maps | Same nonsplit extension | Inflation on `H¹` is identity; restriction `H¹(C₄,F₂)→H¹(C₂,F₂)` is zero. | Directions and quotient invariants correct. |
| §6.5 multiplicative sequence | `ℤ²`, normal subgroup second coordinate | Reordering a quotient-degree-one class past a normal-degree-one class contributes −1; `y∪x` becomes positive ordered tensor and `x∪y` negative. | Sign `(-1)^(p q′)` and total-degree Leibniz sign agree. |
| §6.6 transgression | `C₉→C₃`; `Q₈→C₂` with kernel `C₄` | Lift `floor(i/3)` has differential `(2,1)↦−1=2` in `F₃`. Quaternion factor set is 2 in `C₄`, whose image in `F₂` is 0; transgression there is zero. | Negative factor-set sign and scalarization agree. |
| §6.7 five-term exactness | `C₂→C₄→C₂`, integral and `F₂` coefficients | Integral tail is `0→C₂ --×2→C₄→C₂→0`. With `F₂`, the kernel's `H¹` is nonzero and inflation on `H²` is zero. | The higher inflation conclusion requires its vanishing hypothesis. |
| §6.8 Hopf headline and repaired route | Cyclic presentation; free group; torus; `A₅` | Cyclic `R∩[F,F]=1`, so both sides 0; using all of `R/[F,R]` would give `ℤ`. Torus lifted boundary is `[ba]−[ab]`, class `ba(ab)⁻¹=[a,b]⁻¹`. `H₂(A₅,ℤ)=C₂`. | Sound; pinned free-group `H₂=0` suffices for the route. |
| §7.1 ordinary and homological Mackey | `S₃,H=K=C₂`; `H=G`; `K=1` | Degree zero: `3=1+2`; positive degrees: nontrivial double-coset contribution factors through 0, leaving identity. For `H=G`, both sides are the inclusion map. Homological degree-zero summands use `g⁻¹s`, which range over `H\G`. | Sound mathematics; R01 signature and R02 input repairs. |
| §7.2 stable elements | `S₃,p=3`; normal Sylow `(C₃)²⋊C₂`; degree zero | Cohomological stable parts in degrees 2,4 are `0,C₃`, matching p-primary parts. Homological degree 2 in the semidirect example is `C₃`, since inversion acts on `Λ²` by +1. Ordinary degree-zero p-primary part is 0 but stable invariants are `ℤ`. | Positive-degree restriction essential; R01 omitted forms. |
| §7.2 arbitrary coefficients | `C₂×S₃`, Sylow `C₂×C₂`, permutation `F₂³` | Normalizer invariants have dimension 3; stable classes dimension 2. Conjugation sends the restriction value `e₃` to `e₂` on the central `C₂`. | Excludes an incorrect normalizer-only definition. |
| §8.1 Tate duality | `C₂,ℤ`, dual `ℚ/ℤ`, `i=0,1`; zero/trivial group | `i=0`: both dual groups are 0. `i=1`: both are `C₂`, with nonzero character evaluating to `1/2 mod ℤ`. For the trivial group all Tate groups are 0. Using integral dual on torsion `M=C₂` would give 0 instead of the required `C₂`. | Correct contragredient dual and degree `−1−i`. |
| §8.2 p-groups | `Q₈`, `D₈`, odd Heisenberg group, order-21 semidirect group | `Q₈` has one involution and only cyclic abelian subgroups; `D₈` contains `C₂²`; odd Heisenberg contains `C_p²`. In `C₇⋊C₃`, all 21 elements satisfy `x²¹=1`, yet it is noncyclic with cyclic abelian subgroups. | Actual primality is essential, not a bare exponent condition. |
| §8.3 exact-sequence periodicity | `0→ℤ_sgn→ℤ[C₂]→ℤ→0` | A single boundary shifts degree by 1 and twists by sign; its square shifts by 2 with trivial twist. `C_p²` has cohomology dimensions `n+1`, excluding periodicity. | Sign twist cannot be omitted. |
| §8.4 cyclic all-degree cup | `C_m`, normalized character; `m=1`; `S₃,p=3` | `δχ` acts as the unit shift on `C_m` in the tested even Tate groups; odd integral groups are 0. At `m=1`, character `1 mod ℤ=0` and all groups 0. Normalizer/centralizer ratio for `S₃,p=3` is 2, giving period 4. | Sound normalization; no division by zero. |
| §8.5 periodicity equivalence | `1`, `S₃`, `Q₈`, `A₄`, `SL₂(F₉)` | Trivial group: all four clauses true, zero Tate group has cardinal 1. `S₃,Q₈`: period 4 and cyclic group of order `|G|` in that degree. `A₄` has `V₄`; `SL₂(F₉)` has Sylow `C₃²`, so both fail. | Both directions withstand the separating cases. |

### Sources: seeded sample and wording

The following locators were opened in the supplied legal cached extractions. Printed pages were distinguished from PDF page markers. Integral source formulations were not silently treated as arbitrary-ring theorems: where the roadmap generalizes them, its representation/resolution route supplies that extension. There were no additional unresolved author-flagged locators beyond the settled statuses below.

| Seeded target | Source text actually inspected | Outcome |
|---|---|---|
| 1.2 quotient action | HS53, I §7 Prop. 7, pp.117–118, line 341–362; Loh19 Prop.3.2.13, pp.124–125, line 5322–5357 | Quotient action and inner triviality agree; homological direction verified separately from the cohomological pullback. |
| 1.4 permutation/Shapiro | SerreArbres II §2.8, p.168, line 5130–5184 | Orbit/stabilizer formula is present for integral modules. The arbitrary-ring, character-twisted extension uses the pinned projection and Shapiro inputs; R02 fixes its missing exact citation. |
| 1.5 continuous/discrete | HS53 I §2, pp.112–113, line 129–141 | Homogeneous/inhomogeneous change of variables supports the cochain model; it is not itself a theorem about topological cohomology. Discrete continuity and the pinned resolution definitions justify the new comparison. |
| 2.1 hyper(co)homology | HS53 I §§2,4, p.111 and p.114, line 83–106, 201–216; homological transcription p.118, line 355–362 | Resolution independence and total sign agree; bounded-below reindexing is separately supplied. |
| 2.2 long exact sequences | CE56 Ch.XVII | Uncertified, not read. The algebraic short-exact-complex construction and the computed connecting example were checked. |
| 3.1 equivariant homology | Brown82 Ch.VII | Uncertified, not read. Tensor/Hom hypotheses and both negative controls were recomputed. |
| 3.2 orbit spectral sequence | HS53 I §5, pp.115–116, line 246–288 and p.118, line 355–362; Brown82 Ch.VII unavailable | Readable general spectral-sequence ingredients agree; Brown's precise orbit statement remains unverified. |
| 3.3 free complexes | HS53 I §5, p.116, line 283–288, and p.118, line 355–362; Loh19 Prop.1.6.11/Remark1.6.12, p.48, line 2205–2227 | Acyclic terms and the cyclic free-circle example agree. |
| 4.3 identities | MilneCFT II Prop.1.39(a)–(e), pp.73–74, line 3485–3505 | Associativity, signs, restriction/inflation and projection are the stated identities. General pairings require the coefficient transports used in the README. |
| 4.4 diagonal approximations | HS53 II §1, pp.118–119, line 389–396; Loh19 p.48 as above; Brown82 Ch.V unavailable | Cup formula and cyclic resolution agree. AW itself was also checked at the pin; Brown comparison claims remain uncertified. |
| 4.5 projection formula | MilneCFT II Prop.1.39(d), p.74, line 3492–3501 | Correct order of restriction, cup and corestriction; finite index retained. |
| 5.1 Künneth | Loh19 Thm.3.2.22, p.135, line 5854–5874; Cor.3.2.23, p.136, line 5877–5913 | PID, one flat factor, Tor degree `n−1`, natural exact sequence and nonnatural splitting agree. Corollary alone only has trivial coefficients; the README uses the general algebraic theorem and chain comparison for its extension. |
| 5.4 Pontryagin | Brown82 Ch.V | Uncertified, not read. Exterior-square/torsion controls and directed-union/pinned inputs were checked. |
| 6.8 Hopf | Loh19 Thm.1.5.1, p.30, line 1454–1474; Thm.3.2.18 and proof, pp.129–131, line 5563 onward | Correct numerator and denominator. The exact inverse-commutator normalization is taken from K2SymbolsBrauer §1.1, not attributed to an unspecified source isomorphism. |
| 8.2 p-groups | Loh19 Cor.1.6.18–1.6.19, p.53, and Outlook1.6.20, p.54, line 2390–2462 | Odd-prime cyclicity and the quaternion alternative at 2 are supported; the p-group and primality assumptions are retained. |

Eight further wording comparisons were made at §§1.1, 2.3, 3.4, 3.5, 4.1, 6.5, 7.2 and 8.4: HS53 line 154–160, 246–274, 686–700; SerreArbres line 5130–5198; MilneCFT line 3435–3505, 3793–3822; Hutchinson13 line 482–504. No copied sentence, translated source paragraph, reproduced example list or borrowed figure was found. Formulae and short standard theorem names were not treated as expressive copying.

Counting source-key locator mentions before References gives HS53 42, Loh19 22, Brown82 14, Hutchinson13 12, MilneCFT 9, SerreArbres 4, CE56 3 and SwanPPeriod60 2: 108 mentions. HS53's contents/organization were read from its introduction (line 22–42) and chapter headings: general methods, direct filtration, applications. There is no one-to-one run of package layers matching those chapters. Its material is distributed among Layers 1, 2, 4 and 6, interspersed with independent tree, product and finite-group objectives. Within Layer 6, filtration before pages before products/transgression is forced by the individual `*Needs:*` lines (§§6.1–6.7), not by a declaration that the source's exposition is the plan. Brown's and CE56's arrangements could not be compared against their texts.

Source independence: 20 passages compared with 5 readable sources, no expressive copying found; largest share HS53, 42 of 108 locator mentions; contents compared with HS53: independent. Brown82 and CE56 text/contents unavailable; SwanPPeriod60 waived.

### Library objects and current ownership

The object search included native (co)homology maps and resolutions, induction/projection/Mackey, quotient actions, cups/caps, cyclic and free-group homology, exterior powers, universal coefficients, Künneth, filtered complexes and spectral sequences. The following are representative opened declarations, in addition to the finding witnesses and all three repaired inputs; these are pinned paths, not claims about newer libraries.

| Objects | Pinned declaration and location; limit relevant to this review |
|---|---|
| Standard resolution | `Rep.standardComplex`, `Mathlib/RepresentationTheory/Homological/Resolution.lean:168`; `Rep.standardResolution` :321; `Rep.barResolution` :427. The standard complex is the alternating-face complex of the linearized universal cover. |
| Chains and sign | `groupHomology.inhomogeneousChains.d_single`, `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:132`: first action is `ρ(g₀⁻¹)`. |
| Quotient coefficient representations | `Rep.quotientToInvariantsFunctor`, `Mathlib/RepresentationTheory/Invariants.lean:263`; coinvariant analogue, `…/Coinvariants.lean:442`. These are degree-zero representations, not actions on every higher cohomology object. |
| Shapiro | `groupHomology.indIso`, `Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:65`; `groupCohomology.coindIso`, `…/GroupCohomology/Shapiro.lean:58`. Tau Ceti gives generator/trace comparisons at its `GroupHomology/Shapiro.lean:98,:143` and `GroupCohomology/Shapiro.lean:109,:152`. |
| Degree-one homology | `groupHomology.H1AddEquivOfIsTrivial`, `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean:1019`. It does not calculate `H₂`. |
| Cyclic homology | `Rep.FiniteCyclicGroup.groupHomologyIsoEven`, `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85`, and odd analogue :122. Even formula requires positive degree. |
| AW/shuffle | `CategoryTheory.SimplicialObject.alexanderWhitney`, `TauCeti/AlgebraicTopology/SimplicialObject/AlexanderWhitney.lean:172`; degree formula :206, naturality :222, coassociativity :313. `SSet.shuffle`, `TauCeti/AlgebraicTopology/SimplicialSet/Shuffle.lean:689`; `(1,1)` formula :731, naturality :753. `SSet.eilenbergZilberHomotopyEquiv`, `…/EilenbergZilber.lean:761`. |
| Tensor homology and UCT | `HomologicalComplex.homologyCross`, `TauCeti/Algebra/Homology/Monoidal/Homology/Cross.lean:153`; `homologyKunnethShortComplex_shortExact`, `…/Kunneth/Sequence.lean:729`, splitting :793. `TauCeti.ChainComplex.extToHomology`, `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:121`, injectivity :153, exactness :180; projective cycles and split cycle inclusion are real hypotheses. |
| General chain cup/cap | `TauCeti.ChainComplex.cupCochain`, `TauCeti/Algebra/Homology/Monoidal/Cup.lean:69`, differential identity :86, cup :278; `capChain`, `…/Cap.lean:74`, boundary identity :88, cap :271. A chain diagonal is an input, not constructed by these declarations. |
| Filtered spectral sequence | `CochainComplex.spectralSequence`, `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:409`; first-page cokernel :425; stabilization, `…/Stabilization.lean:83`; global finite-filtration comparison, `…/Convergence.lean:118`. Its global hypotheses were not incorrectly applied to the degreewise finite extension filtration. |
| Bicomplex comparison | `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`, `TauCeti/Algebra/Homology/TotalComplex.lean:596`; row/column sequences, `…/SpectralSequence/Bicomplex.lean:410,:442`. |
| Sylow and inflation | `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`, `TauCeti/RepresentationTheory/Homological/GroupCohomology/Sylow.lean:58`; `mono_HInfRes_f` and `HInfRes_exact`, `…/InflationRestriction.lean:132,:139`. These do not supply the stable-image theorem or all transgressions. |
| Tate carriers/comparisons | `TateCohomology.isoGroupCohomology`, `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean:233`; homology :241, requiring positive natural degree. Degree zero and minus one are separate norm objects. |
| Tate products/periodicity | `TauCeti.TateCohomology.cup`, `TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/Product.lean:131`; character class, `…/Character.lean:65`; cyclic cup calculation, `…/Cup/Cyclic.lean:146`; `Rep.FiniteCyclicGroup.periodicIso`, `…/Periodic.lean:346`. The last is an abstract degree-parity isomorphism. |
| Topological comparison | `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`, `TauCeti/RepresentationTheory/Homological/ContCohomology/DiscreteGroup.lean:166`, has finite-group/integral scope; `TopRep.homogeneousCochains`, `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:113`, is a complex in `TopModuleCat`, with no discreteness axiom built into the carrier. |
| Group-change and factor set | `MonoidHom.groupHomologyIso_hom_naturality`, `TauCeti/RepresentationTheory/Homological/GroupHomology/ChangeOfGroups.lean:217`; cohomological analogue, `…/GroupCohomology/ChangeOfGroups.lean:265`; `TauCeti.FactorSet.cohomologyClass`, `TauCeti/GroupTheory/GroupExtension/Cohomology.lean:120`, section independence :363. |

The contract-name inventory was checked against pinned source declarations, including the four instance declarations which a `def`/`theorem`-only search misses. The `roadmaps resolve` run found no unresolved cross-roadmap citations or package names; its diagnostic says it did not search pinned Lake packages, so that output was not substituted for the local library audit.

Read the board package index before checking absence: the listed board heads are AnalyticNumberTheory and LawrenceVenkateshMethod. Searched the provided main/open-roadmap corpus by objects with `roadmaps grep`, and read suppliers with `roadmaps show`. No package declaration has a fully qualified collision in that corpus. Main has no second CohomologyOfGroups folder. The overlap data reports no conflicting head, dropped cited id, newly defined revision-only id, or dropped package id cited elsewhere; the resolved supplier sections below support that result.

| Roadmap and current text | Resolved citations and ownership |
|---|---|
| DerivedModuleAlgebra, main | §S.1 at `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955`: generic first-quadrant spectral sequences. Cohomological edges/low-degree terms are supplied; the homological low-degree extension is the declared gap. |
| SpectralSequencesAndConvergencePartII, PR #2307 | Layers 2–3 own abstract hyperderived/composite-functor sequences; §§4.2–4.3 own algebraic UCT/Künneth; §5.2 filtered pairings. This package constructs explicit group models and maps. No reverse dependency was found. |
| ProfiniteCohomology, main | `TauCetiRoadmap/ProfiniteCohomology/README.md:1140,:1155` (§§3.1–3.2), :1571 (§5.5), :1770 (§6.4), :2622 (§10.1), :2763 (§10.5), :3519 (Layer 12). Continuous/cochain comparisons and products retain their topological hypotheses. This package adds the arbitrary discrete comparison and explicitly compares its own maps. |
| ClassFieldTheory, main | Layer 0 §0.1, `TauCetiRoadmap/ClassFieldTheory/README.md:778`: Tate operations, cohomological triviality, Tate–Nakayama and Nakayama–Rim, consumed by name. |
| FreeGroupsAndLimitGroups, main | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:385` (§2.2), :773,:803 (§§4.1–4.2), :863,:875,:906,:937 (§§4.5–4.8): graph groups and actions on trees. Native HNN generator is inverse to the supplier's loop edge, matching the package's sign. |
| AlgebraicTopology, main; also open revision PR #1808 scope checked | `TauCetiRoadmap/AlgebraicTopology/README.md:1945` (§5.3), :2005 (§5.4): finite regular constant-coefficient cover comparison and torus homology. Main, not the revision's new claims, is the supplier. No claim here rebuilds deck-equivariant cellular topology. |
| StableHomotopyKTheory, main | §3.29, `TauCetiRoadmap/StableHomotopyKTheory/README.md:1336`: perfect-group universal central extension/Hopf kernel. General-group Hopf is the extension here, not a second universal-extension construction. |
| K2SymbolsBrauer, PR #1302 | §1.1, `TauCetiRoadmap/K2SymbolsBrauer/README.md:107`: calibrated positive lifted boundary and inverse commutator. It explicitly leaves general Hopf existence/bijectivity to a supplier. The package consumes the convention without assuming its own target. |
| SchemeKTheoryOperations, PR #1229 | §6.7, `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2548` and :2582: integral hyperhomology and the full directed-union comparison. Integral instances are imported; the package adds arbitrary-ring explicit models. |
| K3BlochGroups, PR #1430 | §§4.1,5.2: integral bounded-below reindexing, localized stable elements, integral duality, quaternion resolution/period class and Swan's period. These stay there; this package adds arbitrary coefficients and full Tate duality/periodicity criteria. |
| ArithmeticGaloisDuality, PR #858 | §D7.2: finite-group universal coefficients, homological Sylow surjectivity and continuous coefficient Künneth. The package's stable-image identification strengthens, rather than replans, the homological Sylow statement. |
| InductionRestrictionPartII, PR #1154 | `TauCetiRoadmap/InductionRestrictionPartII/README.md:312` (RS.0.1), :415 (RS.0.3), :1558 (RS.6.8). Central five-term, Hall multiplier coinvariants and finite-abelian multiplier/exterior comparison remain there. Arbitrary-group/noncentral or arbitrary-abelian statements here are explicitly differentiated. |
| MappingClassGroupsAndCanonicalRepresentations, PR #2266 | §1.1, `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md:847`: natural cohomological sequence, five-term and section-lift comparison. These instances are imported; explicit general filtration/product development is this package's. |
| IntegralIwasawaTheoryPartII, PR #2267 | §0.7, `TauCetiRoadmap/IntegralIwasawaTheoryPartII/README.md:273`: arbitrary-ring flat base change and vanishing/coinflation comparison, used as the declared Check. |
| ModularCurvesPartII, PR #913 | §15.4, `TauCetiRoadmap/ModularCurvesPartII/README.md:3935`: the specified modular amalgam and its correspondence-equivariant cohomological sequence. The package's general amalgam theorem does not claim that equivariance package. |
| SpectralSequencesAndConvergence, PR #2302; ClassifyingSpaces, main | Read scope/ownership for the closest-roadmap audit: generic sequence machinery and classifying-space comparison respectively; neither object's ownership is transferred here. |

Overlap check: read SpectralSequencesAndConvergencePartII, K3BlochGroups, ArithmeticGaloisDuality, SpectralSequencesAndConvergence, AlgebraicTopology, ProfiniteCohomology, DerivedModuleAlgebra and ClassifyingSpaces; generic sequences belong to the two spectral roadmaps/DerivedModuleAlgebra, finite localized/integral results to K3BlochGroups/ArithmeticGaloisDuality, topological chains and classifying comparisons to AlgebraicTopology/ClassifyingSpaces, continuous theory to ProfiniteCohomology. This package owns the explicitly distinguished discrete representation/cochain extensions. The results/heading closest-roadmap list was empty.

### Supplier order and declared gaps

Every `*Needs:*` line and supplier citation was read. The prescribed dependency command produced:

```text
depcheck: 244 roadmaps, 2206 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No banned supplier is consumed. Local direction is from conjugation/models through products/extensions to finite-group conclusions; the Hopf proof no longer has the unnecessary free-group-tree dependency.

Both `gap:homological-low-degree` and `gap:flat-kunneth` occur with the same slug and named supplier in `design/plan.json` and the README contracts (:513 and :534). The former requests the two homological edges and associated five-term sequence for a first-quadrant double complex, which §S.1 does not yet state. The latter requests naturality of the already stated two-column sequence over a ring of Tor dimension at most one, not a new Künneth sequence or its splitting. Its bounded-above hypotheses and conversion to nonnegative homological degrees agree. Both are precise, single mathematical contracts with earlier owners; neither is an unowned prerequisite or an already supplied redundant gap. This needs-changes verdict is not an acceptance conditional on them.

## Not verifiable

- Brown82 is settled uncertified. Its Ch.II §7, Ch.III §§8–10, Ch.IV §4, Ch.V, Ch.VI §§7,9 and Ch.VII were not available to read. In the seeded sample this affects §§3.1, 3.2, 4.4 and 5.4, and the Brown parts of §5.1 and §8.2. Exact source wording and contents arrangement were not certified.
- CE56 is settled uncertified. Ch.XVII for §2.2 and Ch.XII for duality/periodicity were not read. No new request was created.
- SwanPPeriod60 is settled waived. The primary Theorems 1–2 were not read; the accessible secondary statement in Hutchinson13 §3 was checked and is identified as secondary in the manifest.
- The double-coset `exact?` probe timed out at the default limit. Direct source/object comparison found no one-lemma proof of the package statement; the timeout is not a proof that none exists.
- The two omitted stable-element variants in R01 were assessed from their existing carriers and operations, not separately compiled. The homological double-coset witness was compiled successfully.

## Source issues

- **Misprint** in Loh19 at Corollary 3.2.23 proof, printed p.136 (Loh19 line 5903 and line 5908): the source says the tensor resolution uses the G-complex twice; it should use the G-complex and the H-complex; affects the proof.
- **Misprint** in Hutchinson13 at Corollary 3.3 proof, printed p.12 (Hutchinson13 line 518): the source says the indicated homology degree is congruent to 3 modulo 3; it should be congruent to 3 modulo 4; affects the proof.
- **Gap** in MilneCFT at Chapter II Remark 3.5, printed p.81 (MilneCFT line 3813–3822): the source says the periodic isomorphism is cup with the normalized character class, postponing proof; it should justify that normalization or invoke its cited proof explicitly; affects the proof.

## For the human reviewers

- Brown82 and CE56 are recorded as uncertified; their wording and contents were unavailable. HS53, the source with the largest locator share, was readable and compared.
- Loh19 is unpublished course material hosted on its author's university page; `sources.toml` records author-page access, not a reuse licence. This review found independent wording rather than reproduced text.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "80f3b7cc6b0f4c2ff576149d1358ac6ac1dc6661", "job": "REV-PKG-CohomologyOfGroups~3", "model": "gpt-6-astra", "worker": "chris-6"} -->
