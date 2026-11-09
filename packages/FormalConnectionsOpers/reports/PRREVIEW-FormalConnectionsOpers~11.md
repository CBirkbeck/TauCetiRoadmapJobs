# Review of FormalConnectionsOpers (pull request #1056 at d4bae7c)

**Verdict:** needs changes

This is a full review of head `d4bae7c`. Since `ccaed5e`, 196 lines changed in `TauCetiRoadmap/FormalConnectionsOpers/`: 191 in `README.md`, plus a docstring-only change of 5 lines in `Suggested.lean`. Nothing outside the folder changed.

**Previous findings.** All eight findings of the review of `ccaed5e` are repaired.

- R01 (KacMoody comparison unowned, consumption misstated): repaired. The Scope bullet (145–154) now reads "KacMoody Layer 8 (KM8A) owns, on complex points of the pinned simply connected simple group `G_sc` … It is earlier in the merge order and consumes nothing here." A `### From TauCetiRoadmap.KacMoody` contract (472–486) consumes 8.1 and 8.4 only. §3A.4 adds the comparison target (1364–1377), an API bullet (1384–1387), three Checks (1396–1407) and a `*Needs:*` item (1409–1410). The Downstream bullet is deleted, and the layer Dependencies (1562–1564) list KacMoody "for §3A.4's comparison only".
- R02 (trivial torus oper groupoid): repaired. §4.4 (1873–1882) separates the coefficient functors `Op^DS_G` from the intrinsic groupoids `Op_G`. The torus bullet (1898–1903) reads "the intrinsic groupoid `Op_T(D×)` is `Loc_T(D×)` of §3.4 … The comparison functor … is faithful and not full". The Check at 1915–1920 matches it.
- R03 (wrong lemma and page): repaired. Line 2727 reads "Lemma 4.3.2, p. 39 (proof p. 40)" and line 2767 reads "Conjecture 10.1.2, p. 311". Both agree with the source (FrenkelGaitsgory2006 lines 1851–1867; Frenkel2007 running head "311" before line 12936).
- R04 (étale versus fpqc): repaired. Lines 1131–1136 state Frenkel–Gaitsgory's étale condition and prove that étale-trivialized torsors form a full subgroupoid of the fpqc class: "a finite jointly surjective family of étale maps `R → R_i` makes `R → ∏ R_i` faithfully flat". This is correct.
- R05 (headline without locator): repaired. Lines 943–945 and the docstring at `Suggested.lean:65–68` read "Frenkel–Gaitsgory, Lemma 4.4.2, p. 40, in the form stated at the start of its proof, p. 41" (FrenkelGaitsgory2006 lines 1894–1905).
- R06 (`PGL₂` Check put a length-one element into `Ω`): repaired as proposed (1329–1335).
- R07 (`S = R × R` descent Check): repaired (1090–1096). "the descent isomorphism has a component `M_j ≃ M_i` at each `e_i ⊗ e_j`" matches the conventions `f(a) = 1 ⊗ a`, `g(a) = a ⊗ 1` of 1061.
- R08 (vacuous unit Check): repaired (1589–1592) with `ψ = 1 + εt⁻¹`. The words "fpqc-local" are gone.

## R01 (P3) — §8.3's identification of the regular isomonodromy algebroid with the conormal algebroid has no locator

**Location.** `TauCetiRoadmap/FormalConnectionsOpers/README.md:2691–2692`: "Identify its Lie algebroid with §7.4's conormal Lie–Rinehart algebroid through the residue/negative-label comparison of §8.2, and preserve the anchor, bracket and stabilizers." The API bullet at 2695–2696 states `Lie IsomOp^reg ≃ N*_(Op(D)/Op(D×))`. §7.4 (2490–2491) cites "Lemma 4.4.1" without a page.

**Claim.** The conormal comparison is a theorem of this layer, but no source is given for it. Only the groupoid half of 2695 is located (Lemma 4.4.2).

**Witness.** FrenkelGaitsgory2006, p. 41: line 1913 builds the map (4.10), conormal of `Op^reg` to `isom^reg`, from Lemmas 4.3.2 and 4.4.2(1); line 1915, Proposition 4.4.3, makes it an isomorphism. The README cites neither.

**Repair.**
- At 2692, after "stabilizers", add "(Frenkel–Gaitsgory, §4.4, the map (4.10) and Proposition 4.4.3, p. 41, over `ℂ`)".
- At 2491, write "(Frenkel–Gaitsgory, Lemma 4.4.1, p. 40; the conormal algebroid of a coisotropic subscheme with locally projective normal bundle is (4.9), p. 40)".
- Add "Proposition 4.4.3, p. 41" to the Frenkel–Gaitsgory reference (2835–2836).

**Test.** The map (4.10) at line 1913 is built from the two inputs §8.3 already names: Lemma 4.3.2, which is §8.2's cotangent identification, and Lemma 4.4.2(1). The conormal algebroid (4.9) of FrenkelGaitsgory2006 lines 1869–1878, p. 40, assumes a locally projective normal bundle (footnote 6), exactly the hypothesis §7.4 proves (2492–2494). In rank one, both sides have topological generators `dq_j`, `j < 0`, of `I/I²`, as in the Check at 2706.

## Verified sound

**Gate and direction**
- The worker's gate (`gate.md`) passed every check, including `build=0`. Rerun here on `d4bae7c`: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0.
- Dependency check: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - Merge order: KacMoody is 3, CrystallineCohomology 23, ComplexComparisonPartII 39 and FormalConnectionsOpers 40.
  - KacMoody, ReductiveGroups, ReductiveGroupsPartII, FormalLaurentPuiseux, SchemeAndStackFoundations, AlgebraicVectorBundles, ComplexKahlerGeometry, ComplexManifolds, CharacteristicClasses, AffineMorseLefschetz, ProfiniteCohomology, SmoothBundlesConnections and LieGroupoidsPoisson are on main. LieHighestWeight, LieGroups and RootSystems are on main under `RepresentationTheory/`, and AnalyticToricGeometry under `Completed/`.
  - No supplier is on the never-cite list.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- `roadmaps resolve` returned one lead, `AffineWeylGroup.not_all_of_N` (README 1330). It is ReductiveGroupsPartII's README-only non-example on main, line 2280, so the citation resolves.

**Lean**
- `lake env lean TauCetiRoadmap/FormalConnectionsOpers/Suggested.lean` exits 0. Its only output is the three `declaration uses sorry` warnings, at lines 74, 133 and 163.
- I put `#check @name` for all nine declarations in one scratch file and elaborated it. Each elaborated type equals `signatures.md`, and no binder is lost: `[Algebra ℚ R]`, `reductiveCommHopfAlgProperty ℂ H`, `[CharZero F]`, `Differential.deriv ≠ 0`, `[FiniteDimensional F V]`, and `[HopfAlgebra k H] [Algebra k R]` on both coefficient maps. Each type matches its README statement (§2.4 941–950, §3A.2 1263–1265, §6.2 2187–2192).
- One-tactic probes on scratch copies:
  - `first | rfl | simp | infer_instance | aesop` fails on all three theorems.
  - `exact?` fails on `regularGauge_constantCoeff_bijective` and `exists_cyclicVector`, and hits the default heartbeat limit on `formalLoop_eq_polynomial_mul_positive`.
  - None of the three is padding.
- Headlines in the Summary (3–20):
  - Stated: Layer 2 (`regularGauge_constantCoeff_bijective`), Layer 3A (`formalLoop_eq_polynomial_mul_positive`) and the cyclic-vector part of Layer 6 (`exists_cyclicVector`).
  - Named in the docstring with the missing carrier: Layer 4's slice and normal form (F4.3), Frenkel–Zhu (F6.1), and the Layer 7 and Layer 8 algebroid statements (F7–F8).
- Pins, from `lake-manifest.json`, unchanged by this pull request: Tau Ceti `2fd255d997`, Mathlib `1b1ccf4b08`. `TauCeti.reductiveCommHopfAlgProperty` (`Algebra/AlgebraicGroup/Reductive/Basic.lean:71`, with `_iff` at :79) is smooth ∧ geometrically connected ∧ no normal smooth connected unipotent subgroup over `k̄`. That is the "connected reductive" of the README (250–253). The other library declarations named in `Suggested.lean` elaborate there: `HahnSeries.instAlgebra`, `HahnSeries.ofPowerSeriesAlg`, `LaurentPolynomial.eval₂`, `AlgHom.mapValue`, `TauCeti.HopfAlgebra.points`, `PowerSeries.derivative`, `Matrix.GeneralLinearGroup.map` and `Differential`.

**Cross-roadmap citations resolved**
- **KacMoody on main, Layer 8 (1133–1236).**
  - 8.1 (1135–1162): `G_sc` of ReductiveGroups Layer 9, `ev_0`, `I = ev_0^(−1)(B^+(ℂ))` (1142), the Bruhat decomposition and conjugation formula (1145–1147), generation of `G_sc(ℂ[t])` (1148–1149), the root bounds (1153), and the `SL₂` Iwahori Check `c(0) = 0` (1161).
  - 8.4 (1205–1226): the induced maps for a connected reductive target (1212), and the `PGL₂` image is the identity component (1225).
  - Scope 79–86 says that the comparison is "stated on its side", which is now §3A.4.
  - KacMoody's bound at 1153 omits `u ≠ 0`, and `x_α(0) = 1 ∈ I` for every `n`; §3A.4's version (1380) has the hypothesis.
  - KacMoody's Downstream sentence at 1278–1280 ("consumes nothing here") is now out of date. Updating it is KacMoody's change, not this folder's, and the edge is downward.
- **ReductiveGroupsPartII on main.** *affine-weyl-group* 2233, `AffineWeylGroup.semidirect` 2247, `coxeterSystem` 2244, `not_all_of_N` 2280. *parahoric-subgroup* 4289, *hyperspecial-vertices* 4447, RG2.3.2 at 4044. *iwahori-weyl-group* 5535, *iwahori-weyl-exact-sequences* 5615, `splitTorus` and `sl2_eq_affineWeyl` 5576. *iwahori-bruhat-decomposition* 5730. *cartan-decomposition* 6215, whose second clause, with `K = 𝒢°_x(O)`, is the one consumed; `K = G(ℂ[[t]])` for the split Chevalley model. `glDecompositions_infinite_residue` 6647, RG2.5.1 6724.
- **ReductiveGroups 3A.5b–3A.5e.** These exist only at the ReductiveGroups revision of #1676, whose head has moved to `47dfaf25`: 3A.5b at 1313, 3A.5c at 1356, 3A.5d at 1397, 3A.5e at 1418. Each still provides what lines 323–336 consume: open and closed embeddings, Hausdorff, second-countable and fibre-product comparisons; charts with holomorphic transitions; the Lie group with the chart-at-identity identification. Its lines 46–47 name this roadmap's §2.4 and §4.3 as consumers. The pull request's description names that revision as the one to merge first, so this is not an unnamed revision dependency.
- **CrystallineCohomology (#857, via `roadmaps show`).** CR.1.3 at 1121, with the connection carrier, base change, tensor and Hom/dual for finitely generated projective `M` (1251–1298). This roadmap is named at 131 and 1272.
- **ComplexComparisonPartII (#848, via `roadmaps show`).** C−1.1 at 1015, with `complexSchemeAnalytification` at 1065 and this roadmap's F2.4 at 1090. Also C0.3 `holomorphicBundleDictionary` (1356), C0.4 (1405), C5.1 `IsDifferentialOperator` (3102–3111), `DifferentialOperatorAnalytification` (3153) and C5.2 `holomorphicConnectionDictionary` (3310).
- **Roadmaps on main that cite this roadmap.** AffineLieAlgebras, ComplexKahlerGeometry, GeometricRepresentationCategories, KacMoody, NilpotentOrbits, ReductiveGroups, LieGroups and SchubertGeometry cite labels F1–F8 and F3A, all present here.

**Ownership against open pull requests.** I ran `roadmaps grep` for cyclic vectors, Drinfeld–Sokolov, opers and the four `Suggested.lean` names.
- No other roadmap declares `regularGauge`, `exists_cyclicVector`, `formalLoop_eq_polynomial_mul_positive` or `polynomialLoopToFormal`.
- Two later open roadmaps assign this roadmap's objects to themselves. In both cases this roadmap is the earlier owner, so the repair belongs to the other pull request and nothing changes here.
  - PadicDifferentialEquationsAndRigidCohomology (#1002, merge order 120), README line 153, claims the cyclic-vector theorem and says this roadmap's F6 consumes it. Here it is earlier (40), owns it (Scope 129–135) and says #1002 imports §6.2 (2782–2786); the settlement rule picks this side.
  - EndoscopicTransferAndUnitaryTraceComparison (#999, merge order 148), README line 1146, calls its Chevalley quotient and its §3.4 Kostant section the carriers "F4.3 uses". §4.3 here is earlier, consumes nothing from #999, and owns the characteristic-zero slice and the group/Lie-invariant adapter. #999's positive-characteristic variant is its own.
- Loop Grassmannian and affine flags: only this roadmap constructs them over `ℂ`. ReductiveGroupsPartII line 63 disclaims them, and SheafTheoreticSmithTheory consumes §3A.5.

**Seeded sample of sources.** I read every locator below in the cached text, except the Stacks tags, which I read on the Stacks project site. Frenkel2007 pages are printed running heads; the PDF minus printed offset is 14 through p. 112, 11 at pp. 235–247 and 10 at pp. 310–311.

| Target | Source and locator (cache line) | Supports the statement |
| --- | --- | --- |
| F1.1 | FrenkelGaitsgory2006 §19.1, p. 110 (5286), the three completed tensor products, p. 111 (5311–5345) | Yes |
| F1.2 | Frenkel §3.5.3, p. 91 (4073–4077: `a₀ = 0`, `a₁ ≠ 0`, composition); §3.5.4, pp. 91–92 (4109–4120: `Aut O = ℂˣ ⋉ Aut⁺O`, `Der⁺O = t²ℂ[[t]]∂_t` pro-nilpotent); §3.5.7, p. 96 (4357–4363: `ε f′ + λ ε′ f` on `λ`-forms) | Yes |
| F2.1 | CrystallineCohomology CR.1.3 at #857 (1251–1298); the comparison with the vector-field form is standard | Yes |
| F2.2 | Stacks 09CI (Definition 10.133.1), 09CK (Lemma 10.133.3), 0H90 (Lemma 10.133.9, `(S ⊗ M)/J^(k+1)`, jet `m ↦ 1 ⊗ m`), with no characteristic hypothesis; Rinehart Theorem 3.1, p. 198 (152); C5.1 at #848 (3102–3111) | Yes |
| F2.3 | Katz §1.0, p. 178 (156–167); p. 179: `∇₁∘∇` is wedge with `K` (175–178), (1.0.4) (195), (1.0.5) (203); §1.1, pp. 180–181 (209–259) | Yes |
| F3.1 | Frenkel §1.3.1, (1.3-1), p. 19 (1029–1036: `K_N` a basis of neighbourhoods of `1`) | Yes |
| F3.3 | Frenkel (1.2-4), p. 15 (911); (1.2-7), p. 18 (994); FrenkelGaitsgory2006 (1.2), p. 15 (672–677); `R`-families, p. 16 (694–697) | Yes; misprint in (1.2), see Source issues |
| F3.4 | FrenkelGaitsgory2006 (4.5) and `IsomConn ≃ Conn × G((t))`, p. 39 (1813–1817); étale-local triviality, §1.1, p. 16 (692–693); Frenkel (1.2-7), p. 18 | Yes |
| F4.1 | Frenkel §4.2.1, pp. 108–109 (4816–4865); (4.2-1), p. 109 (4877) | Yes |
| F4.3 | Kostant Proposition 0.4 and Theorem 0.1, p. 521 (134, 145); Theorem 0.6, p. 522 (196); (0.1.8), p. 524 (243); Frenkel Lemma 4.2.2, p. 112 (5011) | Yes |
| F4.4 | FrenkelGaitsgory2006 Lemma 1.1.2, p. 15 (679: `Ad_g(∇) = ∇ ⇒ g = 1` for `B`-gauges); Proposition 1.3.1, p. 17 (765–786); Corollary 1.3.2, p. 17 (787–789); Part I assumes `G` adjoint | Yes |
| F5.1 | Frenkel (4.2-3), p. 111 (4952); Lemma 4.2.1, p. 112 (4985) | Yes |
| F7.1 | Huebschmann Theorem 3.8, p. 23 (953), Addendum 3.8.4, p. 24 (986); FrenkelGaitsgory2006 Lemma 4.3.1, p. 39 (1825–1840: both algebroids are `𝔤((t)) ⊗^! Fun Conn`), Lemma 4.3.2, p. 39, proof p. 40 (1851–1867) | Yes |
| F7.2 | Frenkel §8.3.2 from p. 246; freeness paragraph, p. 247 (10505); Lemma 8.3.2, p. 247 (10512); Lemma 4.2.2, p. 112; FrenkelGaitsgory2006 moment map, p. 39 (1841–1850) | Yes |
| F8.2 | FrenkelGaitsgory2006 Proposition 4.1.1, p. 37 (1764); §4.2, pp. 37–38 (1765–1784); (4.2)–(4.4), p. 38 (1790–1798); Lemmas 4.3.1–4.3.2, p. 39 | Yes |
| F2.4, F8.3 | FrenkelGaitsgory2006 Lemma 4.4.2, p. 40, proof p. 41 (1894–1905); Proposition 4.4.3, p. 41 (1915) is not cited | R01 |

**Adversarial table.** Values computed here. The rows cover the headlines, the sampled targets and every target a finding or a repair touches.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `regularGauge_constantCoeff_bijective` | `n = 1`, `A = 1`, `B = 0` over `ℚ`; `𝔽_p`, `A = B = 0`; `ℚ[ε]/ε²`, `A = εI`, `B = 0`; `n = Fin 0`; zero ring | `gauge = B ⟺ g′ = gA − Bg`, coefficient `(j+1)g_(j+1) = Σ(g_iA_(j−i) − B_(j−i)g_i)`; `g = g₀eᵗ`; `1` and `1 + tᵖ` both solve with constant term `1`; `(1 + εt)′ = ε = ε(1 + εt)`; singleton to singleton | holds; `[Algebra ℚ R]` needed | none |
| `regularGauge` action law | `h`, `g` | `(hg)′(hg)⁻¹ = h′h⁻¹ + hg′g⁻¹h⁻¹`; `regularGauge 1 A = A` | holds | none |
| `formalLoop_eq_polynomial_mul_positive` | `G = 1`; `𝔾_m`, `R = ℂ`; `𝔾_m`, `R = ℂ[ε]/ε²`, `g = t⁻¹(εt⁻² + (1 − t)⁻¹)`; `R = ℂ × ℂ`; `SL₂` geometric series | point; `a tⁿ w`; `p = t⁻¹(1 + ε(t⁻² − t⁻¹))` gives `q = (1 − t)⁻¹`, while `p = t⁻¹(1 + εt⁻²)` leaves the polar term `−εt⁻¹(1 − t)⁻¹` in `q`; `(t, t²)` is polynomial; `[[1, t⁻¹(1 − t)⁻¹], [0, 1]] = [[1, t⁻¹], [0, 1]]·[[1, (1 − t)⁻¹], [0, 1]]` | holds; the polynomial factor must be non-monomial | none |
| `exists_cyclicVector` | `V = 0`; `F = ℚ(t)`, `F²`, `D = ∂`, `v = (1, t)`; `∂ = 0`, `D = 0`; `𝔽_p(t)`, `F^(p+1)` | empty family independent; `Dv = (0, 1)`, `det [[1, 0], [t, 1]] = 1`; iterates `v, 0`; `∂ᵖ = 0` | both hypotheses needed | none |
| `IsDifferentialModuleMap` | `D = ∂` on `F`; `D = id`; `D = 0` with `∂ ≠ 0` | Leibniz holds; fails by `f′v`; fails by `f′v` | determines its object | none |
| F1.1 `⊗^!` | `Σ tⁿ ⊗ t⁻ⁿ` | only `n < M` survive in `(V/tᴹV⁺) ⊗ (W/tᴺW⁺)`; infinitely many independent `t⁻ⁿ` in `V ⊗ W/tᴺW⁺` | separates `⊗^!` from both | none |
| F1.2 | `φ = t + t²`; `φ = 2t`, `ψ = t + t²`; `f = t⁻¹`; `φ = t²` | `ψ = t − t² + 2t³ − 5t⁴`, `φ(t − t²) = t − 2t³ + t⁴`; `2t + 4t²` against `2t + 2t²`; `Res((t⁻¹ − 1 + t)(1 + 2t)) = 1`; `Res(2t⁻¹) = 2` | holds | none |
| F2.1 negative control | `A = k[x, y]/(x, y)²`, `∇ = d + x dy` | `Ω² = k·dx∧dy`, `F(1) = dx∧dy`; `xξ(x) = 0 ⇒ ξ(x), ξ(y) ∈ (x, y)`, `∇_ξ = ξ` | holds | none |
| F2.2 | `P¹(k[x])`, section `f(1⊗1 − aξ)`; `(d/dx)²` on `P²`; opposite sign | `(f′ + af)dx`; `1 ↦ 0`, `ξ ↦ 0`, `ξ² ↦ 2`; `(−1 − ax)dx ≠ (1 − ax)dx` | holds | none |
| F2.3 | `∇ = d + yN dx`; rank one `a = y, b = x` and `a = 0, b = x` | `N dy∧dx`, `[∂_x + yN, ∂_y] = −N`, `dy∧dx(∂_x, ∂_y) = −1`; `0`; `dx∧dy` | holds | none |
| F3.1 | `𝔾_m`, `ℂ[ε]/ε²`; `GL_n`; `exp_1` over `𝔽_p` | `1 + εt⁻¹` has no `a tⁿ u` form; `g(1 + tᴺX)g⁻¹ = 1 + tᴺgXg⁻¹`; `tᵖ/p!` undefined | holds | none |
| F3.2 `S = R × R` | components at `e_i ⊗ e_j` | `S₂ ⊗_f M` gives `M_j`, `S₂ ⊗_g M` gives `M_i`; `(R((t)), 0)` has no `R((t)) ≃ 0` | holds | none |
| F3.3 | `𝔾_m`, `g = t`; `g = 1 + εx`; composite | `A − t⁻¹`; `A + ε([x, A] − x′)`; `hgA(hg)⁻¹ − hg′g⁻¹h⁻¹ − h′h⁻¹` | holds | none |
| F3.4 | `𝔾_m`, `R = ℂ`; `ℚ[ε]/ε²`; `𝔽_p`; étale cover | `a ↦ a − nt⁻¹ − f′`, classes (polar part, residue mod `ℤ`); stabilizer `ℂˣ`; `tᵖ` stabilizes; `(∏ R_i)((t)) = ∏ R_i((t))` | holds | none |
| F3A.3 `PGL₂` | `diag(t, 1)`; `[[0, 1], [t, 0]]` | `[[1, 0], [t, 1]] ↦ [[1, 0], [1, 1]] ∉ I`; `[[a, b], [c, d]] ↦ [[d, c/t], [tb, a]]`, in `I` iff `c ∈ tℂ[[t]]`; image `α^∨/2 ≠ 0` in `ℤ/2` | holds | none |
| F3A.4 root bounds | `u = 0`; `u = ε` over `ℂ[ε]/ε²` | `x_α(0) = 1 ∈ I` for all `n`; `x_(−α)(ε) ∉ B(R)` since `U_(−α) ∩ B = 1` | holds with "for `u ≠ 0`" | none |
| F3A.4 KacMoody comparison | `SL₂`; `t ↦ t⁻¹`; `PGL₂`; `GL₂`; component law | `[[1, 0], [t, 1]]` in both Iwahoris, `[[0, 1], [−1, 0]]` in neither; `[[1, 0], [t⁻¹, 1]] ∉ SL₂(ℂ[t])`; `det(a tᵐ·diag(t, 1)) = a²t^(2m+1) ≠ 1`, class `(α^∨/2, 1) ↦ 1 ∈ ℤ/2` (KacMoody 1225); `t^(e₁), t^(e₂) ↦ 1, 1`; `λ + wμ ≡ λ + μ` mod `Q^∨`; `Y = Q^∨ = ℤα^∨` for `SL₂` | holds | none |
| F4.1 unit test | `ℂ[ε]/ε²`: `1 + εt⁻¹`, `ε`, `ε + t⁻¹` | `(1 + εt⁻¹)(1 − εt⁻¹) = 1`, lowest coefficient `ε`; `ε` not a unit; `(ε + t⁻¹)·t(1 − εt) = 1` | discriminating | none |
| F4.2 | `[[a, b], [1, −a]]`, gauge `[[1, u], [0, 1]]`; `SL₂`, `ψ = 2` | `[[a + u, b − 2au − u² − u′], [1, −a − u]]`, `u = −a` gives `b + a² + a′`; `s² = 2` unsolvable in `ℚ((t))` | holds | none |
| F4.3 | `𝔰𝔩₂`; `a = t`; `a = εt⁻¹`; `μ₂` | `det ↦ −h²`, slice `det = −q`, codimension `3`; `q = t² + 1`; `q = −εt⁻²`; even polynomials only | holds | none |
| F4.4 torus, `SL₂` lifts | `𝔾_m`, `R = ℂ`; `ℚ`-algebra `R`; `diag(√t, 1/√t)` | `0`, `−t⁻¹dt` have no arrow in `Op^DS`, but `g = t` joins them in `Op_T`; `g′ = 0 ⇒ ng_n = 0 ⇒ g ∈ Rˣ`; `[[−1/(2t), tq], [t⁻¹, 1/(2t)]]` | holds; the comparison is faithful and not full | none |
| F5.1 | `φ = at`; `{t + t², t}` | `q^φ = a²q(at)`; `−(3/2)·4/(1 + 2t)² = −6/(1 + 2t)²` | holds | none |
| F5.4 | `g = [[c − ts, −s], [−s + tc, c]]` | `gA₀ − A₁g = g′ = [[−tc, −c], [ts, s]]`, `det g = c² − s² = 1` | holds | none |
| F6.2 Checks | `∂ + t⁻²` on `ℂ[[t]]`; Katz `a = 0, 1` | `∇⁻¹L = t²ℂ[[t]]`; candidate `0`, and `(t⁻¹, 1)` with Wronskian `t⁻²` | holds | none |
| F7.1 | `{x, y} = 1`; `{x, y} = x`; `k[x, y]/(x², y²)` | `anchor(dx) = ∂_y`; `[dx, dy] = dx`, `anchor(dy)(x) = −x`; `{x², y} = 2x ≠ 0` | holds | none |
| F7.2 | anchor sign; rank one | `Res κ(A, [x, y]) − Res κ(x, y′) = Res κ([A, x] + x′, y)`; `−nδ_(m+n,0)` | holds | none |
| F7.3–F7.4 | `m = 2, n = −2`; `P_q(t^(m+1))`; `L₋₁, L₋₂` | `4L₀ − 3`; `2(m+1) − (m+n+2) = m − n`; `L₋₃ = q₁ ∉ I` | holds | none |
| F7.5 screening | gauge `[[1, εx], [0, 1]]` | `[[−u + εx, 2uεx − εx′], [1, u − εx]]`, `δ(u² − u′) = −2ux + x′ = 0` | holds | none |
| F8.2 | `∇ = ∂ + f + qe`; `ε, η`; `x = e`, `y = f` | `∇_ad(xe) = x′e − xh`, class `(β + α′)e`; `𝔤/𝔟` part `y_f′ + 2y_h`; mixed term `−εη[x, y]`; `[F_e, F_f] = −F_h` | holds | none |
| F8.3 | `𝔾_m`, `a, b ∈ ℂ[[t]]` | `nt⁻¹ + u′/u ∈ ℂ[[t]] ⟺ n = 0` | holds; the conormal identification has no locator | R01 |

## Not verifiable

- Kazhdan–Lusztig 1980 (*Adv. Math.* 38): `doi.org` redirects to Elsevier's linking hub, which returned no readable page. Kazhdan–Lusztig 1988 (*Israel J. Math.*) is paywalled. Both are cited by locator, as the README says.
- Chevalley 1955, Matsushima 1960 and Drinfeld–Sokolov 1985: uncertified and cited by locator only.
- ComplexComparisonPartII (#848), CrystallineCohomology (#857), PadicDifferentialEquationsAndRigidCohomology (#1002) and EndoscopicTransferAndUnitaryTraceComparison (#999): the brief gives no checkout for these, so I read them through `roadmaps show` at their indexed heads.
- Česnavičius–Fedorov Theorem 4.2, Deligne LNM 163, Drinfeld v4, Iwahori–Matsumoto and Frenkel–Zhu are not in this round's sample and were not re-read. Their citations are unchanged since `ccaed5e`.

## Source issues

- **Misprint** in FrenkelGaitsgory2006 at §1.1, equation (1.2), p. 15: the source conjugates by `Ad_g` and subtracts `g⁻¹·d(g)`. It should subtract `d(g)·g⁻¹`, as in Frenkel2007 (1.2-4), so that gauges compose for non-abelian `g`. Affects nothing.
- **Misprint** in Frenkel2007 at §4.2.2, the display after (4.2-1), p. 110: the source writes the gauge action as `gAg⁻¹ − g⁻¹∂_t g`. It should be `gAg⁻¹ − (∂_t g)g⁻¹`, matching its (1.2-4) on p. 15. Affects nothing.
- **Misprint** in FrenkelGaitsgory2006 at §4.4, the definition of the regular groupoid before Lemma 4.4.2, p. 40: the second `R`-point is written with the same symbols as the first. It should be `χ′ = (F′_G, ∇′, F′_B)`. Affects nothing.
