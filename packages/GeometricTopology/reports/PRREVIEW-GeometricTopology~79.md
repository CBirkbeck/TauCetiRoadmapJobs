# Review of GeometricTopology (pull request #903 at fa2b5cc)

**Verdict:** needs changes

This is a full review of `fa2b5cc`. The folder changed by 154 lines since `68bf156` (r78), all in `README.md`; `Suggested.lean` is unchanged. All six r78 findings are repaired. The new 7.2 text has one ownership defect (R01). R02–R04 are in text that did not change.

## Previous findings (r78)

- **R01 (Garside uniqueness): repaired.** `README.md:5524–5530` now excludes the trivial factors: "`s₁, …, s_r` positive permutation braids other than `1` and `Δ_n` forming a left-weighted sequence, `S(s_(i+1)) ⊆ F(s_i)`", for `n ≥ 2`.
  - The *Proper factors* Check (`:5541–5546`) is right: `Δ₃ = Δ₃¹ = Δ₃⁰·Δ₃` and `σ₁ = σ₁·1` are excluded, `B₂` gives `σ₁^k`, and `Δ₁ = 1` leaves `k` free.
  - I recomputed `Δ₃σ₁σ₂⁻¹ = σ₂Δ₃σ₂⁻¹ = σ₂σ₂σ₁`, so `σ₁σ₂⁻¹ = Δ₃⁻¹·σ₂·(σ₂σ₁)`, with `S(σ₂σ₁) = {σ₂} = F(σ₂)`.
- **R02 (closed forms): repaired.** `:6681–6686` reads "so for a closed form (`dω = 0`) it depends on cycles only through their class".
  - The new `T²` Check (`:6770–6775`) gives `∫_c ω = ∫∫_[0,¼]² 2π cos(2πx) = ¼ · sin(π/2) = ¼` against `0`.
- **R03 (Löh's route inputs): repaired, with a new defect.** `:6798–6816` now lists:
  - Theorems 3.3 and 3.5, Remark 3.6, Definitions 3.7–3.9, Lemmas 3.10–3.11 and Theorem 4.1;
  - Monod 7.4.5 and 7.2.6;
  - Zastrow Theorem 3.4 and Layer 11.3.

  The topology is now Löh's Definition 5.1, built on the pinned `TauCeti.SmoothSimplex`. Every locator matches (see *Verified sound*). The same paragraph also makes Löh's Proposition 5.3 a target here, but that proposition is DifferentialGeometry's smoothing theorem (R01 below).
- **R04 (MFW span): repaired.** `:4649–4654` now uses the HOMFLY `v`-span and states `P(T(3,4))`.
  - At `v = 1`, `P` gives `∇ = 1 + 5z² + 5z⁴ + z⁶`, which is `t³ − t² + 1 − t⁻² + t⁻³`, the Alexander polynomial of `T(3,4)`.
  - At `v = t`, `z = t^½ − t^−½`, it gives `V = t³ + t⁵ − t⁸`.
  - The `v`-exponents `6, 8, 10` fill `[w − k + 1, w + k − 1] = [6, 10]`.
- **R05 (4.8 *Needs:*): repaired.** `:4658–4659` adds "Layer 4.7.1 (the unknotting number `u(K)` and the bridge number `br(K)`)".
- **R06 (unknot Check in 5.4): repaired.** `:6017–6022` uses `∞` and `1/2` at distance `|1·2 − 0·1| = 2`, and `5/2` against `1/2` at `|5·2 − 2·1| = 8`. These are `L(1,2) = S³` and `L(5,2)`, cyclic, along non-integral slopes, so the Check now discriminates.

## R01 (P2) — 7.2 re-plans DifferentialGeometry's smoothing theorem and leaves its simplex Stokes formula uncited

**Location.**
- `README.md:6799–6802`: "and so are the inputs of Löh's route: the isometric isomorphism between smooth singular and singular homology by Whitney smoothing (Löh, Proposition 5.3) and its dual for bounded cohomology (Löh, Proposition 5.5)".
- `:6681–6682`: measure chains satisfy "Stokes' formula `∫_(∂μ) ω = ∫_μ dω`".

**Claim.**
- The Whitney-smoothing comparison of smooth singular with singular homology is a target of this section.
- The measure-chain Stokes formula needs no supplier.

**Witness.** DifferentialGeometry on main (`19d2a1c7`, `README.md:836–848`) owns `smoothing` with both chain homotopies (Layer 8.3, Lee 18.7) and `SmoothSimplex.integral_mextDeriv` (Layer 8.4). Neither is pinned (`:607`) or in this README's DifferentialGeometry contract (`:651–658`).

**Repair.**
- Under *From TauCetiRoadmap.DifferentialGeometry* (`:653–658`), add: "Layer 8.3: the smoothing chain map `smoothing` from singular to smooth singular chains, with its two chain homotopies (Lee, Theorem 18.7), for Hausdorff σ-compact finite-dimensional `M`. Layer 8.4: Stokes for a smooth simplex, `SmoothSimplex.integral_mextDeriv`, and for smooth chains. Layer 7.2 consumes both."
- At `:6799–6802`, replace "the isometric isomorphism between smooth singular and singular homology by Whitney smoothing (Löh, Proposition 5.3) and its dual for bounded cohomology (Löh, Proposition 5.5)" with "the norm estimates that make DifferentialGeometry Layer 8.3's smoothing isometric: it sends each singular simplex to a single smooth simplex, and its chain homotopy to the identity is bounded in each degree. These give Löh's Propositions 5.3 and 5.5."
- At `:6682`, write "it satisfies Stokes' formula `∫_(∂μ) ω = ∫_μ dω`, by integrating DifferentialGeometry Layer 8.4's `SmoothSimplex.integral_mextDeriv` against `μ`".
- Add DifferentialGeometry Layers 8.3 and 8.4 to 7.2's *Needs:* line.

**Tested.** Löh's proof of Proposition 5.3 (`loeh2006` lines 616–623) uses four facts:
1. `s` is a chain map;
2. `s ∘ j = id`;
3. `j ∘ s ≃ id`;
4. each `s(σ)` is one smooth simplex.

After the repair, facts 1–3 come from DifferentialGeometry 8.3 and fact 4 is the target kept here. Proposition 5.5 (lines 640–649) needs in addition only the boundedness of the homotopy, also kept here.

## R02 (P3) — The TemperleyLieb supplier contract omits Layers 2–3 and 6, which 4.8.1 consumes

**Location.**
- `README.md:674–681` lists "Layer 4: …" and "Layer 5: …", consumed by "Layers 4.5.1, 4.5.3 and 4.5.6".
- `:4700–4701`: "From TemperleyLieb Layers 2–4 and 6's Jones–Wenzl f_r, prove through the marked annular closure".

**Claim.** The contract names every TemperleyLieb section this roadmap consumes.

**Witness.** TemperleyLieb on main has Layer 6, *Jones–Wenzl projections* (`README.md:680`), with `existsUnique_jonesWenzl` and `IsMarkovTrace.apply_jonesWenzl` (`Suggested.lean:158`, `:167`). 4.8.1 uses these for `C_r` and `θ_r`, but the contract names neither.

**Repair.** Add to *From TauCetiRoadmap.TemperleyLieb*:

> Layers 2–3: the diagram category and the linear category `TL(R, δ)`. Layer 6: the Jones–Wenzl projections, `existsUnique_jonesWenzl` (when `[1], …, [n]` are units), the Wenzl recursion and `IsMarkovTrace.apply_jonesWenzl` (`tr̂(f_n) = [n+1]`). Layer 4.8.1 consumes them for the colored cabling over `ℚ(A)`.

**Tested.** After the repair, every TemperleyLieb citation in the README falls in a listed layer: `:3334`, `:3362`, `:3492`, `:3662`, `:3690`, `:3731` (Layers 4–5) and `:4700`, `:4739` (Layers 2–4 and 6).

## R03 (P3) — 8.4 gives `αᵢ, βᵢ` opposite roles in Seifert's pairs and Hatcher's fractions

**Location.** `README.md:7236–7244`: "the normalized pairs `(α₁, β₁), …, (αₖ, βₖ)` of the exceptional fibres … reduce to Hatcher's `M(±g, b; α₁/β₁, …, αₖ/βₖ)` … a fraction with `βᵢ = 1` recording a regular fibre".

**Claim.** The same symbols carry over from Seifert's pairs to Hatcher's fractions.

**Witness.** Seifert's normalized pair puts the multiplicity first (`0 < β < α`), so `(2, 1)` is exceptional. Hatcher's multiplicity is the denominator `βᵢ` (`hatcher-3m` line 959; `3Mfds.pdf` p. 33), so `2/1` is regular, as `:7244` says.

**Repair.**
- Write Seifert's pairs as `(aᵢ, bᵢ)`, with `aᵢ ≥ 2` the multiplicity and `0 < bᵢ < aᵢ`.
- Add: "in Hatcher's notation the multiplicity of a fibre is the denominator `βᵢ` of its fraction".
- Add a Check: "a fibre of multiplicity `2`, Seifert's normalized pair `(2, 1)`, has a Hatcher fraction with denominator `2`, such as `1/2`, while Hatcher's `2/1` records a regular fibre".

**Tested.** After the renaming, `(2, 1)` and `2/1` no longer share symbols. The trefoil exterior's multiplicities `2, 3` (`:7262`) are then the denominators in Hatcher's notation.

## R04 (P3) — 8.3.1's figure-eight Check credits item 2 with what asphericity gives

**Location.** `README.md:7214–7216`: "A self-homotopy equivalence of the figure-eight knot exterior that is the identity on the boundary torus and induces the identity on `π₁` is homotopic relative to the boundary to the identity, by item 2."

**Claim.** Item 2 yields this conclusion, so the Check tests item 2.

**Witness.** Item 2 (`:7183–7186`) returns some homeomorphism `h` with `h|∂M = b` and `f ≃ h` relative to `∂M`; nothing makes `h` the identity. The conclusion follows from item 1's asphericity alone, so it would hold with item 2 misstated.

**Repair.** Replace "by item 2" with:

> by item 1's asphericity: two maps into an aspherical space that agree on the connected boundary and induce the same homomorphism of `π₁` at a boundary basepoint are homotopic relative to the boundary; item 2 alone gives only some homeomorphism `h ≃ f`.

**Tested.** With this attribution the Check holds by obstruction theory. The obstructions lie in `Hᵏ(M × I, M × ∂I ∪ ∂M × I; π_k M)`. For `k = 1` they vanish by the `π₁` hypothesis; for `k ≥ 2`, `π_k M = 0`.

## Verified sound

**Gate, dependencies, build.**
- My gate run on `fa2b5cc` ends `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate also reports `build=0`.
- `--depcheck --movable` prints `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean.**
- I put all 26 theorems, each with `#check @…`, into one scratch copy. `lake env lean` exits 0 with exactly 26 `declaration uses sorry` warnings and no error.
- The file has no section `variable`s, so every binder is in its signature. The elaborated types match the README statements and `signatures.md`; nothing changed since r78.
- **Padding probe.** I replaced every `sorry` with `first | rfl | simp | infer_instance | decide | trivial | assumption`. That gave 26 errors at the 26 tactic lines, so 26 of 26 fail.
- Every theorem name appears in the README in backticks.

**Headlines.** The README's end theorems (`:14–24`) are all stated:
- Smale and Watanabe; the annulus theorem; Freedman and Levine's homology-concordance theorem;
- Mostow; Agol's two theorems; JSJ, geometrization and Poincaré;
- Li; Gabai–Meyerhoff–Milley; Property P and Manolescu;
- Alexander, the knot-group theorem and Gordon–Luecke.

So are Property R, the cyclic surgery theorem, Kneser, Milnor, Radó, Moise, the sphere theorem and Waldhausen. The module docstring names, with the missing carrier for each, the headlines it does not state:
- Levine's satellite theorem, mutation versus concordance, Kondo and Novikov–Rosenberg (not statable);
- Zeeman (statable but open).

**Pinned declarations opened this round** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`):

| Declaration | File:line, what it says |
| --- | --- |
| `TauCeti.smoothSingularSubcomplex`, `TauCeti.SmoothSimplex` | `Geometry/Manifold/SmoothSingular/Basic.lean:77`, `:121`; smooth near each point of `Δᵏ` (`ContMDiffOnSubset`) |
| `TauCeti.uniqueDiffOn_fullSimplex` | `Geometry/Convex/FullSimplex.lean:81` |
| `TauCeti.SmoothSimplex.integral` | `SmoothSingular/Integral.lean:86`; linear and natural; no Stokes formula |
| Stokes at the pin | `DifferentialForm/Integration/Chart/Stokes.lean:98` (top forms in charts); `Analysis/Calculus/DifferentialForm/Stokes.lean` (rectangles, annuli); none for simplices |
| `trefoilSeifertMatrix`, `figureEightSeifertMatrix` | `KnotTheory/Alexander.lean:613`, `:630`: `!![-1,1;0,-1]`, `!![1,1;0,-1]` |
| Handlebody and Heegaard names (`nonempty_homeomorph_handlebody_zero/one`, `heegaardGenus_sphere`, `RankGenusConjecture`, `rank_fundamentalGroup_le_heegaardGenus`) | `LowDimTopology/Handlebody/`, `LowDimTopology/Heegaard/` |
| `Group.Presentation`, `presentedGroupEquiv`, `isFinitelyPresented_iff_exists_finite_presentation` | Mathlib `GroupTheory/Presentation.lean:52`, `:89`, `:99` |
| `Group.IsFinitelyPresented`, `Group.Generators`, `IsMulFG`, `Group.FG`, `Subgroup.normalClosure` | `FinitelyPresentedGroup.lean:95`, `Generators.lean:59`, `Finiteness.lean:73`, `:693`, `Subgroup/Basic.lean:634` |

- A mechanical scan of all 302 backticked `TauCeti.*` names in the README found every one at the pin. Nine are module paths and `TauCeti.DiffeomorphWeakWhitney` is a scoped namespace.
- Mathlib has no `Subgroup.exists_list_of_mem_closure`, so 4.4.3's normal-closure lemma is not a restatement.

**Cross-roadmap citations** (resolved on main `19d2a1c7`):
- DifferentialGeometry: *Boundary and corners* `:63`; Layers 3, 4, 5 and 12 at `:371`, `:402`, `:503`, `:910`; 8.3 and 8.4 at `:836`, `:845`.
- HopfRinow (`Completed/`): Layers 1–3 at `:264`, `:427`, `:451`.
- TypeAHeckeAlgebras: H1 `:40`, H2 `:143`.
- TemperleyLieb:
  - Layers 2–6 at `:333`, `:485`, `:545`, `:606`, `:680`;
  - `Suggested.lean` names at `:94`, `:126`, `:134`, `:146`, `:158`, `:167`.
- Subfactors: §§3.1–3.3 at `:676`, `:697`, `:774`; `jonesLoopParameters` `:58`; `markovTrace_nonneg_iff` `:67`.
- ReductiveGroups: 11A `:1971`.
- SuccessiveMinima: `exists_successiveMin_witnesses` `:275`.
- `roadmaps resolve` reports nothing missing.

**Ownership.**
- `roadmaps grep` for bounded cohomology, measure homology, relatively injective and Milnor–Thurston finds no second owner of 7.2's new targets. BanachAlgebras Layer 6 (main) is bounded Hochschild cohomology of Banach algebras, a different object.
- Overlaps:
  - No cited id is dropped by an open pull request, and none is defined only by an open revision.
  - The three anchors cited elsewhere (RealAnalyticGeometry, KhovanovHomology, RiemannianGeometry) are mapped at `:744–753`.
  - The conflicting heads #1517, #1791 and #1797 were settled earlier as not actionable in this folder.
  - TeichmullerGeometry's citations of 1.7.2, 3.4 and 11.2.1 items 2 and 5 exist.

**Shape.**
- All 124 numbered sections have a *Needs:* line and Checks; 4.2.2 and 4.3 carry theirs in their `####` subsections.
- All 11 layers end with `### Examples` and `### Dependencies`.
- There is no process wording, LaTeX or `lemma`.

**Seeded sample** (each source opened at its locator):
- **2.2:** Brown 1960 (AMS open archive): Theorem 4 (two inverse sets ⇒ cellular) and Theorem 5 (each side of a bicollared sphere has an `n`-cell closure), both on p. 76.
- **4.2.6:** counts recomputed (table). Burton et al. was not fetched.
- **4.2.9:** proved here; recomputed.
- **4.3.3:** proved here; recomputed.
- **4.4.3:** Mathlib API at the pin (above).
- **4.4.7:** `hatcher-at` Example 1.24 on printed p. 47 (line 2130).
- **4.7:** `kolay2019` §4, Proposition 4, p. 4 (line 171).
- **4.8.1:** `kalfagianni2016` §2 (p. 4, line 119) and Theorem 3.2 (p. 7, line 232). The bound translates exactly: with `t = A⁻⁴` and colour `r + 1`, `−4d₋` gives `r²(n−w) + 2r(s_A−w)`.
- **4.10:** Kauffman–Lambropoulou math/0212011 Theorems 1–3 (pp. 2–3: Conway, unoriented and oriented Schubert); math/0311499 §§2–4 for the tangle lists.
- **6.4:** `levine2016` Theorems 1.1 and 1.2 (lines 31, 89), Proposition 1.3 and its proof (lines 110–126), Remarks 1.4 and 1.5 (lines 129, 135).
- **7.2:** `loeh2006`:
  - Theorem 3.3, line 271; Definition 3.4, line 290; Theorem 3.5, line 322; Remark 3.6, line 332;
  - Definitions 3.7–3.9, lines 377–394; Lemmas 3.10 and 3.11, lines 413 and 435;
  - Theorem 4.1, line 476;
  - Definitions 5.1, 5.2 and 5.6, lines 588, 608 and 652; Propositions 5.3 and 5.5, lines 613 and 635;
  - Theorems 5.7 and 5.9, lines 661 and 681; Monod cited at lines 347, 361 and 363.

  `zastrow1998` Theorem 3.4 is on p. 382 (line 576). The section map `s_k` is used only through vertex evaluations (`loeh2006` lines 484–492), so "Borel also on smooth simplices" needs only the finer domain topology, as stated.
- **8.1:** `hatcher-3m` Theorem 3.8, and the irreducibility of `S¹ × ℝP²` (lines 2152–2161).
- **9.1:** Scharlemann locators as in r78. The Heegaard names are pinned.
- **11.2.1:** `hatcher-torustrick` Theorems A and B (lines 44–45), Handle Smoothing §2 (line 148), Connelly (line 204).
- **11.3:** `manolescu2016` Example 2.2 (line 127); the diagram puts `E8 × S¹` in triangulable but not PL, and smooth versus PL from dimension 8 (lines 262–270).
- **Also checked:**
  - Hatcher `3Mfds.pdf`: Theorem 1.9 on printed p. 18, `M(±g, b; …)` on p. 33, Theorem 2.3 on p. 37 with exceptions (a)–(e) as listed.
  - `calegari2007` Theorems 4.5, 4.35, 4.38 (lines 5900, 6702, 6916).
  - `watanabe2018` Theorem 1.1 (line 32).

**Adversarial table** (values computed this round):

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 4.12 normal form | `Δ₃`; `σ₁`; `σ₁σ₂⁻¹`; `n = 1, 2` | `Δ₃¹ = Δ₃⁰·Δ₃` excluded; `Δσ₁σ₂⁻¹ = σ₂σ₂σ₁`; `S = {σ₂} ⊆ F = {σ₂}`; `B₂`: `σ₁^k`; `Δ₁ = 1` | right |
| 4.8 MFW | `T(3,4)`, `w = 8`, `k = 3` | `P(1,z) = 1+5z²+5z⁴+z⁶ ↔ t³−t²+1−t⁻²+t⁻³`; `V = t³+t⁵−t⁸`; exponents `6,8,10` | right |
| 5.4 unknot Check | `∞`, `1/2`, `5/2` | distances `2`, `2`, `8`; `L(1,2) = S³`, `L(5,2)` | right |
| 5.4 trefoil, Moser | `p/q = 5, 7, 6`; `T(1,2)` at 5 | `L(5,9) = L(5,4)`, `L(7,9) = L(7,2)`; `|5−2| = 3` yet `L(5,1)` | right |
| 7.2 closed forms | `sin(2πx)dy`, `∂[0,¼]²` | `¼` against `0` | right |
| 7.2 class agreement | local extensions glued in `ℝᴺ`, retracted | agree on `Δᵏ` since `gᵢ = σ` there; needs no boundary for the retraction | right |
| 7.2 Löh Prop 5.3 | DifferentialGeometry 8.3/8.4 | iso and Stokes owned there, uncited here | R01 |
| 2.2 Schoenflies | horned sphere; round sphere; `n = 1` | ball on one side only; two round balls; two arcs | right |
| 4.2.6 two circles | `B = 0`, `μ = 2` | plane: 3 side-by-side + 4 nested = 7; sphere: 3; unoriented 2 and 1 | right |
| 4.2.9 | `h = aΔ`, `m(β) = (a⁻¹b)²`; `K(t)` | `aΔ(a⁻¹ba⁻¹b)Δ⁻¹a⁻¹ = (ab⁻¹)²`; double points `t_k = kπ/2 − π/3`, heights `sin(−4π/3) = √3/2`, `−√3/2`; `R₁K(t) = K(−t)` | right |
| 4.3.3 strip | `s = π/3` | radii equal iff `cos(3s/2) = 0`; tangents `±1.5ε e_r + R e_θ`; cross `3εR ẑ`; `χ = 0, −1`; crosscap `1`, genus `1` | right |
| 4.4.3 | trefoil relators; `FreeGroup ℕ` | `x = yxyx⁻¹y⁻¹ ⇒ xyx = yxy`; the missed letter maps to `ZMod 2` | right |
| 4.4.7 | `n = 1, 2, 3, 5`; `L_4` | Fox rows `(1,−1)`, `(1−t,t−1)`, `(F₃,−F₃)`; `x = b⁻²a`, `y = a⁻¹b³`: `xy = b`, `xyxyx = a`, `yxyxy = a⁻¹b⁵ = a`; `D_r = F_(r+1)`; `C_4 = z³+2z`; Fitting `(F_n), Λ` and `0, (F_n), Λ` | right |
| 4.7 / 4.7.1 | trefoil mod 6; `P(3,3,3)`; `M^m` | `6·1·3 = 18`, `(0,2,4)` valid; `diag(3,9)`; `N² = 0`; `F₂`: `r_2 = μ − 1` | right |
| 4.8.1 | trefoil; `θ_r`; `F_r(1)` | degrees `5, −7` (`⟨D⟩ = −A⁵−A⁻³+A⁻⁷`); `θ₁ = −A³`, `θ₂ = A⁸`; `S_r(−2) = (−1)^r(r+1)`; maxdeg `r²(n−w)+2r(s_A−w)` | right |
| 4.10 | `cf([2,0])`, `cf([0,0])`; `7/2`; `3/4` | `1/2`, `∞` (field convention `0`); `−2 ≡ 5 ≡ 3⁻¹ (7)`, `3 ∉ {2,4}`; `3/7`, `7 ≡ 1 (6)` | right |
| 4.11.2 | `V_(ε,m)`, `S_ε`, `C_ε`, `Q` | `S V Sᵀ = [[−ε,1],[0,m]]`; `C(−Vᵀ)Cᵀ = [[ε,0],[−1,−m]]`; `det(tV−Vᵀ) = t−εm(t−1)²`; `QV_(+,1)Qᵀ = [[1,1],[0,−1]]`; `d = 3, 13, 11` | right |
| 4.13 solver | `n = 1, 2, 3`; `V_k` | `β = (−1,2)`, `α = (−1,3)`; `p = t³+(t−1)⁶`; `det(V_k−tV_kᵀ)` checked for `k ≤ 5` at five values of `t`, minors `t^m`, `(−1)^m(1−t)^(2m+1)` | right |
| 4.5.5 | `E`, `F`, `R_c`, `G` | `E(−1) = 9`, `F(1) = 1`, `F(−1) = 49`; `R_c(1) = 3+c`, `R_c′(1) = 2+c`, `R_c(−1) = 15−c`; span `G` 6 | right |
| 6.2 | trefoil, figure-eight | `det[[−2,1],[1,−2]] = 3`, `σ = −2`; `det[[2,1],[1,−2]] = −5`, `σ = 0` | right |
| 6.4 | core pattern; Mazur `Q` | `Y_P = (0,0)`-surgery on Hopf link `= S³`; `Q(unknot)` unknotted (Remark 1.4) | right |
| 1.7.2 | `T_a`, `T_b`, `S T_a S⁻¹` | `[[1,1],[0,1]]`, `[[1,0],[−1,1]]`, `[[1,0],[1,1]] = T_b⁻¹` | right |
| 8.1 | stereographic inversion | `det = −|y|⁻⁶` | right |
| 8.3 | `L(7,1)`, `L(7,2)` | `1·2 ≡ 3² (7)`, `2 ∉ {±1}` | right |
| 8.3.1 | figure-eight Check | follows from asphericity, not item 2 | R04 |
| 8.4 | `(2,1)` against `2/1` | multiplicity 2 against regular | R03 |
| 9.2 | `T³`, PHS, `L(1,q)` | `3 = 3`; `2 = 2`; `g = 0` | right |
| 11.2.1 | seven-vertex torus | `V ≥ 7` | right |
| 11.4 | orientable 5-manifolds | triangulable; examples non-orientable (`manolescu2016` line 257) | right |
| `property_P`, `property_R` | unknot `1/q`; `p/q` | `S³_(1/q)(U) = S³` (so `hK` is needed); `H₁ = ℤ/|p|` | right |
| `cyclic_surgery_theorem` | trefoil `11/2`; wild unknot `5/2` | `|11−12| = 1`; `L(5,2)` with non-integral slope (so `hΦ` is needed) | right |
| 26 headlines | `#check`; one-tactic probe | types as in README; 26 of 26 fail | right |

## Not verifiable

- **Uncertified** (cited by locator only):
  - `monod2001` (7.2): I checked only that Löh cites Theorem 7.4.5 and Lemma 7.2.6 (`loeh2006` lines 347, 363).
  - `hirsch1976`, `haagerup-munkholm1981`, `kauffman1987`, `rourke-sanderson1972`, `thurston1986`, `gabai1983`, `htw1998`, `lickorish1962`, `lickorish1964`, `farb-margalit2012`.
- **Image-only:** `kauffman1990` (4.6.1); OCR is not available on this worker.
- **`kirby1997`:** the cached file is an unrendered PostScript (0 pages), so the Kirby problem numbers were not checked this round.
- **Not fetched:**
  - Burton et al. arXiv 2104.14076 (4.2.6); Przytycki math/0608172 (4.7.1);
  - Hedden 2007, p. 2277 (Hypothesis 6.4); Kondo (4.13);
  - Garside, Epstein et al., Elrifai–Morton (4.12);
  - Schubert, Turaev, Morton, Franks–Williams (4.8);
  - CGLS, Moser, Mathieu (5.3–5.4); Moise, Munkres, Whitehead 1940 (11.2–11.3).
- **Read into a scratch manifest only** (this review edits no manifest):
  - Kauffman–Lambropoulou math/0212011 and math/0311499;
  - Hatcher `3Mfds.pdf`;
  - Brown 1960, from the AMS open archive (`ams.org/journals/bull/1960-66-02/…10400-4.pdf`).

  The package manifest has no entries for math/0212011 or Brown 1960, which the README cites; recording them is a worker-level manifest fix.

## Source issues

- **Misprint** in levine2016 at Proposition 1.3, proof, p. 3: the source says the slice disc for `P(−K)` contradicts Theorem 1.1; it should be Theorem 1.2, the hypothesis on `P`; affects nothing.
- **Misprint** in loeh2006 at §5.3, after Definition 5.6, p. 14: the source calls the norm-preserving inclusion a cochain map; it should be a chain map; affects nothing.
- **Misprint** in loeh2006 at §5.4, p. 15: the source invokes Theorem (3.11) for the smooth duality principle; it should be Lemma (3.11), the duality principle of measure homology; affects nothing.
