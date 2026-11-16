<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13076#issuecomment-6907791597 -->
Red team round 1 pass b (claude) of 2e46e7e

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The cobracket formulas of §1.6 and §3.1 give the wrong value when an argument is 1

   Location: `packages/ZagierConjecturePolylogarithms/README.md:230-233` ("define the raw map `δ: Raw₃(F) → B₂(F)⊗U(F)` by … `δD₂₁(x,y) = …`") and `:373-376` (`δD₃₁(x,y)`), with the Conventions' `u(0) = 0` (`:32`).

   Claim: the displayed formulas define the raw cobracket on every generator `D₂₁(x,y)`, `D₃₁(x,y)`, `x,y ∈ Fˣ`, and the result kills every specialization of `Q₄` and agrees with §1.5.

   Witness: at `y = 1 ≠ x` two unit factors are `(1−x)/(1−y)` (a pole) and `1−1/y = 0`. Read term by term with `u(0) = 0`, `δD₃₁(x,1) = D₂₁(x,1)⊗x − S₃(1)⊗(1−1/x)`. The specialized relation (33) of §1.4 (`:207`) forces `δD₃₁(x,1) = −S₃(1−x)⊗x + S₃(x)⊗(1−x) − S₃(1)⊗(1−1/x)` (apply `δ` to its right side and the three-term relation). With `D₂₁(x,1) ↦ −[1−x]₃` (§1.5) the two differ by `S₃(x)⊗u(1−x)`, nonzero for `x = 3` over ℚ (pair with `L₃⊗ord₂`: `L₃(3) = L₃(1/3) ≠ 0`). The same happens in weight three: term by term `δD₂₁(1,y) = 0`, while §1.5 sends `D₂₁(1,y)` to `−[1−y]₃` with cobracket `[y]₂⊗u(1−y)`. At `x = y = 1` the inverse of §1.5 (`:215`) has two terms with argument `0/0`.

   Repair (tested on `D₃₁(x,1)`, `D₂₁(1,y)`, `D₂₁(1,1)`): add after each display the sentence
   "When `x = 1` or `y = 1` the two unit factors with a zero and a pole are multiplied before `u` is applied, so that `δD₂₁(1,y) = [y]₂⊗u(1−y)`, `δD₂₁(x,1) = [x]₂⊗u(1−x)`, `δD₂₁(1,1) = 0`; `δD₃₁(x,1) = D₂₁(x,1)⊗u(x) + S₃(x)⊗u(1−x) − S₃(1)⊗u(1−1/x)`, `δD₃₁(1,y) = −D₂₁(1,y)⊗u(y) − S₃(y)⊗u(1−y) + S₃(1)⊗u(1−1/y)`, `δD₃₁(1,1) = 0`."
   In §1.5 replace "with degenerate arguments read through §1.2" by "for `x = 1 ≠ y` the value is `[1−1/y]₃ + [y]₃ − [1]₃ = −[1−y]₃`, symmetrically for `y = 1 ≠ x`, and `D₂₁(1,1) ↦ 0`: symbols with argument `∞` are zero and the two terms with the same undetermined argument cancel." Add to §3.1 the Check "`δD₃₁(3,1)` over ℚ: the term-by-term reading with `u(0) = 0` loses `S₃(3)⊗u(2)`, which (33) requires."

2. **F02** (P2) The existence headline rests on a target whose own text calls its content open, and this is said nowhere near the headline

   Location: `packages/ZagierConjecturePolylogarithms/README.md:3` ("Prove Zagier's conjecture in weight four for every number field"), `:924` ("The open content of the target is the vanishing in (a) and (b) and the regularity (d)"), `:1047` (proof route of §6.4), and `packages/ZagierConjecturePolylogarithms/Suggested.lean:7-9, 120-123`.

   Claim: `zagier_four_exists` is a theorem the finished roadmap proves, attributed to Goncharov–Rudenko, Theorem 1.2.

   Witness: for `r₂ > 0` the route is §6.4 → §6.2 → §6.1 (`κ`, `i = 1`) → §5.8 → the combinatorial lift `𝓛₄` of §5.7. README:912 says the source gives only the motivic image (GR lines 4240–4243), and README:924 says steps (a), (b), (d) are open; no cited source proves them. `zagier_four_everyFamily` does not use §5.7 (§6.3 needs §§3.2, 3.13, 5.1–5.2 only).

   Repair (the mathematics is unchanged; the dependence is stated where the headline is):
   - README Summary, after the first sentence: "The every-family statement follows from the realization of §3.13 and the periods of §§5.1–5.2. For `r₂ > 0` the existence statement also needs the combinatorial lift `𝓛₄: G₄(F) → L₄(F)` of §5.7, whose steps (a), (b) and (d) are not proved in the cited sources: the source obtains the lift only through its motivic image."
   - README §6.4, at the end of the proof route: "For `r₂ > 0` existence depends on §5.7 through §§5.8 and 6.1–6.2; every-family rationality and the case `r₂ = 0` do not."
   - `Suggested.lean`, docstring of `zagier_four_exists`, add: "For `r₂ > 0` the roadmap's proof needs the combinatorial lift of README §5.7, which the source reaches only through its motivic image."
   Whether a statement with this status stays in the acceptance test is put to the human reviewers below.

3. **F03** (P3) Theorem 1.2 of the source is about inductive cycles; the README cites it for explicit cycles without saying so

   Location: `packages/ZagierConjecturePolylogarithms/README.md:1045` ("(Goncharov–Rudenko [GR], §1.1, item 6, Theorem 1.2, p. 5, GR line 196 …). The source writes the existence statement as an equality with `ζ_F(4)`"), and `Suggested.lean:120, 130`.

   Claim: the two headlines are the source's Theorem 1.2 up to the rational factor.

   Witness: GR lines 153–170 define `B_n(F)` inductively (kernel of `δ_n` over `F(t)`, specialized), and GR line 198 takes `y_j ∈ Ker δ₄ ⊂ B₄(F)` in that group. Explicit raw cycles are a subset of the inductive ones (Polylogarithms §4.5), so explicit existence is stronger than the cited statement; it comes from the source's proof (GR (31), line 501; Theorem 1.14(c), line 676).

   Repair: in §6.4 insert after the citation: "Theorem 1.2 is stated for the kernel of `δ₄` on the inductively defined group (GR lines 153–170). Every-family rationality for explicit cycles follows from it because explicit raw cycles are inductive cycles (Polylogarithms §4.5); existence for explicit cycles is stronger than the statement and is what the source's proof gives, through (31) and Theorem 1.14(c) (GR lines 501, 676)." In both docstrings replace "(Goncharov–Rudenko, Theorem 1.2, p. 5)" by "(Goncharov–Rudenko, Theorem 1.2, p. 5, for the inductive cycle condition; explicit cycles as in README §6.4)".

4. **F04** (P3) "Downstream consumers" says Polylogarithms' weight-four statements are discharged, but the supplier names a map this roadmap declines to build

   Location: `packages/ZagierConjecturePolylogarithms/README.md:1105` ("Polylogarithms §§4.4–4.6 name this roadmap as the owner of … the transfer to inductive cycles; its statements in weight four are discharged by §§5.2 and 6.1–6.5").

   Claim: everything Polylogarithms hands to this roadmap is delivered.

   Witness: Polylogarithms at its open head, `TauCetiRoadmap/Polylogarithms/README.md:21` ("the presentation map to the inductive complex together with its weight-four cycle obstruction") and `:710` ("the corresponding square has `C=B₄^comb` … Its presentation map, the relation check for it … are owned by Polylogarithms, Part II"). README:14 and :1087 say no such map is constructed and take `C = ℚ[F]`.

   Repair: replace the sentence by "Polylogarithms §§4.4–4.6 name this roadmap as the owner of the weight-four theorem, of the canonical period `L₄*` and its conversion on cycles, of `κ` and of the transfer to inductive cycles; these are §§5.2 and 6.1–6.5. The presentation map `B₄^comb → B₄^ind` that Polylogarithms §4.6 also names is not constructed: §6.5 applies the obstruction of §4.6 to the square with `C = ℚ[F]`, which needs no relation of `L₄(F)` to hold in the inductive group." (The supplier's two sentences then need the matching change in its own pull request; that is not an edit of this package.)

5. **F05** (P3) Layer 2 depends on a definition placed in Layer 3

   Location: `packages/ZagierConjecturePolylogarithms/README.md:334` ("*Needs:* §§1.1, 1.3–1.5, 2.3; the raw weight-four cobracket formula of §3.1"), `:350`, `:365` ("Layer 1, K3BlochGroups §§3.3–3.5, and the raw weight-four cobracket formula of §3.1").

   Claim: the layers are in build order.

   Witness: §§2.4–2.5 need the raw map of §3.1 (README:373-376) and §3.1 needs §2.5 (README:379): Layer 2 → Layer 3 → Layer 2 at the level of sections and of layers.

   Repair: move the definition of the raw map on `Raw₄(F)` (the sentence "Define the raw map on `Raw₄(F)` by `δS₄(x) = S₃(x)⊗u(x)` and" with its display, its target `(L₃(F)⊗U(F)) ⊕ Λ²B₂(F)` and the sentence of R01) to a new §1.7 "The raw weight-four cobracket", *Needs:* §§1.1, 1.3, 1.6, K3BlochGroups §3.4. §3.1 keeps the descent, the specialization check and co-Jacobi, with *Needs:* §§1.2, 1.4, 1.6, 1.7, 2.5. In §§2.4, 2.5 and the Layer 2 Dependencies replace "the raw weight-four cobracket formula of §3.1" by "§1.7". No id cited by another roadmap moves (Polylogarithms cites Layer 6 only).

Blocking: R01, R02. R03–R05 are P3.

## The pass: statements, instances, values

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `polylog` | `n = 2,3` disc coefficient; `n = 1`, `z = 3`; `n = 0`, `z = 1` | `∫₀¹ t^{k−1}(−log t)^{n−2}dt = (n−2)!/k^{n−1}` gives `1/kⁿ`; `−log 2 − πi`; `0` | agrees with PolylogarithmFunctions' definition for `n ≥ 0` |
| `singleValued` | `z = 0`, `z = 1`, `n = 2,3,4`; `z = 1/2`, `i`, `2`, `2+i` | `L₃(1/2) = 1.0517997903 = 7ζ(3)/8`; `L₄(i) = 0.9889445517`; `L₂(i) = 0.9159655942`; `L₃(i) = −0.1126928347 = −3ζ(3)/32`; `Im` sum at `2`: `−1/6 + 1/2 − 1/3 = 0` | sound; branches at `0`, `1` equal the formula for `n ≥ 2` |
| `unitVector` | `0`, `1`, `−1`, `6` | `0`, `0`, `0` (2-torsion), `u(2)+u(3)` | sound |
| `trilogCyclic`, `TrilogRelationFunction` | constant `b`; `(1,1,1)`; `b = L₃` at four complex triples `(0.3+0.4i, −0.7+0.2i, 0.6−0.5i)`, `(2+i, 3−2i, 0.5+0.25i)`, `(i,i,i)`, `(−1, 2, 0.5+i)`; three-term at `0.3+0.7i` | `2v`, `7v`; `3b(1)+4b(−1)`; residuals `−7.6e−13`, `2.9e−12`, `−6.6e−13`, `−2.2e−14`; `−2.9e−13` | sound; identical to Polylogarithms' declarations term by term |
| `IsCycle4` | `[1]`, `[−1]`, `[2]`, `[x]+[x⁻¹]`, `[0]`; universe of `V` | `0`; `0`; `L₃(2)·ord₂ = 7ζ(3)/8`; `b(x)⊗(u(x)−u(x)) = 0`; `0`; `B₃(F)` lives in `Type u` | sound; equals the kernel by the universal property |
| `periodMatrixFour`, `zagierDeterminantFour` | `ℚ`; `ℚ(i)` with `[i]`, `[i]+[−i]`; `ℚ(√5)`; exponent | `π⁴ = 90ζ(4)`; `π⁴β(4)/2 = 48.166 = 45ζ_F(4)`, `0`; `π⁸/√5`; `3d + d − 4N = −4(r₁+r₂)` | sound; equals Polylogarithms' `normalizedPeriod 4` on the complex places |
| `zagier_four_exists` | `r₂ = 0` (`ℚ`, `ℚ(√5)`); `ℚ(i)` | `q = 90`; Borel/Klingen–Siegel; witness `[i]`, `q = 45` | true in these cases; general `r₂ > 0`: R02 |
| `zagier_four_everyFamily` | empty family; zero column; conjugate embedding | `q = 90` over ℚ; `q = 0`; `q ↦ −q` | sound as stated |
| Cross-ratios, `Z` (Conventions, §1.1) | `s(∞,1,0,x)`, `r(∞,0,1,x)`, `s(∞,0,1,x)`, `Z(0,…,5)` | `x`, `x`, `1−x`, `1/5` | sound |
| §1.2 table against §1.5 | all order cases of `(a,b)` in the reduction of `D₂₁` | `−[v₀]₃`, `−[u₀]₃`, `2[u₀/v₀]₃`, and `0` in the six remaining cases | sound |
| §1.2 table against §3.1 | `a>0=b`, `a=0<b` | `S₃(v₀)⊗u(v₀)`, `−S₃(u₀)⊗u(u₀)` | sound |
| §1.5 inverse, §1.6 `δD₂₁` | `(x,y) = (0.3+0.7i, −1.2+0.4i)`, `(2+i, 0.5−3i)` with `[w]₂⊗a ↦ D(w)log|a|`; `x = 1`, `y = 1`, `x = y = 1` | both sides `1.6054144128`; both `−0.3901674729`; at `1`: R01 | sound off `{x = 1} ∪ {y = 1}`; R01 |
| §2.2 flip | `Δ₁₂=2, Δ₃₄=3, Δ₂₃=Δ₁₄=1` | `c∧(a+b) − (a+b)∧e = u(7)∧u(6)` | sound |
| §2.3 square | symbols `A, B` | `2(B⊗δA − A⊗δB)` on both sides | sound |
| §2.4 facet identity | `(0,1,3,7,11,17,23)`, `(0,1,2,5,−3,1/2,9)`, `(2,3,5,7,11,13,19)`, exact rationals | residual `0` terms in each; supports `(42,28)` and `(21,14)`; coefficients `−1, 0, +1, −1` | sound |
| §3.1 `δD₃₁` against (33) | `D₃₁(x,1)` | combined reading: `−S₃(1−x)⊗x + S₃(x)⊗(1−x) − S₃(1)⊗(1−1/x)` on both sides; term-by-term reading loses `S₃(x)⊗u(1−x)` | R01 |
| §3.4 cuts | words of length 3, 4, 5 | 3, 8, 15 cuts; `(0,0,1,y)`: 7 vanish, survivor `Cor(0,1,y)∧u(y)` | sound |
| §3.5 weight one | `n` finite punctures | `dim = n(n−1)/2` on both sides | sound |
| §3.13 `D₂₁ ↦ −Cor_∞(0,x,1,y)` | four cuts `k = 1,…,4` | `−[x]₂⊗(1−1/y)`, `−[(1−y)/(1−x)]₂⊗(y/x)`, `−[y]₂⊗(1−1/x)`, `−[y/x]₂⊗((1−y)/(1−x))` | sound |
| §3.14 Checks | Gauss valuation at 2 on `ℚ(t)`, `π = 2` and `2(1+t)`; origin of `𝔸²` | `S₃(t)⊗u(t)` for both; `S₄(2)` against `0` | sound |
| §3.7, §5.1 weights | `µ` in weight 4, 3, 2 | `1/20, 1/10, 1/4, 1/6, 1, 1/3`; `1/6`; `1/2`; `µ(d^Ca∧d^Cb) = (5/24)d^Ca∧d^Cb + (1/24)da∧db` | sound |
| §5.1 diagonal equation | `z = i` on `∂θ` | `i·(−15ζ(3)/512)` on both sides | sound |
| §5.2 | `[x]+[x⁻¹]`; `[2+i]` | `0`; `D(2+i) = 0.5116663986`, correction `0.3313411393`, `L₄* = 0.1462942059`, `(5/16)L₄ = 0.1393912655` | sound |
| §3.9 weight two | `(0,1,i)` | `∫ log|x| dlog|x−1|∧dlog|x−i| = −2.87761` against `−πD(i) = −2.87759` | sound |
| §4.8 identities | bookkeeping of rows `C_m(q)`, `q ≤ m−4`; `(iv)` with two random configurations in `ℂ³` | `X = 65.9298`, `Alt₈(8|…) = −593.3688 = −9.000004·X`, `Alt₈([r(1|5,6,7,8)]∧…) = −3.000001·X`; `(3/28)X − (9/84)X = 0` | sound; the separate vanishing of the source fails |
| §4.8 (i) | coefficients | `−3/2 − 1 = −5/2`, `2 − 2 = 0`, `3 + 1 − 4 = 0` | sound |
| §5.5 `a₂` square | coordinate triangle and `((1,1,1),(1,2,3),(1,3,2))` | `2·2∧3 + 2·2∧5 − 2·3∧5`; `⟨M;L⟩` gives the negative | sound |
| §5.7 Check | moment curve `t = (2,3,4,5,6,8/5,0,1)` | `ρ = (4, 5/2, 2, 4)`; `720` terms with equal coordinates, `144` with `ρ₁ = ρ₄`, `0` adjacent | sound |
| §5.8 | components on `C₈(4)`, `C₈(3)`, `C₈(2)` | `δ₂₂ = 3/28 − 3/28`, `−((3/28)X − (3/28)X)`, `−R₇²∂ = 0` | sound |
| §6.2 | `[i]` over `ℚ(i)` | `p = β(4)/8 = 0.123618`, coordinate `−0.00049836` | sound |
| §6.5 square | `C = ℚ[F]`, `p` onto `B₄^ind` | commutes on `[x]`; `ω = 0` iff an explicit raw lift exists | sound |

Elaborated signatures: no Lean was run in this pass (read-only). The ten elaborated types supplied with the job were compared one by one with README §6.4; none lost a binder and nothing changed.

Dependency check output: `depcheck: 248 roadmaps, 2334 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line for this roadmap.

Ownership against open work: the trilogarithm group, the cycle predicates, `B₂`, Borel's lattice, mixed Tate motives, variations of mixed Hodge structure and the Deligne complex are cited to their owners at the open heads; no `Suggested.lean` of a roadmap read here declares a fully qualified name of this file (Polylogarithms and PolylogarithmFunctions use their own namespaces). Scissors-congruence groups, Stasheff complexes with cluster maps, the cyclic shuffle coalgebra and `G₄` were searched by object in the open heads and on main: no other owner.

## Verified sound

- Declarations read: 10 of 10 in `Suggested.lean`; one `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data, no `#eval`; padding probe: neither theorem follows by one tactic, every definition is used by a headline.
- Headline theorems: two stated; five groups named as not statable in the module docstring, each with its missing carrier; no statable headline is absent (the remaining targets need `B₂`, `L₄`, motives or configuration complexes).
- README sections read: 48 of 48 (§§1.1–6.5), with Conventions, supplier contracts, Examples and Worked examples.
- Locators verified against the cached texts: 52 (GR 41, G08 5, M20 4, G00 2). The numbered theorems, lemmas, propositions and corollaries of GR cited in the README were matched to their pages by an index of the cached text; the Definitions of GR §10.1 and Theorem 8.7 were not matched individually.
- Checks and formulas tested with computed values: the 30 rows of the table above, several instances each.
- Sibling citations checked at the open heads or on main: Polylogarithms (§§2.1, 2.2, 3.1–3.7, 4.1–4.7, Layer 5, and 11 declaration names), PolylogarithmFunctions (§§1.1, 4.2, 4.6, 4.7, 5.1, 5.2, 5.7), K3BlochGroups (§§3.2–3.8, 4.21), BorelRegulators (§§1.1, 2.2, 2.3, 5.3, 5.4, 6.0a, 6.2), MotivicEtaleKTheory (§§3.3, 3.4, 7.1), PeriodsAndSpecialValues (PS.3.0, PS.9.3, PS.9.8–PS.9.10), MotivesAndAlgebraicCycles (§3.6, §§6.1–6.3, Layer 4), MixedHodgeModulesAndIrregularHodgeTheory (§§3.1–3.3), HodgeStructures (Completed). All exist with the cited content.
- Pinned declarations checked: 6 Tau Ceti (`MixedHodgeStructure`, `MixedHodgeStructureCat`, its `abelian` instance, `range_inf_F_eq_map_F`, `tate` of weight `−2m`), 14 Mathlib (`dedekindZeta`, `discr`, `det_isEmpty`, `det_mul`, `exteriorPower`, `exteriorPower.ιMulti`, `FreeLieAlgebra`, `LieDerivation`, `groupHomology`, `ProjectiveResolution` and its `lift`, `bernoulli_one`, `nrRealPlaces`, `nrComplexPlaces`).
- Declared gaps: the four slugs agree between `design/plan.json` and the README; each names a supplier and section; PS.9.8–PS.9.10 at the supplier's head are over ℚ and `ℙ¹∖{0,1,∞}` only, so the gaps ask for nothing already provided.
- Policy: the pull request changes only the package folder; no process words or pull-request numbers in the README or docstrings.

## Not verifiable

- §3.7 (the product `∗`, the comparison `Φ` as an isomorphism of complexes) and §5.4 (the constant `πi`): only the weights of `µ` and the diagonal equations were recomputed; the current identities were not.
- §3.14(1) for a general discrete valuation and §5.7 (a), (b), (d): no cited source proves them (GR footnote 4, p. 11, covers the one-parameter case); the route was read, not checked.
- §5.6 and §5.9: the normalization of `a₃` and the residues were compared with the locators only.
- §4.8 (ii), (iii) and the certification in `Λ²b₂(3,8)`: only (i), (iv) and the sign rules were recomputed.
- `gap:trilog-specialization-closure`: GR line 503 refers the only nontrivial step of `B₃ ≅ L₃` to Goncharov's 1995 paper, §5, which is not in the manifest; the contract was not checked against it.
- Whether the Polylogarithms checkout read here (README dated before this package's last rounds) is its current head was taken from the job's list.

## Source issues

- **Error** in GR at Theorem 1.2, p. 5: the source says there are cycles making the normalized determinant equal to the zeta value; it should be a nonzero rational multiple, since for a totally real field the determinant is empty (ratio 90 over ℚ); affects a stated result.
- **Misprint** in GR at the worked case after (38), p. 14: the source says the equal-pole specialization of the weight-four double symbol is the single symbol of the quotient; it should be three times it, as table (26) and the displayed computation give; affects nothing.
- **Error** in GR at Lemma 7.9, p. 72: the source says the degree-seven component composed with deletion vanishes on eight vectors in dimension three; it should vanish only after adding the wedge component composed with projection (the two parts are ±3/28 of a nonzero alternation); affects the proof.
- **Gap** in GR at (38), p. 14: the source gives the cobracket of double symbols by a formula with no value when an argument equals one; it should state the limit, with the vanishing and polar unit factors multiplied first; affects nothing.
- **Gap** in GR at §9.3, item 2, p. 93: the source passes from a motivic expression of the Grassmannian tetralogarithm to a map into the combinatorially presented weight-four group; it should construct that map on the presentation, since the realization is not known to be injective; affects the proof.
- **Error** in M20 at §1.2.1, (3), p. 3: the source says the tree integral takes values on the line of weight-n Tate twists of the reals; it should carry a factor of the (n−1)-st power of i, the integral being imaginary in every weight; affects nothing.
- **Misprint** in M20 at §1.2.1, the weight-two display, p. 3 (as extracted): the source says the prefactor is minus one eighth; it should be minus two, the value of the general formula (3) at weight two; affects nothing.

Source independence: 11 passages compared with 4 sources (GR lines 153–170, 196–200, 399–441, 491–504, 3322–3345, 4236–4249, 4271–4291; M20 lines 102–128; G08 lines 3812–3820, 4626–4633; G00 lines 177–196), none shared beyond formulas and standard names (longest run of common words 4); largest share GR, 64 of 119 bracketed locators; contents compared with GR: independent (Layer 1 ↔ §1.2 with §5.1; Layer 2 ↔ §§3–4; Layer 3 ↔ §2, §5.2, §6, §8.2 with G08 and M20; Layer 4 ↔ §7 with §10; Layer 5 ↔ §8, §9.1–9.2 with G00; Layer 6 ↔ §9.3: no one-to-one run, and the order of Layers 4–6 is forced by the *Needs* lines of §§5.8 and 6.1).

## For the human reviewers

- **Scope.** `zagier_four_exists` for `r₂ > 0` depends on README §5.7, whose text (README:924) calls three of its steps open; the source reaches the lift only through a motivic image (GR lines 4240–4243). Whether it stays in `Suggested.lean` is yours.
- **Scope.** §3.14(1), specialization of `L₃`, `L₄` along every discrete valuation including mixed characteristic, is cited to GR footnote 4, p. 11, which covers one-parameter families only; the general statement is this roadmap's own.
- **Scope.** The main source GR is cited as arXiv:1803.08585v5 (dated 2026 on the copy read); the README records no journal reference, and corrects it in at least eight places (README:149, 305, 757, 759, 793, 885, 951, 1045).
- **Not tested.** Goncharov's 1995 paper, to which GR line 503 refers the isomorphism `B₃ ≅ L₃`, is not in `sources.toml`; the supplier gap `trilog-specialization-closure` stands in for it and was not compared with that text.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2e46e7ec66de1face4fb3be62b1104e9df8e5406", "job": "RT-ZagierConjecturePolylogarithms~1b", "model": "fable", "worker": "chris-x79"} -->
