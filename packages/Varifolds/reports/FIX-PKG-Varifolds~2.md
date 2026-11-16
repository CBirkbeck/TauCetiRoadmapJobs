# FIX-PKG-Varifolds~2: repair of the package review of Varifolds

One review, `REV-PKG-Varifolds`, with three findings, all P3. Each was verified on the
mathematics and applied. Files changed: `packages/Varifolds/README.md`,
`packages/Varifolds/Suggested.lean`. `metadata.toml`, `sources.toml` and `design/plan.json` are
unchanged (no new source, no supplier gap).

## F01 (P3) — applied

`Euclidean.exists_isVarifoldTangent`: binders `hV` and `hδ` deleted; the docstring now says that
only the finite density at `x ∈ W` is used (Simon1983, 42.1 with 4.4). The pattern repair: the
docstrings of `IsVarifoldTangent.isStationary`, `.isRectifiable` and `.isIntegral` used to point to
"the hypotheses of `exists_isVarifoldTangent`". They now state all three hypotheses (or point to
`isStationary`). README §7.2 has a new paragraph explaining the split. Its route now opens with the
3.2 mass identity in place of "3.2 and 6.3", and Layer 6.3 is dropped from *Needs:* because nothing
in the route uses it. I added the vertical-lift Check.

Evidence: Simon1983 line 7738–7740 picks the convergent subsequence using only the definition of
δV and the compactness theorem 4.4 (line 1038–1045). The finite density gives the bound needed:
`‖V_{x,λ}‖(B_R(0)) = λ^{−k}‖V‖(B_{λR}(x)) → Θ ω_k R^k`. On the reviewer's witness (the vertical lift
of H¹ on the x-axis, k = 1, x = 0), the computed values are: ‖V‖(B_ρ(0)) = 2ρ, so Θ = 1;
`V_{0,λ} = V`; ‖δV‖(B_ρ(0)) = ∞; and δV(φ y_2 e_2) = ∫ φ(t, 0) dt > 0, so V is not stationary.

## F02 (P3) — applied

Scope and ownership: "the convex hull property" now reads "the convex hull property of varifolds
stationary off a compact set (6.5)". A new "Owned elsewhere and cited" bullet cites
RiemannianGeometry/MinimalSurfaces 3.3 for smooth minimal submanifolds. It says in one clause how
6.5 differs and how 6.5 gives 3.3: take V = [Σ ∖ ∂Σ] and K = ∂Σ, which is stationary by 5.1 on
W = E ∖ ∂Σ, in which Σ ∖ ∂Σ is closed. §6.5 also gets a catenoid Check.

Evidence: on main, the MinimalSurfaces README (line 760–781) states 3.3 for compact minimal
n-submanifolds of ℝ^m with boundary, using the harmonicity of the coordinates. A search of every
roadmap on main and every open roadmap head for "convex hull property" finds only that section. So
the varifold form (6.5) has no other owner. The reduction cites 5.1, which needs Σ ∖ ∂Σ to be closed
in W, and that holds for W = E ∖ ∂Σ because Σ is compact.

## F03 (P3) — applied

`def VarifoldTendsto` and its docstring are unchanged but moved from under the Layer 7 header to the
end of the Layer 1 section, after `end Euclidean` and before the Layer 2 header, which matches README
§1.4. I checked every other declaration's section against its README subsection; nothing else was
out of place.

## Checks run

- **Elaboration.** From the content checkout, `lake env lean packages/Varifolds/Suggested.lean`:
  exit 0, 15 warnings "declaration uses `sorry`" (lines 259, 306, 333, 351, 367, 377, 389, 401,
  432, 445, 464, 477, 501, 522, 538), no error and no other warning. No `TauCeti.*` module had to be
  built.
- **Signatures, checked mechanically.** I put a scratch copy of the file in the job scratch
  directory, appended `#check @name` for all 40 declarations and elaborated it once (exit 0). The
  only elaborated type that changed is `Euclidean.exists_isVarifoldTangent`. It now reads
  `1 ≤ k → ∀ V [IsFiniteMeasureOnCompacts V] {x}, x ∈ W → ∀ {θ}, θ ≠ ∞ → HasDensity (weight V) k x θ
  → ∀ s, (∀ j, 0 < s j) → Tendsto s atTop (𝓝 0) → ∃ φ, StrictMono φ ∧ ∃ C,
  IsFiniteMeasureOnCompacts C ∧ VarifoldTendsto (fun j ↦ blowUp V x (s (φ j))) C`, which matches
  the new README §7.2 sentence. Every Riemannian theorem still carries `[I.Boundaryless]`,
  `[SecondCountableTopology M]`, `[IsRiemannianManifold I M]`, `[BorelSpace M]` and
  `[IsContMDiffRiemannianBundle …]`. Every Euclidean theorem carries `[BorelSpace F]`. The types of
  `VarifoldTendsto` and the other 38 declarations are unchanged.
- **Dependency check** (`gate --depcheck … --name Varifolds --movable`): output
  `depcheck: 244 roadmaps, 2270 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
  The only new cross-roadmap citation is RiemannianGeometry/MinimalSurfaces 3.3, which is on main.
- **Citations** (`roadmaps resolve packages/Varifolds/README.md`): "Cross-roadmap citations found
  nowhere: None. Lean names found nowhere: None."
- **Ownership.** The varifold convex hull property and varifold tangents: searching the roadmaps on
  main and all open heads finds no other owner (`convex hull property|varifold tangent|VarTan`,
  only MinimalSurfaces 3.3, which is smooth and is now cited). No other roadmap cites
  `exists_isVarifoldTangent` (the `--fixed` grep finds no match on main or at any open head).
- **Gate failure `tex=1` (catenoid Check, §6.5).** The prose `ρ = (x_1² + x_2²)^{1/2}` used a
  TeX-style exponent and underscore subscripts outside a code span. It now reads `ρ = √(x₁² + x₂²)`,
  and `x_3` became `x₃` throughout that Check. The mathematics is unchanged, and a scan of the README
  for `^{`, `_{`, backslash commands and `$` outside code spans finds nothing more.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `Euclidean.exists_isVarifoldTangent`, new hypotheses | vertical lift of H¹⌞(x-axis), k = 1, x = 0 | ‖V‖(B_ρ) = 2ρ, Θ = 2ρ/(2ρ) = 1; pushforward along y/λ is λH¹⌞L, times λ⁻¹ gives V_{0,λ} = V; C = V, finite on compacts | conclusion holds although hV and hδ fail | binders deleted |
| same | V = 0; k > dim F (G(F,k) = ∅, so V = 0) | Θ = 0; every blow-up is 0; C = 0 | holds | none |
| same | atom δ_{(x,P)}, k = 1 | Θ = lim 1/(2ρ) = ∞; blow-up mass on B_1(0) is λ⁻¹ → ∞ | excluded by hθ, which is needed (1.4's Check j·δ) | none |
| same | lift of μ = (1 + ½ sin(log r) cos ϑ) dr dϑ, k = 1 | μ(B_ρ) = 2πρ, Θ = π; along λ_j = e^{−2πj} the blow-up density f(λ_j r, ϑ) = f(r, ϑ), so the limit is V itself, whose weight is not conical | existence holds and the limit is not dilation invariant: the first-variation hypotheses of `isStationary` are needed for its third conclusion | none |
| README §7.2 mass identity | v(L, 1) with x ∈ L; unit circle with x on it | λ⁻¹·2λR = 2R = 1·ω_1·R; λ⁻¹·4 arcsin(λR/2) → 2R | holds | new text |
| `IsVarifoldTangent.isStationary`, `.isRectifiable`, `.isIntegral` (docstrings only) | vertical lift | hV false, so it is no counterexample to the statements, whose binders are unchanged | holds | docstrings state the hypotheses |
| New vertical-lift Check (§7.2) | X = φ y_2 e_2 | tr(P_{e_2} DX) at (t, 0) = ∂_2(φ y_2) = φ(t, 0); δV(X) = ∫ φ(t, 0) dt > 0; X_n = ψ sin(n y_2) e_2 gives δV = n∫ψ(t, 0) dt → ∞ | not stationary, ‖δV‖(B_ρ) = ∞ | Check added |
| Scope: 6.5 gives MinimalSurfaces 3.3 | flat unit disc in ℝ³; K = ∅; cap larger than a hemisphere | disc ⊆ conv(circle) = disc; K = ∅ gives V = 0, so there is no closed compact minimal Σ; the cap has H ≠ 0, so it is not stationary off K and the conclusion fails, as 3.3's negative control says | holds | bullet added |
| Catenoid Check (§6.5) | Σ = {ρ = cosh x_3, \|x_3\| ≤ h}, h = 1 | cosh x_3 ≤ cosh 1 ≈ 1.543 on Σ; area 2π∫cosh² = 2π(h + sinh h cosh h) ≈ 2π·2.813 ≈ 17.68; neck ρ = 1 < cosh h; Σ ∖ ∂Σ = Σ ∩ (E ∖ K) is closed in E ∖ K | Σ ⊆ conv K; a rule claiming spt ⊆ K or ⊆ the two end discs fails at the neck | Check added |
| `VarifoldTendsto` (moved) | δ_{(1/j,P)}; δ_{(j e_1,P)} | → δ_{(0,P)}; → 0 with masses 1 | unchanged definition | moved |

## For the maintainer

- `Euclidean.exists_isVarifoldTangent` now has two fewer hypotheses (`hV`, `hδ`). No roadmap on
  main or at an open head cites it. No name was renamed or deleted.
- RiemannianGeometry/MinimalSurfaces is now cited in two places (Scope and ownership, and the 6.5
  Check), only as the owner of the smooth statement. It is not consumed, so it has no supplier-contract row.
- The review's "Source issues" (the proof of Simon1983 42.9 and AgnolettoCorreaHoyosDaSilvaNardulli2025
  Theorem 2.32) and its "For the human reviewers" items are not findings. Nothing was changed for them.
- No source was fetched and `needs-references.toml` was not written: every locator used is in
  Simon1983, which is already cached.
