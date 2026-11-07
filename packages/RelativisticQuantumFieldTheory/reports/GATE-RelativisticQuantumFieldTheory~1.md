# GATE-RelativisticQuantumFieldTheory~1: answers to the review of b6720a9

One review comment (CBirkbeck, 2026-11-05, findings F01–F08), numbered H01–H08 in order. Repairs are
in commit `58e7a766` on the pull-request branch (not pushed). Files: `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md`,
`TauCetiRoadmap/RelativisticQuantumFieldTheory/Suggested.lean`.

## H01 (CBirkbeck) — applied differently

The in-folder part is done: the README now opens with `**Summary.**`, then `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (From Mathlib / Tau Ceti / each roadmap, by section), `## How to read the build`; every milestone ends with `### Examples` (computed) and `### Dependencies`; the "Suggested files" block, the "prototype" sentence and the whole `## Source-specific completion ledger` are deleted, and the history/phenomenology targets RQFT9.JetStatistics, RQFT9.SourceDecayLabels, RQFT9.SourceWorkedModels and the finite-orthogonal-group paragraph cited to the nonexistent OrthogonalSpinGroups 1G–1H (Completed/OrthogonalSpinGroups has items 1A–1F only) are removed. Not done here, because it needs new roadmap folders outside this folder: the split into Parts (proposed cut: RQFT0–RQFT4 + RQFT10 free fields and axioms; RQFT5–RQFT6 graph algebra and renormalization; RQFT7–RQFT9 + RQFT11 Euclidean, scattering, QED, power counting) and a `**Checks.**` list for every definition; the `## Milestone RQFTk` headings and target ids are kept because NoncompactQuantumSymmetry (README line 23) cites RQFT0–RQFT3 and RQFT11 by id. That split is the human decision the review leaves open.

## H02 (CBirkbeck) — applied

The manifest now resolves `borcherds-qft` to the typed Borcherds–Barnard notes, arXiv math-ph/0204014v1, and `unsw-qft` is waived (cited by page). Handwritten-page Borcherds locators became section/page locators of the typed notes wherever I found the item there (e.g. four contour propagators and `Δ_A+Δ_R=Δ_F+Δ_D`, `borcherds-qft` line 1458, §6.2 p. 40; finite renormalisations `C(•)=1` and `C[F](Γ)=Σ_γC(γ)F(C(γ)⁻¹Γ/γ)`, lines 1703–1713, §7.3 p. 47; spinor-norm cases, lines 2587–2596, §9.2 p. 70; the four symmetry questions, line 2422, §8.3 p. 65), and were dropped elsewhere; every glyph/Luna/crossed-out/transcript/"preserve the literal" clause and the private-evidence line are deleted. Source discrepancies are kept only where the legal text witnesses them: the false identity `∫φ̂ψ̄=∫φ·conj(ψ̂)` (line 1304, p. 36; correct right side `∫φ(x)conj(ψ̂(−x))dx`), the even-powers-only expansion of `e^{jφ}` (lines 868–872, p. 25), and the one-loop summary `−λφ²/8` (line 1172, p. 32) against the diagram value `−λφ²/4` (lines 1151–1152), which first-order Legendre perturbation of `W=j²/2−λ(j⁴+6j²+3)/24` confirms; the handwritten "Aut(nG)=n!Aut(G)" error is not in the typed text (lines 1049–1057 have `n!Aut(G)ⁿ`) and is now a Check that the shortcut fails (`|Aut(2G)|=8≠4` for a single edge). The manifest lives in the board package, not the folder; see "Sources" below for what the worker should record.

## H03 (CBirkbeck) — applied

Every QF label is replaced by a QuantumFoundations section at its head: QF4 → §6.3–§6.4, QF6a → §8.1–§8.2, QF6b → §9.4 (Kummer/Tricomi), §9.5 (Coulomb) or §9.9 (the `S_t` family), and QF5 → NoncompactQuantumSymmetry P.4 (Whitehead lemmas, NQS line 473); `grep -c 'QF[0-9]'` is 0. The sentence asserting that QuantumFoundations consumes RQFT3/4/10, the Kummer/Tricomi "conditional consumer specialization" paragraph and both Lean theorems it described (`kummerM_differential_equation`, `kummerU_differential_equation`, whose hypotheses contained their conclusions) are deleted; Scope and ownership now states that QuantumFoundations and NoncompactQuantumSymmetry consume nothing from this roadmap.

## H04 (CBirkbeck) — applied

`Suggested.lean` is rewritten (855 → 364 lines): the required docstring, naming as not statable at the pins the free fields and Shale (no Fock space), Reeh–Schlieder/spin–statistics/PCT/OS reconstruction/Haag–Ruelle (no Poincaré-covariant Wightman field or net), wavefront-controlled extension, forest formula and QED (no wavefront sets or graph amplitudes), Connes–Kreimer (no graph Hopf algebra), the torus Green function (no periodic distributions) and graviton power counting. It states, with `sorry`: `existsUnique_retardedSolution`/`existsUnique_advancedSolution` (Bär–Ginoux–Pfäffle Cor. 3.4.3, Thm 3.1.1), `exists_prescription_distributions`, `prescription_relations`, the new invariant classification `existsUnique_shell_decomposition`, `norm_quarticIntegral_sub_sum_le` (all `j`, explicit remainder) and `quarticContinuation_continuation` (the review's missing headline: holomorphic on `ℂ∖{0}`, equal to `Z(j,ζ⁴)` for `ζ>0`, odd, not meromorphic at 0), the point extension `existsUnique_extension_of_scalesBelow` (Brunetti–Fredenhagen Thm 5.2), `reflectedCovariance_eq_inner` now in position space with the pinned `TauCeti.heatKernel`, `denseRange_toOneParticle`, and the three massless limits. Everything in the review's (a)–(f) is gone: the Kummer theorems, the quaternion/KG/photon/Coulomb scalar algebra, the boundary lemmas, the graph structures, the dimension lattices, `CommonDomain`/`OperatorValuedTemperedField`/`TemperedDiagonalExtension`/`FormalSeries`, the `legacy*` and out-of-namespace `toSchwartzMapCLM` declarations, the TorusGreen coefficient lemmas, the local instance and the process comments.

## H05 (CBirkbeck) — applied differently

Bostelmann: in arXiv v3 the equations are (4.7) (point-field subnet) and (4.8) (`H_F=H ⇔ A_F=A`, which the paper only expects, `bostelmann05` line 465); the README now cites those, keeps Definitions 2.1/4.1, Lemma 3.5 and Theorems 3.3/3.6/4.3 (all present, lines 180, 410, 334, 217, 374, 448) and adds a reference entry. GH2 is now cited as "GlobalHolomorphicFunctions GH2's local Laurent phase" (Layer 4 (GH2) at its head) with no line anchor. The PDE part is disputed: on current main (eaf17b1) PDE §6.3 is headed "The heat semigroup and its generator (F26)" (line 2309) and is built on the pinned `TauCeti.heatKernel` (`TauCeti/Analysis/PDE/HeatKernel/Basic.lean` line 76); the reviewer's copy of main predates it. The citation now reads "PDE §6.3 (F26), the heat semigroup built on the pinned `TauCeti.heatKernel`".

## H06 (CBirkbeck) — applied

Gate went from `blob=30 tex=1 prnum=1 round-labels=2` to all four 0: every blob or relative roadmap link is now a roadmap name plus section or target id, `F_{μν}` is in a code span, the Mathlib pull request is linked as "the open Mathlib pull request on these inclusions" (shape guidance, as README "Defer to Mathlib" asks), and the Θ formula uses `φ_{r₁}` subscripts. The module-system advisory is gone too: `Suggested.lean` now opens with `module`, imports `public import Mathlib` and `public import TauCeti.Analysis.PDE.HeatKernel.Basic` (itself a module at the pin), and wraps its declarations in `@[expose] public section`, the header of the module-style Suggested files on main (PDE, MorseNovikov, PrimitivePrimeDivisors).

## H07 (CBirkbeck) — applied

Each listed target now has a locator or says "This roadmap owns the proof route below": RQFT0.TestProductsAndFourierPhase, RQFT0.RealLineBoundary, RQFT5.MarkedMetricRealization (its "taxi/small-bug" aside deleted), RQFT5.FieldJets, RQFT6.SourceProductAdapters, RQFT6.TypedJetImage, RQFT6.DiagonalStabilizer.Core, RQFT6.UniformFiniteParameters and RQFT7.TorusGreen own their routes; RQFT4.StrongLocalNet owns its route with input UnboundedOperators UO-E03; RQFT5.GeneralChannelRateNormalization cites Weinberg, *QFT I*, §3.4; RQFT9.SourceWorkedModels is deleted (H01). I did not attach the review's suggested Trèves/Reed–Simon numbers, because I could not read those books to check them.

## H08 (CBirkbeck) — applied differently

The process words are gone (`legacy`, `prototype`, `ledger`, `transcript`, `glyph`, `Luna`, `source error`, `crossed`: 0 each, apart from the URL host `scipp-legacy`), as are the `legacy*` and `TauCetiRoadmap.ContDiffMapSupportedIn`/`TauCetiRoadmap.TestFunction` declarations; all Lean now lives in `TauCetiRoadmap.RelativisticQuantumFieldTheory`. The label point is disputed: NoncompactQuantumSymmetry M4 at its current head (04e63341, README line 2188) does label the null orbits by `ε_E∈{±1}` and `ℓ∈ℤ`, with little-group character `exp(iℓθ/2)` and helicity `ε_E ℓ/2` (`κ=ℏℓ/2`), so photon `(+1,±2)` and graviton `(+1,±4)` are its labels (the reviewer read 777a2fe3). They are now written `ε_E` to match the supplier exactly.

## Build and gate

- `lake build TauCetiRoadmap.RelativisticQuantumFieldTheory.Suggested`: `Build completed successfully (8958 jobs)`, exit 0; the only warnings are the 14 `declaration uses 'sorry'` (one per stated theorem). The earlier warning "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file" is repaired by the module header (`module`, `public import Mathlib`, `public import TauCeti.Analysis.PDE.HeatKernel.Basic`, `@[expose] public section`); nothing else in the file changed.
- Gate: `gate RelativisticQuantumFieldTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The one remaining item is `depcheck: NOT IN ORDER: RelativisticQuantumFieldTheory (insert it after its last supplier)`; the roadmap is at the design stage, which the brief says is not a defect.
- Dependency direction (`gate --depcheck … --movable` against the board's merge order, which now lists RelativisticQuantumFieldTheory right after StochasticCalculus): `depcheck: 239 roadmaps, 2430 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The full gate's own depcheck item still prints `NOT IN ORDER` (above).
- Signatures: I put `#check @name` for all 44 declarations in one scratch file and elaborated it. Every declaration has only explicit binders (no section `variable`s), every type matches its README statement, and `ContDiff ℝ ↑⊤` is smoothness, not analyticity. One change came from that comparison: the README states the quartic asymptotics for every `j`, so `quarticCoefficient : ℕ → ℂ → ℂ` and `norm_quarticIntegral_sub_sum_le` were generalised from `j=0` to every `j`, with the `j=0` values kept as README checks. The module-header repair changes no statement: it adds no binder and no `variable`, and `@[expose] public section` keeps every declaration public with its body visible, so the elaborated types are those compared above.

## Ownership, overlaps and citations

- Ownership checked against the sibling checkouts of QuantumFoundations, NoncompactQuantumSymmetry, VonNeumannAlgebras, StochasticCalculus and GlobalHolomorphicFunctions, and by `roadmaps grep` over main and all open roadmap PRs for retarded/advanced Green operators, scaling degree, Epstein–Glaser and reflection positivity. Only Completed/DenseGraphLimits (graph reflection positivity) matched, which is unrelated. No other roadmap owns these headlines; PDE and NoncompactQuantumSymmetry both state that the Lorentzian Green operators are owned here.
- Overlaps: the LieHighestWeight Layer 5 anchor that #1220 drops is no longer cited (replaced by the pinned `TauCeti.exists_isCompl_of_isKilling`, `TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean` line 259). The ComplexKahlerGeometry anchors that #1398 and #1807 drop are replaced by the target ids K3.MeromorphicGermField, K3.HolomorphicStalk, K5a.DistributionLocalStructure and K5a.SmoothSectionMontel, which main and both heads define. No open PR changes this roadmap, and no cited id is defined only by an open revision.
- HopfRinow and OrthogonalSpinGroups are cited as completed roadmaps (`Completed/` on main), with HopfRinow's Levi-Civita theory pointed at the pinned `TauCeti.Manifold.ContMDiffNondegenerateMetric`.
- `roadmaps resolve` on the final README: no cross-roadmap citation and no roadmap Lean name found nowhere. I checked the library names in the supplier contracts by hand at the pins.
- No notion moved down from a later roadmap.

## Sources

Fetched through the sources service (open repositories) and read: `brunetti-fredenhagen00` (arXiv math-ph/9903028v1: scaling degree at lines 1040–1061, Theorem 5.2 at line 1118, Theorem 5.3 at line 1188); `bar-ginoux-pfaffle07` (arXiv 0806.1036v1: Theorem 3.1.1 at line 3026, Definition 3.4.1 at line 3806, Corollary 3.4.3 at line 3840; their future-supported `G₊` is this roadmap's retarded operator); `bostelmann05` (arXiv math-ph/0409070v3). The worker should record these three in `sources.toml`.

The manifest entry `borcherds-qft` still has title "handwritten course notes" and locator "pp. 1-121", but its file is the 76-page typed notes; title and locator should read "Lectures on quantum field theory (Borcherds–Barnard)", §4–§9, pp. 21–76.

Cited by locator only, without the text (books or paywalled, to be recorded as `uncertified`): Weinberg, *QFT I*, §3.4; Hörmander, *ALPDO I*, Theorems 8.2.4 and 8.2.10; Streater–Wightman; Haag; Reed–Simon II; Bogoliubov–Shirkov; Osterwalder–Schrader II (CMP 42). No text is missing, so I wrote no `needs-references.toml`. No fetched text contained instructions.

## Adversarial pass

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| `kleinGordon` = `∂₀²−Σ∂ᵢ²+m²` | plane wave `e^{−i(ωt−k·x)}`, `ω²=|k|²+m²` | `−ω²+|k|²+m²=0`; Euclidean-sign model gives `−ω²−|k|²+m²≠0` | sign correct |
| `causalFuture`, `causalPast` | K={0}; x=(1,½,0,0), (1,2,0,0), (−1,0,0,0) | q=¾,t=1 ∈J⁺; q=−3 ∉; t=−1 ∉J⁺, ∈J⁻ | correct |
| `existsUnique_retardedSolution` | f=0; m=0 in 1+1 dimensions | J⁺(∅)=∅ ⇒ u=0 unique; d'Alembert `½∫_(s<t)∫_(|y−x|≤t−s)f` supported in J⁺ | true (BGP Cor 3.4.3 + Thm 3.1.1); any real m |
| `prescription_relations` | table entries | `G_F−G_A=[−Q+iπ(D₊+D₋)]−[−Q−iπ(D₊−D₋)]=2πiD₊`; `G_F−G_R=2πiD₋`; `G_R+G_A=−2Q=G_F+G_aF`; retarded poles `p⁰=±ω−iε` | consistent with README |
| `shellPairing` normalization | δ(p²−m²) on sheet p⁰=±ω | `δ(p⁰∓ω)/(2ω)` ⇒ weight `1/(2ω)`, no 2π | correct |
| `existsUnique_shell_decomposition` | m=0; full vs restricted group; uniqueness | δ₀ invariant with `p²δ₀=0` but not `aD₊+bD₋` ⇒ `hm` needed; full group would force a=b, restricted gives 2-dim; f near (m,0) separates D₊ | true with `0<m`, restricted group (new) |
| `quarticCoefficient` at j=0 | n=0,1,2 | `√2π`, `−√2π/8`, `35√2π/384`; typed p. 25: `1−λ/8+35λ²/384` | matches |
| `norm_quarticIntegral_sub_sum_le` | N=0,g=0,any j; N=1,j=0; Re g<0 | `|√2π e^{j²/2}|=√2π e^{(Re j)²/2−(Im j)²/2} ≤ √2π e^{(Re j)²/2}`; `|Z−√2π|≤√2π|g|/8`; Re g<0 excluded (integral diverges) | true; generalized to all j |
| `quarticContinuation_continuation` | ζ>0 substitution t=ζφ; ζ↦−ζ; ζ=0 | `F(ζ,j)=Z(j,ζ⁴)`; `F(−ζ)=−F(ζ)` by t↦−t; `F(0)=0⁻¹·…=0` odd-consistent; ray limits `±√2π e^{j²/2}≠0` ⇒ not meromorphic | true |
| `dilateTest` | c=0; Ω=ℝⁿ∖{0}, c≠0 | junk 0; `c•x≠0` for x≠0, support proof elaborates | correct |
| `ScalesBelow`, `existsUnique_extension_of_scalesBelow` | δ on ℝⁿ; `|x|^{−a}` on ℝ, a∈(0,1) and a=1; n=0 | `λ^{d−n}f(0)→0 ⇔ d>n` (sd δ=n, as BF); sd=a<1 unique; a=1 not covered, extensions `T+cδ`; n=0: only u=0 scales below d∈(σ,0) | true (BF Thm 5.2) |
| `reflectedCovariance_eq_inner` | p⁰-integral; 4D heat kernel; θx−y | `∫e^{ip⁰t}/(p⁰²+ω²)dp⁰=πe^{−ω|t|}/ω` ⇒ `(2π)^{−3}e^{−ω|t|}/(2ω)`; `(4πs)^{−2}` from `TauCeti.heatKernel` (finrank 4); time `−x₀−y₀`, `|·|=x₀+y₀` | factorizes to `⟨Kf,Kg⟩` with density `((2π)³2ω)⁻¹` |
| `denseRange_toOneParticle` | product tests a(t)b(x) | `K(a⊗b)(p)=(La)(ω(p))b̃(p)`, `La>0` | dense |
| massless limits | 1D envelope; 2D; n≥3 vs n=2 | `|(e^{−m|x|}−1)/(2m)|≤|x|/2`, error ≤ `mx²/4`; heat difference → `−log r/(2π)`; `|ξ|^{−2}` integrable at 0 iff n≥3 | hypotheses needed and sufficient |
| README Check `Aut(nG)` | G single edge, n=2 | `|Aut(2G)|=8=2!·2²`; shortcut gives 4 | added |
| README Check one-loop Γ | first-order Legendre | `Γ=−φ²/2−λφ⁴/24−λφ²/4−λ/8`; typed summary `−λφ²/8` | witnessed discrepancy kept |
| README Check Fourier identity | real non-even φ, ψ | `∫φ̂ψ̄=∫φ(x)conj(ψ̂(−x))dx` ≠ `∫φ conj(ψ̂)` | witnessed, corrected |
| README Check `Σδ^{(n)}/n!` | test = `1/(1+2x)` near 0 | terms `(−1)^nφ^{(n)}(0)/n!=2^n` | diverges |
| README Example circle Green | `G_{0,L}=L/12−d/2+d²/(2L)` | `(2/L)(L²/24−L²/16+L²/48)=0` | mean zero |
| README Example squeeze | one mode, `S=cosh t+sinh t C` | `|⟨Ω,UΩ⟩|²=(1−tanh²t)^{1/2}=sech t` | matches `c₀=(1−κ²)^{1/4}` |
| README Example KG s-wave | Z=69, α=1/137.04 | Zα=0.5035>½ | critical coupling exceeded |
