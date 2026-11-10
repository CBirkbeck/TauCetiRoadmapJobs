# Review of SpinGeometry (pull request #1674 at 3e31368)

**Verdict:** needs changes

This is a full AI re-review of `TauCetiRoadmap/SpinGeometry/` at 3e31368. Since c708ec0, the head that review ~27 read, the folder has changed by 4344 lines. The head merges the other open SpinGeometry revision (#1780, head 4e5e6a06) into this branch. The AI does not approve or merge.

- The gate passes on this head. The dependency check reports 0 problems. `Suggested.lean` elaborates with `sorry` as its only warning.
- The mathematics checks out. The headline, the `SpinStructure` definition and every Check I recomputed are correct, and no locator in the 15-target source sample is false.
- Four P3 findings remain, none blocking. Three of them come from the merge: it put back declarations, citations and a README layout that earlier repair rounds of this branch had removed.

## Previous findings

Review ~27 (at c708ec0) raised no findings and marked nothing "not actionable", so nothing is re-raised. The merge touches the three findings of review ~26 that c708ec0 repaired:

- ~26 R01 (cite the pinned Levi-Civita and curvature declarations, not HopfRinow L1 or RiemannianGeometry R5): **partly undone.**
  - The pinned declarations are still listed (`README.md:207–238`).
  - "HopfRinow L1" is back at `:320`, `:1213`, `:1243`, `:1728`, `:2056` and `:2184`, and "RiemannianGeometry R1,R5,R7" at `:325`, with R5 used at `:2186`. This is R03 below.
- ~26 R02 (G2.3 and G5.2 locators): **still repaired.** `:1082–1087` reads "Nicolaescu, Definition 2.2.42, p. 58, … p. 633 … Lawson–Michelsohn, Chapter I, §1, and Atiyah–Bott–Shapiro, §1 … Chapter I, §5". `:1751–1756` is unchanged.
- ~26 R03 (squared norms): **still repaired.** `:633–636` reads "its squared H-norm; the antisymmetrized tensor w₁⊗w₂−w₂⊗w₁ has squared norm 2 and its half 1/2".

## R01 (P3) — Five pointwise declarations re-imported into `Suggested.lean` are padding

**Location.**
- `Suggested.lean:68–131`: `cliffordMultiplication`, `IsGeometricAction`, `cliffordMultiplication_anticommutator`, `diracInFrame` and `diracInFrame_eq`, with the docstring sentence at `:13–16`.
- In the README, the backticked names at `:608–612`, `:621`, `:917`, `:921`, `:944`, `:1183`, `:2009`, `:2011`, `:2065` and `:2074`.

**Claim.** These are not headline theorems. The module docstring's own rule (`:32–37`) says that pointwise lemmas on pinned carriers are README targets and are not stated in the file.
- `cliffordMultiplication_anticommutator` follows in one tactic from the library.
- `diracInFrame_eq` concerns an arbitrary family `c` and an arbitrary `conn`, with no Clifford hypothesis (its docstring says it is "algebraic"). Its conclusion is linear algebra on its inputs.
- Once these two go, nothing needs the three definitions.
- This branch had deleted the same five declarations in an earlier repair round (a04aefaa). The merge of 4e5e6a06 brought them back.

**Witness.** I tested both theorems on a scratch copy elaborated at the pins.
- The anticommutator closes with one call: `simp [cliffordMultiplication, ← map_mul, ← map_add, CliffordAlgebra.ι_mul_ι_add_swap, QuadraticMap.polar, h.1, Algebra.algebraMap_eq_smul_one, norm_add_sq_real, ← neg_smul, neg_add, add_assoc, mul_comm]`.
- `diracInFrame_eq` takes nine lines. Both sides equal `TensorProduct.lift B` of Mathlib's `InnerProductSpace.canonicalCovariantTensor` (`Analysis/InnerProductSpace/CanonicalTensor.lean:41,45`).

**Repair.**
1. Delete the five declarations, their two `section`s and the matching clauses of the module docstring from `Suggested.lean`. The file then keeps `SpinStructure` and `nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul`, which is the file that c708ec0 had.
2. In the README, keep G1.2's geometric convention, G2.1's skew-Hermitian comparison and G6.1's frame independence as prose targets. Write their names without backticks, for example "the geometric-action predicate" and "the frame contraction Σ_j c(e_j)∇_(e_j)s".
3. Remove the Lean names from the Checks at `:621`, `:944`, `:2065` and `:2074`.

After this repair the gate's own-name check passes, because no backticked name of this roadmap is left undeclared. The same deletion is due in the other open SpinGeometry revision; its own review covers that head.

## R02 (P3) — The README has reverted to the older layout

**Location.**
- `README.md:1` "# Clifford bundles, spin structures, and Dirac geometry".
- `:10` "## Scope, conventions and suppliers".
- `:463` "## G1. Negative-metric Clifford modules and their positive metrics", and so on through `:1821`.
- `:2310` "## Dependency order and references".

**Claim.** The merge took over the layout of the other revision. The README no longer has:
- the `# Roadmap:` title and the `**Summary.**` paragraph;
- separate `## Scope and ownership` and `## Conventions` sections;
- `## Exact supplier contracts`, split into From Mathlib, From Tau Ceti and From each roadmap;
- `## How to read the build`;
- `## Layer k:` sections with `### k.n` subsections, each layer ending in `### Examples` and `### Dependencies`;
- `## Downstream consumers` and `## References`.

**Witness.** `git show c708ec06:TauCetiRoadmap/SpinGeometry/README.md` has all of them: `:1` "# Roadmap: clifford bundles, …", `:13` "## Scope and ownership", `:124` "## Exact supplier contracts", `:392` "## How to read the build", `:412` "## Layer 1: …", `:664`/`:669` "### Examples"/"### Dependencies", `:1944` "## Downstream consumers" and `:1962` "## References".

**Repair.**
- Re-apply c708ec0's layout to the merged content. Move the supplier paragraphs `:49–301` and `:308–394` into From Mathlib, From Tau Ceti and From the named roadmaps. Turn G1–G6 into Layers 1–6 with subsections 1.1–6.7, keeping G4.1a, G4.1b and G4.4a as subsections.
- Restore c708ec0's former-numbering table (`:403–410` there), so that anchors such as `#g1-negative-metric-clifford-modules-and-their-positive-metrics` and the G-numbered ids that other roadmaps cite still resolve.
- Give each layer `### Examples` and `### Dependencies`.
- Split `:2310–2337` into `## Downstream consumers` and `## References`.

## R03 (P3) — HopfRinow L1 and RiemannianGeometry R5 are again cited for objects that have other owners

**Location.**
- `README.md:320–322`: "HopfRinow L1 supplies the actual Levi-Civita covariant derivative, which at the pins is Mathlib's `CovariantDerivative.leviCivitaConnection`".
- *Needs:* lines at `:1213`, `:1243`, `:1728`, `:2056` and `:2184`.
- `:325` "RiemannianGeometry R1,R5,R7", and `:2186` "RiemannianGeometry R5's normal bundles".

**Claim.**
- The Levi-Civita connection is a pinned declaration, already listed at `:207–219`. HopfRinow is a completed roadmap that consumes that same declaration, so G3.3, G3.4, G5.1, G6.1 and G6.5 should cite the pin.
- G6.5 uses R5 for the sphere framing TSⁿ⊕ℝ≃Sⁿ×ℝ^(n+1) with the radial normal section. CharacteristicClasses C7.3 owns that framing, and this README already cites C7.3 for it at `:358` and in G4.4a (`:1602–1603`).
- Review ~26's R01 asked for this repair, and c708ec0 made it. At c708ec0, G6.5's *Needs:* named neither HopfRinow nor R5.

**Witness.**
- `Completed/HopfRinow/README.md:28–31,118–125` (main 71c8f21): HopfRinow consumes Mathlib's `leviCivitaConnection` and Tau Ceti's `LeviCivita/Regularity.lean`.
- `TauCetiRoadmap/CharacteristicClasses/README.md:1851–1858` (C7 item 3): "extend by the radial normal line to `TS^n⊕ε¹≅ε^(n+1)`".

**Repair.**
1. Drop the HopfRinow bullet at `:320–324`, keeping the sentence that names the pinned curvature declarations.
2. In the five *Needs:* lines, write Mathlib `CovariantDerivative.leviCivitaConnection`, adding Tau Ceti's `CovariantDerivative.instContMDiffCovariantDerivativeLeviCivitaConnection` where smoothness is used (G3.4, G5.1, G6.1).
3. Change `:325` to "RiemannianGeometry R1,R7".
4. In G6.5's *Needs:*, replace "RiemannianGeometry R5's normal bundles" with "CharacteristicClasses C7.3's radial stable framing".

## R04 (P3) — G4.1a cites Proposition 12.1.42 for a statement that is Proposition 12.1.41

**Location.** `README.md:1278–1280`: "the supplied surjectivity/central two-element kernel (Nicolaescu, Proposition 12.1.42, pp. 640–641)".

**Claim.** Proposition 12.1.42 states that the projection Spin(V)→SO(V) is a covering map, and gives connectedness and simple connectedness. The surjection with kernel ℤ₂ is the exact sequence of Proposition 12.1.41, on the previous page.

**Witness.** `nicolaescu` lines 29793–29795 (printed p. 640) state Proposition 12.1.41: 1→ℤ₂→Spin(V)→SO(V)→1. Lines 29797–29800 (printed p. 641) state Proposition 12.1.42: the projection is a covering, connected when dim V≥2.

**Repair.** Replace the parenthesis with "(Nicolaescu, Proposition 12.1.41, p. 640, for the surjection with kernel ℤ₂, and Proposition 12.1.42, p. 641, for the covering)".

## Verified sound

**Head, scope and gate.**
- `git rev-parse HEAD` is 3e31368d; the worktree is clean; the pins are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty. The folder holds only README.md, Suggested.lean, PROGRESS.md, STATUS.md and metadata.toml, all present on main.
- My own gate run reports all checks at 0 and ends `OK`: set_option, sorry-data, imports, statement-hygiene, readme-ids-missing, layer-ids, target-ids, depcheck, stray-files, outside-folder and the rest. The worker's run adds `build=0`.

**Dependency check** (the required command):

```text
depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. Every supplier named is on main. This roadmap is on main, so it may consume only main and the pins, and it does.

**Build and signatures.**
- `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean` emits only `warning: declaration uses 'sorry'`, at `:89`, `:124` and `:189`.
- I elaborated `#check @name` for all seven declarations in one scratch file. Each elaborated type matches its README statement. The signature tool's lead that `diracInFrame` "dropped" the `W`-fibre instances is a false positive: `inst_7` and `inst_8` occur in the type through `Module.End ℂ (W x)`.
- Imports are `Mathlib` plus four Tau Ceti modules, all present at the pin. There is no `set_option`, no `lemma`, and no sorry'd data.

**Library declarations opened at the pins (17).**
- Tau Ceti:
  - `TauCeti.thomPair` (`Topology/VectorBundle/EulerClass.lean:108`).
  - `TauCeti.IsThomClass` (`:245`): finite-dimensional `F`, and the class generates every fibre pair over the coefficient ring.
  - `IsThomClass.neg` (`:258`).
  - `TauCeti.eulerClass` (`:356`): the restriction to `Hⁿ(E)` followed by pullback along the zero section.
  - `TauCeti.PrincipalBundle` (`Topology/FiberBundle/Principal.lean:156`): equivariant atlas, with continuity of the group operations not assumed; free fibres at `:173`.
  - `CliffordAlgebra.realCliffordSpinGroupZero` (`LinearAlgebra/CliffordAlgebra/Spin/Real/Basic.lean:102`).
  - `CliffordAlgebra.spinVectorAction` (`Spin/Action.lean:79`).
  - `TauCeti.OrthonormalFrameBundle` (`Topology/VectorBundle/OrthonormalFrame/Basic.lean:109`).
  - `Representation.IsQuaternionicStructure` (`RepresentationTheory/QuaternionicStructure.lean:72`). No parity theorem is found at the pins, so "the G6.7-owned parity theorem" (`README.md:2259`) is correctly owned here.
  - `CliffordAlgebra.scalarTrace` (`ScalarTrace/Basic.lean:97,102`): any commutative ring with `Invertible 2`, as G1.3 says. The trace formula (`:250`) is over a field.
  - The Fock metric (`RepresentationTheory/Spin/Polarization/Fock/Metric.lean:26,263`) names the exterior Gram metric but proves no determinant formula. `Orientation.sesqComplexification_complexHodgeStar` (`Analysis/InnerProductSpace/HodgeStar/Complex.lean:86`) concerns the star, not the wedge-basis comparison. So the two G1.2/G2.2 targets that the README says "the library does not state" are indeed absent.
  - Stiefel–Whitney classes exist only under `FieldTheory/QuadraticForm/StiefelWhitney/`, which supports the docstring's statement that w₂ cannot be stated.
- Mathlib:
  - `CliffordAlgebra.ι_mul_ι_add_swap` (`LinearAlgebra/CliffordAlgebra/Basic.lean:263`).
  - `IsContinuousRiemannianBundle` (`Topology/VectorBundle/Riemannian.lean:60`).
  - `Topology.CWComplex` (`Topology/CWComplex/Classical/Basic.lean:135`), with the weak topology built in.
  - `CovariantDerivative` (`Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean:366`), whose `toFun` lands in `→L`.
  - `Topology/VectorBundle/` has no tensor product (Basic, Constructions, ContinuousAlternatingMap, FiniteDimensional, Hom, Riemannian), which supports the G5.3 "not statable" line.
- All 355 backticked README names were searched at the pins. The 19 not found there are this roadmap's 7 `Suggested.lean` names, the Mathlib scope `Matrix.Norms.Operator`, and 11 GeneralizedCohomology G5.5 targets, which are found in that README on main.

**Cross-roadmap citations resolved on main 71c8f21.**
- CharacteristicClasses:
  - C1.0 (`:214–245`): the oriented SO(n) subbundle, the metric-change transport by the inverse square root, Sylvester invertibility and the rank-zero frame.
  - C1.6 (C1 item 6, `:715`): line bundles over CW complexes.
  - C3.2 (C3 item 2, `:1106–1116`): "w_n=e(E) mod2, w₁ is the orientation-cover class".
  - C3.5 (`:1185`): w₂ is the universal transition-lift cocycle.
  - C7.3 (`:1851–1858`).
- AlgebraicTopology §8.9 (Stage 8 item 9, `:1870`; table `:2108` "8.9 primary relative obstructions").
- SpinRepresentations Layer 2 `SpinCompactTopologyFoundation` (`RepresentationTheory/SpinRepresentations/README.md:520`).
- TopologicalKTheory T6.4 (`:1286`): continuous principal bundles, cocycles, numerability over paracompact Hausdorff bases and homotopy invariance.
- SmoothBundlesConnections B2.1 (`:559`), B3.3 (`:936`) and B6.0 (`:1306`).
- GeneralizedCohomology G5.5's 11 named targets (for example `:1981`, `:2040`). Its citation of `SpinGeometry … #g1-…` (`:42`) points at a pinned commit.
- Downstream: IndexTheory I7.5 (its open head #1077, `IndexTheory/README.md:1514`) and TangentialBordism B3.0 (its open head #942, `TangentialBordism/README.md:466–467`).

**Overlaps (all 5 items checked).**
- The other open SpinGeometry revision: its head is byte-identical to the merged parent 4e5e6a06 (`roadmaps show SpinGeometry --pr 1780` against `git show 4e5e6a06`). The description's merge-order block states "#1780 → this pull request".
- `#k5-compact-hermitian-elliptic-theory-and-serre-duality` (`README.md:389`) is dropped by #1234, #1807, #1808 and #1854. Each maps the id to Layer 5:
  - #1234: `README.md:365–366` "K5 is now Layer 5";
  - #1807: `:551`, which names the anchor;
  - #1808: `:567` "`K5` → Layer 5";
  - #1854: table row `:529`, which names the anchor.
- Ownership: `roadmaps grep` finds no other owner of `SpinStructure` or of the rank-two criterion.
  - GaugeQuiltFieldTheory (#1076) and TangentialBordism (#942) consume G4.
  - GeometricTopology (#1797) proves evenness of plane-field Euler classes on 3-manifolds, an application, not a second owner.
  - The CharacteristicClasses revisions keep w₂=ρe and C3.5 the universal obstruction, as consumed here.

**Source sample (15 targets).** Printed pages are read from the running heads of `nicolaescu`. All pages and statements match, except R04.

| Target | Locator in README | Source line, printed page | Supports the statement? |
| --- | --- | --- | --- |
| G1.1/G1.2 relation | Def. 12.1.10, p. 626; Cor. 12.1.14, p. 627 | 29261–29265 (uv+vu=−2q(u,v)), 29301 | yes |
| G1.2 Fock model | Prop. 12.1.19, pp. 630–631; h=g+ig(·,J·) | 29392–29440 (h at 29406) | yes; h is linear in the first slot |
| G1.2 Gram determinant | §2.2.4 ΛʳB p. 60; (2.2.8) p. 61 | 2916–2918, 2935 | yes |
| G1.3 metrics, multiplicity | Prop. 12.1.27 p. 634; Cor. 12.1.22, Rem. 12.1.23 p. 632 | 29526–29531, 29466–29470 | yes ("unique up to a multiplicative constant") |
| G1.4 ψ and odd modules | Lemma 12.1.29 p. 634; Prop. 12.1.30 p. 635 | 29553–29557 (Ψ(x⁰+x¹)=x⁰+e₀x¹), 29562 | yes |
| G2.1 Fock chirality | Ex. 12.1.24 p. 632 | 29486–29489 | yes |
| G2.2 Γ on forms | Ex. 12.1.25, (12.1.1) p. 633 | 29500–29514 (Γω=i^(k+p(p−1))∗ω) | yes, letters renamed |
| G3.1 equivariant tensor | §12.1.5, Ex. 12.1.33, pp. 636–637 | 29651–29658 | yes |
| G3.2/G3.3 Dirac bundle | Def. 12.1.64(a1),(a2) p. 653; Lemma 12.1.31 p. 636 | 30304–30314, 29637–29642 | yes |
| G4.1a covering, kernel | Prop. 12.1.42 pp. 640–641; Ex. 12.1.54 pp. 648–649 | 29793–29800; 30117–30125 | covering yes; kernel is 12.1.41 (R04) |
| G4.3 obstruction | Prop. 12.2.25 p. 669 | 30950–30951 | yes, "for manifolds" as stated |
| G4.4 torsor | Rem. 12.2.28, Ex. 12.2.29 p. 669; Ex. 12.2.35 p. 673; Ex. 12.2.30 p. 670 | 30957–30981, 31121–31126, 30984 | yes (free, transitive; T³ has 8) |
| G4.2/G4.4a Kirby | Ch. IV, pp. 33–34 | `kirby` 1114–1167 | yes: skeletal for n≥3, ε¹ for n=2 and ε² for n=1, principal cover, H¹ torsor |
| G5.1 spin connection | §12.2.3, Lemma 12.2.32, pp. 670–672 | 31054–31058 | yes |
| G6.2/G6.3 formulas | Thm. 12.1.67 p. 656; Thm. 12.2.33 p. 673; Ex. 12.1.68 p. 657 | 30422–30424, 31100–31101, 30468–30478 | yes |

I also checked these locators outside the sample: Proposition 12.2.1 (p. 657, line 30497), Propositions 12.1.65–12.1.66 (pp. 654–655), §12.1.8 (Example 12.1.57 at p. 651, quaternionic half-spin representations at p. 652, line 30273), and Exercise 12.1.15 and Example 12.1.18 (p. 629).

**Adversarial table.** Every value below was recomputed this round.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Headline `nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul` (G4.4a) | X=∅; X=pt; S² with TS² and the Hopf plane bundle; ℝP² with the nontrivial oriented plane bundle; −u; a non-orientable bundle | ∅: H²=0, both sides true. pt: e=0=2·0, P=Spin(2) maps to Fr. TS²: e=±2=2(±1), one spin structure. Hopf: e=±1∉2ℤ, w₂≠0. ℝP²: 2H²(ℝP²;ℤ)=0, e≠0, ρ injective so w₂≠0; both false. −u: e(−u)=−2c=2(−c). Non-orientable: no integral Thom class, so `hu` cannot hold | holds; none |
| `SpinStructure` (G4.2) | n=1; n=2 with z(θ); constant `toFrame`; non-equivariant `toFrame` | n=1: ±1 acts trivially on ℝ¹, so P is a double cover over an orientation section, two over S¹ (G4.2 Check). Constant map: needs b₀=b₀∘ρ(g) for all g, false for z(π/4) (a quarter turn), true for n=1 as it should be. Without `toFrame_smul`, a trivial P over the Hopf bundle would map to one frame | the definition determines its object; none |
| `cliffordMultiplication_anticommutator` | V=ℝ, c(e)=i; (iZ,iY) | 2i²=−2=−2⟨e,e⟩; on (e₁,e₂): −(ZY+YZ)=0=−2·0; the positive convention gives +2 | true; padding (R01) |
| `diracInFrame_eq` | n=0; rotated frame; frame (2e₁,e₂) | empty sums 0=0; cos²θ+sin²θ=1 with cancelling cross terms; 4c(e₁)∇₁+c(e₂)∇₂ is excluded by the type | true; padding (R01) |
| Curvature convention | unit S² | R(e₁,e₂)e₂=e₁, K=1, Scal=2 | holds |
| G1.1 Pauli dictionary | X, Y, Z | XZ=[[0,−1],[1,0]]=−iY with square −Id; coordinate determinant of (Id,X,Z,XZ) is 4; XYZ=iId, ZYX=−iId; (iZ)(iY)=iX | holds |
| G1.2 Fock metric | ℝ²=ℂ, w=e₁^(1,0) | g_ℂ(w̄,w)=1/2; c(e₁)²1=−1; ⟨c(e₁)1,w⟩=1/√2=−⟨1,c(e₁)w⟩; native action 1/2≠1 | holds |
| G1.3 trace | Cl(0,1); a=1+e₁+2e₂ | tr L_a=2x=2¹τ(a); τ(a*a)=1+1+4=6; τ(star(e)e)=−1 for a positive e | holds |
| G1.4 odd labels | n=3 in (iZ,iY,iX) | ω acts by i³ZYX=(−i)(−i)=−Id, so ω_ℂ=+Id; ψ(e₁e₂e₃)=−e₁e₂e₃e₀, while e_j↦e_je₀ gives + | holds |
| G2.1 Γ | negative plane; Fock vacuum | Γ=i·iX=−X, S⁺=ℂ(1,−1); c(e₁)c(e₂)1=−i, Γ1=1 | holds |
| G2.2 star formula | plane, k=0,1,2 | vol·ω signs (−1)^(C(k+1,2)+kl)=+1,+1,−1 give e₁∧e₂, e₂, −1, equal to c(e₁)c(e₂)ω; Γ(e₁∧e₂)=−i=i³⋆(e₁∧e₂) | holds |
| G2.3 product | two planes | Γ_(V⊕W)=i²(c c⊗c c)=Γ_V⊗Γ_W; S⁺ has rank 2 of 4 | holds |
| G3.1 descent | a=1+ω in Cl(ℝ³,−g); G=ℝ | a²=2a, \|a²\|=2√2=√2\|a\|²; both sides at e₁ equal [[0,−e^(−2it)],[e^(2it),0]] | holds |
| G3.3 curvature | unit S² | R^S(e₁,e₂)=−½c₁c₂, [R^S,c₁]=−c₂=c(R(e₁,e₂)e₁); coefficient ½ gives −2c₂ | holds |
| G3.4 frames | S², e²=sinθ dφ | de²=cotθ e¹∧e² equals d(sinθ dφ); d*e²=0 | holds |
| G4.1a/b signs | positive form | [e₁e₂,e₁]=−2e₂, [e₁e₂,e₂]=2e₁, matching 2(e₁e₂ᵀ−e₂e₁ᵀ); odd unit e₁ acts with determinant −1 | holds |
| G4.2 metric change | B=diag(4,1) | g′(e₁/2,e₁/2)=1; B⁻¹ gives g′-norm ½; the Sylvester eigenvalues √b_i+√b_j>0 | holds |
| G4.4 torsor, direct sum | S¹, T², T³; m=n=1 | 2, 4, 8=\|H¹(T³;ℤ/2)\|; (−1)(−1)=+1, so the class is 1+1=0 | holds |
| G4.4a stabilization | n=1,2; rank-two frame over X¹ | ε^(3−n) equals Kirby's ε² and ε¹; extension to X² gives e\|_(X²)=0, and H²(X)→H²(X²) is injective | holds |
| G5.0 actions | n=1, n=2 | C₊(e)²=+1, c₋(e)²=−1, anticommutator on 1 is −1+1=0; C₊(e₁)C₊(e₂)1=e₁e₂ | holds |
| G5.3 roots | ρ(z); ℝP³; S² with e=1 | ρ(z)=cosθ−i sinθΓ gives e^(∓iθ) on S^±; c₁(γ_ℂ)=β(a)≠0 in H²(ℝP³;ℤ)=ℤ/2; 2c=1 has no solution | holds |
| G6.0 module norms | flat T³, s=1+ω; Cl(0,4), Cl(0,8) | ⟨s,s⟩_A=2+2ω, C*-norm 4 against L² value 2; even parts ℍ⊕ℍ (one of each) and 8+8 copies | holds |
| G6.1 square | (iZ,iY) on ℝ² | D²=−∂₁²−∂₂²; the positive convention gives +∂₁²+∂₂² | holds |
| G6.2/G6.3 contraction | ordered pairs; unit S²; S³ | c₂c₁R(e₂,e₁)=c₁c₂B (double count); c₁c₂(−½c₁c₂)=½=Scal/4; S³: Scal/4=3/2 | holds |
| G6.4, G6.6 | flat circle; plane symbol | D(f,h dx)=(−h′,f′dx), kernel (1,1); S⁺→S⁻ symbol i(v₁+iv₂) with winding +1, −1 when reversed | holds |
| G6.7 index | ω₋ in Cl(0,4); K3; T⁴ | ω₋²=(−1)⁶(−1)⁴=1, C₊(e₁)…C₊(e₄)1=ω₋; K3 α=1 and index 2; T⁴ α=0 | holds |

**Library near-matches** (`library-matches.md`): no candidate states either kept declaration. `spinGroup` and `IsContinuousRiemannianBundle` are its carriers; the R01 probes use `ι_mul_ι_add_swap` and `canonicalCovariantTensor_eq_sum`.

## Not verifiable

- Lawson–Michelsohn (Chapters I–II) and Atiyah–Bott–Shapiro (§§1, 6, 11) are settled as `uncertified` and are cited by locator only. I did not open them.
- The Kirby text is an OCR of an image-only scan. Pages 33–34 are legible in the OCR (`kirby` lines 1114–1167); a few garbled formula lines (1141, 1156) were not relied on.

## Source issues

- **Misprint** in nicolaescu at Example 12.1.54, p. 649: the source names the squaring map's domain Spin(1); it should be Spin(2), the example being the case n=2; affects nothing.
