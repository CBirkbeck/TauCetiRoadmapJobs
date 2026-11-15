<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17047#issuecomment-6901397930 -->
Review (claude) of 79e7a67

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Bare `§` numbers of suppliers that resolve to this roadmap's own sections

   - **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md` §1.3, lines 672–674: "the
     regularisation of §2.3 identifies `[S_{p₀}, S_∞]_θ = … = S_{p_θ}` (§2.5 with §1.5), and the
     operator estimate of §2.3 applies"; also line 120 (Scope), line 1299 (Layer 4 Dependencies) and
     line 1863 (§9.3).
   - **Claim.** These are citations of NoncommutativeIntegration §2.3, §2.5, §1.5 and of BochnerSpaces
     §4.2.
   - **Witness.** In this README §2.3 is "Transposition" (line 856) and §2.5 "Conditional expectation
     of bounded functions" (line 929); §2.3 needs §1.4, which needs §1.3 (lines 887, 762), so the
     literal reading of §1.3 is a cycle. Line 120, "§11.3 uses §4.2 at `p = 2`", reads as this
     roadmap's §4.2 (interpolation, line 1250); line 1299, "NoncommutativeIntegration §2.3, §2.5, §2.6
     through §1.3", reads as that roadmap's §1.3.
   - **Repair.** Name the roadmap at each place.
     (a) §1.3: "so the regularisation of NoncommutativeIntegration §2.3 identifies
     `[S_{p₀}, S_∞]_θ = [L^{p₀}(B(H)), B(H)]_θ = S_{p_θ}` (NoncommutativeIntegration §2.5 with its
     §1.5), and the operator estimate of NoncommutativeIntegration §2.3 applies to the regular couple
     `(S_{p₀}, S_∞)`".
     (b) Line 1863: "(through NoncommutativeIntegration §1.5)".
     (c) Line 1299: "Layers 1–3; VonNeumannAlgebras V4.Core; CStarAlgebras C3.2; through §1.3 of
     Layer 1, NoncommutativeIntegration §2.3, §2.5 and §2.6".
     (d) Lines 119–120: "§7.1 applies BochnerSpaces §7.5 to the restriction of an atomless measure to
     a set of finite measure; §11.3 uses BochnerSpaces §4.2 at `p = 2`".
     Tested on the instance: with (a) the only bare references left in §1.3 are §1.1, and the script
     that compares each section's `§` references with the section order (below) reports no forward
     reference from §1.3; the `*Needs:*` line of §1.3 (line 681) already names
     NoncommutativeIntegration §1.5, §2.3, §2.5, §2.6, so no dependency changes.

One finding, P3, not blocking: four passages cite a supplier's section by a bare `§` number that,
in this README, is the number of one of its own sections; one of the four was added by the last
repair. The three findings of round 2 are repaired. No statement was found false, vacuous or
unowned; `Suggested.lean` elaborates with `sorry` as its only warning and nothing in it is padding.

## Previous findings

- **F01 (commutant route of §10.2) — repaired.** Lines 2024–2033: "`π(A)` equals its mean on every
  cube; any two points lie in a common cube, so `π(A)` is constant … by the uniqueness of the
  kernel (§2.1) `(e^{2πi⟨z, x − y⟩} − 1) k_A(x, y) = 0` … The diagonal of `ℝⁿ × ℝⁿ` is null for
  `n ≥ 1`". `*Needs:*` (line 2056) has §2.1 and `MeasureTheory.Measure.measure_prod_null`; Layer 10
  Dependencies (line 2152) and How to read the build (line 561) say "Layers 1, 2 (§2.1) and 3".
- **F02 (identification of §11.3) — repaired.** Lines 2231–2234: "by applying the kernel unitary …
  of §2.1 pointwise in `z` (Mathlib `ContinuousLinearMap.compLp`) and then the Fubini isometry … of
  BochnerSpaces §4.2". `*Needs:*` (lines 2266–2267) has §3.1, §11.1, BochnerSpaces §4.2 and
  `compLp`; the contract (lines 528–532), Scope (line 116) and Layer 11 Dependencies (line 2360)
  name §4.2. BochnerSpaces §4.2 at its open head states `exists_fubiniEquiv` for σ-finite `μ`, `ν`,
  `1 ≤ p < ∞`, complete `X`.
- **F03 (forward facts in a Check of §10.2) — repaired.** The `n = 0` Check of §10.2
  (lines 2048–2051) keeps the BMO and definiteness facts; the `J_k` fact is a Check of §10.3
  (lines 2090–2091) and the inequality a Check of §10.4 (lines 2136–2138).

The pattern repairs of the fix round (§3.2 → §3.5 for `schurNorm_two_eq`, the deleted sentences of
§1.4 and of the Layer 4 Examples, the restated Layer 10 Example, §1.4 in the `*Needs:*` of §2.3,
§3.1 in that of §11.4) are in the text as reported. I reran the pattern search with a script over
the 45 numbered sections (each `§` reference against the section order and the `*Needs:*` line).
Forward references: §1.2 → §3.3, §5.2, §2.3 → §4.1 and §11.2 → §11.4 are usage pointers that state
nothing about the later section; §1.3 → "§2.3", "§2.5" is R01. Backward references absent from a
`*Needs:*` line (§3.3 → §2.1, §3.7 → §3.1, §4.1 → §3.4, §8.2 → §3.5, §9.1 → §1.1) are reached
through a listed section; §7.3 → §6.3 and §11.5 → §9.5 occur in Checks that compare values and
feed neither statement nor route.

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no
algorithm, no sorry'd data, no `set_option`, no copied passage. The organisation is the roadmap's
own.

**Elaboration.** `lake env lean` on `packages/SchattenClassesAndSchurMultipliers/Suggested.lean`
from the content repository: exit code 0, 11 warnings, each "declaration uses `sorry`" (lines 97,
107, 120, 130, 143, 165, 177, 196, 207, 247, 276), no other message. 8 definitions with real bodies
and 11 theorems; no `lemma`, `example`, `#eval`, `#synth`. Imports: `import Mathlib` and five
`TauCeti.*` modules, each used. The Lean file is byte-identical to the one round 2 reviewed (the
diff of the fix commit touches only the README and the fix report), so the elaborated signatures
compared there stand; I reread the 19 types of the worker's transcript against the README: every
Schur theorem keeps `[SigmaFinite μ]`, the two continuous-symbol theorems keep the five Radon
binders, `schurNorm_le_hmsNorm` keeps `1 ≤ n`.

**Padding probe.** Two scratch copies, every `sorry` replaced by one alternative of tactics. First:
`rfl`, `simp`, `infer_instance`, `exact le_rfl`, `trivial`, `constructor <;> rfl`, `exact Iff.rfl`,
`norm_num`. Second: `simp` with the eight definitions unfolded, `unfold … ; rfl`,
`exact ⟨0, by simp⟩`, `aesop`. Each run: 11 errors, one at each of the 11 theorems. None restates a
definition, mirrors a Check, computes a small value or treats a boundary case.

**Headline theorems** (README lines 11–30): isometry on `S₂` (`schurNorm_two_eq`); invariance under
`p ↦ p'` and transposition (`schurNorm_eq_of_holderConjugate`); log-convexity and monotonicity
(`schurNorm_interpolation`, `schurNorm_mono_of_abs_inv_sub_le`); Schur product theorem
(`schurNorm_of_posSemidef`); Grothendieck–Haagerup (`schurNorm_eq_haagerupNorm`); atomless theorem
(`schurNorm_eq_schurCbNorm_of_forall_not_isAtom`); continuous symbols (two theorems); transference
(`schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm`); Hörmander–Mikhlin–Schur
(`schurNorm_le_hmsNorm`). The one headline not stated, multiplicativity and `*`-compatibility of
`M ↦ S_M`, is named in the module docstring with its missing carrier (the kernel of a
Hilbert–Schmidt operator on a σ-finite space). All 19 backticked names the README attributes to
this roadmap are declared, and every Lean name appears in the README.

**Adversarial table** (repaired passages, sampled targets, headlines, the target of R01).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 extended gauge | identity of `ℓ²(ℕ)`; rank-one projection; `diag(1/(j+1))` | `∞` at every `p`, also `p = ∞` (not compact); `a₀ = 1`, gauge `1`; `Σ(j+1)⁻² = π²/6`, `Σ(j+1)⁻¹ = ∞` | holds | none |
| §1.2 norming | `X = E₁₂`, `p = 2`; general finite rank; `diag((j+1)⁻²)`, `p = 1` | `|X| = E₂₂`, `u = E₁₂`, `|X|u* = E₂₁`, `Tr(XE₂₁) = 1`, `u*|X| = 0`; `‖Y‖_{p'} = (Σ s_i^p)^{1/p'}/‖X‖_p^{p−1} = 1`, `Tr(XY) = ‖X‖_p`; `Tr(XP_d) → π²/6` | holds; `p = ∞` correctly gives the operator norm | none |
| §1.3 interpolation, references | `T(A) = Tr(A)E₁₁` on `M_n`; the bare `§2.3` | `C₀ = 1`, `C₁ = n`, bound `n^{1−1/p}`; own §2.3 is Transposition, which needs §1.4 → §1.3 | statement holds; citation ambiguous | R01 |
| §1.4 cb norms | transpose on `M₂`; `T` fixing `w₀ = diag(1/(j+1))`, zero on `S₁` | `‖t‖_∞ = 1`, level 2 sends the flip to `2 ×` a projection; `‖T‖₁ = 0`, `‖T‖₂ = ∞`, `‖T‖_{4/3} ≥ 1` | holds; finiteness hypothesis needed and present | none |
| §2.1 kernels | `min(x, y)` on `[0,1]`; `1_{(1,2)}` | `(16/π⁴)(π⁴/96) = 1/6 = ∫∫ min²`; `E₁₂δ₂ = δ₁` | holds | none |
| §2.4 change of measure, sub-σ-algebras | `dν = h dμ`; `k(i,j) = u_iu_j`, `u_j = 1/(j+1)` | kernel of `UAU*`: `√h(x) k(x,y) √h(y)`; `‖k‖₂ = π²/6`, `Σ k = ∞`, so `condExp` gives `0`, `condExpL2` gives `k` | holds | none |
| §2.5 `L^∞` expectation | masses `(1, 3)`, trivial `𝒜`; `{1,2,3,4}` | adjoint of `g ↦ g(1)·1` sends `1` to `(4, 0)`; `(1/2, 1/2, 0, 0)` versus `(1/2, 0, 1/2, 0)` | holds | none |
| §3.3 norms and extension | `p ≥ 2`, `A ∈ S₂` | truncations: `‖A_k‖_p ≤ ‖A‖_p`, `S_M A_k → S_M A` in `S₂`, lower semicontinuity | holds | none |
| §3.4 triangular truncation | `A = [[√2,1],[−1,√2]]/√3` | `(S_M A)*(S_M A) = ⅓[[2,√2],[√2,3]]`: trace `5/3`, determinant `4/9`, eigenvalues `4/3`, `1/3` | holds | none |
| §3.5 `schurNorm_two_eq`, moved sentence | `[[1,2],[3,4]]`; `μ = 0`; level `m = 0` | `4` at `E₂₂`, `‖M_m‖_∞ = 4`; `0 = 0`; contributes `0` | holds | none |
| §3.6 stabilisation | `ν = 0`; one-point `Ω'`; `dim L²(ν) = d` | every norm `0`; `1`; level-`dm` amplifications, `sup_m = ‖S_M‖_{cb,p}` | holds; zero measure excluded | none |
| §4.1 `schurNorm_eq_of_holderConjugate` | `M = 1_{(1,2)}`; `p = ∞` | `Tr(S_M(A)B) = A₁₂B₂₁ = Tr(A S_{M^t}(B))`, `Tr(A S_M(B)) = A₂₁B₁₂`; `‖T‖_∞ ≤ ‖T^♯‖₁ ≤ ‖T‖_∞` through finite-rank `B` | holds | none |
| §4.2 interpolation, monotonicity | endpoint norm `0`; `p₀ = p₁ = ∞`; truncation at `p = 4` | forces `M = 0`, so `0·∞` only with left side `0`; `p⁻¹ = 0`; `(2/√3)^{1/2} = 1.0746` | holds | none |
| §4.3 weak-* extension | `M = 1`; `1_{x=y}` on `ℕ` | identity; diagonal projection; `‖S̄_M‖ = ‖S_{M^t}‖₁ = ‖S_M‖_∞` | holds | none |
| §5.3 ambient σ-algebra | `{1,2,3,4}`, blocks `[[1,2],[2,1]]` | `2 × 2` matrix and its Kronecker product with `J₂`, both cb norms `2` | holds; stated for cb norms only | none |
| §6.1 `schurNorm_of_posSemidef` | `[[2,1],[1,1]]`; `[[1,2],[2,1]]`; empty `ι` | `2` at `E₁₁`; eigenvalue `−1`, diagonal `1`, norm `2`; `⨆ ∅ = 0` | holds; positivity needed | none |
| §6.3 finite Grothendieck–Haagerup | `α = (1,i)/√2`, `β = (1,1)/√2`, `a = I`, `M = diag(1,i)` | `Σψ_{ij}M_{ij} = 1/2 + i·i/2 = 0 = ⟨ᾱ, S_M(a)β⟩`; without the conjugate `1` | holds | none |
| §6.4 `schurNorm_eq_haagerupNorm` | `cos(x−y)`; `ξ = 0`, `η` unbounded; `μ = 0` | `ξ = η = (e^{ix}, e^{−ix})/√2`, norms `1`; `0·∞ = 0` with `M = 0` a.e.; `0 = 0` | holds | none |
| §7.1, §7.3 atomless theorem | countable–cocountable; `A = [0,2]`, `t = 1/2`; atom of infinite measure | no set of measure `1/2`; ratio `1/4`; σ-finite pieces have measure `0` or `∞`, contradiction | `IsAtom` hypothesis is the right one | none |
| §8.2 continuous symbols | `μ = 0`; `M(x,y) = x`; repeated points | support empty, both sides true; right side only with `C = ∞`; block-constant matrix | holds; `MemLp` conjunct and injectivity needed | none |
| §9.4 approximate identities | `p = 1`; `p = ∞`, `n = 1` | `R⁻ⁿ(1/R² + 1/T²)^{−n/2} = (1 + R²/T²)^{−n/2}`; `R(R² + T²)^{−1/2}`: `0.995` at `T = R/10`, `0.0995` at `T = 10R` | holds | none |
| §9.5 transference | `n = 0`, `m = 2i`; `m = e_a`; intertwining | both `2`; both `1`; `𝓕(m·𝓕⁻¹g) = T_{m(−·)}g = RT_mRg`, kernel `m(s−t)ǧ(s−t)` | holds | none |
| §10.1 column and row BMO | `f = Σ1_{I_k}E_{k1}`, `N = 4`; dyadic comparison | column `(1 − Σa_k²)E₁₁`, `0.866`; row `diag(a) − aaᵀ`, real symmetric, variance `≤ 1/2`, `0.707`; `⨍_Q ≤ 2ⁿ⨍_{Q̂}` | holds | none |
| §10.2 definiteness, new route | `n = 1`, `u = 1_{[0,1]}`, `z = 1/2`; `x_j − y_j = √2`, `t = 1/2`; `n = 0` | kernel `(e^{πi(x−y)} − 1)1_{[0,1]²} ≠ 0`; `0.707 ∉ ℤ`; factor `0`, diagonal of mass `1` | holds for `n ≥ 1` | none |
| §10.2 model `U_zA` | large cubes | `⨍|f − f_Q|² = A*A − |f_Q|²`, `f_Q → 0` strongly, supremum `‖A‖²` | Check correct | none |
| §10.3, §10.4 new `n = 0` Checks | `A = 1`; `p = 4`, `R = 10`, `C_n = 1` | `J_k = 0`, `1 ≤ 0` fails; `e⁻⁵ = 6.7·10⁻³ > 4e⁻¹⁰ = 1.8·10⁻⁴` | exclusions justified | none |
| §10.4 operator form | `Ψ(z) = C_∞^{z−1}C₂^{−z}T(U|A|^{pz/2})` | `‖Ψ(it)‖_{BMO} ≤ 1`, `‖Ψ(1+it)‖₂ ≤ ‖|A|^{p/2}‖₂ = 1`, `Ψ(2/p) = C_∞^{2/p−1}C₂^{−2/p}TA` | holds | none |
| §11.1 `hmsNorm` | `φ(ξ) = ξ/√(1+ξ²)`; `M = 1` | `|ξ|(1+ξ²)^{−3/2}` at `ξ² = 1/2`: `0.3849`, total `2 + 0.770`; `2` | holds | none |
| §11.3 identification | counting measure on `{1,2}` | `2·4 = 8 = 2³`; `compLp` with a unitary and its inverse is isometric | holds | none |
| §11.5 `schurNorm_le_hmsNorm` | `M = 1`; `p ↦ p'` | `1 ≤ C·4·2`; `p²/(p−1) = pp'` | holds; `C` before `M`, `p` | none |

**Sources: the seeded sample** (all fifteen read at their locators; the author flagged none as
unverified).

- §1.1: `lafforgue-delasalle-2011` lines 174–179; `cgpt-2023` lines 209–214.
- §1.2: `caspers-delasalle-2015` lines 638–642; `lafforgue-delasalle-2011` line 400, estimate (9).
- §1.4: `lafforgue-delasalle-2011` lines 183–190, (2) at 187–189; `cgpt-2023` lines 217–219.
- §2.4: `lafforgue-delasalle-2011` lines 346–349 and 366–381.
- §3.3: lines 233–238, 397–413, 433–438; `cgpt-2023` lines 226–229.
- §3.4: lines 213–218; `pisier-grothendieck-2012` lines 767–772.
- §3.6: Lemma 1.5 at line 254, Remark 1.6 at line 262.
- §4.1: Remark 1.2 at line 239, Remark 1.3 at line 244.
- §4.3: `caspers-delasalle-2015` lines 28–34; `cgpt-2023` lines 89–93.
- §5.3: Lemma 1.13 at line 415, proof 419–439, Question 1.14 at line 442.
- §6.3: `pisier-grothendieck-2012` Proposition 3.3 at line 781, (3.9)–(3.10) at 656–665, the
  bilinear pairing at line 800, Remark 13.4 at 2086, Lemma 23.1 at 3439, Remark 23.4 at 3541.
- §7.1: `lafforgue-delasalle-2011` lines 487–488.
- §9.4: `caspers-delasalle-2015` Lemma 4.1 at line 449 (`1 < p < ∞`, `p/q` rational), Theorem 4.2
  at 485, proof from 494.
- §10.1: `cgpt-2023` lines 246–263, line 683; `mei-2007` lines 96–110.
- §10.2: `cgpt-2023` lines 264–285.

Also read: Remark 1.4 (246–252), Theorem 1.7 (274–278), Lemma 1.9 (342), Lemma 1.10 (363),
Lemma 1.11 (383), Remark 1.12 (393), Lemma 1.17 (489); `cgpt-2023` (FS) lines 71–72, (HMS) line 79,
Theorem A lines 149–154, lines 370–379 and 502–507; `mei-2007` Lemma 6.1 at line 3218. No locator
slip. All 16 cited works are in `packages/SchattenClassesAndSchurMultipliers/sources.toml`; I added
no entry and requested no text.

**Library declarations at the pins.** One scratch file with `#check @name` for the 95 Mathlib and
Tau Ceti names the README backticks elaborated with no error, among them the two added by the
repair: `MeasureTheory.Measure.measure_prod_null` (`Mathlib/MeasureTheory/Measure/Prod.lean`
line 406) and `ContinuousLinearMap.compLp` (`Mathlib/MeasureTheory/Function/LpSpace/Basic.lean`
line 775). The 46 Mathlib and Tau Ceti file paths the README spells out in full exist at the pins, as do the six abbreviated ones. Opened in source:
`MeasureTheory.Measure.IsAtom` (`TauCeti/MeasureTheory/Measure/Atom.lean` line 59: measurable,
positive, every measurable subset null or of full measure, no finiteness),
`exists_subset_measure_eq_of_nullSingleton` (`…/AtomlessStandardBorel/Transport.lean` line 115:
standard Borel, `NullSingletonClass`, `μ s ≠ ∞`), and the deprecated alias `NoAtoms` with the
remark that the converse fails (`Mathlib/MeasureTheory/Measure/Typeclasses/NullSingletonClass.lean`
lines 17–35). Neither library has a Schur multiplier on operators, a kernel operator or a compact
Schatten endpoint (searched by object).

**Duplication audit.** `roadmaps grep` over main and the open heads: Herz–Schur, triangular
truncation, double operator integral: no match; "Schur multiplier" only as `H₂(G, ℤ)`
(InverseGaloisAndArithmeticFundamentalGroups); Haagerup tensor product and norm of operator spaces
in CStarAlgebras (lines 1179, 1356), a different object from the factorisation constant of a
symbol; martingale `BMO_C` in NoncommutativeIntegration §8.4 (lines 1426–1446), finite-tracial,
the semifinite form being the declared gap. Of the Lean names only `schattenGauge` occurs elsewhere
(`TauCetiRoadmap/OperatorTheory/OperatorIdeals/Suggested.lean` line 438), in another namespace and
for another object. The overlap list has no second copy, no dropped id, no id only a revision
defines and no conflicting pull request; no other board package treats these objects.

Overlap check: read NoncommutativeIntegration, OperatorTheory/OperatorIdeals, NoncommutativeGeometry, BochnerSpaces, VonNeumannAlgebras, BanachSpaceTheory, and searched AmenableTracesOnCStarAlgebras and QuantumFoundations by object; shared objects and owners: Schatten families for `1 ≤ p < ∞` and the `B(H)` family at `p = ∞` — OperatorIdeals (cited), the compact endpoint — this roadmap; `Lᵖ(B(H), Tr) = S_p`, duality, interpolation, martingale BMO — NoncommutativeIntegration (cited; the semifinite BMO inequality a declared gap); the `L^∞` conditional expectation, divisibility of atomless measures and the Fubini isometry — BochnerSpaces §7.4, §7.5, §4.2 (cited); Hilbert tensor products and the ultraproduct — VonNeumannAlgebras (cited); nothing has two owners.

**Supplier-order audit.** Output of the dependency check:

    depcheck: 241 roadmaps, 2247 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. Resolved now: NoncommutativeIntegration §1.3, §1.4, §1.5, §2.1,
§2.3, §2.5, §2.6, §4.3, §4.4, §7.3, §8.4 (headings on main); VonNeumannAlgebras V2 completed
Hilbert tensor products (line 974), V2.RectangularL2 (line 1006, arbitrary measures), V4.Core,
§13.2 (V13b, line 4692, with the Hilbert-space ultraproduct at line 5183); CStarAlgebras C1.6
(line 435), C3.2 (line 918); BanachSpaceTheory B4.0 (line 359; the density `m = μ.withDensityᵥ h`
with its variation formula at lines 380–385); OperatorIdeals OI-A12 … OI-C14 (21 ids, all present);
UnboundedOperators §5.1, UO-E01 (line 900); AutomorphicSpectralTheory §0.8 with `kernel_apply`,
`kernel_unique`, `kernel_norm` (lines 240–249), §0.9, §0.10, at its open head, earlier in the merge
order; BochnerSpaces §4.2, §7.4 (the `L¹` projection, the `L^∞` contraction as its adjoint under a
σ-finite trim), §7.5 (divisibility) at the head of its open pull request, another author's new
roadmap folder. No roadmap of the never-cite list is cited.

**Declared gaps.** `sigma-finite-hilbert-schmidt-kernels` (AutomorphicSpectralTheory §0.8) and
`semifinite-martingale-bmo-interpolation` (NoncommutativeIntegration, Part II): both slugs are in
`design/plan.json` with these suppliers and in the README in the required form (lines 455 and
489); each is precise and asks for nothing already provided. Not findings; an acceptance after the
repair is conditional on both.

**Shape and style.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to
read the build, eleven layers each with Examples and Dependencies, Downstream consumers,
References. No LaTeX delimiter, pull-request number, date, anchor, machine path or process word in
the README or the Lean file (searched); `theorem` only; no numbering table.

**Copyright.** Wording: 18 passages set beside their sources (the fifteen sampled statements and
the routes of §5.2, §5.3 and §6.3 against the proofs of Lemmas 1.11, 1.13 and Proposition 3.3); no
shared run beyond a formula or a standard name. Arrangement: `lafforgue-delasalle-2011` §1 has
subsections 1.1–1.5 (lines 180, 212, 338, 352, 521). No one-to-one run: 1.1 ↔ §1.4 only; 1.2 ↔
Layer 3 without Theorem 1.7 (Layer 6); 1.3 ↔ §2.4 and §3.7; 1.4 ↔ Layers 5 and 7, split; 1.5 ↔
Layer 8; Layers 2, 4, 6, 9, 10, 11 have no counterpart; the order of Layers 5, 7, 8 is forced by
"Layer 7 needs Layers 2, 3 and 5" and "Layer 8 needs Layers 1, 3 and 5". Reuse: none.

Source independence: 18 passages compared with 5 sources, none shared; largest share lafforgue-delasalle-2011, 43 of 122 source citations; contents compared with lafforgue-delasalle-2011: independent.

## Not verifiable

- `pisier-similarity-2001`, `grafakos-classical-2014`, `simon-trace-ideals-2005`,
  `gohberg-krein-1969`, `reed-simon-1-1980`, `paulsen-2002`, `horn-johnson-topics-1991`,
  `musat-2003`, `jrwz-2020`: uncertified in the manifest; their locators were not read.
- The journal versions of the arXiv texts: not compared; every locator is a line of the arXiv
  version the manifest records.
- The upper bound `2/√3` for the triangular truncation on `M₂` (§3.4): the lower bound was
  computed; the upper bound was not proved here.
- BochnerSpaces is not among the names of the brief's list of open pull requests; it was read
  through `roadmaps show` at its indexed head.

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, printed page 6 (line 249): the source says the class at the larger exponent interpolates between the classes at the smaller exponent and its conjugate; it should be the smaller-exponent class between the larger one and its conjugate; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, printed page 8 (line 348): the source says the conjugation embeds the Schatten class for the smaller measure into itself; it should be into the class for the dominating measure; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at §1.4, printed page 9 (line 359): the source says the product conditional expectation maps onto bounded functions of the larger product σ-algebra; it should be of the smaller one; affects nothing.
- **Error** in lafforgue-delasalle-2011 at Remark 1.6, printed page 7 (line 262): the source says the stabilised symbol has the same completely bounded norm for any σ-finite second factor; it should exclude the zero measure, where every norm is zero; affects nothing.
- **Error** in cgpt-2023 at §1.2 before Lemma 1.3, printed page 8 (lines 375–378): the source says the periodised operator has mean zero for every index; it should be only once the grid cubes have diameter at most the strip width; affects the proof.
- **Misprint** in cgpt-2023 at §1.2 before Lemma 1.3, printed page 8 (line 378): the source says the nonvanishing frequencies lie in the nonzero integers; it should be the nonzero integer vectors of the dimension; affects nothing.
- **Gap** in cgpt-2023 at the proof of Theorem 1.1, printed page 10 (line 506): the source says the Schatten norm equals the limit of the norms after removing the diagonal strip; it should claim only the lower-semicontinuity inequality, which suffices; affects the proof.

## For the human reviewers

- **Licence.** Every locator is a line of an arXiv version; `packages/SchattenClassesAndSchurMultipliers/sources.toml` records the version read for each, and the journal numbering was not compared.
- **Licence.** Nine of the sixteen sources are uncertified (paywalled books and two articles), cited by chapter or theorem number only; no end theorem rests on one of them alone.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "79e7a67254ccf58e9cf462e91db349abac606255", "job": "REV-PKG-SchattenClassesAndSchurMultipliers~3", "model": "fable", "worker": "chris-x55"} -->
