# Review of CompressibleEulerEquationsPartII (pull request #3010 at 028ca67)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the last review, and the title and description, read sentence by sentence against this head and against the three suppliers' open heads, describe the change correctly: a new roadmap, four layers, three suppliers with the section lists the README uses, and six Lean statements. There are no findings; one small correction (the description names a LorentzianGeometry head that has since moved) and no format note. The supplier order and the unread Rendall article remain for the human reviewers.

## C01 — The description pins LorentzianGeometry to a head that is no longer its head

The description says LorentzianGeometry is consumed "§§2.3, 3.1, 4.2–4.3, 7.6 and 7.7, at its head `43acb00`"; that pull request is now at `f783f7d`. Nothing breaks: at `f783f7d` the six sections keep their numbers and state what the README cites (§2.3 the acoustical form, `g(B, X) = 0`, the inverse form with `g⁻¹(dt, dt) = −c⁻²`, `B` timelike and the orientation `[B]` of §3.1; §4.2 optical functions and double null foliations; §4.3 `∇_L L = κL` and `∇_L L = 0`; §7.6 the four named carriers and the reduction to `t`-parametrized curves for acoustical forms; §7.7 push-up, `H⁺_U(S)`, its generators, `edge_U(S) = ∂_{Σ_{t₀}}S` and the frontier identity). The other two hashes (`26699db`, `f9c2742`) are the current heads. Updating the hash, or dropping the three hashes so that the sentence cannot go out of date, would keep it true.

## Previous findings

- C01 (the previous report had no finding; this was its one small correction) — partly repaired: the description now reads "by the declaration names of its head `26699db`" and "at its head `f9c2742`", both current; the LorentzianGeometry hash `43acb00` is now behind (C01 above).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `isSolution_planeRarefaction` (§4.2), which the description cites as "a classical solution with its acoustical function" | `γ = 3`, `k₀ = 1/3`, `c_r = 1`, `v_r = 0`, `n = 1`, `ξ = x/t` | `w_r = 1/2`, `c = ρ = (ξ+1)/2`, `v = (ξ−1)/2`; mass: `−ξ/(2t) + ξ/(2t) = 0`; momentum: `(−2ξ + ξ−1 + ξ+1)/(4t) = 0`; at `ξ = 1`: `(c, v) = (1, 0)` | agrees | none |
| same, acoustical function `u′ = λ_r − x/t` | same instance | `∂_t u′ + v∂_x u′ = (ξ − v)/t = c/t`; `c·abs(∂_x u′) = c/t`; `c > 0` iff `ξ > −1`, given by `u* < λ_r + 2w_r = 2` | agrees | none |
| Description: LorentzianGeometry §7.6 reduces domains of dependence to the time-parametrised form | constant state, `D = {t ≥ 0}`, `S = {t = 0, x¹ ≥ 0}` at `f783f7d` | supplier's Check: `D⁺_D(S) = {t ≥ 0, x¹ ≥ (v¹ + c)t}`, curves `(t, x(t))` causal iff `abs(ẋ − v) ≤ c` a.e.: the form `IsCausalCurve` of the Lean file uses | agrees | none |

The rows for the untouched statements stand as in the previous review, of `028ca67`.

- Pull request text: every sentence of the title and prose read against the head. New roadmap (1033 added lines, 30 headings, 17 declarations, nothing removed); the four layer bullets match the README's layers 1–4 (§3.2's condition 5 is the "swept by causal curves issuing from its edge"; §3.3's "lens-shaped domains with a null face"); topic `math.AP` is the folder's metadata; the six Lean statements listed are the six theorems of `Suggested.lean` (lines 157, 179, 195, 221, 240, 269), and its header lists the three groups of headlines not stated, as described.
- Cross-roadmap citations resolved: CompressibleEulerEquations at `26699db` has all 17 cited section headings (§§1.1–1.3, 2.1–2.2, 3.1–3.3, 6.1–6.2, 7.1–7.3, 8.1–8.4), names "Compressible Euler equations, Part II" in Downstream consumers and in Scope, and its Scope bullet "Fractional orders" says real orders are part of neither roadmap, as the description states. LorentzianGeometry at `f783f7d`: §§2.3, 3.1, 4.2, 4.3, 7.6, 7.7. SemiRiemannianFoundations at `f9c2742`: §§3.1, 3.2, 3.3.
- The AnnalsDefinitions census entry 033 was read: it is the domain of dependence and development for compressible Euler, and assigns its characteristic-data case and the ruling of the boundary to this roadmap's §§2.2, 3.2–3.4, as the description says.
- Dependency check: `depcheck: 100 roadmaps, 1122 edges, 0 problem(s)`; no UPWARD or CYCLE line; no change outside the folder.
- Automatic checks: all passed in the worker's run at this head; none set aside.
- Elaboration: `lake env lean` of `Suggested.lean` gives `sorry` as the only warning, on the six theorems. The file is unchanged, so signatures were not rechecked with `#check`.
- Source locators: none opened (no passage changed); the seeded sample stands as verified in the earlier rounds.

Overlap check: read CompressibleEulerEquations (at `26699db`), LorentzianGeometry (at `f783f7d`), SemiRiemannianFoundations (at `f9c2742`) and HamiltonJacobiAndConservationLaws as in the previous review; nothing shared. SemiRiemannianFoundations owns admissible reparametrizations and the geodesic flow; LorentzianGeometry owns the acoustical form, null hypersurfaces, domains of dependence in subsets and horizons; CompressibleEulerEquations owns sound-cone causal curves and developments of open data and hands characteristic data to this roadmap by name.

Source independence: changed passages only: 0 passages compared with 0 sources (the folder did not change); largest share LuoYu2025a, 9 of 34 citations; no layer added, removed or reordered, so the arrangement stands as compared before: independent. Rendall 1990 could not be read beyond its abstract.

Research link: Layers 1–4 build the carriers on which Luo–Yu (Ann. of Math. 202, 2025) state the stability of multi-dimensional rarefaction waves: acoustical coordinates and the `κ` equation, `𝒟₀` and `C₀`, compatible characteristic data, the Goursat step, centered rarefaction waves; and the acoustical functions of Christodoulou–Miao 2014. Rests on the README and on LuoYu2025a §2, LuoYu2025b Definition 2.13 and §5.4.

## Not verifiable

- Rendall 1990 (§§3.1, 3.4, 3.5): paywalled at the publisher; only its bibliographic record and abstract were read, in an earlier review.
- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 1.2.6 (§3.4); Hawking–Ellis 1973, Ch. 6 (§2.2); Christodoulou 2007, Ch. 2 (§1.2): books with no legal open copy.
- The numbering of the Annals versions of Luo–Yu I and II, and the description's "Ann. of Math. 202 (2025)" for both parts: only the arXiv texts were read, in an earlier review.
- Whether `43acb00` is an ancestor of the current LorentzianGeometry head `f783f7d`: not checked; the cited sections were read at `f783f7d` instead.

## Source issues

- **Misprint** in LuoYu2025b at Definition 2.13, p. 24: the source says the rarefaction region is an open set disjoint from the domain of dependence that contains its boundary hypersurface, which no open set can; it should be the union of the leaves for the foliation parameter in a closed interval, closed on the side of that hypersurface; affects nothing.

## For the human reviewers

- Supplier order: all three suppliers (CompressibleEulerEquations, LorentzianGeometry, SemiRiemannianFoundations) are open pull requests; the last two are not in the merge-order file, although the dependency check reports no problem.
- Reuse: eight definitions of `TauCetiRoadmap/CompressibleEulerEquationsPartII/Suggested.lean` (lines 69–137) repeat, under this roadmap's namespace, those of `TauCetiRoadmap/CompressibleEulerEquations/Suggested.lean` in the open supplier pull request, as its docstring says.
- Not tested: Rendall 1990, the source of the routes of §§3.4–3.5, was read only in its abstract; wording and arrangement were not compared with it.
