# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at 49f4e99)

**Verdict:** needs changes

This is an incremental re-review of the 4 lines changed since f6df35b, all in AL.3.10.3 of `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md`. Line numbers refer to that file unless marked `Suggested.lean`.

The previous review had two findings:

- Its R01, the false "polynomials" clause in AL.3.10.3, is repaired. The repair and the two Check sentences added with it are correct, and I found no new problem in them.
- Its R02, the pull-request description, is not repaired. It is carried below as R01. It is the only remaining finding. It is P3, and it needs no edit to the folder.

## R01 (P3) — The pull-request description still contradicts the README (carried from the previous review's R02, not repaired)

**Location:** the pull-request description. These sentences are unchanged since the previous review:

- "take rank-one Hecke continuation and the global standard L-function from here".
- "Continuation for arbitrary unitary Hecke characters is the n = 1 case of the Godement–Jacquet matrix integral, not a separate rank-one argument".
- "The common adelic Tate/Fourier prefix and the rank-one scalar comparison are consumed from ArithmeticGaloisRepresentations §2.7".
- LFunctions (#248) and ZerosOfLFunctions (#253) "both must merge first", and ReductiveGroupsPartII is listed among "open pull requests of ours".

**Claim:** The description misstates ownership and dependencies. The human who gives final approval reads it.

**Witness:**

- `:2500` says "their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a".
- `:11` gives the Fourier analysis to AnalyticNumberTheoryPartII §§5.3g–5.3h, and the local zeta integral to its §5.3j.
- `TauCetiRoadmap/LFunctions`, `TauCetiRoadmap/ZerosOfLFunctions` and `TauCetiRoadmap/ReductiveGroupsPartII` are folders on main (19d2a1c).

**Repair:** Edit only the description. The folder needs no change.

- Replace the first sentence by "…take the global standard L-function from here; their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a."
- Replace the second by "The global Godement–Jacquet continuation is proved for every n ≥ 1 and identified at n = 1 with AnalyticNumberTheoryPartI §2.3a."
- Replace the third by "The local and adelic Fourier analysis and local zeta integrals are AnalyticNumberTheoryPartII §§5.3g–5.3j; the rank-one scalar comparison uses ArithmeticGaloisRepresentations §2.7."
- Delete the sentence about LFunctions and ZerosOfLFunctions, and remove ReductiveGroupsPartII from the list of open pull requests.

**Tested:** each replacement sentence is what `:11`, `:13`, `:164` and `:2500` say at this head.

## Previous findings

- R01 — repaired: `:1927` now reads "each such local L-factor is the inverse of a polynomial in `z^(deg v)` with constant term 1, and each epsilon factor is a nonzero constant times an integer power of `z^(deg v)`".
- R02 — not repaired: the description still says the consumers "take rank-one Hecke continuation and the global standard L-function from here". Carried as R01.

## Verified sound

**Gate and dependency check.**

- I ran the gate on this head. Every count is 0 and the result is OK, exit 0. The worker's run on the same head also reports `build=0`.
- The dependency check prints:

```text
depcheck: 239 roadmaps, 2369 edges, 0 problem(s)
```

  There are no UPWARD, CYCLE or `moved:` lines.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- `git diff f6df35b HEAD` touches only `README.md`, with 2 insertions and 2 deletions.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0. It gives exactly 14 `declaration uses sorry` warnings, at lines 75, 80, 91, 125, 138, 164, 222, 290, 366, 382, 428, 523, 606 and 682, and nothing else. These are the same lines as at f6df35b.

- The imports are a single `import Mathlib` plus the three Tau Ceti modules (`…Diagonal.Normalizer`, `…UpperUnitriangular.Basic`, `Algebra.Lie.GeneralLinear.TraceForm`).
- The worker's two "dropped binder" leads (`signatures.md`, lines 25 and 44) are false positives. In both Bessel theorems `hbesselK` is still there as an anonymous premise; the elaborated type of `AL0.BesselLaplaceMellin` shows it as `(∀ ν c, besselK ν c = …) →`.
- `Suggested.lean` is unchanged, so the one-tactic probe of the previous review still applies: none of the 14 `sorry`s is padding.

**The repaired sentence (`:1927`) against the targets it summarizes.**

- AL.3.2.3 (`:1528`) defines `L(s,π×π′)=P(q^(−s))^(−1)` with `P(0)=1`.
- AL.3.3.2 (`:1565`) makes ε at a finite place a nonzero monomial `c q^(−fs)`.
- At a place v of degree d the local cardinality is `q_v=q^d`. So `q_v^(−s)=z^d`, and the two normal forms become `P(z^d)^(−1)` and `c·(z^d)^f`, which is exactly the new wording.
- The Lean statements agree: `Suggested.lean:553–554` and `:636–637` have `P.eval 0 = 1`, `ε ≠ 0` and `e : ℤ`.
- The new definition `z=q^(−s)` is the README's own convention at `:61` ("For function fields put `z=q⁻ˢ` and use `z^(deg v)` in the v-factor"). No other `z` in the README conflicts with it.

**Source for the new wording.** I read `Lafforgue2002` lines 12347–12353 (Appendix B §1a, p.220):

- An Euler factor at x is a rational function whose inverse is a polynomial in `Z^deg(x)` with constant term 1.
- An ε-factor is a nonzero constant times a positive or negative power of `Z^deg(x)`.

Lines 12452–12454 (p.222) fix the variable: twisting by `|·|^s` multiplies by `q^(−s·deg x)`, so Lafforgue's Z is the README's z. Lines 12386–12393 (pp.220–221) attach these factors to pairs by JPSS Theorem 2.7. The locator "Appendix B §1a, pp.220–221" at `:1931` is therefore correct.

**Sign convention of the new ε Check, against the other layers.**

- The norm-twist law at `:1927`, applied with `a=0`, `dim V=1` and `n(ψ)=−1`, gives `q_v^(−(−1)s)=q_v^s=9^s=(z²)^(−1)`.
- AL.1's unramified formula (`:943`), `ε=χ(ϖ^ν)q^((1/2−s)ν)`, has the same s-dependence `q^(−νs)`.
- The trivial-line Check ("norm-twist exponent `n(ψ)`") agrees as well.
- Lafforgue line 12402 makes ε equal to 1 only where `ψ_x` is unramified too, so an unramified character paired with a ramified `ψ_v` may have `ε≠1`.

**Consumers of AL.3.10.3.** I resolved them with `roadmaps grep` at their open heads:

- HyperellipticCurves README:137, :440–445 and :1942 cite AL.3.10.3 for the equal-characteristic Weil–Deligne adapter and local ε constants.
- ArtinRepresentations README:210, :395, :820–822, :875 and :2318 cite it for the equal-characteristic local-constant construction.

All of that is still in AL.3.10.3, and the change removes nothing. The overlap index reports no dropped ids and no other open pull request that changes this roadmap.

**Seeded sample: Check for the theta–Mellin formula** (`:1706–1708`, AL.3.5.1). It is untouched, but I re-read it.

- `CogdellColumbia` §1.1.3 begins at line 251 (p.4).
- Lines 264–268 give `E(g,s;Φ,η)=|det g|^s∫Θ′_Φ(a,g)|a|^{ns}η(a)d×a` for `Re s>1`, with η a unitary idele-class character and the `ξ=0` term removed.
- Lines 278–289 (p.5) give the `P′`-section and the sum over `P′(k)\GLₙ(k)`.
- The Check gives `3¹·5·2^(2·1)=60`, and `3·5·2=30` when n is omitted, as stated.

The locator "§1.1.3, pp.4–5", its hypotheses and its statement agree with the source. The README flags no locator as unverified.

**Library declarations opened at the pins.** None are new this round, since `Suggested.lean` is unchanged. The previous review's openings still apply:

- Tau Ceti `TraceForm.lean`: `:116`, `:126`, `:131` and `:138`.
- Mathlib `FourierTransform.lean:81`.

**Remark on untouched text (no change requested).** AL.0.3.1 writes the additive conductor as `ν(ψ)` (`:491`, `:943`), while AL.3.10.3 writes Deligne's `n(ψ)`. They are the same integer with the same sign: in both, ε for an unramified line has s-dependence `q^(−ν s)`.

**Adversarial calculations.** Rows marked "carried" cover statements this change leaves untouched. Their values are those of PRREVIEW~11, which carried them from PRREVIEW~10. The other rows are computed for this head.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| AL.3.10.3 L-factor normal form, `:1927` (changed) | `𝔽₃(t)`, `v=(t²+1)`, `deg v=2`; unramified `GL₁×GL₁` α, β | `L=(1−αβ·9^(−s))^(−1)=(1−αβz²)^(−1)`; inverse `1−αβz²`, a polynomial in `z²` with constant term 1 | Pass |
| same, `GL₂×GL₁` unramified (changed) | Satake α₁, α₂; β | inverse `(1−α₁βz²)(1−α₂βz²)=1−(α₁+α₂)βz²+α₁α₂β²z⁴` | Pass |
| same, Steinberg (changed) | `St` of `GL₂(K_v)`, `q_v=9` | `L(s,St)=(1−9^(−1/2)·9^(−s))^(−1)`; inverse `1−z²/3` | Pass |
| same, ramified χ (changed) | χ of conductor 1 | `L=1`, inverse the constant polynomial 1 | Pass |
| same, degree-one place (changed) | `v=(t)`, `q_v=3` | `L=(1−αβz)^(−1)`, polynomial in `z^1` | Pass |
| AL.3.10.3 ε normal form, `:1927` (changed) | χ of conductor 1, `n(ψ)=0`; `St`, `n(ψ)=0`; unramified with `n(ψ)=−1`, all at `deg v=2` | `c·(z²)¹`; `−9^(1/2−s)=−3·(z²)¹`; `c·(z²)^(−1)`; c≠0 in each case | Pass |
| Wrong model "polynomial with constant term 1" (the clause before the repair) | unramified α, β at `deg v=2` | `(1−αβz²)^(−1)` has coefficient `(αβ)^k≠0` at `z^(2k)` for every k, so it is not a polynomial; an ε-factor `c·z²` has constant term 0 | Excluded |
| New Check, non-polynomial sentence, `:1929` (changed) | α, β ∈ `ℂ^×` | `1+αβz²+α²β²z⁴+…`; all coefficients nonzero since `αβ≠0`; inverse `1−αβz²` | Pass |
| New Check, sign sentence, `:1929` (changed) | unramified line, `n(ψ_v)=−1`, `q_v=9` | `q_v^(−(0+(−1)·1)s)=9^s=(3^(−s))^(−2)=(z²)^(−1)`; a tame character with `n(ψ)=0` has exponent `+1`, so both signs occur | Pass |
| AL.3.10.3 `deg v` / residue-field Check, `:1929` (carried, PRREVIEW~11) | `t²+1` over `𝔽₃` | `t²∈{0,1}` mod 3, never 2, so v is irreducible of degree 2; `9^(−s)=z²`; the wrong model q=3 gives z | Pass |
| AL.3.10.3 single owner and *Needs:* `:1933` (carried, PRREVIEW~11) | build order | AL.3.1.1–AL.3.4.1 all precede `:1925` | Pass |
| AL.3.5.1 theta–Mellin Check (sampled), carried, re-read | point mass, `n=2`, `\|det g\|=3`, `θ₀=5`, `\|a\|=2`, `η=1`, `s=1` | `3·5·2²=60`; omitting n gives 30; the source has `\|a\|^{ns}` (line 267) | Pass |
| Row `:87`, `TauCeti.traceBilinForm`, carried | `E₁₂,E₂₁`; `E₁₂,E₁₂` | 1 and 0; `rfl` to `(X*Y).trace` | Pass |
| AL.0.3.1 `Mat_n` instance, carried | `n=2, ν=1, q=3` | `3^{−2}·3^{−2}·3⁴=1` | Pass |
| `godementJacquetLocal` kernel and signature, carried | `fourierIntegral ψ μ L Φ (−Y)` | `ψ(tr(XY))`; every binder explicit | Pass |
| AL.3.3.6 hypothesis, carried | `𝔽₃((t))`, unramified `GL₁×GL₁` | `Σ(αβ3^{−s})^k=(1−αβ3^{−s})^{−1}` | Pass |
| AL.3.5.1 central law; AL.3.5.2 zero modes, carried | `a↦az⁻¹`; `η=1`, `n=2` | `\|z\|^{ns}\|z\|^{−ns}η(z)^{−1}`; `1/(ns)`, `1/(n(s−1))` | Pass |
| AL.0.3.1 lattice dual, volumes, inversion, alternating and non-symmetric B, `Fⁿ` instance, zero pairing, carried | as in PRREVIEW~11 | `L^∨=⊕ϖ^{−ν}Of_j`; `c²`; `f(−τz)`; `τ=−1`; `τ²≠1`; index 9; `ν(ψ_b)=ν+ord b` | Pass |
| `godementJacquetLocal` at trivial `GL₂` and `n=0`, carried | `Φ=1_{M₂(O)}` | `(1−q^{−s−½})^{−1}(1−q^{½−s})^{−1}`; exponent s | Pass |
| `localZetaIntegral_functionalEquation`; `archimedeanLocalFunctionalEquation`, carried | `𝔽₃((t))`, `χ=1`; ℝ, `e^{−πx²}` | `γ=(1−3^{−s})/(1−3^{s−1})`; `Γ_ℝ(1−s)/Γ_ℝ(s)` | Pass |
| `finiteEigenSpace_finrank`; `archimedeanEigenSpace.finrank`, carried | `χ=1`; `χ(a)=a^{−1}` | dimension 1; the resonant line `ℂDδ₀` | Pass |
| `BesselHalfOrderDerivative`, carried | DLMF 10.38.7 | `√(π/2x)e^xE₁(2x)` | Pass |
| `casselmanNewvector`; AL.2.2.3 Check, carried | unramified PS, Steinberg, `c=2,n=1`; χ of conductor 2 | `n+1`, `n`, `0`; `c(St⊗χ)=4≠3` | Pass |
| `whittakerUniqueness`, `whittakerFunctionals`, `longWeyl`, `rsWeyl`, carried | `n=0`, `n=1`, `n=3`, `n=3,m=1` | rank 1/0; `ψ(b)`; antidiagonal; `diag(1,w₂)` | Pass |
| `rankinSelbergLocal`, `rankinSelbergLocalEqualRank`, `genericNewform`, carried | `GL₂×GL₁`; `m=0`; `GL₁` | `∏(1−α_iβq^{−s})^{−1}`; `c=5`; dimension 1 | Pass |
| AL.R, AL.0, AL.1.3.1, AL.5.4.1 and AL.5 Checks, carried | as in PRREVIEW~10 | `Γ_ℝ(s)`, `Γ_ℝ(s+1)`; `−i`; `−3i`; `−4/3`; `2(log p)²` | Pass |

## Not verifiable

- **Jacquet–Piatetski-Shapiro–Shalika, Theorem 2.7** (cited at `:1927` through Lafforgue): paywalled, not read. The README claims only that Lafforgue cites it, and `Lafforgue2002` lines 12386–12389 confirm that.
- **Sources outside the changed passages and the sample:** not re-read this round.
- **Ownership against open pull requests:** checked only for AL.3.10.3, using `roadmaps grep` and the overlap index. It is not a full read of every open roadmap.

## Source issues

- none
