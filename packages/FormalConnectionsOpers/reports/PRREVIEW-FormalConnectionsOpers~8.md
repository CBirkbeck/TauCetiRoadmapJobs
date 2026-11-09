# Review of FormalConnectionsOpers (pull request #1056 at a2334b4)

**Verdict:** needs changes

This is a full review of head `a2334b4`. Since `19335ec`, 214 lines changed, all in `TauCetiRoadmap/FormalConnectionsOpers/README.md`. `Suggested.lean`, `metadata.toml`, the pins (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`) and everything outside the folder are unchanged.

**Previous findings.** The review of `19335ec` raised none, so nothing needed repairing. This head moves the source of complex points, their classical topology and smooth charts from ComplexComparisonPartII C−1.1 to ReductiveGroups §3A.5. The move touches Scope 47–62 and 80–90, Conventions 166–169, the contracts at 275–283 and 316–336, §2.4, §4.3 and the Layer 4 Examples and Dependencies. R01–R03 come from that move: it now collides with statements of the pinned library and of those two suppliers.

## R01 (P2) — §4.3 transports a second topology onto a carrier that already has a pinned one

**Location.** `TauCetiRoadmap/FormalConnectionsOpers/README.md:1455–1457`: "identify the point carrier `G(ℂ)` with native `TauCeti.HopfAlgebra.points`, namely `WithConv (H →ₐ[ℂ] ℂ)`. Transport the topology, atlas and Lie-group structure to this fixed native carrier". The same choice appears in two more places:
- Conventions 166–168: "with ReductiveGroups §3A.5's classical topology and charts, transported to it in §4.3".
- The Tau Ceti contract at 217–225 lists no point topology.

**Claim.** On the native carrier, `G(ℂ)` gets its topology by transport from §3A.5.

**Witness.** At the pin, `TauCeti.PointTopology.instTopologicalSpaceWithConv` (`TauCeti/Topology/Algebra/PointTopology/Basic.lean:110`) is a global instance on `WithConv (A →ₐ[k] R)`. `#synth TopologicalSpace (WithConv (Polynomial ℂ →ₐ[ℂ] ℂ))` returns it. A transported topology would be a second, non-defeq instance on the same type.

**Repair.**
- Add to "From Tau Ceti":
  - `instTopologicalSpaceWithConv` and three more global instances on the same carrier, each confirmed by `inferInstance` in a scratch file: `isTopologicalGroup` (`Group.lean:102`), `instT2SpaceWithConv` (`Separation.lean:64`) and `instSecondCountableTopologyWithConv` (`Separation.lean:97`);
  - `TauCeti.SchemePointTopology.affineHomeomorph` (`TauCeti/Topology/Algebra/PointTopology/Scheme.lean:165`);
  - `TauCeti.PointTopology.isClosedEmbedding_eval_generators` (`Basic.lean:245`).
- In §4.3, replace "Transport the topology, atlas and Lie-group structure" with two steps:
  - prove that the topology carried from §3A.5 along the Spec adjunction equals the pinned instance; both are the evaluation topology, via `affineHomeomorph`;
  - build the atlas and the Lie-group structure on the pinned instance and its pinned `IsTopologicalGroup`.
- Reword Conventions 166–168 to: "with its pinned point topology, identified in §4.3 with ReductiveGroups §3A.5's, and the charts transported in §4.3".

**Test on `𝔾_m`.** With generators `x, x⁻¹`, `isEmbedding_eval_generators` makes the pinned topology the subspace topology of `{uv = 1} ⊂ ℂ²`. That is §3A.5's affine description, so the required equality holds. The §4.3 Check at 1631–1638 is unaffected.

## R02 (P2) — Two owners for identifying §3A.5's topology and charts with the underlying space of `X^an`

**Location.** `README.md:753–755`: "hence the identity of `X(ℂ)` is a homeomorphism from ReductiveGroups §3A.5's topology onto the underlying space of `X^an`". The same claim is made in Scope 84–86 (the `G(ℂ)` comparison is §4.3's own), in §4.3 1445–1453 and 1469–1472, and in the contract at 335–336.

**Claim.** §2.4 and §4.3 own these comparisons, and C−1.1 states neither of them.

**Witness.** ComplexComparisonPartII C−1.1 at #848 (`c7c7c50`, listing 1051 and 1067–1070) states both: `X(ℂ)` "equipped with the classical topology", and "the identity on `G(ℂ)` identifies them with the underlying space and smooth charts of `G^an`". ReductiveGroups #1676 lines 38–39 agree.

**Repair.** ComplexComparisonPartII (merge order line 39) comes before this roadmap (line 40), so by the settlement rule C−1.1 is the owner. Its listing 1072–1073 also has F2.4 taking C−1.1's complex-point and smooth-chart comparisons, which contradicts README 335–336. The repair:
- Add to the C−1.1 contract (318–336): "the identification of the underlying space of `X^an` with `X(ℂ)` carrying ReductiveGroups §3A.5's topology, and on `G(ℂ)` of §3A.5's charts with those of `G^an`". Replace 335–336 to match.
- In §2.4 (753–755), cite this instead of proving it.
- In Scope 56–58 and 84–86 and in §4.3 1445–1453 and 1469–1472, keep only:
  - the comparison of §3A.5's charts with §2.4's fixed-model maximal atlas;
  - the native-carrier transport;
  - the tangent/counit comparison.

**Test on `𝔾_m`.** C−1.1 supplies the identity homeomorphism of the hyperbola. The Check at 1631–1638 keeps its atlas half as §4.3's own content: `x` is a chart of §2.4's atlas, while conjugation, whose transition is `z ↦ z̄`, is not.

## R03 (P2) — §2.4 re-plans statements it now takes from ReductiveGroups §3A.5 and from the pins

**Location.** `README.md:760–763`: "transport second countability to each subtype `U_i` and apply `TopologicalSpace.secondCountableTopology_of_countable_cover` … Obtain second countability and hence separability of `X(ℂ)`". The same pattern appears in:
- 745–746: the Spec-adjunction equivalence is constructed here;
- 779–787: §3A.5's charts are shown to be covering open embeddings, then the holomorphic deck equations;
- 802–806: étale maps are shown to be local biholomorphisms;
- Scope 58–62: §2.4 owns the complex-manifold structure on the complex points.

**Claim.** Lines 56–57 say the points, topology and charts come from §3A.5 "alone", yet §2.4 plans these statements as its own targets.

**Witness.** ReductiveGroups #1676 states them: lines 1120–1122 (3A.5b) make finite-type `X(R)` second countable; lines 1192–1195 (3A.5d) make each chart "a homeomorphism onto an open subset of `ℂᵈ`", with holomorphic transitions and étale maps local biholomorphisms.

**Repair.** The Spec-adjunction equivalence is also pinned twice: Mathlib's `AlgebraicGeometry.Spec.homEquivAlgHom` (`GammaSpecAdjunction.lean:605`) and Tau Ceti's `SchemePointTopology.affineHomeomorph`. The repair:
- Cite 3A.5b–3A.5d by item, as #1676 lines 1092–1095 ask, in §2.4's prose, `*Needs:*` (886) and Dependencies (903–904). Cite 3A.5e for §4.3.
- For the Spec-adjunction step, cite `Spec.homEquivAlgHom` and `affineHomeomorph`.
- Transport 3A.5d's charts and maximal atlas to `X^an` along C−1.1's identification (R02). Do not re-prove the open-embedding, covering, holomorphic-transition, second-countability and étale statements.
- §2.4 keeps:
  - the fixed model `Fin d → ℂ` under constant rank;
  - the comparison of the function sheaf with C−1.1's ring sheaf;
  - products and `τ_x`;
  - the curve, toric and gauge comparisons;
  - the regular trivialization.
- Reword Scope 58–62 to: "§2.4 owns the fixed-model realization on `X^an`".

**Test on `𝔾_m` and `𝔾_m ⊔ 𝔸²` (Checks 863–871).**
- 3A.5b gives second countability, since the schemes are of finite type and `ℂ` is second countable.
- 3A.5d gives the chart `x` onto `ℂˣ`.
- 3A.5d splits `𝔾_m ⊔ 𝔸²` into open-and-closed loci of dimensions 1 and 2.

These are the same conclusions that §2.4 re-derives.

## R04 (P3) — §2.2 Check computes the wrong operator for the opposite identification

**Location.** `README.md:662–663`: "The opposite identification `da ↦ a ⊗ 1 − 1 ⊗ a` would give `−d + a dx`, which violates the Leibniz rule: `(−d + a dx)(x·1) = (−1 + ax) dx ≠ … = (1 + ax) dx`."

**Witness.** Keep the same section `σ(f) = f(1 ⊗ 1 − aξ)`. Then `1 ⊗ f − σ(f) = (f′ + af)ξ`. The opposite identification sends `ξ` to `−dx`, so the connection is `−(f′ + af) dx = (−d − a dx)f`, not `−d + a dx`.

**Repair.** Write: "would give `−d − a dx`, which violates the Leibniz rule: `(−d − a dx)(x·1) = (−1 − ax) dx ≠ x(−d − a dx)(1) + dx = (1 − ax) dx`."

**Test.** The two sides differ by `−2 dx` for every `a`. At `a = 0` they are `−dx` and `dx`, so the Check still separates the two identifications.

## R05 (P3) — §3.2 Check: the inverse-bound witness bounds nothing

**Location.** `README.md:978–980`: "a bound on `g` alone admits `g = t⁻¹` with every inverse bound exceeded by `g^(−1) = t` only after rebounding, so both bounds enter the presentation."

**Witness.** `g⁻¹ = t` has no pole, so it exceeds no inverse bound. The clause therefore does not show that inverse bounds are needed.

**Repair.** Write: "with entry bound `0` alone, `g = t^M` qualifies for every `M ≥ 0` while `g⁻¹ = t^(−M)` has pole order `M`, so the subfunctor is not of finite type; both bounds enter the presentation."

**Test.** At entry bound 0, `M = 1, 2, 3` give inverse pole orders `1, 2, 3`.

## R06 (P3) — §6.5 Check gives the wrong reason that `p ≠ 0` is needed

**Location.** `README.md:2109–2110`: "The hypothesis `p ≠ 0` in `cohomologicalDimensionAt_le_one` is needed: at `p = 0` the statement is about the trivial coefficient."

**Witness.** `IsPPrimaryTorsion 0 M` (`TauCeti/GroupTheory/Torsion.lean:212`, via Mathlib's `primaryComponent`: `p^k • m = 0` for some `k`) holds for every `M`, because `0¹ • m = 0`. For `M = ℤ`, `H²(ẑ, ℤ) ≅ H¹(ẑ, ℚ/ℤ) = ℚ/ℤ ≠ 0`.

**Repair.** Write: "at `p = 0` every discrete module is `0`-primary torsion (`0¹ • m = 0`), including `ℤ`, and `H²(ẑ, ℤ) ≅ H¹(ẑ, ℚ/ℤ) = ℚ/ℤ ≠ 0`, so the bound fails."

**Test.** At `p = 2`, `ℤ` is not `2`-primary torsion, so the pinned theorem is untouched.

## R07 (P3) — Missing locators in sampled sections, and stale reference data

**Location.** `README.md:1592–1593`: "Kostant, *Lie group representations on polynomial rings*, cited by locator, uncertified". No theorem or page is given here or in References 2540–2542. In addition:
- §1.1 (419–456), §2.3 (685–724), §3.1 (915–946), §5.2 (1747–1800) and §7.1 (2132–2161) give no locator for any target.
- 2594–2596 mark Rinehart "uncertified" and link Mathlib at `6b7abb3c`, which is not the pin.

**Witness.** Kostant's announcement (Bull. AMS 69, open at ams.org) has Theorem 0.6, p. 522: regular orbits correspond bijectively to `ℂ^ℓ`; Theorems 0.1–0.2 are on p. 521. Frenkel–Gaitsgory §19.1, p. 111, defines `V ⊗^! W = lim V_i ⊗ W_j`.

**Repair.** Rinehart's Theorem 3.1 is also open at ams.org. The repair:
- Give Kostant's theorem and page at 1592–1593 and in References.
- Add a locator per target in §§1.1, 2.3, 3.1, 5.2 and 7.1. A standard textbook suffices for standard facts. Two locators verified here:
  - Frenkel–Gaitsgory §19.1, p. 111, for `⊗^!` and the two other completions at 426–432;
  - Frenkel–Gaitsgory Lemma 4.3.1, p. 39, for `Ω¹(Conn) ≃ 𝔤((t)) ⊗^! Fun(Conn)` at 2139–2141.
- Drop "uncertified" for Kostant and Rinehart.
- Point the Mathlib link at 2596 to the pinned `1b1ccf4b`; the file exists there.

**Test.** Rinehart's Theorem 3.1 says that `S(L) → gr V(R, L)` is an isomorphism for projective `L`. That is exactly the claim at 653–655.

## Verified sound

**Gate and direction**
- Gate run here: `set_option=0 … source-material=0 build=0 OK` (EXIT 0).
- Dependency check: `depcheck: 239 roadmaps, 2320 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Lean**
- `lake env lean` on `Suggested.lean` exits 0 with three `declaration uses sorry` warnings, at lines 71, 130 and 160.
- `#check @name` for all nine declarations in one scratch copy: the elaborated types equal `signatures.md`. No binder is lost: `[Algebra ℚ R]`, `reductiveCommHopfAlgProperty ℂ H`, `[CharZero F]`, `Differential.deriv ≠ 0`, `[FiniteDimensional F V]`, and `[HopfAlgebra k H] [Algebra k R]` on both loop maps are all present.
- One-tactic probes:
  - `regularGauge_constantCoeff_bijective`: `simp` makes no progress and `exact?` fails;
  - `exists_cyclicVector`: `exact?` fails;
  - `formalLoop_eq_polynomial_mul_positive` is Česnavičius Theorem 19.

  None of the three is padding.
- Pinned Mathlib has no `LaurentPolynomial → LaurentSeries` map (grep), so `laurentPolynomialToLaurentSeries` and `formalParameterUnit` are needed.
- Outside its section, the theorem's carrier fails to unify with the default `Algebra ℂ (LaurentSeries R)`, which is `HahnSeries.powerSeriesAlgebra`. README 185–189 documents this. The two algebra maps agree, so the statement is equivalent.

**Headlines.** Five headline groups are not stated in `Suggested.lean`:
- Chevalley–Kostant and Drinfeld–Sokolov normal form (Layer 4);
- Frenkel–Zhu (Layer 6);
- the Drinfeld–Sokolov Poisson structure and Miura (Layer 7);
- the isomonodromy Lie algebroid (Layer 8);
- the F2.1/F2.3 flatness criterion.

Each is named in the docstring with its missing carrier. Pinned libraries have only smooth covariant derivatives (grep for curvature and connection), so the F2.1/F2.3 carrier is absent. Three headlines are stated: Layers 2, 3A and 6.

**Library declarations opened at the pins (23)**
- `TauCeti.PointTopology.topology` (`Basic.lean:83`), `instTopologicalSpaceWithConv` (`:110`), `isEmbedding_eval_generators` (`:185`), `isClosedEmbedding_eval_generators` (`:245`).
- `TauCeti.SchemePointTopology.topology` (`Scheme.lean:127`), `affineHomeomorph` (`:165`).
- `isTopologicalGroup` (`Group.lean:102`); `instT2SpaceWithConv`, `instSecondCountableTopology`, `instSecondCountableTopologyWithConv` (`Separation.lean:64, 89, 97`).
- `TauCeti.zHat.cohomologicalDimensionAt_le_one` (`hp : p ≠ 0`), `cohomologicalDimensionAt_eq_one` (`[Fact p.Prime]`) and `cohomologicalDimension_eq_one`, in `ZHat/CohomologicalDimension.lean:191, 199, 206`.
- `cohomologicalDimensionAt` (`ContCohomology/CohomologicalDimension/Basic.lean:146`); `IsPPrimaryTorsion` (`GroupTheory/Torsion.lean:212`).
- Mathlib:
  - `Spec.homEquivAlgHom` (`GammaSpecAdjunction.lean:605`);
  - `MvPolynomial.eq_vanishingIdeal_singleton_of_isMaximal`, `isMaximal_iff_eq_vanishingIdeal_singleton`, `vanishingIdeal_zeroLocus_eq_radical` (`Nullstellensatz.lean:151, 164, 171`);
  - `secondCountableTopology_of_countable_cover` (`Topology/Bases.lean:919`);
  - `IsSmoothAt.exists_isStandardEtale_mvPolynomial` (`Unramified/LocalStructure.lean:391`);
  - `nhds_basis_clopen` (`InductiveDimension/Classes.lean:151`, `[ZeroDimensionalSpace X]`, applied to profinite groups);
  - `LieRinehartAlgebra` (`LieRinehartAlgebra/Defs.lean`).

**Cross-roadmap citations resolved**
- ReductiveGroups #1676 (`8bad12e`, checkout):
  - lines 38–42: C−1.1 owns the identification; FormalConnectionsOpers §2.4 consumes 3A.5c–d and §4.3 consumes 3A.5e;
  - line 1092: 3A.5 is the single owner;
  - lines 1149–1199: 3A.5c–d match contract 275–283, including "built from a local standard-smooth presentation".
- #1808 (line 20) and #1797 (line 22) also make 3A.5 the owner. #1854 (line 418) and main (line 342) still consume C−1.1's `.complexPoints`. The description names #1676 as the revision to merge first. It mentions only §4.3, but §2.4 now consumes 3A.5c–d as well.
- ComplexComparisonPartII #848 (`c7c7c50`, listing): lines 153, 786–789, 1051, 1067–1076 (see R02).
- SchubertGeometry on main, line 111, consumes F2.4, so the consumer bullet at 2525–2527 holds. Its revision #1224 (listing 1522–1548) takes the charts from 3A.5 and names no FormalConnectionsOpers target.
- Merge order: ComplexComparisonPartII line 39, FormalConnectionsOpers line 40, PadicDifferentialEquationsAndRigidCohomology line 120.

**Ownership**
- `roadmaps grep` for cyclic vector, Frenkel–Zhu, isomonodromy and Drinfeld–Sokolov finds this roadmap, main, #1002 and #999.
- PadicDifferentialEquationsAndRigidCohomology #1002 (`4d3f9ec`, listing 153) also claims the cyclic-vector theorem at full generality. This roadmap comes first (line 40, against 120) and already tells #1002 to import §6.2 (2532–2536). The repair belongs to #1002 and is not a finding here.
- `overlaps.md`: no open pull request changes this roadmap, and no cited id is dropped.

**Seeded sample of sources.** All sampled locators were read in the cached texts:

| Target | Source and locator | Supports the statement |
| --- | --- | --- |
| F1.2 | Frenkel, *Langlands correspondence for loop groups*, §3.5.4, pp. 91–92 | Yes: `Aut O = ℂˣ ⋉ Aut⁺O`, `Der⁺O = t²ℂ[[t]]∂` pro-nilpotent |
| F1.2 | Frenkel §3.5.7, p. 96 | Yes: λ-form action `εf′ + λε′f` |
| F5.3 | Frenkel §3.5.7, p. 97 | Yes: the two square roots of `ω` give the same operator space |
| F5.4 | Frenkel (3.5-11), (3.5-12), p. 98 | Yes |
| F4.3 | Frenkel §4.2.4, p. 112: `b_i = [p₋₁, b_{i+1}] ⊕ V_i` | Yes. Lemma 4.2.2 (pp. 112–113) proves freeness; its proof gives the unique representative |
| F5.3 | Frenkel (4.2-13)–(4.2-14), p. 117 | Yes |
| F1.3 | Drinfeld, v4, §3.2.1, §3.2.2 with (3.1), §3.2.3, Thm 3.3, Lemma 3.9, Thm 3.10 | Yes |
| F3.2 | Drinfeld, Thm 3.11 | Yes |
| F4.4 | Frenkel–Gaitsgory §§1.1, 1.3, 1.6 | Yes |
| F8.2 | Frenkel–Gaitsgory Prop 4.1.1 with §4.2 (square-zero `I² = 0`), (4.2)–(4.4), Lemmas 4.3.1–4.3.2 (`𝔤((t)) ⊗^! Fun(Conn)`) | Yes |
| F6.5 | Steinberg, Thm 1.9, p. 51 (perfect field, dim ≤ 1) | Yes |
| F2.2 | Stacks 09CI, 09CK, 0H90 | Yes |
| F2.2 | Rinehart, Thm 3.1 | Yes |

F1.1, F2.3, F3.1, F5.2 and F7.1 cite no source; see R07.

**Adversarial table.** Each row gives values computed here. Rows touched by a finding say so.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `regularGauge_constantCoeff_bijective` | `ℚ`, `n=1`, `A=1`, `B=0`; `ℚ[ε]/ε²`, `A=εI`; `𝔽_p`; zero ring; `n=∅` | `g=g₀eᵗ`; `g₀(1+εt)`; `1+tᵖ` has `g′=0`, giving two preimages of `1`; singletons; recursion from `gA−g′=Bg` is `(j+1)g_{j+1}=Σ(g_iA_{j−i}−B_{j−i}g_i)` | holds; `[Algebra ℚ R]` needed | none |
| `regularGauge` action law | `h, g` | `(hg)′(hg)⁻¹=h′h⁻¹+hg′g⁻¹h⁻¹`; `gauge(1,A)=A` | as stated | none |
| `formalLoop_eq_polynomial_mul_positive` | `G=1`; `𝔾_m`, `ℂ`; `𝔾_m`, `ℂ[ε]/ε²`; `SL₂` | `atⁿ·u`; `u=atⁿw(1+εv)`, `v=v₋+v₊`, `p=atⁿ(1+εv₋)`, `q=w(1+εv₊)`; `(1−t)⁻¹t⁻¹−t⁻¹=(1−t)⁻¹` | holds | none |
| `exists_cyclicVector` | `V=0`; `ℚ(t)`, `V=F²`, `D=∂`; `deriv=0`; `𝔽_p(t)` | `Fin 0` family independent; `v=(1,t)`, `Dv=(0,1)`, det `1`; `D=0` has no cyclic vector; `Dᵖ=0` | both hypotheses needed | none |
| `IsDifferentialModuleMap` | `D=∂` on `F`; `D=id`; `D=0` with `deriv≠0` | Leibniz holds; fails by `f′v`; fails | determines object | none |
| `formalParameterUnit`, `laurentPolynomialToLaurentSeries` | `T 1`, `T n` | `single 1 1·single (−1) 1=1`; `T n ↦ tⁿ` | as stated | none |
| F1.1 calculus, `⊗^!` | `t⁻¹`; `ℚ[ε]/ε²`; `Σtⁿ⊗t⁻ⁿ` | `d(t⁻¹)=−t⁻²`, `Res(t⁻¹dt)=1`; `d(εt)=εdt`; only `n<M` survive | as stated; no locator (R07) | R07 |
| F1.2 inverse, order, chain rule | `t+t²`; `φ=2t`, `ψ=t+t²`; `f=t⁻¹`; `φ=t²` | `t−t²+2t³−5t⁴`, truncation gives `t−2t³`; `2t+4t²` against `2t+2t²`; `−t⁻²+1`; `Res=2≠1` | as stated | none |
| F1.3 lattices, duality | `tᴺR[[t]]`; residue pairing; `t`, `t⁻¹`, `0`; `Σxⁿtⁿ` | free of rank `M−N`; annihilator `V^∨[[t]]dt` (constant-term pairing gives `tV^∨[[t]]`); nilpotent / not / not automorphism; outside `S⊗k((t))` | as stated | none |
| F2.1 negative control | `k[x,y]/(x,y)²`, `∇=d+x dy` | `Ω²≃k`; curvature `dx∧dy`; `ξ(x),ξ(y)∈(x,y)`, so `∇_ξ=ξ` | as stated | none |
| F2.2 principal parts, symbols | `k[x]`; char 2; char `p` | `∇f=(f′+af)dx`; the opposite identification gives `−d−a dx`; `ξ²↦2`; `(d/dx)ᵖxⁿ≡0` | Check value wrong | R04 |
| F2.3 flatness, Bianchi | `d+N dx`; `d+yN dx`; rank one | `N²dx∧dx=0`; `N dy∧dx`, `[∂_x+yN,∂_y]=−N`; `(b_x−a_y)dx∧dy`: `0` and `1` | as stated; no locator | R07 |
| F2.4 regular Checks | `𝔾_m`; `ℂ[x,y]/(xy)`; `ℂ[x]/x²` | `ℂˣ⊂ℂ`; cotangent ranks 2 and 1; Krull dimension 0 | as stated | none |
| §2.4 topology, charts, second countability | `𝔾_m`, `𝔾_m⊔𝔸²` | same conclusions as 3A.5b–d (#1676 1120–1122, 1192–1195) | duplicated | R03 |
| §2.4/§4.3 identification with `X^an` | `𝔾_m` hyperbola | stated by C−1.1 at #848 (1051, 1067–1070) | two owners | R02 |
| §4.3 topology on `WithConv (H →ₐ[ℂ] ℂ)` | `#synth`; `𝔾_m` | `instTopologicalSpaceWithConv`; subspace topology of `uv=1` | pinned instance | R01 |
| F3.1 loop groups | `1+εt⁻¹`; `GL_n`; `exp₁` | inverse `1−εt⁻¹`, not of the form `atⁿu`; `g(1+tᴺX)g⁻¹∈K_N`; `1/p!` undefined over `𝔽_p` | as stated; no locator | R07 |
| F3.2 bounds, descent | `g=t⁻¹`; `g=tᴹ` | `g⁻¹=t` has no pole; `g⁻¹=t⁻ᴹ` has pole order `M`; Drinfeld Thm 3.11 has `f(a)=1⊗a`, `g(a)=a⊗1` | Check incoherent | R05 |
| F3.3–3.4 gauge, classes | `𝔾_m`, `tⁿ`, `exp f`; `1+εx` | `−nt⁻¹`, `−f′`; `A+ε([x,A]−x′)`; stabilizer `ℂˣ`, and `tᵖ` over `𝔽_p` | as stated | none |
| F3A.1–3A.4 | `SL₂` conjugations; geometric series; `PGL₂` | `[[1,0],[−t,1]]`, `[[1,t³],[0,1]]`; `(1−t)⁻¹`; `Y/Q^∨=ℤ/2`; `α(λ)=2` | as stated | none |
| F4.2–4.3 Drinfeld–Sokolov | `𝔰𝔩₂`, `a=t`; `a=εt⁻¹` | `[[a+u,b−2au−u²−u′],[1,−a−u]]`; `q=t²+1`; `q=−εt⁻²`; `det↦−h²` | as stated; Kostant locator missing | R07 |
| F4.3 exponential kernel | `𝔾_m`, `λ=id` | `exp_G(dλ(2πi))=λ(1)=1`; `1↦2πi` | as stated | none |
| F4.4 `SL₂`-lifts | `diag(√t,1/√t)` | `[[−1/(2t),tq],[t⁻¹,1/(2t)]]`; residue `−½∉ℤ` | as stated | none |
| F5.2 characters | `q=t⁻²`; `q_j↦1`; `εt⁻⁷` | `eval(q₋₂)=1` for `N=2` and `N=5`; kills no projection kernel; `ε`, not regular | as stated; no locator | R07 |
| F5.3 elimination | `n=2`; diagonal `(a,−a)` | `y₁=−y₂′`, `(∂²−q)y₂=0`; `y₂″−(q+a²+a′)y₂=0` | as stated | none |
| F5.4 gauge witness | `g=[[c−ts,−s],[−s+tc,c]]`; `ε=t³` | `gA₀−A₁g=g′=[[−tc,−c],[ts,s]]`, `det=1`; `−½ε‴=−3` | as stated | none |
| F6.2 cyclic vectors, Katz | `∂+t⁻²`; Katz `n=2`, `a=0,1` | `∇⁻¹L=t²ℂ[[t]]`; `0`; `(t⁻¹,1)` with det `t⁻²` | as stated | none |
| F6.4 order bound | `gauge(t^(−λ),0)`; `exp(t⁻³x)` | `λt⁻¹` of order `−1`; `−3t⁻⁴x` of order `−4` | as stated | none |
| F6.5 `H¹`, `cd` | `μ_n`; `p=0`, `M=ℤ` | `ℤ/n`; `0`-primary, `H²(ẑ,ℤ)=ℚ/ℤ≠0` | Check reason wrong | R06 |
| F7.1 cotangent algebroid | `{x,y}=1`; `{x,y}=x`; `k[x,y]/(x²,y²)` | `anchor(dx)=∂_y`; `[dx,dy]=dx`; `{x²,y}=2x≠0` | as stated; no locator | R07 |
| F7.2–7.4 brackets | Heisenberg; Virasoro; KdV; `I` | `−nδ`; `{L₂,L₋₂}=4L₀−3`; `6qq′−q‴`; `L_n=q₋ₙ₋₂`, `{L₋₁,L₋₂}=q₁∉I` | as stated | none |
| F7.5 Miura, screening | `[[−u,0],[1,u]]` | `q=u²−u′`; `δ(u²−u′)=−2ux+x′=0` | as stated | none |
| F8.2 tangent, commutator | `𝔰𝔩₂`, `∂+f+qe`; `ε,η` | `(β+α′)e`; `y_f′+2y_h`; `1−εη[x,y]`; `[F_e,F_f]=−F_h` | as stated | none |

## Not verifiable

These texts lie outside the seeded sample. They were not re-read:
- Kazhdan–Lusztig 1980 §2 and 1988 §4 (Lemmas 6, 8); no legal copy.
- Chevalley 1955; Matsushima 1960.
- Drinfeld–Sokolov 1985, cited only through Frenkel.
- Katz 1987; Deligne, LNM 163; Česnavičius 2024; Česnavičius–Fedorov; Iwahori–Matsumoto.

Kostant's 1963 announcement was read; its full American Journal of Mathematics paper was not.

## Source issues

- **Misprint** in Drinfeld2006 at Lemma 3.9(i), p. 11: the source says topological nilpotence means `Tⁿ` tends to zero as `n` tends to zero; it should be as `n` tends to infinity, as the parenthetical gloss shows; affects nothing.
- **Misprint** in FrenkelGaitsgory2006 at §4.1, p. 37: the source places the arrows from `χ` to `χ′` over the pair `(χ, χ)`; it should be `(χ, χ′)`; affects nothing.
- **Misprint** in FrenkelGaitsgory2006 at equation (4.3), p. 38: the source twists `𝔤/𝔫` by the `G`-bundle `F_G`; `𝔤/𝔫` is only a `B`-module, so it should be `F_B`; affects nothing.
