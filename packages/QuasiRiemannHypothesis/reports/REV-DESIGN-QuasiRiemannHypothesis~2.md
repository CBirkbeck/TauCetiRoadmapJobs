<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18769#issuecomment-6934865878 -->
Review (claude) of 147916e

Verdict: needs_changes

**Source independence:** 14 passages compared with 6 sources, two shared runs of 10 and 9 consecutive words (R02), none elsewhere beyond 7; largest share `openai2026quasiRH`, 61 of 146 locators; contents compared with `openai2026quasiRH`: independent.

**Research link:** The headline is Theorem 3.1 of OpenAI (2026), with Liu (2026) as second account; Layers 6 and 8 are the large sieves of Goldmakher–Louvel (2013), Blomer–Goldmakher–Louvel (2014), Heath-Brown (2000) and the cubic theta function of Patterson (1977) used by Dunn–Radziwiłł (2024). Rests on the README and the sources read.

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §8.7 states Patterson's coefficients without their complex conjugates

   Location: `design/README.md` lines 1511–1514, §8.7: "`τ(±λ^(3n−4) c d³) = g(λ², c) |d/c| 3^(n/2 + 2)` …
   `τ(±λ^(3n−3) c d³) = g(1, c) |d/c| 3^(n/2 + 5/2)`"; line 1517 (`θ(H_j(z, v)) = C_j(v) + Σ d_j(μ) …`);
   Check, lines 1530–1532; `design/plan.json` target 8.7, test `n0_coefficient`.

   Claim: these are the Fourier coefficients of the `θ` that is automorphic under `Γ₂` with `κ_P = (c/a)_3`,
   and `d_j` are the cusp coefficients that §9.2 uses, with `d(λ⁻³nb³) = 3^(5/2)|b| g̃(n)`.

   Witness: `patterson1977` Theorem 8.1 (printed p. 152) and `dunnradziwill2024` (5.7) (p. 17) print each
   Gauss sum under a bar. At `μ = λ⁻³c`, `c = 1 + 3ω`: `τ(μ) = 3^(5/2)·conj g̃(c)`, and `g̃(c)³ = −α(c)` is
   not real (`|g̃(c) − conj g̃(c)| = 0.888`). `openai2026quasiRH` (5.7), p. 27, expands `θ̄`, not `θ`.

   Repair. (a) In the four cases write `conj g(λ², c)`, `conj g(ωλ², c)`, `conj g(ω²λ², c)`, `conj g(1, c)`
   (the factors `e^(∓2πi/9)` stay as they are). (b) Replace the cusp sentence by: "Layer 9 uses the
   conjugate function `θ̄`, automorphic under `Γ₂` with `κ̄_P`: `θ̄(H_j(z, v)) = C_j(v) + Σ_{0 ≠ μ ∈ λ⁻⁴𝓞}
   d_j(μ) v K_(1/3)(4π|μ|v) ě(μz)`, where `d_j(μ)` is the complex conjugate of the coefficient of
   `θ ∘ H_j` at `−μ` (`openai2026quasiRH` (5.7), p. 27); `C₀ = σ v^(2/3)`, `C₁ = C₂ = 0`." (c) Check 1
   becomes: "`τ(λ⁻³cd³) = 3^(5/2)|d|·conj g̃(c)`, so `d₀(λ⁻³nb³) = 3^(5/2)|b| g̃(n)`, the coefficient of
   `openai2026quasiRH` (5.9); at `c = 1 + 3ω`, `g̃(c)³ = −α(c)` is not real, so dropping the bar changes
   the value." (d) The same in `plan.json` 8.7. Tested on the witness: with the bar, the `θ̄`-coefficient
   at `λ⁻³(1 + 3ω)` is `3^(5/2) g̃(1 + 3ω)`, which is (5.9); the bound `27 · 3^(k/6)|b|` is unchanged.

2. **F02** (P2) two sentences of Layer 5 reproduce the source's wording

   Location: `design/README.md` lines 926–927, §5.1 ("costs any prescribed positive power of `Z` on a
   fixed half-plane") and lines 981–983, §5.3 ("in the principal case the reciprocal bound passes to
   `1/ζ_K`").

   Claim: the statements are in the roadmap's own words.

   Witness: `openai2026quasiRH` lines 1006–1007 (Lemma 4.10): 10 consecutive words shared; lines 965–967
   (Lemma 4.9): 9 consecutive words shared, and §5.3 follows that lemma clause by clause.

   Repair. §5.1: "Consequently, if `N𝔯 ≤ Z^B` with `B` bounded, then `|D_𝔯(s)|` and `|D_𝔯(s)|⁻¹` are
   `≪_{K,σ₀,B,ε} Z^ε` on `Re s ≥ σ₀` for every `ε > 0`." §5.3: "Consequently both bounds hold throughout
   `Re s ≥ b + ν` whenever `ν > 0` and `b` is at least the zero abscissa of the primitive finite-order
   Hecke family of `K`, the constants then depending on `ν` and `ε₁` too. For the trivial character
   `|1/ζ_K(s)| ≤ |ℒ(s)|⁻¹` on `Re s ≥ 0`, since `|(s − 1)/(s + 1)| ≤ 1` there, so the bound for `|ℒ|⁻¹`
   bounds `1/ζ_K`."

3. **F03** (P3) `mem_support_of_ramified` is cited for its converse

   Location: `design/README.md` lines 280–281 ("`…IsAdmissibleModulus.mem_support_of_ramified`: a prime in
   the conductor ramifies"), lines 496–497 and 517 (§2.1); `design/plan.json` target 2.1.

   Claim: the pinned theorem gives that the modulus of `ψ_a` is supported on primes ramified in
   `K(a^(1/n))`.

   Witness: `TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Ramification.lean` line 147:
   a ramified place lies in the support of every admissible modulus. The direction §2.1 needs is not
   this one.

   Repair: in the contract and in §2.1 cite "ClassFieldTheory §13.1 `abelianConductor_eq_lcm` (the
   `v`-exponent of the conductor is a maximum of local conductor exponents) with Tau Ceti
   `conductorExponent_eq_zero_of_isUnramified` and `isAdmissibleModulus_abelianConductor`: the conductor
   is admissible and has exponent `0` at every unramified prime". Keep `mem_support_of_ramified` only
   with its true gloss, or drop it.

4. **F04** (P3) §8.1 cites the reciprocity law of §1.59 outside its hypotheses

   Location: `design/README.md` lines 1323–1326 and 1358–1359 ("ClassicalArithmeticCompletion §1.59
   (Hilbert symbols and their product formula)").

   Claim: §1.59 supplies `(c/(1 + bc))_n = 1` for `c ≡ 0 (mod N)`.

   Witness: `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` line 1888: §1.59 assumes `(a)`, `(b)`,
   `(n)` pairwise coprime; here `n ∣ c`. The route uses the product formula and the tame formula, which
   are §1.52 (line 1717) and §1.43 (line 1445).

   Repair: cite "ClassicalArithmeticCompletion §1.52 (Hilbert's product formula) and §1.43 (the symbol at
   a place not dividing `n`)" in the *Needs:* line, the contract and `plan.json` 8.1, and add to the
   route: "at `v ∣ c`, `v ∤ n`, the tame symbol is `((1 + bc)/𝔭_v)_n^(v(c)) = 1`".

5. **F05** (P3) a bullet of §11.2 reads as an equality its own Check refutes

   Location: `design/README.md` line 2004: "It is unchanged by passing to the primitive character on `n`
   prime to `q`".

   Witness: the Check of line 2012: `χ` modulo `12` induced by `(·/3)` has value `5`; the primitive
   character has `(2/3) = −1`, value `2`.

   Repair: "`χ(n) = χ*(n)` for `n` prime to `q`, so *leastNonOne* `χ* ≤` *leastNonOne* `χ`; equality can
   fail (modulo `12`: `2` against `5`)."

6. **F06** (P3) §8.3: an undefined coefficient, an unstated normalization and a vacuous Check

   Location: `design/README.md` lines 1393–1395 ("`φ_ij(s, χ) = (π/(s − 1)) Σ_{(c,d)} χ_ij(c, d) |c|^(−2s)`") and
   line 1405 ("`s = 3`: `|v(σw)^3| ≤ v(σw)^3`").

   Witness: `χ_ij(c, d)` is never defined; `kubota1968` (17), printed p. 265, has the conjugate character
   and a factor `1/2` for the sum over all `c ≠ 0`. The Check of line 1405 holds for any definition.

   Repair: define `χ_ij(c, d) = χ̄(σ)` for `σ ∈ Γ` with `σ_i⁻¹ σ σ_j` of bottom row `(c, d)`, and say the
   sum runs over bottom rows up to the elements of `Γ` acting trivially on `ℍ³` (`±1`). Replace the Check
   by a computed one: "`Γ = SL₂(ℤ[i])`, `χ = 1`: `φ(s) = (π/(s − 1)) ζ_K(s − 1)/ζ_K(s)` with `K = ℚ(i)`, and
   `φ(1) = π ζ_K(0)/Res_{s=1} ζ_K = π(−1/4)/(π/4) = −1`, of modulus one as §8.4 requires; counting `(c, d)`
   and `(−c, −d)` separately would give `−2`."

7. **F07** (P3) the Fourier–Bessel expansion of §8.2 has a special case in MaassForms that is not named

   Location: `design/README.md` lines 104–105 and 1368–1371.

   Witness: MaassForms §7.3 at its open head states the expansion for `PSL₂(ℤ[i])` and the trivial
   character, with `y K_(ir)(2π|n|y) e(Re(n x))`.

   Repair: under "Consumed, not redefined" add "MaassForms §7.3 states the expansion for `PSL₂(ℤ[i])`
   with trivial character; §8.2 is the form for a cofinite `Γ` with a unitary character at an essential
   cusp, and agrees with it under `μ = n/2`"; add that agreement as a Check of §8.2
   (`ě(μz) = e(Re(nx))` and `4π|μ| = 2π|n|`).

8. **F08** (P3) two notation slips

   Location: `design/README.md` lines 1644–1645, §9.3 ("for `A = 𝓞` or `λ⁻⁴𝓞` and `|K(x)| ≤ C_A x^(−A)` … with
   `A > 1`": one letter for the lattice and the exponent); line 1003, §5.4 ("`N_{F/ℚ}` being positive on
   `F^×`", in a statement about `K`).

   Repair: name the lattice `Λ` in §9.3; write `N_{K/ℚ}` and `K^×` in §5.4.

8 findings: 1 P1, 1 P2, 6 P3. All 15 findings of round 1 are repaired. The P1 is the pattern the
last repair fixed in Layers 4, 9 and 10 (conjugation bars lost in the text extraction), found once
more in §8.7, which that repair did not check against the printed page.

Files read: `packages/QuasiRiemannHypothesis/design/README.md` (all 2119 lines),
`packages/QuasiRiemannHypothesis/design/plan.json` (11 layers, 55 targets, `gaps = []`),
`packages/QuasiRiemannHypothesis/sources.toml` (24 entries, all `certified`, no machine path).
No maintainer notes exist for this roadmap. No supplier gap is declared and no finding needs one.
There is no `Suggested.lean` at the design stage: nothing was elaborated (this lane does not
elaborate), and the padding probe has nothing to run on.

## Round 1 findings

| Id | Status | Repaired passage |
| --- | --- | --- |
| F01 | repaired | §4.6, line 881: "`χ_n(p) · conj(χ_p(n)) = R(p, n) 1_{(n,p)=1}`", Check at lines 892–894 |
| F02 | repaired | §8.1, lines 1322–1335: "it is also `κ(σ) = (c/a)_n⁻¹` … `κ_P = κ⁻¹ = κ̄`"; §8.5 lines 1445–1448 |
| F03 | repaired | §3.2, line 659: "`≤ (2π)^d T₁^(−N) ‖w‖_{J+N,sep}`" |
| F04 | repaired | contract lines 258–261; §5.2 route through `PhragmenLindelof.vertical_strip`, lines 945–958 |
| F05 | repaired | §§8.6, 9.2, 10.2, 10.3, 10.5 are written out; §8.6 checked against the printed pages 145–146 |
| F06 | repaired | lines 32–35 ("**The sources.**"); no planning narrative found |
| F07 | repaired | lines 98–102 and §4.1, lines 745–757 |
| F08 | repaired | §4.4, lines 834–837: "`e(1/λ) = … = ω`" |
| F09 | repaired | §7.1, lines 1228–1230 and Check 1238–1240 |
| F10 | repaired | Layer 6 Examples and §10.2: "`min(1, 1/r₊)/Y`" |
| F11 | repaired | `VectorFourier.fourierIntegral`, `Real.fourier_eq`, `Complex.integral_boundary_rect_eq_zero_of_differentiableOn` resolve at the pin |
| F12 | repaired | printed pages throughout (checked: pp. 145–146, 152, 154) |
| F13 | repaired | every section has a `*Needs:*` line; §§3.4, 5.1, 7.2, 9.2 have three Checks |
| F14 | repaired | §4.3 cites CharacterSumsOverFiniteFields §3.4; contract lines 298–300; §8.4 lines 1420–1422 |
| F15 | repaired | the five works are out of References; manifest keys kept with `cited_for = []` |

## Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.2 abscissa, bullet 2 | family with the zero function; `{s − 2}` | set of real parts unbounded, `sSup = 0`; abscissa `2` | hypotheses exclude both | none |
| §1.3 continuation | exponent of `f_η`; contour to `Re s = B`; `H` domain | `max(C(σ₀)+ω, C(β*)−σ) = C(β*) − E*`; `Z^(B+c)` for `Z ≤ 1`; `β* − E* ≥ σ₀ + ω` | holds | none |
| §2.1 | `(ℚ, 2, 5)`, `(F, 6, −1)` | `(5/3) = −1`; `−1` at norm `7`, `+1` at `13` | holds; conductor citation reversed | R03 |
| §2.3 | `p = 1 + 3ω`, `ω ↦ 2` | `χ_p(2) = ω`, `χ_p(3) = 3 = −ω²`, `χ_p(−1) = −1` | holds | none |
| §2.5 | `d = 1 + 3ω`; `π = −2 + 3ω`; `t = −1` case | `α₂ = −1`, `α₃ = 1`, `(λ/d) = 5² = 4 = ω²`; `12⁶ ≡ 1 (19)`; `(−1/π) = 1` | holds; pin has `cubic_reciprocity_intCast` for `3 ∤ A` | none |
| §3.1 rescaling | `w_k(x) = w(e^k x)` | `ŵ_k(t) = e^(ikt) ŵ(t)` | holds | none |
| §3.3 | `MW_G(s)` | `(2√π)⁻¹ √(4π) e^(s²) = e^(s²)` | holds | none |
| §3.5 | `e(z)` on `ℂ`; ideal count | `Tr(z/λ) = 2 Im z/√3`; `(1/6) πH/(√3/2) = πH/(3√3)` | holds | none |
| §4.3 | `p = 1+3ω`, `−2+3ω`, `4+3ω` (numerically) | `γ_2³ = −α(p)` to `10⁻¹⁵`; `γ_1γ_2 = −0.6547 + 0.7559i = χ̄_p(4)γ_3γ_2³`; unbarred `−0.3273 − 0.9449i` | holds, bar forced | none |
| §4.4 | `Tr(c/λ)` for `c = a + bω`; seven arguments | `b`, `a − b`, `−a` for `c, cω, cω²`; `Γ = 1, 1, i, −i, i, 1, i` at `1, −1, λ, −λ, 1+3ω, 4+3ω, −2+3ω` | holds | none |
| §4.5 | `a = 1+3ω`, `b = −2+3ω`; `G(v²)` | `χ_b(a) = −ω²`, `χ_a(b) = ω²`, ratio `−1 = τ(λ, λ)`; `z̄² = z` for `z³ = 1` | holds | none |
| §4.6 | same pair | `(−ω²)(ω) = −1 = R`; unbarred `−ω` | holds | none |
| §5.1 | `𝔯 = 𝓞`; `D'/D` | `2`; `Σ log N𝔭/(N𝔭^(σ₀) − 1) ≪ log N𝔯` | holds; wording | R02 |
| §5.2 | edge `σ = −1/10`; trivial character | conductor `Q^(3/5)`, gamma `|t|^(3d/5)`; `|(s−1)/(s+1)| ≤ 11/9` | holds | none |
| §5.4–5.5 | `ℚ(i)` modulo `5`; `χ₋₃` | `χ(9) = χ(4) = −1`; pole of the cofactor at `1` against `L(1, χ₋₃) ≠ 0` | holds | R08 |
| §7.1 | `r = 0`; twist | `M_0 = W(1)`; `MW_v(s) = MW(s + iv)`, argument `s − iv` | holds | none |
| §7.2 | all bins fail | `M_I > a₀ + (I − 1)ε ≥ a₀ + 1 + ε > 1` | holds | none |
| §7.4 | against Proposition 8.3 | ranges `r ≤ t + O(1/log U)`, `0 ≤ m ≤ 1/2 + O(ε)`, `O((log U)²)` pairs agree | holds | none |
| §8.1 | `γ = (1+3ω, −3ω²; 3, 1−3ω)`; `Γ(9)` element; `GL₂`; `n = 2`, `K = ℚ(i)` | `(c/a) = ω = (b/d)`, `(c/d) = ω²`; `ω` against `ω²`; `(ε/d)_n = 1` for units `ε ≡ 1 (n²)`; `5` is no square in `ℚ₂(i)` but `1 + bc ≡ 1 (n⁴)` is | holds; §1.59 misapplied | R04 |
| §8.2 | `F = vK_ν(cv)` | `−v²F″ + vF′ + c²v²F = (1 − ν²)F`, `8/9` at `ν = 1/3` | holds; special case unnamed | R07 |
| §8.3 | `SL₂(ℤ[i])`, `χ = 1` | `φ(1) = π(−1/4)/(π/4) = −1`; `−2` if `±(c, d)` both counted | normalization unstated | R06 |
| §8.4 | `χ` trivial at `s = 2`; `Re s = 1` | eigenvalue `0`, constant residue; `|φ_ii| ≤ 1`; `kubota1968` prints `1 < s ≦ 2` | holds | none |
| §8.6 | against printed (7.1)–(7.6) | cosets, nine shifts, gamma factor, six equations, `r(0,0) = ω²r(1,−1) = ωr(2,−1)` agree; `λ³/9 = −λ/3 ∉ 𝓞` | holds | none |
| §8.7 | `μ = λ⁻³(1 + 3ω)` | printed `3^(5/2) conj g̃(c)`; README `3^(5/2) g̃(c)`; `g̃³ = 0.189 − 0.982i`, `|g̃ − conj g̃| = 0.888`; `γ_2 = χ_c(λ)² g̃` to `10⁻¹⁵` | false as written | R01 |
| §9.1 | against printed p. 25 | `ᾱ(n)`, `ᾱ(b)³`, `conj α(nb³)` agree; `q_n^(−3s+1/2)` | holds | none |
| §9.2 | `(5.1)`, `(5.3)` in print; `V_G` | `α(μ)` unbarred, `ε_p = −((λ³c/p)σ_p)⁻¹`, `|ζ| ≤ 1/81`; `√π e^(1/16) = 1.8868`; poles `−5/6, −7/6` | holds | none |
| §9.3 | Lemma 5.4 | shells `(1 + 2^iU/a)(2^iU)^(−A)` sum to `(1 + a⁻¹)U^(1−A)` for `A > 1` | holds; letter `A` reused | R08 |
| §9.4 | `nb = c²mht²`; `M = N = 1` | `χ_k(nb)³ = χ_k(mh)³ 1_{(k,ct)=1}`; exponent `1 − O/2`; (5.36) agrees in print | holds | none |
| §10.5 | probe data | `C(s) = s − 2/3`; `13/150 − 1/4 + 1/50 = −43/300`; `7/4 + 0.501 − 4 = −1.749` | holds | none |
| §10.6 | intermediate rows from `E(d; R, g)` at `d = 0.501` | saving `≥ 0.0823` for `δ ≤ 2/3`; `β*/2 − 0.4173 ≥ 0.0410 ≥ 1021/25000` for `δ ≥ 2/3`; `46·10⁻⁶ < 1/4800` | holds | none |
| §10.7 | data of §1.3 | `C(11/12) = 1/4`, `ω = (β* − 11/12)/2`, `D_η` nonvanishing on `Re s > 0` | holds; Theorem 3.1 agrees | none |
| §11.1 | `ρ ↦ 1 − ρ̄`; `ζ` at `s = 1` | `Re ρ ≥ 1 − θ`; order `−1`, not a zero | holds | none |
| §11.2 | `χ` modulo `12` from `(·/3)`; primorial modulus | `5` against `2`; least value `≍ log q ≤ (log q)^(1/(1−θ))` | theorem holds; bullet misleading | R05 |
| §11.3 | `p = 3`, `p = 7` | `2`, `3` | holds | none |

## Verified sound

- **Principles.** No route-specific shortcut (Layers 2, 4–8 are stated over general number fields), no
  algorithm, no `set_option`, no Lean file, no re-planned roadmap; the `7/8` stage is a named Part II.
- **Sampled sources (15 targets).** Read at the locator: §2.1 (`openai2026quasiRH` lines 453–470, p. 11;
  `milnecft2020` lines 11185–11238, p. 245), §2.3 (lines 444–451), §2.5 (`dunnradziwill2024` lines 205–223;
  `openai2026quasiRH` lines 656–658, p. 16), §4.3 (lines 526–564, p. 13), §4.5 (lines 620–680, pp. 15–16),
  §7.1 (lines 489–494, p. 12), §7.4 (lines 2627–2642, p. 59), §8.1 (`kubota1969` lines 124–134, 652–674,
  pp. 24–25, group `GL(2, 𝔬)_N`; `dunnradziwill2024` p. 17 in print), §8.2 and §8.4 (`kubota1968` lines
  118–167, 232–236, 307–314 and p. 265 in print), §8.7 (`patterson1977` pp. 152, 154 in print: R01),
  §9.1 (p. 25 in print), §9.3 (lines 1484–1577, pp. 34–36), §9.4 (lines 1603–1631, p. 37; (5.36) p. 43 in
  print; (5.39) line 1983), §10.7 (lines 387–389, p. 10). 14 sound, 1 false (R01). Also checked: the
  pages of 24 numbered results of `openai2026quasiRH` against the page markers; all agree. The author
  flagged no locator as unverified.
- **Library at the pins.** 34 Mathlib and 33 Tau Ceti names resolved; all exist. Read for content:
  `PhragmenLindelof.vertical_strip` (`Mathlib/Analysis/Complex/PhragmenLindelof.lean` 275),
  `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'` (`Mathlib/Analysis/Complex/Hadamard.lean` 611),
  `IsPrimaryEisenstein.cubic_reciprocity` and `cubic_reciprocity_intCast`
  (`TauCeti/NumberTheory/NumberField/Cyclotomic/Three/CubicReciprocity.lean` 144, 273),
  `mem_support_of_ramified` (R03), `isAdmissibleModulus_abelianConductor`
  (`…/AdmissibleModulus/Basic.lean` 208). `SieveApplications.leastNonresidue` is not at the pin: it is
  SieveMethodsAndPrimePatterns §2.9 (README line 2457), cited as a roadmap section, which is correct.
- **Supplier citations resolved.** On main: LFunctions Layers 4, 5, 7 with `gaussSum`, `gaussSum_mul`,
  `norm_gaussSum`; ZerosOfLFunctions §§1.3, 3.1, 3.4, 4.4, 4.5, 8.4–8.6, Layer 9; ClassicalArithmeticCompletion
  §§1.12, 1.23, 1.33, 1.34, 1.38, 1.59, 1.72, 1.75; ClassFieldTheory Layer 11, §13.1; ThetaSeries Layer 1
  (1A); AutomorphicFormsOnReductiveGroups §4.5; SieveMethodsAndPrimePatterns §§2.2, 2.3, 2.7, 2.9;
  AnalyticNumberTheoryPartI §§0.34, 1.6; PartII §5.29; PartIII §8.2. At open heads: CharacterSumsOverFiniteFields
  §§1.1, 1.2, 1.4, 1.5, Layer 2, §3.4; BianchiModularForms §§0.3, 0.4; MaassForms §7.1;
  AutomorphicSpectralTheory §§0.15, 0.16, 1.15a–1.15c.
- **Duplication by object.** Searched every roadmap for the Kubota character, the cubic theta function,
  Eisenstein series on `ℍ³` and Maass–Selberg relations: no second owner (BianchiModularForms and MaassForms
  disclaim Eisenstein series on `ℍ³`; AutomorphicSpectralTheory owns reductive groups). One unnamed special
  case (R07). `scratch/overlaps.md` lists no changed, dropped or revision-only id.

Overlap check: read ZerosOfLFunctions, LFunctions, AnalyticNumberTheoryPartIII (main) and CharacterSumsOverFiniteFields, CongruenceSpectralGap, MaassForms, BianchiModularForms, AutomorphicSpectralTheory (open); shared: the Gauss sum modulo an ideal, owner LFunctions Layer 5 (cited); the Fourier–Bessel expansion on `ℍ³`, MaassForms §7.3 for `PSL₂(ℤ[i])` and this roadmap for general `(Γ, χ)` (R07); nothing else shared.

- **Supplier order.** Gate output:

      candidate: QuasiRiemannHypothesis is not in the merge order yet; checked as if placed after BianchiModularForms (the intake inserts it when its design is accepted)
      depcheck: 261 roadmaps, 2605 edges, 0 problem(s)

  No UPWARD or CYCLE line; no excluded roadmap is cited.
- **Shape.** Eleven layers, each with Examples and Dependencies; every section has a `*Needs:*` line;
  every definition has at least three Checks (one vacuous, R06); Unicode mathematics; this roadmap's own
  names are in italics, so no backticked name claims a Lean declaration; no process words found.
- **Headline theorems** (for the package stage): the `11/12` half-plane (§10.7), the zero strip (§11.1),
  the conditional least-character bound (§11.2), `n(p) ≤ C (log p)^12` (§11.3), the continuation principle
  (§1.3), the transfer (§5.5). All are statable at the pins; §11.3 through `jacobiSym`.
- **Arrangement.** Layers against the sections of `openai2026quasiRH`: 1 ↔ §2 and Lemma 11.1; 2–4 ↔ parts of
  §4.1–4.3; 5 ↔ §4.4 and Proposition 11.3; 6 ↔ Lemmas 6.1, 9.1 and three other papers; 7 ↔ §8; 8 ↔ none;
  9 ↔ §5; 10 ↔ §§6, 7, 9.2, 10, 11. Not one to one and not in order.

Source independence: 14 passages compared with 6 sources, two shared runs of 10 and 9 consecutive words (R02), none elsewhere beyond 7; largest share `openai2026quasiRH`, 61 of 146 locators; contents compared with `openai2026quasiRH`: independent.

Research link: The headline is Theorem 3.1 of OpenAI (2026), with Liu (2026) as second account; Layers 6 and 8 are the large sieves of Goldmakher–Louvel (2013), Blomer–Goldmakher–Louvel (2014), Heath-Brown (2000) and the cubic theta function of Patterson (1977) used by Dunn–Radziwiłł (2024). Rests on the README and the sources read.

## Not verifiable

- Whether `openai2026quasiRH` prints the bar in the identity of §4.6 (p. 17): the text layer shows none
  and the page was not read as an image here; the README's form is the one the computation confirms.
- §8.5 against `kubota1969` Theorem 6 beyond its hypotheses (line 1364): the theorem is for
  `GL(2, 𝔬)_N` on `ℍ^r`, the README states it for `Γ(N) ∩ SL₂(𝓞_K)`; outside the sample, not compared.
- `patterson1977` Table III and `dunnradziwill2024` Appendix A, rows 1, 10, 19; `gaozhao2024` Lemma 2.9;
  `maynardpratt2024` Appendix C; `guthmaynard2026` §13.1; `liu2026improved` and `openai2026quasiRHalt`
  locators: existence only, not compared in detail.
- Agreement of arXiv numbering with the published versions of `dunnradziwill2024`, `goldmakherlouvel2013`,
  `bgl2014`: no published text was read.
- Elaboration: no Lean file at the design stage; this lane does not elaborate.

## Source issues

- none

(The misprint that round 1 recorded at Lemma 6.2 of `openai2026quasiRH` is an extraction artifact: the
printed p. 49 has the reciprocal.)

## For the human reviewers

- Scope: the primary source `openai2026quasiRH` is an unrefereed, machine-written preprint;
  `liu2026improved` and `openai2026quasiRHalt` are unrefereed too. No refereed source states the headline
  (`sources.toml`, the first three entries).
- Licence: `openai2026quasiRH` and `openai2026quasiRHalt` are read from a public code repository recorded
  as `author-page`; the repository's licence was not read.
- Licence: `liu2026improved` reports public Lean formalisations of the argument; the package's
  `Suggested.lean` should be compared with them when it exists.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "147916e4b42f36b45c364ebfcabe3e31a31ded70", "job": "REV-DESIGN-QuasiRiemannHypothesis~2", "model": "fable", "worker": "chris-x29"} -->
