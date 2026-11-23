# Review of CompressibleEulerEquationsPartII (pull request #3010 at 084ef25)

**Verdict:** needs changes

**Summary.** Changes are needed for four findings. Each can be repaired by changing a clause. The first statement of §2.3 leaves out the bound on `c` and `|v|`, and a Chaplygin-gas solution shows it is false without that bound. The rescaling invariance claimed in §4.1 fails on the cylinder `Λ_cyl`. The Check of §3.4 has the compressive sign backwards. The second Check of §2.3 says `Ψ_t` stops being injective at the apex, but it is injective at no positive time. The previous review's findings are all repaired except the missing Rendall locators, which are one of three small corrections. There is one format note, and one merge-order fact is left to the human reviewers.

## R01 (P2) — The first statement of §2.3 omits the bound on `c` and `|v|`, and is false without it

As written, an implementer is asked to prove a false identity. The sentence that follows ("The route needs only that … `c`, `|v|` are bounded") then reads as a weakening, although the bound is not part of the §1.2 setting that the first sentence invokes (line 281: "In the slab setting of §1.2 (`k ≥ 2`, `S′ = E`, `Ψ_t` diffeomorphisms of E …) … Prove `D⁺_{O₁}({t₀} × S) = {u < 0}`").

Here is a counterexample that is an Euler solution, not just a cone field. Take the Chaplygin law `P(ρ, s) = A − 1/ρ`, which has `∂_ρP = 1/ρ² > 0` and `c = 1/ρ`. Take `n = 1`, `ρ = 1/(1 + x²)`, `v = −(1 + x²)` and constant `s`. This is a smooth stationary solution:

- mass: `Bρ = 2x/(1 + x²) = −ρ ∂_x v`;
- momentum: `v ∂_x v = 2x(1 + x²) = −ρ⁻¹ ∂_x P`.

The function `u = −x` is an acoustical function, since `∂_t u + v ∂_x u = 1 + x² = c`. Its generators have `L = ∂_t`, so `Ψ_t = id` and the setting of §1.2 holds on `O₁ = [0, 1) × ℝ` with `S = {x > 0}`. At `p = (1/2, 1)` we have `u(p) = −1 < 0`. But the past causal curve `ẋ = v − c = −2(1 + x²)` through `p` satisfies `arctan x(t) = π/4 + 1 − 2t`, so it runs to `+∞` as `t ↓ (1 − π/4)/2 ≈ 0.107`. It is past-inextendible in `O₁` and never meets `Σ₀`, so `p ∉ D⁺`. The route itself calls on the slab statement of CompressibleEulerEquations §3.3, which assumes the bound; that roadmap's third Check of §3.3 shows the bound is needed.

The smallest repair is to add "with `c` and `|v|` bounded on `[t₀, t₂] × E` for every `t₂ < t₁`" to the first sentence of §2.3. One would then write "the route uses only" in place of "the route needs only". The Summary and `futureDomainOfDependence_eq_setOf_neg` already carry the bound.

## R02 (P2) — Rescaling `(t, x) ↦ (λt, λx)` does not preserve conditions 1–4 of §4.1 on the cylinder

§4.1 fixes `Λ = Λ_cyl` and the angle torus `(ℝ/2πℤ)^{n−1}`. It then asks to prove (lines 518–519) that conditions 1–4 are invariant under rescaling. For `n ≥ 2` and general `λ` this is false:

- The rescaled field `U′(t/λ, x/λ)` is `λΛ_cyl`-periodic, not `Λ_cyl`-periodic.
- The rescaled chart `λX(t/λ, u, ϑ)` sends `(0, u, ϑ)` to `(0, 0, λϑ)`, which violates condition 2.
- Restoring condition 2 needs `ϑ ↦ ϑ/λ`, which is not defined on `ℝ/2πℤ` unless `1/λ` is an integer.

Concretely, take `λ = 2` and any family whose trace on `C₀` has least period `2π` in `x²`. Luo–Yu 2025b obtain such families for perturbed data `U_r` (Theorem 2, used in §2.3.2, p. 26). The rescaled field has least period `4π` and is not a family in the sense of §4.1. Translations in `x²,…,xⁿ` are fine.

Possible repairs:

- restrict the rescaling to `λ = 1/k`, `k ∈ ℕ` (I checked on lifts that conditions 1–4 then survive);
- or restrict it to `n = 1`;
- or state it with `Λ_cyl` and the angle torus rescaled by `λ`.

## R03 (P2) — In the Check of §3.4, `α₀ < 0` is the expansive sign, not the compressive one

The Check (lines 457–459) says that data with `α₀ < 0` blow up. With the README's own normalisation, that sign gives decay. The normalisation is `r = (1, −(c/ρ)n̂)` with `n̂ = ζ′/|ζ′|`, and `∂_φ` points into `K_φ = {φ ≥ 0}`.

Take the configuration of the second Check of §3.2:

- `n = 1`, `p = ρ²/2`, `Ū_C = (1, 0)` on `C = {x = t}`, `φ = t − x`, so `r = (1, 1)`;
- data `Ū₀ = (1 + bx, bx)` on `x < 0`.

These data are compatible at order 1: the formal derivatives are `∂_tρ = ∂_tv = −b`, so the derivative along `L` vanishes. At the edge, `∂_φU = −∂_xU = −b·r`, so `α₀ = −b`.

Near `C`, `w₋ = v − 2c = −2` is carried in from `C`. Then `β = ∂_x w₊ = −2α` satisfies `β′ = −(3/4)β²` along `C`, that is `α′ = (3/2)α²`. So `α₀ < 0` (that is, `b > 0`) gives `α → 0` and no blow-up, while `α₀ > 0` blows up at `t = 2/(3α₀)`. The same holds for every law with `(ρc)′ > 0`.

The repair is to write `α₀ > 0` and to name a genuinely nonlinear law (`(ρc)′ > 0`, for instance polytropic). For the Chaplygin law `P = A − 1/ρ`, `ρc` is constant, the coefficient of the Riccati equation vanishes, and nothing blows up.

## R04 (P2) — In the second Check of §2.3, `Ψ_t` fails to be injective at every `t > t₀`, not only from the apex on

Lines 298–300 say that the rays "meet at the apex `t − t₀ = R/c₀`, where `Ψ_t` stops being injective". In fact `Ψ_t(y) = v₀(t − t₀) + (|y| − c₀(t − t₀))ŷ` on `E ∖ {0}`. The ray from `y` passes the centre at `t − t₀ = |y|/c₀`, and with `s = t − t₀`, `0 < a < c₀s` and a unit vector `e`, `Ψ_t(ae) = Ψ_t(−(2c₀s − a)e)`. Only the generators from the sphere `|y| = R` meet at the apex. A possible wording: "the generators from `|y| = R` meet at the apex `t − t₀ = R/c₀`, where the characteristic boundary ends; on `E ∖ {0}`, `Ψ_t` is not injective for any `t > t₀`".

## C01 — Rendall 1990 is still cited six times without a locator

§3.1 (lines 335, 348), §3.4 (lines 436, 462) and §3.5 (lines 475, 485) cite it "by locator" or "the case treated there". Neither those passages nor the References entry (lines 690–691) gives a section, theorem or page. So the reductions that the routes of §§3.4–3.5 rest on cannot be traced. Give the theorem or section, with its page, at each citation.

## C02 — The expanding-flow Check of §2.2 is outside both statements of §2.2

The third Check (lines 274–275) uses the expanding flow, whose velocity `x/(1 + t)` is unbounded on every slab. That rules it out of the slab setting of §2.1, and also out of the maximal-development statement, which assumes `c`, `|v|` bounded "on bounded slabs" (lines 262–264). §2.3's third Check says this outright ("excluded as stated"). The generators it lists are correct. Either say that the example lies outside the hypotheses, or, if the route allows it, ask for the bound only on the development, which this example satisfies.

## C03 — The description still says CompressibleEulerEquations assigns real Sobolev orders to Part II

The sentence "Well-posedness at real Sobolev orders `s > n/2 + 1`, which the Scope of … assigns to Part II, is not part of this roadmap" is out of date. At its head, the supplier's Scope ("Fractional orders") says real orders belong to neither roadmap. It would be right as "Well-posedness at real Sobolev orders `s > n/2 + 1` is part of neither this roadmap nor CompressibleEulerEquations." The description also pins that supplier at `d30bd0f`; its head is now `a16a9e6`, where the cited sections and declaration names are unchanged.

## N01 — The Hörmander entry in the References (lines 692–693) gives no edition or year, which theorem numbers depend on.

## Earlier findings

- R01 — repaired: line 3 is `public import Mathlib` alone, and the carriers are restated at lines 64–148, identical to the supplier's.
- R02 — repaired: §2.1 now reads "below the top of the slab … `{t₀ < t < t₀ + T}`" (lines 226–228) and §2.2 "below the top of the slab (`t < t₀ + T`)" (lines 249–250). The Summary is repaired at lines 18–19, and a new Check is at lines 239–241.
- R03 — repaired: `exists_isAcousticalFunction_slab`, `IsAcousticalFunction.eqOn_slab` and `IsAcousticalFunction.transport_kappa` are stated (lines 152–204), and the docstring is narrowed (lines 32–38).
- C01 — repaired: "§5.4 (p. 77; Step 3 of the plan in §2.3.2, p. 26)" (line 475) and "§1.4.3, the diagonal system (1.25)" (line 335); both verified.
- C02 — not repaired: "Rendall 1990, by locator" remains; raised again as C01.
- C03 — repaired: "That uniqueness is constructed here as well" (lines 448–451).
- C04 — repaired: "of the initial data set on all of `E` (CompressibleEulerEquations §8.1)" (lines 425–426).
- C05 — repaired: the docstring (lines 43–49) names the singular chart and the limit that the pins cannot express.
- N01 — repaired: the three undeclared names are now prose.
- N02 — repaired: docstring lines 6–10.
- N03 — repaired: References lines 685–686 name arXiv v2.
- Question on Remark 2.14 — answered: §4.1 (lines 519–522) now assumes a limit `a(u)` that depends on `u` alone, and the new third Check (lines 530–535) shows that the limit can depend on `ϑ`. I verified that Check's computation.

## Deferred findings

- D01 — resolved: CompressibleEulerEquations, at its head (Scope, "Fractional orders"), now assigns real-order well-posedness neither to itself nor to Part II.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions witness | `n=1`, `c=1`, `v=0`, `u=t−x`; `x−t` | `∂ₜu+v∂ₓu = 1 = c\|∂ₓu\|`; `μ = c/\|∇u\| = 1 = cκ`; `x−t` gives `−1` | holds | none |
| 1.1 reflection | `k=1`; `f(t)=t`, `k=0` | `(a₁,a₂)=(−3,4)`; one-sided derivative `−(−3f′+2f′)=f′`; even reflection `\|t\|` | holds | none |
| 1.2 construction | expanding flow, `u₀=x−1` | `∂ₜu+v∂ₓu=(1+t)^{−3/2}=c\|∂ₓu\|`; `−g⁻¹(dt,du)=(1+t)^{−1/2}=1/μ`; `u=0` at `x=2√(1+t)−(1+t)` | holds | none |
| 1.2 past covector Check | `(v¹−c, −e₁)` | `ζ(B) = −c < 0`; speed `v¹ − c` | holds | none |
| Lean `exists_isAcousticalFunction_slab` | `C²` bounds; `n=0` | `\|ζ′\|` stays positive on finite time; `DΨ_t=I+O(τ)` gives a global diffeomorphism; `n=0`: `δ ≤ 0` contradiction | true; vacuous at `n=0` | none |
| Lean `eqOn_slab` | same data on `Σ_{t₀}` | eikonal fixes `∂ₜu`, so `du=du′` there; Hamiltonian field `C¹`; `L`-curves reach `Σ_{t₀}` at speed `≤ 2C` | true | none |
| Lean `transport_kappa`, 1.3 | derivation; expanding flow; plane wave | `Lξᵢ = −∂ᵢvʲξⱼ + ∂ᵢc\|ξ\|` gives `Lκ = T̂ʲT(vʲ) − Tc`; `1 = 1`; `2/(γ+1)+(γ−1)/(γ+1) = 1` | holds | none |
| 1.3 polytropic form | LuoYu2025a (2.4)–(2.6), p. 26, `ψᵢ=−vⁱ` | `m′=−((γ+1)/(γ−1))Tc`, `e′=−c⁻¹T̂·Lv`; difference `−(κ/c)T̂ⁱ(∂ᵢh+Bvⁱ)` | matches | none |
| 1.3 metric | `g(T,T)`, `g(T,X_A)` | `κ²+g̸ΞΞ−2g̸ΞΞ+g̸ΞΞ=κ²`; `g̸Ξ−Ξg̸=0` | holds | none |
| 2.1 Lean | `S=E`; `S=(−1,1)`; `S=(−1,0)∪(0,1)` | both sides `(t₀,t₀+T)×E`; open triangle on both sides; non-regular: `D ≠ int Ď` | holds; regularity needed | none |
| 2.1 third bullet | `S=E`, top face | frontier `{t₀+T}×E`, `H⁺=∅`; restricted to `t<t₀+T` | holds | none |
| 2.2 generators | constant half-space; `B(0,R)`; expanding flow | speed `v₀+c₀e₁`; apex `R/c₀`; `x=±(2√(1+t)−(1+t))` meet at `t=3`, `v` unbounded | true; last Check outside hypotheses | C02 |
| 2.3 first statement | Chaplygin `ρ=1/(1+x²)`, `v=−(1+x²)` | `u=−x`, `Ψ_t=id`; at `(1/2,1)`, `u=−1`; past curve escapes at `t≈0.107` | false without bound | R01 |
| 2.3 Lean | constant state; frontier | `{u<0}={x¹>(v¹+c)(t−t₀)}`; `∇u≠0` so frontier is `{u=0}` in the open slab | holds | none |
| 2.3 second Check | `n=2`, `u₀=\|x\|−R` | `Ψ_t(ae)=Ψ_t(−(2c₀s−a)e)`, `0<a<c₀s`, every `s>0` | clause false | R04 |
| 3.1 symbols | `p=ρ²/2`, `ζ=(1,−1)`; full system | `ℓσ=0`, `σr=0`, reversed `ℓ` gives `2(δρ−δv)`; entropy terms cancel; expanding flow: `−(1+t)⁻²+(1+t)⁻²=0` | holds | none |
| 3.2 compatibility | `Ū₀=(1,ax)`; LuoYu2025b C1)–C3), pp. 17–18 | `L`-derivative `(−a,a)`: compatible iff `a=0`; `LᵐXⁿ` jets with `m+n≤N` | holds | none |
| 3.3 developments | constant data, `φ=(v₀¹+c₀)(t−t₀)−x¹` | `K_φ={x¹≤(v₀¹+c₀)(t−t₀)}`, slice `S₀∪𝓔`; `H_{t₀}` has `φ<0` points | holds | none |
| 3.4 route | supplier §6.2 source `F(U)` | a `(t,x)` source cancels in differences; uniqueness marked as constructed here | holds | none |
| 3.4 Check | `Ū₀=(1+bx,bx)`, `C={x=t}` | `α₀=−b`; `α′=(3/2)α²`; `b>0` decays; `α₀>0` blows up at `2/(3α₀)` | sign reversed | R03 |
| 3.5 Goursat | `φ=(v₀+c₀)t−x`, `φ̲=x−(v₀−c₀)t` | `dφ(B)=dφ̲(B)=c₀`; `g⁻¹(dφ,dφ̲)=−1−1=−2`; LuoYu2025b §5.4 p. 77, Step 3 p. 26 | holds | none |
| 4.1 against Def. 2.13 | conditions 1–4; third Check | README 1–4 ↔ (1)–(3), p. 24; `F_t = ctF₂²/(\|F_ξ\|+√(F_ξ²+t²F₂²))`, `κ′/t → 1+ε sin ϑ` | matches | none |
| 4.1 rescaling | `λ=2`, `n=2` | chart at `t=0`: `(0,0,2ϑ)`; period `2π ↦ 4π`; `λ=1/k` survives | fails on `Λ_cyl` | R02 |
| 4.2 Lean | `c>0` on `W`; Riemann invariants | `v+c=x¹/t`; `v−2c/(γ−1)=−2w_r`; `c ≥ ((γ−1)/(γ+1))(λ_r−u*+2w_r) > 0`; `u′` eikonal | holds | none |
| 4.2 Checks | `u=0`; `T=−t∂₁` | `λ_r+2w_r=c_r(γ+1)/(γ−1)`, so `c=c_r`, `v¹=v_r`; `κ′=t`; `m′=1`, `e′=0` | holds | none |
| Headlines not stated (Layer 3, generators, horizon, §4.1) | pins | `christoffelSecondKind` exists; no chronological relation, inner equation or formal jets at the pins; stating less would be a weakened substitute | correctly named | none |

- Source locators checked against the text: 15. These are LuoYu2025a §1.1 (1.3) p. 3, §2 pp. 23–24, §2.1 pp. 24–25 and §2.2 (2.4)–(2.6) p. 26; LuoYu2025b §1.4.3 (1.25), §2.1 C1)–C3) pp. 17–18, Definition 2.13 and Remark 2.14 p. 24, §2.3.2 Step 3 p. 26 and §5.4 p. 77; ChristodoulouMiao2014 §2.1 (2.12)–(2.27) pp. 24–26, and Ch. 1 §§1.2–1.3, Ch. 3 and Ch. 19 by its table of contents.
- Library declarations opened at the pin: `TauCeti.Manifold.christoffelSecondKind` (TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Christoffel/Basic.lean:154); the Tau Ceti cogeodesic flow (TauCeti/Geometry/Symplectic/Cotangent/Bundle/Cogeodesic.lean, smooth Riemannian metrics only). No Lorentzian causal notions exist in Mathlib or Tau Ceti.
- Cross-roadmap citations resolved:
  - CompressibleEulerEquations at `a16a9e6`: §§1.1–1.3, 2.1–2.2, 3.1–3.3 (the slab statement and its boundedness Check), 6.1–6.2 (source `F(U)`), 7.1–7.3 and 8.1–8.4, and all 25 cited declaration names. The restated carriers are identical to its `Suggested.lean` lines 72–206.
  - LorentzianGeometry at `6e0c85c`: §§3.1–3.3, §7.3 (first Check), §§9.2–9.3, §12.6 (time functions, slabs) and §12.7 (push-up, `H⁺_U`, edge, boundary identity, first Check).
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no change outside the folder.
- Automatic checks: all passed at this head.
- Elaboration: `lake env lean` of `Suggested.lean` gives `sorry` as the only warning, on the six theorems. `#check @` of the ten main declarations matches the README's generality, and no binder is lost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `aesop`) on the six theorems: none closes, so none is padding.
- Ownership against open pull requests was searched by object across the open heads and main (rarefaction, Goursat, characteristic initial data, Rendall, acoustical function, eikonal, Cauchy horizon): no second owner.

Overlap check: I read CompressibleEulerEquations, LorentzianGeometry, HamiltonJacobiAndConservationLaws and RiemannianManifoldsWithConvexBoundary. Ownership is as follows:

- CompressibleEulerEquations owns domains of dependence, developments and the nullity of their regular boundary; it is cited, not restated.
- LorentzianGeometry owns geodesics, optical functions and the horizons of `C¹` metrics; it is cited.
- HamiltonJacobiAndConservationLaws owns the local method of characteristics for `C²` first-order equations. §1.2 here builds only the semi-global acoustical eikonal by null geodesics; the acoustical Hamiltonian is not `C²` where `ζ′ = 0`.
- RiemannianManifoldsWithConvexBoundary shares nothing with this roadmap.

Source independence: 15 passages were compared with 3 sources and none is shared beyond defined names and forced formulas. LuoYu2025a has the largest share, 9 of 32 citations (Rendall1990 has 6, unread). The contents were compared with LuoYu2025a and LuoYu2025b: the layers do not follow either paper's sections, so the arrangement is independent.

Research link: Layers 1–4 build the carriers on which Luo–Yu (Ann. of Math. 202, 2025) state the stability of multi-dimensional rarefaction waves: acoustical coordinates and the `κ` equation, `𝒟₀` and `C₀`, compatible characteristic data, the Goursat step and centered rarefaction waves. They also build the acoustical functions of Christodoulou–Miao 2014. This rests on the README and on LuoYu2025a §2, LuoYu2025b Definition 2.13 and §5.4, and ChristodoulouMiao2014 §2.1.

## Not verifiable

- Rendall 1990 (§§3.1, 3.4, 3.5): paywalled at the publisher, and the sources service holds no open copy; not searched further.
- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 1.2.6 (§3.4): a book with no legal open copy.
- Hawking–Ellis 1973, Ch. 6 (§2.2): a book with no legal open copy.
- Christodoulou 2007, Ch. 2 (§1.2), and Christodoulou 2019 (Downstream consumers): EMS monographs with no legal open copy.
- The numbering of the Annals versions of Luo–Yu I and II: only arXiv v2 was read, and the README says its locators are to v2.

## Source issues

- **Misprint** in LuoYu2025b at Definition 2.13, p. 24: the source says W′ is an open set disjoint from 𝒟₀ that contains C₀, impossible since C₀ lies in the closure of 𝒟₀; it should be the union of the leaves C′ for u′ in [0, u*′], as the definition then writes; affects nothing.
- **Gap** in LuoYu2025b at Remark 2.14, p. 24: the source says positive bounds on κ′/t suffice because a rescaled foliation is then canonical; it should assume the limit depends on u′ alone, since relabelling u′ normalises it only then (README §4.1, third Check); affects nothing.
- **Error** in ChristodoulouMiao2014 at §2.1.2, p. 25: the source says any two developments of the same data coincide on their intersection, so the union of all developments is a development; it should say they coincide on their maximal common development (counter-flow example, CompressibleEulerEquations §8.2); affects a stated result.

## For the human reviewers

- Supplier order: both suppliers are open pull requests. LorentzianGeometry, which this roadmap and CompressibleEulerEquations both cite, is not in the merge-order file, although the dependency check reports no problem.
