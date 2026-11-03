# Review of HilbertModularSurfaces (pull request #1730 at b5d5320)

**Verdict:** needs changes

Four findings: one P2 and three P3. The worker's gate at this head passes every check. Locations abbreviate `TauCetiRoadmap/HilbertModularSurfaces/README.md` as README and `TauCetiRoadmap/HilbertModularSurfaces/Suggested.lean` as Lean. This is a full review: the six findings of the previous review were checked first (all repaired, table below), then every passage was reviewed, changed or not. The worktree was not edited.

## R01 (P2) — The supplier table cites AutomorphicBundles, which is later in the merge order

**Location:** README:84, "Cusps and stabilizers of the ramified splitting model at prime-to-`p` level | AutomorphicBundles B3.Hilbert.0a".

**Claim:** This is a supplier-table citation of a roadmap that the merge order places after this one, so it is an upward supply edge; the dependency check does not see it because it reads only `*Needs:*` lines.

**Witness:** The merge-order candidate lists HilbertModularSurfaces at line 147 and AutomorphicBundles at line 167; the brief's list of permitted earlier suppliers ends at ShimuraCompactifications and does not contain AutomorphicBundles. The README cites AutomorphicBundles only at lines 84 and 117: no `*Needs:*` line, layer, Check or worked example consumes B3.Hilbert.0a (its own head identifies B3.Hilbert.0a with its §7.2, the prime-to-`p` splitting-model cusps, which no target here uses).

**Repair and retest:** Delete the table row at README:84. Keep the deferral sentence at README:117 ("automorphic bundles: ShimuraVarieties, ShimuraCompactifications, AutomorphicBundles"), which assigns ownership away and is not a supply edge. After the deletion the only roadmap suppliers in the table and in the `*Needs:*` lines are HilbertModularVarietiesAndShimuraCurves (145), ShimuraCompactifications (146), ShimuraVarieties (91), AutomorphicSpectralTheory (80), NeronModelsAndSemistableAbelianVarietiesPartII (50), HilbertModularForms (not yet in the order; its README cites this roadmap only as a downstream consumer, lines 187, 516, 2454, 2601 of its head) and roadmaps on main; the dependency check stays at `0 problem(s)`.

## R02 (P3) — §3.3 states the list of possible orders without a locator

**Location:** README:1030–1040, "the order of an elliptic point lies in `{2, 3, 4, 5, 6}` … For `Γ₀(𝔑)_𝔟` the orders lie in `{2, 3, 4, 5, 6, 12}` … *Needs:* 3.2; Mathlib cyclotomic fields, 0.1."

**Claim:** Every target carries a locator; this one has none, although it corrects its secondary source.

**Witness:** `assaf` lines 628–632 (Lemma 4.1.1, preprint p. 13) give `1 < q ≤ 6` in both cases; the order-twelve case over `ℚ(√3)` with the unit `ζ₁₂(1+i)/(1+√3)` is the roadmap's own correction (I checked it: its square is `i/(2+√3)`, a unit, and its relative norm is `2/(1+√3)² = 2 − √3`).

**Repair:** Cite Lemma 4.1.1(a)–(b) of Assaf et al. (preprint p. 13) for the determinant-one list and the `2 ∣ q` reduction, and van der Geer, Chapter I, §5 (uncertified) or Prestel (uncertified) for the elliptic-point orders; say in one clause that the order-twelve case is proved here, and add it to the Source issues as the previous review did.

## R03 (P3) — The Γ₁ cusp-type derivation needs a representative normalisation it does not state

**Location:** README:677–680, "in the stabilizer element `γ⁻¹(v m; 0 1)γ` of Assaf et al. (3.3.10) the lower-right entry is `≡ 1 mod 𝔭` at `𝔭 ∣ 𝔐` and `≡ v mod 𝔭` at `𝔭 ∣ 𝔑/𝔐`".

**Claim:** The congruence at `𝔭 ∣ 𝔑/𝔐` holds only for representatives with `a ∈ 𝔭`; convention 4 normalises only `𝔰` coprime to `𝔑`.

**Witness:** With `γ = (λ μ; −c a)`, `λa + μc = 1`, the lower-right entry of `γ⁻¹(v m; 0 1)γ` is `1 + cμ(v − 1) + mac` (`assaf` lines 520–534, display (3.3.10)). At `𝔭 ∣ 𝔑/𝔐` one has `cμ ≡ 1 − λa`, which is `≡ 1` exactly when `a ≡ 0 mod 𝔭`; for `a` a unit at `𝔭` the entry is `≡ 1 + cμ(v−1)` with `cμ` depending on the choice of `(λ, μ)`. The set `V` itself is choice-independent, so the row is right; the sketch is not.

**Repair:** Add to the sentence that the representative is first moved by a translation of `Γ₁` so that `a ∈ 𝔑/𝔐` (possible because `c𝔟⁻¹` is a unit at those primes), or cite Assaf et al.'s affine change of variables (`assaf` lines 536–543) instead of asserting the congruence for every `(λ, μ)`. Then at `𝔭 ∣ 𝔑/𝔐` the entry is `v + mac ≡ v` because `(mac)² ∈ 𝔑` forces `mac ∈ 𝔑` for squarefree `𝔑`, and at `𝔭 ∣ 𝔐` it is `1 + mac ≡ 1` because `cμ ∈ 𝔐`.

## R04 (P3) — Tau Ceti line locators in the total-positivity contract do not match the pin

**Location:** README:265–268, "`NumberField.IsTotallyPositive`, `isTotallyPositive_iff`, `IsTotallyPositive.mul`, `.inv`, `isTotallyPositive_sq`, `totallyPositiveUnits` (`TauCeti/NumberTheory/NumberField/TotallyPositive.lean`, lines 71–78, 130, 168)".

**Witness:** At the pin `IsTotallyPositive` is at line 71, `isTotallyPositive_iff` at 76, `totallyPositiveUnits` at 130, but `isTotallyPositive_sq` is at line 107 and line 168 is `totallyPositiveIntegerUnits`, which the next sentence names separately.

**Repair:** Write "lines 71–78, 107, 130, 168" and attach 168 to `totallyPositiveIntegerUnits`.

## Verified sound

### The previous review's findings at this head

| Finding at a290b8f | Status | Passage and retest |
|---|---|---|
| R01 (P1) raw-vector cusp parametrisation | Repaired | README:587–593: "Define the raw Γ₁ parameter set as the disjoint union, over (𝔰,𝔐), of `(A/R^×_{>0}) × C`; define the raw Γ₁¹ parameter set using A × C"; the `(0,1)`, `(0,u)` witness is now the Check at 618–621 and the attribution at 149–150 says Dasgupta–Kakde already use `d ≡ 1` (`DasguptaKakde2021` lines 161–166 confirm). Retest: for `γ = (α β; γ′ δ) ∈ Γ₁` with `δ ≡ 1`, `βγ′ ∈ 𝔟⁻¹𝔑𝔟 = 𝔑` gives `α ≡ det γ mod 𝔐`, so `ā ↦ uā` with `u ∈ R^×_{>0}` and `c̄ ↦ c̄ mod 𝔰𝔟𝔑`; over ℚ at level 5 the sets give `φ(5)/2 + φ(5)/2 = 4` cusps of `Γ₁(5)`, the classical count. |
| R02 (P1) nonoptimal suborder counted twice | Repaired | README:991–1001 states the dictionary for optimal embeddings `φ(S) = φ(K) ∩ 𝒪` with the actual stabilizer `Sˣ/Rˣ` or `μ(S)/{±1}`; §3.4 at 1066 and 1078–1079 indexes by the optimally embedded order once. Retest: `A = (0,−1;1,√2)`, `A² = (−1,−√2;√2,1) = √2A − I`, `A⁴ = −I`; `[R[A]:R[A²]] = |N(√2)| = 2`; the D = 8 row with one order-four pair recomputes to `(e,K²,χ) = (15,−3,1)`. |
| R03 (P1) matrix-only elliptic configuration | Repaired | README:1562–1589: the full table of component genera, multiplicities and incidence; the quintic control and the I₂/III, I₃/IV distinctions are Checks at 1612–1624. Retest: I₀* centre `2(−2) + 4 = 0`, leaf `−2 + 2 = 0`; quintic transforms squares `5−3−4 = −2`, intersection `5−3 = 2`, arithmetic genus `6+6+2−1 = 13 ≠ 1`. The criterion (ii) is consistent: for a divisor with `K_X·E = 0 = E²` on a blown-up surface, pushing down to the minimal model gives `K·E₀ = −Σ mᵢ ≤ 0`, so on a general-type model the components lie in the negative definite (−2)-locus or the exceptional locus and `E² < 0`; hence κ = 2 is excluded, and simply connected with q = 0 leaves K3 or κ = 1. |
| R04 (P2) two-form pullback divides by f | Repaired | README:504–506: "`γ*(f dz₁ ∧ dz₂) = (f ∣_(2,2) γ) dz₁ ∧ dz₂`, with the unitary slash normalization", Check at 513–515. Retest: `d(γz)ᵢ = det(γᵢ)(cᵢzᵢ+dᵢ)⁻² dzᵢ`, so the pullback coefficient is `det(γ₁)det(γ₂)(c₁z₁+d₁)⁻²(c₂z₂+d₂)⁻² f(γz)`, which is the unitary weight-(2,2) slash of HilbertModularForms §0.4; at `f = z₁ − i`, `γ = (1,1;0,1)`, `z = (i,i)` both sides are 1. |
| R05 (P2) maximal-order minus periods owned by AutomorphicSpectralTheory | Repaired | README:47–49, 95, 301–304, 771–774, 785–786 cite AutomorphicSpectralTheory §4.17a and keep the arbitrary-multiplier-order extension. Resolved at its head: §4.17a constructs the reduced irrational and periodic minus cycle for `A ∈ Cl⁺(K)` with representative transport, primitive norm-one unit `ε_D`, and the D = 28 Check `(3,6)`, `8+3√7`. Retest: `(3+√7)/2 ↦ 3+√7 ↦ (3+√7)/2`, digits `[3,6]`, product `(3+√7)²/2 = 8+3√7`, norm 1; nonmaximal `ℤ[√5]`, `w = 3+√5`: `[6,2,2,2]`, multiplier `9+4√5 = (2+√5)²`. |
| R06 (P2) proper action attributed to GL₂⁺ | Repaired | README:242–246 names `UpperHalfPlane.instProperSMul : ProperSMul SL(2, ℝ) ℍ` and `instProperlyDiscontinuousSL2RSubgroup`; at the pin they are `Mathlib/Analysis/Complex/UpperHalfPlane/ProperAction.lean`:122 and :128. Check at 475–477: `nI` fixes `i` with `det = n²`, only `n = 1` in SL₂. |

No finding was settled as not actionable; nothing is re-raised.

### Gate, elaboration, signatures and padding

The worker's gate at b5d5320 reports every check zero and `OK`. The outside-folder diff `origin/main...HEAD` is empty. My own run of the brief's dependency check with the candidate order:

```text
depcheck: 204 roadmaps, 1651 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. (A gate run against the content repository's own order reports `NOT IN ORDER`, which is the design-stage placement and not a defect; the candidate order places the roadmap at line 147.) R01 is invisible to the check because it reads `*Needs:*` lines only; I read every `*Needs:*` line and every supplier-table row by hand.

`lake env lean` on Lean elaborates with exactly four `sorry` warnings (Lean:86, :145, :152, :175) and no other output. A scratch copy with `#check @name` for all 16 declarations elaborated; every type agrees with the worker's signature listing and with the README: the six elementary definitions (`hjStream`, `hjDigit`, `IsReduced`, `hjPeriod`, `IsOriented`, `multiplierUnits`) drop the unused `[NumberField F]`, as README:788–791 says they do, and the three cusp theorems keep `[NumberField F]`, `v₁ ≠ v₂` and `finrank ℚ F = 2`; the zeta theorem keeps `[IsTotallyReal F]`, `finrank = 2`, meromorphy, analyticity at −1 and agreement on `Re s > 1`. No signature needed correction.

One-tactic probes on the scratch copy: `simp` leaves the full goal of `hjPeriod_ne_nil_of_isReduced`; `simp` makes no progress and `infer_instance` fails on `cycleIntersectionMatrix_negDef`; `simp` makes no progress and `rfl` fails on `period_dual`; `simp [hagree]` leaves `dedekindZeta_neg_one_eq_siegel`. None restates a definition, mirrors a Check or computes a small value. The headline list of README (§2.2 multiplier theorem, §§2.5, 2.7 negative definiteness and duality, §4.2 Siegel's value; the geometric headlines §§2.4, 3.4, 3.10, 4.4, 4.6–4.8, 6.3–6.5) matches Lean: the four arithmetic ones are stated, the geometric ones are named in the module docstring with the missing carrier (the constructed quotient, compactified surface, local charts, divisors, minimal model), and no stand-in is declared. Imports are `Mathlib` and one existing `TauCeti.*` module; no `set_option`, no `lemma`, no sorry'd data.

### Computed adversarial checks

Values on the left are the README's or Lean's, on the right my independent evaluation (exact rationals, exact quadratic arithmetic for periods, reduced-form counts for class numbers). The tested objects are characteristic-zero number-field data; zero lattices, empty cycles, unit level, junk inputs and the non-fundamental case were tested explicitly.

| Statement | Instances and computed sides | Result |
|---|---|---|
| Conv. 1, §0.1 units | D = 5: `εε′ = −1`, `ε² = (3+√5)/2` generates `R^×_{>0}`, index 1; D = 12: `ε = 2+√3`, `εε′ = 1`, index 2; `[R^×:R^{×2}] = 2^{1+1} = 4` (`units_sq_index_eq`). | Agrees. |
| §0.2 narrow classes | D = 12: `𝔡 = (2√3)`, `N(2√3) = −12 < 0`, so `[𝔡⁻¹] = [(√3)] ≠ 1` in `Cl⁺` while `h = 1`; D = 5: `h⁺ = 1`. | Agrees; ordinary class does not detect `is_pp`. |
| §0.3 projective quotient | `PΓ/PΓ¹ = Γ/(Γ¹Aᵢ) ≅ Dᵢ/{a² : a ∈ Aᵢ}` by the determinant; D = 5, 𝔑 = (3): `ε²·(±ε⁻¹) = diag(±ε, ±ε⁻¹)` has `d = ±(ε−1)`, and `ε ≢ 0, 2 mod 3` in `𝔽₉`, so neither is `≡ 1`. | Agrees; scalar subgroup `A₁` is essential. |
| §0.3 level index | norms 4, 9, 5 give `4·5/4 = 5`, `9·10/9 = 10`, `5·6/5 = 6`; unit level: empty product 1. | Agrees (§2.4 Check too). |
| Conv. 3 transport | `diag(1,α)(a b;c d)diag(1,α)⁻¹ = (a, α⁻¹b; αc, d)`: `b ∈ 𝔟⁻¹ ↦ (α𝔟)⁻¹`, `c ∈ 𝔑𝔟 ↦ 𝔑α𝔟`. | Agrees; Assaf's `diag(α,1)` goes to `α⁻¹𝔟` (Source issues). |
| §0.4 effective action | `tI·i = i`, `det tI = t²`; SL stabiliser `{(a,b;−b,a): a²+b² = 1}` compact. | Agrees with R06 repair. |
| §0.5 two-form | pullback coefficient = unitary slash factor (above); `diag(u,1)`, `N(u) = 1`: Jacobian 1; inversion at `(2i,i)`: `z₁⁻²z₂⁻² = 1/4 ≠ 1`. | Agrees. |
| §1.1–1.2 cusps | D = 5 level one: 1 orbit; level (2): `(1:0)` has `(𝔰,𝔐) = (R,𝔑)`, `(0:1)` has `(R,R)`; `(2:0)` has `𝔰 = 2R`, same `𝔐`. | Agrees. |
| §1.3 raw parameters | `(0,1)`, `(0,φ²)` at `𝔑 = (3)`: `c̄ = 1, φ²`, `φ² − 1 = φ` a unit, distinct in `(R/3)^×`; `diag(φ⁻², φ²) ∈ Γ₀¹` carries one to the other. Over ℚ, `Γ₁(5)`: `𝔐 = 1` gives `φ(5)/2 = 2`, `𝔐 = 5` gives 2; total 4. | Agrees with the classical count. |
| §1.4 cusp count | D = 5, `𝔭₂ = (2)`: `𝔐 + 𝔑/𝔐 = R` for both divisors, `1·1·(1+1) = 2`; D = 12 level one: `h⁺h = 2`, one per component; D = 85: `h = 2` cusps per component. | Agrees. |
| §1.5 cusp types | D = 5, `Γ₀(𝔭₂)`: `(0:1)` has `M = 𝔰⁻²𝔟⁻¹𝔑(𝔑+𝔐²)⁻¹ = 2R`, `(1:0)` has `M = R`; both periods `[3]`, `k = 1`. Γ₁ row: `V` as derived in R03 after normalisation. | Agrees; R03 is a proof-sketch note. |
| §1.5 affine group | `(1,v)(2,v) = (1+2v, v²)`; `(t,v)(−v⁻¹t, v⁻¹) = (0,1)`; `v = 2+√3`, `t = 1`: `s = −1/(1−v)` gives `t + (1−v)s = 0`. | Agrees. |
| §2.1 rational expansions | `hjExpansion`: (3,1) → [3]; (3,2) → [2,2]; (5,2) → [3,2]; (5,3) → [2,3]; (6,5) → [2,2,2,2,2]; (12,5) → [3,2,3]; (12,7) → [2,4,2]; `2·3 ≡ 1 mod 5` reverses [3,2] to [2,3]. | Agrees. |
| §2.2 stream | `w = 2+√3`: digit 4, successor `1/(2−√3) = 2+√3`, period [4], product `2+√3`; `w = (3+√5)/2`: reduced, period [3], product `(3+√5)/2 = ε²`; `w = 1 ↦ 0 ↦ 0`, period [0] excluded by irrationality. | Agrees. |
| Lean `hjPeriod_ne_nil_of_isReduced` | `ε² = 7+4√3` preserves `ℤ[√3]` and is totally positive but `ε ∉ ⟨ε²⟩`: the generator clause excludes it; `Nat.find` returns the least `d > 0` with `w_d = w`, the stream period equals the digit period. | Headline, not padding. |
| §2.3 datum, Conv. 7 | `det(2+√3, 1) = 2√3 > 0`, swapped `−2√3`; `V = ⟨ε²⟩`: index 2, cycle `[−4,−4]`, sum `−4`; zero module rank 0; `ℤ[1/2] + ℤ√3` not FG; `V = {1}` has `relIndex = 0`. | Agrees; all three invalid data excluded by the structure fields. |
| §2.4 fan and small cycles | rays through `(2+√3)^j` have slope ratios `(2+√3)^{2j}`, one `V`-orbit; `[−4]` nodal square `2−4 = −2`; `[−4,−4]` matrix `((−4,2),(2,−4))`. | Agrees. |
| §2.5 matrices | `[−3] ↦ [−1]`, value 1 at (1); `[−2,−4] ↦ ((−2,2),(2,−4))`, minors of the negative 2, 4; `[−2,−2]`: value 0 at (1,1); `[−2] ↦ [0]`; nodal genus `0+0+2−2+1 = 1`, `K·S = b−2`. | Agrees; Lean cases `length = 1, 2, ≥ 3` match. |
| §2.6 cusp sums | D = 5: (1, −1); D = 8: (2, −2); D = 5 level (2): (2, −2); D = 12 gl: (1,−2) and (2,−1); sl: (2,−4) and (4,−2). | Agrees. |
| §2.7 duality | `(3+√3)/2` has period [3,2]; `[4]` dual [2,3]: sums `1 = −(−1)`; `[5] ↦ [2,2,3]`; `[2,6] ↦ [2,2,2,4]`; `[3,6] ↦ [3,2,2,2,3]`; `[2,3,2,7] ↦ [4,2,2,2,2,4]`; double dual is the original cycle; `(2⁸,11)` is self-dual. | Agrees with every dual component in the worked tables. |
| Lean `period_dual` | D = 12: `M = ℤ[√3]`, `E.M = √3M`: `1 = −(−1)`; `M = ℤ[φ]`, `β = √5`: `[3] ↦ [3]`, `0 = −0`. | Headline; no hypothesis on `E.V`, as README:937–940 says. |
| §3.1 ellipticity | `(0,−1;1,0)`: discriminant −4, fixes (i,i), order 2; identity and translation: 0; `diag(2,1)`: 1. | Agrees. |
| §3.2 dictionary | `A` over `ℤ[√2]` (above); `u = 2+√3`, `γ = (0,−u;1,0)`: `γ² = −uI`, norms `u² = 7+4√3` versus `u⁻² = 7−4√3`. | Agrees. |
| §3.3 orders | `ℚ(ζ_{2q}+ζ_{2q}⁻¹) ⊆ F`: `2q ∈ {4,6,8,10,12}`, q = 4 only D = 8, q = 5 only D = 5, q = 6 only D = 12; GL: `γ² = uζ`, `ζ + ζ⁻¹ ∈ F` gives `{2,4,6,12}` with 12 only for `√3 ∈ F`; `((1+i)/(1+√3))² = i/(2+√3)`, norm `2 − √3`. | Agrees; R02 asks for the locator. |
| §3.4 counts | `(2/h)Σh(S)/Q(S)` and `(2/h⁺)Σh(S)` are Assaf (4.2.4)–(4.2.5) with `n = 2` (`assaf` lines 707–711); the `h = 1` forms follow from `[R^×:N(S^×)] = 4/Q(S)` and `[R^×:R^×_{>0}N(S^×)] = 4h/h⁺` (Voight Lemma 30.3.14, `voight` line 22731). D = 12 sl, q = 6: `2·1/2 = 1`. Over ℚ, `ℤ+2ℤ[i]`: `1·2·(1−0)/2 = 1`. | Agrees. |
| §3.5 local numbers | `ℤ₂[i]`: `M(1) = {1}`, `M(2) = ∅`: counts 1, 0 at `e = 1, 2` (`voight` lines 23174–23190); `ℤ₃`: `T(T−1)`, `T²+1`, `T²−3` at `e = 1`: 2, 0, 1; `T(T−3)`: `M(1) = {0}`, `M(2) = {0,3,6}`, image size 1, count 2. | Agrees with Prop. 30.6.12 (`voight` line 23163, PDF page 590 = printed 544). |
| §3.6 closed forms | `h(−4D)` for D = 13, 17, 29, 37, 41, 53, 61, 73, 89, 97 = 2, 4, 6, 2, 8, 6, 6, 4, 12, 4; `h(−3D)` = 4, 2, 6, 8, 2, 10, 8, 4, 2, 4; D = 21: `h(−84) = 4`, `h(−63)+h(−7) = 5`; D = 33: `4`, `h(−99)+h(−11) = 3`; D = 24: `h(−96)+h(−24) = 6 = 3h(−24)`; D = 28: `2+1+1 = 4 = 4h(−7)`; D = 44: `6+3+1 = 10 = 10h(−11)`; D = 60: `4+2+2 = 8 = 4h(−15)`. | Every count equals the elliptic-point multiplicity in the worked tables. |
| §3.7 rotation factors | `(0,−1;1,0)`: derivative at `i` is `i⁻² = −1`; q = 3 factors `−1/2 ± i√3/2` differ by `i√3`; q = 2: `(−1)⁻¹ = −1`, no converse. | Agrees. |
| §3.8 signatures | D = 12: `(++) ↦ 1`, `(+−) ↦ [(√3)]`; squares and odd-valuation prime classes die in `C_𝔑`. | Agrees; errata item (8) used (`assaf-errata` lines 30–33). |
| §3.9 / Conv. 13 | all 13 tabulated types and `(12;1,1)`, `(12;1,11)`: `c = 0, −1/3, 0, −1, 0, −9/5, −2/5, −2/5, 0, −8/3, 0, −1, −4/3, −25/3, 0` with lengths `1,1,2,1,3,1,2,2,4,1,5,3,3,1,11`; `Z·Cᵢ = bᵢ − 2` holds for every chain. | Agrees exactly. |
| §3.11 records | D = 5: `6` points, `len_ell_res = 1+1+1+2+2+2 = 9`; D = 12 gl: one order-12 point per component, sl: none; `(4;1,2)` rejected by gcd. | Agrees. |
| §4.2 Siegel sum | 22 discriminants (table below): divisor sum = `D/24·Σχ_D(a)B₂(a/D)`; D = 1: 0; every fundamental `1 < D ≤ 500` has positive sum with `60·sum ∈ ℤ`; Lean `b % 2 = D % 2` uses `Int.emod`, so `b = −1` gives `1 = 5 % 2`; non-fundamental `D = 7` gives the junk value `1/30`, excluded by `IsTotallyReal` and `finrank = 2`. | Agrees. |
| Lean `dedekindZeta_neg_one_eq_siegel` | `ζ′ := ζ` except `ζ′(−1) := 0` is still `MeromorphicOn` (multiply by `(z+1)`) and agrees on `Re s > 1`, but is not `AnalyticAt` at −1; so `hregular` pins the value `1/30` at D = 5. | Headline; convention correct. |
| §4.3 volume | D = 5, `𝔭₂`: `5 · 1/15 = 1/3`; `ℚ(√10)`, `𝔟 = (2,√10)`, `𝔟² = (2)`: both intersection indices `N𝔟 + 1 = 3`, generalised index 1; D = 12: PSL `1/3` (sl), `1/6` (gl); PGL normalisation would give `e = 16 + 1/3`. | Agrees. |
| §4.4–4.5 Chern numbers | D = 5: `e = 1/15+1+3+5/3+8/3+28/5 = 14`, `K² = 2/15−1−1/3−4/5 = −2`; `(5;1,1),(5;1,4)` give `(15,−3,1)` (integral, rejected by §3.7); `(3;1,1)²` gives `K² = −7/3`, `χ = 8/9`. | Agrees. |
| §4.7 Hodge/signature | D = 5: `χ = 1`, `p_g = 0`, `h^{1,1} = 12`, `σ = (−2−28)/3 = −10 = 2+0−12`; `p_a = 0 ≠ χ`. | Agrees. |
| §4.8 comparison | D = 12 gl `1+1 = 0+2`; D = 21 sl `1+2 = 1+2`; D = 24, 28, 33 `[𝔡⁻¹]`-component `χ = 2`, so `dim S₂ = 1`. | Agrees. |
| §4.9 record key | D = 21 sl components `(18,−6,1)`, `(25,−1,2)`; D = 12 gl/sl `(15,−3,1)`/`(16,−4,1)`. | Agrees. |
| §5.1 contractions | blown-up ℙ²: `(8,4,1) → (9,3,1)`; blown-up K3: `(−1,25,2) → (0,24,2)`; genus-two `C² = −1`: `K·C = 3`. | Agrees. |
| §5.2 sets | `kodairaPossibilitiesMinimal`: (1,8) → {−1,2}, (2,0) → {0,1}, (1,−2) → ∅, (0,·) → ∅; `kodairaDims`: (1,−2) → {−1,0,1,2}, (2,−4) → {0,1,2}, (3,−7) → {1,2}, (4,−4) → {1,2}, (1,8) → {−1,2}; union stabilises beyond 9. | Agrees. |
| §5.3 criteria | (i): contracting `C₁` with `C₁·C₂ = m` gives `C₂′² = m²−1 ≥ 0`, `K′·C₂′ = −1−m < 0`; K3 genus-two control keeps genus 2. (ii): see the R03 row; `D·E > 0` is equivalent to Assaf's "`𝒞 ∪ {D}` connected"; for κ = 1 a (−2)-curve is vertical and meets a fibre in 0, so the second clause forces K3. | Agrees. |
| §6.2–6.3 | N = 1, `λ = 1`: `z₁ − z₂ = 0`; N = 4, `λ = 2`: same support, multiplicity retained; D = 13: contracting `F₃` gives two `(−1)`-curves with `C₁·C₂ = 1+1 = 2`; blow-up: `d−1` versus `d−4`. | Agrees; primary curve theory unverified (below). |
| §6.4–6.5 | `χ` column: 1 for 5, 8, 13, 17; 2 for 29, 37, 41; 3 for 53, 61, 73; ≥ 4 for 89, 97. D = 85: `−8+8 = 0`, `0+2 = 2`; D = 165: `−20+20 = 0`, `−10+20 = 10`; D = 5 level (2): `(14,−2,1)`, `𝔭₂` ramified in `F(i)`, split in `F(√−3)` (`𝔽₄ ∋ ζ₃`), inert in `ℚ(ζ₅)`. | Agrees with Assaf Examples 7.3.1–7.3.4 and Theorem 6.5.1 (`assaf` lines 1146–1159, 1197–1252). |
| §7.1–7.3 | level 0 excluded, unit level admitted; D = 5 `(1,6,10,14,−2,1,0,12)`; D = 12 gl/sl differ; Γ₁(4)/Γ(4) lattices `R`, `4R`. | Agrees. |
| D = 85 nonprincipal class | lattice `(3, ω)` with `ω = (1+√85)/2`: oriented basis `(ω, 3)`, `w = (1+√85)/6`, period `[4,2,3,2,4]`, cyclically `(2,3,2,4,4)`; `(7, ω)` gives the same cycle. | Agrees with README:1983–1984. |

Siegel values (divisor sum versus character sum, exact) and principal periods:

| D | sum | period, length, Σ(2−b) | D | sum | period, length, Σ(2−b) |
|---|---|---|---|---|---|
| 5 | 1/30 | [3], 1, −1 | 40 | 7/6 | [2,2,2,2,2,8], 6, −6 |
| 8 | 1/12 | [2,4], 2, −2 | 41 | 4/3 | [4,2,3,2,2,2,2,3,2,4,7], 11, −11 |
| 12 | 1/6 | [4], 1, −2 | 44 | 7/6 | [2,2,8], 3, −6 |
| 13 | 1/6 | [2,2,5], 3, −3 | 53 | 7/6 | [2,2,2,2,2,2,9], 7, −7 |
| 17 | 1/3 | [3,2,2,3,5], 5, −5 | 60 | 2 | [8], 1, −6 |
| 21 | 1/3 | [5], 1, −3 | 61 | 11/6 | [2,4,2,2,2,2,2,2,4,2,9], 11, −11 |
| 24 | 1/2 | [2,6], 2, −4 | 73 | 11/3 | length 21, −21 |
| 28 | 2/3 | [3,6], 2, −5 | 85 | 3 | [2⁸,11], 9, −9 |
| 29 | 1/2 | [2,2,2,2,7], 5, −5 | 89 | 13/3 | length 21, −21 |
| 33 | 1 | [2,3,2,7], 4, −6 | 97 | 17/3 | length 27, −27 |
| 37 | 5/6 | [3,2,2,2,2,3,7], 7, −7 | 165 | 22/3 | [13], 1, −11 |

All 36 worked rows (D = 5, 8, 13, 17, 29, 37, 41, 53, 61, 73, 89, 97 at level one; the sixteen `D = 12, 21, 24, 28, 33` component/ambient rows; D = 85 both components; D = 5 level `𝔭₂`) recompute from their stated cycles, repetitions, type multiplicities and the local table to exactly the printed `(e, K², χ, h^{1,1})`; this checks the arithmetic of the rows, not the existence or exhaustion of their elliptic points and exceptional curves.

### Library declarations at the pins

Pins: Mathlib `f6090c70`, Tau Ceti `358314d4` (`lake-manifest.json`). Paths are relative to the library roots.

| Declaration | File:line | Note |
|---|---|---|
| `UpperHalfPlane.instProperSMul`, `instProperlyDiscontinuousSL2RSubgroup` | `Mathlib/Analysis/Complex/UpperHalfPlane/ProperAction.lean`:122, :128 | SL₂ only, as the contract now says |
| `IsCusp`, `CuspOrbits`, `strictWidthInfty`, `Subgroup.IsArithmetic` | `Mathlib/NumberTheory/ModularForms/Cusps.lean`:57, :166, :317; `ArithmeticSubgroups.lean`:102 | one-variable carriers |
| `NumberField.dedekindZeta`, `dedekindZeta_residue` | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean`:49, :56 | an LSeries; the headline quantifies over a continuation |
| `hurwitzZeta_neg_nat`, `riemannZeta_neg_nat_eq_bernoulli`, `completedLFunction_one_sub` | `LSeries/HurwitzZetaValues.lean`:189, :251; `LSeries/DirichletContinuation.lean`:283 | `k ≠ 0`, `x ∈ [0,1]`; primitivity kept |
| `Pell.IsFundamental`, `Int.IsFundamentalDiscr` | `Mathlib/NumberTheory/Pell.lean`:430; `FundamentalDiscriminant.lean`:41 | D = 1 admitted by the predicate, excluded by `D > 1` |
| `Units.fundSystem`, `regulator` | `Units/DirichletTheorem.lean`:475; `Units/Regulator.lean`:266 | |
| `IntFractPair.stream`, `GenContFract.of`; `Submodule.traceDual`, `FractionalIdeal.dual`; `Matrix.PosDef` | `Algebra/ContinuedFractions/Computation/Basic.lean`:142, :185; `RingTheory/DedekindDomain/Different.lean`:54, :229; `LinearAlgebra/Matrix/PosDef.lean`:164 | regular fractions only; empty matrix vacuously PosDef |
| `NumberField.IsTotallyPositive`, `isTotallyPositive_iff`, `isTotallyPositive_sq`, `totallyPositiveUnits`, `totallyPositiveIntegerUnits` | `TauCeti/NumberTheory/NumberField/TotallyPositive.lean`:71, :76, :107, :130, :168 | R04 |
| `NarrowClassGroup.toClassGroup_ker`, `instFinite`, `card_eq_card_classGroup_mul_card_ker`, `mk_surjective`, `narrowEquivNarrowClassGroup`, `units_sq_index_eq` | `NarrowClassGroup/Basic.lean`:206; `Finite.lean`:38, :59; `Global/RayClass/Narrow/Basic.lean`:134; `Units/ElementaryTwoQuotient.lean`:84 | index `2^(rank+1)` for all units |
| `TauCeti.PlumbingGraph`, `intersectionMatrix` | `TauCeti/LowDimTopology/Plumbing/IntersectionForm.lean`:89, :108 | `SimpleGraph`: no node, no double edge, so §2.5's two small matrices are needed |
| `TauCeti.Toric.Fan` (`finite_cones`) | `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean`:83, :89 | infinite cusp system cannot be a `Fan` |
| `TauCeti.BinaryQuadraticForm`, `IsReducedForm`, `reducedForms`, `hurwitzClassNumber` | `BinaryQuadraticForm/Basic.lean`:94; `Reduced.lean`:60, :76; `HurwitzClassNumber.lean`:84 | weighted, ℚ-valued |
| `Scheme.Modules.eulerCharBelow`, `affineBlowupι` | `AlgebraicGeometry/Cohomology/EulerCharacteristic.lean`:105; `Blowup/AffineCharts.lean`:61 | |
| `Hodge.HodgeStructureOn`, `hodgeNumber`, `hodgeType` | `Geometry/Hodge/Structure.lean`:62; `Dimension.lean`:73, :152 | |
| `ModularForm.apply_I_eq_zero_of_not_dvd`; `Subgroup.integerCuspWidth` | `NumberTheory/ModularForms/EllipticPoints.lean`:49; `ModularForms/Cusps/Basic.lean`:143 | degree-one tests |

No pinned declaration proves any of the four headlines. Searches by object (minus continued fraction, periodic cycle, positive multiplier units, cusp datum, optimal embedding counts, Siegel finite sum) found nothing further at either pin.

### Cross-roadmap citations and ownership

Every citation was resolved anew. Open pull requests were read at their indexed heads through the roadmap service (head comment shown by `roadmaps show`); roadmaps on main in the content checkout.

| Supplier (merge-order line) | Resolved sections | Notes |
|---|---|---|
| HilbertModularForms (#1724, not yet ordered) | §§0.1, 0.3, 0.4, 1.1–1.5, 2.2, 2.3, 2.5, 2.6, 3.2, 3.4, 3.5, 4.2 at README lines 348, 409, 438, 473, 512, 565, 576, 621, 702, 719, 798, 811, 946, 1031, 1060, 1143 of its head | `Γ₁` is `d − 1 ∈ 𝔫`; determinant images and index formula as cited; cusp count with `U_𝔞` the image of positive units; its mentions of this roadmap (lines 187, 516, 2454, 2601) are downstream, not `*Needs:*`: no cycle |
| AutomorphicSpectralTheory (80) | §4.17a at its head, lines 2642–2656 | R05 repaired; `ε_D` primitive norm-one unit; D = 28 Check `(3,6)` |
| NeronModelsAndSemistableAbelianVarietiesPartII (50) | §2.3 (line 3855), §2.5 (3925), §6.1 (9793) | §2.3 retains normalization genera, primitive coefficients, incidence lengths, I₂/III and I₃/IV distinctions; §6.1's text contains the Castelnuovo–Zariski equivalence |
| ShimuraVarieties (91) | 0.1 (214), 0.4 (269), 1.2 (361), P.6 (202), 2.5 (595), 2.7 (629), 2.8 (648) | |
| ShimuraCompactifications (146) | 0.13 (656), 2.1–2.8 (1175–1339), 8.14–8.15 (3344, 3372), 8.23–8.25 (3511–3557), 8.32–8.38 (3686–3767), 8.56 (4104) | tame range respected at README:314–316 |
| HilbertModularVarietiesAndShimuraCurves (145) | H0.3 (246), H1.1 (353), H1.10 (526), H5.2 (1308), R18 (1569–) | |
| AutomorphicBundles (167) | B3.Hilbert.0a = its §7.2 (line 221 of its head) | later in the order: R01 |
| ImaginaryQuadraticClassNumber (main) | H1.3 (35), H1.4 (43), H2.2 (57) | |
| SchemeAndStackFoundations (main) | §5.9 (7129), §5.10 (7175) | |
| ComplexKahlerGeometry (main) | K6.0 (1245), K6.1 (1274), K7.2 (1444) | cited as on main, not from its revising pull requests |
| ComplexManifolds, FuchsianOrbifolds (main) | Milestone 4 (238); Layers 1 (215), 3 (263), 6 (344) | |
| AnalyticToricGeometry, GlobalNumberFields (Completed) | Layers 0, 2, 3 (186, 302, 361); Layers 2 and 11 (`NumberFieldOrder` at 573–604) | |
| ClassFieldTheory (main) | build plan §4, Layers 10–13 | |

Ownership by object: the roadmap service found no other roadmap, on main or in any open pull request, declaring `siegelZetaMinusOne`, `CuspDatum`, `hjPeriod`, `hjStream`, `multiplierUnits` or `cycleIntersectionMatrix`, and no other README stating Hirzebruch–Jung cusp resolutions, `ζ_F(−1)` by Siegel's sum or Hirzebruch's proportionality formula. HilbertModularVarietiesAndShimuraCurvesPartII (#1745) is about patching and Breuil–Herzig–Hu–Morra–Schraen weights and does not overlap. The maximal-order minus-period construction is now cited from AutomorphicSpectralTheory §4.17a, and the general multiplier-order extension, the surface resolution and the Chern geometry remain owned here. Open pull requests without files in the brief were not checked beyond the service's index.

### Seeded source sample

Source ids are the service's texts: `assaf` (arXiv:2301.10302v2, preprint pages), `assaf-errata`, `hirzebruch` (institutional scan), `voight` (author version; PDF page = printed page + 46), `DasguptaKakde2021` (arXiv v1), `zagier` (author-hosted scan), LMFDB knowls. No README locator is marked unverified; all fifteen seeded targets were inspected.

| Target | Text read | Result |
|---|---|---|
| 0.1 | `hirzebruch` §2.1 (the unit and module conventions), Mathlib `fundSystem`, Tau Ceti `units_sq_index_eq` | supported; index 4 at rank 1 |
| 0.3 | `assaf` lines 89–128 ((2.1.4)–(2.1.8), p. 3); HilbertModularForms §§1.1–1.3 | matrices and index as cited; the source's "agree modulo scalars when `Cl⁺ = Cl`" is the Γ₀-only statement, which the README restricts correctly |
| 0.4 | `assaf` lines 145–166 (§2.2, p. 4); ShimuraVarieties 0.1, 0.4, 1.2, P.6 | faithful `PΓ` action, cusps as orbits, minimal desingularization supported |
| 1.1 | `assaf` lines 225–235 (§3.1, p. 5), 337–344 (Cor. 3.1.23, p. 7); HilbertModularForms §1.4 | supported |
| 2.6 | `assaf` lines 1013–1037 (Theorem 6.2.3, pp. 20–21): `ℓ` the number of cusp-resolution curves, `Σ(2 − b)` | supported, with the README's positive-`b` reading |
| 2.7 | `hirzebruch` lines 1215–1244 (§2.5, scan p. 35): cyclic permutations, reversal gives the conjugate class | supports reversal/conjugation; the mixed-sign duality is cited to van der Geer II §2 (unread) and recomputed on five cycles above |
| 3.5 | `voight` lines 23163–23173 (Prop. 30.6.12, PDF p. 590 = printed 544), 23174–23190 (Example 30.6.14), 23194–23200 (Lemma 30.6.16), 22731–22732 (Lemma 30.3.14) | formula, dyadic example and maximal-order specialization exactly as stated |
| 3.6 | `assaf` §4.2; Prestel and van der Geer I §5 unread | the `D ≡ 1 mod 4` row and the `8, 12 mod 16` rows checked against reduced-form class numbers for 16 discriminants (table above) |
| 3.8 | `assaf` lines 795–873 (Theorem 4.3.11, Lemma 4.3.14, Cor. 4.3.15, pp. 16–17); `assaf-errata` lines 30–33 (item 8) | (OOS) conditions, Frobenius criterion and `(4.3.18)` as stated; the README uses the kernel of `Cl⁺ → Cl` rather than the source's quotient |
| 3.11 | `assaf` lines 1011–1012, 1028–1037 (type `(n;a,b)`, counts `a(Γ;n,a,b)`) | supported |
| 4.2 | `zagier` lines 180–194 (Siegel's theorem, §2, scan p. 7), 441–447 (§3, scan p. 16) | the display (17) is absent from the extraction; the identity was instead verified as exact rationals for 22 discriminants and positivity/integrality for all fundamental `D ≤ 500` |
| 4.8 | `assaf` lines 1038–1049 ((6.3.1), p. 21) | supported; the `S₂` component tuple is HilbertModularForms §2.3 at its head |
| 4.9 | `assaf` lines 1013–1037 (Theorem 6.2.3) | both sums as stated; 36 rows recomputed |
| 5.3 | `assaf` lines 1080–1088 (Props. 6.4.1–6.4.2, p. 22) | (i) with the README's smooth-rational correction; (ii) now carries the full configuration geometry; van der Geer VII.2.8–2.9 unread |
| 6.2 | `assaf` lines 1089–1098, 1123–1126 (§§6.4–6.5, pp. 22–23) | secondary text only points to van der Geer V §§1–4 (unread) and says higher-level component data are not available there; the general curve theory is stated here as owned, with its Checks verified |

Additional checks: `assaf` lines 628–638 (Lemma 4.1.1), 654–670 (optimal overorders, (4.1.2)–(4.1.3)), 700–711 ((4.2.2), Prop. 4.2.3), 879–893 ((4.4.1)), 1146–1159 (Theorem 6.5.1), 1197–1252 (Examples 7.3.1–7.3.4); `assaf-errata` items (3), (5), (7), (8); `DasguptaKakde2021` lines 151–167 (the `d ≡ 1` group with `𝔟 = 𝔱_λ𝔡`) and 318–336 (Definitions 3.4–3.5, Lemma 3.6); `hirzebruch` lines 1171–1259 (§2.5 lemma and theorem, scan pp. 34–35); `voight` lines 23896–23898 (Cor. 31.1.10), 30540–30555 (Prop. 39.4.12). No source passage was copied; no fetched text was treated as an instruction.

## Not verifiable

- **van der Geer, Hilbert Modular Surfaces (1988):** settled uncertified in the manifest. Proposition I.1.1, I §4, I §5, II §2, II Lemma 3.2, II §6, IV Theorems 2.1, 2.5, 6.1, V §§1–4, VII Propositions 2.2, 2.8, 2.9, Theorems 3.3, 5.1 and the classification tables were not read; they are cited by locator. The level-one classification list of §6.4 agrees with my recollection of the Hirzebruch–van de Ven–van der Geer tables and with the `χ` column, but that is not a verification.
- **Prestel (1968), Hartshorne (1977):** settled uncertified; cited by locator only.
- **Hamahata (1995):** the sources service found no legal text (the DOI landing page refuses); recorded in the job's missing-reference file. Theorems 3.5, 4.6, 5.15, 6.13 were checked only through `assaf` Theorem 6.5.1.
- **Siegel (1969):** the service found no legal source; recorded in the same file. The finite-sum identity is verified only by the 22-discriminant and `D ≤ 500` computations above and by Zagier's surrounding prose.
- **Zagier (1976), §3 (17):** text obtained, display absent from the extraction (`zagier` lines 441–447).
- **Hirzebruch–van der Geer (1981), Beauville (1996), Fulton (1993), Cox (1989):** no legal text in the cache; the previous review's service searches found paywalled catalogues or restricted pages, and I did not find a new route. Cited by locator.
- **LMFDB invariant knowls:** the readable label, component, main-surface, congruence, standard-surface, `x0`/`x01` and search pages were used; the `cusps`, `cusp_resolution`, `elliptic_point*`, `euler_number`, `k2`, `hodge_numbers`, `kodaira_dimension`, `ag.*` fetches are browser-challenge pages in the cache, so column-by-column coverage of §7.3 is not certified.

## Source issues

- **Error** in assaf at (2.1.6), preprint p. 3, line 115–116: the source says conjugation by diag(α,1) carries the component 𝔟 to α𝔟; it should be diag(1,α), or the target α⁻¹𝔟; affects a stated result.
- **Error** in assaf at the paragraph after (2.1.8), preprint p. 3, lines 125–128: the source says the Γ₁ groups agree modulo scalars when the narrow and ordinary class groups coincide; it should keep the squares of the scalars congruent to 1 modulo the level; affects a stated result.
- **Error** in assaf at Lemma 3.1.8, preprint pp. 5–6, lines 238–264: the source quotients both residues by positive units in the raw-vector Γ₁ bijection; it should leave the residue constrained by the Γ₁ congruence unquotiented; affects a stated result.
- **Error** in DasguptaKakde2021 at Lemma 3.6, arXiv v1 p. 9, lines 322–332: the source quotients the second residue by positive units; it should keep it, since d ≡ 1 fixes it exactly; affects a stated result.
- **Misprint** in assaf-errata at item (3), p. 1, line 17: the source writes the modulus M + M/N for Proposition 3.3.8(b); it should be M + N/M; affects a stated result.
- **Error** in assaf at the dictionary after Lemma 4.1.1, preprint p. 13, lines 642–645: the source says all embeddings of CM orders with extra units correspond bijectively to elliptic points; it should use optimal embeddings and the full stabilizer; affects a stated result.
- **Error** in assaf at Lemma 4.1.1(b), preprint p. 13, line 631: the source says γ² = u⁻¹ζ; it should say γ² = uζ, as γ = (0,−u;1,0) shows; affects a stated result.
- **Error** in assaf at Lemma 4.1.1(b), preprint p. 13, line 632: the source bounds nonsquare-determinant projective orders by six in degree two; order twelve occurs over ℚ(√3); affects a stated result.
- **Error** in assaf at (4.3.19), preprint p. 17, line 872: the source maps signatures through the quotient Cl⁺R/ClR; it should use the kernel of Cl⁺R → ClR; affects the proof.
- **Error** in assaf at (6.2.2), preprint p. 20, line 1007: the source states the volume formula with PGL₂⁺ normalisation uniformly and with the sign and factor −d^{3/2}ζ_F(2)/π^{2n}; for n = 2 the PSL normalisation and d^{3/2}ζ_F(2)/(2π⁴) are needed; affects a stated result.
- **Misprint** in assaf at Theorem 6.2.3, preprint p. 20, line 1028: the source calls b_{σ,k} the self-intersection numbers; they are the positive continued-fraction digits, with the nodal case separate; affects a stated result.
- **Error** in assaf at Proposition 6.4.1(i), preprint p. 22, line 1082: the source requires only two curves of square −1 meeting positively; they must be smooth rational, else blown-up genus-two curves on a K3 are a counterexample; affects a stated result.
- **Error** in assaf at Example 7.3.2, preprint p. 25, line 1218: the source says ℚ(√11) has h = h⁺ = 2; it has h = 1, h⁺ = 2; affects nothing.
- **Error** in lmfdb-component at hmsurface.component_ideal, line 90: the source calls R ⊕ 𝔟 the polarization module; it is the rank-two lattice, the polarization module being (𝔡𝔟)⁻¹; affects a stated result.
