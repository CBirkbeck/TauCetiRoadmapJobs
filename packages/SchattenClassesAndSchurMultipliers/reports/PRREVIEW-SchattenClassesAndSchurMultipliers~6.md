# Review of SchattenClassesAndSchurMultipliers (pull request #2421 at 5e643e9)

**Verdict:** accepted

**Summary.** Accepted: no finding. The 52 changed lines only complete dependency lines: §2.1 and §5.2 now name §1.1 for the density of finite-rank operators, §3.5 separates what its definition needs from what its statements need, and the build guide and the Layer 5 dependencies say the same; each was checked against the `*Needs:*` lines and the sections they name, and all agree. One format note is carried from the previous review, not blocking. Three points are left for the human reviewers, as before.

## N01 — The Check of §7.3 still states Conjecture 1.8 of the source more weakly than the source does

Lines 1374–1377 say the source "conjectures that one exists" (a multiplier whose norm and completely bounded norm differ) on `S_p(ℓ²)`; lafforgue-delasalle-2011 lines 281–282 conjecture multipliers that are bounded and not completely bounded. "conjectures that bounded, not completely bounded ones exist" would match.

## Previous findings

The previous report (at 7a68d30) had no finding; its two format notes are accounted for here.

- N01 — not repaired: "conjectures that one exists on `S_p(ℓ²)`" stands at lines 1374–1377; written again as N01 above.
- N02 — repaired: the `*Needs:*` line of §2.1 opens "§1.1 (the class `S₂` and the density of finite-rank operators in it)", and the route cites "(§1.1)" at the density claim. No new problem: §1.1 uses nothing of Layer 2.

## Verified sound

| Target | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| §1.1 density of finite-rank operators, now cited by §2.1 and §5.2 | `X = diag(1/(j+1))` on `ℓ²(ℕ)`, `P_n` the first `n` coordinates | `‖X − P_n X P_n‖₂² = Σ_{j≥n} (j+1)^{−2} ≤ 1/n → 0`; at `p = ∞`, `‖X − P_n X P_n‖ = 1/(n+1)` | identity of `ℓ²(ℕ)`: `‖1 − P_n‖ = 1` for all `n`, but `‖1‖_∞ = ∞`, so it is outside `S_∞` | sound for every `1 ≤ p ≤ ∞` with the compact endpoint; a `B(H)` endpoint would fail |
| §2.1 route (changed): rank-one operators `u ⊗ v*` span a dense subspace of `S₂(L²(ν), L²(μ))` | `{1,2}` counting measure | span of `δ_i ⊗ δ_j* = E_{ij}` is `M₂`, dimension 4 | `L²(μ ⊗ ν)` has dimension 4; products `δ_i(x) δ_j(y)` span it | sound; §1.1 is stated for two spaces `H`, `K`, as §2.1 needs |
| §3.5 (changed): the definition needs only §3.1, §3.3 | `{1,2}`, `M = [[1,2],[3,4]]`, `p = 2`, level `m` | `‖S_{M_m}‖₂ = ‖M_m‖_∞ = 4` by §3.1 on `Ω × Fin m` alone; `m = 0` gives `0` | `sup_m = 4 = ‖M‖_∞`; Lean `schurCbNorm` is `⨆ m, schurNorm (μ.prod count) p (M ∘ …)` | sound: no use of §3.2, §3.4 or the identification with `L²(Ω)^m` |
| §5.2 route (changed): finite-rank operators with `𝓑_α ⊗ 𝓑_α`-measurable kernels are dense in `S_p`, `S_{p'}` | dyadic filtration of `[0,1]`, `u = 1_{[0,1/3)}`, `u_n = 1_{[0, ⌊2ⁿ/3⌋/2ⁿ)}` | `‖u − u_n‖₂² ≤ 2^{−n}` | `‖u ⊗ u* − u_n ⊗ u_n*‖_p ≤ (‖u‖ + ‖u_n‖)‖u − u_n‖ ≤ 2·2^{−n/2}` for every `p`, rank-one norms being `‖u‖‖v‖` | sound, also in `S₂`, so `Tr(S_f(A)B)` passes to the limit |
| Build guide (changed) against the `*Needs:*` lines | every line of Layers 2, 3, 5 | §2.1: §1.1; §2.3: §1.1, §1.4; §2.4: §1.4; §3.1: §2.1, §2.2; §3.3: §1.1, §1.4, §3.1; §3.6: §1.5; §3.8: §1.2; §5.2: §1.1 | guide: "§2.1 and §2.3 use §1.1, and §2.3 and §2.4 use §1.4"; §1.2 only via §3.8, §1.5 only via §3.6; Layer 5 needs §1.1 | agree; Layer 2 and Layer 5 Dependencies agree too |

The rows for the untouched statements stand as in the previous review, of `7a68d30`; `Suggested.lean` is unchanged since that head.

- Source locators checked against the text: 3, for the changed sections (lafforgue-delasalle-2011 Lemma 1.5 at line 254, Lemma 1.11 at line 383 with Remark 1.12 at line 393 and the density step at lines 401–402, Conjecture 1.8 at lines 281–282). The seeded sample falls in no changed passage: the diff adds no locator.
- Library declarations opened: `schurCbNorm` and `schurNorm` in `TauCetiRoadmap/SchattenClassesAndSchurMultipliers/Suggested.lean` lines 80–92, against the new sentence of §3.5.
- Cross-roadmap citations: the diff adds none; VonNeumannAlgebras V2.RectangularL2 stays in the `*Needs:*` line of §3.5 with its use named.
- Dependency check: `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the folder; since 7a68d30 only the README changed (30 insertions, 22 deletions).
- Automatic checks: all pass at this head. Lean: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else. The elaborated types and the one-tactic probe stand as in the previous review, the file being unchanged.
- Pull request text: title and description read against this head; the change touches nothing they describe (no section, supplier, headline or declaration added or removed), and every sentence still agrees.
- Overlap check: read BochnerSpaces, TracesOnCStarAlgebras, SchrodingerOperatorsAndSpectralTypes, NoncommutativeIntegration, NoncommutativeGeometry, AmenableTracesOnCStarAlgebras, AutomorphicSpectralTheory (as in the previous review; the change adds no object); shared objects: the `L^∞` conditional expectation and divisibility of atomless measures (owner BochnerSpaces §7.4, §7.5, cited), completely bounded maps of operator spaces (owner CStarAlgebras C3.2, cited), Hilbert–Schmidt kernels (AutomorphicSpectralTheory §0.8 on standard Borel spaces; §2.1 here is the variant on arbitrary σ-finite spaces and says so).
- Source independence: changed passages only; 2 passages compared with 1 source (lafforgue-delasalle-2011: the route of §5.2 against lines 395–402, the definition of §3.5 against lines 254–258), none shared (longest common run 3 words); no layer added, removed or reordered, so the arrangement stands as compared before: largest share lafforgue-delasalle-2011, 43 of the 120 source mentions counted at 4faf86f; contents compared with lafforgue-delasalle-2011: independent.
- Research link: Layers 6–8 are Theorems 1.7, 1.18 and 1.19 of Lafforgue–de la Salle (2011); Layer 9 the transference of Caspers–de la Salle (2015) and Neuwirth–Ricard (2011); Layers 10–11 Theorem A of Conde-Alonso, González-Pérez, Parcet and Tablate (2023), which leads to Arazy's conjecture and Potapov–Sukochev (2011). Rests on the README's sources, read.

## Not verifiable

- Nothing new: the changed passages cite no text that could not be read.
- The locator-only texts (reed-simon-1-1980, jrwz-2020 and the others) and the uniformity of the constant in the Hardy-space interpolation of §10.4 stand as listed in the previous review.

## Source issues

- **Gap** in cgpt-2023 at the proof of Lemma 1.4, p. 10 (lines 480–481): the source says the Hardy-space inclusions hold with absolute constants by Section 3 of the Randrianantoanina paper; it should give the argument, since Proposition 3.18 there states equivalent quasi-norms with no constant tracked; affects the proof.

## For the human reviewers

- The `gaps` list of the board package's `design/plan.json` is now empty, but two of its prose entries still name the gaps `sigma-finite-hilbert-schmidt-kernels` and `semifinite-martingale-bmo-interpolation`; the README declares neither and builds both (§2.1, §10.4).
- §10.4 asks for two estimates with a constant independent of the exponent. For the first, randrianantoanina-2021 Proposition 3.18 (line 1440) tracks no constant; uniformity rests on cgpt-2023 line 481. jrwz-2020 was not read.
- §2.1 builds the kernel of a Hilbert–Schmidt operator on arbitrary σ-finite spaces, while AutomorphicSpectralTheory §0.8 on main owns it on standard Borel spaces with separable `L²` (`TauCetiRoadmap/AutomorphicSpectralTheory/README.md` lines 239–248). The scope section states the difference.
