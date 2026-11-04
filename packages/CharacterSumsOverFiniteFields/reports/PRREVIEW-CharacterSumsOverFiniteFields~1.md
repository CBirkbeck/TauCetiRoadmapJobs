# Review of CharacterSumsOverFiniteFields (pull request #1712 at 3008d55)

**Verdict:** needs changes

Three blocking findings (R01–R03), eight notes. The mathematics is in good shape: every worked example and every Check I could compute agrees with the README (table under *Verified sound*), including the 7-adic Stickelberger valuations and the Gross–Koblitz normalisation at `q = 7`. The blockers are ownership (Layer 6 re-plans `DirichletPadicLFunctions` §§4.1, 4.4, 4.5), the worker's build gate, and four Tau Ceti declarations cited from beyond the pin.

## R01 (P2) — 6.4–6.5 re-plan Morita's `Γ_p` and the Gross–Koblitz formula, which `DirichletPadicLFunctions` owns

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` 6.4 ("Define `padicGamma p : ℤ_p → ℤ_p` as the unique continuous function … Prove … the functional equation … the reflection formula") and 6.5 ("Proof of record: Gross–Koblitz's original, through the Dwork exponential"); `Suggested.lean` lines 545–588 (`padicGamma` and six theorems).

Claim: this roadmap defines `Γ_p`, proves its continuity, Lipschitz bound, functional and reflection equations, and proves the Gross–Koblitz formula.

Witness: `DirichletPadicLFunctions` (earlier in the merge order, position 69 against 368) states in its Scope: "CharacterSumsOverFiniteFields §§6.4–6.5 state Morita's Gamma function, its reflection formula and the Gross–Koblitz formula for their Jacobi-sum evaluations; those are consumers of §§4.1, 4.4 and 4.5 here, where the signed Gamma function, its functional equations, reflection and digit identities, and the Gauss-sum comparison are constructed for every prime", and repeats under Downstream consumers "the Gamma function and the Gauss-sum comparison are built once, here". Its §4.1 defines the signed `G_p(n) = (−1)^n ∏_{0≤j<n, p∤j} j`, the continuous interpolation `existsUnique_moritaGamma`, `moritaGamma_unit_step`, `moritaGamma_nonunit_step`; §4.4 the reflection `Γ_p(x)Γ_p(1−x) = (−1)^{R(x)}` with `R(x) ∈ {1,…,p}`; §4.5 `grossKoblitz_formula`, `g_q(a) = π^{S_p(a)} ∏_{j<f} Γ_p(a_j/(q−1))` for the negative Gauss sum `g_q(a) = −∑ ω(x)^{−a} ζ^{Tr x}` with `π^{p−1} = −p`, `π ≡ ζ − 1 mod (ζ−1)²`: the same objects, normalisations and theorems as 6.4–6.5, with a proof route (Robert's power-series method) already fixed there. This roadmap never names `DirichletPadicLFunctions`. Two roadmaps therefore own one object, and `Suggested.lean` declares a second carrier `padicGamma` for it.

Repair: delete 6.4; add `DirichletPadicLFunctions` to Scope and to the supplier contracts (§4.1 `existsUnique_moritaGamma` and the step equations, §4.4 reflection and digit identities, §4.5 `grossKoblitz_formula`); rewrite 6.5 as consumed: what stays owned here is the identification of §4.5's local Teichmüller lift (on the residue field of the unramified degree-`f` extension) with 6.1's global `ω_𝔓` under `𝓞_K → 𝓞_{K,𝔓}`, the transport of the Gauss sum `g(ω^{−a}, ψ)` into `L_𝔓̃`, and the Jacobi-sum corollary. Delete `padicGamma`, `padicGamma_natCast`, `continuous_padicGamma`, `norm_padicGamma_sub_le`, `isUnit_padicGamma`, `padicGamma_add_one`, `padicGamma_mul_padicGamma_one_sub` from `Suggested.lean` and the Layer 6 section comment with them; the module docstring then names 6.5 as not statable at the pins (its carrier is the supplier's). Drop Robert's and Cohen's chapters from References unless 6.5's corollary still cites them.

## R02 (P2) — The build gate fails on the module-system warning

Location: `TauCetiRoadmap/CharacterSumsOverFiniteFields/Suggested.lean` line 1 (`import Mathlib`).

Claim: the worker's gate reports `build=1 FAIL` with the single diagnostic "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". My own `lake env lean` run of the file gives 79 `declaration uses sorry` warnings and nothing else, so the file elaborates; the gate counts the warning and the brief admits no acceptance while it fails.

Witness: `gate.md` of this round, "build (1)"; the import rule accepts `public import Mathlib`.

Repair: write the file in module form: first line `module`, blank line, `public import Mathlib`, the docstring, then `@[expose] public section` before `namespace TauCetiRoadmap.CharacterSumsOverFiniteFields` (and `end` for it before the namespace closes). No declaration changes. Re-run the gate with `--build`.

## R03 (P2) — Four Tau Ceti declarations are cited from "beyond the pin" and do not exist at the pin

Location: README lines 288–294 ("On Tau Ceti's main branch beyond the pin, cited by module path and consumed through prose: …"), 1.4 ("Tau Ceti main, `TauCeti.NumberTheory.ModularForms.JacobiTheta.GaussSum`"), 0.5, 7.1, 7.7 and the Ordering list.

Claim: 1.4's sign `g(η_p) = ε_p √p` rests on `sum_range_cexp_two_pi_I_sq_div`; 0.5 on `MulChar.galoisOrbit`, `mem_galoisOrbit_iff_exists_algHom`, `ringHomComp_mem_galoisOrbit`, `exists_isPrimitiveRoot_apply`; 7.1 on `gaussSum_mul_gaussSum_inv_eq_neg_one_mul_card_of_isPrimitive`; 7.7's carrier is `conreyCharacter`.

Witness: at the pinned Tau Ceti `358314d4` (the pull request's manifest equals main's) none of these names occurs anywhere under `TauCeti/`, and `TauCeti/NumberTheory/ModularForms/JacobiTheta/` does not exist; the citation tool lists all of them as found nowhere. A roadmap is checked against the pins, and a declaration that is not there cannot be a supplier.

Repair: 1.4: state Gauss's evaluation `∑_{r<p} e(r²/p) = ε_p √p` (equivalently the sign of `g(η_p)`) as a target of 1.4 with its own route (the classical sign determination; `ThetaSeries` Layer 6 keeps the rank-one Landsberg–Schaar identity out of scope, so no earlier roadmap owns it). 0.5: drop the Galois-orbit citation; the roadmap's own `ringHomComp_eq_pow` is the statement, and `MulChar.apply_mem_algebraAdjoin` at the pin gives the values. 7.1: derive `τ(χ)τ(χ⁻¹) = χ(−1)N` from the pinned `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` (`TauCeti/NumberTheory/DirichletCharacter/GaussSum.lean` line 42) and `DirichletCharacter.gaussSum_mulShift_of_isPrimitive` with `e⁻¹ = e.mulShift (−1)`, as a one-line corollary stated here. 7.7: either state the Conrey character `(ZMod q)ˣ ≃* DirichletCharacter ℂ q` as a target of 7.7 (owned here until Tau Ceti's lands, the "never wait" rule) or name the character by its Conrey index in prose with no declaration. Delete the "beyond the pin" paragraph and every "Tau Ceti main" phrase.

## R04 (P3) — README not in house shape

Location: headings `## Prerequisites`, `## Pinned conventions`, `## What Mathlib supplies`, `## What Tau Ceti supplies`, `## What is missing`, `## Ordering`; every target ends `*Rests on:*`; no `## Exact supplier contracts`, `## How to read the build`, no `### Examples` and `### Dependencies` closing each layer; most definitions carry their Checks inline ("**Checks**: …") rather than as a `**Checks.**` bullet list; a status table under Ordering.

Witness: README.md on main, "Writing a roadmap", and any roadmap under `TauCetiRoadmap/` (`ClassicalArithmeticCompletion` uses `*Needs:*`, `## Exact supplier contracts`, `## How to read the build`). The dependency check passes with either spelling (I re-ran it on a copy with `*Needs:*`: 204 roadmaps, 1502 edges, 0 problems), so this is shape only.

Repair: rename the sections and lines to the house form; move the supplier lists into `## Exact supplier contracts` by supplier; give each definition (0.1, 0.6, 0.7, 2.4, 2.5, 3.1, 3.2, 4.5, 4.6, 5.1, 5.5's angle, 7.3) a `**Checks.**` list of three discriminating bullets; close each layer with `### Examples` and `### Dependencies`.

## R05 (P3) — Process narrative, a non-existent `references/` folder, dead links

Location: README lines 73 and 76 ("drafted beside this one", "also drafted beside it"); 1255–1256 and 1270 ("on disk in `references/`"); the Suggested.lean docstring ("human-owned repository", "bridge checks"); links `../AutomorphicSpectralTheory/README.md`, `../CongruenceSpectralGap/README.md`, `../DeligneWeightsAndPurity/README.md`, `../FunctionFieldArithmetic/README.md`, `../EllipticLegendreCharacterInterfaces/README.md` (roadmaps still in pull requests) and `../Chebotarev/README.md` (it is under `Completed/`).

Witness: the roadmap folder contains `README.md`, `Suggested.lean`, `metadata.toml` only; `git ls-files` shows no `references/`.

Repair: delete the "on disk" sentences and the drafting remarks; cite roadmaps in pull requests by name and section without a link; fix the Chebotarev path. Also write `teichmuller 𝔓` (6.1) and `MulChar.galoisOrbit` in prose: a backticked name of the roadmap's own is a claim that `Suggested.lean` declares it.

## R06 (P3) — Supplier name drift against `AutomorphicSpectralTheory` §1.16; an unnamed "number-field roadmap"

Location: README lines 52–54 and 7.3 (`kloosterman_sum`, `kloosterman_sum_symm`, `kloosterman_real`); conventions table, "Valuations of ideals … the number-field roadmap's convention".

Witness: `AutomorphicSpectralTheory` §1.16 (at its head #925) defines `S(m,n;c)` in prose, names only `kloosterman_real` and "Frequency symmetry" with no Lean name, and its `Suggested.lean` has no Kloosterman declaration. No roadmap called "the number-field roadmap" exists (`GlobalNumberFields` and `NumberFieldArithmetic` are both under `Completed/`).

Repair: cite §1.16 by section and by its prose statements (symmetry, reality, the Ramanujan-sum value); name the roadmap whose valuation convention is meant, or say Mathlib's `multiplicity`.

## R07 (P3) — `Suggested.lean` is an API catalogue; padding

Location: the module docstring ("The declarations below suggest Lean forms for the load-bearing milestones … Discharging every declaration here would finish neither a layer nor the roadmap") and 103 declarations.

Witness: `liftTrace_apply` closes by `rfl` (probed on a scratch copy); `liftNorm_apply`, `stdAddChar_apply`, `padicGamma_natCast` restate definitions; `multiJacobiSum_two`, `kloostermanSum_zero_right`, `kloostermanSum_zero_left`, `kloostermanSum_comm`, `kloostermanSum_mul_unit`, `conj_kloostermanSum`, `jacobsthalPsi_two`, `stdAddChar_zmod`, `gauss_pow_ringChar`, `conj_gauss`, `gauss_mul_gauss_inv`, `card_mulChar`, `sum_mulChar_apply`, `exists_generator`, `exists_unique_pow_eq`, `orderOf_quadChar`, `apply_neg_one_of_even_orderOf`, `mulCharResultant_X_sub_C`, `isMonicMultiplicative_mulCharResultant`, `kloostermanSum_eq_cos_kloostermanAngle`, `crtFactor_mul` are API lemmas, boundary cases or Check mirrors; `gauss_one`, `gauss_mulShift`, `gauss_quadChar_sq` are proved bridge checks mirroring README Checks.

Repair: delete them from `Suggested.lean` (the README keeps each as a target or Check) and rewrite the docstring in the acceptance-test form. The headline set worth keeping: `isPrimitive_stdAddChar` and `exists_unique_mulShift_eq` (0.1–0.2), `norm_gauss` (1.2), `gauss_pow_orderOf_mem` (1.3), `gauss_quadChar_zmod` (1.4), `norm_jacobiSum` (2.2), `card_diagonal_sub_le` (2.4), `jacobsthalPhi_two_one` and the two expansions (2.5), `lSeries_eq_polynomial`, `extensionSum_eq_neg_sum_pow`, `hasseDavenport_lift`, `gauss_quadChar_eq`, `hasseDavenport_product`, `gauss_sq_eq`, `jacobiSum_lift` (Layer 3), the three Stepanov bounds, `norm_le_of_sum_pow_le`, `lSeries_mulCharResultant`, `lSeries_addCharTrace`, the two Weil bounds and `card_hyperelliptic_sub_le` (Layer 4), `kloostermanSum_eq_sum_gauss`, `kloostermanSum_quadChar_eq`, `kloostermanSum_lift`, `norm_kloostermanSum_le` (Layer 5), and all of Layer 7's theorems. Those statements are sound at the generality the README gives (checked below).

## R08 (P3) — Bombieri's exposé is cited for a form it does not contain

Location: References, "E. Bombieri, *Counting points on curves over finite fields (d'après S. A. Stepanov)* … The Stepanov method in the form used in 4.2–4.3".

Witness: bombieri line 69, Theorem 1 bounds the points of a curve `C` of genus `g` over `𝔽_q`, `q = p^a` with `a` even and `q > (g+1)^4`, by the Riemann–Roch theorem on `C` (lines 38–39, 112); it never treats `y^d = f(x)` or `y^q − y = f(x)` as polynomial equations, which is the form 4.2–4.3 and the Scope paragraph ("never forms a zeta function, a divisor, or a function field") require. Schmidt Ch. I is the source in that form.

Repair: cite Bombieri as background for the method only, or drop it; keep Schmidt Ch. I as the locator of 4.2–4.3.

## R09 (P3) — Two objects named `π` in Layer 6; `Γ_p(3) = −2` fails at `p = 2`

Location: Layer 6 preamble ("`π = ζ_p − 1`") and 6.2, versus the conventions table and 6.5 ("`π ∈ L_𝔓̃` is the root of `π^{p−1} = −p` with `ζ_p ≡ 1 + π (mod π²)`"); 6.4 ("`Γ_p(3) = −2`").

Witness: the two elements differ at order 2: in `ℚ_7(ζ_7)` I computed `v_𝔓̃(π_{GK} − (ζ_7 − 1)) = 2`. The Check "`v_𝔓̃(g_a + π^a/a!) = a + 1` for `a = 1, …, 5`" is true for `π = ζ_7 − 1` (computed: 2, 3, 4, 5, 6) and false for the Gross–Koblitz `π` (then the valuation is at least `a + 6`, since `Γ_7(a/6) ≡ 1/a! (mod 7)`). `Γ_2(3) = (−1)^3 · 1 = −1`, not `−2`.

Repair: name the two elements differently (say `λ = ζ_p − 1` in 6.2 and `π` in 6.5, with `λ ≡ π (mod π²)`), and write "`Γ_p(3) = −2` for `p ≠ 2`". (Moot for 6.4 after R01, but 6.2's Check keeps the first point.)

## R10 (P3) — Scope should name the half-integral Kloosterman sums of `GeometryOfNumbersAndQuadraticArithmetic` §4.3

Location: Scope and ownership; 7.4–7.5.

Witness: `GeometryOfNumbersAndQuadraticArithmetic` §4.3 (earlier in the merge order) defines `halfIntegralKloosterman ℓ m n c` for `4 ∣ c` with the Jacobi symbol `(c/d)` and theta multiplier, and plans its Chinese-remainder factorization and its Salié evaluation (Iwaniec, Lemmas 2–7). These are Salié-type sums neighbouring 7.4–7.5 (odd prime powers, trivial character); neither restates the other, but a reader deciding where a Salié evaluation lives needs the border stated.

Repair: one sentence in Scope: the half-integral weight sums with the theta multiplier are that roadmap's; 7.5 covers odd prime-power moduli with a Dirichlet character.

## R11 (P3) — Docstring of `kloostermanSum` mentions "an unmerged roadmap target"

Location: `Suggested.lean` line 452.

Witness: "an unmerged roadmap target, so the identification is stated in `README.md` 5.1 only" is process narrative (merge state).

Repair: "the identification with `hyperKloosterman` is a README target (5.1), since that declaration is not at the pins".

## Verified sound

**Gate and build.** Text scanners: all zero (`set_option`, LaTeX, pull-request numbers, sorry'd data, residue, imports, stray files, outside-folder edits all 0); `git diff --stat origin/main...HEAD` outside the folder: empty. Dependency check on the README as submitted and on a `*Needs:*` copy: 204 roadmaps, 1501/1502 edges, 0 problems, no UPWARD or CYCLE line. `lake env lean` of `Suggested.lean`: 79 `sorry` warnings, no error (3.7 s, cached). Elaborated signatures (the worker's `#check` list of 103 declarations) compared with the README: the eight "dropped binder" leads are the `[Fintype F]`/`[Fintype E]` instances that the definitions `liftNorm`, `liftTrace`, `IsMonicMultiplicative`, `mulCharResultant`, `addCharTrace` do not need, and the explicit `h : c₁.Coprime c₂` of `crtFactorLeft/Right`, which is in the type; no statement lost a hypothesis.

**Pins.** Mathlib `f6090c70`, Tau Ceti `358314d4`; the pull request's manifest equals main's. Opened at the pin: `gaussSum_sq` (GaussSum.lean 222: `χ ≠ 1`, `IsQuadratic χ`, `IsPrimitive ψ`), `gaussSum_pow_eq_prod_jacobiSum` (JacobiSum/Basic.lean 342: `2 ≤ orderOf χ`, `ψ` primitive, product over `Ico 1 (orderOf χ − 1)`), `DirichletCharacter.gaussSum_mulShift_of_isPrimitive` (DirichletCharacter/GaussSum.lean 57: `χ⁻¹ a * gaussSum χ e` for every `a : ZMod N`, zero at non-units as the README says), `MulChar.exists_mulChar_orderOf` (MulChar/Lemmas.lean 143: needs `n ∣ card F − 1` and a primitive `n`-th root in `R`), `MulChar.equiv_rootsOfUnity` (Lemmas.lean 113), `AddChar.sum_apply_eq_ite` (PontryaginDuality.lean 188), `AddChar.card_eq` (101), `quadraticChar_card_sqrts` (QuadraticChar/Basic.lean 213), `DirichletCharacter.sum_characters_eq` (Orthogonality.lean 68), `MulChar.val_neg_one_eq_one_of_odd_order` (Basic.lean 641), `MulChar.apply_mem_algebraAdjoin` (Lemmas.lean 228), `MulChar.map_nonunit` (129), `inv_apply'` (324), `MulChar.IsQuadratic` (442), `MulChar.finite` (Duality.lean 39), `card_eq_card_units_of_hasEnoughRootsOfUnity` (74), `IsCyclotomicExtension.Rat.zeta_sub_one_prime'` (NumberField/Cyclotomic/Basic.lean 310), `Polynomial.hasseDeriv_mul`, `card_roots'`, `MulChar.star_eq_inv` (Lemmas.lean 73), `inv_mulShift`, `mulShift_mul`, `ZMod.unitOfCoprime`, `DirichletCharacter.primitiveCharacter`, `conductor_ne_zero`, `legendreSym`; every other name in *What Mathlib supplies* found by grep in the file the README names. Tau Ceti: `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` and `gaussSum_sq_of_isPrimitive_of_isQuadratic` (DirichletCharacter/GaussSum.lean 42, 81), `gaussSumOfPrimitiveRoot` (106), `primitiveChar_to_Complex_ne_one` (LegendreSymbol/Complex.lean 33), `MulChar.ofUnitHom_inv_eq_star` (MulChar/Lemmas.lean 35), `teichmuller` (RingTheory/Henselian/Teichmuller.lean 92, `(ResidueField R)ˣ →* Rˣ`). Not at the pin: the four of R03.

**Cross-roadmap citations resolved.** `ClassicalArithmeticCompletion` on main: 1.19 (cube of a cubic Gauss sum), 1.23 (`powerResidueSymbol`, `powerResidueSymbol_spec`), 1.36 (`−χ(−1) J(χ,χ) = π` for the quartic character of a primary Gaussian prime; its Check `π = −1 + 2i`, `J = −1 + 2i` is the conjugate pair of this README's `5.2` example, consistently), 1.46, 1.47 (`χ_P = (·/P)_m⁻¹`, which is `ω^{−(q−1)/m}` exactly as 6.1 says; 1.47's own Check explains why the inverse), 1.53 (`J(χ_π, χ_π) = π`, with `π = −1 − 3ω` of norm 7, the same prime as the `7.2` example), 1.55 (Stickelberger's relation, whose proof route introduces `ω` by reduction modulo a prime of `ℚ(ζ_{q−1})` and `v_𝔓̃(g(ω^{−α})) = s(α)`), 1.60, 4.19 (`quadraticExpSum_one_eq_gaussSum`, `S_p(1) = gaussSum χ ZMod.stdAddChar`), 7.12 (the congruence `h·(−gaussSum(ω⁻ᵃ,ψ)) ≡ (ζ_p−1)^s mod P^{s+1}` with `h = ∏ a_i!`: exactly 6.2's consumed statement, with `π = ζ_p − 1`). `AutomorphicSpectralTheory` §1.16 at #925 (`S(m,n;c)` over `(ℤ/cℤ)^×`, symmetry, `kloosterman_real`, `S(m,0;c) = ∑_{d|(m,c)} μ(c/d)d`). `CongruenceSpectralGap` §4.2a (`hyperKloosterman F k ψ r`, sum of `ψ(x₁+⋯+x_k)` over unit `k`-tuples of product `r`; `Suggested.lean` line 42) and §4.2b (`hyperKloosterman_bound`, `k|F|^{(k−1)/2}` for `ψ ≠ 1`, `k ≥ 1`; line 51). `FunctionFieldArithmetic` §5.4 (`|α_i| = √q`). `EllipticLegendreCharacterInterfaces` 5.1 (`symmetric_cubic_trace_zero`: `y² = x³ + ax` has `q + 1` points for `q ≡ 3 (mod 4)`; `Suggested.lean` line 89). `SchemeAndStackFoundations` §5.11 on main. `ThetaSeries` Layer 6 (lattice Gauss sums, Landsberg–Schaar). `HypergeometricMotives` (#1716) consumes 3.3–3.4, 6.4–6.5 as a sibling; `CurvesOverFiniteFields` (#1729) states that no character sum is defined there. `DirichletPadicLFunctions` (#1039): R01. Merge-order direction: every supplier cited is earlier or on main; `HypergeometricMotives` and `CurvesOverFiniteFields` are cited only as consumers or borders.

**Ownership against open work.** Searched main, the board's packages index and the open roadmap pull requests for Kloosterman and Salié sums, Stickelberger, Morita/Gross–Koblitz, Hasse–Davenport, Jacobsthal, Stepanov, Teichmüller character, Weil bound, multiple Jacobi sums, and for the Lean names `kloostermanSum`, `liftNorm`, `liftTrace`, `padicGamma`, `jacobsthal*`, `multiJacobiSum`, `lSeries`, `extensionSum`, `crtFactor*`. Found: `DirichletPadicLFunctions` §§4.1/4.4/4.5 (R01); `GeometryOfNumbersAndQuadraticArithmetic` §4.3 half-integral Kloosterman sums (R10); `CyclotomicClassGroupsAndStickelberger` §2.4 consumes ClassicalArithmeticCompletion 1.47/1.55/7.12 for its own descent `(g^x) = 𝔩^{xθ_m}` with `ℓ ≡ 1 (mod m)` and does not state 6.2's factorization for every `a`; `PadicDifferentialEquationsAndRigidCohomology` RD.6.94–6.95 realises `Kl_2` as an isocrystal and imports the scalar sum from `CongruenceSpectralGap`; `MetaplecticAutomorphicForms` §§ `halfWeightKloosterman`/`plusKloosterman`; `CharacteristicClasses` has a `def lSeries` in a different namespace (no clash with `TauCetiRoadmap.CharacterSumsOverFiniteFields.lSeries`). Nothing else states Jacobsthal sums, the polynomial `L`-series, Stepanov's bounds, the Kloosterman `L`-polynomial, the Teichmüller `MulChar`, or the integer-modulus Jacobi and Gauss formulas; this roadmap is their owner.

**Sources read at their locators.** knightly-li lines 6844–6848 (Theorem 9.3, printed page 120: for `c = p^ℓ` and `χ` of conductor `p^γ`, `γ ≤ ℓ`, `|S_χ(a,b;c)| ≤ τ(c)(a,b,c)^{1/2}c^{1/2}c_χ^{1/2}` (9.7) and the `c_χ^{1/4}p^{1/4}` form (9.8)), 6817–6824 (Theorem 9.2, page 120, for `S_χ(a,b;n;c)` with `τ(n)`, whose `n = 1` case is 7.6's twisted bound), 7059–7063 (Example 9.9, page 125: a primitive `χ` modulo `p³` with `S_χ(a,b;p³) = p²`, exceeding `τ(c)(a,b,c)^{1/2}c^{1/2}` for `p ≥ 17`), 6857 (Proposition 9.4, the prime case `2(a,b,p)^{1/2}p^{1/2}` for every `χ`); bcm lines 131–143 (Theorem 1.3, `H_q` as a sum of Gauss-sum quotients) and 319 (Theorem 2.5, Hasse–Davenport, used in its proof at 536); robert-gk lines 130–131 and 198–202 (Theorem 4: the Gauss sum carries a leading minus sign chosen so that `a = 0` gives `+1`, and `g_q(a)` equals `π^{S_p(a)}` times the product of `Γ_p` at the cyclic-digit-rotation fractions; the OCR drops the displayed formulas); bombieri lines 23, 38–39, 69, 112 (R08); lmfdb-gauss line 92 (`τ_a(χ) = ∑_{r ∈ ℤ/qℤ} χ(r) e^{2πiar/q}`), lmfdb-jacobi line 90 (`J(χ,ψ) = ∑_r χ(r)ψ(1−r)`), lmfdb-kloost lines 90–93 (`K(a,b,χ) = ∑_{r ∈ (ℤ/qℤ)^×} χ(r) ζ^{ar+br^{−1}}`, "reduces to the Gauss sum if `b = 0`"): the three definitions of 7.1–7.3 as stated.

**Adversarial table.** Values computed with an exact-arithmetic script over `𝔽_p` (`p ≤ 101`), `𝔽_9`, `𝔽_25`, `𝔽_27`, `𝔽_49`, `𝔽_121`, `ℤ/cℤ` (`c ≤ 60` exhaustively, and the listed larger moduli), and a 7-adic model `ℤ_7[π]/(Φ_7(1+π))` to precision `7^{12}`.

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| 0.3 power count `#{y^d = c} = 1 + ∑_{χ^d=1,χ≠1} χ(c)` | `c = 0`; `c ≠ 0` | `1 + 0 = 1`; `∑_{χ^d=1} χ(c) = d·[c is a d-th power]` | holds at `c = 0` only with the `1 +`, as written |
| 0.4 `χ(−1) = (−1)^{(q−1)/ord χ}` (even order) | `q = 7`, `ord 6`: `(−1)^1`; `q = 13`, `ord 6`: `(−1)^2`; `ord 4`, `q = 5`: `(−1)^1` | `χ_7(3,−1) = −1`, `χ_5(2,−1) = −1` computed | holds |
| 1.1 `g(1) = −1`, `g_0(χ) = (q−1)[χ=1]`, `∑_a g_a(χ) = 0` | `q = 7` | `τ(1_7) = −1`; swapped sums give `∑_x χ(x) q[x=0] = 0` | holds |
| 1.2 `g(χ)g(χ⁻¹) = χ(−1)q`, `|g| = √q` | `χ = χ_7(3,·)` | `|τ|² = 7.0000`; `τ(χ)τ(χ̄) = −7 = χ(−1)·7` | holds |
| 1.3 Galois action, `g(χ)^m ∈ ℤ[ζ_m]`, `g(χ^p) = g(χ)` | `q = 7`, `m = 3`: `g³ = 7J(χ,χ)` | `g(χ_7(2))³ = 3.5 − 18.1865i = 7(−1 − 3ω)` | holds; the `π/π̄` quotient claim consistent with 1.53 |
| 1.4 `g(η_p) = ε_p√p` | `p = 7`: `i√7`; `p = 5`: `√5`; `p = 13`: `√13` | `0 + 2.6458i`, `2.2361`, `3.6056` computed | holds |
| 1.5 `g^4 = qJ(χ,χ)²` (order 4), `g^6 = χ(−1)q∏_{i=1}^4 J(χ,χ^i)` | `q = 5`; `q = 7` | `g⁶ + 7∏J = 0.0000`; `η(−1) = 1` when `4 ∣ q−1`, so `g⁴ = J²g(η)² = qJ²` | holds |
| 2.1 shift forms | `∑ χ(x)ψ(a − bx)` with `x = y/b` | `χ(b)⁻¹χψ(a)J` | holds algebraically |
| 2.2 `|J| = √q`, `J(χ,χ⁻¹) = −χ(−1)` | `χ_7(3,·)`: `J(χ,χ) = 2.5 − 0.8660i`; `J(η,η) = 1` | `|J|² = 7`; `−η(−1) = 1` | holds; boundary `χψ = 1` has `|J| = 1` |
| 2.3 two squares, parity | `p = 5`: `J = −1 − 2i`; `p = 13`, `χ = ω³`: `J = 3 − 2i` | `a` odd, `b` even in both; `χ(4) = χ(−1)` by the supplementary law for 2 | holds |
| 2.4 `J₀ = χ_r(−1)(q−1)J(χ₁..χ_{r−1})` under `χ(0) = 0` | general `r`, `x_r = 0` term | the `x_r = 0` term is `χ_r(0)·J₀(…) = 0`, the rest `∑_{x_r≠0} χ_r(x_r)χ_r⁻¹(−x_r) J = χ_r(−1)(q−1)J` | holds in Mathlib's convention, including trivial `χ_r` |
| 2.5 `ψ_n(a)`, `φ_n(a)` expansions; closed forms | `p = 5`: `ψ_2(1) = −1`, `φ_1(a) = −1`; `φ_2(as²) = η(s)φ_2(a)` | derived from 2.1 with `b = −1`; `ψ_2(1) = −1` for `p = 5,13,17,29,37,41` computed | holds |
| 2.5 Jacobsthal's theorem `φ_2(1) = −2a`, `a ≡ 1 (4)` | `p = 5, 13, 17, 29, 37, 41` | `φ_2(1) = −2, 6, −2, −10, −2, −10`; `a = 1, −3, 1, 5, 1, 5`; `φ_2(r) = −4, −4, 8, −4, 12, −8 = ±2b` | holds, sign normalisation confirmed |
| 2.5 elliptic reading | `y² = x³ + x` over `𝔽_5, 𝔽_7, 𝔽_13` | projective counts `4, 8, 20 = q + 1 + φ_2(1)` | holds |
| 3.3 Hasse–Davenport `−g' = (−g)^n` | `𝔽_3 ⊂ 𝔽_9`, all `χ`, all `ψ ≠ 1` (4 pairs) | 0 failures; `χ = ψ = 1`: `−g' = −8`, `(−g)² = 4` | holds; the `χ ≠ 1 ∨ ψ ≠ 1` hypothesis is exactly right |
| 3.3 `g(η_{p^f}) = (−1)^{f−1}(ε_p√p)^f` | `𝔽_9, 𝔽_25, 𝔽_27, 𝔽_49, 𝔽_121` | `3, −5, −5.1962i, 7, 11` computed | holds |
| 3.4 Hasse–Davenport product | all `χ`, all `m ∣ q−1` over `𝔽_7` and `𝔽_13` (6 + 12 characters × every `m`) | 0 failures; `𝔽_13`, `m = 3`, `χ = ω`: both sides `−44.8610 + 13.5828i`; `χ = ω²`: `46.8722` | holds for every `χ`, as claimed |
| 3.4 duplication | `𝔽_13`, `ω` of order 12 | `g(ω²) = 3.0991 + 1.8427i = ω(4)g(ω)g(ωη)/g(η)` | holds |
| 3.5 Jacobi lifting | `χψ = 1` boundary | `J' = −χ(−1)^n = −(−J)^n` | holds |
| 4.1 `hasseDeriv k (f^q) = 0`, `0 < k < q` | Lucas on `C(qn, k)` | zero mod `p` since `k` has a nonzero digit below `p^f` | holds |
| 4.2 uniformity when `d ∤ Q−1` | `d' = gcd(d, Q−1)` | `#{y^d = c} = #{y^{d'} = c}`; hypothesis for `e ∣ d` covers `e ∣ d'` | holds |
| 4.5 `λ_f` depends on `g mod rad f`; nontrivial iff `f ≠ ch^d` | `λ_f = χ(c)^{deg g}∏_P (χ^{m_P}∘N_P)` | nontrivial iff some `d ∤ m_P`; fibres of `g ↦ g mod rad f` have size `q^{e−m}` | holds |
| 4.5 boundary `f = ch^d` | `η(x²)` over `𝔽_p` | `p − 1`, not `O(√p)` | hypothesis necessary |
| 4.6 Newton identity `p_n = −n c_{e−n} + P(…)` | `e_k = (−1)^k c_{e−k}` | sign `(−1)^{n−1}n(−1)^n = −n` | holds; `f = X^p − X`: sum `= p` |
| 4.7 reduction `f = ch^e` | `L(λ_f^χ, T) = L(λ_h^{χ^e}, χ(c)T)` | `λ_f(g) = χ(c)^{deg g}χ^e(N_g h)` | holds; maximal `e` gives 4.2's hypothesis for `h` |
| 4.7 Weil bound | `∑_{𝔽_13} η(x³+x) = 6`, `∑_{𝔽_7} η(x³+x+1) = −3`, `∑_{𝔽_101} η(x³+x) = −2` | bounds `7.2111, 5.2915, 20.1` | holds |
| 4.8 Weil bound | `|∑ e(x³/7)| = 4.7409`, `∑ e(x³/11) = 0`, `|∑ e((x³+x)/13)| = 5.6800` | bounds `5.2915, 6.6332, 7.2111` | holds |
| 4.9 point counts | `y⁴ = x²/𝔽_5`: 9; `y⁴ = (x²−1)²/𝔽_25`: 46; `y² = x⁴+x+1`, `p < 200` | `(d−1)(m−1)√q = 0, 15`; `max |N−p|/(3√p) = 0.5726 ≤ 0.58` | holds, including both counter-examples |
| 5.1 identities | `K(1;a,0) = −1`, `K(1;0,0) = q−1`, conjugation | `S(0,1;7) = −1`; `S(0,0;12) = 4 = φ(12)` | holds |
| 5.2 Gauss-sum expansion | `𝔽_7`, `χ = χ_7(3,·)`, `(a,b) = (1,2)`; `b = 0` | `K = 0.6027 − 0.3479i`; at `b = 0` RHS `= 0 ≠ χ(a)⁻¹g(χ)` | holds; hypothesis `ab ≠ 0` necessary |
| 5.3 Salié | `𝔽_7`: `K(η;1,2) = 3.2992i`, `K(η;2,3) = 0`; `𝔽_5`: `K(η;1,2) = 0` | `η(2)g(η)(e(1/7)+e(6/7)) = i√7·2cos(2π/7)`; `24 ≡ 3`, `8 ≡ 3` non-squares | holds; `η(a) = η(b)` when `4ab` is a square |
| 5.4 `L(κ,T) = 1 + KT + χ(−b/a)qT²`, lifting | `𝔽_3 ⊂ 𝔽_9`: `K_3 = −1`, `K_9 = 5`; `𝔽_7 ⊂ 𝔽_49`, `χ_7(3,·)`, `(1,2)` | `ω² − ω + 3 = 0`, `−(ω₁²+ω₂²) = 5`; `K_49 = 6.7579 − 11.7050i = −(K_7² − 2χ(−2)·7)` | holds |
| 5.5 Weil bound, angle | `S(1,1;5) = 0.3820`, `S(1,1;7) = 2.0489`, `S(1,2;7) = −2.3569`; `K_9(1,b) = 5,2,2,2,−1,−1,−4,−4` | all `≤ 2√q`; `θ_7(1,1) = 1.9684` | holds |
| 5.6 `q − 1 ≤ 2√q` | `q = 2,3,4,5,7` | `1,2,3,4 ≤ 2.83,3.46,4,4.47`; `6 > 5.29` | "exactly for `q ≤ 5`" holds |
| 6.1 Teichmüller character | `q = 7`, `𝔓 = (ζ_3 − 2)` | `ω(2) ≡ 2`: `ζ_3 ≡ 2 (mod 𝔓)` since `ζ_3 − 2 ∈ 𝔓`; order 6 | holds; `ω⁻¹(2) = ζ_3² ≡ 4` rejects the inverse |
| 6.2 `v_𝔓̃(g(ω^{−a})) = s(a)`, `v(g(ω^{+a})) = 6 − a`, `v(g_a + π^a/a!) = a + 1` | `q = 7`, `a = 0..5`, 7-adically | `v = 0,1,2,3,4,5`; `5,4,3,2,1`; `2,3,4,5,6` with `π = ζ_7 − 1` | holds (R09 for the name `π`) |
| 6.2 factorization `(g_a) = ∏_{t ∈ (ℤ/6)^×/⟨7⟩} τ_t⁻¹(𝔓̃)^{s(ta)}` | `q = 7`, two primes `(e,f) = (6,1)` | exponents `a` and `6 − a`; `N(g_a) = 7^6` | holds |
| 6.3 digit-sum valuation | `(1,1)`, `(4,4)`, `(5,5)`, boundary `a + b = 6` | `0, 1, 1`; boundary would read `f = 1` against the true `0` | holds; hypothesis necessary |
| 6.4 reflection `Γ_p(1/2)² = (−1)^{(p+1)/2}` | `p = 3, 5, 7` | `1, −1, 1` | holds (owned by DPL §4.4, R01) |
| 6.5 Gross–Koblitz `g(ω^{−a}) = −π^{a}Γ_7(a/6)` | `q = 7`, `a = 1..5`, `π^6 = −7`, `π ≡ ζ_7 − 1 (mod π²)` | `v_𝔓̃(g_a + π^aΓ_7(a/6)) ≥ 43` (precision 42) for every `a`; with `Γ_7(1 − a/6)` instead: `7, 2, 45, 4, 11` | holds; sign and argument as written, "not `Γ(1−a/6)` for `a ≠ 3`" confirmed |
| 7.1 `τ_a(χ) = χ(a)⁻¹τ(χ)`, imprimitive and CRT formulas | all `χ` mod `12, 15, 18, 20`; all `χ` mod `15, 20, 21, 24` for the pairs `(3,5),(4,5),(3,7),(8,3)` | 0 failures each; `τ(1_12) = 0 = μ(12)`, `τ(1_7) = −1` | holds |
| 7.2 `J = ττ/τ(χψ)` iff-direction | mod `9,12,15,8,16,25,27,24,45`, all pairs | primitive `χψ`: 0 failures; imprimitive: fails for every pair mod `9,15,8,16,25,27`, holds for `4` pairs mod 12, `16` mod 24, `64` mod 45; mod 9 order-6 `χ`: `J(χ,χ⁻¹) = 0`, `ττ = −9`, `τ(1_9) = 0` | holds exactly as stated |
| 7.3 Ramanujan values | `S(m,0;12)`, `m = 1,2,3,4,6,0` | `0, 2, 0, −2, −4, 4` | holds |
| 7.4 twisted multiplicativity | `S(1,1;15) = S(2,2;3)S(2,2;5)` | `−2.6180 = (−1)(2.6180)` | holds |
| 7.5 Salié prime-power evaluation | `25, 27, 81, 49, 125 (2,3), 125 (1,1), 121 (3,5), 2197 (2,7)` | formula and sum agree to 4 decimals in all eight; `S(1,2;25) = S(1,3;49) = 0` (non-squares) | holds |
| 7.5 `|S_χ(m,n;p²)| ≤ 2(m,n,p²)^{1/2}p` | every `χ` mod `4, 9, 25, 49`, every `m, n` | max violation 0 | holds |
| 7.5 `p ∣ m`, `p ∤ n`: `≤ p^{⌈k/2⌉}` | `9, 27, 81, 25, 125, 49`, every `χ` | max violation 0 | holds |
| 7.5 `j ≤ ⌊k/2⌋ ⇒ 2p^{k/2}`; always `2p^{j/2}p^{k/2}` | `27, 81, 125, 625, 343`, every `χ`, `p ∤ mn` sample | max violation 0 | holds |
| 7.5 counter-examples | primitive `χ` of order 50 mod 125, `(7,7)`; order 4624 mod `17³`, `(1,15)` | `|S| ∈ {0, 25}` over the 20 characters; `289.000` attained, `τ(17³)17^{3/2} = 280.37` | holds |
| 7.6 untwisted bound | every `c ≤ 60`, every `m, n` | no violation | holds |
| 7.6 cube-free twisted bound | every cube-free `c ≤ 30`, every `χ`, every `m, n` | no violation | holds |
| 7.6 conductor-weighted bound | `c = 8, 16, 27, 32, 125`, every `χ`, sampled `m, n` | no violation | holds |
| 7.6 `|S_χ(1,1;15)|`, `χ` of order 4 and conductor 5 | both such `χ` | `1.9021 ≤ 15.49` | holds |
| 7.7 displayed quantities | `χ_7(3,·)`: `τ_2 = 2.1057 + 1.6019i`, `J(χ,1) = −1`, `K(1,2,χ) = 0.6027 − 0.3479i`; `χ_5(2,·)`: `τ_2 = 1.9021 + 1.1756i`, `K(1,2,χ) = 1.1756 − 1.1756i` | all computed as displayed | holds |
| Conrey naming | `χ_7(3,3) = e(1/6)`, `χ_7(2,3) = e(1/3)`, `χ_5(2,2) = i` | least primitive roots 3 and 2 | holds |
| Lean generality | `hasseDavenport_product` at `m = 1`; `multiJacobiSum_eq_prod_gauss_div` at `r = 0`; `norm_le_of_sum_pow_le` with `C₀ < 0` or `k = 0`; `card_diagonal_sub_le` with some `d_i = 1` | trivially true; vacuous (`∏ = 1`); forces every `ω_i = 0`; count is exactly `q^{r−1}` | no false instance; every Lean statement at the README's generality (Noetherian/finite/`p ≠ 2`/`p ∤ n` hypotheses present where the README has them) |

**Definitions determine their object.** `stdAddChar` excludes `primitiveChar_to_Complex` (0.2 says it is a shift by a unit; witness the `F = ZMod p` identification with `ZMod.stdAddChar`); the Teichmüller character excludes its inverse by `ω_𝔓(2) ≡ 2 (mod 𝔓)` (6.1's rejection Check, recomputed above); `kloostermanSum` over units excludes the sum over all residues (`S(0,0;12) = 4 ≠ 12`); the Kloosterman angle's sign convention is pinned by `K(1,1;7) = 2.0489 = −2√7 cos 1.9684`; the Hasse–Davenport signs by `g(η_9) = 3 ≠ (i√3)²`; the Gross–Koblitz sign and argument by the 7-adic rows.

**Padding probe.** Scratch copy elaborated: `liftTrace_apply` closes by `rfl`; `liftNorm_apply`, `stdAddChar_apply`, `kloostermanSum_zero_right`, `multiJacobiSum_two` do not close in one `simp` call but restate definitions or boundary cases (R07).

## Not verifiable

- Schmidt, *Equations over Finite Fields*, Ch. I–II (4.2, 4.3, 4.7): Springer LNM, paywalled; recorded uncertified.
- Iwaniec–Kowalski, Lemma 12.4, §11.7, §12.3, Corollary 11.12 (5.3, 5.5, 7.4–7.6): AMS Colloquium, paywalled (pubs.ams.org).
- Lidl–Niederreiter Ch. 5 §§5.1–5.5 (0.3–0.6, 4.7–4.8, 5.4–5.5): Cambridge, paywalled.
- Ireland–Rosen Ch. 8, 11 §4, 14 §§1–4 (1.3, 2.4, 3.3, 6.2–6.3); Washington §6.2; Lang Ch. 1; Robert's *Course* Ch. 7; Cohen Ch. 11: Springer, paywalled.
- Berndt–Evans–Williams Ch. 1–2, 6, 11 (2.5, 3.3–3.4): Wiley, no open copy found.
- Gross–Koblitz, Annals 1979 (6.5): JSTOR only; Robert's Numdam paper read instead, with the formulas lost to OCR.
- Weil 1948 (4.7, 4.8, 5.5): the PNAS page refuses the service (HTTP 403) and the PubMed Central PDF link returns a login page; listed in `needs-references.toml` with Gross–Koblitz, Iwaniec–Kowalski, Lidl–Niederreiter and Berndt–Evans–Williams.
- Katz, *Gauss Sums, Kloosterman Sums, and Monodromy Groups*: cited only as a boundary; not needed.

The statements these sources are cited for were checked by computation and derivation instead (table above); nothing in them was taken on trust.

## Source issues

- none
