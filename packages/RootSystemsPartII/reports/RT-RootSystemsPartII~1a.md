<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1714#issuecomment-6422112744 -->
Red team round 1 pass a (codex) of fb5342d

Verdict: needs_changes

1. **F01** (P3) The full-period Check omits its root lift and period

   **Location:** packages/RootSystemsPartII/README.md:311: “taking a full period sum would incorrectly change the latter to 1.”

   **Claim:** For A₂ reversal and δ = 2(α₁ + α₂), an unspecified full-period sum is assigned coefficient 1. The starting root and period needed to make this computation reproducible are omitted.

   **Witness:** For period two, starting at α₁ gives f and coefficient 2; starting at the fixed highest root f gives 2f and coefficient 1. The result depends on the unchosen lift.

   **Exact repair text:** “For A₂ reversal, δ = 2(α₁ + α₂) has original simple coefficients (2,2) and folded coefficient 2. The four-term sum of the orbit starting at α₁ is 2(α₁ + α₂); using that vector as a simple root would give coefficient 1.”

   **Retest:** Starting at α₁, at period 2 the distinct and full sums coincide and both coefficients are 2. The repaired period-four negative control has distinct sum f, full sum 2f, and coefficients 2 and 1 respectively, agreeing with §2.1's m/d formula.

2. **F02** (P3) Realization uniqueness replans a pinned theorem

   **Location:** packages/RootSystemsPartII/README.md:151: “This is the choice-independence part of the realization API, derived from the finite spanning root-set condition and the native reflection axioms.” Also line 145.

   **Claim:** Develop coroot/reflection uniqueness by finiteness of the root-permutation group and averaging a positive form.

   **Witness:** Mathlib/LinearAlgebra/RootSystem/Basic.lean:197, `RootPairing.IsRootSystem.ext`, already identifies finite spanning root pairings from equality of their bilinear pairings and indexed roots, over a characteristic-zero domain. Both equalities follow from the realization fields.

   **Exact repair text:** Replace the averaging proof paragraph by: “Consume `RootPairing.IsRootSystem.ext` from `Mathlib/LinearAlgebra/RootSystem/Basic.lean`. For two realizations, their evaluation fields identify the perfect pairings and their root-vector fields identify the root embeddings. The theorem identifies the root pairings; the simple-support equations then identify their bases. The induced comparison is identity on the fixed space.” Add this declaration with its finite-index, spanning, characteristic-zero domain hypotheses to the Mathlib supplier contracts. Keep only the realization-specific comparison as an adapter target.

   **Retest:** In the A₃ fold, roots β₁,β₂ and the evaluation pairing are identical in both realizations. The pinned theorem forces the off-diagonal entries to be (−2,−1) in both; the alternative (−2,−2) is excluded. For rank zero both root embeddings and both evaluation pairings are equal, so the same theorem applies.

## Verified sound

Read all 376 lines of packages/RootSystemsPartII/README.md and all 263 lines of packages/RootSystemsPartII/Suggested.lean, plus README.md and CONTRIBUTING.md of the content repository. Counts: **17 Lean declarations** (6 definitions, 1 structure, 10 admitted headline theorems); **15 principal targets** across 13 README subsections; **54 individual API/proof claims**, **10 conventions**, **7 worked examples**; **53 Checks tested**; **15 named locator units verified in 3 works**; **12 distinct cross-roadmap section/target contracts checked** across 4 suppliers; **55 supplied sibling folders searched**. R01 makes one Check reproducible; R02 concerns duplication/attribution of a native uniqueness theorem. No false Lean theorem or unowned prerequisite was established.

Compared all 17 supplied elaborated signatures with the source binders and README. The nonspanning ordinary step, the spanning finite fold, the finite-dimensional ambient export, and the torsion export have their respective intended hypotheses. Universes for roots, the two real modules, and the auxiliary additive group remain independent. No dropped binder was found and no declaration was changed. All 17 local names occur in the README. There are ten theorem sorries, no admitted data, no `lemma`, no `set_option`, and no computational algorithm. The imports are one `import Mathlib` and the two existing Tau Ceti modules actually used. All ten statable headline theorems are present; the per-declaration table records the padding probe.

The checked heads/pins were board head fb5342d, content main f6e3d43, Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The two library checkouts match lake-manifest.json. Read the declarations and relevant section contexts for the README's 54 distinct dotted library names, plus RootPairing and RootDatum. Native additive closures are the `to_additive` declarations of Mathlib/Algebra/Group/Subgroup/Lattice.lean:329 and Mathlib/Algebra/Group/Submonoid/Basic.lean:112. Their closure is algebraic, not topological. The root-span restriction needed by §4.4 is available as `RootPairing.restrictScalars'` in Mathlib/LinearAlgebra/RootSystem/BaseChange.lean:71; its spanning instance is at line 92. Dual reducedness is native `RootPairing.instFlipIsReduced`, Mathlib/LinearAlgebra/RootSystem/Reduced.lean:202. The new native ownership issue is R02.

The package diff changes only five paths under packages/RootSystemsPartII: README.md, Suggested.lean, metadata.toml, reports/PKG-RootSystemsPartII.md and sources.toml. No finding is a re-raised settled repair item. No prior repair marked an item not actionable in this package. packages/RootSystemsPartII/design/plan.json declares an empty gaps list. No source, roadmap, Lean file, manifest or merge-order file was edited during this review.

Dependency check output:

```text
depcheck: 56 roadmaps, 641 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. The citation resolver found no unresolved roadmap citations or Lean names; it reported that it did not inspect library pins, so the library audit above was performed directly. None of the three active suppliers cites this roadmap back. LieHighestWeight is cited to delimit ownership, not as a proof input. The two named future continuations in the scope paragraph provide no inputs here.

### Supplier resolution and ownership

| Supplier / current file and locator | Contract compared with this package | Result |
| --- | --- | --- |
| TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:218, Layer 1 | Positive roots, descent, inversions, finite faithful Weyl action | Same reduced finite crystallographic hypotheses; pinned declarations used rather than redefined |
| Same file:245, Layer 2 | Finite Weyl/Coxeter presentation and simple generators | Correct ownership; package uses already pinned inversion statements for its new fixed subgroup |
| Same file:296, Layer 4 | Closed chamber and stabilizers | Correct; package explicitly distinguishes the central ambient case |
| Same file:321, Layer 5 | Valid Cartan classification and diagrams | Correct; validity excludes low-rank duplicate type names |
| Same file:356, Layer 6 | Integral numbered type-A datum and graph action | Correct; real sum-zero model does not claim equality of integral weight and root lattices |
| TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:370, Layer 2 | Weight integrality ownership | No duplicate module-weight theory planned here |
| Same file:773, Layer 6 | Highest-weight/character and integral-weight dictionary | Package only uses numerical simple-coroot integrality, so it needs no new dictionary |
| TauCetiRoadmap/ReductiveGroups/README.md:1339, §9A.1b Signed orbit modules and brackets | Invariant simple-root lattice and component restriction/diagonal inverse | Present at lines 1345 and 1353; package extends to nonsimply-laced components |
| Same file:1371, Folded frame, finite Cartan and presentation | Native ADE folded pairing/base, H-row convention | Present at 1378–1388; package explicitly transposes and changes root normalization |
| Same file:1457, Exceptional certificates, types and components | Distinct/projected/full sum maps and root/coroot/lattice comparisons | Present at 1486–1496; A₃ and A₄ normalization differences are retained |
| TauCetiRoadmap/ReductiveGroupsPartII/README.md:2421, §RG2.1.4 minuscule-coweight, current open head | Natural simple-coroot monoid order, flipped base | Exactly matches §1.1; no rational saturation |
| Same file:5994, §RG2.4.3 dominant-coinvariant-cocharacters, current open head | Full coinvariant group, torsion-sensitive translations, échelonnage coroot lattice and integral order | Present; package's abstract export retains injectivity, equivariance and actual fixedness as explicit hypotheses |

The roadmap-service object searches covered orbit sums, diagram folding, Stembridge steps, component return, invariant simple lattices and fixed Weyl groups on main and the indexed open heads. Direct searches also covered the board packages and all 55 sibling folders named in the brief. Relevant existing ownership is the ReductiveGroups ADE interface above; unrelated orbit sums in the other siblings concern CM traces, divided powers or torus invariant rings. This roadmap owns the general real-pairing adapters, nonsimply-laced component extension, diagram dichotomy, Stembridge steps and abstract ambient/torsion exports. The search for its namespace and headline declaration names found no colliding fully qualified declaration. Existing-roadmap revision heads were not used instead of main as suppliers. Ownership against additional unprovided sibling contents is not claimed.

### Verified source locators

These are locator units, with an equation range counted as one unit. Source text was read from the three operator-supplied legal cache extractions; no source text was copied into the package. All cited works already have one certified manifest key. The reported year/version and page numbering were checked against the supplied versions, with no claim about a different published KZ25 version.

| Unit | Locator and text witness | What was verified |
| --- | --- | --- |
| L01 | Rap00 §1, (1.8), printed p.154; Rap00 line 64 | Nonnegative **integer** simple relative-coroot coefficients |
| L02 | Rap00 §2, PGL₂ case, printed p.157; Rap00 line 172 | Cocharacter latticeℤ and coroot2 |
| L03 | Rap00 Lemma2.3, printed pp.157–158; Rap00 line 191 | Distinct comparable dominant endpoints admit positive-coroot step |
| L04 | Rap00 (2.10)–(2.13), printed pp.157–158; Rap00 line 195 through line 214 | Maximal-root argument; root-sum/nonpositive-Cartan alternatives |
| L05 | Stem08 condition(1), p.1; Stem08 line 21 | Orthogonality within simple orbits is standing hypothesis |
| L06 | Stem08 (2), p.1; Stem08 line 30 | Root-row Cartan denominator is target orbit size |
| L07 | Stem08 (3), p.1; Stem08 line 34 | Entry counts neighbors of one vertex in denominator block |
| L08 | Stem08 (4), p.3; Stem08 line 91 | Orthogonal-orbit sum norm2k; finite positive-definite extension explains Claim4 |
| L09 | Stem08 Claim1, p.2; Stem08 line 41 | Orthogonal root-orbit sum characterization |
| L10 | Stem08 Claim3, pp.2–3; Stem08 line 57 | Fixed Weyl subgroup comparison; source proof issues recorded below |
| L11 | Stem08 Claim4, p.3; Stem08 line 106 | Finite extension to all root orbits under the standing simple-orbit hypothesis |
| L12 | KZ25 §5.2, pp.48–49; KZ25 line 2119 and line 2152 | Coinvariant dominance setting; omitted coefficient sign recorded below |
| L13 | KZ25 Proposition5.2.3 and proof, pp.49–52; KZ25 line 2179 and line 2197 | Geometric proposition and claimed orbit-budget inference; source gap recorded below |
| L14 | KZ25 proof's lattice/curve transition, pp.50–52; KZ25 line 2202 through line 2329 | Finite combinatorial choice is distinct from relative-root geometry and descent |
| L15 | KZ25 Corollary5.2.7, pp.52–53; KZ25 line 2332 | Downstream curve assertion, used only as motivation |

Independent integer reflection calculations generated the finite Weyl groups and root-orbit sums, without using the target theorem. They gave:

| Input | Original roots | Weyl order | Root orbits | Distinct sums | Commuting Weyl subgroup order |
| --- | --- | --- | --- | --- | --- |
| A₁ identity | 2 | 2 | 2 | 2 | 2 |
| A₂ reversal | 6 | 6 | 4 | 2 | 2 |
| A₃ reversal | 12 | 24 | 8 | 8 | 8 |
| A₄ reversal | 20 | 120 | 12 | 8 | 8 |
| D₄ triality | 24 | 192 | 12 | 12 | 12 |
| B₂ identity | 8 | 8 | 8 | 8 | 8 |
| A₁⊕A₁ identity | 4 | 4 | 4 | 4 | 4 |
| A₁⊕A₁ swap | 4 | 4 | 2 | 2 | 2 |

### Declaration inventory and elaborated-context comparison

All locations in this table are in packages/RootSystemsPartII/Suggested.lean. Context B means independent universes for ι, M, N, real modules M,N with additive commutative groups, and P : RootPairing ι ℝ M N. F adds finite ι. R adds reduced and crystallographic. S adds spanning on both sides. I adds irreducibility and nonempty ι. A means σ is an actual automorphism preserving the base support in both directions. FD means both ambient modules are finite dimensional. Each b is a native base. Every context below was compared with the supplied elaborated type, including all explicit endpoint hypotheses; no binder disappeared. The ten theorem rows are also the headline inventory. The six definitions and one structure have real bodies/fields on native carriers and are used by those headlines.

| ID, declaration, line, section | Variables and instance context | Instances and computed values on both sides | Result / change |
| --- | --- | --- | --- |
| D01 rootLE, 28, §1.1 | B; b,x,y; no F/R/S needed | PGL₂: y−x=2 gives 2∈2ℕ=true; difference 1 gives false; empty base gives y−x=0 iff x=y | True definition; keep for headlines |
| D02 stembridge_step, 34, §1.2 | B+F+R; λ,μ dominant, integral simple-coroot values, λ≠μ, rootLE | A₂: λ=0, μ=(1,1), β=(1,1); pairings after step=(1,1), residual=(0,0); simple candidates pair to (2,−1),(−1,2). A₁: 0→2α uses α, residual α. Empty base: hne=true and hle=true cannot coexist | Sound; no one-lemma proof at pins found |
| D03 orbitIndices, 49, §2.1 | B+F; σ,i; no A assumed | id: {i}, size1; A₂ reversal: {1,2}, size2; D₄ triality: {1,3,4}, size3. Unbased A₁ negation: {α,−α}, size2 | Correct finite range of forward iterates |
| D04 orbitSum, 54, §2.1 | B+F; σ,i | id: α; A₂ simple orbit: α₁+α₂=f; fixed highest root: f; D₄ outer orbit: (1,0,1,1). Unbased A₁ negation: α−α=0 | Correct; positivity/nonzero laws require A as in README |
| D05 fixedSpace, 59, §2.2 | B; σ; no F/R/S | A₂ reversal: σ(t,t)=(t,t), σ(1,−1)=(−1,1)≠(1,−1); id gives all M; central ×2 has fixed equation 2z=z, hence z=0 | Native fixed submodule; no missing hypothesis |
| D06 foldedIndices, 64, §2.1 | B+F; σ | A₂: three positive roots in two orbits give one positive vector f, full image {f,−f}; id on A₁⊕A₁: image {±α₁,±α₂}, excludes α₁+α₂; unbased A₁ negation: image {0} | Image removes duplicates; definition correctly permits inputs for which no realization exists |
| D07 OrbitSumRealization, 70, §2.2 | B+F; b,σ; native pairing/base; S,R,evaluation,root_eq,base_eq are actual fields | A₃: fixed dimension2, roots8, simple roots β₁,β₂, Gram [[4,−2],[−2,2]], Cartan [[2,−2],[−1,2]]. A₁: evaluation f(α)=1, f(2α)=2. Empty spanning input: both dimensions0, roots0. Empty nonspanning torus with σ=id: fixed dimension1 versus root span0, so realization type empty | Fields determine object; native uniqueness attribution needs R02 |
| D08 fixedWeylGroup, 93, §2.3 | B; σ; no F/R/S | id on A₂: centralizer intersect W=S₃, size6; A₃ reversal: size8; rank0: size1. Unbased A₁ σ=−1: size2 although fixed space0 | Definition is commutation, not pointwise fixed action |
| D09 fixed_weyl_group, 100, §2.3 | B+F+R+S+A; simply laced, horth, F-realization | A₃: both groups order8, s₁s₃ sends β₁→−β₁ and β₂→β₂+β₁ on both sides; D₄: both order12, outer block sends β꜀→β꜀+βₒ; identity A₂: 6=6; rank0: 1=1 | Sound full action equation; unbased A₁ test excluded by hbase |
| D10 indexEquiv_eq_self_of_multiple_edge, 118, §3.1 | B+F+R+S+I+A; ¬simply-laced | B₂ swap sends (−2,−1)→(−1,−2), so not allowed; identity fixes all8 roots. G₂ swap sends (−3,−1)→(−1,−3). Empty type excluded by Nonempty | Sound; Bₙ/Cₙ extension exceeds three pinned numbered rigidity lemmas |
| D11 simpleOrbit_pairing_eq_zero_or_typeA_even, 130, §3.1 | B+F+R+S+I+A; simply laced | A₃ reversal: orbit pairing0, first alternative true. A₄ reversal: middle pairing−1, n=2, numbered i↦3−i. A₂: n=1, i↦1−i. D₄: three outer pairings0. A₁ id: no distinct simple pair, first alternative true | Sound; numbering equation includes every simple image |
| D12 general_fold, 147, §3.4 | B+F+R+S+A | A₂→2 roots, A₄→8, D₄ triality→12; B₂ id→8; A₁⊕A₁ id→4, swap→2; empty spanning input→0 roots in dimension0 | Sound; no missing carrier or weakened stand-in |
| D13 invariant_weight_transport, 159, §4.1 | B+F+R+S+A; F-realization; fixed x | A₂ x=f gives original(1,1), folded2; x=f/2 gives (1/2,1/2),1; x=−f gives (−1,−1),−2; x=0 gives 0,0. A₃ original(d,e,d)→folded(d,e) | Both chamber directions hold; only forward integrality claimed |
| D14 invariant_cone_transport, 173, §4.2 | B+F+R+S+A; F-realization; fixed x; no endpoint-integrality hypothesis | A₂ x=2f: original(2,2), folded2; x=f/2: coefficients(1/2,1/2),1/2, both outside monoids/lattices; x=−f: lattice true/true, cone false/false; x=0: true/true in both | Sound theorem; associated period Check needs R01 |
| D15 invariant_step, 186, §4.3 | B+F+R+S+A; λ,μ actually fixed, dominant, integral, distinct, exact rootLE | A₂ 0→f: β=f, residual0, fixed f=f. D₄ λ=2ρ, μ=λ+θ: θ=(1,2,1,1), fixed, residual0; bad orbit=(1,3,1,1) leaves (0,−1,0,0) and is not selected | Sound existential statement |
| D16 ambient_coroot_step, 209, §4.4 | B+F+R+FD+A, no S; subgroup L contains roots, stable; fixed dominant integral λ,μ∈L, distinct and rootLE | GL₂: λ=(c,c), μ=(c+1,c−1), β=(1,−1), center sums2c=2c; torus with central ×2: Q⁺={0}, strict comparison impossible; PGL₂ 0→2 uses2, 0→1 excluded | Sound; central finite order is absent as intended |
| D17 torsion_lattice_coroot_step, 237, §4.4 | B+F+R+FD+A; independent universe A, AddCommGroup; r,f,τ, hreal, injectivity on generated root subgroup, global and root equivariance; actually fixed dominant integral endpoints; exact lifted-simple monoid difference | ℤ⊕ℤ/2, r=(2,0): (0,1)→(2,1), β=(2,0), residual0, fβ=2; (0,0)→(0,1) has real difference0 but lifted difference outside ℕr. Shear τ(1,0)=(1,1) excludes merely real-fixed endpoint | Sound; injectivity is only on root subgroup, not all A |

No theorem is a boundary-case example or an immediate unfolding of its definitions. The simple definitions are necessary to state the ten headlines. The strongest construction is expressed by existence of a native realization, not by admitted data. The even-A coordinate model and component-return map are construction adapters used by general_fold; the module docstring accounts for the latter. No unstated-at-the-pins headline was identified.

### README targets and conventions

Locations below are in packages/RootSystemsPartII/README.md. This package uses numbered subsection targets rather than a separate series of bold theorem titles: all 13 subsections, their 15 principal statement units (the doubled units are §3.1 and §4.4), and all individually listed API claims are covered. Bold worked-example captions are included separately. “Sound” means the displayed computation agrees and the proof route was examined, not that a sorry was proved by Lean.

| ID / statement and location | Instances / computed sides | Result / change |
| --- | --- | --- |
| T01 §1.1 integral order, 71 | PGL₂: 2=1·2, 1≠n·2 for n∈ℕ; empty base: Q⁺={0} | Sound |
| T02 §1.2 ordinary step, 92 | A₂ 0→(1,1): β=(1,1), residual0, coroot values(1,1); A₁ 0→2α: β=α, residualα | Sound |
| T03 §2.1 distinct orbits, 116 | A₂ orbit sizes2 and1 both give f; D₄ size3 gives outer sum, six terms give twice it | Sound |
| T04 §2.2 orthogonal realization, 136 | A₃ lengths4,2 and entries−2,−1; A₂ orbit Gram [[2,−1],[−1,2]] fails orthogonality and sum norm2≠4 | Sound; import native uniqueness per R02 |
| T05 §2.3 fixed Weyl comparison, 167 | A₃ 8=8, D₄ 12=12, id A₂ 6=6, empty1=1 | Sound |
| T06 §3.1 multiple-edge rigidity, 200 | B₂/G₂ swaps fail oriented entries; identities fix8/12 roots | Sound |
| T07 §3.1 orthogonal/even-A dichotomy, 200 | A₃ pair0, A₄ middle−1 with n2, A₂ middle−1 with n1, D₄ outer pairs0 | Sound |
| T08 §3.2 even-A adapter, 215 | n1: ±f₁, count2=2·1²; n2: ±f₁,±f₂,±f₁±f₂, count8=2·2²; 2fᵢ absent | Sound |
| T09 §3.3 component-cycle adapter, 236 | two B₂ copies: D(u)=(u,u), norm doubles, count8; two D₄ copies with triality return: orbit sizes6,2 and norms12,4 | Sound |
| T10 §3.4 general fold, 258 | A₁⊕A₁ id: four roots, cross-sum absent; swap: two roots; empty: zero roots | Sound |
| T11 §4.1 weight/chamber comparison, 290 | A₂ d=1,0,−1→2,0,−2; d=1/2→1 disproves integral converse | Sound |
| T12 §4.2 cone/lattice comparison, 305 | x=2f: coordinates(2,2)↔2; x=−f:(−1,−1)↔−1; x=f/2:(1/2,1/2)↔1/2 | Sound; Check repair R01 |
| T13 §4.3 existential invariant step, 320 | D₄ θ budget(1,2,1,1); good incrementθ leaves0; bad increment(1,3,1,1) leaves(0,−1,0,0) | Sound |
| T14 §4.4 ambient step, 334 | GL₂ sums2c before/after; roots span line (1,−1), central kernel line(1,1), intersection0 | Sound |
| T15 §4.4 torsion lift, 338 | r=(2,0), λ=(0,1), μ=(2,1): β=r, residual0; root subgroup∩torsion={0} | Sound |
| V01 finiteness/spanning/rank conventions, 17 | empty spanning system: E=E∨=0; empty ambient pairing: central dimensions may be1, Q=0 | Correct distinction |
| V02 simple-coroot integrality, 17 | A₂ x=f/2 has (1/2,1/2), fails; f has(1,1), every coroot evaluation integral | Correct |
| V03 closed chamber, 17 | x=0 evaluates0 on each simple coroot; satisfies ≥0, fails >0 in rank1 | Correct |
| V04 root rows/coroot columns, 19 | A₃: 2(−2)/2=−2; reverse entry2(−2)/4=−1 | Correct |
| V05 contravariant coroot map / flip, 19 | D₄ forward1→3→4→1; transpose sends coroot3→coroot1; inverse transpose sends1→3 | Correct with Hom.lean:63–75 |
| V06 canonical form and center, 21 | A₁ α with coroot values±2: RootForm(α,α)=4+4=8>0; central z:0+0=0. Rescale by1/4 gives norm2 | Correct |
| V07 invariant component normalization, 21 | swapped isomorphic A₁ components both native norms8, both normalized2; D(u) norm4=2·2 | Correct |
| V08 positive-period formula, 21,120 | triality d3,m6:6/3=2; identity d1,m1 gives1, m2 gives2; m0 excluded | Correct; specified m missing in R01 Check |
| V09 actual lattice versus rational cone, 17,78 | PGL₂ 1∈ℚ≥0·2 but 1∉ℕ·2; 2 in both | Correct |
| V10 universe/characteristic boundary, 17 | ι,M,N can be independently lifted without changing α↦α, pairing2=2; coefficient ring fixed ℝ has 2≠0 and3≠0 | No zero-ring/characteristic-p extension claimed |

### Individually stated README API claims

| ID / line / statement | Instances and computed sides | Result / change |
| --- | --- | --- |
| A01 73 natural-coordinate iff | A₂ δ=(1,0): natural coefficients(1,0), both true; δ=(−1,1): no natural coefficient vector, both false | Sound |
| A02 74 reflexive/transitive/antisymmetric | A₁ 0≤α≤2α gives differences1,1,2; 0≤α true, α≤0 false; rank0 equality only | Sound |
| A03 75 translation invariance | A₁ x0,yα,z3α: (4−3)α=α=y−x | Sound |
| A04 76 based-equivalence comparison | A₂ swap: difference(1,0)→(0,1), both natural; (1,−1)→(−1,1), both fail | Sound |
| A05 77 integral-coordinate criterion | A₂ x(0,1),y(1,1): 0≤1,1≤1 and difference(1,0); reversing first coordinate inequality fails | Sound |
| A06 78 rational cone comparison | PGL₂ difference1=1/2·2: rational true, integral false; integral difference2: both true | Sound |
| A07 79 flipped-base convention | PGL₂ flipped simple vector2: μ−λ=2 corresponds to one coroot; difference1 not natural-coroot sum | Sound, same supplier convention |
| A08 118 orbit membership/stability/cardinality | D₄ O={1,3,4}: σO={3,4,1}=O, each starting node gives O, card3>0 | Sound |
| A09 119 fixed and representative-independent sums | D₄ σ(α₁+α₃+α₄)=α₃+α₄+α₁; center singleton sumα₂ | Sound |
| A10 120 full-sum formula | D₄ d3,m6 gives coefficient2; unbased A₁ negation gives sum0 at m2 and m4, illustrating cancellation exception | Sound |
| A11 121 positive nonzero orbit sum | A₂ simple orbit gives coordinates(1,1), height2>0; unbased ±α gives0 but fails based positivity hypothesis | Sound |
| A12 122 intertwining transport | A₂ label-swap e sends O={1,2} to{2,1}, sum f to f; id orbit α₁ goes toα₂ | Sound |
| A13 123 distinct image indexing | A₂ positive root orbits {α₁,α₂},{f} map to f,f; image contains f once | Sound |
| A14 140 norm and Cartan formulas | A₃ O outer,T center: norm4=2·2, norm2=2·1, N=2; entries −2/1=−2 and−2/2=−1 | Sound |
| A15 140 independent spanning fixed base | A₃ fixed vector(a,b,a)=aβ₁+bβ₂ uniquely; zero vector forces a=b=0 | Sound |
| A16 142 exact root image and positive lifts | A₃ positive fold coordinates (1,0),(0,1),(1,1),(1,2); lifts α₁,α₂,highest root,α₁+α₂ | Sound |
| A17 143 simple basis and signed expansions | A₃ β₁+2β₂ has coefficients(1,2), negative has(−1,−2); β₁−β₂ not in eight-root set | Sound |
| A18 144 evaluation/root/base fields | A₁ f(α)=1; root indexα maps toα, simple support{α}; zero evaluation would give0≠1 | Sound |
| A19 145 identity comparison / coroot uniqueness | A₃ same evaluation and roots give same Cartan(−2,−1); changing reverse entry to−2 sends β₂ to2β₁+β₂, absent | Native theorem already owns uniqueness; R02 |
| A20 146 oriented entries | A₃ root-row entries−2,−1; interchanging denominator blocks gives−1,−2, incompatible with norms4,2 | Sound |
| A21 147 block reflection | A₃ s₁s₃ β₁=−β₁; s₁s₃ β₂=β₂+β₁; folded reflection gives same two vectors | Sound |
| A22 148 identity / empty realization | id A₁ roots±α and baseα unchanged; id empty gives empty root/base on0 | Sound |
| A23 149 isometric transport | A₃ reversal intertwines itself and fixes β₁,β₂; relabel1↔3 gives same roots/norms4,2 | Sound |
| A24 151 realization-independence proof input | A₁ finite spanning root permutations={±1}; averaging any positive form yields root reflection−1 and coroot value2 | Mathematically sound but superseded by pinned ext; R02 |
| A25 153 height descent / all root orbits orthogonal | A₃ orbit{α₁+α₂,α₂+α₃}: inner product−1+0+2−1=0; sum height4 lowers under middle reflection to β₁ height2 | Sound finite branch; no affine assertion |
| A26 169 fixedness and linear inclusion | A₂ fixed(t,t): σx=x; inclusion of (1,1)+(2,2) gives(3,3) on both sides | Sound |
| A27 170 submodule laws | A₂ x=(1,1):2x=(2,2) fixed; zero(0,0) fixed; (1,−1) not fixed | Sound |
| A28 171 injective inclusion / id | A₂ (t,t)=(u,u) implies t=u; id A₁ fixed dimension1=ambient dimension1 | Sound |
| A29 172 centralizer/conjugation equivalence | id A₂: w·id=id·w=w and id·w·id⁻¹=w for all six w; A₃ s₁ does not commute since σs₁σ⁻¹=s₃≠s₁ | Sound |
| A30 173 subgroup inclusion laws | A₁ nontrivial w: w²=1 and w⁻¹=w before/after inclusion | Sound |
| A31 174 closure and restricted action | A₃ outer block u=s₁s₃ commutes, u²=1 commutes; uβ₂=β₂+β₁ remains fixed | Sound |
| A32 176 inversion descent / faithful restriction | A₃ block product has2 inversions and removes2 to identity; D₄ outer product has3 and removes3; A₃ fixed strictly dominant vector has simple values(1,1,1), so no wall reflections | Sound |
| A33 219 even-A root list | A₄ vectors4 short+4 long=8; 2f₂ not among listed vectors | Sound |
| A34 220 even-A simple basis | A₄ base β₁=f₁−f₂,β₂=f₂; f₁=β₁+β₂, f₁+f₂=β₁+2β₂ | Sound |
| A35 221 middle coroot multiplier | A₂ f norm2, original values1,1; folded value2(f,f)/2=2; orthogonal formula would give1 | Sound |
| A36 222 two positive lifts | A₄ (e₁−e₃)+(e₃−e₅)=e₁−e₅=f₁; singleton e₁−e₅=f₁ | Sound |
| A37 223 transport independence | A₂ reversal fixes f and exchanges its two simple-root lifts; resulting root±f/base f unchanged | Sound |
| A38 240 component projection inverse | swapped A₁: D(u)=(u,u); first projection D(u)=u; D(first projection(t,t))=(t,t) | Sound |
| A39 241 orbit-sum transport | two D₄ copies, return triality: D(α₁+α₃+α₄) sums6 distinct roots, same as full σ orbit | Sound |
| A40 242 form scale | two components u with norm6: norm D(u)=6+6=12=2·6; cross-component inner product0 | Sound |
| A41 243 simple bases/cones | swapped A₁: nα ↦n(α,α), coefficient n unchanged; n=2 gives(2,2), not(1,1) | Sound |
| A42 244 changing starting component | two-cycle: starting at second maps u toσu; diagonal vector(u,σu) unchanged after reordering components | Sound |
| A43 245 empty component datum | empty root set: number of component cycles0, direct sum dimension0, no c=0 denominator | Sound |
| A44 262 general image / positive lifts | identity A₁⊕A₁ gives four roots; each positive has its singleton lift; swapped case positive(1,1) has two-member lift | Sound |
| A45 263 general simple base | swap A₁⊕A₁: one simple orbit, base(1,1); id: two orbits, base(1,0),(0,1) | Sound |
| A46 264 four-branch agreement | orthogonal A₃→8; adjacent A₄→8; nonsimply-laced B₂ id→8; two B₂ cycle→8 with norms doubled | Sound |
| A47 265 functoriality | swap A₁ components sends folded vector(1,1) to(1,1), inverse also identity on fixed line | Sound |
| A48 266 empty pairing | empty roots span0=fixed space, dual0, evaluation0=0 | Sound |
| A49 267 root lattice inclusion/equality later | A₂ folded generator f→(1,1), subgroupℤf=Q^σ; half f outside both | Sound; equality deliberately proved in §4.2 |
| A50 292 denominator/form ratios | orthogonal A₃ outer: numerator4d,denominator4→d; A₂ adjacent: numerator4d,denominator2→2d; two-cycle doubles both | Sound, all denominators positive |
| A51 307 unique invariant coefficients | A₂ σ(a,b)=(b,a); equality gives a=b; regrouping (n,n)=nf uses no division | Sound |
| A52 322 positive-root lift and lattice membership | A₂ β=f has positive simple and fixed-root lifts; negative orbit sum−f has negative coordinates and cannot equal f | Sound |
| A53 336 root-span/central splitting | GL₂ (x,y)=((x−y)/2,(y−x)/2)+((x+y)/2,(x+y)/2); simple-coroot value x−y unchanged under projection | Sound |
| A54 340 exact torsion lift | subgroup generated r=(2,0): f(2n,0)=2n injective; fδ=0 with δ in it gives n0 andδ0; residual0 lifts exactly | Sound |
| E01 106 rank-one coordinates | A₁ root coordinateα maps to PGL₂ coroot coordinate2; 0→2α with stepα corresponds0→4 with step2 | Sound |
| E02 190 long-root scaling | D₄ outer norm6→24 on doubling; entry with center as root becomes 2(−6)/24=−1/2 instead of−1; other entry becomes−6 | Sound |
| E03 280 images versus cycles versus unions | A₄ f₁ from orbit sizes1 and2; two D₄ components norms6,2→12,4; id A₁⊕A₁ has no root(1,1) | Sound |
| E04 354 integral weights versus root cones | A₂ invariant values d∈ℤ give folded values2d; half f has folded value1 but original1/2; cone generator f still coefficient1 on both sides | Sound |
| E05 366 bold A₂ worked example | norm f=2+2−2=2; pairings of f/2=(1/2,1/2), folded1; both positive lifts givef | Sound |
| E06 368 bold D₄ worked example | bad sum consumes middle3>2; good θ consumes middle2=2; residuals−1 and0 at middle | Sound; source inference has gap |
| E07 370 bold central/parity example | PGL₂ budget2ℕ; GL₂ sum2c unchanged; torus Q⁺0; r=(2,0) keeps second coordinate1 | Sound for displayed root lift |

### All 53 README Checks

Each row is one original Check bullet. Values before/after arrows are evaluated quantities, not claims of formal proof. The definition Checks occur across the section that defines each object and its adjoining realization/action sections.

| Check / line | Computed values / truth values | Result / change |
| --- | --- | --- |
| C01 83 | PGL₂ 2=2·1∈2ℕ; 1∉2ℕ but1=2·(1/2) in rational ray | Sound |
| C02 84 | empty sum=0; x≤y iff y−x=0; central0 versus1 incomparable | Sound |
| C03 85 | (1,1)−(0,1)=(1,0); differences of(1,0),(0,1) are(−1,1),(1,−1) | Sound |
| C04 86 | x−x=0 in monoid; halfα has coefficient1/2, fails natural membership but lies in real positive cone | Sound negative control; first clause is definitional |
| C05 98 | α₁:(2,−1), α₂:(−1,2), α₁+α₂:(1,1); chosen residual0 | Sound |
| C06 99 | PGL₂ selected2, residual0; candidate1 leaves1∉2ℕ | Sound |
| C07 100 | equal-endpoint budget0; subtract positiveβ gives a negative nonzero coefficient; rank0 Q⁺0 forces equal endpoints | Sound boundary |
| C08 127 | id orbit{i}, sumα; period2 gives2α≠α | Sound |
| C09 128 | A₂ simple orbit sumf=(1,1); averagef/2=(1/2,1/2) has fractional simple coefficients | Sound |
| C10 129 | D₄ size3 sum(1,0,1,1); six iterates(2,0,2,2)=2·sum | Sound |
| C11 130 | A₂ simple orbit sum(1,1)=highest-root singleton sum(1,1); two orbits, one image | Sound |
| C12 157 | A₃ norms4,2; product−2; Cartan entries−2,−1; four positive plus four negative roots | Sound |
| C13 158 | D₄ norms6,2; product−3; entries−3,−1; six positive plus six negative roots; product3 | Sound |
| C14 159 | A₂ inner product−1; sum norm2+2−2=2, orthogonal formula2·2=4 | Sound negative control |
| C15 160 | empty spanning input fixed dimension0, roots0; positive-rank id sends each positive rootα→α | Sound |
| C16 161 | evaluation f(α)=1,f(2α)=2; zero pairing gives0; A₃ wrong coroot sendsβ₂→β₂+2β₁, coordinates(2,1) absent | Sound |
| C17 180 | A₃ fixed W size8; fixed dimension2; (s₁s₃)²=1; action β₁→−β₁, β₂→β₂+β₁ | Sound |
| C18 181 | D₄ fixed W size12; three orthogonal reflection factors give inversions3→2→1→0 | Sound |
| C19 182 | id A₂: fixed W=S₃, card6, pointwise stabilizer of E={1}, card1; (12)(23)=(123), (23)(12)=(132) | Sound nonabelian test |
| C20 183 | rank0 W and fold W both card1, dim0; id A₁ W card2, dim1 | Sound |
| C21 184 | A₂ σ(t,t)=(t,t); σ(1,−1)=(−1,1)≠(1,−1); id inclusionx=x | Sound |
| C22 206 | A₃ permutation1↔3,2 fixed; Cartan13=0; singleton has0 distinct pairs | Sound |
| C23 207 | A₄ permutation1↔4,2↔3; pairings14=0,23=−1; 2n=4 givesn2 | Sound |
| C24 208 | D₄ outer pairs13,14,34 all0, cycle length3; Dₙ/E₆ branch vertex maps to itself | Sound |
| C25 209 | B₂ ordered entries(−2,−1) become(−1,−2); G₂(−3,−1) become(−1,−3) | Sound |
| C26 227 | A₂ image{±f}; f original values1,1, folded2; orthogonal assumption would divide by4 and give1 | Sound |
| C27 228 | A₄ 4 short+4 long=8; simple norms4,2, product−2; entries−2,−1 | Sound |
| C28 229 | A₂ distinct image{f,−f}; 2f absent; adding ±2f would change reduced2-root system into4-root BC₁ | Sound |
| C29 230 | (e₁−e₃)+(e₃−e₅)=e₁−e₅=f₁; orbit counts2 and1, vector count1 | Sound |
| C30 249 | B₂ swap cycle: each of8 roots gives one diagonal vector; norm doubles; numerator/denominator both double; entries−2,−1 unchanged | Sound |
| C31 250 | c1: D(u)=u, form factor1; D₄ return triality can still have order3 | Sound |
| C32 251 | c2 with D₄ return: outer size2·3=6, center2·1=2; norms12,4; product−6; entries−3,−1; roots12 | Sound |
| C33 252 | empty root set: component cycles0, fixed span0, root imageempty; no c0 datum | Sound |
| C34 271 | B₂ id keeps8 roots; node swap changes Cartan−2↔−1, so rejected | Sound |
| C35 272 | A₁⊕A₁ id roots{±(1,0),±(0,1)}, count4; (1,1) absent; swap roots±(1,1), count2 | Sound |
| C36 273 | A₄ image8, f₂ present,2f₂ absent; middle sum norm2 not4 | Sound |
| C37 274 | D₄ triality folded count12, off-diagonal product3; G₂/F₄ length reversal changes oriented multiple-edge entries | Sound |
| C38 296 | x=f: original(1,1), folded2; x=f/2: original(1/2,1/2), folded1 | Sound; tests absent integral converse |
| C39 297 | x0: all original and folded simple values0; ≥0 true, >0 false in positive rank | Sound |
| C40 298 | A₃ original(d,e,d)→folded(d,e); e.g d1,e2→(1,2); two-cycle ratio(2N)/(2D)=N/D | Sound |
| C41 299 | A₂ original(−1,−1)→folded−2; original and folded dominant predicates both false | Sound reverse-direction test |
| C42 311 | δ=2f: original(2,2), folded2. Period2 simple-orbit sum=f still gives2; period4 gives2f and1 | R01: name period4 |
| C43 312 | f/2: original and folded coefficients1/2, integral-membership false/false; f gives1,true/true | Sound |
| C44 313 | −f: original coefficients−1,−1; folded−1; lattice true/true, positive cone false/false | Sound |
| C45 314 | rank0: both monoids/lattices{0}; ambient nonzero centralz has coroot evaluations0 butz∉span roots | Sound ambient negative control; spanning realization itself has no such z |
| C46 326 | A₂ λ0,μf: simple-orbit and highest-root lifts both sumf, residual0 | Sound |
| C47 327 | θ=(1,2,1,1), values(0,1,0,0); λ values(2,2,2,2), μ values(2,3,2,2); candidate values(1,1,−1,−1); sum(1,3,1,1), residual(0,−1,0,0); θ residual0 | Sound and discriminating |
| C48 328 | A₁ id orbit size1, β=α; empty roots: comparison iff equality | Sound |
| C49 344 | torus Q⁺0 forcesμ=λ; central×2 satisfies2^m≠1 for positive m but fixedz0 only | Sound |
| C50 345 | GL₂ μ−λ=(1,−1); sumsλ=2c, μ=2c; simple-root evaluations0 and2 | Sound |
| C51 346 | PGL₂ difference1∉2ℕ; real vector1 exists but has coefficient1/2 relative to coroot2 | Sound |
| C52 347 | λ(0,1)+r(2,0)=(2,1)=μ; residual0; difference(0,1) of alternative endpoints is outsideℕ(2,0) | Sound |
| C53 348 | τ(2,0)=(2,0), fτ=f; τ(1,0)=(1,1)≠(1,0), so actual fixedness fails | Sound |

The seven declared objects have at least three concrete discriminating tests among these rows: rootLE C01–C04; orbitIndices/orbitSum C08–C11; foldedIndices C11,C28,C35; fixedSpace C17,C20,C21; OrbitSumRealization C12–C16; fixedWeylGroup C17–C20. None relies on zero-ring or positive-characteristic behavior: the entire coefficient setting is ℝ. The torsion group in C52–C53 is permitted because it is a separate additive carrier, not an ℝ-module. No natural subtraction/division junk value is used in a headline; the only period quotient is guarded by m>0 and d∣m. Rank-zero results and checks stay out of Suggested.lean as separate theorems.

## Not verifiable

- No fresh Lean elaboration or build was run: the review brief forbids Lean execution. All 17 supplied elaborated types were compared with the declaration source and README instead. No proof of an admitted theorem is claimed from that comparison.
- KZ25 locators and source issues refer to the specified 63-page author preprint. The published article's wording and any published corrections were not compared; the manifest deliberately chooses this preprint's numbering. No cited work is missing or awaiting access, so no needs-references request was created.
- The two scope-only continuations RootSystemsPartIIDominanceAndDemazure and RootSystemsPartIIMinusculeBounds do not provide supplier inputs. Their future implementation and unprovided roadmap contents were not certified. The ownership audit covers main, the board texts, the 55 provided sibling folders and the roadmap service's search results, not a manual reading of every other open roadmap.

## Source issues

- **Misprint** in Rap00 at Lemma 2.3, printed p. 157 (Rap00 line 194): the source says the chosen variable is a positive coroot and subsequently decorates that same variable with a further coroot symbol; it should be consistently name the chosen positive coroot β∨; affects nothing.
- **Misprint** in Stem08 at proof of Claim 3, printed p. 2 (Stem08 line 60 through line 67): the source says a block reflection product changes a simple root by the sum of its neighbors in that block; it should be restrict this formula to roots outside the block; inside the block the change is minus twice that simple root; affects the proof.
- **Gap** in Stem08 at proof of Claim 3, printed p. 2 (Stem08 line 68 through line 70): the source says agreement on the folded span and Coxeter reflection faithfulness produce the homomorphism into the original Weyl group; it should be additionally establish the lifted Coxeter relations or faithfulness of restriction on the block-generated subgroup; affects the proof.
- **Misprint** in KZ25 at §5.2.1, printed p. 48 (KZ25 line 2152 through line 2154): the source says the dominance difference is an integral linear combination of positive coroots; it should be require nonnegative integer coefficients, since unrestricted integer coefficients make distinct root-lattice translates comparable in both directions; affects a stated result.
- **Gap** in KZ25 at proof of Proposition 5.2.3, printed pp. 49–50 (KZ25 line 2197 through line 2206): the source says the individual translated root bounds imply the bound for their distinct-orbit sum; it should be establish an existential invariant root-orbit choice respecting the same integral budget; the separate bounds alone do not imply this; affects the proof.
- **Misprint** in KZ25 at Lemma 5.2.5, printed p. 52 (KZ25 line 2317): the source says the translation representative lies in the power-series points of the group; it should be lie in the Laurent-series points, as in the proposition's use of a general nonzero translation; affects a stated result.
- **Misprint** in KZ25 at §5.2.6, printed p. 52 (KZ25 line 2330): the source says its local-model input is Theorem 5.2.1.1; it should be refer to the local-model diagram (5.2.1.1); affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "fb5342d3d9cdac6c46236a2cfb9300b25e8a1e58", "job": "RT-RootSystemsPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
