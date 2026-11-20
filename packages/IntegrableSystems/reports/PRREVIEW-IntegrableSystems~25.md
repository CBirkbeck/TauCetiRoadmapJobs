# Review of IntegrableSystems (pull request #2691 at bf1b893)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** accepted

**Summary.** Accepted: this head repairs every point of the previous review. The cup-length bound of §5.4 now assumes S nonempty and has the empty flow as a negative control. §3.3 takes the Hamiltonian Noether law from Tau Ceti, whose declarations say what the README claims. §§2.6–2.7 cite Zung §2.3 and Sjamaar pp. 6–10, which state the cited results at those places. There are two format notes and no findings or small corrections: one Needs line omits the nondegeneracy of the cotangent form, and one Dependencies line omits HamiltonianReduction Layer 3. One point is left to the human reviewers: Arnold's text could not be read.

## N01 — §3.3's *Needs:* line omits the nondegeneracy of the canonical cotangent form, a hypothesis of the Noether theorem it now cites

`TauCeti.SmoothTwoForm.IsMomentMap.poissonBracket_eq_zero_iff` assumes `σ.IsNondegenerate` (Tau Ceti `Geometry/Symplectic/Hamiltonian/MomentMap.lean`, line 279). For T*Q that hypothesis is supplied by `TauCeti.CotangentBundle.isSymplectic_symplecticForm` (`Geometry/Symplectic/Cotangent/Bundle/Liouville.lean`, line 334), which the README never names. Adding it to the Needs line (line 626) and to the Tau Ceti contract would complete the route.

## N02 — Layer 4's Dependencies (line 810) name only HamiltonianReduction Layer 1, but §4.2 (line 712) and the HamiltonianReduction contract (lines 1372–1375) also use its Layer 3

"HamiltonianReduction Layers 1 and 3" would match the Needs line of §4.2.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: "A flow on a nonempty compact metric space S with a continuous Lyapunov function … (0 if there is none, ∞ if there is no largest)" (line 1113), with the empty flow as a negative-control Check (line 1140).
- C01 — repaired: §3.3 compares with "Tau Ceti's Noether theorem `TauCeti.SmoothTwoForm.IsMomentMap.poissonBracket_eq_zero_iff`" (lines 618–622); the HamiltonianReduction contract now reads "with its equivariance, used in §4.2 here" (line 1373).
- C02 — repaired: Downstream consumers (lines 1185–1187) name SymplecticGeometry S0, MathematicalBilliards and LocalVariationalFieldTheory only.
- C03 — repaired: §2.6 cites "(Zung, §2.3; Sjamaar, p. 9)", "Sjamaar, p. 10" and "(Sjamaar, p. 7, Lemma)"; §2.7 cites "(Sjamaar, Theorem on p. 6, and p. 8 …)".
- C04 — repaired: the description now says the two inbound anchor links "are kept by explicit anchors before §2.0 and Layer 3".
- N01 — not repaired: deferred (D01)

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.6 vanishing criterion (sample) | B = ℝ²/ℤ², M = B × T², σ = Σ dθᵢ∧dIᵢ + c dI₁∧dI₂ | Λ = 2πℤ²; Lagrangian section θ₁ = cI₂, θ₂ = 0 exists iff c ∈ 2πℤ; otherwise no model isomorphism | true; `sjamaar2011` line 390 | none |
| §2.6 class of s^*σ | same M, zero section | s^*σ = c dI₁∧dI₂; image of H¹(B;Λ) in H²_dR is 2πℤ (in ∫); class ≠ 0 iff c ∉ 2πℤ; s = s_i + α_i gives t_ij = α_i − α_j | true; Lemma p. 7 gives +dα_i | none |
| §2.6 Chern relation | the three sign conventions | `zung2003`: μ_ij = s_j − s_i, Δμ_L = +μ_C; `sjamaar2011`: s_i = t_ij·s_j, δλ = c; B6.6 c = −δ[t] gives −c | true "for their own definitions" | none |
| §2.7 criterion without injectivity (sample) | B = (1,2)×(0,3π), polar a; T² → S¹ | a local diffeo, forms exact, classes 0: B × T² chart exists, a not injective; S¹ → ℝ admits no local diffeo, affine translation 2π | consistent with both Checks, Sjamaar pp. 6, 8 | none |
| §3.3 Hamiltonian Noether (sample) | SO(2) on ℝ², H = ½‖p‖² + V(‖q‖); H = q₁ | μ_ξ = q₁p₂ − q₂p₁, ξ_(T*Q) = (−q₂, q₁, −p₂, p₁); {μ_ξ, H} = 0 = −dH(ξ); {μ_ξ, q₁} = q₂ = −dq₁(ξ) | true; sign of `poissonBracket_eq_neg_mvfderiv` | none |
| §3.3 route at the pin | binders by `#check` | Noether needs FiniteDimensional, IsMomentMap, IsNondegenerate; `IsEquivariantMomentMap` extends `IsMomentMap`; nondegeneracy from `isSymplectic_symplecticForm` | route complete; Needs short | N01 |
| §5.4 cup-length bound | ∅; a point; S¹ height; ∏ₙ S² | ∅ excluded; point: cl 0, 1 rest point; S¹: 2 = 1 + 1; ∏S²: cl = ∞, product flow has uncountably many rest points | true | none |
| §5.4 nonemptiness control | ∅; nonempty S, minimum x of V | ∅: cl 0, bound 1, rest points 0; nonconstant orbit at x would give V(Φᵗx) < V(x) = min | true | none |
| Tau Ceti contract, two new names | `Cotangent/Bundle/MomentMap.lean` 84–85, 171 | binders CompleteSpace EG, T2 G, boundaryless G, FiniteDimensional E, I.Boundaryless, T2 M = README gloss | true | none |
| HamiltonianReduction contract and Layer 4 | §4.2 Needs line 712; Layer 4 line 810 | contract and §4.2: Layers 1 and 3; Layer 4 Dependencies: Layer 1 only | list incomplete | N02 |
| Downstream consumers | #2696, #2690 heads; MathematicalBilliards on main | S0 cites I2.0 (#2696 lines 74, 137); #2690 §1a.3 cites nothing here; Billiards line 536 uses cl ≥ 1 | true | none |

The rows for the untouched statements, and for the sample targets §§1.3, 2.0, 2.1, 2.4, 2.5, 3.1, 3.2, 4.4, 5.1, 5.2, 5.3 and 5.5, stand as in the previous review, of `3bea975`.

- Source locators read: `sjamaar2011` p. 6 Theorem (lines 275–280), p. 7 Lemma (line 316), p. 8 (lines 348–355), p. 9 (lines 384–393), p. 10 (lines 446–452); `zung2003` §2.3, p. 7 (lines 332–370); `cds` Thm. 24.1 (lines 5757–5764).
- Library: `TauCeti.SmoothTwoForm.IsMomentMap.poissonBracket_eq_zero_iff` and `TauCeti.CotangentBundle.isSymplectic_symplecticForm` by `#check`; `TauCeti.CotangentBundle.isEquivariantMomentMap_momentMap` (no object file) read at `Cotangent/Bundle/MomentMap.lean` line 171 in namespace `TauCeti.CotangentBundle`; `IsEquivariantMomentMap` at `Hamiltonian/EquivariantMomentMap/Basic.lean` line 170.
- Cross-roadmap: HamiltonianReduction #2690 Layer 1 (line 112, cotangent lift lines 217–224) and its downstream line 1866; SymplecticGeometry #2696 lines 74 and 137 (old id I2.0, mapped by the README's earlier-numbering paragraph); MathematicalBilliards on main lines 78 and 536.
- Automatic checks: every check passes on the worker's run and on mine. Dependency check: `depcheck: 182 roadmaps, 2070 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings (lines 75, 110, 125, 153). The file is unchanged since `3bea975`, so the `#check` comparison of its six declarations and the one-tactic probe stand.
- Description against the head: 53 Checks counted, as stated; the sentences on the §§2.6–2.7 locators, on §3.3 and on §5.4 hold. The depends-on block now lists #2687 and #2690; the merge-order block still says nothing must merge first (D01).
- Ownership: the Hamiltonian Noether law is Tau Ceti's at the pin and is cited here; HamiltonianSystems #480 (line 438) also states it, which is that roadmap's matter.

Overlap check: read again SymplecticGeometry (#2696), HamiltonianReduction (#2690), HamiltonianSystems (#480) and MathematicalBilliards (main); CotangentLagrangian (main and #2687), DGFloer (#1798) and ConvexityToric (main) are untouched by the change and stand as read before. Shared objects and owners: generating functions and the chain dictionary, CotangentLagrangian; the cotangent-lift moment map and the Hamiltonian Noether law, Tau Ceti; positive-period circles, this roadmap (§2.0); compact-pair Čech continuity and the cup-length bound, this roadmap (§5.4), consumed by MathematicalBilliards. Nothing else is shared.

Source independence: changed passages only; 6 passages compared with 4 texts (`sjamaar2011` lines 261–276, 316, 352–353, 388–391, 446–448; `zung2003` lines 332–370; `cds` lines 5757–5764; the pinned Tau Ceti docstring of the Noether theorem). None is shared beyond formulas; the longest common run is 3 words ("the Lagrangian class", "a local diffeomorphism"). The largest share is now `sjamaar2011`, 5 of about 34 locators, followed by arnold-mmcm with 4. No layer was added, removed or reordered. `sjamaar2011`'s contents (§1 spectra, §2 global action–angle variables, §3 Duistermaat–Heckman) meet only §§2.6–2.7: independent.

Research link: Layer 2 states the Liouville–Arnold theorem and the global obstruction theory begun by Duistermaat (1980). It uses the Lagrangian-class form of Dazord–Delzant and Zung (2003), surveyed by Sjamaar (2011), with the spherical-pendulum monodromy of Efstathiou–Giacobbe–Mardešić–Sugny (2017). Layer 5 proves Poincaré–Birkhoff (Le Calvez–Wang 2010) by the Conley–Zehnder (1983) route. This line rests on the README, `sjamaar2011`, `zung2003`, `egms` and `lecalvez-wang`.

## Not verifiable

- Arnold, *Mathematical Methods of Classical Mechanics*, §§49–50 and Ch. 2: recorded as uncertified; the publisher's contents page needs a login.
- Conley–Zehnder 1983 (the source of the two flow statements of §5.4) and Duistermaat 1980 (now named as the origin only): uncertified, cited by locator or by name.

## Source issues

- **Misprint** in zung2003 at §2.3, p. 7: the source says the bundles E_ℝ and E_ℤ were defined in the previous subsection as first cohomology bundles; it should say first homology bundles, as §2.2 defines them; affects nothing.

## For the human reviewers

- Not tested: arnold-mmcm (4 of about 34 locators, second to `sjamaar2011`) and its table of contents could not be read (uncertified; the Springer contents page needs a login), so wording and arrangement were not checked against it.
