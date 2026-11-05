# Review of CharacterSumsOverFiniteFields (pull request #1712 at f90a255)

**Verdict:** needs changes

The gate passes, but the counterexamples and ownership conflicts below block acceptance. This is a full review of both files at the specified head. No pull-request file was changed. Findings distinguish false statements from missing hypotheses and weaker Lean signatures.

## R01 (P1) — The Lean Jacobsthal expansion is false at n = 0

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/Suggested.lean:167`, `jacobsthalPsi_eq_sum_jacobiSum`, with unrestricted `(n : ℕ)`. README:702 instead says “`n ≥ 1`”.

Claim: the expansion holds for every natural exponent.

Witness: take `F = ZMod 3`, `n = 0`, `a = 1`. The left side is `3η(2) = −3`; the right side is `η(−1)J(η,η) = −1`.

Repair: add `(hn : 0 < n)` to this theorem. Keep the zero-exponent computation as a negative-control README Check. At `n = 1`, the same field and parameter give `0 = 0`. This is an explicit missing argument, not a silently dropped section binder.

## R02 (P1) — The Artin–Schreier constants cannot be independent of q

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:899`: “`C, Q₀` depending only on `n`”; line 902 makes the corresponding assertion depending only on `d`.

Claim: the point-count constants are uniform in the base field although the exponent of `y` is its cardinality `q`.

Witness: for odd `q`, `f = X²` and `E = F_(q^(4r))`, the count is `Q − (q−1)√Q`. Thus the normalized error is `q−1`, unbounded with fixed degree two.

The count follows by additive orthogonality: the `q−1` nontrivial quadratic exponential sums over this extension all equal `−√Q` (quadratic Gauss evaluation and lifting). Direct enumeration gives `N = 63` for `q = 3, Q = 81`, and `N = 525` for `q = 5, Q = 625`. Increasing `r` defeats any proposed threshold `Q₀` independent of `q`.

Repair: allow dependence on `q` as well as `n` in (i), and on `q,d` in (ii); preserve uniformity over all extensions and coefficients. State that quantifier order explicitly in Lean. The corrected constants must allow at least `C = 2` and `C = 4` in the two examples. Adjust the opening of Layer 4 accordingly; its phrase “only on the degrees” must include the degree in `y`.

## R03 (P1) — The resultant function does not factor through the radical without a degree factor

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:924`: “`λ_f(g)` depends only on `g` modulo the radical `rad f`”; line 928 calls it a character of the quotient's units.

Claim: the function as defined descends to the quotient, independently of the degree of the monic input.

Witness: over `F_7`, let `f = X`, `χ = η`, `g₁ = X−1`, `g₂ = X²−1`. Both reduce to `−1` modulo `X`, but their norm-character values are `1` and `−1`.

Repair: retain the resultant definition and include the scalar. If `f = c∏P P^e_P` with monic irreducible `P`, then
`λ_f(g) = χ((-1)^deg(f) c)^deg(g) ∏P (χ^e_P ∘ N_(F[X]/P)/F)(g mod P)`.
The last product is the quotient character; the scalar is constant within each fixed-degree coefficient sum, which is enough for the vanishing proof. In the witness the scalar is `(-1)^deg(g)` and the quotient character is `η(−1) = −1`, giving exactly `1,−1`.

## R04 (P1) — The Gauss-product and opposite-valuation formulas include the trivial character

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:1225`: “`g_a g_{q−1−a} = ω^{−a}(−1) q`”, under line 1214's `0 ≤ a < q−1`; also lines 1236–1243 and the repeated worked examples.

Claim: the nontrivial-character product and complementary digit valuation hold at `a = 0`.

Witness: for `q = 7`, reading exponents periodically, `g₀ = g₆ = −1`, so the product is `1`, not `7`. Both prime valuations of `g₀` are zero, not `0` and `6`.

Repair: impose `0 < a < q−1` on the product, absolute-value assertion, and complementary `6−a` formulas. Keep `a = 0` explicitly as `g₀ = −1`, valuation zero everywhere, unit ideal. The digit-sum factorization using remainders already handles it correctly. At `a = 1`, the product is `−7` and the valuation pair is `(1,5)`.

## R05 (P1) — The trivial-pair L-series Check uses the wrong multiplicative function

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:777`: “with `χ = ψ = 1` the degree-`d` sum is `q^d` and `L = (1 − qT)⁻¹`”.

Claim: the Gauss-sum multiplicative function of §3.3 becomes the constant-one function.

Witness: its value is zero on monic polynomials with zero constant coefficient. Over `F_3`, its degree-one and degree-two coefficient sums are `2,6`, not `3,9`.

Repair: for `d ≥ 1` use `(q−1)q^(d−1)` and `L = (1−T)/(1−qT)`. Its expansion begins `1+2T+6T²` over `F_3`. Keep the separate, correct constant-function example at line 767.

## R06 (P1) — The composite-modulus negative control is an equality under Lean's division

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:1684`: “`J(χ, χ⁻¹) = 0 ≠ τ(χ)τ(χ⁻¹)/τ(1)` modulo `9`”; compare lines 1668–1672.

Claim: the displayed quotient differs from zero, and the quotient formula fails for every imprimitive-product pair modulo nine.

Witness: for the order-six character modulo nine, `J = 0`, `τχ τχ⁻¹ = −9`, and `τ1 = 0`. In `ℂ`, Lean evaluates `−9/0 = 0`; the alleged inequality is `0 ≠ 0`.

Repair: use the cross-multiplied negative control `J(χ,χ⁻¹)τ(1) = 0 ≠ −9 = τχ τχ⁻¹`. Remove or recompute the “every pair” counts for the quotient, distinguishing undefined classical division from totalized Lean division. The corrected cross-multiplied witness retains the intended need for primitivity.

## R07 (P1) — Negating the Kloosterman sum does not also complement the angle

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:1135`: “`Kl = 2√q cos θ'` for `−K` gives `θ' = π − θ`”.

Claim: both the sum and the cosine convention are negated, yet the angle must change.

Witness: `K_7(1,1) = 2.048917`, `θ = 1.968399`. Then `−K = −2.048917`, whereas `2√7 cos(π−θ) = +2.048917`.

Repair: write `θ' = θ` when `Kl = −K` has the positive-cosine convention. Complement the angle only if the underlying sum is kept fixed. With the repair, both sides are `−2.048917`.

## R08 (P1) — Reversing only the additive character does not conjugate a general Gauss sum

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:234`: “Sources using `e(−Tr(x)/p)` … get the complex conjugate”; repeated at line 418.

Claim: changing the additive sign alone conjugates the sum for every multiplicative character.

Witness: over `F_7`, with `ω(3)=e(1/6)`, the sign-reversed sum is `2.440133−1.022619i`, while the conjugate of the original sum is `−2.440133−1.022619i`.

Repair: write `g(χ,ψ⁻¹)=χ(−1)g(χ,ψ)` and `conj(g(χ,ψ))=g(χ⁻¹,ψ⁻¹)`. These are the pinned `gaussSum_mulShift_eq` and `star_gaussSum_eq`, in `Mathlib/NumberTheory/GaussSum.lean:83` and `:89`. In the witness `χ(−1)=−1`, giving the computed sign-reversed value. The ideal and absolute-value invariance remain valid.

## R09 (P2) — Stickelberger's leading congruence requires the specified trace character

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:1213`: “Let `ψ` be a primitive additive character … (for instance `x ↦ ζ_p^{Tr(x)}`)”.

Claim: the leading coefficient relative to the fixed `λ = ζ_p−1` is independent of this choice.

Witness: at `q=3,a=1`, use `ψ(x)=ζ₃^(2x)`. Then `g=ζ₃²−ζ₃ ≡ λ mod λ²`, so `−g ≡ −λ`, not `λ`.

Repair: require `ψ(x)=ζ_p^(Tr x)`, as `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:14607` (§7.12) does. Alternatively, for the shift by `u`, multiply the congruence's right side by `ω(u)^a`. For `u=2`, that factor is `−1` and fixes the witness. The valuation statement itself is invariant under this unit factor.

## R10 (P2) — The lifted Jacobi norm needs nontrivial product

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:852`: “Hence `|J(χ', ψ')| = q^{n/2}`”, after explicitly including `χψ=1`.

Claim: the same norm follows in both branches of the lifting relation.

Witness: take the quadratic character over `F_3` and lift it to `F_9`. The lifted Jacobi sum is `−1`, of norm `1`, whereas `3^(2/2)=3`.

Repair: restrict the square-root norm to `χψ≠1` and give norm `1` in the inverse-product branch. Keep `jacobiSum_lift` unchanged: its signed equality is correct in both branches. A nontrivial-product example over `F_7` lifted to `F_49` has norm `7` as predicted.

## R11 (P2) — The cyclotomic absolute-value claim also needs nontrivial χ

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:597`: “conjugate algebraic integers of the same absolute value `q^{m/2}`”, with `m=orderOf χ` unrestricted.

Claim: this norm holds for the trivial multiplicative character too.

Witness: at `q=7`, `χ=1` has `m=1` and `g(χ)^m=−1`, of absolute value `1`, not `√7`.

Repair: qualify just this norm assertion by `χ≠1`; retain the integrality, Galois action and Frobenius invariance for all characters. Record norm `1` at `χ=1`. The cubic example still has `|g³|=7√7`.

## R12 (P2) — The Hasse-derivative criterion omits the zero polynomial

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:877`: “For `f ∈ F[X]` and `k ≥ 1`: … multiplicity `≥ k` iff …”.

Claim: the equivalence uses Mathlib's natural-valued `rootMultiplicity` for every polynomial.

Witness: `Mathlib/Algebra/Polynomial/Div.lean:524`, `rootMultiplicity_zero`, gives multiplicity zero. For `f=0,k=1`, the left side is false and all derivative values on the right are zero.

Repair: add `f≠0`, or express the unrestricted statement as divisibility by `(X−C x)^k`. The divisibility version is true for `f=0`; with the nonzero version, `f=X,x=0,k=1` has multiplicity one and vanishing zeroth derivative.

## R13 (P2) — The hyperelliptic prose drops the positive-degree hypothesis

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:1005`, the squarefree degree-`m` point-count corollary. `Suggested.lean:342` correctly includes `(hf0 : 0 < f.natDegree)`.

Claim: squarefreeness alone suffices for the stated `(m−1)√q` bound.

Witness: `f=1` is squarefree. Over `F_3`, `y²=1` has six affine points; the left side is `3`, whereas the proposed right side is `−√3`.

Repair: require `m≥1` in the README and retain the Lean hypothesis. Add the constant polynomial as a rejection Check. For `f=X` over `F_3`, the repaired theorem gives `0≤0`.

## R14 (P2) — Use the conductor exponent in the prime-power reduction

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:1451` introduces a character “modulo `p^j`”; line 1460 then says the sum vanishes when `j=k`, treating it as primitive.

Claim: equality of the declared modulus and the summation modulus implies primitivity.

Witness: the principal character modulo `25`, with `m=n=5`, gives `Sχ(5,5;25)=5S(1,1;5)=5(3−√5)/2≈1.909830`, not zero.

Repair: define `p^j` to be the conductor, or require primitivity at that modulus and then induce to `p^k`. For the witness `j=0`, and the lower-level recursion gives exactly the computed value. Knightly–Li Theorem 9.3 expressly uses conductor (`knightly-li line 6845`).

## R15 (P2) — The displayed τ₂ has square-root norm only at odd modulus

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:1526`: “`|τ_2(χ)| = √q` for `χ` primitive”.

Claim: primitivity alone gives the norm for the shift by two.

Witness: the primitive character modulo four has values `χ(1)=1, χ(3)=−1`. Its shifted sum is `τ₂=−1+1=0`, whereas `√4=2`.

Repair: for primitive characters say `|τ₂|=√q` when `q` is odd, and `τ₂=0` when `q` is even. This follows from `DirichletCharacter.gaussSum_mulShift_of_isPrimitive`, `Mathlib/NumberTheory/DirichletCharacter/GaussSum.lean:57`, including its nonunit branch. The quartic example modulo five still has norm `√5`.

## R16 (P2) — The reflection consistency Check applies the odd-prime formula at p = 2

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:1332`: “`∏_i Γ_p(x_i) Γ_p(1 − x_i) = (−1)^{∑ R(x_i)}`”, with no oddness restriction.

Claim: the cited reflection law holds for every prime in this layer.

Witness: at `p=2,q=4,a=1`, the arguments are `1/3,2/3`, with `R=1,2`. The asserted parity gives `(-1)^(2+1+2)=−1`, but `ω⁻¹(−1)=1`.

Repair: use this calculation only for odd `p` and nonzero `a`. For `p=2`, consume the mod-four reflection law in `TauCetiRoadmap/DirichletPadicLFunctions/README.md` §4.4: the sign is `(-1)^(1+x₁)` for the second binary digit. Both arguments in the witness have `x₁=1`, so the product is `+1`, and the Gauss-product value is `4`. Gross–Koblitz's original text assumes odd `p` (`gross-koblitz line 31`; Lemma 2.3, printed p.572, line 154).

## R17 (P2) — The empty-family convention is not carried into the subsequent formulas

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:670` allows “`r ≥ 0`”; lines 674–679 state the trivial-product recursion, its norm and the diagonal count without restoring `r≥1`.

Claim: those formulas apply to an empty family too.

Witness: at `r=0`, all characters are nontrivial vacuously and their product is one, but `χ_r` is undefined. Also `J()=0`, whereas the claimed second-case norm is `q^(-1)>0`.

For the empty diagonal equation with `b=1`, the actual count is zero, not the baseline `q^(r−1)` (whether interpreted as a real negative exponent or natural subtraction).

Repair: retain the useful empty-sum definitions and Checks, but require `r≥1` before the recursions and diagonal-count formulas. The Lean diagonal theorem already does. At `r=1,d₁=1,a₁=b=1`, the count and baseline are both one, and the error bound is zero.

## R18 (P2) — The Hasse–Davenport product already has an owner on main

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:822` (§3.4); `Suggested.lean:242` and `:247` restate the product and its duplication specialization.

Claim: this roadmap owns and proves the general product relation.

Witness: `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:15058` (§7.29), on main, states it for every multiplicative character, exact-order auxiliary character, and nontrivial additive character, with zero extension at zero.

Repair: import §7.29 by name and section in Scope and supplier contracts. Delete the duplicate product theorem from `Suggested.lean` and keep the duplication specialization as a README consequence/Check, rather than a second acceptance theorem. The formulas agree: over `F_13`, order-three auxiliary character and `χ=ω`, both give `−44.8610+13.5828i`; `χ=1` gives `−13`. The factor `χ(m)^m` in the supplier is the inverse factor moved across the equality here. No new upward edge is needed.

## R19 (P2) — Construct the global Teichmüller character by specializing the supplied residue character

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:1178`: “reduction … is a bijection … Define the Teichmüller character … as the inverse bijection”.

Claim: the global multiplicative-character construction is new ownership distinct from §1.23 of the classical arithmetic roadmap.

Witness: `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:1042` defines `powerResidueSymbol` in the same global ring of integers by the same unique-root congruence. At `n=q−1`, its exponent `(q−1)/n` is one.

Repair: consume §1.23's construction, uniqueness and order API at `n=q−1`; retain the residue-cardinality argument and the comparison with the completed local lift as this roadmap's work. Do not reconstruct the inverse-root bijection as a second target. At `q=7,x=2`, both definitions return `ζ₃` reducing to `2`, and both exclude `ζ₃²`, which reduces to `4`. Update the module docstring's ownership explanation; a missing compiled supplier carrier does not transfer ownership.

## R20 (P2) — The Lean Kummer bound does not state its promised uniformity

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/Suggested.lean:269`, `stepanov_kummer`; README:890 says constants depend “only on `d` and `m`”.

Claim: the Lean signature tests uniformity over all polynomials and base fields of fixed degree.

Witness: the elaborated type takes `F`, `d`, and `f` before `∃ C₀ Q₀`. Consequently each polynomial and each field may choose different constants; only `E` is quantified after them.

Repair: fix degrees first, then state `∃ C₀ Q₀, ∀ F …, ∀ f …` with `f.natDegree=m`, followed by all extensions. Do the analogous correction for the Artin–Schreier statements after allowing the base cardinality in their constants (R02). This retains `y²=x` over every field with the same constants `C₀=0,Q₀=0`; allowing separate constants `C_F=card F` would satisfy the present weak test without establishing the promised uniform theorem.

## R21 (P3) — Supply exact locators for the elementary proof inputs

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:893`, “Schmidt … Ch. I”; lines 904–917 and References:1712–1719.

Claim: these chapter-level references specify the precise bounds, Jacobsthal evaluation and power-sum input used by the build.

Witness: §4.2 cites only an entire chapter; §4.3 does likewise for its polynomial case; §2.5 points only to Berndt–Evans–Williams Ch.6; §4.4 names an “isolated-singularity lemma” without an exact declaration.

Repair: give a theorem/proposition or proof-step locator and printed page for each of these claims, and exact pinned declarations for the analytic route where it is retained. In particular, identify a result with the corrected `q` dependence from R02. An unavailable legal text is recorded below, not guessed. This is a locator defect independent of access to the text.

## R22 (P3) — The quadratic-character definition still lacks its three Checks and an API list

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:468`–476: the definition and “Prove:” paragraph go directly into §0.5, with no Checks list.

Claim: every definition has the required API and at least three discriminating Checks.

Witness: §0.4 has zero such bullets. The required facts appear only in a paragraph, and examples in other sections do not supply this definition's required list.

Repair: put its API into prose bullets and add at least three explicit tests, for example `η₃(0)=0`, `η₃(2)=−1` with no square roots of two, and `η₇(−1)=−1`; also test `η₂=1`. These reject the constant-one, wrong-zero and wrong-parity models. Apply the API-bullet requirement to the other definition paragraphs too. This is the remaining part of the earlier shape finding.

## Disposition of the previous review

All eleven previous findings were checked against this head before the full pass. No repair report marking any finding “not actionable in this package” was supplied or found among the job's previous-review material.

| Previous finding | Current passage and disposition |
|---|---|
| R01, Gamma/Gross–Koblitz ownership | **Repaired.** README:59: “Nothing about `Γ_p` is defined or proved here.” Contracts at 356–363 and the transport targets at 1266–1326 consume `DirichletPadicLFunctions` §§4.1, 4.4, 4.5. The duplicate Gamma declarations are gone. R16 concerns a different, incorrect use of the supplied reflection law. |
| R02, module warning | **Repaired.** Suggested:1–3 now has `module` and `public import Mathlib`, with `@[expose] public section` at 43. Both the worker gate and direct elaboration pass. |
| R03, declarations beyond the pin | **Repaired.** README:339–340 says “0.5 and 7.7 are written without them and 1.4 consumes `AnalyticNumberTheoryPartI`.” Its §2.30 supplies the sign. The primitive Gauss product uses the actual pinned declaration. No `conreyCharacter` is claimed. |
| R04, shape | **Partly repaired.** Required Scope, Conventions, Exact supplier contracts and How to read the build headings, `*Needs:*` lines, and layer Examples/Dependencies now occur. The §0.4 definition still goes straight to §0.5 without Checks; see R22. |
| R05, process text/dead links | **Repaired for the cited passages.** README:42 links Chebotarev under `Completed`; the alleged `references/` directory and “on disk” claims are gone. The lean docstring calls the file “target signatures”. |
| R06, supplier-name drift | **Repaired.** README:367–368 consumes “§1.16: `S(m, n; c)` in prose, its frequency symmetry, its reality” through the named `kloosterman_real` and the Ramanujan value. The valuation convention at 245 names Mathlib's `multiplicity`. |
| R07, API padding | **Repaired for the declarations identified there.** The listed application, boundary, symmetry and small-value declarations were deleted. Suggested:8–14 now says it states the headline theorems and that README API/Checks are not restated. The new ownership audit finds R18 independently. |
| R08, Bombieri citation | **Repaired.** README:1729 says “Background for Stepanov's method only”; it explicitly distinguishes the Riemann–Roch curve argument from the polynomial targets. |
| R09, π/λ and Γ₂(3) | **Repaired for both cited errors.** README:1165–1167 distinguishes `λ := ζ_p−1` from the Gross–Koblitz `π`; the erroneous Γ₂(3) example is absent. R16 is the remaining all-primes reflection error. |
| R10, half-integral boundary | **Repaired.** README:70–73 assigns the theta-multiplier sums to `GeometryOfNumbersAndQuadraticArithmetic` §4.3, distinguishing the sums here. |
| R11, transient docstring | **Repaired.** Suggested:360–361 now says the comparison is a “README target (5.1), since the hyper-Kloosterman carrier is not at the pins.” |

## Verified sound

**Coverage and mechanical evidence.** Read all 49 numbered README targets, their API paragraphs, Checks, worked examples, references and dependency lines, and all 61 actual Lean declarations (43 admitted theorems, 18 definitions/abbreviations/instances). Read the repository's normative README and CONTRIBUTING and main's `ThetaSeries` and `ClassicalArithmeticCompletion` for shape. The head is exactly `f90a25595842f52e750d38087874f8c7c50906c5`; the worktree is clean and the diff outside this roadmap is empty. No sorry'd data, options, extra imports, computational algorithm target, or copied source passage was found in the reviewed files.

The supplied gate reports every scanner, dependency, metadata, outside-folder and targeted-build check at zero, ending `build=0 OK`. Independently ran direct Lean elaboration of `Suggested.lean`: exit zero, exactly 43 `declaration uses sorry` warnings, no other warnings. The requested dependency command returned:

```text
depcheck: 204 roadmaps, 1545 edges, 0 problem(s)
```

No `UPWARD` or `CYCLE` line occurred. No declared supplier gap was present. The two ownership repairs point to an existing owner on main, not to a later supplier.

**Signatures and padding.** Elaborated a scratch copy with `#check @name` for every real declaration and compared the types against the README. There are 61 declarations: the worker's count of 62 includes a spurious parsed `;` from prose. All eight possible lost-binder leads were examined. The norm/trace definitions can be formed on the wider native carriers, and the theorems that require finite fields explicitly retain their finite-field binders. The polynomial helper definitions do not need finiteness; the CRT factors retain coprimality and do not need the section's `NeZero` assumptions to be defined. These leads are not findings. R01 and R20 are genuine signature differences. No reviewed file was changed.

A scratch one-tactic `simp` attempt was run at each of the 43 sorried theorems; none closed. Definitions and relevant pinned lemmas were also read to distinguish elementary API from headlines. The earlier padding list is gone. R18 separately removes an acceptance theorem already owned elsewhere; the probe is not evidence that every remaining statement is true.

**Headline inventory.** The README's main end results and their current acceptance signatures are:

| README targets | Headline signatures / disposition |
|---|---|
| 0.1–0.6 | Canonical-character primitivity and unique shifts; Galois action on character values; order and characterization of norm lifts. Present. |
| 1.2–1.4 | Gauss norm and cyclotomic integrality of the order power. Present. Prime quadratic sign is consumed from `AnalyticNumberTheoryPartI` §2.30 and named in the docstring rather than redeclared. |
| 2.2–2.5 | Jacobi norm, multiple-Jacobi Gauss formula, diagonal bound, two Jacobsthal expansions and Jacobsthal's theorem. Present; R01 fixes one signature. |
| 3.1–3.5 | Polynomial criterion, root-power identity, Hasse–Davenport lifting/product, extension-field quadratic sign, duplication and Jacobi lifting. Present; R18 removes duplicate ownership of the product and its specialization. |
| 4.2–4.9 | Three uniform Stepanov bounds, power-sum lemma, multiplicative/additive L-polynomials, both Weil bounds and hyperelliptic count. Present; R02/R20 fix uniformity and R13 aligns prose. |
| 5.2–5.5 | Gauss expansion, Salié evaluation, degree-two reciprocal-root/lifting theorem and twisted Weil bound. Present on the actual finite-ring/field sum. |
| 6.1–6.5 | Global residue character, Stickelberger congruence/factorization, Jacobi digit valuations, completion comparison and transported Gross–Koblitz evaluations. Named as unavailable in the module docstring, with the missing supplier construction/Gamma carriers identified. No fake carrier or substitute theorem occurs. R19 corrects ownership of the global character. |
| 7.1–7.7 | Imprimitive Gauss formula, Gauss CRT, primitive-product Jacobi quotient, Kloosterman CRT, prime-power evaluation/non-square branch, prime-square bound, general untwisted/conductor/cube-free bounds. Present. Named comparisons with the spectral roadmaps are docstring-only because their carriers are not compiled at the pins; character-page naming adds no headline. |

**Pinned declarations opened.** Pins: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following 14 source files provide concrete checks of the native objects and the supplier claims:

| Pinned file and line | Declaration / hypotheses verified |
|---|---|
| `Mathlib/NumberTheory/MulChar/Basic.lean:72`, `:129`, `:233`, `:261` | `MulChar` extends a monoid homomorphism with nonunits sent to zero. `map_zero` additionally needs a nontrivial domain; the definition alone does not exclude the zero ring. The principal character is one on units. This explains the modulus-one case and the trivial-character failures above. |
| `Mathlib/NumberTheory/MulChar/Lemmas.lean:73`, `:96`, `:113`, `:143`, `:166`, `:206`, `:228` | `star_eq_inv`, `ofRootOfUnity`, `equiv_rootsOfUnity`, existence/order divisibility and the root-power/integrality statements. Cyclicity is used for the equivalence; the root-power evaluation requires a nonzero argument. |
| `Mathlib/NumberTheory/MulChar/Duality.lean:74` | `card_eq_card_units_of_hasEnoughRootsOfUnity`; roots-of-unity sufficiency is part of the hypothesis, satisfied by complex coefficients. |
| `Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean:101`, `:188` | `AddChar.card_eq` and `sum_apply_eq_ite` for finite additive abelian groups, supporting §0.2. |
| `Mathlib/FieldTheory/Finite/Trace.lean:37`, `:49`, `:59` | Trace nondegeneracy and explicit trace/norm formulas for finite field extensions. No separability is being silently postulated for a nonperfect base here. |
| `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:213`, `:257` | Square-root count and value at minus one; both expressly require characteristic different from two. |
| `Mathlib/NumberTheory/GaussSum.lean:72`, `:83`, `:89`, `:126`, `:188`, `:222` | Native finite-sum definition, shift, conjugation, trivial multiplicative value, nontrivial/primitive product and quadratic square. The nontriviality hypotheses explain R04/R11. |
| `Mathlib/NumberTheory/JacobiSum/Basic.lean:126`, `:139`, `:193`, `:203`, `:342` | Trivial/inverse Jacobi cases, Gauss quotient with nontrivial product, inverse product and Gauss-power formula. The quotient is not an unconditional composite-modulus theorem. |
| `Mathlib/NumberTheory/DirichletCharacter/GaussSum.lean:47`, `:57` | Vanishing at a nonprimitive additive character and primitive multiplicative-character shift for every residue, including nonunits. |
| `Mathlib/Algebra/Polynomial/Div.lean:524` | `rootMultiplicity_zero = 0`, used in R12. |
| `Mathlib/Algebra/Polynomial/HasseDeriv.lean:59`, `:62`, `:211` | Linear-map definition, coefficient formula and product formula for Hasse derivatives. These already supply the Leibniz rule. |
| `TauCeti/NumberTheory/DirichletCharacter/GaussSum.lean:42`, `:108` | `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive`, and `gaussSumOfPrimitiveRoot`. The primitive product uses inverse additive character; the minus-one factor is obtained by shifting. |
| `TauCeti/NumberTheory/LocalField/Teichmuller.lean:63`, `:74`, `:163` | `teichmullerLift`, its residue section and uniqueness, under nonarchimedean-local-field hypotheses. Its target is local integers, not global cyclotomic integers. |
| `TauCeti/RingTheory/Henselian/Teichmuller.lean:79`, `:94`, `:129`, `:151` | Root-of-unity equivalence, `teichmuller`, characterization and uniqueness; Henselian local ring and finite residue field are required. |

**Cross-roadmap resolution and ownership.** Searched by objects (Gauss/Jacobi/Jacobsthal sums, Hasse–Davenport, Stepanov, monic multiplicative L-series, Kloosterman, Teichmüller and Gross–Koblitz), using the roadmap search/show tools on main/open work and a separate board-package search. Read the relevant hits, not just their names. No fully qualified declaration collision was found among the inspected Lean names. The four worker citation leads are LMFDB knowl identifiers, not nonexistent Lean declarations.

| Supplier/border | Passage resolved and conclusion |
|---|---|
| `ClassicalArithmeticCompletion` on main | `README.md:945` §1.19; `:1040` §1.23; `:1410` §1.36; `:1632` §1.46; `:1657` §1.47; `:1865` §1.53; `:1917` §1.55; `:2046` §1.60; `:8168` §4.19; `:14605` §7.12. Cubic/quartic, residue-symbol, inverse-character and canonical-trace conventions match the intended contracts subject to R09. §7.29 at `:15058` reveals R18; §1.23 reveals R19. |
| `AnalyticNumberTheoryPartI` | §2.30(ii), `README.md:1409`: primitive quadratic Gauss sign at a fundamental discriminant. Taking `D=(-1)^((p−1)/2)p` gives the claimed prime case. |
| `DirichletPadicLFunctions` | §§4.1, 4.4, 4.5, `README.md:909`, `:1029`, `:1071`: signed Morita Gamma, odd/dyadic reflection and negative Gauss-sum Gross–Koblitz normalization. The initial minus in this roadmap correctly converts the supplier's negative Gauss sum. R16 records the reflection mismatch. |
| `AutomorphicSpectralTheory` | §1.16, `README.md:1281`: sum over units, frequency symmetry, reality and Ramanujan value. The section is now cited without invented declaration names. |
| `CongruenceSpectralGap` | §§4.2a–4.2b, `README.md:622` and `:699`: raw product-fibre hyper-Kloosterman sum and bound. At rank two and unit `a,b`, substituting `t=ax` gives product parameter `ab`; no normalization sign is introduced. |
| `EllipticLegendreCharacterInterfaces` | §5.1, `README.md:592`: odd-field Weierstrass point count and symmetric cubic trace zero, supporting the Jacobsthal interpretation. |
| `GeometryOfNumbersAndQuadraticArithmetic` | §4.3, `README.md:1708` and `:1749`: theta multiplier and half-integral Kloosterman sum for `4∣c`. Its scope is distinct from the sums defined here. |
| `ThetaSeries` on main | Scope and Layer 6 concern lattice quadratic sums/reciprocity. These are not the multiplicative-character sums of this roadmap. |
| `FunctionFieldArithmetic` | §5.4, `README.md:1838`: scheme-zeta/Jacobian comparison and reciprocal-root bound are present; cited only as the geometric border. |
| `HypergeometricMotives`, `CurvesOverFiniteFields`, `DeligneWeightsAndPurity` | Read the supplied heads/scope and relevant character-sum references. They are consumers or geometric borders here, not upward suppliers. General hypergeometric sums, curve zeta functions and cohomological weight theory are not reconstructed in this roadmap. |

Board hits concerning local Teichmüller lifts and Gauss sums in special-value constructions use these as inputs. `packages/KloostermanSheavesAndBesselIsocrystals/design/README.md:3`–5 concerns reductive-group eigenobjects and connections, explicitly separating scalar sums. No additional scalar owner was established there. The multiple/Jacobsthal sums, elementary polynomial L-series, Stepanov route and finite-ring character-twisted Kloosterman interface are the new work remaining here after the two ownership corrections. Existing simple Mathlib identities should be cited as supplier facts rather than planned as new proofs.

**Seeded source audit (all 15 requested targets).** No locator in this README is explicitly flagged “unverified”. All cited works were submitted to the legal sources service; unavailable texts are listed below. Exact pinned declarations count as checked formal sources; they do not certify a textbook chapter that could not be opened.

| Seeded target | Locator actually checked; result and limit |
|---|---|
| 0.2 shifts | `AddChar.card_eq` and dual orthogonality at the pin, plus finite-field trace nondegeneracy. Injection plus equal finite cardinality gives unique shifts. The `F_3` row distinguishes all three. |
| 0.3 multiplicative group | Pinned `MulChar.equiv_rootsOfUnity`, `ofRootOfUnity`, order existence/divisibility and dual cardinality. The `F_7` orders and zero-extended power counts agree. Lidl–Niederreiter's chapter could not be certified. |
| 0.4 quadratic/parity | Pinned `quadraticChar_card_sqrts`, `quadraticChar_neg_one` with odd-characteristic hypotheses. The even-order parity follows by evaluating at a cyclic generator. R22 concerns the missing Checks, not this odd-field formula. |
| 0.5 Galois action | Pinned `star_eq_inv`, `exists_apply_eq_pow`, `apply_mem_algebraAdjoin`; the action exponent is `t`, not its inverse. Computed order-five negative control. |
| 1.2 norm/conjugation | Pinned Gauss product and conjugation; also Conrad Theorem 2.2, printed pp.1–2 (`conrad line 51`). It separates the trivial character from the square-root case. |
| 2.3 powers/two squares | Pinned `gaussSum_pow_eq_prod_jacobiSum`; main's classical arithmetic §§1.36/1.53 supply primary normalization. Direct quartic Jacobi sums at 5 and 13 give norm squares 5 and 13, odd real/even imaginary coordinates. |
| 2.5 Jacobsthal | The expansions and sign were tested directly at the listed primes; elliptic supplier §5.1 checked. Berndt–Evans–Williams Ch.6 was unavailable, so its precise theorem/page is not certified; R21 requests the missing locator. R01 is independent of access. |
| 4.2 Kummer Stepanov | Schmidt Ch.I unavailable; no theorem number or page supplied. Checked the power-exclusion hypothesis and extension quantifiers, including `y²=x`. The claimed elementary source proof is not certified. R20 records the signature weakness. |
| 4.3 Artin–Schreier Stepanov | Schmidt Ch.I and Iwaniec–Kowalski §11.7 unavailable. Independent exact point counts refute the claimed dependence of constants (R02). |
| 4.4 power-sum lemma | Checked the finite-family statement by the rational generating function (nonzero repeated roots give nonzero integer multiples of a pole) and the explicit cancelling-root example `(2,−2)`. The README gives no precise external/pinned analytic input locator; R21. |
| 4.9 point-count corollaries | Derived from the stated power count and Weil bounds; explicitly checked positive-degree, constant-polynomial and excluded-power cases. R13 is the missing prose hypothesis. |
| 5.5 Kloosterman bound/angle | `CongruenceSpectralGap` §§4.2a–b supplies the untwisted comparison. Knightly–Li Proposition 9.4, printed p.121 (`knightly-li line 6857`), supports the twisted prime case and retains degenerate-frequency distinctions. It does not certify the all-extension Stepanov proof. Weil/Iwaniec–Kowalski/Lidl–Niederreiter unavailable. R07 is arithmetic in the stated normalization. |
| 7.1 Dirichlet Gauss | `lmfdb-gauss line 90`–94 gives the displayed shift definition. The native primitive shift/product were opened; Conrad Lemma 3.10 and Theorem 3.12, printed pp.6–7 (`conrad line 359`, `line 403`), distinguish nonunit shifts from the unshifted norm. |
| 7.5 prime powers | Iwaniec–Kowalski (12.39) unavailable. Five direct evaluations and a nonsquare branch agree with the formula. Knightly–Li Theorem 9.3, printed p.120 (`knightly-li line 6844`–6848), confirms the conductor-weighted bound; Example 9.9, p.125 (`line 7059`–7063), supplies the primitive prime-cube obstruction. R14 fixes the conductor/modulus distinction. |
| 7.7 character page | `lmfdb-conrey line 90`–125, `lmfdb-gauss line 90`, `lmfdb-jacobi line 90`, `lmfdb-kloost line 90`–93. The pairing names and three finite-sum definitions match. These do not assert the false even-modulus norm in R15. |

Additional source checks: `bcm line 131`–143, Theorem 1.3, printed p.3, and `line 319`, Theorem 2.5, p.8, in arXiv:1505.02900v2, support the hypergeometric-consumer/product-formula connection. `conrad line 1182`, Appendix (A.6), p.19, has the Hasse–Davenport factor and sign used in R18. `bombieri line 69` and `line 74`, Theorem 1, show that its background argument uses curve Riemann–Roch. `gross-koblitz line 31`, `line 69`, and `line 154` establish the odd-prime restriction and reflection locator; Theorem 1.7 is on printed p.571 (`line 104`), but the extraction of its displayed formula is too damaged to certify every symbol. Knightly–Li locators above refer to arXiv:1202.0189v1 as read; the published edition's pagination was not independently certified.

**Computed adversarial pass.** The table below has 137 rows, covering every numbered target, the headline families and every mathematical finding. Finite-field arithmetic and point counts used exact residue arithmetic, with polynomial quotients of sizes 4, 9, 25, 27, 49, 81 and 625; character values used complex exponentials, rounded for display. Complex comparisons are numerical tests, not proofs. Prime-field sums include primes through 101. The untwisted integer-modulus bound was exhaustively tested at every pair of residues for all `1≤c≤40` (22,140 pairs). Small polynomial, digit and valuation rows also include explicit hand derivations; leading Stickelberger coefficients at seven were computed modulo seven, rather than inferred from the claim being tested. The Gamma rows test the supplied identities' normalization and consequences, not a new computation of the full p-adic Gamma function. “Holds” means the listed instances agree. Failed rows are retained as evidence and repaired or excluded as specified above.

| Statement | Instances | Computed left side | Computed right side | Result / repair |
|---|---|---|---|---|
| 0.1 stdAddChar | F9: 1, i | -0.5-0.866025i, 1 | e(2/3), 1 | holds; none |
| 0.1 primitivity/orthogonality | F5 shifts 0,2 | ['5', '0'] | 5, 0 | holds; none |
| 0.2 unique shifts | F3: t=0,1,2 at x=1 | ['1', '-0.5+0.866025i', '-0.5-0.866025i'] | 1, e(1/3), e(2/3); three distinct characters | holds; none |
| 0.3 cyclic group/orders | F7 generator 3 | 6; orders 6,3,2 | q-1=6; 6/gcd(k,6) for k=1,2,3 | holds; none |
| 0.3 power count | F7 d=2, c=0,2,3 | [1, 2, 0] | [1,2,0] = 1+eta(c) | holds; none |
| 0.3 dual orthogonality/Fourier | F7 x=0,1,2 | ['0', '6', '0'] | [0,6,0]; indicator at 1 = [1,0] after /6 | holds; none |
| 0.4 quadChar/parity | F7 eta(-1); F2 quadChar(1) | -1; 1 | (-1)^3=-1; F2 value=1 | holds; none |
| 0.5 ringHomComp_eq_pow/orbits | F11 order5, zeta -> zeta^2 | -0.809017+0.587785i | -0.809017+0.587785i | holds; none |
| 0.5 wrong inverse Galois action | F11 t=2 versus t inverse=3 | -0.809017+0.587785i | -0.809017-0.587785i | negative control; reject inverse convention |
| 0.6 liftNorm/liftTrace/order | F3 -> F9: i, 1+i | [(1, 0), (2, 0)] | N(i)=1,N(1+i)=2; eta values 1,-1; order=2 | holds; none |
| 0.6 existence of lift | F3 -> F9: character orders | 1,2 lift; 8 does not | orders dividing q-1=2 | holds; none |
| 0.7 CRT factors/additive normalization | 3*5 at residue 1 | 0.913545+0.406737i | 0.913545+0.406737i | holds; none |
| 0.7 conductor/zero ring | quartic mod5 induced to15; modulus1 | conductor=5; single unit value=1 | 1*5=5; CRT factor=1 | holds; none |
| 1.1 trivial/shifted Gauss sums | F7 trivial chi; omega, shift2 | -1; 2.10568+1.60191i | -1; 2.10568+1.60191i | holds; none |
| 1.2 norm/product/conjugation | F7 omega | norm²=7; product=-7 | 7; -7 | holds; none |
| Convention: reverse additive sign | F7 omega | 2.44013-1.02262i | -2.44013-1.02262i | FAIL; multiply by chi(-1), or invert chi too for conjugation |
| 1.3 gauss_pow_orderOf_mem | F7 cubic | 3.5-18.1865i | 3.5-18.1865i | holds; none |
| 1.3 Frobenius invariance | F9 order8 | 2.44949-1.73205i | 2.44949-1.73205i | holds; none |
| 1.4 prime quadratic sign | p=3,5,7 | ['7.77156e-16+1.73205i', '2.23607', '5.82867e-16+2.64575i'] | i sqrt3, sqrt5, i sqrt7 | holds; none |
| 1.5 small-order Gauss powers | F5 quartic | -15+20i | -15+20i | holds; none |
| 2.1 Jacobi boundary/shift | F7 omega inverse and eta | 1; 1 | 1;1=-eta(-1) | holds; none |
| 2.2 norm_jacobiSum/integrality | F7 omega,omega | 2.5-0.866025i | 2.5-0.866025i; norm²=7 | holds; none |
| 2.3 two squares | p5 and13 quartic | ['-1-2i', '3-2i'] | -1-2i;3-2i; norms²=5,13 | holds; none |
| 2.4 multiJacobiSum/formulas | [] | 0 | 0 | holds; none |
| 2.4 multiJacobiSum/formulas | [2] | 1 | 1 | holds; none |
| 2.4 multiJacobiSum/formulas | [2, 2, 2] | -0.5+2.59808i | -0.5+2.59808i | holds; none |
| 2.4 multiJacobiSum/formulas | [2, 2, 4] | 7 | 7 | holds; none |
| 2.4 diagonal count/bound | F7 x²+y²=1,0 | [8, 1] | 8,1; deviations 1,6; b=1 bound sqrt7 | holds; none |
| 2.5 Jacobsthal values/theorem | p=5, a=1 | -2 | -2 | holds; none |
| 2.5 Jacobsthal values/theorem | p=7, a=1 | 0 | 0 | holds; none |
| 2.5 Jacobsthal values/theorem | p=13, a=1 | 6 | 6 | holds; none |
| 2.5 Jacobsthal values/theorem | p=17, a=1 | -2 | -2 | holds; none |
| 2.5 Jacobsthal values/theorem | p=29, a=1 | -10 | -10 | holds; none |
| 2.5 Jacobsthal values/theorem | p=37, a=1 | -2 | -2 | holds; none |
| 2.5 Jacobsthal values/theorem | p=41, a=1 | -10 | -10 | holds; none |
| 2.5 jacobsthalPsi expansion | F7 n=0, a=1 | 7 | 7 | holds; none |
| 2.5 jacobsthalPsi expansion | F7 n=1, a=1 | 0 | 0 | holds; none |
| 2.5 jacobsthalPsi expansion | F7 n=2, a=1 | -1 | -1 | holds; none |
| 2.5 jacobsthalPsi expansion | F7 n=3, a=1 | 4 | 4 | holds; none |
| 2.5 jacobsthalPsi expansion | F7 n=6, a=1 | 7 | 7 | holds; none |
| 2.5 jacobsthalPsi expansion | F3 n=0,a=1 | -3 | -1 | FAIL; add 0<n; n=1 gives 0=0 |
| 2.5 jacobsthalPhi expansion | F7 n=0 | 0 | 0 | holds; none |
| 2.5 jacobsthalPhi expansion | F7 n=1 | -1 | -1 | holds; none |
| 2.5 jacobsthalPhi expansion | F7 n=2 | 0 | 0 | holds; none |
| 2.5 jacobsthalPhi expansion | F7 n=3 | 3 | 3 | holds; none |
| 3.1 monicOfCoeffs/multiplicativity/L | F3 lambda=1, degrees0,1,2 | 1,3,9 | coefficients of 1/(1-3T) | holds; none |
| 3.1 lSeries_eq_polynomial | lambda supported only at polynomial1 | L=1, degree0 | d0=1, 0<1; zero lambda d0=0 gives degree bottom | holds; none |
| 3.1 Gauss lambda with chi=psi=1 | F3 degrees1,2 | 2,6 | 3,9 | FAIL; L=(1-T)/(1-qT) |
| 3.2 extensionSum/root-power identity | F3 -> F9: L=1-T+3T² | 5 | 5 | holds; none |
| 3.3 Hasse-Davenport/gauss_quadChar_eq | q=9 | 3 | 3 | holds; none |
| 3.3 Hasse-Davenport/gauss_quadChar_eq | q=25 | -5 | -5 | holds; none |
| 3.3 Hasse-Davenport/gauss_quadChar_eq | q=27 | -9.99201e-16-5.19615i | -6.99441e-15-5.19615i | holds; none |
| 3.3 Hasse-Davenport/gauss_quadChar_eq | q=49 | 7 | 7 | holds; none |
| 3.3 excluded trivial pair | F3 -> F9 | -8 | 4 | negative control; retain disjunction |
| 3.4 Hasse-Davenport product | F13 m=3 chi=omega^0 | -13 | -13 | holds; none |
| 3.4 Hasse-Davenport product | F13 m=3 chi=omega^1 | -44.861+13.5828i | -44.861+13.5828i | holds; none |
| 3.4 Hasse-Davenport product | F13 m=3 chi=omega^2 | 46.8722 | 46.8722 | holds; none |
| 3.4 duplication | F13 chi=omega | 3.09912+1.84267i | 3.09912+1.84267i | holds; none |
| 3.5 Jacobi lifting at inverse product | F3 eta -> F9 eta | 1 | 1 | holds; none |
| 3.5 claimed norm in inverse case | F3 -> F9 eta,eta | 1 | 3 | FAIL; norm=1 when product trivial |
| 4.1 Hasse multiplicity criterion | f=0,k=1 | rootMultiplicity=0, 0>=1 false | all Hasse values=0 true | FAIL; assume f nonzero or use divisibility |
| 4.1 Frobenius/Hasse and root count | F3 f=X^3-X, j=1 | D1(f^3)=0; three simple roots | 0; 1*3=degree3 | holds; none |
| 4.2 Kummer uniform bound | F5 y²=x | N=5, deviation0 | C=0 works in all extensions | holds; none |
| 4.3 Artin-Schreier constants | base q=3, E size=81, f=X² | N=63; ratio=2.0 | q-1=2 | FAIL uniform-in-q; allow dependence on q |
| 4.3 Artin-Schreier constants | base q=5, E size=625, f=X² | N=525; ratio=4.0 | q-1=4 | FAIL uniform-in-q; allow dependence on q |
| 4.3 Kloosterman curve | F3 d=1 a=b=1, E=F3 | 0 | N=0; deviation2; C=2/sqrt3 for this instance | holds; none |
| 4.4 power-sum lemma | omega=(2,-2),rho=2,C=2,n=1,2,3,4 | power sums 0,8,0,32 | bounds4,8,16,32; both root norms=2 | holds; none |
| 4.4 failed smaller rho | omega=(2,-2),rho=1,C=2,n=2 | 8 | 2 | negative control; rho=1 rejected |
| 4.5 resultant radical dependence | F7 f=X eta, g=X-1 versus X²-1 | lambda(g)=1,-1; both g modX=-1 | claimed equal | FAIL; normalize by chi((-1)^degf lc(f))^deg(g) |
| 4.5 L-polynomial criterion | F7 f=X, chi=eta | degree1 coefficient sum=0; L=1 | m=1, degree0<=0 | holds; none |
| 4.5 resultant at g=1; nonmonic | F7 f=X, g=1 and 2X-2 | norm=1,1; character=1,1 | empty norm=1; f(1)=1 | holds; none |
| 4.6 addCharTrace/L | F7 f=X, g=X²+1 | 1 | trace=0, psi(0)=1; L=1 | holds; none |
| 4.7 Weil multiplicative | F13 cubic | 6 | 7.2111 | holds; none |
| 4.7 Weil multiplicative | F7 cubic | 3 | 5.2915 | holds; none |
| 4.7 Weil multiplicative | F101 cubic | 2 | 20.0998 | holds; none |
| 4.8 Weil additive | F7 cubic | 4.74094 | 5.2915 | holds; none |
| 4.8 Weil additive | F11 cubic | 5.49532e-16 | 6.63325 | holds; none |
| 4.8 Weil additive | F13 cubic | 5.67998 | 7.2111 | holds; none |
| 4.9 hyperelliptic positive degree | F7 y²=x³+x | N=7, ∣N-q∣=0 | 5.2915 | holds; none |
| 4.9 constant squarefree polynomial | F3 f=1, m=0 | N=6, ∣N-q∣=3 | -1.73205 | FAIL README; state positive degree, as Lean already does |
| 4.9 excluded power counts | F5 y4=x2 | 9 | N=9, difference4>0 | negative control; retain all-divisor hypothesis |
| 5.1 finite-ring carrier | Z/12: a=b=0 | 4 | phi12=4 (not 12) | holds; none |
| 5.1 symmetry/scaling | F7 omega, a=1,b=2 | 0.602663-0.347948i | 0.602663-0.347948i | holds; none |
| 5.2 Gauss expansion | F7 omega a=1,b=2 | 0.602663-0.347948i | 0.602663-0.347948i | holds; none |
| 5.3 Salie evaluation | F7 eta a=1,b=2 | 5.55112e-16+3.2992i | 1.02056e-15+3.2992i | holds; none |
| 5.3 nonsquare | F7 eta a=2,b=3 | 0 | 0 | holds; none |
| 5.4 L coefficient/lift | F3 -> F9 a=b=1 | K9=5 | -(1²-2*3)=5; base root sum1, product3 | holds; none |
| 5.5 Weil bound/angle/lift | F7 a=b=1 | K=2.048917, theta=1.968399, K49=9.801938 | bound=5.291503; -14 cos(2theta)=9.80194 | holds; none |
| 5.5 angle convention for -K | F7 a=b=1 | -2.04892 | 2.04892 | FAIL; theta unchanged for -K=+2sqrtq cos theta |
| 5.6 degenerate parameters | F7 trivial chi a=b=0 | 6 | 5.2915 | off-boundary failure expected; retain (a,b)!=0 |
| 6.1 Teichmuller and inverse | q7 root zeta3 | zeta3 modP=2; inverse=4; lift mod49=30 | 30²+30+1=931=19*49 | holds; none |
| 6.2 Stickelberger arbitrary psi | q3,a=1, psi(1)=zeta3² | g=+lambda mod lambda² | claimed -g=lambda; actual -g=-lambda | FAIL; fix psi=trace character or include shift factor |
| 6.2 Gauss product at a=0 | q7 g0=g6=-1 | 1 | 7 | FAIL; restrict 0<a<q-1; g0 separate |
| 6.2 trivial-character valuations | q7 a=0 | both primes valuations=0 | claimed other valuation=6 | FAIL; exclude a=0 from 6-a |
| 6.2 nontrivial valuations | q7 a=1,2 | coefficients mod7: a=1: [0,6]; a=2: [0,0,3] | first nonzero orders1,2; -1/a! =6,3 mod7; opposite orders5,4 | holds; none |
| 6.3 Jacobi digit sum | q7 (a,b)=(1,1),(4,4),(5,5) | (2-2)/6=0,(8-2)/6=1,(10-4)/6=1 | 0,1,1 | holds; none |
| 6.4 lift comparison/normalization | q7; a=0 | Teich(2)=30 mod49; g0=-1 | Gamma(0)=1; -pi^0 Gamma(0)=-1 | holds; none |
| 6.5 Jacobi GK quotient | q7 a=b=4 | s(a)+s(b)-s(2)=6; -pi^6=7 | 7 Gamma(2/3)^2/Gamma(1/3); valuation1 | holds; none |
| 7.1 primitive Gauss product | quartic mod5 | -5 | -5 | holds; none |
| 7.1 imprimitive Moebius formula | principal mod12,7 | 0, -1 | mu12=0, mu7=-1 | holds; none |
| 7.1 Gauss CRT | quartic5 lifted to15 | -1.90211-1.17557i | -1.90211-1.17557i | holds; none |
| 7.2 primitive product Jacobi | mod9 chi exponent1 twice | -1.5-2.59808i | -1.5-2.59808i | holds; none |
| 7.2 imprimitive quotient total division | mod9 order6 chi and inverse | 0 | 0 | FAIL negative control; use cross-multiplied 0 versus -9 |
| 7.3 Ramanujan sums | mod12 m=1,2,3,4,6,0 | ['0', '2', '0', '-2', '-4', '4'] | 0,2,0,-2,-4,4 | holds; none |
| 7.4 twisted multiplicativity | c=15 m=n=1 | -2.61803 | -2.61803 | holds; none |
| 7.5 Salie prime-power evaluation | N=25,m=1,n=1,ell=1 | 8.76307 | 8.76307 | holds; none |
| 7.5 Salie prime-power evaluation | N=27,m=1,n=1,ell=1 | -4.66406 | -4.66406 | holds; none |
| 7.5 Salie prime-power evaluation | N=49,m=1,n=1,ell=1 | 13.5421 | 13.5421 | holds; none |
| 7.5 Salie prime-power evaluation | N=125,m=2,n=3,ell=16 | -0.842778 | -0.842778 | holds; none |
| 7.5 Salie prime-power evaluation | N=125,m=1,n=4,ell=2 | -21.9102 | -21.9102 | holds; none |
| 7.5 nonsquare vanishing | mod25 (1,2) | 0 | 0 | holds; none |
| 7.5 j=modulus is not conductor | principal chi mod25,m=n=5 | 1.90983 | 0 | FAIL; use j=conductor exponent, or assume primitive |
| 7.5 prime-square bound | mod25 all order20 chars at (1,1) | [0.0, 5.0] | 10 | holds; none |
| 7.6 untwisted/cubefree/conductor bounds | c15 (1,1), trivial and quartic | 2.61803, 1.90211 | 15.4919 | holds; none |
| 7.6 modulus1 | c1 all m,n | 1 | 1 | holds; none |
| 7.7 displayed tau2 odd | quartic5 | 1.90211+1.17557i | 1.902113+1.175571i | holds; none |
| 7.7 displayed tau2 even | primitive odd chi4 | 0 (roundoff below 2e-16) | 2 | FAIL; sqrtq only for odd q; zero for even q |
| 7.6 exhaustive untwisted check | all residues, c<=40 | (1.0, (1, 0, 0, 1.0, 1.0)) | max ratio <=1 | holds; none |
| 1.3 absolute value at trivial character | F7 chi=1,m=1 | 1 | 2.64575 | FAIL; qualify q^(m/2) by chi nontrivial |
| 2.4 empty-product norm and diagonal count | r=0, F7, b=1 | J()=0; N=0 | q^(-1)=1/7 (real exponents); q^(0-1)=1 (Nat subtraction) | FAIL; state r>=1 for these formulas |
| 4.1 repaired multiplicity criterion | F3 f=X,x=0,k=1 | multiplicity=1 | D0(f)(0)=0 | holds; nonzero polynomial accepted |
| 4.9 repaired positive-degree case | F3 f=X | N=3, deviation0 | (1-1)sqrt3=0 | holds; none |
| 6.5 dyadic reflection | p=2,q=4,a=1; x=1/3,2/3 | omega(-1)=1 | (-1)^(2+1+2)=-1 | FAIL; use mod4 reflection: signs +1,+1, product1 |
| 6.1 earlier power-residue definition | q=7,n=6,x=2 | omega_P(2)=zeta3, reduction2 | powerResidueSymbol exponent(7-1)/6=1; value zeta3 | same object; consume ClassicalArithmeticCompletion 1.23 |
| 6.2 repaired shift factor | q3,a1,u2 | -g_shift=-lambda mod lambda² | omega(2)^1 lambda=-lambda | holds; include shift factor or fix canonical psi |
| 3.5 nontrivial-product lifted norm | F7 omega,omega; E=F49 | 7 | 7 | holds; none |
| 4.6 excluded additive coboundary | F3 f=X³-X | 3 | 3 | negative control; p divides degree; excluded |
| 4.6 Newton coefficient sign | F7 f=X², g=X²+2X+3 | Tr(x²)=(-2)²-2*3=5 mod7 | -2*c0+c1²=5 mod7 | holds; none |
| 5.4 twisted degree-two relation | F7 -> F49, omega(3)=e(1/6), a=1,b=2 | 6.75786-11.705i | 6.75786-11.705i | holds; none |
| 7.2 totalized quotient corrected witness | mod9 order6 chi and inverse | 0 | -9 | FAIL cross-multiplied identity; retain primitive-product hypothesis |
| 7.5 corrected conductor recursion | principal mod25, m=n=5 | 1.90983 | 1.90983 | holds; none |
| 4.4 zero family and zero entries | k=0; omega=(0), n>=1 | power sums0; empty conclusion; norm0 | C=0 gives bound0; rho=1 gives 0<=1 | holds; none |
| 2.5 elliptic reading | p5,p7,p13; y²=x³+x | 4,8,20 projective points | p+1+Phi2(1)=4,8,20 | holds; none |
| 0.6 trace identity and tower | F3 -> F9, i,1 | Tr(i)=0, Tr(1)=2 | psi_lift(i)=1, psi_lift(1)=e(2/3) | holds; none |
| 0.1 characteristic two | F4 ordered 0,1,t,t+1 | psi values 1,1,-1,-1; sum0 | Tr values 0,0,1,1; (-1)^Tr | holds; none |
| 0.4 quadratic values | F3 x=0,1,2 | eta values 0,1,-1; sqrt counts1,2,0 | 1+eta=1,2,0 | holds; none |
| 6.2 leading-residue calculation | q7 exponents1,2,4,5 | first nonzero coefficients mod7: 6,3,2,6 | -1/a! mod7: 6,3,2,6; lambda valuations1,2,4,5 | holds; lower coefficients divisible7 have lambda valuation at least6 |

## Not verifiable

- **Ireland–Rosen**, Ch.8 §§1–3, §7; Ch.10 §3; Ch.11 §4 Theorem 1; Ch.14 §§1–4: the sources service classified the Springer DOI as paywalled/uncertified. The named printed theorems and their proofs were not read in this round.
- **Schmidt**, Ch.I–II: same Springer access limit. The elementary Stepanov proof and its precise hypotheses/constants could not be verified from the cited text. This does not affect the independent counterexample in R02.
- **Lidl–Niederreiter**, Ch.5 §§5.1–5.5: the Cambridge DOI resolved to a book landing page, with no legal open text supplied. In particular, the README's account of that book's trivial-character convention was not independently certified.
- **Berndt–Evans–Williams**, Ch.1–2, Ch.6 and Ch.11 §§11.3, 11.5: no legal readable copy was returned by the sources service. The Jacobsthal and product/lifting locators need exact theorem/page information.
- **Iwaniec–Kowalski**, Ch.11 §11.7, Theorem 11.11 and general-modulus corollary; Ch.12 §12.3 (12.39), Lemma 12.4: the AMS DOI resolved to its ebook landing page without open text. Direct finite computations do not certify these source passages.
- **Washington**, Ch.6 §6.2, and **Lang**, Ch.1 §§1–2: Springer texts classified uncertified. Their exact congruence and global residue-character presentations were not read.
- **Weil 1948**, pp.204–207: the DOI/PNAS endpoint returned HTTP 403 to the sources service. The assertion that it supplies each particular twisted/all-prime-power version was not certified.
- **Gross–Koblitz**, Theorem 1.7, printed p.571: a legal institutional scan was fetched and its hypotheses read, but the formula's OCR is damaged. The global-to-local transport and full p-adic numerical evaluations have not been independently proved here. The supplier's exact statement and the zero, parity and leading-residue checks were inspected instead.
- **Katz**, cited only for the equidistribution boundary: no readable text was obtained and no theorem from it was needed or certified.

Unavailable-source attempts were consolidated in the job's reference-request file; the roadmap's manifest was not edited. This review is completed with those limits, not parked awaiting texts. No inaccessible source has been treated as evidence of correctness or as a mathematical error.

## Source issues

- none
