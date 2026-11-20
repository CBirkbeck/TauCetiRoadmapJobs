# Review of ContactGeometry (pull request #2684 at 71e7c7e)
Folder: `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/`
**Verdict:** accepted

**Summary.** Accepted: there is no finding. Every formula, Check and worked example was recomputed and holds; all 21 source locators were read at the text and support the statements as written; `Suggested.lean` elaborates with `sorry` as its only warning. There are six small corrections and no format notes, none blocking. Five carry over from the previous review of this same head (the description's sentence on the anchors, the Summary's "contact predicate fixed here", the missing locator of §6.1, the unnamed owner of the subbundle structure in §1.1, two clauses of the family README); one is new, an ambiguous "strict exactly when" in §2.3. One question is left for a human: the most-cited source is a set of unpublished course notes.

## C01 — The description says that the old heading anchors no longer exist and that the linking files must be updated, which this head contradicts

A reader of the description would edit the SymplecticGeometry README and CotangentLagrangian for nothing. Under "What changed in form" it says: "The heading anchors `#cg1--…`, `#cg4--…`, `#cg5--…` and `#cg6--…` no longer exist. The SymplecticGeometry root README and CotangentLagrangian link to them; those links need updating in those files." At this head the README defines exactly those four ids, at lines 110, 488, 606 and 811, immediately before the Layer 1, 4, 5 and 6 headings, and they equal the link fragments at lines 70–76 of `TauCetiRoadmap/SymplecticGeometry/README.md` and at lines 364, 379, 380 and 736 of CotangentLagrangian on main.

This would be right: "The old heading anchors `#cg1--…`, `#cg4--…`, `#cg5--…` and `#cg6--…` are kept as explicit anchors before the Layer 1, 4, 5 and 6 headings, so the links to them from the SymplecticGeometry README and CotangentLagrangian still resolve."

## C02 — The Summary says CotangentLagrangian "uses the contact predicate fixed here", although the predicate is Tau Ceti's and CotangentLagrangian is a supplier of this roadmap

The sentence makes the two roadmaps read as suppliers of each other. The Summary (lines 35–36) lists CotangentLagrangian among the suppliers and adds "and it uses the contact predicate fixed here". Convention 5 (line 88) adopts `TauCeti.SmoothForm.IsContactForm`, defined at `TauCeti/Geometry/Contact/Basic.lean:100`, and Scope and ownership (lines 923–924) lists it as already in the library. Meanwhile CotangentLagrangian, on main (line 364) and at the head of its open revision #2687 (line 532 and its contract "From TauCetiRoadmap.SymplecticGeometry.ContactGeometry"), names "ContactGeometry CG1" as the owner of the predicate. Layer 1 here needs nothing from CotangentLagrangian and §5.6 needs only its §2.2, so there is no cycle between sections; the sentence is what suggests one.

Downstream consumers (lines 905–907) already says it correctly. In the Summary, for example: "… the unit cosphere bundle, whose contact forms are stated with Tau Ceti's contact predicate, the one adopted in the Conventions".

## C03 — The Jacobi-bracket headline of §6.1 cites no source, although two of the cited texts state the correspondence it rests on

§6.1 (lines 815–840) is the one headline tested in Lean without a reference: neither the section nor the docstrings of `jacobiBracket`, `contactHamiltonianVectorField_jacobiBracket` and `jacobiBracket_jacobi` carries a locator. Kriegl–Michor 43.15, p. 472 (KrieglMichor1997 lines 21623–21632) states that the contact vector fields form a Lie algebra which contraction with `α` maps bijectively onto `C^∞(M)`; Geiges, Theorem 2.22, p. 16 (GeigesHandbook lines 530–546) states the same correspondence with the equations of Convention 7. Either, cited at §6.1 and in the three docstrings, would do; the bracket formula itself is then the transported Lie bracket, as the section already proves.

## C04 — §1.1 and §1.2 use `D` and `ξ⁰` as smooth subbundles without citing the declarations and the roadmap section that already provide that structure

An implementer of §1.1 would build the bundle structure on `D` again. The section treats `ξ` as a smooth bundle ("a smooth bundle isomorphism `ξ ≅ Hom(ξ, L)`", "a smooth section of `Hom(Λ²D, TM/D)`") and completes a frame of `D` to a frame of `TM`, and §1.2 makes `ξ⁰` a line subbundle; the *Needs* lines (139–142, 174–178) and the supplier contracts name no owner for these. At the pin, Tau Ceti makes a `C^n` distribution of rank `k` a `C^n` vector bundle from its local frames: `TauCeti.IsContMDiffDistribution.fiberBundle`, `.vectorBundle` and `.contMDiffVectorBundle` (`TauCeti/Geometry/Manifold/Distribution/VectorBundle.lean:145`, `:173`, `:191`). On main, LieGroupoidsPoisson §G0.1 plans the rest: subbundle frames extending to frames of the ambient bundle, and kernels of constant-rank bundle maps as subbundles (its README lines 374–381). The quotient bundle `TM/D` itself is at neither place, so it stays a target here, as the docstring of `Suggested.lean` says.

Adding the three Tau Ceti declarations and "LieGroupoidsPoisson §G0.1 (subbundle frames and kernels)" to the two *Needs* lines and to the supplier contracts would settle it.

## C05 — The family README describes Layers 1 and 4 in terms this README does not support

A reader who follows the family index into this README finds two of its clauses contradicted (`TauCetiRoadmap/SymplecticGeometry/README.md`, lines 70–75):

- "ContactGeometry CG1 owns the contact predicate": Layer 1 consumes Tau Ceti's predicate (line 118).
- "CG4 and CG5 consume the cosphere application": no *Needs* line of Layer 4 (lines 517–519, 539–540, 561–564, 587–588) names CotangentLagrangian; only §5.6, and §6.4 through it, use its §2.2.

The family index belongs to this pull request's tree, and the open revision of the family README (#2696, lines 521–524 at its head) carries the same two clauses, so the rewording can go in either; for example "CG1 builds the contact line and the line-valued Levi form on Tau Ceti's contact predicate; CG5 (§5.6) consumes the cosphere application".

## C06 — In §2.3, "strict exactly when `R_α H = 0` along the orbit" is true of the flow as a family and false of a single time-`t` map

An implementer who states the equivalence for one `φₜ` states something false. The last target of §2.3 (lines 333–334) reads: "the flows of §2.2 consist of coorientation-preserving contactomorphisms, strict exactly when `R_α H = 0` along the orbit". By §2.2, `gₜ(x) = exp(∫₀ᵗ (R_α H)(φₛ x) ds)`, so `gₜ(x) = 1` for all `t` in an interval exactly when `R_α H` vanishes along the orbit, but a single `gₜ` equals `1` whenever the integral vanishes. On `(ℝ³, dz − x dy)` take `H = 2 + sin z`: then `R_α H = cos z`, `X_H = x cos z ∂_x + (2 + sin z) ∂_z`, the time to advance `z` by `2π` is `T = 2π/√3` from every starting point, and `log(x(T)/x(0)) = ∫ cos z dz/(2 + sin z) = 0` over a period. So `φ_T(x, y, z) = (x, y, z + 2π)` is strict although `R_α H ≠ 0` along every orbit.

"… strict for every `t` exactly when `R_α H = 0` along the orbit" removes the ambiguity; §2.2 already states only the true direction for a single map.

## Previous findings

The previous review read this same head and had no finding. Its five small corrections stand unrepaired and are C01–C05 above: the description's sentence on the anchors (C01); the Summary's "contact predicate fixed here", lines 35–36 (C02); §6.1 without a locator (C03); the owner of the subbundle structure in §1.1 and §1.2, now with the Tau Ceti declarations that exist at the pin (C04); the two clauses of the family README (C05).

## Verified sound

| Statement | Instances tried | Roadmap side | My side | Result |
|---|---|---|---|---|
| §1.1 Levi sign and quotient (C04) | `ker(dz − x dy)`, `U = ∂_x`, `V = ∂_y + x∂_z`; `span(∂_x, ∂_y)` | `L_ξ(U,V) = −∂_z mod ξ`, `α ↦ −1 = dα(U,V)`; zero map | `[U,V] = ∂_z`; `dα = −dx∧dy`, `dα(U,V) = −1`; involutive gives 0 | holds |
| §1.2 global form iff `L` trivial | `ℝ² × S¹`, `α = cos τ dx + sin τ dy`, `τ ↦ τ + π` | `α∧dα = −dx∧dy∧dτ`; not coorientable on `ℝ² × ℝP¹` | `−cos² − sin² = −1`; `σ^*α = −α` forces `f∘σ = −f`, no constant sign | holds; Geiges p. 4 |
| §1.3 volume criterion | `n = 0, 1`; `ℝ⁵`, `dz − x dy`; `f α` | `−dx∧dy∧dz`; `α∧(dα)² = 0`; `fⁿ⁺¹` | `−dz∧dx∧dy = −dx∧dy∧dz`; `(dx∧dy)² = 0`; `n = 0`: `α ≠ 0` | holds |
| §1.4 `α_std∧(dα_std)ⁿ` | `n = 1`, swap `(q,p,z) = (y,x,z)` | `n! dz∧dq₁∧dp₁⋯`; `dz∧dy∧dx = −dx∧dy∧dz` | `(Σdqᵢ∧dpᵢ)ⁿ = n!·…`; `p dq∧ωⁿ = 0`; sign matches §1.3 | holds |
| §2.1 rescaling | `f = eˣ` on `dz − x dy` | `Z = ∂_y + x∂_z`, `α(R_(fα)) = 1/f` | `ι_Y dα = b dx − a dy = e⁻ˣdx` on `ξ`: `Y = e⁻ˣ(∂_y + x∂_z)`; `R' = e⁻ˣ(∂_y + (x+1)∂_z)` | holds |
| §2.2 flows | `H = z`, `H = 1` | `X_z = x∂_x + z∂_z`, `φₜ^*α = eᵗα`; `gₜ = 1` | `b dx − a dy = −x dy`: `a = x, b = 0, c = z`; `e^t dz − e^t x dy` | holds |
| §2.3 contactomorphisms (C06) | `(2x,y,2z)`, `(−x,y,−z)`; `H = 2 + sin z` | `F^*α = 2α`, `G^*α = −α`, `F^*∂_z = ½∂_z = X_(1/2)`; "strict exactly when" | same values; `φ_T = (x,y,z+2π)`, `T = 2π/√3`, strict with `R_αH = cos z` | holds; wording C06 |
| §3.1 `exists_darbouxChart_kerDistribution_eq` | `n = 0`; `eˣ(dz − x dy)` with the swap | chart with `dφ(ξ) = ker α_std`; `g = e⁻ˣ > 0` | `n = 0`: `ξ = 0`, any chart; swap pulls `α_std` to `dz − x dy` | holds; C–G Thm 3.11 |
| §3.2 `exists_darbouxChart_mpullback_eq` | `n = 0`; `eˣ(dz − x dy)` | exact pullback; swap carries `R_α` to `e⁻ᵖ(∂_q + (p+1)∂_z) ≠ ∂_z` | `n = 0`: primitive of `α`; route: `β + Σpᵢdqᵢ` closed since `d(p dq) = −dq∧dp` | holds; C–G 3.12, Geiges 2.24 |
| §3.3 `exists_relative_isotopy_map_mfderiv_eq` | `K = ∅`; `K = M`; `ξₜ` constant; `dim M = 0, 1` | open `V ⊇ K`, `φ` on `[0,1] × V` | `V = ∅`; `Yₜ = 0`, `φ = id`; tube lemma on `[0,1] × {x}` gives `V` without compactness | holds; C–G 3.9 for compact `K` |
| §3.4 both closed Gray statements | `αₜ = (1+t)α₀` | `Φ = id`, `gₜ = 1 + t`; exact pullback impossible | `∫α₁∧(dα₁)ⁿ = 2ⁿ⁺¹∫α₀∧(dα₀)ⁿ ≠ ±` itself | holds; C–G 3.10, Geiges 2.20 |
| §4.2 lifts | `G = (−x,y,−z)`; `t ↦ t + c` | unique `θ`-preserving cover; swaps components | `G̃(ℓ)∘dG = ℓ` forces `ℓ' = −eᵗα`; `e^(t+c)G^*α = −e^(t+c)α ≠ eᵗα` | holds |
| §4.3 collar | sphere, `Z = u/2`; spiral `r = ρ(θ)` | `Φ^*(−λ) = eˢα`; return time `2 log(1 + 2π/θ) → 0` | `λ` of degree 2, `λ(Z) = 0`; `e^(s/2) = (θ+2π)/θ` | holds |
| §4.4 contactization volume | `W = ℝ²`, `λ = p dq` | `α∧(dα)ⁿ = dz∧ωⁿ`; `dz∧dq∧dp` | `λ∧ωⁿ = 0` in degree `2n+1` on `W`; `(dz − p dq)∧dq∧dp = dz∧dq∧dp` | holds |
| §5.2 isotropic neighbourhood | `N` a point; `N` Legendrian | every `(ψ_L, Ψ)` realized | point: dilations `(aq, bp, abz)`, symplectic `A`, `(q,−p,−z)`; Legendrian: `(q, hp + z dh, hz)` pulls `α` to `hα` | consistent; Geiges 2.27 gives less, as stated |
| §5.4 `exists_mpullback_eq_contactization_of_isLegendrian` | `dim Λ = 0`, image not closed (`{1/k} ⊂ ℝ`); `y`-axis | strict `φ^*α = dz − λ` | shrinking intervals work; `(p,q,z)` pulls `dz − x dy` to `dz − p dq`; `(−p,q,z)` gives `dz + p dq` | holds; K–M 43.18 |
| §5.5 twisted one-jet model | trivial `L`, `∇ = d + a` | `θ_∇ = dz + za − p`; shift `p − za` | pullback of `dz − p` is `dz − p + za`; `θ∧(dθ)ⁿ = dz∧ωⁿ ≠ 0` everywhere | holds; C–G 3.13 for trivial line |
| §5.6 unit conormals | `Q = ℝ²`, `S` point, line, `Q` | dimension `dim Q − 1`; radial map and `α_b`, `α_g` | `dim S + codim − 1`; `m^*λ = −rα_b`, `m^*ω = d(rα_b)`; `−d(rα_g)` | holds |
| §6.1 `jacobiBracket`, both theorems (C03) | `x, y, z` on `(ℝ³, dz − x dy)`; `{f,gh}` | `{x,y} = −1`, `{y,z} = y`, `{z,x} = 0`; Jacobi `−1 + 0 + 1` | `α([X_f,X_g]) = dα(X_f,X_g) + fRg − gRf`; `[−∂_y, ∂_x + y∂_z] = −∂_z`; `{z,−1} = 1` | holds |
| §6.2 line-valued bracket | `α' = 2α` | `{2x,2y}_(α') = −2`; `f/h` rule gives `−¼∂_y` | `(hα)([X,Y]) = h α([X,Y])`; `X^(2α)_(x/2) = X^α_(x/4)` | holds; C–G Remark 3.8 |
| §6.3 symplectization comparison | `f = 1`; sign `ω = −d(rα)` | `X_(rf) = r(Rf)∂_r − X_f`; `{rf,rg} = r{f,g}` | `ι: r(Rf)α + f dr − r(Rf)α + r df = d(rf)`; `f r Rg − r X_g f` | holds |
| §6.4 boundary interface | `D*Q` | `λ_D = −λ_can`, boundary form `α_b` | `ι_(p∂_p)(dq∧dp) = −p dq`; DGFloer README line 353: `ω = dλ`, `ι_Zω = λ` | holds |
| Summary sentence on the predicate (C02) | Convention 5; CotangentLagrangian on main and at #2687 | "the contact predicate fixed here" | predicate at `TauCeti/Geometry/Contact/Basic.lean:100`; CotangentLagrangian names CG1 as owner | misleads; C02 |

- Source locators checked against the text: 21 of 21 (CourteGuillermouNotes 11, lines 1106–1250; GeigesHandbook 7, lines 95–122, 470–500, 589–597, 643–712, 1260–1265; KrieglMichor1997 3, lines 21650–21663 and 21667–21720), and Kriegl–Michor 43.15 and Geiges 2.22 for C03.
- Library declarations opened at the pin: `IsContactDistribution` (`Geometry/Contact/Distribution.lean:94`), `SmoothForm.IsContactForm` (`Contact/Basic.lean:100`), `contactization` (`Contact/Contactization.lean:79`), `innerProductContactForm` (`Contact/Standard.lean:294`), `mpullback_innerProductContactForm_neg` (`:429`), `contactHamiltonianVectorField` (`Contact/Hamiltonian.lean:187`), `Diffeotopy` (`Diffeomorphism/Diffeotopy/Basic.lean:78`), `contactMoserVectorField_of_eq_smul` (`Contact/Moser.lean:167`), `mvfderiv_reebVectorField_sphereContactForm` (`Contact/Sphere.lean:152`, Reeb field `2Kx`, so `K = i/2` gives `iw`), `exists_diffeomorph_normalBundle_subset` (`TubularNeighborhood/Existence.lean:53`), `IsContMDiffDistribution.contMDiffVectorBundle` (`Distribution/VectorBundle.lean:191`). All 122 Tau Ceti names cited in the README are declared at the pin.
- Cross-roadmap citations resolved on main: DifferentialGeometry items 1.4, 3.2, 3.3, 3.5, 4.1, 5.4 and the `dz − y dx` examples; SmoothBundlesConnections B2.1, B3.3, B5.0; GeometricTopology §1.5; HeegaardFloer §4.1 (F2.1); PseudodifferentialOperators P1.0 (first jets, connection splitting); DGFloer conventions and Layer 6 item 4; CotangentLagrangian C1 and C2.2 on main, Layer 1 and §2.2 at #2687; LieGroupoidsPoisson Layers 4, 6 and §G0.1; CombinatorialHeegaardFloer Lane G item 11.
- Dependency check: `depcheck: 182 roadmaps, 2072 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of the folder.
- Automatic checks: every check passed on this head.
- Elaboration: `lake env lean` on `Suggested.lean` gives 8 `declaration uses 'sorry'` warnings and no error. The elaborated types of the 9 declarations were compared with the README statements; no binder is lost and the generality agrees.
- One-tactic probe on a copy of the file (`rfl`, `simp_all`, `infer_instance`, `simp` with the bracket unfolded): none of the 8 theorems closes; `jacobiBracket` has a real body. No padding.
- Headlines: Darboux (two), Gray (relative, closed for distributions and for forms), strict Legendrian neighbourhood and the Jacobi bracket are stated; the isotropic theorem, the symplectization on `L* ∖ 0` with its lift and brackets, and the twisted Legendrian theorem are named in the docstring with the missing carrier (no quotient bundle and no first jets at the pin, confirmed).

Overlap check: read CotangentLagrangian (main and #2687), SymplecticGeometry (main and #2696), HamiltonianReduction (#2690), DGFloer (main and #1798), HamiltonianSystems (#480) and DifferentialGeometry. Shared objects: the cosphere forms and conormal vanishing are CotangentLagrangian §2.2's; contact-type conditions are DGFloer Layer 6's, and its contact-type step consumes the §4.3 collar from here; the contact predicate is Tau Ceti's, although CotangentLagrangian names CG1 (C02). The description names #2687 for the Layer 1 and §2.2 labels.

Source independence: 26 passages compared with 3 sources (the 21 locators and five further passages: Convention 3, the §3.3 route, the §5.4 route, the §1.2 Check, the §3.2 docstring), none shared beyond formulas and standard names; largest share CourteGuillermouNotes, 11 of 21 locators; contents compared with CourteGuillermouNotes (Chapter 3, sections 3.1–3.3): independent, six layers against three sections, with Darboux before Gray here and after it there, and Layers 4 and 6 absent from that chapter.

Research link: §5.4 is Lychagin's Legendrian neighbourhood theorem, which Kriegl–Michor (1997, Theorem 43.19) use for the Lie group of contact diffeomorphisms; Geiges (2006, §§2.4–2.5) builds isotopy extension on Gray, Darboux and the neighbourhood theorems; DGFloer's contact-type step consumes the §4.3 collar. Rests on KrieglMichor1997 §43, GeigesHandbook and the DGFloer README.

## Not verifiable

- none

## Source issues

- **Misprint** in GeigesHandbook at Theorem 2.22, p. 16: the source says the correspondence is with smooth functions into the positive reals; it should be all smooth real-valued functions, as its proof treats; affects nothing.
- **Misprint** in GeigesHandbook at Theorem 2.27, p. 21: the source says the covered diffeomorphism goes from `L1` to `L2`; it should be from `L0` to `L1`, the two submanifolds of the statement; affects nothing.
- **Misprint** in KrieglMichor1997 at 43.18, proof, p. 473: the source says the Reeb derivative of `hₜ` is `(α₁ − α₀)` on the Reeb field; it should be `(α₀ − α₁)`, so that `αₜ(Xₜ) = hₜ` in the final equation; affects the proof.
- **Error** in CourteGuillermouNotes at Theorem 3.13, p. 38: the source says every closed Legendrian of any contact manifold has a neighbourhood embedded from `J¹L`; it should assume the contact line trivial along `L` (the fibre circle of `ℝ² × ℝP¹` fails); affects a stated result.

## For the human reviewers

- **Licence / scope.** The source with the largest share of locators (11 of 21) is CourteGuillermouNotes, unpublished course notes read from an author's page (README lines 1111–1117). The same theorems are in Geiges's published survey and Kriegl–Michor's book, both cited.
