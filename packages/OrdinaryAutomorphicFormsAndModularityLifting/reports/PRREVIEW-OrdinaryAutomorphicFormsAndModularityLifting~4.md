# Review of OrdinaryAutomorphicFormsAndModularityLifting (pull request #1066 at 4264526)

**Verdict:** needs changes

Incremental re-review of the 27 changed lines since `67b9167` (README only: the §2.12(a) ownership of the two-character Hilbert Eisenstein series `E_n(φ₁, φ₂)`, its five new Checks, the two new suppliers LFunctions Layer 5 and Mathlib `linearIndependent_monoidHom`, and the two new references DDP and Shimura78). `Suggested.lean` is unchanged since `cde3e6f`. The gate passes on this head, the dependency check reports no UPWARD or CYCLE line, and the diff outside the folder is empty. The previous finding is repaired in substance: the suppliers are now credited only with the one-character series, the two-character series is a target here with the Dasgupta–Darmon–Pollack locator, and the Wiles-vanishing route is stated on objects this roadmap owns. One blocking finding is introduced by the repair: the new existence target is stated for every totally real `F`, every parallel weight `n ≥ 2` and every pair of characters, and it is false at `F = ℚ`, `n = 2`, trivial characters of modulus 1, where no holomorphic form exists; the cited source states the same overclaim.

## R01 (P2) — the two-character Eisenstein target of §2.12(a) asserts a holomorphic form at `F = ℚ`, `n = 2`, trivial characters of modulus `1`, where none exists

**Location.** README 367 ("for narrow ray class characters `φ₁` and `φ₂` of `F` of moduli `𝔞` and `𝔟` whose signs at the real places add to the parity of `n`, and for parallel weight `n ≥ 2`, the Hilbert modular form `E_n(φ₁, φ₂)` of parallel weight `n`, level `𝔞𝔟` and nebentypus `φ₁φ₂` whose normalized coefficients are … (DDP Proposition 2.1, (48)–(49), p. 459 …)"). The Conventions (README 21) take `F` totally real of any degree, and the Checks of the same section use `F = ℚ` (README 377).

**Claim.** For every totally real `F`, every `n ≥ 2` and every admissible pair, a holomorphic form of parallel weight `n` with coefficients `Σ_{𝔯 | 𝔪} φ₁(𝔪𝔯⁻¹)φ₂(𝔯)N𝔯^{n−1}` and constant term `2^{−d}φ₁(t_i)⁻¹L(F, 1 − n, φ₁⁻¹φ₂)` exists.

**Witness.** `F = ℚ`, `n = 2`, `φ₁ = φ₂ = 1` of modulus `1`: the prescribed coefficients are `σ₁(m) = 1, 3, 4, 7, 6, …` and the constant term `2⁻¹ζ(−1) = −1/24`, i.e. the series `E₂`; but `M₂(SL₂(ℤ)) = 0`, and Hecke's regularisation (the construction DDP recall at their (51), p. 459, "`f_λ(z) := f_λ(z, 0)`") yields the non-holomorphic `E₂* = E₂ − 3/(πy)`. The same computation shows the exact failing set for `F = ℚ`, `n = 2`: writing the Dirichlet series `L(s, φ₁)L(s − 1, φ₂)` with trivial-valued characters as `Σ_{d | rad 𝔞} Σ_{e | rad 𝔟} μ(d)μ(e) e · ζ(s)ζ(s − 1)(de)^{−s}`, the non-holomorphic parts of the corresponding `e·E₂*(dez)` add to `(8πy)⁻¹ Π_{q | 𝔞}(1 − q⁻¹) · [𝔟 = 1]`, which vanishes exactly when `𝔟 ≠ 1`; for `φ₂ = 1` of modulus `(q)` the form is `E₂(z) − qE₂(qz) ∈ M₂(Γ₀(q))` with normalized constant `(q − 1)/24`, agreeing with DDP (49) through the depleted value `2⁻¹(1 − q)ζ(−1)`. For `d = [F:ℚ] ≥ 2` the parallel weight-2 Eisenstein series of level `1` is holomorphic (Hecke; van der Geer, *Hilbert modular surfaces*, Ch. I), so the exception is confined to `F = ℚ`. DDP (ea435711 lines 49, 255, 853–854) take `F` of any degree including `ℚ` and state Proposition 2.1 "for all `k ≥ 1`" without this exclusion; their proof invokes Shimura's Proposition 3.4 for existence, so the exclusion lives in Shimura's hypotheses, which could not be read (see `## Not verifiable`).

**Repair.** In README 367 add the hypothesis to the existence statement: "when `F = ℚ` and `n = 2`, `φ₂` is not the trivial character of modulus `1` or `φ₁` has nontrivial primitive character" (equivalently, exclude the pairs with `φ₂ = 1` of modulus `1` and `φ₁` trivial on the ideals prime to `𝔞`). Add the negative-control Check: "`F = ℚ`, `n = 2`, `𝔞 = 𝔟 = 1`: `M₂(SL₂(ℤ)) = 0`, so no form with coefficients `σ₁(m)` exists; with `𝔟 = (q)` the series is `E₂(z) − qE₂(qz)`, normalized constant `(q − 1)/24 = 2⁻¹(1 − q)ζ(−1)`." Note at the DDP locator that the proposition's generality is restricted as above. The Wiles-vanishing target and its route are unaffected: there `φ₂ = φ⁻¹ψ` has modulus `𝔫p ≠ 1`.

## R02 (P3) — the parity Check of Wiles' vanishing computes with the undepleted `ζ(−1)` and, at modulus `1`, with the form of R01

**Location.** README 377 ("for `F = ℚ`, `ψ = 1` and `n = 3`, `ζ(−2) = 0`, …, whereas for `n = 2`, `ζ(−1) = −1/12 ≠ 0`; … the statement reduces to `d(1)·2^{−1}L(ℚ, 1 − n, ψ) = 0 ⇒ d(1) = 0`").

**Claim.** The Check evaluates the constant term of `E_n(1, ψ)` over `ℚ` with `ψ = 1`.

**Witness.** In clause (a) the value `L(F, 1 − n, φ₁⁻¹φ₂)` is depleted at the primes dividing `𝔞𝔟` (README 367, DDP p. 458 lines 847–850), and `ψ = χω⁻¹` has modulus `𝔫p`; so the constant of `E₂(1, ψ)` is `2⁻¹(1 − p^{n−1}·…)ζ(1 − n)`, e.g. `2⁻¹(1 − p)(−1/12) = (p − 1)/24` at `n = 2`, not `2⁻¹(−1/12)`. With modulus `1`, as written, the `n = 2` instance is the non-existent form of R01, and the `n = 3` instance violates the sign condition of the target (two even characters force `n` even), so the constant term is not merely uninformative: the series does not exist.

**Repair.** State the Check at modulus `(p)`: for `n = 3` the depleted value `(1 − p²)ζ(−2) = 0`; for `n = 2` it is `(1 − p)(−1/12) = (p − 1)/12 ≠ 0`; and say that for odd `n` the pair `(φ, φ⁻¹ψ)` of even characters admits no series at all, which is why the target is stated for even `n`.

## Previous findings

- R01 (r3) — repaired, with a new defect: README 96 and 367 credit NoncommutativeAndEquivariantIwasawa §6.1 step 0(c)/§6.22 with the one-character `G_{n,ε} = E_n(1, ε)` only, state that neither Iwasawa roadmap gives a two-character series, a coefficient twist or a spanning statement, assign the decomposition `f = F + G` to ClassicalSerreModularity `I.1/nearly-ordinary-hecke-algebras` (README 369), state `E_n(φ₁, φ₂)` here with DDP's coefficient and constant-term formulas and Shimura's locator, and add the requested Check (README 374). The existence statement overclaims at one instance: R01 above.

## Verified sound

**Gate and dependency check.** Worker's gate at `4264526`: every check 0, `build=0 OK`. My rerun: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. Dependency check (`--movable`, content at main): `depcheck: 205 roadmaps, 1438 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line (one edge more than at `67b9167`: LFunctions). `git diff --stat origin/main...HEAD` outside the folder: empty. Merge order: LFunctions 23, IntegralIwasawaTheory 24, NoncommutativeAndEquivariantIwasawa 25, ClassicalSerreModularity 150, PadicFamilies 153, this roadmap 154: every new edge points downward.

**Elaboration.** `Suggested.lean` is byte-identical to `cde3e6f` (last commit on the file `cde3e6fd`). `lake env lean` on the scratch scaffold (the file plus `#check @` for its seven declarations: `IsCohenMacaulayLocal`, `puncturedSpectrum_connected`, `components_meet_in_large_dimension`, `IsRelativeCompleteIntersection`, `numerical_completeIntersection_criterion`, `pPrimaryClassNumber`, `cyclotomic_classGroup_primary_stabilizes`): four `declaration uses 'sorry'` warnings, seven elaborated types, exit 0; each type equals the worker's signatures file and the README statements of §4.3, §4.20 and §5.9 (the explicit hypothesis `IsCohenMacaulayLocal A`, the binders `[IsDiscreteValuationRing C]`, `[IsAdicComplete …]`, `[Module.Finite C T] [Module.Flat C T]`, `[IsAbelianGalois ℚ K]` are all explicit in the signatures). The one-tactic probe of r2 (none of the four theorems closes by `rfl`, `simp`, `infer_instance`, `simp_all` or `aesop`) carries over unchanged, as does the headline list (CM connectedness, numerical criterion, Washington; the Skinner–Wiles lifting theorems named in the docstring as not statable).

**New citations resolved.** LFunctions on main (`TauCetiRoadmap/LFunctions/README.md` 929): `## Layer 5: finite-order Hecke L-functions`, with the functional equation `Λ(χ,s) = W(χ)Λ(χ⁻¹, 1 − s)`, `|W(χ)| = 1` (its 1053) and the Euler correction for an induced character `∏_{𝔭 ∣ 𝔫₀, 𝔭 ∤ 𝔪₀}(1 − χ([𝔭])N𝔭^{−s})` (its 1058): exactly the two inputs the Wiles-vanishing route of README 367 uses. Mathlib at the pin: `Mathlib/LinearAlgebra/LinearIndependent/Basic.lean:502`, `linearIndependent_monoidHom (G) [MulOneClass G] (L) [CommRing L] [IsDomain L] : LinearIndependent L (fun f : G →* L => (f : G → L))`; the route applies it with `G` the narrow class group and `L = ℂ`. NoncommutativeAndEquivariantIwasawa at its head (`roadmaps show`, #1307): §6.1 step 0(c) (its 2369) gives `G_{k,ε}` with coefficients `Σ_{𝔞∋μ} ε(g_𝔞)N𝔞^{k−1}`, constant term `N((α))^k 2^{−r}L_Σ(ε_g, 1 − k)` at the cusp of any finite idele `α`, and the `q`-expansion principle, for `p` odd (its 2363); §6.22 (2910) and §F.5 (2288) as in r3. The README's "standard cusp of every narrow-class component" is covered by "any finite idele". ClassicalSerreModularity `I.1/nearly-ordinary-hecke-algebras` (r3) still owns SW99 Prop. 3.18, to which README 369 now also assigns the decomposition `f = F + G`.

**Seeded sample.** Of the fifteen sampled targets only 2.12 changed; the other fourteen rows of r2/r3 stand (sw99 `ec0697b3`, printed page = PDF page + 3; sw01 `f847ed87`; acc `7c882c4d`; drs `afe51e77`; waldschmidt `19b8b01e`; washington `b0954600`). Re-read this round:

| Target | Source, locator | Lines | Result |
|---|---|---|---|
| 2.12(a) `E_n(φ₁, φ₂)` existence, (48) | DDP Prop. 2.1, p. 459 | ea435711 842–869 | characters of the narrow ray class groups modulo `𝔞`, `𝔟` ("possibly imprimitive"), signs `q + r ≡ (k, …, k)`, `E_k(η, ψ) ∈ M_k(𝔞𝔟, ηψ)`, `c(𝔪) = Σ_{𝔯|𝔪} η(𝔪/𝔯)ψ(𝔯)N𝔯^{k−1}`: as restated, except the missing exclusion of R01 |
| 2.12(a) constant term, (49) | DDP p. 459 | ea435711 863–869, 847–850 | for `k > 1`: `2^{−n}η⁻¹(t_λ)L(ψη⁻¹, 1 − k)` if `𝔞 = 1`, else `0`; `L` without subscript depletes at the archimedean places and the primes dividing the modulus `𝔞𝔟`: as restated |
| 2.12(a) component convention | DDP p. 458 | ea435711 825–832 | `𝔪 = (b)t_λ⁻¹`, `b ≫ 0`; `c(𝔪, f) = a_λ(b)N(t_λ)^{−k/2}`, `c_λ(0, f) = a_λ(0)N(t_λ)^{−k/2}`: the README's `a_i(f, 0) = Nm(t_i)^{n/2}c_i(0, f)` and its `φ₁(𝔪) = φ₁(t_i)⁻¹` |
| 2.12(a) imprimitive `ψ` | DDP p. 460 | ea435711 979–1002 | `E_k(η, ψ) = E_k(η, ψ₀) − ψ₀(𝔮)N𝔮^{k−1}E_k(η, ψ₀)|𝔮` and the constant-term identity: the depleted-`L` convention of the README is the source's |
| 2.12(a) Shimura locator | DDP p. 460, 457 | ea435711 890–891, 774, 1925 | existence "given by [13, Prop. 3.4]", [13] = Shimura, Duke 45 (1978); `M_k(𝔟, ψ)` from [13, p. 649]: the README's "Proposition 3.4" is DDP's citation |
| 2.12(a) SW99 two-character series | SW99 p. 47 | sw99 1511–1514 | `E_n(φ₁, φ₂) ∈ M_n(𝔫, ψ)` for `φ₁φ₂ = ψ`, `cond(φ₁)cond(φ₂) | 𝔫`, Dirichlet series `L(F, s, φ₁)L(F, s − n + 1, φ₂)`, "cf. [Sh]": consistent with DDP's level `𝔞𝔟` |
| 2.12(a) Wiles' vanishing | SW99 pp. 47–48 | sw99 1534–1540 | `ε₀G = Σ d(φ)E_n(φ, φ⁻¹ψ)` over unramified `φ` of `p`-power order, all constant terms zero ⇒ `ε₀G = 0`: as restated (even `n` is forced by the sign condition, no narrowing) |
| 2.12(a) (3.10), (3.11), (4.17) | SW99 pp. 47, 77 | sw99 1515, 1518–1522, 2557–2573 | r3 rows, text unchanged |

**Adversarial table.** Rows for statements the diff leaves untouched are r2's and r3's (cited); new rows carry this round's values.

| Statement | Instance | Computed | Result |
|---|---|---|---|
| §2.12(a) coefficient and Dirichlet series | prime `𝔮 ∤ 𝔞𝔟`, `𝔪 = 𝔮, 𝔮²` | `c(𝔮) = φ₁(𝔮) + φ₂(𝔮)N𝔮^{n−1}`; `c(𝔮²) = φ₁(𝔮)² + φ₁φ₂(𝔮)N𝔮^{n−1} + φ₂(𝔮)²N𝔮^{2(n−1)}`; `Σ_𝔪 c(𝔪)N𝔪^{−s} = Σ_{𝔞',𝔯} φ₁(𝔞')N𝔞'^{−s}φ₂(𝔯)N𝔯^{n−1−s} = L(s, φ₁)L(s − n + 1, φ₂)` | ✓ |
| §2.12(a) Euler-factor Check (README 374) | `Σ_k c(𝔮^k)X^k` | `= (1 − φ₁(𝔮)X)⁻¹(1 − φ₂(𝔮)N𝔮^{n−1}X)⁻¹`, poles `φ₁(𝔮)⁻¹` (modulus 1) and `φ₂(𝔮)⁻¹N𝔮^{1−n}` (modulus `< 1` for `n ≥ 2`); `G_{n,ε}`: poles `1`, `ε(𝔮)⁻¹N𝔮^{1−n}`; equal rational functions ⇒ `φ₁(𝔮) = 1` | ✓ |
| §2.12(a) order Check (README 375) | swap | `c_{E(φ₂,φ₁)}(𝔮) − c_{E(φ₁,φ₂)}(𝔮) = (φ₂(𝔮) − φ₁(𝔮))(1 − N𝔮^{n−1})`, nonzero iff `φ₁(𝔮) ≠ φ₂(𝔮)` since `N𝔮^{n−1} ≥ 2` | ✓ |
| §2.12(a) rescaling identity | `𝔞 = 1`, any `𝔪` | `Σ_{𝔯|𝔪} φ₁(𝔪𝔯⁻¹)φ₂(𝔯)N𝔯^{n−1} = φ₁(𝔪)Σ_{𝔯|𝔪}(φ₁⁻¹φ₂)(𝔯)N𝔯^{n−1}` (multiplicativity of the unramified `φ₁`); at `𝔪 = 𝔮²`, `φ₁ = φ`, `φ₂ = φ⁻¹ψ`: both sides `φ(𝔮)² + ψ(𝔮)N𝔮^{n−1} + φ(𝔮)⁻²ψ(𝔮)²N𝔮^{2(n−1)}` (README 376) | ✓ |
| §2.12(a) rescaling scalar | `𝔪 = (b)t_i⁻¹`, `b ≫ 0` | `φ₁(𝔪) = φ₁((b))φ₁(t_i)⁻¹ = φ₁(t_i)⁻¹` (narrow class character); constant `2^{−d}φ₁(t_i)⁻¹L(φ₁⁻¹φ₂, 1 − n) = φ₁(t_i)⁻¹ · c_i(0, E_n(1, φ₁⁻¹φ₂))`; wrong model `ζ` instead of `ζ⁻¹` changes coefficients by `ζ² ≠ 1` (odd order) | ✓ |
| §2.12(a) `φ₁ = 1` Check (README 373) | `η = 1` in DDP (49) | `2^{−d}·1·L(φ₂, 1 − n)` on every component; times `Nm(t_i)^{n/2}` gives SW99 (3.10) at `φ₂ = ψ` | ✓ |
| §2.12(a) existence, degenerate case | `F = ℚ`, `n = 2`, `𝔞 = 𝔟 = 1` | coefficients `σ₁(m)`, constant `−1/24`; `M₂(SL₂(ℤ)) = 0`; Hecke limit `E₂ − 3/(πy)` non-holomorphic | false: R01 |
| §2.12(a) existence, `𝔟 ≠ 1` | `F = ℚ`, `n = 2`, `φ₂ = 1 mod (q)` | `E₂(z) − qE₂(qz) ∈ M₂(Γ₀(q))`, normalized constant `(1 − q)/(−24) = (q − 1)/24`; DDP (49): `2⁻¹(1 − q)ζ(−1) = (q − 1)/24` | ✓ agree |
| §2.12(a) existence, `d ≥ 2` | level 1, `n = 2`, trivial characters | parallel weight-2 Eisenstein series holomorphic for `[F:ℚ] ≥ 2` (Hecke) | exception confined to `ℚ` |
| §2.12(a) Wiles' vanishing route | `h` classes, characters `φ` of `Cl⁺` of `p`-power order | constant at `t_i`: `2^{−d}Nm(t_i)^{n/2}Σ_φ d(φ)φ(t_i)⁻¹L^{(𝔟)}(φ⁻²ψ, 1 − n)` (DDP (49) with `η = φ`, `ψ ↦ φ⁻¹ψ`, same depletion set `𝔟` for all `φ`); vanishing at all `h` classes + `linearIndependent_monoidHom` ⇒ each `d(φ)L^{(𝔟)}(φ⁻²ψ, 1 − n) = 0` | ✓ |
| §2.12(a) `L(1 − n, χ) ≠ 0` | `χ = φ⁻²ψ` totally even, `n` even ≥ 2 | `Γ_ℝ(1 − n)^d` finite nonzero at negative half-integers; `Λ(1 − n, χ) = WΛ(n, χ⁻¹)`, `L(n, χ⁻¹) ≠ 0` (Euler product); removed factors `1 − χ₀(𝔮)N𝔮^{n−1}` have modulus `≥ 1` | ✓ |
| §2.12(a) evenness of `φ` | `p` odd | kernel of `Cl⁺ → Cl` is 2-torsion; a `p`-power-order `φ` is trivial on it, so `φ((α)) = 1` for all `α`: sign trivial | ✓ |
| §2.12(a) parity Check (README 377) | `F = ℚ`, `n = 3, 2` | `ζ(−2) = 0`, `ζ(−1) = −1/12` correct values; depleted at `(p)`: `(1 − p²)·0 = 0`, `(1 − p)(−1/12) ≠ 0` | values right, convention off: R02 |
| §2.12(a) level and nebentypus | DDP vs SW99 | `M_n(𝔞𝔟, φ₁φ₂)` vs `M_n(𝔫, ψ)` with `cond(φ₁)cond(φ₂) | 𝔫`, `φ₁φ₂ = ψ` | consistent |
| §2.12(a) Chai weight class, (3.10)/(3.11) Checks (README 378–380) | r3 rows | text unchanged | r3 ✓ |
| §2.12(b)–(d), §2.11 | r2 rows | unchanged | r2 ✓ |
| §1.1–§1.6, §2.1, §2.9, §2.10 | r2 rows | unchanged | r2 ✓ |
| §3.36–§3.39, §4.3, §4.6a, §4.20, §5.1–§5.10, §6.3–§6.6, §6.14 | r2 rows | unchanged | r2 ✓ |

**Convention witnesses.** DDP's `𝔪 = (b)t_λ⁻¹` convention and `N(t_λ)^{−k/2}` normalisation are the ones the README states; SW99's `Nm(t_i)^{n/2}` cusp normalisation of (3.10)–(3.11) is recovered by the README's `a_i(f, 0) = Nm(t_i)^{n/2}c_i(0, f)`. The direction of the shift (`φ₂` carries `N𝔯^{n−1}`) is pinned by the Dirichlet series and the order Check.

**Checks and shape.** §2.12 now has ten Checks, five new and computed above; the Summary, Scope, "How to read the build", the supplier contract (README 96) and §2.12(a) all say "three Eisenstein inputs" consistently; the new `*Needs:*` items are mirrored in the Layer 2 `### Dependencies` line (README 394); the two new references carry a DOI each, the DDP copy is the author's journal-layout file (printed page = PDF page + 438: Prop. 2.1 on PDF page 21 = p. 459), and no LaTeX delimiters, process words, pull-request numbers or local paths occur in the changed lines.

**Ownership against open pull requests** (`roadmaps grep` over main and the 433 open heads for `E_n(φ₁, φ₂)` and "two-character Eisenstein"): only this README. The one-character series and the Λ-adic families keep the owners named in README 96.

## Not verifiable

- **Shimura, Duke Math. J. 45 (1978), Proposition 3.4** (README §2.12(a), Shimura78): Duke is paywalled; cited by locator only in the README, and the locator agrees with DDP's citation "[13, Prop. 3.4]" (ea435711 890–891). Whether Shimura's proposition excludes `F = ℚ`, `k = 2` with trivial characters could not be checked; R01 is established by direct computation.
- **Chai, Ann. of Math. 131 (1990), §4.5** and **Wiles, Ann. of Math. 123 (1986), Proposition 1.6**: as in r3, JSTOR only, read through SW99 (sw99 1519–1522, 1540).
- The r2 items (Diamond 1995; Skinner–Wiles Duke 2001; Wiles [W2] Thm 1.4.1; Hida [H3]; Conrad; Milne CFT; Waldschmidt §5; BLGG12, BLGG13, BCGP) are untouched by the diff and were not re-opened.

## Source issues

- **Error** in DDP at Proposition 2.1, printed page 459: the source says a holomorphic Eisenstein series `E_k(η, ψ)` with the stated coefficients exists for every `k ≥ 1` and every pair of characters, over any totally real field; it should exclude `F = ℚ`, `k = 2` with `ψ` the trivial character of modulus 1 and `η` of trivial primitive character, where Hecke's regularisation gives the non-holomorphic `E₂*`; affects a stated result (the proposition's generality, not the paper's theorems).
