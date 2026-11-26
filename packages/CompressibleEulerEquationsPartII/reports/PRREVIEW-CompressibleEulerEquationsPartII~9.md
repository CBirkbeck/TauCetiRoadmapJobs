# Review of CompressibleEulerEquationsPartII (pull request #3010 at 028ca67)

**Verdict:** accepted

**Summary.** Accepted: the 93 changed lines since `8e9f901` only repoint supplier citations, to the renumbered sections of LorentzianGeometry and to SemiRiemannianFoundations for curve reparametrization and the geodesic flow, and every repointed citation resolves at the two suppliers' open heads to a section that states what is cited; no statement changed. There are no findings; one small correction (the description names two supplier heads that have since moved) and no format note. The supplier order and the unread Rendall article remain for the human reviewers.

## C01 — The description pins two suppliers to heads that are no longer their heads

The description says CompressibleEulerEquations is consumed "by the declaration names of its head `3a9f46e`" and SemiRiemannianFoundations "at its head `5874876`"; those pull requests are now at `26699db` and `f9c2742` (LorentzianGeometry is at `43acb00`, as stated). Nothing breaks: all 17 cited sections and the 25 cited declaration names of CompressibleEulerEquations are present at `26699db` (`3a9f46e` is an ancestor of it), and §§3.1–3.3 of SemiRiemannianFoundations at `f9c2742` state the admissible changes of parameter, the geodesic predicate, spray and flow, and the `C^r` regularity that the README cites. Updating the two hashes, or dropping them, would keep the sentence true.

## Previous findings

- N01 — repaired: the contract now reads "### From TauCetiRoadmap.SemiRiemannianFoundations — §3.1: admissible changes of parameter", the section §2.2 cites (README lines 254, 281, 327, 698); it exists at that roadmap's head.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.2 Check, constant state, now citing LorentzianGeometry §2.3's first Check | `u = (v¹ + c)(t − t₀) − x¹`, `t₀ = 0` | `∂_t u + v·∇u = (v¹ + c) − v¹ = c`; `c|∇u| = c`. `{u = 0} = {x¹ = (v¹ + c)t}`, the supplier's null hyperplane; its normal `B + c∂₁` equals `L = ∂_t + v + c∂₁` | agrees | none |
| §1.1, metric of the reflected field by LorentzianGeometry §2.3, time-oriented by §3.1 | `c̃ > 0` of class `C^k` | supplier §2.3: `g⁻¹ = −c⁻²B⊗B + h⁻¹`, so `g⁻¹(dt, dt) = −c̃⁻²·(dt(B))² = −c̃⁻² < 0`; `g(B, B) = −c²`; §3.1 orients by `[B]` | agrees | none |
| §2.2 Check, constant state, `S = {x¹ > 0}`, now citing LorentzianGeometry §7.7's first Check | `t₀ = 0` | README: `𝒞(D) = {x¹ = (v₀¹ + c₀)t, t > 0}`, lines `t ↦ (t, x₀ + t(v₀ + c₀e₁))`; supplier: the same hyperplane and generators from `{t = 0, x¹ = 0}` | agrees | none |
| §3.5 Check, double null pair in the sense of LorentzianGeometry §4.2 | `φ = (v₀ + c₀)t − x`, `φ̲ = x − (v₀ − c₀)t`, `n = 1` | `Bφ = c₀`, `Bφ̲ = c₀`; `g⁻¹(dφ, dφ̲) = −c₀⁻²·c₀·c₀ + (−1)(1) = −2 < 0`, the supplier's condition `g⁻¹(du, du̲) < 0` | agrees | none |
| §2.1 and `futureDomainOfDependence_inter_eq_interior`, reduction by LorentzianGeometry §7.6 | constant state, `D = {t ≥ 0}`, `S = {t = 0, x¹ ≥ 0}` (supplier's last Check) | supplier: `D⁺_D(S) = {t ≥ 0, x¹ ≥ (v¹ + c)t}` by `t`-parametrized curves with `|ẋ − v| ≤ c`; README §2.3 gives `{u ≤ 0}` for `u = (v¹ + c)t − x¹`: the same set | agrees | none |
| §1.2, null geodesics by SemiRiemannianFoundations §§3.2–3.3 | `k = 2` | Christoffel field `C^{k−1} = C¹`, so locally Lipschitz: §3.2 gives unique maximal geodesics and an open flow domain, §3.3 a `C¹` flow, hence `Ψ` is `C¹` | agrees | none |

The rows for the untouched statements stand as in the previous review, of `8e9f901`.

- Cross-roadmap citations resolved: all 9 section ids of the changed passages. LorentzianGeometry at `43acb00`: §2.3 (acoustical form, `g(B, X) = 0`, inverse form, causal vectors, `B` timelike), §3.1 (time orientations; `[B]`), §4.2 (null hypersurfaces, optical functions, double null foliations), §4.3 (`∇_L L = κL`, `∇_L L = 0`), §7.6 (the four named carriers; time functions), §7.7 (push-up, `I⁺ = int J⁺`, `H⁺_U`, generators, edge, frontier identity). SemiRiemannianFoundations at `f9c2742`: §3.1, §3.2, §3.3.
- No citation of a former LorentzianGeometry number (§7.3 as the acoustical form, §8.1, §§9.2–9.3, §§12.6–12.7) remains in the README or `Suggested.lean`; the three docstring mentions in `Suggested.lean` (lines 17, 126, 219) read §7.6.
- CompressibleEulerEquations at `26699db`: the 17 cited section headings and the 25 names of the contract list occur in its README or `Suggested.lean`; it names "Compressible Euler equations, Part II" in its Scope and Downstream consumers.
- Pull request text: title and prose read against the head: new roadmap, four layers, three suppliers with the section lists the README uses (LorentzianGeometry §§2.3, 3.1, 4.2–4.3, 7.6, 7.7; SemiRiemannianFoundations §§3.1–3.3), six Lean statements. One stale pair of hashes (C01).
- Dependency check: `depcheck: 105 roadmaps, 1198 edges, 0 problem(s)`; no change outside the folder.
- Automatic checks: all passed in the worker's run at this head.
- Elaboration: `lake env lean` of `Suggested.lean` gives `sorry` as the only warning, on the six theorems (lines 157, 179, 195, 221, 240, 269). The diff changes only three docstrings there, so signatures were not rechecked with `#check`.
- Source locators: none opened (the changed passages carry no source locator); the seeded sample stands as verified in the earlier rounds.

Overlap check: read CompressibleEulerEquations (at `26699db`), LorentzianGeometry (at `43acb00`), SemiRiemannianFoundations (at `f9c2742`) and HamiltonJacobiAndConservationLaws as in the previous review; nothing shared. SemiRiemannianFoundations owns admissible reparametrizations and the geodesic flow; LorentzianGeometry owns the acoustical form, null hypersurfaces, domains of dependence in subsets and horizons; CompressibleEulerEquations owns sound-cone causal curves and developments of open data and hands characteristic data to this roadmap by name.

Source independence: changed passages only: 0 passages compared with 0 sources (the change repoints supplier citations and touches no sourced statement); largest share LuoYu2025a, 9 of 34 citations; no layer added, removed or reordered, so the arrangement stands as compared before: independent. Rendall 1990 could not be read beyond its abstract.

Research link: Layers 1–4 build the carriers on which Luo–Yu (Ann. of Math. 202, 2025) state the stability of multi-dimensional rarefaction waves: acoustical coordinates and the `κ` equation, `𝒟₀` and `C₀`, compatible characteristic data, the Goursat step, centered rarefaction waves; and the acoustical functions of Christodoulou–Miao 2014. Rests on the README and on LuoYu2025a §2, LuoYu2025b Definition 2.13 and §5.4.

## Not verifiable

- The description's sentence that the roadmap serves an entry of the AnnalsDefinitions census (`census/033.md`): that repository was not opened; the README does not mention it.
- Rendall 1990 (§§3.1, 3.4, 3.5): paywalled at the publisher; only its bibliographic record and abstract were read, in an earlier review.
- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 1.2.6 (§3.4); Hawking–Ellis 1973, Ch. 6 (§2.2); Christodoulou 2007, Ch. 2 (§1.2): books with no legal open copy.
- The numbering of the Annals versions of Luo–Yu I and II: only the arXiv texts were read, in an earlier review.

## Source issues

- **Misprint** in LuoYu2025b at Definition 2.13, p. 24: the source says the rarefaction region is an open set disjoint from the domain of dependence that contains its boundary hypersurface, which no open set can; it should be the union of the leaves for the foliation parameter in a closed interval, closed on the side of that hypersurface; affects nothing.

## For the human reviewers

- Supplier order: all three suppliers (CompressibleEulerEquations, LorentzianGeometry, SemiRiemannianFoundations) are open pull requests; the last two are not in the merge-order file, although the dependency check reports no problem.
- Reuse: eight definitions of `TauCetiRoadmap/CompressibleEulerEquationsPartII/Suggested.lean` (lines 69–137) repeat, under this roadmap's namespace, those of `TauCetiRoadmap/CompressibleEulerEquations/Suggested.lean` in the open supplier pull request, as its docstring says.
- Not tested: Rendall 1990, the source of the routes of §§3.4–3.5, was read only in its abstract; wording and arrangement were not compared with it.
