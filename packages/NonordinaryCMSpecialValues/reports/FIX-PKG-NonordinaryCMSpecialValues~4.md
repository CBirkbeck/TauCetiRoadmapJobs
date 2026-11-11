# FIX-PKG-NonordinaryCMSpecialValues~4

This round repairs the findings of the review `REV-PKG-NonordinaryCMSpecialValues~3` (eleven findings, F01–F11). Before editing, I checked every finding against the cached legal sources. Where the text extraction is ambiguous I rendered and read the page images: FINIS06 pp.772, 780, 787, 788, 789 and KATO04 pp.121, 139, 140, 252, 253, 257–260, 198.

Verdicts:

- Ten findings are correct and applied.
- F10 is correct, but the deletion it asks for lies in another package, so it is not actionable here.
- F01 and F11 each revealed a second instance of the same error, and both are repaired as well. F01's lost fraction recurs in identity (13). F11's sign has a second component, a factor `(−1)^{r−1}` that Kato's printed (15.9.1) omits.

Changed files:

- `packages/NonordinaryCMSpecialValues/README.md`
- `packages/NonordinaryCMSpecialValues/sources.toml`: a new waived `BOXALL92` entry and three refined locators.

Unchanged: `Suggested.lean` (no headline or definition it states is affected), `metadata.toml`, and the `gaps` list of `design/plan.json` (no new supplier gap).

## REV-PKG-NonordinaryCMSpecialValues~3/F01 (P1) — applied

**Verified.** The page image of FINIS06 p.789 (lines 928–940) shows (15) as `v_ℓ((W̃ / (D^{1/4} b′_ar(ϑ,ϑ))) ∏(1 − ω(q)/q))`, with the pairing in the denominator. Two other passages agree with this reading:

- Finis's own proof gives `v({ℓ}) = −v_ℓ(D^{1/4}) − b_ℓ` (line 1043, p.791).
- The definition (14) is `b_ℓ = −min v_ℓ(D^{1/4} b_ar)`.

**Pattern.** The page image of p.787 shows (13) as `Ω⁻¹L(0,λ) = (2^{ν(D)}/√D) ∏ … b_ar⁻¹ (l/w_K)²`, but the README had `2^{ν(D)}√D`. This is the same lost fraction. Rederiving (13) from Yang's (10), Lemma 3.5 and `b_ar = (Ω/2π)b` gives `D^{−1/2}`. Combining (13) with (15) then gives Finis's p.794 identity with `D^{1/4}`. With `√D` in the numerator the same computation gives `D^{−3/4}`.

**Old → new (§4.3).**

- (15): `v_ℓ(W̃ D^{1/4} b′_ar ∏)` becomes `v_ℓ((W̃/(D^{1/4} b′_ar)) ∏)`.
- (13): `2^{ν(D)}√D` becomes `2^{ν(D)} D^{−1/2}`.
- The deduction is now written out.
- New Checks: the diagnostic (1/4 against 7/4), agreement with (14), and the `D^{1/4}` against `D^{−3/4}` test.

## REV-PKG-NonordinaryCMSpecialValues~3/F02 (P1) — applied

**Verified.** KATO04 pp.258–259 (lines 5478–5527, page images):

- `β` is the rational Betti class of `1`, and `ξ = p^m β`.
- `α_n` is the image of `p^{m−n}β`, and `ν_n = ξ_n − α_n`.
- The ERL output is evaluated at `ξ_m`.
- The printed `θ_n(z) = aθ(z + ν_n)` contradicts `θ_n(ξ_n) = aθ(α_n)`, so the translation must be by `−ν_n`.

I recomputed the reviewer's test: `ξ_1 = 8` and `ν_1 = 7` modulo 56, and the three candidate points are `1`, `15` and `8`.

**Old → new (§2.5).** The section is rewritten with Kato's data: `g ⊂ f`, units injective modulo `g`, and `a` prime to `6pf`. The translation is now by `−ν_n` and the output is evaluated at `ξ_m`. It also states:

- that the input is the theta-value system, `(_az_{p^n f_0})⁻¹`;
- that `p^{−mr}` cancels only in the conversion from `ξ` to `β`;
- that good reduction follows from NeronModelsAndSemistableAbelianVarieties §5.1. That roadmap is an open roadmap pull request at merge-order position 67, earlier than this one. It is added to the supplier contract, the *Needs:* line, the Scope list and the Dependencies.

New Checks: the `Q(i)`, `p = 7` torsion data, and the scalars `1/7` and `1/2`.

## REV-PKG-NonordinaryCMSpecialValues~3/F03 (P2) — applied

**Verified.** The page image of KATO04 p.257 (lines 5425–5436) specifies the descent action:

- tensor powers over `K(f)`;
- `σ ⊗ 1` followed by `η_ψ = ψ(a)⁻¹(η_a^*)^{⊗r}`;
- semilinearity;
- independence of the ideal `a`.

**Old → new (§2.4).** "`S(ψ)` … of `Gal(K(f)/K)`-invariants" becomes the invariants of this explicitly defined action. Additions:

- an API bullet proving independence of `a`: `λ^r` from the pullback cancels `ψ((λ)) = λ^r`;
- the convention `per_ψ(ω^{⊗r}) = (∫_β ω)^r β^{⊗(−r)}`;
- the Check `a = (9)`, `f = (8)`, `r = 2`, for which the identity acts by `81/81 = 1` and by `81` if the normalisation is dropped.

## REV-PKG-NonordinaryCMSpecialValues~3/F04 (P2) — applied

**Verified.** ROHRLICH-NOTES line 666, Proposition 1.5 (p.14): `W(χ) = (2/D)` for every canonical `χ` with `D` odd. Proposition 1.6 (p.15): for `8 | D`, `h_K` of the canonical characters have each sign.

**Old → new (§1.1).**

- Heading: "The canonical root number at a split dyadic prime" becomes "The root number of a canonical character".
- Statement: it now covers every odd `D` with `W = (2/D)`. The corollary "`+1` exactly when `D ≡ 7 mod 8`, that is, when `2` splits" is the form Layer 5 uses.
- Checks: `D = 7, 23` give `+1` and `D = 11, 19` give `−1`, all as instances of the theorem. A new Check covers `8 | D`.
- `sources.toml`: the ROHRLICH-NOTES locator now includes Proposition 1.6.

## REV-PKG-NonordinaryCMSpecialValues~3/F05 (P3) — applied

**Verified.** `L(φ̄χ⁻¹, s) = L(φχ, s)` holds identically (§0.1), and for `c = 3` both central values are `0`, so the old claims of unequal values are false.

**Old → new.** The Checks at §2.4 ("the four values differ"), §2.6 ("a different number") and §2.8 now pin the convention on the characters:

- `φ̄(𝔮) = −1 − 2i` against `φ(𝔮) = −1 + 2i` at `𝔮 = (−1+2i)` in `Q(i)`;
- `ζ_25` against `ζ_25⁻¹`.

Each states explicitly that the `L`-values may coincide, with the forced-zero example `0 = 0`.

**Pattern.** The search covered every "differ" Check. The others (§§0.6, 3.3) already compare character values, not `L`-values.

## REV-PKG-NonordinaryCMSpecialValues~3/F06 (P3) — applied

**Verified.** `E/E[a] = ℂ/λ⁻¹f → ℂ/f` is multiplication by `λ`. With `f = 3` and `λ = 4`, multiplication by `4` sends `3/4` to `3 ≡ 0`, while multiplication by `1/4` sends it to `3/16 ≠ 0`.

**Old → new (§2.2 Check).** "via multiplication by `λ⁻¹`" becomes "via multiplication by `λ`, from `ℂ/λ⁻¹f` to `ℂ/f`", with the computed witness.

**Pattern.** The new §2.4 descent Check uses the same direction (multiplication by `9`).

## REV-PKG-NonordinaryCMSpecialValues~3/F07 (P3) — applied

**Verified.** `idealCharacter` is defined on ideals prime to the conductor (TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean, as cited in the supplier contract). The order-5 character of `Q(√−7)` has conductor `25`, so it has no value at `(5)`.

**Old → new (§0.2 API).** The bullet now adds "unramified at `p`" and says no value is asserted when `χ` is ramified there. A new Check covers the conductor-25 character, where extension by zero would give `0`, not `1`.

**Pattern.** The other uses are already restricted: §0.1 (`p ∤ f`), §1.3 (`ν` unramified at `p`) and §3.4 (`p ∤ f`).

## REV-PKG-NonordinaryCMSpecialValues~3/F08 (P3) — applied

**Verified.** FINIS06 line 1587 invokes "[B, Thm. 1]", and line 1742 gives the reference as C. R. Acad. Sci. Paris 315 (1992), 1063–1066.

**Old → new.**

- §4.4 now reads "(Boxall 1992, Theorem 1, pp.1063–1066, as applied in Finis, proof of Lemma 4.5, …)".
- A **BOXALL92** entry is added to the References.
- `sources.toml` gains one `BOXALL92` entry with `status = "waived"` and `licence_class = "none"`, under the lifetime key the brief names. It has no `resolution` field because I do not know the waiver's URL.
- The text was not fetched or requested again.

## REV-PKG-NonordinaryCMSpecialValues~3/F09 (P2) — applied

**Verified.** §§4.2–4.3 invoked the theta spaces, primitive subspaces, Shintani operators, `l`, the pairings and the integral structures without defining them. I read their definitions in FINIS06: lines 187–287 (pp.771–774), 454–466, 559–564 (p.780), 642–734 (pp.782–784), 813–821 and 882–884 (p.788).

**Old → new.** These are new README definitions, each with an API and three Checks, in the scalar case `ν = 0` that weight one uses:

- §4.2: `T_{r,a}` (the transformation law, the operators `A_l`, the scalar product); `T_d`, `V_{d,C}` and the primitive subspaces; `E(b)`, `F*` and Proposition 2.2; `l`.
- §4.3: `ϑ†`, `b`, `b′`, `b_ar`, `b′_ar`; the arithmetic and integral functions and the normalised generators.

Discriminating Checks include:

- the primitive subspace has dimension 168 against 175 for `d = 25`;
- `5l` and `5ϑ` are excluded;
- the semi-character test `(−1)^{28} = (−1)^7 (−1)^{14} (−1)`;
- `δ` against `−δ`;
- the `γ`-normalisation, `1/2` against `2`.

All statements are in my own words with locators. The review asked for "original wording", but copying source passages is forbidden, so I did not quote. No Lean was added: these are heavy definitions, kept as README targets.

## REV-PKG-NonordinaryCMSpecialValues~3/F10 (P2) — not actionable in this package: the duplicate targets are in ModularIwasawaMainConjecturesPartII, which must delete them and import §§2.1–2.6 from here

**Verified.** `packages/ModularIwasawaMainConjecturesPartII/README.md` §§2.2–2.4 and 3.1–3.3 restate Kato's CM theta function, canonical pairs, standard units, realisation and reciprocity law, with no citation of this roadmap. This package is earlier in ORDER.txt (345 against 378), so it is the right owner, and the deletion can only be made in that package.

**In-package support.**

- The Conventions and Scope now state §§2.1–2.6 for every prime `p` and every imaginary quadratic `K`, in Kato's generality, separately from the BKO restrictions, which now begin at §2.7.
- The Downstream paragraph names the full interface and the reciprocal-unit sign convention.

## REV-PKG-NonordinaryCMSpecialValues~3/F11 (P1) — applied

**Verified.** The page image of KATO04 p.253 (lines 5271–5275) defines the standard unit as `_az_f = _aθ_E(α)⁻¹`. I confirmed the sign of (15.5.1) independently:

- `_aθ_E` vanishes to order `N(a) − 1` at `0`, while `∂_s Σ|z+w|^{−s}|_{s=0} ∼ −log|z| → +∞`.
- So `log|_aθ_E|` is minus the regularised lattice sum, and the reviewer's test is right: `−12 log 3` for the units, `+12 log 3` for the theta values.

**Sign bookkeeping.** The Kummer map is a homomorphism, so inverting the units negates the class; this holds in any normalisation. In addition, by direct complex analysis (residue `N(a) − 1`, and `∂E_1 = −E_2`):

`(r−1)!⁻¹ (d/ω)^r log aθ = (−1)^{r−1} (N(a)E_r − Σ E_r(· − P))`.

At `r = 1` this agrees with Kato's (15.9.1). For even `r`, (15.9.1) as printed lacks the factor `(−1)^{r−1}` (taking `per(ω^{⊗r}) = β^{⊗(−r)}`). Kato's proof feeds the theta values, not his units, into the height-one law.

**Old → new.**

- Scope and §2.2: the unit is now `aθ_E(α)⁻¹`, with a Kronecker Check.
- §2.3: the theta-value element `z^θ = −z` is defined.
- §2.6: the law is stated for `z^θ` with the sign `(−1)^{r−1}`, equivalently `(−1)^r` for Kato's `z`, and `+L` at `r = 1`.
- §2.7: the class now rationalises to `z^θ_a(γ)`, so §2.8 (BKO (3.4)) keeps the sign `+`.

## Checks run

- **Elaboration.** `lake env lean packages/NonordinaryCMSpecialValues/Suggested.lean`, run from the content checkout: exit 0. The only output is three `declaration uses 'sorry'` warnings, at lines 130, 140 and 166. No targeted build was needed. The file is unchanged this round.
- **Binder audit.** I elaborated a scratch copy with `#check @name` for all ten public declarations: `conductorModulus`, `IsAnticyclotomic`, `IsEquivariantTypeOneZero`, `IsPAnticyclotomic`, `eulerFactor`, `HasCentralValue`, `rohrlichCount`, `rohrlichCount_eq_zero`, `rohrlichCount_lt` and `centralValue_parity_dichotomy`. It exits 0. Every elaborated type equals its entry in `signatures.md` and matches its README statement (§§0.1–0.3, 6.1, 6.5), and no standing binder is lost. In particular the parity theorem keeps `[IsCMField K] [Algebra.IsQuadraticExtension ℚ K]`, `[Fact p.Prime]`, `p ≠ 2`, the inertness of `v`, both unramifiedness hypotheses and the normalised uniformizers. Nothing changed.
- **Dependency gate** (`gate --depcheck … --movable`), complete output:

  ```text
  depcheck: 236 roadmaps, 2143 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The new edge is NeronModelsAndSemistableAbelianVarieties, at position 67.
- **`roadmaps resolve`.** No Lean name is reported as found nowhere. One lead remains: "LubinTateFormalModulesAndQuasiCanonicalLifts §2.1". This is a false positive. That roadmap is a board package at position 344, in the permitted supplier list, and its README has §2.1 at line 605 and §§2.2–2.4 and 4.3–4.4 at lines 635, 657, 688, 1066 and 1101.
- **Text scan.** No LaTeX delimiters, machine paths, pull-request numbers or process words appear in the README or the Lean file.
- No gate failures were listed for this round.

## Adversarial pass on changed statements

| Statement | Instances | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| §4.3 (15) | `v(W̃)=v(D)=0`, `v(b′)=3/4`, `v(∏)=1` | fraction `1/4`; product `7/4` | fraction matches (14) and line 1043 | F01 |
| §4.3 (13) | general `v_ℓ(D)` | `D^{−1/2}`: `−½v(D) + v(∏) − v(b′) + 2v(l/w)` combined with (15) gives `D^{1/4}`; `√D` gives `D^{−3/4}`, off by 1 at ramified `ℓ` | `D^{−1/2}` | F01 pattern |
| §2.5 torsion data | `Q(i)`, `p=7`, `g=(56)` | `7(Z[i]⊗Z_7) ∌ 1`; `ξ_1=8`, `α_1=1`, `ν_1=7`; `8−7=1`, `8+7=15`, `1+7=8`; orders 4 and 8 ∉ `E[5]` | minus translation, evaluation at `ξ` | F02 |
| §2.5 scalars | `r=1,3`, `m=1` | `p^{−m}=1/7`; `(r−1)!⁻¹ = 1, 1/2`; `ξ^{−r}=p^{−mr}β^{−r}` | `p^{−mr}` cancels only in the `β` conversion | F02 |
| §2.4 descent | `Q(i)`, `f=(8)`, `a=(9)`, `r=2` | pullback `9²=81`, `ψ((9))=81`, quotient `1`; without `ψ(a)⁻¹`: `81` | `ψ(a)⁻¹` needed | F03 |
| §2.4 independence | `a′ = a(λ)`, `λ≡1 mod f` | pullback `λ^r`, `ψ((λ)) = λ^r` | ratio 1 | F03 |
| §1.1 | `D = 7, 23, 11, 19`; `8 \| D` | `(2/7)=(2/23)=+1`; `(2/11)=(2/19)=−1`; `8 \| D`: `h_K` of each sign | general odd `D` | F04 |
| §§2.4/2.6/2.8 orientation | `𝔮=(−1+2i)` in `Q(i)`; order-25 `χ` at `c=3` in `Q(√−7)` | `φ̄(𝔮)=−1−2i` vs `−1+2i`; `ζ_25 ≠ ζ_25⁻¹`; both central values `0` | characters differ, values may not | F05 |
| §2.2 isomorphism | `f=3`, `λ=4` | `4·3/4=3≡0`; `(1/4)·3/4=3/16≢0`; `4·1≡1` | multiplication by `λ` | F06 |
| §0.2 `χ((p))` | order-5 `χ`, conductor 25; `ν ∈ X_l` | `(5)` not prime to `25`; zero extension `0`; `ν((p))² = 1`, odd order, so `1` | needs "unramified at `p`" | F07 |
| §4.2 `T_{r,a}` | `Q(√−7)`, `r=1,25`, `a=O_K,(5)⁻¹` | dims 7, 175, 7; `H=2r√7 x̄y`, degree `2r√7·√7/2 = 7r` | `δ` orientation fixed | F09 |
| §4.2 semi-character | `l=1`, `l′=(1+√−7)/2` | norms 1, 2, 4; `ψ = −1, 1, 1`; `e^{7πi} = −1`; `1 = −(−1)(1)`; trivial `ψ`: `1 ≠ −1` | `ψ` needed | F09 |
| §4.2 primitive | `d=25`, `d=5` | `175 − 7 = 168`; `d=5`: no ideal of norm 5, so 35 | primitive ≠ full | F09 |
| §4.2 `γ`-normalisation | `c` above 2 in `Q(√−7)` | `E E = 2`; `F*F* = ¼·2 = ½ = γ((2)) = ¼·2·1` | `γ` needed | F09 |
| §4.2 infinity type | `z ≡ 1 mod rN(a)D` | `F*(z) = z⁻¹ = λ_∞(z)⁻¹` with `λ_∞(x) = x` | type `(−1,0)` | F09 |
| §4.3 `b` | `iϑ` | `b(iϑ_1,ϑ_2) = i·b`, hermitian `−i`; `b(ϑ,ϑ) = γ⁻¹⟨ϑ,ϑ⟩ ≠ 0` | bilinear, nonzero | F09 |
| §4.3 integral | `ℓ=5`, `5ϑ`; `ℓ=7`, `rDN(a)=7` | `5⁻¹·5ϑ` integral, `5⁻¹ ∉ O`; `G ⊆ T^{int} ⊆ 7⁻¹G` | normalised = generator | F09 |
| §2.2 Kronecker | `Q(i)`, `f=(3)`, `a=(5)`, `χ=1` | `ζ_K(0)=−¼`, `L′ = −(log 3)/2`, RHS `24·(−(log 3)/2) = −12 log 3`; theta `+12 log 3` | unit = θ⁻¹ | F11 |
| §2.6 sign | `a=(5)` in `Z[i]`, `r=1,2` | `dlog aθ ∼ 24/z = 25/z − 1/z`; `(d/ω)² log aθ ∼ −24/z²` vs `N(a)E_2 − ΣE_2 ∼ +24/z²` | factor `(−1)^{r−1}`; `+L` at `r=1` for `z^θ` | F11 |
| §2.7–2.8 | BKO (3.4) at `r=1` | `z^θ` gives `+Ω⁻¹L`; Kato's `z` gives `−` | class rationalises to `z^θ` | F11 |

## For the maintainer

- **Ownership.**
  - ModularIwasawaMainConjecturesPartII (board package, position 378) duplicates this roadmap's §§2.1–2.6 and must import them by section; this cannot be settled here.
  - That package also silently identifies the two systems. Its §2.4 uses `aθ⁻¹` as the unit, while §3.2–§3.3 state Kato's (15.9.1) and Proposition 15.9 with `+` for every `r`. The sign issue of F11 therefore recurs there.
  - The objects newly defined in §§4.2–4.3 (Finis's U(1) theta spaces and Shintani operators) have no other owner in `roadmaps grep` or the board packages. The other "Shintani" objects (Shintani lift, Shintani cocycles, Whittaker–Shintani functions) are different.
  - The Néron–Ogg–Shafarevich criterion is cited from NeronModelsAndSemistableAbelianVarieties §5.1, an open-PR head that is earlier in the merge order. It is not restated here.
  - Ownership was checked against main, the board packages and the open heads available through the tools.
- **Heading change.** §1.1 is now titled "The root number of a canonical character"; its number is unchanged. AnticyclotomicLocalUnits cites design labels (`NCM.0`–`NCM.5`), not headings, so no citation breaks. Those design labels remain an existing coordination item.
- **Source issues.**
  - **Misprint**, KATO04, proof of Proposition 15.9, p.258: the translation should be by `−ν_n`.
  - **Error**, KATO04, Proposition 15.9 against its proof, pp.258–260: the proof applies the height-one law to the theta values, while the statement is for the standard units, their inverses. Combined with (15.9.1), the printed steps give `−L` at `r = 1` for the unit element.
  - **Possible misprint**, KATO04 (15.9.1), p.260, for even `r`: the factor `(−1)^{r−1}` is missing in the normalisation `per(ω^{⊗r}) = β^{⊗(−r)}`.
  - The overall signs of KATO04 (3.8.1)–(3.8.2), p.140, look opposite to what the divisor of `cθ` forces near the origin. I did not state this in the README because it depends on the uniformisation convention. The README instead fixes every sign by the order of vanishing at the origin.
- **Missing sources.** None. `needs-references.toml` was not written. `BOXALL92` is recorded as waived.
