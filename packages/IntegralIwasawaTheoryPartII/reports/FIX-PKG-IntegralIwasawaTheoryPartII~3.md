# FIX-PKG-IntegralIwasawaTheoryPartII~3 — repair report

Review resolved: `REV-PKG-IntegralIwasawaTheoryPartII~2` (ten findings, R01–R10). Every finding was verified against the cited sources, the supplier roadmaps at their current heads and the pinned libraries, and every one was found correct. Files changed:

- `packages/IntegralIwasawaTheoryPartII/README.md`
- `packages/IntegralIwasawaTheoryPartII/Suggested.lean` (module docstring only)
- `packages/IntegralIwasawaTheoryPartII/sources.toml` (two version entries merged; `Lin12` and `AL13` added)
- `packages/IntegralIwasawaTheoryPartII/design/plan.json` (top-level `gaps` only: two gaps added, one `needs` widened)

## R01 (P1) — applied

Verified: over `ℚ`, level 8, weight 4, `(1_2,1_4)` and `(1_4,1_2)` both equal `E_4 − 9E_4|B_2 + 8E_4|B_4` (coefficients `1,0,28,0,126,0,344,0,757`). DDP11's passage is §2.3 (DDP11 line 1138) and holds only in its setting (lines 1157–1162). General basis: Lin12 (arXiv:1205.4063v1, certified) Proposition 3.2 and (5), lines 246–255, 297–306, citing AL13 Proposition 3.11 (uncertified) and W86 Proposition 1.5; `F = ℚ`, `k ≥ 3` is pinned Tau Ceti (`…/EisensteinSeries/Independence.lean:128`, `Dimension.lean:204`).

Changed (§2.2a, §2.6): imprimitive pairs with `𝔪_η𝔪_ψ = 𝔟` → primitive triples `(η,φ,𝔱)`, `𝔱𝔣_η𝔣_φ | 𝔟`, with §F.5's `B_𝔱`; basis for `k ≥ 3`, and `k = 2` when `F ≠ ℚ`; `F = ℚ`, `k = 2` via ModularForms §0.1; `U_𝔮`, Möbius and constant-term API; level-8 and `U_2` Checks; §2.6 route uses these at `k ≥ 3`.

## R02 (P1) — applied

Verified: NoncommutativeAndEquivariantIwasawa §F.5 and PadicFamilies §5.10 require "conductor `𝔫` prime to `p`" at their heads (§5.12: conductor = tame level). The `ℚ(√5)`, `p = 11` datum computes as stated (`Nα = 11`, `α ≡ 3 = 5²` and `≡ 0` at the two primes). Same pattern: §2.3's `M°(1, ω⁻¹)` is also outside that range.

Changed: Layer 2 conductor `𝔫` → `𝔫𝔣_p` (tame `𝔫`), level `𝔫·lcm(𝔣_p, ∏𝔮)`; new gaps `p-ramified-hilbert-coefficient-families` (§F.5) and `p-ramified-hilbert-hida-localization` (§§5.10–5.13) in plan.json and README; representation gap widened; Needs of §§2.2, 2.3, 2.6, 3.7, 4.1 and Layers 2–4 Dependencies updated.

## R03 (P1) — applied

Verified: CD14 lines 96–101 (weight space, `k ↦ x^k`), 1265–1270 (Proposition 4.3, (74): integrand `(Nx)^{−s}`, prefactor `(N𝔞𝔠)^{−s}` on the full weight space), 121–131 (principal restriction only in (3)).

Changed (§0.6): `⟨Nx⟩^{−s}` integral "interpolating `ζ^*(𝔞,−k)`" → `κ(N𝔞𝔠)⁻¹∫κ(Nx)⁻¹dμ_ℓ` on `𝒲`, interpolating at `x ↦ x^{−k}`; principal branch defined separately; comparison as meromorphic functions; factor a unit only among germs at `0`. Checks `−1/2` versus `0` and `1 + 3(−3)^{−s}` added; §0.8 "analytic unit" reworded.

## R04 (P2) — applied

Verified at the Tau Ceti pin: `TauCeti.koszulComplex` (`RingTheory/KoszulComplex/Basic.lean:219`), `…homologyZeroEquivSpan` (`:399`), `…exactAt_of_isWeaklyRegular` (`Regular.lean:140`), `tensorIso`/`tensorIsoAppend` (`Tensor.lean:319,340`); Mathlib `LaurentPolynomial` is one-variable.

Changed: Scope owns only the augmentation-sequence regularity, the `Rep` resolution, vanishing and the edge map; these four declarations were added to the Tau Ceti contract; §0.7 now uses `MonoidAlgebra ℂ_p T` and `RingTheory.Sequence.IsWeaklyRegular`; Needs and Dependencies updated; rank-two Check added.

## R05 (P2) — applied

Verified: in CD14 Theorem 4 (CD14 lines 224–228) the bound is `1/m` with `m` the tuple length, and CD14 lines 322–332 require absolute convergence of each truncation.

What changed: "finite tuples" → "nonempty finite tuples … of any length `m ≥ 1` independent of `n`", and the integrality theorem now names `m`. Added the empty-tuple negative Check: for `n = 1`, `Q = 1` and `∑1/|x|` diverges, while `Q = (X_1)` gives finite truncations. The `n = 2` single irrational form is kept.

## R06 (P3) — applied

Verified: `Λ_H` is finite over `𝒪_E[[T]]`, so it has dimension 2, with chain `(0) ⊊ (T,y) ⊊ (ϖ_E,T,y)`.

What changed in the §4.1 Check: "one-dimensional local domain" → "two-dimensional local domain". The Check now takes the localization at the height-one prime `(T,y)`. That prime is the unique one above `(T)`, and the localization is one-dimensional with residue field `E`. It then completes, with total quotient ring `E((T)) × E((T))`.

## R07 (P3) — applied

Verified: over `ℚ` there is one prime above `p`; `r = 1` puts it in `R`, so `R′ = ∅`, and Case 1 is impossible.

What changed in the Layer 2 Examples: "For `F = ℚ`, Case 1 with `r = 1`" → the `ℚ(√5)`, `p = 11`, `α = −4−√5` datum with its computed splitting, `R = {𝔮_1}`, `R′ = {𝔮_2}`, `D_χ = L(χ,0)`, and the same leading-correction formula. It also says that Case 1 does not occur over `ℚ`. The example needs the new p-ramified gap, which ties it to R02.

## R08 (P3) — applied

Verified: same authors and title; arXiv `1605.08169v1` and DOI `10.4007/annals.2018.188.3.3` are versions of one paper.

What changed:
- **sources.toml.** `DKV18` was merged into the original key `DKV16`. The entry keeps the published certified provenance (url, sha256, `publisher-open`), adds `doi`, `arxiv` and venue, and takes the union of `cited_for`. Its `version_note` records the arXiv v1 text (URL and sha256) and says that locators use the published pagination except for preprint Theorem 3.2, p. 16.
- **README References.** One `DKV16` entry with both identifiers and that rule. The in-text citations already distinguished the preprint.

## R09 (P3) — applied

Verified: `TauCeti.LFunctions.heckeLFunctionC` exists at the pin (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74`). It is defined for any number field and is `0` when no continuation exists. It was elaborated by `#check`.

What changed:
- **Suggested.lean docstring.** The complex Hecke `L`-function was removed from the absent carriers. The docstring now names the pinned carrier and says that the missing carriers are the Deligne–Ribet branch and the normalized Iwasawa logarithm on finite extensions of `ℚ_p`.
- **README LFunctions contract.** Now names the carrier and its zero fallback.

No declaration or import was added.

## R10 (P3) — applied

Verified: process narrative.

What changed: deleted "no roadmap on main, in the merge order or in an open roadmap pull request states the Sczech or Shintani cocycle, and this roadmap is its only consumer". The Scope bullet keeps the cocycle, smoothing, measures and comparison with IntegralIwasawaTheory §6.3. The search evidence is recorded under Ownership below.

## Checks run

- **Elaboration.** `lake env lean` on `packages/IntegralIwasawaTheoryPartII/Suggested.lean`, run from the content checkout, exited 0 with no output.
  - The file declares nothing, so the `#check @name` signature comparison has an empty domain and nothing in it changed.
  - A separate scratch `#check` file elaborated the library names newly cited in README and docstring: `groupHomologyIso`, `groupHomology.indIso`, `RingTheory.Sequence.IsWeaklyRegular`, `MonoidAlgebra`, `LaurentPolynomial`, `Fintype.linearCombination` and `TauCeti.LFunctions.heckeLFunctionC`.
  - The Tau Ceti Koszul and Eisenstein modules have no object files at the pin and are not imported by `Suggested.lean`, so they were not built. Their names and namespaces were checked in the pinned sources: `namespace TauCeti` / `namespace koszulComplex` around `Basic.lean:246–418`, `Regular.lean:134–140` and `Tensor.lean:62–370`; `namespace TauCeti.EisensteinSeries.CharIndex` in `Independence.lean`; `namespace TauCeti` in `Dimension.lean`.
- **Dependency check** (`gate --depcheck … --movable`): exit 0, output exactly `depcheck: 236 roadmaps, 2141 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The new edge to ModularForms points to a roadmap on main.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name found nowhere. The earlier lead, `Determinant.eq_of_charpoly_frobenius`, now resolves at IntegralHeckeAndGaloisDeterminants §4.1.
- **`sources check`:** 0 problems.
- **Scratch package gate** (copy under the scratch directory): every check is 0, including `tex`, `latex`, `target-ids`, `residue` and `round-labels`. The only failure is `git=1`, because the scratch copy is not a git repository.

No gate failures were listed in the brief.

## Ownership

These were checked by object with `roadmaps grep` over main and all open heads (Eisenstein complement or subspace, degeneracy translates, Eisenstein newforms, cusp-plus-Eisenstein decomposition).

- **HilbertModularForms.** Its open roadmap restricts its Eisenstein layer to even parallel weight and level one beyond a dimension count, and lists character or higher-level Eisenstein series as not built. It is also not earlier in the merge order.
- **ClassicalSerreModularity.** `I.1/nearly-ordinary-hecke-algebras` is quaternionic, for odd `p` and even degree, and states no basis. OrdinaryAutomorphicFormsAndModularityLifting §2.12 says that roadmap would use a decomposition; it does not state one.
- **`F = ℚ`.** The case is Tau Ceti's and ModularForms §0.1's, now cited as such.
- **Totally real basis.** So 2.2a remains owned here for a totally real field, as an extension of the elliptic case.
- **Koszul complex.** It is now consumed from Tau Ceti, not owned.
- **Sczech cocycle.** The evidence the R10 clause carried: no roadmap on main or at an open head states the Sczech/Shintani cocycle.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 2.2a basis | `ℚ`, `𝔟 = 8`, `k = 4`, `ψ = 1` | primitive: 4 translates, coefficients at `1,2,4,8`: `(1,9,73,585)`, `(0,1,9,73)`, `(0,0,1,9)`, `(0,0,0,1)`, unitriangular; cusps of `Γ_0(8)`: 4 | holds | negative Check for the imprimitive indexing |
| 2.2a imprimitive indexing | same | `(1_2,1_4)` = `(1_4,1_2)` = `E−9E\|B_2+8E\|B_4`, coefficients `1,0,28,0,126,0,344,0,757` (Möbius = direct); four pairs span 3 | old statement false | replaced by primitive triples |
| 2.2a level one | `ℚ`, `k = 4`; `k = 2` | `P = {(1,1,1)}`, `dim M_4(SL_2ℤ) = 1`; weight two over `ℚ`: no `t > 1`, `M_2 = 0` | holds with the weight-two rule | rule stated |
| 2.2a `p²` | `p = 3, 5`, even `k ≥ 4` | `3 + (p−2) = p+1`; cusps `4`, `6` | holds | Check rewritten |
| 2.2a weight 2 | `ℚ`, `𝔟 = 11` | `(1,1)` translates `t = 1, 11` → one series `E_2 − 11E_2(11z)`; `dim M_2(Γ_0(11)) = 2` | holds | Check rewritten |
| 2.2a weight 3 | `ℚ`, `𝔟 = 4`, `χ_4` | `T_3`: `1 − 9 = −8`, `−1 + 9 = 8`; `U_2`: `1` on `(1,χ_4)`, `4` on `(χ_4,1)` | holds (also the `m = 0` case of the `U_𝔮` bullet) | none |
| 2.2a `U_𝔮` | `ℚ`, `η = φ = 1`, `k = 4`, `𝔮 = 2`, `m = 1` | `U_2(E−8E\|B_2) = E−8E\|B_2` (coefficients `1,1,1` at `1,2,4`), `U_2(E−E\|B_2) = 8(E−E\|B_2)`; for `m = 2` the characteristic polynomial is `X(X²−aX+b)` | holds | Check added |
| 2.2a standard constants | `𝔣_η = 1` | `L(η⁻¹φ,1−k)` with sign `(−1)^k`: Γ-factors at `1−k` finite and nonzero, `L(·,k) ≠ 0` for `k ≥ 2` | nonzero | API bullet |
| 2.2a `B_𝔱` | `ℚ`, `E_4(tz)` | constant unchanged, `c(n, f\|B_t) = c(n/t, f)` | holds | none |
| 2.6 Chebotarev operator | `η ∉ {1,χ}` | weight-one eigenvalue `(1−η(λ))(1−χη⁻¹(λ))`; exists because `ker η ∪ ker(ηχ⁻¹) ≠ G`; weight-`k` value `φ(λ)Nλ^{k−1} = ν_k(η⁻¹χε(λ))` | holds | route rewritten |
| 2.6 `η = 1` removal | `k ≠ 1` near `1` | constant `2^{−[F:ℚ]}f_χ(1−k)` with `f_χ` a nonzero germ (0.5); DKV16 published p. 847 (DKV16 cache line 577) gives this constant | holds | route |
| Layer 2 conductor split | `ℚ(√5)`, `p = 11`, `α = −4−√5` | roots of `X²−5` mod 11: `4, 7`; `α ≡ 3` (a square: `5² = 3`) and `≡ 0`; `Nα = 11` | `R = {𝔮_1}`, `R′ = {𝔮_2}`, `𝔮_2 \| 𝔣_p` | new gaps; R07 example |
| Layer 2 Case 1 over `ℚ` | `r = 1` | one prime above `p`, in `R` | `R′ = ∅`, Case 1 impossible | example replaced |
| 2.3 `ω⁻¹` | `F = ℚ`, `p` odd | conductor of `ω⁻¹` is `p`, not prime to `p` | outside the §F.5 range | gap names `ω⁻¹` |
| 0.6 full vs principal | `ℚ`, `𝔣 = 1`, `p = 3`, `𝔠 = 2` | full `−1`: `(−3)(−2)(−1/12) = −1/2`; principal: `0` at all even `−k` (`ζ(−k) = 0`, `1−3^0 = 0`), which are dense, so `≡ 0` | old statement false | redefined; Check |
| 0.6 factor | `p = 2`, `χ = ω⁻¹ = χ_4`, `𝔠 = 3` | `⟨3⟩ = −3`, `χ(3) = −1`: `1 + 3(−3)^{−s}`, `4` at `0`, `0` at `1` (`= 1 − χω(3)`) | unit only as a germ | meromorphic statement; Check |
| 0.6 `𝒬` | `n = 1` empty tuple; `(X_1)`; `n = 2`, `X_1+√2X_2` | `Q = 1`, `∑1/\|x\| = ∞`, `m = 0`; truncation `0<\|x\|<t` finite; no rational zero | empty excluded, others kept | nonempty |
| 0.7 sequence | `r = 0, 1, 2`; `(1−π_1, 1−π_1)` | `r = 0`: empty, `K = ℂ_p[T] = ℂ_p`; `r = 1`: `ker(1−π) = 0`, `H_0 = ℂ_p`; `r = 2`: quotients `ℂ_p[π_2^{±1}]`, then `ℂ_p`; repeated element is `0` in the first quotient | weakly regular exactly for distinct variables | Check added |
| 4.1 ring | `Λ_H = 𝒪_E[[T]][y]/(y²−T²(T+p))` | finite over 2-dim, so dim 2; `Λ_H/(T,y) = 𝒪_E`; `√(T+p)` has `T`-coefficient `1/(2√p) ∉ 𝒪_E`, so a domain; completion of the localization: `(y−Ts)(y+Ts)` | the localization is 1-dim | wording |
| R08 merge | `cited_for` union | DKV16 ⊂ DKV18 lists | union = DKV18 list | merged |
| Lean docstring | `heckeLFunctionC` | `#check`: `RayClassCharacter 𝔪 → ℂ → ℂ`, any number field `K` | carrier exists | docstring |

## Sources

- **Added `Lin12`.** Linowitz, arXiv:1205.4063v1, open repository, certified. Locators: §2 p. 5; Proposition 3.2 and (5), pp. 6–7; Theorem 3.3, p. 6.
- **Added `AL13`.** Atwill–Linowitz, Ramanujan J. 30 (2013), DOI 10.1007/s11139-012-9418-2. The sources service resolved it only to a paywalled page, so it is uncertified. It is cited at Proposition 3.11 and Theorem 3.6, the locators Lin12 gives at lines 247 and 258; the guessed locator the service first recorded was replaced.
- **Merged `DKV18` into `DKV16`** (R08).
- `needs-references.toml`: none created; every text needed was readable or is settled as uncertified.

## For the maintainer

- **New supplier gaps for the intake.**
  - `p-ramified-hilbert-coefficient-families` on NoncommutativeAndEquivariantIwasawa §F.5.
  - `p-ramified-hilbert-hida-localization` on PadicFamilies §§5.10–5.13.

  The `needs` of `hida-family-representations-all-degrees` now also covers eigenfamilies of these and of the dyadic families. All three agree between plan.json and the README.
- **Dropped manifest key.** `DKV18` no longer exists; its records are under `DKV16`. The sources cache entry for the published text (sha256 `974e64…`) now belongs to `DKV16`.
- **New supplier edge.** ModularForms §0.1, a roadmap on main.
- **Numbering and names.** No section numbers changed and no Lean names changed. `Suggested.lean` declares nothing. No other roadmap cites this one.
- **Untrusted text.** No suspicious instruction was found in the review, the supplier READMEs or the sources read.
