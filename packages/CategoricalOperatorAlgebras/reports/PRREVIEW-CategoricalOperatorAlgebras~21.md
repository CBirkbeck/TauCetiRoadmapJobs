# Review of CategoricalOperatorAlgebras (pull request #888 at 91b6d83)

**Verdict:** needs changes

This is a full review: the folder changed by 306 lines since `0dceabc`, the head of the previous review. Nothing outside the folder changed.

- The previous review's R02, R03 and R04 are repaired. Its R01, the owner of the CA1a/CA2a objects, is not, and is raised again as R01 (P2). It needs no README edit; it needs a decision on the order against the two QuantumGroups revisions.
- R02 and R03 are new (P3), both in the text added for the native module and bimodule carriers.
- **Checks passed:**
  - The gate passes and the dependency check prints 0 problems.
  - `Suggested.lean` elaborates with no diagnostic.
  - All 15 sampled locators match their sources.
  - The adversarial pass found no false statement.

## R01 (P2) — CA1a/CA2a still have three "single home" claims, and nothing states the order

Re-raised: H01

**Location.** `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` lines 40–46: "C*-categories … (CA1a), and C*-tensor categories … unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". Downstream consumers, lines 2599–2605, repeats it.

**Claim.** This roadmap is the only owner of the CA1a/CA2a objects.

**Witness.** Both open QuantumGroups revisions claim the same objects at their current heads:

- **#1705, now at `f4ad8e4`** (it was `96014ab` at the previous review): lines 33–42, "Section 0.2 is the single home of C*-categories … the balanced unitary dual functor and signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … consume these objects"; lines 1810–1813 list this roadmap as a consumer of §0.2.
- **#1649 at `50d79b7`** (unchanged): lines 29–44, "Layer 0 … is the single home … Section 0.1 owns C*-categories … signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … consume these objects"; lines 1709–1711 repeat it.

On main (`3090489`), QuantumGroups line 42 cites "CategoricalOperatorAlgebras CA1a,CA2a" as a supplier, and TemperleyLiebOperatorAlgebras #867 (`ba43cc7`, lines 106–107 and 320–325) consumes CA1a/CA2a. So the README agrees with main and with #867, and disagrees with both revisions.

**Why the repair's answer does not settle it.** The repair report answered H01 by saying the order "is stated in the pull-request description": this pull request first, then both revisions. The description at this head does not say that. Its merge-order paragraph is still "#1142 (AlgebraicKTheory) → #866 (OperatorKTheory) → this pull request", and it names neither revision. Meanwhile #1705 has moved and kept its claim, and the two revisions still disagree with each other (§0.2 in #1705, §0.1 in #1649). QuantumGroups is not in the merge order file, so nothing mechanical decides it.

**Repair.** No README change under the order main assumes.

- **This roadmap first.** Keep the README. In the description, name #1705 and #1649 as later. Each revision then replaces its single-home sentence and consumer paragraph with citations of CA1a/CA2a:
  - #1705: lines 33–42 and 1810–1813;
  - #1649: lines 29–44 and 1709–1711.
- **A QuantumGroups revision first.** The two revisions must first agree on one section. After that revision merges, lines 40–46 here cite that section for the overlapping objects, the bullet at lines 2599–2605 is deleted, and this roadmap keeps what QuantumGroups does not build: W*-categories, the grading groupoid for a nonsimple unit, Penneys's Theorem A, and `ε=ν₂(x)`.
- **Stale description text**, still present at this head:
  - "5 admitted-target warnings" and a `Suggested.lean` "byte-exact to the previously validated public prototype". The file changed in this round, declares nothing, and elaborates with no warning.
  - Pull-request numbers ("#860", "#889", "#57") for roadmaps that are now on main.

**Tested.** Under the first option ε has one definition (line 571) and one comparison with `ν₂` (lines 576–582). For the 2-dimensional representation of Q₈, `ν₂=(2+2−6·2)/8=−1`, the sign #1649 line 245 gives the SU(2) cup. The dependency check prints 0 problems.

## R02 (P3) — CA2b takes right-module functor API "from Tau Ceti's left-linear API", but no pinned declaration carries a right-linear structure across the opposite

**Location.** `README.md` lines 773–779: "taking composition of module functors, module natural transformations and the restriction of the action … from Tau Ceti's left-linear API, through Mathlib's passage (`MonoidalLeftAction.monoidalOppositeLeftAction`) from right C-actions to left `Cᴹᵒᵖ`-actions". The *Needs:* line (811–816) and Dependencies (829–838) list the same declarations.

**Claim.** Composition of `Functor.RightLinear` functors and their module natural transformations are already supplied at the pins.

**Witness.** Mathlib's `Action/Opposites.lean` transports actions only: it contains no occurrence of "Linear". Tau Ceti `2fd255d` has no declaration named `RightLinear` at all; `Functor.LeftLinear.comp` and `NatTrans.IsLeftLinear` (`Action/LinearFunctor.lean:153`, `:172`) need `F.LeftLinear Cᴹᵒᵖ`, which nothing derives from `F.RightLinear C`.

**Repair.** State the bridge as a target of CA2b, before the sentence at lines 773–779:

- For a functor F between categories with right C-actions, construct the bijection between `F.RightLinear C` structures and `F.LeftLinear Cᴹᵒᵖ` structures for the actions of `MonoidalLeftAction.monoidalOppositeLeftAction`. The left lineator at `(mop c, d)` is the right lineator at `(d, c)`.
- Prove that it preserves unitarity of the lineators.
- Define a module natural transformation between right-linear functors as one that is `NatTrans.IsLeftLinear Cᴹᵒᵖ` for the transported structures.

Then the rest of the sentence stands.

**Tested** on the identity functor of C with `selfRightAction`. Mathlib gives `mop c ⊙ₗ d = d ⊙ᵣ c` by `rfl` (`Opposites.lean:97`), so the transported lineator is the identity, and `Functor.LeftLinear.comp` of two such structures again has identity lineator.

## R03 (P3) — The hypothesis stated for `Bimod.tensorBimod` and `Bimod.monBicategory` is weaker than the pinned one

**Location.** `README.md` lines 141–143: "both for a monoidal category with coequalizers preserved by tensoring on either side". Lines 888–890 and 897 repeat "coequalizers preserved by tensoring on either side".

**Claim.** The contract says these are "used as stated at the pin".

**Witness.** At Mathlib `1b1ccf4`, `Monoidal/Bimod.lean:30–56` and the elaborated types of both declarations require `HasCoequalizers C` and `∀ X, PreservesColimitsOfSize.{0,0} (tensorLeft X)` and the same for `tensorRight X`: every colimit of a small shape, not only coequalizers. In abelian groups with ⊕ as the tensor product, `A⊕−` preserves coequalizers but sends the empty coproduct 0 to A, so the README's hypothesis holds and the pinned instances are absent.

**Repair.** In lines 141–143 write "for a monoidal category with coequalizers in which tensoring on either side preserves small colimits (`PreservesColimitsOfSize.{0,0}`)". In lines 888–890 and 897 write "small colimits" for "coequalizers".

**Tested.** The justification already at lines 889–890 reaches the pinned hypothesis: in a rigid category tensoring on either side is a left adjoint, so it preserves all colimits. For `Hilb_fd` and `Q=M_n(ℂ)` the Check at lines 963–970 is unchanged: the coequalizer is `M_n/[M_n,M_n]≅ℂ`.

## Previous findings

- **R01 (single home of CA1a/CA2a): not repaired.** Lines 40–46 are unchanged; both revisions keep their claims; the description names neither. Raised again as R01.
- **R02 (module and bimodule carriers): repaired.**
  - "From Mathlib", lines 123–146, names `MonoidalLeftAction`, `MonoidalRightAction`, the four `Action/Opposites.lean` constructions, `Functor.LeftLinear`, `Functor.RightLinear`, `ModObj`, `CategoryTheory.Mod`, `MonObj.mopMonObj`, `Bimod`, `Bimod.tensorBimod` and `Bimod.monBicategory`. "From Tau Ceti", lines 261–272, names `TauCeti.freeMod`, `TauCeti.freeModAdjunction` and the left-linear API.
  - CA2b, lines 767–773: "a C*-category M with Mathlib's `MonoidalRightAction C M` whose action is a dagger functor in each variable".
  - CA3, lines 875–880 and 887–901: a bimodule is "a Mathlib `Bimod P Q` … satisfying in addition the Frobenius and separability equations", and the range of `p` is identified with the coequalizer of `Bimod.tensorBimod`.
  - CA4, lines 1005–1017: free right modules are `TauCeti.freeMod` for `mop A`.
  - R02 and R03 above are two residual points in this new text.
- **R03 (twist and ribbon carrier in CA6): repaired.** Lines 1192–1203: "The twist is that of Tau Ceti's balanced structure `TauCeti.balancedOfBraidedPivotal V` for the `TauCeti.PivotalCategory` structure induced by V's chosen unitary dual functor". Lines 1213–1216 define ribbon as `TauCeti.RibbonCategory`. Two new Checks (lines 1322–1336) compute the twist on sVec and on `Hilb(ℤ)`.
- **R04 (informal roadmap names): repaired.** Line 1410: "The Cuntz algebras `O_n` are OperatorAlgebraDynamics D6". Lines 1820–1821: "VonNeumannAlgebras V4.Normality's normal representation amplification".

## Verified sound

### Gate, dependency check, build and folder

- **Gate.** `gate … --base origin/main` at `91b6d83` printed `gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's run adds `build=0`.
- **Dependency check.** `gate --depcheck … --movable --content … --pr 888` printed `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 with no output. The file declares nothing, so the `#check @name` comparison and the one-tactic padding probe have no declaration to run on.
- **Pins.** The branch manifest has Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, the same as main.
- **Folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

### Headline theorems and `Suggested.lean`

The Summary and the module docstring list the same ten headline groups (CA2a, CA2b, CA3–CA10). Every headline is stated on a dagger, C*- or W*-category or on an operator-algebra carrier that neither pin has, so none is statable and none is forced through a stand-in. The carriers added to the docstring in this round (monoidal actions, `Bimod.monBicategory`, the twist, free modules) exist at the pins and make no headline statable: each still needs a dagger.

### Library declarations resolved at the pins (29)

A scratch file importing Mathlib and nine Tau Ceti modules, with one `#check @name` per declaration, elaborated each of these. Six Tau Ceti modules were first built with `lake build <module>`.

| Declaration | File and line |
|---|---|
| `MonoidalLeftAction`, `MonoidalRightAction` | `Monoidal/Action/Basic.lean:120`, `:434` |
| `selfLeftAction`, `selfRightAction` | `Monoidal/Action/Basic.lean:174`, `:485` (read in the file) |
| `MonoidalLeftAction.leftActionOfMonoidalOppositeRightAction` | `Action/Opposites.lean:45` |
| `MonoidalLeftAction.monoidalOppositeLeftAction` | `Action/Opposites.lean:70` |
| `MonoidalRightAction.rightActionOfMonoidalOppositeLeftAction` | `Action/Opposites.lean:261` |
| `MonoidalRightAction.monoidalOppositeRightAction` | `Action/Opposites.lean:284` |
| `Functor.LeftLinear`, `Functor.RightLinear` | `Action/LinearFunctor.lean:156`, `:318` |
| `ModObj`, `CategoryTheory.Mod` | `Monoidal/Mod.lean:62`, `:230` |
| `MonObj.mopMonObj` | `Monoidal/Opposite/Mon.lean:34` |
| `Bimod`, `Bimod.tensorBimod`, `Bimod.monBicategory` | `Monoidal/Bimod.lean:79`, `:342`, and the bicategory instance |
| `TauCeti.BalancedCategory` | `Monoidal/Braided/Balanced.lean:53` |
| `TauCeti.RibbonCategory` | `Monoidal/Braided/Ribbon.lean:37` |
| `TauCeti.balancedOfBraidedPivotal`, `…_twist_hom_app`, `…_twist_eq_refl` | `Monoidal/Pivotal/Balanced.lean:60`, `:85`, `:100` |
| `TauCeti.pivotalBalancedEquiv` | `Monoidal/Pivotal/OfBalanced.lean:114` |
| `TauCeti.sphericalCategory_of_ribbonCategory` | `Monoidal/Pivotal/Ribbon.lean` |
| `TauCeti.symmetricPivotalCategory` | `Monoidal/Pivotal/Symmetric.lean:59` |
| `TauCeti.drinfeldIso` | `Monoidal/Rigid/Drinfeld.lean:64` |
| `TauCeti.freeMod`, `TauCeti.freeModAdjunction` | `Monoidal/Mod/Free.lean`, `:134` |
| `Functor.LeftLinear.comp`, `NatTrans.IsLeftLinear` | Tau Ceti `Action/LinearFunctor.lean:153`, `:172` |
| `ObjectProperty.fullSubcategoryMonoidalLeftAction`, `ObjectProperty.IsStableUnderLeftAction` | Tau Ceti `Action/FullSubcategory.lean`, `:60` |

Compared with the README's descriptions:

- The pinned twist is `φ_X ≫ u_X⁻¹`, which in operator order is the README's `u_X⁻¹φ_X`.
- The pinned balancing axiom is `(θ_X⊗θ_Y) ≫ β_(X,Y) ≫ β_(Y,X)`, the README's `β_(Y,X)β_(X,Y)(θ_X⊗θ_Y)`.
- `mop X ⊗ mop Y = mop (Y ⊗ X)` (`Monoidal/Opposite.lean:244`, `:263`), so `mop A⊗mop c=mop(c⊗A)` as CA4 says.
- The directions of the four opposite constructions are as the contract states them.

### Cross-roadmap citations resolved

| Citation | Where found |
|---|---|
| PivotalSpherical Layer 10 (`BalancedCategory`, `RibbonCategory`, twist) | main, lines 562–576 |
| PivotalSpherical Layers 8 and 11 | main, lines 506 and 626 |
| OperatorKTheory K2.3, K3, K7 with 7.6 (`E_n`, `O_∞`) | #866 at `1377338`, lines 599, 701, 1496, 1903 |
| OperatorAlgebraDynamics D6 (`O_n`) | main, line 590 |
| VonNeumannAlgebras V4.Normality | main, line 1124 |

Merge-order positions: VonNeumannAlgebras 5, CStarAlgebras 7, HilbertModules 8, OperatorKTheory 9, Subfactors 208, this roadmap 229, TemperleyLiebOperatorAlgebras 245 (a consumer). QuantumGroups is not listed.

`overlaps.md` lists no other pull request changing this folder and no dropped or revision-only id; the citation resolver lists nothing missing.

### Duplication and ownership

`roadmaps grep` over main and every open pull request for: anchored planar, Q-system, Cuntz–Pimsner, bicommutant category, unitary dual functor, tube algebra and right module C*-category.

- Only QuantumGroups #1705 and #1649 own the same objects (R01); #867 and QuantumGroups on main consume them.
- The other hits name different objects: "q-system" in HabiroNahmSeries, "Q-system envelope" in RefinedTraceMethods, "tube algebras" of rings in ArcTopologyAndDescent.

### Seeded sample (15 targets, seed `PRREVIEW-CategoricalOperatorAlgebras~21`, drawn from 130 page locators)

| README line: claim | Source line, page | Agrees |
|---|---|---|
| 737: Penneys Theorem C (p. 4) | `Penneys2018` 165–186, p. 4 | yes: triples `(C,∨,X)`, `1=1₊⊕1₋`, `X=1₊⊗X⊗1₋` |
| 1020: JP *Operator* Theorem 3.8 (p. 22) | `JonesPenneys2017Operator` 976–986, p. 22 | yes; free right modules `c⊗A` at 983–985 |
| 1024: Theorem 3.24 (p. 29), W* case | `JonesPenneys2017Operator` 1343–1345, p. 29 | yes |
| 1192: HPT *Anchored* Definition 4.2 (pp. 29–30), equation (24) | `HPT2023Anchored` 1291–1299, p. 29; twist law 1324–1329, p. 30; unitary form 1352–1361, p. 30 | yes |
| 1637: HP II Remark 4.18 (p. 16) | `HartglassPenneys2014II` 649–652, p. 16 | yes: `A_(k,±)∼A_(k+1,∓)` |
| 1654: Theorem C (p. 3), Corollary 5.18 (p. 25) | `HartglassPenneys2014II` 98–100, p. 3; 1135, p. 25 | yes |
| 1761: HNP Theorem A (p. 2), Theorem 7.4 (p. 38) | `HNP2024` 37–41, p. 2; 1540–1547, p. 38 | yes; 7.4 uses `A-Mod`, left modules, as the README says |
| 1979: JP *Realizations* Definition 3.3(1) (p. 15) | `JonesPenneys2017Realizations` 668–673, p. 15 | yes: `⟨M,N⟩=J_φN′J_φ` |
| 2063: Izumi 2003 Theorem 2.4 (p. 5) | `Izumi2003` 208–212, p. 5 | yes: type III, `d(ρ)^(it)[Dφ·φ_ρ:Dφ]_t` |
| 2101: MT 2009 Definition 4.1 (p. 30) | `MasudaTomatsu2008` 1364–1365, p. 30 | yes |
| 2128: MT 2007 Definition 8.1(4) (p. 64), Lemma 8.3 (p. 65) | `MasudaTomatsu2007` 3030–3036, p. 64; 3071–3072, p. 65 | yes |
| 2148: MT 2009, II∞ step (p. 35) | `MasudaTomatsu2008` 1543–1552, p. 35 | yes: flip approximately inner, `[ρ⊗ρ̄]≻[id⊗id]` |
| 2166: MT 2009 Theorem 4.18 (p. 37) | `MasudaTomatsu2008` 1656–1663, pp. 37–38 | yes: hyperfinite III₁, (1)⇔(3) |
| 2206: Tomatsu Theorem D (p. 2) | `Tomatsu2018` 75–80, p. 2 | yes; the state on `Z(M)` is automatic for a factor |
| 2507: HPT *Classification* Conjecture 1.1 (p. 2), §4 (p. 16) | `HPT2023Classification` 63–65 and 84, p. 2; contents line 29 | yes: true for `B=C′` |

### Adversarial table

Values computed by hand in this review.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| CA6 twist: HPT (24) equals the pinned `u⁻¹φ` | general braided rigid V; w = the map `v∨∨→v` of (24) | `w∘u=(1⊗ev_v)β_(v,v⊗v∨)(1⊗coev_v)` by naturality and the hexagon, `=(1⊗ev_v)(coev_v⊗1)=id_v`; so `w=u⁻¹` and `θ=u⁻¹φ` | sound |
| CA6 Check: sVec | `β_(f,f)=−flip`, `coev†coev=1` | `θ_f=−1`; dual of −1 is −1, so ribbon; symmetric instance: `φ=u`, twist `id`, `dim f=−1` | sound; the two pivotal structures give different twists |
| CA6 Check: `Hilb(ℤ)`, coevaluation norm `sⁿ` | s=2, n=1 | `θ_(δ₁)=4`, `θ_(δ₋₁)=1/4`, dual of `θ_(δ₁)` is 4; dims 4 and 1/4 | sound: not unitary, not ribbon, not spherical |
| CA2a braided sign law, trivial twist | `Hilb_fd` with flip; sVec | `Hilb_fd`: `θ=id`, `(J⊗J)²=(−1)(−1)=+1`; sVec: `θ_f=−1`, so the hypothesis excludes it | sound |
| CA2a `ε=ν₂(x)` | Q₈ and S₃ 2-dimensional irreducibles; ℂ² | Q₈: `(2+2−12)/8=−1`; S₃: `(2+6−2)/6=+1`; ℂ²: both signs occur, `tr(flip)=2` | sound; simplicity is needed and stated |
| CA2b Penneys Theorem C (sample; headline) | `u₁—w—u₂`; TL Gram matrix | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ`; `det=δ²(δ²−1)`, 2 at δ=√2 | sound |
| R02: CA2b module functors | identity functor, `selfRightAction` | `mop c ⊙ₗ d=d ⊙ᵣ c`; transported lineator `id`; composite lineator `id` | bridge consistent but not at the pins (R02) |
| CA3 normalisations (headline) | `Q=M_n(ℂ)`, `⟨x,y⟩=n⁻¹Tr(x*y)` | `i†i=1`; `mm†(z)=Σ_j Σ_(i,l) z_il·n·e_il=n²z`; `m′=n⁻¹m` gives 1, `i′†i′=n²`; `d_Q⁻¹` rescale gives `n⁻²` | sound |
| CA3 new Check: range of `p` vs `Bimod.tensorBimod` | rows ⊗ columns over `M_n`; `Q=1` | `(xq)⊗y↦(yx)q`, `x⊗(qy)↦q(yx)`; quotient `M_n/[M_n,M_n]`, dim 1; `Q=1`: dim `n²` on both sides | sound |
| R03: hypothesis of `Bimod.monBicategory` | (Ab, ⊕); `Hilb_fd` | `A⊕−` preserves coequalizers, sends 0 to A; rigid: left adjoint, all colimits | README hypothesis weaker than the pin (R03) |
| CA4 free modules (sample 3.8, 3.24) | `mop A⊗mop c` | `=mop(c⊗A)`; `freeMod` sends X to `A⊗X`; Hom in `Cᴹᵒᵖ` unreversed, so `Mod` over `mop A` is right A-modules | sound |
| CA4 CP and Stinespring (headline) | transpose on `M₂`; normalized trace | flip has eigenvalue −1; `K=M₂`, dim 4; density `½·1` has rank 2 | sound |
| CA5 (headline; sample JP 3.3) | `N⊆N⋊ℤ/2`; `N⊆N⋊ℤ` | `d_Q=2`; infinite index, connected, not compact | sound |
| CA7 Katsura 8.6 (headline) | `ℂⁿ` over ℂ | `1−n` on ℤ: `K₀=ℤ/(n−1)`, `K₁=0`; n=1: `K₀=K₁=ℤ` | sound |
| CA7 weights (headline) | μ(v)=16, μ(w)=1 | a=2: `a²μ(w)=4=a⁻²μ(v)`; a=1/2: 1/4 and 64 | sound |
| CA8 ordered K₀, scale (sample; headline) | TL(√2), `A₃` dims `(1,√2,1)` | `τ_*([p_(f₁)]−[p_(f₀)])=√2−1≈0.414∈(0,1)`; `τ_*([p_(f₀)]−[p_(f₂)])=0` | sound |
| CA8 Watatani index, `N(δ²)` | `E(a,b)=(a+2b)/3`; δ²=2, 2.618, 3, 4 | `E(3x₁e₁)=x₁`, `E((3/2)x₂e₂)=x₂`; `Ind=(3,3/2)`; N=3, 3, 4, 5 | sound |
| CA9 HNP Theorem A, transpose (sample; headline) | `F(c₁,c₂)=(0,c₁)`, `c=(ℂ²,ℂ)`, `d=(ℂ,ℂ³)` | `⟨F(c),d⟩=HS(c₁,d₂)`, dim 6; `F^t(d)=(d₂,0)`, dim 6; `F^t=F` gives 1 | sound |
| CA9 canonical extension (sample Izumi 2.4) | II∞ amplification, n=2, t=1 | `ρ̌` phase `2^(−i)=0.769−0.639i`; `ρ̃` phase `2^(i)·2^(−i)=1` | sound |
| CA9 basic extension (sample JP 3.3, Kosaki) | `σ=id⊕id`; weights 1/5, 4/5 | `Ind=4`, `E₁(e)=1/4`; `Ind(E)=5+5/4=25/4`, `E₁(e_E)=4/25` | sound |
| CA9 central triviality (samples MT 4.1, 8.1(4), 8.3, p. 35, 4.18) | `ρ=id`; `R_λ`, `t₀=π/|log λ|`; `L(F₂)⊗̄B(ℓ²)` swap | `a=1` satisfies `ax=ρ^ω(x)a`; `λ^(it₀)=e^(−iπ)=−1`, `t₀` is half the generator of `T(R_λ)`; `M_ω=ℂ` so `a=1` works | sound |
| CA9 Tomatsu Theorem D (sample; headline) | Følner with `K=Irr(C)` | every simple Z lies in `X⊗(X̄⊗Z)`, so `F·K=K` and the symmetric difference is 0 | sound |
| CA10 (sample Conjecture 1.1; headline) | `Hilb(ℤ/2)`, `Hilb(S₃)`; `r=±id` | tube dims 4 and 36; `1+1+4+9+9+4+4+4=36`; `(−i)(−i)r=−r` | sound |

## Not verifiable

- **Kosaki 1986 §3 Lemma 3.2, Popa 1995 Theorem 3.5(ii) and Corollary 4.4, and Izumi 1993 Theorem 3.5.** The manifest records these as `uncertified`. The README cites them through secondary statements that were read: Burns Proposition 2.1.21, and Masuda–Tomatsu 2009 Theorems 4.18 and 4.16 (`MasudaTomatsu2008` 1656–1663 for 4.18).
- **Journal pagination.** Page numbers were compared with the linked arXiv versions, which the References say are the ones cited.

## Source issues

- none
