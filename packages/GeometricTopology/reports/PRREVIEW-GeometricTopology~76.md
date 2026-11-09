# Review of GeometricTopology (pull request #903 at 1806dd4)

**Verdict:** needs changes

This is a full review of `1806dd4`. The folder changed by 404 lines since `50f3162`, the head the previous review (r75) read.

## Previous findings (r75)

All seven findings are repaired. Two of the repairs open new questions of ownership (R01 and R02 below).

- **R01 (Levine): repaired.**
  - 6.4 now reads "State Levine's theorem: there is a pattern knot `P ⊂ S¹ × D²` of winding number one …" (`README.md:6390–6397`).
  - The proof goes to Part II's list (`:184–186`).
  - The reduction is now Proposition 1.3 (`:6399–6422`), which matches `levine2016` lines 89–91 and 110–142.
  - Its route has an unowned smoothing step (R01 below).
- **R02 (Subfactors): repaired.**
  - New supplier sections *From TauCetiRoadmap.TemperleyLieb* and *From TauCetiRoadmap.Subfactors* (`:632–653`).
  - 4.5.6 now consumes `markovTrace_nonneg_iff` (Subfactors §3.2).
  - The only new claim, faithfulness at `δ = 2cos(π/k)` for `k ≥ n + 2`, is correct (table).
- **R03 (pinned results restated): repaired.**
  - 1.6, 11.1 and 11.3 cite all seven pinned declarations and keep only what the pin lacks:
    - the transfer of the compact comparison to normed spaces;
    - the infinite stellar homeomorphism;
    - the geometric join laws;
    - the converse of the combinatorial-to-PL theorem.
  - I confirmed that the pin has only the finite stellar case (`Subdivision/Stellar/Homeomorph.lean:53`, hypothesis `hfin`).
- **R04 (missing locators): repaired.**
  - 4.4.7 cites Hatcher, *Algebraic Topology*, Example 1.24, p. 47.
  - 4.7.3 cites Kolay, Exercise 16 and Claims 17–20.
  - 4.7.2 and 4.10.2 carry the "proves its statements" clause.
- **R05 (derivative variable): repaired.** `:3426–3435` fixes `∂ = d/du`, and the Hopf Check (`:3464–3466`) gives `−6` against `−3`.
- **R06 (Mostow ownership): repaired.** `Suggested.lean:31` lists Mostow rigidity among this roadmap's targets, and the README agrees (`:6479–6481`, `:6524–6531`). Its route inputs are unowned (R02 below).
- **R07 (`hΦ` twice): repaired.** `Suggested.lean:149` reads `(hSF : ¬ TauCeti.IsSeifertFibered …)`.

## R01 (P2) — 6.4's reduction smooths a PL disc in a smooth 4-manifold, which no layer owns

**Location.**
- `README.md:6406–6408`: "a PL disc may be taken smooth away from finitely many interior points at which it is the cone on a knot".
- `:6417–6419`: "bounds a PL disc … the annulus followed by the cone on `K'`".
- *Needs:* `:6456` gives "Layer 11.3 (smooth triangulations and PL structures)".

**Claim.** Layer 11.3 supplies the comparison between PL and smooth discs that the reduction uses.

**Witness.**
- 11.3 (`:7494–7508`) triangulates smooth manifolds only. It handles no submanifold pairs and no smoothing of PL submanifolds.
- The Scope gives "the smoothing theory beyond dimension three" to Part II (`:180–181`).
- Levine's own step is "We may assume that ∆ is smooth away from finitely many singular points" (`levine2016` lines 113–115).

**Repair.** Add two targets to 11.3, with hypotheses and a locator for each. Alternatively, put both on Part II's list and write "assuming them" in 6.4.
- A PL disc in a Whitehead-triangulated smooth 4-manifold is PL-isotopic, rel boundary, to one that is smooth away from finitely many interior vertices, each the cone on a knot.
- A smooth compact submanifold of a smooth manifold is a PL submanifold for some Whitehead triangulation (the relative Cairns–Whitehead theorem).

Test case: the cone on a polygonal trefoil in `D⁴` is PL and not locally flat at its apex (link pair `(S³, 3₁)`). It must come out smooth away from the apex.

## R02 (P2) — 7.2 now owns Mostow rigidity in every dimension, but its route's inputs are owned nowhere

**Location.**
- `README.md:6524–6537`: "Prove the pinned proposition `TauCeti.MostowRigidity` … in dimension `n ≥ 4` it is Mostow's quasi-conformal boundary argument (Ratcliffe, Chapter 11)".
- *Needs:* `:6556–6558` lists only Layer 7.1 and "Mathlib singular homology, measure theory".

**Claim.** The proof of the pinned all-dimension proposition is a target of this layer, with every input supplied.

**Witness.** The route uses three results that no target here states and no supplier provides. A search of the README finds no other occurrence of them.
- The boundary extension of a quasi-isometry of `ℍⁿ` to a homeomorphism of `Sⁿ⁻¹`.
- The volume of an ideal simplex is maximal exactly for the regular one: Milnor for `n = 3`, Haagerup–Munkholm for `n ≥ 4`.
- For the `n ≥ 4` route as written, the almost-everywhere differentiability of quasi-conformal maps of `Sⁿ⁻¹`.

The pinned `MostowRigidity` covers every `n ≥ 3` (`Hyperbolic/Mostow.lean:40–76`).

**Repair.**
- State the three inputs as targets of 7.2, with hypotheses and locators: Thurston, Chapter 6 for `n = 3`; Haagerup–Munkholm, *Simplices of maximal volume in hyperbolic n-space*, Acta Math. 147 (1981), for `n ≥ 4`.
- Use Gromov's straightening route in every dimension. It needs no quasi-conformal analysis.
- Add Haar measure on `Isom(ℍⁿ)` and the ℓ¹-norm of real singular chains to *Needs:*.
- Otherwise, keep only `n = 3` here, give `n ≥ 4` to Part II, and say so in `Suggested.lean:31`.

Test case: at `n = 2` every ideal triangle is regular, so the volume step gives nothing. This agrees with the `6g − 6` moduli in the Check at `:6548`.

## R03 (P2) — 8.5.2 is proved unconditionally, but its route consumes two theorems whose proofs this roadmap gives to Part II

**Location.**
- `README.md:7054–7056`: "Prove: for nontrivial prime tame knots `K, J ⊂ S³` … an abstract group isomorphism … implies that their compact exteriors are homeomorphic".
- `:7073–7086` consumes "the relative JSJ statement of 8.5–8.5.1" and "5.4's cyclic surgery theorem".
- The Scope (`:89–90`) claims "the rigidity of prime-knot groups".

**Claim.** This roadmap owns the proof of 8.5.2.

**Witness.**
- 8.5.1 says "The proof belongs to … GeometricTopology, Part II" (`:7031–7032`).
- The cyclic surgery theorem is only stated here (`:72`), and its proof is Part II's (`:173–174`).
- No Part II folder exists on main or in an open pull request.

**Repair.** Do as 6.4 now does for Levine. Write "Assuming the relative JSJ theorem of 8.5.1 and the cyclic surgery theorem of 5.4, prove …", and change the Scope to "the reduction of prime-knot group rigidity to them". Alternatively, add the proof of 8.5.2 to Part II's list (`:171–195`).

## R04 (P2) — Two owners for the finite even-Clifford model of `TL_n` at `δ = √2`

**Location.**
- `README.md:54–57`: "(Layer 4.5.3, which TemperleyLiebOperatorAlgebras consumes)".
- `:7620–7622`: "consumes Layer 4.5.3's finite algebraic Clifford map, scalar trace, radical quotient and braid phases".

**Claim.** TemperleyLiebOperatorAlgebras takes these from 4.5.3.

**Witness.**
- TemperleyLiebOperatorAlgebras at the head of #867, `README.md:853–855`: "The finite algebraic model, its scalar trace, its radical quotient, its coordinate inclusions and its braid phases are targets of this section".
- That README cites GeometricTopology only for Layer 4's closure normalisation (`:365–367`, `:863–864`).
- On main, GeometricTopology has no Clifford model; this pull request adds it.

**Repair.**
- Keep 4.5.3 as the owner. GeometricTopology is earlier in the order, and 4.5.3's Jones–Arf comparison needs the model.
- In the Scope, state the split:
  - 4.5.3 owns `Cl_m⁰`, `s_m`, the radical quotient, coordinate inclusions and braid phases;
  - TemperleyLiebOperatorAlgebras §1.7 adds the analytic adjoint, the comparison with Subfactors §3.3's `Q_n`, and the blocks and tower.
- State in the pull request's description that #903 merges before #867, which must then cite 4.5.3 instead of its own targets.

## R05 (P3) — 8.4 uses `b` for the Euler obstruction, then equates its invariants with Hatcher's `M(±g, b; …)`, where `b` counts boundary components

**Location.**
- `README.md:6960–6963`: "the Euler obstruction `b` when the base is closed … reduce to Hatcher's `M(±g, b; α₁/β₁, …, αₖ/βₖ)`".
- The Check at `:6980` ("genus, `b` and exceptional pairs") uses the same `b`.
- `:6975` lists the family `M(0, 0; 1/2, −1/2, α/β) = M(−1, 0; β/α)`.

**Claim.** The two notations agree.

**Witness.**
- `hatcher-3m` (`3Mfds.pdf`) lines 1147–1149: `b` is the number of boundary components of the base. The Euler number sits in the fractions.
- Line 1265 restricts family (d) to `α, β ≠ 0`.

**Repair.**
- Call the Euler obstruction `e`, and write Hatcher's symbol with his `b` defined as the boundary count.
- Add "for `α, β ≠ 0`" to the last exception.

## R06 (P3) — 8.5.1 gives Theorem 1.9 a page from the other version of Hatcher's notes

**Location.** `README.md:7030`: "Hatcher, *Notes on Basic 3-Manifold Topology*, Theorem 1.9, p. 15".

**Claim.** The page is right in the version that the README fixes (`:7646–7652`, `3Mfds.pdf`).

**Witness.**
- In `3Mfds.pdf`, Theorem 1.9 is on printed page 18 (`hatcher-3m` lines 608, 628).
- Page 15 is its page in `3M.pdf` (cached `3M.pdf` text, line 531).

**Repair.** Write "p. 18".

## R07 (P3) — Three cited Tau Ceti names do not exist at the pin

**Location.**
- `README.md:258`: `TauCeti.IsCombinatorialManifold`.
- `:534`: `TauCeti.homeomorphMulEquivOfEq`.
- `:2104`: `TauCeti.FundamentalGroup.homeomorphMulEquivOfEq`.

**Claim.** These names resolve at the pin.

**Witness.**
- The predicate is `PreAbstractSimplicialComplex.IsCombinatorialManifold` (`CombinatorialManifold/Basic.lean:72, 214`).
- The isomorphism is `FundamentalGroup.homeomorphMulEquivOfEq`: `AlgebraicTopology/FundamentalGroup/Homeomorph.lean:55`, inside `namespace FundamentalGroup` (lines 47–96), outside `TauCeti`.
- The homotopy-group isomorphism is `HomotopyGroup.homeomorphMulEquivOfEq` (`Topology/Homotopy/HomotopyGroup/Homeomorph.lean:95`).

**Repair.** Use these three full names.

## R08 (P3) — 7.3.1's last Check is false for the square lattice it computes

**Location.** `README.md:6672–6674`: "conjugating the ratio changes the oriented class but not the unoriented one (by evaluation)".

**Claim.** On the example `(1, i)`, conjugating the ratio changes the `PGL(2, ℤ)` orbit.

**Witness.** The ratio is `−i`, and its conjugate `i` equals `1/(−i)`, the image of `−i` under `[[0,1],[1,0]] ∈ PGL(2, ℤ)`. The orbit is unchanged, because the square lattice has a reflection symmetry.

**Repair.** Keep the swap statement for `(1, i)`. Show the conjugation effect on `τ = 1/3 + 2i`: `τ̄` lies in the orbit only if `−τ̄ = −1/3 + 2i ∈ SL(2, ℤ)·τ`. Both points are distinct interior points of the standard fundamental domain, so it does not.

## R09 (P3) — Levine's theorem and the mutation statement are stated Kirby-list results missing from the headline bookkeeping

**Location.**
- `Suggested.lean:24–60`, the docstring: "the resolved problems of Kirby's list"; its not-statable list names only Kondo, Novikov–Rosenberg and Zeeman.
- `README.md:6394` (Problem 1.45) and `:6363` (Problem 1.53).
- The Kirby entry of *References* (`:7638–7644`) omits 1.45.

**Claim.** Every resolved Kirby problem the roadmap states is either in `Suggested.lean` or named there as not statable.

**Witness.**
- Levine's Theorem 1.2 answers Problem 1.45 (`levine2016` lines 85–91).
- Piccirillo's theorem answers Problem 1.53.
- Neither is statable at the pins: there is no satellite construction, no mutation and no smooth rational homology ball.
- Neither is named in the docstring.

**Repair.**
- Add both to the docstring's "Not statable at the pins" list, with the missing carriers.
- Add Problem 1.45 to the Kirby entry of *References*.

## Verified sound

**Gate, dependency check and build** (my runs on `1806dd4`):
- Gate: `set_option=0 … depcheck=0 … stray-files=0 … outside-folder=0 source-material=0 OK`, exit 0. The worker's gate also reports `build=0`.
- Dependency check: `depcheck: 238 roadmaps, 2351 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean.**
- I put `#check @` for all 25 theorems in one scratch copy, and `lake env lean` exits 0 with exactly 25 `declaration uses sorry` warnings.
- The types equal the worker's `signatures.md` and the README statements; the only change since r75 is the rename to `hSF`.
- There are no `variable`s, so no section binder can be lost.
- Padding probe: each `sorry` replaced by `first | rfl | simp | infer_instance | decide | trivial | assumption` gives 25 errors out of 25.

**Pinned declarations opened** (`TauCeti` at `2fd255d9`):

| Declaration | File and line |
| --- | --- |
| `IsPLOn.isPiecewiseAffineOn_of_isCompact` | `Topology/PL/Compact.lean:38` (source `ι → ℝ`) |
| `IsPLMap`, `IsPLMap.comp` | `PLGroupoid/Map.lean:155, 250` |
| `hasGroupoid_PLGroupoid_prod` | `PLGroupoid/Product.lean:57` |
| `ClosedUnderRestriction (PLGroupoid I)` | `PLGroupoid/Basic.lean:147` |
| `isPiecewiseAffineOn_inverse_of_finite_simplex_cover` | `Topology/PL/Inverse.lean:48` |
| `relCWComplex` | `Topology/CWComplex/Classical/Image.lean:84` |
| `map_closedStar_eq_join`, `map_closedStar_inf_deletion_eq_join` | `Join/Star.lean:43, 98` |
| `injOn_stellarSubdivisionLinearMap`, `surjOn_stellarSubdivisionLinearMap` | `Stellar/Realization.lean:154, 195` |
| `exists_homeomorph_stellarSubdivision` | `Stellar/Homeomorph.lean:53` (finite only) |
| `IsSmoothTriangulation` | `SmoothTriangulation/Basic.lean:191` (a `Cⁿ` immersion on each simplex, as 11.3 says) |
| `IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid` | `CombinatorialManifold/PL.lean:70` (half-space `{q | 0 ≤ q.2}`, no finiteness) |
| `MostowRigidity` | `Hyperbolic/Mostow.lean:72` |

I resolved all 295 backticked `TauCeti.*` names of the README against a full-name index of the pin. Only the three in R07 fail; the misses besides those are module paths, a scoped namespace or universe-annotated names, each of which exists. Mathlib's `TopologicalSpace.Opens.instHasGroupoid` is at `HasGroupoid.lean:310`.

**Cross-roadmap citations resolved.**
- On main:
  - Subfactors §§3.1–3.3 (`README.md:676–832`; `markovTrace_nonneg_iff`, `jonesLoopParameters` at `Suggested.lean:67, 58`).
  - TemperleyLieb `exists_basis_planarMatching`, `existsUnique_isMarkovTrace`, `isSemisimpleRing_of_qInt_ne_zero`, `isSemisimpleRing_iff_of_charZero` (`Suggested.lean:94, 126, 134, 146`).
  - SuccessiveMinima 1.5 `exists_successiveMin_witnesses`, ReductiveGroups §11A, TypeAHeckeAlgebras H1 and H2.
  - DifferentialGeometry *Boundary and corners* and Layers 3, 4, 5 and 12, and HopfRinow (`Completed/`).
- Neither Subfactors nor TemperleyLieb cites GeometricTopology as a supplier, so there is no cycle.
- KleinianGroups (#432) assigns the volume-measure comparison to Layer 7, which 7.1 states (`:6503–6504`).

**Overlaps.**
- No cited id is dropped by an open pull request, and none is defined only by an open revision.
- The three anchors that other roadmaps cite are mapped at `:702–711`.
- The conflicts with #1517, #1791 and #1797 were settled earlier as not actionable in this folder. That reason holds, so I do not raise them.
- R04 is the overlap new in this head.

**Shape.**
- All 11 layers end with `### Examples` and `### Dependencies`.
- All 124 numbered sections have at least three Check bullets.
- There are no process words, `lemma` or `set_option`.

**Seeded sample** (15 sections, each source opened at the locator):
- **1.2:** Hirsch, Chapter 4, Theorem 6.1 is uncertified; the mathematics is in the table.
- **1.6:** Rourke–Sanderson is uncertified; the pinned compact comparison was opened.
- **2.2:** `brown1960` lines 84–113: Theorems 4 and 5 on p. 76, as cited.
- **4.3.1:** `pyronneau2024` lines 196–231: Lemma 2.11 on p. 4, Lemmas 2.12–2.13, Corollary 2.14 and Theorem 2.15 on p. 5, as cited.
- **4.5.7:**
  - `jones1985` lines 135–140: Theorem 7 on p. 106, with the powers of `σ₁⁻¹σ₂σ₃`.
  - `marin2011` lines 18–25 and 75–89: Coxeter's finiteness of `B₅/⟨σᵢ³⟩ = G₃₂`, and Theorem 1.2's rank 155,520.
- **4.6.2:** no outside locator. The values were recomputed (table).
- **4.8.2:** no outside locator. The values were recomputed (table).
- **4.10.2:** no outside locator. The values were recomputed (table).
- **4.11:** `jones1985`, and Jones's notes §7.5 (read in r75). The closed formula was recomputed.
- **4.13:** `kondo1979` lines 239–277: Theorem 3, system (*) and equation (8) on pp. 557–559. The equations are images in the text, so the α-shift was checked only through the README's own Checks.
- **5.1:** pinned names only; Rolfsen is under *Not verifiable*.
- **7.3.1:** values recomputed (R08); Adams–Hildebrand–Weeks is under *Not verifiable*.
- **8.4:** `hatcher-3m` (`3Mfds.pdf`) lines 707–709 (Proposition 1.12), 811–812 (1.13) and 1260–1266 (Theorem 2.3); see R05.
- **8.5.2:** `friedl2024` lines 27214–27219 (Theorem 16.11) and 27231–27232 (footnote 115), with Lemma 7.3 at line 10008.
- **8.6:**
  - `morgan-tian2007` lines 175–179 (Theorem 0.1) and 189–191 (Corollary 0.2(a), (b));
  - `thurston1982` line 83 (Conjecture 1.1).
- Also checked:
  - `levine2016` lines 85–142 for 6.4;
  - `kolay2019` lines 564–656 for 4.7.3;
  - `hatcher-at` lines 2129–2130 for 4.4.7 (p. 47).

**Adversarial table** (values computed this round; scripts in scratch):

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.2 complement | `n = 1`, `M = ℝ`; `S¹` | `ℝ ∖ (−1, 1)` has 2 components; `S¹` minus a ball is an arc with `∂ = S⁰` | right (`n ≥ 2` needed) |
| 1.6 compact comparison | interpolation of `n²`; `x + x³` | slopes `2n + 1`, unbounded, so there is no finite cover; `f″ = 6x ≠ 0` on `(0, ∞)` | right |
| 2.2 Brown | `n = 1`; horned sphere | `S⁰ ⊂ S¹` gives 2 arcs; the horned sphere is not bicollared | right |
| 4.3.1 Arf algebra | `F₂²`: `xy`, `x² + xy + y²`; `m = 0` | Gauss sums `2`, `−2`; zero counts `3`, `1`; `m = 0` gives `1` | right |
| 4.3.1 dictionary | trefoil `S mod 2`; Hopf `[−1]` | `q = x² + xy + y²`, Arf 1; `q(core) = 1` on the radical, so improper | right |
| 4.5.3 derivative | skein at `u = 1`; Hopf | `∂H₊ − ∂H₋ = 4(−2)^(μ−1) + 2H₀(1)`: self-crossing `0`, mixed `3(−2)^(μ−1)`; Hopf `d/du = −6`, `d/dt = −3` | right |
| 4.5.6 faithfulness `k ≥ n + 2` | `δ = √2`, `n = 2, 3`; `δ = 1` | path dimensions `1 + 1 = 2 = C₂` and `2² = 4 < 5 = C₃`; at `δ = 1`, `g_i ↦ u² − u = −1`, so `σ₁σ₂ ↦ 1` | right |
| 4.5.6 one generator | `tr(g_i)` | `u²/δ − u = −1/δ`; closure `(−δ)(−1/δ) = 1` | right |
| 4.5.7 cubic quotient | `ζ = e^(πi/3)`; `Q₅` at `k = 6` | `(−ζ)³ = 1`; `155520 = 2⁷·3⁵·5 = 6·25920`; blocks 5 and 4 with weights `√3`, `√3`, so `tr(−I₄, I₅) = 1/9`; `g_i³ = −i`, so `ρ(b) = (−i)⁴ = 1` | right |
| 4.5.7 exchange closures | `Uσ_n⁻¹Vσ_n` with `n + 1` components | `π_V(n) = π_U(n) = n`; the last two components meet only at `σ_n^∓1`, so `lk = 0`; `β_(n,p)` has `lk = p ≥ 1` for every pair | right |
| 4.6.2 `σ(K)` | 6 loops with a tree graph; all 32 sign choices | (signature, nullity) `= (−2, 0)` every time; `det(V − Vᵀ) = 1` from the perfect matching `a₁a₂, a₃a₄, bc` | right |
| 4.6.2 `ρ_K` | `l = i`, `m = iz`; `z = 2i` | `∇ = 1 − 2z² − z⁴`, and `−7 = V(−1)` | right |
| 4.7.3 Kolay | `m = 3` | `det A = pq + pr + qr` | right |
| 4.8.2 orientations | `L₄` with one component reversed; `L₋₄` | `lk −2` and Arf `1 + 1 = 0`, against `lk −2` and Arf 1 | right |
| 4.10.2 | S₄ witness; `V₆`, `V₉` | `w = (132)`, `aw² = w²b = (1324)`, `a²b = (14)`, `|⟨a,b⟩| = 24`; both determinants `−2t² + 5t − 2` | right |
| 4.11 torus Jones | `(p, q) = (2, 3)` | `(1 − t²)(t + t³ − t⁴) = t − t⁴ − t⁵ + t⁶ = t(1 − t³ − t⁴ + t⁵)` | right |
| 4.13 solver | `n = 1, 2, 3` | `β = (1)`, `(−1, 2)`, `(1, −4, 6)`; `α` last entry `+ (n − 1)`; rows `[1]`, `(3, −1)`, `(8, −4, 1)`; `p = tⁿ + (t − 1)²Q` holds | right |
| 4.13 family | `V_k`, `k = 1, …, 5`, 6 values of `t` each | `det(V_k − tV_kᵀ) = (−1)^(k−1)(1 − t)^(2k) + t^k`; `det(V_k − V_kᵀ) = 1` | right |
| 5.1 exteriors | Hopf link; empty link | `T² × I` with meridian and longitude exchanged; `S³` with empty boundary | right |
| 6.4 Levine | Theorem 1.2; core pattern; Mazur `Q` | the statement matches line 89; the core pattern gives `Y_P = S³` and `P(U) = U` slice; `Q(U) = U` | right; PL-to-smooth step unowned (R01) |
| 7.2 Mostow | `n = 2`, `g = 2` | `6g − 6 = 6` moduli, so `n ≥ 3` is needed; the pin covers every `n ≥ 3` | right; inputs unowned (R02) |
| 7.3.1 cusps | `(1, i)`; `(1, 2i)`; `τ = 1/3 + 2i` | covolume 1, area `1/h²`, volume `1/(2h²)`; area 2 with loops 1 and 2; `1/(−i) = i`, so conjugation keeps the orbit; `−τ̄ ∉ SL₂(ℤ)τ` | Check false (R08) |
| 8.4 | `3Mfds` lines 1147–1149, 1265 | `b` is the boundary count; `α, β ≠ 0` | notation (R05) |
| 8.5.2 | Whitten via Friedl | Theorem 16.11 as stated; the route needs 5.4 and 8.5.1 | conditional (R03) |
| 8.6 | Poincaré homology sphere | `|π₁| = 120`, not simply connected | right |
| 11.1 infinite fan | `p_i = (1 − 1/i)e₀ + (1/i)e_i` | `p_i → e₀` coordinatewise; in the weak topology each closed edge meets `{p_i}` at most once, so the set is closed | right |
| `property_P`, `property_R` | unknot; slopes | `S³_(1/q)(U) = S³` (so `hK` is needed); `H₁ = ℤ/p`, so only slope 0 can give `S¹ × S²` | right |
| `cyclic_surgery_theorem` | trefoil exterior (Seifert fibred) | Moser's slope `11/2` is cyclic and has distance 2 from `1/0`, so `hSF` is needed | right |
| `sphere_theorem`, `waldhausen_theorem` | `S¹ × ℝP²`; `L(7,1)`, `L(7,2)` | non-orientable counterexample; homotopy equivalent but not homeomorphic, and excluded as not Haken | right |
| `manolescu_…`, `rado_…`, `moise_…` | `n ≤ 3`; torus | `TriangulationConjecture 0` is pinned; the simplicial torus needs `V ≥ 7` | right |
| 25 headlines | `#check`; one-tactic probe | types as in the README; 25 of 25 fail the probe | right |

## Not verifiable

- **Uncertified or unavailable sources:**
  - `hirsch1976` and `rourke-sanderson1972` are uncertified (1.2, 1.6, 11.1, 11.3).
  - `kauffman1990` is image-only.
  - Kirby's problem list (`kirby1997`) could not be rendered. Problem numbers were taken from `levine2016` lines 85 and 142.
- **Rolfsen, *Knots and Links*** (5.1) and **Ratcliffe, *Foundations of Hyperbolic Manifolds*** (7.2): no legal copy found.
  - I could not check whether Ratcliffe's Chapter 11 gives Mostow's quasi-conformal argument for `n ≥ 4`, as 7.2 says, or Gromov's argument for every `n ≥ 3`.
- **Adams–Hildebrand–Weeks** (7.3.1): the sources service found only a JSTOR landing page.
- **Seifert 1933** and **Scott 1983** (8.4, 8.6), **Whitten 1987** (8.5.2), **Schubert 1954** (4.11): not fetched or paywalled.
- **Kondo 1979:** the equations are images, so the α-shift of equation (8) was not read.
- The texts I read through the sources service are not in the package manifest, because this review edits none:
  - `brown1960`, `jones1985`, `marin2011`, `kondo1979`, `pyronneau2024`;
  - `friedl2024`, `morgan-tian2007`, `thurston1982`;
  - `hatcher-3m` as `3Mfds.pdf`.

## Source issues

- **Misprint** in pyronneau2024 at Lemma 2.13, proof, p. 5: the source says the count of value-1 vectors of `φ + q₀` is three times that of `φ` plus `q₀(v)`; it should be `p(φ ⊕ q₀) = 3p(φ) + n(φ)` and `n(φ ⊕ q₀) = 3n(φ) + p(φ)`; affects nothing (the conclusion `r(φ ⊕ q₀) = 2r(φ)` holds).
