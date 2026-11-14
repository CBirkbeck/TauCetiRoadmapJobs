# FIX-RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1

Repair of red-team round 1, passes a and b, on `packages/PadicDifferentialEquationsAndRigidCohomologyPartII`. All 19 findings were checked against the cached sources, the parent PadicDifferentialEquationsAndRigidCohomology at the head of its open pull request, AlgebraicCurves on main, and the pinned Mathlib. 13 are applied as asked. 6 are applied differently: a/F05, a/F10, b/F01, b/F03, b/F04 and b/F06. None is disputed. Every changed statement is listed in the adversarial table below.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1a/F01 (P2) — applied

MS.0.1: "compatible with φ and the derivation", Taylor map in `d/dx` on both fields → embeddings respect the universal derivation `d`, `∂_x ↦ (dx/dx_α)⁻¹∂_(x_α)`, each Taylor map uses its own coordinate, `x_α` may be the generic coordinate (TSU line 731). Check at `∞`: `−y²·(−y⁻²) = 1`. Same fix in the API, MS.0.2 and MS.0.8.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1a/F02 (P1) — applied

MS.1.6 now defines generic (`B^τ`), disc (`K`) and logarithmic solutions `Sol_log(M) = Hom_(E†,∇)(M, R_log)` with steps `Fil_λ R_log`, "solvable in `R_log`", the disc/log comparison with growth (OHK Lemma 5.2, line 1262) and coefficient extension (Lemmas 7.9–7.12). MS.1.7–MS.1.8 use `Sol_log`; the Taylor step is replaced. Three Checks added.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1a/F03 (P2) — applied

MS.6.5 API: "exact `L_2`-linear tensor functor" → "exact tensor functor, linear relative to `L_1 ⊂ L_2`". A negative-control Check was added: on `Spec 𝔽_3`, End(unit) is `ℚ_3` before `θ` and `ℚ_3(√5)` after, and `√5·id` has no preimage. No other "`L_2`-linear" occurs.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1a/F04 (P2) — applied

Convention 6 and MS.0.2: `f ↦ φ ∘ f ∘ φ_M⁻¹` → `F(f) = φ^*f ∘ Φ_M⁻¹` through the invertible linearisation, characterised by `F(f)(φ_M m) = φ(f(m))` (as TSU line 946). Check added: the unit over `E` has `t ∉ φ(E)` while `φ^*E → E` is an isomorphism; eigenvalue `a⁻¹` recomputed.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1a/F05 (P1) — applied differently

Valid (TSU line 1042 uses Katz over `k(C)`). The gap `unit-root-correspondence-perfect-base` (README, `plan.json`, section `RD.2.25, RD.3.48, RD.6.61`) gains clause (b): `E_η` ↔ `Gal(k(C)^sep/k(C))`, compatible with §RD.2.25 at `E_α`, with the unramified and finite-inertia criteria (§RD.2.26). MS.2.3 and MS.2.9 name it. NoncommutativeAndEquivariantIwasawa is not added: the parent already imports it into §RD.2.25.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1a/F06 (P2) — applied

MS.6.5 defines `M_β^raw = i_β^*M†` and the coefficient fibre `M_(β,L) = e_β·M_β^raw`, of `L`-dimension `Q̄_p`-rank (TSU lines 1649–1656). It is used in MS.6.5's API, the MS.6.6 trace formula (raw would give `n·λ^n`), MS.6.9's purity and MS.6.10. Check added: degree-2 point, raw dimension 2 and trace 2, coefficient 1 and 1.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1a/F07 (P2) — applied

MS.3.8 now proves the affine image theorem (TSU Lemma 5.3, p. 24, line 1266): the `A†_(U,K)`-image is finite with invertible linearised Frobenius (flat `φ`, `A† ⊗_φ Â ≅ Â`), overconvergent by §RD.3.32, with an overconvergent kernel. MS.3.10: "affine image quotient of MS.3.4" → "constructed in MS.3.8"; it no longer needs MS.3.4. `A²` Check added.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1a/F08 (P3) — applied

MS.5.2 Needs: §RD.3.45 → §§RD.3.43, RD.3.44. The text now builds the global filtration from §RD.3.44 at each break of the constant polygon, and defines `S_min(N) = N ∩ S_(≤s)(M)`, which is isoclinic at every point by specialisation. A supplier-contract row for §§RD.3.43–RD.3.44 was added; §RD.3.45 is kept for the dense-open uses.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1a/F09 (P3) — applied

The second Checks of MS.5.1 ("own hull") and MS.5.2 ("isoclinic `M`") → `M = L_0 ⊕ L_1`, `N = L_1`: `Hull† = L_1` (rank 1); `S_min(N) = S_min(Hull†) = L_1` while `S_min(M) = L_0`. Taking the whole ambient as the hull (rank 2), or the ambient's first slope step, fails.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1a/F10 (P3) — applied differently

Done with less movement. The nonvanishing `B(M) ≠ 0` moved from MS.0.5 to MS.0.7, which already proves `Top(M) ≠ 0`; MS.0.7 now needs MS.0.5 (a backward edge) and MS.0.5 no longer needs MS.0.7. MS.3.2's last API bullet, which duplicated MS.3.5's statement, is deleted.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1b/F01 (P2) — applied differently

Valid. The contract now cites AlgebraicCurves Layer 12 (12A–12C, 12B.0b) for `X_F`, its dictionary, smoothness and the anti-equivalence. MS.0.1 now proves `C ⊂ C̄ = X_(k(C))` open with finite complement, smooth and unique (Stacks Tags 0BXZ, 0BY1–0BY3, fetched as `STACKS`), with three Checks including the cuspidal cubic. MS.2.2 uses Mathlib `MaximalSpectrum.iInf_localization_eq_bot` instead of Layer 2 or 6.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1b/F02 (P2) — applied

MS.3.9: "preserved by finite étale pullback and pushforward" → for `f : Y → X` finite étale of smooth connected schemes, `M†` saturated iff `f^*M†` is, and `f_*N†` saturated if `N†` is (TSU line 1302); coefficient extension per connected component; the proof covers pushforward for connected `Y`. Check added: the fold map with `O(−1) ⨿ O(0)`.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1b/F03 (P2) — applied differently

MS.5.4 defines "dagger-extendable in `M†`" and `Hull†_M(N)` for submodules of `M = E ⊗ M†`, with existence by the flat intersection identity and no full faithfulness over `k(t)`; minimality rewritten; Check added. MS.5.5 is stated for `M = E ⊗ M†` and does the slope-count induction (DAD Lemma 4.1.5) explicitly, dropping MS.5.3. The quotient structure is written `M†/(M† ∩ H′)`.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1b/F04 (P3) — applied differently

MS.0.1 gains §§RD.0.1, RD.0.26, RD.0.36, RD.0.41; MS.0.4's local case gains §§RD.0.48, RD.5.2; MS.6.9 gains §RD.6.59. §RD.6.60 is deleted and §RD.6.85 moved to the "extended by requests" row. §RD.5.29 is not added: it assumes `X̄` geometrically irreducible, which `C` need not be; MS.0.1 lifts an affine neighbourhood instead (§§RD.0.39, RD.0.41).

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1b/F05 (P3) — applied

MS.5.7 Needs: "MS.4.2; MS.5.3; MS.5.4; …" → "MS.4.2; MS.5.1; MS.5.2; MS.5.3; §§RD.1.37, RD.3.16, RD.3.31". The Layer MS.5 introduction now says MS.5.4–MS.5.6 are the generic and affine-line statements, which MS.5.7 does not use.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1b/F06 (P3) — applied differently

Valid: AE Theorem 2.7 states mixedness (AE lines 539–540); its proof shows irreducible objects pure (lines 544–545), as the proof of Theorem 3.10 uses (line 752). MS.6.9 and the gap `irreducible-iota-purity` (README, `plan.json`) now cite "Theorem 2.7 and its proof … Tsuzuki Theorem 7.18, which states the purity". The citation is to the proof of Theorem 2.7 itself.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1b/F07 (P3) — applied

MS.1.9: "Tsuzuki, Proposition 3.24, pp. 17–18" → "p. 18 … the solution spaces are defined on p. 17". This matches TSU lines 951–953.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1b/F08 (P3) — applied

MS.1.7 now defines a Frobenius `d`-eigenvector: an integer `d ≥ 1` and a nonzero `f` with `F^d(f) = c·f`, of slope `v_π(c)/(d·v_π(q))` (OHK Definition 9.3, p. 41). Check added: `f_2` has slope 1 as a 1- or 2-eigenvector; leaving `d` out of the normalisation gives 2.

## RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1b/F09 (P3) — applied

The Mathlib contract now reads: "a monoid acting by ring endomorphisms (`[Monoid M] [MulSemiringAction M F]`) … `ℕ` acting through powers of `σ`, which need not be automorphisms". This matches `Mathlib/FieldTheory/Fixed.lean` at the pin.

## Checks

- **Elaboration.** `lake env lean packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean`, run from the content checkout, exits 0 in 22 s with no output.
- **Lean file.** It has 0 declarations, so the mechanical `#check @name` comparison has zero cases and no binder could be dropped. The only change is in the module docstring: the local-theorems bullet now also names the logarithmic solution spaces as a missing carrier. The file still has the single `import Mathlib`, no `set_option` and no sorried data.
- **Dependency check:**

  ```
  depcheck: 240 roadmaps, 2169 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere.
- **Parent sections.** Every newly cited section exists at the parent's open head: §§RD.0.41, RD.0.48, RD.2.25, RD.2.26, RD.3.43, RD.3.44, RD.5.2, RD.6.59.
- **Mathlib.** `MaximalSpectrum.iInf_localization_eq_bot` exists at `Mathlib/RingTheory/Spectrum/Maximal/Localization.lean:38`.
- **Contract against Needs.** Recomputed over all `*Needs:*` lines: no contract id is unused (outside the "extended by requests" row), and no Needs id is missing from the contract.
- **Style.** No LaTeX delimiters, process words or machine paths in the README.
- **Sources.** One new source, `STACKS` (Stacks Project, chapter Algebraic Curves, Tags 0BXX, 0BXZ, 0BY1–0BY3), was fetched by the sources service from an open repository and recorded in `sources.toml` as certified. The OHK and AE locators were extended. No `needs-references.toml` entry was needed.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| MS.0.1 completion `C ⊂ C̄` | `A¹`; `G_m`; `Y∖{O}`; `A¹_(𝔽_p²)` over `𝔽_p`; cuspidal cubic | complements: 1, 2 and 1 points; `{∞}` of degree 2, with `P¹_(𝔽_p²)` smooth over `𝔽_p`; `A¹ = cubic ∖ {cusp}` via `(s:1:s³)`, also 1 point but not regular | holds; regularity is needed for uniqueness (Check added) |
| MS.0.1 derivations | `A¹` at `∞` (`y = 1/x`); at `0` with `x_α = x`; generic coordinate `x²` at `0`, `p` odd | `∂_x(y⁻¹) = −y²·(−y⁻²) = 1` against the wrong `−y⁻²`; factor 1; `dx²/dx = 2x`, of norm 1, a unit | holds |
| Conv. 6 `F(f) = φ^*f ∘ Φ_M⁻¹` | rank one `a`; unit over `E`; log module; `M = 0` | eigenvalue `a⁻¹`; constant solution fixed while `t ∉ φ(E)`; `F f_1 = f_1`, `F f_2 = q f_2`; `Sol = 0` | holds |
| MS.0.5 / MS.0.7 split | `M = 0`; unit; log module | `B(0) = 0`, no nonvanishing claimed; `B(1) = 1 ≠ 0`; `B` has rank 1, via MS.0.7 | holds; no forward edge |
| MS.0.8 at every `α` | log module on `E_η ⊂ E_∞` of `A¹` | bounded quotient rank `1 = 1` with either coordinate | holds |
| MS.1.6 three spaces | unit over `E†`; unit over `E`; log module; constant disc module `a` | `Sol_log` has `K`-dimension 1; generic `Sol` has `E^τ`-dimension 1 but infinite `K`-dimension; `Sol_log,λ` dimensions 0, 1, 2 at `λ = −1, 0, 1`; disc `K·1` maps to log `K·1`, eigenvalue `a⁻¹` on both sides | holds |
| MS.1.6 coefficient extension | log module, `L = K̂^ur` | dimensions `1 → 1` at `λ = 0` and `2 → 2` at `λ = 1` | holds |
| MS.1.7 `d`-eigenvector | `f_2` | `d = 1`: `c = q`, `μ = 1`; `d = 2`: `c = q²`, `μ = 2/2 = 1`; omitting `d` gives 2 | holds |
| MS.1.8 | log module, `λmax = 0` | `λ = −1, 0, 1`: `Sol_log,λ` dimensions 0, 1, 2 = slopes `≤ λ`: none, {0}, {0, 1} | holds |
| MS.2.2 residue step | `A¹`: `k[x]`; `G_m`: `k[x, x⁻¹]` | `1/x ∉ k[x]_(x)`, so not in `k[x]`; `1/x ∈` every local ring of `G_m` | holds; no Dedekind input needed |
| gap clause (b), MS.2.3 | unit; Artin–Schreier character on `A¹`; ℤ_p-tower ramified at `∞` | trivial representation, unramified; image ℤ/p, finite inertia, overconvergent; infinite inertia, convergent only | holds |
| MS.3.8 affine image | `A²`, `O(−1) ⊕ O(0)`; `M = 0` | image rank 1, Frobenius `q` invertible, kernel rank 1, `x` a non-unit; image 0 | holds |
| MS.3.9 transport | fold map; `f = id`; connected Artin–Schreier cover, unit | pieces saturated but `f_*` not; trivial; `f_*1` unit-root and saturated | holds with `Y` connected |
| MS.6.5 `θ` | `ℚ_3 ⊂ ℚ_3(√5)` on `Spec 𝔽_3` | End(unit) `ℚ_3` before, `L_2` after; `√5·id` has no preimage | holds |
| MS.6.5 / MS.6.6 coefficient fibre | coefficient unit at a degree-2 point; `L(λ)` on `Spec 𝔽_q`, `n = 2` | raw dimension 2 with trace 2, coefficient dimension 1 with trace 1; raw `2λ²`, coefficient `λ² = ` right-hand side `λ²` | holds |
| MS.5.2 `S_min(N) = N ∩ S_(≤s)(M)` | `M = L_0 ⊕ L_1` with `N = L_1`, `N = M`, `N = 0` | `L_1 ∩ M = L_1`; `M ∩ L_0 = L_0`; 0 | holds |
| MS.5.4 relative hull | `M† = E†(−1) ⊕ E†(0)`, `N = E(0)`, `M`, `0` | hull ranks 1, 2, 0; `E†(−1) ∩ E†(0) = 0` on both sides of the intersection identity | holds |
| MS.5.5 induction | `M† = E†(0) ⊕ E†(−1)`, `N = M` | `H′ = E(0)`; `H/H′` has slope `1 > 0`; `S_min(H) = E(0)` | holds |
| `FixedPoints.subfield` wording | `σ(t) = t^p` on the Gauss completion of `ℚ_p(t)` | `t ∉ σ(K)`, since the residue `t` is not a `p`-th power in `𝔽_p(t)` | holds |

## Ownership, suppliers and notes for the maintainer

- **New statement owned here.** MS.0.1's open embedding `C ⊂ X_(k(C))` was searched for by object with `roadmaps grep` across main and the open heads. SchemeAndStackFoundations only points to AlgebraicCurves 12B–12C for the projective model; ComplexComparisonPartII, GeometricFreyMazur and others consume smooth completions without stating them. No roadmap owns it, so the statement moves down into this roadmap.
- **Supplier gaps.** Two gap texts changed: `unit-root-correspondence-perfect-base` gains clause (b) and section `RD.2.25`, and `irreducible-iota-purity` has a refined locator. The parent PadicDifferentialEquationsAndRigidCohomology should be told that clause (b) extends its §RD.2.25 from the residue field `k((t))` to `k(C)`. No new gap slug was added.
- **No renamed ids.** No target id was renamed or removed, so roadmaps citing MS.x.y are unaffected. The only id-level change is that §RD.5.29 and §RD.6.60 are no longer cited.
- **Untrusted text.** Neither review contained instructions beyond its findings.
