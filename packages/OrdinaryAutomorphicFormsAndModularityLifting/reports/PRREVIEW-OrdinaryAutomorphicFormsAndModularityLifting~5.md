# Review of OrdinaryAutomorphicFormsAndModularityLifting (pull request #1066 at d7f95e2)

**Verdict:** accepted

Incremental re-review of the 7 changed lines since `4264526` (README §2.12(a) only: the existence range of the two-character Hilbert Eisenstein series `E_n(φ₁, φ₂)`, the modulus of the characters in Wiles' vanishing, the generality note at the DDP locator, and the two rewritten Checks on the excluded pairs and on the parity of Wiles' vanishing). `Suggested.lean` is unchanged since `cde3e6f`. The gate passes on this head, the dependency check reports no UPWARD, CYCLE or `moved:` line, and the diff outside the folder is empty. Both findings of the previous review are repaired; one wording slip in a new Check is noted below as P3.

## R01 (P3) — the modulus-`𝔞` clause of the excluded-pairs Check names the holomorphic combination as "the regularised series"

**Location.** README 377 ("for `φ₁` trivial of modulus `𝔞 ≠ 1` and `𝔟 = 1` the regularised series is `−Σ_{e | rad 𝔞} μ(e)E₂(ez)/24`, whose non-holomorphic part `(8πy)⁻¹Π_{q | 𝔞}(1 − q⁻¹)` is again nonzero").

**Claim.** Hecke's regularisation of the series with Dirichlet series `L(s, φ₁)ζ(s − 1)`, `φ₁` the trivial character of modulus `𝔞 ≠ 1`, has a nonzero non-holomorphic part.

**Witness.** The claim is right, the displayed expression is not the regularised series: `E₂` is holomorphic, so `−Σ_e μ(e)E₂(ez)/24` has no non-holomorphic part. With `E₂*(z) = E₂(z) − 3/(πy)`, the regularised series is `−Σ_{e | rad 𝔞} μ(e)E₂*(ez)/24 = −Σ_e μ(e)E₂(ez)/24 + (8πy)⁻¹Σ_e μ(e)/e`, and `Σ_{e | rad 𝔞} μ(e)/e = Π_{q | 𝔞}(1 − q⁻¹) ≠ 0`: the value the Check states. (The first clause of the same Check writes the `𝔞 = 1` case correctly as `−E₂/24 + 1/(8πy)`.)

**Repair.** Replace `E₂(ez)` by `E₂*(ez)` in that clause, with `E₂* = E₂ − 3/(πy)` named once, or write the series as `−Σ_{e | rad 𝔞} μ(e)E₂(ez)/24 + (8πy)⁻¹Σ_{e | rad 𝔞} μ(e)/e`.

## Previous findings

- R01 (r4) — repaired: README 367 now states the existence "excluding only the pairs with `F = ℚ`, `n = 2`, `𝔟 = 1` and `φ₁` trivial on the ideals prime to `𝔞`", notes at the DDP locator that Proposition 2.1 states the existence without this exclusion, and README 377 is the requested negative-control Check (`M₂(SL₂(ℤ)) = 0`; `𝔟 = (q)` gives `(qE₂(qz) − E₂(z))/24` with constant `(q − 1)/24`). The exclusion is exactly the failing set (table below). The Wiles-vanishing clause now fixes `φ⁻¹ψ` at modulus `𝔫p`, so `𝔟 = 𝔫p ≠ 1` and every term is in range.
- R02 (r4) — repaired: README 378 computes with the depleted values `(1 − p²)ζ(−2) = 0` and `(1 − p)ζ(−1) = (p − 1)/12`, identifies the normalized constant `(p − 1)/24` with that of `(pE₂(pz) − E₂(z))/24`, and says the sign condition admits `E_n(φ, φ⁻¹ψ)` only for even `n`; the `F = ℚ` reduction is `d(1)·(p − 1)/24 = 0 ⇒ d(1) = 0`.

## Verified sound

**Gate and dependency check.** Worker's gate at `d7f95e2`: every check 0, `build=0 OK`. My rerun from the worktree: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. Dependency check (`--movable`, content at main): `depcheck: 205 roadmaps, 1438 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; the edge set is that of `4264526` (the diff adds no supplier). `git diff --stat origin/main...HEAD` outside the folder: empty. Merge order: LFunctions 23, IntegralIwasawaTheory 24, NoncommutativeAndEquivariantIwasawa 25, ClassicalSerreModularity 150, PadicFamilies 153, this roadmap 154.

**Elaboration.** `Suggested.lean` is unchanged (last commit on the file `cde3e6fd`). `lake env lean` on a scratch copy with `#check @` for its seven declarations (`IsCohenMacaulayLocal`, `puncturedSpectrum_connected`, `components_meet_in_large_dimension`, `IsRelativeCompleteIntersection`, `numerical_completeIntersection_criterion`, `pPrimaryClassNumber`, `cyclotomic_classGroup_primary_stabilizes`): exactly four `declaration uses sorry` warnings (lines 44, 56, 82, 112), no error, exit 0; the seven elaborated types equal the worker's signatures file and the README statements of §4.3, §4.20 and §5.9 (the hypothesis `IsCohenMacaulayLocal A`, the binders `[IsDiscreteValuationRing C]`, `[IsAdicComplete …]`, `[Module.Finite C T] [Module.Flat C T]`, `[IsAbelianGalois ℚ K]` are explicit in each signature; none lost a section binder). The one-tactic probe of r2 (none of the four theorems closes by `rfl`, `simp`, `infer_instance`, `simp_all` or `aesop`) and the headline list (CM connectedness, the numerical criterion, Washington's theorem stated; the Skinner–Wiles lifting theorems named in the docstring as not statable at the pins) carry over unchanged.

**Citations and suppliers in the changed lines.** The diff adds no cross-roadmap citation and no Lean name; the `*Needs:*` line (README 386) and the Layer 2 `### Dependencies` line (README 394) are unchanged and still list the two suppliers the Wiles-vanishing route uses (LFunctions Layer 5, Mathlib `linearIndependent_monoidHom`, resolved in r4 at `TauCetiRoadmap/LFunctions/README.md` 929–1058 on main and `Mathlib/LinearAlgebra/LinearIndependent/Basic.lean:502` at the pin). The Summary (README 3), Scope (README 9), supplier contract (README 96) and PadicFamilies contract (README 102) still describe the two-character series, Chai's form and Wiles' vanishing as the three Eisenstein statements owned here; none of them restates the existence without the exclusion (they name the object, §2.12(a) states the range). The worker's citation scan found nothing dangling.

**Seeded sample.** Of the fifteen sampled targets only 2.12 changed; the other fourteen rows of r2/r3 stand (sw99 `ec0697b3`, printed page = PDF page + 3; sw01 `f847ed87`; acc `7c882c4d`; drs `afe51e77`; waldschmidt `19b8b01e`; washington `b0954600`). Re-read this round:

| Target | Source, locator | Lines | Result |
|---|---|---|---|
| 2.12(a) generality note at the DDP locator | DDP Prop. 2.1, p. 459 | ea435711 842–869 | "Let `k ≥ 1`" with only the sign condition `q + r ≡ (k, …, k)`; "For all `k ≥ 1`, there exists `E_k(η, ψ) ∈ M_k(𝔞𝔟, ηψ)`" with (48); (49) for `k > 1`: the README's "states the existence for every `k ≥ 1` and every admissible pair without excluding the degree-one weight-two pairs" is what the source says |
| 2.12(a) depletion convention | DDP p. 458 | ea435711 847–850 | `L` without subscript depletes at the archimedean places and the primes dividing the modulus; `ηψ⁻¹` viewed with modulus `𝔞𝔟`: the README's "every L-value depleted at the same set of primes, those dividing `𝔫p`" is the source's convention at `𝔞 = 1`, `𝔟 = 𝔫p` |
| 2.12(a) (48)–(49), component convention, Shimura locator, SW99 (3.10)–(3.11), Wiles' vanishing | r4 rows | text unchanged | r4 ✓ |

**Adversarial table.** Rows for statements the diff leaves untouched are r2's, r3's and r4's (cited); new rows carry this round's values. Throughout `E₂ = 1 − 24Σσ₁(m)qᵐ` and `E₂* = E₂ − 3/(πy)`.

| Statement | Instance | Computed | Result |
|---|---|---|---|
| §2.12(a) existence range (README 367): the excluded set is exactly the failing set | `F = ℚ`, `n = 2`, `φ₁`, `φ₂` trivial-valued of moduli `𝔞`, `𝔟` | `L(s, φ₁)L(s − 1, φ₂) = Σ_{d ∣ rad 𝔞}Σ_{e ∣ rad 𝔟} μ(d)μ(e)e·(de)^{−s}ζ(s)ζ(s − 1)`; the term `(de)^{−s}ζ(s)ζ(s−1)` is the series `−E₂*(dez)/24`, non-holomorphic part `1/(8π·de·y)`; weighted sum `(8πy)⁻¹Σ_d μ(d)/d · Σ_e μ(e) = (8πy)⁻¹Π_{q ∣ 𝔞}(1 − q⁻¹)·[𝔟 = 1]`, nonzero iff `𝔟 = 1` | the README's exclusion (`𝔟 = 1`, `φ₁` trivial-valued) is exactly this set ✓ |
| §2.12(a) existence range: nontrivial primitive character | `F = ℚ`, `n = 2`, `φ₁` or `φ₂` with nontrivial primitive character | Hecke's weight-2 series `E₂^{ψ,φ}` is holomorphic unless both primitive characters are trivial (Diamond–Shurman Thm 4.6.2); an imprimitive pair is a combination of primitive ones at scaled arguments | holomorphic: outside the excluded set ✓ |
| §2.12(a) existence range: `𝔟 = 1` forces `φ₂ = 1` | `F = ℚ` | narrow ray class group modulo `1` of `ℚ` is trivial | the exclusion needs no condition on `φ₂` ✓ |
| §2.12(a) existence range: sign condition on the excluded pairs | `F = ℚ`, `n = 2`, `φ₁ = φ₂` trivial-valued | both even, `0 + 0 ≡ 2 mod 2` | the excluded pairs are admissible, so the exclusion is not vacuous ✓ |
| §2.12(a) existence, `n ≥ 3` | any `F`, any pair | `Σ N(cz + d)^{−n}` absolutely convergent for `n ≥ 3` | no further exclusion ✓ |
| Check README 377, `𝔞 = 𝔟 = 1` | `F = ℚ`, `n = 2` | coefficients `σ₁(m) = 1, 3, 4, 7, 6`, constant `2⁻¹ζ(−1) = −1/24`; `M₂(SL₂(ℤ)) = 0`; `−E₂*/24 = −E₂/24 + 1/(8πy)` | ✓ |
| Check README 377, `𝔞 ≠ 1`, `𝔟 = 1` | `φ₁` trivial mod `𝔞` | holomorphic part `−Σ_{e ∣ rad 𝔞} μ(e)E₂(ez)/24`, constant `−Σ_e μ(e)/24 = 0` (agrees with DDP (49): `0` for `𝔞 ≠ 1`); non-holomorphic part `(8πy)⁻¹Σ_e μ(e)/e = (8πy)⁻¹Π_{q ∣ 𝔞}(1 − q⁻¹) ≠ 0` | values ✓; the expression is named "the regularised series" with `E₂` for `E₂*`: R01 (P3) |
| Check README 377, `𝔟 = (q)` | `φ₁ = 1` mod `1`, `φ₂ = 1` mod `(q)` | `ζ(s)ζ(s − 1)(1 − q^{1−s})`: q-series `Σσ₁(m)qᵐ − qΣσ₁(k)q^{qk} = (qE₂(qz) − E₂(z))/24 + (1 − q)/24`; non-holomorphic parts `1/(8πy) − q/(8πqy) = 0`; the form `(qE₂(qz) − E₂(z))/24 ∈ M₂(Γ₀(q))` has constant `(q − 1)/24 = 2⁻¹(1 − q)ζ(−1)` | ✓ (corrects r4's `E₂(z) − qE₂(qz)`, which has constant `1 − q`) |
| Check README 377, `d ≥ 2` | level `1`, `n = 2`, `F` of degree `d` | constant term's second part carries `Π_v Γ(2s + 1)/(Γ(s)Γ(s + 2))` ∼ `s^d` against `ζ_F(2s + 1)` ∼ `(2s)⁻¹`: order of vanishing `d − 1 ≥ 1` at `s = 0` for `d ≥ 2`, `0` for `d = 1` (the `3/(πy)` term) | holomorphic for `d ≥ 2`, exclusion confined to `ℚ` ✓ |
| §2.12(a) Wiles' vanishing: modulus clause | `φ` of modulus `1`, `φ⁻¹ψ` of modulus `𝔫p` | `𝔞 = 1`, `𝔟 = 𝔫p`, level `𝔞𝔟 = 𝔫p`, nebentypus `φφ⁻¹ψ = ψ`; `p ∣ 𝔫p` so `𝔟 ≠ 1` | every term in the existence range for every `F`, including `ℚ` ✓ |
| §2.12(a) Wiles' vanishing: depletion | all `φ` | DDP (49) with `η = φ`, `ψ ↦ φ⁻¹ψ` of modulus `𝔫p`: `L(φ⁻²ψ, 1 − n)` depleted at the primes dividing `𝔫p`, the same set for every `φ` | ✓ (the independence argument needs no common set; it holds termwise) |
| Check README 378: parity values | `F = ℚ`, `𝔫 = 1`, `ψ = 1` mod `p` | `L(s, ψ) = (1 − p^{−s})ζ(s)`; `n = 3`: `(1 − p²)ζ(−2) = 0`; `n = 2`: `(1 − p)(−1/12) = (p − 1)/12`; normalized constant `2⁻¹(1 − p)ζ(−1) = (p − 1)/24`, equal to the constant of `(pE₂(pz) − E₂(z))/24` (previous row at `q = p`) | ✓ |
| Check README 378: sign condition | `φ`, `φ⁻¹ψ` totally even | `0 + 0 ≡ n mod 2` forces `n` even | `n = 3` admits no series; stated ✓ |
| Check README 378: instance of `ψ` | `χ` totally odd of modulus `p`, `ψ = χω⁻¹` | `ω` odd, so `ψ` even; `ψ = 1` at `χ = ω` | a genuine instance of the Conventions ✓ |
| Check README 378: `F = ℚ` reduction | `h = 1`, `t_1 = (1)` | `a_1 = Nm(1)^{n/2}·(p − 1)/24 = (p − 1)/24`; `d(1)(p − 1)/24 = 0 ⇒ d(1) = 0` since `p ≥ 3` | ✓ |
| Check README 373 (`φ₁ = 1`) | `φ₂` in range | `η = 1` in DDP (48)–(49): coefficients `Σ_{𝔯 ∣ 𝔪} φ₂(𝔯)N𝔯^{n−1}`, constant `2^{−d}L(φ₂, 1 − n)` on every component; the added "in the existence range" excludes only `F = ℚ`, `n = 2`, `φ₂ = 1` mod `1`, where the supplied `G_{2,1}` does not exist either | ✓ |
| §2.12(a) coefficient/Dirichlet series, Euler-factor Check, order Check, rescaling identity and scalar, `L(1 − n, χ) ≠ 0`, evenness of `φ`, level and nebentypus, Chai weight class, (3.10)/(3.11) Checks | r4 rows | text unchanged | r4 ✓ |
| §2.12(b)–(d), §2.11 | r2 rows | unchanged | r2 ✓ |
| §1.1–§1.6, §2.1, §2.9, §2.10 | r2 rows | unchanged | r2 ✓ |
| §3.36–§3.39, §4.3, §4.6a, §4.20, §5.1–§5.10, §6.3–§6.6, §6.14 | r2 rows | unchanged | r2 ✓ |

**Convention witnesses.** The normalisation `E₂ = 1 − 24Σσ₁(m)qᵐ` is pinned by the Check's value `−1/24` for the series with coefficients `σ₁(m)`; the sign of the `𝔟 = (q)` form is pinned by its constant `(q − 1)/24 > 0` agreeing with the depleted `2⁻¹(1 − q)ζ(−1)`. The DDP component dictionary and `Nm(t_i)^{n/2}` normalisation are r4's.

**Checks and shape.** §2.12 keeps ten Checks; the two rewritten ones are computed above. The changed lines contain no LaTeX delimiters, process words, pull-request numbers or local paths; the source note at the DDP locator is a timeless statement about the proposition's generality. Ownership against open pull requests: unchanged since r4 (`roadmaps grep` for `E_n(φ₁, φ₂)` and "two-character Eisenstein" found only this README); the diff introduces no new object.

## Not verifiable

- **Shimura, Duke Math. J. 45 (1978), Proposition 3.4** (README §2.12(a), Shimura78): paywalled; cited by locator only, agreeing with DDP's "[13, Prop. 3.4]" (ea435711 890–891). Whether Shimura's proposition itself excludes `F = ℚ`, `k = 2` with trivial characters remains unread; the exclusion is established by the computation in the table.
- **Chai, Ann. of Math. 131 (1990), §4.5** and **Wiles, Ann. of Math. 123 (1986), Proposition 1.6**: as in r3/r4, JSTOR only, read through SW99.
- The r2 items (Diamond 1995; Skinner–Wiles Duke 2001; Wiles [W2] Thm 1.4.1; Hida [H3]; Conrad; Milne CFT; Waldschmidt §5; BLGG12, BLGG13, BCGP) are untouched by the diff and were not re-opened.

## Source issues

- **Error** in DDP at Proposition 2.1, printed page 459: the source says a holomorphic Eisenstein series `E_k(η, ψ)` with the stated coefficients exists for every `k ≥ 1` and every pair of characters, over any totally real field; it should exclude `F = ℚ`, `k = 2`, `𝔟 = 1` and `η` of trivial primitive character, where Hecke's regularisation gives a non-holomorphic series; affects a stated result (the proposition's generality, not the paper's theorems).
