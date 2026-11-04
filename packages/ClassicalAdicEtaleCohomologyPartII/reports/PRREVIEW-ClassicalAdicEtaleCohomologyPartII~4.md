# Review of ClassicalAdicEtaleCohomologyPartII (pull request #1549 at fadef01)

**Verdict:** accepted

Incremental re-review of the 70 lines changed since c1ef9e9 (README: the AdicSpacesPartV supplier section, the scope paragraph, §3.7, the `*Needs:*` lines of §§7.1–7.5 and the Layer 7 Dependencies; `Suggested.lean`: the root-stage carrier of §3.7). No new finding. The two findings of the previous report are accounted for below; the seeded targets that fall in the changed passages (§§7.1, 7.2, 7.4) were reopened at their locators; the gate, the dependency check and the elaboration were rerun; the adversarial table carries the untouched rows and adds computed rows for every changed statement.

## Previous findings

- R01 — repaired: the five AdicSpacesPartV inputs are no longer stated as undeclared contracts; `README.md:74–106` cite them as planned supplier targets ("AdicSpacesPartV RZ.0/zariski-closed-subset, … supply the following"), and the two remaining AdicSpacesPartV gaps carry the plan's destinations (RZ.1; RZ.2 and RZ.4). The README's 13 `gap:` slugs equal the plan's 13 `gaps[*].slug`, and every cited RZ label exists in the AdicSpacesPartV design with the content the README assumes (table below). The repair introduced no new problem.
- R02 — repaired: `Suggested.lean:64–79` replace the `ModuleCat` carrier by the type synonym `monomialRootModule` with `Module.compHom` along `iterateFrobenius` and the identification `monomialRootModule.of`; the `simp` probe now reports "made no progress" instead of the transparency failure, and `a • x = of (a ^ (p ^ m) * of.symm x)` closes by `rfl`.

## Verified sound

**Gate and direction.** The worker's gate at fadef01 passes every scanner and the targeted build (`gate.md`: all counts 0, `build=0 OK`). The dependency check rerun from the brief's command printed

```text
depcheck: 204 roadmaps, 1658 edges, 0 problem(s)
```

with no UPWARD or CYCLE line; AdicSpacesPartV is line 207 of the merge order and this roadmap line 208. The diff outside the roadmap folder against origin/main is empty; the worktree is clean at fadef0111c22b68d6ea9dfe1e6dea24341145d7e. The README has no process words, pull-request numbers, LaTeX delimiters or `lemma`; the gate's `readme-ids-missing=0` confirms that the three new backticked names of §3.7 (`monomialRootModuleAddCommGroup`, `monomialRootModuleModule`, `monomialRootModule.of`) are declared.

**Declared gaps.** `design/plan.json` lists 13 gaps; the README states 13 contracts with the same slugs (`README.md:56–66`, `:114–116`, `:132–136`, `:160–162`, `:186`). The two AdicSpacesPartV entries agree with the README's destinations: `finite-branched-covers` at RZ.1 (plan line 4359; `README.md:118`, `:120`), `proper-generic-smoothness` at "RZ.2 and RZ.4" (plan line 4365; `README.md:118`, `:122`). The AdicSpacesPartV design lists generic smoothness and generic flatness (BH §§2.2–2.5) among its non-goals (design README line 13) and plans no branched-cover extension (no occurrence of "branched" in the design), so both remain gaps rather than citations, as `README.md:72` says.

**Supplier citations resolved.** AdicSpacesPartV has no folder on main and no open pull-request head; it is an accepted design on the board (`packages/AdicSpacesPartV/design/README.md`, 1870 lines), listed in the merge order before this roadmap and named in the brief's list of consumable suppliers. Every RZ label the README cites was found there with the assumed content:

| README citation | Design target (line) | What the design states; what the README assumes |
|---|---|---|
| RZ.0/zariski-closed-subset | line 33 | supports V(𝓘) of coherent ideals, radical reduced structure, finite unions, intersections, preimages, traces on affinoid opens; README `:74` assumes exactly these |
| RZ.0/local-dimension | line 92 | min of Krull dimensions of affinoid neighbourhoods; same |
| RZ.0/nowhere-dense-criteria | line 149 | (c) ideal in no minimal prime on each affinoid, (e) dim_z Z < dim_z X for all z; README quotes (c) and (e) |
| RZ.0/proper-image-zariski-closed | line 183 | f(T) Zariski closed for proper f and Zariski closed T; f(Y) = Supp f_*O_Y via Kiehl; same |
| RZ.1/rigid-normalization | line 260 | finite surjective X^ν → X through X_red, isomorphism over the normal locus of X_red, affinoid compatibility; same |
| RZ.1/irreducible-components | line 395 | images of connected components of X^ν, locally finite; same |
| RZ.1/riemann-extension | line 517 | bounded functions on X − Z extend uniquely, X normal, Z nowhere dense, any K; README `:82` first states this form, then derives Han's sheaf form (row below) |
| RZ.2/singular-locus | line 587 | Zariski closed, nowhere dense if X reduced; same |
| RZ.2/smooth-iff-regular | line 640 | char 0: smooth locus = Reg(X), Zariski open, dense when reduced; the design's hypotheses line 646 records that any perfect K suffices, as README `:90` says |
| RZ.4/shilov-point | line 1082 | Shilov points of an affinoid; API `IsShilov.sup_attained` (line 1101): the supremum norm is a maximum over Shilov points, the fact README `:82` uses |
| RZ.4/weakly-shilov-point | line 1157 | Shilov in some affinoid neighbourhood, rank one, dense (BH Lemma 2.8); same |
| RZ.4/weakly-shilov-transcendence-criterion | line 1233 | rank-one x weakly Shilov iff trdeg K̃_x/K̃ = dim_x X; same |
| RZ.4/weakly-shilov-avoid-nowhere-dense | line 1261 | nowhere dense Zariski closed Z contains no weakly Shilov point; same |
| RZ.5/rigid-resolution | line 1468 | char-0 K, nowhere dense nonreduced locus, proper π with smooth source, isomorphism over Reg(X) = X^sm, functorial for smooth maps, compatible with complete extensions of K; same, including nonproper X and residue characteristic zero |
| RZ.5/resolution-consequences | line 1502 | L ⊇ ℚ_p, S reduced: π proper surjective, resolution of T_red serves for T; README `:106` states the ℚ_p restriction and derives surjectivity over every K from RZ.0 and RZ.2 (row below) |

The other suppliers named in the changed lines are unchanged citations resolved in the previous report (AdicSpacesPartIII §R3.6 Kiehl proper mapping; ResolutionOfSingularitiesCharacteristicZero §§7.5, 7.7, 7.8; RigidAnalyticGeometry §§1.1–1.2; HodgeTateAndCanonicalSubgroups §7.6; DiamondEtaleCohomology §§C0.1, C0.23, C2.10; DiamondsAndVStacks §D2.2; EnhancedDerivedSheaves §E5:animation.3; PadicHodgeTheory §2.7). The worker's resolver reports no unresolved citation or Lean name; I found none.

**Sources opened at the cited lines** (cache extractions; page markers checked). BH Definition 2.5 (line 314, p. 7), Lemma 2.8 (line 325, p. 8), Proposition 2.9 (line 329), Corollary 2.10 (line 346), Theorem 2.25 (line 536, p. 12), Lemma 2.26 (line 546), Theorem 2.27 (line 551), Theorem 2.29 and proof (lines 567–574, p. 13); Han Theorem 2.6 (line 409, p. 10), Corollary 2.7 (line 413), Proposition 2.8 (line 417), Proposition 2.9 (line 435, p. 11). Each matches the README's locator and hypotheses (normal X and nowhere dense Z for Theorem 2.6; rank one for Proposition 2.9; reduced X for the regular-locus clause of Corollary 2.10; char 0, X smooth, Y reduced, f proper for Theorem 2.29).

Seeded targets in the changed passages:

| Target | Locator opened | Finding |
|---|---|---|
| 7.1 Zariski-constructible torsion complexes | BH Definition 3.1 (line 594, p. 14), Warning 3.2 (line 610) | locally finite stratification by Zariski locally closed subsets with lisse restrictions; `D^{(b)}_zc` the locally bounded objects; as written. The `*Needs:*` line now cites RZ.0, whose targets define the Zariski (locally) closed subsets and local dimension the definition uses. |
| 7.2 Affinoid constructible algebraization | BH Proposition 3.7 and proof (lines 672–696, pp. 15–16) | (1) base change for any finite-type h without properness, (2) full faithfulness, equivalence for proper Z, (3) lisse subcategories; K of characteristic zero (line 667). The proof uses the normalization and Han Theorem 1.6, matching the `*Needs:*` citation of RZ.1 with the finite-branched-covers contract. |
| 7.4 Zariski-constructible proper pushforward | BH Theorem 3.10 and proof (lines 764–787, pp. 17–18) | `D^{(b)}_zc` preserved, p ∣ n allowed (line 768); the proof uses Temkin's resolution for a smooth proper hypercover, truncation at level i+1 in D^{≥0}, Theorem 2.29 and the ℓ = p local-constancy input: the `*Needs:*` citations RZ.5, RZ.2, RZ.4, RZ.0 with the proper-generic-smoothness contract. |

The remaining seeded targets (0.5, 1.5, 2.1, 2.2, 3.2, 3.3, 3.5, 3.9, 4.7, 5.7, 5.9, 7.7) lie outside the diff and were not reopened in this incremental re-review; 3.2, 3.3, 3.5, 3.9 and 5.7 were checked at their locators in the previous report.

**Lean.** A scratch copy of `Suggested.lean` with `#check @name` for all eight declarations elaborated with `lake env lean` in 13 s: the only warning is `declaration uses sorry` at line 84; the eight elaborated types agree with `signatures.md` and with README §3.7 (p, n, m explicit; `Fact (Nat.Prime p)` carried only by `monomialRootModuleModule` and `monomial_root_duality`; the synonym, its additive group, the quotient, the `CharP` instance and `monomialClass` for every natural p, as `README.md:779` says). No section binder was lost (no section variables). A second scratch copy replaced `sorry` by `simp`: "`simp` made no progress", so the headline is not padding and the transparency failure of R02 is gone. The same copy proved by `rfl` that `a • x = monomialRootModule.of p n m (a ^ (p ^ m) * (monomialRootModule.of p n m).symm x)` for every `a : monomialRootAlgebra p n` and `x : monomialRootModule p n m`: the scalar action is exactly the README's `a^(p^m)*x`, and `monomialClass p n 0 = 1` closes by `simp [monomialClass]`. The file has one `import Mathlib`, no `set_option`, no sorried data (`monomialRootModule.of` is `Equiv.refl _`, the instances have real bodies), `theorem` only, and every Lean name appears in README §3.7. `monomialRootModule.of` and the two instances are the simple definitions the headline needs to be statable and are not padding.

**Pins opened.**

| Declaration | File and line at the pin | What it says / does not include |
|---|---|---|
| `Module.compHom` | `Mathlib/Algebra/Module/RingHom.lean:57` | `abbrev`: the S-module structure on an R-module M through a ring map S →+* R, scalar `s • m = f s • m`; needs `[Module R M]`, found here by unfolding the synonym to the ring's own module structure (the `rfl` witness above confirms which instance was taken) |
| `iterateFrobenius` | `Mathlib/Algebra/CharP/Lemmas.lean:327` | ring homomorphism x ↦ x^(p^n); needs `ExpChar R p`, supplied by `monomialRootAlgebraCharP` and `Fact p.Prime` |
| `CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | shifted Hom in the derived category, on objects of `ModuleCat`, here `ModuleCat.of _ (monomialRootModule p n m)` |
| `LinearMap.IsPerfPair`, `Representation.invariants`, `ModuleCat.restrictScalars`, `AlgebraicGeometry.Scheme.smallEtaleTopology`, `TauCeti.AdicSpace`, `Representation.exists_common_fixed_vector_of_isPGroup` | as in the previous report | unchanged uses |

**Ownership.** The diff introduces no new mathematical object: the root-stage synonym replaces a `ModuleCat` carrier for the same module. The ownership search of the previous report (Zariski-constructible pushforward and base change, polystable traces, mod-p duality; roadmap service index of 440 open pull requests, and the sibling checkouts listed in the brief) stands; the Lean name prefix `TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII` is unique. Ownership against open pull requests whose files the brief does not list was checked only through that index.

**Shape.** Unchanged: Summary, Scope and ownership, Conventions, Exact supplier contracts per supplier, How to read the build, Layers 0–5 and 7 with Examples and Dependencies, Downstream consumers, Worked examples, References. The AdicSpacesPartV subsection now has, per cited target group, the statement assumed and three Checks (`README.md:76–80`, `:84–88`, `:92–96`, `:100–104`, `:108–112`).

### Adversarial pass

Λ is a nonzero finite coefficient ring unless stated. Rows marked "previous report" carry the values computed in the review at c1ef9e9 for statements the diff leaves untouched; the other rows are new.

| Statement | Instances tried | Values on one side | Values on the other side | Result; change |
|---|---|---|---|---|
| RZ.0 citation (`README.md:74`) | disc; K⟨ε⟩/(ε²); origin ↪ disc | V(1)=∅, V(0)=X, V(T)={0}, dim 0<1; V(ε)=X, reduced structure Spa K, dims 0=0; image V(T)=Supp f_*O | design lines 33, 92, 149 (c),(e), 183 state the same four facts; nowhere dense: true for V(T), false for V(ε) | agree; none |
| RZ.1 citation, bounded extension (`README.md:82`) | node; punctured disc; node minus origin | normalization K⟨u⟩×K⟨v⟩, two preimages; T extends with value 0, 1/T unbounded; (0,1) bounded, no extension | design lines 260, 395, 517: finite surjective, components = images, bounded functions extend on normal X | agree; none |
| RZ.1 citation, sheaf form from RZ.4 (`README.md:82`) | U affinoid normal, f ∈ O⁺(U∖Z); disc with Z={0}, f=T | extension F ∈ O(U) with \|F\|_sup = max over Shilov points of U (design line 1101); Shilov points are weakly Shilov in U and avoid Z∩U (line 1261), so \|F(x)\|=\|f(x)\|≤1 there and F ∈ O⁺(U) | disc: Shilov point η ∉ {0}, \|T\|_sup=\|T(η)\|=1; counter-direction: 1/T has no bounded extension, so injectivity and surjectivity both need Z nowhere dense | derivation valid, Han Theorem 2.6 (line 409) as stated; none |
| RZ.2 citation (`README.md:90`) | node; ε²=0; 𝔽_p((t)) with K[u]/(uᵖ−t), p=2,3 | Jacobian (v,u) vanishes only at the origin, complement dense; empty smooth locus; regular of dimension 0 with Ω¹ of dimension 1 | design line 640 (char 0) and hypotheses line 646 (perfect K suffices): README's "records" is accurate; the imperfect Check is a negative control, not a claim on the supplier | agree; none |
| RZ.4 citation (`README.md:98`) | Gauss point; origin; Spa K | trdeg 1=dim 1, outside V(T); trdeg 0<1, rank one; trdeg 0=dim 0 | BH Definition 2.5 (line 314), Lemma 2.8 (325), Proposition 2.9 (329), Corollary 2.10 (346); design lines 1157, 1233, 1261 | agree; none |
| RZ.5 citation, surjectivity over every K (`README.md:106`) | reduced X over ℂ((t)); X=Spa K⟨ε⟩/(ε²); disc over ℚ₂ | X^sm Zariski open and dense (design line 640), π iso over X^sm so image ⊇ X^sm, image Zariski closed (line 183) hence closed, closed ⊇ dense ⇒ image = \|X\|; design line 1512 runs the same argument for L ⊇ ℚ_p only | nonreduced: X^sm=∅, the argument gives nothing, and the README instead composes with X_red→X: point → X, surjective, ε↦0; disc: π=id proper, disc not proper over K | agree; none |
| RZ.5 citation, hypotheses (`README.md:106`) | nonreduced locus nowhere dense vs. reduced; residue char 0 | design line 1468: nowhere dense nonreduced locus, char-0 K with nontrivial rank-one valuation, no residue restriction, nonproper allowed | README `:106`: same, "in particular every reduced X" | agree; none |
| Gap destinations (`README.md:118–122`, plan) | finite-branched-covers; proper-generic-smoothness | plan: RZ.1 (line 4359); "RZ.2 and RZ.4" (line 4365) | README: RZ.1 (`:118`, `:120`); RZ.2 and RZ.4 (`:118`, `:122`); slug sets 13=13 | agree; R01 closed |
| Branched-cover route uses no rigid resolution (`README.md:120`) | Han Theorem 2.10 proof | full faithfulness by Theorem 2.6 (line 409); components by Proposition 2.8 (417); chart-local principalization and Lütkebohmert extension (lines 445–499) | the README names only the scheme principalization of ResolutionOfSingularitiesCharacteristicZero §7.7, consistent with the RZ.1 destination | agree; none |
| 3.7 Lean synonym: scalar action | m=0; m=1; a=t_i, x=of(t^e) | `a • x = of (a^(p^m) * of.symm x)` by `rfl`; m=0: a^1·x = a·x | README `:779`: a^(p^m)*x, ordinary action at m=0 | agree; none |
| 3.7 Lean: τ is A-linear with the restricted action | a=t_i, e with p^m ∣ e; e with p^m ∤ e_j | τ(a•of(t^e)) = τ(of(t^{e+p^m δ_i})) = t^{e/p^m+δ_i} = t_i·τ(of(t^e)); second case 0 = t_i·0 | all-positive e with p^m ∣ e maps to all-positive e/p^m, class 0 on both sides, so τ respects the monomial relation | consistent; none |
| 3.7 Lean: adjoint through `of` | x,y = of(t^e), of(t^{e′}) | adj x y = τ(of(t^{e+e′})), bilinear in the restricted action since τ((a•x)y)=τ(a•(xy))=a τ(xy) | p=2 node, m=1: adj(x)(x)=τ(u)=u, adj(x)(y)=τ(xy)=0 (previous report) | agree; none |
| 3.7 Lean: Ext clause | `ModuleCat.of _ (monomialRootModule p n m)` | object carries `Module.compHom` action; previous computed Ext>0 = 0 at p=2 node and p=2, n=2 unchanged | one-tactic probe: `simp` no progress | not padding; none |
| `*Needs:*` 7.1–7.5 and Layer 7 Dependencies | each RZ label named | 7.1 RZ.0; 7.2, 7.3 RZ.1 + branched covers; 7.4 RZ.5, RZ.2, RZ.4, RZ.0 + generic smoothness; 7.5 RZ.5 | BH proofs cited at lines 594, 684–696, 772–787, 1102 use exactly these inputs; depcheck 0 problems | agree; none |
| Scope paragraph (`README.md:11`) | RZ.0–RZ.5 list | matches the supplier section's five citations and two gaps | design layers line 11 | agree; none |
| Conventions: shift and twist | previous report (ℙ¹_C; two points at p=2) | point class trace 1; Λ[−2] has H²=Λ | Λ[2] has H⁻²=Λ; trace (1,1)↦0, (1,0)↦1 | agree; none |
| Conventions: O_C/p versus O_C/𝔪 | previous report (ε=p^{1/2}; ℚ_p(π), π²=p, p=2,3) | ε·1≠0 in O_C/p; π̄≠0, π̄²=0 | ε·1=0 in O_C/𝔪; π↦0 in 𝔽_p | agree; none |
| 0.2 non-Noetherian base; formal ℙ¹ comparison | previous report | 𝔪_C not finitely generated (p^{1/n} escapes any finite valuation bound); H⁰=O_C,0,0; H¹=0,0,O_C | generic H⁰=C,0,0; associated sheaves match | agree; none |
| 0.3 almost upper shriek; 0.4 square-zero model | previous report | Extⁱ over O_C/p² into O_C/p = O_C/p all i; O⁺/p=O_C/p on Spf O_C[ε]/(ε²) | H¹=O_Cᵃ/p both sides; amplitude [0,0], generic fibre nonreduced | agree; none |
| 1.1 non-CM reduction; equal characteristic | previous report | x=pT socle element, depth 0; ω=𝔽₂[[t]]⟨T⟩dT in degree −1 | ω• beyond bottom degree; "mod 2" would be the unchanged ring | agree; none |
| 1.4 Hartogs; 1.5 formal trace; 1.6 generic canonical sheaf; 1.7 coherent trace | previous report | Glue_∅=C≠O_C; Tr(1,…,1)=p; s(dlog T)=generator; Tr(dlog T)=dlog S, values 1 and p | density required; mod p gives 0; dlog U=−dlog T; ramified point O_L/p nonreduced | agree; none |
| 2.1 torsion quotient; 2.3 ranks; 2.5 normalization; 2.6 mod-p trace target | previous report | 2x²=0 vs x²=0; ranks 1,1,0; jΦ⁻¹(Sch(dlog T))=dlog T; target in degree 1 | binomial(1,n); extra scalar would give a⁻¹dlog T | agree; none |
| 2.7 pseudo-finite; 2.8 pro-étale trace; 2.9 compatibility | previous report | rig-finite true,true,false; Tr(1,…,1)=0, Tr(e₁)=1; both composites (x,y)↦x+y | amplitude [0,d] for id and blow-up; rs-cover gives 1 | agree; none |
| 3.1 polystable charts; 3.2 root towers; 3.3 character multiplication | previous report | uv=0 excluded; R₁⁺/(u,v,𝔪) length 3 ≠ 2; V_χ⊗V_χ′→V₀ is multiplication by ϖ | not R⁺-flat; isomorphism only for a unit (Z Lemma 4.2.15 refuted) | agree; none |
| 3.4 character cohomology; 3.5 décalage; 3.6 projection trace | previous report | H¹=O_C/(ζ_{pᵐ}−1); η kills O_C/(ζ_p−1); tr(1)=1, tr(T^{1/pᵐ})=0 | ζ_p−1 annihilates too; algebra trace of 1 is pᵐ=0 | agree; none |
| 3.7 root duality, degenerate and p=2, p=3, n=2 cases | previous report | n=0: τ=id; p=2 node: Hom(A/(v),A)=(u), periodic resolution H^{>0}=0; p=3 block matrix [[0,u],[u,0]]; seven summands at n=2 | p=0,1 excluded by `Fact p.Prime`; Ann(VW)=(U), Ann(W)=(UV) | agree; none |
| 3.8 oriented trace; 3.9 cochain duality; 3.10 polystable duality | previous report | determinant −1 under swap; u^{1/2}·u^{1/2}=u; targets ω(−1)[−1] and ω₀(−1)[−1] | H¹=O_C/2≠O_C for ζ_p action at p=2; −χ=χ for order two | agree; none |
| 4.1–4.7 pairing, descent, quotients, invariants, equivariant pushforward, wild descent, local duality | previous report | fibre cardinalities 1,\|G\|,<\|G\|; H¹=O_C/p for C_p; (gh)⁻¹=h⁻¹g⁻¹; Tr(1,1)=0 at p=2 | Shapiro for finite G only; norm on a trivial module would be 0; t²=ϖ not nice | agree; none |
| 5.1–5.9 global trace, duality, almost detection, mod-p, local systems, finite p-power, traces, integral and rational duality | previous report | ranks (1,0,1) on ℙ¹; H²(ℙ¹,𝔽_p)=0 in equal characteristic; ℤ/pⁿ⊗^L𝔽_p has H⁻¹=𝔽_p; Hom(ℤ_p/p,ℤ_p)=0, Ext¹=ℤ_p/p; diag(1,1) rank 2 | connectedness needed for detection; equal characteristic excluded; derived Hom necessary | agree; none |
| 7.1 strata; 7.2 algebraization; 7.3 generators; 7.4 truncation bound; 7.5 field extension; 7.6 base change; 7.7 constant sheaf | previous report | {x} no finite Boolean combination of qc opens; (ℤ/n)ʳ in degree 0; Tot H⁰=Λ vs Tot₁=0 for Λ[2]; nodal curve H⁰=Λ,H¹=Λ,H²=Λ(−1); ℙ¹ with n=p²: H⁰=Λ,H²=Λ(−1); R²g_*Λ pulled back is 0 | window r≥b−k+1 with b=0 gives i+1; same after C′/C; H uncertified | agree; none |
| Contracts finite-branched-covers, proper-generic-smoothness, general-nearby-coherence, integral-toric-field-extension | previous report | disc ⊔ point over the origin excluded by nowhere density of π⁻¹(Z); S_f=D∖{a}; AC 6.13.5–6.13.6 clause by clause; BH Lemma 3.25 proof | empty Y not surjective; identity S_f=D | agree; none |

## Not verifiable

- H, Heuer, *A p-adic Simpson correspondence for smooth proper rigid varieties*, Proposition 2.18, p. 279: settled as uncertified; §7.7 is cited by locator only and was not requested again.
- AdicSpacesPartV is a board design (no folder on main, no open pull-request head); its RZ targets were read in `packages/AdicSpacesPartV/design/README.md`, the only text in which they exist. The design's own open items (G1 Bartenwerfer's original proof, G3 scheme-level functorial desingularization, G4 all-characteristic excellence) are the supplier's work and do not affect what this README assumes of it in characteristic zero.

## Source issues

- none
