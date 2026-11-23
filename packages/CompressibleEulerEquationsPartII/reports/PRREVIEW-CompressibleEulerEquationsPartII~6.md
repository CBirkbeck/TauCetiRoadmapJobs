# Review of CompressibleEulerEquationsPartII (pull request #3010 at 8e9f901)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. The definition of a characteristic data set in §3.2 now requires `S₀ ∪ 𝓔` to be relatively open in the initial slice of the wedge and `C` to be swept by causal curves from the edge, and both instances that refuted §3.4 are excluded and recorded as negative-control Checks, which I recomputed. The description and the Rendall reference entry are repaired too. There are no findings, no small corrections and no format notes; the supplier order and the unread Rendall article remain for the human reviewers.

## Previous findings

- R01 — repaired: §3.2 now asks "`{t₀} × (S₀ ∪ 𝓔)` relatively open in `K_φ ∩ Σ_{t₀}`" and condition 5, "every point of C is the endpoint of a past causal curve in C … whose interval contains `t₀`". Both instances are excluded (rows below).
- C01 — repaired: the description now lists LorentzianGeometry "§§3.1–3.3, 7.3, 8.1, 9.2–9.3, 12.6 and 12.7, at its head `6e0c85c`", and describes `C` as "swept by causal curves issuing from its edge".
- N01 — repaired: the Rendall entry now reads "Cited by its abstract (p. 221), which states the method, … and through Luk 2012, §3, Theorem 3".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §3.2, condition on `S₀`: the two forms agree | `x ∈ 𝓔`, `N_x` inside the slice of `W` | `N_x ∩ K_φ = (N_x ∩ {φ>0}) ∪ (N_x ∩ 𝓔)`; this lies in `S₀ ∪ 𝓔` iff `N_x ∩ {φ>0} ⊆ S₀`; converse with `N = ⋃N_x` | equivalent | none |
| §3.2, "so `𝓔 ⊆ closure S₀`" | edge point, spatial `dφ ≠ 0` | points with `φ(t₀,·) > 0` accumulate at it inside `N`, hence in `S₀`; `S₀ ∩ 𝓔 = ∅` since `S₀` is open and `φ < 0` nearby | holds | none |
| §3.2 with punctured `S₀` (first instance of the earlier R01) | `φ = t − x`, `S₀ = (−1,0)∖{−1/k}` | `{x ∈ N : −x > 0}` contains `−1/k` for large `k`, not in `S₀`; conditions 1–5 hold (generators `x = t` reach `(0,0)`) | excluded by the definition; Check true | none |
| §3.2, condition 5 (second instance) | `W = 𝔐∖{(0,5)}`, `φ = t − x + 5` | `𝓔 = ∅`, `C = {x = t+5, t > 0}`; a curve in `C` at `t = 0` would sit at `(0,5) ∉ C`; 1 and 4 vacuous, 2–3 hold (`c = 1`, `v = 0`) | 1–4 hold, 5 fails; Check true | none |
| §3.2 Check, "no development" for the second instance | `D` relatively open in `K_φ`, `D ∩ Σ₀ = ∅`, any solution `U` | on `C`: `v + c = 1`, so `C` is an integral curve; the field is Lipschitz, so the curve through `p ∉ C` avoids `C`; a limit point in `D` has `φ > 0` and is interior, so the curve continues | `p ∉ D⁺_D(C)`; holds for non-constant `U` as stated | none |
| §3.2, condition 5 at edge points and under restriction | `p ∈ {t₀} × 𝓔`; `C ∩ {t < T}` | the one-point curve on `[t₀, t₀]` is a past causal curve (supplier §3.3 allows it); a past curve from `t < T` stays in `t < T` | holds; restriction bullet still true | none |
| §3.2 Checks 1–2 with condition 5 | constant data, `C = {x¹ = (v₀¹+c₀)(t−t₀)}`; `Ū₀ = (1, ax)` | generator `x₀ + s(v₀ + c₀e₁)` has `x¹ = (v₀¹+c₀)s`, in `C` down to `t₀`; `N = E`, `φ(t₀,x) = −x¹ > 0` on `S₀` | "1–5" and "1–3 and 5" correct | none |
| §3.4 existence against the new definition | compact `𝓔/Λ`, smooth data; `W = 𝔐∖F`, `F` closed | generator flow from `𝓔` exists on `[t₀, t₀+τ₀]`; by 5 and uniqueness `C ∩ {t ≤ t₀+τ′}` is its image, compact mod Λ, at positive distance from `F`; `S₀ ∪ {φ(t₀,·) < 0} ∪ 𝓔 ⊇ N` | the route's two uses (data across `𝓔`, work on `C` near `𝓔`) are now supported | none |
| §3.3 Check (constant data) under the new definition | `φ = (v₀¹+c₀)(t−t₀) − x¹`, `S₀ = {x¹ < 0}` | `K_φ ∩ Σ_{t₀} = {x¹ ≤ 0} = S₀ ∪ 𝓔`; condition 5 as above | still a data set; Check unchanged and true | none |

The rows for the statements the change does not touch stand as in the previous review, of `43babce`.

- Source locators: the change adds none. The Rendall entry keeps the locators checked in the previous review (abstract, p. 221; Luk 2012, §3, Theorem 3); the locator of the sampled §3.2 (Luo–Yu 2025b, §2.1, C1)–C3)) is unchanged and was not opened again.
- Cross-roadmap citations resolved: the new citation, CompressibleEulerEquations §3.3 (past causal curves, one-point curves allowed, `D⁺_D(S)`), read at its open head `4ae1090`; §3.3 is in §3.2's *Needs:* line, in Layer 3's Dependencies and in the supplier contracts.
- Library declarations: none new; `Suggested.lean` is unchanged since `43babce` and its `IsPastCausalCurve`, `IsPastInextendible` and `futureDomainOfDependence` were read against the new Checks.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no change outside the folder.
- Automatic checks: all passed in the worker's run at this head.
- Elaboration: `lake env lean` of `Suggested.lean` gives `sorry` as the only warning, on the six theorems (lines 157, 179, 195, 221, 240, 269).
- Other uses of "1–4" in the README (§4.1) refer to §4.1's own four conditions and are not made stale by the new condition 5.
- Pull request text: the title and description agree with this head (new roadmap, four layers, two suppliers with their sections, the six Lean statements).

Overlap check: read CompressibleEulerEquations (at `4ae1090`), LorentzianGeometry and HamiltonJacobiAndConservationLaws as in the previous review; the change adds no object. CompressibleEulerEquations owns causal curves and domains of dependence, cited by the new condition 5; characteristic data stay owned here; nothing else shared.

Source independence: changed passages only: 5 passages (the clause on `S₀`, condition 5, the two new Checks, the Rendall entry) read; they add no locator and state the roadmap's own conditions and instances, so no source text was set beside them this round; largest share LuoYu2025a, 9 of 34 citations; the arrangement is unchanged (no layer added, removed or reordered) and stands as compared before: independent. Rendall 1990 could not be read beyond its abstract.

Research link: Layers 1–4 build the carriers on which Luo–Yu (Ann. of Math. 202, 2025) state the stability of multi-dimensional rarefaction waves: acoustical coordinates and the `κ` equation, `𝒟₀` and `C₀`, compatible characteristic data, the Goursat step, centered rarefaction waves; and the acoustical functions of Christodoulou–Miao 2014. Rests on the README and on LuoYu2025a §2, LuoYu2025b Definition 2.13 and §5.4.

## Not verifiable

- Rendall 1990 (§§3.1, 3.4, 3.5): paywalled at the publisher; only its bibliographic record and abstract were read, in the previous review. Whether its theorem covers data on a spacelike and a null hypersurface, as §3.4 uses the method, was not checked.
- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 1.2.6 (§3.4); Hawking–Ellis 1973, Ch. 6 (§2.2); Christodoulou 2007, Ch. 2 (§1.2): books with no legal open copy.
- The numbering of the Annals versions of Luo–Yu I and II: only the arXiv texts were read, in the previous review.

## Source issues

- **Misprint** in LuoYu2025b at Definition 2.13, p. 24: the source says the rarefaction region is an open set disjoint from the domain of dependence that contains its boundary hypersurface, which no open set can; it should be the union of the leaves for the foliation parameter in a closed interval, closed on the side of that hypersurface; affects nothing.

## For the human reviewers

- Supplier order: both suppliers (CompressibleEulerEquations, LorentzianGeometry) are open pull requests, and LorentzianGeometry is not in the merge-order file, although the dependency check reports no problem.
- Reuse: eight definitions of `TauCetiRoadmap/CompressibleEulerEquationsPartII/Suggested.lean` (lines 69–137) repeat, under this roadmap's namespace, those of `TauCetiRoadmap/CompressibleEulerEquations/Suggested.lean` in the open supplier pull request, as its docstring says.
- Not tested: Rendall 1990, the source of the routes of §§3.4–3.5, was read only in its abstract; wording and arrangement were not compared with it.
