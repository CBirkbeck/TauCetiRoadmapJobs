# FIX-PKG-HodgeClassesForJacquetLanglands~7

One review, `REV-PKG-HodgeClassesForJacquetLanglands~6`, with three findings. All three are right in
substance. F01 and F02 are applied differently, because each proposed repair is wrong in one clause
(below); F03 is applied as asked. Files changed: `packages/HodgeClassesForJacquetLanglands/README.md`
and the `needs` of the gap `shimura-matsushima-comparison` in
`packages/HodgeClassesForJacquetLanglands/design/plan.json`. `Suggested.lean`, `metadata.toml` and
`sources.toml` are unchanged.

## F01 (P2) — applied differently

Scope: "owns the realizations …" → "owns the cohomology … as compatible realizations"; new deferral
bullet (AutomorphicBundles §§0.1–0.2, 3.4, 3.5, 3.7, 3.8; ShimuraData §4.9). New subsection "From
TauCetiRoadmap.AutomorphicBundles". §0.2 cites AutomorphicBundles §§3.4/3.5/3.7/3.8; *Needs:* and
Layer 0 Dependencies updated. Gap: `𝕍_K` becomes an input, not a deliverable. Downstream consumers:
HilbertModularVarietiesAndShimuraCurves and AutomorphicBundles deleted.

**Verified.** AutomorphicBundles is an open new-roadmap pull request at order line 183; this roadmap
is at line 290. At its head, §0.1 `centralSplitQuotient` (line 419), §0.2 `ineffectiveFibreDescent`
(465), §3.4 `bettiCoefficientLocalSystem` (1424), §3.5 `etaleCoefficientLocalSystem` (1464), §3.7
`realizationComparison` (1552) and §3.8 `coefficientTensorHecke` (1576) state the local systems,
their comparison and their coherence, as the review says. ShimuraData §4.9 (its head, line 1018)
defines `Z_s(H)` and `H^c = H/Z_s(H)`.

**Why differently (1): the proposed gap wording.** It reads "(AutomorphicBundles §3.4 for a Shimura
datum, which is used and not built again; …)" inside the request to ArithmeticLocallySymmetricSpaces.
That roadmap is at order line 60. A contract that asks it to use AutomorphicBundles (line 183) would
be an upward dependency for that roadmap. The gap therefore names no later roadmap. It defines `𝕍_K`
as the descent of the constant sheaf `V` along `G(ℚ)` (the descent ArithmeticLocallySymmetricSpaces
already uses on `X_K`) and asks only for the Hecke action, the comparison, Matsushima and transfers.
§0.2 identifies `𝕍_K` with AutomorphicBundles' local system: on the component of `g`, both are
`Γ_g∖(X⁺ × V)`.

**Why differently (2): a false clause in the cited bullet.** §0.2 said "`Z(ℚ) ∩ K` acts trivially on
`V` for `K` small because `ρ` factors through `G/Z_s`". Counterexample, recomputed (it is also
AutomorphicBundles §0.1's own Check):

- Take `T = Res¹_{ℚ(∛2)/ℚ}𝔾_m` with trivial `h`. This is a compact Shimura datum of abelian type with
  rational weight.
- Its character module is the irreducible 2-dimensional `S₃`-module and `T(ℝ) ≃ ℂ^×`, so `Z_s = 1`.
- `u = ∛2 − 1` has minimal polynomial `x³ + 3x² + 3x − 1`, so its norm is `1`, and it has infinite
  order.
- So some `u^m` lies in every `K`, and `ρ = σ₁|_T` takes the value `(∛2 − 1)^m ≠ 1` on it.

The repair:

- §0.2 now assumes the fibre condition (AutomorphicBundles §0.2).
- It proves the condition when `Z°/Z_s` has equal `ℚ`- and `ℝ`-split ranks: its rational points are
  then discrete (Mil17 Theorem 5.26, Remark 5.27, p. 64, at Mil17 lines 2792–2807), and neatness kills
  the finite image.
- It notes that this covers every group of the roadmap: by AutomorphicBundles §0.1 the ranks agree
  when the centre splits over a CM field, and every centre here does (`Res_{F/ℚ}` of tori split by
  `E`). For `Res_{F/ℚ}B^×`, `Z/Z_s = 𝔾_m`.
- The cubic torus is a new negative-control Check.

**Repair test, recomputed.**

- For `T = Res_{ℚ(√2)/ℚ}𝔾_m` with trivial `ρ` at `K(3)`: `T(ℚ) ∩ K(3) = ⟨−ε⁴⟩`, since `ε` has order
  8 in `𝔽₉^×` and `ε⁴ ≡ −1`, so `−ε⁴ ≡ 1 mod 3`. The fibre condition holds trivially, `Sh_{K(3)}` is
  `8/8 = 1` point, and `(dim H⁰, dim H¹) = (1, 0)`.
- For `ρ = σ₁`: `Z_s = ker N` acts nontrivially, so `centralSplitQuotient_factor_iff` excludes it, as
  §0.2 does.

**Pattern.**

- §0.3 pulls the local system back and needs no new hypothesis: a stabilizer in `G(ℚ)` at a neat
  `K₁` maps into the stabilizer `Z_H(ℚ) ∩ K₂` of the image point, which acts trivially.
- No other passage claimed that construction.

## F02 (P2) — applied differently

Gap (README and plan `needs`): "`L²` of the compact quotient `G(ℚ)Z(ℝ)°∖G(𝔸)`" → `L²` of
`G(ℚ)A_∞∖G(𝔸)/K = ⊔_g Γ_g∖G(ℝ)¹`, with `Γ_g` cocompact in `G(ℝ)¹` (AdelicAlgebraicGroups §3.4;
AutomorphicSpectralTheory §4.7 per `Γ_g`). Each `A_∞`-weight summand of `V` is twisted by
`|χ|^{1/N}`; the text says why `G(ℚ)Z(ℝ)°` is not used. Two Checks added to §0.2.

**Verified.** In the review's witness, `(1,1; ε^{2m}) = ε^{2m}·(ε^{−2m}, ε′^{−2m})_∞ ∈ T(ℚ)T(ℝ)°`. The
closure of `ε^{2ℤ}` in `Ô^×` is an infinite compact group, hence uncountable, so it has a point `u`
outside `ε^{2ℤ}`. If `(1,1;u) = q·z_∞`, then `q` is a totally positive unit, so `q ∈ ε^{2ℤ}`: a
contradiction. The same argument works for every centre with `Z(ℚ)` not discrete. Also
`G(ℚ)Z(ℝ)° ∩ Z(𝔸) = Z(ℚ)Z(ℝ)°`, so `G(ℚ)Z(ℝ)°` is not closed either.

**Why differently.** The proposed `L²(⊔_g Γ_g∖G(ℝ)/Z(ℝ)°)` holds only `Z(ℝ)°`-invariant functions. A
central character can be unitary but nontrivial on the compact part of `Z(ℝ)°`, and such
characters are lost. Witness:

- Take `T = Res_{ℚ(i)/ℚ}𝔾_m`, `h(z) = z`, `ρ = σ₁` over `ℚ(i)` and `K` neat. Then `T(ℚ) ∩ K = 1`
  and `dim H⁰ = #Sh_K ≥ 1`.
- The cochains transform under `ℂ^×` by `z⁻¹`. `A_∞ = ℝ_{>0}` acts on `V` by `r`, and
  `|N|^{1/2}` restricts to `r` on it.
- After the twist the character is `|z|/z`, which is nontrivial on `S¹`.
- These functions live on the circles `T(ℚ)A_∞∖T(𝔸)/K`. On the finite set `T(ℚ)∖T(𝔸)/T(ℝ)K`
  they are zero, so the proposed space gives `0`.

Dividing only by `A_∞` (the notation of §ALS.0.4) keeps them. This is also how
ArithmeticLocallySymmetricSpaces §ALS.5b.1 sets up its `𝒞_V(G)`: an `A_∞`-character `ζ_V⁻¹`.

Why the new space is right:

- `Γ_g ⊂ G(ℝ)¹` by the product formula (`|χ(γ)|_p = 1` at every finite place).
- Compactness: `S_K` compact ⇒ `G^der` is `ℚ`-anisotropic ⇒ `G(ℚ)∖G(𝔸)¹` is compact. Both steps are
  AdelicAlgebraicGroups §3.4, at main.

**Repair test, recomputed.** For `T = Res_{ℚ(√2)/ℚ}𝔾_m` at `K(3)`:

- There is one `g` and `Γ = ⟨−ε⁴⟩`, with signs `(−,−)` and translation `4 log ε + 4 log ε = 8 log ε`
  of `log|a| − log|b|`.
- So `Γ∖T(ℝ)¹` is two circles of length `16 log ε`, exchanged by `(1,−1) ∈ T(ℝ)`.
- Its `T(ℝ)`-invariants have dimension 1, and `𝔤/𝔨_h = 0`, so `(H⁰, H¹) = (1, 0)`. This agrees with
  the review's count of 1.

**Pattern.** A search for `Z(ℝ)°` and for "compact quotient" finds no other quotient by `Z(ℝ)°`.
§7.1 takes the adelic quotient modulo the centre and §7.3 integrates over `Z(G̃)(𝔸)Z(F)∖Z(𝔸)`; both
divide by adelic points of the centre, which form a closed subgroup. §7.10 projects on the central
quotients of §7.4 (IP23 §10.4).

## F03 (P3) — applied

ClassFieldTheory contract: `sumLocalInv_eq_zero`, `eq_zero_of_localInv_eq_zero` →
`sumLocalInv_brLocalization_eq_zero`, `brLocalization_injective`.

Evidence: the ClassFieldTheory README on main maps the old names to these (table, lines 300–301). Tau
Ceti declares them at `TauCeti/NumberTheory/ClassFieldTheory/Global/Brauer/SumFormula.lean:135`
(`brLocalization_injective`) and `:142` (`sumLocalInv_brLocalization_eq_zero`). The other three names
resolve: `brauerSupport` (`Global/InvariantSum.lean:123`), `sumLocalInv` (`:172`) and
`exists_br_of_sum_eq_zero` (`Global/Brauer/Exactness.lean:98`). No other occurrence of the old names
is in the package.

## Checks run

- **Elaboration.** `lake env lean packages/HodgeClassesForJacquetLanglands/Suggested.lean`, run from
  the content checkout: exit 0. The output is exactly three `declaration uses 'sorry'` warnings, at
  lines 70, 81 and 95. The file is unchanged.
- **Signatures.** `#check @name` for all four declarations, in one scratch copy:
  - `IsExteriorStar` keeps `σ`, `H`, `vol`, `hkl`, `L`.
  - `existsUnique_isExteriorStar` keeps `[FiniteDimensional E U]`.
  - `comp_self` keeps `hH` and `b`.
  - `map_similitude` keeps `g`, `ν` and the similitude hypothesis.

  The types are identical to the recorded elaborated signatures and agree with §§1.3, 1.4 and 1.7. Nothing
  changed.
- **Dependency check** (`gate --depcheck … --movable`):

      depcheck: 246 roadmaps, 2262 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. AutomorphicBundles (183) precedes this roadmap (290).
- **Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name
  missing. The new names `centralSplitQuotient`, `centralSplitQuotient_factor_iff`,
  `ineffectiveFibreDescent`, `bettiCoefficientLocalSystem`, `etaleCoefficientLocalSystem`,
  `realizationComparison` and `coefficientTensorHecke` all resolve.
- **Sources.** `sources.toml` already records Mil17 with "Theorem 5.26 and Remark 5.27, p. 64", cited
  for §0.2. No new source, and no `needs-references.toml`.
- **Gaps.** The eight slugs still agree between the README and `plan.json`, and only the `needs` of
  `shimura-matsushima-comparison` changed. The edit was made in place, and a reparse confirmed that
  every other field is identical.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.2 "factors through `G/Z_s` ⇒ `Z(ℚ)∩K` trivial on `V`" | `Res¹_{ℚ(∛2)/ℚ}𝔾_m`, trivial `h`, `ρ = σ₁` | `Z_s = 1`; `N(∛2−1) = 1`; `σ₁(u^m) = (∛2−1)^m ≠ 1` for all `m ≥ 1` | false | fibre hypothesis added; Check |
| §0.2 sufficient condition (equal ranks) | `Res_{F/ℚ}B^×`; `Res_{ℚ(i)/ℚ}𝔾_m`; CM quartic `Res_{E/ℚ}𝔾_m` | `Z/Z_s = 𝔾_m`, `ℚ^×` discrete, `N(u) ≡ 1 mod 3 ⇒ N(u) = 1`; ranks `(1,1)`; `Z_s` = norm-one torus of `E⁺`, quotient ranks `(1,1)` | holds | none |
| §0.2 degenerate | trivial `ρ`; `d = 0`, `τ_k` with trivial centre | fibre condition vacuous; centre acts by `∏ z_v^{(2−k_v)+(k_v−2)} = 1` | holds | none |
| §0.2 identification with AutomorphicBundles §3.4 | component `X⁺ × {gK}` | stabilizer `G(ℚ)₊ ∩ gKg⁻¹ = Γ_g`; descent `Γ_g∖(X⁺ × V)` | equal | none |
| Gap: `G(ℚ)Z(ℝ)°` closed? | `Res_{ℚ(√2)/ℚ}𝔾_m` | `(1,1;ε^{2m}) ∈`; a limit `(1,1;u)`, `u ∉ ε^{2ℤ}`, `∉` | not closed | quotient replaced |
| Gap: `Z(ℝ)°`-invariant `L²` per level | `Res_{ℚ(i)/ℚ}𝔾_m`, `ρ = σ₁` | twisted character `|z|/z`; `H⁰` of dim `#Sh_K ≥ 1` against `0` | loses cohomology | `A_∞` used instead |
| Gap: `A_∞` space | `Res_{ℚ(√2)/ℚ}𝔾_m`, `K(3)` | `Γ = ⟨−ε⁴⟩ ⊂ T(ℝ)¹` (`|ε⁴ε′⁴| = 1`); 2 circles; invariants 1 | matches `(1, 0)` | none |
| Gap: `A_∞` space, CM torus | `Res_{ℚ(i)/ℚ}𝔾_m`, neat `K` | `T(ℝ)¹ = S¹`, `Γ_g = 1`; `e^{−iθ}` occurs | `H⁰` recovered | none |
| Gap: twist `|χ|^{1/N}` | `λ ∈ X*(A_∞)`, `χ|_{A_∞} = Nλ` | `(φμ)(ga) = φ(g)λ(a)⁻¹μ(g)λ(a)`; trivial on `G(ℚ)` by product formula | `A_∞`-invariant | none |
| Gap: `Γ_g ⊂ G(ℝ)¹`, cocompact | product formula; AdelicAlgebraicGroups §3.4 | `|χ(γ)|_∞ = ∏_p |χ(γ)|_p⁻¹ = 1`; `G^der` `ℚ`-anisotropic | holds | none |
| AutomorphicBundles §0.1 as quoted | CM-split centres above; cubic torus | ranks equal; cubic torus excluded (not CM-split) | consistent | none |
| F03 names | pinned Tau Ceti | `SumFormula.lean:135, 142` | resolve | renamed |

## Ownership and overlap

- **Local systems.** The Betti and `ℓ`-adic coefficient local systems, their comparison and their
  coherence are owned by AutomorphicBundles. It is an open new-roadmap pull request, earlier in the
  order, and it is now cited. What this roadmap keeps is unchanged: the cohomology as an object of
  `M_E^L`, its Hodge structure, the unramified and de Rham properties, the Hecke isotypic parts and
  Matsushima, Poincaré duality, and §0.3.
- **The gap.** It still asks ArithmeticLocallySymmetricSpaces (order 60) only for statements about
  cohomology on `S_K`, with no citation of a later roadmap.
- **Sections read at their heads this round:**
  - AutomorphicBundles: §§0.1, 0.2, 3.4–3.8 and its Conventions;
  - ShimuraData: §4.9;
  - AutomorphicSpectralTheory: §4.7;
  - ArithmeticLocallySymmetricSpaces: §§ALS.0.4 and ALS.5b.1.
- **Read on main:** AdelicAlgebraicGroups §3.4 and the ClassFieldTheory name table.

## For the maintainer

- AutomorphicBundles becomes a supplier: it is in the Needs of §0.2 and the Dependencies of Layer 0.
  It is earlier in the merge order, so the order needs no change.
- The contract `gap:shimura-matsushima-comparison` to ArithmeticLocallySymmetricSpaces has changed
  wording but keeps its slug, supplier and section:
  - `𝕍_K` is now a defined input, not a deliverable;
  - the spectral input is `L²(G(ℚ)A_∞∖G(𝔸)/K)`, twisted per `A_∞`-weight.
- No Lean name changed, and no id that other roadmaps cite was dropped.
- HilbertModularVarietiesAndShimuraCurves and AutomorphicBundles are no longer named as downstream
  consumers: both precede this roadmap in the order.
- No suspicious instructions were found in the review text.
