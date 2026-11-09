# Review of HomologicalStabilityOfGeneralLinearGroups (pull request #2036 at 1fae7cd)

**Verdict:** needs changes

Paths below are `TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/README.md` ("README") and `TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/Suggested.lean`. Kal80 is van der Kallen, Invent. Math. 60 (1980), read on the GDZ scan and cited by printed page. GKRW25 is Galatius–Kupers–Randal-Williams, arXiv:2005.05620v3, cited by line of the extracted text.

## Previous review (at 9b02adb): all nine findings repaired

| Finding | Passage at this head | Status |
|---|---|---|
| R01 parity rule of `d¹` | README 252–264: the differential is `Σ (−1)^(i+1) H_s(Int(m_ir), l(m_ir))`; the parity rule is stated "For trivial coefficients `A` and `r, s` with `1 ≤ r ≤ d + ε` such that `H_s(Sq(Stab_G σ_r), A) → H_s(Stab_G σ_r, A)` is onto"; the `GL₃(𝔽₂)` Check is at 276–280 | repaired |
| R02 transitivity range | README 214–215: "transitive on frames of each length `k + 1 ≤ d + ε + 1`, with `ε = 0` when `P = Q` and `ε = 1` otherwise"; sphere-ring Check at 237–241 | repaired |
| R03 unowned routes | 3.2 states the relative spectral sequence `E(P, Q; n + 1, n)` and Lemma 5.13; 1.3 states Suslin's spectral sequence over semilocal rings on §6.7's frame complex | repaired |
| R04 second owner | README 45–57 "Left to SchemeKTheoryOperations", contract at 172–177; the frame and `GL_n` declarations are gone from `Suggested.lean` | repaired |
| R05 `stabilization` | `TauCeti.stabilizeGL R (Nat.le_succ n)` throughout; "From Tau Ceti" contract at 159–170 | repaired |
| R06 `E_n` headline | `elementaryStabilization` and the two `elementaryHomology_stabilization_*` theorems | repaired |
| R07 2.3 too narrow | connected semilocal, bijective for `m ≤ n` | repaired (see R03 below for the remaining hypothesis) |
| R08 GeneralAlgebraicKTheory locator | 3.2 and 3.14 at lines 74–75, 186–187, 465, 468 | repaired |
| R09 shape | API bullets in 1.1, 1.3, 2.2, 3.1, 3.4; Convention 6; the notebooks sentence is gone | repaired |

## R01 (P1) — 1.1 miscounts the stabiliser of a standard frame for the non-square groups

**Location.** README lines 215–216: "the stabiliser of the standard frame of length `k + 1` is a group `G_n^(P',Q')` with `|P' ∪ Q'| = t + k + 1`".

**Claim.** The count `t + k + 1` holds only in the square case. In Kal80 Examples 3.5 (pp. 279–280) the stabiliser of `σ_k` is `G_n^(P(k),Q)` with `P(k) = P ∪ [t+1, t+k+1]` in Example 1, but `P(k) = P ∪ [t, t+k]` (or `Q(k) = Q ∪ [t, t+k]`) in Examples 2–4, where `t ∈ P ∪ Q` already. So `|P' ∪ Q'| = t + k + 1 − ε`.

**Witness.** `P = ∅`, `Q = {1}`, `n = 2` (Example 2 with `t = 1`): `G = {(1 0; a u)}` acts on `e₁ + Re₂`, `σ₀ = (e₁)`, and `Stab(σ₀) = {(1 0; 0 u)} = G₂^({1},{1}) ≅ GL₁(R)`, with `|P' ∪ Q'| = 1 = t + k`. A group with `|P' ∪ Q'| = t + k + 1 = 2` would be trivial; over `𝔽₃` the stabiliser has order 2.

**Repair.** Write "with `|P' ∪ Q'| = t + k + 1 − ε`: the stabiliser is `G_n^(P(k),Q)` with `P(k) = P ∪ [t+1, t+k+1]` when `P = Q`, and `G_n^(P(k),Q)` or `G_n^(P,Q(k))` with `P(k) = P ∪ [t, t+k]`, `Q(k) = Q ∪ [t, t+k]` otherwise (Kal80, Examples 3.5.1–3.5.4)". Add the instance above as a Check. Tested on it: `t + k + 1 − ε = 1`, the size found.

## R02 (P2) — 3.1's definition of degree does not require `τ` to be injective, and 3.3 is false for the systems it then admits

**Location.** README lines 509–511: "degree `k ≥ 0` when `Σρ` splits as `τ(ρ) ⊕ coker τ` with `coker τ` strongly central of degree `k − 1`"; 3.3, lines 570–571.

**Claim.** Kal80 5.5 (p. 290) says `Σρ` splits when it is the direct sum of two subsystems one of which is isomorphic to `ρ` through `τ`. The README's wording asks only for a complement of the image of `τ`.

**Witness.** Over a field (`sdim = 0`) let `ρ_n = A ≠ 0` with trivial action for `n ≤ 2`, `ρ_n = 0` for `n ≥ 3`, `F_n = id` for `n < 2`. It is strongly central; `τ` is onto, so `Σρ = τ(ρ) ⊕ 0` and `ρ` has degree `0` as written. But `Rel_1^2(ρ) = H₁(GL₃, GL₂; 0, A) ≅ H₀(GL₂; A) = A ≠ 0`, although `n = 2 ≥ 2m + sdim + k = 2`.

**Repair.** Define: "`Σρ` splits when `τ` is injective and `Σρ = τ(ρ) ⊕ ρ'` for a subsystem `ρ'`, so that `ρ' ≅ coker τ`; `ρ` has degree `k ≥ 0` when `Σρ` splits and `coker τ` is strongly central of degree `k − 1`". Add the truncated system as a Check (it has no degree: `τ_2 : A → 0`). In the API bullet on the degree, say that a system of degree `k` also has degree `k + 1`, so that `deg` in `deg(ρ ⊕ ρ') ≤ max(…)` is the least such `k`. Tested on the instance: `τ_2` is not injective, so 3.3 claims nothing for it.

## R03 (P3) — 2.3 holds without the connectedness hypothesis

**Location.** README lines 426–429 and Convention 7; `Suggested.lean` line 130, `[ConnectedSpace (PrimeSpectrum R)]`.

**Claim.** Connectedness is needed in GKRW25 Theorem 9.4 (line 3333) for the identification with Milnor K-theory, which this roadmap leaves out of scope. The stability statement holds for every semilocal ring with all residue fields infinite, the generality of 1.3.

**Witness.** A semilocal ring is a finite product of connected semilocal rings (each connected component of the spectrum contains a closed point). `GL_n(R₁ × R₂) = GL_n(R₁) × GL_n(R₂)`, compatibly with stabilization. For `ℚ × ℚ` and `m ≤ n`, the Künneth sequence has terms `H_i ⊗ H_j` (`i + j = m`) and `Tor(H_i, H_j)` (`i + j = m − 1`), all with `i, j ≤ n`, where both factors are bijective; the five lemma gives bijectivity.

**Repair.** Drop `[ConnectedSpace (PrimeSpectrum R)]` from `homology_stabilization_of_infinite_residueFields` and "connected" from 2.3, the Summary and Scope; keep the connected case as the cited source statement and add the reduction to it (finite products, Künneth) to the route. Replace Convention 7's `ℚ × ℚ` witness by a Check in 2.3 with the computation above. The zero ring then enters the statement: all groups are trivial and every map is the identity of `ℤ` or `0`. No other binder of the theorem mentions the instance.

## R04 (P3) — 2.4's *Needs:* omits the supplier sections its route uses

**Location.** README lines 460–468.

**Claim.** The route uses that `BE_n(R)⁺` is the universal cover of `BGL_n(R)⁺`, that plus is a homology isomorphism, the relative Hurewicz theorem, that homotopy groups commute with the telescope, and (for `m = 1` and for `E_n(R)` normal in `GL_n(R)`, Kal80 4.12) stability for `K₁`. The *Needs:* line lists only StableHomotopyKTheory 1.30, 1.32, 3.25–3.27, 4.14 and GeneralAlgebraicKTheory 3.2, 3.14.

**Witness.** StableHomotopyKTheory README at #1227 head 23a1323: §3.31 "BP⁺ is the universal cover of BG⁺" (line 1376), §3.12 (line 1133), §3.16 "Relative Hurewicz theorem with trivial π₁-action" (line 1188), §1.14 (line 284). AlgebraicKTheory §4.1: `surjective_stability`, `injective_stability`.

**Repair.** Add StableHomotopyKTheory 1.14, 3.12, 3.16, 3.31 and AlgebraicKTheory 4.1 to 2.4's *Needs:* and to the StableHomotopyKTheory supplier contract, and say in the route that `E_n(R)` is normal in `GL_n(R)` for `n ≥ sdim + 2` by AlgebraicKTheory 4.1, which is what makes `BE_n(R)⁺` the universal cover in the range used.

## R05 (P3) — Process narrative in Scope and Downstream consumers

**Location.** README lines 35–38: "A search of the roadmaps on main, of the open pull requests and of the maintainers' packages for … finds one other owner". Line 645: "No roadmap on main or in an open pull request consumes a target of this one."

**Claim.** The README is timeless; a search and the state of pull requests belong to the pull request description, which already has them.

**Witness.** README house rule "no process narrative … review or pull-request references"; 2 of the 162 READMEs on main contain the phrase "open pull request".

**Repair.** Line 35–38: "One other roadmap owns part of this subject, SchemeKTheoryOperations §6.7 (below). AlgebraicKTheory (Layer 4) owns …" and keep the rest. Line 645: "No roadmap consumes a target of this one."

## Verified sound

- **Gate.** The worker's gate at 1fae7cd passed every check. The dependency check printed `depcheck: 236 roadmaps, 2269 edges, 0 problem(s)`: no UPWARD and no CYCLE line. Nothing changes outside the roadmap folder. The pins equal main's (Mathlib 1b1ccf4, Tau Ceti 2fd255d).
- **Elaboration.** `lake env lean` on `Suggested.lean` gives exactly 6 `declaration uses sorry` warnings.
- **Signatures.** `#check @name` on the 10 declarations, compared with the README: every instance hypothesis (`Finite (MaximalSpectrum R)`, the infinite residue fields, `IsNoetherianRing`, `IsSemisimpleRing (R ⧸ Ring.jacobson R)`), every `hφ`, `hd` and `hmn` is present and every bound matches. Nothing changed.
- **Padding probe.** Each of the 6 theorems with `first | (simp; done) | rfl | infer_instance | trivial | exact?`: none closes.
- **Not-statable claims.** No `HasStableRange`, unimodular frame, hyperhomology or plus construction exists in Tau Ceti or Mathlib at the pins (grep), so 2.1, 3.3, 1.1–1.2, 3.2 and 2.4 are correctly listed as not stated.
- **Library declarations opened at the pin.** Tau Ceti `…/GeneralLinearGroup/Stable.lean`: `stabilizeGL` (79, upper left block, docstring 76–78), `coe_stabilizeGL_apply` (87), `map_stabilizeGL_elementarySubgroup_le` (141), `StableGeneralLinearGroup` (155), `of` (162). `…/Elementary.lean`: `elementarySubgroup` (75), `commutator_elementarySubgroup_self` (101, perfectness for `3 ≤ card n`), `fromBlocksGL` (128), `coe_fromBlocksGL` (139). Tau Ceti's `GroupHomology/` folder has no relative group homology, so Convention 5's relative groups are owned here.
- **Citations resolved** (14).
  - SchemeKTheoryOperations §6.7 at #1229 head 07d5e4d: hyperhomology, both spectral sequences, vanishing, Shapiro identification; frames, `F_n^δ`, `F_n^δ(u)`, row vectors, exactness in degrees `≤ n−2−s` and `≤ n−2−s−k`; directed unions; Theorem 4.11 for `GL_n` with the `GL(R)` comparison and the noetherian and semilocal forms. All as README 45–57 says.
  - AlgebraicKTheory at #1142 head 2dc9ef4: `HasStableRangeLE` (rows of length `s + 1`, so `SR_N` is `HasStableRangeLE R (N − 1)`), `injective_stability` (`s + 1 ≤ n`, that is `n ≥ sdim + 2`), `hasStableRangeLE_one_of_isSemisimpleRing`, `hasStableRangeLE_of_ringKrullDim_le` (`d + 1`).
  - StableHomotopyKTheory 1.30, 1.32, 3.25–3.27, 4.14; GeneralAlgebraicKTheory 3.2, 3.14.
  - K3BlochGroups at #1430 head dcd87e4: 4.0, 4.3, 4.5–4.8, 4.15, `generalLinear_homology_stable`, `symmetricGroup_homology_stable`, `generalLinearStabilization`; its `d¹` parity agrees with 1.3's. ArithmeticKTheory §3.2 (line 1230).
  - MotivicStructuresInModuliOfCurves and InverseGaloisAndArithmeticFundamentalGroupsPartII are board packages in the merge order (lines 345 and 224), named in Scope only.
- **Ownership against open pull requests.** `overlaps.md` lists no pull request changing this roadmap and no dropped id. SchemeKTheoryOperations §6.7 (36th) is cited, not restated. K3BlochGroups (139th) states the infinite-field cases of 1.3 and 2.3 and its README (lines 28 and 2328) still describes this roadmap's earlier layout; this roadmap is the earlier one and takes nothing from it, so the change is K3BlochGroups's.
- **Seeded sample, 11 targets.**
  - 1.1: Kal80 3.4 and Examples 3.5 (pp. 279–280): `d = n − t − 2 − sdim`, `ε`, transitivity for `0 ≤ k ≤ d + ε`; gives R01.
  - 1.2: Proposition 3.7 (p. 280), 4.2 (pp. 284–285), 4.4 (p. 285), Lemma 4.5 (pp. 285–286).
  - 1.3: GKRW25 Definition 5.12 (line 1212, `GL(Q) ⋉ Hom(Q, P)`), Proposition 5.15 (line 1302), Example 5.16 (lines 1307–1324, semilocal with infinite residue fields, no connectedness).
  - 2.1: Theorem 4.11 and its proof (p. 289): both groups, onto for `n ≥ 2m + e − 1`, injective for `n ≥ 2m + e`; `E_n` for `n ≥ sdim + 2` by injective stability; `m = 1` by perfectness.
  - 2.2: 2.1 with AlgebraicKTheory 4.2, checked against the Lean bounds.
  - 2.3: GKRW25 Theorem 9.4 (lines 3333–3336) and lines 3347–3352 (the map onto the relative group factors through `H_n(GL_n(A))`); gives R03.
  - 2.4: Corollary 4.12 and its proof (p. 289); gives R04.
  - 3.1: 5.2–5.5 (p. 290): `s_n`, `γ = 1`, central, strongly central, `Σρ`, `τ`, degree, `⊗ᵏRⁿ`; gives R02.
  - 3.2: 3.14–3.15 (p. 284), 5.12 (p. 292), Lemma 5.13 (p. 293).
  - 3.3: Theorem 5.6 (p. 291).
  - 3.4: Theorem 5.6 with `k = 1`, checked against the Lean bounds.

### Adversarial table

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 stabiliser count | `P = ∅`, `Q = {1}`, `n = 2`, `k = 0`; `t = 0`, `k = 0` | README: `t+k+1 = 2`; computed: `Stab = {(1 0; 0 u)}`, count 1. Square case: `G^({1},∅)`, count 1 = `t+k+1` | **false** (non-square) | R01 |
| 1.1 transitivity | sphere ring `n = 3`; field `n = 2`; `GL₂(ℤ)` | `d + ε + 1 = 0`: nothing claimed; `d = 0`: claimed, stabiliser of order 2 over `𝔽₂`; `d = −1`: nothing claimed | holds | — |
| 1.2 `d¹`, parity | `GL₂(𝔽₂)`; `GL₃(𝔽₂)`, `r = s = 1`; `s = 0` | `ℤ/2 → ℤ/2` onto; `(a, b) ↦ a + b` with `H₁(Sq) = 0`, so no claim; `Σ(−1)^(i+1) = 1` (`r` even), `0` (`r` odd) | holds | — |
| 1.2 Check 4 | `GL₁(𝔽₃)`, `d = −1` | chains `ℤ² → ℤ`, reduced `H₀ = ℤ` | holds | — |
| 1.3 NS property | `𝔽₃`, `n = m = 1`; `ℚ`; `m = 0`; `n = 0`; zero ring | `H₃(𝔖₃) = ℤ/6` vs `ℤ/2`; `H₁ = ℚˣ ⊕ ℚ/(2−1)ℚ = ℚˣ`; stabiliser of the empty matrix is `⊤`; both groups trivial; all groups trivial | holds | — |
| 1.3 `affineGroup` shape | `ℚ`, `n = m = 1` | `(1 0; 1 1)(0;1) = (0;1)`; `(1 1; 0 1)(0;1) = (1;1)`; kernel of the retraction is `m × n` = `Hom(Aⁿ, Aᵐ)`, as in GKRW25 line 1209 | holds | — |
| 1.3 Suslin's spectral sequence | abutment; `n = 3`, `ℚ`, `s = 1` | complex exact in degrees `≤ n − 2`, so `H_(r+s)(G; C) = H_(r+s−n)(G; U_n)`; `r = 1` odd: `ℚˣ → ℚˣ` twice, difference 0; parity equals K3BlochGroups 4.8's | holds | — |
| 2.1 / 2.2 `E_n` | `𝔽₂`, `m = 1`; `ℤ`, `m = 1`; `𝔽₂`, `m = 2`; `m = 0`, `n = 0`, `d = 0`; `n = sdim + 1` | `0, ℤ/2, 0`: not onto at 1, onto not injective at 2; `ℤ/12 → 0` onto at 2; `H₂`: `ℤ/2 → 0` onto at 4, `0 → 0` at 5; surjectivity only (`1 ≤ 1`), `ℤ → ℤ`; `m = 1` only, both sides 0 or target 0 | holds | — |
| 2.2 non-target | `𝔽₂`, `m = 3`, `m = 4` | UCT: `H³(GL₆; 𝔽₂) ≠ 0`, `H₂ = 0` ⇒ 2-torsion in `H₃`; `m + 1 < 2n/3` ⇔ `n ≥ ⌊3(m+1)/2⌋ + 1 = 8 < 9` | holds | — |
| 2.3 | `ℤ_(2)`, `m = n = 1`; `𝔽₂`; infinite `F`; `ℚ × ℚ`; exact sequence | not onto (image trivial in `ℤ/2`); `ℤ/2 → 0`; `Fˣ → Fˣ` identity; Künneth: bijective for `m ≤ n`; onto ⇐ `Rel_m = 0` (`m ≤ n`), injective ⇐ `Rel_(m+1) = 0` (`m < n`) or `H_(n+1) ↠ Rel_(n+1)` (`m = n`) | holds; hypothesis removable | R03 |
| 2.4 | Hurewicz bookkeeping; `ℤ`, `m = 2`; `m = 1` | `H_i(E_(n+1), E_n) = 0` for `i ≤ k` ⇔ `n ≥ 2k + e − 1`; `π_m` onto for `n ≥ 2m + e − 1`, injective for `n ≥ 2m + e + 1`; `n ≥ 6`; `e + 3 ≥ sdim + 2` | holds | R04 |
| 3.1 degree | truncated constant system; constant; `Rⁿ`; `F_n = 0`; zero system | README: degree 0, `Rel_1^2 = A ≠ 0`; `Δρ = 0`, degree 0; `τ(v) = (0; v)`, `Σρ = Re₁ ⊕ τ(Rⁿ)`, degree 1; `τ = 0`, `Σᵏρ ≠ 0`, no degree; degree `k` for every `k ≥ 0` | **false as worded** | R02 |
| 3.2 | `G' = G`; constant, `s = 0`; `n = 2` field | all `Rel = 0`; `coker(ℤ → ℤ) = 0`; `d + ε = 0`, Lemma 5.13 asserts nothing | holds | — |
| 3.3 / 3.4 | `𝔽₂`, `Rⁿ`, `m = 0, 1`; `ℤ`, `m = 0`; `k = 0` | `Rel_0^0 = 𝔽₂`, `Rel_0^n = 0` for `n ≥ 1`; `dim H₁ = 0,0,1,0,0`: `Rel_1^2 = 𝔽₂`, `Rel_1^3 = 0` (bound `n ≥ 3` attained); `ℤ/2 → 0`; `2m + sdim` vs `2m + e − 1` | holds | — |
| `hφ` of 3.4 | `v ↦ (v; 0)`; `v ↦ (0; v)`, `n = 2` | `diag(g,1)(v;0) = (gv;0)`; `diag(e₁₂,1)(0,v₁,v₂) = (v₁,v₁,v₂) ≠ (0,v₁+v₂,v₂)` | holds | — |
| Conventions 3, 4, 7 | `ℤ`, row `(2,5)`; `𝔽₂`, `n = 2`; zero ring | `2 + 5c = ±1` has no solution; ranks `1, 3, 6`, `6 − 3 + 1 = 4`; `MaximalSpectrum` empty and `R/J = 0` semisimple | holds | — |

## Not verifiable

- Nesterenko–Suslin 1989 (Proposition 1.10, Theorems 2.7, 3.25) and Guin 1989 (Théorème 2): not opened; the numbers and hypotheses are confirmed only through GKRW25 lines 1304–1306 and 3331–3336.
- Not opened this round, being outside the sample: Dwyer 1980, Suslin 1984, Charney 1980, Nakaoka 1960, Kerz 2005, Maazen 1979, Quillen 1972, Szymik 2020, GKRW 2024, Sprehn–Wahl 2020, Schlichting 2017, Randal-Williams–Wahl 2017, Hatcher–Wahl 2010.
- The author's own computations: `dim H₁(GL_n(𝔽₂); 𝔽₂ⁿ)` for `n = 4, 5` (the values for `n ≤ 3` agree with known facts) and the `ℤ/9` values in Research context.
- R03's repaired Lean statement was not elaborated separately; it removes one instance binder that no other binder mentions.

## Source issues

- **Misprint** in Kal80 at Theorem 4.11, printed p. 289: the source writes the target of the first stabilization as the homology of `GL` with index `m + 1`; it should be `GL` with index `n + 1`; affects nothing.
