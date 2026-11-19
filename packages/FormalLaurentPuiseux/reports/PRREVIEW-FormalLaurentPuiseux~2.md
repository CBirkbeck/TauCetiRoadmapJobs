# Review of FormalLaurentPuiseux (pull request #2558 at 234a7fd)

**Verdict:** needs changes

**Summary.** Changes are needed for one sentence: the Check of §1.5 states that the group of `2`-jets is not commutative, and over `R = 𝔽₂` it is commutative. Everything else I recomputed holds: the other 53 Checks, the worked examples, the eight pinned headline declarations against their README statements, and the absence from the pinned Tau Ceti of the targets listed as remaining. There are three small corrections (misplaced Frenkel locators, two ids cited from main that the new headings drop, hypotheses that differ in two summaries) and five format notes, none blocking. One fact about the pin is left for the human reviewers.

## R01 (P2) — The Check of §1.5 that the `2`-jet group is not commutative is false when `Rˣ = {1}`, for instance over `𝔽₂`

The section defines the jet groups over an arbitrary commutative ring `R`, and the roadmap's fields `K` include `𝔽₂`, so a reader takes "The `2`-jet group is not commutative" (line 262) as a statement about every `R`. It fails for `R = 𝔽₂`.

With the law the Check itself gives, `(a₁, a₂)(b₁, b₂) = (a₁b₁, a₁b₂ + a₂b₁²)`, which I recomputed from `φ(ψ)` modulo `t³`: over `𝔽₂` the only unit is `1`, so the elements are `(1, a₂)` and `(1, a₂)(1, b₂) = (1, a₂ + b₂)` in both orders. Taking `a₂ = 0`, `b₂ = 1` in the law shows more: the two products agree for all arguments exactly when `a₁ = a₁²` for every unit `a₁`, that is when `Rˣ = {1}`. The witness `2t` is a coordinate only when `2 ∈ Rˣ`; there the values `(1, 1)(2, 0) = (2, 4)` and `(2, 0)(1, 1) = (2, 2)` are correct and differ.

Smallest change: "When `2` is a unit in `R`, for instance over `ℚ`, the `2`-jet group is not commutative: …". The earlier review listed this point as a small correction; it is a finding here because the sentence, as written, asserts something false.

## C01 — Eight of the nine Frenkel locators point to §1.2, which does not contain what they are cited for

A reader who follows "(Frenkel, §1.2, …)" at §§1.1, 1.3, 1.4, 2.3, 3.1, 3.4, 3.5 and 3.6 (lines 111, 172, 231, 398, 465, 539, 579, 615) finds the Galois group of `ℂ((t))` (§1.2.1), flat bundles, regular and irregular singularities, and connections as Langlands parameters (§§1.2.2–1.2.6; FrenkelLoop lines 635–1020, pp. 9–18). There is no formal coordinate, no change of parameter at `0`, no one-form, no residue duality and no loop cocycle in that section. No stated result depends on these pointers, since each rests on a named declaration.

Frenkel treats the material elsewhere:
- formal coordinates, `a₀ = 0` and `a₁ ≠ 0`, and the composition law of Convention 7: §3.5.3, pp. 90–91 (FrenkelLoop lines 4059–4084), for §§1.3–1.4;
- `Der₀ O = t ℂ[[t]] ∂_t`: §3.5.4, p. 92 (lines 4116–4118), for §1.6 and §2.2;
- coordinate independence of the residue of `f dg`: §3.5.2, p. 90 (lines 4041–4042), which is the case `e = 1` of §3.1; the order-`e` formula is not in Frenkel;
- the residue pairing between `ℂ((t))/ℂ[[t]]` and `ℂ[[t]] dt` and its invariance under coordinate changes: §3.5.5, pp. 94–95 (lines 4279–4286), for §§3.4–3.5;
- the cocycle built from `Res f dg`: §1.3.5, Lemma 1.3.2, equation (1.3-3), p. 28 (lines 1412–1417), for §3.6.

Only the citation at §4.3 fits (§1.2.1, p. 9). Replace each locator by the matching one, or drop it where nothing fits (§1.1); the References entry (line 1674) would change with them.

## C02 — Two ids that roadmaps on main cite disappear with the new headings, and the README gives no old → new numbering

ClassicalArithmeticCompletion (its README on main, line 5499) links to the anchor `#l5-newton-polygons-and-formal-newtonpuiseux`; the heading `## Layer 5: Newton polygons and formal Newton–Puiseux` no longer produces it, so the link breaks at merge. PadicDifferentialEquationsAndRigidCohomology cites "FormalLaurentPuiseux §L3" (lines 454, 9757, 9773 and 9778 on main), and AlgebraicCurves, AffineLieAlgebras, FormalConnectionsOpers, PainleveEquations and NewtonPolygons cite "L1–L3", "L5", "L7" in the same style. The README never says that `Lk` is Layer `k`.

One sentence repairs the prose citations, for instance after the guide to the layers: "Layers L1–L7, as other roadmaps cite them, are Layers 1–7 below." An explicit `<a id="l5-newton-polygons-and-formal-newtonpuiseux"></a>` above the Layer 5 heading keeps the link. The description's sentence that citations of "L1–L3", "L5" and "L7" elsewhere "still resolve" is then true; at this head the linked one does not.

## C03 — Two summaries state headline results with hypotheses other than those of the declarations

The opening summary (line 19) calls the continuous one-forms "universal for continuous derivations into Hausdorff `F`-modules". §2.3 (line 406) and `TauCeti.ContinuousKaehlerDifferential.existsUnique_compDer_eq` also assume continuous scalar multiplication (`[ContinuousSMul (LaurentSeries K) M] [T2Space M]`). Add "with continuous scalar multiplication".

The Layer 6 bullet of the `Suggested.lean` docstring (lines 27–29) places the trace statement under "For such `K`", algebraically closed of characteristic zero, where "`e` nonzero in `K`" is automatic. The pinned `…ContinuousKaehlerDifferential.coeff_neg_one_equivLaurentSeries_trace` assumes only a field `K` and `NeZero (d : K)`, as §6.4 says. A separate sentence, "Over every field `K`, when `e` is nonzero in `K`, …", matches it.

## N01 — The remaining targets and the headline theorems of Layers 6 and 7 carry no source locator

The targets that remain (§1.2, the Hasse–Leibniz rule of §2.1, §§3.5–3.6, §6.1, §7.3) are the only statements not backed by a named declaration, and none has a locator. Frenkel §1.2.1, pp. 9–10 (FrenkelLoop lines 656–672) states the Layer 7 identification over `ℂ`; footnote 3 of §1.3.5, p. 27 (lines 1386–1389) gives the lattice topology on `g((t))` of §§3.5–3.6.

## N02 — "Mannaa–Coquand, §1" would be more useful as theorem locators

§5.2: Lemma 1.7, pp. 4–5. §5.3: Lemma 1.8 and Theorem 1.9, pp. 5–7; both assume the polynomial separable over `K((X))`, which the README's route (strict descent on the degree of one factor) does not need. §5.4: Corollary 1.10 and Lemma 1.13, pp. 7–8.

## N03 — The `Suggested.lean` docstring says that the file states the headline theorems and then that it states none of them

Lines 13 and 15–16. Line 13 could read "It records the roadmap's headline theorems by pinning the declarations that prove them."

## N04 — The Mathlib links in the References use commit `6b7abb3`, not the pinned `1b1ccf4`

Both files exist at the pin, so the links could point there.

## N05 — In §6.1, "`σ(u)/u` is a root of unity of `F`" names the wrong field

`σ(u)/u` is an element of the level `K((u))` with `n`-th power `1`; it is a constant because `K` is algebraically closed in `K((u))`. "A root of unity of `K((u))`, hence a constant" says this (line 956).

<details><summary>What was checked</summary>

The automatic checks passed on this head; the targeted build of `Suggested.lean` elaborates with no error and no warning; the check that every supplier is earlier in the merge order found no problem among 200 roadmaps and 2197 edges, with no upward or cyclic citation. The head is the one the earlier review read: that review had no findings, and its four small corrections and four format notes are all still open (its C04 is R01 here; the others are C01–C03 and N01–N04). I recomputed every Check and example, read both cited texts at all 12 inline locators, and checked every backticked library name by elaboration at the pins. Not verifiable: Dean Cureton's repository and the Zulip thread, which were not opened.

</details>

## Verified sound

| Statement | Instances tried | Computed values (README side) | Library or source side | Result |
|---|---|---|---|---|
| §1.2 convergence (sampled) | `t^(−j)`; partial sums of `∑ tʲ` | coefficients of `t^(−j)` eventually `0`, supports unbounded below: no limit; `∑ tʲ → (1−t)⁻¹` | `tendsto_laurentSeries_iff_coeff`; only `…_not_tendsto_single_neg_succ` (limit `0`) at the pin | sound; target absent |
| §1.3 / Conv. 7 substitution order | `φ = t+t²`, `ψ = 2t`; `φ = t²+t³` | `σ_φσ_ψ(t) = 2t+2t² = ψ(φ)`; `φ(ψ) = 2t+4t²`; `ord t⁻¹(φ) = −2` | `substAlgEquiv_mul : (φ*ψ).substAlgEquiv = ψ.substAlgEquiv * φ.substAlgEquiv` | sound |
| §1.4 coordinates | inverse of `t+t²`; `1+t` | `t − t² + 2t³ − 5t⁴ + 14t⁵` from `ψ+ψ² = t`; `1+t` excluded by `a₀ = 0` | Frenkel §3.5.3: `a₀ = 0`, `a₁ ≠ 0` | sound; locator C01 |
| §1.5 jet Check | `(1,1)(2,0)`, `(2,0)(1,1)`; `R = 𝔽₂` | `(2,4)` vs `(2,2)`; over `𝔽₂` `(1, a₂+b₂)` both orders | law recomputed from `φ(ψ)` mod `t³`; commutative iff `Rˣ = {1}` | false as written: R01 |
| §1.6 commutator sign | `a = t`, `b = t²` | `aDb − bDa = 2t² − t² = t²`; commutator `1 + e₁e₂t²D` | `infinitesimalSubstAlgEquiv_commutator_apply`: `f + (e₁e₂)•((a b′ − b a′) f′)` | sound |
| §2.1 derivative (sampled) | char `p`, `tᵖ + tᵖ⁺¹`; `(1−t)⁻¹` | `Df = tᵖ`, order `p ≠ p−1`; `(1−t)⁻²` | no Laurent `hasseDeriv_mul` in pinned Mathlib or Tau Ceti; `PowerSeries.hasseDeriv_mul` present | sound; target absent |
| §§2.2–2.3 one-forms (headline, sampled) | `[D,tD]`, `[tD,t²D]`; derivation killing `K(t)` | `D`, `t²D`; `dg − Dg·dt ≠ 0` in `Ω[F⁄K]`, in `ker λ` | `existsUnique_compDer_eq`: `T2Space`, `ContinuousSMul`, `IsScalarTower`; `equivLaurentSeries : … ≃L[F] F` | sound; summary C03 |
| §3.1 finite-map formula (headline) | `φ = t²`, `f = t⁻¹`; `φ = t²+t³`, `f = t⁻¹, t⁻², t⁻³` (char 2 too); `φ = tᵖ` | `2`; `2, 0, 0` (char 2: `coeff₃(1+t)⁻³ = −10 ≡ 0`); `0 = 0` | `…_eq_nsmul`: `φ.order.toNat • f.coeff (−1)`, hypotheses `constantCoeff φ = 0`, `φ ≠ 0` | sound |
| §3.2 coefficient identity | `u = 1+t`: `(e,k) = (1,1), (2,1)` | `−1 + 1 = 0`; `2 − 2 = 0`; identity rederived as `Res(φ^(−k−1)dφ)`, `φ = tᵉu` | pinned statement: `e ≠ 0`, `k ≠ 0`, any commutative ring | sound |
| §3.3 primitives (sampled) | `t⁻¹`; char `p`, `t^(p−1)` | coefficient of `t⁻¹` in `Dg` is `0·g₀`; of `t^(p−1)` is `p g_p = 0` | `range_laurentSeries_derivative` (char 0) | sound |
| §3.4 residue duality | orthogonal of `U_a`; `U₀/U₂` | `g_k = 0` for `k ≤ −1−a`: `U_(−a)`; pairs `1↔t⁻¹`, `t↔t⁻²` | `residueForm_nondegenerate` over `CommSemiring`; Frenkel §3.5.5 dual bases | sound; locator C01 |
| §3.5 vector-valued dual | `g = v*t⁰`; infinite-dimensional `V` | vanishes on `U_a(V)` iff `a ≥ 0`; `V((t))/U_a(V) = ⊕_(n<a) V`, dual a product, exponents `≥ −a` | `HahnModule.residueDualEquiv`: no finiteness; `tensorProductEquiv`: `Module.Free`, `Module.Finite`; no `CompleteSpace` instance | sound; targets absent |
| §3.6 loop algebras (sampled) | `(v t, w t⁻¹)`, `(v t⁻¹, w t)` | `−Φ(v,w)`, `+Φ(v,w)`; `Φ(Dx,y)` reverses both | Mathlib `residuePairing f g = ∑ a • Φ(f(−a), g(a))`; `residuePairing_single_single`: `n • Φ v w` if `m+n = 0`; no continuity of `HahnModule.derivative`; Frenkel (1.3-3) | sound; locator C01 |
| §4.1 ramified embeddings | `ι₂(u+u³)`, `ι₄(u²+u⁶)` | both `t^(1/2)+t^(3/2)`; `t^(1/2) = ι₄(u²)` | `ramifiedEmbedding : LaurentSeries R →ₐ[R] HahnSeries ℚ R` over `CommSemiring` | sound |
| §4.2 level colimit (sampled) | universe of the target | diagram in `CommAlgCat K`, target in the universe of `K` | `levelCoconeIsColimit : IsColimit (levelCocone K)`, `Field K` only | sound |
| §4.3 Puiseux field (sampled) | `t^(1/2)+t^(1/3)`; non-complete series | level `6`, no smaller; exponents `(j²+j+1)/(j+1)`, gcd `1` | Frenkel §1.2.1 p. 9: closure is the limit of `ℂ((t^(1/n)))` | sound |
| §4.5 valuation (sampled) | `t^(1/2)+t`; `3/2, 7/3, 13/4` | order `1/2`; `j²+j+1 = j(j+1)+1`, lowest terms | `not_completeSpace` for every field `K` | sound |
| §4.6 calculus | `D_t t^(1/2)`; `Res_u(t⁻¹dt)`; `ρ: t^q ↦ t^(q/2)` | `(1/2)t^(−1/2)` both ways; `n`; `Res = 1/2 = ord ρ(t)` | `residue_map_mul_derivation_eq_mul`: factor is the rational order of `ρ t`; `CharZero` | sound |
| §5.1 Newton polygons (sampled) | `Y²−t`; `(Y−t)(Y−t²)` | points `(0,1),(2,0)`, slope `−1/2`, initial `Y²−1`, `2−0 = 2`; points `(0,3),(1,1),(2,0)`, slopes `−2,−1` | `count_newtonSlopes_eq_natDegree_sub_natTrailingDegree_initialPolynomial` resolves | sound |
| §5.2 Hensel lifting | `Y²−(1+t)`; `Y²−t` | `s = 1 + t/2 − t²/8 + t³/16`; reduction `Y·Y` not coprime | `exists_monic_mul_eq_of_isCoprime` over `CommRing`; M–C Lemma 1.7 over a ring, no uniqueness | sound |
| §§5.3–5.4 Newton–Puiseux (headline, sampled) | char `p`, `Yᵖ−Y−t⁻¹`; degree 1; all `aᵢ = 0` | `y = ∑ t^(−1/pⁱ)`, `yᵖ = t⁻¹ + y`, support well-ordered, denominators unbounded; root `0` | `exists_isRoot_map_expand`: `IsAlgClosed`, `CharZero`, `degree ≠ 0`; M–C Lemma 1.8, Thm 1.9 assume separability | sound |
| §6.1 Kummer automorphisms | level 4, `η = −1`, `η = i` | fixed: `k` even (level 2); `k ≡ 0 mod 4` (`F`); `(iu)² = −t` | `kummer_surjective`, any field; `exists_eq_transition_comp_kummer` yields `n ∣ m` | sound; wording N05 |
| §6.2 finite extensions (headline) | `t^(1/2)+t^(1/3)`; `Y³−t` | degree 6; level 3, `3 ∣ 3!` | `nonempty_algEquiv_iff`: `finrank = e`; `mem_level_factorial…` needs `p ≠ 0` and all roots of unity | sound |
| §6.3 local invariants (sampled) | `v_u(t)`; `Tr(uᵏ)` | `exp(−d) = v_t(t)^d`; `d t^(k/d)` if `d ∣ k`, else `0` (diagonal of the multiplication matrix) | `ramificationIdx_maximalIdeal`, `inertiaDeg_maximalIdeal` resolve, any field | sound |
| §6.4 trace and residues (headline, sampled) | level 2, `u⁻¹du`; general `g` | `(1/2)t⁻¹dt`, both residues `1`; `Res_L = d·coeff_(u^(−d)) g = coeff_(−1) Tr g` | `…coeff_neg_one_equivLaurentSeries_trace`: any field, `NeZero (d : K)` | sound; docstring C03 |
| §6.6 Kummer action (sampled) | `t^(k/n)` unreduced; `ζⁿ` | `ζₙᵏ = ζ_(n/g)^(k/g)`; fixes `t^(k/m)` reduced iff `m ∣ n` | `fixedField_zpowers_kummer_pow … = level K n` for primitive `ζ` | sound |
| §7.1 Galois group of the Puiseux field (sampled) | stabiliser of level `n` | kernel of the `n`-th projection, coordinate in `nℤ̂` | `isGalois` needs only `HasEnoughRootsOfUnity`; Frenkel §1.2.1: limit of `ℤ/nℤ` | sound |
| §7.2 `Gal(F) ≅ ℤ̂` (headline) | `ζ′ = ζ⁻¹` over `ℂ`; coordinate `2` | coordinate `1 ↦ −1`; fixes level 2 | `absoluteGaloisGroupEquivZHat : … ≃ₜ* zHat`; `…_eq_gen_iff` for any `π` of order 1; `…_apply_eq_zpowHat` with `(zHatUnit)⁻¹` | sound |
| §7.3 uniformizers, parameter change, inertia (sampled) | `π = t(1+t)`; lift of `t ↦ t+t²`; `θₙ(ρσρ⁻¹)` | `σ(α)/α = σ(t^(1/2))/t^(1/2)`; `u ↦ u(1+uⁿ)^(1/n)` commutes with `u ↦ ζu`; `ρ(θ) = θ` as `ρ` is `K`-linear | `exists_pow_eq_of_isUnit`: `IsAlgClosed`, `(n : K) ≠ 0`; `decompositionSubgroup K A`, `inertiaSubgroup K A` exist; no inertia statement for the Puiseux field | sound; targets absent |

- Source locators: all 12 inline locators read (9 FrenkelLoop, 3 MannaaCoquand2013), plus Frenkel §§1.2.1–1.2.6, 1.3.5, 3.5.2–3.5.5 and M–C Lemmas 1.5–1.8, 1.11–1.13, Theorem 1.9, Corollary 1.10.
- Library: 465 backticked identifiers elaborated with `#check` at the pins; the only ones rejected are three scopes (`TauCeti.PowerSeries.WithValuationTopology`, `TauCeti.HahnModuleDualTopology`, `PowerSeries.WithPiTopology`), the external `PuiseuxSeries.isAlgClosure` and mathematical symbols. All 93 cited file paths exist at the pins.
- Files opened at the pins: Tau Ceti `RingTheory/LaurentSeries/Lattice.lean` (94–616), `Convergence.lean` (58–141), `HahnModuleDerivative.lean` (15–268), `Puiseux/Kummer.lean` (172–207), `Algebra/Lie/Loop/HahnModule.lean` (42); Mathlib `Algebra/Lie/Loop.lean` (127–189).
- Cross-roadmap citations resolved on main: AlgebraicCurves §§5.7 and 9.2, NewtonPolygons §§1.2, 2.1 and 3.2, Completed/ProfiniteArithmetic Layer 0, AffineLieAlgebras, FormalConnectionsOpers, PainleveEquations, ClassicalArithmeticCompletion line 5499, PadicDifferentialEquationsAndRigidCohomology lines 454 and 9757–9778.
- Dependency check (every supplier earlier in the merge order): 200 roadmaps, 2197 edges, 0 problems; no UPWARD or CYCLE line. Automatic checks: all passed.
- Elaboration: `Suggested.lean` elaborates with its 8 `#check` outputs, no error and no warning, no `sorry`, no `set_option`. It declares nothing, so no declaration can lose a section variable; each of the 8 pinned types was compared with its README statement and nothing differs beyond C03.
- Headline theorems (one-forms, finite-map formula, algebraic closure, finite extensions, trace and residues, `Gal(F) ≅ ℤ̂`): each is proved at the pin and pinned by name; none is restated, so the one-tactic probe has nothing to test. The description's counts (54 Checks, six Tau Ceti imports, eight pinned declarations) agree with the head.
- Change outside the folder: none.

Overlap check: read NewtonPolygons (main) and AffineLieAlgebras (main), plus the open RealSurfacePeriodIndex and HigherLocalClassFieldTheory, which mention the same objects; the lists of closest open roadmaps were empty. NewtonPolygons owns the general polygon geometry and consumes the Laurent specialisation, Hensel lifting and Newton–Puiseux owned here; `HahnModule ℤ K L` with its bracket is owned here and AffineLieAlgebras consumes it; the open roadmaps only consume `TauCeti.puiseuxField` and Layers 2–5. Nothing has two owners.

Source independence: 10 passages compared with 2 sources, none shared beyond forced formulas; largest share FrenkelLoop, 9 of 12 locators; contents compared with FrenkelLoop (Chapters 1–10) and MannaaCoquand2013 (§§1–3): independent.

Research link: Layers 1–3 and 7 are the formal-disc calculus (coordinate changes, the residue cocycle, `Gal(ℂ((t))) ≅ ℤ̂`) that Frenkel (2007) uses for the local Langlands correspondence for loop groups (FrenkelLoop §§1.2.1, 1.3.5, 3.5); Layer 5 is the Newton–Puiseux theorem as in Mannaa–Coquand (2013, after Abhyankar). Rests on the README's References and both texts read.

## Not verifiable

- Dean Cureton's Puiseux repository: not opened, so the name `PuiseuxSeries.isAlgClosure` and its licence were not checked.
- The Zulip discussion cited in the References: not opened.

## Source issues

- **Misprint** in MannaaCoquand2013 at Lemma 1.7, proof, p. 5 (line 146): the source bounds the degree of the second family of corrections by naming `G_ℓ` again; it should be `H_ℓ`, of degree less than `s`; affects nothing.
- **Misprint** in MannaaCoquand2013 at Lemma 1.8, proof, p. 5 (line 176): after removing the second coefficient, the source writes the reduction with `d₂` on `Y^(n−1)`; it should be on `Y^(n−2)`; affects nothing.

## For the human reviewers

- The pinned Tau Ceti is `2fd255d`. The folder's generated `PROGRESS.md` (lines 21–32) reports work up to `385ec2d` that proves targets the README still lists as remaining, for example completeness of `V((t))` and `inertiaSubgroup_eq_top`.
- `Suggested.lean` declares nothing: every headline theorem is already proved in the pinned Tau Ceti, and the file only pins eight declarations with `#check`.
- FrenkelLoop was read from the author's page at the URL in the References; its page numbers are those of that copy.
