# Review of GaugeQuiltFieldTheory (pull request #1076 at df970ca)

**Verdict:** accepted

Incremental re-review of the 40 lines changed since 023814f (the diff adds a `### From Tau Ceti` supplier contract, the determinant-line reorder isomorphism with two Checks, three Checks each for the GQ2 carrier and the GQ4 generalized objects, the Proposition 3.3.2 locator, and rewrites the Lean module docstring's reason for the field-theory headline being unstatable). All four findings of the previous review are repaired and no repair introduced a new problem. No finding. The gate passes, `Suggested.lean` elaborates with its three `sorry` warnings only, the dependency check reports no problem, and nothing outside the folder changed.

Source ids: `ww-coprime` = Wehrheim–Woodward, *Floer field theory for coprime rank and degree*, arXiv:1601.04924v2; `ww-orientations` = Wehrheim–Woodward, arXiv:1503.07803v6; `mww-functors` = Ma'u–Wehrheim–Woodward, arXiv:1601.04919v5; `dfl-atiyah-floer` = Daemi–Fukaya–Lipyanskiy, arXiv:2109.07032v1; `ss-newstead`, `ss-rank-two` = Scaduto–Stoffregen, arXiv:1707.06268v1 and arXiv:1707.06207v1. Line numbers are those of the worker's cached texts.

## Previous findings

- R01 — repaired: `README.md` lines 37–39 add `### From Tau Ceti` naming `TauCeti.AInfinityCategory`, `TauCeti.AInfinityFunctor`, `StrictUnit`, `StrictlyUnital`, `CohomologicalUnits`, `CohomologicallyUnital`, the `H⁰` names and `IsUnital`; line 43 keeps for DGAInfinity only transformations, the functor category and its `H⁰`; `Suggested.lean` lines 17–21 give the true reason (no `ℤ/4`-graded categories with shift, no functor category).
- R02 — repaired: line 171 "HeegaardFloer F0.0 orders its fibers as `det(ker D)⊗det(coker D)*`; construct the isomorphism of determinant line bundles over a Fredholm family between the two orders, fiberwise the exchange of the two graded factors with its Koszul sign `(−1)^(dim ker D·dim coker D)`, and prove it compatible with F0.0's stabilization charts and with the gluing exact sequence"; Checks at lines 183–184 (invertible `D`, sign `+1`; `diag(0,1,…,1)`, sign `−1`, not locally constant in the family `diag(t,1,…,1)`).
- R03 — repaired: `**Checks.**` at lines 98–102 (cylinder diagonal, the one-handle `g=1→2` with `L_1≅S³`, the empty one-handle from the sphere) and at lines 208–212 (length-one objects are FK branes with FK3 Hom complexes, the length-zero object only in `C(pt)`, the degrees `1,0,3` modulo four).
- R04 — repaired: line 70 "whose monotonicity clause its proof takes from Proposition 3.3.2 with the dual Coxeter number `c=r` of `SU(r)`; the proof of Proposition 3.3.2 cites the Drezet–Narasimhan theorem for `c₁=2c[ω]`"; line 88 `*Needs:*` and the References entry (line 282) name Proposition 3.3.2.

## Verified sound

**Gate, build and elaboration.** Worker's gate at df970ca: every check 0, `build=0`. My own run of the gate (`gate … --base origin/main`): every text check 0, `OK`. `git diff --stat origin/main...HEAD` outside the folder: empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. `lake env lean TauCetiRoadmap/GaugeQuiltFieldTheory/Suggested.lean` from the worktree (pins of `lake-manifest.json`): three `declaration uses sorry` warnings (lines 53, 61, 72), nothing else. The diff touches only the module docstring of `Suggested.lean` (lines 15–21); the five declarations are unchanged, and the worker's `signatures.md` shows the same elaborated types as the previous round, each matching its README statement (lines 51–55 of the previous report's comparison stand). The one-tactic probe of the previous review (`simp`, `rfl`, `infer_instance`, `simp_all`, `exact?`, `Subgroup.mem_center_iff`: none closes any of the three theorems) carries forward unchanged.

**Dependency check.**

```
depcheck: 239 roadmaps, 2366 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. ORDER: SmoothBundlesConnections 12, FukayaTheory 223, GaugeQuiltFieldTheory 285, InstantonFloerTheory 286 (a consumer; cited only under `## Downstream consumers`, `## Ownership and construction order` and GQ5's boundary paragraph, never in a `*Needs:*` line).

**The new Tau Ceti contract (lines 37–39, 214, 228, 274) and the docstring (Lean lines 17–21), checked at the pinned Tau Ceti.**

| name in the README | at the pin | agrees |
|---|---|---|
| `TauCeti.AInfinityCategory` | `TauCeti/CategoryTheory/AInfinity/Basic.lean` line 83, `structure AInfinityCategory (R : Type w) [CommRing R] (C : Type u)`; header lines 14–20: "uncurved nonunital `A∞` category on a graded linear quiver `C` over a commutative ring `R`", `mₙ` of degree `2 − n`; lines 35–39: "inputs in Keller's order `(aₙ, …, a₁)`", `m₂(g, f) = g ∘ f` | yes: uncurved, nonunital, over a commutative ring, Keller's order, `m₂(g,f)=g∘f` |
| `ℤ`-graded | the grading is an `InternalGrading` whose index type defaults to `ℤ` (`Algebra/Module/GradedModule/Internal.lean` line 93) and the Koszul twists of `Basic.lean` lines 103, 118 take integer degrees `(n : ℤ) − 1 − i` | yes |
| `TauCeti.AInfinityFunctor` | `Functor/Basic.lean` line 97, inside `namespace TauCeti` (line 82) | yes |
| `TauCeti.AInfinityCategory.StrictUnit`, `StrictlyUnital` | `Unit.lean` lines 57, 75, inside `namespace TauCeti` / `namespace AInfinityCategory` (lines 42, 48) | yes |
| `TauCeti.AInfinityCategory.CohomologicalUnits`, `CohomologicallyUnital` | `HomotopyCategory.lean` lines 335 (`structure CohomologicalUnits … : Prop`, fields `cycle`, `left_unit`, `right_unit`: closed degree-zero endomorphisms, identities on cohomology modulo boundaries) and 385 (`def CohomologicallyUnital : Prop := ∃ e, 𝒞.CohomologicalUnits e`), inside `namespace TauCeti.AInfinityCategory` (lines 42, 48, closed at 393) | yes: "cohomological units as a predicate" |
| `homCohomologyZero`, `homClass`, `homCohomologyComp` | `HomotopyCategory.lean` lines 99, 104, 294 (same namespace); a `Category` instance on `AInfinityHomotopyCategory 𝒞 h𝒞` at line 424 | yes |
| `TauCeti.AInfinityFunctor.IsUnital` | `Functor/HomotopyCategory.lean` line 191, inside `namespace TauCeti` / `namespace AInfinityFunctor` (lines 67, 76) | yes |
| "no transformations between `A∞` functors (only reduced transformations between morphisms of `A∞` algebras)" | `grep -ri transformation TauCeti/CategoryTheory/AInfinity`: no hit; the only transformation complex is `Algebra/Homology/AInfinity/Algebra/Hom/Transformation.lean` (`reducedTransformationComplex` for `AInfinityHom f g` of `A∞` algebras, lines 115, 330) | yes |
| "no `A∞` category of functors", "no `ℤ/4`-grading" | `grep -ri 'functor category\|category of functors' TauCeti/CategoryTheory/AInfinity`: none; `grep -r 'ZMod 4\|Fin 4' TauCeti/CategoryTheory/AInfinity`: none | yes |

The DGAInfinity contract (line 43: "`A∞` natural transformations, the `A∞` category of functors and its `H⁰` over `ℤ`") resolves on main (eaf17b1): `TauCetiRoadmap/DGAInfinity/README.md` lines 328–329 "`A∞` functors, transformations, and the `A∞` category of functors. Build `H⁰`, strict identities, cohomological identities"; line 74 the Koszul sign. DGAInfinity has no `ℤ/4` grading (`grep 'ℤ/4'`: none), so GQ4's construction of the `ℤ/4`-graded variants (line 43) is not a duplication. Line 258's `*Needs:* DGAInfinity (`A∞` functor categories and their `H⁰`)` (unchanged) is the same passage.

**Supplier passages re-resolved this round (the heads of two suppliers moved since the previous review).**

| citation | where it is | position |
|---|---|---|
| HeegaardFloer F0.0 order (line 171) | main, `TauCetiRoadmap/HeegaardFloer/README.md` line 1464 "The stabilized determinant charts identify fibers with det ker T tensor (det coker T)*"; line 1503 the same on the native Fredholm carrier; headings 2.2 (F0.0) line 1388, 3.4 (F1.4) line 2195 | main |
| InstantonFloerTheory IF0, IF9 (lines 80–82, 274, 278) | open head 22d369ab (`rev/1083`, moved from 1fb9d4da): line 18 supplier row "GaugeQuiltFieldTheory GQ1 … The one owner of the fixed-determinant coprime surface moduli"; line 43 `B(X,Y)=−tr₂(XY)`, left action `gAg⁻¹−(dg)g⁻¹`; line 45 `δCS_A(a)=−(1/(4π²))∫_Y tr₂(a∧F_A)`; line 355 "owned by GaugeQuiltFieldTheory GQ1; consume it rather than rebuilding it from R5 … Construct here the adapter to IF0's SO(3) connections on ad E"; line 364 "GQ1 normalizes the form as `Ω(a,b)=−(1/(4π²))∫_Σ tr₂(a∧b)` … The unnormalized pairing … equals 4π²Ω … GQ1 states no complex structure. For a chosen surface metric construct here the Hodge-star complex structure"; line 360 the genus-one fixed point "(GQ1's check)"; line 373 `*Needs:* GaugeQuiltFieldTheory GQ1` | ORDER 286, consumer |
| FukayaTheory FK0, FK1.1, FK3, FK3.1, FK4.2, FK6.1 (lines 35, 186, 214, 242) | open head a9067d8e (`rev/1045`, moved from 63eca59c): headings at lines 100, 210, 468, 470, 650, 750; the monotone convention `ω(B)=2τc₁(B)`, `ω(β)=τμ(β)` at lines 472, 490, 752 | ORDER 223 |
| DGAInfinity (lines 43, 214, 228, 258) | main, lines 74, 328–329 | main |

The worker's citation resolver and overlap scan found nothing (no dropped id, no other open pull request changing this folder); confirmed against `scratch/overlaps.md` and `scratch/citations.md`.

**Seeded sample.** "Rank two, odd degree" (line 80) is untouched by the diff; its witnesses (`dfl-atiyah-floer` lines 228–235, 241–246, 256–266, 673–682; `ss-newstead` lines 15–28) were checked in the previous review and the paragraph is unchanged. "InstantonFloerTheory": re-resolved at the new head 22d369ab as in the table above; the division of ownership stated at README lines 80, 82, 274 and 278 (GQ1 owns the surface moduli, the `H¹(X;ℤ/2)` action and the `4π²` comparison; IF9 owns the `SO(3)` adapter and the Hodge-star complex structure) is exactly what IF9 says at its lines 355 and 364.

**Source locators checked this round.** `ww-coprime` line 1186 "for `G = SU(r)` the dual Coxeter number is `r`" (`⟨ρ,α₀⟩+1 = (r−1)+1`); Proposition 3.3.2 lines 1187–1192 (compact symplectic orbifold of dimension `(2g−2)dim G₀`, monotone with constant `1/2c` when `[G,G]` is simple); its proof's closing lines 1219–1223 (monotonicity "a variation on the Drezet–Narasimhan theorem [14, Theorem F]", `c₁(M(P))` is `2c` times the symplectic class); the proof of Theorem 3.3.3 lines 1262–1263 ("the symplectic structure and monotonicity follow from Proposition 3.3.2 together with dual Coxeter number `c = r`"): README line 70 restates this exactly. Lemma 3.4.4 lines 1386–1397: compression body between surfaces of positive genus with `g(X₊) ≥ g(X₋)`; (b2) `H¹(Y) → H¹(X₊)` injective and `H¹(Y) → H¹(X₋)` surjective: the Checks at lines 101–102 use (b2) and the positive-genus hypothesis as stated.

**Adversarial table** (rows marked "r3" carry the previous report's computed rows for statements the diff leaves untouched; the other rows are computed this round).

| statement | instances tried | values on each side | result |
|---|---|---|---|
| `relationModuli_genus_one`, `relationSet_stabilizer_central`, `relationModuli_simplyConnected` (Lean 53, 61, 72) | r3 rows: `r=1`; `r=2,ζ=−1` with `A=diag(i,−i)`, `B=[[0,1],[−1,0]]`; `ζ=1` negative control; `g=0` empty; `g=2,r=2` | r3: unique orbit by Stone–von Neumann; `(1,1)` and `(diag(i,−i),diag(i,−i))` non-conjugate when `ζ=1`; `u=diag(e^{iθ},e^{−iθ})` forced to `±1`; `hg` excludes the empty case | true (unchanged; r3) |
| GQ1 Checks, tensoring, rank-two paragraph, `4π²` comparison, GQ2a–GQ2c classes and lifts, `τ_FK=τ_WW/2`, zero-extension and shift Checks, weighted adjoints (lines 61–86, 106–176, 216–262) | r3 rows | r3 values (`τ_WW=1/(2r)`, `c₁=2α=4[Ω]` at `r=2`, `w₂(TL_2)=p*(α mod 2)≠0`, `(−1)^{ind D₁ ind D₂}`, `e^{λs}De^{−λs}=∂_s+A−λ`, …) | true (unchanged; r3) |
| dual Coxeter number `c=r` of `SU(r)` (line 70) | `r=2,3` | `h^∨(SU(r))=r`: `⟨ρ,α₀⟩=r−1`; `SU(2)`: `2`, `SU(3)`: `3`; monotonicity constant `1/(2c)=1/(2r)=τ_WW` of line 68 | consistent with `ww-coprime` 1186, 1191–1192, 1263 |
| cylinder Check (line 100) | `g=1`; `g=2,r=2`; `g=0,r≥2` | `π₁([0,1]×X)=π₁(X)`, `M(Q)=M(P)`, image the diagonal of dimension `dim M(P)=(2g−2)(r²−1)`: `0` (point in a point), `6` (half of `12`), empty; pairs of end classes alone: `dim 2(2g−2)(r²−1)=12` at `g=2`, not half | true |
| one-handle `r=2`, `g=1→2` (line 101) | the handle holonomy `C∈SU(2)`, meridian `1` | `π₁(Y)=ℤ²*ℤ`; relation `[A,B][C,1]=[A,B]=−1` unchanged; `M(Q)=R_1×_{SU(2)}SU(2)=(SU(2)/±1×SU(2))/SU(2)≅SU(2)=S³` (the center acts trivially by conjugation), `dim 3=(2·1−1)·3`; `dim H¹(X₊;ad)=(2·2−2)·3=6`, `H¹(Y;ad)` of dimension `3` injects by (b2); the genus-one end is the point | true; agrees with GQ2b's `L_1≅S³` (line 150) and the dimension count `(2g−1)(r²−1)` (line 151) |
| one-handle from the sphere (line 102) | `r≥2` coprime `d`; `r=1` | torus end holonomies `(C,1)`: `[C,1]=1≠z=exp(2πid/r)` for `r≥2`, `gcd(r,d)=1`: empty; `M(P_-)=∅` by Theorem 3.3.3(b), so `∅×M(P₊)=∅`; without the central relation: `Hom(ℤ,SU(r))/conj=SU(r)/conj≠∅`; `r=1`: `z=1`, the relation holds, a point (the Check says `r≥2`) | true; Lemma 3.4.4 excluded (line 1387 needs positive genus on both ends); the empty value is line 224 |
| reorder isomorphism (line 171) | `det(coker D)*⊗det(ker D)` → `det(ker D)⊗det(coker D)*` | exchange of factors of degrees `dim coker D`, `dim ker D`: Koszul sign `(−1)^{dim ker D·dim coker D}`; F0.0's order at HeegaardFloer line 1464 | the stated isomorphism is the braiding; consistent |
| reorder Check, invertible `D` (line 183) | `D=1` | `ker=coker=0`, `det 0=ℝ`, sign `(−1)^0=+1`, both orders `ℝ⊗ℝ=ℝ` | true |
| reorder Check, `diag(0,1,…,1)` (line 184) | `n≥1`; family `diag(t,1,…,1)` | `ker=ℝe₁`, `coker=ℝⁿ/⟨e₂,…,eₙ⟩`, both one-dimensional, index `0`, sign `(−1)^{1·1}=−1`; `t>0`: invertible, sign `+1`: not locally constant at `t=0` | true |
| length-one object Check (line 210) | `(pt→M)` | `pt⁻×M=M`; a brane `L⊂M` with FK1.1 data; cyclic quilt with one patch, no seam: the FK3 Floer complex `CF(L₀,L₁)` in `M`; a seam for `pt` would be a second patch | consistent |
| length-zero object Check (line 211) | `M=pt`; `M≠pt` | a generalized object is a sequence `pt→M₁→…→M`; the empty sequence has target `pt`, so exists in `C(pt)` only | true; the empty value (line 224) is `C(∅)`, distinct |
| degrees modulo four (line 212) | `k=1,2,3`; arity `2` | `|m_k|=2−k`: `1,0,−1≡3`; a term `m_{k−j+1}∘m_j` has degree `(2−(k−j+1))+(2−j)=3−k`; arity two: `1` for all three terms; `|m_k|=k−2`: `m₃↦1`, `m₁↦−1≡3` | true; agrees with Tau Ceti's degree `2−n` (`Basic.lean` line 20) and DGAInfinity's cohomological convention |
| Lean docstring reason (lines 17–21) | the pinned carriers | `ℤ`-graded, units a predicate, no functor transformations, no functor category, no `ℤ/4`: the table above | true |

**Convention witnesses recomputed in every user.** `B=−tr/(4π²)` (README lines 15, 43, 74, 82; IF0 line 43 and IF9 line 364 at 22d369ab); `τ_WW=1/(2r)` (lines 68, 70, 176, 180); the monotone convention `ω(B)=2τc₁(B)`, `ω(β)=τμ(β)` (line 35; FukayaTheory lines 472, 490, 752 at a9067d8e); the determinant-line order (line 171 versus HeegaardFloer line 1464, now compared explicitly); Keller's order and `m₂(g,f)=g∘f` (line 39; Tau Ceti `Basic.lean` lines 37–39).

**Duplication and ownership.** The new contract takes the `ℤ`-graded carriers from Tau Ceti (the pin) rather than from DGAInfinity, as the deferral rule requires, and leaves to DGAInfinity only what the pin lacks; GQ4's `ℤ/4`-graded variants and shift target exist nowhere at the pin or on main (`grep` for `ℤ/4` in DGAInfinity: none). No other open pull request changes this folder or defines the twisted relation set (r3's `roadmaps grep --lean-only 'relationModuli|relationSet|specialUnitaryGroup'` stands; the Lean declarations are unchanged). Ownership against the open pull requests was checked through the brief's sibling checkouts and `roadmaps grep`.

**Headlines and padding.** Unchanged since r3: the headline theorems (the connected field-theory functor, the smooth symplectic structure with `c₁=2r[ω]`, the elementary correspondences and the relative-spin identity, the Cerf invariance) are not statable at the pins and the docstring now names each with a correct reason; the three representation-model theorems are stated; nothing in the file is padding.

## Not verifiable

- Atiyah–Bott (1983) and Drezet–Narasimhan (1989), cited through `ww-coprime` lines 1220 and 1266: paywalled; read only the citing lines. The monotonicity constant is witnessed by the rank-one and rank-two computations of r3's table.

## Source issues

- **Error** in ww-coprime at Theorem 3.4.3, printed p. 32: the source says that the Lagrangian of an elementary bordism is spin, its proof (lines 1384–1385) treating `L(Q)→M(P₋)` as a principal `G₀`-bundle; it should be a `G₀/Z(G₀)`-bundle, and for `r=2`, `d=1`, `g=2→3` the Lagrangian has `w₂=p*(α mod 2)≠0`; affects a stated result.
- **Error** in ww-coprime at eq. (26) and Theorem 3.3.3(a), printed pp. 27–29: the source displays the form with the basic inner product and no `1/(4π²)` and states `c₁=2r[ω]`; it should rescale the form by `1/(4π²)`, without which the class is `4π²` times an integral class; affects a stated result (the constant).
