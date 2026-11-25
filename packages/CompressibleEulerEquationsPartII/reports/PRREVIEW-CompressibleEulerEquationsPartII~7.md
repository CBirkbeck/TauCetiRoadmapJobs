# Review of CompressibleEulerEquationsPartII (pull request #3010 at 8e9f901)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the review of `8e9f901`, which had no open point, and the pull request's title and description, read sentence by sentence against this head and against the two supplier heads they name, agree with them. There are no findings and no small corrections; one format note (the LorentzianGeometry supplier contract omits §3.1, which §2.2 cites). The supplier order and the unread Rendall article remain for the human reviewers.

## N01 — The supplier contract for LorentzianGeometry lists §§3.2–3.3 but not §3.1, which §2.2 uses

§2.2 (line 251, and its *Needs:* line 278, and Layer 2's Dependencies, line 323) cites LorentzianGeometry §3.1 for the admissible change of parameter, and the pull request's description lists "§§3.1–3.3"; the `### From TauCetiRoadmap.LorentzianGeometry` list starts at "§§3.2–3.3". Adding "§3.1: admissible reparametrizations of curves" to that bullet would make the contract complete. The section exists at the supplier's head (`### 3.1 Curve domains and admissible reparametrizations`).

## Previous findings

- none: the previous report, of `8e9f901`, has no finding, small correction or format note (its R01, C01 and N01 of the round before were all recorded there as repaired, and the folder has not changed since).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §4.2, `isSolution_planeRarefaction` (cited by the description): `u′ = λ_r − x¹/t` is acoustical | general `γ > 1`; `γ = 3`, `c_r = 1`, `v_r = 0` at `x¹/t = 0` | `∂_t u′ + v∂₁u′ = (x¹/t − v)/t`, `c|∂₁u′| = c/t`; `v + c = c(γ+1)/(γ−1) − 2w_r = x¹/t`. Numeric: `w_r = 1/2`, `c = 1/2`, `v = −1/2`, sum `0 = x¹/t` | holds | none |
| §4.2, matching the right state and `c > 0` on the wedge | `x¹ = λ_r t`; `x¹/t ≥ λ_r − u*` | at the edge `c = ((γ−1)/(γ+1))·c_r(γ+1)/(γ−1) = c_r`, `v = v_r`; `x¹/t + 2w_r ≥ λ_r + 2w_r − u* > 0` by the last hypothesis | holds | none |
| §2.3, `futureDomainOfDependence_eq_setOf_neg` (cited by the description) | constant state `c = 1`, `v = 0`, `n = 1`, `t₀ = 0`, `u = t − x` | `∂_t u + v∂_x u = 1 = c|∂_x u|`; `S = {x > 0}`; every past curve of speed ≤ 1 from `(t, x)` ends in `[x − t, x + t]`, inside `S` iff `x > t`, i.e. `u < 0`; frontier `{x = t}` = `{u = 0}` | both sides equal | none |
| Description, supplier sections of CompressibleEulerEquations | the list "§§1.1–1.3, 2.1–2.2, 3.1–3.3, 6.1–6.2, 7.1–7.3 and 8.1–8.4" | identical to the README's contract list (lines 676–689) and to the supplier's own Downstream-consumers sentence at `3a9f46e`; all 17 headings exist there | agrees | none |
| Description, supplier sections of LorentzianGeometry | "§§3.1–3.3, 7.3, 8.1, 9.2–9.3, 12.6 and 12.7" | each is cited in the README body (§3.1 at lines 251, 278, 323; §8.1 at 87, 104); headings 3.1–3.3, 7.3, 8.1, 9.2, 9.3, 12.6, 12.7 exist at `3eb25c3` | agrees (see N01 for the README's contract list) | none |
| Description, the six Lean statements and the restated definitions | declarations of `Suggested.lean` | 6 theorems (§1.2 ×2, §1.3, §2.1, §2.3, §4.2), 11 definitions; `soundSpeed` is in supplier §1.1, `IsSolution` §1.3, cones and curves §§3.1–3.3: "§§1.1, 1.3 and 3.1–3.3" is right; one import, `Mathlib` | agrees | none |

The rows for the statements of the folder stand as in the previous review, of `8e9f901` (and, for those it did not recompute, of `43babce`).

- Pull request text: title and every sentence of the description's prose read against the head: new roadmap (not on main; 3 files, 29 headings, 17 declarations added), topic `math.AP` (the metadata file), four layers as described, two suppliers. No sentence contradicted, no change left unstated.
- Supplier heads named in the description: CompressibleEulerEquations is at `3a9f46e` and LorentzianGeometry at `3eb25c3`, as it says. The supplier's Scope ("Fractional orders", "Characteristic initial data") and Downstream consumers name "Compressible Euler equations, Part II", as the description says.
- Cross-roadmap citations resolved again: the 24 supplier declaration names of the README's contract for CompressibleEulerEquations all occur in its README or `Suggested.lean` at `3a9f46e`; its change since `4ae1090` (29 README lines) renames or drops no section. LorentzianGeometry §12.6's statement on time functions (reduction to `t`-parametrized curves in the extension form, for the acoustical forms of §7.3 with `c > 0` continuous) is at its head as the description and the Lean header use it.
- Dependency check: `depcheck: 124 roadmaps, 1404 edges, 0 problem(s)`; no change outside the folder.
- Automatic checks: all passed in the worker's run at this head.
- Elaboration: `lake env lean` of `Suggested.lean` gives `sorry` as the only warning, on the six theorems (lines 157, 179, 195, 221, 240, 269). No statement changed, so signatures were not rechecked with `#check`.
- Source locators: none opened this round (no changed passage); the seeded sample stands as verified in the earlier rounds.

Overlap check: read CompressibleEulerEquations (at `3a9f46e`), LorentzianGeometry (at `3eb25c3`) and HamiltonJacobiAndConservationLaws as in the previous review; nothing shared. CompressibleEulerEquations owns causal curves, domains of dependence and developments of open data and hands characteristic data, acoustical functions and centered rarefaction waves to this roadmap by name; LorentzianGeometry owns the acoustical form, geodesics, null hypersurfaces and horizons.

Source independence: changed passages only: 0 passages (the folder did not change), so no source text was set beside the roadmap this round; largest share LuoYu2025a, 9 of 34 citations; the arrangement is unchanged (no layer added, removed or reordered) and stands as compared before: independent. Rendall 1990 could not be read beyond its abstract.

Research link: Layers 1–4 build the carriers on which Luo–Yu (Ann. of Math. 202, 2025) state the stability of multi-dimensional rarefaction waves: acoustical coordinates and the `κ` equation, `𝒟₀` and `C₀`, compatible characteristic data, the Goursat step, centered rarefaction waves; and the acoustical functions of Christodoulou–Miao 2014. Rests on the README and on LuoYu2025a §2, LuoYu2025b Definition 2.13 and §5.4.

## Not verifiable

- The description's sentence that the roadmap serves an entry of the AnnalsDefinitions census (`census/033.md`): that repository was not opened; the README does not mention it, so nothing in the folder depends on it.
- Rendall 1990 (§§3.1, 3.4, 3.5): paywalled at the publisher; only its bibliographic record and abstract were read, in an earlier review. Whether its theorem covers data on a spacelike and a null hypersurface, as §3.4 uses the method, was not checked.
- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 1.2.6 (§3.4); Hawking–Ellis 1973, Ch. 6 (§2.2); Christodoulou 2007, Ch. 2 (§1.2): books with no legal open copy.
- The numbering of the Annals versions of Luo–Yu I and II: only the arXiv texts were read, in an earlier review.

## Source issues

- **Misprint** in LuoYu2025b at Definition 2.13, p. 24: the source says the rarefaction region is an open set disjoint from the domain of dependence that contains its boundary hypersurface, which no open set can; it should be the union of the leaves for the foliation parameter in a closed interval, closed on the side of that hypersurface; affects nothing.

## For the human reviewers

- Supplier order: both suppliers (CompressibleEulerEquations, LorentzianGeometry) are open pull requests, and LorentzianGeometry is not in the merge-order file, although the dependency check reports no problem.
- Reuse: eight definitions of `TauCetiRoadmap/CompressibleEulerEquationsPartII/Suggested.lean` (lines 69–137) repeat, under this roadmap's namespace, those of `TauCetiRoadmap/CompressibleEulerEquations/Suggested.lean` in the open supplier pull request, as its docstring says.
- Not tested: Rendall 1990, the source of the routes of §§3.4–3.5, was read only in its abstract; wording and arrangement were not compared with it.
