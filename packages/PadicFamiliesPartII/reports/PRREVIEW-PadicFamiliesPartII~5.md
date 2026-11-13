# Review of PadicFamiliesPartII (pull request #2280 at 4ee1e27)

**Verdict:** needs changes

## R01 (P2) — The positive torus monoid is not free at Layer 7's generality

**Location:** `TauCetiRoadmap/PadicFamiliesPartII/README.md:280`: “For the positive torus monoid `T⁺(ℚ_p) ≅ T(ℤ_p) × ℤ^s × ℤ_{≥0}^{r−s}`, where r is the split rank of T and s the split rank of the centre of G”.

**Claim:** Layers 7–8 allow every Hodge-type datum with `G_{ℚ_p}` quasi-split (line 1124). The isomorphism fails there, so the contract asks the supplier for a monoid algebra that does not cover the functors of §§7.1b and 7.3.

**Witness:** `G* = {g ∈ Res_{F/ℚ}GL₂ : det g ∈ ℚ^×}`, F real quadratic, p split: r = 3, s = 1; `T⁺/(T(ℤ_p) × centre) = {(m,n) ∈ ℤ_{≥0}² : m ≡ n mod 2}`, irreducibles (1,1), (2,0), (0,2), with 2·(1,1) = (2,0)+(0,2).

**Repair:** Replace the opening of the contract by: “For the positive torus monoid `T⁺(ℚ_p) = {t ∈ T(ℚ_p) : v(α(t)) ≥ 0 for all α ∈ Φ⁺}`, the product of `T(ℤ_p)` and the finitely generated saturated submonoid `Λ⁺` of the lattice `T(ℚ_p)/T(ℤ_p) ≅ ℤ^r` cut out by the positive roots, construct …”, and its last sentence by “This scalar extension inverts `T⁺(ℚ_p)`, equivalently one element of `T^{++}(ℚ_p)`; …”. Add to the §7.1b Checks: for `GSp₄`, with cocharacters `(a,b;c)` and simple roots `a−b`, `2b−c`, `Λ⁺ ≅ ℤ × ℤ_{≥0}²` (the map to `ℤ²` is onto, kernel the centre); for `G*` above `Λ⁺ ≅ ℤ × {m ≡ n mod 2}`, with three irreducibles modulo units, is not of the form `ℤ^s × ℤ_{≥0}^{r−s}`, so a contract for free monoids would not supply it.

## Previous findings

- R01 — repaired: §6.1a (line 1057) states “`Z_{κ+(p−1)e_w}Ha_w = Ha_w Z_κ`”, the factorization through `ω^κ(−D̄_w)` for `l_w ≤ 0` and the eigenform vanishing; §6.2 cites it “since its w-weight is `3−p ≤ 0`”.
- R02 — partly repaired: both contracts are restored (lines 278, 280) and cited in §§7.1b, 7.3 and Layer 7 Dependencies; the restored monoid contract asserts a free shape that fails at Layer 7's generality (R01 above).

## Verified sound

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §6.1a weight shift | scalar weight (2,2) divided once by `Ha_w`; p = 3, 5, 7 | `(3−p, 3−p)` = (0,0), (−2,−2), (−4,−4); `k_w − l_w = 0`; all `l_w ≤ 0` | in the vanishing range | none |
| §6.1a `U_Kli = Z` mod p | `(p, l_w)` = (3,0), (5,−2); `l_w = 2` | `p^{2−l_w}` = 9, 625 ≡ 0; at `l_w = 2` coefficient 1, so equality fails there | agrees with §4.4 and BCGP21 p. 121 | none |
| §6.1a factorization | twist from `l_w′ = 2` to `l_w` = 0, −2 | power of dg supplied `2 − l_w` = 2, 4 ≥ 2, the square of BCGP21 Lemma 5.4.4; `l_w = 1` gives 1 < 2 | bound `l_w ≤ 0` needed | none |
| §6.1a vanishing | `g = h^n u`, u unit, β = 1 and β = 0 | after division order 0; β = 1 forces `u mod h = 0`, false; β = 0 gives 0 = 0 | β ≠ 0 essential | none |
| §6.2 first branch | `U_Kli = α+β`, `U_Iw = α` at `l_w = 2`; p = 3 | `Z f = (α+β−α) f = βf`; commutation gives `Zg = βg` at weight 0 | §6.1a applies | none |
| §7.1b infinitesimal weight | `E = ℚ₃`, λ = 1/3 on `ℤ₃^×`; λ = 1 | `χ(4)³/4` is a 3-power root of unity in `ℚ₃`, hence 1; cubes mod 9 are 1, 8, not 4; `x ↦ x` exists | Check correct | none |
| §7.1b finite slope | line with U = 0, U = 1 | localization dimension 0, 1; U = 0 is a monoid module, not a group module | Check correct | none |
| gap:solid-positive-monoid | `GSp₄`; `G*` for real quadratic F; `SL₂` | `ℤ × ℤ_{≥0}²`; `ℤ × {m ≡ n mod 2}`, 3 irreducibles; `ℤ_{≥0}` | free shape fails for `G*` | R01 |
| gap:infinitesimal-lambda-smooth | B with λ through `𝔟 → 𝔱`; λ = dχ | λ kills `[𝔟,𝔟] = 𝔫`, so Ad(B)-invariant; twist by `χ⁻¹` has trivial 𝔥-action | matches BCGP25 p. 68 | none |
| §7.3 (seeded, changed) | BCGP25 line 4426, p. 99; line 3134 | `CC_λ(M) = RHom_𝔤(M, RΓ^la)` with values in `D(Mod^{λ-sm}_{B(ℚ_p)}(E))`, 𝔟 acting by λ | locator and target category agree | none |

Rows for the untouched statements stand as in the previous review, of `de1cae2`.

- Source locators checked against the text: 9 (BCGP21 Lemmas 5.3.2, 5.4.1, 5.4.4, Propositions 5.4.2, 5.4.3, Corollary 5.4.5 at lines 5863–5958; BCGP25 Definition 2.2.26 line 1092, §4.1 line 3085, §4.6.46 and Remark 4.6.47 lines 4196–4234); 0 README locators flagged unverified.
- Seeded sample: of the 15 targets only §7.3 falls in a changed passage; checked at BCGP25 line 4426.
- Cross-roadmap citations resolved: LocallyAnalyticRepresentationsOfLocalGroups §3.4 (README line 685, solid group algebra of a group) and §3.5 (line 702, twist by a continuous character) at the head of its open pull request; both are as lines 271–272 describe them.
- Gaps: 18 in `design/plan.json`; the two restored slugs now appear in the README contracts with the plan's supplier and section.
- Gate: every counter 0, build OK. Dependency check: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`, no UPWARD or CYCLE line. `lake env lean` on `Suggested.lean`: exit 0, no output; 0 declarations, so no signature or one-tactic probe subject.
- Pull request text: title and description read against this head; the description names §6.1a and both restored contracts; 0 changes outside the folder; no sentence contradicted.
- Remark: the proof of BCGP21 Corollary 5.4.5 and the route of §6.1a take a maximal power of `Ha_w` dividing a nonzero form, which exists on the connected components where the form is nonzero.

Overlap check: read GSp4NonregularModularityLifting, AutomorphicBundlesPartII, AlgebraicModularFormsAndSerreWeightsPartII, OverconvergentAutomorphicForms, PerfectoidShimuraVarieties (the open list; the two other lists are empty); nothing shared by the changed passages; the solid monoid algebra and the infinitesimal λ-smooth category are handed to LocallyAnalyticRepresentationsOfLocalGroups §§3.4–3.5 by declared gaps.

Source independence: changed passages only; 6 passages compared with 2 sources (BCGP21, BCGP25), none shared; largest share BCGP21, as in the previous review; the diff adds §6.1a inside Layer 6 and adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- HigherHidaAndColemanTheory has no main or open-pull-request head; the changed passages cite no new section of it.

## Source issues

- **Error** in BCGP25 at §4.6.46, p. 94: the source says the positive torus monoid is the maximal compact times a free group times a free commutative monoid; it should be times a finitely generated saturated monoid, not free in general (e.g. determinant-rational Hilbert groups); affects nothing.
- **Gap** in BPS at Lemma 4.4.3, HAL p. 24: the source says the product of quotient maps is finite étale; it should be each coordinate map is finite étale, since the product target has larger dimension; affects the proof.
- **Misprint** in BCGP21 at Proposition 5.7.4, following paragraph, p. 130: the source says the restricted positive-weight section is δ⁻¹; it should be δ, with its inverse supplying the negative-weight multiplier; affects nothing.
- **Error** in BCGP21 at Remark 5.8.7, p. 135: the source says the operator algebra is local for every finite-dimensional M; it should be for nonzero M, since End(0) is the zero ring; affects a stated result.
- **Error** in BCGP21 at §6.4, p. 154: the source says the operator after the differential gains p to the differential order; it should be the differential after the operator gains that factor; affects the proof.
- **Misprint** in P20 at Proposition 13.3.3.1, p. 90: the source says the reflected equivariant operator is p^(−k−1)U; it should be p^(k+1)U, consistent with AIP15 Proposition 7.2.3; affects the proof.
- **Misprint** in BCGP25 at the paragraph after Definition 4.6.35, p. 88: the source says the contravariant functor preserves the cohomology index; it should be H^i of the image uses H^(−i) of the input; affects nothing.
- **Gap** in BCGP25 at Proposition 3.6.15, proof, pp. 66–67: the source says (1+x)∂+1 is injective on analytic germs; it should be nonvanishing on the constrained comparison fibre, since 1/(1+x) is killed; affects the proof.
- **Error** in BCGP25 at the proof of Lemma 3.4.6, pp. 53–54: the source says finite-dimensional representations of a semisimple group and its Lie algebra are equivalent; it should be those Lie-algebra representations integrable to that group; affects the proof.
- **Misprint** in BP26 at §1.1, p. 2: the source says M_µ is the unipotent radical of P_µ; it should be its Levi quotient, which indexes the algebraic coefficient representations; affects nothing.

## For the human reviewers

- **Scope.** Layers 7–9 use BCGP25, cited as arXiv:2502.20645v1 without a journal reference (References of `TauCetiRoadmap/PadicFamiliesPartII/README.md`). The other principal classicality and coherent-cohomology sources have journal references.
- **Licence.** P20 and BP26 use author-hosted versions; their pagination and version conventions are recorded in the References of `TauCetiRoadmap/PadicFamiliesPartII/README.md`. No source passages or figures are proposed for reuse.
