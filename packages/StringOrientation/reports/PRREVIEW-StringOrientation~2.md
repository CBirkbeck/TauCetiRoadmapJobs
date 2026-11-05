# Review of StringOrientation (pull request #948 at 714ab78)

**Verdict:** needs changes

Gate at 714ab78: every check passed (targeted build of `TauCetiRoadmap.StringOrientation.Suggested` green; no `set_option`, no sorry'd data, no edit outside the folder). The dependency check with `--movable` on this README prints `depcheck: 208 roadmaps, 1455 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line; this time the edges are visible (every target carries a `*Needs:*` line and there is an `## Exact supplier contracts` section), so the clean result is real. `lake env lean` on `Suggested.lean` elaborates with no output (the file declares nothing).

**Status of the previous review's findings (2faaf46 → 714ab78).**

- R01 (cycle with TangentialBordism): repaired. The README no longer cites TangentialBordism anywhere; the OP² carrier, the structured Pontryagin–Thom isomorphism, the framed comparison and the odd-primary MSpin/MSO comparison are now owned here (S1.5, S2.2, S2.3, S5.3). TangentialBordism at its head lines 19–30 and 141 lists StringOrientation S1.3, S1.5, S2.2, S2.3, S5.3 as its supplier and says "consumes nothing from here"; the direction now agrees with the merge order (6 before 9).
- R02 (cycle with EllipticCohomology): repaired. S2.1 now consumes E5's MString ("S2 here does not build a second E∞ model", line 46–52); EllipticCohomology at its head line 1113–1117 says StringOrientation consumes E4, E5, E6 "and nothing in this roadmap is consumed from it".
- R03 (invisible upward suppliers): repaired. `*Needs:*` lines on every target and the contracts section; SmoothBundlesConnections, LieGroupoidsPoisson and HomotopySpheres are no longer cited; their inputs are stated as targets in S3.0, S2.2 and S2.3 (the moves are recorded under Verified sound, with one ownership note in R05).
- R04 (GeometricTopology transversality): repaired. S5.4 cites SchemeAndStackFoundations §4.13 `bertini_smoothness` (main line 5680) and AffineMorseLefschetz A0 `complexProjectiveZeroLocus` (main line 69), and owns the Jacobian-rank comparison.
- R05 (padding): repaired. The three declarations are gone; the docstring lists S1–S6 with the missing carrier for each. (See R03 below for the one statable piece it still omits.)
- R06 (Waldorf iℝ convention): repaired. Conventions now say Waldorf's forms are real (lines 697–699, 726–730 checked), the transgression is `exp(2πi∫H)`, and (4.2.1) at lines 1092–1097 omits the 2πi (checked; the degree-1 formula at 1210–1215 carries it).
- R07 (E4 citation): repaired. d₂, d₃, D are introduced here as names for E4's lifts; the two injectivity statements are proved here from E4's coefficient computation with the bmq-hurewicz and belmont-shimomura locators (checked at lines 128–129 and 653–655); the localization criterion is cited from E6, which states it at its head lines 1085–1090.
- R08 (backticked names): repaired as "intended name …" without backticks; FourManifolds at its head lines 1844–1849 still consumes those names, which is FourManifolds' side to keep in step.
- R09 (no Checks, no locators): repaired throughout; the table below recomputes them.
- R10 (Mathlib link): the premise of that finding was wrong: `lake-manifest.json` pins Mathlib at 6b7abb3c (a91d3aaf is the Tau Ceti pin), so the original link was to the pin. The README now says "at the pinned revision", which is also fine. No action.

## R01 (P2) — The torsion example `S⁴∪_2e⁵` has `H⁴ = 0`, so the negative control is false

Location: `TauCetiRoadmap/StringOrientation/README.md` line 215–218 ("Negative control on a torsion base: on the Moore space `X=S⁴∪_2e⁵`, `H⁴(X;ℤ)=ℤ/2`"), line 262 ("`X=S⁴∪_2e⁵`, nontrivial bundle: `p₁=0` and `λ≠0`, so no lift"), line 390–391 (Examples: "the torsion example `S⁴∪_2e⁵`").

Claim: `H⁴(S⁴∪_2e⁵;ℤ) = ℤ/2`, and the nontrivial stable Spin bundle on it has `λ ≠ 0` with `p₁ = 2λ = 0`.

Witness: `S⁴∪_2e⁵ = M(ℤ/2,4)` has `H̃₄ = ℤ/2`, `H̃₅ = 0`. By universal coefficients `H⁴ = Hom(H₄,ℤ) ⊕ Ext(H₃,ℤ) = 0`, `H⁵ = Ext(ℤ/2,ℤ) = ℤ/2`. Cellularly: `C⁴ = ℤ → C⁵ = ℤ` is multiplication by 2, injective, so `H⁴ = 0`. With `dim X = 5 ≤ 7`, S1.3's own bijection `[X,BSpin] ≅ H⁴(X;ℤ) = 0` says every stable Spin bundle on this space is trivial; there is no "nontrivial bundle" and the control tests nothing.

Repair: use the 4-dimensional Moore space `X = S³∪_2e⁴ = M(ℤ/2,3)`: `H⁴(X;ℤ) = Ext(ℤ/2,ℤ) = ℤ/2`, `H³(X;ℤ) = 0`, `dim X = 4 ≤ 7`, so `[X,BSpin] ≅ ℤ/2`; the nontrivial bundle has `λ ≠ 0` and `p₁ = 2λ = 0`, and it has no String lift. Make the same replacement in the three places. (Checked: on `S³∪_2e⁴` the computation `H⁴ = ℤ/2`, `H³ = 0` is the cellular cochain complex `ℤ →(×2) ℤ` in degrees 3, 4.)

## R02 (P2) — S3.5 re-plans the manifold diffeology that Orbifolds O2 already owns on main

Location: `TauCetiRoadmap/StringOrientation/README.md` lines 671–676 ("Construct the manifold diffeology with `DiffeologicalSpace.ofCorePlotsOn` … Prove atlas independence … equality of the D-topology with the manifold topology, and compatibility with product topologies"), and the From Mathlib contract at lines 124–126 ("That file constructs no product, subspace, pullback or functional diffeology and no manifold diffeology; S3.5 constructs them").

Claim: the manifold diffeology, its chart independence, the equality of its D-topology with the manifold topology and the finite-product comparison are built here.

Witness: `TauCetiRoadmap/Orbifolds/README.md` on main, O2 item 6, lines 220–233: "First construct the manifold diffeology from smooth chart plots, proving chart independence and equality of its D-topology with the stated manifold topology … Use native `DiffeologicalSpace.ofCorePlotsOn` … Supply open restrictions, common refinements and the finite-product comparison, proving topology compatibility for these models". Orbifolds is an existing roadmap on main; the same objects are planned twice.

Repair: in S3.5 consume Orbifolds O2 item 6 by name for the manifold diffeology, chart independence, the D-topology equality and the finite-product topology comparison (add it to the `*Needs:*` line and to `## Exact supplier contracts` as `From TauCetiRoadmap.Orbifolds`), and keep here only what Orbifolds does not state: `DSmooth f ↔ ContMDiff I J ∞ f` and the `ContMDiffMap` identification, the subspace, pullback and functional diffeologies with their universal properties, evaluation, currying, plotwise forms and fibre integration. Amend the From Mathlib sentence to "S3.5 and Orbifolds O2 construct them" and add Orbifolds to the Scope's "leaves to named roadmaps" list. Orbifolds is not in the merge order (it is on main), so no direction problem arises.

## R03 (P2) — The ℤ/24 stem of the S2 headline is statable at the pin and `Suggested.lean` omits it

Location: `TauCetiRoadmap/StringOrientation/Suggested.lean` lines 15–16 ("S2: `Ω₃^String ≅ Ω₃^fr ≅ ℤ/24` … There are no Thom spectra, bordism groups or stable homotopy groups of spheres"); README line 11 (headline) and lines 465–470 ("Prove `π₃S≅ℤ/24` … by the Serre spectral sequence computation of the 2- and 3-primary parts").

Claim: nothing of the S2 headline is statable at the pins.

Witness: Mathlib at the pin has `HomotopyGroup` with its group structure (`Mathlib/Topology/Homotopy/HomotopyGroup.lean` lines 441, 458, 547, 603). The stem `π₃S` is `π₈(S⁵)` in the stable range, and the statement

```lean
theorem probe_pi8_sphere5 :
    Nonempty (π_ 8 (Metric.sphere (0 : EuclideanSpace ℝ (Fin 6)) 1)
      ⟨EuclideanSpace.single (0 : Fin 6) (1 : ℝ), by simp⟩ ≃* Multiplicative (ZMod 24)) := by
  sorry
```

elaborates against the pin with `sorry` as its only warning (probe run with `lake env lean` on a scratch copy). The Serre-spectral-sequence route of S2.3 computes exactly such an unstable group; the stabilization `π₈(S⁵) ≅ π₃S` is Freudenthal, which S2.3 does not list.

Repair: either state the S2.3 stem headline in this form (any `π_{n+3}(Sⁿ)`, `n ≥ 5`), adding to S2.3 that the stable stem is identified with `π₈(S⁵)` by Freudenthal suspension and naming the owner of that theorem (AlgebraicTopology Stage 8 or GeneralizedCohomology) on the `*Needs:*` line; or keep the file empty and make the docstring exact: Mathlib has unstable homotopy groups, the unstable form `π₈(S⁵) ≅ ℤ/24` is statable, and it is not stated because the roadmap's headline is the bordism statement. The present docstring sentence is not accurate as written.

## R04 (P3) — Meinrenken locator points at the gluing section, not the basic gerbe

Location: `TauCetiRoadmap/StringOrientation/README.md` lines 616–618 ("the curvature is the closed 3-form `⅙⟨θ∧[θ∧θ]⟩` … (waldorf-string-connections lines 726–730; meinrenken-basic-gerbe §4, Proposition 4.3, line 437)").

Witness: meinrenken-basic-gerbe line 367 is "4. Gluing data" and Proposition 4.3 at line 437 is the criterion for glued gerbe connections (error 2-forms vanish). The basic gerbe is §5, line 494; the basic 3-form `η = ¹⁄₁₂ θ·[θ,θ]` is §5.2, line 526; the construction for general simply connected G is §5.4, line 627. The Waldorf locator (726–730) is right.

Repair: cite "meinrenken-basic-gerbe §5.2, line 526, and §5.4, line 627". Meinrenken's `¹⁄₁₂ θ·[θ,θ]` and Waldorf's `⅙⟨θ∧[θ∧θ]⟩` differ only by the convention for the bracket of Lie-algebra-valued forms; both are normalized to represent the generator, as the README says, so nothing else changes.

## R05 (P3) — Record the moved-down objects and pin the connection carrier S3.1 computes with

Location: `TauCetiRoadmap/StringOrientation/README.md` Scope lines 21–41; S3.0 lines 497–546; S3.1 line 576 ("λ̂ has characteristic class λ and curvature one half of the p₁ Chern–Weil form").

Witness: three of this roadmap's targets are also planned by later open roadmaps, as the previous review's repair required, and neither side records it: (a) `π₃S ≅ ℤ/24{ν}` is S2.3 here and HomotopySpheres Stage 9 item 1 at its head lines 1252–1253 (merge order 64); (b) principal bundles, connections, curvature and good covers are S3.0 here and SmoothBundlesConnections B1.1, B1.5 and B6 at its head lines 26–39 and 315 (merge order 7); (c) submersion fibre products are S3.0 here and LieGroupoidsPoisson G0 at its head lines 149–225 (merge order 136). Separately, CharacteristicClasses C4.1 on main (line 1040) builds Chern–Weil forms "using … SBC's principal curvature", so the p₁ Chern–Weil form S3.1 halves is computed on SmoothBundlesConnections' connection carrier while S3.0 defines its own.

Repair: in Scope, list the three later roadmaps whose later sections state the same objects, so the intake can reconcile ownership when they merge (this is the recorded move, not a defect of direction). In S3.0 add one target: the connection and curvature defined here agree, on a principal bundle with the data CharacteristicClasses C4 consumes, with the curvature C4.1 feeds to Chern–Weil, so that S3.1's "one half of the p₁ Chern–Weil form" is a statement about one carrier.

## R06 (P3) — TopologicalKTheory on main has no symmetric powers

Location: `TauCetiRoadmap/StringOrientation/README.md` line 753 ("*Needs:* TopologicalKTheory (virtual bundles, symmetric powers)"), and line 741 (`Θ_q(V)=⊗Sym_(qⁿ)(V_ℂ−rank V)`).

Witness: `TauCetiRoadmap/TopologicalKTheory/README.md` on main states exterior powers (line 185) and the λ-ring and Adams operations (line 711, `adamsOperation_lambdaSeriesComparison`); "symmetric" occurs only for the tensor structure (line 45) and a rational symmetric-function action (line 734). No symmetric-power operation is stated.

Repair: either define `Sym_t(V) := λ_(−t)(V)⁻¹` in S4.1 from TopologicalKTheory's λ-operations and say so, or cite the exact TopologicalKTheory item that defines `Sym_t`.

## Verified sound

**Adversarial table.** One row per statement checked; values computed on each side.

| # | Statement (README line) | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | λ generator, `p₁=2λ`, no sign choice (80–83, 206–207) | `H⁴(BSpin;ℤ)` | torsion-free ℤ, `p₁ = 2·gen`; wrong model λ:=p₁ gives 2λ=2p₁≠p₁ | holds | none |
| 2 | `⟨λ,hur(g)⟩=−1` against G5.0's `+1` (84–86, 208–209) | HP¹ | `p₁(ℝγ_H)=−2c₂(ℂγ_H)`, G5.0 main line 1504–1505: `⟨c₂,(h_S4)_*[S⁴]⟩=+1` ⇒ λ pairs to −1 | holds | none |
| 3 | `λ(ad V)=−2c₂(V)` (203–204, 210–212) | weights 0, ±2x | `c(ad V⊗ℂ)=1−4x²`, `p₁(ad V)=4x²`, `c₂(V)=−x²` ⇒ `p₁=−4c₂`, `λ=−2c₂` | holds | none |
| 4 | mod 2, Hopf line: λ odd, `w₄≠0` (213–214) | S⁴ | λ=−1 odd; `w₄=e mod 2` of rank-4 bundle with Euler number 1 | holds | none |
| 5 | Moore space negative control (215–218, 262, 390) | `S⁴∪_2e⁵` | `H⁴=Hom(ℤ/2,ℤ)⊕Ext(0,ℤ)=0`, `H⁵=ℤ/2`; `[X,BSpin]=0` | false | R01 |
| 6 | replacement control | `S³∪_2e⁴` | `H⁴=Ext(ℤ/2,ℤ)=ℤ/2`, `H³=0`, dim 4 ≤ 7 ⇒ `[X,BSpin]=ℤ/2`, nontrivial bundle has λ≠0, p₁=0 | holds | R01 repair |
| 7 | BString 7-connected; λ an 8-equivalence (226–228) | `π_i`, i ≤ 8 | π₄: ℤ→ℤ iso (row 2); π₅,π₆,π₇ both 0; π₈: ℤ→0 onto | holds | none |
| 8 | wrong model "fibre of p₁" (241–242) | π₃ | coker(ℤ →(×2) ℤ)=ℤ/2 ≠ 0 | holds | none |
| 9 | n=3: fibre of λ over BSpin(3) has π₃=ℤ/2 (243–245) | BSU(2) | λ=−2c₂ ⇒ π₄ map ×(−2), coker ℤ/2; 3-connected cover has π₃=0 | holds | none |
| 10 | String(n)→Spin(n): iso π_i, i≥4; 3-connected (229–231, 249–250) | LES | `π₃K(ℤ,2)=0→π₃String→π₃Spin=ℤ→π₂K(ℤ,2)=ℤ→π₂String→0`; middle iso | holds | none |
| 11 | String(n) not a finite-dim Lie group, n=5 (232–238, 246–248) | Spin(5) | contractible String ⇒ Spin(5)≃K(ℤ,3); `H¹⁰(Spin(5);ℚ)=ℚ` (closed orientable 10-manifold) vs `Λ(x₃)¹⁰=0` | holds | none |
| 12 | existence iff `c*λ=0`, `H³` torsor (257–260) | source | redden-canonical-3forms Prop 2.2 lines 214–219 (n=4, H=ℤ) | holds | none |
| 13 | `[X,BSpin]≅H⁴(X)` for dim ≤ 7; 4- and 7-skeleton criteria (261–268) | dim 7, dim 4 | 8-connected map ⇒ bijection for dim < 8; `H⁴(X)→H⁴(X⁴)` injective | holds | none |
| 14 | `X=S¹×S²` (278–280) | — | `H⁴=0` ⇒ every bundle trivial; `H³=ℤ` torsor | holds | none |
| 15 | S³ gauge test shift +1, adjoint loop −2 (309–313) | g, ad | action = −(Ωλ class): −(−1)=+1; adjoint class −2 by row 3 | internally consistent | none |
| 16 | relative pair `(D⁴,S³)` (317–320) | α | `H³(S³)=ℤ ≅ H⁴(D⁴,S³)=ℤ` by coboundary; extends iff α=0 | holds | none |
| 17 | `dim F₄−dim Spin(9)=16`, Spin(8) wrong (364–365) | — | 52−36=16; 52−28=24 | holds | none |
| 18 | `p(OP²)=1+6u+39u²`: `L₄=1`, `Â₄=0` (339–346, 368–373) | `p₁=p₃=0` | `(381·39−19·36)/14175=(14859−684)/14175=1`; `−192·39+208·36=−7488+7488=0` | holds | none |
| 19 | wrong total class `1+6u+36u²` (373–374) | — | `(381·36−19·36)/14175=13032/14175`, not an integer | holds | none |
| 20 | `w(OP²)=1+ū+ū²`, Euler class `3u²`, `χ=3` (349–351, 375–376) | Wu | `v₈=ū` since `Sq⁸ū=ū²`; `w=Sq(1+ū)=1+ū+ū²`; `w₁₆=ū²≡χ=3 mod 2` | holds | none |
| 21 | `p(HP²)=1+2u+7u²`, signature 1, λ=u≠0 (352–354, 377–379) | — | `(1+u)⁶(1+4u)⁻¹=1+2u+7u²`; `L₂=(7·7−4)/45=1` | holds | none |
| 22 | OP²: unique Spin structure, one String lift (340–343) | — | `H¹(;𝔽₂)=H²(;𝔽₂)=0`; `H⁴=0`, `H³=0` | holds | none |
| 23 | S2.1 Postnikov: `τ_(≥4)ko`, section `Σ⁴Hℤ`, fibre `τ_(≥8)ko` (402–407) | π₄..π₈ ko | π₄=ℤ, π₅=π₆=π₇=0, π₈=ℤ | holds | none |
| 24 | rational String/Spin bordism ranks (447–449) | degrees 4–16 | String: 0,1,1,2 (`x₁₆`, `x₈²`); Spin: 1,2,3,5 | holds | none |
| 25 | K3 Spin, `p₁=−48` (450–451) | σ=−16 | `p₁=3σ=−48` | holds | none |
| 26 | PT in degree 0 (455–457) | O, SO | `Ω₀^O=ℤ/2=π₀MO`; oriented ℤ | holds | none |
| 27 | Lie-framed S¹ (458–459) | η | `π₁S=ℤ/2{η}`, no rational numbers | holds | none |
| 28 | unit `S→MString` iso for i ≤ 6 (465–466, 485) | cofibre | bottom cell of MString/S in degree 8 | holds | none |
| 29 | e-invariant well defined mod 24 (471–477) | closed Spin 4-manifold | σ∈16ℤ (I7 `eight_mul_untwistedSpinFourIndex_eq_neg_signature` plus quaternionic parity), `p₁=3σ∈48ℤ`, `½p₁∈24ℤ`; K3: `½p₁=−24≡0` | holds | none |
| 30 | `π₃S≅ℤ/24`, 2-part ℤ/8, 3-part ℤ/3; `J` onto, kernel 24ℤ (467–470, 486–487, 494–495) | — | 8·3=24; `J(gen)=ν` of e-invariant 1/24 | holds | R03 (statable) |
| 31 | `[M,Spin]≅H³(M)` for closed oriented 3-manifolds (478–480, 490) | S³, S¹×S² | `Spin→K(ℤ,3)` is a 7-equivalence (π₄=π₅=π₆=0) | holds | none |
| 32 | `F_A=dA+½[A∧A]` on `ℝ²×SU(2)` (529–533) | `A=τ₁dx+τ₂dy` | `dA=0`, `½[A∧A]=[τ₁,τ₂]dx∧dy=2τ₃dx∧dy` | holds | none |
| 33 | Bianchi `dF=[F∧A]` (519) | sign | `dF+[A∧F]=0`, `[A∧F]=−[F∧A]` (1-form, 2-form) | holds | none |
| 34 | good cover of S¹: two arcs fail, three succeed (534–536) | — | `U∩V` has two components; three arcs: all pairwise intersections single arcs, triple empty | holds | none |
| 35 | `x↦x²` fibre product not a manifold (537–539) | — | `{x²=y²}` is two crossing lines | holds | none |
| 36 | `Ĥᵏ(pt)` (581–582) | k=0,1,≥2 | ℤ, ℝ/ℤ, 0 | holds | none |
| 37 | `dim Y^[k]=k·dim Y−(k−1)·dim M`; `δ` on k=2 is `pr₂*−pr₁*` (594–597, 605–608) | k=1,2 | k=1: dim Y; i=1 term `+omit₁*=pr₂*`, i=2 term `−omit₂*=−pr₁*` | holds | none |
| 38 | 2-gerbes with connection ↔ `Ĥ⁴` (598–599) | source | cjmsw-bundle-gerbes Prop 4.8 line 913–914: `H³(M,D³)` | holds | none |
| 39 | multiplicative iff transgressive (620) | source | cjmsw-bundle-gerbes Thm 5.8 lines 1109–1111 | holds | none |
| 40 | `H³(Spin(n);ℤ)≅H⁴(BSpin(n);ℤ)` needs n ≥ 5 (614, 619) | n=4 | `H³(Spin(4))=ℤ²` (SU(2)²); n ≥ 5 both ℤ | holds | none |
| 41 | basic gerbe level: `±1` on Sp(1), `±2` on adjoint Spin(3) (634–637) | π₃ | Dynkin index 2 of SU(2)→SO(3)→Spin(n), consistent with row 3 | holds | none |
| 42 | CS 2-gerbe curvature `½p₁(A)`, class λ (622–623) | source | waldorf Lemma 3.1.2 lines 759–765: `⟨Ω_A∧Ω_A⟩`, class `½p₁` | holds | none |
| 43 | string connections exist; affine over `V_T` (645–650) | source | waldorf Thm 1.3.4 lines 428–430; lines 876–882 and Prop 3.3.4 line 885 | holds | none |
| 44 | `Ĥ³` torsor when λ=0 (651–652) | source | waldorf Cor 1.3.2 lines 383–385 (`½p₁(P)=0`) | holds | none |
| 45 | `π*H=K+TP(A)`, `dH=curv(λ̂)`, `H_(T·κ)=H_T+curv(κ)` (653–656) | source | waldorf Thm 1.3.3 lines 404–415 | holds | none |
| 46 | transgression injective; surjective under point determination (712–717) | source | waldorf Lemma 4.3.2 line 1258; Lemma 4.3.3 line 1289 with the hypothesis defined at 1266–1269 | holds | none |
| 47 | Waldorf's forms real; (4.2.1) lacks 2πi (92–97) | source | lines 697–699, 727–730 real; 1092–1097 `exp(∫H)`; 1210–1215 `exp(2πi∫)` | holds | none |
| 48 | fibre integration signs over S¹ (691–693) | `du∧dθ`, `dθ∧du` | `+2π du`, `−2π du` with parameter first | holds | none |
| 49 | `log Q` coefficients `2G_(2k)/(2k)!` (105–108, 746–751) | k=1,2; q-part | `log((x/2)/sinh(x/2))=−x²/24+x⁴/2880+…` (`7/5760−1/1152=1/2880`); `2G₂/2=−1/24`, `2G₄/24=1/2880`; q-part `Σ_(n,m)(q^(nm)/m)(e^(mx)+e^(−mx)−2)=Σ_k 2x^(2k)/(2k)!·Σ_N σ_(2k−1)(N)q^N` | holds | none |
| 50 | `φ_W=Â+q·Â(M;T_ℂ−dim)+O(q²)` (766) | first order in q | per root `q(eˣ+e⁻ˣ−2)`, summed `q(ch T_ℂ−dim M)` | holds | none |
| 51 | `φ_W(OP²)=0`, dimension 4 (768, 771–775) | weights 8, 2 | `M₈=ℂE₄²`, constant term `Â=0`; `M₂=0` | holds | none |
| 52 | `χ(F₄/Spin(9))=1152/384=3`; 8 complementary positive roots (791, 822–824) | — | 3; 24−16=8=16/2 | holds | none |
| 53 | `OP²×HP²→HP²` total space not String (792–795) | — | `λ=0+u≠0` | holds | none |
| 54 | odd-primary `MSpin→MSO` equivalence; fails at 2 (838–843, 851–852) | fibre `K(ℤ/2,1)` | `H̃_*(RP^∞;ℤ[1/2])=0`; `π₁MSpin=ℤ/2≠0=π₁MSO` | holds | none |
| 55 | Hovey: no p-torsion for p ≥ 5, non-polynomial (845–849) | source | hovey-mstring lines 26–34; Thm 2.4 as restated at mctague-cayley-plane 446–449 | holds | none |
| 56 | McTague Theorem 4 criterion (857–863) | source | mctague-cayley-plane lines 324–340 | holds | none |
| 57 | Frobenius number 13; n=2, n=3 cases (876–881) | — | 3·8−3−8=13; 4=5−1; 6=7−1=5⁰+5¹ | holds | none |
| 58 | Lemma 8: `n=3a+8b` for n ≥ 14 (871) | source | line 1030–1031: `n+(a+b)=4a+9b` | holds | none |
| 59 | vertical contribution `4n_f²(x₁²+x₂²)` (868) | roots `½(±e₁±e₂±e₃±e₄)` | `Σ=2Σe_i²`, `e_i↦n_f x` ⇒ `4n_f²(x₁²+x₂²)`; source prints `4n_f` | holds | source misprint |
| 60 | Theorem 1 and the not-a-quotient statements (886–893) | source | mctague-cayley-plane 58–64; mctague-tmf-quotient Thm 1 line 124, Cor 2 line 146 | holds | none |
| 61 | kernel: rational target `ℚ[c₄,c₆]`; degrees 8, 12; ℤ/24 in degree 3 (896–902) | — | OP² bundles have dim ≥ 16; odd degree ⇒ zero genus | holds | none |
| 62 | Stolz: one direction only; point excluded (921–927) | source | mctague lines 116–120 states Stolz's biconditional; README asserts only the forward direction | holds | none |
| 63 | round sphere `Ric=(n−1)r⁻²g`; Tau Ceti sign (931–934) | Ricci.lean | lines 25–26: `R(w,u)v=κ(⟪u,v⟫w−⟪w,v⟫u)` gives `Ric=(dim−1)κg` | holds | none |
| 64 | low-weight vanishing list (945–953) | weights 2–16 | `dim M_k=0,1,1,1,1,2,1,2` for k=2,…,16; dims 4,8,12,16,20,28 in, 24 and 32 out | holds | none |
| 65 | `Ric=−¼B=¼g`, sectional 1/8, radius `2√2` (958–959, 981–985) | su(2) | `R(X,Y)Z=−¼[[X,Y],Z]`; `tr=−¼B(Y,Z)`; `Ric=2Kg` ⇒ `K=1/8`, `r²=8` | holds | none |
| 66 | unit images: S³ ↦ generator of ℤ/24, SU(3) ↦ order-2 class (962–965) | source | hopkins-icm2002 lines 396–405: π₃=ℤ/24, π₈=ℤ⊕ℤ/2, iso ≤ 6, nonzero on SU(3); torsion class lands in ℤ/2 | holds | none |
| 67 | Δ⁸, Δ³ injectivity; periodic orders 2 and 24 (966–973) | source | bmq-hurewicz 128–129 (pattern ⊗ ℤ_(2)[Δ⁸]); belmont-shimomura 653–655 (Δ³ injective); 2-part 8, 3-part 3 | holds | none |
| 68 | `D_(2)=d₂³`, `D_(3)=d₃⁸` degrees (967–968, 986) | — | 3·192=576=8·72 | holds | none |
| 69 | `ContMDiff`/`ContMDiffMap`, `Manifold.IsSubmersion` "global complement" (131–139) | pin | `ContMDiffMap.lean` 38; `Submersion.lean` 36–37, 553 (∃ global F) | holds | none |
| 70 | Tau Ceti `ricciTensor` convention (141–146) | pin | Ricci.lean 15–16, 30–32, 57–58: `trace(w↦R(w,u)v)` with `R=∇∇−∇∇−∇_[,]` | holds | none |

**Library declarations opened at the pin** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf): `Mathlib/Topology/Homotopy/Basic.lean` 76 (`Homotopy`); `Mathlib/Geometry/Diffeology/Basic.lean` 159, 197, 202, 284, 319, 353, 370, 412, 414 (the only Mathlib file mentioning `DiffeologicalSpace`; no product, subspace, pullback or functional diffeology); `Mathlib/Geometry/Manifold/ContMDiffMap.lean` 38; `Mathlib/Geometry/Manifold/ContMDiff/Defs.lean` 211; `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean` 27–41; `Mathlib/Geometry/Manifold/Submersion.lean` 26–40, 553; `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean` 72; `Mathlib/Geometry/Manifold/PartitionOfUnity.lean` 365, 555; `Mathlib/Topology/Homotopy/HomotopyGroup.lean` 441, 458, 547, 603; `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean` 15–32, 57; `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean` 123 (`IsEilenbergMacLaneSpaceOne`, confirming the docstring's "only the K(G,1) predicate"). `Suggested.lean` declares nothing, so the one-tactic padding probe and the `#check` binder comparison have no subject; the probe for R03 is the only Lean I elaborated besides the file itself.

**Cross-roadmap citations resolved** (main for roadmaps on main, the open head otherwise): GeneralizedCohomology G2.10 (main 405, 918), G3.8 (1660, 1718), G5.0 with `stableBSpin_hopfGenerator_cTwo` (1375, 1504–1506), G5.3 (1536), G5.6 (2212, 2228), G5 bundle-diagram interface (47, 1537); AlgebraicTopology Stage 6 (946), Stage 8 items 3, 5, 7, 10, 11b (1684, 1700, 1811, 1911, 1993–1997); CharacteristicClasses C2 (550), C4 (1037), C4.3 (1053–1055); TopologicalKTheory stable BO/BSO (106), exterior powers (185); SpinGeometry G4.1a/b (397, 425), G6 `realSpinLichnerowiczFormula` (636); DGFloer Layer 1 (735, 800); BordismFormalGroups F3–F5 (284–553) with its hand-off to StringOrientation (33–34, 323); SchemeAndStackFoundations §4.13 `bertini_smoothness` (5643, 5680); AffineMorseLefschetz A0 `complexProjectiveZeroLocus` (67–69); GeometricTopology collars and tubular neighbourhoods (205–207); RiemannianGeometry geodesics and exponential maps (722); ModularForms level-one dimension formula and q-expansions (10, 205); EllipticCohomology E4 (443, 846–849), E5 (866–922), E6 (1020, 1085–1090) and its "nothing consumed from StringOrientation" (1113–1117); IndexTheory I7 (723, 856, 863–865); TangentialBordism's supplier table citing S1.3, S1.5, S2.2, S2.3, S5.3 (19–30, 141, 2053–2055); FourManifolds consuming S1 (153, 1844–1849). IndexTheory is not in the merge order; the check places it after its last supplier, and it cites nothing from StringOrientation. GeneralizedCohomology's main README (line 47) still describes the structured Pontryagin–Thom as TangentialBordism's; TangentialBordism's own head assigns it to S2.2, so there is one owner.

**Sources, the seeded sample** (15 targets): S1.2 (rows 7–11), S1.3 (12–14), S2.2 (24–28), S2.3 (29–31), S3.0 (32–35), S3.1 (36), S3.2 (37–39), S3.4 (42–46), S3.5 (48, 69), S3.6 (46–47), S4.1 (49), S5.3 (54–55), S5.4 (56–59), S6.2 (64), S6.3 (65–68). Every arXiv locator was opened at the cited line in the sources cache (waldorf-string-connections, redden-canonical-3forms, cjmsw-bundle-gerbes, meinrenken-basic-gerbe, mctague-cayley-plane, the tmf-quotient paper, hopkins-icm2002, bmq-hurewicz, belmont-shimomura) and Hovey's AGT paper from the Rochester institutional copy; all agree with the README except the Meinrenken locator (R04). The README's key for the tmf-quotient paper (`mctague-tmf-quotient`) differs from the one under which the text is cached (`mctague-not-quotient`); there is no `sources.toml` in the folder (no roadmap on main has one), so this is a note only: when a manifest is written, reuse the existing key.

**Ownership against open pull requests**, checked by object in the sibling checkouts and with `roadmaps grep` (BString and λ, OP², the structured Pontryagin–Thom, `π₃S`, differential characters, bundle gerbes, the basic gerbe, diffeologies, the Witten genus, principal bundles): TangentialBordism, EllipticCohomology and FourManifolds agree with this README's ownership statements; the three overlaps with later roadmaps are recorded in R05; the one overlap with a roadmap on main (Orbifolds O2 item 6) is R02. DGFloer (main and head, line 49) only names the Cayley plane as an example it needs, consistent with S1.5 owning it.

## Not verifiable

- Stolz, Math. Ann. 304 (1996): paywalled; cited by locator only (the README marks it uncertified). The one-directional restatement agrees with McTague's paraphrase at mctague-cayley-plane lines 116–120.
- Borel–Hirzebruch I–II (p(OP²), Theorems 10.7 and 20.3), Milnor–Stasheff §8, §15, §18, Stong Chapter II, Bott–Tu Theorem 5.1, Lee Theorems 4.26 and 6.30, Toda Chapters V and XIII, Cheeger–Simons, Hovey–Ravenel Corollary 1.5: books or paywalled articles, all marked uncertified in the README and not fetched. The numerical input from Borel–Hirzebruch was checked indirectly by rows 18–20 (signature 1, `Â=0`, Wu classes); Theorems 10.7 and 20.3 as restated by McTague at lines 739–742 and 775–778.
- The lean-catdg repository is named as licensed comparison material only; not opened.

## Source issues

- **Misprint** in mctague-cayley-plane at Lemma 8's setup, printed page 16, lines 1017 and 1020: the source says the vertical `p₁` pulls back to `4n_f(x₁²+x₂²)` and writes `4n_f` in the String condition; it should be `4n_f²(x₁²+x₂²)`, since each `e_i` pulls back to `n_f` times an `x` and `p₁` is quadratic; affects nothing (only how large `n_f` must be).
- **Misprint** in waldorf-string-connections at equation (4.2.1), printed page 30, lines 1092–1097: the source says the degree-3 transgression is the exponential of the integral of the real 3-form; it should be `exp(2πi∫H)`, as the forms are real (lines 697–699, 727–730) and the degree-1 formula at lines 1210–1215 carries the factor; affects a stated result's normalization only.
- none further.
