# Review of GrothendieckTeichmuller (pull request #1058 at 439778a)

**Verdict:** accepted

🤖 Independent AI review. Incremental re-review of 0 changed lines since cccfcd9. The head is a merge of main into the branch: the roadmap folder is byte-identical to the one r10 accepted, and the only effective change is the pins the merge brought in (Mathlib f6090c70 → 1b1ccf4b, Tau Ceti 358314d4 → 2fd255d9, toolchain v4.35.0-rc3 → v4.36.0-rc2). Everything below is the re-check of the folder against those pins. No finding, new or carried, remains; this folder is ready for a human's final approval.

## Previous findings

- none to carry: the previous report ([r10](PRREVIEW-GrothendieckTeichmuller~10.md)) accepted with no finding of its own. Its one carried item, R01 of r9 (the coefficient-algebra exclusion at `TauCetiRoadmap/GrothendieckTeichmuller/README.md:60–62`, "so over `ℚ` the element `(−1, 1)` is not in it"), stays repaired: the passage is unchanged at this head.

## Verified sound

**Scope of the change.** `git diff --stat origin/main...HEAD` restricted to everything outside `TauCetiRoadmap/GrothendieckTeichmuller/` is empty; inside the folder the pull request adds README.md (715 lines), Suggested.lean (290 lines) and metadata.toml (1 line), exactly as at cccfcd9. The worktree is clean at 439778af246085abea5f2edae52c1d8c1c3cd9fb. No pull-request file was edited. The long list of files the change summary names outside the folder is main's own history between the two heads (the merge), not edits of this pull request.

**Gate, dependency order, build.** The worker's gate at this head passes every check including build=0. My rerun:

~~~text
gate GrothendieckTeichmuller: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 240 roadmaps, 2350 edges, 0 problem(s)
~~~

(The rerun, as in r10, prints no build field, so I built the module separately.) `lake build TauCetiRoadmap.GrothendieckTeichmuller.Suggested` at the new pins: exit 0, "Build completed successfully (18406 jobs)", with exactly 15 warnings, all `declaration uses sorry`, at the 15 sorried theorems (lines 102, 106, 110, 114, 118, 134, 171, 205, 209, 223, 246, 254, 276, 281, 287). The depcheck shows no UPWARD, CYCLE or moved line for this roadmap. The candidate order places InverseGaloisAndArithmeticFundamentalGroups at 44, PeriodsAndSpecialValues at 304 and this roadmap at 383; both are cited only as scope deferrals and downstream context, never on a `*Needs:*` line, and `## Exact supplier contracts` still ends with "Nothing is consumed from another roadmap."

**Signatures at the new pins.** A scratch copy of Suggested.lean with `#check @name` appended for all 43 declarations elaborated under `lake env lean` with the same 15 `sorry` warnings and no other warning or error from the roadmap's own declarations. All 43 elaborated types equal the worker's signature record after whitespace normalisation (the record writes `TauCeti.zHat`, `TauCeti.ContinuousAut`, `TauCeti.ContinuousOut.mk` where my probe, under `open TauCeti`, prints the short names: same constants). No section binder is lost: `subst` carries its six instance binders explicitly, `eq_of_beta_eq` its `IsUnit p.lam` and two membership hypotheses, `isUnit_iff_bijective_beta` quantifies over `↥gtMonoid`. The file is already in the module-system form the new toolchain expects (`module`, `public import`, `public section`), which is why the merge needed no edit.

**Headlines.** Unchanged: all eight headlines of the README's Summary are stated, `eq_of_beta_eq` (1.4), `closure_artin` (2.2), `isUnit_iff_bijective_beta` (3.3), `isGT0_iff` (3.4), `GTHat.isGT0` (4.1), `GTHat.injective_mk_betaEquiv` (4.2), `isClosed_setOf_isGT` and `GTHat.isClosedEmbedding_betaEquiv` (4.5); the docstring names 3.5 (five-term form) as kept in the README, and explains the seven auxiliary sorried theorems as what the `Monoid Param` instance, `gtMonoid` and `GTHat.betaEquiv` rest on. The padding assessment of r9/r10 carries forward: no statement changed, so no new one-tactic probe was needed.

**Supplier declarations at Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b.** Every declaration the README's `## Exact supplier contracts` names was resolved at the new pins, 49 names in all: 46 by `#check` in the probe (the roadmap's own imports suffice for them), 3 by file and line because Suggested.lean does not import their modules.

| Declaration (README line) | File and line at the pin | What it provides |
|---|---|---|
| `TauCeti.freeProfiniteGroup`, `.of`, `.lift`, `.lift_of`, `.lift_unique`, `.hom_ext`, `.comp_lift`, `.map`, `.existsUnique_continuousMulEquiv`, `.dense_closure_range_of` (:150–154, :216–218) | `TauCeti/Topology/Algebra/Group/Profinite/Free/Basic.lean`:74, 124, 129, 134, 108, 146, 166, 206, 94 | free profinite group, universal property, density of the generators |
| `TauCeti.zHat`, `zHat.lift`; `zpowHat`, `zpowHat_mul`, `map_zpowHat`, `conj_zpowHat`, `zpowHat_intCast`, `continuous_zpowHat` (:155–160) | `…/Profinite/ZHat/Pow.lean`:142, 157, 173, 106, 223 (`zpowHat_def` at 91 ties `^ᶻ` to `zHat.lift`) | profinite powers and their calculus |
| `zHat.isUnit_iff_component`, `zHat.unitsEquivPiPadicInt` (:157) | `…/Profinite/ZHat/Units.lean`:51, 79, in `namespace TauCeti.zHat` (lines 44–46) | unit criterion, `ẑˣ ≃ ∏ ℤ_ℓˣ` (located by file; module not imported by Suggested.lean, nor needed there) |
| `ContinuousAut`, `ContinuousAut.conj`, `ContinuousOut`, `ContinuousOut.mk` (:161–163) | `…/ContinuousAut/Basic.lean`:83, 183, 311, 319 | automorphism group, inner automorphisms, outer quotient |
| `ContinuousAut.congruenceTopology`, `ContinuousAut.t2Space` (:163–166) | `…/ContinuousAut/Congruence.lean`:81 (instance), 286 (theorem, hypothesis `IsTopologicallyFinitelyGenerated G`) | congruence topology, Hausdorffness |
| `ContinuousAut.compactSpace` (:166) | `…/ContinuousAut/Profinite.lean`:220 (theorem, hypothesis `IsTopologicallyFinitelyGenerated G`) | compactness; located by file (module not imported by Suggested.lean). The README names no file for it, so nothing drifts |
| `IsTopologicallyFinitelyGenerated`, `IsTopologicallyFinitelyGenerated.bijective_of_surjective` (:167–172) | `…/Group/Generation.lean`:73; `…/Profinite/Hopfian.lean`:87 (hypotheses `hG`, `Continuous f`, `Surjective f`) | the Hopf input of 3.3, with exactly the hypothesis the README says it takes |
| `BraidGroup`, `sigma`, `lift`, `permHom`, `permHom_surjective`, `pureSubgroup`, `sigma_sq_mem_pureSubgroup` (:173–175) | `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean`:99, 106, 358, 366, 504, 528; `(pureSubgroup n).Normal` instance at 509 | the carriers of Layer 2; the normality instance is what `a13`, `a24`, `a14` use |
| Mathlib `ProfiniteGrp.ProfiniteCompletion.completion`, `.eta`, `.lift`, `.denseRange`; `commutator`, `Subgroup.topologicalClosure`, `Subgroup.closure`, `Subgroup.center`, `Subgroup.normalClosure`, `ContinuousMonoidHom`, `ContinuousMulEquiv`, `Units.instTopologicalSpaceUnits`, `TopologicalSpace.induced`, `Topology.IsClosedEmbedding` (:140–146) | all printed by `#check` at Mathlib 1b1ccf4b | profinite completion, closures, units topology, closed embeddings |

The README cites files, never pin hashes, so no pin claim went stale. The one declaration that moved file between the pins, `ContinuousAut.compactSpace` (at the old pin in Congruence.lean, now in Profinite.lean), is cited without a file name.

**Ownership and duplication at the new pins.** Grep of Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b for `Grothendieck`/`Teichm`, `GTHat` and `Drinfeld`: no Grothendieck–Teichmüller group, parameter monoid, Drinfeld relation or `P̂₄` carrier exists at either pin (the Tau Ceti hits are Drinfeld level structures and Drinfeld isomorphisms of pivotal categories, unrelated). `roadmaps grep` over main eaf17b1 and the 459 open heads for "Grothendieck–Teichmüller": on main only `Completed/PeripheralActions/README.md:576, :645` (which says the GT relations are not a target there) and `TauCetiRoadmap/BelyiMaps/README.md:4714` (an exclusion); among open pull requests only #767 BelyiMaps and #1791, both mentioning the theory as out of scope. `roadmaps overlaps GrothendieckTeichmuller` rerun against the same index: no other pull request changes this roadmap, no cited id dropped, no id defined only by an open revision; closest in vocabulary are ProfiniteArithmetic (#775) and ProfiniteProPGroups (#1187, #618), the completed suppliers whose carriers this roadmap consumes by name. This roadmap remains the sole owner of `GT̂`, `GT̂₀`, `GT̂^{mon}`, `Param`/`β`, the six `x_{ij}` and relations (I)–(III).

**Cross-roadmap citations, resolved now.** The resolver reports none missing; I reopened each:

| Owner and version | File and line | Content resolved |
|---|---|---|
| BelyiMaps, main eaf17b1 | `TauCetiRoadmap/BelyiMaps/README.md:76, :213, :228, :285` | Layers 12–14 deferred to the successor `BelyiArithmeticActions`, as README:54 and :661 say |
| InverseGaloisAndArithmeticFundamentalGroups, open head a5186ac (#850) | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:990` (IG.1.2 Tame quotients and tangential fibres), `:5317` (IG.5.1 Configuration spaces) | the two sections README:55 and :664–666 name, present with those ids; merge position 44 < 383 |
| PeriodsAndSpecialValues, open head (#1496) | `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:2189, :2210, :2230, :2504` | PS.9.8 mixed Tate motives over ℤ, PS.9.9 the motivic Galois group, PS.9.10 the motivic path torsor, PS.9.22 the motivic Hoffman basis, as README:63–64 says (lines moved since r10; ids unchanged); merge position 304 < 383 |
| ProfiniteArithmetic, ProfiniteProPGroups, main | `Completed/ProfiniteArithmetic/README.md`, `Completed/ProfiniteProPGroups/README.md` exist in the worktree; the relative links at README:43 resolve | the completed suppliers of `ẑ` and `F̂₂` |

The three Lean-name leads the worker listed (`GTHat.isGT0`, `GTHat.injective_mk_betaEquiv`, `GTHat.isClosedEmbedding_betaEquiv`, README:559, :573, :632) are this roadmap's own declarations at `TauCetiRoadmap/GrothendieckTeichmuller/Suggested.lean:254, :276, :287`, all printed by the probe.

**Seeded sample.** All 15 targets requested (0.1, 0.3, 0.4, 1.1, 1.3, 1.4, 1.5, 2.1, 2.2, 2.3, 3.1, 3.2, 3.3, 4.3, 4.4) are present with those ids at README:195, :255, :268, :298, :330, :343, :360, :388, :403, :411, :453, :468, :490, :587, :606 and are byte-identical to the text r9 and r10 audited against the sources; no locator is flagged unverified. Their source audits and computed values carry forward below, each citing the previous report. Nothing in the sample touches a passage that changed, because none did.

**Adversarial table: statements affected by the pin move.** These rows have values computed at this head.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Suggested.lean elaborates at the new pins | `lake build` of the module; `lake env lean` of the probe copy | 18406 jobs, exit 0; warnings 15 = sorried theorems 15; non-sorry warnings 0; errors from roadmap declarations 0 | builds | none |
| 43 declared types equal the README's generality | `#check @name` × 43 against signatures.md | equal 43/43 after whitespace and namespace-display normalisation; dropped binders 0 | unchanged signatures | none |
| Supplier declarations exist at Tau Ceti 2fd255d9 / Mathlib 1b1ccf4b | 49 names of README:140–175 | printed by `#check` 46; located by file and line 3 (`zHat.isUnit_iff_component` Units.lean:51, `zHat.unitsEquivPiPadicInt` Units.lean:79, `ContinuousAut.compactSpace` Profinite.lean:220); missing 0 | no supplier drift | none |
| Hopf input of 3.3 has the hypothesis README:169–172 states | `bijective_of_surjective` at Hopfian.lean:87 | hypotheses: `IsTopologicallyFinitelyGenerated G`, `Continuous f`, `Surjective f`; conclusion `Bijective f`; the README supplies finite generation from target 0.1 | matches | none |
| `t2Space`/`compactSpace` need finite generation (README:164–166, :646) | Congruence.lean:286, Profinite.lean:220 | both take `hG : IsTopologicallyFinitelyGenerated G` under `[CompactSpace G] [TotallyDisconnectedSpace G]` (variable lines 193 and 60) | the README's "for `G` profinite and topologically finitely generated" is exactly their context | none |
| Merge order and direction | depcheck with `--movable` | 240 roadmaps, 2350 edges, 0 problems; UPWARD 0, CYCLE 0, moved 0; this roadmap at 383 | no upward or cyclic edge | none |
| Nothing outside the folder | `git diff --stat origin/main...HEAD` without the folder | 0 files | the merge commit carries main only | none |

**Adversarial table: unchanged statements, carried from r10.** The folder is unchanged, so the following rows are those of [r10](PRREVIEW-GrothendieckTeichmuller~10.md) (which itself carries r9 and earlier), with their computed values; they are not new computations.

| Statement | Instances tried | Values computed on each side | Result and provenance | Change |
|---|---|---|---|---|
| README:60–61, exclusion over ℚ | c=(−1,1), identity (1,1) | exponents −1 and 1; difference −2≠0; degree-one actions at t=1 give −1 and 1 | c fails the exponent-one condition; carried from r10 | none |
| README:57–61, arbitrary coefficient algebra retained | zero ℚ-algebra PUnit | −1=1=0; c=(1,1); both actions on the zero module give 0 | identity remains allowed, exclusion not asserted there; carried from r10 | none |
| README:59–60, fixed-crossing condition | identity and inversion over ℚ | log(σ²) maps to t versus −t; coefficients 1 versus −1 | condition rejects the larger group; carried from r10 | none |
| README:61–62, normalised relations | Σ=1 over ℚ and the zero algebra | pentagon 1·1·1=1·1=1; hexagon σ₂σ₁=1·σ₂·1·σ₁·1 | consistent; carried from r10 | none |
| README:670–671, unit exponent does not imply bijectivity | λ=1, f=[y,x], x=(12), y=(13) | f=(132); qβ(x)=qβ(y)=(12); image orders 2 for qβ and 6 for q | correct assertion; carried from r10/r9 | none |
| README:671–675, restriction to (I)–(III) | same parameter, m=0, z=(123) | (I) gives (123)(132)=1; (II) gives [x,z][z,y][y,x]=(132)≠1 | counterexample lies outside the open question; carried from r10/r9 | none |
| §§1.3, 3.2–3.3 | bad parameter, identity, c | bad quotient image order 2; identity fixes x,y; β_c²(x)=x, β_c²(y)=y, c²=(1,1) | bijectivity/units conditions necessary; carried from r10/r9 | none |
| negative control on abelian quotients | cyclic and trivial quotients | f=[y,x]↦1; β maps x↦x, y↦y; on the trivial group 1=1 | abelian tests alone miss the failure; carried from r10/r9 | none |
| §4.4 finite quotients | surjections F̂₂→𝔖₃, c action | 18 generating pairs; inversion fixes 6, permutes 12 in 6 two-cycles | computed, no classification inferred; carried from r10/r9 | none |
| §4.5 closed embedding and outer embedding | units and characteristic finite quotients | units embed as uv=vu=1; finite action determined by λ mod exp(F̂₂/N), f mod N; compact domain, Hausdorff target, injective map | carried from r10/r9/r7/r5 | none |
| Conventions; §§0.1, 1.3, 3.2–3.3, 4.3, 4.5; §2.4 Check 3 | noncommuting parameters; rank one; dihedral tests | products (−1,x⁻¹) versus (−1,x); rank-one centraliser is the whole group; (II) at f=1 gives r^(−m) or r^(−m−1), forcing λ=±1 | carried from r10/r9/r7/r3 | none |
| subst; §§0.2–0.4, 1.1–1.2, 1.4–1.5, 2.1–2.4, 3.1–3.5, 4.1–4.2, 4.4 | generators, commutators, parameter inverse, outer equality | 1(a,b)=1, x(a,b)=a, y(a,b)=b; [(12),(23)]=(132); δ²(x)=yxy⁻¹; inverse-parameter products (1,1); outer equality forces abelianised exponents a=b=0 | carried from r10/r9/r7/r2 | none |
| §0.1 | rank 1 and 2 | rank 1: C(g)=ẑ, coordinate retraction π_i(lift(a))=a; rank 2: xy fails to centralise y in 𝔖₃ | carried from r10/r9 | none |
| §0.2 | f=1,x,y,z | substitution yields 1, a, b, (ab)⁻¹ | carried from r10/r9 | none |
| §0.4 | x, y | θ²=id; ω: x→y→z→x; δ²(x)=yxy⁻¹, δ²(y)=y | carried from r10/r9 | none |
| §1.2 | p=(λ,f), q=(μ,g) | both compositions send x→x^(λμ), y→(fβ_p(g))⁻¹y^(λμ)(fβ_p(g)) | carried from r10/r9 | none |
| §§1.3–1.4 | λ=0; omit commutator membership | β_{0,1}=β_{0,[x,y]}=1 while [x,y]→(132)≠1; β_{λ,f}=β_{λ,y^cf} but y^cf abelianises to (0,c) | carried from r10/r9 | none |
| §§2.2–2.3 | six Artin words; linking-coordinate quotient | squares and conjugates have permutation 1; coordinate 13 maps x₁₃→1 in ℤ/2, adjacent generators to 0 | carried from r10/r9 | none |
| §2.4 | f=1; abelianised exponent sums (a,b) | 1=1; coordinates 12, 34 give (a,b)=(2a,2b), forcing a=b=0 | carried from r10/r9 | none |
| §§3.2, 3.4 | c=(−1,1) | β_cθ=θβ_c; β_cδ(x)=xy, δβ_c(x)=yx=y(xy)y⁻¹; (I),(II) hold with m=−1 | carried from r10/r9 | none |
| §3.3 | bijective β_{λ,f} | inverse parameter (λ⁻¹,β⁻¹(f)⁻¹); product second coordinates ff⁻¹=1 and β⁻¹(f)⁻¹β⁻¹(f)=1 | carried from r10/r9 | none |
| §4.1 | 1, c, pq | character 1, −1, λμ; c²=1; mod 3, χ(c)=2≠1 | carried from r10/r9 | none |
| §4.2 | inner equality; excluded (1,x) | equality forces λ=μ, conjugator exponents a=b=0; β_{1,x}=conj(x⁻¹), but x∉F̂₂' | carried from r10/r9 | none |
| §4.3 | (±1,1); dihedral quotients | (II): m=0 gives 1; m=−1 gives (xyz)⁻¹=1; dihedral tests force m=0 or −1 | carried from r10/r9 | none |
| §4.4 | p, q, φ | p·(q·φ)=φ∘β_q⁻¹∘β_p⁻¹=φ∘β_{pq}⁻¹; x maps to a^(λ⁻¹) | carried from r10/r9 | none |
| §4.5 | unit-exponent slice f=1; inverse pairs | intersection with GT̂^{mon} is {(1,1),(−1,1)}; units image is uv=vu=1, closed in the compact product | carried from r10/r9 | none |
| §4.5 sources | ihara91 §3.3; harbaterschneps00 §0; schneps97 §1.3(3) | parameters recovered from generator images; group recovered as inverse limit of finite images | carried from r10/r9 | none |
| Scope: motivic ownership | four PeriodsAndSpecialValues targets | ids PS.9.8–9.10, 9.22 present at the open head (now lines 2189–2504); merge positions 304<383 | carried from r10, re-resolved here | none |
| Scope: Brown and HLS | weights 5–7; λ=±1; four surfaces | basis counts 2,2,3; c∉GT̂¹ since −1≠1; modular dimensions 1,1,2,2; Γ₀³≅ℤ³ with trivial action | carried from r10/r9 | none |

## Not verifiable

- The source-version limitations recorded by r9 and r10 (Hatcher–Lochak–Schneps, Brown 2012, Grothendieck's French text, Bar-Natan's journal pagination; Ribes–Zalesskii §9.1 cited by its settled paywalled locator with the Herfort–Ribes substitute; Ihara 1994, Belyi 1979 and Montpellier folder 145) are inherited unchanged: no source passage is cited differently at this head, and no settled source request was reopened. No text was fetched in this round.
- The openness of the relation-constrained invertibility question and of the nonabelian finite-quotient classification (README:668–675) is cited to Lochak–Schneps 2006 and was not re-established here.
- Ownership against open pull requests was checked through the indexed heads (`roadmaps grep`, `roadmaps overlaps`) and the sibling checkouts this brief lists; open work without readable files was not checked.

## Source issues

- none
