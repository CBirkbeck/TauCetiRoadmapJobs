# Review of RealSemisimpleLieGroups (pull request #2229 at 9a938c5)

**Verdict:** accepted

## Previous findings

- R01 — repaired: §5.2 now reads "two such data on `G` whose fixed groups are conjugate, `K' = hKh⁻¹` with `h ∈ G`, have `G`-equivariantly diffeomorphic spaces `X`". Its *Needs:* line (1131) drops §5.4. The any-two-data conclusion moved to §5.4, whose *Needs:* line (1216) adds §5.2.

## Verified sound

| Target | Instances | Values computed (both sides) | Result |
|---|---|---|---|
| §5.2: conjugate fixed groups give `gK ↦ gh⁻¹K'` | `SL₂(ℝ)`, `K = SO(2)`, `K' = Stab(z) = hSO(2)h⁻¹` with `h·i = z` | Identify `gK ↦ g·i` and `gK' ↦ g·z`. The map sends `g·i` to `gh⁻¹·z = g·i`, so it is the identity of `ℍ`. Its inverse is `gK' ↦ ghK` | holds |
| same | `GL₂(ℝ)`, `K = K' = O(2)`, `h = 2·1 ∈ N(K) ∖ K` | `ggᵀ ↦ ggᵀ/4`: equivariant for `P ↦ gPgᵀ`, bijective, and not the identity | holds |
| §5.3: these maps are isometries for the Killing metrics (semisimple `𝔤₀`) | `SL₂(ℝ)` as above | `dφ_o(Y) = dL_{h⁻¹}(Ad(h)Y)` and `𝔭' = 𝔨'^{⊥B} = Ad(h)𝔭`, so `B(Ad(h)Y, Ad(h)Y) = B(Y, Y)`. The identity of `ℍ` preserves `2(dx² + dy²)/y²` | holds |
| same, the hypothesis | `ℂˣ`, `θ₀`, `θ₁`, `h = 1` | `B = 0`, so there is no Killing metric. The two `𝔭` are `ℝ` and `ℝ(1 − i)` | "semisimple" is needed |
| §5.4: the fixed groups of any two data are conjugate | `SL₂(ℝ)` with `θ` and `c_hθc_h⁻¹` | `SO(2)` and `hSO(2)h⁻¹`, conjugate by `h` | holds |
| same | `ℂˣ` with `θ₀`, `θ₁` | both fix `U(1)`, conjugate by `h = 1`, although the data are not conjugate (§5.4 Check) | holds |
| same, degenerate cases | `SU(2)`; universal cover of `SL₂(ℝ)` | `SU(2)`: `K = K' = G`, `X` a point. Universal cover: it carries no datum (LieGroups Layer 9 excludes infinite central covers), so the claim is vacuous | holds |
| Layer 5 build order | *Needs:* lines 1131, 1166, 1216 | §5.2 → §2.2; §5.3 → §5.1, §5.2; §5.4 → §2.2, §5.2, §5.3. Order 5.1, 5.2, 5.3, 5.4 exists; Ordering (line 1358) agrees | acyclic |
| `exists_maximal_isCompact_and_le_conj`, the conjugacy the new §5.4 clause reuses | `SL₂(ℝ)`, `C = ⟨[[0,−1],[1,1]]⟩` | characteristic polynomial `x² − x + 1`, so the order is `6`. `z ↦ −1/(z + 1)` sends `ω = e^{2πi/3}` to `−e^{−iπ/3} = ω`, so `C ≤ hSO(2)h⁻¹` with `h·i = ω` | holds |
| same | `SU(2)` | `K = G ≥ C` with `g = 1` | holds |
| §5.2 sample: Eschenburg locators | EschenburgSymSpaces lines 437–443, 697, 703–705 | Thm 3 (§3, p. 11): `V ↦ V_p` is an isomorphism `𝔭 → T_pS`. §6 (p. 17): isotropy-irreducible noncompact type is simply connected and `≅ ℝⁿ` | supports §5.2 as written |

The rows for statements this diff leaves untouched stand as in the previous review, of `878a044`.

- **Gate:** the worker's gate at `9a938c5` passes every check, including the build. My rerun on main's order fails only `depcheck: NOT IN ORDER: RealSemisimpleLieGroups (insert it after its last supplier)`, which is not a defect. On the candidate order: `depcheck: 206 roadmaps, 1905 edges, 0 problem(s)`. Nothing changed outside the folder.
- **Elaboration:** `lake env lean` on the unchanged `Suggested.lean` gives 12 `sorry` warnings and nothing else.
  - `#check @exists_maximal_isCompact_and_le_conj` keeps `[ConnectedSpace G]`, `[IsSemisimple ℝ (LeftInvariantDerivation I G)]` and `[Finite (Subgroup.center G)]`.
  - Remark: the `groupRealRank` binder lead is a definition that needs none of the three binders; `groupRealRank_eq_zero_iff_compactSpace` carries all three.
- **Source locators checked against the text:** 2. These are §5.2's Eschenburg locators, the only seeded target that falls in the changed passages. The README flags no locator as unverified.
- **Supplier text opened:** LieGroups Layer 9 on main (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:1225–1232`). It gives `K = π⁻¹(K_H) = G^θ` with compactness and maximality, which the new "hence" clause of §5.4 uses.
- **Changed passages and their citations:** 4 in-roadmap citations resolved (§5.2, §5.3, and §5.4's §5.2 and §5.3). No passage elsewhere cites the old §5.2 → §5.4 independence claim; I grepped the README and `Suggested.lean`. `g_X` and "Killing metric" carry over from the text the previous review passed.
- **Pull request text:** checked against this head. The §5.4 sentence ("the conjugacy of the data themselves when the Lie algebra is semisimple … `ℂˣ`") and the Layer 5 summary still hold. The change adds no supplier and drops no section or declaration.
- **Overlap check:** I read AutomorphicFormsOnReductiveGroups, FlagVarieties, RiemannianGeometry (main and both open heads), ShimuraData, LieGroups and LieHighestWeight in the previous round, and this round searched them by object ("symmetric space"; independence of `G/K` or of maximal compact subgroups from choices).
  - None of them states the changed objects, so the conjugacy of the fixed groups of two data and the independence of `(X, g_X)` from the datum are owned here (§§5.2–5.4).
  - ArithmeticLocallySymmetricSpaces ALS.F.1 owns the linear real-points case and is cited in Scope (line 116).
  - `overlaps.md` lists no dropped id and no other pull request changing this roadmap.

## Not verifiable

- Helgason (Ch. I §13, Ch. IV §§3–4, Ch. V §3, Ch. VI §2) and Eberlein (Ch. 2, §1.4), cited in the changed §§5.3–5.4: no legal copy, as in the previous reviews.

## Source issues

- none
