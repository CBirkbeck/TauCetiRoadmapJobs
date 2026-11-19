# Review of SchattenClassesAndSchurMultipliers (pull request #2421 at 4faf86f)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked example that was recomputed holds, every supplier section and library declaration cited exists where it is cited, and the Lean file elaborates with `sorry` as its only warning. There are three small corrections (the pull-request description still describes the two supplier gaps that this head no longer has; the Hardy-space interpolation estimate of §10.4 is located in a passage that only quotes it; the V4.Core contract assumes a normalisation V4.Core does not state) and two format notes, none blocking. Three points are left for the human reviewers.

## C01 — The description still says that the roadmap declares two supplier gaps and reuses kernel operators; this head builds both itself

A reader of the pull request is told that §10.4 and the Hörmander–Mikhlin–Schur theorem wait on a roadmap that does not exist, which is no longer the case. The description says "It declares two supplier gaps: `sigma-finite-hilbert-schmidt-kernels` … and `semifinite-martingale-bmo-interpolation`" and "§10.4 rests on that second gap"; its summary block ends "Schatten classes, noncommutative Lᵖ and kernel operators are reused." At this head the README contains no gap: §2.1 constructs the kernel unitary from VonNeumannAlgebras V2.RectangularL2 and V4.Core (README lines 425–435), the martingale interpolation is proved in the new §10.4 (lines 1907–1966), and the matrix BMO interpolation, formerly §10.4, is now §10.5. The dependency sentence also lists NoncommutativeIntegration without §7.1–§7.3 and §8.4, which §10.4 consumes, and AutomorphicSpectralTheory is now consumed only at §0.9.

Text that would be right: "It declares no supplier gap. The kernel unitary on arbitrary σ-finite spaces is built in §2.1 from VonNeumannAlgebras V2.RectangularL2 and V4.Core, and the semifinite martingale BMO interpolation in §10.4 from NoncommutativeIntegration §7.1–§7.3 and §8.4; the matrix BMO interpolation is §10.5 (formerly §10.4). From AutomorphicSpectralTheory only §0.9 is consumed." In the summary block: "Schatten classes and noncommutative Lᵖ are reused; the kernel of a Hilbert–Schmidt operator is built here."

## C02 — The Hardy-space interpolation estimate of §10.4 is located in a passage that quotes it from a paper the references do not list

An implementer who opens the locator finds no proof and no statement with hypotheses, and this estimate (with the order of the Burkholder–Gundy constant) is what gives the order `p` in §10.4 and so the factor `p²/(p − 1)` of §11.5. In the first of "the two estimates the route uses" (README lines 1928–1930) the locator is "cgpt-2023 lines 479–481". Those lines derive the inclusions `H_q^r + H_q^c ⊂ [H_1^r, H_2^r]_{2/p} + [H_1^c, H_2^c]_{2/p}` and say that they hold with absolute constants by Section 3 of their reference 53 (cgpt-2023 line 1553: N. Randrianantoanina, *Interpolation between noncommutative martingale Hardy and BMO spaces: the case 0 < p < 1*, Canad. J. Math.). That paper is not in the References, and the second estimate is given as "jrwz-2020, as cited in cgpt-2023" with no theorem number.

The smallest change: add the Randrianantoanina paper to the References, cite it at the first estimate by its section ("Section 3, as cited in cgpt-2023 lines 480–481"), and give the theorem number of jrwz-2020 for `α_q ≤ K/(q − 1)` if it can be read.

## C03 — The contract with VonNeumannAlgebras V4.Core assumes that the rank-one operator `u ⊗ v*` corresponds to `u ⊗ v̄`, which V4.Core does not state

The whole of §2.1 rests on this normalisation: it is what makes `T_k = u ⊗ v*` for `k(x, y) = u(x) conj v(y)`, and the integral formula is proved by agreement on these products. VonNeumannAlgebras V4.Core on main (`TauCetiRoadmap/VonNeumannAlgebras/README.md` lines 1328–1329) states only "the unitary identification of Hilbert–Schmidt operators H→K with `K ⊗̄ conjugate(H)`"; the supplier contract here (README lines 2606–2608) adds "under which `u ⊗ v*` corresponds to `u ⊗ v̄`".

Since rank-one operators span a dense subspace of `S₂` and `‖u ⊗ v*‖₂ = ‖u‖ ‖v‖`, the smallest change is to make §2.1 independent of how V4.Core normalises its map: define the kernel unitary as the unique unitary `L²(μ ⊗ ν) → S₂(L²(ν), L²(μ))` sending `u(x) conj v(y)` to `u ⊗ v*`, which exists by V2.RectangularL2 and the Hilbert–Schmidt inner product of rank-one operators, and say in the contract that only the existence of V4.Core's identification is assumed.

## N01 — The letter `J` names two different maps

In §2.1 (line 428) `J g = ḡ` is the complex-linear identification of `L²(ν)` with its conjugate space; in the Conventions (line 111) and §2.3 it is the conjugate-linear involution of `L²(Ω, μ)`. Another letter for the first would do.

## N02 — The Check of §7.3 states Conjecture 1.8 of the source more weakly than the source does

Lines 1367–1370 say the source "conjectures that one exists" (a multiplier whose norm and completely bounded norm differ) on `S_p(ℓ²)`; lafforgue-delasalle-2011 lines 281–282 conjecture multipliers that are bounded and not completely bounded. "conjectures that bounded, not completely bounded ones exist" would match.

## Questions for the author

- Does Section 3 of the Randrianantoanina paper give `‖y‖_{[H_C^1, H_C^2]_θ} ≤ K ‖y‖_{H_C^q}` for the complex method with `K` independent of `θ`, of the algebra and of the filtration, as §10.4 states it? cgpt-2023 line 481 says so in one sentence; the paper itself is not among the texts available to this review.

## Verified sound

Earlier review (at cc8b39d): it listed no finding, so there is nothing to recheck finding by finding; the two passages it recorded as repaired earlier are still in place ("Nothing else of §2.1 is consumed: the norming element … is constructed in §1.2 here", README lines 2636–2637).

| Target | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| §1.1 extended gauge (sample) | identity of `ℓ²(ℕ)`; `diag(1/(j+1))`; rank-one projection | `aₙ(1) = 1`, not compact: gauge `∞` at every `p ≤ ∞`; `π²/6` at `p = 2`, `∞` at `p = 1` | `B(H)` endpoint would give `1`; `‖e‖_p = 1` zero-indexed | sound; lafforgue-delasalle-2011 lines 174–179, cgpt-2023 lines 209–214 |
| §1.2 norming (sample) | `X = E₁₂`, `p = 2`; `diag((j+1)^{−2})`, `p = 1` | `|X| = E₂₂`, `u = E₁₂`, `|X|u* = E₂₁`, `Tr(X E₂₁) = 1`; `‖Y‖_{p'}^{p'} = Σ s_i^p/‖X‖_p^p = 1` | `u*|X| = E₂₁E₂₂ = 0`; `Tr(X P_d) → π²/6` | sound; caspers-delasalle-2015 lines 638–642, lafforgue-delasalle-2011 line 400 |
| §1.3 interpolation (sample) | `T(A) = Tr(A)E₁₁` on `M_n`, `(1, ∞)`, `p_θ = 4` | `C₀ = 1`, `C₁ = n`, bound `n^{3/4}` | norm on `S₄ⁿ` is `n^{3/4}`; exchanged exponents `n^{1/4}` | sound; lafforgue-delasalle-2011 lines 246–252, cgpt-2023 line 486 |
| §2.1 kernel (sample) | `min(x, y)` on `[0,1]`; `u(x) w(y)`; `|x−y|^{−1}`, `g = 1` | `Σ ((j+½)π)^{−4} = (16/π⁴)(π⁴/96) = 1/6`; three unitaries send `u(x)w(y)` to `g ↦ (∫ w g) u` | `∫∫ min² = 2∫ y³/3 = 1/6`; integrand integrable for no `x` | sound; lafforgue-delasalle-2011 lines 226–232 |
| §2.2 trace formula (sample) | `A = iE₁₂`, `C = E₂₁` | `Tr(AC) = i` | `⟨k_{A*}, k_C⟩ = conj(−i) = i`; without conjugation `−i` | sound; lafforgue-delasalle-2011 line 239 |
| §2.4, §2.5 | `{1,2}`, `𝒜` trivial; cycle `φ`; masses `(1,3)` | `P(E₁₁) = 1/2`, kernel `c` with `2c = 1/2`; `C_φ E₁₂ C_φ* = E₃₁` | mean of `1_{(1,1)}` is `1/4`; adjoint of `g ↦ g(1)·1` sends `1` to `(4, 0)` | sound |
| §3.1, §3.2 (sample) | `[[1,2],[3,4]]`; `1_{x<y}` on the constant kernel; `M = 1_{(1,2)}` | norm `4` at `E₂₂`; `‖S_M A‖₂² = 1/2`; `S_M(E₁₂)* = E₂₁` | `‖M‖_∞ = 4`; `∫∫ 1_{x<y} = 1/2`; `S_{M̃}(E₂₁) = E₂₁`, `S_{M̃}(E₁₂) = 0` | sound; lafforgue-delasalle-2011 lines 226–238, 267–268 |
| §3.3, §3.4 (sample) | triangular truncation, unitary `[[√2,1],[−1,√2]]/√3` | `B*B = [[2,√2],[√2,3]]/3`: trace `5/3`, determinant `4/9`, eigenvalues `4/3`, `1/3` | norm `2/√3 > 1 = ‖M‖_∞`; `sup{‖A‖₁ : ‖A‖₂ ≤ 1} = √2` on `M₂` | sound; lafforgue-delasalle-2011 lines 213–218, 233–238; pisier-grothendieck-2012 lines 767–772 |
| §6.2 Haagerup constant (sample) | `[[1,2],[2,1]]`; `K = ℂ` | `⟨ξ_j, η_k⟩ = 3/2 − v_jv_k/2 ∈ {1, 2}`, `‖ξ_j‖² = ‖η_k‖² = 2` | `|M₁₂| = 2`; determinant `−3`, rank 2: no factorisation through `ℂ` | sound; lafforgue-delasalle-2011 lines 274–278, pisier-grothendieck-2012 line 656 |
| §6.3 | `α = (1,i)/√2`, `β = (1,1)/√2`, `a = I`, `M = diag(1,i)` | `Σψ_{ij}M_{ij} = 1/2 + i·i/2 = 0` | `⟨ᾱ, S_M(a)β⟩ = 0`, `⟨α, S_M(a)β⟩ = 1` | sound; pisier-grothendieck-2012 lines 781, 798–800, 3541 |
| §6.4 and `schurNorm_eq_haagerupNorm` (sample, headline) | `cos(x−y)`; `μ = 0`; factor norms `(0, ∞)` | `(e^{−ix}e^{iy} + e^{ix}e^{−iy})/2 = cos(x−y)`, norms `1` | `|M(x,x)| = 1`; `μ = 0`: both `0`; `0·∞ = 0` only with `M = 0` a.e. | sound; lafforgue-delasalle-2011 lines 274–337 |
| §7.1 (sample) | countable–cocountable; Lebesgue, `A = [0,2]`, `t = 1/2`; `μ ⊗ ν` | whole space an atom, no set of measure `1/2`; ratio `(1/4)·2 = 1/2` | `λ(A) = (μ⊗ν)(E ∩ A×Ω') ≪ μ` is atomless, so `E` splits | sound; lafforgue-delasalle-2011 lines 487–488; BochnerSpaces §7.5 states `tμ(A)` |
| §7.2, §7.3 and `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` (headline) | masses `(1,2,3,3)`; two countable–cocountable copies | weights `(1,2,2,4)/9` against uniform `1/4` | null singletons, `L² ≅ ℂ²`: outside the theorem | sound; lafforgue-delasalle-2011 lines 489–520 |
| §8.2 and the two `…_le_iff_of_continuous` (headline) | `μ = 0`; `μ = δ₀ + δ₁` | support empty: right side holds (only `N = 0`), left side `0 ≤ C` | norm of `[[1,2],[2,1]]` is `2` | sound; lafforgue-delasalle-2011 lines 524–530, caspers-delasalle-2015 line 282 |
| §9.4 (sample) | Gaussians, `n = 1`, `p = 1` and `p = ∞` | `∫ f g = (1 + R²/T²)^{−1/2}`, resp. `R(R² + T²)^{−1/2}` | `0.995` at `T = R/10`, `0.0995` at `T = 10R`; `g_R = f_R^{p−1}` has `∫ f g = ‖f‖_p^p = 1` | sound; caspers-delasalle-2015 lines 449–456, 485–500 |
| §9.5 and `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` (headline) | `n = 0`, `m = 2i`; `p = ∞` duality | both sides `|m(0)| = 2` at levels `k ≥ 1`, level `0` gives `0` | `‖g‖_∞ ≤ liminf ‖Λ(g)‖_∞` from pairing with `‖h‖₁ ≤ 1` and `‖Λ(h)‖₁ ≤ |Q_R| ‖h‖₁` | sound; caspers-delasalle-2015 lines 485–487, 529–545, 626–629 |
| §10.1 | unit column, `N = 4`; `f(z) = ze`, arc `[3/4, 5/4)` | column `(1 − 1/4)^{1/2} = 0.866`, row `diag(½,½) − ¼J` has norm `1/2`: `0.707` | variance `19/48 − 1/4 = 7/48` | sound; mei-2007 lines 96–110 |
| §10.3 (sample) | `n = 2`, `k = 0`; thresholds | `|x − y| = 1.27 ≥ 1` with `m₀(x) = m₀(y)`; `√n 8^{−k} ≤ 2^{−k}` iff `4^k ≥ √n` | `2^{−k} − 2√n 8^{−k} ≥ 2^{−k}/2` iff `4^k ≥ 4√n` | sound; cgpt-2023 lines 348–380 |
| §10.4 (new at this head) | trace scaled by `c`; exponents | `c^{1/p} c^{−1/p} = 1` at `2/p`, `c^{1/2} c^{−1/2} = 1` on `Re z = 1`; `1/q = 1 − 1/p = 1 − θ/2` at `θ = 2/p` | `1/(q − 1) = p − 1`; corner: `E_k|ege|² = e E_k(g* e g) e ≤ e E_k|g|² e` | sound, on the two cited estimates (C02); cgpt-2023 lines 471–484, mei-2007 lines 3218–3244 |
| §10.5 | `Ψ(z) = C_∞^{z−1}C₂^{−z}T(U|A|^{pz/2})`; `n = 0` | `‖Ψ(it)‖_BMO ≤ 1`, `‖Ψ(1+it)‖₂ ≤ ‖A‖_p^{p/2} = 1` | `n = 0`: `e^{−R/2} ≤ 4C e^{−R}` fails for large `R` | sound; cgpt-2023 lines 313, 485–510 |
| §11.1 and `hmsNorm` (sample) | `sign(x−y)`; `φ(ξ) = ξ/√(1+ξ²)` | `2`; `k = 1` term `2·(1/√2)(3/2)^{−3/2} = 4/(3√3) = 0.770` | `range(n/2 + 2)` is `k ≤ ⌊n/2⌋ + 1` | sound; cgpt-2023 lines 149–154 |
| §11.5 and `schurNorm_le_hmsNorm` (headline) | `M = 1`; `p ↦ p'`; the dimension-two example | `1 ≤ C·4·2`; `max(p, p') ≤ p²/(p−1) ≤ 2 max(p, p')` | `R²|sin(R/D) + R cos(R/D)|/D² = 5.7` at `R = 10` | sound; cgpt-2023 lines 565–571, 1042 |
| `schurNorm_two_eq` | `μ = 0`; `[[1,2],[3,4]]` | `0`; `4` at `E₂₂` | `eLpNorm M ∞ 0 = 0`; `‖M‖_∞ = 4`; level `m = 0` contributes `0` | sound |
| `schurNorm_eq_of_holderConjugate` | triangular truncation, `(1, ∞)` | `2/√3` | `2/√3`; transposed symbol `2/√3` | sound |
| `schurNorm_interpolation`, `schurNorm_mono_of_abs_inv_sub_le` | endpoint norms `(0, ∞)`; `q = ∞` | a zero endpoint forces `M = 0` a.e., left side `0` | `0^{1−θ}·∞^θ = 0`; chain `1 ≤ 1.0746 ≤ 2/√3` | sound |
| `schurNorm_of_posSemidef` | `[[2,1],[1,1]]`; empty `ι`; `[[1,2],[2,1]]` | `2` at `E₁₁`; `0` | `⨆_j = 2`; empty supremum `0`; eigenvalue `−1`, norm `2 ≠ 1` | sound |

- Source locators read at their lines: about 95 in 7 texts (lafforgue-delasalle-2011, cgpt-2023, caspers-delasalle-2015, pisier-grothendieck-2012, mei-2007, neuwirth-ricard-2011, potapov-sukochev-2011); none wrong.
- Library declarations opened at the pins: 36 Mathlib and 24 Tau Ceti names, each in its cited file, among them `MeasureTheory.MemLp.condExpL2_ae_eq_condExp'` (`Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean:388`), `Complex.HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip` (`Mathlib/Analysis/Complex/Hadamard.lean:592`), `MeasureTheory.Measure.IsAtom` (`TauCeti/MeasureTheory/Measure/Atom.lean:59`). No operator-theoretic Schur multiplier, kernel theorem or compact endpoint at either pin.
- Cross-roadmap citations resolved: VonNeumannAlgebras V2, V2.RectangularL2 (line 1027), V4.Core (line 1320), V13b (lines 5342–5344); NoncommutativeIntegration §1.3–§1.5, §2.1, §2.3, §2.5, §2.6, §3.5, §4.4, §7.1–§7.3, §8.4; AutomorphicSpectralTheory §0.8–§0.10; OperatorIdeals OI-A12 to OI-B88 (17 ids); CStarAlgebras C1.6, C3.2; BanachSpaceTheory B4.0, all on main; BochnerSpaces §4.2, §7.4, §7.5 at its open head. Each states what it is cited for, with the exception in C03.
- Automatic checks: all pass at this head. Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`. Nothing changes outside the folder.
- Lean: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else. The 19 elaborated types were compared with their README statements: every binder is present, nothing changed (the file differs from the previous head by one docstring). One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `simp` with the eight definitions unfolded, `le_rfl`): none of the 11 theorems closes. Headlines: all are stated except the multiplicativity and `*`-preservation of `M ↦ S_M`, which the module docstring names with the missing carrier.
- Overlap check: read BochnerSpaces, TracesOnCStarAlgebras, SchrodingerOperatorsAndSpectralTypes, NoncommutativeIntegration, NoncommutativeGeometry, AmenableTracesOnCStarAlgebras, AutomorphicSpectralTheory; shared objects: the `L^∞` conditional expectation and divisibility of atomless measures (owner BochnerSpaces §7.4, §7.5, cited), completely bounded maps of operator spaces (owner CStarAlgebras C3.2, cited), Hilbert–Schmidt kernels (AutomorphicSpectralTheory §0.8 owns them on standard Borel spaces with separable `L²`; §2.1 here is the variant on arbitrary σ-finite spaces and says so). NoncommutativeIntegration puts Schur multipliers outside its scope. No other roadmap, open or on main, states an operator Schur multiplier.
- Source independence: 14 passages compared with 4 sources, none shared (longest common run 4 words); largest share lafforgue-delasalle-2011, 43 of 120 source mentions; contents compared with lafforgue-delasalle-2011 (§1.1–§1.5): independent. Layers 2 and 9–11 have no counterpart there, its §1.2 is spread over Layers 3, 4 and 6, its §1.4 over Layers 5 and 7.
- Research link: Layers 6–8 are Theorems 1.7, 1.18 and 1.19 of Lafforgue–de la Salle (2011); Layer 9 the transference of Caspers–de la Salle (2015) and Neuwirth–Ricard (2011); Layers 10–11 Theorem A of Conde-Alonso, González-Pérez, Parcet and Tablate (2023), which leads to Arazy's conjecture and Potapov–Sukochev (2011). Rests on the README's sources, read.

## Not verifiable

- simon-trace-ideals-2005 Ch. 2, gohberg-krein-1969 Ch. III, reed-simon-1-1980 §VI.6: cited by locator only (§1.1, §2.1, §2.2).
- horn-johnson-topics-1991 Ch. 5, paulsen-2002 Ch. 3 and 8, pisier-similarity-2001 Ch. 5: cited by locator only (§6.1, §6.3).
- grafakos-classical-2014 Theorem 6.2.7: cited by locator only (§11.5, Toeplitz case).
- musat-2003 Theorem 3.1 and jrwz-2020: read only through mei-2007 lines 3229–3230 and cgpt-2023 lines 483–484 (§10.4).
- The Randrianantoanina paper quoted at cgpt-2023 lines 480–481 (reference 53, line 1553): not among the available texts; the Hardy-space interpolation estimate of §10.4 was checked only against the sentence that quotes it.

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, p. 6 (line 249): the source says the class at `q` is the interpolation space between the classes at `p` and `p'`, for `2 ≤ p ≤ q`; it should be the class at `p` between those at `q` and `q'`; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, p. 8 (line 348): the source says the embedding of the Schatten class of `L²(X, ν)` lands in that of `L²(X, ν)`; it should be that of `L²(X, μ)`; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at §1.4, p. 9 (line 359): the source says the conditional expectation on the product goes from the `𝓑 ⊗ 𝓑` functions to the `𝓑 ⊗ 𝓑` functions; it should be to the `𝒜 ⊗ 𝒜` functions; affects nothing.
- **Error** in cgpt-2023 at §1.2, p. 8, before Lemma 1.3 (lines 375–378): the source says the periodised truncation has mean zero on the torus for every `k`; it should be for `4^k ≥ √n` only, as two points of one grid cube can be `2^{−k}` apart when `n ≥ 2`; affects nothing.
- **Gap** in cgpt-2023 at the proof of Theorem 1.1, p. 10 (line 506): the source says the `p`-norm of `A` is the limit of the `p`-norms of the truncations `J_k(A)`; it should be the inequality with a lower limit, which convergence in `S₂` gives and which suffices; affects nothing.
- **Misprint** in cgpt-2023 at the proof of Theorem A, step 4 (line 910): the source says the `ξ`-derivative of `M_c` is a `ξ`-derivative of `M` at `(x, x − ξ)`; it should be the derivative of `M` in its second variable there; affects nothing.

## For the human reviewers

- `design/plan.json` of the board package still lists the gaps `sigma-finite-hilbert-schmidt-kernels` and `semifinite-martingale-bmo-interpolation`; the README at this head declares neither and builds both (§2.1, §10.4). An announcement of them to the suppliers would be out of date.
- §10.4 (README lines 1925–1933) places here two results on martingale Hardy spaces of NoncommutativeIntegration Layer 7: complex interpolation with a uniform constant, and `α_q ≤ K/(q − 1)`. Their primary sources were not read (see Not verifiable).
- §2.1 builds the kernel of a Hilbert–Schmidt operator on arbitrary σ-finite spaces, while AutomorphicSpectralTheory §0.8 on main owns it on standard Borel spaces with separable `L²` (`TauCetiRoadmap/AutomorphicSpectralTheory/README.md` lines 239–248). The scope section states the difference.
