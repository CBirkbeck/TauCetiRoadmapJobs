# Review of HalfIntegralWeightModularForms (pull request #1721 at 3d0ebaf)

**Verdict:** needs changes

Full re-review of the repaired head (the folder changed by 1531 lines since 3862af1). All 24 findings of the previous review are repaired (table under *Verified sound*). The whole README (1890 lines) and `Suggested.lean` (403 lines) were re-read; the worker's gate passes; the dependency check shows no UPWARD or CYCLE line. One new blocking finding (a statable headline left out of the acceptance test) and three P3 notes.

## R01 (P2) — Two statable headlines are absent from `Suggested.lean` and declared unstatable

**Location:** `TauCetiRoadmap/HalfIntegralWeightModularForms/Suggested.lean:15`–19 (“The Shimura lift, its Euler product and its decomposition lack the half-integral Hecke action and the constructed lift … Kohnen's Hecke correspondence … lack the plus-space Hecke and newspace carriers”); README §1.3 (lines 655–706) and §5.3 (lines 1324–1368).

**Claim:** the Shimura–Niwa–Cipra theorem of §1.3 and the level-one lift `Sh_D⁺` of §5.3 cannot be stated at the pins.

**Witness:** both are existence statements that need no Hecke action and no constructed lift: only the file's own `coeff`, `cuspSpace`, `plusSpace` and Mathlib's `qExpansion`, `jacobiSym`, `ModularForm`, `CuspForm`. A scratch copy of `Suggested.lean` with these two theorems appended elaborated with `lake env lean` and only `sorry` warnings (17 warnings, 0 errors):

```lean
theorem shimuraNiwaCipra {N : ℕ} [NeZero N] (hN : 4 ∣ N) {k : ℕ} (hk : 1 ≤ k)
    (f : HalfIntegralForm.cuspSpace k (Gamma0 N)) (t : ℕ) (ht : Squarefree t) :
    ∃ F : ModularForm ((Gamma0 (N / 2)).map (Matrix.SpecialLinearGroup.mapGL ℝ)) (2 * k : ℤ),
      ∀ n : ℕ, 0 < n → (UpperHalfPlane.qExpansion 1 F).coeff n =
        ∑ d ∈ n.divisors, (if Nat.Coprime d N then (jacobiSym ((-1) ^ k * t) d : ℂ) else 0) *
          (d : ℂ) ^ (k - 1) *
          HalfIntegralForm.coeff (f : HalfIntegralForm k (Gamma0 N)) (t * n ^ 2 / d ^ 2) := sorry

theorem kohnenLiftOne {k : ℕ} (hk : 1 ≤ k) (g : HalfIntegralForm k (Gamma0 4))
    (hg : g ∈ HalfIntegralForm.plusSpace k ⊓ HalfIntegralForm.cuspSpace k (Gamma0 4)) :
    ∃ F : CuspForm ((Gamma 1).map (Matrix.SpecialLinearGroup.mapGL ℝ)) (2 * k : ℤ),
      ∀ n : ℕ, 0 < n → (UpperHalfPlane.qExpansion 1 F).coeff n =
        ∑ d ∈ n.divisors, (d : ℂ) ^ (k - 1) * HalfIntegralForm.coeff g (n ^ 2 / d ^ 2) := sorry
```

The first is the trivial-character case of the §1.3 theorem (`χ_t(d) = 0` for `d` not coprime to `N`, `((−1)^k t/d)` = `jacobiSym` for odd `d`); the second is Kohnen–Zagier's equation (4) at `D = 1` (kohnen-zagier line 319, printed p.182). Instance: for `δ` the second produces `1, −24, 252, −1472, 4830` (`Δ`), the first with `t = 1` produces `1, −56, 252, −704, 4830` (`Δ(z) − 32Δ(2z)`), both recomputed from `δ = θ⁹F − 18θ⁵F² + 32θF³`.

**Repair:** state both headlines in `Suggested.lean` (the general fundamental-discriminant `Sh_D⁺` can be stated the same way with `jacobiSym D d` for odd `d`, with the primitive character of §5.3's conventions), keep their proofs as the README targets they are, and delete the docstring sentences that call them unstatable. The Euler product, Hecke equivariance and the decomposition stay README-only, as the docstring says.

## R02 (P3) — Two locators

- README.md:1646–1647 cites “Skoruppa–Zagier, §3, Theorem 3, pp.137–138” for the isomorphism `J^{cusp}_{k,m} ≅ S^−_{2k−2}(m)`. In §3 the theorem is **Theorem 5** (skoruppa-zagier line 874, printed p.137); `B_{l,d}` and the decomposition (2) are lines 901–909 (p.138); Theorem 3 is stated in §0. Repair: cite Theorem 5, p.137 for the isomorphism and (2), p.138 for the decomposition.
- README.md:970 cites Ligozat for the cusp-order formula without a locator; it is Proposition 3.2.8 (ligozat line 1007). Repair: add the proposition number.

## R03 (P3) — The Jacobi dimension statement covers even weight only

**Location:** README.md:1600–1608 (§6.3) states the dimension bound and the exact formula “for even `k ≥ 2`”; the Scope (lines 61–62) promises “the dimension formula”, and §6.1 discusses odd `k`.

**Witness:** the cited corollary (eichler-zagier lines 3347–3353, printed p.102) states a second inequality for odd `k`, with the same equality clause `k > m`; it gives `dim J_{11,2} ≥ dim M_{12} − ⌈1/8⌉ = 2 − 1 = 1`, and `J_{11,2} ∋ Δ·φ_{−1,2} ≠ 0`, so odd weight is not empty for `m > 1`.

**Repair:** add the odd-weight bound and its equality range from the same corollary (and the weak-form rank route for the remaining odd weights), or narrow the Scope sentence to even weight.

## R04 (P3) — §1.3's convergence remark derives the trivial bound through `m_θ`

**Location:** README.md:659–660: “convergent on ℍ by the trivial bound `a(n) = O(n^{k/2+1/4})` from `m_θ` and the integral-weight Hecke bound”.

**Witness:** the Hecke bound applies to the coefficients of `fθ`; `f = (fθ)·θ^{−1}` and `θ^{−1} = 1 − 2q + 4q² − 8q³ + 14q⁴ − 24q⁵ + 40q⁶ − ⋯` (coefficient `2062` at `n = 16`), so no termwise bound for `a(n)` follows from the product. The statement itself is right.

**Repair:** cite the direct argument (a cusp form of weight `k + 1/2` has `|f(z)| y^{(2k+1)/4}` bounded on ℍ, hence `a(n) = O(n^{k/2+1/4})`), or GeometryOfNumbersAndQuadraticArithmetic §4.3's bound; no input of the statement changes.

## Verified sound

**Previous findings.** Each finding of the review at 3862af1, with the passage of this head that answers it:

| Previous | Status at 3d0ebaf | Where |
|---|---|---|
| R01 ordinary vs plus lift | repaired: ordinary lift of `δ` is `Δ(z) − 32Δ(2z)`; plus lift `Sh_D⁺` with primitive character; relation `Sh_t = Sh_D⁺(z) − (D/2)2^{k−1}Sh_D⁺(2z)` | §1.3 Checks (701–702), §5.3 (1333–1343); recomputed: ordinary `1,−56,252,−704,4830,−14112`, plus `1,−24,252,−1472,4830,−6048` |
| R02 S-law exponent | repaired: `τ^{k−1/2}`, phase `e(1/8)/√(2m)`, kernel `e(μν/(2m))` | §6.2 (1562–1565); verified on `E_{4,1}² ∈ J_{8,2}` (table) |
| R03 Jacobi dimension `−1` | repaired: lower bound, equality for `k > m`, weak-form rank otherwise | §6.3 (1600–1608) |
| R04 Skoruppa–Zagier oldforms | repaired: `B_{l,d}` and direct sum over `ld² ∣ m` of new `ε = −1` subspaces | §6.4 (1626–1636); matches skoruppa-zagier lines 901–909 |
| R05 finite index | repaired | §0.3 (436–439), Lean `finiteDimensional` carries `[Γ.FiniteIndex]` |
| R06 product characters | repaired: `χ₋₄(d)^l`, `χ₋₄^{k+l+1}` | §0.3 (427–433), §2.2 (771–774) |
| R07 shifted eta identity | repaired: `η(z+1/2)²/η(2z+1)` | §3.4 (979–980); value `1.003734885487739` at `i` recomputed |
| R08 unary Fricke | repaired: same-`t` formula with `(−2itz)^{1/2}` | §4.1 (1022–1025); verified numerically for three characters |
| R09 weight-1/2 divisor sum | repaired: `(d, 4r²t) = 1` | §4.4 (1146–1148) |
| R10 KZ normalization | repaired: `|c(|D|)|²`, cross-multiplied form | §5.5 (1399–1413) |
| R11 two eigenvalues | repaired: annihilating polynomial, eigenspaces may vanish | §5.2 (1299–1302) |
| R12 root of unity | repaired: unit-modulus phase, root of unity for rational `r` | §3.1 (860–865) |
| R13 eta-product multiplier | repaired: group character not factoring through `d` | §3.2 (896–899) |
| R14 period one on `Γ(N)` | repaired: `T ∈ Γ` hypothesis, width `4m` | Conventions (246–250), §2.3 Checks, §6.2 Checks |
| R15 Shintani normalization | repaired: `Sh_D⁺` Fourier-normalized, adjoint, cycle lift `Φ_k`, KZ Cor. 8 | §5.7 (1450–1498) |
| R16 statement-only results | repaired: “Every theorem … is a proof target” | Proof scope (33–36) |
| R17 Conrey supplier | repaired: native `DirichletCharacter ℂ N`, label a string | §7.1 (1675–1677) |
| R18 automorphy-factor owner | repaired: AutomorphicBundles §§11.3–11.4 consumed | Scope (78–80), contracts (344–348), §3.1 |
| R19 Niwa's weights | repaired: Cipra Theorems 2.16–2.17, Corollary 4.10 | §1.3 (672–679) |
| R20 statable headlines | repaired: odd-unary cusp theorem, `Module.Basis` Serre–Stark A and B | Lean 319–356 |
| R21 padding | repaired: the seven boundary/API theorems are gone | Lean (15 `sorry`s remain, all headline-shaped) |
| R22 shape and locators | repaired: scope/conventions/contracts/build headings, per-layer Examples and Dependencies, Checks per definition | README throughout |
| R23 gate build | repaired: `module` header | Lean line 1; gate `build=0` |
| R24 build order | repaired: §4.5 before §4.6, §1.3 no longer needs §4.5 | Layer 4 Dependencies (1256–1258) |

**Gate and dependency check** (the worker's gate at this head, and the check run by me):

```text
gate HalfIntegralWeightModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
depcheck: 204 roadmaps, 1600 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty. No process words, LaTeX delimiters, `lemma`, `set_option`, `#check`, `#eval` or sorry'd data in the files; every Lean name is in the README and every backticked own name of the README is declared.

**Lean.** `lake env lean` on a scratch copy with each of the 15 `sorry`s replaced by `first | rfl | simp | infer_instance` reports 15 errors at lines 211, 242, 246, 263, 271, 279, 288, 293, 315, 323, 348, 356, 365, 370, 397: no admitted theorem closes in one tactic. The 39 elaborated signatures (worker's `signatures.md`, recomputed `#check @…` for `UnaryIndex.mk` and `HalfIntegralForm.mk`) match the README: `finiteDimensional` has `Γ ≤ Gamma0 4` and `[Γ.FiniteIndex]`; `finrank_cuspSpace_four` has `2 ≤ k`; `finrank_plusSpace` has `1 ≤ k`; the Serre–Stark bases carry `[NeZero N]`, `4 ∣ N`, the index has `0 < r`, `0 < t`, primitivity, evenness and `r²t ∣ N/4`; the closed eta forms carry `0 < c` and the parity. `#eval` on the probe: `dedekindSum 1 3 = 1/18`, `dedekindSum 3 7 = −1/14`, `dedekindSum (−1) 3 = −1/18`, `dedekindSum 1 0 = 0`, `sawtooth (1/3) = −1/6`, `sawtooth 1 = 0`: the definition's coercions are rational, as intended.

**Adversarial table.** Values computed in Python (exact rationals for `q`-series, double precision for the analytic identities, truncations adapted to `Im z`); the sampled targets, the headlines and every passage a finding touches are covered.

| Statement | Instances and values | Result |
|---|---|---|
| 0.1 `j = θ(γz)/θ(z) = ε_d^{−1}(c/d)(cz+d)^{1/2}` | `z = 0.13+0.71i`, nine matrices of `Γ₀(4)` incl. `[[3,1],[8,3]]`, `[[−1,0],[8,−1]]`, `[[7,4],[12,7]]`, `[[3,2],[64,43]]`, `−I`, `T`: ratio and formula agree to `3·10⁻¹⁴` | sound |
| 0.1 `j(−I) = 1`, `ν_θ(−I) = −i`, `ν_θ([[3,1],[8,3]]) = i` | `1/(−1)^{1/2} = −i`; `ε₃^{−1}(8/3) = (−i)(−1) = i` | sound |
| 0.1 `W₄`-law `θ(−1/(4z)) = (−2iz)^{1/2}θ(z)` | `z = i`: `1.4194954880837662` both sides; `z = 0.3+0.8i`: `1.28393−0.21624i` both | sound |
| 0.2 carrier, zero and theta | law `0 = 0`; `θ`: identical products; cusp bound of `e(−z)` fails (`e^{2πy}`) | sound |
| 0.3 `coeff` as a line integral | `∫₀¹ e(−n(x+i)) Σa(m)e(m(x+i)) dx = a(n)` (`e^{−2πn}e^{2πn}`); `coeff_add`, `coeff_smul` proved in the file | sound |
| 0.3 product twists | `f` weight `k+1/2`, `g` weight `l`: `(cz+d)^l = χ₋₄(d)^l j^{2l}`; two half-integral: `j^{2(k+l+1)} = χ₋₄^{k+l+1}(cz+d)^{k+l+1}` | sound |
| 0.4 `m_θ` into `modFormCharSpace (k+1)(χχ₋₄^{k+1})` | `χ(d)j^{2k+2} = χ(d)χ₋₄(d)^{k+1}(cz+d)^{k+1}` | sound |
| 0.4 odd character | `−I`: `f = χ(−1)f` forces `f = 0` | sound |
| 0.6 `F`, `W₄F` | `(E₂ − 3E₂(2z) + 2E₂(4z))/(−24) = q + 4q³ + 6q⁵ + 8q⁷`; `(E₂ − 6E₂(2z) + 8E₂(4z))/48 = 1/16 − q/2 + 3q²/2 − 2q³ + 3q⁴/2 − 3q⁵`; `−3+9−6 = 0` nonholomorphic parts cancel; `W₄F` derived from `E₂(−1/τ) = τ²E₂(τ) + 6τ/(πi)` | sound |
| 0.6 cusp `1/2` | `θ(Az)(2z+1)^{−1/2}` vs `2η(4z)²/η(2z)` at `z = i`: `0.415760602596027` both; at `0.2+0.5i`: `0.86563+0.28231i` both; order `1/4`; `(2k+1)/4 mod 1 ∈ {1/4, 3/4}` | sound |
| 0.6 dimensions | `⌊k/2⌋+1`: `1,1,2,2,3,…`; `⌊(k+1)/2⌋+1` (even `k+1`) and `(k+2)/2` (odd) give `dim M_1(4,χ₋₄) = 1`, `M_2(4) = 2`, `M_3(4,χ₋₄) = 2`, `M_4(4) = 3`; evaluation map `θ^{2k+1} ↦ (1,1)`, `θ^{2k−3}F ↦ (0,1/16)` needs `k ≥ 2` | sound |
| 1.1 weight-`1/2` eigenvalue | `θ`, `p = 3`: `b(0) = 1 + 1/3 = 4/3`, `b(1) = 2 + 2/3 = 8/3 = (4/3)·2` | sound |
| 1.2 Euler quotient | `θ, p=3`: `(1−X/3)/(1−4X/3+X²/3) = 1/(1−X)`; `δ, p=3`: `X`-coefficient `252−243 = 9 = a(9)` | sound |
| 1.3 ordinary lift | `δ`: `A₁(n) = 1,−56,252,−704,4830,−14112,−16744` `=` `Δ(z)−32Δ(2z)`; sign test `9+243 = 252` vs `9−243 = −234` | sound |
| 1.3 trivial bound route | `θ^{−1} = 1−2q+4q²−8q³+14q⁴−24q⁵+40q⁶−64q⁷+…`, `2062` at `16` | R04 |
| 1.3 `k = 0` obstruction | `A₁(1), A₁(2), A₁(5) = 2, 2, 12/5` with `(d,4) = 1` | sound |
| 2.1 characters | `A₁`: `(4/d) = 1`; `A₃`: `(8/3) = −1`; `diag(2,2,6)`: level `12` (`N·A⁻¹` even needs `N/6` even), `(48/5) = (3/5) = −1`; `v₂(det)` even forces a type-I constituent at `j ≥ 2`: with all type-I at `j = 1`, `v₂(det) ≡ rank L₁ ≡ 1` | sound |
| 2.2 `Θ_{A₃}`, `Θ_{D₅}` laws | coefficients `1,12,6,24,12,24,8,48` and `1,40,90,240,200,560` by enumeration; law `Θ(γz) = (8/d) j³Θ(z)`, `(8/d) j⁵Θ(z)` at `z = (−d+i)/c` for `[[1,0],[8,1]]`, `[[−1,0],[8,−1]]`, `[[3,1],[8,3]]`, `[[5,3],[8,5]]`, `[[−3,−1],[16,5]]`: relative error `≤ 10⁻⁹`; the even-rank sign `(−8/d)` fails at `[[−1,0],[8,−1]]` and `[[3,1],[8,3]]` (relative error `2`) | sound |
| 2.2 `diag(2,2,6)` | law with `(3/d)` at `[[5,2],[12,5]]`, `[[7,4],[12,7]]`, `[[−5,−3],[12,7]]`: error `≤ 5·10⁻¹⁴`; trivial character fails (error `2`) | sound |
| 2.2 `Θ_{E₇}` | `θ⁷ + 112θ³F`: `14+112 = 126`, `84+672 = 756`, `280+1792 = 2072` | sound |
| 2.2 sum characters | `(2detL/d)(2detM/d)(−1/d)^{k+l+1} = ((−1)^{k+l+1}detL·detM/d)` | sound |
| 2.3 coset of `√2ℤ` | `2q^{1/4}+2q^{9/4}+…`, `e(1/4) = i` under `T`, `1` under `T⁴` | sound |
| 2.4 odd lattice | `Θ_{√2L}(z/2) = Σe(‖v‖²z/2) = Θ_L(z)` | sound |
| 3.1 phase | `(−I,−I,√2)`: `e^{2πi√2}`, modulus `1`, infinite order; `r = 1/2`: `−1`; `r = 1`: `1`; `σ_r` from `J(γδ) = J(γ,δz)J(δ,z)` | sound |
| 3.2 `η(z)η(11z)` | at `T`: `e(1/24)e(11/24) = −1` | sound |
| 3.3 Dedekind sums | `s(1,3) = 1/18`, `s(3,7) = −1/14`, `s(3,7)+s(7,3) = −1/63 = 59/252 − 1/4` | sound |
| 3.3 Apostol and both closed forms (Lean's exact expressions) | 13 matrices with `c > 0` (odd and even `c`, negative `d`, `S`, `[[1,0],[2,1]]`, `[[−2,−1],[7,3]]`, `[[1,−1],[6,−5]]`, …) at `z = 0.27+0.63i`: all three expressions agree with `η(γz)` to `4·10⁻¹⁴`; `[[1,0],[2,1]]` gives `e(−1/12)` | sound |
| 3.4 eta quotient character `(2s/·)` | `θ`: `(4/d) = 1`; `η(24z)`: `(48/d) = (3/d) = (12/d)`; `η(8z)³`: `1`; `η(z)²/η(2z) = 2θ(4z)−θ(z)`: `(1/d)`; `η(3z)²/η(6z) = 2θ(12z)−θ(3z)`: `(3/d)` — all agree with Serre–Stark's `ψχ_t` | sound |
| 3.4 identities | `θ(i) = 1.003734885487739 = η(2i)⁵/(η(i)²η(4i)²) = η(i+1/2)²/η(2i+1)`; `η((i+1)/2)²/η(i+1) = 1.086434811213307` | sound |
| 4.1 `h_{ψ,t}` series form | `ν = n/r`: `r·(n/r)·e(tn²z)` | sound |
| 4.1 Fricke identity | `θ_{ψ,t}(−1/(4r²t²z)) = g(ψ)(−2itz)^{1/2}θ_{ψ̄,t}(z)` for `ψ = χ₁₂` (`|g| = √12`), the even cubic character mod `7` (`|g| = √7`, complex values), `ψ = 1`, `t = 1,2,3`, `z = 0.11+0.37i`: both forms agree to `2·10⁻¹⁵` | sound |
| 4.1 identities | `θ_{χ₁₂,1}(z) = 2η(24z)`, `h_{χ₋₄,1}(z) = 2η(8z)³` at `z = 0.05+0.21i`: `0.50839+0.16519i`, `0.50843+0.16517i` both sides | sound |
| 4.2 index sets | `N = 4`: one index; `N = 16`: `(1,1),(1,2),(1,4)` (no primitive even character of conductor `2`), `dim = 3`; `N = 196`: the cubic `ψ` is the only index with `χ = ψ` | sound |
| 4.3 totally even | `χ₁₂`: `(a,b,u) = (4,3,7)`, `χ₁₂(7) = −1`; conductor `1`: `ψ(u) = 1`; smallest non-totally-even even conductor `12` | sound |
| 4.4 | `A₁(2) = 2` (restricted), `3` (unrestricted) | sound |
| 4.5 `T(9)h_{χ₋₄,1}` | coefficients `2,−6,10,−14`; `b(1),b(4),b(9) = −8,0,24 = −4·(2,0,−6)`; `χ(p)(−tm²/p) = ψ(p)` | sound |
| 4.6 Shimura decomposition | level `4`, weight `3/2`: `0 = 0+0`; `δ`: eigenvalues `252, 4830` are `τ(3), τ(5)` | sound |
| 4.7 fields | `δ`: coefficients and eigenvalues in `ℚ`; cubic `ψ`: `2, 2ζ₃` | sound |
| 5.1 `H_{5/2}` | `θ⁵ − 20θF = 1 −10q −70q⁴ −48q⁵ −120q⁸ −250q⁹` (`r₅ = 1,10,40,80,90,112,…,200,250`; `θF = q+2q²+4q³+8q⁴+8q⁵`); `H(2,N) = −1/12,−7/12,−2/5,−1,−25/12` | sound |
| 5.1 `θ^{2k+1} ∉ M⁺` | `q²`-coefficient `2(2k+1)(2k)`, `2 ≢ 0,1` | sound |
| 5.2 `W₄U₄` | `U₄θ⁵ = θ⁵ + 80θF`, `U₄(θF) = 8θF`, `W₄(θF) = θ·W₄F = θ⁵/16 − θF`; matrix `[[6,1/2],[−80,−8]]`, eigenvalues `−4, 2`, eigenvector `(1,−20)`; `α_k = (2/(2k+1))2^k = (−1)^{⌊(k+1)/2⌋}2^k` for `k = 2..8`; `k = 1`: `Aθ³ = θ³`, `pr⁺θ³ = 0` | sound |
| 5.3 `T⁺(4)δ`, `T(9)δ` | `−24, 1344, −2880` at `n = 1,4,5`; `T(9)δ = 252, −14112, 30240 = 252·(1,−56,120)` | sound |
| 5.3 `Sh_t = Sh_D⁺ − (D/2)2^{k−1}Sh_D⁺(2z)` | even `d = 2d'`: `(D/d)d^{k−1}c(|D|n²/d²) = (D/2)2^{k−1}(D/d')d'^{k−1}c(|D|(n/2)²/d'²)` | sound |
| 5.3 dimensions | `dim M⁺_{k+1/2}(4) = dim M_{2k}`: `0,1,1,1,1,2,1,2,2,2`; `M_{13/2}(4)` has dimension `4`, plus part `2` | sound |
| 5.5 Kohnen–Zagier | kohnen-zagier lines 100–114: `c(|D|)²/⟨g,g⟩ = ((k−1)!/π^k)|D|^{k−1/2}L(f,D,k)/⟨f,f⟩`, `⟨g,g⟩ = (1/6)∫`, `|c|²` for any normalization; `|c(5)|² = 14400` for `δ` and `iδ` | sound |
| 5.7 cycle normalization | `∫₀^{i∞}f(z)z^{k−1}dz = i^kΓ(k)(2π)^{−k}L(f,k)`; `(−1)^{k/2}i^k = 1`; one class of discriminant `1` (`XY`) | sound |
| 6.1 `E_{4,1}` | `M⁺_{7/2}` generator `θ⁷ − 14θ³F = 1+56q³+126q⁴+576q⁷+756q⁸+1512q¹¹+2072q¹²`; `c(1,r) = 1,56,126,56,1`, `c(2,r) = 126,576,756,576,126`; `c(n,r)` of `E_{4,1}²` depends on `(8n−r², r mod 4)` | sound |
| 6.2 theta S-law kernel | `m = 3, μ = 1, τ = 0.2+1.1i, z = 0.3+0.1i`: `θ_{m,μ}(−1/τ,z/τ) = (τ/2mi)^{1/2}e(mz²/τ)Σ_ν e(−μν/2m)θ_{m,ν}` (error `6·10⁻¹⁶`); with `e(+μν/2m)` error `3.0` | sound (so the `h`-law has `e(+μν/2m)`) |
| 6.2 `h`-law on `E_{4,1}² ∈ J_{8,2}` | `h_μ(−1/τ) = e(1/8)τ^{15/2}/2·Σ_ν e(μν/4)h_ν(τ)` at `τ = 0.3+0.9i`, `μ = 0..3`: relative error `≤ 5·10⁻¹⁶`; `h_μ(τ+1)/h_μ(τ) = e(−μ²/8)` (`1, e(−1/8), −1, e(−1/8)`) | sound |
| 6.3 dimension bound | `(2,6)`: `7 − 8 = −1`; `(4,1)`: `1+1−1 = 1`; odd `k`: `J_{11,2}` | R03 |
| 6.4 oldforms | `E₆Δ = q − 528q²`; `B_{2,1}F = F + 2⁹F(2z)`: `1, −16`; `S^−(m) = ⊕_{ld²∣m} S^{new,−}(m/ld²)|B_{l,d}` is skoruppa-zagier (2), p.138; root number of level one weight `w`: `(−1)^{w/2} = (−1)^{k−1}` | sound |
| 7.1 record | `dimnew = dim − dimtheta` (lmfdb-code line 103); `newpart` fields `dim_image, half_forms, mf_label, nf_label` (lines 116–121); `thetas` a list of character labels (127–131) | sound |
| 7.2 search | filters `weight, level, character` only (lmfdb-code lines 56–60) | sound |
| 7.3 coverage | all 16 rows point at existing milestones; `cmf.shimura_correspondence` says “cusp forms for `k ≥ 5`” (line 102) and uses `(−1/m)` (line 98), as §1.3 records | sound |

**Library declarations opened at the pins** (Mathlib `f6090c70…`, Tau Ceti `358314d4…`): `jacobiTheta_two_add` (JacobiTheta/OneVariable.lean:34), `jacobiTheta_S_smul` (:43, `jacobiTheta (S•τ) = (−Iτ)^{1/2}·jacobiTheta τ`), `hasSum_nat_jacobiTheta` (:71), `isBigO_at_im_infty_jacobiTheta_sub_one` (:112), `mdifferentiable_jacobiTheta` (JacobiTheta/Manifold.lean:28), `jacobiTheta₂_functional_equation` (TwoVariable.lean:465), `jacobiTheta₂_add_left/right` (:384, :376), `ModularForm.eta` (DedekindEta.lean:56), `eta_ne_zero` (:113), `multipliableLocallyUniformlyOn_eta` (:102), `differentiableAt_eta_of_mem_upperHalfPlaneSet` (:147), `logDeriv_eta_eq_E2` (:165), `UpperHalfPlane.qExpansion` (QExpansion.lean:171, explicit `h`), `changeLevel` (DirichletCharacter/Basic.lean:65), `conductor` (:245), `primitiveCharacter` (:306), `ZMod.χ₄`, `χ₈` (ZModChar.lean:42, 118), `jacobiSym` (JacobiSymbol.lean:86), `IsBoundedAtImInfty`/`IsZeroAtImInfty` (FunctionsBoundedAtInfty.lean:45, 49), `widthInfty` (Cusps.lean:328), `IsCusp` (:57), `CuspOrbits` (:166), `denom` (MoebiusAction.lean:32); Tau Ceti `modFormCharSpace` (DiamondOperators.lean:315), `cuspFormCharSpace` (:279), `mem_modFormCharSpace_iff` (:328), `mem_modFormCharSpace_iff_nebentypus` (:344), `eq_of_mem_cuspFormCharSpace_of_ne_zero` (:307), `diamondOpHom` (CharacterDecomp.lean:91), `finiteDimensional_modularForm_finiteIndex` (SturmBound.lean:118: `[𝒢.HasDetOne] [𝒢.IsFiniteRelIndex 𝒮ℒ] [DiscreteTopology 𝒢.strictPeriods]`), `sturm_bound_finiteIndex` (:28), `HeckeRing.GL2.Newform` (Newforms/Newform.lean:104), `numberField_CoefficientField` (Newforms/NumberField.lean:157), `CharacterField` (Newforms/Fields.lean), `mvPolynomialEquivModularForms` (LevelOne/GradedRing.lean:746), `hurwitzClassNumber` (HurwitzClassNumber.lean:30), `typeARootLattice`, `typeE₇RootLattice` (TypeE.lean:396), `checkerboardLattice`, `Petersson/Basic.lean`, `LFunction/`. Object searches for Dedekind sums, half-integral forms, Kohnen plus spaces, unary theta series, eta quotients and Jacobi forms find nothing in either pin (the Tau Ceti `plusSpace` hits are period-polynomial spaces), so the roadmap's definitions duplicate nothing.

**Cross-roadmap citations resolved** (main or the open head the brief provides; `roadmaps show` for the three suppliers without a provided checkout): AutomorphicBundles §11.3 (`AutomorphyFactor`, line 3874) and §11.4 (`slashActionOfAutomorphyFactor`, 3928); GeometryOfNumbersAndQuadraticArithmetic §4.3 (`HalfIntegralCuspForm k N` with law `j^{2k}`, `thetaMultiplierPhase`, `halfIntegralKloosterman`, `halfIntegralCoefficientBound`, `jacobi_product_specialization`, lines 1734–1783); MetaplecticAutomorphicForms 6.17, 6.18 (`jacobiSpace`, `_central`, `_elliptic`, `_weight`), 6.20 (`jacobi_thetaDecomposition`), 7.1 (unitary `J = j|cz+d|^{−1/2}`), 7.10 (`pr⁺ = (2/3)WU + 1/3`, `√2` from `y^{1/4}`), 7.49, 4.7, Layers 2–6; QSeriesPartitionsAndMockModularForms §5.2 (`ν_η(T) = e(1/24)`, `ν_η(S) = e(−1/8)`), §6.1 (`g(a,b;τ)`, shift and sign laws), §9.1 (`θ_{m,l}` with `jacobiTheta₂`), at the head of its pull request; ThetaSeries Layers 2, 3, 6, 7, sub-items 6F, 7C, 7D, 7E and all 20 declaration names (its `Suggested.lean`), and its “out of scope” sentence (line 31); ModularForms Layers 0–10 and 8G (headings at lines 259–1204), `CoefficientField`, `CharacterField`, `η²⁴ = Δ`, the `η(z)η(11z)` remark (1355); IntegralLattices 1G, 1H, 3A, 3B and its line 171; SiegelModularForms (open head) §§9.2–9.6 consume `HalfIntegralWeightModularForms` 6.1–6.4 and its *Not owned here* (lines 76–84) defers half-integral weight here; MaassForms (open head, line 153) defers the plus space and Shimura lift here. No roadmap on main or at an open head builds a half-integral carrier, Dedekind sums, Serre–Stark, the Kohnen plus space, the Shimura lift or the classical Jacobi carrier (`roadmaps grep` counts: all hits outside this roadmap are citations or deferrals; GrossZagierAndArithmeticHeights has no half-integral statement; EndoscopicTransfer's Waldspurger is the transfer). Ownership against open pull requests without a provided checkout was checked only through `roadmaps grep`/`show`.

**Seeded source audit.**

| Target | Text and result |
|---|---|
| 0.1 | Mathlib `jacobiTheta_S_smul` at the pin; numerics above; GeometryOfNumbers §4.3 supplies `j` |
| 0.2 | the carrier's fields against Mathlib's `IsBoundedAtImInfty`; GeometryOfNumbers §4.3's law `j^{2k}` agrees with the multiplied-out law |
| 0.4 | Tau Ceti `modFormCharSpace`, `mem_modFormCharSpace_iff_nebentypus` at the pin; lmfdb-mf.half_integral_weight line 92 (`f(γz) = χ(d)j^k f`) |
| 0.6 | Koblitz paywalled (uncertified); the basis and dimensions recomputed above |
| 2.2 | numerics above; ThetaSeries 7C/7D read |
| 2.4 | lmfdb-lattice.theta line 90 (generating function only, no modularity claim) |
| 4.3 | Serre–Stark paywalled; the index set `4r²t ∣ N` is confirmed indirectly by cipra line 1864 (`U_t`, weight `1/2`) and 1856–1857 |
| 4.6 | lmfdb-shimura_decomposition lines 90–96 (definition of `S_{k/2}(N,χ,F)` and `S_0`) |
| 4.7 | ModularForms Layer 8G; Tau Ceti `numberField_CoefficientField` |
| 5.2 | Kohnen 1980 paywalled; the operator and `α_k` recomputed above |
| 5.3 | kohnen-zagier lines 319–324 (equation (4), `Sh_D⁺g = c(|D|)f`), Kohnen 1980 uncertified |
| 5.5 | kohnen-zagier lines 100–114, printed p.177 (Theorem 1 with the `1/6`) |
| 5.7 | shintani lines 716 ((2.14), p.106), 810–821 ((2.19) and Theorem 2, p.109); kohnen-zagier lines 338–361 (Shintani's `C(n)`, `Φ = (−1)^{k/2}2^kΣC(n)qⁿ`, Corollary 8, p.183) |
| 6.1 | eichler-zagier lines 718–735 (Theorem 2.2, printed p.21–22); lmfdb-mf.jacobi lines 90–107 |
| 7.3 | lmfdb-code lines 42–63, 101–137; the eight knowls read |

Also read: niwa lines 51–72 (Theorem, printed p.148: `κ ≥ 7`, image in `𝔖_{κ−1}(2N, χ²)`); cipra lines 1232–1236 (Theorem 2.16, p.88), 1287–1302 (equation (2.60) with the constant term “the unique value which makes `S_t(G)` a modular form”, Theorem 2.17, p.90), 1854–1861 (Corollary 4.10, p.108); eichler-zagier lines 1941–1972 (Theorem 5.1 and (9), p.56; OCR loses the displayed formula, so the `S`-law was verified numerically instead), 2116–2124 (Theorem 5.4, p.61), 3342–3353 (Theorem 9.2 and its corollary, pp.101–102); skoruppa-zagier lines 56–66 (Main Theorem, p.114), 93–112 (the space `𝔐_k(m)` and the sign condition (1), p.115), 847–872 (§3 definition, p.136–137), 874–886 (Theorem 5), 901–909 (`B_{l,d}`, (2)); ligozat line 1007.

## Not verifiable

- **Shimura 1973** (JSTOR landing page only): Propositions 1.0, 1.5, 1.6, 2.2 and its Remark, Theorems 1.7, 1.9, the Main Theorem (in particular its eigenform hypothesis as the README phrases it, “for every prime `p ∣ N` not dividing the conductor of `χ_t`”), Proposition 3.7. Consequences checked above do not certify them.
- **Serre–Stark** (Springer LNM): Theorems A and B; the index set and the totally-even criterion are consistent with Cipra's `U_t` only.
- **Kohnen 1980, 1982, 1985** (Springer, De Gruyter): Proposition 2, the level-`4N` newform theory, the discriminant-twisted Shintani normalization.
- **Waldspurger 1981**: no legal text found; Corollaire 2 as stated agrees with the literature's shape only.
- **Cohen 1975**, **Apostol**, **Knopp**, **Koblitz**: paywalled; the numbered theorems are cited from memory of the standard texts and were not opened.
- **Eichler–Zagier (1985 book)**: only the 1983 MPIM preprint was read (image-only OCR); the README correctly cites the preprint's pages.
- **Gross–Kohnen–Zagier II**: cached (Math. Ann. 278) but only cited for the `ε = −1` convention; not checked beyond its table of contents.
- The LMFDB `halfmf_forms` pages themselves were not fetched; the renderer source and the knowls were.

## Source issues

- **Error** in lmfdb-mf.half_integral_weight.theta at the definition, unpaginated, lines 90–93: the source calls `Σ e^{πizn²}` a modular form of weight `1/2` and level `4`; it should be `Σ e^{2πizn²}`, or the stated function on the conjugate group, since the displayed series has period `2`; affects a stated result.
- **Misprint** in lmfdb-mf.half_integral_weight.shimura_decomposition at the definition, unpaginated, line 90: the source places `S_0(N,χ)` and its complement inside `S_{3/2}(N,χ)` for every odd `k`; it should be `S_{k/2}(N,χ)`; affects a stated result.
- **Misprint** in lmfdb-mf.jacobi at the transformation law, unpaginated, lines 97–100: the source uses an index `m` in the exponential after naming the index `N`; it should use `N`; affects nothing.
