# Review of QuasicoherentSheavesOnPrestacks (design, round 6)

**Verdict:** needs changes

Reviewed the design README, plan and manifest without changing them. The preceding finding is repaired. This review finds nine further issues: five P1, two P2 and two P3. The design is repairable; its general scope does not need replacing. No maintainer notes were supplied.

## R01 (P1) — The trivial quotient is hypersheafification, not the original prestack

**Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:661`, repeated at line 665; `design/plan.json:1565`. Quote: “`[X/1] ≃ X`”.

**Claim:** This holds for every prestack X, although line 655 defines brackets by fpqc hypersheafification.

**Witness:** Take X to be the empty prestack. Its trivial-action realization is empty, but `[X/1] = L∅ = Spec 0`: evaluated at the zero ring the two sides are respectively a point and the empty space.

This also contradicts the design's correct Checks at lines 294, 432 and 451 distinguishing the empty prestack from `Spec 0`.

**Exact repair:** State `|1^{×•} × X| ≃ X` and `[X/1] ≃ L X`; assert `[X/1] ≃ X` when X is already a hypercomplete fpqc sheaf. Correct the API, Check and plan together. Keep 7.2's `QCoh([X/1]) ≃ QCoh(X)`, which is true by 3.3, and 7.4's scheme case, which is also true. Add the empty-prestack negative control. On it the repaired quotient has value a point at 0, while both quasi-coherent categories are zero.

## R02 (P1) — A group over S is not an absolute group prestack

**Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:655`, with uses at lines 679 and 701; `design/plan.json:1534`. Quote: “a group space over a scheme S acting on an S-scheme X … gives a group prestack”.

**Claim:** Applying h produces the absolute group object defined in that paragraph, whose unit has source the final prestack `Spec ℤ`.

**Witness:** For `S = Spec 𝔽₂` and the trivial S-group `G = S`, `h_G(ℤ) = Hom(𝔽₂, ℤ) = ∅`. An absolute group object has a unit at every test ring; this one has none at ℤ.

The supplier explicitly uses the slice: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2523` defines `GroupSpace S` in `Over h_S`, with tensor products over `h_S`. A general group algebraic space also need not be a scheme to which the present h applies.

**Exact repair:** Define relative group prestacks and their actions in `PreStk_T / S`, with unit S, products over S and relative bar terms `G ×_S … ×_S G ×_S X`. Retain the absolute construction as `S = Spec ℤ`. For general group spaces use their sheaf/stack functor of points from SchemeAndStackFoundations §§1.4, 1.13, 1.18 and 2.5's stack adapter, or restrict that particular adapter to group schemes while retaining the relative general construction. Carry the relative convention explicitly into 7.4 and its plan entry. The translation realization is S and its hypersheafified quotient is L S (equal to S for scheme bases); its quasi-coherent category is `QCoh(S)`, and is `D∞(ℤ)` in the absolute case. Tested on the trivial group over `Spec 𝔽₂`: the relative unit is the identity, the translation quotient is `Spec 𝔽₂`, and its category is `D∞(𝔽₂)`.

## R03 (P1) — A mapping-space functor does not preserve all colimits

**Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:741`; `design/plan.json:1829`. Quote: “global sections `Map(O_X, −)` commute with colimits”.

**Claim:** Compactness of the unit makes the space-valued functor of 2.2 preserve arbitrary colimits.

**Witness:** On `X = Spec 𝔽₂`, `Map(O, 0 ⊕ 0) = ∗`, whereas `Map(O, 0) ⊔ Map(O, 0) = ∗ ⊔ ∗`. The comparison has two components on its source and one on its target.

**Exact repair:** Distinguish mapping spaces from derived global sections. State that `Map(O_X, −)` preserves filtered colimits, and define the spectrum-valued mapping object (or the ℤ-linear derived global-sections object in `D∞(ℤ)`) if claiming preservation of all colimits. Name that object's source and target and give the exactness-plus-coproducts argument using EnhancedDerivedSheaves E3.3. Use this derived version in 8.3's pushforward argument. Correct the plan's API. On the witness, derived global sections gives `0 ⊕ 0 = 0` on both sides; its underlying space does not preserve that coproduct. EnhancedDerivedSheaves E5:presentability.1 explicitly restricts `compactMappingComparison` to filtered diagrams (`TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1601`).

## R04 (P1) — The dualizable objects of BGL_n are not just representations in degree zero

**Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:785`. Quote: “the finite-dimensional representations, which are the dualizable objects”.

**Claim:** In the unbounded quasi-coherent category, the dualizable objects are precisely the finite-dimensional representations used in the heart-level argument.

**Witness:** Over ℚ, `O[1]` on `BGL₁` is invertible, with inverse `O[−1]`. Its atlas pullback has `π₁ = ℚ`, `π₀ = 0`, so it is not a representation concentrated in degree zero.

This is also the design's own 6.3 Check. The adjacent description of `Map(V[i], M)` must be a statement about its π₀: for `V = ℚ`, `i = 0`, `M = ℚ[1]`, the mapping space is `K(ℚ,1)`, while `Hom(V, π₀M) = 0`.

**Exact repair:** Say that finite-dimensional representations are compact dualizable generators, and that the compact/dualizable objects are their stable idempotent-complete closure (equivalently bounded complexes of finite-dimensional representations here). Write `π₀ Map(V[i], M) ≅ Hom(V, π_i M)` and use all i for detection. This includes `O[1]`, and the corrected π₀ formula gives zero on both sides of the displayed witness without deleting its nonzero π₁. The same imprecise description occurs in BZFN's proof; see Source issues.

## R05 (P2) — The t-structure route omits the accessibility input for the connective part

**Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:600` and its route at line 602; `design/plan.json:1340`. Quote: “if `QCoh(X)` is presentable … then `QCoh(X)^cn` is presentable”.

**Claim:** Presentability of the ambient category alone gives presentability of its pointwise connective subcategory, at the fixed universe of Conventions.

**Witness:** SAG line 18017 requires condition (3) of Proposition 6.2.3.4, the small-colimit-of-affines condition at SAG line 17912. HA line 6014 requires the subcategory itself to be presentable; it does not deduce this from the ambient category.

The route invokes precisely that HA result without proving its additional input. GR-I lines 7581–7589 work in its DGCat setting and do not establish the roadmap's fixed-u accessibility assertion for an arbitrary large prestack. This is an unsupported strengthening, not a counterexample to the usual t-structure theorem.

**Exact repair:** State (a) under the explicit small-colimit-closure hypothesis of 3.4(b) (including 2.3's small colimits of affines), and prove the same presentable-limit closure for the connective module categories. This is the hypothesis of the cited SAG result, not a restriction below it. If retaining the stronger arbitrary-X implication, add the missing accessibility theorem and its proof at the stated universes. Update the plan's hypotheses. Positive tests survive: `Spec A` gives `Mod_A^cn`; a small disjoint union gives the product of its connective module categories; a geometric stack has its small affine Čech presentation. Part (b)'s atlas and completeness statements are supported independently by SAG 9.1.3.1–9.1.3.2.

## R06 (P2) — Earlier open roadmaps still own constructions this design calls downstream imports

**Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:7`, lines 820–822, and the ownership of 2.2–2.3, 3.2–3.3, 4.2 and 7.3. Quote: “The local versions … are special cases”.

**Claim:** The other roadmaps are consumers of constructions owned here. Their actual heads instead construct these objects themselves, and some are already general in their stated context.

**Witness:** PR #1065, `TauCetiRoadmap/PrismaticCohomologyPartII/README.md:721`, defines the point-limit `QCohPrestack` for every space-valued prestack on rings; lines 733 and 742 also own flat descent and flat-affine pushforward.

Additional independently opened witnesses: PR #1202, `TauCetiRoadmap/LanglandsParameterStacks/README.md:379`, owns descent for arbitrary faithfully flat animated rings, explicitly without finite-presentation or descendability bounds. PR #1428, `TauCetiRoadmap/HabiroCohomologyFoundations/README.md:218` and `:808`, constructs the prestack right Kan extension and the lattice quotient equivalence there. The current design's downstream declarations do not change those heads. These are earlier roadmaps in the permitted order, not hypothetical owners.

**Exact repair:** Import the existing classical prestack construction/API from PrismaticCohomologyPartII §4.0, animated faithfully flat descent from LanglandsParameterStacks §1.7, and the specified lattice application from HabiroCohomologyFoundations §§1.27–1.28. State the new `CAlg(D(ℤ)≥0)` theory and the all-discrete-group extension with explicit compatibility with those imports, rather than claiming to own their constructions afresh. Update supplier contracts, prerequisites, Scope and downstream wording together. Alternatively a coordinated ownership move must actually remove the duplicate owners and establish the new order before acceptance; a unilateral statement that they consume this design is insufficient. On `Spec ℤ`, `𝔽₂ → 𝔽₂[ε]/ε²`, and the trivial ℤ-action on `Spec ℚ[x±1]`, the imported results give respectively `D∞(ℤ)`, effective descent, and the same degree-one class `ℚ[x±1]`; the extension should identify these, not create second APIs.

## R07 (P3) — The supplier Check has no such name at its cited head

**Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:109`. Quote: “its Check `test_BG_representations`”.

**Claim:** SchemeAndStackFoundations §1.22 contains that named Check.

**Witness:** On main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3112` has the unnamed comodule Check. `test_BG_representations` occurs in neither its README nor its Suggested.lean.

**Exact repair:** Cite “§1.22, the affine-group comodule Check” without the nonexistent backticked identifier. The underlying assertion is present, so no gap or new theorem is needed. Its `G_m` instance still gives graded modules, and the finite constant-group instance gives representations.

## R08 (P3) — The GR-I page for the QCoh definition is wrong

**Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:301`, and `design/plan.json` target 2.2's locator. Quote: “§1.1, p. 143”.

**Claim:** This page locates the right Kan extension and the point-limit definition.

**Witness:** GR-I line 7354 introduces §1.1.3 on printed page 144; line 7365 introduces §1.1.4 and its limit formula on page 145. Page 143 only starts §1.1's affine input.

**Exact repair:** Use “Chapter I.3, §§1.1.3–1.1.4, pp. 144–145” for this definition, in README and plan. The manifest's chapter-level §1.1 entry already includes it and need not be rewritten. Those pages give the desired functor and limit; the separate SAG locator is correct.

## R09 (P1) — The general finite-group nonvanishing input has no supplied owner

**Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:799`, with *Needs* at line 807. Quote: “`Hⁱ(Γ; k)`, nonzero for infinitely many i”.

**Claim:** For every finite Γ with `char k` dividing its order, this nonvanishing is an available input to the proof. The listed prerequisites supply QCoh, dualizability, perfect stacks and the definition of group cohomology, not this theorem.

**Witness:** `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183` defines cohomology only. Its finite-cyclic calculation requires a cyclic generator (`FiniteCyclic.lean:47`); it is not a theorem for arbitrary finite Γ. For `S₃, k = 𝔽₃`, even `H¹(Γ;k) = 0`.

HR-perf line 29 supports the final noncompactness statement in its lisse-étale category; it does not supply this group-cohomology input or the excluded unbounded comparison. HNR Theorem 1.1 is about poorly stabilized stacks, not this finite-group calculation. No named supplier or auxiliary target in the design fills the step.

**Exact repair:** Keep the full finite-group conclusion. One concrete route avoiding the missing trivial-coefficient theorem is to choose a subgroup `C_p ≤ Γ`, set `V = Coind_{C_p}^Γ k`, and use the pinned `groupCohomology.coindIso` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58`) and `Rep.FiniteCyclicGroup.groupCohomologyIsoEven`/`groupCohomologyIsoOdd` (`FiniteCyclic.lean:80`, `:114`). Add the needed cyclic-cohomology/derived-mapping comparison explicitly to the target's API and dependencies, and cite `exists_prime_orderOf_dvd_card` (`Mathlib/GroupTheory/Perm/Cycle/Type.lean:491`) for the subgroup input. Then `Hⁱ(Γ,V) = k` for every i, and apply the sum/product argument to `V[i]`. For `S₃, k = 𝔽₃`, V has dimension 2, `Hⁱ(Γ,V) = 𝔽₃`, and the comparison is `⊕_i 𝔽₃ → ∏_i 𝔽₃`, not surjective. Alternatively name and source the general trivial-coefficient nonvanishing theorem as an owned prerequisite. The cyclic Checks already in the design remain correct.

## Verified sound

### Previous finding and the changed passages

| Previous finding | Status | Repaired passage and independent verification |
| --- | --- | --- |
| Round-5 F01, pointwise detection and the atlas Check | Repaired | README 322 now says “a map is an equivalence, and an object is zero, exactly when every evaluation is”; the qualification “vanishing of a map is not detected pointwise in general” is explicit. At 329 the class has every evaluation in `π₋₁A = 0`. On `B(C₂) × Spec 𝔽₂`, `H¹(C₂;𝔽₂) = Hom(C₂,𝔽₂) = 𝔽₂`, while every affine evaluation is zero. The atlas forgetful functor is nevertheless conservative. |

I also checked all changes identified in the repair report: 2.2's fourth Check, 2.3's proof route and new 1.5 dependency, Layer 2's Examples, and the matching plan statements/tests. The factorization of a point through the atlas is up to homotopy, and its evaluation is correctly forgetful followed by `A ⊗_k −`, not just forgetful. With `A = k[t]`, this sends V to `k[t] ⊗_k V`. On `Spec A`, the initial-point evaluation is an equivalence and detects zero maps. There is no finding marked “not actionable” to re-raise.

The same repaired pattern was checked in 1.5, 6.1, 6.3 and 8.3: they use detection of equivalences, dualizability or zero **objects**, not detection of zero maps. The separate space/derived-object confusion in R03–R04 remains.

### Adversarial computations

Values below were recomputed by hand. For untouched statements the earlier review's rows were used only where they actually contained values; its blanket “sound” labels were not treated as proofs. In particular 1.2, 1.4, 1.5, 4.1, 5.1 and 5.4 were read and computed afresh. The table covers all 33 targets, the sampled targets, headline theorems and the findings. It does not claim that examples prove their general theorems.

| Statement | Instances tried | Values on the two sides / wrong-model value | Result or change |
| --- | --- | --- | --- |
| 1.1 ring contexts and comparisons | `𝔽₂ ⊗_ℤ 𝔽₂`; zero ring; free generator | Derived π₀ and π₁ both `𝔽₂`, ordinary tensor has π₁ zero; `π_*0 = 0`; symmetric-square homotopy orbit has `H₁(C₂;ℤ)=ℤ/2`, discrete polynomial ring has π₁ zero | Comparisons and negative controls hold. Finite products are preserved, although this does not follow merely from preserving colimits. |
| 1.2 module functor, projection and base change | `ℤ → ℤ[t]`, `M=ℤ[1]`; derived and ordinary self-squares of `ℤ→𝔽₂` | Projection formula gives `ℤ[t][1]` on both sides. Derived base change gives π₀=π₁=`𝔽₂` on both sides; ordinary square gives π₁ zero on the target | Flatness/derived-square distinction is necessary and correct. |
| 1.3 t-structure, flatness, Lazard | A=0, ℤ, `𝔽₂⊗ᴸ_ℤ𝔽₂`; `ℤ→ℚ`; `ℤ→ℤ[1/p]×ℤ_p` | Hearts respectively zero, abelian groups, `𝔽₂`-vector spaces; `ℚ⊗ℤ/p=0`; the last map has a prime above every prime and kills no homotopy module. A flat base change has `π_n=π₀B⊗π_nM` | Sound; connective hypotheses retained. |
| 1.4 perfect, almost perfect, locally free | `k` over `k[ε]/ε²`; `ℤ/p`; `k` over `k[x₁,x₂,…]` | First has `Tor_i(k,k)=k` for all i, so almost perfect but not perfect. Dual of `ℤ/p` is `ℤ/p[−1]`, not connective. Last quotient ideal needs infinitely many generators, so π₀ is not finitely presented | Three notions separated correctly. |
| 1.5 adjointable limits and duality | empty diagram; pairs `(ℤ,ℤ[1])`, `(ℤ,ℤ²)`; nonflat square | Empty limit has one object and identity adjoint. First pair's evaluations have rank 1; second pair's evaluation has ranks 4→1. Nonflat square's π₁ is `𝔽₂→0` | Dualizability/invertibility distinction correct; adjointability is an actual condition. |
| 2.1 points and variance | `Spec A`, `Spec 0`, empty prestack, constant `BΓ` | Initial point `(A,id)`; zero-ring values `∗` versus `∅`; `π₁BΓ=Γ`; arrows of the affine-over-X category reverse ring arrows, giving `Pts(X)^op` | Sound. |
| 2.2 point-limit definition and maps | `Spec ℤ`, ∅, `B(C₂)×Spec 𝔽₂` | Categories `D∞(ℤ)`, zero, `Fun(BC₂,Mod_𝔽₂)`; unit self-Ext¹ respectively 0, 0, `𝔽₂`; every evaluation of the last class has `π₋₁A=0` | Repaired Check correct; GR page needs R08. |
| 2.3 formal properties | empty colimit; `Spec ℤ`; atlas of `BC₂` | `QCoh(∅)=0`; derived tensor `ℤ/p⊗ℤ/p` has π₀=π₁=`ℤ/p`; the atlas detects equivalences but sends the nonzero Ext¹ class to zero | Repair correct; no remaining zero-map detection assertion. |
| 2.4 change of test rings | representable; constant `BC₂`; restriction of derived self-intersection | `u_!Spec A=Spec u(A)`; both constant-group categories are `Fun(BC₂,Mod_𝔽₂)`; restriction of `Spec(𝔽_p⊗ᴸ𝔽_p)` is `Spec 𝔽_p`, losing unit π₁=`𝔽_p` | Left Kan extension, not restriction, preserves QCoh. |
| 2.5 schemes and stack groupoids | `Spec k[ε]`; `BC₂(ℝ)`; `BC₂(ℝ×ℝ)` | Identity and killing ε agree on field points but differ on k[ε]; two real torsor classes; automorphism groups C₂ and C₂² respectively | Full points and groupoids are necessary. |
| 3.1 topology | empty family; localizations at 2 and 3; `ℤ→ℚ`; `ℤ→𝔽₂` | Empty product 0 is faithfully flat exactly over 0; `(2,3)=ℤ` gives a cover; ℚ kills `ℤ/2`; reduction has `Tor₁(𝔽₂,𝔽₂)=𝔽₂` | All controls hold. |
| 3.2 flat hyperdescent | identity; dual-number inclusion/reduction; cover at 2 and 3 | Identity gives constant totalization; `k→k[ε]/ε²` free rank 2, reverse map has nonzero Tor₁; cover fibre `I=ℤ[1/6][−1]`, `I²→ℤ` null in Ext², `I→ℤ` non-null | General theorem supported; cyclic/finite examples do not replace it. |
| 3.3 sheafification and Čech descent | `∅→Spec 0`; constant BΓ versus torsor stack | Both QCoh categories zero in first case; both `Fun(BΓ,Mod_k)` in second, although raw prestack values differ | Sound; distinction supplies R01's witness. |
| 3.4 gluing and presentability | `ℙ¹`; empty scheme; countable disjoint union; doubled plane | Cokernel of `(a,b)↦a−t⁻²b` is `k·t⁻¹`; empty scheme has affine-open index `{∅}` and category `Mod_0`; disjoint union gives `∏D∞(ℤ)`. Doubled-plane Jouanolou point has raw fibre `{U,U′}`, locally contractible on D(x),D(y) | Previous hypersheafification repair remains correct. |
| 4.1 affine morphisms | identity; punctured plane inclusion; `Spec k→BG` | Identity fibre affine; `𝔸²\0` nonaffine with ring of functions k[x,y]; atlas fibre G affine; BG has automorphism `id_G≠1` at the universal G-point | Affine/nonaffine examples discriminate; relative group notation needs R02. |
| 4.2 affine pushforward and base change | polynomial map; nonflat classical self-square | Pushforward unit `R[t]`, base change `R′[t]`; nonflat comparison has source π₁=`𝔽_p`, target π₁=0 | Correct flat classical versus arbitrary derived scope. |
| 5.1 natural affine comparison | `ℤ→𝔽₂`, `M=ℤ/2`; unit | Both derived pullbacks have cohomology `𝔽₂` in degrees 0 and −1; unit becomes `O[0]` | Sound, retains derived pullback. |
| 5.2 Zariski derived descent | truncation tower; DVR extension by zero; infinite union of projective lines | Each H^q tower eventually constant; transition at boundary surjects onto 0. `j_!O` has generic stalk K and closed stalk 0, impossible for an affine quasi-coherent module. Infinite union gives product of Dqc categories | Route's quasi-coherence and uniform bounded truncations are necessary. |
| 5.3 scheme comparison | `Spec R`, `ℙ¹`, `⨿ℕ Spec ℤ` | Affine equivalence Φ_R; H¹ of O(−2)=k on both sides; product `∏D∞(ℤ)` on both sides | No qcqs hypothesis silently added. |
| 5.4 schematic pushforward | `ℙ¹_ℤ→Spec ℤ`, O(−2); base change to ℚ; closed point | Pushforward `ℤ[−1]`, then `ℚ[−1]` on both sides; closed-point self-square has Tor₁=`𝔽_p` | Tor-independence correctly retained. |
| 6.1 pointwise predicates | flat infinite free module; nonflat pullback of `𝔽_p` | `⊕ℤ` flat but not compact/perfect; 0-truncated input gains π₁=`𝔽_p` under pullback | Stable-under-base-change requirement correct. |
| 6.2 t-structure | derived affine; `BG_m`; `BC₂` in characteristic 2 | Hearts `Mod_𝔽_p`, graded abelian groups, `𝔽₂[C₂]`-modules. Nonflat evaluation sends π₁=0 to π₁=`𝔽_p` | Atlas clauses sound; ambient-presentability implication lacks R05's input. |
| 6.3 perfect/dualizable/invertible | `ℤ⊕ℤ[3]`, `O[1]`, `O²`, `ℤ/p`, modular BG | Duals `ℤ⊕ℤ[−3]`, `O[−1]`; rank-4→rank-1 evaluation for O²; dual `ℤ/p[−1]` not connective; modular BG unit perfect but noncompact | Sound, and contradicts R04's later wording. |
| 6.4 almost perfect | dual numbers; infinite polynomial ring; Noetherian ℤ | k has infinite Tor but finite presentation at every resolution stage over dual numbers; infinite-variable quotient not finitely presented; `ℤ/p` has two-term finite free resolution | Correct distinctions; source supports geometric almost-compact criterion. |
| 7.1 trivial quotient and relative groups | empty X; trivial group over `Spec 𝔽₂` | `[∅/1](0)=∗≠∅(0)`; `h_{Spec 𝔽₂}(ℤ)=∅` so no absolute unit | R01 and R02. |
| 7.1 effectivity, independent of those defects | constant C₂ acting on a point | Realization BC₂; pullback `∗×_{BC₂}∗=C₂`, with 2 components, not a point | Groupoid effectivity formula correct. |
| 7.2 equivariant QCoh | trivial action; translation; modular C₂ | `QCoh(LX)=QCoh(X)`; absolute translation gives `D∞(ℤ)`, relative over k gives `D∞(k)`; H¹(C₂;𝔽₂)=𝔽₂ | The theorem holds with corrected relative conventions. |
| 7.3 discrete-group quotient | Γ=1, ℤ, ℤ^d at q=1 | Values `D∞(C)`, `Fun(Bℤ,D∞(C))`, H¹=`C^d`; d=0 gives H¹=0; coarse affine quotient has H¹=0 even at d=1 | Sound mathematical extension; existing lattice ownership is R06. |
| 7.4 classical quotients | `G_m`, C_p over `𝔽_p`, trivial group | Graded heart; cyclic cochain differentials are `g−1=0` and norm=p=0, hence Ext^i=`𝔽_p` for every i; trivial quotient of a scheme is that scheme | Heart and bounded-below comparison supported; relative bar products need R02. |
| 8.1 qcqs compact generation | affine, `ℙ¹`, infinite disjoint union | Generators O and O⊕O(−1); on infinite union `Hom(O,⊕O_i)=∏ℤ` versus `⊕Hom(O,O_i)=⊕ℤ` | qcqs condition matters. |
| 8.2 perfect stacks | affine, graded objects, infinite union; zero coproduct | `Mod_A=Ind Perf(A)`; finite perfect weight support gives both compactness and duality; unit on infinite union has infinite support. Mapping spaces send `0⊕0` to one point versus two points | Main characterization sound; R03 corrects the global-sections clause. |
| 8.3 permanence | dual-number diagonal; doubled line; identity | `Tor₁^{A⊗A}(A,A)=Ω¹_{A/ℤ}↠Ω¹_{A/k}`; quotient is k·dε if char≠2, A·dε if char=2. On doubled line sections `(1,y)` and `(x,1)` of L₁,L₋₁ have affine nonvanishing loci the two charts; no single ample bundle | Flatness and ample-family distinctions correct; for derived products use derived global sections as in R03. |
| 8.4 characteristic-zero quotients | `BGL₁`, `BC_p` over ℚ, `BG_a` over ℚ, modular BC_p | O[1] has inverse O[−1] but is not in the heart. Maschke gives H^i(C_p;ℚ)=0 for i>0; GL₂/G_a is the declared Chevalley case; modular unit noncompact | Final theorem supported, proof wording R04; gap remains legitimate. |
| 8.5 noncompact modular unit | C₂/𝔽₂, C₃/𝔽₃, trivial Γ; S₃/𝔽₃ | Cyclic H^i=k for all i, so `π₀ Map(O,⊕O[i])=∏k`, while sum of π₀ maps is `⊕k`. Trivial group gives H^i=0 for i>0. For S₃, H¹ with trivial coefficients=0, whereas coinduction from C₃ gives H^i=k for every i | Cyclic proof sound; R09 supplies a general route without asserting every group behaves cyclically. |

### Seeded source verification

All eight manifest works are readable. No target locator is flagged unverified in the plan. I read the fifteen seeded targets at the locators below, including hypotheses and surrounding proof steps where the route borrows them. The Stacks service preserved the existing manifest entry while fetching its additional chapters. No missing-reference request remains.

| Sample | Locator checked | Text evidence and assessment |
| --- | --- | --- |
| 1.3 | HA 7.1.1.13 p.1202; 7.2.2.10–15 pp.1240–1241; 1.4.4.11 p.160; 7.2.1.19 p.1236 | HA lines 46134–46144, 47511–47540, 6013–6018, 47387–47390. Complete t-structure and flat tensor formula have the stated connective/flat hypotheses. The roadmap explicitly adapts the spectral proof to modules in D(ℤ). |
| 2.2 | SAG 6.2.2.1 pp.490–491, 6.2.2.5/7 pp.491–492, 6.2.6 pp.496–497; GR-I §1.1 | SAG lines 17835–17884, 18050–18071 support the point-limit, affine values and symmetric monoidal lift. GR-I lines 7354–7377 support the definition at pp.144–145: R08. |
| 2.3 | SAG 6.2.3.4 pp.492–493, §6.2.6 pp.496–497; GR-I §§1.1,3.2 pp.143–145,159 | SAG lines 17905–17924 and 18050–18067; GR-I lines 7365–7377, 8015–8030. Stable, colimit-preserving transitions and tensor are supported. Presentability retains a small presentation hypothesis here. |
| 2.4 | SAG 6.2.2.2 p.491; GR-I §1.2 pp.145–146 | SAG lines 17845–17852; GR-I lines 7379–7401. These support the Kan-extension comparison mechanism, not arbitrary restriction; the roadmap's representable/colimit proof supplies the three specified contexts. |
| 3.1 | SAG D.6.1.1, D.6.1.4 pp.2173–2174; 1.3.1.7 p.117 | SAG lines 79377–79408, 4184–4204. Finite faithfully flat products and latching maps match. Hypercompletion's universal property is an extension through the explicitly supplied localization results. |
| 3.4 | GR-I 1.4.4 p.149; SAG 6.2.3.4(3) p.493; HTT 6.5.3.11–13 PDF p.698 | GR-I line 7572; SAG line 17912; HTT lines 31671–31697. The affine-open limit and presentability are supported; realization of a hypercover is inverted by hypercompletion. |
| 4.2 | SAG 6.3.4.1/3 pp.505–507; GR-I 2.2.2 p.153 | SAG lines 18368–18465; GR-I lines 7740–7744. Source statements are in derived/spectral settings; the roadmap correctly imposes flatness for its ordinary fibre products. |
| 5.2 | Stacks 36.3.2 (0A0J), 36.3.3 (08D3) | Stacks lines 86–107 in Derived Categories of Schemes, PDF pp.2–3. Surjective cohomology transitions and quasi-coherent truncation completeness support the tower step; hypercover descent itself comes from EnhancedDerivedSheaves E2.6. |
| 6.2 | SAG 6.2.5.8/9 pp.495–496; 9.1.3.1/2 pp.733–734; GR-I §1.5.1 p.149, 1.5.4 p.150 | SAG lines 18017–18033, 26667–26710; GR-I lines 7581–7606. Atlas detection and completeness supported. The general presentability inference drops SAG's small-presentation input: R05. |
| 7.2 | SAG 6.2.3.1 p.492; GR-I 1.3.8/11 p.147 | SAG lines 17889–17903; GR-I lines 7463–7477. QCoh invariance survives changing the prestack by (hyper)sheafification; it does not identify the prestacks themselves. |
| 8.1 | Stacks 36.15.3 (09IS), 36.17.1 (09M1); SAG 9.6.1.1 p.807 | Stacks lines 1806–1811, 1969–1985, PDF pp.40,43; SAG lines 29408–29410. qcqs single perfect generator and compact=perfect supported. |
| 8.2 | BZFN 3.2 p.17 and 3.9 p.20 | BZFN lines 834–838, 970–982. Affine diagonal and Ind characterization supported. Neither says the space-valued Map preserves arbitrary colimits: R03. |
| 8.3 | BZFN 3.20–24 pp.23–25; Stacks 29.12.1–3 (0FXR–T), 36.16.1 (0BQR) | BZFN lines 1149–1240; Stacks lines 999–1028 in Morphisms of Schemes (p.22), and 1897–1914 in Derived Categories of Schemes (pp.41–42). Read the generation proof: one chooses one affine nonvanishing locus for a nonzero stalk and clears powers of its section. The preceding complex-of-quasi-coherent-modules reduction uses 36.7.5 (08DB), Stacks lines 760–765, which assumes qc with affine diagonal, not separatedness. Thus the stated ample-family adaptation uses exactly the available hypotheses. |
| 8.4 | BZFN 3.22 p.24 | BZFN lines 1200–1208. Characteristic zero and linearized quasi-projectivity agree. Chevalley occurs at 1205. The proof's description of compact/dualizable objects needs shifts and finite complexes: R04. |
| 8.5 | HR-perf Introduction p.1; HNR 1.1 pp.1–2 | HR-perf lines 19–29 distinguish compact generation from compactness of the unit. HNR lines 43–56 require poor stabilization and prove failure of compact generation, a different phenomenon. The design's cyclic proof is independent and correct; the arbitrary-finite-group proof input is R09. |

Additional source checks: SAG D.6.3.1/3/4 at lines 79502–79529 support general flat hyperdescent without descendability; SAG 6.2.6.2/3 at lines 18072–18090 support the duality headline. Stacks 06WG and 06WT were opened at lines 721–724 and 953–955 of Sheaves on Algebraic Stacks, supporting the relative ringed-site and presentation interpretations in 7.4. GR-I works in characteristic zero; its routes are not treated as citations proving integral statements without the roadmap's stated adaptations.

### Pins, declarations, suppliers and ownership

The downstream algebraic-space citation was also resolved: AlgebraicModuliForArithmeticGeometry #853, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:9540`, defines `spaceDQCoh` in §7.7 with its scheme/étale comparison. Its ordinary algebraic-space category is distinct from the proposed prestack enhancement.

The actual checked-out pins agree with `lake-manifest.json` and `plan.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

I opened the following native declarations, rather than relying on the resolver's names:

| Pinned file | Declaration and lines read |
| --- | --- |
| `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41` | `SSet.Quasicategory`: inner horn fillers, no presentable/stable structure |
| `Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean:40` | `SSet.KanComplex`: fibrancy abbreviation |
| `Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean:37`; `Mathlib/AlgebraicTopology/Quasicategory/Nerve.lean:32` | `CategoryTheory.nerve` and its quasicategory instance; no nerve-of-groupoid Kan instance found by searching the pins |
| `Mathlib/Algebra/Category/Ring/Basic.lean:519`; `Mathlib/Algebra/Category/ModuleCat/Basic.lean:59` | `CommRingCat` has a commutative-ring field and no Nontrivial condition; `ModuleCat` has an additive group and module structure, no finiteness condition |
| `Mathlib/AlgebraicGeometry/Scheme.lean:466`, `:494` | `AlgebraicGeometry.Spec`, `AlgebraicGeometry.Scheme.Spec`; the functor reverses ring maps |
| `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:61`, `:76` | fpqc precoverage and topology; quasi-compact jointly-surjective flat families |
| `Mathlib/RingTheory/Flat/Basic.lean:114`; `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:64` | `Module.Flat`, `Module.FaithfullyFlat`; the latter adds the maximal-ideal condition |
| `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`; `Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean:33` | `DerivedCategory`, `DerivedCategory.TStructure.t`; cochain degrees |
| `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49`; `Mathlib/CategoryTheory/Sites/Descent/DescentData.lean:59`; `Mathlib/CategoryTheory/Bicategory/Grothendieck.lean:235` | pseudofunctor stack condition, descent objects and `CoGrothendieck` |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183` | `groupCohomology`, cohomology of inhomogeneous cochains, not a nonvanishing theorem |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:47`, `:80`, `:114`; `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58` | cyclic generator assumptions, even/odd calculations, `groupCohomology.coindIso` for R09's repair |

Object searches also found the ordinary quasi-coherent affine equivalence at `Mathlib/AlgebraicGeometry/Modules/Tilde.lean:886`, and ordinary finite locally free/sheaf duality infrastructure under `TauCeti/Algebra/Category/ModuleCat/Sheaf/`. Those are different objects from the proposed stable ∞-category of modules on all affine points; the design imports them through its scheme/enhancement suppliers. No existing native prestack-QCoh ∞-category was found. There is no Suggested.lean in this design to introduce a fully qualified declaration collision.

Supplier resolution at this round's main/head, including all *Needs* lines:

- EnhancedDerivedSheaves on main: E0.3–E0.8 (full subcategories at line 199, presentability at 390); E1.3–E1.4 (enhancement and homotopy category at 555, presentability at 567, pull/push at 611); E1.8 and E1.8.DMA.1 (842–890); E2:towers.1 (1296); E2.6–E2.7 (2307–2379); E2.8 (2427); E3.1–E3.4 (1123–1259); E5:abstract.1–5 (1460–1572); E5:presentability.1–4 (1599 onward, including `presentable_limit_right` at 1648 and module base change at 1674); E5:descent (1795–1809); E5:spectra-comparison (1846); E5:animation.1/.3/.4 (1937–2012); E5 compatibility (2930). These supply the cited objects. In particular the bounded-totalization statement at 1980 uses an upper **homotopy** bound, matching the n-truncated step of 3.2; it does not give one finite stage for all degrees.
- SchemeAndStackFoundations on main: §§1.1 (2148), 1.13 (2523), 1.18 (2851–2886), 1.21 (3068), 1.22 (3094–3114), 2.18 (4106–4179). The seven original resolver leads resolve to these or the enhancement/module suppliers. The extra named Check in R07 does not exist, although its mathematical content does.
- DerivedModuleAlgebra on main: §0.2's `DerivedDeRham.derivedTensor` and §1.E.0's perfect, pseudo-coherent and Tor-amplitude predicates; its scope distinguishes finite projective perfection from the older unrestricted-projective thick closure. The design uses the former.
- ReductiveGroups on main: Layer 1 begins at 1275, Layer 3 at 1537 and Layer 6 at 2448. Faithful representations and characteristic-zero complete reducibility are supplied, partly through its native contracts. The declared Chevalley contract adds the precise quasi-projective/equivariant-immersion assertion, not a second definition of the homogeneous quotient.
- HigherToposTheory is the new roadmap at PR #1901's head. Sections L2.1/L2.2 (2516/2573), L3.5 (3307), L4.2 (3665; exponential statement at 3716), L6.3 (5053; free cocompletion at 5084), L6.8 (5655; groupoid object at 5681), L7.6 (6250; localization at 6354), L9.4 (7443; derived universal property at 7653), L9.6 (7989), L10.1 (8274), L10.3 (8449), L11.3 (9448) contain the requested results. This is not an existing-roadmap revision used as a supplier.

The ownership search used `roadmaps grep` by objects (QCoh, right Kan extension, flat descent, group cohomology), `roadmaps show` for the named open heads, main's roadmap files, the board package index and both pinned source trees. Broad grep output was truncated by the tool, so narrower searches and direct reads were used for the relevant neighboring heads. The supplied board index lists three unrelated packages; it was read before making any absence assertion.

The overlaps report contains no conflicting change to this roadmap, dropped citation id, or id available only in a revision. The closest heads were read for ownership: EnhancedDerivedSheaves revisions #1330/#1630 do not replace the main supplier; AnalyticStacks #1687 §§1.1–1.2 owns the analytic/six-functor extension and its descendable topology, distinct from arbitrary fpqc descent here; HigherToposTheory #1901 supplies general category theory. PrismaticCohomologyPartII #1065 and the two further named consumers produce the positive overlap witnesses in R06. No claim that the generalization alone resolves those ownership conflicts is made.

### Dependency gate and declared gap

Exact dependency-check output:

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2057 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The plan has 33 targets and 117 tests, at least three per target, and a script found no forward `target:` prerequisite. The newly added `target:1.5` dependency of 2.3 is earlier. The citation resolver reports no missing cross-roadmap citation; it explicitly did **not** inspect pinned Lake packages on this host, so its clean Lean-name output was not used as pin evidence.

`gap:chevalley-quasiprojective-quotient` is declared at README 139 and in `plan.json`'s top-level gaps, with the same slug, supplier ReductiveGroups, Layer 3, and use in 8.4. Its hypotheses specify a field and a finite-type closed subgroup of GL_n, and its quotient plus equivariant immersion is one precise mathematical contract. It is not the source of a finding. Acceptance after repairs may be conditional on it.

### Shape, principles and headline acceptance test

I compared the shape with the main READMEs of EnhancedDerivedSheaves, SchemeAndStackFoundations and DerivedModuleAlgebra. The design has the requested summary, Scope, Conventions, supplier contracts, eight mathematical layers, Examples/Dependencies endings, downstream section and references. Definitions have API prose and at least three Checks; every target has a locator and a *Needs* line. The layer order is explained by the module/limit → prestack → descent → morphism/scheme → finiteness/quotient → compact-generation dependencies, rather than an asserted source chapter order. No source chapter title is used as the organizing layer. No algorithm, copied source block, route-specific characteristic restriction, process instruction, machine path, `set_option` or sorry'd data was found in the design. R06 is the substantive ownership exception to the principles audit.

The summary's headline results are: coherent module-category theory and connective flatness/perfection (1.2–1.4); flat hyperdescent and sheafification/Čech invariance (3.2–3.3); Zariski gluing/presentability (3.4); affine pushforward, projection formula and base change (4.2); scheme comparison and schematic pushforward (5.3–5.4); t-structure and perfect/dualizable/almost-perfect identifications (6.2–6.4); realization/discrete-group/classical quotient comparisons (7.2–7.4); qcqs compact generation, perfect-stack characterization/permanence, characteristic-zero quotients and modular noncompactness (8.1–8.5).

This is a **design** review. No `Suggested.lean` is present. Consequently there are zero sorried declarations to probe, no theorem signatures to compare, and no package module docstring to audit. The future package must state any genuinely statable headline and document the missing ∞-categorical carriers for the rest. The cyclic group-cohomology identities have substantial existing native API (opened above); they must not be used as padding substitutes for the noncompactness headline. The design's backticked own mathematical notation is not being treated as a claim of already-present Lean declarations. The stale supplier Check name is separately R07.

## Not verifiable

- Lean elaboration, `#check @name` and executable one-tactic probes: **not available (this lane does not elaborate; say so in the report)**. There is also no design-stage `Suggested.lean`. No Lean command was run and no passing build is claimed.
- The Chevalley extension is a declared future supplier contract, not an already proved pinned interface; its exact content and declaration were checked, not its future implementation.
- The stronger fixed-universe presentability implication of 6.2(a) is not established by the opened sources or route (R05). The general finite-group nonvanishing input has no identified supplied theorem in the design (R09); the report verifies the cyclic computation and the alternative coinduced-coefficient route instead.
- No unread/paywalled source remains for the seeded sample. The extra Stacks chapters omitted from the previous round's cache were fetched legally through the service and read. Ownership claims are limited to the supplied main, indexed board packages and available open heads; no inaccessible additional pull requests were sought.

## Source issues

- **Misprint** in HA at Theorem 7.2.2.15, printed pages 1240–1241: the source says the module and some tensor products use A although the ring is R; it should be R throughout; affects nothing.
- **Misprint** in HA at Proposition 7.2.1.19, printed page 1236: the source says the modules and Tor use A while the ring is named R; it should use R consistently; affects nothing.
- **Misprint** in GR-I at Chapter I.3 §1.1.3, printed page 144: the source says pullback along Y′ → Y runs from QCoh(Y′) to QCoh(Y); it should run from QCoh(Y) to QCoh(Y′); affects nothing.
- **Misprint** in SAG at Corollary 6.3.4.3, printed page 507: the source assigns F to the source category and G to the target category in the projection formula; it should assign F to the target and G to the source; affects nothing.
- **Gap** in SAG at proof of Proposition 6.3.4.1, printed page 506: the source cites an unresolved corollary number for the geometric base-change input; it should identify the applicable relative base-change result; affects the proof.
- **Misprint** in BZFN at proof of Lemma 3.20, arXiv page 24: the source calls U perfect when deducing dualizability of the object on X_U; it should invoke perfectness of X_U; affects nothing.
- **Misprint** in BZFN at proof of Lemma 3.20, arXiv page 24: the source tensors the module on V over O(U); it should tensor over O(V); affects nothing.
- **Error** in BZFN at proof of Corollary 3.22, arXiv page 24: the source identifies compact and dualizable objects with finite-dimensional representations; it should include their shifts, finite complexes and retracts; affects the proof.
