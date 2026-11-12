# Review of RealSemisimpleLieGroups (pull request #2229 at 878a044)

**Verdict:** needs changes

## R01 (P3) — The repaired §5.2 makes a §5.2 → §5.4 → §5.3 → §5.2 cycle

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:1112–1113`: "(`gK ↦ gh⁻¹K'` for `K' = hKh⁻¹`; the fixed groups of any two data are conjugate by §5.4)". Line 1131: "*Needs:* §2.2; §5.4 (conjugacy of the fixed groups, for the independence of choices)".

**Claim:** The repair of the previous R01 adds a dependency of §5.2 on the later §5.4. But §5.4 needs §5.3 and §5.3 needs §5.2, so the sections of Layer 5 form a cycle. The Ordering section (line 1356) states only "§5.4 needs §5.3", so it no longer describes the build.

**Witness:** These *Needs:* lines give the edges §5.2 → §5.4 → §5.3 → §5.2:
- line 1131: "§5.4 (conjugacy of the fixed groups…)";
- line 1167: "§5.1, §5.2";
- line 1214: "§2.2, §5.3".

Also, §5.4's containment argument ("it fixes a point of `X`") uses the space `X` that §5.2 constructs.

**Repair:** Keep in §5.2 only the case of conjugate fixed groups, and move the any-two-data conclusion into §5.4:
- Lines 1112–1113: replace "and `X` depends on choices only up to `G`-equivariant diffeomorphism (`gK ↦ gh⁻¹K'` for `K' = hKh⁻¹`; the fixed groups of any two data are conjugate by §5.4)" with "and two data whose fixed groups are conjugate, `K' = hKh⁻¹`, have `G`-equivariantly diffeomorphic spaces, by `gK ↦ gh⁻¹K'`".
- Line 1131: "*Needs:* §2.2; LieGroups Layer 9; SmoothBundlesConnections B1.4."
- Lines 1152–1154: replace "between the spaces `X` of two Cartan involution data (`gK ↦ gh⁻¹K'`) and the identification `G/K ≅ X_{𝔤₀}` are isometries for the Killing metrics, so that `(X, g_X)` depends only on `𝔤₀` up to `G`-equivariant isometry." with "between the spaces `X` of two data with conjugate fixed groups (`gK ↦ gh⁻¹K'`) and the identification `G/K ≅ X_{𝔤₀}` are isometries for the Killing metrics."
- Line 1181: after "the maximal compact subgroups are exactly the conjugates of `K`;", insert "hence the fixed groups of any two data on `G` are conjugate, their spaces `X` are `G`-equivariantly diffeomorphic (§5.2), and for semisimple `𝔤₀` they are isometric for the Killing metrics (§5.3), so that `(X, g_X)` depends only on `𝔤₀` up to `G`-equivariant isometry;".

After this repair the edges are §5.2 → §2.2, §5.3 → §5.1 and §5.2, and §5.4 → §2.2 and §5.3. These are acyclic and agree with line 1356. On `ℂˣ`, where `K = K' = U(1)` and `h = 1`, the §5.2 map is the identity.

## Previous findings

- R01 — repaired: "and, when `𝔤₀` is semisimple, any two Cartan involution data on `G` are conjugate by an inner automorphism of `G`". The Scope (lines 123–124) and §5.2 ("for `K' = hKh⁻¹`") were changed and the `ℂˣ` Check was added. The §5.2 change introduced R01 above.
- R02 — repaired: `exists_restrictedRootPairing_weylGroup` is at `Suggested.lean:178–189`, and the "not statable" item is deleted. §2.3 says "this is `exists_restrictedRootPairing_weylGroup`, obtained from the case of `Int(𝔤₀)`", and the description lists the theorem.
- R03 — repaired: Weyl's theorem now has the locator "(Knapp, Ch. IV, Thm. 4.69)". The factor claims carry complete arguments: "the kernel is discrete and normal in the connected `∏ G_i`, hence central, so it lies in `∏ Z(G_i)`, and `Z(G_i) ⊆ Z(G)`".
- R04 — repaired: the description now says NoncompactQuantumSymmetry M0 should cite "§0.2 (…), §2.2 (`Ad(G) = Int(𝔤₀)`, `ker Ad = Z(G)`), §5.2 (`G/K ≅ 𝔭`), §5.3 (curvature) and §5.4 (…) here".

## Verified sound

| Target | Instances | Values computed (both sides) | Result |
|---|---|---|---|
| `exists_restrictedRootPairing_weylGroup` | `SL₂(ℝ)`, `θ = −ᵀ` | `Ad g` commutes with `θ` iff `gᵀg = 1`, so `K = SO(2)`; `[[0,−1],[1,0]]` sends `diag(1,−1)` to `diag(−1,1)`, which is the coreflection `−1`; `w = 2`: `B(2H,2H) = 4B(H,H)`, so both sides are false | holds |
| same | `SL₃(ℝ)` | `W(Σ) = S₃`, order `6`; `N_{SO(3)}(𝔞)` is the 24 signed permutation matrices of determinant `1`, `Z_{SO(3)}(𝔞)` the 4 diagonal ones; `24/4 = 6` | holds |
| same | `SU(2,1)`, nonreduced | `Σ = {±λ, ±2λ}`; the coreflections of `λ` and `2λ` are both `−1` on the 1-dimensional `𝔞`; `N_K(𝔞)/Z_K(𝔞)` has order `2` | holds |
| same | universal cover of `SL₂(ℝ)` (infinite centre) | `K = Ad⁻¹(PSO(2)) ≅ ℝ`; its normalizer of `𝔞` is `(π/2)ℤ`, acting by `(−1)ⁿ`; the image `{±1} = W(Σ)` | holds, for any centre |
| same | `SU(2)`; the trivial group | `θ = 1`, `𝔞 = 0`, `Σ = ∅`; closure of `∅` = `{1}` = `Aut(0)`; on the right, `g = 1` | holds |
| same, padding probe | scratch copy | `rfl`, `simp`, `infer_instance`, `trivial` and `aesop` all fail ("unsolved goals") | not padding |
| §2.3: `Ad` maps `N_K(𝔞)` onto `N_{K_θ}(𝔞)` | `SL₂(ℝ) → PSL₂(ℝ)` | `N_{SO(2)}(𝔞) = {±1, ±J}`, order `4`, maps onto order `2` in `PSO(2)`; the same restrictions `{±1}` | holds |
| §2.1: kernel of `∏ G_i → G` | `(SL₂ × SL₂)/⟨(−1,−1)⟩`; `(S̃L₂ × S̃L₂)/{(n,−n)}` | kernel of order `2` inside `Z(G₁) × Z(G₂)` of order `4`; kernel `≅ ℤ` with `Z(G) ≅ ℤ`, so the finite-centre hypothesis is needed | holds |
| §2.1: rank `0` ⇒ compact via Weyl | `𝔰𝔲(2)`; `𝔰𝔲(2) ⊕ ℝ` | `Int = SO(3)` with compact universal cover `SU(2)`, so `SU(2)` and `SO(3)` are compact; `𝔰𝔲(2) ⊕ ℝ` is excluded as not semisimple, and `SU(2) × ℝ` is noncompact | holds |
| §5.4: conjugacy of data, semisimple `𝔤₀` | `SL₂(ℝ)`, `K' = SO(2)_z = hSO(2)h⁻¹`, `h·i = z` | `c_hΘc_h⁻¹` fixes `K'`; `𝔭' = Ad(h)𝔭 = 𝔨'^{⊥_B}`; equal to `Θ'` | holds |
| §5.4: `ℂˣ` Check | `φ(z) = z\|z\|^i`, `θ₀(z) = 1/z̄` | `φ⁻¹θ₀φ(z) = \|z\|^{2i}/z̄`; both fix `\|z\| = 1`; `θ₁(2) ≈ (0.184+0.983i)/2 ≠ 0.5`; `dθ₁(a+bi) = −a+i(2a+b)`, `𝔭 = ℝ(1−i)`, `𝔨 = iℝ` | holds |
| Scope, lines 123–124, against §5.4 | the same `ℂˣ` | both now restrict conjugacy of data to semisimple Lie algebras; the fixed groups `U(1)` are conjugate | holds |
| §5.2: independence of choices | `K' = hKh⁻¹` | `gk ↦ gkh⁻¹K' = gh⁻¹(hkh⁻¹)K' = gh⁻¹K'`: the map is well defined and `G`-equivariant; the *Needs:* edges form the cycle §5.2 → §5.4 → §5.3 → §5.2 | map holds; build order R01 |

Rows for the statements this diff leaves untouched stand as in the previous review, of `4dac658`.

- **Gate:** the worker's gate at `878a044` passes every check. My rerun, on main's merge order, fails only `depcheck: NOT IN ORDER: RealSemisimpleLieGroups (insert it after its last supplier)`, which is not a defect. On the candidate order, `depcheck: 206 roadmaps, 1905 edges, 0 problem(s)`. Nothing changed outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and nothing else. `#check @exists_restrictedRootPairing_weylGroup` keeps `[ConnectedSpace G]`, `[IsSemisimple ℝ (LeftInvariantDerivation I G)]`, `hθ` and `h𝔞`, matching §2.3. At the pin, `RootPairing.coreflection` has type `RootPairing ι R M N → ι → N ≃ₗ[R] N`.
- **Source locators checked against the text:** 1. Kostant, Proposition 2.4 and its proof, lines 389–409, p. 422, supports `Ad(k)H = H'` through `g = kan` and `𝔭 ∩ 𝔫 = 0`, as rewritten in §2.3.
- **Supplier declarations opened:**
  - LieGroups Layer 9 `CartanInvolution`, on main (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:1225–1231`): a finite central cover `π` with `K = π⁻¹(K_H) = G^θ`. The `ℂˣ` Check meets it with `π = φ`.
  - LieGroups Layer 7's compact simply connected theorem (line 984).
- **Cross-roadmap citations resolved in the changed passages:** 6.
  - LieGroups Layers 5A, 7 and 9, and §0.2's adjoint datum.
  - AF §2.3a, at the head of AutomorphicFormsOnReductiveGroups (line 373).
  - NoncompactQuantumSymmetry at `4e793e8`, unchanged since the previous review, lines 1002–1037.
- Overlap check: I read AutomorphicFormsOnReductiveGroups, FlagVarieties, ShimuraData, RiemannianGeometry (main and the open heads), LieGroups, LieHighestWeight and NoncompactQuantumSymmetry. The new headline's object, `W_G = W(Σ)` for connected `G` and any centre, is owned here:
  - LieGroups Layer 9 supplies `W_G` and `W(Σ) ⊆ W_G`, and this roadmap cites it.
  - NoncompactQuantumSymmetry (line 1073) consumes `W` from Layer 9, and AF §2.3a (line 379) compares it with the relative Weyl group. Neither owns it.
  - `overlaps.md` lists no dropped id and no other pull request changing this roadmap.

## Not verifiable

- Knapp2002 is uncertified (settled), so its new locator Ch. IV, Thm. 4.69 (Weyl's theorem) and the Thms. 6.31 and 6.57 cited in §§2.2–2.3 were not checked. Knapp's author page and Project Euclid list an open digital second edition (2023); I did not compare its numbering with the 2002 print.
- Helgason and Eberlein, cited for §§5.2–5.4: there is no legal copy, as in the previous review.

## Source issues

- none
