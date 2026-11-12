# Review of RealSemisimpleLieGroups (pull request #2229 at 3625d2c)

**Verdict:** needs changes

## R01 (P2) — `N_{Π'}` is not the largest connected normal nilpotent subgroup when `G` has a centre

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:917–918`: "`N_{Π'}` is the largest connected normal nilpotent subgroup of `Q` (its nilradical)". Line 873: "`𝔫_{Π'}` the nilradical, an ideal".

**Claim:** The previous review's R01, not repaired. Layers 3–4 cover the real points of connected reductive groups (lines 785–787). For these groups both sentences fail as soon as the centre has positive dimension, and the `GL₃(ℝ)` Check at line 926 is a counterexample.

**Witness:** Take `G = GL₃(ℝ)` and `Q` of block type `(2, 1)`. Then `{s·[[1₂, v], [0, 1]] : s > 0}` is connected, normal and abelian, and strictly contains `N_{Π'} ≅ ℝ²`. Likewise `ℝ·1 ⊕ 𝔫_{Π'}` is a nilpotent ideal of `𝔮_{Π'}`.

**Repair:**
- Line 873: "`𝔮_{Π'} = 𝔩_{Π'} ⊕ 𝔫_{Π'}` with `𝔫_{Π'}` an ideal, the nilradical of `𝔮_{Π'} ∩ [𝔤₀, 𝔤₀]`".
- Lines 917–918: "`N_{Π'}` is a connected, simply connected, normal nilpotent subgroup of `Q` whose Lie algebra is the nilradical of `𝔮_{Π'} ∩ [𝔤₀, 𝔤₀]`; for semisimple `𝔤₀` it is the largest connected normal nilpotent subgroup of `Q`".

Test on `GL₃`: `𝔮 ∩ 𝔰𝔩₃` is the `(2, 1)` parabolic of `𝔰𝔩₃`. Its nilradical is `𝔫_{Π'}`, of dimension `2`, because `diag(1, 1, −2)` acts on `𝔫_{Π'}` by `3 ≠ 0`.

## R02 (P2) — The curvature, distance and flat formulas use `B`, which is not the metric on central directions

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:1092`: "the distance formula `d(g·o, h·o) = B(Y, Y)^{1/2}`". Line 1087–1088: "a `B`-orthonormal pair". Line 1165: "isometric to `(𝔞, B|𝔞)`". Line 1173: "`|d_𝔞(x, y)|_B = d(x, y)`".

**Claim:** The previous review's R02, not repaired. Conventions (lines 175–176) put a specified inner product, not `B`, on `𝔭 ∩ 𝔷(𝔤₀)`. §5.3 and §5.5 restrict to semisimple `𝔤₀` only where they say so, and `B` vanishes on the centre, so these formulas fail for reductive `𝔤₀`.

**Witness:** Take `G = GL₂(ℝ)` and `Y = 1 ∈ 𝔭`. Since `ad 1 = 0`, `B(1, 1) = 0`, while `d(o, eᵗ·o) = |t|·|1|_o > 0` for `t ≠ 0`. Also `B|𝔞` is degenerate on `ℝ·1`.

**Repair:** Write `⟨·,·⟩_o` for the metric of Conventions at `o`. Then:
- Line 1087: "a `⟨·,·⟩_o`-orthonormal pair".
- Line 1092: "`d(g·o, h·o) = ⟨Y, Y⟩_o^{1/2}`, which is `B(Y, Y)^{1/2}` when `𝔤₀` is semisimple".
- Line 1165: "isometric to `(𝔞, ⟨·,·⟩_o|𝔞)`".
- Line 1173: "`|d_𝔞(x, y)|_o = d(x, y)`".

On `GL₂(ℝ)` with `Y = 1`, the repaired distance formula gives `|t|·|1|_o`.

## R03 (P2) — §2.5 is a second owner of ALS.0.1's Cartan involutions and ALS.F.1's transpose-stable realization

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:40–41`: "and the Cartan involutions of a real form `G^τ` of a connected complex reductive group with its maximal compact subgroups (Layer 2)". Line 712: "A Cartan involution for `τ` exists, and any two are conjugate by an element of `(H^τ)°`."

**Claim:**
- Through LieGroups Layer 7's `H ≃ 𝐇(ℂ)`, `τ` is the conjugation of a real form `𝐇₀`, and `H^τ = 𝐇₀(ℝ)`; §2.5's own route at line 725 says so.
- A "Cartan involution for `τ`" is then ALS.0.1's `IsCartanInvolution` of `𝐇₀`. ALS is earlier in the merge order and owns existence and conjugacy.
- ALS.F.1 owns the Mostow realization that lines 721–727 prove again.
- This also covers the previous review's R06, which is still open: Scope never says how §5.4 differs from ALS.0.1.

**Witness:** `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md` at its head, ALS.0.1: `θ` is Cartan when "the twisted real form `H^(θ)(ℝ) = {g ∈ H(ℂ) : g = θ(ḡ)}` is compact"; "existence over arbitrary real groups is owned here"; `IsCartanInvolution.conj`. ALS.F.1: Mostow's theorem.

**Repair:**
- Lines 40–41: "and the reading of ArithmeticLocallySymmetricSpaces ALS.0.1's Cartan involutions on antiholomorphic real forms `H^τ` of connected complex reductive Lie groups, with their LieGroups Layer 9 datum (Layer 2)".
- Add to "It leaves to other roadmaps": "- the Cartan involutions of a connected reductive `ℝ`-group, their existence and their conjugacy by real points, and the transpose-stable realization of its real points: ArithmeticLocallySymmetricSpaces ALS.0.1 (`IsCartanInvolution.exists`, `IsCartanInvolution.conj`) and ALS.F.1; §2.5 reads them on `H^τ` and refines conjugacy to `(H^τ)°`, and §5.4 proves conjugacy of LieGroups `CartanInvolution` data, nonlinear finite covers included."
- §2.5, second bullet: replace the route with "By LieGroups Layer 7's dictionary `τ` is the conjugation of a real form `𝐇₀` of `𝐇` with `H^τ = 𝐇₀(ℝ)`, and `σ` is a Cartan involution for `τ` iff it is one of `𝐇₀` in the sense of ArithmeticLocallySymmetricSpaces ALS.0.1. Existence and `H^τ`-conjugacy are ALS.0.1's; for `(H^τ)°`, write the conjugating element as `lieExp X · k` with `X ∈ 𝔭`, `k ∈ K`, and use `σ(k) = k`."
- §2.5, third bullet: replace the averaging route with "Route: ALS.F.1's transpose-stable realization of `𝐇₀`, in which `σ` restricts to `g ↦ (gᵀ)⁻¹`; this is LieGroups Layer 9's global matrix model with `π = id`."
- Add ALS.0.1 to §2.5's *Needs:* line.

Test on `H = SL_n(ℂ)` with `τ(g) = ḡ`: here `𝐇₀ = SL_n`, and ALS.0.1's twisted form of `(gᵀ)⁻¹` is `{g = (ḡᵀ)⁻¹} = SU(n)`. That is §2.5's `H^{στ}` at line 739.

## R04 (P2) — Two headlines that the docstring calls unstatable are statable at the pins

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/Suggested.lean:28–29`: "the conjugacy of Cartan involutions (§0.2) and of hyperbolic elements (§2.4) under inner automorphisms: the pins have no inner automorphism group `Int(𝔤₀)` of a real Lie algebra".

**Claim:** The previous review's R03, not repaired. Both theorems can be stated for `𝔤₀ = Lie(G)` through `TauCeti.Lie.Ad`, as `exists_titsSystem` already is. This works because `Ad(lieExp Z) = e^{ad Z}` and, for connected `G`, `Ad(G) = Int(𝔤₀)` (§2.2).

**Witness:** At this head, the two statements below elaborate in a scratch copy with only `sorry` warnings. Kostant1973 lines 389–393 (Prop. 2.4, p. 422) state §2.4's result for a Lie group with Lie algebra `𝔤`.

**Repair:** Add the following to the `Group` section. Then name both theorems in §0.2 and §2.4, and delete the docstring bullet at lines 28–29.

```lean
theorem exists_conj_cartanInvolution [ConnectedSpace G]
    [IsSemisimple ℝ (LeftInvariantDerivation I G)]
    {θ θ' : LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G}
    (hθ : IsCartanInvolution θ) (hθ' : IsCartanInvolution θ') :
    ∃ Z ∈ cartanP θ, ∀ Y, θ' (TauCeti.Lie.Ad (I := I) (lieExp Z) Y) =
      TauCeti.Lie.Ad (I := I) (lieExp Z) (θ Y) := sorry

theorem existsUnique_ad_mem_closedChamber [ConnectedSpace G]
    [IsSemisimple ℝ (LeftInvariantDerivation I G)]
    {θ : LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G}
    (hθ : IsCartanInvolution θ) {𝔞 : Submodule ℝ (LeftInvariantDerivation I G)}
    (h𝔞 : IsMaximalAbelianInP θ 𝔞) {H₀ : 𝔞} (hH₀ : ∀ μ ∈ restrictedRoots 𝔞, μ H₀ ≠ 0)
    {X : LeftInvariantDerivation I G}
    (hX : ⨆ c : ℝ, Module.End.eigenspace (ad ℝ (LeftInvariantDerivation I G) X) c = ⊤) :
    ∃! Y : 𝔞, (∀ μ ∈ restrictedRoots 𝔞, 0 < μ H₀ → 0 ≤ μ Y) ∧
      ∃ g : G, TauCeti.Lie.Ad (I := I) g X = Y := sorry
```

## R05 (P2) — `existsUnique_isCartanInvolution_lie_eq` states half of the bijection the README and docstring claim for it

**Location:**
- `TauCetiRoadmap/RealSemisimpleLieGroups/Suggested.lean:256–263`: "`∃! θ … IsCartanInvolution θ ∧ (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K).toSubmodule = LinearMap.ker …`".
- Lines 23–24: "and the bijection between maximal compact subgroups and Cartan involutions (§5.4)".
- `README.md:1130`: "This is `existsUnique_isCartanInvolution_lie_eq`."

**Claim:** The theorem says only that each maximal compact `K` determines a unique `θ`. It does not say that every Cartan involution comes from exactly one maximal compact subgroup. That direction is the other half of the README's bijection `θ ↦ K_θ`, and it is statable at the pins.

**Witness:** Take `SL₂(ℝ)` and `θ' = −gXᵀg⁻¹` with `g = diag(2, ½)`. The Lean statement asserts nothing about `θ'`. That `𝔨_{θ'} = Lie(SO(2)_{2i})` for exactly one maximal compact subgroup is absent.

**Repair:** Replace the theorem with the following. It elaborates in the scratch copy with only `sorry` warnings.

```lean
theorem existsUnique_isCartanInvolution_lie_eq [ConnectedSpace G]
    [IsSemisimple ℝ (LeftInvariantDerivation I G)] [Finite (Subgroup.center G)] :
    (∀ K : Subgroup G, Maximal (fun K : Subgroup G ↦ IsCompact (K : Set G)) K →
      ∃! θ : LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G,
        IsCartanInvolution θ ∧ (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K).toSubmodule =
          LinearMap.ker ((θ : LeftInvariantDerivation I G →ₗ[ℝ] LeftInvariantDerivation I G) -
            LinearMap.id)) ∧
    ∀ θ : LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G, IsCartanInvolution θ →
      ∃! K : Subgroup G, Maximal (fun K : Subgroup G ↦ IsCompact (K : Set G)) K ∧
        (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K).toSubmodule =
          LinearMap.ker ((θ : LeftInvariantDerivation I G →ₗ[ℝ] LeftInvariantDerivation I G) -
            LinearMap.id) := sorry
```

## R06 (P3) — Cartan's fixed-point theorem drops the topological-group hypothesis that its Haar route needs

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/Suggested.lean:223`: "`{Λ : Type*} [Group Λ] [TopologicalSpace Λ] [CompactSpace Λ] [MulAction Λ M]`". README line 1118–1119: "a compact group acting continuously by isometries … (Haar probability, CompactGroups)".

**Claim:** The previous review's R04, not repaired. In the Lean statement `Λ` is any group with a compact topology. The README's statement and its Haar route assume a compact topological group, so the README and the Lean signature differ in generality.

**Witness:** At the pin, `#check @MeasureTheory.Measure.haar` requires `[IsTopologicalGroup G]`.

**Repair:** In `Suggested.lean:223`, insert `[IsTopologicalGroup Λ]` after `[TopologicalSpace Λ]`. The repaired file elaborates with only `sorry` warnings.

## R07 (P3) — §2.3's route skips the reduction from `G`-conjugacy to `K`-conjugacy

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:626–627`: "Prove that two elements of `𝔞` conjugate under `G` are conjugate under `W_G` (from the uniqueness of the middle factor of `kakDecomposition` modulo `W_G`)".

**Claim:** The previous review's R05, not repaired. For `g ∉ K`, `g·exp(H)·g⁻¹ = exp(H')` is not a `KAK` factorization, so the step from `G` to `K` is missing.

**Witness:** Kostant1973 lines 404–409 (p. 422): with `g = kan`, `Ad(an)z − z ∈ 𝔫`, and `𝔭 ∩ 𝔫 = 0` forces `Ad(k)z = y`.

**Repair:** Replace the parenthesis with: "(by the Iwasawa decomposition `g = kan`: `Ad(an)H − H ∈ 𝔫` and `𝔭 ∩ 𝔫 = 0` give `Ad(k)H = H'`, Kostant, *On convexity, the Weyl group and the Iwasawa decomposition*, Proposition 2.4, p. 422; then `k·exp(H)·k⁻¹ = exp(H')` and the uniqueness of the middle factor of `kakDecomposition` modulo `W_G`)".

## R08 (P3) — A Mathlib name and a Tau Ceti path in the supplier contracts do not exist at the pins

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:142` and `190`: "`LieAlgebra.killingForm`". Line 257: "the real hyperbolic space (`TauCeti/Geometry/Hyperbolic/Hyperboloid/`)". Line 1074: "(Tau Ceti's hyperboloid model)".

**Claim:** The previous review's R07, not repaired. Mathlib's Killing form is the root-namespace `killingForm`, which `Suggested.lean:64` uses. Tau Ceti has no hyperboloid model.

**Witness:** At the pin, `#check @LieAlgebra.killingForm` gives "Unknown constant". Tau Ceti has no `Geometry/Hyperbolic/` directory. Its real hyperbolic space is `TauCeti.UpperHalfSpace`, at `Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Basic.lean:91`.

**Repair:**
- Lines 142 and 190: replace `LieAlgebra.killingForm` with `killingForm`.
- Line 257: "the upper half-space model `TauCeti.UpperHalfSpace` of real hyperbolic space (`TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/`)".
- Line 1074: "the upper sheet of the hyperboloid, isometric after rescaling to Tau Ceti's `TauCeti.UpperHalfSpace`".

## R09 (P3) — §2.1, §3.1, §4.2 and §4.4's complex case state theorems without a locator

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md`: §2.1 (lines 572–585), §3.1 (lines 764–787), §4.2 (lines 891–898) and the complex-group paragraph of §4.4 (lines 955–963).

**Claim:** The previous review's R08, not repaired. The paragraph of §4.4 that this head adds has the same defect. None of these passages cites a source at any claim.

**Witness:** Two examples with no source:
- Line 578: "with finite centre the multiplication map `∏ G_i → G` has finite central kernel".
- Line 961–963: "`P_s` … is `dynamicalParabolic (−s)`, and every parabolic subgroup of `H` is a `P_s`".

**Repair:** At each claim, add the theorem number and page from the text it is taken from:
- §2.1: the almost-simple factors.
- §3.1: Knapp, Ch. VII §7, for `P = MAN` of a connected semisimple group with finite centre.
- §4.2: Bourbaki, *Lie*, Ch. IV §2, nos. 5–6, for the subgroups containing `B` in a Tits system.
- §4.4: the parabolic subgroups of a complex reductive group viewed as a real group.

## R10 (P3) — Two Eschenburg locators do not support the statement as written

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:1036–1037`: "the symmetry at the midpoint of a minimizing geodesic exchanges its ends; Eschenburg, §1, Theorem 1, p. 2". Lines 1065–1066: "§6, p. 17, for simple connectivity and `X ≅ ℝⁿ` in noncompact type".

**Claim:** The previous review's R09, not repaired.
- Theorem 1 characterizes symmetric spaces as homogeneous spaces with one symmetry. The midpoint argument precedes it.
- §6 proves simple connectivity only for isotropy-irreducible spaces.

**Witness:** EschenburgSymSpaces lines 49–52 give the midpoint argument, and Theorem 1 is at line 63. Line 676 assumes isotropy irreducibility, and `ℍ² × ℍ²` is of noncompact type but not isotropy irreducible.

**Repair:**
- Line 1037: "Eschenburg, §1, p. 2, the paragraph before Theorem 1".
- Lines 1065–1066: "and §6, p. 17, for simple connectivity and `X ≅ ℝⁿ` when `X` is isotropy irreducible of noncompact type; in general both follow from `cartan_polar_decomposition`".

## R11 (P3) — Two definitions have only two Checks

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md`: §3.2 Checks (lines 815–817) and §5.1 Checks (lines 1043–1046).

**Claim:** The previous review's R10, not repaired. §3.2 defines `𝔤^{(α)}`, `G^{(α)}` and `P^{(α)}`, and §5.1 defines the predicate "Riemannian symmetric space". Each has two Checks, and the rule asks for at least three.

**Witness:** §3.2 has only the `SL₂(ℝ)` decomposition and the `SL₃(ℝ)` subgroup. §5.1 has only the model spaces and the torus/variable-curvature bullet.

**Repair:**
- Add to §3.2: "- `SO₀(n, 1)`, `n ≥ 2`: in real rank one the subalgebra generated by the restricted root spaces is an ideal, so `𝔤^{(α)} = 𝔰𝔬(n, 1)` and `G^{(α)} = G`; the rank-one decomposition is the two-cell Bruhat decomposition of `S^{n−1}`, and `N_G(𝔞)/MA` has order `2`."
- Add to §5.1: "- `ℝ² ∖ {0}` with the flat metric has `∇R = 0` but is not symmetric: a symmetry at `p` would have to be `x ↦ 2p − x`, which sends `2p` to the removed origin; a predicate tested only by parallel curvature would accept this space."

## R12 (P3) — The Ordering paragraph understates what Layer 0 needs

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:1284`: "Layer 0 needs LieGroups Layer 7 only for existence of Cartan involutions".

**Claim:** The previous review's R11, not repaired. §0.2 also needs LieGroups Layers 2, 4 and 9.

**Witness:** Line 372 has "*Needs:* §0.1; Mathlib `LieDerivation.IsKilling.exists_eq_ad`; LieGroups Layers 2, 4 and 9", and line 428 lists "LieGroups Layers 2, 4, 7 and 9".

**Repair:** Replace lines 1284–1286, up to "needs it.", with: "§0.1, §0.3 and §0.4 need LieGroups Layer 7 only for the existence of Cartan involutions; they are otherwise self-contained Lie algebra and can be built first, with existence taken as a hypothesis in each statement that needs it. §0.2 needs LieGroups Layers 2, 4 and 9 for `Int(𝔤₀)` and its adjoint datum."

## R13 (P3) — The description narrows Layer 5 to noncompact type

**Location:** Pull-request description: "and Riemannian symmetric spaces `G/K` of noncompact type, with curvature, Cartan's fixed-point theorem, conjugacy of maximal compact subgroups, flats and quotients".

**Claim:** The previous review's R12, not repaired. At this head Layer 5 treats abstract symmetric spaces (§5.1) and `G/K` for every LieGroups `CartanInvolution` datum.

**Witness:** `README.md:13` has "the symmetric space `X = G/K` of a real reductive group", and line 1053 has "Let `G` carry a LieGroups Layer 9 `CartanInvolution` datum".

**Repair:** "and Riemannian symmetric spaces, with the symmetric space `G/K` of a real reductive group, its curvature, Cartan's fixed-point theorem, conjugacy of maximal compact subgroups, flats and quotients".

## R14 (P3) — The description's sources sentence omits the two sources this head adds

**Location:** Pull-request description: "no legal copy of Helgason or Eberlein was found, so several Knapp theorem numbers and the Helgason and Eberlein locators are not checked against the sources."

**Claim:** This head cites Goldman, *Complex Hyperbolic Geometry*, Ch. 3 (§5.7) and Borel, *Linear Algebraic Groups*, Thm. 20.9(ii) (§2.4). Neither locator is checked, and the description does not say so.

**Witness:** `README.md:1256` cites "(Goldman, *Complex Hyperbolic Geometry*, Ch. 3.)", and lines 667–668 cite "Borel, *Linear Algebraic Groups*, 2nd ed., Thm. 20.9(ii)". The sources service finds no legal copy of Goldman and only a paywalled page for Borel.

**Repair:** Append to that sentence: "; Goldman, *Complex Hyperbolic Geometry* (§5.7), has no legal copy and Borel, *Linear Algebraic Groups* (§2.4), is paywalled, so their locators are not checked either."

## Verified sound

| Target | Instances | Values computed (both sides) | Result |
|---|---|---|---|
| Previous R01 | README 873, 917–918 | "`𝔫_{Π'}` the nilradical, an ideal"; "largest connected normal nilpotent subgroup" unchanged | not repaired: R01 |
| Previous R02 | 1088, 1092, 1165, 1173 | "`d(g·o, h·o) = B(Y, Y)^{1/2}`", "`(𝔞, B|𝔞)`" unchanged | not repaired: R02 |
| Previous R03 | `Suggested.lean` 28–29 | "the pins have no inner automorphism group" unchanged; the proposed statements elaborate at this head | not repaired: R04 |
| Previous R04 | `Suggested.lean` 223 | "`[TopologicalSpace Λ] [CompactSpace Λ]`" unchanged | not repaired: R06 |
| Previous R05 | 626–627 | "(from the uniqueness of the middle factor of `kakDecomposition` modulo `W_G`)" unchanged | not repaired: R07 |
| Previous R06 | Scope 88–116 | no ALS.0.1 bullet; §2.5 adds a second copy of ALS.0.1 | not repaired: R03 |
| Previous R07 | 142, 190, 257, 1074 | `LieAlgebra.killingForm`, `Geometry/Hyperbolic/Hyperboloid/` unchanged | not repaired: R08 |
| Previous R08 | §2.1, §3.1, §4.2 | no locator at any claim | not repaired: R09 |
| Previous R09 | 1037, 1065–1066 | "§1, Theorem 1, p. 2"; "§6, p. 17 … in noncompact type" unchanged | not repaired: R10 |
| Previous R10 | §3.2, §5.1 | two Checks each | not repaired: R11 |
| Previous R11 | 1284 | "Layer 0 needs LieGroups Layer 7 only for existence" unchanged | not repaired: R12 |
| Previous R12 | description | "`G/K` of noncompact type" unchanged | not repaired: R13 |
| §0.2 conjugacy | `𝔰𝔩₂`, `g = diag(2, ½)`; compact `𝔤₀` | `h = diag(√2, 1/√2)`, `hhᵀ = g`, `Z` symmetric trace zero; `θ ≠ 1` gives `𝔭 ≠ 0` with `B > 0`, contradiction | holds; Knapp not verifiable; R04 |
| §0.4 Killing forms | `𝔰𝔬(2,1)`, `𝔰𝔭(4,ℝ)`, `𝔰𝔲(1,1)` | `p+q−2 = 1`; `2n+2 = 6`; `2(p+q) = 4`, matching `𝔰𝔩₂ ≅ 𝔰𝔲(1,1)` with `4 tr` | holds |
| §1.1 root spaces | `𝔰𝔬(n,1)` | `n(n+1)/2 = (n−1)(n−2)/2 + 1 + 2(n−1)` | holds |
| §1.3 conjugacy, real rank | `𝔤𝔩_n(ℝ)`; Eschenburg Thm 9 and Lemma | `realRank 0`, `finrank 𝔞 = n = (n−1)+1`; source: nearest point on an `Ad(K)`-orbit, regular elements (lines 854–913) | holds; locator verified |
| §1.4 split forms | `𝔰𝔲(2,1)`; `𝔰𝔬(2,3)`, `𝔰𝔬(2,4)` | restrictions `2+2+1+1 = 6`; `𝔪 = 0`, `2 = 2`; `𝔪 = 𝔰𝔬(2)`, `2 < 3` | holds |
| §2.3 restricted Weyl group | `O(1,1)`; Borel–Tits 14.4 | `Σ = ∅`, `W_G` of order 2, `M` misses two of four components; source: `G_ℝ = (G_ℝ)°·S_ℝ`, p. 146 (line 3750) | holds; route R07 |
| §3.1 minimal parabolics | double cover of `SL₂(ℝ)` | preimage of `{±1}` in the circle double cover is `{±1, ±i}`, cyclic of order 4 | holds; no locator R09 |
| §4.1 standard parabolic subalgebras | `𝔰𝔩₃`, `X = diag(1,1,−2)/3` | `α₁(X) = 0`, `α₂(X) = 1`; entries `(3,1)`, `(3,2)` have eigenvalue `−1`, excluded: block type `(2,1)` | holds |
| §4.2 standard parabolic subgroups | `W_{α₁}\S₃/W_{α₁}` | double cosets `{e, (12)}` and the other four: 2; one-sided cosets: 3 | holds; no locator R09 |
| §4.3 Langlands decomposition | `GL₃` type `(2,1)`; `Sp(4)` Siegel | `ℝ_{>0}·N_{Π'}` connected, normal, abelian, `⊋ N_{Π'}`; `dim N = 10 − 7 = 3` | fails: R01 |
| §4.4 dynamical, complex case | `SL₂(ℂ)`, `s = diag(1,−1)` | `e^{ts}ge^{−ts}` scales `g₁₂` by `e^{2t}`: lower; `dynamicalParabolic s` scales `g₂₁` by `e^{2t}`: upper | holds; no locator R09 |
| §5.1 symmetric spaces | `ℝ²∖{0}`; Eschenburg §§1, 2, 5 | flat, `∇R = 0`, symmetry sends `2p` to `0`; Thm 5 proof (lines 622–628) and Thm 2 (lines 322–327) support | Theorem 1 locator R10; Checks R11 |
| §5.2 `G/K` as a manifold | `ℍ² × ℍ²`; Eschenburg Thm 3, §6 | Thm 3: `𝔭 → T_pS` an isomorphism (line 441); §6 assumes isotropy irreducible (line 676) | R10 |
| §5.3 metric and curvature | `SL₂/SO(2)`; `GL₂(ℝ)`, `Y = 1` | `B([Y,Z],[Y,Z]) = 4·(1/16)·(−2) = −½`; `B(1,1) = 0` but `d(o, eᵗ·o) = |t||1|_o` | fails for reductive: R02 |
| §5.7 complex hyperbolic space | `n = 1, 2`; non-example | `B(Y_v,Y_v) = 4(n+1)|v|² = 2(n+1)·g_𝔹(v,v)`; curvatures `−2`, `−½`, `−1/3`, `−1/12`; bracket `−4ie₁ − ie₂ ∉ V` | holds; Goldman not verifiable |
| §2.4 split tori | `GL₂`; Borel–Tits 4.21 | diagonal and rotated tori of dimension 2; `SO(2)` anisotropic; `𝐙_s(ℝ)° = ℝ_{>0}·1`; source: conjugacy over `k` (line 1581) | holds |
| §2.5 real forms | `SL_n(ℂ)`, `ℂˣ`, `SO_{p+q}(ℂ)` | `στ(g) = (g*)⁻¹`, fixed `SU(n)`, `K = SO(n)`; `K = {±1}`; `S(O(p)×O(q))` meets both components | holds; ownership R03 |
| §4.5 real-form parabolics | `SL₂(ℝ)`, stabilizer of `[i : 1]` | its intersection with `SL₂(ℝ)` is the Möbius stabilizer of `i`, `SO(2)`, compact, not parabolic | holds |
| §5.4 bijection Check | `SL₂(ℝ)`, `h·i = z`; universal cover | `Ad(h)θAd(h)⁻¹X = −(hhᵀ)Xᵀ(hhᵀ)⁻¹`; cover: maximal compact `{1}`, many Cartan involutions | holds |
| `exists_restrictedRootPairing` | `𝔰𝔲(2,1)`; zero algebra | `⟨2λ, H'_λ⟩ = 4`, `⟨λ, H'_{2λ}⟩ = 1`; `Σ = ∅` spans `0 = 𝔞*` | holds |
| `finrank_eq_realRank` | `𝔰𝔩₃(ℝ)`; zero algebra | rank set `{2}`, `sSup = 2`; set `{0}` | holds |
| `realRank_eq_zero_iff` | `𝔰𝔲(2)`; `𝔰𝔩₂(ℝ)` | rank 0, `B(e₁,e₁) = −8`; rank 1, `B(H,H) = 8 > 0` | holds |
| `groupRealRank_eq_zero_iff_compactSpace` | `SU(2)`; universal cover of `SL₂(ℝ)` | 0 and compact; 1 and noncompact | holds |
| `exists_titsSystem` | `SL₂(ℝ)`; compact `G` | `B` upper triangular, `N` monomial, `W` of order 2; `𝔞 = 0`: `B = N = G`, `S = ∅` | holds |
| `dynamicalParabolic_isClosed_lie` | `X = diag(1,−1)`; `X = 0` | upper triangular, Lie algebra `span(H, E)`, eigenvalues `{0, 2}`; `Q = G` | holds |
| `exists_forall_smul_eq_of_sectionalCurvature_nonpos` | `SO(2)` on `ℝ²`; `ℤ` translations | fixes `0`; noncompact, no fixed point; Haar route needs `IsTopologicalGroup Λ` | R06 |
| `exists_maximal_isCompact_and_le_conj` | `SL₂(ℝ)`; order-6 subgroup | `K = SO(2)`; `z ↦ −1/(z+1)` fixes the root of `z² + z + 1`, `e^{2πi/3}` | holds |
| `existsUnique_isCartanInvolution_lie_eq` | `SL₂(ℝ)`, `SO(2)_z`; `SU(2)`; trivial `G` | `θ_z = −gXᵀg⁻¹`, `g = hhᵀ`; only `θ = 1`; unique `θ` on `0`; the `θ ↦ K` half is absent | R05 |
| §2.3 `W_G` route | `g ∉ K` | `g·exp(H)·g⁻¹ = exp(H')` is not a `KAK` factorization; Kostant lines 405–409 reduce to `Ad(k)z = y` | R07 |

- **Gate and dependency check:** the worker's gate passed every check. My dependency check printed `depcheck: 206 roadmaps, 1905 edges, 0 problem(s)`. Nothing changed outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gave 9 `sorry` warnings and nothing else. I ran `#check @` on all 19 declarations and compared each with the README. `groupRealRank` drops `FiniteDimensional ℝ E`, `T2Space G` and `BoundarylessManifold I G`, but its body uses none of them.
- **Padding probe:** I tried each of the 9 theorems with `first | rfl | (simp; done) | infer_instance | trivial`; none closes. All 10 definitions occur in a headline. The repairs for R04, R05 and R06 elaborate with only `sorry` warnings.
- **Source locators checked against the text:** 12 (Eschenburg 9, Borel–Tits 2, Kostant 1). Ten support the claim as written; two are imprecise (R10).
- **Library declarations:** I ran `#check @` on 50 Mathlib and Tau Ceti names at the pin. Of these, 48 resolve, `LieAlgebra.killingForm` does not, and `DoubleCoset` is a namespace. I also located 35 Tau Ceti names at source, among them `parabolicDoubleCosetEquiv` (`Parabolic/DoubleCoset.lean:199`) and `Base.existsUnique_map_eq` (`Weyl/Bases.lean:170`).
- **Cross-roadmap citations resolved: 27.** On main: LieGroups Layers 0–5, 5A, 7 and 9, RiemannianGeometry, ReductiveGroups Layers 4, 6 and 7, ComplexKahlerGeometry, CompactGroups, LieHighestWeight Layer 0, RootSystems, HopfRinow, SmoothBundlesConnections B1.4. At open heads: AF §2.3a, ALS.F.1 and ALS.0.1–0.3, AdelicAlgebraicGroups §§2.2, 2.3 and 3.4, ShimuraVarieties §§P.2–P.3 and Layers 1–3.
- Overlap check: read AutomorphicFormsOnReductiveGroups, FlagVarieties, ShimuraData, RiemannianGeometry (open heads and main), LieGroups, LieHighestWeight; third list empty. Owners: `P = MAN` for real points, AF §2.3a (cited); restricted root system, LieGroups Layer 9 (cited); `𝔰𝔩₂` strings, LieHighestWeight Layer 0; curvature and Cartan–Hadamard, RiemannianGeometry; Hermitian domains, ShimuraData and ShimuraVarieties (deferred); FlagVarieties, nothing shared; Cartan involutions of real reductive groups, ALS.0.1, outside the lists (R03); complex hyperbolic space, no other owner.

## Not verifiable

- Knapp2002 (uncertified, settled): every Knapp locator. These are VI §2, Thm 6.16, Cor 6.19, Prop 6.28, §§4–6, Prop 6.52, Thm 6.31, Thm 6.57, Prop 6.59 and the proof of Thm 6.11; VII §§2, 7 and Thm 7.40; App. C.
- Helgason, *Differential Geometry, Lie Groups, and Symmetric Spaces* (1978): no legal source found, and not in the roadmap's `sources.toml`. Affected locators: I §13, III §7, IV, V, VI §2, VII §2, X.
- Eberlein, *Geometry of Nonpositively Curved Manifolds* (1996): resolves only to a paywalled page, and not in `sources.toml`. Affected locators: Ch. 1, Ch. 2, §1.4.
- Goldman, *Complex Hyperbolic Geometry* (1999): the sources service found no legal source; the publisher's landing page returned HTTP 403. Not in `sources.toml`. Affected locator: Ch. 3 (§5.7).
- Borel, *Linear Algebraic Groups*, 2nd ed. (1991): resolves only to a paywalled page, and not in `sources.toml`. Affected locator: Thm. 20.9(ii) (§2.4).
- Warner1972, BorelJi2006 and BourbakiLieIV (uncertified, settled): §1.2; Ch. I.1; Ch. IV §2.

## Source issues

- **Misprint** in EschenburgSymSpaces at §1, p. 2: the source writes "any two points p, q ∈ M" for the symmetric space it calls S; it should be p, q ∈ S; affects nothing.
- **Misprint** in EschenburgSymSpaces at §2, p. 8: the source writes the reflected geodesic as s_p(γ(t)) = γ(−t); it should be s_m, the symmetry at the midpoint m = γ(0); affects nothing.
