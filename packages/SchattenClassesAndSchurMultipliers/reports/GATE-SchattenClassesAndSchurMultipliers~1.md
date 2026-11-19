# GATE-SchattenClassesAndSchurMultipliers~1: answers to the human review

One review (kim-em, 2026-11-19T00:58:31Z) with six numbered requests and a note outside the pull
request; the requests split into 14 points. The review's "What I verified" list and its
"Overlaps" paragraph ask for nothing and are not numbered. Line numbers below are those of
`TauCetiRoadmap/SchattenClassesAndSchurMultipliers/README.md` at the new commit `4faf86ff`.

## H01 (kim-em) — applied

§2.1 (README lines 423–447) now builds the kernel map itself as a composite of three unitaries:
VonNeumannAlgebras V2.RectangularL2 `L²(μ) ⊗̂ L²(ν) ≅ L²(μ.prod ν)`, conjugation `id ⊗ J`, and
V4.Core's `S₂(L²(ν), L²(μ)) ≅ L²(μ) ⊗̂ conj(L²(ν))`. It proves the integral formula, and the
isometry and uniqueness that unitarity gives, on arbitrary σ-finite spaces. Both supplier
statements were confirmed on main: VonNeumannAlgebras README lines 1027–1031 (no separability,
`κ = μ.prod ν` for σ-finite measures) and line 1328. The gap `sigma-finite-hilbert-schmidt-kernels`
is deleted from §2.1, §2.2, the Scope bullet and the supplier contracts, and so is the
AutomorphicSpectralTheory §0.8 contract entry. The Scope bullet (line 2310) now says in one clause
that §0.8 there is the σ-finite standard Borel case with separable `L²`, which agrees with §2.1 by
the integral formula. The OperatorIdeals Part C items (OI-C01–OI-C14) served only the old
surjectivity route and are dropped from the Needs lines, the Scope bullet and the contract.

## H02 (kim-em) — applied

§2.1's integral formula (lines 437–444) now states the a.e. absolute convergence:
`∫ (∫ |k(x,y)| |g(y)| dν)² dμ ≤ ‖k‖₂² ‖g‖₂²` by Tonelli (`MeasureTheory.lintegral_prod`) and
Cauchy–Schwarz. The `IsKernelOperator` bullet (lines 452–459) says that the Lean integral is a
Bochner integral, `0` where the integrand is not integrable, and that it is used only for
square-integrable `k`. It gives the witness `k = |x − y|^{−1}`, `g = 1` on `[0, 1]`, where the
integrand is integrable for no `x`. The docstring of `IsKernelOperator` in `Suggested.lean`
(lines 71–75) says the same. Its type is unchanged. Every use in `Suggested.lean` has `MemLp k 2` and a
symbol in `L^∞`, or a symbol that is a.e. bounded through `hmsNorm < ∞`.

## H03 (kim-em) — applied

The martingale interpolation is now a target of this roadmap, a new §10.4 "Martingale BMO of
operator-valued filtrations" (lines 1907–1966). It keeps the contract's statement, at its
generality: any semifinite `N` and any filtration with `𝓕₀` trivial. The two estimates it rests
on are stated as targets in the same section: Hardy-space interpolation with uniform constants
(cgpt-2023 lines 479–481) and `α_q ≤ K/(q − 1)` for the Burkholder–Gundy constant (jrwz-2020, by
its manifest locator). The section also gives a route: reduce to corners `1 ⊗ e` with
`τ_N(e) < ∞`, which reach the finite-tracial setting of NoncommutativeIntegration §7.1–§7.3 and
§8.4, then argue by duality with the three-lines theorem.

The old §10.4 is now §10.5 (line 1968). Its route cites §10.4, and §11.5 cites §10.5. The
"What NoncommutativeIntegration must provide" block and the gap
`semifinite-martingale-bmo-interpolation` are deleted. The NoncommutativeIntegration contract now
lists §7.1–§7.3 and §8.4. Opening a NoncommutativeIntegration Part II, the reviewer's other option,
is outside this job.

## H04 (kim-em) — applied differently

The density bullet of §1.1 (lines 187–193) now has a direct route that needs no
NoncommutativeIntegration. For `X ∈ S_p`, compress by finite-rank projections increasing to the
identity: `‖X − Q_α X P_α‖_p → 0`. The proof uses compactness (OI-A27), `aₙ ≤ ‖·‖` (OI-A14), the
ideal inequality (OI-A20) and uniform tails of `Σ aₙ^p`. NoncommutativeIntegration §1.3 and §1.5
are removed from §1.1's Needs and from Layer 1's Dependencies. The SVD route was not used because
`IsCompactOperator.exists_orthonormal_hasSum_rankOne` is absent from the pinned Tau Ceti
(`2fd255d`): a grep of the whole pinned tree for `exists_orthonormal_hasSum` finds nothing.

## H05 (kim-em) — applied

§1.4 (line 296) keeps the definitions of the amplification, `‖T‖_p` and `‖T‖_{cb,p}`, together
with monotonicity in the level, composition and two-sided multiplication. Its Needs is now
"§1.1; Mathlib `WithLp`". Duality, interpolation, stabilisation and the `p = ∞` comparison with
CStarAlgebras C3.2 move to a new §1.5 (line 347), which keeps the old Needs. The Checks are split
the same way. The composition Check now defines its map `T` itself, and the interpolation Check
in §1.5 refers to it. Every citation of duality, interpolation or stabilisation is repointed to
§1.5, in §3.6, §4.1, §4.2, §4.3, §9.3, Layer 9's Dependencies and the contracts for `lp`, V2 and
C1.6.

## H06 (kim-em) — applied

§3.3 (line 751) now holds the norm, the bounded extension, the finite-rank formula, density,
elementary symbols and null-set invariance. Its Needs is now "§1.1, §1.4, §3.1", and the
finite-rank formula is proved by compression and the lower semicontinuity of the gauge. The
pairing formula and lower semicontinuity in the symbol move to a new §3.8 (line 902), which needs
§1.2, §2.2 and §3.3, together with the strict-lower-semicontinuity Check. The citations in §1.2,
§5.2, §5.3, §8.2 and §9.5 are repointed to §3.8.

## H07 (kim-em) — applied differently

"How to read the build" (lines 83–90) now says that Layer 3 needs Layer 1 and §2.1–§2.4, not
§2.5. It says the definitions of §3.1, §3.3 and §3.5 need only §1.1, §1.4, §2.1 and §2.2, that
§1.2 enters only through §3.8, and that §1.5 enters only through §3.6. It also says §10.4 needs
only NoncommutativeIntegration. The reviewer's list "§§1.1, 1.2, 1.4, 2.1, 2.2, 2.4" omits §2.3:
§3.2 proves `S_M(A)^T = S_{M^t}(A^T)` from the transposition kernel of §2.3, and §3.7 uses §2.3
too. Layer 3's Dependencies line reads "Layer 1; Layer 2 (§2.1–§2.4)".

## H08 (kim-em) — applied

§1.1 (lines 169–181) now packages the extended gauge as a `TauCeti.OperatorGauge ℂ H K`. For
`p < ∞` it is `TauCeti.OperatorIdealFamily.operatorGauge`. At `p = ∞` the three axioms are checked
in the text. Every `S_p(H, K)`, `p ≤ ∞`, is defined as its `TauCeti.OperatorGauge.Carrier`, and
completeness comes from `TauCeti.OperatorGauge.completeSpace_carrier_of_lowerSemicontinuous` with
`isClosed_setOfPred_isCompactOperator` at `p = ∞`. The separate `compactOperator` normed structure
is gone. All four names were checked at the pins (`TauCeti/Analysis/OperatorIdeal/Carrier.lean`
lines 67, 148, 290; `…/Family/Carrier.lean` line 58; Mathlib
`Analysis/Normed/Operator/Compact/Basic.lean` line 413) and added to the Needs line and the
"From Tau Ceti" and "From Mathlib" contracts. `Suggested.lean` keeps `schattenGauge` as the value
function: a structure instance would need proofs of the axioms, and no headline needs it.

## H09 (kim-em) — applied

§1.4 (lines 304–308) defines the bounded extension of a general `T` with `‖T‖_p < ∞` as the
continuous linear map `S_p(H) → S_p(K)` between the carriers of §1.1. It agrees with `T` on
`S₂ ∩ S_p`, is unique by density and has norm `‖T‖_p`. §3.3 (lines 755–758) names it for Schur
multipliers: `S_M : S_p(H) → S_p(H)` with norm `‖S_M‖_p`. It stays out of `Suggested.lean`:
building it needs the kernel map of §2.1, which is not at the pins.

## H10 (kim-em) — disputed

`LinearMap.IsCompletelyBounded`, `LinearMap.cbNorm` and `CStarMatrix.cbNorm_transposeₗ` are not in
the pinned Tau Ceti (`2fd255d`, the pin in the content repository's `lake-manifest.json`). The
directory `TauCeti/Analysis/CStarAlgebra/` there has no `CompletelyBounded.lean`, and a grep of the
whole pinned tree for `cbNorm` and `IsCompletelyBounded` finds nothing. The roadmap cites library
declarations at the pins only. So the `p = ∞` comparisons of §1.5, §3.6 and §4.3 stay stated
against CStarAlgebras C3.2, the roadmap those declarations implement.

## H11 (kim-em) — disputed

`TauCeti.integralOperatorLp` and `TauCeti.adjoint_integralOperatorLp` are not in the pinned Tau
Ceti. `TauCeti/MeasureTheory/Function/Lp/Operator/` there holds only `Extension.lean`,
`LocalBound.lean` and `Multiplication.lean`, and a grep for `integralOperatorLp` finds nothing. A
comparison sentence would cite a declaration absent at the pin, so none is added. The "From Tau
Ceti" remark "Tau Ceti has no … kernel theorem" (line 2584) is accurate at the pin.

## H12 (kim-em) — applied differently

The file the reviewer names, `TauCeti/MeasureTheory/Function/BoundedMeanOscillation.lean`, is not
at the pin. The pin does have a second BMO file the remark omitted,
`TauCeti/Analysis/Sobolev/W1p/BoundedMeanOscillation.lean` (the embedding `W^{1,n} ⊆ BMO`). The
remark (lines 2584–2590) now names both pinned files and says both average the norm
`⨍_Q ‖f − f_Q‖`, unlike the operator-square seminorm of §10.1.

## H13 (kim-em) — applied

References (line 2715) opens with a paragraph that says what a locator `<key> line N` counts. It
counts the lines of the `pdftotext -layout` text of the open version listed: the arXiv versions
named for six works, and HAL hal-00451399v2 for neuwirth-ricard-2011, which is now added to that
entry. The text has three header lines and one marker line before each page. Theorem, lemma,
equation and section numbers refer to the same version. The line numbers stay because the
project's locator convention for cached open sources is `<source id> line N`. Where the source
numbers the passage, its theorem or equation number already stands beside the line number.

## H14 (kim-em) — answered

This roadmap does not use the norming element of NoncommutativeIntegration §2.1. §1.2 constructs
`|X|^{p−1}u*/‖X‖_p^{p−1}`, and the NoncommutativeIntegration contract says that nothing else of
§2.1 is consumed, with the `E₁₂` witness for the wrong order. The one-line fix belongs in
NoncommutativeIntegration on main, outside this pull request and this job. The same discrepancy is
already listed for human reviewers in PRREVIEW~3.

## Build

`lake build TauCetiRoadmap.SchattenClassesAndSchurMultipliers.Suggested`: **Build completed
successfully (18354 jobs)**, with 11 `declaration uses 'sorry'` warnings, one per headline theorem.

Signature check: `#check @name` for all 19 declarations was appended temporarily to
`Suggested.lean`, built once and then removed. All 19 elaborated, and their types are identical to
`scratch/signatures.md`; the only Lean change is the `IsKernelOperator` docstring. No section
binder is lost: for example, `schurNorm_two_eq` keeps `[SigmaFinite μ]`.

## Gate

    gate SchattenClassesAndSchurMultipliers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable --pr 2421`):

    depcheck: 199 roadmaps, 2188 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the new README reports no
cross-roadmap citation and no Lean name found nowhere.

## Ownership, renumbering and sources

- **Kernel unitary (§2.1).** This roadmap owns the version for arbitrary σ-finite spaces.
  AutomorphicSpectralTheory §0.8 on main is the case of standard Borel spaces with separable `L²`,
  and the Scope bullet says so in one clause. The construction consumes VonNeumannAlgebras V2 and
  V4.Core on main.
- **Martingale BMO interpolation (§10.4).** A search of main and all open roadmap heads
  (`roadmaps grep -i 'musat|martingale BMO|BMO.*martingale|Burkholder.Gundy'`) found no other plan
  for semifinite operator-valued martingale BMO or for the order of the Burkholder–Gundy constant.
  NoncommutativeIntegration on main stops at finite traces with constants depending only on the
  exponent, and the Scope bullet now says so. The Part II named before exists nowhere, so the
  notion is stated here instead of being requested.
- **Gap slugs in the design.** Both slugs (`sigma-finite-hilbert-schmidt-kernels`,
  `semifinite-martingale-bmo-interpolation`) are gone from the README. `design/plan.json` still
  lists them, and the worker may drop them there.
- **Renumbering.** Parts of §1.4 moved to §1.5, parts of §3.3 to §3.8, and the old §10.4 is now
  §10.5. No roadmap on main or at an open head cites this roadmap (`roadmaps grep --fixed
  SchattenClassesAndSchurMultipliers` matches only this pull request), so no mapping table is
  needed.
- **Sources.** Randrianantoanina, *Interpolation between noncommutative martingale Hardy and BMO
  spaces: the case 0 < p < 1* (arXiv 2108.06341v1), was fetched through the sources service and
  read: §3.2–§3.3 (Theorem 3.13, Proposition 3.18, Theorem 3.16). It is cgpt-2023's reference [53]
  for the Hardy-space interpolation step. The README cites that step only through cgpt-2023
  lines 479–481, so the manifest needs no new key. Note for humans: Randrianantoanina states the
  interpolation identities "with equivalent norms", and the uniformity of the constants in the
  exponent, which cgpt-2023 asserts ("absolute constants"), is not explicit there. jrwz-2020 and
  musat-2003 remain uncertified and are cited by their manifest locators. Nothing was added to
  `needs-references.toml`.
- No suspicious instructions were found in the review text.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 extended gauge at `p = ∞` is an `OperatorGauge` | `c = 0` with non-compact `X`; compact `A` plus non-compact `B`; `H = 0` | `g(0·X) = g(0) = 0 = 0·∞`; right side `‖A‖ + ∞ = ∞`; every operator `0`, gauge `0` | holds | none |
| §1.1 density by compressions | `X = diag(1/(j+1))`, `p = 2`, `P_N` first `N` coordinates; identity of `ℓ²(ℕ)` at `p = ∞` | `‖X − P_N X P_N‖₂² = Σ_{j≥N}(j+1)^{−2} ≈ 1/N → 0`; `‖1 − P_N‖ = 1`, but `1 ∉ S_∞` | holds; excluded case is excluded | none |
| §1.4 bounded extension | composition-Check `T` (`‖T‖₁ = 0`, `‖T‖₂ = ∞`) | extension at `p = 1` is `0`, agreeing with `T = 0` on `S₂ ∩ S₁ = S₁`; at `p = 2` nothing is claimed | holds | the extension is named as a carrier map |
| §1.5 duality Check | transpose `t` on `M_n`, `t^♯ = t` | `‖t‖_{cb,1} = ‖t‖_{cb,∞} = n` | holds | moved from §1.4 |
| §1.4 composition Check, now self-contained | `T`, `R(A) = ⟨e₀, A e₀⟩ w₀` | `T R E₀₀ = w₀`, `‖w₀‖₁ = Σ 1/(j+1) = ∞`, `‖T‖_{cb,1}‖R‖_{cb,1} = 0·∞ = 0` | holds | `T` defined in the Check |
| §2.1 kernel unitary, direction and linearity | `u = δ₁`, `v = δ₂` on `{1, 2}`; `k = i·1_{(1,2)}` | `u ⊗ v*` has kernel `1_{(1,2)}`, that is `E₁₂`; `T_k = iE₁₂` (an antilinear identification would give `−iE₁₂`) | matches Conventions | none |
| §2.1 integral-formula bound | `k = min(x, y)`, `g = 1` on `[0, 1]` | left `∫(x − x²/2)² = 2/15 ≈ 0.133`; right `‖k‖₂²‖g‖₂² = 1/6 ≈ 0.167` | holds | new statement |
| §2.1 Bochner remark | `k = |x − y|^{−1}`, `g = 1` on `[0, 1]` | `∫₀¹ |x − y|^{−1} dy = ∞` for every `x` | integrand never integrable, as stated | new sentence |
| §3.3 finite-rank formula | `M = 1` on `ℓ²(ℕ)`, `p = 1`; triangular truncation on `M₂`, `p = ∞` | `sup ‖A‖₁ = 1 = ‖S_1‖₁`; `2/√3` attained at a (finite-rank) unitary | holds | route now through compressions |
| §3.8 pairing formula | `M = 1`, `p = 1` | `sup |Tr(AB)|` over `‖A‖₁ ≤ 1`, `‖B‖ ≤ 1` is `1` at `A = B = E₀₀` | holds | moved from §3.3 |
| §10.4 main inequality | `N = M_d` with `Tr`, `Ω = {±1}` fair coin, `𝓕₁` all; `f = ε ⊗ I_d`, `Ψ(z) = d^{−z/2} f` | `‖f‖_BMO = 1`, `‖f‖₂ = √d`, `‖f‖_p = d^{1/p}`; left `d^{−1/p}d^{1/p} = 1`, right `C p · max(1, d^{−1/2}√d) = C p` | holds for `C ≥ 1/2` | new section |
| §10.4 `p = 2` Check | any `Ψ` | `‖Ψ(1)‖₂ ≤ sup_t ‖Ψ(1+it)‖₂` | constant `1 ≤ 2C` | new Check |
| §10.4 scaling Check | trace `c(∫ ⊗ τ_N)`, `Ψ ↦ c^{−z/2}Ψ`; wrong variant `c^{−z}Ψ` | `Lᵖ` factor `c^{1/p}·c^{−1/p} = 1`, `L²` factor `c^{1/2}·c^{−1/2} = 1`, BMO factor `1`; variant leaves `c^{−1/2}` on `Re z = 1` | invariant; variant fails | new Check |
| §10.4 corner compression | `M₂`, `e = E₁₁`, `g = E₁₁ + E₂₁` | `|e g e|² = E₁₁ ≤ e|g|²e = 2E₁₁` | holds | new route step |
| §10.4 exponent bookkeeping | `p = 4` | `θ = 1/2`, `1/q = 1 − 1/4`, `q = 4/3 = p'`, `1/(q − 1) = 3 = p − 1` | consistent | Hardy step restricted to `0 < θ < 1` (`q = 2` would be `θ = 1`) |
| How to read: Layer 3 needs | Needs lines of §3.1–§3.8 | §3.1 {2.1, 2.2}, §3.2 {2.2, 2.3}, §3.3 {1.1, 1.4, 3.1}, §3.5 {1.4, 2.4, 3.1–3.4}, §3.6 {1.5, 3.5}, §3.7 {2.3, 2.4, …}, §3.8 {1.2, 2.2, 3.3}; none cites §2.5 | statement correct | §2.3 kept in the list |
| §3.6, §4.1–§4.3, §9.3 citations to §1.5 | each moved fact | stabilisation, duality, interpolation, `p = ∞` comparison and `H ⊗̂ ℂ^m = H^m` are all in §1.5 | consistent | repointed |
