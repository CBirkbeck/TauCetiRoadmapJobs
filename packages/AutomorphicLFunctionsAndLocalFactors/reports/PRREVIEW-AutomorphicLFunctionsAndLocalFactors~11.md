# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at f6df35b)

**Verdict:** needs changes

This is an incremental re-review of the 52 lines changed since 7605f3a. Line numbers refer to `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` unless marked `Suggested.lean`.

The previous review had three findings. Two are repaired: the Tau Ceti trace form and the single owner of the equal-characteristic local pair factors. The repair of the second adds one false clause, R01 below. The third, the pull-request description, is not repaired and is carried as R02.

## R01 (P2) — AL.3.10.3 calls the local pair factors polynomials; the L-factors are inverses of polynomials and the ε-factors are monomials

**Location:** AL.3.10.3, `:1927`: "its generic smooth complex local pair factors … are those of … (AL.3.2.3), … (AL.3.3.2) …; in the function-field variable they are polynomials in `z^(deg v)` with constant term 1, since `q_v^(−s)=z^(deg v)`."

**Claim:** "They" are the factors of AL.3.2.3 and AL.3.3.2. AL.3.2.3 (`:1528`) defines `L(s,π×π′)=P(q^(−s))^(−1)` with `P(0)=1`, and AL.3.3.2 (`:1565`) makes ε a nonzero monomial `c q^(−fs)`. Neither factor is a polynomial with constant term 1. The clause therefore contradicts the targets it cites, the source it cites and the Check added two lines below it.

This is P2 rather than P1 because nothing inherits the error: AL.3.2.3, AL.3.3.2 and the Lean statements (`AL3.rankinSelbergLocal`, `P.eval 0 = 1`) carry the correct normalization. Only this restatement is wrong.

**Witness:** The new Check (`:1929`) gives the pair factor `(1−αβz²)^(−1)=1+αβz²+…`, which is not a polynomial. Lafforgue2002 lines 12349–12353 (p.220) say that the inverse of the Euler factor is the polynomial, and that ε is a constant times `Z^(k·deg x)`, k∈ℤ.

**Repair:** In `:1927`, replace "in the function-field variable they are polynomials in `z^(deg v)` with constant term 1, since `q_v^(−s)=z^(deg v)`" by:

> since `q_v^(−s)=z^(deg v)`, each local L-factor is the inverse of a polynomial in `z^(deg v)` with constant term 1, and each epsilon factor is a nonzero constant times an integer power of `z^(deg v)`

**Tested** at the place `v=(t²+1)` of `𝔽₃(t)`, where `deg v=2`:

- Unramified α, β: the inverse factor is `1−αβz²`, a polynomial in `z²` with constant term 1, and `ε=1=(z²)⁰`.
- A ramified character of conductor 1 with `n(ψ)=0`: `ε=c·(z²)¹`.
- An unramified line with `n(ψ)=−1`: by the norm-twist law of `:1927`, `ε∝q_v^(s)=(z²)^(−1)`. So the power must be allowed to be negative ("integer power"), as Lafforgue says.

## R02 (P3) — The pull-request description still contradicts the README (carried from the previous review's R03, not repaired)

**Location:** the pull-request description.

- "take rank-one Hecke continuation and the global standard L-function from here".
- "Continuation for arbitrary unitary Hecke characters is the n = 1 case of the Godement–Jacquet matrix integral, not a separate rank-one argument".
- "The common adelic Tate/Fourier prefix and the rank-one scalar comparison are consumed from ArithmeticGaloisRepresentations §2.7".
- LFunctions and ZerosOfLFunctions "both must merge first"; ReductiveGroupsPartII is listed among "open pull requests of ours".

**Claim:** The description misstates ownership and dependencies, and the human approving the pull request reads it.

**Witness:**

- `:2500` reads "their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a".
- `:11` assigns the Fourier prefix to AnalyticNumberTheoryPartII §§5.3g–5.3h.
- `TauCetiRoadmap/LFunctions`, `TauCetiRoadmap/ZerosOfLFunctions` and `TauCetiRoadmap/ReductiveGroupsPartII` are folders on main (2083308).

**Repair:** Change the description only; the folder needs no edit.

- Replace the first sentence by "…take the global standard L-function from here; their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a."
- Replace the second by "The global Godement–Jacquet continuation is proved for every n ≥ 1 and identified at n = 1 with AnalyticNumberTheoryPartI §2.3a."
- Replace the third by "The local and adelic Fourier analysis and local zeta integrals are AnalyticNumberTheoryPartII §§5.3g–5.3j; the rank-one scalar comparison uses ArithmeticGaloisRepresentations §2.7."
- Delete the sentence about LFunctions and ZerosOfLFunctions, and drop ReductiveGroupsPartII from the list of open pull requests.

## Previous findings

- R01 — repaired: `Suggested.lean:319`, `:324` read `VectorFourier.fourierIntegral ψ μ (TauCeti.traceBilinForm F (Fin (n+1)))`, and `AL2.tracePairing` is deleted. Row `:87` and *Needs:* `:507` name `TauCeti.traceBilinForm`, `_isSymm` and `_nondegenerate`; `:1230` names the Tau Ceti form.
- R02 — repaired: `:1927` "its generic smooth complex local pair factors, ramified inputs included, are those of" AL.3.1.1, AL.3.2.3, AL.3.3.1, AL.3.3.2, AL.3.3.6. *Needs:* `:1933` adds them and AL.3.4.1; `:1599` cites AL.3.3.5. The repair's new clause is R01.
- R03 — not repaired: the description still says the consumers "take rank-one Hecke continuation and the global standard L-function from here"; carried as R02.

## Verified sound

**Gate and dependency check.** I ran the gate on this head. Every count is 0 and the result is OK; the worker's run also reports `build=0`. The dependency check prints:

```text
depcheck: 239 roadmaps, 2369 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or `moved:` lines. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0. It gives exactly 14 `declaration uses sorry` warnings, at lines 75, 80, 91, 125, 138, 164, 222, 290, 366, 382, 428, 523, 606 and 682, and nothing else.

- No line is longer than 100 characters.
- There is a single `import Mathlib`, plus three Tau Ceti modules, each used: `…Diagonal.Normalizer` for `permutationGL`, `…UpperUnitriangular.Basic` for `upperUnitriangularGroup` and `Algebra.Lie.GeneralLinear.TraceForm` for `traceBilinForm`.
- There is no `set_option`, `lemma` or sorry'd data.

**`#check @` audit.** I elaborated a scratch copy with `#check @AL2.godementJacquetLocal` and the four Tau Ceti trace-form declarations.

- `godementJacquetLocal` carries every binder in its own signature: `[IsNonarchimedeanLocalField F]`, `[BorelSpace F]`, the Haar instances on `μF`, `μ` and `ν`, `Continuous ψ`, `ψ ≠ 1`, and `ha`, `hapos` and `hmod`.
- Its type differs from the one at 7605f3a only in the pairing.
- In the same file, `example : TauCeti.traceBilinForm F (Fin n) X Y = (X * Y).trace := rfl` elaborates. So the swap changes no statement.
- The worker's two "dropped binder" leads are the `hbesselK` premise of the untouched Bessel theorems. They are anonymous premises, as in the previous review.

**One-tactic probe.** In a scratch copy, each of the 14 `sorry`s was replaced by `first | rfl | (simp; done) | infer_instance | decide | (norm_num; done) | trivial | exact le_rfl | aesop`. All 14 fail, so none is padding.

**Headline theorems.** The 14 stated headlines are those of the previous review. The module docstring (`Suggested.lean:29–52`) still names the unstatable global, archimedean, curve, shtuka, AL.4 and AL.5 headlines, and now also names the Tau Ceti trace form.

**Seeded sample: Check for the theta–Mellin formula** (`:1706–1708`, AL.3.5.1; untouched, re-read). `CogdellColumbia` §1.1.3 starts at line 251 (printed p.4).

- Lines 264–268 give `E=|det g|^s∫Θ′_Φ(a,g)|a|^{ns}η(a)d×a` for `Re s>1`, with η unitary and ξ=0 removed.
- Lines 279–289 (p.5) give the `P′` section and the sum over `P′(k)\GLₙ(k)`.
- The Check value is `3·5·2^(2·1)=60`; omitting n gives 30.

The locator, the hypotheses and the statement agree with the README. The README flags no locator as unverified.

**New locator: Lafforgue, Appendix B §1a, pp.220–221** (`:1931`).

- §1 and §1a begin at `Lafforgue2002` lines 12347–12348 (p.220).
- Lines 12377–12379 take local components that are irreducible or induced of Whittaker type.
- Lines 12386–12393 (pp.220–221) attach to each pair an Euler factor and an ε-factor, citing JPSS Theorem 2.7. This is the claim at `:1927`.
- §1b starts at line 12445 (p.222).

**Characteristic scope behind "each stated for local fields of either characteristic".**

- The Conventions (`:49`) make every AL.3 local target cover both characteristics.
- `CogdellPiatetskiShapiroDerivatives` line 91 ("non-archimedean local field", no characteristic restriction) backs AL.3.2.3 and AL.3.3.2 at that generality.
- `CogdellFields` line 4001 restricts to characteristic 0, but it is cited only for unitary inputs.
- `AL3.rankinSelbergLocal` and `AL3.rankinSelbergLocalEqualRank` are stated under `[IsNonarchimedeanLocalField F]`.

**Library declarations opened at the pins.**

- Tau Ceti `TauCeti/Algebra/Lie/GeneralLinear/TraceForm.lean`:
  - `traceBilinForm`, `:116`, for `[Fintype n] [CommSemiring R]`, matching row `:87`;
  - `traceBilinForm_isSymm`, `:126`;
  - `traceBilinForm_nondegenerate`, `:131`, both-sided `Nondegenerate`, which is what AL.0.3.1 needs;
  - `traceBilinForm_apply`, `:138`.
- Mathlib `VectorFourier.fourierIntegral` (`Mathlib/Analysis/Fourier/FourierTransform.lean:81`): the kernel is `e (-L v w)`.

**Cross-roadmap citations resolved.**

- Consumers of AL.3.10.3: GlobalShtukasAndFunctionFieldLanglands, at its open head (README:96 and :2140), cites AL.3.10.3 for the equal-characteristic Artin local constants, the norm-twist and highly ramified-twist laws and the product formula. All of these remain in AL.3.10.3 at this head, so the change breaks no consumer.
- `tracePairing`: `roadmaps grep` finds no other roadmap citing `AL2.tracePairing`. HilbertModularForms has an unrelated `tracePairing` in its own namespace.
- Overlaps: the overlap index reports no dropped ids, and no heading changed.
- AL.3.4.1 owns the function-field reconstruction that `:1927` now cites. Its hypotheses paragraph (`:1631`) says "On the function-field carriers of Restricted tensor realizations (AL.R.3), prove the same reconstruction…".

**Remark on untouched text (no change requested).** AL.3.10.4 (`:1937`) still says "the equal-characteristic local-factor prefix". That phrase still resolves to the ℓ-adic local factors and epsilon constants that AL.3.10.3 constructs.

**Adversarial calculations.** The rows marked "carried" are statements this change leaves untouched; their values are those of the previous review (PRREVIEW~10). The other rows are computed for this head.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Row `:87`, `TauCeti.traceBilinForm` (changed) | `E₁₂,E₂₁`; `E₁₂,E₁₂`; general X, Y | 1 and 0 by `simp` in scratch; `rfl` to `(X*Y).trace` elaborates | Pass |
| AL.0.3.1 `Mat_n` instance, `:482` (changed) | `tr(E₁₂Y)`; `n=2, ν=1, q=3` | `Y 1 0` (Lean); `[Mat₂(P^{−1}):Mat₂(O)]=3⁴`, `vol=3^{−2}`, `3^{−2}·3^{−2}·3⁴=1` | Pass |
| AL.0.3.1 τ for the trace form, `:87` (changed) | `traceBilinForm_isSymm` | `B(τX,Y)=B(Y,X)=B(X,Y)`, so τ=1 and `f̂̂(X)=f(−X)` | Pass |
| `godementJacquetLocal` kernel, `Suggested.lean:319, 324`, `:1230` (changed) | `fourierIntegral ψ μ L Φ (−Y)` | `ψ(−tr(X·(−Y)))=ψ(tr(XY))`: the positive transform of the docstring | Pass |
| `godementJacquetLocal` signature (changed) | `#check @` | every binder explicit; only the pairing differs from 7605f3a, and the two pairings are `rfl`-equal | Pass |
| AL.3.10.3 single owner, `:1927` (changed) | `K=𝔽₃(t)`, `v=(t²+1)`, `K_v≅𝔽₉((u))` | covered by `AL3.rankinSelbergLocal` under `IsNonarchimedeanLocalField`; AL.3.10.3 now builds only the ℓ-adic side | Pass |
| AL.3.10.3 "they are polynomials", `:1927` (changed) | same v; unramified α, β; χ of conductor 1, `n(ψ)=0` | `L=(1−αβz²)^{−1}=1+αβz²+…`; `ε=c·z²`, constant term 0 | Fail (R01) |
| AL.3.10.3 new Check, `:1929` (changed) | `t²+1` over `𝔽₃` | `t²∈{0,1}` never equals 2, so the place is irreducible of degree 2 with residue field `𝔽₉`; `9^{−s}=z²`; the wrong model `q=3` gives `z` | Pass |
| AL.3.10.3 *Needs:*, `:1933` (changed) | build order | AL.3.1.1 `:1429`, AL.3.2.3 `:1526`, AL.3.3.1 `:1553`, AL.3.3.2 `:1563`, AL.3.3.6 `:1595`, AL.3.4.1 `:1627`, all before `:1925`; none of their *Needs:* cites AL.3.10 | Pass |
| AL.3.3.6 hypothesis, `:1599` (changed) | `𝔽₃((t))`, unramified `GL₁×GL₁`, `Φ°=1_O`, ψ of conductor O | `Σ_{k≥0}(αβ3^{−s})^k=(1−αβ3^{−s})^{−1}`; AL.3.3.5 at `n=1, c=0` gives the spherical line in characteristic 3 | Pass |
| AL.3.5.1 theta–Mellin Check (sampled), carried | point mass, `n=2`, `\|det g\|=3`, `θ₀=5`, `\|a\|=2`, `η=1`, `s=1` | `3·5·2²=60`; dropping n gives 30; the source has `\|a\|^{ns}` (line 267) | Pass |
| AL.3.5.1 central law, carried | `a↦az⁻¹` | `\|z\|^{ns}\|z\|^{−ns}η(z)^{−1}` | Pass |
| AL.3.5.2 zero modes, carried | `η=1`, `n=2`, `g=1` | `1/(ns)`, `1/(n(s−1))`; residues `−κΦ(0)/2`, `κΦ̂(0)/2` | Pass |
| AL.0.3.1 lattice dual, carried | `L=⊕Oe_i`, `B(e_i,f_j)=δ_ij` | `L^∨=⊕ϖ^{−ν}Of_j`; its first-variable dual is L | Pass |
| AL.0.3.1 volume product, carried | `L⊆L′` | `[L′:L]=[L^∨:L′^∨]`; scaling by c multiplies the product by `c²` | Pass |
| AL.0.3.1 inversion with τ, carried | `f=1_{a+L}` | `f̂̂(z)=1_L(a+τz)=f(−τz)` | Pass |
| AL.0.3.1 alternating Check, carried | `𝔽₃((t))`, `B=x₁y₂−x₂y₁`, `a=(t^{−1},0)` | `τ=−1`; `f̂̂(a)=1`, `f(−a)=0` | Pass |
| AL.0.3.1 non-symmetric B, carried | `M=[[1,1],[0,1]]` | `τ=[[1,1],[−1,0]]`, `τ²≠1` | Pass |
| AL.0.3.1 `Fⁿ` instance, carried | `n=2, ν=1, q=3` | index 9; `vol(O²)=3^{−1}` | Pass |
| AL.0.3.1 zero pairing and conductor law, carried | `B=0`; `ψ_b=ψ(b·)` | `L^∨=F²`, not compact; `ν(ψ_b)=ν+ord b` | Pass |
| `godementJacquetLocal`, carried | trivial `GL₂`, `Φ=1_{M₂(O)}` | `(1−q^{−s−½})^{−1}(1−q^{½−s})^{−1}`, convergent for `Re s>½` | Pass |
| `godementJacquetLocal`, `n=0`, carried | rank one | exponent `s+0/2=s` | Pass |
| `localZetaIntegral_functionalEquation`, carried | `𝔽₃((t))`, `χ=1`, `f=1_O` | `γ=(1−3^{−s})/(1−3^{s−1})` | Pass |
| `archimedeanLocalFunctionalEquation`, carried | ℝ, `e^{−πx²}` | `γ=Γ_ℝ(1−s)/Γ_ℝ(s)` | Pass |
| `finiteEigenSpace_finrank`, carried | `χ=1` | invariants `ℂδ₀`, dimension 1 | Pass |
| `archimedeanEigenSpace.finrank`, carried | ℝ, `χ(a)=a^{−1}` | resonant line `ℂDδ₀` | Pass |
| `BesselHalfOrderDerivative`, carried | DLMF 10.38.7 | `√(π/2x)e^xE₁(2x)`, with `Ei(−r)=−E₁(r)` | Pass |
| `casselmanNewvector`, carried | unramified PS; Steinberg; `c=2, n=1` | `n+1`; `n`; `0` in ℕ | Pass |
| AL.2.2.3 Check, carried | χ of conductor 2; of conductor 1 | `c(St⊗χ)=4≠3`; `2=2` | Pass |
| `whittakerUniqueness`, carried | `n=0`; trivial `GL₂` | rank 1; rank 0 | Pass |
| `whittakerFunctionals`, `longWeyl`, carried | `n=1`; ℚ, `n=3` | character `ψ(b)`; antidiagonal `3×3` | Pass |
| `rsWeyl` against `w_{n,m}`, carried | `n=3, m=1` | `diag(1,w₂)` matches `Ψ₀`; the printed `diag(I₂,w₁)` does not | Pass |
| `rankinSelbergLocal`, carried | `GL₂×GL₁` unramified; `π₀⊗\|det\|^{−5}` | `∏(1−α_iβq^{−s})^{−1}`; `c=5` | Pass |
| `rankinSelbergLocalEqualRank`, `genericNewform`, carried | `m=0`; `GL₁` | `(1−χ₁χ₂(ϖ)q^{−s})^{−1}`; dimension 1 at `m≥c(χ)` | Pass |
| AL.R, AL.0, AL.1.3.1, AL.5.4.1 and AL.5 Examples and Checks, carried | as in PRREVIEW~10 | `Γ_ℝ(s)`, `Γ_ℝ(s+1)`; `−i`; `−3i`; `−4/3` against 0; `2(log p)²` | Pass |

## Not verifiable

- **Jacquet–Piatetski-Shapiro–Shalika, Theorem 2.7** (cited at `:1927` through Lafforgue): paywalled and not read. The claim at `:1927` is only that Lafforgue cites it, which `Lafforgue2002` lines 12386–12389 confirm.
- **Godement–Jacquet, LNM 260; Bernstein–Zelevinsky (1976):** paywalled, not read; they are cited by locator. Their passages are untouched.
- **Sources outside the changed passages and the sample were not re-read this round.**
- **Ownership against open pull requests** was checked with `roadmaps grep` for `tracePairing`, for "local-factor prefix" and for the consumers of AL.3.10.3, and against the overlap index. It is not a full read of every open roadmap.

## Source issues

- none
