<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13845#issuecomment-6899976923 -->
Review (claude) of cf8b5f9

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 4.1's locality bullet has a hypothesis that collapses to disjoint supports

   **Location.** `packages/Varifolds/design/README.md:827`: "Locality: δV(X) = 0 when X vanishes on an
   open set containing spt‖V‖ ∩ spt X"; `packages/Varifolds/design/plan.json:762` (4.1, API
   "locality").

   **Claim.** A locality law with a hypothesis weaker than disjoint supports.

   **Witness.** If X vanishes on an open O, then O misses {X ≠ 0} and so its closure spt X; hence
   O ⊇ spt‖V‖ ∩ spt X forces spt‖V‖ ∩ spt X = ∅. The bullet is true, and says only that.

   **Exact repair.** Replace the clause by "δV(X) = 0 when spt X ∩ spt‖V‖ = ∅" in the README and in
   `plan.json` 4.1. Tested: for V = v(L, 1), L the x-axis of ℝ², and X supported in {y_2 > 1}, both
   wordings apply and δV(X) = 0; for the vertical lift of H¹⌞L and X = ψ(y) y_2 e_2 (4.1's last
   Check, δV(X) ≠ 0), spt X meets L and neither wording applies.

2. **F02** (P3) Dependencies of Layers 6 and 7 name Layer 5, which none of their targets uses

   **Location.** `packages/Varifolds/design/README.md:1375` ("Layers 1–5; RiemannianGeometry R4 item
   1; …") and `:1685` ("Layers 1–6; Mathlib Besicovitch and Vitali coverings, …").

   **Claim.** Layers 6 and 7 depend on Layer 5.

   **Witness.** The *Needs:* lines of 6.1–6.5 name 1.4, 2.3, 3.3, 4.1–4.4, 6.1–6.3 only; those of
   7.1–7.6 name 1.2, 1.4, 2.1–2.2, 3.1–3.3, 4.3, 4.5, 6.1–6.4, 7.1–7.5. Layer 8's line ("Layers 4, 6
   and 7") already omits Layer 5.

   **Exact repair.** Layer 6: "Layers 1–4; …". Layer 7: "Layers 1–4 and 6; …". Tested on the
   witness: after the change every layer named in each line occurs in a *Needs:* line of that layer,
   and Layer 5 (C² submanifolds, the embedded comparison) is a side branch consumed only by Layer 9.

Two findings, both P3, each with a written repair, so the verdict asks for changes; no P1 or P2
finding and nothing else to repair. All three findings of
REV-DESIGN-Varifolds~9 are repaired. No gap is declared and none is needed. No maintainer notes
were supplied. No file of the design and no manifest entry was edited; no source was fetched (all
eight cited works are recorded in `packages/Varifolds/sources.toml`). There is no `Suggested.lean`
at the design stage; elaboration: not available (this lane does not elaborate).

## Verified sound

### Previous review (REV-DESIGN-Varifolds~9), finding by finding

| Prior finding | Repaired passage (quoted) | Status and my test |
|---|---|---|
| F01 (P2; isometry laws stated for C¹ isometries) | 4.4: "let f be a smooth isometry of W onto an open W' ⊆ M' (1.2 with f smooth; with the restricted metrics, f is a `TauCeti.IsLocalRiemannianIsometry`) … δ(f_#V)(Y) = δV(f^*Y)" (README 941–953); 9.2: "push-forward by a smooth isometry f … (1.2 with f smooth)" (1776–1783) | **Repaired**, differently from the requested C² form and correctly: the pinned connection transport requires `ContMDiff I J ∞ f` (Tau Ceti `Isometry/Local.lean:70–72`), so C² would be unowned. Recomputed: div_{df S}Y(f x) = Σ g'(∇'_{df τ_i}Y, df τ_i) = Σ g'(df ∇_{τ_i}f^*Y, df τ_i) = Σ g(∇_{τ_i}f^*Y, τ_i) = div_S(f^*Y)(x); J_S f = 1. `plan.json` 4.4, 4.5, 9.2 agree. |
| F02 (P3; 7.5's route did not bound the number of fibre points) | "So the number of points that count is bounded first … Every density off R is therefore 0 or at least 1. Let n_0 be the integer part of (1 + δ)Λ(ω_k 2^k)⁻¹ + δ …" (README 1571–1583) | **Repaired.** Off R: e^{ερ}ρ^{−k}‖V‖(B_ρ(y)) ≤ e‖V‖(B_1(y)) ≤ eΛ, so ρ^{1−k}‖δV‖(B_ρ(y)) ≤ eΛερ → 0; n_0 + 1 points of density ≥ 1 would give a sum ≥ n_0 + 1 > (1 + δ)Λ(ω_k 2^k)⁻¹ + δ. *Needs:* and `plan.json` 7.5 carry 7.1, 7.2; 7.1 and 7.2 do not use 7.5. |
| F03 (P3; Dependencies lines omitted library inputs) | Layer 2 (664–668), Layer 3 (809–812), Layer 4 (1038–1045), Layer 5 (1137–1138), also Layer 7 (1685–1687) and Layer 9 (1875–1877) | **Repaired**: every library name of the *Needs:* lines of Layers 2–5, 7, 9 is in its layer's line. The converse slip (a layer listed that is not used) is R02. |

Same patterns in the rest of the design: "isometry" without a class occurs only in 1.2 and 3.1
(bundle homeomorphism and J_S f = 1, true for C¹) and 9.1 uses C^r diffeomorphisms for reg^r; a
bound taken from inside a source's proof: 7.5 only (now complete), 7.1, 7.3, 6.4 name their inputs.
No finding of the repair report was marked not actionable.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 4.4 isometry law (changed) | rotation R by π/2, [C]; f = id; isometric embedding S¹ → ℝ² | H(e_2) = −e_2 = R(−e_1); trivial; H = 0 against −x (law rightly restricted to onto maps) | sound |
| 4.4 ‖δ(f_#V)‖ = f_*‖δV‖, H transport | −∫⟨H_V, f^*Y⟩d‖V‖ | = −∫⟨df H_V ∘ f⁻¹, Y⟩ d f_*‖V‖, and ‖f_#V‖ = f_*‖V‖ | sound |
| 4.4 route inputs | W, W' as open submanifolds | inclusion U → M is itself a local Riemannian isometry (`restrictOpenTangentSpace_inner_mfderiv_subtype_val`), so the pinned transport identifies the connection of U with that of M | owned at the pin |
| 4.4 decomposition, dilations (sample) | half hyperplane; V_{x,λ} | ∫_Σ div_Σ X = −∫X¹ dH^{N−2}, η = −e_1; div_S(Y∘η) = λ⁻¹(div_S Y)∘η gives λ^{1−k}, H' ∘ η = λH | sound |
| 4.5 smooth isometry (changed) | φ(z) = λ⁻¹exp_x⁻¹(z); N = k = 1, g = e^{4t}dt², h = 4g | φ^*g̃_λ = λ⁻²g; ‖δ‖ scales by λ^{−k}·λ; Γ = 2, δ_gV(X) = 2, δ_hV^h(X) = 4, sup|X'| = 8/(3√3) ≈ 1.54 < 2 | sound |
| 9.2 VarTan (changed; sample) | β_{f(x),λ} ∘ f = df_x ∘ β_{x,λ} on a normal ball in W | (f_#V)_{f(x),λ} = (df_x)_#V_{x,λ}; dilations: ‖V_{x,λ}‖(B_ρ(η y)) = λ^{−k}‖V‖(B_{λρ}(y)) | sound |
| 7.5 count (changed) | m-fold plane, Λ = mω_k3^k; k = 2, Λ = 1 | n_0 ≥ ⌊m(3/2)^k⌋ ≥ m, one point of density m; n_0 = 0 | sound |
| 7.5 new Check (density ½ on R) | disc of radius r, 2πr < ε², y ∈ ∂D, ρ ≤ r | arc ≥ 2ρ (two chords of length ρ), area ≤ πρ²/2 (D convex), ratio ≥ 4/(πρ) > ε | sound |
| 7.5 smaller δ implies larger | δ' ≤ δ | (1 + δ')X + δ' ≤ (1 + δ)X + δ; ‖V‖(Z) < δ' < δ | sound |
| 7.5 two planes Check | ℝ^k × {±ε/2} | mass ratio 2(1 − ε²/16)^{k/2}; bound ≥ 2 + 3δ − (1 + δ)kε²/16 > 2 for small ε | sound |
| 2.2 (sample) | k = 0, atoms 2⁻ⁿ at 1/n and θ(0) = 1; segment endpoint | μ(B_λ(0)) → 1 = θ(0); ρ/(2ρ) = ½ at an H¹-null point | sound |
| 2.3 (sample) | graph of \|t\|^{3/2} | 2·(8/27)((13/4)^{3/2} − 1) = (26√13 − 16)/27 ≈ 2.879 > 2√2 ≈ 2.828 | sound |
| 4.1 (sample) | circle, X = ψy; locality bullet | 2π = d/dt 2πe^t at 0; hypothesis ⇔ spt X ∩ spt‖V‖ = ∅ | sound; wording R01 |
| 4.3 (sample) | X_n = n⁻¹ψ sin(ny_2)e_2 on the vertical lift; step multiplicity | sup ≤ 1/n, δV(X_n) = ∫ψ(t, 0)dt; ∫θX' = −X(0) | sound |
| 6.1 identity (headline, sample) | circle, x = 0, σ < 1 < ρ; line y_2 = a | 2π/ρ = 2π − 2π(1 − 1/ρ); 2√(ρ² − a²)/ρ both sides | sound |
| 6.1 exponential form | f(t) = t^{−k}‖V‖(B_t) | d(e^{Λt}f) = e^{Λt}(df + Λf dt) ≥ e^{Λt}dE ≥ dE | sound |
| 6.1 weighted identity | X = φ(r/ρ)h(y − x) | δV(X) = kI − ρI' + ρJ' + ∫φ(y − x)·P_S∇h, so the δV term enters with a minus, as stated | sound |
| 6.2 (headline) | Scharrer Lemma 3.3 with a = √κ r cot(√κ r) | (1 − a)/r = √κ c(√κ r) ≤ (2/π)√κ ≤ √κ for √κ r ≤ π/2 | sound |
| 6.3 (sample) | step multiplicity; segment [−a, a], ρ = 2a | Θ(0) = 3/2 < 2 = lim sup; 2a < 4a, and 2ρ = ω_1ρ for ρ < a | sound |
| 6.4 (sample) | g = e^{2t}dt² on ℝ; v(L, 1) + δ_{(0,L)} | ∫(e^tX)' = 0, (θ̃w)' = e^t ≠ 0; δV'(X) = 1 for X = ψy_1e_1 | sound |
| 6.5 (sample) | X = ψγ(r)(y − ξ); K = ∅ | div_S X = kγ + γ'\|P_S(y − ξ)\|²/r ≥ kγ; two disjoint balls give spt = ∅ | sound |
| 7.1 (sample) | i segments of length 1/(2i); g_i = (1 + 1/i)²e | ‖δV_i‖ = 2i → ∞, limit density ½; weights (1 + 1/i)H¹ → H¹ | sound |
| 7.2 (headline) | density 1 + ½ sin(log r) cos ϑ | μ(B_ρ) = 2πρ; λ⁻¹∫_{B_λ} cos ϑ dμ = (π/4)(sin log λ − cos log λ): −π/4 at 1, π/4 at e^π | sound |
| 7.3 (headline) | Lebesgue measure with a constant line; vertical lift | Θ¹ = 0, stationary, not rectifiable; positive density but δV unbounded | hypotheses both needed |
| 7.4 (sample, headline) | alternating lines; zigzag i = 2; circles 1/i | two limits; √2 + 2; ‖δV_i‖ = i·(2π/i) = 2π, mass 2π/i | sound |
| 7.6 (sample, headline) | route of 7.5 off Z | dist(θ, ℤ) ≤ 2(δθ + 2δ) + δ/ω_k → 0 (values of round 9 recomputed) | sound |
| 8.2 (sample, headline) | integral V at x; blow-up metrics | {Θ < 1} is ‖V‖-null; D²g̃_λ = λ²(D²g̃)(λ·) → 0, ‖δṼ_λ‖(B_R) = λ^{1−k}‖δV‖(B_{λR}) → 0 | sound |
| 5.2 (headline) | great S^k ⊆ S^N, X = ψx | k Hᵏ(Σ) on both sides; H_ι = 0 + (−kx) | sound |
| 9.3 (headline) | [[P]] − [[P]]; 2[[P]] | Γ⁺ = ∅, 0; v(P, 2) | sound |
| 9.4 (sample) | n = 3, m = 5, ℓ = 1; n ≥ 8 | Σ = (ℝ⁸ × {0}) ∖ {0} violates Σ = reg^∞[Σ]; every C_{p,q} minimizing | sound |

Rows of REV-DESIGN-Varifolds~8 and ~9 that carry computed values (1.1–1.4, 2.1, 3.1–3.3, 4.2, 5.1,
8.1, 9.1) are relied on; their text is unchanged since.

### Sources: the seeded sample, read at the locators

No locator was flagged unverified by the author.

| Target | Text opened | Outcome |
|---|---|---|
| 2.2 | Simon1983 line 2861–2897, 7318–7326, 774–788, 632–640; Agnoletto et al. line 166–175 | 15.1–15.5; the varifold of a rectifiable one via M*; 3.5 and 3.3; Definition 2.3. Match. |
| 2.3 | Simon1983 line 2861–2867, 1855–1859; EdelenSpolaor2023 line 130–131 | rectifiable varifold of M; area of a C¹ graph; "multiplicity-one". Match. |
| 4.1 | Simon1983 line 7455–7473; Agnoletto et al. line 179–187, 210–212; Scharrer2022 line 87–98 | 39.2; Definition 2.4, Proposition 2.6; tangential divergence with Levi-Civita. Match. |
| 4.3 | Simon1983 line 7474–7486, 7580–7583; Agnoletto et al. line 264–268 | stationarity, 39.3; 40.7(1); Definitions 2.8–2.9. Match. |
| 4.4 | Simon1983 line 7486–7509; Agnoletto et al. line 269–303 | 39.3–39.4 with Z = {D‖δV‖ = ∞}; Proposition 2.10. Match (η here is minus Simon's ν; the half-hyperplane Check fixes it). |
| 6.1 | Simon1983 line 3016–3076, 7510–7547, 3205–3221 | 17.2–17.5; 40.1–40.4; 18.1. Match, up to one sign (Not verifiable). |
| 6.3 | Simon1983 line 7550–7565, 3119–3152; Agnoletto et al. line 1680 | 40.5 and measurability; 17.8, 17.9(1); Theorem 2.30. Match. |
| 6.4 | Simon1983 line 7664–7732 | 41.1, 41.2(1) and the proof (defining functions, coordinate derivative of θ). Match. |
| 6.5 | Simon1983 line 3371–3400 | 19.1, 19.2, rectifiable case as the README says. Match. |
| 7.1 | Simon1983 line 7566–7579 | 40.6 with the exceptional sets B_i. Match. |
| 7.4 | Simon1983 line 7882–7898 | 42.7. Match. |
| 7.6 | Simon1983 line 7899–7912 | 42.8. Match. |
| 8.2 | Simon1983 line 7793–7805, 7899–7912; EdelenSpolaor2023 line 109–112 | 42.6; 42.8; tangent cone with multiplicity one up to rotation. Match. |
| 9.2 | Simon1983 line 7443–7454 | 39.1 (push-forward). The invariance statements are the README's own, as it says. |
| 9.4 | Simon2023 line 77–96, 432–441; EdelenSpolaor2023 line 104–135 | Theorems 1.1, 3.7 and the convention reg M = M; Definition 1.1.1, Remark 1.2 (n > 7), Theorem 1.4. Match; "oriented" is omitted from the restated conclusion, which weakens nothing used. |

Also read: Scharrer2022 line 1118–1128, 1182–1204 (Lemma 3.3, Remark 3.4) for 6.2.

### Pins, suppliers, direction

- Pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, as in `lake-manifest.json`). The declarations the
  repair added, opened at the pin: `ContMDiff.mpullback_vectorField`
  (`Mathlib/Geometry/Manifold/VectorField/Pullback.lean:608`, hypotheses C^m field, C^n map,
  invertible differentials, m + 1 ≤ n); `TauCeti.IsLocalRiemannianIsometry`
  (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Local.lean:70`, fields `contMDiff` at ∞,
  `isInvertible_mfderiv`, `inner_mfderiv`);
  `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`
  (`…/Isometry/LeviCivita.lean:130`, with `IsManifold I 2 M`, `IsManifold J 2 N`, C¹ metrics,
  finite-dimensional models, Y differentiable at f x);
  `Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace` (`…/Riemannian/Restriction.lean:130`);
  `TauCeti.RiemannianIsometry` (`…/Isometry/Basic.lean:44`, extends `Diffeomorph … ∞`);
  `TauCeti.RiemannianIsometry.riemannianExp_mfderiv` (`…/Isometry/Exponential.lean:117`, smooth
  metrics, boundaryless, Hausdorff). Each is as the supplier contract describes it. The other
  library names are unchanged since round 9, whose file-and-line list I rely on; the pins are the
  same.
- Suppliers on main (`1a19c9f`, the main of round 9): GeometricCurrents G1 (line 137), G2 (240), G5
  (583), G6 (668–690, read in full); GeometricMeasureTheory G2 (148); RiemannianGeometry R4 item 1 and
  R5a.2 (at the lines round 9 lists, line 2311–2320 and 3394–3395; main is unchanged) and R5a; HopfRinow under `Completed/`, Layers 0–2 (229, 264, 427) and Layer 4's transport across
  smooth isometries (521–529, which also names Myers–Steenrod as unowned, as the README says).
- Ownership against open work: `roadmaps grep -i varifold` over the open heads and main finds the
  word on main only (GeometricCurrents, GeometricMeasureTheory, MinimalSurfaces); no open pull
  request plans varifolds, Allard's theorems or a varifold monotonicity formula. The board index
  lists AnalyticNumberTheory and LawrenceVenkateshMethod, neither on this subject. Overlap report:
  no pull request changes this roadmap, no dropped id, no revision-only id, no second copy.
  `roadmaps resolve`: nothing missing.

Overlap check: read GeometricCurrents, GeometricMeasureTheory, MinimalSurfaces (main; the open list, ManifoldOptimization, LorentzianGeometry, QuasiregularMaps, PointProcesses, RealSemisimpleLieGroups, contains no varifold, Allard or first-variation-of-varifold text; the third list is empty); the unoriented Grassmann bundle by orientation quotient, its Radon compactness, and the auxiliary varifold of an integral current with its first variation, monotonicity and tangent cones: owner GeometricCurrents G6 (cited, identified in 1.2 and 9.3, which MinimalSurfaces also cites for monotonicity); approximate tangent planes and the area formula: owner GeometricMeasureTheory G2 (cited); smooth monotonicity for minimal immersions: owner MinimalSurfaces 3.1 (not restated); the general varifold carrier and its theory for arbitrary varifolds: this roadmap.

Dependency check:

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list.

### Principles, shape, plan, headlines

Read all 1914 lines of the README, `plan.json` (9 layers, 34 targets, every `target:` prerequisite
earlier, every target with a locator and at least 3 tests, `gaps` empty) and the manifest (8
entries, no machine path). No route-specific narrowing (the smooth-isometry hypothesis loses no
generality the roadmap can state: the C¹ case has no first-variation pull-back), no re-planned
roadmap, no algorithm, no Lean file. Shape: Summary, Scope and ownership, Conventions, Exact
supplier contracts, How to read the build, nine layers each with Examples and Dependencies,
Downstream consumers, References. Grep for LaTeX delimiters, pull-request numbers, machine paths,
HTML anchors, "optional/deferred" and process words: none ("current" occurs only as the
mathematical noun). No backticked name is presented as this roadmap's own.

Headline theorems (Summary): the Riesz decomposition (4.4); monotonicity (6.1–6.2) with densities
(6.3); Allard's rectifiability theorem (7.3); compactness of rectifiable and integral varifolds
(7.4, 7.6); varifold tangents and cones (7.2, 8.1–8.2); constancy (6.4); intrinsic against ambient
(5.2); comparison with GeometricCurrents G6 (9.3). There is no `Suggested.lean`, so the padding
probe, the `#check` comparison and the import header do not apply at this stage.

### Copyright, arrangement, reuse

Wording: the README was set beside the source at every locator of the sample table (36 passages)
and the changed prose of 4.4, 7.5 (iii) and 9.2 (the roadmap's own; no source passage corresponds
to the isometry law). Shared runs are formulas and standard names. Arrangement: Simon1983's
Chapter 8 runs §38–§42; the README spreads §38 over 1.1–1.3 and 3.3, §39 over 3.1 and 4.1–4.4,
builds Layer 2 from §3, §11, §15, merges §40–§41 with §17–§19 in Layer 6, moves 40.6 to 7.1, splits
§42 over Layers 7 and 8, and adds 4.5, Layer 5, 6.2 and Layer 9: no one-to-one run. The order
first variation → monotonicity → tangents → rectifiability is forced (6.1 needs 4.1–4.4; 7.2 needs
6.1, 6.3; 7.3 needs 7.1–7.2, 6.4). Reuse: no table, figure or exercise list taken over.

Source independence: 36 passages compared with 5 sources (Simon1983, Scharrer2022, AgnolettoCorreaHoyosDaSilvaNardulli2025, Simon2023, EdelenSpolaor2023), none shared; largest share Simon1983, 83 of 126 source references; contents compared with Simon1983 (Chapters 1, 4 and 8): independent. Federer1969, Allard1972 and Maggi2012 could not be read (settled as uncertified).

## Not verifiable

- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: settled as uncertified,
  cited by locator only; not requested.
- Simon1983 40.4 (line 7543–7547): the extracted text shows the first-variation term of the
  weighted identity without a minus sign, while 18.1 (line 3216–3217) has the mean-curvature term
  with the sign that corresponds to −δV(X). The recognised text cannot settle whether a minus was
  lost; the README's sign is the one the computation gives (table, row 6.1 weighted identity).
- Simon1983: the displays of 3.5 (line 775–776), 17.3–17.5 (line 3064–3076), 40.1 (line 7517),
  42.7's density hypothesis (line 7891) and 42.9 (line 7992–8000) are lost or damaged in the
  extraction; the statements were matched through the surrounding prose and the proofs.
- 7.5 for h ≠ e and 4.4's isometry law: no source states them; the README marks them as its own
  with routes, which were checked by computation.
- Lean elaboration, one-tactic probes, `#check` comparison: no Lean file at the design stage.

## Source issues

- **Gap** in Simon1983 at proof of 42.8, printed page 249–250: the source says L¹ convergence of the truncated fibre multiplicities follows from convergence as measures and the bound of 42.9 off small sets; it should be also using that the mass over the exceptional sets tends to zero; affects the proof.
- **Error** in Simon1983 at proof of 42.9, printed page 252: the source says the projection of the whole set where a ratio bound fails is the small exceptional set; it should be the projection of its part of positive upper density; affects the proof.
- **Gap** in Simon1983 at Remark 42.10, printed page 250: the source says the estimate for a fixed number of fibre points bounds that number a priori; it should be first showing density at least 1 at those points; affects the proof.
- **Error** in Simon1983 at Theorem 41.1, printed page 240: the source says a stationary varifold supported in a connected submanifold M is a constant multiple of M in U; it should be requiring M ∩ U connected; affects a stated result.

## For the human reviewers

- **Licence.** `Simon1983` is recorded with `licence_class = "institutional"` in `packages/Varifolds/sources.toml` (a file on the ANU mathematics site); I read the cached text and did not verify the host's terms.
- **Licence.** `AgnolettoCorreaHoyosDaSilvaNardulli2025` is an arXiv preprint (v3) with no published version recorded; it is cited for Riemannian definitions and Theorems 2.30, 2.32, each beside a Simon1983 locator.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cf8b5f9ee11d4459f69552d605e3c432ff7afc2e", "job": "REV-DESIGN-Varifolds~10", "model": "fable", "worker": "chris-x88"} -->
