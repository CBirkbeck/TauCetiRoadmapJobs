# Review of TopologicalSheafCohomology (pull request #2533 at c360674)
**Verdict:** needs changes

**Summary.** Changes are needed for two findings, both caused by the pinned libraries and a supplier changing under text that did not change. The §1.3 compact Hausdorff Čech/derived comparison is now statable against Tau Ceti's `TauCeti.Topology.cechCohomology`, yet `Suggested.lean` leaves it out and says its carrier does not exist; and SchemeAndStackFoundations §2.5 now supplies the Godement resolution for sheaves valued in an abelian category, so the supplier contract and one §0.1 Check describe a construction it does not state. The two rewritten passages about ImplicitAtlases are accurate. There are three small corrections and two format notes, none blocking, and nothing is left for a human to decide.

## R01 (P2) — The compact Hausdorff Čech/derived comparison of §1.3 is statable at the pins, but `Suggested.lean` leaves it out and says its carrier does not exist

One of the roadmap's three headline theorems is missing from the acceptance test. The module docstring (`Suggested.lean`, lines 10–12) also tells an implementer that the cover-refinement cohomology diagram and its all-cover colimit "have no native carrier". That is false at the pinned Tau Ceti. `TauCeti.Topology.cechCohomology X A n` (`TauCeti/Topology/Sheaves/Cech/Colimit.lean:70`) is the colimit over point-neighbourhood covers, ordered by existence of a refinement. This is exactly the object §1.2 defines. Every u-small cover maps to it by `TauCeti.Topology.toCechCohomology` (`Cech/Cofinal.lean:67`), and on compact spaces `TauCeti.Topology.finiteCechCohomologyIso` (`:96`) computes it by finite covers.

Elaborated in a copy of the file, the following statement checks at the pins with only the `sorry` warning, after `import TauCeti.Topology.Sheaves.Cech.Colimit`. The instance `HasColimitsOfShape (PointOpenCover X) (ModuleCat.{u} R)` is found automatically.

```lean
theorem nonempty_cechCohomologyIsoRightDerived (R : Type u) [CommRing R] (X : TopCat.{u})
    [CompactSpace X] [T2Space X]
    [HasSheafify (Opens.grothendieckTopology X) (ModuleCat.{u} R)]
    [(Sheaf.Γ (Opens.grothendieckTopology X) (ModuleCat.{u} R)).Additive]
    [HasInjectiveResolutions (X.Sheaf (ModuleCat.{u} R))] (n : ℕ) :
    Nonempty (TopCat.Sheaf.forget (ModuleCat.{u} R) X ⋙
        TauCeti.Topology.cechCohomology X (ModuleCat.{u} R) n ≅
      (Sheaf.Γ (Opens.grothendieckTopology X) (ModuleCat.{u} R)).rightDerived n) := by
  sorry
```

The smallest repair has three parts:
- Add this statement, or the same one under a name of the author's choice.
- Name it in §1.3, and name `TauCeti.Topology.cechCohomology` under "From Tau Ceti".
- Narrow the docstring so that it names only the §1.4 hypercohomology comparison and its two spectral sequences as lacking a carrier: the cover-refinement hypercohomology diagram and its pagewise colimits.

## R02 (P2) — SchemeAndStackFoundations §2.5 supplies the Godement resolution for sheaves with values in an abelian category, not for ring-sheaf modules, so the supplier contract and a §0.1 Check describe a construction the supplier does not state

An implementer following §0.1 will look in the supplier for a ringed-space resolution to transport through R_X. They will then test the result against a complex that the supplier's resolution does not produce.

The supplier contract (line 45) says to consume §2.5's resolution "on topological ringed spaces with enough points" and to apply it to R_X "after §0.1's equivalence". The scope bullet (line 9) says §2.5 owns it "for abelian sheaves and ring-sheaf modules". SchemeAndStackFoundations §2.5 on main (its README, lines 4275–4283) states something else:
- The resolution is Tau Ceti's `TauCeti.Topology.godementResolution C X` (`TauCeti/Topology/Sheaves/Godement.lean:365`).
- It is defined for an abelian category C with products and colimits.
- G^(n+1)(F) is the Godement sheaf of the previous cokernel.
- It applies directly to `TopCat.Sheaf (ModuleCat.{u} R) X`, with `quasiIso_toGodementResolution_app` (`:394`) and `isFlasque_godementResolution_obj_X` (`:377`).

On a point with F = ℤ/4 this resolution has G⁰ = ℤ/4 and Z¹ = coker(id) = 0. Its sections complex is therefore ℤ/4, 0, 0, … . The Check at line 74 instead calls the complex "ℤ/4 in every degree with differentials alternately 0 and the identity". That is the cosimplicial complex of Stacks Lemma 20.30.1 (stacks-cohomology line 3083). Both complexes have H⁰ = ℤ/4 and Hⁿ = 0 for n > 0, so the Check's conclusion stands; only its description of the supplier's object is wrong.

The smallest repair:
- State the contract as §2.5's C-valued resolution taken with C = `ModuleCat.{u} R`, which needs no transport, and adjust line 9 to match.
- The constant-ring equivalence is itself at the pin as `TopCat.sheafModuleCatEquivLocallyConstant`. It is then needed only for the comparison with ring-sheaf modules.
- In the Check, either describe the supplier's complex (ℤ/4 in degree 0 and zero above) or say explicitly that the alternating complex is the cosimplicial one of Stacks 20.30.1.

## C01 — The Layer 2 headline `properFiniteFiberStalk` is already proved at the pin, and `fiberStalkMap` is the pinned map, so as a target it asks for nothing more

In a copy of the file, `fiberStalkMap R f F y = TopCat.Presheaf.fiberStalkMap (ModuleCat.{u} R) f F.obj y` holds by `rfl`. The theorem closes with the single term `TopCat.Presheaf.isIso_fiberStalkMap F hf.isClosedMap (hfin y)` (`TauCeti/Topology/Sheaves/FiberStalk.lean:256`), which needs only a closed map and the one fibre over y finite. The naturality, identity and composition laws of §2.1 are `fiberStalkMap_naturality` (`:109`), `isIso_fiberStalkMap_id` (`:137`) and `fiberStalkMap_comp` (`:174`). This is the roadmap's own target implemented, and the statement remains a passed test.

The smallest repair is either of two options. One is to say in the module docstring that this headline is proved at the pin by `TopCat.Presheaf.isIso_fiberStalkMap`. The other is to restate it against `TopCat.Presheaf.fiberStalkMap` with `import TauCeti.Topology.Sheaves.FiberStalk` and drop the local definition. In either case "From Tau Ceti" would name these declarations.

## C02 — Two Tau Ceti files named in the supplier contracts do not exist at the pin

`TauCeti/Topology/Sheaves/Flasque.lean` (line 38) is now `TauCeti/Topology/Sheaves/Flasque/Basic.lean`, with the three cited declarations at `:82`, `:135` and `:142`. `TauCeti/CategoryTheory/Sites/SheafCohomology/Cech.lean` (line 40) is now `.../SheafCohomology/Cech/Basic.lean`, with `cechAugmentation` at `:496` and `quasiIso_cechAugmentation_iff` at `:644`. The declaration names are right; only the paths need changing.

## C03 — The rewritten downstream paragraph reads as if ImplicitAtlases identified all of its K-presheaf hypercohomology with §1.4

Line 221 says ImplicitAtlases identifies "its compact-cover K-presheaf hypercohomology with them through its §0.6". ImplicitAtlases §0.7 (its README, line 202) makes the identification only for the K-sheaf complex F^K that §0.6 attaches to a bounded-below complex of sheaves. A general K-presheaf complex has no open-cover counterpart. Line 10 already says this precisely. Line 221 would read "identifying, through its §0.6, its compact-cover hypercohomology of the K-sheaf complexes attached to complexes of sheaves with them".

## N01 — `moduleCohomologyForgetComparison` concludes `Nonempty (… ≅ …)` without a `nonempty_` name

Under the house convention, either rename it `nonempty_…` or state the canonical map with `IsIso`. The degree-zero normalisation and connecting-map compatibility of §0.1 can only be carried by the latter.

## N02 — Stacks Lemma 20.9.2 is cited at "pp.9–10" (line 134), but it lies entirely on p.10 (stacks-cohomology line 407)

## Verified sound

The previous review had no findings. The cycle it carried from earlier rounds (R01, with ImplicitAtlases) stays repaired: line 10 says "None of these is an input here", no *Needs:* line cites ImplicitAtlases, and the dependency check reports no problem.

| Statement | Instances | Roadmap side (computed) | Other side (source, library, Lean) | Result | Change |
|---|---|---|---|---|---|
| §0.1 constant-ring adapter (sample) | two discrete points, R=ℤ; point | Γ(R_X)=ℤ², constants r↦(r,r), (2,3)·(x,y)=(2x,3y); point: identity | `TopCat.sheafModuleCatEquivLocallyConstant` elaborates; Stacks 20.30.1–2, pp.65–66 | consistent | none |
| §0.1 headline V RⁿΓ_R ≅ HⁿU | point, R=ℤ/4, F=ℤ/4; X=∅ | ℤ/4 self-injective: R⁰=ℤ/4, Rⁿ=0; ∅: 0 | Ext^n_Ab(ℤ,ℤ/4)=ℤ/4,0,0…; ℤ/4 not divisible, so U loses injectivity; probes (instance, refl, simp) fail | consistent, not padding | N01 |
| §0.1 Godement Check, line 74 | point, F=ℤ/4 | supplier: G⁰=ℤ/4, Z¹=0, complex ℤ/4,0,0,… | Stacks cosimplicial: ℤ/4 every degree, d=0,1,0,…; both H⁰=ℤ/4, Hⁿ=0 | description wrong | R02 |
| §0.1 acyclic-resolution route | flasque module sheaves | embed in injective (flasque), cokernels flasque, Γ exact on their SES | stacks-derived lines 2835–2840 (p.56), 2966–2970 (p.59) | consistent | none |
| §0.2 bounded-below sections (sample) | point ℤ --2→ ℤ in degrees 0,1; shift; b=−1, m=1 | H⁰=0, H¹=ℤ/2; F[1] differential −2; bidegrees (−1,2),(0,1),(1,0) | Stacks (20.3.0.1)–(20.3.0.3) p.3; 20.30.2 p.66 | consistent | none |
| §1.1 fixed-cover complexes (sample) | repeated two-index point cover | ordered d(a,b)=b−a: H⁰=diagonal ℤ, H¹=0 | tuple d=(0,b−a,a−b,0), same cohomology; Stacks 20.23.1–6 pp.40–43 | consistent | none |
| §1.1 prism sign | indices 2,3 refined by singleton | hδ(a,b)=b−a=T₃−T₂ | Stacks §20.25 p.47 ends T_t′−T_t; §20.15 printed γ−γ′ gives a−b | README right, source misprint | none |
| §1.2 cofinal cover systems (sample) | ∅ with P(∅)=ℤ; Sierpiński; ℚ | colimit 0; H⁰=graph≅P(X), H¹=0; no finite refinement of (n,n+2)∩ℚ | `isZero_cechCohomology_obj_of_isEmpty` gives 0; Pardon A.4.2, A.4.4 pp.119–120 | consistent | none |
| §1.3 headline (sample) | S¹ two arcs; point; ∅ | d(a,b)=(b−a,b−a): Čech⁰=ℤ, Čech¹=ℤ; point F(pt),0; ∅ 0 | R¹Γ(S¹;ℤ)=ℤ; probe statement on `cechCohomology` elaborates; Stacks 20.16.2 pp.26–28 | statable, absent | R01 |
| §1.3 locally zero presheaves | {a,b}: P(∅)=ℤ, else 0 | tuple C¹=ℤ², cocycles (u,−u): Čech¹=ℤ; P^#=0 gives 0 | `isZero_cechCohomology_obj_of_isZero_sheafify` assumes P(∅)=0, compact normal | consistent | none |
| §1.4 headline (sample) | unit square; point F=(ℤ --2→ ℤ); b=−1, m=1 | paths −1,+1; H⁰=0, H¹=ℤ/2; first E₂=(0,ℤ/2) | Stacks: (−1)^(p+1)d_F on Čech-degree p+1, p.46; Pardon A.4.13: E₁=Ȟ^q(F^p) | consistent; still no pinned carrier | none |
| §2.1 headline (sample) | {a,b}→pt, stalks ℤ, ℤ/2; (0,1)→ℝ; two origins | (3,1)↦(3,1); ℤ→0 not iso; diagonal ℤ→ℤ² not onto | pinned map equal by `rfl`; one-term proof by `isIso_fiberStalkMap`; Pardon A.3.2, A.4.8 | true, proved at pin | C01 |
| Supplier file paths | From Tau Ceti, lines 38, 40 | `Flasque.lean`, `SheafCohomology/Cech.lean` | absent; names at Flasque/Basic.lean:82,135,142; Cech/Basic.lean:496,644 | path drift | C02 |
| Lines 10, 221 (this change) | ImplicitAtlases on main | §0.7 consumes TS1.1–1.2 and §1.4; §6.5 consumes TS1.1 | ImplicitAtlases README lines 86–87, 202, 216, 766 | accurate; 221 loose on K-presheaves | C03 |
| Conventions and binders | `#check @` of all three | six instance binders plus n; `T2Space X`, `IsProperMap`, every fibre finite | README lines 17, 23, 197 | match, none lost | none |

- Source locators checked against the text: 30, all on the stated pages except Lemma 20.9.2 (N02). Of these, 19 are in stacks-cohomology, 2 in stacks-derived and 9 in pardon.
- Library declarations opened at the pins: about 30, among them:
  - `TauCeti/Topology/Sheaves/Cech/Colimit.lean:70`, `:76`, `:84`
  - `Cech/Cofinal.lean:67`, `:96`
  - `CoverSystems.lean:51`, `:107`, `:192`
  - `FiberStalk.lean:83`, `:256`
  - `Godement.lean:365`, `:377`, `:394`
  - `LocallyConstant.lean:491`
  - `Cech/LocallyZero.lean:153`
  - Mathlib `IsProperMap.isClosedMap` (`Topology/Maps/Proper/Basic.lean:92`)
- Cross-roadmap citations resolved on main (faef063):
  - SchemeAndStackFoundations §2.5 exists but has drifted (R02).
  - ImplicitAtlases §§0.5–0.11, §0.6, §0.7 and §6.5 resolve.
  - CharacteristicClasses C1.2b (line 715) and S0–S5 (lines 604, 624) resolve.
  - ComplexKahlerGeometry Layer 2 (K2) resolves.
- Dependency check: `depcheck: 200 roadmaps, 2189 edges, 0 problem(s)`. ImplicitAtlases (order line 231) consumes this roadmap (line 333); that inversion is in ImplicitAtlases' own edges, and this roadmap cites no later supplier.
- Elaboration: `lake env lean Suggested.lean` exits 0 with two `sorry` warnings (lines 32, 63). The `#check @` types match the README. One-tactic probes fail on line 32; line 63 closes with one term (C01).
- Automatic checks: one hit (the `Nonempty` conclusion), kept as N01. The diff is 2 changed lines in README.md, and nothing outside the folder changed.
- Ownership: the roadmap search covered 355 open heads and main. No open pull request changes this roadmap or co-owns its objects. The roadmap's own generated progress log records the pinned Tau Ceti Čech and stalk declarations as implementations of its targets, so they are not counted as duplicates.

Overlap check: read ImplicitAtlases, SmoothBundlesConnections and HilbertModules; the open-roadmap and results lists were empty. Shared objects and their owners:
- Open-cover Čech hypercohomology (§1.4) and TS1.1–TS1.2: owned here; ImplicitAtlases consumes them.
- Compact-cover K-presheaf hypercohomology and its comparison: owned by ImplicitAtlases.
- Čech diagrams over smooth good covers: owned by SmoothBundlesConnections, built on Tau Ceti's fixed-family maps.
- Refinement maps and the point-neighbourhood colimit, restricted to three abelian sheaves: HilbertModules H5 also plans these. That duplicate is in HilbertModules' folder and cannot be repaired here.

Source independence: 17 passages compared with 3 sources, none shared beyond forced formula phrases (the longest common run is 4 words, beside Pardon footnote 42). The largest share is stacks-cohomology, 28 of 50 locator mentions. Contents compared with stacks-cohomology: independent. Layer 0 draws on its §§3, 12 and 30, Layer 1 on §§15, 23, 16, 11 and 25 in a different order, and Layer 2 on Pardon.

Research link: §§1.1–1.2 and 1.4 are the open-cover Čech foundations that Pardon (arXiv:1309.2370, Geom. Topol. 2016) uses for virtual fundamental cycles. ImplicitAtlases §0.7, and GromovWittenTheory through it, consume them. This rests on README line 10 and on pardon Appendix A, Definition A.4.3 and Lemma A.4.13.

## Not verifiable

- none: all three cited texts were read at their locators, and ownership was checked against every open head with the roadmap search.

## Source issues

- **Misprint** in stacks-cohomology at Section 20.15 (tag 09UY), printed p.24: the source says the first refinement map minus the second equals dh+hd for its h; it should be the second minus the first, as its own §20.25 computation on p.47 concludes; affects the proof.
- **Misprint** in pardon at Remark A.4.1, printed p.119: the source says the containing coarse member is indexed by f of a coarse index; it should be indexed by f of the refining index; affects nothing.

## For the human reviewers

- none
