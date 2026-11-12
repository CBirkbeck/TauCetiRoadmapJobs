# Review of RealSemisimpleLieGroups (pull request #2229 at d91ea24)

**Verdict:** needs changes

## R01 (P2) — `N_{Π'}` is not the largest connected normal nilpotent subgroup when `G` has a centre

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:831–832`: "`N_{Π'}` is the largest connected normal nilpotent subgroup of `Q` (its nilradical)". Also line 787: "`𝔫_{Π'}` the nilradical, an ideal".

**Claim:** Layers 3–4 cover the real points of connected reductive groups (lines 699–701). For these groups the claim fails as soon as the centre has positive dimension. The `GL₃(ℝ)` Check in §4.3 is itself a counterexample.

**Witness:** For `G = GL₃(ℝ)` and `Q` of block type `(2, 1)`, the set `{s·[[1₂, v], [0, 1]] : s > 0}` is connected, normal and abelian, and strictly contains `N_{Π'} ≅ ℝ²`. Likewise `ℝ·1 ⊕ 𝔫_{Π'}` is a nilpotent ideal of `𝔮_{Π'}`.

**Repair:**
- Line 787: "`𝔮_{Π'} = 𝔩_{Π'} ⊕ 𝔫_{Π'}` with `𝔫_{Π'}` an ideal, the nilradical of `𝔮_{Π'} ∩ [𝔤₀, 𝔤₀]`".
- Lines 831–832: "`N_{Π'}` is a connected, simply connected, normal nilpotent subgroup of `Q` whose Lie algebra is the nilradical of `𝔮_{Π'} ∩ [𝔤₀, 𝔤₀]`; for semisimple `𝔤₀` it is the largest connected normal nilpotent subgroup of `Q`".

Test on `GL₃`: `𝔮 ∩ 𝔰𝔩₃` is the block parabolic subalgebra of `𝔰𝔩₃`. Its nilradical is `𝔫_{Π'}`, of dimension `2`, because `diag(1, 1, −2)` acts on `𝔫_{Π'}` by a nonzero scalar.

## R02 (P2) — The distance and flat formulas use `B`, which is not the metric on central directions

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:982`: "the distance formula `d(g·o, h·o) = B(Y, Y)^{1/2}`". Line 1037: "isometric to `(𝔞, B|𝔞)`". Line 1045: "`|d_𝔞(x, y)|_B = d(x, y)`".

**Claim:** Conventions (lines 155–156) put a specified inner product, not `B`, on `𝔭 ∩ 𝔷(𝔤₀)`. §5.3 and §5.5 restrict to semisimple `𝔤₀` only where they say so. `B` vanishes on the centre, so all three formulas fail for reductive `𝔤₀`.

**Witness:** For `G = GL₂(ℝ)` and `Y = 1 ∈ 𝔭`, `ad 1 = 0` gives `B(1, 1) = 0`, while `d(o, eᵗ·o) = |t|·|1|_o > 0` for `t ≠ 0`. Also `B|𝔞` is degenerate on `ℝ·1`.

**Repair:** Write `⟨·,·⟩_o` for the metric of Conventions at `o`. Then:
- Line 977: "a `⟨·,·⟩_o`-orthonormal pair".
- Line 982: "`d(g·o, h·o) = ⟨Y, Y⟩_o^{1/2}`, which is `B(Y, Y)^{1/2}` when `𝔤₀` is semisimple".
- Line 1037: "isometric to `(𝔞, ⟨·,·⟩_o|𝔞)`".
- Line 1045: "`|d_𝔞(x, y)|_o = d(x, y)`".

## R03 (P2) — Two headlines that the docstring calls unstatable are statable at the pins

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/Suggested.lean:27–28`: "the conjugacy of Cartan involutions (§0.2) and of hyperbolic elements (§2.4) under inner automorphisms: the pins have no inner automorphism group `Int(𝔤₀)` of a real Lie algebra".

**Claim:** Both theorems can be stated for `𝔤₀ = Lie(G)` through `TauCeti.Lie.Ad`, as `exists_titsSystem` already is. Two facts make this possible:
- `Ad(lieExp Z) = e^{ad Z}`;
- for connected `G`, `Ad(G) = Int(𝔤₀)` (§2.2).

**Witness:** The two statements below, added to a scratch copy of the Layer 2 section, elaborate with only `sorry` warnings. Kostant1973 lines 389–393 (Prop. 2.4, p. 422) state §2.4's result for any Lie group with Lie algebra `𝔤`.

**Repair:** Add the following to the `Group` section, then name both theorems in §0.2 and §2.4 and delete the docstring bullet.

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

## R04 (P3) — Cartan's fixed-point theorem drops the topological-group hypothesis that its Haar route needs

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/Suggested.lean:219`: "`{Λ : Type*} [Group Λ] [TopologicalSpace Λ] [CompactSpace Λ] [MulAction Λ M]`". `README.md:1005–1006`: "a compact group acting continuously by isometries … (Haar probability, CompactGroups)".

**Claim:** In the Lean statement `Λ` is any group carrying a compact topology. It is not required to be a compact topological group, which is what the README's statement and its Haar-probability route assume. The README and the Lean signature therefore differ in generality.

**Witness:** At the pin, `#check @MeasureTheory.Measure.haar` takes `[IsTopologicalGroup G]`. Without it there is no Haar probability on `Λ` to integrate against.

**Repair:** In `Suggested.lean:219`, insert `[IsTopologicalGroup Λ]` after `[TopologicalSpace Λ]`. The repaired file elaborates with only `sorry` warnings.

## R05 (P3) — §2.3's route skips the reduction from `G`-conjugacy to `K`-conjugacy

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:600–601`: "Prove that two elements of `𝔞` conjugate under `G` are conjugate under `W_G` (from the uniqueness of the middle factor of `kakDecomposition` modulo `W_G`)".

**Claim:** Uniqueness of the middle `KAK` factor applies to `k·exp(H)·k⁻¹ = exp(H')` with `k ∈ K`. For `g ∉ K`, `g·exp(H)·g⁻¹` is not a `KAK` factorization, so the step from `G` to `K` is missing from the route.

**Witness:** Kostant1973 lines 404–409 (p. 422) supply this step. With `g = kan`, `Ad(an)z − z ∈ 𝔫` and `𝔭 ∩ 𝔫 = 0`, which force `Ad(k)z = y`.

**Repair:** Replace the parenthesis by: "(by the Iwasawa decomposition `g = kan`: `Ad(an)H − H ∈ 𝔫` and `𝔭 ∩ 𝔫 = 0` give `Ad(k)H = H'`, Kostant, *On convexity, the Weyl group and the Iwasawa decomposition*, Proposition 2.4, p. 422; then `k·exp(H)·k⁻¹ = exp(H')` and the uniqueness of the middle factor of `kakDecomposition` modulo `W_G`)".

## R06 (P3) — Scope does not say how §5.4's conjugacy of Cartan data differs from ALS.0.1

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:1012–1013`: "and any two Cartan involution data on `G` are conjugate by an inner automorphism of `G`". Scope (lines 99–101) cites only ALS.F.1.

**Claim:** ALS.0.1 owns the conjugacy of the Cartan involutions of a connected reductive `ℝ`-group under its real points, and AF §2.3a consumes it. §5.4's clause includes that case for `G = 𝐇(ℝ)`, but no clause in Scope says how the two statements differ.

**Witness:** `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:1185`, at its open head: "`IsCartanInvolution.conj` — Any two Cartan involutions `θ, θ′` of `G` differ by `ad(g)`".

**Repair:** Add to "It leaves to other roadmaps": "- the conjugacy of the algebraic Cartan involutions of a connected reductive `ℝ`-group under its real points: ArithmeticLocallySymmetricSpaces ALS.0.1 (`IsCartanInvolution.conj`); §5.4 proves conjugacy of LieGroups `CartanInvolution` data, nonlinear finite covers included, and §0.2 the conjugacy of Lie-algebra Cartan involutions under `Int(𝔤₀)`."

## R07 (P3) — A Mathlib name and a Tau Ceti path in the supplier contracts do not exist at the pins

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:122` and `170`: "`LieAlgebra.killingForm`". Lines 236–237: "the real hyperbolic space (`TauCeti/Geometry/Hyperbolic/Hyperboloid/`)". Line 964: "(Tau Ceti's hyperboloid model)".

**Claim:** Mathlib's Killing form is the root-namespace `killingForm`, which `Suggested.lean` itself uses. Tau Ceti has no hyperboloid model.

**Witness:** `#check @LieAlgebra.killingForm` gives "Unknown constant", while `#check @killingForm` resolves. The pinned Tau Ceti has no `TauCeti/Geometry/Hyperbolic/` directory. Its real hyperbolic space is `TauCeti.UpperHalfSpace`.

**Repair:**
- Lines 122 and 170: replace `LieAlgebra.killingForm` by `killingForm`.
- Lines 236–237: "the upper half-space model `TauCeti.UpperHalfSpace` of real hyperbolic space (`TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/`)".
- Line 964: "the upper sheet of the hyperboloid, isometric after rescaling to Tau Ceti's `TauCeti.UpperHalfSpace`".

## R08 (P3) — §2.1, §3.1 and §4.2 still state theorems without a locator

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md`: §2.1 (lines 546–559), §3.1 (lines 678–701) and §4.2 (lines 805–812).

**Claim:** The previous review's R09 is only partly repaired. §0.3, §1.3, §3.2, §5.1 and §5.2 now have locators, but none of these three subsections cites a source at any claim.

**Witness:** Two examples with no source:
- Line 551: "the `G_i` commute pairwise and their product is `G`; with finite centre the multiplication map `∏ G_i → G` has finite central kernel".
- Line 809: "every subgroup containing `P` is closed; `Q_{Π'} = N_G(𝔮_{Π'})`".

**Repair:** At each claim, add the theorem number and page, taken from the text:
- §2.1: a locator for the almost-simple factors.
- §3.1: Knapp, Ch. VII §7, for `P = MAN` of a connected semisimple group with finite centre.
- §4.2: Knapp, Ch. VII §7, and Bourbaki, *Lie*, Ch. IV §2, for the parabolic subgroups of a Tits system.

## R09 (P3) — Two Eschenburg locators do not support the statement as written

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:926–927`: "the group generated by the `s_p` acts transitively (…; Eschenburg, §1, Theorem 1, p. 2)". Lines 955–956: "§6, p. 17, for simple connectivity and `X ≅ ℝⁿ` in noncompact type".

**Claim:**
- Theorem 1 says that a symmetric space is a homogeneous space with a symmetry at one point. It says nothing about the transitivity of the group generated by the symmetries.
- §6 proves simple connectivity only for isotropy-irreducible spaces with `λ > 0`. That is narrower than this roadmap's noncompact type.

**Witness:** EschenburgSymSpaces lines 49–52 give the midpoint argument, before Theorem 1 at line 63. Lines 676 and 703–716 assume isotropy irreducibility. `ℍ² × ℍ²` is of noncompact type but not isotropy irreducible.

**Repair:**
- Line 927: "(…; Eschenburg, §1, p. 2, the paragraph before Theorem 1)".
- Lines 955–956: "and §6, p. 17, for simple connectivity and `X ≅ ℝⁿ` when `X` is isotropy irreducible of noncompact type; in general both follow from `cartan_polar_decomposition`".

## R10 (P3) — Two definitions have only two Checks

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md`: §3.2 Checks (lines 729–731) and §5.1 Checks (lines 933–936).

**Claim:** §3.2 defines `𝔤^{(α)}`, `G^{(α)}` and `P^{(α)}`, and §5.1 defines the predicate "Riemannian symmetric space". Each definition has two Checks; the rule asks for at least three discriminating ones.

**Witness:** §3.2 has only the `SL₂(ℝ)` decomposition and the `SL₃(ℝ)` subgroup. §5.1 has only the model spaces and the torus/variable-curvature bullet.

**Repair:**
- Add to §3.2: "- `SO₀(n, 1)`, `n ≥ 2`: in real rank one the subalgebra generated by the restricted root spaces is an ideal, so `𝔤^{(α)} = 𝔰𝔬(n, 1)` and `G^{(α)} = G`; the rank-one decomposition is the two-cell Bruhat decomposition of `S^{n−1}`, and `N_G(𝔞)/MA` has order `2`."
- Add to §5.1: "- `ℝ² ∖ {0}` with the flat metric has `∇R = 0` but is not symmetric: a symmetry at `p` would have to be `x ↦ 2p − x`, which sends `2p` to the removed origin. A predicate tested only by parallel curvature would accept this space."

## R11 (P3) — The Ordering paragraph understates what Layer 0 needs

**Location:** `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:1101`: "Layer 0 needs LieGroups Layer 7 only for existence of Cartan involutions".

**Claim:** §0.2 also needs LieGroups Layers 2, 4 and 9, for `Int(𝔤₀)` and its adjoint `CartanInvolution` datum.

**Witness:** Line 346: "*Needs:* §0.1; Mathlib `LieDerivation.IsKilling.exists_eq_ad`; LieGroups Layers 2, 4 and 9." Line 402, Layer 0's Dependencies: "LieGroups Layers 2, 4, 7 and 9".

**Repair:** Replace lines 1101–1103, up to "needs it.", with: "§0.1, §0.3 and §0.4 need LieGroups Layer 7 only for the existence of Cartan involutions. They are otherwise self-contained Lie algebra and can be built first, with existence taken as a hypothesis in each statement that needs it. §0.2 needs LieGroups Layers 2, 4 and 9 for `Int(𝔤₀)` and its adjoint datum."

## R12 (P3) — The description narrows Layer 5 to noncompact type

**Location:** Pull-request description: "and Riemannian symmetric spaces `G/K` of noncompact type, with curvature, Cartan's fixed-point theorem, conjugacy of maximal compact subgroups, flats and quotients (Layer 5)".

**Claim:** At the head, Layer 5 treats abstract Riemannian symmetric spaces (§5.1) and `G/K` for every LieGroups `CartanInvolution` datum, reductive groups included.

**Witness:** `README.md:943`: "Let `G` carry a LieGroups Layer 9 `CartanInvolution` datum". Lines 155–156 give the metric "For reductive `𝔤₀`".

**Repair:** "and Riemannian symmetric spaces, with the symmetric space `G/K` of a real reductive group, its curvature, Cartan's fixed-point theorem, conjugacy of maximal compact subgroups, flats and quotients (Layer 5)".

## Verified sound

| Target | Instances | Values computed (both sides) | Result |
|---|---|---|---|
| Previous R01: `realRank` on reductive algebras | lines 481–486, 546, 640–641, 1040 | "not semisimple has no Cartan involution … `realRank 𝔤₀ = 0`"; the reductive count goes through `θ`; `GL_n` ℝ-rank is `finrank 𝔞` | repaired |
| Previous R02: Layer 9's root system | lines 93–96, 103–111 | "§1.1–§1.2 obtain these statements for `(𝔤₀, θ)` from Layer 9 and own only what Layer 9 does not state" | repaired |
| Previous R03: maximal compact subgroups | lines 99–101, 1010–1015 | "`K` is a maximal compact subgroup (LieGroups Layer 9)"; ALS.F.1 is in Scope, with how §5.4 differs | repaired |
| Previous R04: AF §2.3a class | lines 68–72, 685–689 | §2.3a is applied to `𝐆_ad(ℝ)` (real points, in the class), then restricted to `Int(𝔤₀) = 𝐆_ad(ℝ)°` | repaired |
| Previous R05: Tau Ceti names | lines 198–205, 556–558 | `killingForm_cartanInvolution_apply` and `iwasawaHomeomorph` resolve; LieGroups Layer 5A is cited for §2.1 | repaired; R07 is new |
| Previous R06: missing headlines | `Suggested.lean` lines 187, 214, 240 | three headlines added and the stand-in deleted; all three elaborate | repaired; R03 is new |
| Previous R07: padding | `Suggested.lean` | the nine theorems and two definitions are gone; every remaining definition occurs in a headline | repaired |
| Previous R08: file framing | `Suggested.lean` lines 14–16; README line 18 | "states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti"; no "Annals" left | repaired |
| Previous R09: locators | §0.3, §1.3, §3.2, §5.1, §5.2 | these now cite Eschenburg or Borel–Tits; §2.1, §3.1 and §4.2 still cite nothing | partly repaired: R08 |
| Previous R10: Checks | §1.4, §4.1–§4.4, §5.6 | three Checks each now | repaired; R10 is new |
| Previous R11–R12: *Needs:* lines, consumers | lines 370, 393, 1111–1114 | "§0.1; Mathlib's decomposition …"; "§0.1, §0.3; …"; AF, ALS and AdelicAlgebraicGroups dropped from consumers | repaired |
| Previous R13–R15: description | description | NoncompactQuantumSymmetry cites this roadmap; ALS.F.1 named as owner; "layers are the roadmap's own"; start list §0.1, §0.3, §0.4, §1.1 | repaired |
| §0.1 predicate | `𝔰𝔩₂(ℝ)` with `θ = −Xᵀ`; `θ = 1`; abelian `ℝ` | `B = 4 tr`, `B_θ(H, H) = 8 > 0`; `θ = 1` gives `−8`; on `ℝ`, `−B(x, θx) = 0`, not `> 0` | holds |
| §0.4 Killing constants | `𝔰𝔩₂`, `𝔰𝔬(2,1)`, `𝔰𝔭(4,ℝ)`, `𝔰𝔲(1,1)` | `2n = 4`; `p+q−2 = 1`; `2n+2 = 6`; `2(p+q) = 4`, matching `𝔰𝔩₂ ≅ 𝔰𝔲(1,1)` | holds |
| §1.1 root space decomposition | `𝔰𝔬(3,1)`; `𝔞 = 0` | `6 = 1 + 1 + 2·2`; `restrictedRootSpace ⊥ 0 = ⊤`, `Σ = ∅` | holds |
| §1.2 multiplicities | `𝔰𝔲(2,1)`; `𝔰𝔭(2,1)` | `1 + 1 + 2(2+1) = 8 = dim`; `6 + 1 + 2(4+3) = 21 = dim 𝔰𝔭(2,1)` | holds |
| §1.3 real rank | `𝔤𝔩₂(ℝ)`; `𝔲(2)`; abelian `ℝ` | `realRank 0`, `finrank 𝔞 = 2 = 1 + 1`; a reductive supremum would give `1`; `θ = ±1` give `0`, `1` | holds |
| §1.4 split forms | `𝔰𝔬(2,3)`, `𝔰𝔬(2,4)`, `𝔰𝔲(2,1)` | `𝔪 = 0`, `2 = 2`; `𝔪 = 𝔰𝔬(2)`, `2 < 3`; restrictions `2 + 2 + 1 + 1 = 6` | holds |
| §2.1 group real rank | `SL₂ × SU(2)`; universal cover of `SL₂(ℝ)` | rank `1 + 0`, one compact factor; rank `1`, noncompact, infinite centre | holds |
| §2.4 hyperbolic elements, split tori | `[[0,1],[1,0]]`; `GL_n`; Kostant Prop. 2.4 | conjugate to `diag(1,−1)`; split torus of dimension `n`, `groupRealRank 0`; source: conjugate into `𝔞`, one `W`-orbit, p. 422 | holds |
| §3.2 normalizer, big cell | `SL₂(ℝ)`; Borel–Tits 14.7 | the `(1,1)` entry of `n̄p` is `a`; source: `𝒩(S)_ℝ = (K ∩ 𝒩(S)_ℝ)·A`, `W = (K° ∩ 𝒩)/(K° ∩ 𝒵)`, pp. 147–148 | holds; Checks: R10 |
| §4.3 Langlands decomposition | `GL₃` of block type `(2,1)`; `Sp(4)` Siegel parabolic | `Z°·N_{Π'}` is connected, normal, abelian and `⊋ N_{Π'}`; `dim N = 10 − 7 = 3` | fails: R01 |
| §4.4 dynamical description | `SL₂`, `X = ±diag(1,−1)`, elliptic `X` | `[[1, xe^{−2t}],[0,1]]` stays bounded, the lower entry `ye^{2t}` does not; rotations give all of `SL₂` | holds |
| §4.5 algebraic comparison | `SL₂`, `ν(t) = diag(t, t⁻¹)` | `ν(t)gν(t)⁻¹ = [[a, t²b],[t⁻²c, d]]` has a limit at `t → 0` iff `c = 0`: upper triangular, `α(dν(1)) = 2` | holds |
| §5.2 `G/K` as a manifold | `SL₂/SO(2)`; Eschenburg Thm 3 and §6 | `g ↦ g·i`; source: `𝔭 → T_pS` is an isomorphism (p. 11); §6 assumes isotropy irreducible | locator: R09 |
| §5.3 curvature and distance | `SL₂/SO(2)`; `SO₀(3,1)`; `GL₂(ℝ)` with `Y = 1` | `−½`; `−1/(2(n−1)) = −¼`; `B(1,1) = 0` but `d(o, eᵗ·o) = |t|·|1|_o > 0` | fails: R02 |
| §5.6 quotients | `⟨diag(e, e⁻¹)⟩`; `{±1}`; `SL₂(ℤ)` | `d_hyp = 2`, Killing `√8`, radius `√2`; radius `0`; area `π/3`, Killing metric `2π/3` | holds |
| `exists_restrictedRootPairing` | `𝔰𝔲(2,1)`; zero algebra | `⟨2λ, H'_λ⟩ = 4`, `⟨λ, H'_{2λ}⟩ = 1`; `Σ = ∅`, and `span ∅ = ⊤` in `0` | holds |
| `finrank_eq_realRank` | `𝔰𝔩₃(ℝ)`; zero algebra | rank set `{2}`, `sSup = 2`; set `{0}` | holds |
| `realRank_eq_zero_iff` | `𝔰𝔲(2)`; `𝔰𝔩₂(ℝ)` | rank `0`, `κ(e₁, e₁) = −8`; rank `1`, `B(H, H) = 8 > 0` | holds |
| `groupRealRank_eq_zero_iff_compactSpace` | `SU(2)`; universal cover of `SL₂(ℝ)` | `0` and compact; `1` and noncompact; Weyl's theorem holds for any centre | holds |
| `exists_titsSystem` | `SL₂(ℝ)`; compact `G` | `B` upper triangular, `N` monomial, `W` of order `2`; `𝔞 = 0` gives `B = N = G`, `S = ∅`, every field satisfied | holds |
| `dynamicalParabolic_isClosed_lie` | `X = diag(1,−1)`; `X = 0` | `Q` upper triangular with Lie algebra `span(H, E)`, eigenvalues `{0, 2}`; `X = 0` gives `Q = G` | holds |
| `exists_forall_smul_eq_of_sectionalCurvature_nonpos` | `SO(2)` on `ℝ²`; `ℤ` translations | fixes `0`; noncompact, no fixed point; the Haar route needs `IsTopologicalGroup Λ` | R04 |
| `exists_maximal_isCompact_and_le_conj` | `SL₂(ℝ)`; order-6 `⟨[[0,−1],[1,1]]⟩` | `K = SO(2)`; fixed point solves `z² + z + 1 = 0`, `z = e^{2πi/3}`; the subgroup lies in its stabilizer | holds |
| Docstring §0.2, §2.4 | scratch statements through `TauCeti.Lie.Ad` | both elaborate with `sorry` only; Kostant states Prop. 2.4 for any Lie group with Lie algebra `𝔤` | R03 |
| §2.3 `W_G`-conjugacy route | `g ∉ K` | `g·exp(H)·g⁻¹ = exp(H')` is not a `KAK` factorization; Kostant's Iwasawa step (p. 422) gives `K`-conjugacy | R05 |
| §0.3, §1.3 Eschenburg | Lemma p. 17, proof of 7.1 p. 18, Thm 9 pp. 20–21 | unique simple-ideal splitting, permuted by `σ*`; nearest-point conjugacy of maximal abelian subalgebras of `𝔭` | hold |
| §2.3 Borel–Tits 14.4 | p. 146 | `G_ℝ = (G_ℝ)°·S_ℝ` for connected `G` with `S` a maximal split torus | holds |

- **Gate and dependency check:** the worker's gate passed every check at this head. My dependency check printed `depcheck: 206 roadmaps, 1904 edges, 0 problem(s)`, and nothing outside the folder changed.
- **Elaboration:** `lake env lean` on `Suggested.lean` gave 8 `sorry` warnings and nothing else. I ran `#check @` on all 19 declarations and compared each with the README. `groupRealRank` drops `FiniteDimensional`, `T2Space` and `BoundarylessManifold`, but its body uses none of them, so nothing changes.
- **Padding probe:** I tried each of the 8 theorems with `first | rfl | simp | infer_instance | trivial`; none closes. All 10 definitions occur in a headline.
- **Source locators checked against the text:** 13 (Eschenburg 8, Kostant 1, Borel–Tits 4). Eleven support the claim as written; two are imprecise (R09).
- **Library declarations:** 78 checked by `#check @` in a scratch file and 10 more read at source. All but `LieAlgebra.killingForm` exist. Of 15 cited Tau Ceti paths, one is absent (R07).
- **Cross-roadmap citations resolved: 22.** On main: LieGroups Layers 0–5, 5A, 7 and 9 (its `IwasawaData` has `restrictedRoots` and `restrictedRootSpace` fields), RiemannianGeometry 1.2, 1.3, R2, R4 items 1, 4, 6 and R5a, SmoothBundlesConnections B1.4, ReductiveGroups Layers 4 and 7, LieHighestWeight Layer 0, RootSystems, CompactGroups Layer 0, HopfRinow. At open heads: AF §2.3a, ALS.F.1, ALS.0.1–0.3.
- Overlap check: read AutomorphicFormsOnReductiveGroups, FlagVarieties (#2114), RiemannianGeometry (#2223–#2225), LieGroups, LieHighestWeight, RiemannianGeometry (main); third list empty. Owners: minimal parabolic `P = MAN`, AF §2.3a (cited, extended here to nonlinear groups); restricted root system and chambers, LieGroups Layer 9 (cited); `𝔰𝔩₂` strings, LieHighestWeight Layer 0; curvature, Jacobi fields, Cartan–Hadamard, RiemannianGeometry; FlagVarieties nothing shared; ALS.0.1, outside the lists, R06.

## Not verifiable

- Knapp2002 (uncertified, settled): every Knapp locator — VI §2, Thm 6.16, Cor 6.19, Prop 6.28, §§4–6, Prop 6.52, Thm 6.31, Thm 6.57, Prop 6.59; VII §§2, 7, Thm 7.40; App. C.
- Helgason, *Differential Geometry, Lie Groups, and Symmetric Spaces* (1978): the sources service found no legal source, and the work is not in the roadmap's `sources.toml`. Affected locators: I §13, III §7, IV, V, VI §2, VII §2, X.
- Eberlein, *Geometry of Nonpositively Curved Manifolds* (1996): the sources service resolves it only to a paywalled page, and it is not in `sources.toml`. Affected locators: Ch. 1, Ch. 2, §1.4.
- Warner1972, BorelJi2006 and BourbakiLieIV (uncertified, settled): §1.2; Ch. I.1; Ch. IV §2.

## Source issues

- **Misprint** in EschenburgSymSpaces at §1, p. 2: the source writes "any two points p, q ∈ M" for the symmetric space it calls S; it should be p, q ∈ S; affects nothing.
- **Misprint** in EschenburgSymSpaces at §2, p. 8: the source writes the reflected geodesic as s_p(γ(t)) = γ(−t); it should be s_m, the symmetry at the midpoint m = γ(0); affects nothing.
