# FIX-PKG-NonordinaryCMSpecialValues~3

Repair round for the review `REV-PKG-NonordinaryCMSpecialValues~2` (eleven findings, R01–R11). I checked every finding against the cached sources, the supplier heads and the pinned libraries before editing. All eleven are correct and all are applied. Changed files: `packages/NonordinaryCMSpecialValues/README.md`, `packages/NonordinaryCMSpecialValues/Suggested.lean` (module docstring only) and `packages/NonordinaryCMSpecialValues/sources.toml` (the FINIS06 locator). `metadata.toml` and the `gaps` list of `design/plan.json` are unchanged.

## REV-PKG-NonordinaryCMSpecialValues~2/R01 (P1) — applied

Verified: KATO04 line 238 (Proposition 1.3(4)) requires degree prime to `c`; the printed (15.4.2), lines 5254–5255, has no such condition. With `a = (5)` and `h = [5]` on `ℂ/Z[i]`, `h_*(25(0) − E[5]) = 0`.
Old → new: §2.1's unrestricted isogeny law now requires the kernel to meet `E[a]` trivially (annihilator prime to `a`), with the norm's source and target stated. New negative Checks: `[5]` fails, `[2]` holds; for `E → E/E[2+i]`, `a = (2−i)` holds and `a = (2+i)` fails. Pattern: §2.2's norm compatibility states `a` prime to `6pf` and checks the kernel condition.

## REV-PKG-NonordinaryCMSpecialValues~2/R02 (P1) — applied

Verified: KATO04 lines 5385–5453, 5414–5417.
Old → new (§2.4): `H₁` → `H¹`, with tensor powers over `K`; `K(ψ(K×))` → the field of values on finite ideles; `per_ψ` now lands in `V_L(ψ) ⊗_L ℂ`; `a_v ψ(a)⁻¹` → `a_v^r ψ(a)⁻¹`. The false Check "`D⁰ = D¹` at `r = 1`" is replaced by filtration dimensions 2/1/0. New Checks: Frobenius at the inert prime 7, and triviality on `K×`.

## REV-PKG-NonordinaryCMSpecialValues~2/R03 (P2) — applied

Verified at the open heads:
- PadicFamilies §4.0.1 constructs the normalised `c`-theta unit (`c` invertible, prime to 6) with its divisor, base change, isogeny norm and Tate expansion. It is position 173 in the merge order, earlier than this roadmap (345).
- NoncommutativeAndEquivariantIwasawa §4.3 constructs Siegel-function elliptic units for CM curves over `Q` at split ordinary primes.

Old → new: §2.1 imports `_cθ_E` from PadicFamilies and keeps here only the CM refinement, `_{(c)}θ_E = _cθ_E`, the cocycle and the isogeny law. New PadicFamilies contract, with the degree condition; added to *Needs:* and Dependencies. The Scope claim "No earlier roadmap constructs elliptic units of CM curves" is replaced by both overlaps. KatoEulerSystems is not a supplier.

## REV-PKG-NonordinaryCMSpecialValues~2/R04 (P1) — applied

Verified: `IsCongrOne` (TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:316) is a valuation condition on `Kˣ`. In `Q(i)` with conductor `(1+i)³`, the elements `(1+i)^n` lie in distinct cosets.
Old → new: in §0.1, "subgroup of finite index of `K×`, dense in `ℂ×`" becomes density by weak approximation; the subgroup has infinite index, and density is what the argument uses. The `(1+i)^n` example is added as a Check.

## REV-PKG-NonordinaryCMSpecialValues~2/R05 (P1) — applied

Verified: FINIS06 lines 61–69 (type `(k,j)` means `λ_∞ = x^{−k}x̄^{−j}`).
Old → new: the §4.1 API bullet "`λ ↦ λ/N` … type `(−1,0)`" becomes `η ↦ η̄/N`, sending `φρ` to `φ̄ρ⁻¹/N`, whose archimedean component is `z̄⁻¹·zz̄ = z`. The unconjugated `φρ/N` has component `z̄`, type `(0,−1)`. A negative Check at `z = i` is added (`i` against `−i`). §5.1 and the Conventions were already correct and agree with this.

## REV-PKG-NonordinaryCMSpecialValues~2/R06 (P2) — applied

Verified: `Q(√−31)` has forms `(1,1,8)`, `(2,±1,4)`, so `h = 3`, and `3` is inert. Its class-group character has order 3 and `c = 0`.
Old → new:
- Conventions: `c = n + 1` now carries the hypothesis `p ∤ h_K`. When `p | h_K`, statements use the conductor exponent `c`.
- §1.3's Check "`c = 2` (order `p`)/`c = 3` (order `p²`)" is qualified the same way.
- The `Q(√−31)`, `p = 3` example is added as a §0.2 Check (sign `(−1)^0 = 1`).

Pattern: §6.5 cited §0.2 for "both parities of `c` occur infinitely often", which §0.2 had only under `p ∤ h_K`. A §0.2 API bullet now proves it with no class-number hypothesis, using `#Pic(O_{p^c}) = p·#Pic(O_{p^{c−1}})` for `c ≥ 2`. §6.5 cites that bullet. The Lean headline is unchanged.

## REV-PKG-NonordinaryCMSpecialValues~2/R07 (P3) — applied

Verified: with `P = {5}`, `α = 5`, `β = 0`, `c = 0`, the count is 6 at `q = 5` and 0 at `q = 25`.
Old → new: §6.1 "`c ≤ 0`: `M = 0` for every `q`" → for `c < 0`, `q > 1` the box is `{(0,0)}`; at `c = 0` it has nine points, the counts are 6 and 0, so "sufficiently large `q`" is needed. §0.3's "vacuously by no `F`" → setting `F(1)` arbitrarily gives both 0 and 1. No Lean added.

## REV-PKG-NonordinaryCMSpecialValues~2/R08 (P3) — applied

Verified: complex conjugation does not fix `i ∈ Q(i)`.
Old → new: §6.3's Check "`σ` is complex conjugation" is replaced by in-domain instances:
- `σ = id`;
- `σ(ζ₂₅) = ζ₂₅²` over `Q(√−7)`, which sends `φχ` to `φχ²`; both have `c = 3` and both values vanish.

`L(η̄,1) = L(η,1)` is kept as a separately labelled compatibility, proved by reindexing ideals; it is not an instance of the theorem.

## REV-PKG-NonordinaryCMSpecialValues~2/R09 (P1) — applied

Verified: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` has §2.2 (line 635), §2.3 (657), §2.4 (688), §4.3 (1066) and §4.4 (1101). None of the five slugs and no `LT.n` label occurs there. Its consumer line (1859) names §§2.2–2.4 and 4.3–4.4 for this roadmap.
Old → new: every slug and `LT.2`/`LT.4` label now points to the section number and title. This covers the Scope, the contract (heading now "From TauCetiRoadmap.…"), §§2.5, 3.1, 3.3 and 3.5, the §3.5 Check, and the Layer 2 and Layer 3 Dependencies. §2.5 uses §§2.1–2.2 (finite-height torsion and Tate module over a general base). No new gap is needed.

## REV-PKG-NonordinaryCMSpecialValues~2/R10 (P3) — applied

Verified at the pin: `TauCeti.ClassFieldTheory.ringClassField` (TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111), `ringClassArtinEquiv` (178), `finrank_ringClassField` (222) and `ncard_primesOver_ringClassField_eq_finrank_iff` (251).
Old → new:
- The `Suggested.lean` docstring no longer lists ring class fields as missing. It now names the missing ingredients: Lubin–Tate modules, and the CM curve attached to `φ` with its torsion fields.
- The README's Tau Ceti contract cites these declarations, and §3.3 *Needs:* cites the splitting criterion.

## REV-PKG-NonordinaryCMSpecialValues~2/R11 (P2) — applied

Verified: FINIS06 line 893 (`b_ℓ = 0` for split `ℓ`), lines 918–940 (the Gauss sum `W̃` of Proposition 3.7), lines 1141–1142 (`v_ℓ(W̃) = v_ℓ(W_ℓ(λ))`) and lines 854–868 (Lemma 3.5, Proposition 3.6).
Old → new: §4.1 sets `b_ℓ = 0` for split `ℓ` and adds the `Q_{>0}/N(K×)` parametrisation. §§4.2–4.3 separate the integer `d` from the ideal `𝔡`. §4.3 states the eigenfunction and pairing domain, that `b_ar ≠ 0`, the definition of `W̃`, and the split identity in `W_ℓ(λ)`. Checks: the lower bound carries `W̃`; split `ℓ = 11`; inert `ℓ = 5`.

## Checks

- **Elaboration.** `lake env lean` on `packages/NonordinaryCMSpecialValues/Suggested.lean`, run from the content checkout: exit 0, exactly three `declaration uses 'sorry'` warnings (lines 130, 140, 166), no other diagnostic. The imported `TauCeti.*` object files were present, so no targeted build was needed.
- **Binder check.** I put a scratch copy with `#check @name` for all ten public declarations through one elaboration. All ten elaborated types are unchanged from `signatures.md` and agree with the README statements. Only the module docstring of the Lean file changed this round. The section-local instance `factPrime` is unchanged.
- **Dependency gate** (`gate --depcheck … --movable`), complete output:

  ```text
  depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The new edge is PadicFamilies, position 173, earlier than this roadmap.
- **`roadmaps resolve` on the README.** No Lean name was found nowhere. It flagged one cross-roadmap lead: "LubinTateFormalModulesAndQuasiCanonicalLifts §2.1: no roadmap … on main or in an open pull request". That roadmap is a board package at merge-order position 344, just before this roadmap (345); it is in this roadmap's permitted supplier list, and §2.1 exists in its README (line 605). The lead appears because the citation is now parsed as a section number; it is not a defect. I checked the Tau Ceti names manually at the pin (the resolver did not check pinned packages).
- **Text scan.** No gate failures were listed for this round. No machine path, LaTeX delimiter, pull-request number or process word is in the README or the Lean file.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 congruence subgroup | `Q(i)`, `f = (1+i)³`, `x = (1+i)^n` | `v_{(1+i)} = n`, so the cosets are pairwise distinct; weak approximation gives `x ≡ 1 mod f` with `|x − z| < ε` | finite index is false; density is true | R04 |
| Conventions / §0.2 `c = n + 1` | `Q(√−7)`, `p = 5`; `Q(√−31)`, `p = 3` | `#Pic(O_5) = 6`, `#Pic(O_25) = 30` (5-part 5), so order 5 has `c = 2`; `h = 3` with an unramified order-3 character gives `c = 0 ≠ 2` | needs `p ∤ h_K` | R06 |
| §0.2 class-number-free parity | `Q(√−7)`, `p = 5`; `Q(√−31)`, `p = 3`; `Q(i)`, `p = 3` (unit index 2) | `#Pic` = 6, 30, 150; 12, 36, 108; 2, 6, 18: each ratio is `p` for `c ≥ 2` | every `c ≥ 2` occurs | added bullet |
| §0.3 `HasCentralValue` Check | `F` equal to the product on `Re s > 3/2`, `F(1) := 0` or `1` | two candidate values without holomorphy; one by the identity theorem | old Check was illogical | R07 |
| §1.3 sign Check | `p = 5`, `h = 1`: `c = 2, 3`; `p = 3`, `h = 3`: `c = 0` | signs `+1`, `−1`, `+1` | qualified | R06 |
| §2.1 isogeny law | `ℂ/Z[i]`, `a = (5)`: `h = [5]`, `[2]`; `a = (2 ∓ i)`, `h` with kernel `E[2+i]` | `[5]`: `25(0) − 25(0) = 0`, against degree-0 `25(0) − E[5]`; `[2]`: `25(0) − E[5]`; `E[2+i] ∩ E[2−i] = 0`, so the law holds at degree `5 = N(a)`; `a = (2+i)`: `5(0) − 5(0) = 0` | kernel condition needed; a degree condition would be wrong | R01 |
| §2.1 comparison | `a = (c)`, `b = (d)` | `pr₁ = [c]`, `N(a) = c²`, giving Kato's 1.3(2) | holds | added |
| §2.2 norm compatibility | kernel `p^n f/p^{n+1}f ≅ O_K/p`, `a` prime to `6pf` | `(ker)[a] = 0` | holds | R01 pattern |
| §2.4 realisation | inert 7 on `y² = x³ − x`; `x ∈ K×`; `r = 2`, `a_v = 6`; filtration at `r = 1, 2` | `H¹`: `−1/7`, twist `−7 = 49/(−7)`, `H₁`: `−7`; `x^r·x^{−r} = 1` against `x^{1−r}`; `36` against `6`; dimensions `2/1/0` and `2/1/1/0` | `H₁`, `a_v`, `D⁰ = D¹` were wrong | R02 |
| §4.1 norm twist | `z = i` | `φ̄/N ↦ i`, type `(−1,0)`; `φ/N ↦ −i`, type `(0,−1)`; `(φ̄ρ⁻¹/N)* = φ̄ρ⁻¹/N` | conjugation needed | R05 |
| §4.3 `W̃`, `b_ℓ` | split `11` in `Q(√−7)` (`−7 ≡ 2²`); inert `5` (`−7 ≡ 3`, a nonsquare) | `W̃ = 1`, `v = 0`, `b = 0`; choice 11 shifts by 1; `b_5 = 0` when unramified | identity now determined | R11 |
| §4.3 denominator | `ϑ_λ ≠ 0` | `b_ar` is a nonzero multiple of `⟨ϑ,ϑ⟩ > 0` (Lemma 3.5, `ϑ† = γϑ`, `|γ| = 1`) | nonzero | R11 |
| §6.1 box Check | `P = {5}`, `α = 5`, `β = 0`; `c = 0`, `q = 5, 25`; `c = −1/2`, `q = 25` | counts 6, 0; `t = 1/5`, giving box `{(0,0)}` and count 0 | `c = 0` case was wrong | R07 |
| §6.3 Galois Check | `σ = id`; `σ(ζ₂₅) = ζ₂₅²` over `Q(√−7)`; conjugation on `Q(i)` | `χ²` has order 25 and `c = 3`, `W = −1`, both values 0; `i ↦ −i` | conjugation is out of domain | R08 |
| Lubin–Tate citations | `p = 5`, `q = 25`, `m = 1, 2`; `a_{p²} = −10` | degrees 24 and 600; `s = −1`, `#Ē(F₂₅) = 36` | agree with §§2.3, 4.4 | R09 |
| §3.3 splitting | `pO_K = (p)`, `p ∈ O` | `ncard_primesOver_ringClassField_eq_finrank_iff` gives complete splitting | native | R10 |

## For the maintainer

- **Ownership.** PadicFamilies §4.0.1 (open head) owns the normalised theta unit and is now a supplier, earlier in the merge order. NoncommutativeAndEquivariantIwasawa §4.3 (open head) owns the Siegel-function CM elliptic units for `h_K = 1` at split ordinary primes; this roadmap does not consume them and owns only Kato's CM refinement and the inert application. I searched ownership against open pull requests with `roadmaps grep` for theta units and elliptic units.
- **Possible supplier defect, not settled here.** PadicFamilies §4.0.1's isogeny-norm Check is stated without the degree-prime-to-`c` condition (Kato's Proposition 1.3(4)). This roadmap assumes only the restricted law.
- **Renamed heading.** The §2.1 heading is now "The CM refinement of Kato's theta function"; its number is unchanged. AnticyclotomicLocalUnits, InertAnticyclotomicCMMainConjecture and ModularIwasawaMainConjecturesPartII cite this roadmap by its design labels `NCM.0`–`NCM.5`, not by heading, so no citation breaks. Those labels remain a downstream coordination item that this package cannot settle.
- **Missing sources.** No source request was needed. `needs-references.toml` was not written.
