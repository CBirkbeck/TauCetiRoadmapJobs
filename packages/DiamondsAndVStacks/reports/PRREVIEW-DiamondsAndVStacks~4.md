# Review of DiamondsAndVStacks (pull request #820 at 2fa7064)

**Verdict:** needs changes

Incremental re-review of the 72 lines changed since 45a9638 (README D0.5, D0.26 and one supplier spelling; Lean docstrings only). Every Lean statement is unchanged, so the previous adversarial rows carry forward below; new rows cover the changed prose and the new Check.

## R01 (P2) — The acceptance test still imports a roadmap module

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean:8`: “import TauCetiRoadmap.PerfectoidSpaces.Suggested”; the module docstring at line 14 names “the PerfectoidSpaces roadmap” among the APIs the file is stated against.

**Claim.** The gate fails `imports=1` at this head, and no acceptance is possible while it fails. The import rule admits only `TauCeti.*` modules after `import Mathlib`; another roadmap's module is excluded whether or not that roadmap is on main (PerfectoidSpaces is on main now, which changes nothing here). Not repaired since the previous review.

**Witness.** Gate output at this head: “imports: line 1: … found: … `import TauCetiRoadmap.PerfectoidSpaces.Suggested` (line 8)”. `Perfd`, `isAffinoidPerfectoid`, `IsPerfectoidTateRing` and `IsKappaSmall` (lines 205, 219, 249, 291, 332) resolve only through that import.

**Repair.** Delete line 8 and the `open` of line 35. Remove the declarations that use those carriers (lines 204–235, 248–333) and name their headlines in the module docstring as not statable at the pins, each with the missing carrier (perfectoid spaces, the perfectoid Tate predicate, κ-smallness). Keep their full statements in the README; update the README's sentence at lines 344–346 that says importing sibling `Suggested.lean` files supplies interfaces. A native-only scratch copy of this shape elaborated at the previous head and nothing in the Lean statements changed since.

## R02 (P3) — Three proved boundary examples remain in the acceptance test

**Location.** `Suggested.lean:152`, `:272`, `:355`: “example : ¬ IsCutoffCardinal Cardinal.aleph0”, “Subsingleton ((structurePresheaf p).obj (Opposite.op X))” for empty `X`, “IsEmpty (BerkovichSpectrum R 0)”.

**Claim.** Boundary cases that mirror README Checks are padding, not headlines. Not repaired: the Lean diff touches docstrings only.

**Witness.** Each closes with its given proof: `ℵ₀ < ℵ₀` is refuted by `lt_irrefl`; the empty cover forces `0 = 1` in the sections ring; `α 0 = 1/2` contradicts `map_zero`.

**Repair.** Delete the three examples and their comment lines from `Suggested.lean`; the README keeps the three Checks.

## R03 (P3) — README-only Lean-style identifiers, extended by this change

**Location.** `README.md:353`: “are suggested names for targets specified in this README only”; `:938` repeats the convention; `:2075` “(`Stack.quotient_isSheaf_iff`)”, `:2080` “(`Stack.quotient_descent`)”; and the new Check at `:2120` is labelled “`s0_26_descent_noninvertible_modification`”.

**Claim.** A backticked name of this roadmap's own is a claim that `Suggested.lean` declares it, and a Check is prose that never names a Lean counterpart. Neither name is declared; the new Check adds another invented label. This is the previous review's R05, not repaired.

**Witness.** `grep -c "quotient_isSheaf_iff\|quotient_descent" TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean` gives 0; the worker's citation leads 517–518 list both names as found nowhere.

**Repair.** State statements (ii) and (iii) of D0.26 in prose without backticked own names (“prove that the quotient stack is a v-sheaf exactly when …”; “prove that restriction along the projection is an equivalence …”), label the Check in prose, and delete the catalogue convention at lines 349–353 and 936–939 together with every other undeclared own name it licenses. The mathematics of the new Check is correct and stays; only its label goes.

## R04 (P3) — Tag 044U is cited for an equivalence it does not state

**Location.** `README.md:2086–2087`: “For groupoid-valued `G` this is the 2-coequaliser property of [Stacks stackification] Tag 044U with the cocycle of Tag 04MA (Lemma 044T).”

**Claim.** Statement (iii) is an equivalence of categories, with modifications, between maps `[X/R] → G` and descent data. Stacks Lemma 78.23.2 (044U) asserts only that a 1-morphism `[U/R] → X` exists for a stack in groupoids `X`, a 1-morphism `f` from `U` and a 2-arrow `β : f∘s → f∘t` satisfying the cocycle; it states neither uniqueness nor the equivalence, and it is set on `(Sch/S)_fppf`. The repair of the previous R04 introduced this wording.

**Witness.** spaces-groupoids text, lines 1360–1382: “Given (1) a stack in groupoids X …, (2) a 1-morphism f …, (3) a 2-arrow β … then there exists a 1-morphism [U/R] → X which makes the diagram 2-commute.”

**Repair.** Write “For groupoid-valued `G` the existence half is the 2-coequaliser property of [Stacks stackification] Tag 044U, with the cocycle of Tag 04MA (Lemma 044T); the equivalence itself is the universal property of §1.18.” On the instance `Bℤ → Bℤ` this reads correctly: existence of a functor for each homomorphism `ℤ → ℤ` is 044U, the identification of the whole functor category (objects `ℤ`, automorphism group `ℤ` at each, no arrows between distinct objects) is §1.18.

## Previous findings

- R01 — not repaired: `Suggested.lean:8` still reads “import TauCetiRoadmap.PerfectoidSpaces.Suggested”; the gate fails `imports=1`. Raised again as R01.
- R02 — not repaired: the proved examples at lines 152, 272 and 355 are unchanged. Raised again as R02.
- R03 — repaired: README 1005–1007 now reads “[Hoc69] Proposition 8 and its proof; [KL15] §8.1, Def. 8.1.4, p. 157, only names this dual topology after Hochster”, and the four Lean docstrings cite Hoc69 Proposition 8. The wrong page is gone; the printed page 54 is not restated, which is acceptable with the proposition number.
- R04 — repaired: README 2070–2088 attributes the atlas relation to SchemeAndStackFoundations §1.21 and the category-valued descent equivalence to §1.18's `Stack.stackificationUniversal`, keeping ECD 11.3(ii) as the D4 specialisation; the new wording on Tag 044U is R04 of this report.
- R05 — not repaired: README 353 keeps “suggested names for targets specified in this README only”, and the new Check at 2120 carries a Lean-style label. Raised again as R03.
- R06 — repaired: README 767 reads “`YonedaAdicSpace` (a target of AdicEtaleGeometry §A1.16)”; no `AdicEtaleGeometry.YonedaAdicSpace` remains in the file.

## Verified sound

**Scope of this pass.** Head `2fa7064e826f7a6cffac33682b75e1f03d3c58c3`, worktree clean, no file changed outside the roadmap folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DiamondsAndVStacks'` is empty). The diff changes README D0.5 (lines 1005–1014 and the Check at 1024–1028), D0.26 (lines 2070–2088 and the new Check at 2120–2125), the spelling at line 767, and five Lean docstrings (lines 59–85); no Lean statement changed.

**Gate.** Run at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The single failure is the import of R01.

**Dependency check.**

```text
depcheck: 200 roadmaps, 1277 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The suppliers the changed passages cite, SchemeAndStackFoundations and AdicEtaleGeometry, are on main; the `*Needs:*` lines of D0.5 (AdicSpacesPartII R0.19.1, R0.19.9) and D0.26 (D0.25, SchemeAndStackFoundations §§1.18 and 1.21, D2.2, Mathlib `IsStack` and `CategoricalPullback`) are unchanged and downward.

**Elaboration.** I built the imported Tau Ceti modules and the imported roadmap module, then ran `lake env lean` on `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean`: 31 “declaration uses `sorry`” warnings and nothing else. I elaborated the worker's signature file (47 `#check @name` lines, one per declaration) in my scratch directory: exit 0, no error. Because no statement changed since the previous head, the previous comparison of each elaborated type with its README statement stands; I re-read the four D0.5 signatures against README 996–1014 (the inverse-of-inverse and constructible-topology statements print with their instance arguments elided, and the source carries `@inverseTopology X (inverseTopology X)` and `@constructibleTopology X (inverseTopology X)` explicitly). The one-tactic probe is not repeated: the statements probed at the previous head are the statements at this head.

**Sources opened for the changed passages.**

| Locator in the README | Text and line | What it supports |
|---|---|---|
| [Hoc69] Proposition 8 and its proof (D0.5, line 1005) | Hoc69 line 468 marks printed page 54; lines 476–484 | Spectrality of the retopologised space, reversal of the order, and (in the proof) identity of the two patch spaces. Hypothesis: `X` spectral. The README's two derived assertions are not in the source and are now marked as consequences. |
| [KL15] §8.1, Def. 8.1.4, p. 157 (line 1007) | KL15 line 6166 marks page 157; lines 6183–6188 | Names a second spectral topology whose quasicompact opens are the complements of the original ones and cites Hochster's Proposition 8 for it; no proof. The README's “only names this dual topology” is accurate. |
| [ECD] Proposition 11.3(ii), p. 54 (line 2073) | ECD v4 lines 2236–2253; page 55 marker at 2257 | For a pro-étale equivalence relation `R ⊂ X × X` on a perfectoid space, `R → X ×_{X/R} X` is an isomorphism of sheaves. The README now cites it only as the geometric specialisation used in D4. |
| [ECD] §12, Def. 12.4 and Prop. 12.3, pp. 69–70 (line 2092, untouched) | ECD v4 lines 2890–2902; page 70 marker at 2884 | Both are on printed page 70; the range “pp. 69–70” includes one page too many. Not a finding of this pass. |
| [Stacks stackification] Tags 04MA, 044T, 044U (line 2087) | spaces-groupoids lines 1327–1330, 1331–1355, 1360–1382 | 04MA is the section heading with the cocycle remark; 044T is the cocycle lemma for the canonical 2-morphism; 044U is the existence statement quoted in R04. |

**Supplier citations resolved on main.**

| Citation | Where it resolves | What it provides |
|---|---|---|
| SchemeAndStackFoundations §1.18 `Stack.stackificationUniversal` (README 2081) | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2745`, `:2764–2767` | For a category-valued pseudofunctor `F`, not required to be groupoid-valued, and every `J`-stack `G`, precomposition with the unit is an equivalence of the categories of strong transformations and modifications. This is exactly the generality D0.26 (iii) now invokes. |
| SchemeAndStackFoundations §1.21 `Stack.quotient J (X, R)`, `.π`, `R ≃ X ×_{[X/R]} X`, `.desc`, isomorphism-class sheaf (README 2058–2062, 2070–2072) | same file `:2951–2962` | The generic quotient stack on any site, the equivalence from the groupoid axioms, `.desc`, and the sheafification of `X/R` as isomorphism classes; it names DiamondsAndVStacks D0.26 as the `(Perf, v)` instance, an output interface, not a dependency back. |
| AdicEtaleGeometry §A1.16 `YonedaAdicSpace` (README 767) | `TauCetiRoadmap/AdicEtaleGeometry/README.md:176` | `YonedaAdicSpace` and `CAff` are placed under Tau Ceti's root namespace; the README's spelling now matches. |

The worker's citation leads 513–515 (`Spectral.inverseTopology_constructible`, `_inverse`, `_map`) resolve to `Suggested.lean:74`, `:79`, `:86`; lead 521 (`Stack.stackificationUniversal`) resolves to the supplier line above; leads 517–518 are R03. Ownership: the changed passages introduce no new object; the previous ownership search stands. Ownership against open pull requests without a supplied checkout was not checked.

**Adversarial rows for the changed statements.** `S = {η, s}` is `Spec` of a discrete valuation ring, opens `∅, {η}, S`, specialization `η ⤳ s`. “✓” records that the computed instance agrees with the statement.

| Statement | Instance | Values on the two sides | Result | Change |
|---|---|---|---|---|
| Quasicompact opens of the inverse topology are the complements of those of `X` (README 1009–1010) | `S` | Complements of `∅, {η}, S` are `S, {s}, ∅`; the topology they generate is `{∅, {s}, S}`, every member compact; its compact opens are again `∅, {s}, S` | ✓ | — |
| Same, non-spectral control | discrete `ℕ` | Compact opens are the finite sets; complements generate the cofinite topology, whose compact opens are all cofinite sets and `∅`; the two descriptions still agree, but the cofinite topology is not sober (`ℕ` irreducible closed without generic point), so the spectral hypothesis of D0.5 is needed for spectrality, not for this description | ✓ | — |
| Inverse of the inverse is the original (README 1010–1012; Check 1024–1028) | `S` | `∅, {η}, S` ↦ `∅, {s}, S` ↦ `∅, {η}, S` | ✓ | — |
| Both patch topologies discrete (Check 1027–1028) | `S` | Patch of `S`: generated by `{η}` and `S ∖ {η} = {s}`, all four subsets; patch of the inverse: generated by `{s}` and `{η}`, the same | ✓ | — |
| Spectrality of a map passes to complements (README 1012–1014) | identity; swap `σ`; constant map to `s` on `S` | Identity: preimages of `{η}` and of `{s}` are themselves, spectral in both. Swap: `σ⁻¹{η} = {s}` not open originally, `σ⁻¹{s} = {η}` not open in the inverse, false on both sides. Constant to `s`: `∅` originally, `S` in the inverse, both compact open, spectral on both sides | ✓ | — |
| (i) `R ≃ X ×_{[X/R]} X` from the groupoid axioms (README 2070–2072) | trivial `C₂` on a point; pair groupoid on two points | `R = C₂` has 2 elements and `pt ×_{BC₂} pt = Aut(trivial torsor) = C₂` has 2; the sheaf-quotient model `pt ×_{pt} pt` has 1 and is excluded. Pair groupoid: `R = 4` elements, `X ×_{pt} X = 4` | ✓ | — |
| ECD 11.3(ii) as the specialisation (README 2072–2074) | pro-étale equivalence relation; `BC₂` | ECD requires `R` an equivalence relation with pro-étale projections and `Y = X/R` a sheaf (lines 2236–2238); `BC₂` has stabiliser `C₂`, is not an equivalence relation, and is covered only by the generic §1.21 relation | ✓ | — |
| (iii) descent equivalence, groupoid target (README 2075–2086) | `Bℤ → Bℤ` on the point site | Functors are homomorphisms `ℤ → ℤ`, indexed by `m ∈ ℤ`; a transformation `f ⇒ g` is `k ∈ ℤ` with `g(n) + k = k + f(n)`, so only `f = g`, each with automorphism group `ℤ`. Descent data: `φ : ℤ → ℤ` additive (cocycle), morphisms `k` with `φ' = φ`; same category | ✓ | — |
| (iii) descent equivalence, category target (new Check 2120–2125) | `Bℤ → [1]` on the point site | Functors: object `0` or `1`, all arrows to identities; one transformation `0 ⇒ 1`, not invertible. Descent data: `a ∈ {0, 1}`, `φ = id` on every `n ∈ ℤ`, cocycle trivial, one morphism `0 → 1`; both sides are `[1]` | ✓ | — |
| Cocycle equals compatibility with composition; unit axiom (README 2082–2085) | arrows `r, r'` composable; identity arrow `e` | `φ_{r∘r'} = φ_r ∘ φ_{r'}` is the composition compatibility; for `e`, `φ_e = φ_e ∘ φ_e` and invertibility give `φ_e = id`, so no separate unit clause is needed | ✓ | — |
| Tag 044U scope (README 2086–2087) | `Bℤ → Bℤ` | 044U yields one functor per cocycle datum, hence per homomorphism; it does not identify transformations, which §1.18 does | overclaim | R04 |

**Carried rows.** The rows below are the previous review's (at 45a9638) for the statements this diff leaves untouched, reproduced unchanged; their “Change” column uses that review's numbering: its R01 and R02 are R01 and R02 here, its R03, R04 and R06 are repaired, and its R05 is R03 here.

| D0 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| `inverseTopology` | S; infinite discrete ℕ | S: opens become ∅,{s},S; ℕ: complements of finite sets generate the cofinite topology | ✓ | R03 locator |
| `spectralSpace_inverseTopology` | S | η→s originally; s→η in the dual; both finite T₀ topologies are spectral | ✓ | R03 |
| `inverseTopology_inverse` | S | ∅,{η},S → ∅,{s},S → ∅,{η},S | ✓ | R03 |
| `inverseTopology_constructible` | S | Both patch topologies have all four subsets open | ✓ | R03 |
| `inverseTopology_map` | Identity; endpoint swap on S | Identity preserves compact opens in both; swap fails continuity in both | ✓ | R03 |
| Profinite components | S; two discrete points | π₀(S)=1, compact Hausdorff; π₀(2)=2 discrete | ✓ | — |
| Pro-constructible quotient T₀ | Diagonal and universal relations on S | Quotients S and 1 respectively; saturation distinguishes points only in the first | ✓ | — |
| Spectral quotient criterion | Diagonal; universal relation; empty X | Quotients X, 1 (X nonempty), ∅; preimages of their basis opens are compact | ✓ | — |
| Quotient basis hypothesis | Profinite presentation of [0,1] | Quotient has only ∅ and [0,1] compact open; these do not form a basis at 1/2 | ✓ | — |
| Open spectral quotient | Finite discrete two-sheeted cover | Invariant opens are unions of fibres; quotient opens and compact opens coincide | ✓ | — |
| `IsSpectralSubmersion` | Patch S→S | Preimage of {s} is compact open, but {s} is not open in S; predicate false | ✓ | — |
| Constructible criterion | Same patch map | {s} is patch-clopen on target and already detects failure; both formulations false | ✓ | — |
| Composition of submersions | 4→2→1 discrete quotient maps | Composite has fibre size 4; inverse images of both target opens are compact open | ✓ | — |
| Limit of submersions | Drop first bit {0,1}ⁿ⁺¹→{0,1}ⁿ; transitions drop last bit | Limit is shift with 2-element fibres; an n-cylinder pulls back to two (n+1)-cylinders | ✓ | — |
| Ordinal assembly | Countable reversed natural-number index | Constant full stages exhaust all objects/arrows; a constant singleton stage misses arrow 2→1 | ✓ | — |
| Hochster realization | ∅, point, S | Spectra of zero ring, field, DVR have respectively 0,1,2 points with the required orders | ✓ | — |
| Closed-relation Hausdorff quotient | Cantor→[0,1] | Kernel is closed; quotient is [0,1], compact Hausdorff though not spectral | ✓ | — |
| Filtered sections/cohomology | Point with coefficients ℤ/2ⁿ under ×2 | Both degree-zero colimits are the Prüfer 2-group; both higher groups are 0 | ✓ | — |
| Quasicompactness requirement | Discrete ℕ, finite-support subsheaves | Colimit of global sections is ⊕ℕ ℤ; global sections of colimit are ∏ℕ ℤ; (1,1,…) lies only in latter | ✓ | — |
| Flasque constant sheaf | S, coefficient A | Nonempty opens carry A and restriction A→A is identity; restriction to ∅ is A→0, surjective | ✓ | — |
| Coherent-topos limit cohomology | One-stage point topos | Limit equals point; both H⁰=A and Hⁿ=0 for n>0 | ✓ | — |
| Noninvertible coefficient transition | Point diagram ℤ→ℤ by ×2 | Colimit coefficients and H⁰ are ℤ[1/2]; requiring invertibility would wrongly exclude the diagram | ✓ | — |
| `IsCutoffCardinal` | 0, ℵ₀, ℶ_ω | 0 and ℵ₀ fail uncountability; ℶ_ω has cofinality ℵ₀ and fails the cofinality clause | ✓ | R02 removes Lean Check |
| Cofinal cutoff existence | Successive strong-limit closure as ECD 4.1 | Set κ₀>λ, κᵢ₊₁=ℶ_(κᵢ⁺), continuously to ω₁: κ=sup κᵢ has cf κ=ℵ₁; cf κᵢ₊₁=κᵢ⁺ gives arbitrarily large cofinalities below κ | ✓ | — |
| Singular cutoff cover bounds | κ singular, cf κ=ω₁; discs over fields with sizes λᵢ cofinal in κ | Number of charts ω₁<κ and each size λᵢ<κ, but union has at least sup λᵢ=κ points; uniform bound fails | Source false | Use supplier P6.3 uniform bound |
| Two-fibre product | *→BG←*, G=C₂ or S₃ | Objects are G, hence 2 or 6; strict pullback has one object | ✓ | R04 attribution |
| Category-valued fibre product | [1]→1←1 | Result is [1], with one noninvertible arrow; groupoid-only replacement loses it | ✓ | R04 |
| Quotient relation | Pair groupoid on two points | Quotient is 1; relation and fibre square both have four elements | ✓ | R04 |
| Quotient is a sheaf iff stabilizers trivial | Free C₂ action on 2; trivial action on 1 | First quotient is 1 with stabilizer 1; second is BC₂ with stabilizer C₂ | ✓ | R04/R05 |
| Category-valued quotient descent | Bℤ into Bℤ; Bℤ into [1] | First remembers homomorphism 1↦m for every m∈ℤ; second admits noninvertible modifications between constant objects | ✓ | R04 |
| Boolean restriction fixture | Proper arrow and identities | Proper map true↦false, false↦true; identity fixes both; constant false fails identity at true | ✓ | R05 labels |

| D1 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| `OpenCoversSplit` | S; infinite discrete set | S cover must contain S, giving a constant choice; singleton cover of discrete set has identity choice | ✓ | — |
| qcqs in total disconnectedness | Infinite discrete union of fields | Split covers=true but compactness=false; total-disconnected-perfectoid predicate=false | ✓ | — |
| Split-cover iff unique closed point | S; three-point fork η→a,η→b | S: one closed point and splitting; fork: two closed points and cover {η,a},{η,b} cannot split continuously | ✓ | — |
| Split-cover cohomology/epi criterion | Finite discrete 2 | Epimorphisms are componentwise surjective; Γ is product of two surjections; Hⁿ=0 for n>0 | ✓ | — |
| Erroneous finite-colimit variant | Same discrete 2 | Γ(1⊔1) has 4 elements; Γ(1)⊔Γ(1) has 2 | Source false | Keep epi formulation |
| Totally disconnected implies affinoid | Two field components; empty space | Global rings C×C and 0; spectra have 2 and 0 components respectively | ✓ | R01 for Lean |
| Automatic integral flatness | Identity; split two-sheet cover | Mod-ϖ maps A→A and A→A² have free ranks 1 and 2 | ✓ | R01 for Lean |
| Faithfully flat refinement | Empty source; nonempty identity | A→0 is flat but not faithful for A≠0; identity is faithfully flat | ✓ | R01 for Lean |
| W-local adjunction direction | Counit on S | Three-point w-local space maps to two-point S; Hom from w-local W is represented on the right | ✓ | Source misprint only |
| Geometric w-localization Checks | Rank-two field spectrum S | Point fibres have sizes 2 and 1 as above; a two-point identity construction misses the second η-lift | ✓ | — |
| Universally open strict cover | C; empty base | Identity C→C is an admissible cover; empty base has empty cover space | ✓ | — |
| Topological classification | Base Spa(C), profinite S₀ | Geometric product has points S₀; component pullback over the one-point base is S₀ | ✓ | — |
| Chosen plus-ring carrier | C⁺ preimage of proper residue valuation ring V | 1,ϖ∈C⁺; a unit lifting a∉V is in O_C but not C⁺ | ✓ | — |
| Affine ring/pair projections | Same C,C⁺ | Ring projection=C; pair projection retains C⁺, not O_C | ✓ | — |
| Chart and Hom universe lifts | Two-point chart | Object still has 2 points; Hom lift wraps each morphism once without identifying distinct maps | ✓ | — |
| Small-chart restriction | Field of cardinality outside universe 0 | Its spectrum can have one point, yet its section field is not Small.{0}; chart predicate fails | ✓ | — |
| Chart coproduct closure | Empty, singleton, two affine charts | Underlying coproduct has 0,1,2 summands; restriction to each summand recovers its own ring | ✓ | — |
| Affine map direction | Swap C×C | Ring swaps factors and spectrum swaps the two points; identity fixes both | ✓ | — |
| Tilting comparison | Characteristic-p perfectoid field | Tilt is the same perfect field; valuation comparison is identity, with the chosen plus ring retained | ✓ | — |
| Chart resizing iff | Affine C in Type 0; one-point field L not Small.{0} | C and Spa(C) are small, so both sides true; L has one point but its section ring is large, so both sides false | ✓ | — |
| Charted pullback/tilt/étale closure | Two field factors; characteristic-p field; n-sheet finite étale cover | Tensor chart is formed in Type 0; tilt of perfect field is itself; rings Cⁿ stay small for n=0,1,2 | ✓ | — |
| Chartedness under large étale versus pro-étale maps | Type-indexed coproduct; product with Type→Bool | Coproduct charts each have ring C, although points are large; compact product has non-small point set and cannot have finitely many small charts | ✓ | — |

| D2 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| `vPrecoverage` | Same finite covers | A compact open point is image of one sheet; image union for empty family is ∅ | ✓ | — |
| Generic precoverage does not imply point surjectivity | Topological ℚ | Every compact open is ∅; empty family satisfies the condition although ℚ is nonempty | ✓ | Keep perfectoid hypotheses |
| Singleton v-cover iff surjective | Two points→point; ∅→point | Both properties true for first, both false for second | ✓ | R01 for Lean |
| `perfdToTop` and v-topology | Identity field spectrum | Map is identity on valuations; identity presieve covers and generates maximal sieve | ✓ | R01 |
| `PerfdKappa` | Finite-size object; too-large field | Bound holds for first; fails once ring cardinal ≥κ, even with one topological point | ✓ | R01 |
| κ-site sheafification | One-object point site, two-element sheaf | Transport and sheafification return 2 sections; unit and counit each fix both elements | ✓ | R01 |
| Cutoff independence | κ=κ′; enlargement with same representable | Restriction/extension unit is identity in first; sections on the fixed representable stay its original set | ✓ | — |
| `structurePresheaf` | Spa(C), disjoint union of two, ∅ | Values are C, C×C and 0; pullback along a component is its coordinate projection | ✓ | R01/R02 |
| Function v-descent | Split cover C→C×C | Equalizer of two maps to C⁴ consists exactly of diagonal pairs (a,a), hence is C | ✓ | R01 |
| v-subcanonicity | Same split cover, target Z | Two local maps glue iff equal on overlap; resulting global map is unique | ✓ | R01 |
| Additive structure sheaf | Same split cover | Equalizer of additive groups is diagonal C; forgetting multiplication does not add matching sections | ✓ | R01 |
| H⁰ of structure sheaf | Affinoid field; empty object | Both sides are (C,+); empty case both 0 | ✓ | R01 |
| Positive v-acyclicity | Affinoid field; n=0 in n+1 | H¹=0, while H⁰=C≠0; index n+1 excludes the false zero-degree assertion | ✓ | R01 |
| Integral almost acyclicity | Almost module killed by every element of the almost ideal | Its almostification is 0; ordinary module can remain nonzero | ✓ | Keep almost qualifier |
| Vector-bundle comparison | Ranks 0,1,2 over C | Both sites give zero, C and C²; automorphisms at rank 2 are GL₂(C), not merely scalar units | ✓ | — |

| D3 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Morphism v-descent | Split two-sheet cover of X | Compatible pair (f₀,f₁) has f₀=f₁; global Hom equals its matching equalizer | ✓ | — |
| Totally disconnected-base reconstruction | Identity and Galois field cover L/K | Identity reconstructs R; in Galois case (L)^G=K and overlap ring is ∏_G L | ✓ | — |
| Almost-perfectoid reconstruction | Base K₁×K₂ and reductions B₁×B₂ | Idempotents (1,0),(0,1) split both reduction and reconstruction; identity reconstructs K₁×K₂, zero reconstructs 0 | ✓ | — |
| Frobenius hypothesis for reconstruction | Ordinary polynomial reduction B=k[T], perfect k | Frobenius image=k[Tᵖ]; T is missing for p=2 and 3, so this wrong model is excluded | ✓ | — |
| Pro-étale implies quasi-pro-étale | Identity, two sheets, empty source over strict point | Strict-base pullbacks have respectively 1,2,0 sheets, all pro-étale; proper algebraically closed extension is v-cover but not pro-étale | ✓ | — |
| Effective affinoid descent | Empty source over empty base; split two sheets | Descended rings 0 and R respectively; arbitrary unrelated overlap maps are not descent data | ✓ | — |
| Separated pro-étale descent | Finite split sets over C | Matching n-sheet covers descend to n sheets; diagonal remains a closed finite subset | ✓ | — |
| Separated étale/finite étale stacks | Degree 0,1,2 covers | Descent preserves degrees 0,1,2; degree 2 object retains the swap automorphism | ✓ | — |
| Continuous-map v-sheaf | Split cover X⊔X→X | Matching continuous maps (f,f) descend uniquely to f, for arbitrary target topology | ✓ | R01 for Lean |
| Locally profinite torsor | Trivial S₃-torsor over point | Six sheets; orbit quotient has one point; transition g,h acts by gh, not hg | ✓ | — |
| Torsor relation and geometric carriers | G=C₂, two points | Relation has four arrows and fibre square has four points; diagonal alone would have only two | ✓ | — |

| D4 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Diamond presentation | Identity equivalence relation on X | X/R=X and relation is diagonal; universal relation on nonempty finite discrete X gives one point | ✓ | — |
| Quotient relation recovered | Free C₂ action on 2 | X×_{X/G}X has 4 elements, same as G×X | ✓ | — |
| Underlying-space field points | C with rank-two plus ring | Specialization chain has η and s; testing only rank-one points would keep η and lose s | ✓ | — |
| Quotient carrier Check | Fold Bool→1 | Kernel contains all four pairs; equality relation contains two, so it cannot be used as the kernel | ✓ | — |

| D5 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Spatial versus locally spatial | Finite discrete 2; infinite discrete ℕ | Both locally spatial; only finite one quasicompact, hence spatial | ✓ | — |
| Quasicompact injection permanence | {η}→S | Domain is a one-point spectral space; image is pro-constructible and generalizing | ✓ | — |
| Finite étale permanence | n copies of spatial point | n=0,1,2 give spectral spaces with that many points | ✓ | — |
| Cofiltered diamond limit | Binary finite quotients | Stage sizes 2ⁿ; limit point set has size 2^ℵ₀ and profinite topology | ✓ | — |
| Finite-stage étale comparison | Clopen of binary inverse limit | Compact clopen depends on finitely many coordinates, hence comes from one finite stage | ✓ | — |
| Size of limit | Fewer than κ coordinates, uniform μ<κ | Number of tuples ≤μ^λ<κ by strong-limit bounds; κ independent Boolean coordinates instead give 2^κ≥κ | ✓ | — |
| Size versus chart universe | One-point field outside Type 0 | Topological size=1 but section-ring size not Small.{0}; increasing κ does not fix resizing | ✓ | — |
| Smallness of finite-subset arrows | I=∅, Bool, ℕ, Type | Arrow counts 1, 3²=9, ℵ₀; singleton identities inject Type into arrows, so last is not Small.{0} | ✓ | — |
| Quasi-pro-étale permanence | Profinite product over a point | Fibre products S₀×T₀ are profinite; pointwise product counts multiply for finite sets | ✓ | — |
| Two-out-of-three refinements | Split maps 2→1→1 over Spa(C) | f,h have degree 2, g degree 1; all are finite étale, hence étale and quasi-pro-étale; f is surjective and g separated | ✓ | — |
| Spatial v-sheaf criterion | Identity cover of a point | Cover point is strictly disconnected; its unique image supplies the required surjectivity | ✓ | — |
| Diamond representability under pro-étale surjection | Split cover X⊔X→X and descent of n-point object | Two pullbacks and matching overlap recover n points for n=0,1,2; replacing cover by arbitrary v-cover does not satisfy the theorem’s premise | ✓ | — |
| `BerkovichSpectrum` normalization | ℚ₂, ϖ=2; ℚ₃, ϖ=3 | α(2)=1/2; α(3)=1/2 after exponent log(2)/log(3), not the unrenormalized 1/3 | ✓ | — |
| Normalization nonzero requirement | ϖ=0; zero ring | α(0)=0 cannot equal 1/2; zero ring also has 0=1 contradicting multiplicative seminorm axioms | ✓ | R02 removes example |
| Change of pseudouniformizer | ϖ versus ϖ² | If α(ϖ)=1/2, new β=α^(1/2) has β(ϖ²)=1/2 | ✓ | — |
| Pointwise topology | Finite product C×C | Two seminorms distinguish idempotent (1,0) by values 1 and 0 | ✓ | — |
| Berkovich/Hausdorff comparison | Rank-two field pair | Spa has two comparable points; Hausdorff quotient and normalized spectrum each have one | ✓ | — |
| Nilpotent insensitivity | K[ε]/ε² | α(ε)²=α(0)=0, hence α(ε)=0; spectrum equals that of K | ✓ | — |
| Berkovich realization on geometric site | S | q(η)=q(s)=*; maximal-generalization section sends * to η, and q∘section=id | ✓ | — |
| Hausdorff cohomology comparison | Point; two discrete points, abelian A | H⁰=A or A² on both sides; positive cohomology is 0 | ✓ | — |
| Compact quotient components | S₃ acting on 3; C₂ swapping 2 | Orbit spaces and component-orbit sets each have one point | ✓ | — |
| Compact quotient criterion, both directions | Trivial group on discrete 2 | LHS components equal iff x=y; RHS ∃g is also x=y | ✓ | — |
| Noncompact group exclusion | Dense ℤ in ℤ_p | π₀(ℤ_p/ℤ)=1; π₀(ℤ_p)/ℤ=ℤ_p/ℤ has more than one point | ✓ | Source correction retained |

| D6 statement | Instance | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Marked untilt carrier | Characteristic-p field and identity marking | Tilt identification is id; changing marking by a nontrivial automorphism changes the marked datum | ✓ | — |
| `Spd ℤ_p` integral base | p in ℤ_p and ℚ_p | p is nonunit in ℤ_p, unit in ℚ_p; only latter is a Tate pseudouniformizer | ✓ | — |
| Primitive untilt equation | ξ=p−[t], t♯=p | θ(ξ)=p−p=0; θ(p+[t])=2p≠0 in characteristic zero; c₀=−t, c₁=1 (odd p), 1+t² (p=2) | ✓ | — |
| Untilts v-descend | Split two-sheet cover | Two untilts with matching marking glue to the original; forgetting the marking permits extra automorphisms | ✓ | — |
| Tate-pair spatial diamond | Perfectoid pair with trivial torsor group | Atlas is original perfectoid object; quotient relation is diagonal and underlying Spa is unchanged | ✓ | — |
| Completed pair comparison | Already complete pair | Completion map=id; plus closure stays original closed integral subring | ✓ | — |
| Analytic diamondification | Perfectoid field and its tilt | Diamond identifies via the specified tilt equivalence, not an unmarked arbitrary field isomorphism | ✓ | — |
| Étale-site equivalence | Spa(C), finite n-sheet covers | Objects on both sides have n sheets; maps are functions of the sheet sets, with permutations retained | ✓ | — |
| Finite étale comparison | C²/C | Two idempotents and the swap automorphism survive diamondification | ✓ | — |
| Pre-adic diamondification carrier | Non-Tate integral pair ℤ_p | Mapping functor is defined despite failure of IsTateRing; analytic-only carrier would omit it | ✓ | — |
| Integral smallness | Affine pair of cardinal λ | With μ=(λ+ℵ₀)^ℵ₀, hull has size ≤μ and point set ≤2^(2^μ); choose cutoff κ>2^(2^μ) independently of the test map | ✓ | — |
| Galois quotient | Finite Galois L/K | Generic geometric fibre has [L:K] points and quotient one; special inertia may fix points | ✓ | — |
| Galois action convention | g=(12), h=(23) in S₃ | g·(h·f)=f∘h⁻¹∘g⁻¹=f∘(gh)⁻¹; gh=(123), whereas hg=(132) | ✓ | — |
| Integral quotient is not everywhere torsor | Totally ramified quadratic extension | Generic fibre size 2; residue extension degree 1 and special inertia size 2 | ✓ | — |
| Analytic-locus comparison | ℤ_p, generic versus special valuation | Generic support does not contain p; special support contains p; inverting p retains only generic locus | ✓ | — |
| Formal resolution comparison | Cusp u²=t³ | Resolution parametrization t=s²,u=s³ gives s⁶=s⁶; pullback of equation is zero | ✓ | — |
| Rig-regular restriction | K[[t]]⟨u,v⟩/(uv) | After inverting t, u=v=0 remains singular; input is not rig-regular and is excluded | ✓ | — |
| Relative algebraic/analytic resolution | Node uv=0 | Normalization has two smooth branches on both sides; over crossing fibre has 2 points, not 1 | ✓ | — |
| `subintegral_lift` | Cusp→K[t], evaluation t²↦a²,t³↦a³ | Unique extension sends t↦a; any other b has b²=a²,b³=a³, hence b=a in a reduced field | ✓ | — |
| Bijective subintegral map | Identity K; K→K[ε]/ε² | First bijective; second subintegral but not surjective, excluded because target not reduced | ✓ | — |
| Existence of seminormalization | Zero ring; field; cusp | Targets respectively 0, K, K[t]; units subintegral in each case | ✓ | — |
| Unique marked comparison | 𝔽₄ with identity unit | Identity respects unit; Frobenius a↦a² moves a∉𝔽₂ and fails the unit triangle | ✓ | — |
| Principal localization | Cusp, invert t² | t=t³/t² now belongs to localized ring; reflection/localization both give K[t,t⁻¹] | ✓ | — |
| Compatible functions on a seminormal node | A=K⟨u,v⟩/(uv), B=K⟨u⟩×K⟨v⟩ | A={(f,g):f(0)=g(0)}; B contains (1,0), A does not | ✓ | Source error recorded |
| Reduced-overlap equalizer | Same normalization | Equalizer condition is f(0)=g(0), recovering A exactly; product B alone is too large | ✓ | — |
| Seminormal structure-sheaf comparison | Node; cusp | Node recovers compatible pairs A; cusp gains t, so O→ν_*Ô is not asserted iso without seminormality | ✓ | — |
| Seminormal rigid full faithfulness | Seminormal source point; nilpotent target thickening | Reduced test-source maps kill ε, agreeing with ordinary maps; allowing nonseminormal cusp source would lose its distinction from normalization | ✓ | — |


## Not verifiable

- **Huber96**, Definition 1.6.5, Proposition 1.6.7 and §2.1/Proposition 2.1.4: still uncertified (publisher access only); not touched by this change and not in the sample.
- Ownership against open pull requests without a supplied checkout was not checked; the changed passages introduce no new object.
- The finite instances above are consistency checks, not proofs of the universal statements.

## Source issues

- none
