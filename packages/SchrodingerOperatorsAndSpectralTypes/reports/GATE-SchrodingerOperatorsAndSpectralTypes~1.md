# GATE-SchrodingerOperatorsAndSpectralTypes~1: answers to the review of 2026-11-19

One review (kim-em, AI-assisted) with seven numbered requests; request 4 makes two points and
request 7 four, so eleven points H01–H11. Repairs are in commit `02dfa40e` on top of `fb94264`
(README.md and Suggested.lean of `TauCetiRoadmap/SchrodingerOperatorsAndSpectralTypes/` only).

## H01 (kim-em) — applied differently

New §3.11 (README lines 1341–1408) states, for complete `X`, the decomposition principle
`inf σ_ess(Δ_X) ≥ λ₀^D(X ∖ K)` for every compact `K` (IMS localisation, K5a §5.4 supported Rellich
through the new 3.4 chart comparison, 1.6's variational count, UO-C02 finite-rank windows) and, as
its corollary with Hardy's inequality in each cusp and 3.10, `σ_ess(Δ_X) = [1/4, ∞)` when
`X ∖ (C₁ ∪ ⋯ ∪ C_m)` is compact for pairwise disjoint standard cusp ends, `m ≥ 1`; it is the new
Lean headline `essentialSpectrum_eq_Ici_quarter` (Suggested.lean line 379), and the Summary, Layer 3
Examples, Downstream consumers, Scope and the hm23 worked example now use it. The suggested
consequence "`σ(Δ_X) ∩ [0, 1/4)` is finitely many eigenvalues" does not follow from
`σ_ess = [1/4, ∞)` (`diag(1/4 − 1/n)_{n≥4} ⊕ M_s` on `ℓ² ⊕ L²([1/4, ∞))` has that essential spectrum
and infinitely many eigenvalues in `[0, 1/4)`), so the README states finiteness in `(−∞, c]` for
each `c < 1/4` — which is what hm23 Theorem 1.1 on `[0, 1/4 − ε)` needs — records the example as a
Check, and leaves finiteness in `[0, 1/4)` (Lax–Phillips, via separation of variables) downstream.

## H02 (kim-em) — applied

3.7 has a new second bullet (line 1065): an eigenfunction `u ∈ dom Δ_X`, `Δ_X u = λu`, has a
smooth representative `f` with `Δf = λf`, by iterating K5a §5.7 (`Pu ∈ H^s_loc ⇒ u ∈ H^{s+2}_loc`
for the Laplace-type `Δ − λ`, from the `L²_loc` step) and K5a §5.4's `H^s → C^k`, `s > k + n/2`.
3.7's Needs line now lists 3.3 and "ComplexKahlerGeometry K5a (§5.4 embeddings, §5.7 interior
regularity)".

## H03 (kim-em) — applied

3.6's theorem now ends "and `Δ_X` is the only self-adjoint extension of `Δ₀`" (line 1014), with route
step (f) (line 1033): `T ⊇ Δ₀` self-adjoint is closed, so `closure Δ₀ ⊆ T`, and
`T = T† ⊆ Δ₀† = Δ_X`. Neither Mathlib nor Tau Ceti has an "adjoint reverses inclusion" lemma at the
pins, so the step cites `LinearPMap.mem_adjoint_domain_of_exists` and `LinearPMap.adjoint_apply_eq`
(`Mathlib/Analysis/InnerProductSpace/LinearPMap.lean` lines 163, 183) and
`LinearPMap.IsClosable.graph_closure_eq_closure_graph` (`Mathlib/Topology/Algebra/Module/LinearPMap.lean`
line 103), added to the Mathlib supplier contract.

## H04 (kim-em) — applied

3.4 gains the chart comparison (line 944: for a chart `ψ` and compact `L ⊆ U`, `u ∈ L²(X)` vanishing
outside `L` is in `H¹(X)` iff `Re`, `Im` of `u ∘ ψ⁻¹` are in `TauCeti.Wkp` with `k = 1`, `p = 2`, with
two-sided norm constants depending on `ψ`, `L`; route through K5a's Bessel-scale `H¹_loc` and PDE §1.3)
and a compact-support bullet (line 950) whose route uses PDE §1.2's mollification bullet ("the
mollifications of a compactly supported `W^{1,2}` function converge in `W^{1,2}`"). 3.6 step (c)
(line 1030) now reads "each `χ_k u` lies in `H¹₀` by 3.4 (compact support)", the tautological
"density of `C_c^∞` in `W^{1,2}_0`" is gone from 3.6's Needs line and from the PDE supplier contract.

## H05 (kim-em) — applied

3.4 now states Green's formula on `H¹` (line 953): for `u ∈ H¹_loc` with `Δu ∈ L²_loc` and `v ∈ H¹`
of compact support, `∫ conj(v)·Δu = ∫ ⟨dv, du⟩_g`; both sides equal `∫ conj(Δv)·u` for test `v` by
the transpose definitions (K5a) and 3.1, and pass to the limit through the compact-support bullet.
3.6 steps (a), (b) now cite it with `v = χ_k² u` (witness: on `ℝ`, `u = e^{−x²}`,
`v = (1 − |x|)₊`, both sides equal `2(1 − e^{−1}) ≈ 1.26424`).

## H06 (kim-em) — answered

No change: the merge order lists QuantumFoundations immediately before this roadmap (line 224 of
225) and MaassForms at line 170, so both merge first, and the house rules cite suppliers by roadmap
name and section, never by pull-request number. QuantumFoundations §8.2 at its head states what
Layer 4 consumes (self-adjoint `−Δ/(2m)` on `H²(ℝⁿ)`, Schwartz and `C_c^∞` cores, Fourier
intertwining, `σ = σ_ac = [0, ∞)`); MaassForms §0.1 is cited only for the sign convention
`−(im z)²Δ`, which it states.

## H07 (kim-em) — applied differently

Every line locator now also carries the published locator (theorem, lemma, equation, section and
page), about thirty of them; for example 2.1 "teschl line 5044–5052 with `n = 1`" → "teschl line
5044–5052, Theorem 4.10 with `n = 1`", 3.2 "bms02 line 151–157" → "bms02 line 151–157 (§2.1, p. 4)",
3.7 "hm23 line 41–43" → "hm23 line 41–43, the first paragraph of §1", 3.10 "line 279–290" → "line
279–290, (2.15)–(2.17), p. 267". The line numbers are kept: they point into the extraction whose hash
the roadmap's source manifest records, are how locators are verified, and are the convention of the
roadmaps on main (MotivicEtaleKTheory, ArcTopologyAndDescent, Varifolds and others).

## H08 (kim-em) — applied

3.6 route (b) (line 1027): `∫ χ_k² |u|² ≤ 2 sup |grad χ_k|² ‖u‖²` → `≤ sup |grad χ_k|² ‖u‖²`, since
`∫ χ_k²|u|² + ∫ χ_k²|du|² ≤ 2‖χ_k du‖‖u dχ_k‖ ≤ ‖χ_k du‖² + ‖u dχ_k‖²`; the paragraph was rewritten
for H04/H05 anyway.

## H09 (kim-em) — answered

No change at the pin: `TauCeti.Manifold.instRiemannianBundleOpen` is declared in
`TauCeti/Geometry/Manifold/Riemannian/Restriction.lean` line 209 of the pinned Tau Ceti, the path the
supplier contract and the Suggested.lean import use; a later pin bump that moves it to
`Restriction/Basic.lean` changes both.

## H10 (kim-em) — answered

No change: 3.6–3.7 are the statements for every complete Riemannian manifold and the Layer 3 Examples
and Scope already say they give CongruenceSpectralGap §0.2's operator and kernel on `Γ(N′)\ℍ`; a
citation from CongruenceSpectralGap is that roadmap's revision, outside this folder.

## H11 (kim-em) — applied

3.7's third bullet (line 1077) no longer asserts the R5c comparison, which 3.8 proves after it:
"on a nonempty compact `X` ... `λ_k(X) = μ_{k+1}(Δ⁺)` in R5c's numbering (3.8), and R5c's `λ₁(Δ⁺) = μ₂(Δ⁺)`
is this section's `λ₁(X)`" → "3.8 proves `λ_k(X) = μ_{k+1}(Δ⁺)` on a nonempty compact `X` with
`dim X ≥ 1`, so that R5c's `λ₁(Δ⁺) = μ₂(Δ⁺)` is `λ₁(X)` there". Listing 3.8 on 3.7's Needs line, the
other option, would be a forward dependency, since 3.8 needs 3.7.

## Build and gate

`lake build TauCetiRoadmap.SchrodingerOperatorsAndSpectralTypes.Suggested`: `Build completed
successfully (18552 jobs)`, 14 `declaration uses 'sorry'` warnings (one per theorem, the new
`essentialSpectrum_eq_Ici_quarter` included), no errors.

Gate (after the commit):

    gate SchrodingerOperatorsAndSpectralTypes: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck ... --movable --pr 2424`):

    depcheck: 199 roadmaps, 2188 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. No supplier was added; no notion moved down from a later roadmap.
`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere; the
library names it does not check were checked by hand at the pins (`LinearPMap.adjoint_apply_eq`,
`LinearPMap.IsClosable.graph_closure_eq_closure_graph`, `LinearPMap.mem_adjoint_domain_of_exists`,
`LinearPMap.adjoint_isClosed` in Mathlib; `TauCeti.Wkp` in `TauCeti/Analysis/Sobolev/Wkp/Basic.lean`
line 145).

## Elaborated signatures

`#check @name` for all 20 declarations was appended to Suggested.lean, elaborated once with the build
command above, and removed (the committed file has no `#check`). Only one declaration is new,
`essentialSpectrum_eq_Ici_quarter`; its elaborated type carries every binder in its own signature
(the file has no section variables): the manifold, completeness, `T` with `hdom`/`hact`, a `Finite`
and `Nonempty` index type, cusp charts `φ i` with `IsStandardCuspEnd I (w i) (a i) (φ i)`, pairwise
disjoint ranges and `IsCompact (⋃ i, Set.range (φ i))ᶜ`, concluding
`essentialSpectrum T.closure = (fun t : ℝ => ↑t) '' Set.Ici (1 / 4)` — the README's statement (complete
`X`, `m ≥ 1` pairwise disjoint standard cusp ends, compact complement; a cusp chart's image is a
standard cusp end by 3.10). The other 19 types are unchanged from their elaborated types before the edits.

## Ownership

The decomposition principle and the equality `σ_ess(Δ_X) = [1/4, ∞)` for a compact set plus finitely
many cusp ends were searched for by object on main and at the heads of the open roadmap pull
requests (`decomposition principle`, `Persson`, `IMS`, `Glazman`, `[1/4, ∞)`, `finitely many cusp
ends`). CongruenceSpectralGap §0.6 (main) proves the congruence case from the adelic decomposition and
MaassForms (open) imports it; no roadmap states the geometric statement for an arbitrary complete
surface with variable curvature on a compact part. This roadmap owns it as the other half of the cusp
threshold already in its scope; its Scope now lists "the decomposition principle". No declaration
name of another readable roadmap is reused.

## Sources

No new source was fetched; nothing was added to `needs-references.toml`. New locators were read from
the cached extractions: teschl (pages from the printed headers of the online edition), kato57,
yafaev04, rosenblum57, bms02, hm23, lp80, kps26. Hardy's inequality and the IMS identity are proved in
the route (one line each); the decomposition principle is deduced here from 1.6, 3.4, 3.6 and K5a.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.11 decomposition principle `inf σ_ess ≥ λ₀^D(X∖K)` | `K = X` compact (circle); `X = ℝ`, `K = ∅`; `X = ⊔ S¹_j`, `K = S¹_1`; `X = ℕ` discrete; `X = Γ(2)\ℍ`, `K = K_b` | `λ₀^D(∅) = +∞`, `σ_ess(Δ_{S¹}) = ∅`; `λ₀^D(ℝ) = 0 = inf σ_ess`; `λ₀^D = 0` (constant on `S¹_2`), `0 ∈ σ_ess`; `λ₀^D = 0`, `σ_ess = {0}`; `λ₀^D ≥ 1/4 = inf σ_ess` while `0 ∈ σ` | holds; must bound `σ_ess`, not `σ` | Check added (`Γ(2)\ℍ`, eigenvalue `0`) |
| IMS identity `\|d(χ₀u)\|²+\|d(χ₁u)\|² = \|du\|²+\|dθ\|²\|u\|²` | `θ ≡ 0`, `θ ≡ π/2`, `θ = x` and `u = 1` on an interval of `ℝ` | `\|du\|² = \|du\|²`; `sin²+cos² = 1 = 0 + 1` | holds | none |
| finite-codimension step `(1+ε)‖du‖² ≥ (c−ε)‖u‖²` | `‖W^{1/2}u‖² ≤ ε(‖u‖²+‖du‖²)` on `ker R`; `c = 1/4`, `ε = 0.1` | bound `0.15/1.1 ≈ 0.136 → 1/4` as `ε → 0` | holds | none |
| Hardy `∫_b^∞\|f\|²y^{−2} ≤ ∫\|f\|²(y−b)^{−2} ≤ 4∫\|f'\|²` | `b = 1`, `f = s(1−s)` on `s = y−1 ∈ [0,1]` | `∫f'² = 1/3`, `∫f²/s² = 1/3 ≤ 4/3`, `∫f²/y² ≈ 0.0156` | holds | none |
| sharpness of `1/4` on a cusp | `u = y^{1/2}ψ(log y/n)`, `ψ = sin(πt)` on `[1,2]` | `‖du‖²/‖u‖² = 1/4 + π²/n²`: `10.12, 0.867, 0.289` at `n = 1, 4, 16` | constant `1/4` sharp | Check added |
| 3.11 cusp equality `σ_ess = [1/4, ∞)` | `Γ(2)\ℍ` (`m = 3`); closed hyperbolic surface (`m = 0`); `(Γ(2)\ℍ) ⊔ ℝ²`; parabolic cylinder | `[1/4,∞)`, agrees with CongruenceSpectralGap §0.6; `σ_ess = ∅ ≠ [1/4,∞)`; `σ_ess ⊇ [0,∞)`; complement `{y ≤ 1}` not compact, hypothesis fails (its spectrum is `[1/4,∞)` by Fourier modes, so the hypothesis is sufficient, not necessary) | `m ≥ 1` and compact complement needed | Checks added (`m = 0`, `⊔ ℝ²`) |
| consequence "finitely many eigenvalues" | `diag(1/4 − 1/n)_{n≥4} ⊕ M_s` | `σ_ess = [1/4,∞)`, eigenvalues `0, 1/20, 1/12, …` infinitely many in `[0,1/4)` | the reviewer's form fails; finite in `(−∞, c]`, `c < 1/4` | stated that form; Check added |
| `K_b` compact | collar `{a < y ≤ b}`, metric `≤ (dx²+dy²)/a²`; sequence `(x, a + 1/n)` | distances `≤ \|log((a+1/n)/(a+1/m))\| → 0`: Cauchy, converges in complete `X` | holds | none |
| 3.6 uniqueness of the self-adjoint extension | `X = ℝ`; incomplete `X = (0,1)` | unique extension `H₀`; Dirichlet `n²π²` (`n ≥ 1`) and Neumann `n²π²` (`n ≥ 0`) are two extensions | completeness needed, consistent with 3.2's deficiency `(2,2)` | none |
| 3.6(b) constant `1` | algebra `∫χ²\|u\|² + ∫χ²\|du\|² ≤ ‖χdu‖² + ‖u dχ‖²` | `∫χ²\|u\|² ≤ sup\|dχ\|²‖u‖²` | holds with `1` | `2 → 1` |
| 3.4 chart comparison | `X = ℝ`, identity chart, `L = [−1,1]`; `ℍ`, `L = [0,1]×[1,2]`; `L` reaching `y → 0` | `C = 1`; energy `∫(\|∂ₓu\|²+\|∂_y u\|²)dxdy` exact, `L²` weights `y^{−2} ∈ [1/4, 1]`, `C = 2`; weight unbounded | compactness of `L` needed | none |
| 3.4 compact support ⇒ `H¹₀` | `X = (0,1)`, `v = 1` (not compactly supported) | `1 ∈ H¹ ∖ H¹₀` (Poincaré fails) | hypothesis needed | none |
| 3.4 Green's formula on `H¹` | `ℝ`, `u = e^{−x²}`, `v = (1−\|x\|)₊`; `(0,1)`, `u = v = x` (no compact support) | both sides `2(1 − e^{−1}) ≈ 1.26424`; `0 ≠ 1` | compact support needed | none |
| 3.7 smoothness of eigenfunctions | circle `e^{inθ}`; `ℝ` (no `L²` eigenfunctions); `⊔ S¹_j`, `1_{S¹_j}`; 3.9's `V = 1_{[0,π)}` | smooth; vacuous; locally constant, smooth; non-smooth there, but that is `Δ_X + V`, not `Δ_X` | holds; consistent with 3.9 | none |
| 3.7 → 3.8 comparison pointer | circle | `λ₁ = λ₂ = 1 = μ₂ = μ₃` | unchanged mathematics, forward claim removed | none |
| Lean `essentialSpectrum_eq_Ici_quarter` | context (`#check`); `ι` empty excluded by `Nonempty`; images = cusp ends | binders all explicit; `m = 0` would give `∅ ≠ [1/4,∞)` | generality equals README | none |

No passage of the review asked for a command, a change outside the job, or a credential.
