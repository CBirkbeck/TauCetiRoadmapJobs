<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12954#issuecomment-6857048441 -->
Red team round 1 pass a (codex) of baef69d

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) Positive-real-part existence is absent from the acceptance test

   Location: `packages/LieHighestWeightPartII/Suggested.lean:258` and `packages/LieHighestWeightPartII/README.md:560`. The Lean theorem takes “positive real parts `r` of `s` and `r'` of `s'`” as hypotheses.

   Claim: the roadmap constructs and uniquely determines a positive real part for every semisimple point (§5.4), then recognizes it (§5.5). Only the conditional recognition theorem is tested. Existence is statable using the definitions already in this file; it is not a missing-carrier case.

   Witness: `packages/LieHighestWeightPartII/Suggested.lean:252` defines `IsPositiveRealPart`; line 264 quantifies over already-given `r,r'`. On `G_m`, `s=2i`, §5.4 must produce `r=2`, but no declaration asserts that any such point exists.

   Exact repair: add the following headline in Layer 5, with a mathematical docstring referring to §5.4 and CH §10.1, Proposition 10.2, p.32; name it in the README:

   ```lean
   theorem existsUnique_positiveRealPart
       {H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} ℂ}
       (hH : TauCeti.reductiveCommHopfAlgProperty ℂ H)
       {s : WithConv (H →ₐ[ℂ] ℂ)}
       (hs : TauCeti.HopfAlgebra.IsSemisimplePoint s) :
       ∃! r : WithConv (H →ₐ[ℂ] ℂ), IsPositiveRealPart s r := sorry
   ```

   Repair test: for `G_m,s=2i`, the characters `t,t⁻¹` require values `2,1/2`, determining the point `2`; for the trivial group the unique point is `1`. The unipotent counterexample of README line 578 is excluded by `hs`. This proposed signature was checked by reading its existing constituent signatures, not by running Lean.

2. **F02** (P3) Chevalley restriction is already proved at the pin

   Location: `packages/LieHighestWeightPartII/README.md:92`, repeated at lines 15, 381 and 389: “Layer 7: Chevalley restriction”.

   Claim: LieHighestWeight Layer 7 supplies the surjectivity used to establish uniqueness of dominant neutral elements.

   Witness: `TauCeti/Algebra/Lie/HighestWeight/ChevalleyRestriction.lean:136` proves `LieSubalgebra.map_lieInvariants_lieCartanRestriction`; line 151 defines `LieSubalgebra.lieChevalleyRestrictionIso`. Main `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:579` imports this theorem instead of planning it.

   Exact repair: replace the Chevalley-supply clauses with: “Chevalley restriction is `LieSubalgebra.lieChevalleyRestrictionIso` in `TauCeti/Algebra/Lie/HighestWeight/ChevalleyRestriction.lean`; its surjectivity is `LieSubalgebra.map_lieInvariants_lieCartanRestriction`. These hold for finite-dimensional Killing Lie algebras over algebraically closed characteristic-zero fields. Transport along the Killing identifications of the algebra and Cartan with their duals to use them for polynomial functions.” Add these to the Tau Ceti contract and §3.1 Needs. Retain LieHighestWeight Layer 7 for the Serre presentation.

   Repair test: for `sl₂`, restriction sends the quadratic invariant to a nonzero multiple of `h²`, and every even polynomial on the Cartan is reached. The pinned theorem has exactly the closure, characteristic and Killing hypotheses of §3.1. This is new pin evidence, not a re-raising of an item marked not actionable.

3. **F03** (P2) Checks reproduce numerical rows from the source tables

   Location: `packages/LieHighestWeightPartII/README.md:459`–460, beginning “The principal `E₈` row is”.

   Claim: §3.5 includes the source's ordered numerical data, including a long prefix of the principal E₈ row and complete principal G₂ and two F₄ rows.

   Witness: CH line 1737 supplies the same consecutive 17 entries of the E₈ prefix; CH lines 1832, 1827 and 1828 supply the other copied rows. These are numerical-row reuse, regardless of independently correct values.

   Exact repair: state the facts the roadmap needs in its own form, with the locator. Replace these two bullets with:

   - “For a principal characteristic, odd degrees vanish and the largest nonzero degree is twice the height of the highest root. For E₈ this gives degree 58, and the zero-degree contribution is its eight-dimensional Cartan (CH Table 2, pp.36–37).”
   - “The two minimal-root F₄ examples have equal zero-degree multiplicity but different degree-one multiplicities. Compute those multiplicities from the long-root and short-root coefficient distributions, and compare the results with CH Table 3, p.37.”

   Keep the independently stated profile formula and the cumulative-dimension negative control, rather than excerpts of the rows. Repair test: principal E₈ has top degree `2·29=58` and `D₀=8`; the F₄ examples have degree-one multiplicities `14≠8`, so the revised Checks retain their discriminatory content.

4. **F04** (P2) Neutral-element conjugacy is statable but omitted

   Location: `packages/LieHighestWeightPartII/README.md:167`; `packages/LieHighestWeightPartII/Suggested.lean:30`–41.

   Claim: §0.3 proves that conjugacy of neutral elements determines conjugacy of whole zero-inclusive triples over every algebraically closed characteristic-zero field. This substantial theorem is absent; the docstring names only the finite test family and group highest-weight test as unstatable.

   Witness: all carriers occur in `packages/LieHighestWeightPartII/Suggested.lean:196`: `IsSl2TripleOrZero`, `TauCeti.intLieAlgebra`, and its action. The missing statement requires no extra definition. SOM line 361 explicitly records injectivity of the neutral-element orbit map.

   Exact repair: add a Layer 0 headline with the existing field/Lie/finite-dimensional/Killing/rational-structure binders from line 196 and arguments `t : IsSl2TripleOrZero h e f`, `t' : IsSl2TripleOrZero h' e' f'`, concluding

   ```lean
   (∃ φ ∈ TauCeti.intLieAlgebra K L,
     φ • h = h' ∧ φ • e = e' ∧ φ • f = f') ↔
     ∃ φ ∈ TauCeti.intLieAlgebra K L, φ • h = h'
   ```

   Name it `exists_innerAut_iff_neutral_conjugate`, end it with `:= sorry`, and name it in §0.3. Its docstring should cite DG §3, Lemmas 2–3, p.4 and SOM §3.1, p.15.

   Repair test: `(H,E,F)` and `(H,cE,c⁻¹F)` have the same neutral element and conjugator `Ad(diag(√c,1/√c))` for `c≠0`; both sides are true. For the minimal and regular triples in `sl₃`, neutral eigenvalue multisets `{1,0,−1}` and `{2,0,−2}` differ, and both sides are false. For the zero triple, both sides select only the zero triple. No Lean run was performed.

5. **F05** (P1) The open-orbit proof consumes an undeclared general-field interface

   Location: `packages/LieHighestWeightPartII/README.md:171`, “has surjective differential … so in characteristic zero its image is open and dense”, and the supplier contract at line 108 assigning orbit maps to ReductiveGroups Layer 3.

   Claim: the general algebraically closed characteristic-zero proof uses the differential of a stabilizer orbit map to conclude that its orbit is open in the ambient vector space. No precise supplier or target provides this implication; citing DG gives a mathematical source, not a formal-library owner.

   Witness: main `TauCetiRoadmap/ReductiveGroups/README.md:1537`–1681 treats subgroups, quotients and components; its orbit interface is §3A. `TauCeti/AlgebraicGeometry/GroupAction/Orbit/Stabilizer.lean:105` gives smoothness onto the orbit scheme, not openness in the ambient space.

   The latter distinction matters: the trivial group acting on a line has a smooth projection onto its point orbit, although that orbit is not open in the line. NilpotentOrbits N2.2 only supplies the complex specialization, explicitly excluded as the general-field input here. ReductiveGroups §3A.5f's analytic differential comparison is also over ℂ.

   Exact repair: correct the orbit-map ownership to ReductiveGroups §3A.1–§3A.2, consume the native orbit-scheme and stabilizer constructions there, and declare the following precise supplier contract under ReductiveGroups, with a matching top-level `gaps` entry in this roadmap’s design plan:

   “What ReductiveGroups must provide (gap:orbit-open-surjective-differential): Over an algebraically closed field of characteristic zero, for a smooth affine algebraic group of finite type acting linearly on a finite-dimensional vector space V and a point v, surjectivity of the tangent map at the identity of the orbit morphism g ↦ g·v implies that the orbit of v is Zariski open in V.”

   Set `supplier` to `ReductiveGroups`, `section` to `3A`, and `needs` to that single sentence. Add `gap:orbit-open-surjective-differential` to §0.3 Needs. In §0.3 identify the stabilizer tangent space with `ker(ad h)` using the differential of its defining fixed-vector equation, then apply the contract to `G_h` acting on `L₂`. Alternatively an exact pinned declaration proving this ambient openness implication discharges the gap; smoothness onto the orbit alone does not.

   Repair test: for the standard `sl₂` triple, `L₀=KH`, `L₂=KE`, the derivative sends `H↦2E`, and the orbit is `K×E`, open in `KE`. For the zero triple `L₂=0`, the unique orbit is all of the point. For the trivial action on a nonzero line the derivative has rank zero, so the premise fails.

6. **F06** (P3) SOM is recorded under a title absent from the cited text

   Location: `packages/LieHighestWeightPartII/README.md:627` and `packages/LieHighestWeightPartII/sources.toml:43`, “Nilpotent orbits and Weyl group representations”.

   Claim: this is the title of the institutional PDF used as SOM.

   Witness: SOM lines 5–8 identify the text as *Notes on nilpotent orbits*, by Eric Sommers, dated 17 July 2009. Its contents at SOM lines 12–26 and cited §3.1 belong to that text.

   Exact repair: keep the existing manifest key `SOM` and URL. Set its `title` to `Notes on nilpotent orbits`, and write the bibliography entry as “Eric Sommers. Notes on nilpotent orbits. Preliminary workshop notes, 17 July 2009; §3.1, pp.15–16.” Retain the existing hyperlink on the corrected title.

   Repair test: the corrected work still contains the neutral-orbit injection at SOM lines 361–362 and the label bound at SOM line 373, on printed p.15. No mathematical target or locator changes.

## Verified sound

Read all 628 README lines and all 277 Suggested.lean lines, the repository rules, all 14 supplied elaborated signatures, the library-match leads, the overlap leads and the previous repair reports. The mathematical inventory is 23 numbered target sections, including their definitions, API assertions and proof routes, and 107 explicitly labelled Checks. There are no separate bold target statements in this README. All 14 declarations are recorded below: five definitions/structures and nine admitted theorems. No existing theorem was refuted by the instances below. Missing acceptance statements and proof ownership remain findings.

All 107 Checks were evaluated; the numerical content of 106 was independently computed or follows from the displayed elementary calculations. The five orbit counts in Check 432 were compared with the cited classification tables, but the entire correspondence between orbit names, diagrams and profiles was not certified (see Not verifiable). Thirty-seven explicit source-line locator occurrences were opened, representing four sources; repeated locators were retained in that count. The source/locator ledger below distinguishes support from corrections and extensions.

The nine existing theorems are substantive recognition/reconstruction results or the highest-weight test. None is a one-tactic restatement, small-value computation or boundary-case padding. The five definitions have real bodies and are used by the headline statements. Imports are one `import Mathlib` and six existing individual Tau Ceti modules; no sorry'd data, `lemma`, `set_option`, `True` placeholder or hypothesis containing the conclusion occurs. All own Lean names appear in the README. The two unstatable headlines explicitly named in the module docstring are the finite family indexed by classified simple factors and the group highest-weight test; its missing-carrier explanations agree with the inspected pins. R01 and R04 identify additional statable headlines.

The head is `baef69de`; the manifest and checked-out pins agree: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Read-only `git diff --stat origin/main...HEAD` lists nine files, all beneath `packages/LieHighestWeightPartII/`: README, Suggested, sources, and six previous repair reports. No package edit outside the folder was found. No build or fresh Lean elaboration was run: the supplied elaborations were compared with the source signatures, and no dropped binder was found. Every declaration has explicit local binders; there is no ambient `variable` block silently omitting a standing hypothesis.

The requested dependency command returned:

```text
depcheck: 223 roadmaps, 1977 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. This verifies order, not completeness of a cited contract (R05). Main-roadmap aliases were followed when they map former layer numbers; they were not mistaken for supplier drift. The GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 overlap is already identified as an external consumer repair in FIX-PKG~6 and is not re-raised: moving that consumer's generic material is outside this package, as that report states.

The seven cited roadmap identities checked were LieHighestWeight, RootSystems, SpinRepresentations, NilpotentOrbits, ReductiveGroups, ReductiveGroupsPartIII and NoncompactQuantumSymmetry. Citations to existing roadmaps were resolved on main; ReductiveGroupsPartIII and NoncompactQuantumSymmetry were read at their supplied new-roadmap heads. The additional named downstream roadmap GlobalShtukasAndFunctionFieldLanglandsPartII was read at its head for ownership, not treated as a supplier. Scope/ownership of the closest ClassicalGroups and RealSemisimpleLieGroups roadmaps was also compared. The supplied open-head index and `roadmaps grep` searches by triples, neutral elements, invariant forms, half-spin, weight patterns and positive real parts were used alongside searches of main, packages and the pins. No duplicate fully qualified name of one of the 14 declarations was found. This roadmap owns the new filtration/recognition interfaces; the invariant-form normalization is additional to the general invariant-form theorem, and its algebraic inner-image result is distinct from NoncompactQuantumSymmetry's real analytic result.

The following shorthand is used only in this report: `V(n)` is the `(n+1)`-dimensional standard sl₂-module; `H,E,F` are its usual matrix triple; `d` denotes graded dimensions; `W` denotes cumulative dimensions; `m` denotes irreducible multiplicities. Sequences without another range are listed on the explicitly indicated degrees. “Retain” means that the displayed test gives no defect, not that testing finitely many instances proves a theorem.

### Every Suggested.lean declaration: context and computed instances

| Declaration and section | Actual variable/instance context | Instances and computed values on the two sides | Result/change |
|---|---|---|---|
| `IsSl2TripleOrZero`, §0.1, line 56 | Arbitrary `L : Type*`, `LieRing L`, three elements; no field assumption in the definition | Zero: all three equalities are `0=0`. Standard sl₂: `(H,2E,−2F)=(H,2E,−2F)`. `(0,E,0)` in characteristic zero: `0≠2E`; over F₂: `0=2E=0` | Retain broad predicate; characteristic-zero classification is separately scoped |
| `weightFiltration`, §1.2, line 68 | Any field, Lie algebra and Lie module; no triple, finiteness, closure or characteristic assumption in definition | `V(1)`: dimensions `0,1,2` below −1, from −1 to 0, from 1. Zero module: all `0`. In characteristic p, integer casts repeat arbitrarily far left, so every step already contains every integer eigenspace | Retain; boundedness is claimed only under the stronger theorem context |
| `finrank_weightFiltration_eq_iff_exists_intertwiner`, §1.3, line 78 | Algebraically closed characteristic-zero K; two arbitrary Lie algebras; two finite-dimensional modules; two zero-inclusive triples | `V(2)` versus `V(0)⊕V(1)`: W on −2…2 is `(1,1,2,2,3)` versus `(0,1,2,3,3)`, so equality=false and intertwiner=false. Zero triple on degree≤1 polynomials versus trivial K²: both `(0,2)` across degree 0, coefficient map intertwines | Both directions survive; retain |
| `exists_innerAut_of_finrank_weightFiltration_sl`, §2.4, line 95 | K algebraically closed, characteristic zero; finite decidable n; explicit rational Lie algebra instance on `sl n K`; two triples and all-degree equality | n=0,1: only zero triple, conjugator=identity. n=2: zero gives `(0,2,2)` and standard `(1,1,2)` at −1,0,1. sl₃ minimal/regular differ at −2: `0≠1` | Retain |
| `exists_innerAut_of_finrank_weightFiltration_sp`, §2.4, line 109 | Same K; finite decidable l; rational instance on `sp l K`; standard carrier `(l⊕l)→K` | l=0: zero triple. l=1: zero versus standard has W₋₁ `0≠1`. sp₄ partition `(2,2)` gives weights −1 twice,+1 twice and one Sp-class; `(3,1)` is disallowed | Retain |
| `exists_innerAut_of_finrank_weightFiltration_so`, §2.4, line 126 | Same K/n/rational context; additionally zero eigenspace on standard module is not bottom | n=0: `hker` false (`0=⊥`). n=1,2: only zero triple, kernel dimensions 1,2. so₈ `(4,4)`: same standard W but kernel dimension 0; hypotheses exclude the two nonconjugate classes | Retain necessary proviso |
| `exists_innerAut_of_finrank_weightFiltration_typeD`, §2.4, line 149 | Same K plus `Invertible 2`; arbitrary quadratic space, polarization P, finite basis of P.W, `line=⊥`; rational instance; equality on standard and S⁺ | r=0,1: only zero triple. r=2: `(t,0)`/`(0,t)` standard weights ±1 twice agree, S⁺ weights `(1,−1)` versus `(0,0)` disagree. r=4 `(4,4)`: S⁺ tops `4≠3` | Retain; finite basis supplies finite spin space without a missing finite-dimensional V binder |
| `exists_innerAut_of_finrank_weightFiltration_adjoint_exceptional`, §3.4, line 176 | K algebraically closed characteristic zero; L finite-dimensional Killing, rational instance; explicit isomorphism to one of five exceptional Serre algebras; triples and adjoint equality | G₂ zero D₀=14 versus principal D₀=2; candidate counts/profile counts `(7,7),(28,28),(34,34),(274,274),(245,245)` | Retain; direct computations include E₆,E₇ |
| `exists_innerAut_iff_finrank_weightFiltration`, §4.1, line 196 | K:Type u, L:Type v; algebraically closed characteristic zero; finite-dimensional Killing and rational instances; modules quantified in Type(max u v), each finite-dimensional | L=0: identity conjugator and all W equal. sl₂×sl₂ factor-swapped triples: first-factor standard W₋₁ `1≠0`, hence RHS=false and inner-conjugacy=false; whole adjoint alone agrees | Both directions survive; universe contains the required finite modules |
| `forall_weight_halfIntegral_iff_highestWeight`, §5.2, line 215 | Field of characteristic zero; L finite-dimensional Killing; splitting Cartan, root base; irreducible M without finite-dimensionality; actual highest-weight vector; additive ν on full dual and integral `2ν` on simple roots | ν(α)=1/2: V(3) gives highest value 3/4 and weight value 1/4, so both sides false. Highest weight −2 Verma gives `−(k+1)/2`, both true; highest weight −1 gives `−1/4−k/2`, both false | Retain full generality; zero module cannot supply a nonzero highest-weight vector |
| `weightPattern`, §5.3, line 234 | Any real q and complex module V, any endomorphism; no finite-dimensionality/semisimplicity in definition | q=4, diag(2,1/2): n±₁=1; size-2 Jordan block at 2: n₁=1 versus algebraic multiplicity 2. q=1, identity on C: nᵢ=1 for every i, so no finite support. Zero V: every finrank=0 | Retain total definition; theorem assumptions exclude the junk cases |
| `IsGeometricPoint`, §5.3, line 243 | Any real q; finite-type commutative Hopf algebra and convolution point, all finite comodules in universe 0 | On Gₘ, q=4,s=2i, character k has norm `2^k=(√4)^k`; q=3,s=2 fails already on character 1. Trivial point gives norm1=(√q)^0 when q>1 | Retain complex absolute-value definition, not the all-embeddings arithmetic notion |
| `IsPositiveRealPart`, §5.4, source line 252 | Same small Hopf algebra; arbitrary points s,r; every finite comodule, eigenvalue and eigenvector; no semisimplicity inside predicate | Gₘ s=2i forces r(t)=2 and r(t⁻¹)=1/2. Unipotent u gives both r=u and r=1, since each acts as1 on fixed vectors | Retain; uniqueness explicitly needs semisimplicity; R01 adds existence/uniqueness headline |
| `exists_conj_positiveRealPart_of_weightPattern_eq`, §5.5, line 264 | q>1, reductive property (smooth and geometrically connected included); s,s′ semisimple and geometric; all-comodule equality; r,r′ satisfy predicate | Gₘ s=2i,s′=2,q=4: every character has same degree k, r=r′=2,g=1. SL₂ phases i,−i versus identity: all patterns concentrated at0, both positive parts1. Dropping semisimplicity permits s=s′=u,r=u,r′=1, nonconjugate | Retain conditional theorem; R01 supplies missing construction |

The table records source contexts, not hypothetical inferred instances. The supplied elaborated signatures have exactly these assumptions. No fresh `#check` file was elaborated under this read-only/no-build pass.

### Every explicitly labelled README Check

This ledger has one row per Check bullet (107 rows). The line number locates `packages/LieHighestWeightPartII/README.md`. A numerical list below is a computation record, not a reproduction of a source table.

| Line | Instances and computed comparison | Result/change |
|---|---|---|
| 136 | Zero brackets equal0; native nonzero condition reads `0≠0`, false | Correct |
| 137 | Matrix commutators give H,2E,−2F, equal to all three required right sides | Correct |
| 138 | `(0,E,0)` gives0 versus2E; `(H,0,0)` gives0 versusH; `(H,F,E)` gives−H versusH; negating H repairs it | Correct negative controls |
| 139 | F₂: E+E=0 and `[0,E]=0`; `[E,F]=I₂≠0` | Correct characteristic-two distinction |
| 158 | w(c)w(1)⁻¹=diag(c,c⁻¹), conjugation of E=c²E; at c=2 the factor is4 | Correct |
| 159 | Abelian L: ad x=0, exp ad x=id; character ρ(x)=1 is not nilpotent | Correct warning about proof hypotheses |
| 160 | D₄ spin highest coordinate1/2 is outside SO character lattice, yet Lie module dimension8 and inner-twist intertwiner exist | Correct domain distinction |
| 161 | Reflection swaps D₄ classes; S⁺ top degree4 becomes3 | Correct outer counterexample |
| 175 | sl₂ classes have neutral eigenvalues0 and±2 in adjoint; standard weights0² versus±1 | Two classes distinguished |
| 176 | sl₃ minimal has standard spectrum1,0,−1; regular2,0,−2; not equal | Correct |
| 177 | so₈ very-even pair has same standard spectrum but S⁺ top4 versus3 | Not inner-conjugate |
| 178 | H unchanged, E→cE,F→c⁻¹F; `[cE,c⁻¹F]=H` for every c≠0 | h does not determine literal e |
| 205 | Trivial K²: H,E,F all0; multiplicity of V(0)=2 | Correct |
| 206 | Standard weights1,−1; exchange triple changes them to−1,1; coordinate swap intertwines all three operators | Correct |
| 207 | sl₃ minimal: d₂=1,d₁=2,d₀=2; multiplicities m₂=1,m₁=2,m₀=1, total3+4+1=8; zero gives8V(0) | Correct |
| 226 | Trivial K: W₋₁=0,W₀=K, dimensions0,1 | Correct |
| 227 | Zero module: no nonzero eigenvector, all eigenspaces0; bound max{0}=0 | Correct empty-set case |
| 228 | V(1): Wᵢ dimensions0 for i<−1,1 for −1≤i<1,2 for i≥1 | Correct |
| 229 | V(2): W on−2…2=(1,1,2,2,3), d=(1,0,1,0,1); reversed filtration gives(3,2,2,1,1) | Correct orientation |
| 230 | W₋₂=KF; `[E,F]=H∉KF` | Not an L-submodule |
| 231 | u+v₊ lies in ker E; H(u+v₊)=v₊, neither0 nor a scalar multiple of u+v₊ | Correct eigenvector qualification |
| 245 | V(2)⊕2V(0): d₀3,d₂1,m₀2,m₂1,W₀4 | Correct |
| 246 | V(1)⊕V(0): d₀=d₁=1,m₀=m₁=1; wrong cumulative subtraction gives2−3=−1 in integers (0 with natural truncation) | Correct negative control |
| 247 | Polynomial coefficient map sends a+bX to(a,b); both H,E,F actions0 and both W jump2 at0 | Correct different-carrier isomorphism |
| 248 | Dimension3 on both sides, but W₋₂=1/0 and W₁=2/3 | Equal total dimension insufficient |
| 260 | V(1)⊗V(1): d₋₂=1,d₀=2,d₂=1, m₂=m₀=1; W=(1,1,3,3,4) | Correct tensor sign |
| 261 | Dual V(1) W₋₁ annihilates weight−1 line, dimension1; wrong Ann W₁ has dimension0 | Correct −i−1 shift |
| 262 | Unit: i=−1 gives Ann W₀=0; i=0 gives Ann W₋₁=K | Correct self-dual unit |
| 286 | B₁,C₁ each have2 roots+rank1=dimension3, matching sl₂ | Correct low rank |
| 287 | D₂ roots are two orthogonal A₁ pairs,4 roots+rank2=6=3+3 | Correct nonsimple case |
| 288 | B₂=C₂:8+2=10; D₃=A₃:12+3=15 | Correct |
| 289 | r=4: r(2r−1)=28; r(2r+1)=36; roots24,32,32 plus rank4 | Correct |
| 290 | so₂ generator has zero adjoint, Killing matrix[0], rank0 versus dimension1; bracket equations force all triple entries0 | Correct excluded Killing case |
| 307 | β₁ matrix J has Jᵗ=−J and determinant1 | Correct |
| 308 | At E,−H,−2F, trace anti-diagonal=(−2,2,−2)=−2(1,−1,1) | Correct normalization |
| 309 | Identity form on V(1): β(Hw₀,w₀)+β(w₀,Hw₀)=1+1=2≠0 | Correct wrong-form control |
| 310 | V(2) H-invariance allows anti-diagonal entries(a,b,c); F-invariance forces b=−a,c=a | H alone insufficient |
| 322 | sp₄ `(3,1)` has two odd sizes each of multiplicity1, fails; `(2,2)` has no odd size, passes | Correct |
| 323 | so₈ `(4,4)` and `(2⁴)` all-even with even multiplicities →2 classes each; `(3,3,1,1)` →1 | Correct |
| 324 | so₄ standard restriction along each factor=2V(1), partition(2,2); diagonal gives V(2)⊕V(0), partition(3,1) | Correct |
| 325 | so₃ permits partitions(3),(1³); (2,1) has even-size multiplicity1 | Correct |
| 326 | Empty partition: evenness=true, O(0)=SO(0)=1, number of classes1, not2 | Correct nonvacuous boundary correction |
| 340 | (4,4): a=(3,3,1,1), A=4,A−1=3 | Correct |
| 341 | (2⁴): a=(1,1,1,1), A=2,A−1=1 | Correct |
| 342 | Both standard spectra have multiplicities2 at±3,±1; tensor spectra are the same multiset sums | Cannot separate |
| 343 | Odd half-spin for (4,4) has tops3 and4, opposite to even half-spin4 and3 | Correct parity |
| 344 | Full spin for both has all16 sign weights; flipping one coordinate permutes this set, top4 on both | Correct stronger check beyond equal maxima |
| 345 | Pairings of half-sign weight with roots are(±1±1)/2=−1,0,1; doubled weight pairs2 and descends to(0,0,1,…,1) | Correct minuscule control |
| 357 | sl₃ standard jumps: zero3 at0; minimal1 at−1,0,1; regular1 at−2,0,2 | Correct |
| 358 | so₈ (4,4): standard has no zero eigenvalue, kernel dimension0; equal standard data with two classes | Correct proviso |
| 359 | A partition of7 cannot consist only of even parts; some odd block supplies a zero h-weight | Correct |
| 360 | sp₂ zero W₋₁=0,W₀=2; regular W₋₁=1,W₀=1 | Correct |
| 361 | r=4 spin tops4/3; r≤1 onlyzero; r=2 S⁺ sees first-factor ±1 and other-factor0² | Correct all-rank statement |
| 385 | E₆ labels fixed by (1 6)(3 5):3⁴=81 versus unrestricted3⁶=729 | Correct |
| 386 | G₂(2,0): d₄=1,d₆=2, so monotonicity false despite labels within0…2 | Correct |
| 387 | Zero: all simple-root evaluations0; principal: every simple-root evaluation2 | Correct |
| 405 | Zero label puts all roots in degree0; rank+root count gives14,52,78,133,248 | Correct |
| 406 | G₂ principal: positive-half sum6, d₀2; total2+2·6=14, top10 | Correct |
| 407 | F₄ principal: positive-half sum24,d₀4; total52,W₀=24+4=28; omitting Cartan gives48 | Correct |
| 408 | G₂ long label has d₁4,d₂1; short label d₁2,d₂1,d₃2; transposing without reindexing interchanges them | Correct convention control |
| 409 | G₂ negative label has support3 and d₀4; proposed unsigned sum−3 cannot bound a nonempty support | Correct absolute-value bound |
| 410 | G₂ zero triple: zero eigenspace dimension14 while Cartan dimension2 | Correct containment versus equality |
| 428 | Exhaustion produces candidate and distinct-profile counts(7,7),(28,28),(34,34),(274,274),(245,245) | Correct |
| 429 | G₂ seven candidates versus five realized diagrams; extra(1,1),(1,2) | Correct nonclassification claim |
| 430 | E₆ without opposition:212 candidates,123 profiles; e₁ and e₆ have equal profiles and neither is opposition-fixed | Correct hypothesis control |
| 431 | Zero candidate: d₀=dimL, dₘ=0 for m≠0; each inequality reads dimL≥0 or0≥0 | True; evaluates defining constraints |
| 432 | Candidate counts7,28,34,274,245 exceed cited orbit counts5,16,21,45,70 respectively | Counts consistent; full labelled-diagram audit limited below |
| 446 | Zero exceptional triple: Wᵢ=0 below0, Wᵢ=L above0, jumpdimL | Correct |
| 447 | G₂ five profiles distinguish first by d₀14/4/2, then among d₀4 by d₁4/2/0 | Correct |
| 448 | D₄ outer automorphism conjugates adjoint actions as linear maps, hence all eigenspace dimensions equal; S⁺ tops4/3 | Adjoint test alone fails in type D |
| 458 | F₄ principal entries4,0,4 decrease; cumulative W₀=28 | Correct correction of source heading |
| 459 | Root computation yields principal E₈ top58,d₀8 and principal G₂ top10,d₀2, matching the excerpts | True numerical content; R03 reuse |
| 460 | F₄ root counting yields long d₁14, short d₁8, d₀22 on both; zero totals248,52,14 | True numerical content; R03 reuse |
| 461 | Twice highest-root heights gives58,22,10; zero coefficients equal ranks8,4,2 | Correct |
| 462 | G₂ subregular total4+2(4+1)=14; numerical sum checks also pass all91 rows | Correct |
| 484 | sl₂² first-factor standard: graded jumps±1 versus double0 | Detects outer factor swap |
| 485 | D₄ S⁺ dimension8, half-integral highest weight excluded from SO group lattice but admitted as Lie-module test | Correct |
| 486 | L=0: unique triple, Int={id}, W on any M concentrated at0 for both | Both sides true |
| 487 | Both whole-adjoint spectra are2,−2 and four zeros; first-factor standard remains different | Correct insufficient test family |
| 507 | ν(α)=1/2, α=2ω: ν(±ω)=±1/4 outside1/2Z; ν(±α),ν(0)=±1/2,0 inside | Both sides of both examples agree |
| 508 | ν(α)=1/3: λ=0 gives0 in1/2Z, μ=α gives1/3 outside | Correct missing-root-hypothesis control |
| 509 | Q=0: λ+Q={λ}, both predicates evaluate identically at λ | Correct empty-root boundary |
| 523 | V(1)⊕V(0): chosen highest weight0 hasν0=0, but ±ω have±1/4 | Irreducibility necessary in this formulation |
| 524 | V(3),ν(α)=1/3: 2ν(3ω)=1 integer,2ν(ω)=1/3 noninteger | Correct root hypothesis |
| 525 | Verma −2: raising coefficient−k(k+1)≠0, values−(k+1)/2 half-integral; Verma −1: values−1/4−k/2 not half-integral | Both iff directions survive infinite dimension |
| 526 | PGL₂ lattice Zα:ν(kα)=k/2; sl₂-only ω hasν1/4 | Correct actual-lattice distinction |
| 527 | V(3),ν(α)=1/2:ν(3ω)=3/4,ν(ω)=1/4, both fail | Correct |
| 528 | ν(aω)=a/2,λ=−ω/2:νλ=−1/4; descending values−1/4−k, never half-integral; raising−k(k−1/2)≠0 | Correct outside-integral-lattice control |
| 529 | Gₘ character k: unique weightk, highest weightk, so same valueν(k) on each side | Correct reductive/nonsemisimple example |
| 547 | Zero space all nᵢ=0; unit n₀=1,nᵢ=0 for i≠0 | Correct |
| 548 | Standard SL₂ exponents±1; tensor multiplicities at−2,0,2=1,2,1 | Correct |
| 549 | q=4 gives positive trace2+1/2=5/2; q=16 gives4+1/4=17/4; exponent pattern remains±1 | Correct q^(i/2) normalization |
| 550 | diag(i,−i) trace0 versus identity trace2; every representation eigenvalue has norm1, hence same degree-zero pattern | Correct phase counterexample |
| 551 | Jordan block at√q: ker(A−√q) dimension1 versus total dimension2 | Correct geometric eigenspace warning |
| 552 | For q=3, 2^k or5^k equals3^(i/2) only when k=i=0; both patterns see only weight0, while positive standard traces5/2 and26/5 differ | Correct geometric-hypothesis control |
| 574 | Unit-modulus character values map under absolute value to1; all characters of r evaluate1, hence r=1 | Correct |
| 575 | SL₂ z=2i: r=diag(2,1/2); Weyl swap=diag(1/2,2), same trace5/2 and conjugacy class | Correct |
| 576 | z=i gives r=diag(1,1), s≠1 | Correct |
| 577 | PGL₂ α(diag(z,1))=z and α(diag(−z,1))=−z; absolute values equal | Correct |
| 578 | Unipotent u: all eigenvalues1; u and1 both act by1 on every fixed vector, giving two distinct satisfying points | Correct lack of uniqueness without semisimplicity |
| 579 | Coefficient t generates C[t] but not t⁻¹; antipode adds it; s=2i forces r(t)=2 and r(t⁻¹)=1/2 | Correct faithful-coefficient issue |
| 591 | Equal patterns for phases and identity; positive parts both1; original traces0 versus2 | Correct |
| 592 | Weyl swaps√q and1/√q; all representation eigenvalue multisets, hence patterns, agree | Correct |
| 593 | Standard n±₁=1 versus n₀=2, so pattern equality fails and positive parts not conjugate | Correct |
| 594 | s=s′=u gives identical patterns and permits r=u,r′=1, not conjugate; comparing u to1 instead gives n₀1 versus2 | Correct counterexample and rejected fake counterexample |
| 595 | Gₘ q=4: character k sees modulus2^k for s=2i and2; both positive parts2. At s=1/2 the degree is−k, different for k=1 | Correct reductive torus example |
| 596 | Trivial group point set={1}; every finite representation is trivial; g=1 gives1·1·1⁻¹=1 | Correct rank-zero case |

All definitions have at least three substantive Checks: predicate §0.1 has four, restriction §1.1 three, filtration §1.2 six, invariant form §2.1 four, profiles §3.2 six, candidates §3.3 five, and the Layer 5 patterns/point predicates have six each in §§5.3–5.4. The copied rows in §3.5 are separately reported; the boundary Checks above actually evaluate the definitions and were not mistaken for forbidden padding in Suggested.lean.

### Supplier and pin evidence

| Consumed contract | Resolved location and comparison |
|---|---|
| LieHighestWeight former Layers 0,1,2,4,5 | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:74` explicitly maps them to native spectrum, roots, weights, highest-weight classification and complete reducibility. No broken former-id finding. |
| LieHighestWeight Layers 6,7,8,9 | Same file:1530,1744,2220,2695, respectively, together with native supplier contracts. Chevalley restriction is the exception R02. Exceptional carriers are supplied with finite-dimensional and Killing properties; this package also carries those instances explicitly. |
| RootSystems former Layers 4,5,6 | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:1128` maps them to native chambers, classification, integral data and §4.3. Native Cartan matrices use the orientation tested in G₂. |
| SpinRepresentations Layer 5 | `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:777`; complex fundamental/half-spin modules. The general-field exterior realization comes from the pin, not an unjustified extension of this supplier. |
| NilpotentOrbits N0,N2,N4 | `TauCetiRoadmap/NilpotentOrbits/README.md:93`,160,215: Jordan/orbits, complex triple geometry and type-A partitions. The complex N2.2 result does not by itself supply arbitrary algebraically closed characteristic-zero orbit openness. |
| ReductiveGroups Layers 1–4 | `TauCetiRoadmap/ReductiveGroups/README.md:1275`,1499,1537,2112: comodules and faithful representations, tangent/adjoint constructions, subgroup/component constructions, and Jordan/tori. Native orbit geometry is separately at676 and1683 (R05). |
| ReductiveGroups Layers 5P,6,7,9A/B/D,10B | Same file:2370,2448,2821,3768,4976,5303: polynomial unipotent exponential, reductive structure, root groups/Bruhat, group construction/classification and rational highest weights. These provide the named objects used in the plans; §0.3's extra differential criterion remains missing. |
| ReductiveGroupsPartIII §§0.3,0.5 | `TauCetiRoadmap/ReductiveGroupsPartIII/README.md:433`,467 at supplied head: group Chevalley restriction and all-representation trace separation of semisimple classes. Gₘ characters distinguish2 and1/2, while the single faithful diagonal two-dimensional representation does not. |
| NoncompactQuantumSymmetry Layer 3 | `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:1037` at supplied head: real Lie-group adjoint image and inner automorphisms, using semisimple derivations and exponentials. Algebraic group scheme comparison over K remains here. |
| Triple and integer spectrum | `Mathlib/Algebra/Lie/Sl2.lean`; `TauCeti/Algebra/Lie/Sl2/Basic.lean:359`; `TauCeti/Algebra/Lie/Sl2/Spectrum.lean:151`,327,341. Native `IsSl2Triple` excludes h=0. Spectrum's Noetherian/torsion-free conditions are satisfied by the finite-dimensional field modules used here. |
| Spectrum negative control | For A=Q[T], M=A/(T) with trivial action, T acts by0 on a nonzero vector and is an eigenvalue of the zero neutral operator; T is not an integer. The README correctly does not drop torsion-freeness from the native general-domain theorem. |
| Raising maps and label bounds | `TauCeti/Algebra/Lie/Sl2/EigenspaceMap.lean:90`,188,209,258; `TauCeti/Algebra/Lie/Sl2/WeightedDiagram/Basic.lean:124`. Their nonzero-triple conditions are discharged by a separate zero case. |
| Neutral normal form and conjugacy | `TauCeti/Algebra/Lie/CartanExists.lean:45`; `TauCeti/Algebra/Lie/AdjointAction/CartanConjugacy.lean:74`; `TauCeti/Algebra/Lie/Sl2/WeightedDiagram/Dominant.lean:61`; `TauCeti/Algebra/Lie/Sl2/WeightedDiagram/Finite.lean:47`; `TauCeti/Algebra/Lie/Sl2/Weyl/Cartan.lean:78`. These supply Cartan placement, dominance and labels; they do not themselves assert conjugacy of entire triples with conjugate neutral elements. |
| Inner group and action | `TauCeti/Algebra/Lie/AdjointAction/InnerAutomorphismGroup.lean:70`,108; `TauCeti/Algebra/Lie/InnerAutomorphism.lean:99`,109,188. Rational Lie structure is explicit and unique, rather than a free normalization choice. |
| Nilpotent action and Kostant | `TauCeti/RepresentationTheory/Lie/AdNilpotent.lean:95`; `TauCeti/Algebra/Lie/Sl2/JacobsonMorozov.lean:87`,228; `TauCeti/Algebra/Lie/AdjointAction/ExpAdSubgroup.lean:101`. The Killing assumption belongs to nilpotence in every finite module; the fixed-nilpositive conjugacy theorem has the broader context described in the README. |
| Invariant forms | `TauCeti/Algebra/Lie/InvariantForm/Basic.lean`, `TauCeti.LieModule.exists_eq_smul_of_lieInvariant`: proportionality on finite irreducibles. It neither chooses w₀ nor specifies the anti-diagonal values of βₙ; the explicit normalization remains a new construction. |
| Highest-weight cone | `TauCeti/Algebra/Lie/HighestWeight/Module.lean:309`; `TauCeti/Algebra/Lie/Submodule/Atom.lean:54`; `TauCeti/LinearAlgebra/RootSystem/Positive.lean:319`. Cyclic generation and the positive-root-cone theorem do not require finite-dimensional M. `IsHighestWeightVector` requires its vector nonzero. |
| Orthogonal carrier comparison | `Mathlib/Algebra/Lie/Classical.lean:224`,290,373. The typeD/typeB→indefinite→standard chain uses invertible2 and a square root of−1; the algebraically closed characteristic-zero field supplies both. |
| Half-spin carriers and dimensions | `TauCeti/RepresentationTheory/Spin/HalfSpin/Basic.lean:119`,125; `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/Representation.lean`, `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/CartanWeights.lean`, `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/HighestWeight.lean`. Finite basis of W makes exterior powers finite-dimensional; the even-rank highest-vector theorem is applied only in its stated rank range, with r=2 treated directly. |
| Type D finite Killing case | `TauCeti/Algebra/Lie/Orthogonal/TypeD/Killing.lean:265`,308 has n≥4. The roadmap does not use it to claim so₂ Killing. |
| Ordered chamber argument | `TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean:221`,247; `TauCeti/LinearAlgebra/RootSystem/Opposition.lean:149`,198; `Mathlib/LinearAlgebra/RootSystem/BaseChange.lean`. The argument passes to the rational root space; it does not order an arbitrary algebraically closed field. |
| Group-point predicates | `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean`, `TauCeti/Algebra/AlgebraicGroup/Representation/SemisimplePoint/Basic.lean`, `TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction/Basic.lean`: native reductivity includes smoothness and geometric connectedness; semisimple action is tested on finite comodules. Neither is supplied by the bare Hopf-algebra carrier alone. |
| Faithful points | `TauCeti.Comodule.pointsAction_injective_of_isFaithful` and `TauCeti.Comodule.isFaithful_iff_matrixCoefficientSubalgebra_sup_antipode_eq_top`: coefficients together with antipode images generate the coordinate algebra, as the Gₘ calculation requires. |

The strongest global boundary constraints are present: the zero ring is excluded by `Field`; characteristic 2 and 3 do not enter characteristic-zero recognition; nonclosed/rational orbit classification is explicitly outside scope; finite-dimensionality is required where dimensions reconstruct modules; only the highest-weight coset theorem intentionally admits infinite-dimensional modules. DVRs, ramification, inseparable fields, non-quasi-separated spaces, fans, covers and compactness are not carriers or hypotheses of these targets. They do not create extra cases of the statements. The meaningful total-function cases here are the zero module, empty finite index type, natural subtraction, arbitrary q in a definition, and positive-characteristic repetition of integer eigenspaces; these were evaluated above. The nonreduced stabilizer issue in §0.3 is addressed by characteristic-zero Cartier smoothness, but still does not supply the ambient-openness implication of R05.

### Source locators, wording and arrangement

The locator count uses each occurrence of an explicit `CH/DG/SOM/KIR line(s)` anchor, including repeated anchors, rather than counting each endpoint of a line range. Counts: CH24, DG7, SOM3, KIR3, total37. The bibliography and whole cited sections were also read. The following ledger groups repeated anchors without suppressing their different uses.

| Source anchor(s) | Roadmap uses and support comparison |
|---|---|
| CH lines277,279 | Zero-inclusive bracket convention, §0.1. The source explicitly permits zero; the roadmap independently states the characteristic-zero dichotomy. |
| CH lines288,291 | Conventions and §§1.2,1.4. Increasing eigenspace filtration, raising by2 and symmetric monoidal context agree; the explicit dual shift is derived rather than quoted. |
| CH line296 | §4.1 recognition; compare the proof at1701. The roadmap generalizes the complex statement by algebraic proofs and separate supplier contracts. |
| CH line323 | Complex q-geometric convention. CH's arithmetic Weil notion has additional algebraicity/all-embeddings content; the README expressly takes its complex absolute-value form, so does not claim equivalence to that stronger notion. |
| CH lines1701,1703,1707,1708 | §§0.2,1.1,1.3,4.1. All-module recognition and restricted sl₂ reconstruction are supported. Source zero-span omission is corrected in the roadmap. |
| CH lines1709–1727 | §§2.2–2.4. Partition route and one half-spin separation are supported. The roadmap adds empty-partition and coordinate-sign corrections and uses top graded degree, not the source's erroneous top nonzero increasing step. |
| CH line1728 | §§3.3–3.4. Supports separation for realized characteristics. Injectivity on the larger candidate set is explicitly the roadmap's stronger finite claim, independently verified here; E₆,E₇ are computed directly. |
| CH lines1734–1837 | §3.5. Headers are wrong for increasing filtrations; all91 numerical profiles match a computed candidate. Copied numerical excerpts are R03. Labels-to-diagrams not fully certified. |
| CH lines1158,1163 | §§5.1–5.2. Root-coset argument and finite-dimensional highest-weight test; infinite-dimensional extension is supported by the native cyclic highest-weight cone theorem, not attributed as already proved in CH. |
| CH lines1550,1554,1555 | §§5.3–5.5. Pattern definition, positive part and conjugacy conclusion. The complex general reductive theorem is proved by character separation, without inheriting the paper's restricted Satake class as a hypothesis. |
| DG lines139,143,151 | §0.3. Fixed-neutral triple relations and dense-orbit differential argument; source works over C. General-field transfer requires precisely the missing supplier interface R05, alongside native sl₂ facts. |
| DG lines83,86,87 | §§3.1–3.2. Root grading, weighted labels and label bound; roadmap states the Cartan contribution correctly even when roots also have weight0. |
| DG line262 and Appendix A | §§3.3,3.5 classification comparisons. G₂ node-order conversion is necessary and was checked by root profiles; all orbit-name matches were not certified. |
| SOM lines364,373 | §§0.3,3.1. Neutral-orbit injectivity is stated at361–362 immediately before the cited classification discussion; label bounds at373. Metadata title is R06. |
| KIR line2369 | §2.1 basis formula, Theorem5.6/(5.4), p.61. Source uses divided factorial basis; wⱼ=j!vⱼ gives the roadmap's coefficients. The invariant form is independently derived. |
| KIR line2919 | §2.0, Theorem6.33, p.75. Its orthogonal range is n>2. The roadmap correctly singles out so₂. |
| KIR lines4760,4888,4835,4958 | §2.0, Appendix C.1–C.4, pp.124–129. Root sets agree after ordering A,C,B,D to match the roadmap paragraph; the source's proposed matrix right-multiplication comparison is not used. |

For wording, each of the 37 locator occurrences was compared with the local passage. Six additional prose comparisons were made: README §0.2's exponential-twist proof against CH line1703; §1.4's eigenspace proof against CH line288; §2.1's normalization paragraph against KIR line2373; §3.3's candidate proof against CH line1728; §5.4's character construction against CH line1555; and the weight-pattern docstring against CH line1550. No copied nonmathematical sentence or clause-by-clause prose paraphrase was found. Standard names, formulas and fixed lists of hypotheses were not counted as expression copying. Numerical row reuse is separately R03. No evidence was found that the Lean declarations were adapted, name-and-binder intact, from a public formalization outside the pins.

CH, the largest-share source, has no separate printed table of contents in the cached article. Its actual numbered headings were inspected as the contents record: §§1–10 run from the introduction through nilpotent filtrations, arithmetic parameters, local representation theory, generic theorems, half-integral spherical parameters, nonsplit groups, complementary series, discrete parameters and the proof of the main theorem; the filtration-recognition proof is in the Appendix. The correspondence is many-to-many: roadmap Layers0–4 expand CH §2 and the Appendix; roadmap Layer5 joins CH §6.12 and §10.1. It does not reproduce a run of the source's chapter/section scopes. Within the first strand, §1.3→§2.2/§3.3→§2.4/§3.4→§4.1 is forced by reconstruction, separation and assembly. Within the second, §§5.3–5.4→§5.5 is forced by the definition and construction of the object being recognized. The two branches are independent, as the README says. The arrangement comparison found no source-contents defect.

Source independence: 43 passages compared with 4 sources; no nonmathematical prose copying found, numerical reuse reported in R03; largest share CH, 24 of 37 explicit line-locator occurrences; contents compared with CH's actual section headings (no separate contents page): independent.

## Not verifiable

- No fresh Lean elaboration or build was run, as required. The 14 supplied elaborated signatures were read and compared; proposed additional signatures in R01/R04 are mathematically and API-grounded repairs, not claimed to have been compiled.
- The 91 CH numerical rows were all matched against independently generated root profiles. This does not certify the entire named-orbit/weighted-diagram bijection in DG's diagram-heavy appendix. In particular, a matching numeric profile alone does not prove a given orbit label was transcribed correctly. The reported scalar examples were separately verified.
- Published-versus-preprint pagination was not collated for DG, and the published KIR book was not collated with the author-hosted lecture draft. The manifest explicitly identifies those versions; this report's locators refer to the supplied texts. No new source request was necessary.
- Finite root enumeration is a mathematical counterexample search and validation of the finite claims, not a Lean proof or a proof of every arbitrary-field theorem. The general proofs were checked through their stated prerequisites and the recorded instances.
- The existing GlobalShtukasAndFunctionFieldLanglandsPartII consumer alignment is external and settled as not actionable here by FIX-PKG~6. No changes to that checkout or any supplier were made.

## Source issues

- **Gap** in CH at Lemma10.9, printed p.35, CH line1707: the source says the span of an allowed triple is sl₂; it should be zero for the zero triple, handled separately before the nonzero argument; affects the proof.
- **Misprint** in CH at Lemma10.9, printed p.35, CH lines1720–1725: the source says ascending positive coordinates are dominant for differences directed from earlier coordinates to later ones; it should reverse those differences, or reverse the coordinates consistently; affects the proof.
- **Misprint** in CH at Lemma10.9, printed p.35, CH lines1726–1727: the source says an increasing exhaustive filtration has a largest nonzero index; it should use the largest index of a nonzero graded piece; affects the proof.
- **Gap** in CH at Lemma10.9, printed p.35, CH lines1732–1733: the source says adjoint separation for E₈ implies it for its E₆ and E₇ Levi factors; it should justify passage between adjoint restrictions and conjugacy, or check those root systems separately; affects the proof.
- **Misprint** in CH at Tables2–4, printed pp.36–37, CH lines1734–1837: the source says the displayed entries are dimensions of filtration steps; it should identify them as graded multiplicities, with cumulative sums giving the increasing filtration; affects a stated result.
- **Error** in DG at §3, printed p.4, DG line129: the source says every Cartan element gives an integer eigenspace decomposition of the whole Lie algebra; it should require integral adjoint spectrum, which holds for the neutral elements under discussion; affects nothing.
- **Misprint** in SOM at §3.1, printed p.15, SOM line356: the source says conjugacy of maps from sl₂ is composition with the target adjoint automorphism on the right; it should compose the target automorphism on the left; affects a stated result.
- **Error** in SOM at §3.1, printed p.16, SOM lines384–386: the source says the subregular G₂ diagram is (2,0) in its short-root-first dimension convention; it should be (0,2), since (2,0) violates d₄≥d₆; affects nothing.
- **Error** in KIR at Appendix C.2 and C.4, printed pp.125,128, KIR lines4828–4829 and4951–4952: the source says multiplying matrices on the right by the Gram matrix gives a Lie isomorphism; it should use conjugation by a change-of-basis matrix relating the forms; affects nothing.
- **Misprint** in KIR at Appendix C.4, printed p.128, KIR line4951: the source says the even-dimensional model is isomorphic to so(2n+1); it should say so(2n); affects nothing.

The two extra algebraic source witnesses are small. For DG, h=H/4 in sl₂ has nonzero-root eigenvalues ±1/2, so integer eigenspaces miss E,F. For KIR, take the 3×3 exchange Gram matrix B, h=diag(1,−1,0), x=E₁₃−E₃₂. Then `[h,x]=x`, but `[hB,xB]=−E₂₃+E₃₂≠xB=E₁₃−E₃₁`. The roadmap avoids both errors. “Affects” above refers to the source statement/proof; “nothing” means the error does not enter the package's stated result or proof.

## For the human reviewers

- Licence: SOM is an institutional copy of preliminary workshop notes dated 17 July 2009 (SOM lines5–8; `packages/LieHighestWeightPartII/README.md:627`). No reuse licence was identified in that text. Its mathematical statements are paraphrased; publication/licence status is for human assessment.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "baef69de84a1b8f323e359e3be89e7d29b0670f6", "job": "RT-LieHighestWeightPartII~1a", "model": "gpt-6-astra", "worker": "chris-33"} -->
