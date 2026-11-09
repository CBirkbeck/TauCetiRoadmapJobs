# Review of GeometricTopology (pull request #903 at a6ba299)

**Verdict:** needs changes

This is a full review of `a6ba299`. The folder changed by 178 lines since `fa2b5cc` (r79), all in `README.md`; `Suggested.lean` is unchanged. All four r79 findings are repaired. Two new ownership defects are blocking: R01 and R02, in text that did not change this round, each against another open roadmap's head. R03–R05 are locator and Check repairs.

## Previous findings (r79)

- **R01 (DifferentialGeometry smoothing and Stokes): repaired.**
  - The supplier contract now has the paragraph "Layer 8.3: the smooth singular chains … and the smoothing theorem …; Layer 8.4: Stokes' formula for a smooth simplex …" (`README.md:665–675`), and Scope says so (`:147–151`).
  - 7.2 now integrates "DifferentialGeometry Layer 8.4's Stokes formula for a smooth simplex against `μ`" (`:6709–6711`).
  - 7.2 keeps only "the `ℓ¹` estimates that make DifferentialGeometry Layer 8.3's smoothing isometric" (`:6832–6842`), and its *Needs:* lists Layers 8.3 and 8.4 (`:6822–6824`).
  - DifferentialGeometry on main states `exists_smoothSimplex_homotopicRel`, `smoothing` with both homotopies (`Suggested.lean:2583–2607`, under `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]`) and `SmoothSimplex.integral_mextDeriv` for `IsSmoothForm I 1 φ` (`:2628`). These are the C¹ Stokes and the hypotheses the contract states.
  - The new estimates are right. A face-compatible homotopy `H_σ`, constant on smooth `σ`, gives `s∘j = id` and `‖s‖ ≤ 1`. Its prism operator has `k + 1` simplices per `k`-simplex, so its norm is at most `k + 1`. Every homotopy inverse induces `H(j)⁻¹`.
- **R02 (TemperleyLieb contract): repaired.** The contract now names Layer 2 ("the Temperley–Lieb diagram category …"), Layer 3 and Layer 6, with `existsUnique_jonesWenzl`, the Wenzl recursion and `IsMarkovTrace.apply_jonesWenzl` (`:691–707`). 4.8.1's *Needs:* (`:4765–4767`) and Layer 4's *Dependencies* (`:5861–5862`) match.
  - On main these are TemperleyLieb `README.md:333`, `:485` and `:680`, and `Suggested.lean:158` and `:167`.
  - `qInt R δ n = S_(n−1)(δ)` (`README.md:256–257`). So at `δ = −A² − A⁻²`, `[k] = (−1)^(k−1)(A^(2k) − A^(−2k))/(A² − A⁻²) ≠ 0` in `ℚ(A)`, as the contract says.
- **R03 (Seifert notation): repaired.** `:7285–7298` now reads "Seifert's normalized pairs `(m₁, ν₁), …` … In Hatcher's notation the multiplicity of a fibre is the denominator `βᵢ`". The new Check (`:7318–7321`) contrasts `(2, 1)` with `2/1`.
  - This matches `hatcher-3m` lines 958–961: the meridian disc meets each nearby fibre `βᵢ` times.
- **R04 (figure-eight Check): repaired.** `:7257–7265` now credits "item 1's asphericity", with the obstructions in `π₁` (where the maps agree) and in `π_k = 0` for `k ≥ 2`. It notes that item 2 alone gives only some homeomorphism `h ≃ f`.

## R01 (P2) — FourManifolds §1.4 and this README's 4.3.1 both own the knot and proper-link Arf invariant

**Location.**
- `README.md:2465–2470` (4.3.1): "Its Arf invariant is the proper-link Arf invariant, the knot Arf invariant for μ = 1 … Prove independence of surface, basis and labelling … the determinant–Arf criterion for knots".
- `:7963`: "FourManifolds consumes … Layer 4.3.1's knot/proper-link Arf invariant".

**Claim.** 4.3.1 is the single owner, and FourManifolds consumes it.

**Witness.** At FourManifolds' head (#936, `46ee76a9`), `README.md:32–34` makes "the Arf invariant of a knot or proper link" a target of its §1.4. Its `:538–557` defines it and proves S-equivalence independence and Levine's mod-8 congruence.

**Repair.**
- Keep 4.3.1 as the owner. GeometricTopology is on main, ahead of FourManifolds (`ORDER.txt` line 134). 4.5.3 here consumes the proper-link Arf invariant, so it cannot come from a later roadmap.
- In FourManifolds §1.4 (`README.md:538–572` at #936), replace the definition, the S-equivalence independence and Levine's congruence with a citation of "GeometricTopology Layer 4.3.1 (the knot and proper-link Arf invariant, its independence of the surface, its additivity and the determinant–Arf criterion)". Keep only the vanishing on smoothly slice knots and §4.2's membrane formula.
- #936 then depends on this revision and says so in its description. Its `gap:finite-quadratic-arf` is the first half of 4.3.1 and can cite it.
- Here, extend `:7963` to read "…Layer 4.3.1's knot/proper-link Arf invariant and its determinant criterion, and adds their vanishing on smoothly and topologically slice knots (its §§1.4 and 3.6)".

**Tested.** The two sides use the same normalization, so the citation needs no adapter:
- FourManifolds' trefoil Check (Arf 1, `Δ(−1) = −3 ≡ 5 mod 8`) agrees with 4.3.1's trefoil Check (`q = x² + xy + y²`, Arf 1).
- I recomputed its `T(2, 4)` Checks by Murakami's theorem (`murakami1986` lines 19–26):
  - `σ₁⁴` has `V = −t^(3/2) − t^(7/2) + t^(9/2) − t^(11/2)`, so `V(i) = −√2` (Arf 1).
  - Reversing one component multiplies `V` by `t⁻⁶`, so `V(i) = +√2` (Arf 0).
  - The calibration is the two-component unlink, `V(i) = +√2`.
- These agree with 4.3.1's quotient form, computed in R05.

## R02 (P2) — TemperleyLiebOperatorAlgebras §1.7 and this README's 4.5.3 both own the finite even-Clifford model at `δ = √2`

**Location.**
- `README.md:56–62` (Scope): this roadmap owns "the finite algebraic even-Clifford model … the scalar trace `s_m`, the surjection `F_m` … the coordinate inclusions and the braid phases".
- That model is constructed at `:3447–3465`, and `:7966–7970` says TemperleyLiebOperatorAlgebras consumes it.

**Claim.** 4.5.3 is the single owner, and TemperleyLiebOperatorAlgebras §1.7 adds only analytic structure on top.

**Witness.** At TemperleyLiebOperatorAlgebras' head (#867, `7cf3feef`), `README.md:853–857`: "The finite algebraic model, its scalar trace, its radical quotient, its coordinate inclusions and its braid phases are targets of this section". Its GeometricTopology contract (`:365–367`) names only Layer 4.

**Repair.**
- Keep 4.5.3 as the owner. GeometricTopology precedes TemperleyLiebOperatorAlgebras (`ORDER.txt` line 243), and 4.5.3's Jones–Arf comparison (`:3467–3489`) uses the model.
- In TemperleyLiebOperatorAlgebras §1.7, replace that sentence with: "The finite algebraic model, its scalar trace, radical quotient, coordinate inclusions and braid phases are GeometricTopology Layer 4.5.3's; this section adds the analytic adjoint, the comparison with Subfactors 3.2–3.3 and the tower."
- Add "Layer 4.5.3" to its GeometricTopology contract (`:365`). #867 then depends on this revision and says so in its description.
- Nothing changes here: `:7966–7970` already says this.

**Tested.** The two texts fix the same parameters, so the citation needs no adapter:
- Both use `u = exp(πi/4)`, `δ = √2` and native quantum parameter `−u` (`:3447–3460` here; `:849–850` at #867).
- `e_j ↦ √2 p_j` with `p_j = (1 + i c_j c_(j+1))/2` gives `(√2 p_j)² = 2 p_j = √2·(√2 p_j)`. That is `e_j² = δ e_j` at `δ = √2`, since `(c_j c_(j+1))² = −1` makes `p_j` idempotent.

## R03 (P3) — 4.2.8 gives Artin's *Theory of braids* the wrong page range

**Location.** `README.md:2182–2183`: "Ann. of Math. 48 (1947), 102–115, Theorems 8–16".

**Claim.** The paper occupies pp. 102–115.

**Witness.** Crossref for DOI 10.2307/1969218 gives first page 101. Bohnenblust's paper in the same issue (10.2307/1969219) begins at 127. The README's own References (`:8058`) say "101–126".

**Repair.** Replace "102–115" with "101–126" at `:2183`.

**Tested.** After the repair the inline reference and the References entry agree, and the next article's first page, 127, follows. "The Lemma on p. 103" (`:2113`, `:2130`) then falls inside the paper.

## R04 (P3) — 4.1 cites a homeomorphism theorem for "diffeomorphic complements"

**Location.** `README.md:1637–1639`: "ambient isotopic knots have diffeomorphic complements (`TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic.nonempty_complementHomeomorph`)".

**Claim.** The pinned declaration gives diffeomorphic complements.

**Witness.** At the pin, `KnotTheory/SmoothLink/AmbientIsotopy.lean:279` concludes `Nonempty (↑(L.range)ᶜ ≃ₜ ↑(K.range)ᶜ)`, a homeomorphism.

**Repair.** Write: "ambient isotopic knots have homeomorphic complements (`TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic.nonempty_complementHomeomorph`) and diffeomorphic ones, the final diffeomorphism of the diffeotopy restricting to the complements".

**Tested.** The pinned definition (`SmoothLink/Isotopy.lean:39`) is `∃ Φ : Diffeotopy I ∞ M, ∀ i x, Φ.final (L i x) = K i x`. So `Φ.final` carries `range L` onto `range K` and restricts to a diffeomorphism of the open complements. The citation then covers only the homeomorphism it proves.

## R05 (P3) — 4.3.1 has fewer than three Checks for each of its two definitions

**Location.**
- `README.md:2444–2445`: the finite Arf algebra has one Check, *Planes*.
- `:2472–2476`: the Seifert refinement and proper-link Arf invariant have two, *Trefoil* and *Hopf*.

**Claim.** Each definition has at least three discriminating Checks.

**Witness.** The section's three Check bullets cover two definitions, `Arf(q)` and `q_F` with its proper-link quotient. No Check computes an orthogonal sum or a proper multi-component link.

**Repair.** Add one Check to each list:
- *Orthogonal sum.* "Two anisotropic planes on `F₂⁴` have Arf `1 + 1 = 0`, Gauss sum `(−2)² = 4 = 2²`, and `1·1 + 3·3 = 10` zeros, the count `2³ + 2¹` for Arf 0 and `m = 2`. The wrong definition `Σ(q(aᵢ) + q(bᵢ))` already gives 0 on one anisotropic plane, against its Gauss sum −2 (by evaluation)."
- *Proper link.* "`T(2, 4) = closure(σ₁⁴)` with 4.3's two-disc four-band surface has `V = [[−1,1,0],[0,−1,1],[0,0,−1]]`, `dim H₁ = 3 = 2·1 + 2 − 1`. Its polar radical is spanned by `e₁ + e₃`, with `q(e₁ + e₃) = 0`, so the link is proper. The quotient has `q(e₁) = q(e₂) = 1`, polar 1, so Arf 1. Reversing one component gives the annulus `[2]`, `q ≡ 0` and Arf 0 (by evaluation)."

**Tested.**
- Polar matrix `[[0,1,0],[1,0,1],[0,1,0]]` mod 2 has kernel `{v₂ = 0, v₁ = v₃}`, and `q(1,0,1) = 1 + 1 = 0`.
- The values Arf 1 and Arf 0 match `V(i) = −√2` and `+√2` computed by state sum in R01.
- The zero count 10 is `|{both 0}| + |{both 1}| = 1 + 9`.

## Verified sound

**Gate and dependencies.**
- My gate run on `a6ba299` ends `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate adds `build=0`.
- `--depcheck --movable` prints `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`, exit 0, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- Every supplier is on main: DifferentialGeometry, TypeAHeckeAlgebras, TemperleyLieb, Subfactors, ReductiveGroups and SuccessiveMinima, with HopfRinow under `Completed/`.

**Lean.**
- **Elaboration.** A scratch copy with `#check @…` for all 26 theorems elaborates with exactly 26 `declaration uses sorry` warnings and no error. The file has no section `variable`; the printed types equal `signatures.md` (whose 27th entry, "`,`", is a parse artifact) and the README statements.
- **Padding probe.** Replacing every `sorry` by `first | rfl | simp | infer_instance | decide | trivial | assumption` gives 26 errors at the 26 tactic lines, so none of the 26 closes in one tactic.
- **Headlines.** The end theorems of `:14–24` are all stated:
  - Smale and Watanabe; the annulus theorem; Freedman and Levine;
  - Mostow; Agol's two theorems; JSJ, geometrization and Poincaré;
  - Li; Gabai–Meyerhoff–Milley; Property P and Manolescu;
  - Alexander, the knot-group theorem and Gordon–Luecke.

  So are Property R, cyclic surgery, Kneser, Milnor, Radó, Moise, the sphere theorem and Waldhausen. The docstring names the headlines it does not state and the carrier each lacks: Levine's satellite theorem, mutation versus concordance, Kondo and Novikov–Rosenberg. Zeeman is statable but open.

**Pinned declarations opened this round** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`):

| Declaration | File:line, what it says |
| --- | --- |
| `Diffeomorph.continuous_trans`, `continuousMul` | `Geometry/Diffeomorphism/Composition.lean:57`, `:67`; `[CompactSpace M] [LocallyCompactSpace E]` |
| `Diffeomorph.continuous_symm`, `isTopologicalGroup` | `Inversion.lean:215`, `:241`; adds `[T2Space M]` |
| `continuousEval_weakWhitney`, `isClosed_fixingSubgroup`, `Diffeotopy.toPath` | `Evaluation.lean:37`, `FixingSubgroup/Topology.lean:41`, `Diffeotopy/Path.lean:63` |
| `SmoothLinkEmbedding.SmoothAmbientIsotopic` | `KnotTheory/SmoothLink/Isotopy.lean:39`; exact parametrized transport by `Φ.final` |
| `…SmoothAmbientIsotopic.nonempty_complementHomeomorph` | `SmoothLink/AmbientIsotopy.lean:279`; homeomorphism (R04) |
| `BraidWord.closure`, `overPair_closure` | `KnotTheory/BraidWord/PDCode.lean:390`, `:478`; positive letter: lower-position strand over |
| `knotExterior`, `linkExterior`, `unknotExteriorHomeomorph` | `SolidTorusNeighborhood/Exterior.lean:73` (complement of the open image), `Link/Exterior.lean:71`, `Unknot.lean:175` |
| `hasGeometricStructure_quotient` | `Riemannian/GeometricStructure/Basic.lean:84`; free and properly discontinuous |
| `IsWeeksManifold`, `GabaiMeyerhoffMilleyTheorem` | `Link/Weeks.lean:95` (coefficients `5`, `5/2`); `Hyperbolic/Weeks.lean:77` (orientable `M`) |
| `TauCeti.SmoothSimplex`, `smoothSingularSubcomplex` | `Geometry/Manifold/SmoothSingular/Basic.lean:77`; local smooth extension near `Δᵏ`, the definition of DifferentialGeometry 8.3 |
| Mathlib `FundamentalGroup.mul_def` | `AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44`: `p * q = q.trans p` |
| Mathlib `Equiv.Perm.mclosure_swap_castSucc_succ` | `GroupTheory/Perm/Sign.lean:126` |

The gate's `readme-ids-missing=0` and `roadmaps resolve` report every backticked name found.

**Cross-roadmap citations** (resolved on main `8d9e0a0c`):
- DifferentialGeometry 8.3–8.4: `README.md:836–851`, `Suggested.lean:2583`, `:2603`, `:2628`.
- TemperleyLieb: Layers 2, 3, 6 at `:333`, `:485`, `:680`; `Suggested.lean:158`, `:167`.
- Subfactors §§3.1–3.3: `:676`, `:697`, `:774`; `jonesLoopParameters` `Suggested.lean:58`; `markovTrace_nonneg_iff` `:67`.
- SuccessiveMinima: `exists_successiveMin_witnesses` `Suggested.lean:275`.
- ReductiveGroups 11A: `:1971`.
- TypeAHeckeAlgebras H1, H2: `:40`, `:143`.
- HopfRinow: in `Completed/`.

**Ownership and overlaps.**
- I ran `roadmaps grep` for Kauffman polynomial, adequate diagram, measure homology, bounded cohomology, cusp shape, Fox colouring, Garside and Levine–Tristram. Outside this folder, "bounded cohomology" means only derived-category boundedness.
- I read the open heads of FourManifolds (#936) and TemperleyLiebOperatorAlgebras (#867): R01 and R02.
- KhovanovHomology (#1187) consumes Layer 4 only, at its lines 22–29.
- GeometryOfNumbersAndQuadraticArithmetic (#851) cites 4.3.1 as the owner of the finite Arf algebra.
- No cited id is dropped by an open pull request, and none is defined only by an open revision.
- The three anchors other roadmaps cite are mapped at `:770–779`.
- #1517, #1791 and #1797 change this folder and conflict with this head. They branch from main's 1,173-line README, so this pull request merges first and each of them rebases on it. This was settled earlier as not actionable in this folder.

**Shape.**
- All 124 numbered sections have a *Needs:* line and Checks; 4.2.2 and 4.3 carry theirs in `####` subsections.
- All 11 layers end with `### Examples` and `### Dependencies`.
- A scan of the 126 Check blocks finds fewer than three bullets only in 4.3.1 (R05) and in two `####` subsections whose parents have their own blocks.
- There is no process wording, LaTeX or `lemma` (gate).

**Seeded sample** (each opened at its locator):
- **3.1:** pinned hypotheses as stated. Hirsch Ch. 2 §1 is uncertified.
- **4.1:** R04. Lickorish Ch. 2 is uncertified.
- **4.2.7:** `bode2018` §2.1, Definitions 2.2–2.4 at lines 468–489 (printed p. 8) support continuous versus smooth isotopy.
- **4.2.8:** R03.
- **4.3.5:** Collins, fetched from Edinburgh into a scratch manifest. Diagonal rules at lines 290–296, cases 1–5 at lines 305–345; each of the README's five rules matches.
- **4.4:** `mul_def` gives the stated deck action. Lickorish Theorems 6.5 and 8.6 are uncertified.
- **4.4.4:** proved here; recomputed (table).
- **4.4.9:** Friedl, *Topology* (author's page, scratch manifest), Lemma 7.3 on p. 97: the mirror's meridian is `ρ(μ)^rev` and its longitude `ρ(λ)`.
- **4.5.5:** proved here and from hypotheses; recomputed by state sum (table).
- **4.6.5:** `fyhlmo1985` p. 244 (line 240) has `(1 − μ²)(S+T)_N = (S_N T_D + S_D T_N) − μ(S_N T_N + S_D T_D)`, as stated.
- **4.7.8:** Lecuona–Wand §2 (arXiv HTML) has the knot-parity criterion, cyclic and reversal isotopies, and other orders as mutants. FYHLMO p. 244 has pretzel permutation invariance (`fyhlmo1985` lines 234–235).
- **4.8.2:** proved here; recomputed (table).
- **5.1:** pinned carriers (table). Rolfsen is not fetched.
- **7.1:** no outside citation.
- **7.4:**
  - `gmm2009` Theorem 1.1 (line 52; Weeks as the (5,1), (5,2) filling, `v₁ = 0.9427…`, line 55).
  - `agol2013` Theorems 9.1 and 9.2 (lines 662–665).
  - The pinned GMM proposition assumes `Orientable (𝓡 3) M`, matching "closed orientable".

Two sections outside the sample were also checked:
- **4.5.1:** `jones1985` (AMS open archive, scratch manifest), Theorems 21–22 and Corollary 24 on p. 108 (lines 215–229). The README's formulas match Theorems 21–22. Its refutation of Corollary 24 is right (table, *Source issues*).
- **8.4:** `hatcher-3m` lines 950–967 (R03 of r79).

**Adversarial table** (values computed this round):

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 3.1 weak vs `C¹` | `θ + k⁻² sin kθ`; `S⁰` | `f′ = 1 + k⁻¹cos kθ ≥ ½`; `C¹` distance `≤ k⁻² + k⁻¹ → 0`; `sup |f″| = 1`; 2 of 4 maps | right |
| 4.1 | trefoils; square, granny | `V`: `t+t³−t⁴` vs `t⁻¹+t⁻³−t⁻⁴`; `σ = 0, −4`; both `Δ = (t−1+t⁻¹)²` | right; R04 on citation |
| 4.2.7 | `f_t = t·a(s/t)` | `‖f_t − e‖ ≤ t + t = 2t`; `∂_s f_t(tu₀) = a′(u₀)` for every `t` | right |
| 4.2.8 | `A_0`; wrong side; inverse; `σ₀²` | `x_a x_b ↦ x_a x_b`; `↦ x_a⁻¹x_bx_a²`; `A(x_b⁻¹x_ax_b) = x_b`; `x₀ ↦ x₀x₁x₀x₁⁻¹x₀⁻¹` | right; R03 on pages |
| 4.3.5 | `σ₀³`; empty; one letter | `[[−1,0],[1,−1]]`, reversed `[[−1,1],[0,−1]]`, `det(tV−Vᵀ) = t²−t+1`; `rank+n = ℓ+c`: `2+2 = 3+1`, `0+n = 0+n`, `0+2 = 1+1` | right |
| 4.4 | `T(2,n)`; `3₁`, `4₁`, `T(2,5)` | `Σ_(j<n)(−t)^j` at `−1` is `n`, `0` at `n = 0`; dets `3, 5, 5`; `det(V+Vᵀ) ≡ det(V−Vᵀ) = 1 (2)` | right |
| 4.4.4 | `V` | `Δ = 64t⁻²−272t⁻¹+417−272t+64t²`; `Δ(1) = 1`, `Δ(−1) = 1089`; pivots `4, −41/4, 180/41, −121/20`, `σ = 0`; `∇ = 1−16z²+64z⁴`; `(8t−17+8t⁻¹)²` | right |
| 4.4.9 | `G = ⟨x,y∣xyx=yxy⟩` | `(xy)³ = (xyx)² ↦ 6`; `λ₊ ↦ z⁻¹x⁶ = λ₋`; `V(1) = 1`, `V(−1) = −3` both | right |
| 4.5.5 | b41; `σ₁⁻⁹`; `R_c`; `G` | state sum of b41 equals `F` term by term; `F(±1) = 1, 49`; `E` support `[−13,−4]`, `E(−1) = 9`; `R_c(1) = 3+c`, `R_c′(1) = 2+c`, `R_c(−1) = 15−c`; `G(−1) = −7` | right |
| 4.5.1 | threshold word; Squier | `e = 14−5 = 9`; Burau `Δ` equals the Check; `Δ(ζ) = 6.9311… = 36−13√5 > 6.5`; minors `½`; `0.618, 0.236` | right; Jones Cor. 24 false |
| 4.5.2 | `σ₁²`, `σ₁³`, empty | `[1,7]`, `−u−u⁵`; `[2,10]`, `u²+u⁶−u⁸`; `±(n−1)`; weight exponent `p−q+r₊−r₋` | right |
| 4.6.5 | `S = aE+bF`, `T`; half-turns; `l=−1, m=2` | `(1−μ²)N(ST)` equal on both sides; `D(ST) = (a+μb)(c+μd)`; adjacent det `l⁻²(1−μ²)`; `(03)(12)·(01)(23) = (02)(13)`; `μ = 1` | right |
| 4.7.8 | all `a ∈ [−3,3]^r`, `r ≤ 5` | component count `e`, or 1/2 for `e = 0`: 0 mismatches over 19,607 lists | right |
| 4.8.2 | `L_4`, `L_(−4)`, `L_4` reversed | `∇ = 2z+z³`, `−2z−z³`, `−2z`; `V(i) = −√2, −√2, +√2` (unlink `+√2`): Arf `1, 1, 0` | right |
| 4.3.1 | planes; `T(2,4)` | Arf 0/1, Gauss `2/−2`, zeros 3/1; radical `e₁+e₃`, `q = 0`, Arf 1 | right; R05 |
| 5.1 | empty link; Hopf | `⋂` over empty index `= univ`; exterior `T²×I`, meridian = other longitude | right |
| 7.1 | genus 2; cusp | `2π·2 = 4π`; `A∫₁^∞ y⁻³dy = A/2` | right |
| 7.2 estimates | prism; smoothing | `k+1` simplices per `k`-simplex; `‖s(c)‖₁ ≤ ‖c‖₁` | right |
| 7.4 | Weeks | `lk = 0` gives `H₁ = ℤ/5 ⊕ ℤ/5`; `0.9427 < 1.0149 < 2.0299` | right |
| 8.4 notation | `(2,1)` vs `2/1` | multiplicity 2 vs regular | right |
| `property_P`, `property_R` | unknot `1/q`; `p/q` | `S³` (so `hK` is needed); meridian gives `S³` (so `hs`); `H₁ = ℤ/|p|`, only `p = 0` gives `ℤ` | right |
| `cyclic_surgery_theorem` | trefoil `11/2` | `|11 − 6·2| = 1`: lens space at a non-integral slope, so `hSF` is needed | right |
| `gordon_luecke`, knot-group theorem | trefoils; trefoil group | complements related by a reflection, which `e` may be; group onto `S₃`, not `ℤ` | right |
| `waldhausen_theorem`, Poincaré, Manolescu | `L(7,1)`, `L(7,2)`; `ℝ³`; `n = 3` | `1·2 ≡ 3² (7)`, `2 ∉ {±1}`, not Haken; excluded by `CompactSpace`; Moise, so `5 ≤ n` is needed | right |
| 26 headlines | `#check`; one-tactic probe | types as in README; 26 of 26 fail | right |

## Not verifiable

- **Artin, *Theory of braids*:** the README's link is a copy on A. Ranicki's page, which the sources service puts in no licence class. Only the page range was checked, by Crossref (R03). Theorems 1–16 and the Lemma on p. 103 were not read.
- **Uncertified** (cited by locator only): `hirsch1976` (3.1), `kauffman1987`, `rourke-sanderson1972`, `thurston1986`, `gabai1983`, `htw1998`, `lickorish1962`, `lickorish1964`, `farb-margalit2012`, `haagerup-munkholm1981`, `monod2001`.
- **Not in the manifest, not fetched:**
  - Lickorish's *An Introduction to Knot Theory* (Theorems 6.5 and 8.6, 4.4);
  - Rolfsen (5.1);
  - Birman–Brendle (4.2.8).
- **Image-only:** `kauffman1990` (4.6.1); OCR is not available on this worker.
- **Read into a scratch manifest only** (this review edits no manifest):
  - Collins (Edinburgh, institutional);
  - Friedl's *Topology* notes (author's page);
  - Jones 1985 (AMS open archive);
  - Lecuona–Wand §2 (arXiv HTML).

  The package manifest has no entries for them, though the README cites them; recording them is a worker-level manifest fix.

## Source issues

- **Error** in jones1985 at Corollary 24, p. 108: the source says a knot with `Δ(e^(2πi/5)) > 6.5` is not a closed 4-braid; it should be: the valid bound is 8, since a 19-letter 4-braid closes to a knot with `Δ(ζ) = 36 − 13√5 ≈ 6.93`; affects a stated result.
- **Misprint** in bode2018 at Definition 2.4, p. 8: the source asks only that the time slices of a smooth ambient isotopy be homeomorphisms, with the time-0 condition put on the knot; it should ask for diffeomorphisms with the identity at time 0; affects nothing.
